Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D059D4F7577
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 07:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35CA10E9AE;
	Thu,  7 Apr 2022 05:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD8310E9A5;
 Thu,  7 Apr 2022 05:47:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0lRk8jgqWhTIfgdQ3GLi7xu23eXLEQPiXafPE8KpYrueSZv8nG7GbC+XHZSCDuQjcGVrAuUDfkEspehD3O3p6LhGKMLg1vrtn9RlNAqGOaNyf/M/+n6EwuDDorG2fOMK0wXw9NcJ91OLSTdRTKdWv5r+TcETdrttUqMCiaQ2xxmiKhyQb5M38+jnOeaRyVHHHx6iHpvH9F0UhMYJPrV6IC1XpRDBZUqzRaiEBOJMRpDO4YbEfWWj+lnnboEAtiQRt22r3sneEubJPxKGfKZgtvZS5X084AzIxPs7y2pxNhECKuqsB5QUg2I6mhFTnrdY5XkbhyX+T1ov73l+ElDCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjW2s6uAx6ckIYNSe8QgaDDcw/1toV/bW/9hl4/k8F4=;
 b=mBFQtLa5bBtKHZcuJeA6g1wJkenhgN4//mIyLy344GSDbpUftQ7WTyqxB9iMDA8E5aFxl3mdMG1a7PG2QgliDyqeyC2SLRrHiAQ99YFRRuCi74EaZjTUwxZ3Q48gCqL+5hErT2dXSRNgJIdGpMajXQGVIuG9zsmmHd8nsb3MmbxlKjYC+r9MSzcXqnwbmJqhEh8J+EGDhNEdR8s+QqQS0EUhsOO15X02AQEz06xX1hXybcBUNR12XWiM2NTwnP1/pV9Xwdoow16EEJpJvWOu/zZYmRj6Ad8BGW7PhpU9bx1sZWWQavcaJY4aithDeHgRdzSxZWcfjeQvL2yOebXJGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjW2s6uAx6ckIYNSe8QgaDDcw/1toV/bW/9hl4/k8F4=;
 b=4auPaZQo+sLN8MewlXtAIgdn4gVTU4QlDlXDLyyzIBzIZzxMaAcjDoXbufSUbL+BbXZru3wqTc+JBZqRsIfjl6Nhne4DHkQx2sJBe+HONesW69Ak1w8XSgn0g1B2RFavsIE8MK492cH2+yLwJy+k20CT8vvw0+27qvbTCrAv5Og=
