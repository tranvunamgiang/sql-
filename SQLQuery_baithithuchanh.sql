CREATE DATABASE EmployeeDB;
GO

USE EmployeeDB;
GO

CREATE TABLE Department (
    DepartId INT PRIMARY KEY,
    DepartName VARCHAR(50) NOT NULL,
    Description VARCHAR(100) NOT NULL
);
GO

CREATE TABLE Employee (
    EmpCode CHAR(6) PRIMARY KEY,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    Birthday SMALLDATETIME NOT NULL,
    Gender BIT DEFAULT 1,
    Address VARCHAR(100),
    DepartID INT,
    Salary MONEY,
    FOREIGN KEY (DepartID) REFERENCES Department(DepartId)
);
GO

INSERT INTO Department (DepartId, DepartName, Description)
VALUES 
(1, 'Human Resources', 'The division of a business that is charged with finding, recruiting, screening, and training job applicants.'),
(2, 'IT', 'Manages information technology and computer systems in company '),
(3, 'Finance', 'Responsible for financial planning and management');
GO

INSERT INTO Employee (EmpCode, FirstName, LastName, Birthday, Gender, Address, DepartID, Salary)
VALUES 
('NV001', 'NGUYỄN', 'TRUNG ANH', '1999-01-15', 1, '123 TRƯỜNG CHINH', 1, 5000000),
('NV002', 'HỒ', 'THỊ BÌNH', '1998-05-26', 0, '456 HOÀNG VĂN THỤ', 2, 10000000),
('NV003', 'Lê', 'XUÂN MAI', '1996-8-30', 0, '789 TÂY SƠN', 3, 20000000);
GO

UPDATE Employee
SET Salary = Salary * 1.10;
GO

ALTER TABLE Employee
ADD CONSTRAINT CHK_Salary_Positive CHECK (Salary > 0);
GO
