Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE974396FC
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 15:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3FCA89FEC;
	Mon, 25 Oct 2021 13:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC86F89FD7;
 Mon, 25 Oct 2021 13:01:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+gjCQvE7HSAJbMkXWuvBpgXiuJLub/Rz67k1UZih1vgkxTdDP6WnoFVr7Toa2wFEvi7Vcv5bavjSDVkDx6q0lN6I/W1nehF+Ud+OrOfBl2NL+hG72h1whVanM8E34Cq1EkB/fereRD1pz2rBa2JTYs4xJPUx4FhsyZGZto4fRZezTxscuWRpTLu7+xoI/KS7XF6wesOgwQ4ydnKQy6O8JqiEhJT+vmWl/kCOlIEIlVnB5q8W5NeTmrUABbkd+QrTEhWTc0vP9wJlsc/zUWKLPW2kgqPW4zLjeZMVy7/v6iACzl9Q3btwwn9/iQENLHgAl/a5wcRQFb88okOoSfKhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcrdXm0WG62lT4nj1HgWB5aCd+hO3ACNi4sdXtP6cTk=;
 b=RlvfAnwRlQntFUfwnQrXeIEUYsZm8f1y9IYHPHvlJ2bm3+qKZ+qK51um/Hr27I04ECtmMB63CQ5JJAMxjPf9tYyyV7sAM7xAXMRZeZkanrZNNVgsJbQJXWWJoSdYV7HyjMEjmDkAgJF8zCp3iBPZak6/CkJbvDTix7iMfG/UVGpJJrNfbSUtBIIFEbuGqfY5FYXJik5R79fbwna0POn5oO6LN7m2bd8fePvOZkRp1Q6ge0f9wybdZDbkppx7cdL7sfh8hjab753613nwW4wm/3MzbkrOUSv0q8OhveKBFcRl8XM6b4bvf8PSi4VZk/Pfqo3sd80Ux5qycdLmOOJY1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pcrdXm0WG62lT4nj1HgWB5aCd+hO3ACNi4sdXtP6cTk=;
 b=1MfvHzjFLm38RB5o2ZdFoi5382Oc0GALS4iwBsDXomI+v8Nbz0YXcOO1ZQkZoNEbp+JYHciQrrkSCb9Tcgdu0BelGFzcNtc1ewmBR0ugfetrmwg9vGcSo3rHmEqkITr/1xhVi5x2vtYAC4BkKtOd9NwCIgPYPgbOnEEC9/GOzY0=