Received: from BN9PR03CA0879.namprd03.prod.outlook.com (2603:10b6:408:13c::14)
 by CH0PR12MB5188.namprd12.prod.outlook.com (2603:10b6:610:bb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Thu, 7 Apr
 2022 05:47:12 +0000
Received: from BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13c:cafe::ad) by BN9PR03CA0879.outlook.office365.com
 (2603:10b6:408:13c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22 via Frontend
 Transport; Thu, 7 Apr 2022 05:47:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT009.mail.protection.outlook.com (10.13.176.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.20 via Frontend Transport; Thu, 7 Apr 2022 05:47:11 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 7 Apr
 2022 00:47:08 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v12] drm/amdgpu: add drm buddy support to amdgpu
Date: Thu, 7 Apr 2022 11:16:51 +0530
Message-ID: <20220407054651.3924-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cd5c52b-c959-4f46-ee7f-08da185a0f97
X-MS-TrafficTypeDiagnostic: CH0PR12MB5188:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB5188A354CE7E5C45D76E2BD6E4E69@CH0PR12MB5188.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MpyS1eCarm786noZGRlxwAZIWKTDifF9HGZgb+03svjGqNeld5dyyunC8tisH23TS29MP9qMHHKJNpGJW2FOfE1M0+vjlI2UZFFeTYFFRbKmwILxSVkEGGLT9VC1UM1wklyG1Z5DauQ+c5y1B2C6Eqkz63+37msi2xprKu64vUrZBS+N6EfbVQKhjgtejucVHpXwvlR6cK5usgu0R6QJG6PVRkbwesvq1OtoyeVR9i9QXjxwTBgbESfAJAK9kbal0M/ZtgpskXnbYmjn2WaCSYSF5w6UXfUEZkM3o9GtEtnQY30hIlQFxJW6SJLWpZk4Vg2KxSfKGfllzc8lzIWHHMiiWfzQkIpELDB7SWShWxTE6skn+jNs0WwAF2XA3ELU19a6vGRWyjHQWzUhJMWWPGLt0HCC3TgxmyAvxhYtQP75AzcwFlfoPu+d4abop/B9kIb8jQJK0VNfys98yQ7IPykB8sshKf21YC8hRYgAyqkBQ0HYJLZ2tr8KVIgfsL+Y38WUPS911NXJWCZFgZxgiQ3bfH8bNaCTglZb19gZow70CSHFHqqQ9tHbiLvKquXNwV5YOZ/SiRoHPfZeJ5rRQ43NOU1sW0HwMp0JTL8oS53WPyo9h2rJblVrYjOzqCBvAKPs3TEw/tv9Ps0X9CtmBcRhdmHI9bJ66HVnNFf2J+9YUMrvQ8t8btZ7wMRYIT1uahJV09T/CelW87YxGnC71A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(82310400005)(2616005)(36860700001)(7696005)(356005)(2906002)(5660300002)(36756003)(47076005)(1076003)(8936002)(30864003)(40460700003)(8676002)(70586007)(70206006)(83380400001)(4326008)(26005)(6666004)(81166007)(186003)(426003)(54906003)(86362001)(336012)(110136005)(16526019)(316002)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 05:47:11.3460 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd5c52b-c959-4f46-ee7f-08da185a0f97
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5188
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
Cc: alexander.deucher@amd.com,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Switch to drm buddy allocator
- Add resource cursor support for drm buddy

v2(Matthew Auld):
  - replace spinlock with mutex as we call kmem_cache_zalloc
    (..., GFP_KERNEL) in drm_buddy_alloc() function

  - lock drm_buddy_block_trim() function as it calls
    mark_free/mark_split are all globally visible

v3(Matthew Auld):
  - remove trim method error handling as we address the failure case
    at drm_buddy_block_trim() function

v4:
  - fix warnings reported by kernel test robot <lkp@intel.com>

v5:
  - fix merge conflict issue

v6:
  - fix warnings reported by kernel test robot <lkp@intel.com>

v7:
  - remove DRM_BUDDY_RANGE_ALLOCATION flag usage

v8:
  - keep DRM_BUDDY_RANGE_ALLOCATION flag usage
  - resolve conflicts created by drm/amdgpu: remove VRAM accounting v2

v9(Christian):
  - merged the below patch
     - drm/amdgpu: move vram inline functions into a header
  - rename label name as fallback
  - move struct amdgpu_vram_mgr to amdgpu_vram_mgr.h
  - remove unnecessary flags from struct amdgpu_vram_reservation
  - rewrite block NULL check condition
  - change else style as per coding standard
  - rewrite the node max size
  - add a helper function to fetch the first entry from the list

v10(Christian):
   - rename amdgpu_get_node() function name as amdgpu_vram_mgr_first_block

v11:
   - if size is not aligned with min_page_size, enable is_contiguous flag,
     therefore, the size round up to the power of two and trimmed to the
     original size.
v12:
   - rename the function names having prefix as amdgpu_vram_mgr_*()
   - modify the round_up() logic conforming to contiguous flag enablement
     or if size is not aligned to min_block_size
   - modify the trim logic
   - rename node as block wherever applicable

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/Kconfig                       |   1 +
 .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    |  97 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 359 ++++++++++--------
 4 files changed, 291 insertions(+), 176 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f1422bee3dcc..5133c3f028ab 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -280,6 +280,7 @@ config DRM_AMDGPU
 	select HWMON
 	select BACKLIGHT_CLASS_DEVICE
 	select INTERVAL_TREE
+	select DRM_BUDDY
 	help
 	  Choose this option if you have a recent AMD Radeon graphics card.
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
index acfa207cf970..6546552e596c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
@@ -30,12 +30,15 @@
 #include <drm/ttm/ttm_resource.h>
 #include <drm/ttm/ttm_range_manager.h>
 
+#include "amdgpu_vram_mgr.h"
+
 /* state back for walking over vram_mgr and gtt_mgr allocations */
 struct amdgpu_res_cursor {
 	uint64_t		start;
 	uint64_t		size;
 	uint64_t		remaining;
-	struct drm_mm_node	*node;
+	void			*node;
+	uint32_t		mem_type;
 };
 
 /**
@@ -52,27 +55,63 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
 				    uint64_t start, uint64_t size,
 				    struct amdgpu_res_cursor *cur)
 {
+	struct drm_buddy_block *block;
+	struct list_head *head, *next;
 	struct drm_mm_node *node;
 
-	if (!res || res->mem_type == TTM_PL_SYSTEM) {
-		cur->start = start;
-		cur->size = size;
-		cur->remaining = size;
-		cur->node = NULL;
-		WARN_ON(res && start + size > res->num_pages << PAGE_SHIFT);
-		return;
-	}
+	if (!res)
+		goto fallback;
 
 	BUG_ON(start + size > res->num_pages << PAGE_SHIFT);
 
-	node = to_ttm_range_mgr_node(res)->mm_nodes;
-	while (start >= node->size << PAGE_SHIFT)
-		start -= node++->size << PAGE_SHIFT;
+	cur->mem_type = res->mem_type;
+
+	switch (cur->mem_type) {
+	case TTM_PL_VRAM:
+		head = &to_amdgpu_vram_mgr_resource(res)->blocks;
+
+		block = list_first_entry_or_null(head,
+						 struct drm_buddy_block,
+						 link);
+		if (!block)
+			goto fallback;
+
+		while (start >= amdgpu_vram_mgr_block_size(block)) {
+			start -= amdgpu_vram_mgr_block_size(block);
+
+			next = block->link.next;
+			if (next != head)
+				block = list_entry(next, struct drm_buddy_block, link);
+		}
+
+		cur->start = amdgpu_vram_mgr_block_start(block) + start;
+		cur->size = min(amdgpu_vram_mgr_block_size(block) - start, size);
+		cur->remaining = size;
+		cur->node = block;
+		break;
+	case TTM_PL_TT:
+		node = to_ttm_range_mgr_node(res)->mm_nodes;
+		while (start >= node->size << PAGE_SHIFT)
+			start -= node++->size << PAGE_SHIFT;
+
+		cur->start = (node->start << PAGE_SHIFT) + start;
+		cur->size = min((node->size << PAGE_SHIFT) - start, size);
+		cur->remaining = size;
+		cur->node = node;
+		break;
+	default:
+		goto fallback;
+	}
 
-	cur->start = (node->start << PAGE_SHIFT) + start;
-	cur->size = min((node->size << PAGE_SHIFT) - start, size);
+	return;
+
+fallback:
+	cur->start = start;
+	cur->size = size;
 	cur->remaining = size;
-	cur->node = node;
+	cur->node = NULL;
+	WARN_ON(res && start + size > res->num_pages << PAGE_SHIFT);
+	return;
 }
 
 /**
@@ -85,7 +124,9 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
  */
 static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
 {
-	struct drm_mm_node *node = cur->node;
+	struct drm_buddy_block *block;
+	struct drm_mm_node *node;
+	struct list_head *next;
 
 	BUG_ON(size > cur->remaining);
 
@@ -99,9 +140,27 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
 		return;
 	}
 
-	cur->node = ++node;
-	cur->start = node->start << PAGE_SHIFT;
-	cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
+	switch (cur->mem_type) {
+	case TTM_PL_VRAM:
+		block = cur->node;
+
+		next = block->link.next;
+		block = list_entry(next, struct drm_buddy_block, link);
+
+		cur->node = block;
+		cur->start = amdgpu_vram_mgr_block_start(block);
+		cur->size = min(amdgpu_vram_mgr_block_size(block), cur->remaining);
+		break;
+	case TTM_PL_TT:
+		node = cur->node;
+
+		cur->node = ++node;
+		cur->start = node->start << PAGE_SHIFT;
+		cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
+		break;
+	default:
+		return;
+	}
 }
 
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 9120ae80ef52..6a70818039dd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -26,6 +26,7 @@
 
 #include <linux/dma-direction.h>
 #include <drm/gpu_scheduler.h>
