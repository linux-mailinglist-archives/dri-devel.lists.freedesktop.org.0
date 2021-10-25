Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6025C4396FA
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 15:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770A589FD4;
	Mon, 25 Oct 2021 13:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2081.outbound.protection.outlook.com [40.107.236.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4BF89FA5;
 Mon, 25 Oct 2021 13:01:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eA9Yo6lELHdVVu6GymuYn3Mc/9gkl9yV3ItKEhFR5G1hLUpY4Ca5CajdM7r5a1RR1SuRY6t6tDUvjfViE6/99QhJsnMil3aBUOS76bqVGEoQvC4qsK07u9wL2ZeZ20rDy2OwtopKQsVKW0r+RdGcySidp6n5IjUP+Pp4CokFXJ4anb5KqKu+nR1NbFE12vEhcF+cfNw9RDqvi8McXLjR42sqy9JueQ+YnqNsDC/7eMoL07Mb5iYM8JA7g2AXosJ1vPZJGXk5tfG3vOsaEnoxycnOJ77zdT3Cp3UTpzwX0EXCk792m7Viu3rUOtnc/HEpyOh+arXiKTQNzsEphyB+HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Upa47IQxGMdOxtXkoqtF/jrYO06ZAMVag+E9dURRfxg=;
 b=CqOGcI+QO85+NR95oX526MbynJAk4JN5k9d9FgXng69H2vpogDYTsYU2qOVixRXXpAyNwqwILLkVEKJqbd+cztiYqcjR3bjwZM8/XJJU8UsORbTRWME8kgTGpneMVGta9qA7U20I+GFlAJ7Ja1DKXyHgFirt3DZ3QcKZZZEIoLnnKOBbD7M6Ml/fjCJ95983WbprjTHYjCT0XPxXZvMgCPd7sOAxefUNnMSo369Pq6i0QLgZuIdx+6bd34fC3/9odoJtpmEWhhM6mnl0jew+ftgFb6V4itb3yxQp/r1jeh1Mox81HpfI4yvdqKHKCMC2BPsrv/0KYtPu/0iZaW6Bfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Upa47IQxGMdOxtXkoqtF/jrYO06ZAMVag+E9dURRfxg=;
 b=eggU0XEivPJoP/XRhn3s2M55uErniGRgMu2xBhVy/oMSBukPgLLZCjBz1t9Ax3f2Hx7YUlJ7dQGZ1oOTiBGGqD14Z3XJEzWio8Bh175vunb+mPtiqxvlatil9z3/CWqtO0ypRWYOc4KQhL5rVzMAICNKEDZH6ik/lfpPtj/gJxM=
Received: from MW4PR04CA0119.namprd04.prod.outlook.com (2603:10b6:303:83::34)
 by CO6PR12MB5395.namprd12.prod.outlook.com (2603:10b6:303:13a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Mon, 25 Oct
 2021 13:01:18 +0000
Received: from CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::8c) by MW4PR04CA0119.outlook.office365.com
 (2603:10b6:303:83::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.22 via Frontend
 Transport; Mon, 25 Oct 2021 13:01:18 +0000
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
 15.20.4628.16 via Frontend Transport; Mon, 25 Oct 2021 13:01:18 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 25 Oct
 2021 08:01:14 -0500
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <daniel@ffwll.ch>, <christian.koenig@amd.com>,
 <alexander.deucher@amd.com>, <matthew.auld@intel.com>, <tzimmermann@suse.de>, 
 <jani.nikula@linux.intel.com>, Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v2 1/8] drm: move the buddy allocator from i915 into common drm
Date: Mon, 25 Oct 2021 18:30:32 +0530
Message-ID: <20211025130033.1547667-7-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025130033.1547667-1-Arunpravin.PaneerSelvam@amd.com>
References: <20211025130033.1547667-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ce16062-e19c-4add-cddd-08d997b78937
X-MS-TrafficTypeDiagnostic: CO6PR12MB5395:
X-Microsoft-Antispam-PRVS: <CO6PR12MB5395FCC547BD35E6EB7E56EBE4839@CO6PR12MB5395.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:316;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r5h/2s7DowNZP7bkwHSy9wd3aYlaVxtjNROKNJSdq83bvAsvOay8o37sKbdbyY4m7jNJHQgAJbGZDnbf5pXnjlhDA9pXTBUyKBNieeEmyRXAaXjDh8csdmtzr38R2SeMmL8UumWQjI08A4cSvYhXwSMCIHCKjNQ+jTOBlveCOHf7e6q2uD75n8+Se/TrsookaqUHm7FmuSvTyChwp3/LJCPvALbhRt0cSVLbGCPVh28ybyrKtzyaZc2wRiu3lYqU/QZriQ6S78NyUYvssKHGS+obvdKwdpCApEUA085MMMsURrYJQn/66uKM10Nm18mJ9h0wOTtMZIMpqwMCkPFyxN934/uvJUv43BONucMEDheCv6g8ws7pb6oEouHpycyyZw005ShB/f5yrtqszukSvrt81Gy82XzHWwGsxyXiddtiNCOf1IrUrclKeTiLwyT4tEuEtETPu3Ps67VtkjHK8JG7B0lcchH3+RDwGQHVPifYDeYBEW+yodSLmorj4ZuAQ8r8iQprCK2CLjI0PlF9JlxMZ0dj7Eem/lHP7Kkz9wluB0KyDkkLVmtZNxEIioF+BrbFtn34taPltC8K80YL/7uumUAlr5Oocamcw56sML92FXV4gCJPCKqlrIphkOaiNca3hNcNUjdJu/zQHSBh6dDRX/T4OVi/+HWQykalBOFlh6cH4tHFndqocNTkmiU2mE0thz/SNIf9x1skUJMX6/6IZGxx6ZHdLctqiLvwkvErTchN2QzeSRw/cBGoh6vT
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(186003)(5660300002)(70586007)(83380400001)(26005)(316002)(54906003)(2906002)(110136005)(6666004)(356005)(7696005)(36756003)(4326008)(47076005)(86362001)(70206006)(30864003)(36860700001)(81166007)(426003)(1076003)(508600001)(8936002)(2616005)(82310400003)(336012)(8676002)(16526019)(134034003)(36900700001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 13:01:18.5071 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce16062-e19c-4add-cddd-08d997b78937
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5395
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

Move the base i915 buddy allocator code into drm
- Move i915_buddy.h to include/drm
- Move i915_buddy.c to drm root folder
- Rename "i915" string with "drm" string wherever applicable
- Rename "I915" string with "DRM" string wherever applicable
- Fix header file dependencies
- Fix alignment issues
- add Makefile support for drm buddy
- export functions and write kerneldoc description
- Remove i915 selftest config check condition as buddy selftest
  will be moved to drm selftest folder

cleanup i915 buddy references in i915 driver module
and replace with drm buddy

V2:
- include header file in alphabetical order (Thomas)
- merged changes listed in the body section into a single patch
  to keep the build intact (Christian, Jani)

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/Makefile                      |   2 +-
 drivers/gpu/drm/drm_buddy.c                   | 521 ++++++++++++++++++
 drivers/gpu/drm/drm_drv.c                     |   3 +
 drivers/gpu/drm/i915/Makefile                 |   1 -
 drivers/gpu/drm/i915/i915_buddy.c             | 466 ----------------
 drivers/gpu/drm/i915/i915_buddy.h             | 143 -----
 drivers/gpu/drm/i915/i915_module.c            |   3 -
 drivers/gpu/drm/i915/i915_scatterlist.c       |  11 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  33 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |   4 +-
 include/drm/drm_buddy.h                       | 153 +++++
 11 files changed, 702 insertions(+), 638 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_buddy.c
 delete mode 100644 drivers/gpu/drm/i915/i915_buddy.c
 delete mode 100644 drivers/gpu/drm/i915/i915_buddy.h
 create mode 100644 include/drm/drm_buddy.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 0dff40bb863c..dc61e91a3154 100644
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
index 000000000000..39eb1d224bec
--- /dev/null
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -0,0 +1,521 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
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
+		 &mm->free_list[drm_buddy_block_order(block)]);
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
+void drm_buddy_free(struct drm_buddy_mm *mm,
+		    struct drm_buddy_block *block)
+{
+	BUG_ON(!drm_buddy_block_is_allocated(block));
+	mm->avail += drm_buddy_block_size(mm, block);
+	__drm_buddy_free(mm, block);
+}
+
+/**
+ * drm_buddy_free_list - free blocks
+ *
+ * @mm: DRM buddy manager
+ * @objects: input list head to free blocks
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
+/**
+ * drm_buddy_alloc - allocate power-of-two blocks
+ *
+ * @mm: DRM buddy manager to allocate from
+ * @order: size of the allocation
+ *
+ * The order value here translates to:
+ *
+ * 0 = 2^0 * mm->chunk_size
+ * 1 = 2^1 * mm->chunk_size
+ * 2 = 2^2 * mm->chunk_size
+ *
+ * Returns:
+ * allocated ptr to the &drm_buddy_block on success
+ */
+struct drm_buddy_block *
+drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order)
+{
+	struct drm_buddy_block *block = NULL;
+	unsigned int i;
+	int err;
+
+	for (i = order; i <= mm->max_order; ++i) {
+		block = list_first_entry_or_null(&mm->free_list[i],
+						 struct drm_buddy_block,
+						 link);
+		if (block)
+			break;
+	}
+
+	if (!block)
+		return ERR_PTR(-ENOSPC);
+
+	BUG_ON(!drm_buddy_block_is_free(block));
+
+	while (i != order) {
+		err = split_block(mm, block);
+		if (unlikely(err))
+			goto out_free;
+
+		/* Go low */
+		block = block->left;
+		i--;
+	}
+
+	mark_allocated(block);
+	mm->avail -= drm_buddy_block_size(mm, block);
+	kmemleak_update_trace(block);
+	return block;
+
+out_free:
+	if (i != order)
+		__drm_buddy_free(mm, block);
+	return ERR_PTR(err);
+}
+EXPORT_SYMBOL(drm_buddy_alloc);
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
+ * drm_buddy_alloc_range - allocate range
+ *
+ * @mm: DRM buddy manager to allocate from
+ * @blocks: output list head to add allocated blocks
+ * @start: start of the allowed range for this block
+ * @size: size of the allocation
+ *
+ * Intended for pre-allocating portions of the address space, for example to
+ * reserve a block for the initial framebuffer or similar, hence the expectation
+ * here is that drm_buddy_alloc() is still the main vehicle for
+ * allocations, so if that's not the case then the drm_mm range allocator is
+ * probably a much better fit, and so you should probably go use that instead.
+ *
+ * Note that it's safe to chain together multiple alloc_ranges
+ * with the same blocks list
+ *
+ * Returns:
+ * 0 on success, error code on failure.
+ */
+int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
+			  struct list_head *blocks,
+			  u64 start, u64 size)
+{
+	struct drm_buddy_block *block;
+	struct drm_buddy_block *buddy;
+	LIST_HEAD(allocated);
+	LIST_HEAD(dfs);
+	u64 end;
+	int err;
+	int i;
+
+	if (size < mm->chunk_size)
+		return -EINVAL;
+
+	if (!IS_ALIGNED(size | start, mm->chunk_size))
+		return -EINVAL;
+
+	if (range_overflows(start, size, mm->size))
+		return -EINVAL;
+
+	for (i = 0; i < mm->n_roots; ++i)
+		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
+
+	end = start + size - 1;
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
+		block_start = drm_buddy_block_offset(block);
+		block_end = block_start + drm_buddy_block_size(mm, block) - 1;
+
+		if (!overlaps(start, end, block_start, block_end))
+			continue;
+
+		if (drm_buddy_block_is_allocated(block)) {
+			err = -ENOSPC;
+			goto err_free;
+		}
+
+		if (contains(start, end, block_start, block_end)) {
+			if (!drm_buddy_block_is_free(block)) {
+				err = -ENOSPC;
+				goto err_free;
+			}
+
+			mark_allocated(block);
+			mm->avail -= drm_buddy_block_size(mm, block);
+			list_add_tail(&block->link, &allocated);
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
+	list_splice_tail(&allocated, blocks);
+	return 0;
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
+
+err_free:
+	drm_buddy_free_list(mm, &allocated);
+	return err;
+}
+EXPORT_SYMBOL(drm_buddy_alloc_range);
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
index 7a5097467ba5..5d5e46e60586 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -35,6 +35,7 @@
 #include <linux/slab.h>
 #include <linux/srcu.h>
 
+#include <drm/drm_buddy.h>
 #include <drm/drm_cache.h>
 #include <drm/drm_client.h>
 #include <drm/drm_color_mgmt.h>
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
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 467872cca027..fc5ca8c4ccb2 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -161,7 +161,6 @@ gem-y += \
 i915-y += \
 	  $(gem-y) \
 	  i915_active.o \
-	  i915_buddy.o \
 	  i915_cmd_parser.o \
 	  i915_gem_evict.o \
 	  i915_gem_gtt.o \
diff --git a/drivers/gpu/drm/i915/i915_buddy.c b/drivers/gpu/drm/i915/i915_buddy.c
deleted file mode 100644
index 6e2ad68f8f3f..000000000000
--- a/drivers/gpu/drm/i915/i915_buddy.c
+++ /dev/null
@@ -1,466 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2021 Intel Corporation
- */
-
-#include <linux/kmemleak.h>
-#include <linux/sizes.h>
-
-#include "i915_buddy.h"
-
-#include "i915_gem.h"
-#include "i915_utils.h"
-
-static struct kmem_cache *slab_blocks;
-
-static struct i915_buddy_block *i915_block_alloc(struct i915_buddy_mm *mm,
-						 struct i915_buddy_block *parent,
-						 unsigned int order,
-						 u64 offset)
-{
-	struct i915_buddy_block *block;
-
-	GEM_BUG_ON(order > I915_BUDDY_MAX_ORDER);
-
-	block = kmem_cache_zalloc(slab_blocks, GFP_KERNEL);
-	if (!block)
-		return NULL;
-
-	block->header = offset;
-	block->header |= order;
-	block->parent = parent;
-
-	GEM_BUG_ON(block->header & I915_BUDDY_HEADER_UNUSED);
-	return block;
-}
-
-static void i915_block_free(struct i915_buddy_mm *mm,
-			    struct i915_buddy_block *block)
-{
-	kmem_cache_free(slab_blocks, block);
-}
-
-static void mark_allocated(struct i915_buddy_block *block)
-{
-	block->header &= ~I915_BUDDY_HEADER_STATE;
-	block->header |= I915_BUDDY_ALLOCATED;
-
-	list_del(&block->link);
-}
-
-static void mark_free(struct i915_buddy_mm *mm,
-		      struct i915_buddy_block *block)
-{
-	block->header &= ~I915_BUDDY_HEADER_STATE;
-	block->header |= I915_BUDDY_FREE;
-
-	list_add(&block->link,
-		 &mm->free_list[i915_buddy_block_order(block)]);
-}
-
-static void mark_split(struct i915_buddy_block *block)
-{
-	block->header &= ~I915_BUDDY_HEADER_STATE;
-	block->header |= I915_BUDDY_SPLIT;
-
-	list_del(&block->link);
-}
-
-int i915_buddy_init(struct i915_buddy_mm *mm, u64 size, u64 chunk_size)
-{
-	unsigned int i;
-	u64 offset;
-
-	if (size < chunk_size)
-		return -EINVAL;
-
-	if (chunk_size < PAGE_SIZE)
-		return -EINVAL;
-
-	if (!is_power_of_2(chunk_size))
-		return -EINVAL;
-
-	size = round_down(size, chunk_size);
-
-	mm->size = size;
-	mm->avail = size;
-	mm->chunk_size = chunk_size;
-	mm->max_order = ilog2(size) - ilog2(chunk_size);
-
-	GEM_BUG_ON(mm->max_order > I915_BUDDY_MAX_ORDER);
-
-	mm->free_list = kmalloc_array(mm->max_order + 1,
-				      sizeof(struct list_head),
-				      GFP_KERNEL);
-	if (!mm->free_list)
-		return -ENOMEM;
-
-	for (i = 0; i <= mm->max_order; ++i)
-		INIT_LIST_HEAD(&mm->free_list[i]);
-
-	mm->n_roots = hweight64(size);
-
-	mm->roots = kmalloc_array(mm->n_roots,
-				  sizeof(struct i915_buddy_block *),
-				  GFP_KERNEL);
-	if (!mm->roots)
-		goto out_free_list;
-
-	offset = 0;
-	i = 0;
-
-	/*
-	 * Split into power-of-two blocks, in case we are given a size that is
-	 * not itself a power-of-two.
-	 */
-	do {
-		struct i915_buddy_block *root;
-		unsigned int order;
-		u64 root_size;
-
-		root_size = rounddown_pow_of_two(size);
-		order = ilog2(root_size) - ilog2(chunk_size);
-
-		root = i915_block_alloc(mm, NULL, order, offset);
-		if (!root)
-			goto out_free_roots;
-
-		mark_free(mm, root);
-
-		GEM_BUG_ON(i > mm->max_order);
-		GEM_BUG_ON(i915_buddy_block_size(mm, root) < chunk_size);
-
-		mm->roots[i] = root;
-
-		offset += root_size;
-		size -= root_size;
-		i++;
-	} while (size);
-
-	return 0;
-
-out_free_roots:
-	while (i--)
-		i915_block_free(mm, mm->roots[i]);
-	kfree(mm->roots);
-out_free_list:
-	kfree(mm->free_list);
-	return -ENOMEM;
-}
-
-void i915_buddy_fini(struct i915_buddy_mm *mm)
-{
-	int i;
-
-	for (i = 0; i < mm->n_roots; ++i) {
-		GEM_WARN_ON(!i915_buddy_block_is_free(mm->roots[i]));
-		i915_block_free(mm, mm->roots[i]);
-	}
-
-	GEM_WARN_ON(mm->avail != mm->size);
-
-	kfree(mm->roots);
-	kfree(mm->free_list);
-}
-
-static int split_block(struct i915_buddy_mm *mm,
-		       struct i915_buddy_block *block)
-{
-	unsigned int block_order = i915_buddy_block_order(block) - 1;
-	u64 offset = i915_buddy_block_offset(block);
-
-	GEM_BUG_ON(!i915_buddy_block_is_free(block));
-	GEM_BUG_ON(!i915_buddy_block_order(block));
-
-	block->left = i915_block_alloc(mm, block, block_order, offset);
-	if (!block->left)
-		return -ENOMEM;
-
-	block->right = i915_block_alloc(mm, block, block_order,
-					offset + (mm->chunk_size << block_order));
-	if (!block->right) {
-		i915_block_free(mm, block->left);
-		return -ENOMEM;
-	}
-
-	mark_free(mm, block->left);
-	mark_free(mm, block->right);
-
-	mark_split(block);
-
-	return 0;
-}
-
-static struct i915_buddy_block *
-get_buddy(struct i915_buddy_block *block)
-{
-	struct i915_buddy_block *parent;
-
-	parent = block->parent;
-	if (!parent)
-		return NULL;
-
-	if (parent->left == block)
-		return parent->right;
-
-	return parent->left;
-}
-
-static void __i915_buddy_free(struct i915_buddy_mm *mm,
-			      struct i915_buddy_block *block)
-{
-	struct i915_buddy_block *parent;
-
-	while ((parent = block->parent)) {
-		struct i915_buddy_block *buddy;
-
-		buddy = get_buddy(block);
-
-		if (!i915_buddy_block_is_free(buddy))
-			break;
-
-		list_del(&buddy->link);
-
-		i915_block_free(mm, block);
-		i915_block_free(mm, buddy);
-
-		block = parent;
-	}
-
-	mark_free(mm, block);
-}
-
-void i915_buddy_free(struct i915_buddy_mm *mm,
-		     struct i915_buddy_block *block)
-{
-	GEM_BUG_ON(!i915_buddy_block_is_allocated(block));
-	mm->avail += i915_buddy_block_size(mm, block);
-	__i915_buddy_free(mm, block);
-}
-
-void i915_buddy_free_list(struct i915_buddy_mm *mm, struct list_head *objects)
-{
-	struct i915_buddy_block *block, *on;
-
-	list_for_each_entry_safe(block, on, objects, link) {
-		i915_buddy_free(mm, block);
-		cond_resched();
-	}
-	INIT_LIST_HEAD(objects);
-}
-
-/*
- * Allocate power-of-two block. The order value here translates to:
- *
- *   0 = 2^0 * mm->chunk_size
- *   1 = 2^1 * mm->chunk_size
- *   2 = 2^2 * mm->chunk_size
- *   ...
- */
-struct i915_buddy_block *
-i915_buddy_alloc(struct i915_buddy_mm *mm, unsigned int order)
-{
-	struct i915_buddy_block *block = NULL;
-	unsigned int i;
-	int err;
-
-	for (i = order; i <= mm->max_order; ++i) {
-		block = list_first_entry_or_null(&mm->free_list[i],
-						 struct i915_buddy_block,
-						 link);
-		if (block)
-			break;
-	}
-
-	if (!block)
-		return ERR_PTR(-ENOSPC);
-
-	GEM_BUG_ON(!i915_buddy_block_is_free(block));
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
-	mm->avail -= i915_buddy_block_size(mm, block);
-	kmemleak_update_trace(block);
-	return block;
-
-out_free:
-	if (i != order)
-		__i915_buddy_free(mm, block);
-	return ERR_PTR(err);
-}
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
-
-/*
- * Allocate range. Note that it's safe to chain together multiple alloc_ranges
- * with the same blocks list.
- *
- * Intended for pre-allocating portions of the address space, for example to
- * reserve a block for the initial framebuffer or similar, hence the expectation
- * here is that i915_buddy_alloc() is still the main vehicle for
- * allocations, so if that's not the case then the drm_mm range allocator is
- * probably a much better fit, and so you should probably go use that instead.
- */
-int i915_buddy_alloc_range(struct i915_buddy_mm *mm,
-			   struct list_head *blocks,
-			   u64 start, u64 size)
-{
-	struct i915_buddy_block *block;
-	struct i915_buddy_block *buddy;
-	LIST_HEAD(allocated);
-	LIST_HEAD(dfs);
-	u64 end;
-	int err;
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
-
-	end = start + size - 1;
-
-	do {
-		u64 block_start;
-		u64 block_end;
-
-		block = list_first_entry_or_null(&dfs,
-						 struct i915_buddy_block,
-						 tmp_link);
-		if (!block)
-			break;
-
-		list_del(&block->tmp_link);
-
-		block_start = i915_buddy_block_offset(block);
-		block_end = block_start + i915_buddy_block_size(mm, block) - 1;
-
-		if (!overlaps(start, end, block_start, block_end))
-			continue;
-
-		if (i915_buddy_block_is_allocated(block)) {
-			err = -ENOSPC;
-			goto err_free;
-		}
-
-		if (contains(start, end, block_start, block_end)) {
-			if (!i915_buddy_block_is_free(block)) {
-				err = -ENOSPC;
-				goto err_free;
-			}
-
-			mark_allocated(block);
-			mm->avail -= i915_buddy_block_size(mm, block);
-			list_add_tail(&block->link, &allocated);
-			continue;
-		}
-
-		if (!i915_buddy_block_is_split(block)) {
-			err = split_block(mm, block);
-			if (unlikely(err))
-				goto err_undo;
-		}
-
-		list_add(&block->right->tmp_link, &dfs);
-		list_add(&block->left->tmp_link, &dfs);
-	} while (1);
-
-	list_splice_tail(&allocated, blocks);
-	return 0;
-
-err_undo:
-	/*
-	 * We really don't want to leave around a bunch of split blocks, since
-	 * bigger is better, so make sure we merge everything back before we
-	 * free the allocated blocks.
-	 */
-	buddy = get_buddy(block);
-	if (buddy &&
-	    (i915_buddy_block_is_free(block) &&
-	     i915_buddy_block_is_free(buddy)))
-		__i915_buddy_free(mm, block);
-
-err_free:
-	i915_buddy_free_list(mm, &allocated);
-	return err;
-}
-
-void i915_buddy_block_print(struct i915_buddy_mm *mm,
-			    struct i915_buddy_block *block,
-			    struct drm_printer *p)
-{
-	u64 start = i915_buddy_block_offset(block);
-	u64 size = i915_buddy_block_size(mm, block);
-
-	drm_printf(p, "%#018llx-%#018llx: %llu\n", start, start + size, size);
-}
-
-void i915_buddy_print(struct i915_buddy_mm *mm, struct drm_printer *p)
-{
-	int order;
-
-	drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: %lluMiB\n",
-		   mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20);
-
-	for (order = mm->max_order; order >= 0; order--) {
-		struct i915_buddy_block *block;
-		u64 count = 0, free;
-
-		list_for_each_entry(block, &mm->free_list[order], link) {
-			GEM_BUG_ON(!i915_buddy_block_is_free(block));
-			count++;
-		}
-
-		drm_printf(p, "order-%d ", order);
-
-		free = count * (mm->chunk_size << order);
-		if (free < SZ_1M)
-			drm_printf(p, "free: %lluKiB", free >> 10);
-		else
-			drm_printf(p, "free: %lluMiB", free >> 20);
-
-		drm_printf(p, ", pages: %llu\n", count);
-	}
-}
-
-#if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
-#include "selftests/i915_buddy.c"
-#endif
-
-void i915_buddy_module_exit(void)
-{
-	kmem_cache_destroy(slab_blocks);
-}
-
-int __init i915_buddy_module_init(void)
-{
-	slab_blocks = KMEM_CACHE(i915_buddy_block, 0);
-	if (!slab_blocks)
-		return -ENOMEM;
-
-	return 0;
-}
diff --git a/drivers/gpu/drm/i915/i915_buddy.h b/drivers/gpu/drm/i915/i915_buddy.h
deleted file mode 100644
index 7077742112ac..000000000000
--- a/drivers/gpu/drm/i915/i915_buddy.h
+++ /dev/null
@@ -1,143 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2021 Intel Corporation
- */
-
-#ifndef __I915_BUDDY_H__
-#define __I915_BUDDY_H__
-
-#include <linux/bitops.h>
-#include <linux/list.h>
-#include <linux/slab.h>
-
-#include <drm/drm_print.h>
-
-struct i915_buddy_block {
-#define I915_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
-#define I915_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
-#define   I915_BUDDY_ALLOCATED	   (1 << 10)
-#define   I915_BUDDY_FREE	   (2 << 10)
-#define   I915_BUDDY_SPLIT	   (3 << 10)
-/* Free to be used, if needed in the future */
-#define I915_BUDDY_HEADER_UNUSED GENMASK_ULL(9, 6)
-#define I915_BUDDY_HEADER_ORDER  GENMASK_ULL(5, 0)
-	u64 header;
-
-	struct i915_buddy_block *left;
-	struct i915_buddy_block *right;
-	struct i915_buddy_block *parent;
-
-	void *private; /* owned by creator */
-
-	/*
-	 * While the block is allocated by the user through i915_buddy_alloc*,
-	 * the user has ownership of the link, for example to maintain within
-	 * a list, if so desired. As soon as the block is freed with
-	 * i915_buddy_free* ownership is given back to the mm.
-	 */
-	struct list_head link;
-	struct list_head tmp_link;
-};
-
-/* Order-zero must be at least PAGE_SIZE */
-#define I915_BUDDY_MAX_ORDER (63 - PAGE_SHIFT)
-
-/*
- * Binary Buddy System.
- *
- * Locking should be handled by the user, a simple mutex around
- * i915_buddy_alloc* and i915_buddy_free* should suffice.
- */
-struct i915_buddy_mm {
-	/* Maintain a free list for each order. */
-	struct list_head *free_list;
-
-	/*
-	 * Maintain explicit binary tree(s) to track the allocation of the
-	 * address space. This gives us a simple way of finding a buddy block
-	 * and performing the potentially recursive merge step when freeing a
-	 * block.  Nodes are either allocated or free, in which case they will
-	 * also exist on the respective free list.
-	 */
-	struct i915_buddy_block **roots;
-
-	/*
-	 * Anything from here is public, and remains static for the lifetime of
-	 * the mm. Everything above is considered do-not-touch.
-	 */
-	unsigned int n_roots;
-	unsigned int max_order;
-
-	/* Must be at least PAGE_SIZE */
-	u64 chunk_size;
-	u64 size;
-	u64 avail;
-};
-
-static inline u64
-i915_buddy_block_offset(struct i915_buddy_block *block)
-{
-	return block->header & I915_BUDDY_HEADER_OFFSET;
-}
-
-static inline unsigned int
-i915_buddy_block_order(struct i915_buddy_block *block)
-{
-	return block->header & I915_BUDDY_HEADER_ORDER;
-}
-
-static inline unsigned int
-i915_buddy_block_state(struct i915_buddy_block *block)
-{
-	return block->header & I915_BUDDY_HEADER_STATE;
-}
-
-static inline bool
-i915_buddy_block_is_allocated(struct i915_buddy_block *block)
-{
-	return i915_buddy_block_state(block) == I915_BUDDY_ALLOCATED;
-}
-
-static inline bool
-i915_buddy_block_is_free(struct i915_buddy_block *block)
-{
-	return i915_buddy_block_state(block) == I915_BUDDY_FREE;
-}
-
-static inline bool
-i915_buddy_block_is_split(struct i915_buddy_block *block)
-{
-	return i915_buddy_block_state(block) == I915_BUDDY_SPLIT;
-}
-
-static inline u64
-i915_buddy_block_size(struct i915_buddy_mm *mm,
-		      struct i915_buddy_block *block)
-{
-	return mm->chunk_size << i915_buddy_block_order(block);
-}
-
-int i915_buddy_init(struct i915_buddy_mm *mm, u64 size, u64 chunk_size);
-
-void i915_buddy_fini(struct i915_buddy_mm *mm);
-
-struct i915_buddy_block *
-i915_buddy_alloc(struct i915_buddy_mm *mm, unsigned int order);
-
-int i915_buddy_alloc_range(struct i915_buddy_mm *mm,
-			   struct list_head *blocks,
-			   u64 start, u64 size);
-
-void i915_buddy_free(struct i915_buddy_mm *mm, struct i915_buddy_block *block);
-
-void i915_buddy_free_list(struct i915_buddy_mm *mm, struct list_head *objects);
-
-void i915_buddy_print(struct i915_buddy_mm *mm, struct drm_printer *p);
-void i915_buddy_block_print(struct i915_buddy_mm *mm,
-			    struct i915_buddy_block *block,
-			    struct drm_printer *p);
-
-void i915_buddy_module_exit(void);
-int i915_buddy_module_init(void);
-
-#endif
diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/i915_module.c
index ab2295dd4500..121b4178c5ca 100644
--- a/drivers/gpu/drm/i915/i915_module.c
+++ b/drivers/gpu/drm/i915/i915_module.c
@@ -9,7 +9,6 @@
 #include "gem/i915_gem_context.h"
 #include "gem/i915_gem_object.h"
 #include "i915_active.h"