Received: from MW4PR04CA0106.namprd04.prod.outlook.com (2603:10b6:303:83::21)
 by MWHPR12MB1182.namprd12.prod.outlook.com (2603:10b6:300:b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Mon, 25 Oct
 2021 13:01:22 +0000
Received: from CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::a5) by MW4PR04CA0106.outlook.office365.com
 (2603:10b6:303:83::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Mon, 25 Oct 2021 13:01:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT047.mail.protection.outlook.com (10.13.174.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Mon, 25 Oct 2021 13:01:22 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 25 Oct
 2021 08:01:18 -0500
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <daniel@ffwll.ch>, <christian.koenig@amd.com>,
 <alexander.deucher@amd.com>, <matthew.auld@intel.com>, <tzimmermann@suse.de>, 
 <jani.nikula@linux.intel.com>, Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v2 2/8] drm: improve drm_buddy_alloc function
Date: Mon, 25 Oct 2021 18:30:33 +0530
Message-ID: <20211025130033.1547667-8-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025130033.1547667-1-Arunpravin.PaneerSelvam@amd.com>
References: <20211025130033.1547667-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7997413d-cceb-46ac-6c1b-08d997b78b7c
X-MS-TrafficTypeDiagnostic: MWHPR12MB1182:
X-Microsoft-Antispam-PRVS: <MWHPR12MB11824B0664C00594AC3900EDE4839@MWHPR12MB1182.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:590;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kODX29O4KhK9dj/5jzLdEYOVIthS7JKhBxTiRc0xr1BlJybd82jX5OcnI3icMHkUaROyw5kGvY9UxypZ/K+jvn0iFR1+szZU171zplgM6pdUZsO51Cc2gQEDa7jSOujdaHWoQTzi5BdrlWLxzOi6xw/TmBLzOigSWaxZACsV2EGvwa40bOVqUGxqCaNWx4zjHoVqe6unXYL9U3JibWgYK5Xq6wCgMgSq7hZL3lk3Sj87LulmIlcsGmhFU90szeIwtV3EC7Rpbhe1YrxJJl+03FHffQQ7r3w4IeWcP85DuidJK+rHt0tAFfWJQHZIndbNxytofnUoJ2PF2bhh5sD8Q69QcHJzUDYVfEuVYvFfDMWpd/gPCS72zaKOsIXs4wFRCFKAN2YTWC8t3iYUUkm/JVbe15ROyv2SpU1bR1dsZaSDER69/zhLTCWi+M6/2rndpVjEg5Ukt7NOxMoYBp+GplmZXmJoXPzTKNAElnkHsb80dJWa8ewUsaU4Aq/ylAmvSItYxOQQz508wZfBL5MxpWOPvxv+190EpbmXxlIMEuEnzIKa9R1vdnmaR+MaTNooYkwIwz3NWK7j/BrrHVunOa3pOtFOpoa7UYJ/iLSdWT1SE1RClYvSnX+Ga5GsL0COEdQ7aHObJL2dKeLLKOB2lGPwQVz5u977UiLgajXUMHqchP4/QgGWqKbFAo4bwIa5Nm+BATu1QFDLSOquYpEuKGrkiGqp0dSGPz/via8CJNU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(8676002)(4326008)(36756003)(7696005)(8936002)(316002)(54906003)(47076005)(2906002)(110136005)(81166007)(6666004)(5660300002)(36860700001)(86362001)(1076003)(186003)(70586007)(82310400003)(70206006)(336012)(2616005)(16526019)(426003)(26005)(508600001)(356005)(83380400001)(30864003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 13:01:22.3123 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7997413d-cceb-46ac-6c1b-08d997b78b7c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1182
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Make drm_buddy_alloc a single function to handle
  range allocation and non-range allocation demands

- Implemented a new function alloc_range() which allocates
  the requested power-of-two block comply with range limitations

- Moved order computation and memory alignment logic from
  i915 driver to drm buddy

V2:
merged below changes to keep the build unbroken
- drm_buddy_alloc_range() becomes obsolete and may be removed
- enable ttm range allocation (fpfn / lpfn) support in i915 driver
- apply enhanced drm_buddy_alloc() function to i915 driver

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c                   | 265 +++++++++++-------
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  67 ++---
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |   2 +
 include/drm/drm_buddy.h                       |  22 +-
 4 files changed, 207 insertions(+), 149 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 39eb1d224bec..406e3d521903 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -274,63 +274,6 @@ void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects)
 }
 EXPORT_SYMBOL(drm_buddy_free_list);
 
