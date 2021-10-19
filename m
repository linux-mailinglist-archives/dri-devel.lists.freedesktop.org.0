Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 023F34341D1
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 00:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931EE6E199;
	Tue, 19 Oct 2021 22:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FA96E1AA;
 Tue, 19 Oct 2021 22:55:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+ZrAEa43vTQrcvkD9xM2cSTq7O2XGDXw+e92DfUsr7O+/jGhd4vOh0zOEgHr2SmLo1CLYgjeqgaaU9+0W4/bJOOEy2PizIT+8uV0Ve0x8v2gLBAG1L/vMPLb1iLx4Bkx1ZYT5BVQHNIqJK4cEnJEkBb2nvLC1cg5W8UjnyMquv6I7D1vJuRswruR26PUSXeaRZLVhs99JQr0fZ04PtGvDBC11aGrBwm6KxtJ/rvZCosvsMc38y63l6fEpz8B5FemWk2xTh9TY5cuxbHZHl7JZpEv3jpnAWEYAqkK/m2NlCsXtX3c57axLs/Ja32vKC+bJdYoHyt8nqnkDGQyS1GUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVeYy56eCb+iGsN7YRkXl8dOk6j0635e/MV7AHIFjmg=;
 b=oUnwo2qLD1pYhni2ywkYaw7pNCLmXFESOnKJFqxSjtwYvCExUj745zHX/vt1Ydoh49xRe7cELr9R2UWMzB9AzZY3LwjpoeEF6XJMwaSNDpVaTbEIOW4sUd94K78TOoZDCUZ9MKCLwnIsE2CgLFlYIxiTJk1k2FC3n65WwWKLplb5IK//7zNMB5NGnGkb3mLkPj5qWPDp4q5I1ZkzW19aIKSyVvStwwsM0gOVdx4/aPhwqiVq3WLhWfiuW4bw+F36Zg0WlX2gGFgXn1hx1UACe2OLnjVNWD4w4w/9/ILkTKD2lncyki9PtW7IqcUlT90cPf7byh54eLxu5iC7gDyTHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVeYy56eCb+iGsN7YRkXl8dOk6j0635e/MV7AHIFjmg=;
 b=ctworVyZ9Zz3ALgBHGJLs1sLBszMhkHWyvpyCiSn9WTNMI59M3el3oga8OAaADF8kkVelyxlE/tkQ/+HF53UKrPnKppIskswkJmTEApyJviWK4MfZv3iHMujpaeirsqnI8cWgvn1LJGo8tHUL/Tw+ibT52FShZSNLgquigI7+Ac=
Received: from MW3PR06CA0001.namprd06.prod.outlook.com (2603:10b6:303:2a::6)
 by BN6PR1201MB0226.namprd12.prod.outlook.com (2603:10b6:405:56::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Tue, 19 Oct
 2021 22:55:30 +0000
Received: from CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::cc) by MW3PR06CA0001.outlook.office365.com
 (2603:10b6:303:2a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Tue, 19 Oct 2021 22:55:30 +0000
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
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 22:55:30 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 17:55:26 -0500
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <daniel@ffwll.ch>, <matthew.auld@intel.com>,
 <alexander.deucher@amd.com>, Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 10/13] drm/i915: cleanup i915 buddy and apply DRM buddy
