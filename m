Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 209F6653CFB
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 09:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0502F10E524;
	Thu, 22 Dec 2022 08:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BB810E15A;
 Thu, 22 Dec 2022 08:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671697584; x=1703233584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/pXhnoD5VCUl/suvCRhM4VH93ptR3MtpFRIqNU2h8HU=;
 b=S+dV18EY0fhuKovdrdOmBRF2HlZ4jzLPL0kxXfsEM4XvOEi2E0LdumQY
 /tf1DPFOHMPT7ZQfL/K/LATY39cJfbamgqhvW/edKHo7++soVrxDza62K
 PsPSQWI668mIZdlTsdehJpmZ/kA7yDqdZOhFBajAPUgATYXwqL4Kg4PAb
 FMR986KulMQWonXFoKs4xX9cypf6tcuyMBmZ1FDXfpEly6dK1dvepRDmh
 Yd/P7bIGtf5iLrMkISs/o7voIrb3zfmq+kSCJ1SULI5JZYcgj1e6muiH3
 dublXG7LVL6mJn/5aJJwsGC1yq5wbm1UEXz+JpIiMce+WNW5IJVf04+gZ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="384426686"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="384426686"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 00:26:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="645127599"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="645127599"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 00:26:22 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/i915: Remove platform comments from workarounds
Date: Thu, 22 Dec 2022 00:25:56 -0800
Message-Id: <20221222082557.1364711-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221222082557.1364711-1-lucas.demarchi@intel.com>
References: <20221222082557.1364711-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The comments are redundant to the checks being done to apply the
workarounds and very often get outdated as workarounds need to be
extended to new platforms or steppings.  Remove them altogether with
the following matches (platforms extracted from intel_workarounds.c):

	find drivers/gpu/drm/i915/ -name '*.c' | xargs sed -i -E \
		's/(Wa.*):(bdw|chv|bxt|glk|skl|kbl|cfl|cfl|whl|cml|aml|chv|cl|bw|ctg|elk|ilk|snb|dg|pvc|g4x|ilk|gen|glk|kbl|cml|glk|kbl|cml|hsw|icl|ehl|ivb|hsw|ivb|vlv|kbl|pvc|rkl|dg|adl|skl|skl|bxt|blk|cfl|cnl|glk|snb|tgl|vlv|xehpsdv).*/\1/'
	find drivers/gpu/drm/i915/ -name '*.c' | xargs sed -i -E \
		's/(Wa.*):(bdw|chv|bxt|glk|skl|kbl|cfl|cfl|whl|cml|aml|chv|cl|bw|ctg|elk|ilk|snb|dg|pvc|g4x|ilk|gen|glk|kbl|cml|glk|kbl|cml|hsw|icl|ehl|ivb|hsw|ivb|vlv|kbl|pvc|rkl|dg|adl|skl|skl|bxt|blk|cfl|cnl|glk|snb|tgl|vlv|xehpsdv).*\*\//\1

There were a few false positives that included the workaround
description. Those were manually patched.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/display/g4x_hdmi.c       |   2 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c     |   2 +-
 drivers/gpu/drm/i915/display/icl_dsi.c        |  10 +-
 .../gpu/drm/i915/display/intel_atomic_plane.c |   2 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |   2 +-
 drivers/gpu/drm/i915/display/intel_cursor.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_display.c  |  20 +--
 .../drm/i915/display/intel_display_power.c    |   8 +-
 .../i915/display/intel_display_power_well.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_dmc.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_dpll.c     |   2 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |   2 +-
 drivers/gpu/drm/i915/display/intel_fbc.c      |  10 +-
 drivers/gpu/drm/i915/display/intel_fdi.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |   2 +-
 .../drm/i915/display/intel_modeset_setup.c    |   4 +-
 .../gpu/drm/i915/display/intel_pch_refclk.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |  24 ++--
 drivers/gpu/drm/i915/display/intel_sprite.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_vga.c      |   2 +-
 .../drm/i915/display/skl_universal_plane.c    |   6 +-
 drivers/gpu/drm/i915/display/skl_watermark.c  |   8 +-
 drivers/gpu/drm/i915/gvt/mmio_context.c       |   2 +-
 drivers/gpu/drm/i915/i915_perf.c              |  10 +-
 drivers/gpu/drm/i915/intel_pm.c               | 132 +++++++++---------
 drivers/gpu/drm/i915/intel_uncore.c           |   8 +-
 26 files changed, 135 insertions(+), 135 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/g4x_hdmi.c b/drivers/gpu/drm/i915/display/g4x_hdmi.c
index c3580d96765c..7e6e51b496aa 100644
--- a/drivers/gpu/drm/i915/display/g4x_hdmi.c
+++ b/drivers/gpu/drm/i915/display/g4x_hdmi.c
@@ -261,7 +261,7 @@ static void cpt_enable_hdmi(struct intel_atomic_state *state,
 		temp |= HDMI_AUDIO_ENABLE;
 
 	/*
-	 * WaEnableHDMI8bpcBefore12bpc:snb,ivb
+	 * WaEnableHDMI8bpcBefore12bpc
 	 *
 	 * The procedure for 12bpc is as follows:
 	 * 1. disable HDMI clock gating
diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index ecaeb7dc196b..dc26f2716dcb 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -807,7 +807,7 @@ intel_primary_plane_create(struct drm_i915_private *dev_priv, enum pipe pipe)
 		num_formats = ARRAY_SIZE(vlv_primary_formats);
 	} else if (DISPLAY_VER(dev_priv) >= 4) {
 		/*
-		 * WaFP16GammaEnabling:ivb
+		 * WaFP16GammaEnabling
 		 * "Workaround : When using the 64-bit format, the plane
 		 *  output on each color channel has one quarter amplitude.
 		 *  It can be brought up to full amplitude by using pipe
diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index ae14c794c4bc..eff1c46d6ab2 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -1241,7 +1241,7 @@ static void gen11_dsi_pre_enable(struct intel_atomic_state *state,
 }
 
 /*
- * Wa_1409054076:icl,jsl,ehl
+ * Wa_1409054076
  * When pipe A is disabled and MIPI DSI is enabled on pipe B,
  * the AMT KVMR feature will incorrectly see pipe A as enabled.
  * Set 0x42080 bit 23=1 before enabling DSI on pipe B and leave
@@ -1259,7 +1259,7 @@ static void icl_apply_kvmr_pipe_a_wa(struct intel_encoder *encoder,
 }
 
 /*
- * Wa_16012360555:adl-p
+ * Wa_16012360555
  * SW will have to program the "LP to HS Wakeup Guardband"
  * to account for the repeaters on the HS Request/Ready
  * PPI signaling between the Display engine and the DPHY.
@@ -1288,10 +1288,10 @@ static void gen11_dsi_enable(struct intel_atomic_state *state,
 
 	drm_WARN_ON(state->base.dev, crtc_state->has_pch_encoder);
 
-	/* Wa_1409054076:icl,jsl,ehl */
+	/* Wa_1409054076 */
 	icl_apply_kvmr_pipe_a_wa(encoder, crtc->pipe, true);
 
-	/* Wa_16012360555:adl-p */
+	/* Wa_16012360555 */
 	adlp_set_lp_hs_wakeup_gb(encoder);
 
 	/* step6d: enable dsi transcoder */
@@ -1456,7 +1456,7 @@ static void gen11_dsi_disable(struct intel_atomic_state *state,
 	/* step2d,e: disable transcoder and wait */
 	gen11_dsi_disable_transcoder(encoder);
 
-	/* Wa_1409054076:icl,jsl,ehl */
+	/* Wa_1409054076 */
 	icl_apply_kvmr_pipe_a_wa(encoder, crtc->pipe, false);
 
 	/* step2f,g: powerdown panel */
diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 10e1fc9d0698..fe9ca39bdfbd 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -557,7 +557,7 @@ static int intel_plane_atomic_calc_changes(const struct intel_crtc_state *old_cr
 	 * once the sprite has been enabled.
 	 *
 	 *
-	 * WaCxSRDisabledForSpriteScaling:ivb
+	 * WaCxSRDisabledForSpriteScaling
 	 * IVB SPR_SCALE/Scaling Enable
 	 * "Low Power watermarks must be disabled for at least one
 	 *  frame before enabling sprite scaling, and kept disabled
diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 0c107a38f9d0..2ea764c40a36 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -3350,7 +3350,7 @@ void intel_init_cdclk_hooks(struct drm_i915_private *dev_priv)
 		dev_priv->display.cdclk.table = dg2_cdclk_table;
 	} else if (IS_ALDERLAKE_P(dev_priv)) {
 		dev_priv->display.funcs.cdclk = &tgl_cdclk_funcs;
-		/* Wa_22011320316:adl-p[a0] */
+		/* Wa_22011320316 */
 		if (IS_ADLP_DISPLAY_STEP(dev_priv, STEP_A0, STEP_B0))
 			dev_priv->display.cdclk.table = adlp_a_step_cdclk_table;
 		else
diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index d190fa0d393b..9e10eebc8463 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -380,7 +380,7 @@ static u32 i9xx_cursor_ctl(const struct intel_crtc_state *crtc_state,
 	if (plane_state->hw.rotation & DRM_MODE_ROTATE_180)
 		cntl |= MCURSOR_ROTATE_180;
 
-	/* Wa_22012358565:adl-p */
+	/* Wa_22012358565 */
 	if (DISPLAY_VER(dev_priv) == 13)
 		cntl |= MCURSOR_ARB_SLOTS(1);
 
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index e75b9b2a0e01..c93b0bccc934 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -300,7 +300,7 @@ skl_wa_827(struct drm_i915_private *dev_priv, enum pipe pipe, bool enable)
 		               intel_de_read(dev_priv, CLKGATE_DIS_PSL(pipe)) & ~(DUPS1_GATING_DIS | DUPS2_GATING_DIS));
 }
 
-/* Wa_2006604312:icl,ehl */
+/* Wa_2006604312 */
 static void
 icl_wa_scalerclkgating(struct drm_i915_private *dev_priv, enum pipe pipe,
 		       bool enable)
@@ -313,7 +313,7 @@ icl_wa_scalerclkgating(struct drm_i915_private *dev_priv, enum pipe pipe,
 		               intel_de_read(dev_priv, CLKGATE_DIS_PSL(pipe)) & ~DPFR_GATING_DIS);
 }
 
-/* Wa_1604331009:icl,jsl,ehl */
+/* Wa_1604331009 */
 static void
 icl_wa_cursorclkgating(struct drm_i915_private *dev_priv, enum pipe pipe,
 		       bool enable)
@@ -560,7 +560,7 @@ void intel_enable_transcoder(const struct intel_crtc_state *new_crtc_state)
 		/* FIXME: assert CPU port conditions for SNB+ */
 	}
 