-/**
- * drm_buddy_alloc - allocate power-of-two blocks
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
-drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order)
-{
-	struct drm_buddy_block *block = NULL;
-	unsigned int i;
-	int err;
-
-	for (i = order; i <= mm->max_order; ++i) {
-		block = list_first_entry_or_null(&mm->free_list[i],
-						 struct drm_buddy_block,
-						 link);
-		if (block)
-			break;
-	}
-
-	if (!block)
-		return ERR_PTR(-ENOSPC);
-
-	BUG_ON(!drm_buddy_block_is_free(block));
-
-	while (i != order) {
-		err = split_block(mm, block);
-		if (unlikely(err))
-			goto out_free;
-
-		/* Go low */
-		block = block->left;
-		i--;
-	}
-
-	mark_allocated(block);
-	mm->avail -= drm_buddy_block_size(mm, block);
-	kmemleak_update_trace(block);
-	return block;
-
-out_free:
-	if (i != order)
-		__drm_buddy_free(mm, block);
-	return ERR_PTR(err);
-}
-EXPORT_SYMBOL(drm_buddy_alloc);
-
 static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
 {
 	return s1 <= e2 && e1 >= s2;
@@ -341,52 +284,22 @@ static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
 	return s1 <= s2 && e1 >= e2;
 }
 
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
- * here is that drm_buddy_alloc() is still the main vehicle for
- * allocations, so if that's not the case then the drm_mm range allocator is
- * probably a much better fit, and so you should probably go use that instead.
- *
- * Note that it's safe to chain together multiple alloc_ranges
- * with the same blocks list
- *
- * Returns:
- * 0 on success, error code on failure.
- */
-int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
-			  struct list_head *blocks,
-			  u64 start, u64 size)
+static struct drm_buddy_block *
+alloc_range(struct drm_buddy_mm *mm,
+	    u64 start, u64 end,
+	    unsigned int order)
 {
 	struct drm_buddy_block *block;
 	struct drm_buddy_block *buddy;
-	LIST_HEAD(allocated);
 	LIST_HEAD(dfs);
-	u64 end;
 	int err;
 	int i;
 
-	if (size < mm->chunk_size)
-		return -EINVAL;
-
-	if (!IS_ALIGNED(size | start, mm->chunk_size))
-		return -EINVAL;
-
-	if (range_overflows(start, size, mm->size))
-		return -EINVAL;
+	end = end - 1;
 
 	for (i = 0; i < mm->n_roots; ++i)
 		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
 
-	end = start + size - 1;
-
 	do {
 		u64 block_start;
 		u64 block_end;
@@ -394,31 +307,32 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
 		block = list_first_entry_or_null(&dfs,
 						 struct drm_buddy_block,
 						 tmp_link);
+
 		if (!block)
 			break;
 
 		list_del(&block->tmp_link);
 
+		if (drm_buddy_block_order(block) < order)
+			continue;
+
 		block_start = drm_buddy_block_offset(block);
 		block_end = block_start + drm_buddy_block_size(mm, block) - 1;
 
 		if (!overlaps(start, end, block_start, block_end))
 			continue;
 
-		if (drm_buddy_block_is_allocated(block)) {
-			err = -ENOSPC;
-			goto err_free;
-		}
+		if (drm_buddy_block_is_allocated(block))
+			continue;
 
-		if (contains(start, end, block_start, block_end)) {
-			if (!drm_buddy_block_is_free(block)) {
-				err = -ENOSPC;
-				goto err_free;
-			}
+		if (contains(start, end, block_start, block_end)
+				&& order == drm_buddy_block_order(block)) {
+			/*
+			 * Find the free block within the range.
+			 */
+			if (drm_buddy_block_is_free(block))
+				return block;
 
-			mark_allocated(block);
-			mm->avail -= drm_buddy_block_size(mm, block);
-			list_add_tail(&block->link, &allocated);
 			continue;
 		}
 
@@ -428,12 +342,11 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
 				goto err_undo;
 		}
 
-		list_add(&block->right->tmp_link, &dfs);
 		list_add(&block->left->tmp_link, &dfs);
+		list_add(&block->right->tmp_link, &dfs);
 	} while (1);
 
-	list_splice_tail(&allocated, blocks);
-	return 0;
+	return ERR_PTR(-ENOSPC);
 
 err_undo:
 	/*
@@ -446,12 +359,148 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
 	    (drm_buddy_block_is_free(block) &&
 	     drm_buddy_block_is_free(buddy)))
 		__drm_buddy_free(mm, block);
+	return ERR_PTR(err);
+}
+
+static struct drm_buddy_block *
+alloc_from_freelist(struct drm_buddy_mm *mm,
+		    unsigned int order,
+		    unsigned long flags)
+{
+	struct drm_buddy_block *block = NULL;
+	unsigned int i;
+	int err;
+
+	for (i = order; i <= mm->max_order; ++i) {
+		if (!list_empty(&mm->free_list[i])) {
+			block = list_first_entry_or_null(&mm->free_list[i],
+							 struct drm_buddy_block,
+							 link);
+
+			if (block)
+				break;
+		}
+	}
+
+	if (!block)
+		return ERR_PTR(-ENOSPC);
+
+	BUG_ON(!drm_buddy_block_is_free(block));
+
+	while (i != order) {
+		err = split_block(mm, block);
+
+		if (unlikely(err))
+			goto err_undo;
+
+		block = block->right;
+		i--;
+	}
+	return block;
+
+err_undo:
+	if (i != order)
+		__drm_buddy_free(mm, block);
+	return ERR_PTR(err);
+}
+
+/**
+ * drm_buddy_alloc - allocate power-of-two blocks
+ *
+ * @mm: DRM buddy manager to allocate from
+ * @start: start of the allowed range for this block
+ * @end: end of the allowed range for this block
+ * @size: size of the allocation
+ * @min_page_size: alignment of the allocation
+ * @blocks: output list head to add allocated blocks
+ * @flags: DRM_BUDDY_*_ALLOCATION flags
+ *
+ * alloc_range() called on range limitations, which traverses
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
+int drm_buddy_alloc(struct drm_buddy_mm *mm,
+		    u64 start, u64 end, u64 size,
+		    u64 min_page_size,
+		    struct list_head *blocks,
+		    unsigned long flags)
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
+	if (!IS_ALIGNED(start, mm->chunk_size))
+		return -EINVAL;
+
+	if (!IS_ALIGNED(end, mm->chunk_size))
+		return -EINVAL;
+
+	if (!IS_ALIGNED(size, mm->chunk_size))
+		return -EINVAL;
+
+	if (check_range_overflow(start, end, size, mm->size))
+		return -EINVAL;
+
+	pages = size >> ilog2(mm->chunk_size);
+	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
+
+	do {
+		order = fls(pages) - 1;
+		BUG_ON(order > mm->max_order);
+		BUG_ON(order < min_order);
+
+		do {
+			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
+				/* Allocate traversing within the range */
+				block = alloc_range(mm, start, end, order);
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
 
 err_free:
 	drm_buddy_free_list(mm, &allocated);
 	return err;
 }
