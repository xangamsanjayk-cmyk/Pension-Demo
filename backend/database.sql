-- Drop tables if they exist to start from a clean state
DROP TABLE IF EXISTS tasks;
DROP TABLE IF EXISTS projects;

-- Create the projects table
CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create the tasks table
CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    description TEXT NOT NULL,
    completed BOOLEAN NOT NULL DEFAULT FALSE,
    project_id INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_project
        FOREIGN KEY(project_id)
        REFERENCES projects(id)
        ON DELETE CASCADE
);

-- Add some sample data for demonstration
INSERT INTO projects (name) VALUES ('Project Phoenix'), ('Project Alpha');

INSERT INTO tasks (description, project_id) VALUES ('Set up the initial project structure', 1);
INSERT INTO tasks (description, project_id) VALUES ('Design the database schema', 1);
INSERT INTO tasks (description, project_id, completed) VALUES ('Deploy the first version', 1, TRUE);
INSERT INTO tasks (description, project_id) VALUES ('Gather user requirements for phase 2', 2);