+#include "amdgpu_vram_mgr.h"
 #include "amdgpu.h"
 
 #define AMDGPU_PL_GDS		(TTM_PL_PRIV + 0)
@@ -38,15 +39,6 @@
 
 #define AMDGPU_POISON	0xd0bed0be
 
-struct amdgpu_vram_mgr {
-	struct ttm_resource_manager manager;
-	struct drm_mm mm;
-	spinlock_t lock;
-	struct list_head reservations_pending;
-	struct list_head reserved_pages;
-	atomic64_t vis_usage;
-};
-
 struct amdgpu_gtt_mgr {
 	struct ttm_resource_manager manager;
 	struct drm_mm mm;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 0a7611648573..49e4092f447f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -32,8 +32,10 @@
 #include "atom.h"
 
 struct amdgpu_vram_reservation {
-	struct list_head node;
-	struct drm_mm_node mm_node;
+	u64 start;
+	u64 size;
+	struct list_head allocated;
+	struct list_head blocks;
 };
 
 static inline struct amdgpu_vram_mgr *
@@ -186,18 +188,18 @@ const struct attribute_group amdgpu_vram_mgr_attr_group = {
 };
 
 /**
- * amdgpu_vram_mgr_vis_size - Calculate visible node size
+ * amdgpu_vram_mgr_vis_size - Calculate visible block size
  *
  * @adev: amdgpu_device pointer
- * @node: MM node structure
+ * @block: DRM BUDDY block structure
  *
- * Calculate how many bytes of the MM node are inside visible VRAM
+ * Calculate how many bytes of the DRM BUDDY block are inside visible VRAM
  */
 static u64 amdgpu_vram_mgr_vis_size(struct amdgpu_device *adev,
-				    struct drm_mm_node *node)
+				    struct drm_buddy_block *block)
 {
-	uint64_t start = node->start << PAGE_SHIFT;
-	uint64_t end = (node->size + node->start) << PAGE_SHIFT;
+	u64 start = amdgpu_vram_mgr_block_start(block);
+	u64 end = start + amdgpu_vram_mgr_block_size(block);
 
 	if (start >= adev->gmc.visible_vram_size)
 		return 0;
@@ -218,9 +220,9 @@ u64 amdgpu_vram_mgr_bo_visible_size(struct amdgpu_bo *bo)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 	struct ttm_resource *res = bo->tbo.resource;
-	unsigned pages = res->num_pages;
-	struct drm_mm_node *mm;
-	u64 usage;
+	struct amdgpu_vram_mgr_resource *vres = to_amdgpu_vram_mgr_resource(res);
+	struct drm_buddy_block *block;
+	u64 usage = 0;
 
 	if (amdgpu_gmc_vram_full_visible(&adev->gmc))
 		return amdgpu_bo_size(bo);
@@ -228,9 +230,8 @@ u64 amdgpu_vram_mgr_bo_visible_size(struct amdgpu_bo *bo)
 	if (res->start >= adev->gmc.visible_vram_size >> PAGE_SHIFT)
 		return 0;
 
-	mm = &container_of(res, struct ttm_range_mgr_node, base)->mm_nodes[0];
-	for (usage = 0; pages; pages -= mm->size, mm++)
-		usage += amdgpu_vram_mgr_vis_size(adev, mm);
+	list_for_each_entry(block, &vres->blocks, link)
+		usage += amdgpu_vram_mgr_vis_size(adev, block);
 
 	return usage;
 }
