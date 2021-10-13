Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C07442C18B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 15:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25AF66EA60;
	Wed, 13 Oct 2021 13:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECBF6E0EE;
 Wed, 13 Oct 2021 13:36:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5TpbDLP+j5SS0tsrUR/P3jdBbXFV2tqoB2FJA88MpHHHaEXHebd7EecVos0PoI2g4yHKYp7uQ1igt7f8DGW0/9qymjWp6RUhTEaqnLGtVfzGljbfFKE54drv2t2WldTe5pm68Ly/OrTor2JcNBBLucYBaLhiAmEZHYXxEsWF7WlVrdfdr22Ul/fYAeZw3UjYJklKuaPNiBiP6PC42yAVeG8hAi2wo8c0Hpye+7jaHNKhv6xsSkPp3xrRQl6Wfh7ODbZ5J279XypRjrBNZWErY4PB98PSmYqRU+DJX2bLYsGH57DxfkZc2bdra+yAwYrZaHRl7AMQx+zfIrvicBmLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94CpWIMLD3Di/cNd8RU3/nmEQ0PfQyIbfEJEXBCT0pg=;
 b=aooAvHZkR+z+4TGQNPdvF0tHgrSZd+jaGb9MBJaATlXP5SHg6MMcGBGWIUAcl0guxQTKmr0KzZXiAHlTVLWIK6ILtHBrE+qwOC6XmSJTqli3GqOIooeOqb4Xe2cRI19hE7gB6h7sH0PVkwssekEhvozikDgA3yGqGu02F7AriyqGy5W8x2UFNrvOp3xcorkdtJUl2pAKtgTAqo1P5Y6r3IUOL1Ewix580w94Wu2qLrHvajkoOzl/kOzMkLHNyQMK3JsH1VletySzkxSghyzwj+uaiiV8Qd+h/41HwlNiReMn2l9cSDvg4PbSo/sS3HA8wxbMz4BCt5ZaEpkTyKhVww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94CpWIMLD3Di/cNd8RU3/nmEQ0PfQyIbfEJEXBCT0pg=;
 b=mbQmIQPOgHOyRA8xyf3Q2ksJ2MW5SvpT26dOSPMxabU8MYKLWNCZ1wi7q6ARGMZt5b2vsLhq4plULzUdmu9X6nwzibko6U2b3AskPS04cQ+N0qnGLa0/W9W6/FxGHbO1ytETtdWCDEpmb8x3Jjth7F4d8UbsffB72p7LnPbHUSI=