Date: Wed, 20 Oct 2021 04:24:06 +0530
Message-ID: <20211019225409.569355-11-Arunpravin.PaneerSelvam@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: a1878d3d-72cf-4bb9-54b8-08d993538cbd
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0226:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB022604B7824387FEEAA95E73E4BD9@BN6PR1201MB0226.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:529;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1vV6iKxblt4h2hqpy2ZaR8auB3HcMCDdjJnncyR8kC0gqzNyHD9d3xRXRUPVQkIwfh3MuEoggLMuutPAP9oeHAj/iSpoV3JAtLTJQ2emiAFMfBsGL9OiT9OjZiq4yeY3FZh36gm7m4QuadJc2/WIK8rD1EE5BHV/GhjXu4BpvUQVgurpMqT+7y+vK3MrNFVonVhvPmrR1/Yqvu56gdga4dggph36uyBNeClX6jAQh4DCOAdO+UbHT2kSLnwdQpX2uD4/CqNECjHqYDRB+QDknjMUDPNf83brSmVBzHtveZZ7oLIbq9sOp21jrvonMhS4ER5A7UAie5Ls4oSLHYnk/1p9OQ07NuADgYoMYFefuQgH2kd2EOc/zcOi5wLoCcg3CBHmaD4VKdhgh8MAEMijiZcikcLsSZmGFDzE2Y4A/CWqjcybrgwkP5l8zwjCjNRLRItV33oNoShEZArEe1c5A3ZpOigx5/I3ShUuCgU2zSayD9qFXBLUkTSiJcFDRNMf2RuLpgZGGoYPyQedhXOuZ4Ar0yMXOcbMyK2LwaY0CfQM2uZzyd6AE4v5P9B6QRwmuo0cY1/2d0MuX+USndpo1nK7g3AZZZNDmiD0HDvxpJlchRDogg7g98WgS4ZiHhxUXhp4gm7PAqGWxzvJdN5iRaVmzU/OyvEa55+2l07TsI5JGxAKf19zOaQaUUakdMQ0JhK/KA8P0u6gVaGcfpb3zHKF4CO/nxZuteGZlFFhJbA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(2906002)(86362001)(4326008)(36756003)(6666004)(1076003)(82310400003)(8936002)(8676002)(5660300002)(70586007)(70206006)(83380400001)(186003)(16526019)(356005)(110136005)(2616005)(47076005)(508600001)(336012)(36860700001)(81166007)(426003)(316002)(7696005)(54906003)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 22:55:30.0803 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1878d3d-72cf-4bb9-54b8-08d993538cbd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0226
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

Remove i915 buddy references and add DRM buddy
functions

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/i915/Makefile                 |  1 -
 drivers/gpu/drm/i915/i915_module.c            |  3 -
 drivers/gpu/drm/i915/i915_scatterlist.c       | 11 +--
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 91 +++++++++----------
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |  5 +-
 5 files changed, 53 insertions(+), 58 deletions(-)

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
index d59fbb019032..d09ea6c83a27 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -7,15 +7,15 @@
 
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
+#include <drm/drm_buddy.h>
 
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
@@ -34,15 +34,12 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 {
 	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
 	struct i915_ttm_buddy_resource *bman_res;
-	struct i915_buddy_mm *mm = &bman->mm;
+	struct drm_buddy_mm *mm = &bman->mm;
 	unsigned long n_pages;
-	unsigned int min_order;
 	u64 min_page_size;
 	u64 size;
 	int err;
 
-	GEM_BUG_ON(place->fpfn || place->lpfn);
-
 	bman_res = kzalloc(sizeof(*bman_res), GFP_KERNEL);
 	if (!bman_res)
 		return -ENOMEM;
@@ -59,11 +56,12 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 		min_page_size = bo->page_alignment << PAGE_SHIFT;
 
 	GEM_BUG_ON(min_page_size < mm->chunk_size);
-	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
-	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
+
+	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
 		size = roundup_pow_of_two(size);
-		min_order = ilog2(size) - ilog2(mm->chunk_size);
-	}
+
+	if (place->fpfn || place->lpfn)
+		bman_res->flags |= DRM_BUDDY_RANGE_ALLOCATION;
 
 	if (size > mm->size) {
 		err = -E2BIG;
@@ -72,41 +70,34 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 
 	n_pages = size >> ilog2(mm->chunk_size);
 
-	do {
-		struct i915_buddy_block *block;
-		unsigned int order;
-
-		order = fls(n_pages) - 1;
-		GEM_BUG_ON(order > mm->max_order);
-		GEM_BUG_ON(order < min_order);
-
-		do {
-			mutex_lock(&bman->lock);
-			block = i915_buddy_alloc(mm, order);
-			mutex_unlock(&bman->lock);
-			if (!IS_ERR(block))
-				break;
-
-			if (order-- == min_order) {
-				err = -ENOSPC;
-				goto err_free_blocks;
-			}
-		} while (1);
+	mutex_lock(&bman->lock);
+	err = drm_buddy_alloc(mm, (uint64_t)place->fpfn << PAGE_SHIFT,
+				  (uint64_t)place->lpfn << PAGE_SHIFT,
+				  (uint64_t)n_pages << PAGE_SHIFT,
+				   min_page_size,
+				   &bman_res->blocks,
+				   bman_res->flags);
+	mutex_unlock(&bman->lock);
 
-		n_pages -= BIT(order);
+	if (unlikely(err))
+		goto err_free_blocks;
 
-		list_add_tail(&block->link, &bman_res->blocks);
+#if 0
+	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
+		err = drm_buddy_free_unused_pages(mm, (uint64_t)n_pages << PAGE_SHIFT,
+						       &bman_res->blocks);
 
-		if (!n_pages)
-			break;
-	} while (1);
+		if (unlikely(err))
+			goto err_free_blocks;
+	}
+#endif
 
 	*res = &bman_res->base;
 	return 0;
 
 err_free_blocks:
 	mutex_lock(&bman->lock);
