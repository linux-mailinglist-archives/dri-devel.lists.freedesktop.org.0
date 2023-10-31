Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D4F7DCD61
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 13:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9998310E4A5;
	Tue, 31 Oct 2023 12:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C507E10E49E;
 Tue, 31 Oct 2023 12:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698757109; x=1730293109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NSw+GD+s+ieLT57voUqTk+IaLbBrHylLgyBfzZOfbio=;
 b=JxweOgoOdtg84fjSR2gfh8yuStPt8jHavntlOE394K72Jc4Xx8Psw1ud
 u0eagDBV5kPiSbBeMNGIzOT1vn0EpIkF+B+hjmSQ9bkRiLiru1AsC1SBb
 RIdM6xrOUT4tegutrrtBsRGccuuM8b1iQs5fTLZ1GbpFTMuEbiXM3yBqZ
 YHp03HwEGMlYEnm/UlQnw0hajmpFU7O7SMoi4VZvH2bymNvsJ2VbQEXXy
 WrBVzIQRzYvtZdlJTcX8c92Vq7f7L8r2nwtWF+WOyxkHM+GssNaZSIlqR
 fnD1TSfwoI8fB3qnM6u+gpBxww+jJ4nUER0jBI2+Tq4Epn3prMqYxWKYn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="391151773"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="391151773"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 05:58:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="1091991896"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="1091991896"
Received: from jachhoka-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.209.172.180])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 05:58:27 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915: Remove xehpsdv support
Date: Tue, 31 Oct 2023 12:58:16 +0000
Message-Id: <20231031125816.256211-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231031125816.256211-1-tvrtko.ursulin@linux.intel.com>
References: <20231031125816.256211-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

XeHP SDV was a pre-production hardware used to bring up PVC and was not
generally available and has since been decided will be supported in the
new xe driver and not i915.

v2:
 * Correct historical fact SDV was for PVC, not ATS. (John)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gsc.c         | 15 ----
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c      | 16 ----
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  1 -
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 20 ++---
 drivers/gpu/drm/i915/gt/intel_mocs.c        | 31 -------
 drivers/gpu/drm/i915/gt/intel_rps.c         |  4 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 95 ---------------------
 drivers/gpu/drm/i915/gt/uc/intel_uc.c       |  4 -
 drivers/gpu/drm/i915/i915_drv.h             |  4 -
 drivers/gpu/drm/i915/i915_hwmon.c           |  6 --
 drivers/gpu/drm/i915/i915_pci.c             | 17 ----
 drivers/gpu/drm/i915/i915_perf.c            |  4 +-
 drivers/gpu/drm/i915/i915_reg.h             |  1 -
 drivers/gpu/drm/i915/intel_clock_gating.c   | 10 ---
 drivers/gpu/drm/i915/intel_device_info.c    |  1 -
 drivers/gpu/drm/i915/intel_device_info.h    |  1 -
 drivers/gpu/drm/i915/intel_step.c           | 10 ---
 17 files changed, 8 insertions(+), 232 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gsc.c b/drivers/gpu/drm/i915/gt/intel_gsc.c
index 6d440de8ba01..1e925c75fb08 100644
--- a/drivers/gpu/drm/i915/gt/intel_gsc.c
+++ b/drivers/gpu/drm/i915/gt/intel_gsc.c
@@ -103,19 +103,6 @@ static const struct gsc_def gsc_def_dg1[] = {
 	}
 };
 