-#include "i915_buddy.h"
 #include "i915_params.h"
 #include "i915_pci.h"
 #include "i915_perf.h"
@@ -50,8 +49,6 @@ static const struct {
 	{ .init = i915_check_nomodeset },
 	{ .init = i915_active_module_init,
 	  .exit = i915_active_module_exit },
-	{ .init = i915_buddy_module_init,
-	  .exit = i915_buddy_module_exit },
 	{ .init = i915_context_module_init,
 	  .exit = i915_context_module_exit },
 	{ .init = i915_gem_context_module_init,
diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
index 4a6712dca838..84d622aa32d2 100644
--- a/drivers/gpu/drm/i915/i915_scatterlist.c
+++ b/drivers/gpu/drm/i915/i915_scatterlist.c
@@ -5,10 +5,9 @@
  */
 
 #include "i915_scatterlist.h"
-
-#include "i915_buddy.h"
 #include "i915_ttm_buddy_manager.h"
 
+#include <drm/drm_buddy.h>
 #include <drm/drm_mm.h>
 
 #include <linux/slab.h>
@@ -126,9 +125,9 @@ struct sg_table *i915_sg_from_buddy_resource(struct ttm_resource *res,
 	struct i915_ttm_buddy_resource *bman_res = to_ttm_buddy_resource(res);
 	const u64 size = res->num_pages << PAGE_SHIFT;
 	const u64 max_segment = rounddown(UINT_MAX, PAGE_SIZE);
-	struct i915_buddy_mm *mm = bman_res->mm;
+	struct drm_buddy_mm *mm = bman_res->mm;
 	struct list_head *blocks = &bman_res->blocks;
-	struct i915_buddy_block *block;
+	struct drm_buddy_block *block;
 	struct scatterlist *sg;
 	struct sg_table *st;
 	resource_size_t prev_end;
@@ -151,8 +150,8 @@ struct sg_table *i915_sg_from_buddy_resource(struct ttm_resource *res,
 	list_for_each_entry(block, blocks, link) {
 		u64 block_size, offset;
 
-		block_size = min_t(u64, size, i915_buddy_block_size(mm, block));
-		offset = i915_buddy_block_offset(block);
+		block_size = min_t(u64, size, drm_buddy_block_size(mm, block));
+		offset = drm_buddy_block_offset(block);
 
 		while (block_size) {
 			u64 len;
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index d59fbb019032..c4b70cb8c248 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -8,14 +8,15 @@
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
 
+#include <drm/drm_buddy.h>
+
 #include "i915_ttm_buddy_manager.h"
 
-#include "i915_buddy.h"
 #include "i915_gem.h"
 
 struct i915_ttm_buddy_manager {
 	struct ttm_resource_manager manager;
-	struct i915_buddy_mm mm;
+	struct drm_buddy_mm mm;
 	struct list_head reserved;
 	struct mutex lock;
 	u64 default_page_size;
@@ -34,7 +35,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 {
 	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
 	struct i915_ttm_buddy_resource *bman_res;
-	struct i915_buddy_mm *mm = &bman->mm;
+	struct drm_buddy_mm *mm = &bman->mm;
 	unsigned long n_pages;
 	unsigned int min_order;
 	u64 min_page_size;
@@ -73,7 +74,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	n_pages = size >> ilog2(mm->chunk_size);
 
 	do {
-		struct i915_buddy_block *block;
+		struct drm_buddy_block *block;
 		unsigned int order;
 
 		order = fls(n_pages) - 1;
@@ -82,7 +83,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 
 		do {
 			mutex_lock(&bman->lock);
-			block = i915_buddy_alloc(mm, order);
+			block = drm_buddy_alloc(mm, order);
 			mutex_unlock(&bman->lock);
 			if (!IS_ERR(block))
 				break;
@@ -106,7 +107,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 
 err_free_blocks:
 	mutex_lock(&bman->lock);
-	i915_buddy_free_list(mm, &bman_res->blocks);
+	drm_buddy_free_list(mm, &bman_res->blocks);
 	mutex_unlock(&bman->lock);
 err_free_res:
 	kfree(bman_res);
@@ -120,7 +121,7 @@ static void i915_ttm_buddy_man_free(struct ttm_resource_manager *man,
 	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
 
 	mutex_lock(&bman->lock);
-	i915_buddy_free_list(&bman->mm, &bman_res->blocks);
+	drm_buddy_free_list(&bman->mm, &bman_res->blocks);
 	mutex_unlock(&bman->lock);
 
 	kfree(bman_res);
@@ -130,17 +131,17 @@ static void i915_ttm_buddy_man_debug(struct ttm_resource_manager *man,
 				     struct drm_printer *printer)
 {
 	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
-	struct i915_buddy_block *block;
+	struct drm_buddy_block *block;
 
 	mutex_lock(&bman->lock);
 	drm_printf(printer, "default_page_size: %lluKiB\n",
 		   bman->default_page_size >> 10);
 
-	i915_buddy_print(&bman->mm, printer);
+	drm_buddy_print(&bman->mm, printer);
 
 	drm_printf(printer, "reserved:\n");
 	list_for_each_entry(block, &bman->reserved, link)
-		i915_buddy_block_print(&bman->mm, block, printer);
+		drm_buddy_block_print(&bman->mm, block, printer);
 	mutex_unlock(&bman->lock);
 }
 
@@ -190,7 +191,7 @@ int i915_ttm_buddy_man_init(struct ttm_device *bdev,
 	if (!bman)
 		return -ENOMEM;
 
-	err = i915_buddy_init(&bman->mm, size, chunk_size);
+	err = drm_buddy_init(&bman->mm, size, chunk_size);
 	if (err)
 		goto err_free_bman;
 
@@ -228,7 +229,7 @@ int i915_ttm_buddy_man_fini(struct ttm_device *bdev, unsigned int type)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(bdev, type);
 	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
-	struct i915_buddy_mm *mm = &bman->mm;
+	struct drm_buddy_mm *mm = &bman->mm;
 	int ret;
 
 	ttm_resource_manager_set_used(man, false);
@@ -240,8 +241,8 @@ int i915_ttm_buddy_man_fini(struct ttm_device *bdev, unsigned int type)
 	ttm_set_driver_manager(bdev, type, NULL);
 
 	mutex_lock(&bman->lock);
-	i915_buddy_free_list(mm, &bman->reserved);
-	i915_buddy_fini(mm);
+	drm_buddy_free_list(mm, &bman->reserved);
+	drm_buddy_fini(mm);
 	mutex_unlock(&bman->lock);
 
 	ttm_resource_manager_cleanup(man);
@@ -264,11 +265,11 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
 			       u64 start, u64 size)
 {
 	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
-	struct i915_buddy_mm *mm = &bman->mm;
+	struct drm_buddy_mm *mm = &bman->mm;
 	int ret;
 
 	mutex_lock(&bman->lock);
-	ret = i915_buddy_alloc_range(mm, &bman->reserved, start, size);
+	ret = drm_buddy_alloc_range(mm, &bman->reserved, start, size);
 	mutex_unlock(&bman->lock);
 
 	return ret;
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
index 0722d33f3e14..fa644b512c2e 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
@@ -13,7 +13,7 @@
 
 struct ttm_device;
 struct ttm_resource_manager;
-struct i915_buddy_mm;
+struct drm_buddy_mm;
 
 /**
  * struct i915_ttm_buddy_resource
@@ -28,7 +28,7 @@ struct i915_buddy_mm;
 struct i915_ttm_buddy_resource {
 	struct ttm_resource base;
 	struct list_head blocks;
-	struct i915_buddy_mm *mm;
+	struct drm_buddy_mm *mm;
 };
 
 /**
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
new file mode 100644
index 000000000000..5ce3fc702f80
--- /dev/null
+++ b/include/drm/drm_buddy.h
@@ -0,0 +1,153 @@
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
+#define range_overflows(start, size, max) ({ \
+	typeof(start) start__ = (start); \
+	typeof(size) size__ = (size); \
+	typeof(max) max__ = (max); \
+	(void)(&start__ == &size__); \
+	(void)(&start__ == &max__); \
+	start__ >= max__ || size__ > max__ - start__; \
+})
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
+struct drm_buddy_block *
+drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order);
+
+int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
+			  struct list_head *blocks,
+			  u64 start, u64 size);
+
+void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block);
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

