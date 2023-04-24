Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C8A6ED23E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 18:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E208910E56A;
	Mon, 24 Apr 2023 16:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37D010E563;
 Mon, 24 Apr 2023 16:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682352741; x=1713888741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eeNIxG4rmDtsy+nqhFRPVKOFPmeD9y+38Z1VGNLyN8g=;
 b=CUiXso3jOVEEQMn61Tmh6kRv7IMaw8w9YL2k54lAecPfUtZMpcXVGpjN
 lu73gjNJgpLvTCP9zUOhQcBT0J2ms/CUBcKAGDgZgqpTJkvZD6K+03Ta7
 RX+gDlvdzTZF1lgUfPjCC50hdMNz/bPUdBU+F+CSz9KwzCT3rfHOFxdGD
 o1W9JkrD3LCa4rDTVfNfURAzCIT8rmfJm8Bbs4Mz0uwRepWbqaCEhZ388
 SIX4iZ5da46K8cjMiiA3qpWhhoYh+cnTsMqNL9T6CeLCzqqz0RJ6r+YBN
 Z5tWFRczpD32Cmg7uswq1rbPIYE7hf2rzmilskxhzXP4LtDSJUXIjMCct w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="349293325"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="349293325"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 09:09:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="867533943"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="867533943"
Received: from apalfi-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.34.175])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 09:09:36 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>, Fei Yang <fei.yang@intel.com>
Subject: [PATCH 2/2] Revert "drm/i915/mtl: Define MOCS and PAT tables for MTL"
Date: Mon, 24 Apr 2023 18:09:13 +0200
Message-Id: <20230424160913.19886-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424160913.19886-1-andi.shyti@linux.intel.com>
References: <20230424160913.19886-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Lucas Martins De Marchi <lucas.demarchi@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit b76c0deef6273609c02ed5053209f6397cd1b0fb.

This patch is causing boot failures for MTL.

Revert it.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h |  6 +--
 drivers/gpu/drm/i915/gt/intel_gtt.c     | 47 +----------------
 drivers/gpu/drm/i915/gt/intel_gtt.h     |  8 ---
 drivers/gpu/drm/i915/gt/intel_mocs.c    | 70 +------------------------
 4 files changed, 3 insertions(+), 128 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index e8c3b762a92a3..fd1f9cd35e9d7 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -356,11 +356,7 @@
 #define GEN7_TLB_RD_ADDR			_MMIO(0x4700)
 
 #define GEN12_PAT_INDEX(index)			_MMIO(0x4800 + (index) * 4)
-#define _PAT_INDEX(index)			_PICK_EVEN_2RANGES(index, 8, \
-								   0x4800, 0x4804, \
-								   0x4848, 0x484c)
-#define XEHP_PAT_INDEX(index)			MCR_REG(_PAT_INDEX(index))
-#define XELPMP_PAT_INDEX(index)			_MMIO(_PAT_INDEX(index))
+#define XEHP_PAT_INDEX(index)			MCR_REG(0x4800 + (index) * 4)
 
 #define XEHP_TILE0_ADDR_RANGE			MCR_REG(0x4900)
 #define   XEHP_TILE_LMEM_RANGE_SHIFT		8
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 2f6a9be0ffe61..4f436ba7a3c83 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -468,44 +468,6 @@ void gtt_write_workarounds(struct intel_gt *gt)
 	}
 }
 