@@ -240,23 +241,30 @@ static void amdgpu_vram_mgr_do_reserve(struct ttm_resource_manager *man)
 {
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
-	struct drm_mm *mm = &mgr->mm;
+	struct drm_buddy *mm = &mgr->mm;
 	struct amdgpu_vram_reservation *rsv, *temp;
+	struct drm_buddy_block *block;
 	uint64_t vis_usage;
 
-	list_for_each_entry_safe(rsv, temp, &mgr->reservations_pending, node) {
-		if (drm_mm_reserve_node(mm, &rsv->mm_node))
+	list_for_each_entry_safe(rsv, temp, &mgr->reservations_pending, blocks) {
+		if (drm_buddy_alloc_blocks(mm, rsv->start, rsv->start + rsv->size,
+					   rsv->size, mm->chunk_size, &rsv->allocated,
+					   DRM_BUDDY_RANGE_ALLOCATION))
+			continue;
+
+		block = amdgpu_vram_mgr_first_block(&rsv->allocated);
+		if (!block)
 			continue;
 
 		dev_dbg(adev->dev, "Reservation 0x%llx - %lld, Succeeded\n",
-			rsv->mm_node.start, rsv->mm_node.size);
+			rsv->start, rsv->size);
 
-		vis_usage = amdgpu_vram_mgr_vis_size(adev, &rsv->mm_node);
+		vis_usage = amdgpu_vram_mgr_vis_size(adev, block);
 		atomic64_add(vis_usage, &mgr->vis_usage);
 		spin_lock(&man->bdev->lru_lock);
-		man->usage += rsv->mm_node.size << PAGE_SHIFT;
+		man->usage += rsv->size;
 		spin_unlock(&man->bdev->lru_lock);
-		list_move(&rsv->node, &mgr->reserved_pages);
+		list_move(&rsv->blocks, &mgr->reserved_pages);
 	}
 }
 
