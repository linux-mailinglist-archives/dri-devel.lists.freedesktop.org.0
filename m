Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F06864341C2
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 00:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84EFB6E138;
	Tue, 19 Oct 2021 22:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032CD6E10A;
 Tue, 19 Oct 2021 22:55:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfkK0T0M3JT2lEyxSZXYb23LYUboEAu1D6a7xfEu1nl851jJqaHY24DslIIyXRbkJNsecRw60f/MClBiNv5/PpcbDcoTT0CIpIGvQUghsAAk+AIxXJaTNrcKNXTomZ5LKLJKg7Bc2hTHnUV8onWPsHkNDOmMctaGRpy6+ecsfT8HSz98lo2iDzkhH0OE7MgQFn6c+RQKDgb3dcIQOnbOW21LA5kQxq7zZrqUiJc7Dt8O95pSGOk/NS1h5T7jzLqqJGWUe9omW9GgXjeSjRhBcoClAMoYaZIAMj5RA+lrAIec6MwPpx88sUYDgMF9GiVjg+PipH3ew0zh/WvkO0OMEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BucEtWHJwRDivMuyuuPCQ0BV8dtBKBNIOnoWevGJC34=;
 b=Ha7NYGG8GNMe4phohaAqd6ZP42WFzfjL5SLfN+KE7JvyDyNgjWYFZFrI1DiDYfNq/MShipeyAhpURVkOeiIqHoAABZI3tkpbmNSb+A+4lZQabEH/mtFfMkX18+hoy5Y3oOlgeZc4tMpTP0o3iXD4bLHSOol9LtQgAV2Jv5i6MSgb1IBczwnpjupK8TybA58hgSpc8Z63NPPKOD1YX+f+Qf8yoKrtb+P3d/bP9EanpY+zlrk7RgYHBuiZOuWdPBEI/QozSE9lYijhFHKgefYh4luv8gOVVMMDBnxuuKe+66dFjiu1QDP0pHefGMp1RhcyTljHcSO/dtmX7cSINhuqRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BucEtWHJwRDivMuyuuPCQ0BV8dtBKBNIOnoWevGJC34=;
 b=oZ9k7q49fVbkEneoyBzb57FTmZgbcDGJgBvPFFRoGYCNHUNRcwvuMH86JyR8yeKOG/6bjr15dVNCJdLT5raiCS0G2e54P53CjBseFbE4R419/xfhKRjTYpMpt10kpktWfhGggImwnY/eTRI1Uqc4+aEr7WQTO5UK1jZi8CCBmXw=
Received: from MW3PR06CA0024.namprd06.prod.outlook.com (2603:10b6:303:2a::29)
 by BN8PR12MB4787.namprd12.prod.outlook.com (2603:10b6:408:a1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Tue, 19 Oct
 2021 22:55:12 +0000
Received: from CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::c4) by MW3PR06CA0024.outlook.office365.com
 (2603:10b6:303:2a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17 via Frontend
 Transport; Tue, 19 Oct 2021 22:55:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT035.mail.protection.outlook.com (10.13.175.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 22:55:12 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 17:55:09 -0500
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <daniel@ffwll.ch>, <matthew.auld@intel.com>,
 <alexander.deucher@amd.com>, Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 04/13] drm: make drm_buddy_alloc a commonplace
Date: Wed, 20 Oct 2021 04:24:00 +0530
Message-ID: <20211019225409.569355-5-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019225409.569355-1-Arunpravin.PaneerSelvam@amd.com>
References: <20211019225409.569355-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8a91b13-a04f-4ff8-e00d-08d993538230
X-MS-TrafficTypeDiagnostic: BN8PR12MB4787:
X-Microsoft-Antispam-PRVS: <BN8PR12MB47872AA8309CB6C0E8C1FDC3E4BD9@BN8PR12MB4787.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:117;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: clOSVbMlG1EdfWTW0Y62WKIO5ZfMG5uYkRd0Z37c6bZB6dNOxfeM69bRY+eZ6CblIC0Jtfxy//+KBgWAYA781+pvBCcsHHkj+lzLS5qj9wM10+jbB4KiUZLUC9yXzh/IgZHyZ4rECnG/1y8TFbAL4ftwCEyGHFCPdbJsWWU3RIHWXK8eTG6pan5U1ribNJvPlitdA3g1S0NWab91z+5seAWdcMT0It7XWbAT8VZo4Lv6nSGKDmg2iHfI1faKa6Shpc59Czcg8ODPW2JRE9bzlliSwA4zTCjkHEm/5aipdbYoacIzinhyspUqQgvfSxdsTRbFpqiNiICX5VLdwajYOsE8uypgxItzpYmD+D+2wX+rV3y7btZmIeeg8jk9yUXV6HlY1K7ESuFw3UrSFKS1DlgJmYcgeWwdDuwyKl2FM1ymMhRJYKb5moMXjpa7YrocCVQOKyJ5nmhDRuQ6NALPNjRnFr7rduRJ0Bo7xJeIrlw2GVnxP/FlGaV+MHQl6/VuUqVXaI99GoVre3Ay3REfRBDQhVEV0IwMmvXo6g6M7npAGhMFZwuFI0Ym9eUNfRhdWWFgLp4AL6UGm/gwE2p+Godj8p5tyDgkMqkrQoK6bh2kkIOaxRRXRXsLbkBC7nZPNksk8lgAYPdSzuKEhtBwpLfkcdi33EZR5nteflNKjJItFW/iJGYfAM9AZ0CcG4XBPNcYJNtbUQXLqDBYHdaunHz8ozuMNi2XUDtkwM13tRo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(16526019)(186003)(4326008)(1076003)(70206006)(82310400003)(70586007)(81166007)(356005)(47076005)(8676002)(336012)(26005)(5660300002)(8936002)(83380400001)(36756003)(36860700001)(508600001)(2616005)(110136005)(86362001)(54906003)(7696005)(426003)(6666004)(316002)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 22:55:12.3846 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a91b13-a04f-4ff8-e00d-08d993538230
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB4787
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
  range allocation and non-range allocation demands.

- Implemented a new function alloc_range() which allocates
  the requested order (in bytes) comply with range limitations

- Moved memory alignment logic from i915 driver

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 208 +++++++++++++++++++++++++++++++-----
 include/drm/drm_buddy.h     |  18 +++-
 2 files changed, 194 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 0398706cb7ae..f5f299dd9131 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -246,27 +246,112 @@ void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects)
 	INIT_LIST_HEAD(objects);
 }
 
