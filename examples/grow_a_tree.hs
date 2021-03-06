data Tree = Leaf | Node Int Tree Tree deriving Show
l = Node 3 Leaf (Node 4 Leaf (Node 6 Leaf Leaf))

treeDepth :: Tree -> Int
treeDepth Leaf = 0
treeDepth (Node _ leftSubtree rightSubtree) = 
    1 + max (treeDepth leftSubtree) (treeDepth rightSubtree)

treeSum :: Tree -> Int
treeSum Leaf = 0
treeSum (Node sum leftSubtree rightSubtree) = 
    sum + (treeSum leftSubtree) + (treeSum rightSubtree)

isSortedTree :: Tree -> Int -> Int -> Bool
isSortedTree Leaf _ _ = True
isSortedTree (Node x leftSubtree righSubtree) minVal maxVal = 
    let leftSorted = isSortedTree leftSubtree minVal x 
        rightSorted = isSortedTree righSubtree x maxVal
    in x >= minVal && x < maxVal && leftSorted && rightSorted

addNewMax :: Tree -> Tree
-- add a new max element to tree
addNewMax Leaf = Node 0 Leaf Leaf -- input tree with no nodes
addNewMax (Node x t1 Leaf) = Node x t1 (Node (x+1) Leaf Leaf) -- this is the rightmost Node
addNewMax (Node x t1 t2) = Node x t1 (addNewMax t2)  -- intermediate node, go down right subtree


allLeafs :: Tree -> [Tree]
allLeafs Leaf = [Leaf]
allLeafs (Node sum leftSubtree rightSubtree) = 
    (allLeafs leftSubtree) ++ (allLeafs rightSubtree)

-- TODO: Can you write functions to insert a 
-- value into a Tree in order, or to convert from a Tree into a list?