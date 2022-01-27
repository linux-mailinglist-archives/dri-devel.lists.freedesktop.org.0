Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7938949E43C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 15:11:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC58C10EF2F;
	Thu, 27 Jan 2022 14:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2047.outbound.protection.outlook.com [40.107.236.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41E510EF2C;
 Thu, 27 Jan 2022 14:11:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMoEEjhTFydMAgYYtpvDq07kUo/mTeKLvsKuPpFlXzoO+1QQh3/azh2/dRvL1yt/mMwe6ThfJITp1iLBfQezkMioos1V9FyifJW90dXs530ugNahk8yZngfdR2UCluGoHWfpxJiMbuDggbakLBLeUxLYuxiS6ZI7y4s8IDnIxlWkOY8mGW179+XWiS163YppNKiFihqzbyX/K++RvCTlrGHU/0nSVlvEJ1K5lCLZ5ZRt/WZZ/EGi7jbRO8niBTaa8fgFd8WfnYOuPevQPeQZmPKbG6AFGYWq4vewVvAv4Mb/IlWXcW9SoblE/3QI7CeHeA1hHs5GhA+xFMbBDyYlwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqWgC+Zda1egb2E75WHnaNZAQnvQahzaOegJNwz5MGs=;
 b=UftaxHnDEJDDVDlUMscIMURmMmTVgRm4lq6dXn1BJYeB0dHp64m/CQ12wIYTOEiodsMLfd1VgzbV1V4VhcvOPg9mjYMLJVNGKTujJCNubR96Rm1QmVzyeOidsVKJwhidwuXlMB4uYGT8/ZZzsBS/vF9sS0xqu4LnRjMtbDtGwemMWvP7hOIl2Wf2WxxiC+ds0EcRVH3RpTY+M98A8gPM+Ewg5FCqyXh5y5o6K2YxURgxmXcb4X6w1VhKHiLg1XTI1Cgx4BkY+Mt5qv8j7hfRD1Rf+KXqw1JTCCGyoU0Z7bIkBqU2ggVOE8W6i4A5gIoNZDw9ZXS4iiHkcnATh0MmtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqWgC+Zda1egb2E75WHnaNZAQnvQahzaOegJNwz5MGs=;
 b=p0ng8q7hzMBuohaWDmwJ41kzHOPU6aDNx5bPz9F+pl670fVZzdjgCjyollXk20jCzq/pXDugbiuqg1PzrclcDPhAAYq0US+XZJDbVl+gNweQlsxOb4gQB202LIUcw7j6aKK8oFqNVUFv7uxZ0D/mgV3Y77xKiviriNWdUaNFAgk=
Received: from BN8PR04CA0041.namprd04.prod.outlook.com (2603:10b6:408:d4::15)
 by MW5PR12MB5684.namprd12.prod.outlook.com (2603:10b6:303:1a1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Thu, 27 Jan
 2022 14:11:29 +0000
Received: from BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:d4:cafe::3f) by BN8PR04CA0041.outlook.office365.com
 (2603:10b6:408:d4::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 14:11:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT064.mail.protection.outlook.com (10.13.176.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 14:11:28 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 27 Jan
 2022 08:11:24 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v11 1/5] drm: improve drm_buddy_alloc function
Date: Thu, 27 Jan 2022 19:41:03 +0530
Message-ID: <20220127141107.173692-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e96717f-74b0-4936-daf7-08d9e19ee952
X-MS-TrafficTypeDiagnostic: MW5PR12MB5684:EE_
X-Microsoft-Antispam-PRVS: <MW5PR12MB56846054E99A65C4273EC268E4219@MW5PR12MB5684.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:116;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +CJYzPFxvA2IkBa0766emiBEIPjnJ14H8FAnd//S0b6GakZsN+w7jt4oTdfIoFDK2NeF+V5fG2deG7iGh2kS6zl5OHLyFjhcdHFCrKTdUp4aI6hAe5bQl4IgXQlLchcLc6KlqeFVgPaYrxV5c0q6Hyao18yZbJcwgnxrbEQ4ESSC3PIY+36rHmfghE5d7ybxSlOgLiK9LO+5xzRhV9L/GiiC216TAaRBLXWA9ZscE8Xr783oQEB5yO3mK3gjVKS073CVq+au7/oAJZk4s/vul/ecGBCmqVVMPFSEQqyznKYvySKouSxuRyWyna6ickzj9XEKyYjHnfbJ64zqb2zrnEEieicuOaaNKIx5izsIEZrHklKwSft6SFkv2pr8KFWNMD5c1fPEpmHTWQL5ao3PH3+e7IepxsQiCd/3CeuWinApppTQB6wWWZIjnsh8EyvomUFBcq/lm3g3dulSWctscFWUVI739lup0FMNM14WhWkodbfDo2B0wVv5tO0h/Y6tJoKoWPsTwpV40ECnLQbt00eQ/1CD9V1ezTbknUoPogW6YVHEiLG0mg/FTIsCEzOcmlX8fMxic5ZjW5Rxgv+bo3Qqo5siCO1hWpeBrnmE27lm9h6oyZHcogqnuXwYyrkLYKcjedQgiT2zEf4Rj1SUhLsLypeR+DbOUvXhFMYKULNiJXVBl3wrTg7qgG6NgHDfqIWTZ7kkrjGm56faWw4e89RYCkv/ao8RvVVxDG9M0t63J1c+CYbVdapZnN89MX2uyKxKFZMJxDYFtxnYDpmQvBWoRhf0PPvxPdS0LXYl75E=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700004)(46966006)(36840700001)(81166007)(82310400004)(8676002)(426003)(36756003)(30864003)(86362001)(2906002)(356005)(508600001)(83380400001)(316002)(7696005)(40460700003)(8936002)(26005)(16526019)(186003)(70586007)(36860700001)(47076005)(70206006)(54906003)(2616005)(110136005)(336012)(5660300002)(6666004)(1076003)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 14:11:28.4458 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e96717f-74b0-4936-daf7-08d9e19ee952
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5684
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Arunpravin <Arunpravin.PaneerSelvam@amd.com>, matthew.auld@intel.com,
 tzimmermann@suse.de, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Make drm_buddy_alloc a single function to handle
  range allocation and non-range allocation demands

- Implemented a new function alloc_range() which allocates
  the requested power-of-two block comply with range limitations

- Moved order computation and memory alignment logic from
  i915 driver to drm buddy

v2:
  merged below changes to keep the build unbroken
   - drm_buddy_alloc_range() becomes obsolete and may be removed
   - enable ttm range allocation (fpfn / lpfn) support in i915 driver
   - apply enhanced drm_buddy_alloc() function to i915 driver

v3(Matthew Auld):
  - Fix alignment issues and remove unnecessary list_empty check
  - add more validation checks for input arguments
  - make alloc_range() block allocations as bottom-up
  - optimize order computation logic
  - replace uint64_t with u64, which is preferred in the kernel

v4(Matthew Auld):
  - keep drm_buddy_alloc_range() function implementation for generic
    actual range allocations
  - keep alloc_range() implementation for end bias allocations

v5(Matthew Auld):
  - modify drm_buddy_alloc() passing argument place->lpfn to lpfn
    as place->lpfn will currently always be zero for i915

v6(Matthew Auld):
  - fixup potential uaf - If we are unlucky and can't allocate
    enough memory when splitting blocks, where we temporarily
    end up with the given block and its buddy on the respective
    free list, then we need to ensure we delete both blocks,
    and no just the buddy, before potentially freeing them

  - fix warnings reported by kernel test robot <lkp@intel.com>

v7(Matthew Auld):
  - revert fixup potential uaf
  - keep __alloc_range() add node to the list logic same as
    drm_buddy_alloc_blocks() by having a temporary list variable
  - at drm_buddy_alloc_blocks() keep i915 range_overflows macro
    and add a new check for end variable

v8:
  - fix warnings reported by kernel test robot <lkp@intel.com>

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c                   | 315 +++++++++++++-----
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  67 ++--
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |   2 +
 include/drm/drm_buddy.h                       |  13 +-
 4 files changed, 280 insertions(+), 117 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index d60878bc9c20..cfc160a1ef1a 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -282,23 +282,97 @@ void drm_buddy_free_list(struct drm_buddy *mm, struct list_head *objects)
 }
 EXPORT_SYMBOL(drm_buddy_free_list);
 
-/**
- * drm_buddy_alloc_blocks - allocate power-of-two blocks
- *
- * @mm: DRM buddy manager to allocate from
- * @order: size of the allocation
- *
- * The order value here translates to:
- *
- * 0 = 2^0 * mm->chunk_size
- * 1 = 2^1 * mm->chunk_size
- * 2 = 2^2 * mm->chunk_size
- *
- * Returns:
- * allocated ptr to the &drm_buddy_block on success
- */
-struct drm_buddy_block *
-drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order)
+static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
+{
+	return s1 <= e2 && e1 >= s2;
+}
+
+static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
+{
+	return s1 <= s2 && e1 >= e2;
+}
+
+static struct drm_buddy_block *
+alloc_range_bias(struct drm_buddy *mm,
+		 u64 start, u64 end,
+		 unsigned int order)
+{
+	struct drm_buddy_block *block;
+	struct drm_buddy_block *buddy;
+	LIST_HEAD(dfs);
+	int err;
+	int i;
+
+	end = end - 1;
+
+	for (i = 0; i < mm->n_roots; ++i)
+		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
+
+	do {
+		u64 block_start;
+		u64 block_end;
+
+		block = list_first_entry_or_null(&dfs,
+						 struct drm_buddy_block,
+						 tmp_link);
+		if (!block)
+			break;
+
+		list_del(&block->tmp_link);
+
+		if (drm_buddy_block_order(block) < order)
+			continue;
+
+		block_start = drm_buddy_block_offset(block);
+		block_end = block_start + drm_buddy_block_size(mm, block) - 1;
+
+		if (!overlaps(start, end, block_start, block_end))
+			continue;
+
+		if (drm_buddy_block_is_allocated(block))
+			continue;
+
+		if (contains(start, end, block_start, block_end) &&
+		    order == drm_buddy_block_order(block)) {
+			/*
+			 * Find the free block within the range.
+			 */
+			if (drm_buddy_block_is_free(block))
+				return block;
+
+			continue;
+		}
+
+		if (!drm_buddy_block_is_split(block)) {
+			err = split_block(mm, block);
+			if (unlikely(err))
+				goto err_undo;
+		}
+
+		list_add(&block->right->tmp_link, &dfs);
+		list_add(&block->left->tmp_link, &dfs);
+	} while (1);
+
+	return ERR_PTR(-ENOSPC);
+
+err_undo:
+	/*
+	 * We really don't want to leave around a bunch of split blocks, since
+	 * bigger is better, so make sure we merge everything back before we
+	 * free the allocated blocks.
+	 */
+	buddy = get_buddy(block);
+	if (buddy &&
+	    (drm_buddy_block_is_free(block) &&
+	     drm_buddy_block_is_free(buddy)))
+		__drm_buddy_free(mm, block);
+	return ERR_PTR(err);
+}
+
+static struct drm_buddy_block *
+alloc_from_freelist(struct drm_buddy *mm,
+		    unsigned int order,
+		    unsigned long flags)
 {
 	struct drm_buddy_block *block = NULL;
 	unsigned int i;
@@ -320,78 +394,29 @@ drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order)
 	while (i != order) {
 		err = split_block(mm, block);
 		if (unlikely(err))
-			goto out_free;
+			goto err_undo;
 
-		/* Go low */
-		block = block->left;
+		block = block->right;
 		i--;
 	}