-	i915_buddy_free_list(mm, &bman_res->blocks);
+	drm_buddy_free_list(mm, &bman_res->blocks);
 	mutex_unlock(&bman->lock);
 err_free_res:
 	kfree(bman_res);
@@ -120,7 +111,7 @@ static void i915_ttm_buddy_man_free(struct ttm_resource_manager *man,
 	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
 
 	mutex_lock(&bman->lock);
-	i915_buddy_free_list(&bman->mm, &bman_res->blocks);
+	drm_buddy_free_list(&bman->mm, &bman_res->blocks);
 	mutex_unlock(&bman->lock);
 
 	kfree(bman_res);
@@ -130,17 +121,17 @@ static void i915_ttm_buddy_man_debug(struct ttm_resource_manager *man,
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
 
@@ -190,7 +181,7 @@ int i915_ttm_buddy_man_init(struct ttm_device *bdev,
 	if (!bman)
 		return -ENOMEM;
 
-	err = i915_buddy_init(&bman->mm, size, chunk_size);
+	err = drm_buddy_init(&bman->mm, size, chunk_size);
 	if (err)
 		goto err_free_bman;
 
@@ -228,7 +219,7 @@ int i915_ttm_buddy_man_fini(struct ttm_device *bdev, unsigned int type)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(bdev, type);
 	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
-	struct i915_buddy_mm *mm = &bman->mm;
+	struct drm_buddy_mm *mm = &bman->mm;
 	int ret;
 
 	ttm_resource_manager_set_used(man, false);
@@ -240,8 +231,8 @@ int i915_ttm_buddy_man_fini(struct ttm_device *bdev, unsigned int type)
 	ttm_set_driver_manager(bdev, type, NULL);
 
 	mutex_lock(&bman->lock);
-	i915_buddy_free_list(mm, &bman->reserved);
-	i915_buddy_fini(mm);
+	drm_buddy_free_list(mm, &bman->reserved);
+	drm_buddy_fini(mm);
 	mutex_unlock(&bman->lock);
 
 	ttm_resource_manager_cleanup(man);
@@ -264,11 +255,19 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
 			       u64 start, u64 size)
 {
 	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
-	struct i915_buddy_mm *mm = &bman->mm;
+	struct drm_buddy_mm *mm = &bman->mm;
+	unsigned long flags = 0;
+	u64 min_size;
 	int ret;
 
+	min_size = size;
+	flags |= DRM_BUDDY_RANGE_ALLOCATION;
+
 	mutex_lock(&bman->lock);
-	ret = i915_buddy_alloc_range(mm, &bman->reserved, start, size);
+	ret = drm_buddy_alloc(mm, start, start + size,
+				  size, min_size,
+				  &bman->reserved,
+				  flags);
 	mutex_unlock(&bman->lock);
 
 	return ret;
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
index 0722d33f3e14..c8c0dea1cdca 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
@@ -13,7 +13,7 @@
 
 struct ttm_device;
 struct ttm_resource_manager;
-struct i915_buddy_mm;
+struct drm_buddy_mm;
 
 /**
  * struct i915_ttm_buddy_resource
@@ -28,7 +28,8 @@ struct i915_buddy_mm;
 struct i915_ttm_buddy_resource {
 	struct ttm_resource base;
 	struct list_head blocks;
-	struct i915_buddy_mm *mm;
+	unsigned long flags;
+	struct drm_buddy_mm *mm;
 };
 
 /**
-- 
2.25.1