-/*
- * Allocate power-of-two block. The order value here translates to:
- *
- *   0 = 2^0 * mm->chunk_size
- *   1 = 2^1 * mm->chunk_size
- *   2 = 2^2 * mm->chunk_size
- *   ...
- */
-struct drm_buddy_block *
-drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order)
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
+alloc_range(struct drm_buddy_mm *mm,
+	    u64 start, u64 end,
+	    unsigned int order)
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
+
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
+		if (contains(start, end, block_start, block_end)
+				&& order == drm_buddy_block_order(block)) {
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
+		list_add(&block->left->tmp_link, &dfs);
+		list_add(&block->right->tmp_link, &dfs);
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
+alloc_from_freelist(struct drm_buddy_mm *mm,
+		    unsigned int order,
+		    unsigned long flags)
 {
 	struct drm_buddy_block *block = NULL;
 	unsigned int i;
 	int err;
 
 	for (i = order; i <= mm->max_order; ++i) {
-		block = list_first_entry_or_null(&mm->free_list[i],
-						 struct drm_buddy_block,
-						 link);
-		if (block)
-			break;
+		if (!list_empty(&mm->free_list[i])) {
+			block = list_first_entry_or_null(&mm->free_list[i],
+							 struct drm_buddy_block,
+							 link);
+
+			if (block)
+				break;
+		}
 	}
 
 	if (!block)
@@ -276,33 +361,100 @@ drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order)
 
 	while (i != order) {
 		err = split_block(mm, block);
+
 		if (unlikely(err))
-			goto out_free;
+			goto err_undo;
 
-		/* Go low */
-		block = block->left;
+		block = block->right;
 		i--;
 	}
 
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
 
-static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
+/*
+ * Allocate power-of-two block. The order value here translates to:
+ *
+ *   0 = 2^0 * mm->chunk_size
+ *   1 = 2^1 * mm->chunk_size
+ *   2 = 2^2 * mm->chunk_size
+ *   ...
+ */
+int drm_buddy_alloc(struct drm_buddy_mm *mm,
+		    u64 start, u64 end, u64 size,
+		    u64 min_page_size,
+		    struct list_head *blocks,
+		    unsigned long flags)
 {
-	return s1 <= e2 && e1 >= s2;
-}
+	struct drm_buddy_block *block = NULL;
+	unsigned int min_order, order;
+	unsigned long pages;
+	LIST_HEAD(allocated);
+	int err;
 
-static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
-{
-	return s1 <= s2 && e1 >= e2;
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
+
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
 }
 
 /*
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 390b133fe342..c64fd4062cb6 100644
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
 
+#define DRM_BUDDY_RANGE_ALLOCATION (1 << 1)
+
 struct drm_buddy_block {
 #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
 #define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
@@ -131,8 +138,11 @@ int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size);
 
 void drm_buddy_fini(struct drm_buddy_mm *mm);
 
-struct drm_buddy_block *
-drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order);
+int drm_buddy_alloc(struct drm_buddy_mm *mm,
+		    u64 start, u64 end, u64 size,
+		    u64 min_page_size,
+		    struct list_head *blocks,
+		    unsigned long flags);
 
 int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
 			   struct list_head *blocks,
-- 
2.25.1