-static const struct gsc_def gsc_def_xehpsdv[] = {
-	{
-		/* HECI1 not enabled on the device. */
-	},
-	{
-		.name = "mei-gscfi",
-		.bar = DG1_GSC_HECI2_BASE,
-		.bar_size = GSC_BAR_LENGTH,
-		.use_polling = true,
-		.slow_firmware = true,
-	}
-};
-
 static const struct gsc_def gsc_def_dg2[] = {
 	{
 		.name = "mei-gsc",
@@ -188,8 +175,6 @@ static void gsc_init_one(struct drm_i915_private *i915, struct intel_gsc *gsc,
 
 	if (IS_DG1(i915)) {
 		def = &gsc_def_dg1[intf_id];
-	} else if (IS_XEHPSDV(i915)) {
-		def = &gsc_def_xehpsdv[intf_id];
 	} else if (IS_DG2(i915)) {
 		def = &gsc_def_dg2[intf_id];
 	} else {
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
index 6afd89a18146..0476eda6c333 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -63,18 +63,6 @@ static const struct intel_mmio_range xehpsdv_mslice_steering_table[] = {
 	{},
 };
 
-static const struct intel_mmio_range xehpsdv_gam_steering_table[] = {
-	{ 0x004000, 0x004AFF },
-	{ 0x00C800, 0x00CFFF },
-	{},
-};
-
-static const struct intel_mmio_range xehpsdv_lncf_steering_table[] = {
-	{ 0x00B000, 0x00B0FF },
-	{ 0x00D800, 0x00D8FF },
-	{},
-};
-
 static const struct intel_mmio_range dg2_lncf_steering_table[] = {
 	{ 0x00B000, 0x00B0FF },
 	{ 0x00D880, 0x00D8FF },
@@ -172,10 +160,6 @@ void intel_gt_mcr_init(struct intel_gt *gt)
 		 * steering control register on DG2 and can use implicit
 		 * steering.
 		 */
-	} else if (IS_XEHPSDV(i915)) {
-		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
-		gt->steering_table[LNCF] = xehpsdv_lncf_steering_table;
-		gt->steering_table[GAM] = xehpsdv_gam_steering_table;
 	} else if (GRAPHICS_VER(i915) >= 11 &&
 		   GRAPHICS_VER_FULL(i915) < IP_VER(12, 50)) {
 		gt->steering_table[L3BANK] = icl_l3bank_steering_table;
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index eecd0a87a647..9d43b9681c7a 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -712,7 +712,6 @@
 
 #define UNSLICE_UNIT_LEVEL_CLKGATE		_MMIO(0x9434)
 #define   VFUNIT_CLKGATE_DIS			REG_BIT(20)
-#define   TSGUNIT_CLKGATE_DIS			REG_BIT(17) /* XEHPSDV */
 #define   CG3DDISCFEG_CLKGATE_DIS		REG_BIT(17) /* DG2 */
 #define   GAMEDIA_CLKGATE_DIS			REG_BIT(11)
 #define   HSUNIT_CLKGATE_DIS			REG_BIT(8)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
index f0dea54880af..c88c2ec7ad78 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
@@ -587,7 +587,6 @@ static ssize_t media_freq_factor_show(struct kobject *kobj,
 				      char *buff)
 {
 	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
-	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
 	intel_wakeref_t wakeref;
 	u32 mode;
 
@@ -595,20 +594,11 @@ static ssize_t media_freq_factor_show(struct kobject *kobj,
 	 * Retrieve media_ratio_mode from GEN6_RPNSWREQ bit 13 set by
 	 * GuC. GEN6_RPNSWREQ:13 value 0 represents 1:2 and 1 represents 1:1
 	 */
-	if (IS_XEHPSDV(gt->i915) &&
-	    slpc->media_ratio_mode == SLPC_MEDIA_RATIO_MODE_DYNAMIC_CONTROL) {
-		/*
-		 * For XEHPSDV dynamic mode GEN6_RPNSWREQ:13 does not contain
-		 * the media_ratio_mode, just return the cached media ratio
-		 */
-		mode = slpc->media_ratio_mode;
-	} else {
-		with_intel_runtime_pm(gt->uncore->rpm, wakeref)
-			mode = intel_uncore_read(gt->uncore, GEN6_RPNSWREQ);
-		mode = REG_FIELD_GET(GEN12_MEDIA_FREQ_RATIO, mode) ?
-			SLPC_MEDIA_RATIO_MODE_FIXED_ONE_TO_ONE :
-			SLPC_MEDIA_RATIO_MODE_FIXED_ONE_TO_TWO;
-	}
+	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
+		mode = intel_uncore_read(gt->uncore, GEN6_RPNSWREQ);
+	mode = REG_FIELD_GET(GEN12_MEDIA_FREQ_RATIO, mode) ?
+	       SLPC_MEDIA_RATIO_MODE_FIXED_ONE_TO_ONE :
+	       SLPC_MEDIA_RATIO_MODE_FIXED_ONE_TO_TWO;
 
 	return sysfs_emit(buff, "%u\n", media_ratio_mode_to_factor(mode));
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
index 556e7d0742e5..2fa9070d9cc6 100644
--- a/drivers/gpu/drm/i915/gt/intel_mocs.c
+++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
@@ -366,31 +366,6 @@ static const struct drm_i915_mocs_entry gen12_mocs_table[] = {
 		   L3_3_WB),
 };
 
-static const struct drm_i915_mocs_entry xehpsdv_mocs_table[] = {
-	/* wa_1608975824 */
-	MOCS_ENTRY(0, 0, L3_3_WB | L3_LKUP(1)),
-
-	/* UC - Coherent; GO:L3 */
-	MOCS_ENTRY(1, 0, L3_1_UC | L3_LKUP(1)),
-	/* UC - Coherent; GO:Memory */
-	MOCS_ENTRY(2, 0, L3_1_UC | L3_GLBGO(1) | L3_LKUP(1)),
-	/* UC - Non-Coherent; GO:Memory */
-	MOCS_ENTRY(3, 0, L3_1_UC | L3_GLBGO(1)),
-	/* UC - Non-Coherent; GO:L3 */
-	MOCS_ENTRY(4, 0, L3_1_UC),
-
-	/* WB */
-	MOCS_ENTRY(5, 0, L3_3_WB | L3_LKUP(1)),
-
-	/* HW Reserved - SW program but never use. */
-	MOCS_ENTRY(48, 0, L3_3_WB | L3_LKUP(1)),
-	MOCS_ENTRY(49, 0, L3_1_UC | L3_LKUP(1)),
-	MOCS_ENTRY(60, 0, L3_1_UC),
-	MOCS_ENTRY(61, 0, L3_1_UC),
-	MOCS_ENTRY(62, 0, L3_1_UC),
-	MOCS_ENTRY(63, 0, L3_1_UC),
-};
-
 static const struct drm_i915_mocs_entry dg2_mocs_table[] = {
 	/* UC - Coherent; GO:L3 */
 	MOCS_ENTRY(0, 0, L3_1_UC | L3_LKUP(1)),
@@ -495,12 +470,6 @@ static unsigned int get_mocs_settings(struct drm_i915_private *i915,
 		table->uc_index = 1;
 		table->n_entries = GEN9_NUM_MOCS_ENTRIES;
 		table->unused_entries_index = 3;
-	} else if (IS_XEHPSDV(i915)) {
-		table->size = ARRAY_SIZE(xehpsdv_mocs_table);
-		table->table = xehpsdv_mocs_table;
-		table->uc_index = 2;
-		table->n_entries = GEN9_NUM_MOCS_ENTRIES;
-		table->unused_entries_index = 5;
 	} else if (IS_DG1(i915)) {
 		table->size = ARRAY_SIZE(dg1_mocs_table);
 		table->table = dg1_mocs_table;
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index cbb03358fbb3..005942b145aa 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1086,9 +1086,7 @@ static u32 intel_rps_read_state_cap(struct intel_rps *rps)
 	struct drm_i915_private *i915 = rps_to_i915(rps);
 	struct intel_uncore *uncore = rps_to_uncore(rps);
 
-	if (IS_XEHPSDV(i915))
-		return intel_uncore_read(uncore, XEHPSDV_RP_STATE_CAP);
-	else if (IS_GEN9_LP(i915))
+	if (IS_GEN9_LP(i915))
 		return intel_uncore_read(uncore, BXT_RP_STATE_CAP);
 	else
 		return intel_uncore_read(uncore, GEN6_RP_STATE_CAP);
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 421a87a4edbd..d0443689e0d4 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -903,8 +903,6 @@ __intel_engine_init_ctx_wa(struct intel_engine_cs *engine,
 		xelpg_ctx_workarounds_init(engine, wal);
 	else if (IS_DG2(i915))
 		dg2_ctx_workarounds_init(engine, wal);
-	else if (IS_XEHPSDV(i915))
-		; /* noop; none at this time */
 	else if (IS_DG1(i915))
 		dg1_ctx_workarounds_init(engine, wal);
 	else if (GRAPHICS_VER(i915) == 12)
@@ -1330,9 +1328,6 @@ xehp_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
 		gt->steering_table[MSLICE] = NULL;
 	}
 
-	if (IS_XEHPSDV(gt->i915) && slice_mask & BIT(0))
-		gt->steering_table[GAM] = NULL;
-
 	slice = __ffs(slice_mask);
 	subslice = intel_sseu_find_first_xehp_dss(sseu, GEN_DSS_PER_GSLICE, slice) %
 		GEN_DSS_PER_GSLICE;
@@ -1485,76 +1480,6 @@ dg1_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 	wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE2, VSUNIT_CLKGATE_DIS_TGL);
 }
 
-static void
-xehpsdv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
-{
-	struct drm_i915_private *i915 = gt->i915;
-
-	xehp_init_mcr(gt, wal);
-
-	/* Wa_1409757795:xehpsdv */
-	wa_mcr_write_or(wal, SCCGCTL94DC, CG3DDISURB);
-
-	/* Wa_18011725039:xehpsdv */
-	if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_A1, STEP_B0)) {
-		wa_mcr_masked_dis(wal, MLTICTXCTL, TDONRENDER);
-		wa_mcr_write_or(wal, L3SQCREG1_CCS0, FLUSHALLNONCOH);
-	}
-
-	/* Wa_16011155590:xehpsdv */
-	if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_A0, STEP_B0))
-		wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE,
-			    TSGUNIT_CLKGATE_DIS);
-
-	/* Wa_14011780169:xehpsdv */
-	if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_B0, STEP_FOREVER)) {
-		wa_write_or(wal, UNSLCGCTL9440, GAMTLBOACS_CLKGATE_DIS |
-			    GAMTLBVDBOX7_CLKGATE_DIS |
-			    GAMTLBVDBOX6_CLKGATE_DIS |
-			    GAMTLBVDBOX5_CLKGATE_DIS |
-			    GAMTLBVDBOX4_CLKGATE_DIS |
-			    GAMTLBVDBOX3_CLKGATE_DIS |
-			    GAMTLBVDBOX2_CLKGATE_DIS |
-			    GAMTLBVDBOX1_CLKGATE_DIS |
-			    GAMTLBVDBOX0_CLKGATE_DIS |
-			    GAMTLBKCR_CLKGATE_DIS |
-			    GAMTLBGUC_CLKGATE_DIS |
-			    GAMTLBBLT_CLKGATE_DIS);
-		wa_write_or(wal, UNSLCGCTL9444, GAMTLBGFXA0_CLKGATE_DIS |
-			    GAMTLBGFXA1_CLKGATE_DIS |
-			    GAMTLBCOMPA0_CLKGATE_DIS |
-			    GAMTLBCOMPA1_CLKGATE_DIS |
-			    GAMTLBCOMPB0_CLKGATE_DIS |
-			    GAMTLBCOMPB1_CLKGATE_DIS |
-			    GAMTLBCOMPC0_CLKGATE_DIS |
-			    GAMTLBCOMPC1_CLKGATE_DIS |
-			    GAMTLBCOMPD0_CLKGATE_DIS |
-			    GAMTLBCOMPD1_CLKGATE_DIS |
-			    GAMTLBMERT_CLKGATE_DIS   |
-			    GAMTLBVEBOX3_CLKGATE_DIS |
-			    GAMTLBVEBOX2_CLKGATE_DIS |
-			    GAMTLBVEBOX1_CLKGATE_DIS |
-			    GAMTLBVEBOX0_CLKGATE_DIS);
-	}
-
-	/* Wa_16012725990:xehpsdv */
-	if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_A1, STEP_FOREVER))
-		wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE, VFUNIT_CLKGATE_DIS);
-
-	/* Wa_14011060649:xehpsdv */
-	wa_14011060649(gt, wal);
-
-	/* Wa_14012362059:xehpsdv */
-	wa_mcr_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
-
-	/* Wa_14014368820:xehpsdv */
-	wa_mcr_write_or(wal, XEHP_GAMCNTRL_CTRL,
-			INVALIDATION_BROADCAST_MODE_DIS | GLOBAL_INVALIDATION_MODE);
-
-	/* Wa_14010670810:xehpsdv */
-	wa_mcr_write_or(wal, XEHP_L3NODEARBCFG, XEHP_LNESPARE);
-}
-
 static void
 dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 {
@@ -1684,8 +1609,6 @@ gt_init_workarounds(struct intel_gt *gt, struct i915_wa_list *wal)
 		xelpg_gt_workarounds_init(gt, wal);
 	else if (IS_DG2(i915))
 		dg2_gt_workarounds_init(gt, wal);
-	else if (IS_XEHPSDV(i915))
-		xehpsdv_gt_workarounds_init(gt, wal);
 	else if (IS_DG1(i915))
 		dg1_gt_workarounds_init(gt, wal);
 	else if (GRAPHICS_VER(i915) == 12)
@@ -2131,8 +2054,6 @@ void intel_engine_init_whitelist(struct intel_engine_cs *engine)
 		xelpg_whitelist_build(engine);
 	else if (IS_DG2(i915))
 		dg2_whitelist_build(engine);
-	else if (IS_XEHPSDV(i915))
-		; /* none needed */
 	else if (GRAPHICS_VER(i915) == 12)
 		tgl_whitelist_build(engine);
 	else if (GRAPHICS_VER(i915) == 11)
@@ -2876,22 +2797,6 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
 		/* Wa_18028616096 */
 		wa_mcr_write_or(wal, LSC_CHICKEN_BIT_0_UDW, UGM_FRAGMENT_THRESHOLD_TO_3);
 	}