-EXPORT_SYMBOL(drm_buddy_alloc_range);
+EXPORT_SYMBOL(drm_buddy_alloc);
 
 /**
  * drm_buddy_block_print - print block information
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index c4b70cb8c248..75197ba6e40d 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -36,13 +36,14 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
 	struct i915_ttm_buddy_resource *bman_res;
 	struct drm_buddy_mm *mm = &bman->mm;
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
@@ -73,34 +83,17 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 
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
-			block = drm_buddy_alloc(mm, order);
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
+	mutex_lock(&bman->lock);
+	err = drm_buddy_alloc(mm, (uint64_t)place->fpfn << PAGE_SHIFT,
+				  (uint64_t)place->lpfn << PAGE_SHIFT,
+				  (uint64_t)n_pages << PAGE_SHIFT,
+				   min_page_size,
+				   &bman_res->blocks,
+				   bman_res->flags);
+	mutex_unlock(&bman->lock);
 
-		if (!n_pages)
-			break;
-	} while (1);
+	if (unlikely(err))
+		goto err_free_blocks;
 
 	*res = &bman_res->base;
 	return 0;
@@ -266,10 +259,18 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
 {
 	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
 	struct drm_buddy_mm *mm = &bman->mm;
+	unsigned long flags = 0;
+	u64 min_size;
 	int ret;
 
+	min_size = size;
+	flags |= DRM_BUDDY_RANGE_ALLOCATION;
+
 	mutex_lock(&bman->lock);
-	ret = drm_buddy_alloc_range(mm, &bman->reserved, start, size);
+	ret = drm_buddy_alloc(mm, start, start + size,
+				  size, min_size,
+				  &bman->reserved,
+				  flags);
 	mutex_unlock(&bman->lock);
 
 	return ret;
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
index fa644b512c2e..5ba490875f66 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
@@ -20,6 +20,7 @@ struct drm_buddy_mm;
  *
  * @base: struct ttm_resource base class we extend
  * @blocks: the list of struct i915_buddy_block for this resource/allocation
+ * @flags: DRM_BUDDY_*_ALLOCATION flags
  * @mm: the struct i915_buddy_mm for this resource
  *
  * Extends the struct ttm_resource to manage an address space allocation with
@@ -28,6 +29,7 @@ struct drm_buddy_mm;
 struct i915_ttm_buddy_resource {
 	struct ttm_resource base;
 	struct list_head blocks;
+	unsigned long flags;
 	struct drm_buddy_mm *mm;
 };
 
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 5ce3fc702f80..c7bb5509a7ad 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -13,15 +13,22 @@
 
 #include <drm/drm_print.h>
 
-#define range_overflows(start, size, max) ({ \
+#define check_range_overflow(start, end, size, max) ({ \
 	typeof(start) start__ = (start); \
+	typeof(end) end__ = (end);\
 	typeof(size) size__ = (size); \
 	typeof(max) max__ = (max); \
 	(void)(&start__ == &size__); \
 	(void)(&start__ == &max__); \
-	start__ >= max__ || size__ > max__ - start__; \
+	(void)(&start__ == &end__); \
+	(void)(&end__ == &size__); \
+	(void)(&end__ == &max__); \
+	start__ >= max__ || end__ > max__ \
+		|| size__ > end__ - start__; \
 })
 
+#define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
+
 struct drm_buddy_block {
 #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
 #define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
@@ -131,12 +138,11 @@ int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size);
 
 void drm_buddy_fini(struct drm_buddy_mm *mm);
 
-struct drm_buddy_block *
-drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order);
-
-int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
-			  struct list_head *blocks,
-			  u64 start, u64 size);
+int drm_buddy_alloc(struct drm_buddy_mm *mm,
+		    u64 start, u64 end, u64 size,
+		    u64 min_page_size,
+		    struct list_head *blocks,
+		    unsigned long flags);
 
 void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block);
 
-- 
2.25.1