Received: from BN9PR03CA0468.namprd03.prod.outlook.com (2603:10b6:408:139::23)
 by MN2PR12MB4000.namprd12.prod.outlook.com (2603:10b6:208:16b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Wed, 13 Oct
 2021 13:36:44 +0000
Received: from BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::7a) by BN9PR03CA0468.outlook.office365.com
 (2603:10b6:408:139::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Wed, 13 Oct 2021 13:36:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT038.mail.protection.outlook.com (10.13.176.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Wed, 13 Oct 2021 13:36:43 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Wed, 13 Oct
 2021 08:36:40 -0500
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <matthew.auld@intel.com>, <daniel@ffwll.ch>, Arunpravin
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 1/3] drm:Enable buddy allocator support
Date: Wed, 13 Oct 2021 19:05:34 +0530
Message-ID: <20211013133534.142948-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7093d749-671e-4a4b-ff80-08d98e4e7f09
X-MS-TrafficTypeDiagnostic: MN2PR12MB4000:
X-Microsoft-Antispam-PRVS: <MN2PR12MB40002E1DD20F26C3C7E43B85E4B79@MN2PR12MB4000.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:393;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jvOgzunfYTOo5Pnj6TjcWZRtiqU8HvaR9fPbv8cpKcfxwe8lviPMfpuf1ztgHUH/ftOo3FJzDah/qFfH8JuXtrZ/l7dTfsZyiiw732BbWlmXBQ2xs4ucafF4XCF762UQV98vcaTp2w4IR0ZkvfnZz8MCmdqJXVYHJ0u8qOrSy5BXhScJfA7Aag/MZwNWpdKO3bSldHXIuLTT6UqiO5zHrFUKFvlc3eIY51QlwhVML6FR1AxVZ/DnHOEeHJwsyyWngawwr4pqfbOTXf5LmSdjIF/DjJy+yX1XaV1Dm5tU1UDkJXpcZPc/WPNI1XalgxEoZf75SJ3Z980K01CrCnIGMV07KcCAFmN/fnHFEZBqO4BBGLTlEdrVjNtF0gUPnqrmXyUFeyiDBSyQb5iWOVTtzksk/EwtjZcWqin+c5GLAl5maXGbiuByPwQ508v6Uka5w+xPt2qWUseRMmFnAfOmV7w6Vhr3fc14Tcpqcj1a5ojX/AbY4MAkBGCUMSBtM0pePmVuwI+uSC/R06RpyaxRJlC5JPSqwUMgr197sZJBDJMb/EkqGpgHe5UtJXdTYqVUenYiUrhpYCpJiHbpKNzRRasSDbRULB/jsZH/n3nh/Y5OsI/7q5xGgpDs9WUIdjlaaeoaKcKaBQIVnrWsQ1JdBls85ocEm+LlT1mBAa0WpUF3Uq1VynK9lsY/9LHQDrGMuOisxf2EyQ8qsmhjrqEOu1IPd8C+u0iNx+P8pp/0DzlCQx5U2AHU0GSzQXyvk2khLppSXaRORPeMzrPqHF8n0Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(82310400003)(36756003)(86362001)(5660300002)(47076005)(7696005)(1076003)(356005)(26005)(426003)(16526019)(54906003)(2616005)(83380400001)(8676002)(30864003)(8936002)(186003)(70586007)(110136005)(2906002)(316002)(4326008)(6666004)(81166007)(508600001)(70206006)(336012)(36860700001)(134034003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 13:36:43.9151 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7093d749-671e-4a4b-ff80-08d98e4e7f09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4000
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

Port Intel buddy manager to drm root folder
Implemented range allocation support for the provided order
Implemented TOP-DOWN support
Implemented freeing up unused pages on contiguous allocation
Moved range allocation and freelist pickup into a single function

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/Makefile    |   2 +-
 drivers/gpu/drm/drm_buddy.c | 705 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_drv.c   |   3 +
 include/drm/drm_buddy.h     | 157 ++++++++
 4 files changed, 866 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/drm_buddy.c
 create mode 100644 include/drm/drm_buddy.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index a118692a6df7..fe1a2fc09675 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -18,7 +18,7 @@ drm-y       :=	drm_aperture.o drm_auth.o drm_cache.o \
 		drm_dumb_buffers.o drm_mode_config.o drm_vblank.o \
 		drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
 		drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o \
-		drm_managed.o drm_vblank_work.o
+		drm_managed.o drm_vblank_work.o drm_buddy.o
 
 drm-$(CONFIG_DRM_LEGACY) += drm_agpsupport.o drm_bufs.o drm_context.o drm_dma.o \
 			    drm_legacy_misc.o drm_lock.o drm_memory.o drm_scatter.o \
diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
new file mode 100644
index 000000000000..8cd118574665
--- /dev/null
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -0,0 +1,705 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright Â© 2021 Intel Corporation
+ */
+
+#include <linux/kmemleak.h>
+#include <linux/sizes.h>
+
+#include <drm/drm_buddy.h>
+
+static struct kmem_cache *slab_blocks;
+
+static struct drm_buddy_block *drm_block_alloc(struct drm_buddy_mm *mm,
+					       struct drm_buddy_block *parent,
+					       unsigned int order,
+					       u64 offset)
+{
+	struct drm_buddy_block *block;
+
+	BUG_ON(order > DRM_BUDDY_MAX_ORDER);
+
+	block = kmem_cache_zalloc(slab_blocks, GFP_KERNEL);
+	if (!block)
+		return NULL;
+
+	block->header = offset;
+	block->header |= order;
+	block->parent = parent;
+
+	BUG_ON(block->header & DRM_BUDDY_HEADER_UNUSED);
+	return block;
+}
+
+static void drm_block_free(struct drm_buddy_mm *mm,
+			   struct drm_buddy_block *block)
+{
+	kmem_cache_free(slab_blocks, block);
+}
+
+static void mark_allocated(struct drm_buddy_block *block)
+{
+	block->header &= ~DRM_BUDDY_HEADER_STATE;
+	block->header |= DRM_BUDDY_ALLOCATED;
+
+	list_del(&block->link);
+}
+
+static void mark_free(struct drm_buddy_mm *mm,
+		      struct drm_buddy_block *block)
+{
+	block->header &= ~DRM_BUDDY_HEADER_STATE;
+	block->header |= DRM_BUDDY_FREE;
+
+	list_add(&block->link,
+		&mm->free_list[drm_buddy_block_order(block)]);
+}
+
+static void mark_split(struct drm_buddy_block *block)
+{
+	block->header &= ~DRM_BUDDY_HEADER_STATE;
+	block->header |= DRM_BUDDY_SPLIT;
+
+	list_del(&block->link);
+}
+
+/**
+ * drm_buddy_init - init memory manager
+ *
+ * @mm: DRM buddy manager to initialize
+ * @size: size in bytes to manage
+ * @chunk_size: minimum page size in bytes for our allocations
+ *
+ * Initializes the memory manager and its resources.
+ *
+ * Returns:
+ * 0 on success, error code on failure.
+ */
+int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size)
+{
+	unsigned int i;
+	u64 offset;
+
+	if (size < chunk_size)
+		return -EINVAL;
+
+	if (chunk_size < PAGE_SIZE)
+		return -EINVAL;
+
+	if (!is_power_of_2(chunk_size))
+		return -EINVAL;
+
+	size = round_down(size, chunk_size);
+
+	mm->size = size;
+	mm->avail = size;
+	mm->chunk_size = chunk_size;
+	mm->max_order = ilog2(size) - ilog2(chunk_size);
+
+	BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
+
+	mm->free_list = kmalloc_array(mm->max_order + 1,
+				      sizeof(struct list_head),
+				      GFP_KERNEL);
+	if (!mm->free_list)
+		return -ENOMEM;
+
+	for (i = 0; i <= mm->max_order; ++i)
+		INIT_LIST_HEAD(&mm->free_list[i]);
+
+	mm->n_roots = hweight64(size);
+
+	mm->roots = kmalloc_array(mm->n_roots,
+				  sizeof(struct drm_buddy_block *),
+				  GFP_KERNEL);
+	if (!mm->roots)
+		goto out_free_list;
+
+	offset = 0;
+	i = 0;
+
+	/*
+	 * Split into power-of-two blocks, in case we are given a size that is
+	 * not itself a power-of-two.
+	 */
+	do {
+		struct drm_buddy_block *root;
+		unsigned int order;
+		u64 root_size;
+
+		root_size = rounddown_pow_of_two(size);
+		order = ilog2(root_size) - ilog2(chunk_size);
+
+		root = drm_block_alloc(mm, NULL, order, offset);
+		if (!root)
+			goto out_free_roots;
+
+		mark_free(mm, root);
+
+		BUG_ON(i > mm->max_order);
+		BUG_ON(drm_buddy_block_size(mm, root) < chunk_size);
+
+		mm->roots[i] = root;
+
+		offset += root_size;
+		size -= root_size;
+		i++;
+	} while (size);
+
+	return 0;
+
+out_free_roots:
+	while (i--)
+		drm_block_free(mm, mm->roots[i]);
+	kfree(mm->roots);
+out_free_list:
+	kfree(mm->free_list);
+	return -ENOMEM;
+}
+EXPORT_SYMBOL(drm_buddy_init);
+
+/**
+ * drm_buddy_fini - tear down the memory manager
+ *
+ * @mm: DRM buddy manager to free
+ *
+ * Cleanup memory manager resources and the freelist
+ */
+void drm_buddy_fini(struct drm_buddy_mm *mm)
+{
+	int i;
+
+	for (i = 0; i < mm->n_roots; ++i) {
+		WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
+		drm_block_free(mm, mm->roots[i]);
+	}
+
+	WARN_ON(mm->avail != mm->size);
+
+	kfree(mm->roots);
+	kfree(mm->free_list);
+	kmem_cache_destroy(slab_blocks);
+}
+EXPORT_SYMBOL(drm_buddy_fini);
+
+static int split_block(struct drm_buddy_mm *mm,
+		       struct drm_buddy_block *block)
+{
+	unsigned int block_order = drm_buddy_block_order(block) - 1;
+	u64 offset = drm_buddy_block_offset(block);
+
+	BUG_ON(!drm_buddy_block_is_free(block));
+	BUG_ON(!drm_buddy_block_order(block));
+
+	block->left = drm_block_alloc(mm, block, block_order, offset);
+	if (!block->left)
+		return -ENOMEM;
+
+	block->right = drm_block_alloc(mm, block, block_order,
+					offset + (mm->chunk_size << block_order));
+	if (!block->right) {
+		drm_block_free(mm, block->left);
+		return -ENOMEM;
+	}
+
+	mark_free(mm, block->left);
+	mark_free(mm, block->right);
+
+	mark_split(block);
+
+	return 0;
+}
+
+static struct drm_buddy_block *
+get_buddy(struct drm_buddy_block *block)
+{
+	struct drm_buddy_block *parent;
+
+	parent = block->parent;
+	if (!parent)
+		return NULL;
+
+	if (parent->left == block)
+		return parent->right;
+
+	return parent->left;
+}
+
+static void __drm_buddy_free(struct drm_buddy_mm *mm,
+			     struct drm_buddy_block *block)
+{
+	struct drm_buddy_block *parent;
+
+	while ((parent = block->parent)) {
+		struct drm_buddy_block *buddy;
+
+		buddy = get_buddy(block);
+
+		if (!drm_buddy_block_is_free(buddy))
+			break;
+
+		list_del(&buddy->link);
+
+		drm_block_free(mm, block);
+		drm_block_free(mm, buddy);
+
+		block = parent;
+	}
+
+	mark_free(mm, block);
+}
+
+static void drm_buddy_free(struct drm_buddy_mm *mm,
+			   struct drm_buddy_block *block)
+{
+	BUG_ON(!drm_buddy_block_is_allocated(block));
+	mm->avail += drm_buddy_block_size(mm, block);
+	__drm_buddy_free(mm, block);
+}
+
+/**
+ * drm_buddy_free_list - free blocks from the input list
+ *
+ * @mm: DRM buddy manager
+ * @objects: input list head to free blocks
+ *
+ * drm_buddy_free() called for to free all the blocks
+ * in the list and on each block it looks at the buddy block
+ * and if it is free, coalesce and reforms to a larger block.
+ */
+void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects)
+{
+	struct drm_buddy_block *block, *on;
+
+	list_for_each_entry_safe(block, on, objects, link) {
+		drm_buddy_free(mm, block);
+		cond_resched();
+	}
+	INIT_LIST_HEAD(objects);
+}
+EXPORT_SYMBOL(drm_buddy_free_list);
+
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
+/**
+ * drm_buddy_free_unused_pages - free unused pages
+ *
+ * @mm: DRM buddy manager
+ * @actual_size: original size requested
+ * @blocks: output list head to add allocated blocks
+ *
+ * For contiguous allocation, we round up the size to the nearest
+ * power of two value, applications use *exact* size, remaining
+ * portions are unused and it can freed.
+ *
+ * Returns:
+ * 0 on success, error code on failure.
+ */
+int drm_buddy_free_unused_pages(struct drm_buddy_mm *mm,
+				u64 actual_size,
+				struct list_head *blocks)
+{
+	struct drm_buddy_block *block;
+	struct drm_buddy_block *buddy;
+	u64 actual_start;
+	u64 actual_end;
+	LIST_HEAD(dfs);
+	u64 count = 0;
+	int err;
+
+	if (!list_is_singular(blocks))
+		return -EINVAL;
+
+	block = list_first_entry_or_null(blocks,
+					 struct drm_buddy_block,
+					 link);
+
+	if (!block)
+		return -EINVAL;
+
+	if (actual_size > drm_buddy_block_size(mm, block))
+		return -EINVAL;
+
+	if (actual_size == drm_buddy_block_size(mm, block))
+		return 0;
+
+	list_del(&block->link);
+
+	actual_start = drm_buddy_block_offset(block);
+	actual_end = actual_start + actual_size - 1;
+
+	if (drm_buddy_block_is_allocated(block))
+		mark_free(mm, block);
+
+	list_add(&block->tmp_link, &dfs);
+
+	while (1) {
+		block = list_first_entry_or_null(&dfs,
+						 struct drm_buddy_block,
+						 tmp_link);
+
+		if (!block)
+			break;
+
+		list_del(&block->tmp_link);
+
+		if (count == actual_size)
+			return 0;
+
+		if (contains(actual_start, actual_end, drm_buddy_block_offset(block),
+			(drm_buddy_block_offset(block) + drm_buddy_block_size(mm, block) - 1))) {
+			BUG_ON(!drm_buddy_block_is_free(block));
+			/* Allocate only required blocks */
+			mark_allocated(block);
+			mm->avail -= drm_buddy_block_size(mm, block);
+			list_add_tail(&block->link, blocks);
+			count += drm_buddy_block_size(mm, block);
+			continue;
+		}
+
+		if (drm_buddy_block_order(block) == 0)
+			continue;
+
+		if (!drm_buddy_block_is_split(block)) {
+			err = split_block(mm, block);
+
+			if (unlikely(err))
+				goto err_undo;
+		}
+
+		list_add(&block->right->tmp_link, &dfs);
+		list_add(&block->left->tmp_link, &dfs);
+	}
+
+	return -ENOSPC;
+
+err_undo:
+	buddy = get_buddy(block);
+	if (buddy &&
+	    (drm_buddy_block_is_free(block) &&
+	     drm_buddy_block_is_free(buddy)))
+		__drm_buddy_free(mm, block);
+	return err;
+}
+EXPORT_SYMBOL(drm_buddy_free_unused_pages);
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
+get_maxblock(struct list_head *head)
+{
+	struct drm_buddy_block *max_block = NULL, *node;
+
+	max_block = list_first_entry_or_null(head,
+					     struct drm_buddy_block,
+					     link);
+	if (!max_block)
+		return NULL;
+
+	list_for_each_entry(node, head, link) {
+		if (drm_buddy_block_offset(node) >
+				drm_buddy_block_offset(max_block))
+			max_block = node;
+	}
+
+	return max_block;
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
+		if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
+			if (!list_empty(&mm->free_list[i])) {
+				block = get_maxblock(&mm->free_list[i]);
+
+				if (block)
+					break;
+			}
+		} else {
+			if (!list_empty(&mm->free_list[i])) {
+				block = list_first_entry_or_null(&mm->free_list[i],
+								 struct drm_buddy_block,
+								 link);
+
+				if (block)
+					break;
+			}
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
+
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
+ * alloc_range() called for range limitations, which traverses
+ * the binary tree and picks the desired block, intended for
+ * allocating portions of CPU mappable region and for
+ * pre-allocating portions of the address space, for example to
+ * reserve a block for the initial framebuffer.
+ *
+ * alloc_from_freelist() called for *no* range restrictions,
+ * which easy picks the block from the freelist.
+ *
+ * we allocate blocks in order, order value here translates to:
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
+	if (!IS_ALIGNED(size | start, mm->chunk_size))
+		return -EINVAL;
+
+	if (check_range_overflow(start, size, mm->size))
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
+}
+EXPORT_SYMBOL(drm_buddy_alloc);
+
+/**
+ * drm_buddy_block_print - print block information
+ *
+ * @mm: DRM buddy manager
+ * @block: DRM buddy block
+ * @p: DRM printer to use
+ */
+void drm_buddy_block_print(struct drm_buddy_mm *mm,
+			   struct drm_buddy_block *block,
+			   struct drm_printer *p)
+{
+	u64 start = drm_buddy_block_offset(block);
+	u64 size = drm_buddy_block_size(mm, block);
+
+	drm_printf(p, "%#018llx-%#018llx: %llu\n", start, start + size, size);
+}
+EXPORT_SYMBOL(drm_buddy_block_print);
+
+/**
+ * drm_buddy_print - print allocator state
+ *
+ * @mm: DRM buddy manager
+ * @p: DRM printer to use
+ */
+void drm_buddy_print(struct drm_buddy_mm *mm, struct drm_printer *p)
+{
+	int order;
+
+	drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: %lluMiB\n",
+		   mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20);
+
+	for (order = mm->max_order; order >= 0; order--) {
+		struct drm_buddy_block *block;
+		u64 count = 0, free;
+
+		list_for_each_entry(block, &mm->free_list[order], link) {
+			BUG_ON(!drm_buddy_block_is_free(block));
+			count++;
+		}
+
+		drm_printf(p, "order-%d ", order);
+
+		free = count * (mm->chunk_size << order);
+		if (free < SZ_1M)
+			drm_printf(p, "free: %lluKiB", free >> 10);
+		else
+			drm_printf(p, "free: %lluMiB", free >> 20);
+
+		drm_printf(p, ", pages: %llu\n", count);
+	}
+}
+EXPORT_SYMBOL(drm_buddy_print);
+
+void drm_buddy_module_exit(void)
+{
+	kmem_cache_destroy(slab_blocks);
+}
+
+int __init drm_buddy_module_init(void)
+{
+	slab_blocks = KMEM_CACHE(drm_buddy_block, 0);
+	if (!slab_blocks)
+		return -ENOMEM;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 8804ec7d3215..2d2462aa8d52 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -43,6 +43,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_mode_object.h>
 #include <drm/drm_print.h>
+#include <drm/drm_buddy.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
@@ -1034,6 +1035,7 @@ static void drm_core_exit(void)
 	drm_sysfs_destroy();
 	idr_destroy(&drm_minors_idr);
 	drm_connector_ida_destroy();
+	drm_buddy_module_exit();
 }
 
 static int __init drm_core_init(void)