-
-	mark_allocated(block);
-	mm->avail -= drm_buddy_block_size(mm, block);
-	kmemleak_update_trace(block);
 	return block;
 
-out_free:
+err_undo:
 	if (i != order)
 		__drm_buddy_free(mm, block);
 	return ERR_PTR(err);
 }
-EXPORT_SYMBOL(drm_buddy_alloc_blocks);
-
-static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
-{
-	return s1 <= e2 && e1 >= s2;
-}
 
-static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
-{
-	return s1 <= s2 && e1 >= e2;
-}
-
-/**
- * drm_buddy_alloc_range - allocate range
- *
- * @mm: DRM buddy manager to allocate from
- * @blocks: output list head to add allocated blocks
- * @start: start of the allowed range for this block
- * @size: size of the allocation
- *
- * Intended for pre-allocating portions of the address space, for example to
- * reserve a block for the initial framebuffer or similar, hence the expectation
- * here is that drm_buddy_alloc_blocks() is still the main vehicle for
- * allocations, so if that's not the case then the drm_mm range allocator is
- * probably a much better fit, and so you should probably go use that instead.
- *
- * Note that it's safe to chain together multiple alloc_ranges
- * with the same blocks list
- *
- * Returns:
- * 0 on success, error code on failure.
- */
-int drm_buddy_alloc_range(struct drm_buddy *mm,
-			  struct list_head *blocks,
-			  u64 start, u64 size)
+static int __alloc_range(struct drm_buddy *mm,
+			 struct list_head *dfs,
+			 u64 start, u64 size,
+			 struct list_head *blocks)
 {
 	struct drm_buddy_block *block;
 	struct drm_buddy_block *buddy;
 	LIST_HEAD(allocated);
-	LIST_HEAD(dfs);
 	u64 end;
 	int err;
-	int i;
-
-	if (size < mm->chunk_size)
-		return -EINVAL;
-
-	if (!IS_ALIGNED(size | start, mm->chunk_size))
-		return -EINVAL;
-
-	if (range_overflows(start, size, mm->size))
-		return -EINVAL;
-
-	for (i = 0; i < mm->n_roots; ++i)
-		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
 
 	end = start + size - 1;
 
@@ -399,7 +424,7 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
 		u64 block_start;
 		u64 block_end;
 
-		block = list_first_entry_or_null(&dfs,
+		block = list_first_entry_or_null(dfs,
 						 struct drm_buddy_block,
 						 tmp_link);
 		if (!block)
@@ -436,8 +461,8 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
 				goto err_undo;
 		}
 
-		list_add(&block->right->tmp_link, &dfs);
-		list_add(&block->left->tmp_link, &dfs);
+		list_add(&block->right->tmp_link, dfs);
+		list_add(&block->left->tmp_link, dfs);
 	} while (1);
 
 	list_splice_tail(&allocated, blocks);