@@ -278,14 +286,16 @@ int amdgpu_vram_mgr_reserve_range(struct amdgpu_vram_mgr *mgr,
 	if (!rsv)
 		return -ENOMEM;
 
-	INIT_LIST_HEAD(&rsv->node);
-	rsv->mm_node.start = start >> PAGE_SHIFT;
-	rsv->mm_node.size = size >> PAGE_SHIFT;
+	INIT_LIST_HEAD(&rsv->allocated);
+	INIT_LIST_HEAD(&rsv->blocks);
 
-	spin_lock(&mgr->lock);
-	list_add_tail(&rsv->node, &mgr->reservations_pending);
+	rsv->start = start;
+	rsv->size = size;
+
+	mutex_lock(&mgr->lock);
+	list_add_tail(&rsv->blocks, &mgr->reservations_pending);
 	amdgpu_vram_mgr_do_reserve(&mgr->manager);
-	spin_unlock(&mgr->lock);
+	mutex_unlock(&mgr->lock);
 
 	return 0;
 }
@@ -307,19 +317,19 @@ int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
 	struct amdgpu_vram_reservation *rsv;
 	int ret;
 
-	spin_lock(&mgr->lock);
+	mutex_lock(&mgr->lock);
 
-	list_for_each_entry(rsv, &mgr->reservations_pending, node) {
-		if ((rsv->mm_node.start <= start) &&
-		    (start < (rsv->mm_node.start + rsv->mm_node.size))) {
+	list_for_each_entry(rsv, &mgr->reservations_pending, blocks) {
+		if (rsv->start <= start &&
+		    (start < (rsv->start + rsv->size))) {
 			ret = -EBUSY;
 			goto out;
 		}
 	}
 
-	list_for_each_entry(rsv, &mgr->reserved_pages, node) {
-		if ((rsv->mm_node.start <= start) &&
-		    (start < (rsv->mm_node.start + rsv->mm_node.size))) {
+	list_for_each_entry(rsv, &mgr->reserved_pages, blocks) {
+		if (rsv->start <= start &&
+		    (start < (rsv->start + rsv->size))) {
 			ret = 0;
 			goto out;
 		}
@@ -327,32 +337,10 @@ int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
 
 	ret = -ENOENT;
 out:
-	spin_unlock(&mgr->lock);
+	mutex_unlock(&mgr->lock);
 	return ret;
 }
 
-/**
- * amdgpu_vram_mgr_virt_start - update virtual start address
- *
- * @mem: ttm_resource to update
- * @node: just allocated node
- *
- * Calculate a virtual BO start address to easily check if everything is CPU
- * accessible.
- */
-static void amdgpu_vram_mgr_virt_start(struct ttm_resource *mem,
-				       struct drm_mm_node *node)
-{
-	unsigned long start;
-
-	start = node->start + node->size;
-	if (start > mem->num_pages)
-		start -= mem->num_pages;
-	else
-		start = 0;
-	mem->start = max(mem->start, start);
-}
-
 /**
  * amdgpu_vram_mgr_new - allocate new ranges
  *
@@ -368,46 +356,44 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 			       const struct ttm_place *place,
 			       struct ttm_resource **res)
 {
-	unsigned long lpfn, num_nodes, pages_per_node, pages_left, pages;
+	u64 vis_usage = 0, max_bytes, cur_size, min_block_size;
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
-	uint64_t vis_usage = 0, mem_bytes, max_bytes;
-	struct ttm_range_mgr_node *node;
-	struct drm_mm *mm = &mgr->mm;
-	enum drm_mm_insert_mode mode;
-	unsigned i;
+	struct amdgpu_vram_mgr_resource *vres;
+	u64 size, remaining_size, lpfn, fpfn;
+	struct drm_buddy *mm = &mgr->mm;
+	struct drm_buddy_block *block;
+	unsigned long pages_per_block;
 	int r;
 
-	lpfn = place->lpfn;
+	lpfn = place->lpfn << PAGE_SHIFT;
 	if (!lpfn)
-		lpfn = man->size >> PAGE_SHIFT;
+		lpfn = man->size;
+
+	fpfn = place->fpfn << PAGE_SHIFT;
 
 	max_bytes = adev->gmc.mc_vram_size;
 	if (tbo->type != ttm_bo_type_kernel)
 		max_bytes -= AMDGPU_VM_RESERVED_VRAM;
 
-	mem_bytes = tbo->base.size;
 	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
-		pages_per_node = ~0ul;
-		num_nodes = 1;
+		pages_per_block = ~0ul;
 	} else {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-		pages_per_node = HPAGE_PMD_NR;
+		pages_per_block = HPAGE_PMD_NR;
 #else
 		/* default to 2MB */
-		pages_per_node = 2UL << (20UL - PAGE_SHIFT);
+		pages_per_block = 2UL << (20UL - PAGE_SHIFT);
 #endif
-		pages_per_node = max_t(uint32_t, pages_per_node,
-				       tbo->page_alignment);
-		num_nodes = DIV_ROUND_UP_ULL(PFN_UP(mem_bytes), pages_per_node);
+		pages_per_block = max_t(uint32_t, pages_per_block,
+					tbo->page_alignment);
 	}
 
-	node = kvmalloc(struct_size(node, mm_nodes, num_nodes),
-			GFP_KERNEL | __GFP_ZERO);
-	if (!node)
+	vres = kzalloc(sizeof(*vres), GFP_KERNEL);
+	if (!vres)
 		return -ENOMEM;
 
-	ttm_resource_init(tbo, place, &node->base);
+	ttm_resource_init(tbo, place, &vres->base);
 
 	/* bail out quickly if there's likely not enough VRAM for this BO */
 	if (ttm_resource_manager_usage(man) > max_bytes) {
@@ -415,66 +401,130 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 		goto error_fini;
 	}
 
-	mode = DRM_MM_INSERT_BEST;
+	INIT_LIST_HEAD(&vres->blocks);
+
 	if (place->flags & TTM_PL_FLAG_TOPDOWN)
-		mode = DRM_MM_INSERT_HIGH;
-
-	pages_left = node->base.num_pages;
-
-	/* Limit maximum size to 2GB due to SG table limitations */
-	pages = min(pages_left, 2UL << (30 - PAGE_SHIFT));
-
-	i = 0;
-	spin_lock(&mgr->lock);
-	while (pages_left) {
-		uint32_t alignment = tbo->page_alignment;
-
-		if (pages >= pages_per_node)
-			alignment = pages_per_node;
-
-		r = drm_mm_insert_node_in_range(mm, &node->mm_nodes[i], pages,
-						alignment, 0, place->fpfn,
-						lpfn, mode);
-		if (unlikely(r)) {
-			if (pages > pages_per_node) {
-				if (is_power_of_2(pages))
-					pages = pages / 2;
-				else
-					pages = rounddown_pow_of_two(pages);
-				continue;
+		vres->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
+
+	if (fpfn || lpfn != man->size)
+		/* Allocate blocks in desired range */
+		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
+
+	remaining_size = vres->base.num_pages << PAGE_SHIFT;
+
+	mutex_lock(&mgr->lock);
+	while (remaining_size) {
+		if (tbo->page_alignment)
+			min_block_size = tbo->page_alignment << PAGE_SHIFT;
+		else
+			min_block_size = mgr->default_page_size;
+
+		BUG_ON(min_block_size < mm->chunk_size);
+
+		/* Limit maximum size to 2GiB due to SG table limitations */
+		size = min(remaining_size, 2ULL << 30);
+
+		if (size >= pages_per_block << PAGE_SHIFT)
+			min_block_size = pages_per_block << PAGE_SHIFT;
+
+		cur_size = size;
+
+		if (fpfn + size != place->lpfn << PAGE_SHIFT) {
+			/*
+			 * Except for actual range allocation, modify the size and
+			 * min_block_size conforming to continuous flag enablement
+			 */
+			if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
+				size = roundup_pow_of_two(size);
+				min_block_size = size;
+			/*
+			 * Modify the size value if size is not
+			 * aligned with min_block_size
+			 */
+			} else if (!IS_ALIGNED(size, min_block_size)) {
+				size = round_up(size, min_block_size);
 			}
-			goto error_free;
 		}
 
-		vis_usage += amdgpu_vram_mgr_vis_size(adev, &node->mm_nodes[i]);
-		amdgpu_vram_mgr_virt_start(&node->base, &node->mm_nodes[i]);
-		pages_left -= pages;
-		++i;
+		r = drm_buddy_alloc_blocks(mm, fpfn,
+					   lpfn,
+					   size,
+					   min_block_size,
+					   &vres->blocks,
+					   vres->flags);
+		if (unlikely(r))
+			goto error_free_blocks;
+
+		if (size > remaining_size)
+			remaining_size = 0;
+		else
+			remaining_size -= size;
+	}
+	mutex_unlock(&mgr->lock);
+
+	if (cur_size != size) {
+		struct drm_buddy_block *block;
+		struct list_head *trim_list;
+		u64 original_size;
+		LIST_HEAD(temp);
+
+		trim_list = &vres->blocks;
+		original_size = vres->base.num_pages << PAGE_SHIFT;
+
+		/*
+		 * If size value is rounded up to min_block_size, trim the last
+		 * block to the required size
+		 */
+		if (!list_is_singular(&vres->blocks)) {
+			block = list_last_entry(&vres->blocks, typeof(*block), link);
+			list_move_tail(&block->link, &temp);
+			trim_list = &temp;
+			/*
+			 * Compute the original_size value by subtracting the
+			 * last block size with (aligned size - original size)
+			 */
+			original_size = amdgpu_vram_mgr_block_size(block) - (size - cur_size);
+		}
 
-		if (pages > pages_left)
-			pages = pages_left;
+		mutex_lock(&mgr->lock);
+		drm_buddy_block_trim(mm,
+				     original_size,
+				     trim_list);
+		mutex_unlock(&mgr->lock);
+
+		if (!list_empty(&temp))
+			list_splice_tail(trim_list, &vres->blocks);
+	}
+
+	list_for_each_entry(block, &vres->blocks, link)
+		vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
+
+	block = amdgpu_vram_mgr_first_block(&vres->blocks);
+	if (!block) {
+		r = -EINVAL;
+		goto error_fini;
 	}
-	spin_unlock(&mgr->lock);
 
-	if (i == 1)
-		node->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
+	vres->base.start = amdgpu_vram_mgr_block_start(block) >> PAGE_SHIFT;
+
+	if (amdgpu_is_vram_mgr_blocks_contiguous(&vres->blocks))
+		vres->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
 
 	if (adev->gmc.xgmi.connected_to_cpu)
-		node->base.bus.caching = ttm_cached;
+		vres->base.bus.caching = ttm_cached;
 	else
-		node->base.bus.caching = ttm_write_combined;
+		vres->base.bus.caching = ttm_write_combined;
 
 	atomic64_add(vis_usage, &mgr->vis_usage);
-	*res = &node->base;
+	*res = &vres->base;
 	return 0;
 
-error_free:
-	while (i--)
-		drm_mm_remove_node(&node->mm_nodes[i]);
-	spin_unlock(&mgr->lock);
+error_free_blocks:
+	drm_buddy_free_list(mm, &vres->blocks);
+	mutex_unlock(&mgr->lock);
 error_fini:
-	ttm_resource_fini(man, &node->base);
-	kvfree(node);
+	ttm_resource_fini(man, &vres->base);
+	kfree(vres);
 
 	return r;
 }
@@ -490,27 +540,26 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
 				struct ttm_resource *res)
 {
-	struct ttm_range_mgr_node *node = to_ttm_range_mgr_node(res);
+	struct amdgpu_vram_mgr_resource *vres = to_amdgpu_vram_mgr_resource(res);
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
+	struct drm_buddy *mm = &mgr->mm;
+	struct drm_buddy_block *block;
 	uint64_t vis_usage = 0;
-	unsigned i, pages;
 
-	spin_lock(&mgr->lock);
-	for (i = 0, pages = res->num_pages; pages;
-	     pages -= node->mm_nodes[i].size, ++i) {
-		struct drm_mm_node *mm = &node->mm_nodes[i];
+	mutex_lock(&mgr->lock);
+	list_for_each_entry(block, &vres->blocks, link)
+		vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
 
-		drm_mm_remove_node(mm);
-		vis_usage += amdgpu_vram_mgr_vis_size(adev, mm);
-	}
 	amdgpu_vram_mgr_do_reserve(man);
-	spin_unlock(&mgr->lock);
+
+	drm_buddy_free_list(mm, &vres->blocks);
+	mutex_unlock(&mgr->lock);
 
 	atomic64_sub(vis_usage, &mgr->vis_usage);
 
 	ttm_resource_fini(man, res);
-	kvfree(node);
+	kfree(vres);
 }
 
 /**
@@ -542,7 +591,7 @@ int amdgpu_vram_mgr_alloc_sgt(struct amdgpu_device *adev,
 	if (!*sgt)
 		return -ENOMEM;
 
-	/* Determine the number of DRM_MM nodes to export */
+	/* Determine the number of DRM_BUDDY blocks to export */
 	amdgpu_res_first(res, offset, length, &cursor);
 	while (cursor.remaining) {
 		num_entries++;
@@ -558,10 +607,10 @@ int amdgpu_vram_mgr_alloc_sgt(struct amdgpu_device *adev,
 		sg->length = 0;
 
 	/*
-	 * Walk down DRM_MM nodes to populate scatterlist nodes
-	 * @note: Use iterator api to get first the DRM_MM node
+	 * Walk down DRM_BUDDY blocks to populate scatterlist nodes
+	 * @note: Use iterator api to get first the DRM_BUDDY block
 	 * and the number of bytes from it. Access the following
-	 * DRM_MM node(s) if more buffer needs to exported
+	 * DRM_BUDDY block(s) if more buffer needs to exported
 	 */
 	amdgpu_res_first(res, offset, length, &cursor);
 	for_each_sgtable_sg((*sgt), sg, i) {
@@ -648,13 +697,22 @@ static void amdgpu_vram_mgr_debug(struct ttm_resource_manager *man,
 				  struct drm_printer *printer)
 {
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
+	struct drm_buddy *mm = &mgr->mm;
+	struct drm_buddy_block *block;
 
 	drm_printf(printer, "  vis usage:%llu\n",
 		   amdgpu_vram_mgr_vis_usage(mgr));
 
-	spin_lock(&mgr->lock);
-	drm_mm_print(&mgr->mm, printer);
-	spin_unlock(&mgr->lock);
+	mutex_lock(&mgr->lock);
+	drm_printf(printer, "default_page_size: %lluKiB\n",
+		   mgr->default_page_size >> 10);
+
+	drm_buddy_print(mm, printer);
+
+	drm_printf(printer, "reserved:\n");
+	list_for_each_entry(block, &mgr->reserved_pages, link)
+		drm_buddy_block_print(mm, block, printer);
+	mutex_unlock(&mgr->lock);
 }
 
 static const struct ttm_resource_manager_func amdgpu_vram_mgr_func = {
@@ -674,16 +732,21 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 {
 	struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
 	struct ttm_resource_manager *man = &mgr->manager;
+	int err;
 
 	ttm_resource_manager_init(man, &adev->mman.bdev,
 				  adev->gmc.real_vram_size);
 
 	man->func = &amdgpu_vram_mgr_func;
 
-	drm_mm_init(&mgr->mm, 0, man->size >> PAGE_SHIFT);
-	spin_lock_init(&mgr->lock);
+	err = drm_buddy_init(&mgr->mm, man->size, PAGE_SIZE);
+	if (err)
+		return err;
+
+	mutex_init(&mgr->lock);
 	INIT_LIST_HEAD(&mgr->reservations_pending);
 	INIT_LIST_HEAD(&mgr->reserved_pages);
+	mgr->default_page_size = PAGE_SIZE;
 
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, &mgr->manager);
 	ttm_resource_manager_set_used(man, true);
@@ -711,16 +774,16 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
 	if (ret)
 		return;
 
-	spin_lock(&mgr->lock);
-	list_for_each_entry_safe(rsv, temp, &mgr->reservations_pending, node)
+	mutex_lock(&mgr->lock);
+	list_for_each_entry_safe(rsv, temp, &mgr->reservations_pending, blocks)
 		kfree(rsv);
 
-	list_for_each_entry_safe(rsv, temp, &mgr->reserved_pages, node) {
-		drm_mm_remove_node(&rsv->mm_node);
+	list_for_each_entry_safe(rsv, temp, &mgr->reserved_pages, blocks) {
+		drm_buddy_free_list(&mgr->mm, &rsv->blocks);
 		kfree(rsv);
 	}
-	drm_mm_takedown(&mgr->mm);
-	spin_unlock(&mgr->lock);
+	drm_buddy_fini(&mgr->mm);
+	mutex_unlock(&mgr->lock);
 
 	ttm_resource_manager_cleanup(man);
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, NULL);

base-commit: bc38e5d45dd513fa384bbedab3c0749f2e46771b
-- 
2.25.1