-	/* Wa_22012358565:adl-p */
+	/* Wa_22012358565 */
 	if (DISPLAY_VER(dev_priv) == 13)
 		intel_de_rmw(dev_priv, PIPE_ARB_CTL(pipe),
 			     0, PIPE_ARB_USE_PROG_SLOTS);
@@ -1031,7 +1031,7 @@ static void icl_set_pipe_chicken(const struct intel_crtc_state *crtc_state)
 	else if (DISPLAY_VER(dev_priv) >= 13)
 		tmp |= UNDERRUN_RECOVERY_DISABLE_ADLP;
 
-	/* Wa_14010547955:dg2 */
+	/* Wa_14010547955 */
 	if (IS_DG2_DISPLAY_STEP(dev_priv, STEP_B0, STEP_FOREVER))
 		tmp |= DG2_RENDER_CCSTAG_4_3_EN;
 
@@ -1167,7 +1167,7 @@ static bool needs_scalerclk_wa(const struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
 
-	/* Wa_2006604312:icl,ehl */
+	/* Wa_2006604312 */
 	if (crtc_state->scaler_state.scaler_users > 0 && DISPLAY_VER(dev_priv) == 11)
 		return true;
 
@@ -1178,7 +1178,7 @@ static bool needs_cursorclk_wa(const struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
 
-	/* Wa_1604331009:icl,jsl,ehl */
+	/* Wa_1604331009 */
 	if (is_hdr_mode(crtc_state) &&
 	    crtc_state->active_planes & BIT(PLANE_CURSOR) &&
 	    DISPLAY_VER(dev_priv) == 11)
@@ -1356,12 +1356,12 @@ static void intel_pre_plane_update(struct intel_atomic_state *state,
 	    needs_nv12_wa(new_crtc_state))
 		skl_wa_827(dev_priv, pipe, true);
 
-	/* Wa_2006604312:icl,ehl */
+	/* Wa_2006604312 */
 	if (!needs_scalerclk_wa(old_crtc_state) &&
 	    needs_scalerclk_wa(new_crtc_state))
 		icl_wa_scalerclkgating(dev_priv, pipe, true);
 
-	/* Wa_1604331009:icl,jsl,ehl */
+	/* Wa_1604331009 */
 	if (!needs_cursorclk_wa(old_crtc_state) &&
 	    needs_cursorclk_wa(new_crtc_state))
 		icl_wa_cursorclkgating(dev_priv, pipe, true);
@@ -1384,7 +1384,7 @@ static void intel_pre_plane_update(struct intel_atomic_state *state,
 	 * one frame before enabling scaling.  LP watermarks can be re-enabled
 	 * when scaling is disabled.
 	 *
-	 * WaCxSRDisabledForSpriteScaling:ivb
+	 * WaCxSRDisabledForSpriteScaling
 	 */
 	if (old_crtc_state->hw.active &&
 	    new_crtc_state->disable_lp_wm && ilk_disable_lp_wm(dev_priv))
@@ -8213,7 +8213,7 @@ intel_mode_valid(struct drm_device *dev,
 
 	/*
 	 * Cantiga+ cannot handle modes with a hsync front porch of 0.
-	 * WaPruneModeWithIncorrectHsyncOffset:ctg,elk,ilk,snb,ivb,vlv,hsw.
+	 * WaPruneModeWithIncorrectHsyncOffset
 	 */
 	if ((DISPLAY_VER(dev_priv) > 4 || IS_G4X(dev_priv)) &&
 	    mode->hsync_start == mode->hdisplay)
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 1a23ecd4623a..2265f48ba215 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -1583,7 +1583,7 @@ static void tgl_bw_buddy_init(struct drm_i915_private *dev_priv)
 	    IS_DG1_DISPLAY_STEP(dev_priv, STEP_A0, STEP_B0) ||
 	    IS_RKL_DISPLAY_STEP(dev_priv, STEP_A0, STEP_B0) ||
 	    IS_TGL_DISPLAY_STEP(dev_priv, STEP_A0, STEP_C0))
-		/* Wa_1409767108:tgl,dg1,adl-s */
+		/* Wa_1409767108 */
 		table = wa_1409767108_buddy_page_masks;
 	else
 		table = tgl_buddy_page_masks;
@@ -1604,7 +1604,7 @@ static void tgl_bw_buddy_init(struct drm_i915_private *dev_priv)
 			intel_de_write(dev_priv, BW_BUDDY_PAGE_MASK(i),
 				       table[config].page_mask);
 
-			/* Wa_22010178259:tgl,dg1,rkl,adl-s */
+			/* Wa_22010178259 */
 			if (DISPLAY_VER(dev_priv) == 12)
 				intel_de_rmw(dev_priv, BW_BUDDY_CTL(i),
 					     BW_BUDDY_TLB_REQ_TIMER_MASK,
@@ -1622,7 +1622,7 @@ static void icl_display_core_init(struct drm_i915_private *dev_priv,
 
 	gen9_set_dc_state(dev_priv, DC_STATE_DISABLE);
 
-	/* Wa_14011294188:ehl,jsl,tgl,rkl,adl-s */
+	/* Wa_14011294188 */
 	if (INTEL_PCH_TYPE(dev_priv) >= PCH_TGP &&
 	    INTEL_PCH_TYPE(dev_priv) < PCH_DG1)
 		intel_de_rmw(dev_priv, SOUTH_DSPCLK_GATE_D, 0,
@@ -1669,7 +1669,7 @@ static void icl_display_core_init(struct drm_i915_private *dev_priv,
 	if (resume)
 		intel_dmc_load_program(dev_priv);
 
-	/* Wa_14011508470:tgl,dg1,rkl,adl-s,adl-p */
+	/* Wa_14011508470 */
 	if (DISPLAY_VER(dev_priv) >= 12) {
 		val = DCPR_CLEAR_MEMSTAT_DIS | DCPR_SEND_RESP_IMM |
 		      DCPR_MASK_LPMODE | DCPR_MASK_MAXLATENCY_MEMUP_CLR;
diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
index 8710dd41ffd4..284b89a865e7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
@@ -341,7 +341,7 @@ static void hsw_power_well_enable(struct drm_i915_private *dev_priv,
 		pg = DISPLAY_VER(dev_priv) >= 11 ? ICL_PW_CTL_IDX_TO_PG(pw_idx) :
 						 SKL_PW_CTL_IDX_TO_PG(pw_idx);
 
-		/* Wa_16013190616:adlp */
+		/* Wa_16013190616 */
 		if (IS_ALDERLAKE_P(dev_priv) && pg == SKL_PG1)
 			intel_de_rmw(dev_priv, GEN8_CHICKEN_DCPR_1, 0, DISABLE_FLR_SRC);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 905b5dcdca14..76f3ba74a1f1 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -391,7 +391,7 @@ static void pipedmc_clock_gating_wa(struct drm_i915_private *i915, bool enable)
 		return;
 
 	/*
-	 * Wa_16015201720:adl-p,dg2, mtl
+	 * Wa_16015201720
 	 * The WA requires clock gating to be disabled all the time
 	 * for pipe A and B.
 	 * For pipe C and D clock gating needs to be disabled only
diff --git a/drivers/gpu/drm/i915/display/intel_dpll.c b/drivers/gpu/drm/i915/display/intel_dpll.c
index c236aafe9be0..5484c55386ea 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll.c
@@ -1901,7 +1901,7 @@ void chv_enable_pll(const struct intel_crtc_state *crtc_state)
 
 	if (pipe != PIPE_A) {
 		/*
-		 * WaPixelRepeatModeFixForC0:chv
+		 * WaPixelRepeatModeFixForC0
 		 *
 		 * DPLLCMD is AWOL. Use chicken bits to propagate
 		 * the value from DPLLBMD to either pipe B or C.
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 1974eb580ed1..3b3c0a98a773 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -3804,7 +3804,7 @@ static void adlp_cmtg_clock_gating_wa(struct drm_i915_private *i915, struct inte
 	    pll->info->id != DPLL_ID_ICL_DPLL0)
 		return;
 	/*
-	 * Wa_16011069516:adl-p[a0]
+	 * Wa_16011069516
 	 *
 	 * All CMTG regs are unreliable until CMTG clock gating is disabled,
 	 * so we can only assume the default TRANS_CMTG_CHICKEN reg value and
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 5e69d3c11d21..fd2007972605 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -726,7 +726,7 @@ static int intel_fbc_min_limit(const struct intel_plane_state *plane_state)
 
 static int intel_fbc_max_limit(struct drm_i915_private *i915)
 {
-	/* WaFbcOnly1to1Ratio:ctg */
+	/* WaFbcOnly1to1Ratio */
 	if (IS_G4X(i915))
 		return 1;
 
@@ -811,7 +811,7 @@ static void intel_fbc_program_cfb(struct intel_fbc *fbc)
 
 static void intel_fbc_program_workarounds(struct intel_fbc *fbc)
 {
-	/* Wa_22014263786:icl,jsl,tgl,dg1,rkl,adls,adlp,mtl */
+	/* Wa_22014263786 */
 	if (DISPLAY_VER(fbc->i915) >= 11 && !IS_DG2(fbc->i915))
 		intel_de_rmw(fbc->i915, ILK_DPFC_CHICKEN(fbc->id), 0,
 			     DPFC_CHICKEN_FORCE_SLB_INVALIDATION);
@@ -890,7 +890,7 @@ static bool pixel_format_is_valid(const struct intel_plane_state *plane_state)
 		/* 16bpp not supported on gen2 */
 		if (DISPLAY_VER(i915) == 2)
 			return false;
-		/* WaFbcOnly1to1Ratio:ctg */
+		/* WaFbcOnly1to1Ratio */
 		if (IS_G4X(i915))
 			return false;
 		return true;
@@ -1148,7 +1148,7 @@ static int intel_fbc_check_plane(struct intel_atomic_state *state,
 		return 0;
 	}
 
-	/* WaFbcExceedCdClockThreshold:hsw,bdw */
+	/* WaFbcExceedCdClockThreshold */
 	if (IS_HASWELL(i915) || IS_BROADWELL(i915)) {
 		const struct intel_cdclk_state *cdclk_state;
 
@@ -1650,7 +1650,7 @@ static int intel_sanitize_fbc_option(struct drm_i915_private *i915)
 
 static bool need_fbc_vtd_wa(struct drm_i915_private *i915)
 {
-	/* WaFbcTurnOffFbcWhenHyperVisorIsUsed:skl,bxt */
+	/* WaFbcTurnOffFbcWhenHyperVisorIsUsed */
 	if (i915_vtd_active(i915) &&
 	    (IS_SKYLAKE(i915) || IS_BROXTON(i915))) {
 		drm_info(&i915->drm,
diff --git a/drivers/gpu/drm/i915/display/intel_fdi.c b/drivers/gpu/drm/i915/display/intel_fdi.c
index 063f1da4f229..db6bac23eaaa 100644
--- a/drivers/gpu/drm/i915/display/intel_fdi.c
+++ b/drivers/gpu/drm/i915/display/intel_fdi.c
@@ -784,7 +784,7 @@ void hsw_fdi_link_train(struct intel_encoder *encoder,
 	 * - TP1 to TP2 time with the default value
 	 * - FDI delay to 90h
 	 *
-	 * WaFDIAutoLinkSetTimingOverrride:hsw
+	 * WaFDIAutoLinkSetTimingOverrride
 	 */
 	intel_de_write(dev_priv, FDI_RX_MISC(PIPE_A),
 		       FDI_RX_PWRDN_LANE1_VAL(2) | FDI_RX_PWRDN_LANE0_VAL(2) | FDI_RX_TP1_TO_TP2_48 | FDI_RX_FDI_DELAY_90);
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index efa2da080f62..8d09b43bfcfd 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2064,7 +2064,7 @@ static bool hdmi_bpc_possible(const struct intel_crtc_state *crtc_state, int bpc
 	if (!intel_hdmi_source_bpc_possible(dev_priv, bpc))
 		return false;
 
-	/* Display Wa_1405510057:icl,ehl */
+	/* Display Wa_1405510057 */
 	if (intel_hdmi_is_ycbcr420(crtc_state) &&
 	    bpc == 10 && DISPLAY_VER(dev_priv) == 11 &&
 	    (adjusted_mode->crtc_hblank_end -
diff --git a/drivers/gpu/drm/i915/display/intel_modeset_setup.c b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
index 96395bfbd41d..165ffe241e1e 100644
--- a/drivers/gpu/drm/i915/display/intel_modeset_setup.c
+++ b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
@@ -643,7 +643,7 @@ get_encoder_power_domains(struct drm_i915_private *i915)
 static void intel_early_display_was(struct drm_i915_private *i915)
 {
 	/*
-	 * Display WA #1185 WaDisableDARBFClkGating:glk,icl,ehl,tgl
+	 * Display WA #1185 WaDisableDARBFClkGating
 	 * Also known as Wa_14010480278.
 	 */
 	if (IS_DISPLAY_VER(i915, 10, 12))
@@ -652,7 +652,7 @@ static void intel_early_display_was(struct drm_i915_private *i915)
 
 	if (IS_HASWELL(i915)) {
 		/*
-		 * WaRsPkgCStateDisplayPMReq:hsw
+		 * WaRsPkgCStateDisplayPMReq
 		 * System hang if this isn't done before disabling all planes!
 		 */
 		intel_de_write(i915, CHICKEN_PAR1_1,
diff --git a/drivers/gpu/drm/i915/display/intel_pch_refclk.c b/drivers/gpu/drm/i915/display/intel_pch_refclk.c
index 08a94365b7d1..fefda17bfc60 100644
--- a/drivers/gpu/drm/i915/display/intel_pch_refclk.c
+++ b/drivers/gpu/drm/i915/display/intel_pch_refclk.c
@@ -31,7 +31,7 @@ static void lpt_fdi_reset_mphy(struct drm_i915_private *dev_priv)
 		drm_err(&dev_priv->drm, "FDI mPHY reset de-assert timeout\n");
 }
 
-/* WaMPhyProgramming:hsw */
+/* WaMPhyProgramming */
 static void lpt_fdi_program_mphy(struct drm_i915_private *dev_priv)
 {
 	u32 tmp;
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 9820e5fdd087..328c886309f3 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -543,7 +543,7 @@ static void hsw_activate_psr2(struct intel_dp *intel_dp)
 	val |= EDP_PSR2_FRAME_BEFORE_SU(max_t(u8, intel_dp->psr.sink_sync_latency + 1, 2));
 	val |= intel_psr2_get_tp_time(intel_dp);
 
-	/* Wa_22012278275:adl-p */
+	/* Wa_22012278275 */
 	if (IS_ADLP_DISPLAY_STEP(dev_priv, STEP_A0, STEP_E0)) {
 		static const u8 map[] = {
 			2, /* 5 lines */
@@ -731,7 +731,7 @@ tgl_dc3co_exitline_compute_config(struct intel_dp *intel_dp,
 	if (!dc3co_is_pipe_port_compatible(intel_dp, crtc_state))
 		return;
 
-	/* Wa_16011303918:adl-p */
+	/* Wa_16011303918 */
 	if (IS_ADLP_DISPLAY_STEP(dev_priv, STEP_A0, STEP_B0))
 		return;
 
@@ -835,7 +835,7 @@ static bool _compute_psr2_sdp_prior_scanline_indication(struct intel_dp *intel_d
 	if ((hblank_ns - req_ns) > 100)
 		return true;
 
-	/* Not supported <13 / Wa_22012279113:adl-p */
+	/* Not supported <13 / Wa_22012279113 */
 	if (DISPLAY_VER(dev_priv) <= 13 || intel_dp->edp_dpcd[0] < DP_EDP_14b)
 		return false;
 
@@ -923,7 +923,7 @@ static bool intel_psr2_config_valid(struct intel_dp *intel_dp,
 		return false;
 	}
 
-	/* Wa_16011303918:adl-p */
+	/* Wa_16011303918 */
 	if (crtc_state->vrr.enable &&
 	    IS_ADLP_DISPLAY_STEP(dev_priv, STEP_A0, STEP_B0)) {
 		drm_dbg_kms(&dev_priv->drm,
@@ -1170,7 +1170,7 @@ static void intel_psr_enable_source(struct intel_dp *intel_dp,
 				     PSR2_ADD_VERTICAL_LINE_COUNT);
 
 		/*
-		 * Wa_16014451276:adlp,mtl[a0,b0]
+		 * Wa_16014451276
 		 * All supported adlp panels have 1-based X granularity, this may
 		 * cause issues if non-supported panels are used.
 		 */
@@ -1181,14 +1181,14 @@ static void intel_psr_enable_source(struct intel_dp *intel_dp,
 			intel_de_rmw(dev_priv, CHICKEN_TRANS(cpu_transcoder), 0,
 				     ADLP_1_BASED_X_GRANULARITY);
 
-		/* Wa_16011168373:adl-p */
+		/* Wa_16011168373 */
 		if (IS_ADLP_DISPLAY_STEP(dev_priv, STEP_A0, STEP_B0))
 			intel_de_rmw(dev_priv,
 				     TRANS_SET_CONTEXT_LATENCY(intel_dp->psr.transcoder),
 				     TRANS_SET_CONTEXT_LATENCY_MASK,
 				     TRANS_SET_CONTEXT_LATENCY_VALUE(1));
 
-		/* Wa_16012604467:adlp,mtl[a0,b0] */
+		/* Wa_16012604467 */
 		if (IS_MTL_DISPLAY_STEP(dev_priv, STEP_A0, STEP_B0))
 			intel_de_rmw(dev_priv,
 				     MTL_CLKGATE_DIS_TRANS(cpu_transcoder), 0,
@@ -1197,7 +1197,7 @@ static void intel_psr_enable_source(struct intel_dp *intel_dp,
 			intel_de_rmw(dev_priv, CLKGATE_DIS_MISC, 0,
 				     CLKGATE_DIS_MISC_DMASC_GATING_DIS);
 
-		/* Wa_16013835468:tgl[b0+], dg1 */
+		/* Wa_16013835468 */
 		if (IS_TGL_DISPLAY_STEP(dev_priv, STEP_B0, STEP_FOREVER) ||
 		    IS_DG1(dev_priv)) {
 			u16 vtotal, vblank;
@@ -1363,13 +1363,13 @@ static void intel_psr_disable_locked(struct intel_dp *intel_dp)
 			     DIS_RAM_BYPASS_PSR2_MAN_TRACK, 0);
 
 	if (intel_dp->psr.psr2_enabled) {
-		/* Wa_16011168373:adl-p */
+		/* Wa_16011168373 */
 		if (IS_ADLP_DISPLAY_STEP(dev_priv, STEP_A0, STEP_B0))
 			intel_de_rmw(dev_priv,
 				     TRANS_SET_CONTEXT_LATENCY(intel_dp->psr.transcoder),
 				     TRANS_SET_CONTEXT_LATENCY_MASK, 0);
 
-		/* Wa_16012604467:adlp,mtl[a0,b0] */
+		/* Wa_16012604467 */
 		if (IS_MTL_DISPLAY_STEP(dev_priv, STEP_A0, STEP_B0))
 			intel_de_rmw(dev_priv,
 				     MTL_CLKGATE_DIS_TRANS(intel_dp->psr.transcoder),
@@ -1378,7 +1378,7 @@ static void intel_psr_disable_locked(struct intel_dp *intel_dp)
 			intel_de_rmw(dev_priv, CLKGATE_DIS_MISC,
 				     CLKGATE_DIS_MISC_DMASC_GATING_DIS, 0);
 
-		/* Wa_16013835468:tgl[b0+], dg1 */
+		/* Wa_16013835468 */
 		if (IS_TGL_DISPLAY_STEP(dev_priv, STEP_B0, STEP_FOREVER) ||
 		    IS_DG1(dev_priv))
 			intel_de_rmw(dev_priv, GEN8_CHICKEN_DCPR_1,
@@ -1636,7 +1636,7 @@ static void psr2_man_trk_ctl_calc(struct intel_crtc_state *crtc_state,
 
 	if (full_update) {
 		/*
-		 * Not applying Wa_14014971508:adlp,mtl as we do not support the
+		 * Not applying Wa_14014971508
 		 * feature that requires this workaround.
 		 */
 		val |= man_trk_ctl_single_full_frame_bit_get(dev_priv);
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index e6b4d24b9cd0..1e8a52b3859d 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -788,7 +788,7 @@ static void ivb_sprite_linear_gamma(const struct intel_plane_state *plane_state,
 	int scale, i;
 
 	/*
-	 * WaFP16GammaEnabling:ivb,hsw
+	 * WaFP16GammaEnabling
 	 * "Workaround : When using the 64-bit format, the sprite output
 	 *  on each color channel has one quarter amplitude. It can be
 	 *  brought up to full amplitude by using sprite internal gamma
diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
index a69bfcac9a94..5d1a27039aa3 100644
--- a/drivers/gpu/drm/i915/display/intel_vga.c
+++ b/drivers/gpu/drm/i915/display/intel_vga.c
@@ -34,7 +34,7 @@ void intel_vga_disable(struct drm_i915_private *dev_priv)
 	if (intel_de_read(dev_priv, vga_reg) & VGA_DISP_DISABLE)
 		return;
 
-	/* WaEnableVGAAccessThroughIOPort:ctg,elk,ilk,snb,ivb,vlv,hsw */
+	/* WaEnableVGAAccessThroughIOPort */
 	vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
 	outb(0x01, VGA_SEQ_I);
 	sr1 = inb(VGA_SEQ_D);
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 4b79c2d2d617..baad2cd97a92 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -923,7 +923,7 @@ static u32 skl_plane_ctl(const struct intel_crtc_state *crtc_state,
 	else if (key->flags & I915_SET_COLORKEY_SOURCE)
 		plane_ctl |= PLANE_CTL_KEY_ENABLE_SOURCE;
 
-	/* Wa_22012358565:adl-p */
+	/* Wa_22012358565 */
 	if (DISPLAY_VER(dev_priv) == 13)
 		plane_ctl |= adlp_plane_ctl_arb_slots(plane_state);
 
@@ -1401,7 +1401,7 @@ static int skl_plane_check_fb(const struct intel_crtc_state *crtc_state,
 		return -EINVAL;
 	}
 
-	/* Wa_1606054188:tgl,adl-s */
+	/* Wa_1606054188 */
 	if ((IS_ALDERLAKE_S(dev_priv) || IS_TIGERLAKE(dev_priv)) &&
 	    plane_state->ckey.flags & I915_SET_COLORKEY_SOURCE &&
 	    intel_format_is_p01x(fb->format->format)) {
@@ -2180,7 +2180,7 @@ static bool gen12_plane_has_mc_ccs(struct drm_i915_private *i915,
 	if (DISPLAY_VER(i915) < 12)
 		return false;
 
-	/* Wa_14010477008:tgl[a0..c0],rkl[all],dg1[all] */
+	/* Wa_14010477008 */
 	if (IS_DG1(i915) || IS_ROCKETLAKE(i915) ||
 	    IS_TGL_DISPLAY_STEP(i915, STEP_A0, STEP_D0))
 		return false;
diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index ae4e9e680c2e..14a8c0c89916 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -1411,8 +1411,8 @@ static bool icl_need_wm1_wa(struct drm_i915_private *i915,
 			    enum plane_id plane_id)
 {
 	/*
-	 * Wa_1408961008:icl, ehl
-	 * Wa_14012656716:tgl, adl
+	 * Wa_1408961008
+	 * Wa_14012656716
 	 * Underruns with WM1+ disabled
 	 */
 	return DISPLAY_VER(i915) == 11 ||
@@ -2011,7 +2011,7 @@ static void skl_compute_transition_wm(struct drm_i915_private *i915,
 		return;
 
 	/*
-	 * WaDisableTWM:skl,kbl,cfl,bxt
+	 * WaDisableTWM
 	 * Transition WM are not recommended by HW team for GEN9
 	 */
 	if (DISPLAY_VER(i915) == 9)
@@ -3453,7 +3453,7 @@ void intel_mbus_dbox_update(struct intel_atomic_state *state)
 		val |= new_dbuf_state->joined_mbus ? MBUS_DBOX_A_CREDIT(12) :
 						     MBUS_DBOX_A_CREDIT(8);
 	else if (IS_ALDERLAKE_P(i915))
-		/* Wa_22010947358:adl-p */
+		/* Wa_22010947358 */
 		val |= new_dbuf_state->joined_mbus ? MBUS_DBOX_A_CREDIT(6) :
 						     MBUS_DBOX_A_CREDIT(4);
 	else
diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i915/gvt/mmio_context.c
index 490e8ae51228..9a3da69f8b9b 100644
--- a/drivers/gpu/drm/i915/gvt/mmio_context.c
+++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
@@ -371,7 +371,7 @@ static void handle_tlb_pending_event(struct intel_vgpu *vgpu,
 
 	reg = _MMIO(regs[engine->id]);
 
-	/* WaForceWakeRenderDuringMmioTLBInvalidate:skl
+	/* WaForceWakeRenderDuringMmioTLBInvalidate
 	 * we need to put a forcewake when invalidating RCS TLB caches,
 	 * otherwise device can go to RC6 state and interrupt invalidation
 	 * process
diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 824a34ec0b83..49f7e1fbd96c 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -1590,7 +1590,7 @@ static void i915_oa_stream_destroy(struct i915_perf_stream *stream)
 	free_oa_buffer(stream);
 
 	/*
-	 * Wa_16011777198:dg2: Unset the override of GUCRC mode to enable rc6.
+	 * Wa_16011777198
 	 */
 	if (intel_uc_uses_guc_rc(&gt->uc) &&
 	    (IS_DG2_GRAPHICS_STEP(gt->i915, G10, STEP_A0, STEP_C0) ||
@@ -2801,7 +2801,7 @@ gen12_enable_metric_set(struct i915_perf_stream *stream,
 	int ret;
 
 	/*
-	 * Wa_1508761755:xehpsdv, dg2
+	 * Wa_1508761755
 	 * EU NOA signals behave incorrectly if EU clock gating is enabled.
 	 * Disable thread stall DOP gating and EU DOP gating.
 	 */
@@ -2891,7 +2891,7 @@ static void gen12_disable_metric_set(struct i915_perf_stream *stream)
 	u32 sqcnt1;
 
 	/*
-	 * Wa_1508761755:xehpsdv, dg2
+	 * Wa_1508761755
 	 * Enable thread stall DOP gating and EU DOP gating.
 	 */
 	if (IS_XEHPSDV(i915) || IS_DG2(i915)) {
@@ -3141,7 +3141,7 @@ get_sseu_config(struct intel_sseu *out_sseu,
 u32 i915_perf_oa_timestamp_frequency(struct drm_i915_private *i915)
 {
 	/*
-	 * Wa_18013179988:dg2
+	 * Wa_18013179988
 	 * Wa_14015846243:mtl
 	 */
 	if (IS_DG2(i915) || IS_METEORLAKE(i915)) {
@@ -3293,7 +3293,7 @@ static int i915_oa_stream_init(struct i915_perf_stream *stream,
 	intel_uncore_forcewake_get(stream->uncore, FORCEWAKE_ALL);
 
 	/*
-	 * Wa_16011777198:dg2: GuC resets render as part of the Wa. This causes
+	 * Wa_16011777198
 	 * OA to lose the configuration state. Prevent this by overriding GUCRC
 	 * mode.
 	 */
diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index 73c88b1c9545..82a59738ca4a 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -54,7 +54,7 @@ static void gen9_init_clock_gating(struct drm_i915_private *dev_priv)
 {
 	if (HAS_LLC(dev_priv)) {
 		/*
-		 * WaCompressedResourceDisplayNewHashMode:skl,kbl
+		 * WaCompressedResourceDisplayNewHashMode
 		 * Display WA #0390: skl,kbl
 		 *
 		 * Must match Sampler, Pixel Back End, and Media. See
@@ -63,14 +63,14 @@ static void gen9_init_clock_gating(struct drm_i915_private *dev_priv)
 		intel_uncore_rmw(&dev_priv->uncore, CHICKEN_PAR1_1, 0, SKL_DE_COMPRESSED_HASH_MODE);
 	}
 
-	/* See Bspec note for PSR2_CTL bit 31, Wa#828:skl,bxt,kbl,cfl */
+	/* See Bspec note for PSR2_CTL bit 31, Wa#828 */
 	intel_uncore_rmw(&dev_priv->uncore, CHICKEN_PAR1_1, 0, SKL_EDP_PSR_FIX_RDWRAP);
 
-	/* WaEnableChickenDCPR:skl,bxt,kbl,glk,cfl */
+	/* WaEnableChickenDCPR */
 	intel_uncore_rmw(&dev_priv->uncore, GEN8_CHICKEN_DCPR_1, 0, MASK_WAKEMEM);
 
 	/*
-	 * WaFbcWakeMemOn:skl,bxt,kbl,glk,cfl
+	 * WaFbcWakeMemOn
 	 * Display WA #0859: skl,bxt,kbl,glk,cfl
 	 */
 	intel_uncore_rmw(&dev_priv->uncore, DISP_ARB_CTL, 0, DISP_FBC_MEMORY_WAKE);
@@ -80,7 +80,7 @@ static void bxt_init_clock_gating(struct drm_i915_private *dev_priv)
 {
 	gen9_init_clock_gating(dev_priv);
 
-	/* WaDisableSDEUnitClockGating:bxt */
+	/* WaDisableSDEUnitClockGating */
 	intel_uncore_rmw(&dev_priv->uncore, GEN8_UCGCTL6, 0, GEN8_SDEUNIT_CLOCK_GATE_DISABLE);
 
 	/*
@@ -105,13 +105,13 @@ static void bxt_init_clock_gating(struct drm_i915_private *dev_priv)
 	intel_uncore_write(&dev_priv->uncore, RM_TIMEOUT, MMIO_TIMEOUT_US(950));
 
 	/*
-	 * WaFbcTurnOffFbcWatermark:bxt
+	 * WaFbcTurnOffFbcWatermark
 	 * Display WA #0562: bxt
 	 */
 	intel_uncore_rmw(&dev_priv->uncore, DISP_ARB_CTL, 0, DISP_FBC_WM_DIS);
 
 	/*
-	 * WaFbcHighMemBwCorruptionAvoidance:bxt
+	 * WaFbcHighMemBwCorruptionAvoidance
 	 * Display WA #0883: bxt
 	 */
 	intel_uncore_rmw(&dev_priv->uncore, ILK_DPFC_CHICKEN(INTEL_FBC_A), 0, DPFC_DISABLE_DUMMY0);
@@ -122,7 +122,7 @@ static void glk_init_clock_gating(struct drm_i915_private *dev_priv)
 	gen9_init_clock_gating(dev_priv);
 
 	/*
-	 * WaDisablePWMClockGating:glk
+	 * WaDisablePWMClockGating
 	 * Backlight PWM may stop in the asserted state, causing backlight
 	 * to stay fully on.
 	 */
@@ -1111,7 +1111,7 @@ static u16 g4x_compute_wm(const struct intel_crtc_state *crtc_state,
 	cpp = plane_state->hw.fb->format->cpp[0];
 
 	/*
-	 * WaUse32BppForSRWM:ctg,elk
+	 * WaUse32BppForSRWM
 	 *
 	 * The spec fails to list this restriction for the
 	 * HPLL watermark, which seems a little strange.
@@ -4113,7 +4113,7 @@ static void ilk_init_clock_gating(struct drm_i915_private *dev_priv)
 
 	/*
 	 * Required for FBC
-	 * WaFbcDisableDpfcClockGating:ilk
+	 * WaFbcDisableDpfcClockGating
 	 */
 	dspclk_gate |= ILK_DPFCRUNIT_CLOCK_GATE_DISABLE |
 		   ILK_DPFCUNIT_CLOCK_GATE_DISABLE |
@@ -4148,7 +4148,7 @@ static void ilk_init_clock_gating(struct drm_i915_private *dev_priv)
 	 * The bit 7,8,9 of 0x42020.
 	 */
 	if (IS_IRONLAKE_M(dev_priv)) {
-		/* WaFbcAsynchFlipDisableFbcQueue:ilk */
+		/* WaFbcAsynchFlipDisableFbcQueue */
 		intel_uncore_rmw(&dev_priv->uncore, ILK_DISPLAY_CHICKEN1, 0, ILK_FBCQ_DIS);
 		intel_uncore_rmw(&dev_priv->uncore, ILK_DISPLAY_CHICKEN2, 0, ILK_DPARB_GATE);
 	}
@@ -4230,8 +4230,8 @@ static void gen6_init_clock_gating(struct drm_i915_private *dev_priv)
 	 * According to the spec, bit 11 (RCCUNIT) must also be set,
 	 * but we didn't debug actual testcases to find it out.
 	 *
-	 * WaDisableRCCUnitClockGating:snb
-	 * WaDisableRCPBUnitClockGating:snb
+	 * WaDisableRCCUnitClockGating
+	 * WaDisableRCPBUnitClockGating
 	 */
 	intel_uncore_write(&dev_priv->uncore, GEN6_UCGCTL2,
 		   GEN6_RCPBUNIT_CLOCK_GATE_DISABLE |
@@ -4246,7 +4246,7 @@ static void gen6_init_clock_gating(struct drm_i915_private *dev_priv)
 	 * The bit14 of 0x70180
 	 * The bit14 of 0x71180
 	 *
-	 * WaFbcAsynchFlipDisableFbcQueue:snb
+	 * WaFbcAsynchFlipDisableFbcQueue
 	 */
 	intel_uncore_write(&dev_priv->uncore, ILK_DISPLAY_CHICKEN1,
 		   intel_uncore_read(&dev_priv->uncore, ILK_DISPLAY_CHICKEN1) |
@@ -4298,7 +4298,7 @@ static void gen8_set_l3sqc_credits(struct drm_i915_private *dev_priv,
 	u32 misccpctl;
 	u32 val;
 
-	/* WaTempDisableDOPClkGating:bdw */
+	/* WaTempDisableDOPClkGating */
 	misccpctl = intel_gt_mcr_multicast_rmw(to_gt(dev_priv), GEN8_MISCCPCTL,
 					       GEN8_DOP_CLOCK_GATE_ENABLE, 0);
 
@@ -4319,11 +4319,11 @@ static void gen8_set_l3sqc_credits(struct drm_i915_private *dev_priv,
 
 static void icl_init_clock_gating(struct drm_i915_private *dev_priv)
 {
-	/* Wa_1409120013:icl,ehl */
+	/* Wa_1409120013 */
 	intel_uncore_write(&dev_priv->uncore, ILK_DPFC_CHICKEN(INTEL_FBC_A),
 			   DPFC_CHICKEN_COMP_DUMMY_PIXEL);
 
-	/*Wa_14010594013:icl, ehl */
+	/*Wa_14010594013 */
 	intel_uncore_rmw(&dev_priv->uncore, GEN8_CHICKEN_DCPR_1,
 			 0, ICL_DELAY_PMRSP);
 }
@@ -4335,11 +4335,11 @@ static void gen12lp_init_clock_gating(struct drm_i915_private *dev_priv)
 		intel_uncore_write(&dev_priv->uncore, ILK_DPFC_CHICKEN(INTEL_FBC_A),
 				   DPFC_CHICKEN_COMP_DUMMY_PIXEL);
 
-	/* Wa_1409825376:tgl (pre-prod)*/
+	/* Wa_1409825376 */
 	if (IS_TGL_DISPLAY_STEP(dev_priv, STEP_A0, STEP_C0))
 		intel_uncore_rmw(&dev_priv->uncore, GEN9_CLKGATE_DIS_3, 0, TGL_VRH_GATING_DIS);
 
-	/* Wa_14013723622:tgl,rkl,dg1,adl-s */
+	/* Wa_14013723622 */
 	if (DISPLAY_VER(dev_priv) == 12)
 		intel_uncore_rmw(&dev_priv->uncore, CLKREQ_POLICY,
 				 CLKREQ_POLICY_MEM_UP_OVRD, 0);
@@ -4349,7 +4349,7 @@ static void adlp_init_clock_gating(struct drm_i915_private *dev_priv)
 {
 	gen12lp_init_clock_gating(dev_priv);
 
-	/* Wa_22011091694:adlp */
+	/* Wa_22011091694 */
 	intel_de_rmw(dev_priv, GEN9_CLKGATE_DIS_5, 0, DPCE_GATING_DIS);
 
 	/* Bspec/49189 Initialize Sequence */
@@ -4360,27 +4360,27 @@ static void dg1_init_clock_gating(struct drm_i915_private *dev_priv)
 {
 	gen12lp_init_clock_gating(dev_priv);
 
-	/* Wa_1409836686:dg1[a0] */
+	/* Wa_1409836686 */
 	if (IS_DG1_GRAPHICS_STEP(dev_priv, STEP_A0, STEP_B0))
 		intel_uncore_rmw(&dev_priv->uncore, GEN9_CLKGATE_DIS_3, 0, DPT_GATING_DIS);
 }
 
 static void xehpsdv_init_clock_gating(struct drm_i915_private *dev_priv)
 {
-	/* Wa_22010146351:xehpsdv */
+	/* Wa_22010146351 */
 	if (IS_XEHPSDV_GRAPHICS_STEP(dev_priv, STEP_A0, STEP_B0))
 		intel_uncore_rmw(&dev_priv->uncore, XEHP_CLOCK_GATE_DIS, 0, SGR_DIS);
 }
 
 static void dg2_init_clock_gating(struct drm_i915_private *i915)
 {
-	/* Wa_22010954014:dg2 */
+	/* Wa_22010954014 */
 	intel_uncore_rmw(&i915->uncore, XEHP_CLOCK_GATE_DIS, 0,
 			 SGSI_SIDECLK_DIS);
 
 	/*
-	 * Wa_14010733611:dg2_g10
-	 * Wa_22010146351:dg2_g10
+	 * Wa_14010733611
+	 * Wa_22010146351
 	 */
 	if (IS_DG2_GRAPHICS_STEP(i915, G10, STEP_A0, STEP_B0))
 		intel_uncore_rmw(&i915->uncore, XEHP_CLOCK_GATE_DIS, 0,
@@ -4389,11 +4389,11 @@ static void dg2_init_clock_gating(struct drm_i915_private *i915)
 
 static void pvc_init_clock_gating(struct drm_i915_private *dev_priv)
 {
-	/* Wa_14012385139:pvc */
+	/* Wa_14012385139 */
 	if (IS_PVC_BD_STEP(dev_priv, STEP_A0, STEP_B0))
 		intel_uncore_rmw(&dev_priv->uncore, XEHP_CLOCK_GATE_DIS, 0, SGR_DIS);
 
-	/* Wa_22010954014:pvc */
+	/* Wa_22010954014 */
 	if (IS_PVC_BD_STEP(dev_priv, STEP_A0, STEP_B0))
 		intel_uncore_rmw(&dev_priv->uncore, XEHP_CLOCK_GATE_DIS, 0, SGSI_SIDECLK_DIS);
 }
@@ -4416,13 +4416,13 @@ static void cfl_init_clock_gating(struct drm_i915_private *dev_priv)
 	intel_uncore_rmw(&dev_priv->uncore, FBC_LLC_READ_CTRL, 0, FBC_LLC_FULLY_OPEN);
 
 	/*
-	 * WaFbcTurnOffFbcWatermark:cfl
+	 * WaFbcTurnOffFbcWatermark
 	 * Display WA #0562: cfl
 	 */
 	intel_uncore_rmw(&dev_priv->uncore, DISP_ARB_CTL, 0, DISP_FBC_WM_DIS);
 
 	/*
-	 * WaFbcNukeOnHostModify:cfl
+	 * WaFbcNukeOnHostModify
 	 * Display WA #0873: cfl
 	 */
 	intel_uncore_rmw(&dev_priv->uncore, ILK_DPFC_CHICKEN(INTEL_FBC_A),
@@ -4436,24 +4436,24 @@ static void kbl_init_clock_gating(struct drm_i915_private *dev_priv)
 	/* WAC6entrylatency:kbl */
 	intel_uncore_rmw(&dev_priv->uncore, FBC_LLC_READ_CTRL, 0, FBC_LLC_FULLY_OPEN);
 
-	/* WaDisableSDEUnitClockGating:kbl */
+	/* WaDisableSDEUnitClockGating */
 	if (IS_KBL_GRAPHICS_STEP(dev_priv, 0, STEP_C0))
 		intel_uncore_rmw(&dev_priv->uncore, GEN8_UCGCTL6,
 				 0, GEN8_SDEUNIT_CLOCK_GATE_DISABLE);
 
-	/* WaDisableGamClockGating:kbl */
+	/* WaDisableGamClockGating */
 	if (IS_KBL_GRAPHICS_STEP(dev_priv, 0, STEP_C0))
 		intel_uncore_rmw(&dev_priv->uncore, GEN6_UCGCTL1,
 				 0, GEN6_GAMUNIT_CLOCK_GATE_DISABLE);
 
 	/*
-	 * WaFbcTurnOffFbcWatermark:kbl
+	 * WaFbcTurnOffFbcWatermark
 	 * Display WA #0562: kbl
 	 */
 	intel_uncore_rmw(&dev_priv->uncore, DISP_ARB_CTL, 0, DISP_FBC_WM_DIS);
 
 	/*
-	 * WaFbcNukeOnHostModify:kbl
+	 * WaFbcNukeOnHostModify
 	 * Display WA #0873: kbl
 	 */
 	intel_uncore_rmw(&dev_priv->uncore, ILK_DPFC_CHICKEN(INTEL_FBC_A),
@@ -4464,7 +4464,7 @@ static void skl_init_clock_gating(struct drm_i915_private *dev_priv)
 {
 	gen9_init_clock_gating(dev_priv);
 
-	/* WaDisableDopClockGating:skl */
+	/* WaDisableDopClockGating */
 	intel_gt_mcr_multicast_rmw(to_gt(dev_priv), GEN8_MISCCPCTL,
 				   GEN8_DOP_CLOCK_GATE_ENABLE, 0);
 
@@ -4472,20 +4472,20 @@ static void skl_init_clock_gating(struct drm_i915_private *dev_priv)
 	intel_uncore_rmw(&dev_priv->uncore, FBC_LLC_READ_CTRL, 0, FBC_LLC_FULLY_OPEN);
 
 	/*
-	 * WaFbcTurnOffFbcWatermark:skl
+	 * WaFbcTurnOffFbcWatermark
 	 * Display WA #0562: skl
 	 */
 	intel_uncore_rmw(&dev_priv->uncore, DISP_ARB_CTL, 0, DISP_FBC_WM_DIS);
 
 	/*
-	 * WaFbcNukeOnHostModify:skl
+	 * WaFbcNukeOnHostModify
 	 * Display WA #0873: skl
 	 */
 	intel_uncore_rmw(&dev_priv->uncore, ILK_DPFC_CHICKEN(INTEL_FBC_A),
 			 0, DPFC_NUKE_ON_ANY_MODIFICATION);
 
 	/*
-	 * WaFbcHighMemBwCorruptionAvoidance:skl
+	 * WaFbcHighMemBwCorruptionAvoidance
 	 * Display WA #0883: skl
 	 */
 	intel_uncore_rmw(&dev_priv->uncore, ILK_DPFC_CHICKEN(INTEL_FBC_A), 0, DPFC_DISABLE_DUMMY0);
@@ -4495,42 +4495,42 @@ static void bdw_init_clock_gating(struct drm_i915_private *dev_priv)
 {
 	enum pipe pipe;
 
-	/* WaFbcAsynchFlipDisableFbcQueue:hsw,bdw */
+	/* WaFbcAsynchFlipDisableFbcQueue */
 	intel_uncore_rmw(&dev_priv->uncore, CHICKEN_PIPESL_1(PIPE_A), 0, HSW_FBCQ_DIS);
 
-	/* WaSwitchSolVfFArbitrationPriority:bdw */
+	/* WaSwitchSolVfFArbitrationPriority */
 	intel_uncore_rmw(&dev_priv->uncore, GAM_ECOCHK, 0, HSW_ECOCHK_ARB_PRIO_SOL);
 
-	/* WaPsrDPAMaskVBlankInSRD:bdw */
+	/* WaPsrDPAMaskVBlankInSRD */
 	intel_uncore_rmw(&dev_priv->uncore, CHICKEN_PAR1_1, 0, DPA_MASK_VBLANK_SRD);
 
 	for_each_pipe(dev_priv, pipe) {
-		/* WaPsrDPRSUnmaskVBlankInSRD:bdw */
+		/* WaPsrDPRSUnmaskVBlankInSRD */
 		intel_uncore_rmw(&dev_priv->uncore, CHICKEN_PIPESL_1(pipe),
 				 0, BDW_DPRS_MASK_VBLANK_SRD);
 	}
 
-	/* WaVSRefCountFullforceMissDisable:bdw */
-	/* WaDSRefCountFullforceMissDisable:bdw */
+	/* WaVSRefCountFullforceMissDisable */
+	/* WaDSRefCountFullforceMissDisable */
 	intel_uncore_rmw(&dev_priv->uncore, GEN7_FF_THREAD_MODE,
 			 GEN8_FF_DS_REF_CNT_FFME | GEN7_FF_VS_REF_CNT_FFME, 0);
 
 	intel_uncore_write(&dev_priv->uncore, RING_PSMI_CTL(RENDER_RING_BASE),
 		   _MASKED_BIT_ENABLE(GEN8_RC_SEMA_IDLE_MSG_DISABLE));
 
-	/* WaDisableSDEUnitClockGating:bdw */
+	/* WaDisableSDEUnitClockGating */
 	intel_uncore_rmw(&dev_priv->uncore, GEN8_UCGCTL6, 0, GEN8_SDEUNIT_CLOCK_GATE_DISABLE);
 
-	/* WaProgramL3SqcReg1Default:bdw */
+	/* WaProgramL3SqcReg1Default */
 	gen8_set_l3sqc_credits(dev_priv, 30, 2);
 
-	/* WaKVMNotificationOnConfigChange:bdw */
+	/* WaKVMNotificationOnConfigChange */
 	intel_uncore_rmw(&dev_priv->uncore, CHICKEN_PAR2_1,
 			 0, KVM_CONFIG_CHANGE_NOTIFICATION_SELECT);
 
 	lpt_init_clock_gating(dev_priv);
 
-	/* WaDisableDopClockGating:bdw
+	/* WaDisableDopClockGating
 	 *
 	 * Also see the CHICKEN2 write in bdw_init_workarounds() to disable DOP
 	 * clock gating.
@@ -4540,14 +4540,14 @@ static void bdw_init_clock_gating(struct drm_i915_private *dev_priv)
 
 static void hsw_init_clock_gating(struct drm_i915_private *dev_priv)
 {
-	/* WaFbcAsynchFlipDisableFbcQueue:hsw,bdw */
+	/* WaFbcAsynchFlipDisableFbcQueue */
 	intel_uncore_rmw(&dev_priv->uncore, CHICKEN_PIPESL_1(PIPE_A), 0, HSW_FBCQ_DIS);
 
-	/* This is required by WaCatErrorRejectionIssue:hsw */
+	/* This is required by WaCatErrorRejectionIssue */
 	intel_uncore_rmw(&dev_priv->uncore, GEN7_SQ_CHICKEN_MBCUNIT_CONFIG,
 			 0, GEN7_SQ_CHICKEN_MBCUNIT_SQINTMOB);
 
-	/* WaSwitchSolVfFArbitrationPriority:hsw */
+	/* WaSwitchSolVfFArbitrationPriority */
 	intel_uncore_rmw(&dev_priv->uncore, GAM_ECOCHK, 0, HSW_ECOCHK_ARB_PRIO_SOL);
 
 	lpt_init_clock_gating(dev_priv);
@@ -4557,10 +4557,10 @@ static void ivb_init_clock_gating(struct drm_i915_private *dev_priv)
 {
 	intel_uncore_write(&dev_priv->uncore, ILK_DSPCLK_GATE_D, ILK_VRHUNIT_CLOCK_GATE_DISABLE);
 
-	/* WaFbcAsynchFlipDisableFbcQueue:ivb */
+	/* WaFbcAsynchFlipDisableFbcQueue */
 	intel_uncore_rmw(&dev_priv->uncore, ILK_DISPLAY_CHICKEN1, 0, ILK_FBCQ_DIS);
 
-	/* WaDisableBackToBackFlipFix:ivb */
+	/* WaDisableBackToBackFlipFix */
 	intel_uncore_write(&dev_priv->uncore, IVB_CHICKEN3,
 		   CHICKEN3_DGMG_REQ_OUT_FIX_DISABLE |
 		   CHICKEN3_DGMG_DONE_FIX_DISABLE);
@@ -4578,12 +4578,12 @@ static void ivb_init_clock_gating(struct drm_i915_private *dev_priv)
 
 	/*
 	 * According to the spec, bit 13 (RCZUNIT) must be set on IVB.
-	 * This implements the WaDisableRCZUnitClockGating:ivb workaround.
+	 * This implements the WaDisableRCZUnitClockGating
 	 */
 	intel_uncore_write(&dev_priv->uncore, GEN6_UCGCTL2,
 		   GEN6_RCZUNIT_CLOCK_GATE_DISABLE);
 
-	/* This is required by WaCatErrorRejectionIssue:ivb */
+	/* This is required by WaCatErrorRejectionIssue */
 	intel_uncore_rmw(&dev_priv->uncore, GEN7_SQ_CHICKEN_MBCUNIT_CONFIG,
 			 0, GEN7_SQ_CHICKEN_MBCUNIT_SQINTMOB);
 
@@ -4600,33 +4600,33 @@ static void ivb_init_clock_gating(struct drm_i915_private *dev_priv)
 
 static void vlv_init_clock_gating(struct drm_i915_private *dev_priv)
 {
-	/* WaDisableBackToBackFlipFix:vlv */
+	/* WaDisableBackToBackFlipFix */
 	intel_uncore_write(&dev_priv->uncore, IVB_CHICKEN3,
 		   CHICKEN3_DGMG_REQ_OUT_FIX_DISABLE |
 		   CHICKEN3_DGMG_DONE_FIX_DISABLE);
 
-	/* WaDisableDopClockGating:vlv */
+	/* WaDisableDopClockGating */
 	intel_uncore_write(&dev_priv->uncore, GEN7_ROW_CHICKEN2,
 		   _MASKED_BIT_ENABLE(DOP_CLOCK_GATING_DISABLE));
 
-	/* This is required by WaCatErrorRejectionIssue:vlv */
+	/* This is required by WaCatErrorRejectionIssue */
 	intel_uncore_rmw(&dev_priv->uncore, GEN7_SQ_CHICKEN_MBCUNIT_CONFIG,
 			 0, GEN7_SQ_CHICKEN_MBCUNIT_SQINTMOB);
 
 	/*
 	 * According to the spec, bit 13 (RCZUNIT) must be set on IVB.
-	 * This implements the WaDisableRCZUnitClockGating:vlv workaround.
+	 * This implements the WaDisableRCZUnitClockGating
 	 */
 	intel_uncore_write(&dev_priv->uncore, GEN6_UCGCTL2,
 		   GEN6_RCZUNIT_CLOCK_GATE_DISABLE);
 
-	/* WaDisableL3Bank2xClockGate:vlv
+	/* WaDisableL3Bank2xClockGate
 	 * Disabling L3 clock gating- MMIO 940c[25] = 1
 	 * Set bit 25, to disable L3_BANK_2x_CLK_GATING */
 	intel_uncore_rmw(&dev_priv->uncore, GEN7_UCGCTL4, 0, GEN7_L3BANK2X_CLOCK_GATE_DISABLE);
 
 	/*
-	 * WaDisableVLVClockGating_VBIIssue:vlv
+	 * WaDisableVLVClockGating_VBIIssue
 	 * Disable clock gating on th GCFG unit to prevent a delay
 	 * in the reporting of vblank events.
 	 */
@@ -4635,23 +4635,23 @@ static void vlv_init_clock_gating(struct drm_i915_private *dev_priv)
 
 static void chv_init_clock_gating(struct drm_i915_private *dev_priv)
 {
-	/* WaVSRefCountFullforceMissDisable:chv */
-	/* WaDSRefCountFullforceMissDisable:chv */
+	/* WaVSRefCountFullforceMissDisable */
+	/* WaDSRefCountFullforceMissDisable */
 	intel_uncore_rmw(&dev_priv->uncore, GEN7_FF_THREAD_MODE,
 			 GEN8_FF_DS_REF_CNT_FFME | GEN7_FF_VS_REF_CNT_FFME, 0);
 
-	/* WaDisableSemaphoreAndSyncFlipWait:chv */
+	/* WaDisableSemaphoreAndSyncFlipWait */
 	intel_uncore_write(&dev_priv->uncore, RING_PSMI_CTL(RENDER_RING_BASE),
 		   _MASKED_BIT_ENABLE(GEN8_RC_SEMA_IDLE_MSG_DISABLE));
 
-	/* WaDisableCSUnitClockGating:chv */
+	/* WaDisableCSUnitClockGating */
 	intel_uncore_rmw(&dev_priv->uncore, GEN6_UCGCTL1, 0, GEN6_CSUNIT_CLOCK_GATE_DISABLE);
 
-	/* WaDisableSDEUnitClockGating:chv */
+	/* WaDisableSDEUnitClockGating */
 	intel_uncore_rmw(&dev_priv->uncore, GEN8_UCGCTL6, 0, GEN8_SDEUNIT_CLOCK_GATE_DISABLE);
 
 	/*
-	 * WaProgramL3SqcReg1Default:chv
+	 * WaProgramL3SqcReg1Default
 	 * See gfxspecs/Related Documents/Performance Guide/
 	 * LSQC Setting Recommendations.
 	 */
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 8dee9e62a73e..e56dbb20f2fe 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -210,7 +210,7 @@ fw_domain_wait_ack_with_fallback(const struct intel_uncore_forcewake_domain *d,
 	 * the fallback ack.
 	 *
 	 * This workaround is described in HSDES #1604254524 and it's known as:
-	 * WaRsForcewakeAddDelayForAck:skl,bxt,kbl,glk,cfl,cnl,icl
+	 * WaRsForcewakeAddDelayForAck
 	 * although the name is a bit misleading.
 	 */
 
@@ -376,7 +376,7 @@ static void fw_domains_get_with_thread_status(struct intel_uncore *uncore,
 {
 	fw_domains_get_normal(uncore, fw_domains);
 
-	/* WaRsForcewakeWaitTC0:snb,ivb,hsw,bdw,vlv */
+	/* WaRsForcewakeWaitTC0 */
 	__gen6_gt_wait_for_thread_c0(uncore);
 }
 
@@ -584,7 +584,7 @@ static void forcewake_early_sanitize(struct intel_uncore *uncore,
 {
 	GEM_BUG_ON(!intel_uncore_has_forcewake(uncore));
 
-	/* WaDisableShadowRegForCpd:chv */
+	/* WaDisableShadowRegForCpd */
 	if (IS_CHERRYVIEW(uncore->i915)) {
 		__raw_uncore_write32(uncore, GTFIFOCTL,
 				     __raw_uncore_read32(uncore, GTFIFOCTL) |
@@ -1887,7 +1887,7 @@ static const struct intel_forcewake_range __xelpmp_fw_ranges[] = {
 static void
 ilk_dummy_write(struct intel_uncore *uncore)
 {
-	/* WaIssueDummyWriteToWakeupFromRC6:ilk Issue a dummy write to wake up
+	/* WaIssueDummyWriteToWakeupFromRC6
 	 * the chip from rc6 before touching it for real. MI_MODE is masked,
 	 * hence harmless to write 0 into. */
 	__raw_uncore_write32(uncore, RING_MI_MODE(RENDER_RING_BASE), 0);
-- 
2.39.0