-
-	if (IS_XEHPSDV(i915)) {
-		/* Wa_1409954639 */
-		wa_mcr_masked_en(wal,
-				 GEN8_ROW_CHICKEN,
-				 SYSTOLIC_DOP_CLOCK_GATING_DIS);
-
-		/* Wa_1607196519 */
-		wa_mcr_masked_en(wal,
-				 GEN9_ROW_CHICKEN4,
-				 GEN12_DISABLE_GRF_CLEAR);
-
-		/* Wa_14010449647:xehpsdv */
-		wa_mcr_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
-				 GEN7_PSD_SINGLE_PORT_DISPATCH_ENABLE);
-	}
 }
 
 static void
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index dfa9b615af69..c77acaa79fe3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -50,10 +50,6 @@ static void uc_expand_default_options(struct intel_uc *uc)
 
 	/* Default: enable HuC authentication and GuC submission */
 	i915->params.enable_guc = ENABLE_GUC_LOAD_HUC | ENABLE_GUC_SUBMISSION;
-
-	/* XEHPSDV does not use HuC */
-	if (IS_XEHPSDV(i915))
-		i915->params.enable_guc &= ~ENABLE_GUC_LOAD_HUC;
 }
 
 /* Reset GuC providing us with fresh state for both GuC and HuC.
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 4df4f4d534a3..bfcbe93bd9fe 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -571,7 +571,6 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define IS_DG1(i915)        IS_PLATFORM(i915, INTEL_DG1)
 #define IS_ALDERLAKE_S(i915) IS_PLATFORM(i915, INTEL_ALDERLAKE_S)
 #define IS_ALDERLAKE_P(i915) IS_PLATFORM(i915, INTEL_ALDERLAKE_P)
-#define IS_XEHPSDV(i915) IS_PLATFORM(i915, INTEL_XEHPSDV)
 #define IS_DG2(i915)	IS_PLATFORM(i915, INTEL_DG2)
 #define IS_METEORLAKE(i915) IS_PLATFORM(i915, INTEL_METEORLAKE)
 #define IS_LUNARLAKE(i915) 0
@@ -647,9 +646,6 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define IS_TIGERLAKE_UY(i915) \
 	IS_SUBPLATFORM(i915, INTEL_TIGERLAKE, INTEL_SUBPLATFORM_UY)
 
-#define IS_XEHPSDV_GRAPHICS_STEP(__i915, since, until) \
-	(IS_XEHPSDV(__i915) && IS_GRAPHICS_STEP(__i915, since, until))
-
 #define IS_LP(i915)		(INTEL_INFO(i915)->is_lp)
 #define IS_GEN9_LP(i915)	(GRAPHICS_VER(i915) == 9 && IS_LP(i915))
 #define IS_GEN9_BC(i915)	(GRAPHICS_VER(i915) == 9 && !IS_LP(i915))
diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 975da8e7f2a9..3baa589dce52 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -738,12 +738,6 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
 		hwmon->rg.pkg_rapl_limit = PCU_PACKAGE_RAPL_LIMIT;
 		hwmon->rg.energy_status_all = PCU_PACKAGE_ENERGY_STATUS;
 		hwmon->rg.energy_status_tile = INVALID_MMIO_REG;
-	} else if (IS_XEHPSDV(i915)) {
-		hwmon->rg.pkg_power_sku_unit = GT0_PACKAGE_POWER_SKU_UNIT;
-		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
-		hwmon->rg.pkg_rapl_limit = GT0_PACKAGE_RAPL_LIMIT;
-		hwmon->rg.energy_status_all = GT0_PLATFORM_ENERGY_STATUS;
-		hwmon->rg.energy_status_tile = GT0_PACKAGE_ENERGY_STATUS;
 	} else {
 		hwmon->rg.pkg_power_sku_unit = INVALID_MMIO_REG;
 		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 9d48e9a9943b..ef4b5fd28892 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -726,23 +726,6 @@ static const struct intel_device_info adl_p_info = {
 	.__runtime.media.ip.ver = 12, \
 	.__runtime.media.ip.rel = 50
 
-__maybe_unused
-static const struct intel_device_info xehpsdv_info = {
-	XE_HP_FEATURES,
-	XE_HPM_FEATURES,
-	DGFX_FEATURES,
-	PLATFORM(INTEL_XEHPSDV),
-	.has_64k_pages = 1,
-	.has_media_ratio_mode = 1,
-	.platform_engine_mask =
-		BIT(RCS0) | BIT(BCS0) |
-		BIT(VECS0) | BIT(VECS1) | BIT(VECS2) | BIT(VECS3) |
-		BIT(VCS0) | BIT(VCS1) | BIT(VCS2) | BIT(VCS3) |
-		BIT(VCS4) | BIT(VCS5) | BIT(VCS6) | BIT(VCS7) |
-		BIT(CCS0) | BIT(CCS1) | BIT(CCS2) | BIT(CCS3),
-	.require_force_probe = 1,
-};
-
 #define DG2_FEATURES \
 	XE_HP_FEATURES, \
 	XE_HPM_FEATURES, \
diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index f92c2a464ebe..d752733af975 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -2856,7 +2856,7 @@ gen12_enable_metric_set(struct i915_perf_stream *stream,
 	 * EU NOA signals behave incorrectly if EU clock gating is enabled.
 	 * Disable thread stall DOP gating and EU DOP gating.
 	 */
