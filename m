Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A234341BC
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 00:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2976E0D0;
	Tue, 19 Oct 2021 22:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E376E0EF;
 Tue, 19 Oct 2021 22:55:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGPN5VNAanlYwrTt9xd3WCDya+2FTqIrPGV2dhk/9SeN9JuAqYmiEH5tyisFpcoCHBgcIv7k3yk6n4kw/9DxgcPawnsjX+FtVql/dVHPkmFa2LJlyLl+wpRnYPh4Gi1ScNN/pXylUoZdA4ukaoG2dOdTYgxvzb2/AFTdlSThzMZ6GxkUimeuHnOJ9TZncaNghto/8bqMrVW0bYPTo9PqMoH4xoHbfO43hH0ZtWoFYKs0i0E2LeLnm2Incwb4XMuJYd2gzC2fWka23TtDNXHpo8Vw9U7I84YkfPOwy8YESxp5v05YzrVTlwF9XdfBYbKk7IAcaLjspNLb1F9o6BUC1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPWUo3nL8XofUi7QE/IkICyRWq76/xXcvPXez7GLvmM=;
 b=BtD8S/dpmebctBYOV9lWxZ4BM4iFYc6+VtRmoqmrIvZhLArHAVhHJ16YvvCY4itM96yCvHgUqFk6860iXXMzUYT/7KQxvfilaAhEZZzqk5JL9G3/62hrw2AqZR99OyYNBRHq2m3PkTMw3+aQkdbtoaLdoGQ7jsml81v8nlQTfWiEfC/1Ok688yT1pcCeQ03csuxT+di5DC45eg6lV9w0/1/+/SKUycT/54ECxTzMjvSpEvaGIr6xlRGDXsEq+L/X4+I9pDYLYj3sE4G+vYm2Udmh4703tm2IuY4jwXadMg8zz4peD21+qg+iJW/36sfmO3lcMTAsDaARvXgdIL/Iqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPWUo3nL8XofUi7QE/IkICyRWq76/xXcvPXez7GLvmM=;
 b=vK6a9SatudP/YuQV16cnDbZlLSETxmVJ443AAL53UeQtGrVWT6gaqSpalQDTfIfw6YgEtDH/xry2F3HxFg6wvcFZl1r8dPerk4osuk0sltXlgZ4Rfa/urRwGxO7CfY+b7EW+87VboVCSdrHHiOWF1DDqcs6OUAn4TCePjl0oHFE=
Received: from MW3PR06CA0018.namprd06.prod.outlook.com (2603:10b6:303:2a::23)
 by MN2PR12MB4032.namprd12.prod.outlook.com (2603:10b6:208:16d::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 22:55:05 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::dd) by MW3PR06CA0018.outlook.office365.com
 (2603:10b6:303:2a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Tue, 19 Oct 2021 22:55:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 22:55:04 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 17:55:00 -0500
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <daniel@ffwll.ch>, <matthew.auld@intel.com>,
 <alexander.deucher@amd.com>, Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 01/13] drm: Move and rename i915 buddy header
Date: Wed, 20 Oct 2021 04:23:57 +0530
Message-ID: <20211019225409.569355-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019225409.569355-1-Arunpravin.PaneerSelvam@amd.com>
References: <20211019225409.569355-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4befc00b-07fb-4212-460a-08d993537d5e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4032:
X-Microsoft-Antispam-PRVS: <MN2PR12MB403251E0C1FBA010BC84850DE4BD9@MN2PR12MB4032.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: izYWwVHZnA756rk9bJQg0bUdA0mLqEJWTFxi+cctWaxATR2EJGwcl+ZvnzMV78Hr6Bv3JOt2M4otZL5ZTbw/QUq16/J3bFr1SrqjR3AMgSB1esviS0aE5Guq0yxac+o0pnGfv601SQCwQCW0n+186plyQOu7pF1JuHSQNY4+MAoKZ64Cl/S3/ymIrOtNnueozN5k6S5xrat+1oje9ciAx0gcDZSNHm7TA/2SmLpdNHSUtDRkLQxK4vuj+r8uA9e99HCMjlYCRDmHvX5dKudkalorzniqNdIgNm4IQSBNRoi7d2gz5x0HXQ2t5WCXUPF9TKXrZth9end/K1HKk1+UCPtF/gdJezeWeKCIbkzF4YYCejuEqDBi5ujDIwWDpd3ZDugXOpX5CXEtjDRkk7lVA9kU3T4LConLNDNo16WOC6DiDeNO89qFnyKwxb0lP0QxCJQlW91Zoc5qJstaM8SJXlnbJZbKDHqi+nfANirauPV4w9cdfue4zkWoxOzDEihrD2EOJ7IIRmh2/s8+8/T7t7T3m/Crm6Cvb66nr9XfLdwDmk8Q7jGqKW9Xpy1RB3Quj6XTEBcxM0zsLgFz30rqQw9ZJohd4JFL3bB8ljq222rDK2HruB2qDFYVD5xzX9/Yuvf/1NI87Ypq0J7p+WFQcvxq3K18FL+s1btthKF39Jk7iilXIyJPTLiIF190U3oDisVyyACIAMA5GOAVcKPcIJPem18N5CTE+0zM8eLlCTYxchKLNkBI9Jrpxd35qRAb
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(83380400001)(16526019)(7696005)(6666004)(110136005)(54906003)(508600001)(2616005)(8676002)(186003)(81166007)(86362001)(2906002)(356005)(70206006)(5660300002)(70586007)(336012)(26005)(36756003)(1076003)(8936002)(36860700001)(82310400003)(426003)(4326008)(316002)(47076005)(134034003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 22:55:04.2975 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4befc00b-07fb-4212-460a-08d993537d5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4032
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

- Move i915_buddy.h to include/drm
- rename "i915" string to "drm"
- rename "I915" string to "DRM"

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/i915/i915_buddy.h | 143 ------------------------------
 include/drm/drm_buddy.h           | 143 ++++++++++++++++++++++++++++++
 2 files changed, 143 insertions(+), 143 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/i915_buddy.h
 create mode 100644 include/drm/drm_buddy.h

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
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
new file mode 100644
index 000000000000..521ed532d2b8
--- /dev/null
+++ b/include/drm/drm_buddy.h
@@ -0,0 +1,143 @@
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
+
+#include <drm/drm_print.h>
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
+		      struct drm_buddy_block *block)
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
+			   struct list_head *blocks,
+			   u64 start, u64 size);
+
+void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block);
+
+void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects);
+
+void drm_buddy_print(struct drm_buddy_mm *mm, struct drm_printer *p);
+void drm_buddy_block_print(struct drm_buddy_mm *mm,
+			    struct drm_buddy_block *block,
+			    struct drm_printer *p);
+
+void drm_buddy_module_exit(void);
+int drm_buddy_module_init(void);
+
+#endif
-- 
2.25.1