@@ -1043,6 +1045,7 @@ static int __init drm_core_init(void)
 	drm_connector_ida_init();
 	idr_init(&drm_minors_idr);
 	drm_memcpy_init_early();
+	drm_buddy_module_init();
 
 	ret = drm_sysfs_init();
 	if (ret < 0) {
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
new file mode 100644
index 000000000000..e5a9a8cfdf42
--- /dev/null
+++ b/include/drm/drm_buddy.h
@@ -0,0 +1,157 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#ifndef __DRM_BUDDY_H__
+#define __DRM_BUDDY_H__
+
+#include <linux/bitops.h>
+#include <linux/list.h>
+#include <linux/slab.h>
+#include <linux/sched.h>
+
+#include <drm/drm_print.h>
+
+#define check_range_overflow(start, size, max) ({ \
+	typeof(start) start__ = (start); \
+	typeof(size) size__ = (size); \
+	typeof(max) max__ = (max); \
+	(void)(&start__ == &size__); \
+	(void)(&start__ == &max__); \
+	start__ >= max__ || size__ > max__ - start__; \
+})
+
+#define DRM_BUDDY_TOPDOWN_ALLOCATION (1 << 0)
+#define DRM_BUDDY_RANGE_ALLOCATION (1 << 1)
+
+struct drm_buddy_block {
+#define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
+#define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
+#define   DRM_BUDDY_ALLOCATED	   (1 << 10)
+#define   DRM_BUDDY_FREE	   (2 << 10)
+#define   DRM_BUDDY_SPLIT	   (3 << 10)
+/* Free to be used, if needed in the future */
+#define DRM_BUDDY_HEADER_UNUSED GENMASK_ULL(9, 6)
+#define DRM_BUDDY_HEADER_ORDER  GENMASK_ULL(5, 0)
+	u64 header;
+
+	struct drm_buddy_block *left;
+	struct drm_buddy_block *right;
+	struct drm_buddy_block *parent;
+
+	void *private; /* owned by creator */
+
+	/*
+	 * While the block is allocated by the user through drm_buddy_alloc*,
+	 * the user has ownership of the link, for example to maintain within
+	 * a list, if so desired. As soon as the block is freed with
+	 * drm_buddy_free* ownership is given back to the mm.
+	 */
+	struct list_head link;
+	struct list_head tmp_link;
+};
+
+/* Order-zero must be at least PAGE_SIZE */
+#define DRM_BUDDY_MAX_ORDER (63 - PAGE_SHIFT)
+
+/*
+ * Binary Buddy System.
+ *
+ * Locking should be handled by the user, a simple mutex around
+ * drm_buddy_alloc* and drm_buddy_free* should suffice.
+ */
+struct drm_buddy_mm {
+	/* Maintain a free list for each order. */
+	struct list_head *free_list;
+
+	/*
+	 * Maintain explicit binary tree(s) to track the allocation of the
+	 * address space. This gives us a simple way of finding a buddy block
+	 * and performing the potentially recursive merge step when freeing a
+	 * block.  Nodes are either allocated or free, in which case they will
+	 * also exist on the respective free list.
+	 */
+	struct drm_buddy_block **roots;
+
+	/*
+	 * Anything from here is public, and remains static for the lifetime of
+	 * the mm. Everything above is considered do-not-touch.
+	 */
+	unsigned int n_roots;
+	unsigned int max_order;
+
+	/* Must be at least PAGE_SIZE */
+	u64 chunk_size;
+	u64 size;
+	u64 avail;
+};
+
+static inline u64
+drm_buddy_block_offset(struct drm_buddy_block *block)
+{
+	return block->header & DRM_BUDDY_HEADER_OFFSET;
+}
+
+static inline unsigned int
+drm_buddy_block_order(struct drm_buddy_block *block)
+{
+	return block->header & DRM_BUDDY_HEADER_ORDER;
+}
+
+static inline unsigned int
+drm_buddy_block_state(struct drm_buddy_block *block)
+{
+	return block->header & DRM_BUDDY_HEADER_STATE;
+}
+
+static inline bool
+drm_buddy_block_is_allocated(struct drm_buddy_block *block)
+{
+	return drm_buddy_block_state(block) == DRM_BUDDY_ALLOCATED;
+}
+
+static inline bool
+drm_buddy_block_is_free(struct drm_buddy_block *block)
+{
+	return drm_buddy_block_state(block) == DRM_BUDDY_FREE;
+}
+
+static inline bool
+drm_buddy_block_is_split(struct drm_buddy_block *block)
+{
+	return drm_buddy_block_state(block) == DRM_BUDDY_SPLIT;
+}
+
+static inline u64
+drm_buddy_block_size(struct drm_buddy_mm *mm,
+		     struct drm_buddy_block *block)
+{
+	return mm->chunk_size << drm_buddy_block_order(block);
+}
+
+int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size);
+
+void drm_buddy_fini(struct drm_buddy_mm *mm);
+
+int drm_buddy_alloc(struct drm_buddy_mm *mm,
+		    u64 start, u64 end, u64 size,
+		    u64 min_page_size,
+		    struct list_head *blocks,
+		    unsigned long flags);
+
+int drm_buddy_free_unused_pages(struct drm_buddy_mm *mm,
+				u64 actual_size,
+				struct list_head *blocks);
+
+void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects);
+
+void drm_buddy_print(struct drm_buddy_mm *mm, struct drm_printer *p);
+void drm_buddy_block_print(struct drm_buddy_mm *mm,
+			   struct drm_buddy_block *block,
+			   struct drm_printer *p);
+
+void drm_buddy_module_exit(void);
+int drm_buddy_module_init(void);
+
+#endif
-- 
2.25.1