-	if (IS_XEHPSDV(i915) || IS_DG2(i915)) {
+	if (IS_DG2(i915)) {
 		intel_gt_mcr_multicast_write(uncore->gt, GEN8_ROW_CHICKEN,
 					     _MASKED_BIT_ENABLE(STALL_DOP_GATING_DISABLE));
 		intel_uncore_write(uncore, GEN7_ROW_CHICKEN2,
@@ -2945,7 +2945,7 @@ static void gen12_disable_metric_set(struct i915_perf_stream *stream)
 	 * Wa_1508761755:xehpsdv, dg2
 	 * Enable thread stall DOP gating and EU DOP gating.
 	 */
-	if (IS_XEHPSDV(i915) || IS_DG2(i915)) {
+	if (IS_DG2(i915)) {
 		intel_gt_mcr_multicast_write(uncore->gt, GEN8_ROW_CHICKEN,
 					     _MASKED_BIT_DISABLE(STALL_DOP_GATING_DISABLE));
 		intel_uncore_write(uncore, GEN7_ROW_CHICKEN2,
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index fcbef9128cd7..17bd50dad9f1 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -1752,7 +1752,6 @@
 
 #define BXT_RP_STATE_CAP        _MMIO(0x138170)
 #define GEN9_RP_STATE_LIMITS	_MMIO(0x138148)
-#define XEHPSDV_RP_STATE_CAP	_MMIO(0x250014)
 
 #define MTL_RP_STATE_CAP	_MMIO(0x138000)
 #define MTL_MEDIAP_STATE_CAP	_MMIO(0x138020)
diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
index 4135d09a6a8f..be355c1fefc6 100644
--- a/drivers/gpu/drm/i915/intel_clock_gating.c
+++ b/drivers/gpu/drm/i915/intel_clock_gating.c
@@ -349,13 +349,6 @@ static void gen8_set_l3sqc_credits(struct drm_i915_private *i915,
 	intel_uncore_write(&i915->uncore, GEN7_MISCCPCTL, misccpctl);
 }
 
-static void xehpsdv_init_clock_gating(struct drm_i915_private *i915)
-{
-	/* Wa_22010146351:xehpsdv */
-	if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_A0, STEP_B0))
-		intel_uncore_rmw(&i915->uncore, XEHP_CLOCK_GATE_DIS, 0, SGR_DIS);
-}
-
 static void dg2_init_clock_gating(struct drm_i915_private *i915)
 {
 	/* Wa_22010954014:dg2 */
@@ -752,7 +745,6 @@ static const struct drm_i915_clock_gating_funcs platform##_clock_gating_funcs =
 }
 
 CG_FUNCS(dg2);
-CG_FUNCS(xehpsdv);
 CG_FUNCS(cfl);
 CG_FUNCS(skl);
 CG_FUNCS(kbl);
@@ -787,8 +779,6 @@ void intel_clock_gating_hooks_init(struct drm_i915_private *i915)
 {
 	if (IS_DG2(i915))
 		i915->clock_gating_funcs = &dg2_clock_gating_funcs;
-	else if (IS_XEHPSDV(i915))
-		i915->clock_gating_funcs = &xehpsdv_clock_gating_funcs;
 	else if (IS_COFFEELAKE(i915) || IS_COMETLAKE(i915))
 		i915->clock_gating_funcs = &cfl_clock_gating_funcs;
 	else if (IS_SKYLAKE(i915))
diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index 014a8af8381b..a0a43ea07f11 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -70,7 +70,6 @@ static const char * const platform_names[] = {
 	PLATFORM_NAME(DG1),
 	PLATFORM_NAME(ALDERLAKE_S),
 	PLATFORM_NAME(ALDERLAKE_P),
-	PLATFORM_NAME(XEHPSDV),
 	PLATFORM_NAME(DG2),
 	PLATFORM_NAME(METEORLAKE),
 };
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index df58d9f667b8..d1a2abc7e513 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -87,7 +87,6 @@ enum intel_platform {
 	INTEL_DG1,
 	INTEL_ALDERLAKE_S,
 	INTEL_ALDERLAKE_P,
-	INTEL_XEHPSDV,
 	INTEL_DG2,
 	INTEL_METEORLAKE,
 	INTEL_MAX_PLATFORMS
diff --git a/drivers/gpu/drm/i915/intel_step.c b/drivers/gpu/drm/i915/intel_step.c
index 5a2ba2a1760a..a5adfb5d8fd2 100644
--- a/drivers/gpu/drm/i915/intel_step.c
+++ b/drivers/gpu/drm/i915/intel_step.c
@@ -102,13 +102,6 @@ static const struct intel_step_info adlp_revids[] = {
 	[0xC] = { COMMON_GT_MEDIA_STEP(C0), .display_step = STEP_D0 },
 };
 
-static const struct intel_step_info xehpsdv_revids[] = {
-	[0x0] = { COMMON_GT_MEDIA_STEP(A0) },
-	[0x1] = { COMMON_GT_MEDIA_STEP(A1) },
-	[0x4] = { COMMON_GT_MEDIA_STEP(B0) },
-	[0x8] = { COMMON_GT_MEDIA_STEP(C0) },
-};
-
 static const struct intel_step_info dg2_g10_revid_step_tbl[] = {
 	[0x0] = { COMMON_GT_MEDIA_STEP(A0), .display_step = STEP_A0 },
 	[0x1] = { COMMON_GT_MEDIA_STEP(A1), .display_step = STEP_A0 },
@@ -185,9 +178,6 @@ void intel_step_init(struct drm_i915_private *i915)
 	} else if (IS_DG2_G12(i915)) {
 		revids = dg2_g12_revid_step_tbl;
 		size = ARRAY_SIZE(dg2_g12_revid_step_tbl);
-	} else if (IS_XEHPSDV(i915)) {
-		revids = xehpsdv_revids;
-		size = ARRAY_SIZE(xehpsdv_revids);
 	} else if (IS_ALDERLAKE_P_N(i915)) {
 		revids = adlp_n_revids;
 		size = ARRAY_SIZE(adlp_n_revids);
-- 
2.39.2