@@ -459,7 +484,143 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
 	drm_buddy_free_list(mm, &allocated);
 	return err;
 }
-EXPORT_SYMBOL(drm_buddy_alloc_range);
+
+/**
+ * __drm_buddy_alloc_range - actual range allocation
+ *
+ * @mm: DRM buddy manager to allocate from
+ * @start: start of the allowed range for this block
+ * @size: size of the allocation
+ * @blocks: output list head to add allocated blocks
+ *
+ * Intended for pre-allocating portions of the address space, for example to
+ * reserve a block for the initial framebuffer or similar
+ *
+ * Note that it's safe to chain together multiple alloc_ranges
+ * with the same blocks list
+ *
+ * Returns:
+ * 0 on success, error code on failure.
+ */
+static int __drm_buddy_alloc_range(struct drm_buddy *mm,
+				   u64 start,
+				   u64 size,
+				   struct list_head *blocks)
+{
+	LIST_HEAD(dfs);
+	int i;
+
+	for (i = 0; i < mm->n_roots; ++i)
+		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
+
+	return __alloc_range(mm, &dfs, start, size, blocks);
+}
+
+/**
+ * drm_buddy_alloc_blocks - allocate power-of-two blocks
+ *
+ * @mm: DRM buddy manager to allocate from
+ * @start: start of the allowed range for this block
+ * @end: end of the allowed range for this block
+ * @size: size of the allocation
+ * @min_page_size: alignment of the allocation
+ * @blocks: output list head to add allocated blocks
+ * @flags: DRM_BUDDY_*_ALLOCATION flags
+ *
+ * alloc_range_bias() called on range limitations, which traverses
+ * the tree and returns the desired block.
+ *
+ * alloc_from_freelist() called when *no* range restrictions
+ * are enforced, which picks the block from the freelist.
+ *
+ * blocks are allocated in order, the order value here translates to:
+ *
+ * 0 = 2^0 * mm->chunk_size
+ * 1 = 2^1 * mm->chunk_size
+ * 2 = 2^2 * mm->chunk_size
+ *
+ * Returns:
+ * 0 on success, error code on failure.
+ */
+int drm_buddy_alloc_blocks(struct drm_buddy *mm,
+			   u64 start, u64 end, u64 size,
+			   u64 min_page_size,
+			   struct list_head *blocks,
+			   unsigned long flags)
+{
+	struct drm_buddy_block *block = NULL;
+	unsigned int min_order, order;
+	unsigned long pages;
+	LIST_HEAD(allocated);
+	int err;
+
+	if (size < mm->chunk_size)
+		return -EINVAL;
+
+	if (min_page_size < mm->chunk_size)
+		return -EINVAL;
+
+	if (!is_power_of_2(min_page_size))
+		return -EINVAL;
+
+	if (!IS_ALIGNED(start | end | size, mm->chunk_size))
+		return -EINVAL;
+
+	if (end > mm->size)
+		return -EINVAL;
+
+	if (range_overflows(start, size, mm->size))
+		return -EINVAL;
+
+	/* Actual range allocation */
+	if (start + size == end)
+		return __drm_buddy_alloc_range(mm, start, size, blocks);
+
+	pages = size >> ilog2(mm->chunk_size);
+	order = fls(pages) - 1;
+	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
+
+	do {
+		order = min(order, (unsigned int)fls(pages) - 1);
+		BUG_ON(order > mm->max_order);
+		BUG_ON(order < min_order);
+
+		do {
+			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
+				/* Allocate traversing within the range */
+				block = alloc_range_bias(mm, start, end, order);
+			else
+				/* Allocate from freelist */
+				block = alloc_from_freelist(mm, order, flags);
+
+			if (!IS_ERR(block))
+				break;
+
+			if (order-- == min_order) {
+				err = -ENOSPC;
+				goto err_free;
+			}
+		} while (1);
+
+		mark_allocated(block);
+		mm->avail -= drm_buddy_block_size(mm, block);
+		kmemleak_update_trace(block);
+		list_add_tail(&block->link, &allocated);
+
+		pages -= BIT(order);
+
+		if (!pages)
+			break;
+	} while (1);
+
+	list_splice_tail(&allocated, blocks);
+	return 0;
+
+err_free:
+	drm_buddy_free_list(mm, &allocated);
+	return err;
+}
+EXPORT_SYMBOL(drm_buddy_alloc_blocks);
 
 /**
  * drm_buddy_block_print - print block information
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index 247714bab044..a328a38fab07 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -36,13 +36,14 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
 	struct i915_ttm_buddy_resource *bman_res;
 	struct drm_buddy *mm = &bman->mm;
-	unsigned long n_pages;
-	unsigned int min_order;
+	unsigned long n_pages, lpfn;
 	u64 min_page_size;
 	u64 size;
 	int err;
 
-	GEM_BUG_ON(place->fpfn || place->lpfn);
+	lpfn = place->lpfn;
+	if (!lpfn)
+		lpfn = man->size;
 
 	bman_res = kzalloc(sizeof(*bman_res), GFP_KERNEL);
 	if (!bman_res)
@@ -52,6 +53,9 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	INIT_LIST_HEAD(&bman_res->blocks);
 	bman_res->mm = mm;
 
+	if (place->fpfn || lpfn != man->size)
+		bman_res->flags |= DRM_BUDDY_RANGE_ALLOCATION;
+
 	GEM_BUG_ON(!bman_res->base.num_pages);
 	size = bman_res->base.num_pages << PAGE_SHIFT;
 
@@ -60,10 +64,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 		min_page_size = bo->page_alignment << PAGE_SHIFT;
 
 	GEM_BUG_ON(min_page_size < mm->chunk_size);
-	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
+
 	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
+		unsigned long pages;
+
 		size = roundup_pow_of_two(size);
-		min_order = ilog2(size) - ilog2(mm->chunk_size);
+		min_page_size = size;
+
+		pages = size >> ilog2(mm->chunk_size);
+		if (pages > lpfn)
+			lpfn = pages;
 	}
 
 	if (size > mm->size) {
@@ -73,34 +83,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 
 	n_pages = size >> ilog2(mm->chunk_size);
 
-	do {
-		struct drm_buddy_block *block;
-		unsigned int order;
-
-		order = fls(n_pages) - 1;
-		GEM_BUG_ON(order > mm->max_order);
-		GEM_BUG_ON(order < min_order);
-
-		do {
-			mutex_lock(&bman->lock);
-			block = drm_buddy_alloc_blocks(mm, order);
-			mutex_unlock(&bman->lock);
-			if (!IS_ERR(block))
-				break;
-
-			if (order-- == min_order) {
-				err = -ENOSPC;
-				goto err_free_blocks;
-			}
-		} while (1);
-
-		n_pages -= BIT(order);
-
-		list_add_tail(&block->link, &bman_res->blocks);
-
-		if (!n_pages)
-			break;
-	} while (1);
+	mutex_lock(&bman->lock);
+	err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
+				     (u64)lpfn << PAGE_SHIFT,
+				     (u64)n_pages << PAGE_SHIFT,
+				     min_page_size,
+				     &bman_res->blocks,
+				     bman_res->flags);
+	mutex_unlock(&bman->lock);
+	if (unlikely(err))
+		goto err_free_blocks;
 
 	*res = &bman_res->base;
 	return 0;
@@ -268,10 +260,17 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
 {
 	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
 	struct drm_buddy *mm = &bman->mm;
+	unsigned long flags = 0;
 	int ret;
 
+	flags |= DRM_BUDDY_RANGE_ALLOCATION;
+
 	mutex_lock(&bman->lock);
-	ret = drm_buddy_alloc_range(mm, &bman->reserved, start, size);
+	ret = drm_buddy_alloc_blocks(mm, start,
+				     start + size,
+				     size, mm->chunk_size,
+				     &bman->reserved,
+				     flags);
 	mutex_unlock(&bman->lock);
 
 	return ret;
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
index 312077941411..72c90b432e87 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
@@ -20,6 +20,7 @@ struct drm_buddy;
  *
  * @base: struct ttm_resource base class we extend
  * @blocks: the list of struct i915_buddy_block for this resource/allocation
+ * @flags: DRM_BUDDY_*_ALLOCATION flags
  * @mm: the struct i915_buddy_mm for this resource
  *
  * Extends the struct ttm_resource to manage an address space allocation with
@@ -28,6 +29,7 @@ struct drm_buddy;
 struct i915_ttm_buddy_resource {
 	struct ttm_resource base;
 	struct list_head blocks;
+	unsigned long flags;
 	struct drm_buddy *mm;
 };
 
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index f524db152413..54f25a372f27 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -22,6 +22,8 @@
 	start__ >= max__ || size__ > max__ - start__; \
 })
 
+#define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
+
 struct drm_buddy_block {
 #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
 #define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
@@ -131,12 +133,11 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size);
 
 void drm_buddy_fini(struct drm_buddy *mm);
 
-struct drm_buddy_block *
-drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order);
-
-int drm_buddy_alloc_range(struct drm_buddy *mm,
-			  struct list_head *blocks,
-			  u64 start, u64 size);
+int drm_buddy_alloc_blocks(struct drm_buddy *mm,
+			   u64 start, u64 end, u64 size,
+			   u64 min_page_size,
+			   struct list_head *blocks,
+			   unsigned long flags);
 
 void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
 

base-commit: 627e2885b51ab503a98aa89f0a0bd68416c731fc
-- 
2.25.1