-static void xelpmp_setup_private_ppat(struct intel_uncore *uncore)
-{
-	intel_uncore_write(uncore, XELPMP_PAT_INDEX(0),
-			   MTL_PPAT_L4_0_WB);
-	intel_uncore_write(uncore, XELPMP_PAT_INDEX(1),
-			   MTL_PPAT_L4_1_WT);
-	intel_uncore_write(uncore, XELPMP_PAT_INDEX(2),
-			   MTL_PPAT_L4_3_UC);
-	intel_uncore_write(uncore, XELPMP_PAT_INDEX(3),
-			   MTL_PPAT_L4_0_WB | MTL_2_COH_1W);
-	intel_uncore_write(uncore, XELPMP_PAT_INDEX(4),
-			   MTL_PPAT_L4_0_WB | MTL_3_COH_2W);
-
-	/*
-	 * Remaining PAT entries are left at the hardware-default
-	 * fully-cached setting
-	 */
-}
-
-static void xelpg_setup_private_ppat(struct intel_gt *gt)
-{
-	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(0),
-				     MTL_PPAT_L4_0_WB);
-	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(1),
-				     MTL_PPAT_L4_1_WT);
-	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(2),
-				     MTL_PPAT_L4_3_UC);
-	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(3),
-				     MTL_PPAT_L4_0_WB | MTL_2_COH_1W);
-	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(4),
-				     MTL_PPAT_L4_0_WB | MTL_3_COH_2W);
-
-	/*
-	 * Remaining PAT entries are left at the hardware-default
-	 * fully-cached setting
-	 */
-}
-
 static void tgl_setup_private_ppat(struct intel_uncore *uncore)
 {
 	/* TGL doesn't support LLC or AGE settings */
@@ -641,14 +603,7 @@ void setup_private_pat(struct intel_gt *gt)
 
 	GEM_BUG_ON(GRAPHICS_VER(i915) < 8);
 
-	if (gt->type == GT_MEDIA) {
-		xelpmp_setup_private_ppat(gt->uncore);
-		return;
-	}
-
-	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
-		xelpg_setup_private_ppat(gt);
-	else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
+	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
 		xehp_setup_private_ppat(gt);
 	else if (GRAPHICS_VER(i915) >= 12)
 		tgl_setup_private_ppat(uncore);
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index ea17849e7a5c8..69ce55f517f56 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -147,14 +147,6 @@ typedef u64 gen8_pte_t;
 #define GEN8_PDE_IPS_64K BIT(11)
 #define GEN8_PDE_PS_2M   BIT(7)
 
-#define MTL_PPAT_L4_CACHE_POLICY_MASK	REG_GENMASK(3, 2)
-#define MTL_PAT_INDEX_COH_MODE_MASK	REG_GENMASK(1, 0)
-#define MTL_PPAT_L4_3_UC	REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 3)
-#define MTL_PPAT_L4_1_WT	REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 1)
-#define MTL_PPAT_L4_0_WB	REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 0)
-#define MTL_3_COH_2W	REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 3)
-#define MTL_2_COH_1W	REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 2)
-
 enum i915_cache_level;
 
 struct drm_i915_gem_object;
diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
index 2c014407225cc..69b489e8dfeda 100644
--- a/drivers/gpu/drm/i915/gt/intel_mocs.c
+++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
@@ -40,10 +40,6 @@ struct drm_i915_mocs_table {
 #define LE_COS(value)		((value) << 15)
 #define LE_SSE(value)		((value) << 17)
 
-/* Defines for the tables (GLOB_MOCS_0 - GLOB_MOCS_16) */
-#define _L4_CACHEABILITY(value)	((value) << 2)
-#define IG_PAT(value)		((value) << 8)
-
 /* Defines for the tables (LNCFMOCS0 - LNCFMOCS31) - two entries per word */
 #define L3_ESC(value)		((value) << 0)
 #define L3_SCC(value)		((value) << 1)
@@ -54,7 +50,6 @@ struct drm_i915_mocs_table {
 /* Helper defines */
 #define GEN9_NUM_MOCS_ENTRIES	64  /* 63-64 are reserved, but configured. */
 #define PVC_NUM_MOCS_ENTRIES	3
-#define MTL_NUM_MOCS_ENTRIES	16
 
 /* (e)LLC caching options */
 /*
@@ -78,12 +73,6 @@ struct drm_i915_mocs_table {
 #define L3_2_RESERVED		_L3_CACHEABILITY(2)
 #define L3_3_WB			_L3_CACHEABILITY(3)
 
-/* L4 caching options */
-#define L4_0_WB			_L4_CACHEABILITY(0)
-#define L4_1_WT			_L4_CACHEABILITY(1)
-#define L4_2_RESERVED		_L4_CACHEABILITY(2)
-#define L4_3_UC			_L4_CACHEABILITY(3)
-
 #define MOCS_ENTRY(__idx, __control_value, __l3cc_value) \
 	[__idx] = { \
 		.control_value = __control_value, \
@@ -427,57 +416,6 @@ static const struct drm_i915_mocs_entry pvc_mocs_table[] = {
 	MOCS_ENTRY(2, 0, L3_3_WB),
 };
 
-static const struct drm_i915_mocs_entry mtl_mocs_table[] = {
-	/* Error - Reserved for Non-Use */
-	MOCS_ENTRY(0,
-		   IG_PAT(0),
-		   L3_LKUP(1) | L3_3_WB),
-	/* Cached - L3 + L4 */
-	MOCS_ENTRY(1,
-		   IG_PAT(1),
-		   L3_LKUP(1) | L3_3_WB),
-	/* L4 - GO:L3 */
-	MOCS_ENTRY(2,
-		   IG_PAT(1),
-		   L3_LKUP(1) | L3_1_UC),
-	/* Uncached - GO:L3 */
-	MOCS_ENTRY(3,
-		   IG_PAT(1) | L4_3_UC,
-		   L3_LKUP(1) | L3_1_UC),
-	/* L4 - GO:Mem */
-	MOCS_ENTRY(4,
-		   IG_PAT(1),
-		   L3_LKUP(1) | L3_GLBGO(1) | L3_1_UC),
-	/* Uncached - GO:Mem */
-	MOCS_ENTRY(5,
-		   IG_PAT(1) | L4_3_UC,
-		   L3_LKUP(1) | L3_GLBGO(1) | L3_1_UC),
-	/* L4 - L3:NoLKUP; GO:L3 */
-	MOCS_ENTRY(6,
-		   IG_PAT(1),
-		   L3_1_UC),
-	/* Uncached - L3:NoLKUP; GO:L3 */
-	MOCS_ENTRY(7,
-		   IG_PAT(1) | L4_3_UC,
-		   L3_1_UC),
-	/* L4 - L3:NoLKUP; GO:Mem */
-	MOCS_ENTRY(8,
-		   IG_PAT(1),
-		   L3_GLBGO(1) | L3_1_UC),
-	/* Uncached - L3:NoLKUP; GO:Mem */
-	MOCS_ENTRY(9,
-		   IG_PAT(1) | L4_3_UC,
-		   L3_GLBGO(1) | L3_1_UC),
-	/* Display - L3; L4:WT */
-	MOCS_ENTRY(14,
-		   IG_PAT(1) | L4_1_WT,
-		   L3_LKUP(1) | L3_3_WB),
-	/* CCS - Non-Displayable */
-	MOCS_ENTRY(15,
-		   IG_PAT(1),
-		   L3_GLBGO(1) | L3_1_UC),
-};
-
 enum {
 	HAS_GLOBAL_MOCS = BIT(0),
 	HAS_ENGINE_MOCS = BIT(1),
@@ -507,13 +445,7 @@ static unsigned int get_mocs_settings(const struct drm_i915_private *i915,
 	memset(table, 0, sizeof(struct drm_i915_mocs_table));
 
 	table->unused_entries_index = I915_MOCS_PTE;
-	if (IS_METEORLAKE(i915)) {
-		table->size = ARRAY_SIZE(mtl_mocs_table);
-		table->table = mtl_mocs_table;
-		table->n_entries = MTL_NUM_MOCS_ENTRIES;
-		table->uc_index = 9;
-		table->unused_entries_index = 1;
-	} else if (IS_PONTEVECCHIO(i915)) {
+	if (IS_PONTEVECCHIO(i915)) {
 		table->size = ARRAY_SIZE(pvc_mocs_table);
 		table->table = pvc_mocs_table;
 		table->n_entries = PVC_NUM_MOCS_ENTRIES;
-- 
2.40.0

