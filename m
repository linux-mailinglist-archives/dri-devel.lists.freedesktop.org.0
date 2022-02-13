Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC71E4B3A55
	for <lists+dri-devel@lfdr.de>; Sun, 13 Feb 2022 09:53:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE28C10F36B;
	Sun, 13 Feb 2022 08:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E440010F368;
 Sun, 13 Feb 2022 08:52:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kB9T68XoC7wYDUo5FL9fQc3FLZXXqOF81ZAJW25hMIhdHdBdAOJA4eWWo1cHsl+hChQG3efhRMx9rq2pYQwzG4kEonacWi2lDljQTRKup/oqC4KDA8nj8zG7E3jPoLQkyAqQJlCU450T9VzIVyd9pMuuYyRkexAADMiRHulHszmW8dOGtvVBlG3z2/ynxTa0zDw+Hg4oVFgYa6Vx99qcUz+O+oNSSeNAl4xx0FMLwfFV+UXnjiKGh3+cd4gDJV+iufyxO7t7n/xVZ4gHnNZ62A3+1IQut/0OIOPlNiCnTYngHmZwTPVoPKOuarMya/MbyoKIkiK4133PIAZxQDvf6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSSMP5rakGIfLGn+kyDoy5t3WW/+V84O+3/PdI0Pkac=;
 b=QLC630L3sAV8DruxKmQFJ+NgBGBwLNFAhWOsr/L4AEBheDDJJVlxDHrTFi4DHO8ualuvx0pO4OKRic6k5N2ZPbstIBc+Cshwivqd90m8CdyJqDOlhaW9J/c0HUv4BGTf3RGPa2jqCXuNzVK0AdIGO9J1yucHgt8FphFO37RSGj2/MoiGa8GoKscUJOOFbpyyJm2Z0gp3YYZXsPwQ6KBL9P3ElQFACV2GzksJi73D1gYcWS9UjWcrQtKh6TjUNSF8hexwKzIrapmnIQZlznyg5kuRRe6Ka8/NprtFfIPWRH7ZZqX6eqfWkCfCpF1Yw20L1ZLOb/mSPKG4y3hPwq940Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSSMP5rakGIfLGn+kyDoy5t3WW/+V84O+3/PdI0Pkac=;
 b=n/lPfZIlXsBfXaUrwhv7RMwYciHKOOBJSXPKetACmvWQ32/H1cbjFrPmyQjE7R3GBxXOH4Y8v8+VhTmK7PURHuLc7SAWIGUwth6jHz8pHWHT7MWI1+c2zv/VxtoQXtYWs7kSljYZAPfXeN9lA72mZMuPVW1gz/zE903PCt3JCME=
Received: from BN9PR03CA0395.namprd03.prod.outlook.com (2603:10b6:408:111::10)
 by PH7PR12MB5975.namprd12.prod.outlook.com (2603:10b6:510:1da::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Sun, 13 Feb
 2022 08:52:46 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::ba) by BN9PR03CA0395.outlook.office365.com
 (2603:10b6:408:111::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Sun, 13 Feb 2022 08:52:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Sun, 13 Feb 2022 08:52:44 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 13 Feb
 2022 02:52:36 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v12 1/5] drm: improve drm_buddy_alloc function
Date: Sun, 13 Feb 2022 14:22:13 +0530
Message-ID: <20220213085217.2705-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f961005-50af-4288-8624-08d9eece33f0
X-MS-TrafficTypeDiagnostic: PH7PR12MB5975:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB59753E119DDA2D8E59DC82CEE4329@PH7PR12MB5975.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DSChhysqUKdY6+IIsDIOxZD+hXp0+rIOK6BZzGjhbrTQxoQx4HXvbzuGd8xRcNjvr9irgN+M275XSpy/LchE2/b7JGnyQNSVEPI2D97Kmpf/Flu+Dh9BSz6K2FHuJl8L3TSa6YusMHTKOlYdjBsxlFmLLB8I+t7/mxi5go8NXzd4RAJmlKE0jIzFEhIoW/UKDfmUKNhwz/a64cQkwDX1LcX859PdRJOumQ53XMXKZGr5yc5XxX5PHp4ARbVrNF8BpUUETYG2JqTDcTwmiVBXl072+JKRk2JXBLmwrrXmlrrN83KdOVtyiMbBdz7CFR+qQD9NPRFyaWi8Bu0/wsvxfoJXWofvuPPBUPJR2OzHtLbt/1KM+mt0ImEQ+rqHC7LvFV0lpblR7zRidhqrSaO/HOnXf2klpaDHvOTVrLiomA5fgRFecNm0qTsmLmj43zfQ6ewfGn13NjcC7uLrzOSQ88I5cA4mxol015L/qBxZ0+bSC7k/sHUtoDhCkV1Thel2R26zv3jQ/5sn8DzLlaeSIgEcM2iObzjQzqsksal5QO3kC/RbpY3nwgB4qPsdAhoFQR6OUuEspmFiCsPUVvQMVXzA0TPwOQHyTzACgt4+TZBeqbXZI3uYuDXIj6x+3zWaLoObDtnYuWdIYPex1bJrOgc4jFC5LTeDEQZLs8Rcbt7ZoiD+m3+zG5OvHb4FQs+k8T0hUkuU9AZMpZAlc3ECYg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(2906002)(47076005)(316002)(426003)(26005)(186003)(81166007)(336012)(6666004)(54906003)(83380400001)(508600001)(356005)(70206006)(36756003)(110136005)(30864003)(86362001)(8676002)(82310400004)(7696005)(2616005)(36860700001)(16526019)(1076003)(5660300002)(40460700003)(70586007)(4326008)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2022 08:52:44.7492 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f961005-50af-4288-8624-08d9eece33f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5975
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

v9(Matthew Auld):
  - remove DRM_BUDDY_RANGE_ALLOCATION flag
  - remove unnecessary function description

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/drm_buddy.c                   | 292 +++++++++++++-----
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  63 ++--
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |   2 +
 include/drm/drm_buddy.h                       |  11 +-
 4 files changed, 250 insertions(+), 118 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index d60878bc9c20..e0c0d786a572 100644
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
-
-static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
-{
-	return s1 <= s2 && e1 >= e2;
-}
 
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
@@ -459,7 +484,120 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
 	drm_buddy_free_list(mm, &allocated);
 	return err;
 }
-EXPORT_SYMBOL(drm_buddy_alloc_range);
+
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
+			if (start || end != size)
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
index 247714bab044..7aef6ad9fe84 100644
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
@@ -60,10 +61,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
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
@@ -73,34 +80,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 
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
@@ -268,12 +257,16 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
 {
 	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
 	struct drm_buddy *mm = &bman->mm;
+	unsigned long flags = 0;
 	int ret;
 
 	mutex_lock(&bman->lock);
-	ret = drm_buddy_alloc_range(mm, &bman->reserved, start, size);
+	ret = drm_buddy_alloc_blocks(mm, start,
+				     start + size,
+				     size, mm->chunk_size,
+				     &bman->reserved,
+				     flags);
 	mutex_unlock(&bman->lock);
 
 	return ret;
 }
-
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
index f524db152413..1f2435426c69 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -131,12 +131,11 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size);
 
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
 
-- 
2.25.1

