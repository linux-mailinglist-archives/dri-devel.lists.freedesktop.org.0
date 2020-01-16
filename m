Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A46E140503
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 09:13:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9634F6F41B;
	Fri, 17 Jan 2020 08:13:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ABAE6ECF6;
 Thu, 16 Jan 2020 13:10:03 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a5so3726933wmb.0;
 Thu, 16 Jan 2020 05:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hCxT68cSQt5ShyU9kBqM6LmpX7i9+qW/Q2auyd6fcYk=;
 b=aT133NR99wdLXV/lMGzJX170iEJ8W2YMojMv+CvJ4ib5Ryi4mZLIv5lct8eo8OFSdS
 sazYQuDFl02Zb6KmBwUenkn/5XBRPB7LpVOLPkHEOMTvG3Cd5OaDliAF8rys6SaYI1Ie
 5hDlIHCNxkAbW/mZTvZYX6r4V3jiqwamrkDSXagNm2V8MA0HKJevRT6Erc8F95blzGyT
 NL/UZ4DMGhVwi4efiimvir+9PDGWo8oLOWCnqAbvs2gEoTEsElDiLf3Sf/oDg+h/tD3k
 TzzQfGHt7zUYo0o0bQb2FeKybxLS1NbSCy4iZhapBLnBDF3z3zmoZ3/fmY3eu6DVldo5
 ZTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hCxT68cSQt5ShyU9kBqM6LmpX7i9+qW/Q2auyd6fcYk=;
 b=rluYbYG2Wn0V97gaLGRKFvjrwuwX12ZRo5OaAS50kESU3T85NPRHgZPkGsf1bCh/A5
 8mp10joPDTg43qhYpOBOEgTZueQJ7W5sbA7XsfLQyNdk3EzHDkay0nG7nH7rJI4iKz2O
 Ulit6QjqulM2eQF1RJ8lgx7UW+fuT6broawHCFvPWJBcXXfMoTL8OkB+bXuvmktdKWI5
 qzav97XUOHgJsMILHcAuI5vv2WYNXj2dsHmdEFd9XdoztHYL2bGZh1Q1w40Fu1LZyqge
 WlpA8t0m+FywvWILaF/4to2OzkRmdDcaOtlUV1hf38jMUI+UUoOAL6KRdswEqCH57K4+
 zrpg==
X-Gm-Message-State: APjAAAXj+AvfqYf9xrbKlqtkZ3eiVdMprFxfFVqwZcUF9FQdEJ7Nh0ie
 2he4LMrquDrw2PUvtDnEEtI=
X-Google-Smtp-Source: APXvYqzeQ45yJB0Z4HGIt3nDQy70VbJHd3e4YXNGhwqYAuCeSDR4ExLiF+Xaz31VzI/SKS+35pusWw==
X-Received: by 2002:a7b:c407:: with SMTP id k7mr6195483wmi.46.1579180201710;
 Thu, 16 Jan 2020 05:10:01 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id k8sm29087196wrl.3.2020.01.16.05.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 05:10:01 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 2/4] drm/i915/display: conversion to new logging macros part 2
Date: Thu, 16 Jan 2020 16:09:45 +0300
Message-Id: <20200116130947.15464-3-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200116130947.15464-1-wambui.karugax@gmail.com>
References: <20200116130947.15464-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 17 Jan 2020 08:13:08 +0000
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch continues the conversion of printk based logging macros to
the new struct drm_based logging macros in
drm/i915/display/intel_display.c.
This conversion was done using the following coccinelle script that
matches the existence of a straightforward struct drm_i915_private in
the functions:
@rule1@
identifier fn, T;
@@

fn(struct drm_i915_private *T,...) {
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

@rule2@
identifier fn, T;
@@

fn(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

New checkpatch warnings were addressed manually.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 232 +++++++++++--------
 1 file changed, 140 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index e06c2e14b57d..af8f1e0914a5 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7535,8 +7535,9 @@ static void intel_crtc_disable_noatomic(struct intel_crtc *crtc,
 
 	state = drm_atomic_state_alloc(&dev_priv->drm);
 	if (!state) {
-		DRM_DEBUG_KMS("failed to disable [CRTC:%d:%s], out of memory",
-			      crtc->base.base.id, crtc->base.name);
+		drm_dbg_kms(&dev_priv->drm,
+			    "failed to disable [CRTC:%d:%s], out of memory",
+			    crtc->base.base.id, crtc->base.name);
 		return;
 	}
 
@@ -7552,8 +7553,9 @@ static void intel_crtc_disable_noatomic(struct intel_crtc *crtc,
 
 	drm_atomic_state_put(state);
 
-	DRM_DEBUG_KMS("[CRTC:%d:%s] hw state adjusted, was enabled, now disabled\n",
-		      crtc->base.base.id, crtc->base.name);
+	drm_dbg_kms(&dev_priv->drm,
+		    "[CRTC:%d:%s] hw state adjusted, was enabled, now disabled\n",
+		    crtc->base.base.id, crtc->base.name);
 
 	crtc->active = false;
 	crtc->base.enabled = false;
@@ -7598,7 +7600,8 @@ int intel_display_suspend(struct drm_device *dev)
 	state = drm_atomic_helper_suspend(dev);
 	ret = PTR_ERR_OR_ZERO(state);
 	if (ret)
-		DRM_ERROR("Suspending crtc's failed with %i\n", ret);
+		drm_err(&dev_priv->drm, "Suspending crtc's failed with %i\n",
+			ret);
 	else
 		dev_priv->modeset_restore_state = state;
 	return ret;
@@ -7667,18 +7670,21 @@ static int ilk_check_fdi_lanes(struct drm_device *dev, enum pipe pipe,
 	struct intel_crtc *other_crtc;
 	struct intel_crtc_state *other_crtc_state;
 
-	DRM_DEBUG_KMS("checking fdi config on pipe %c, lanes %i\n",
-		      pipe_name(pipe), pipe_config->fdi_lanes);
+	drm_dbg_kms(&dev_priv->drm,
+		    "checking fdi config on pipe %c, lanes %i\n",
+		    pipe_name(pipe), pipe_config->fdi_lanes);
 	if (pipe_config->fdi_lanes > 4) {
-		DRM_DEBUG_KMS("invalid fdi lane config on pipe %c: %i lanes\n",
-			      pipe_name(pipe), pipe_config->fdi_lanes);
+		drm_dbg_kms(&dev_priv->drm,
+			    "invalid fdi lane config on pipe %c: %i lanes\n",
+			    pipe_name(pipe), pipe_config->fdi_lanes);
 		return -EINVAL;
 	}
 
 	if (IS_HASWELL(dev_priv) || IS_BROADWELL(dev_priv)) {
 		if (pipe_config->fdi_lanes > 2) {
-			DRM_DEBUG_KMS("only 2 lanes on haswell, required: %i lanes\n",
-				      pipe_config->fdi_lanes);
+			drm_dbg_kms(&dev_priv->drm,
+				    "only 2 lanes on haswell, required: %i lanes\n",
+				    pipe_config->fdi_lanes);
 			return -EINVAL;
 		} else {
 			return 0;
@@ -7703,15 +7709,17 @@ static int ilk_check_fdi_lanes(struct drm_device *dev, enum pipe pipe,
 			return PTR_ERR(other_crtc_state);
 
 		if (pipe_required_fdi_lanes(other_crtc_state) > 0) {
-			DRM_DEBUG_KMS("invalid shared fdi lane config on pipe %c: %i lanes\n",
-				      pipe_name(pipe), pipe_config->fdi_lanes);
+			drm_dbg_kms(&dev_priv->drm,
+				    "invalid shared fdi lane config on pipe %c: %i lanes\n",
+				    pipe_name(pipe), pipe_config->fdi_lanes);
 			return -EINVAL;
 		}
 		return 0;
 	case PIPE_C:
 		if (pipe_config->fdi_lanes > 2) {
-			DRM_DEBUG_KMS("only 2 lanes on pipe %c: required %i lanes\n",
-				      pipe_name(pipe), pipe_config->fdi_lanes);
+			drm_dbg_kms(&dev_priv->drm,
+				    "only 2 lanes on pipe %c: required %i lanes\n",
+				    pipe_name(pipe), pipe_config->fdi_lanes);
 			return -EINVAL;
 		}
 
@@ -7722,7 +7730,8 @@ static int ilk_check_fdi_lanes(struct drm_device *dev, enum pipe pipe,
 			return PTR_ERR(other_crtc_state);
 
 		if (pipe_required_fdi_lanes(other_crtc_state) > 2) {
-			DRM_DEBUG_KMS("fdi link B uses too many lanes to enable link C\n");
+			drm_dbg_kms(&dev_priv->drm,
+				    "fdi link B uses too many lanes to enable link C\n");
 			return -EINVAL;
 		}
 		return 0;
@@ -7919,9 +7928,10 @@ static int intel_crtc_compute_config(struct intel_crtc *crtc,
 	}
 
 	if (adjusted_mode->crtc_clock > clock_limit) {
-		DRM_DEBUG_KMS("requested pixel clock (%d kHz) too high (max: %d kHz, double wide: %s)\n",
-			      adjusted_mode->crtc_clock, clock_limit,
-			      yesno(pipe_config->double_wide));
+		drm_dbg_kms(&dev_priv->drm,
+			    "requested pixel clock (%d kHz) too high (max: %d kHz, double wide: %s)\n",
+			    adjusted_mode->crtc_clock, clock_limit,
+			    yesno(pipe_config->double_wide));
 		return -EINVAL;
 	}
 
@@ -7933,7 +7943,8 @@ static int intel_crtc_compute_config(struct intel_crtc *crtc,
 		 * for output conversion from RGB->YCBCR. So if CTM is already
 		 * applied we can't support YCBCR420 output.
 		 */
-		DRM_DEBUG_KMS("YCBCR420 and CTM together are not possible\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "YCBCR420 and CTM together are not possible\n");
 		return -EINVAL;
 	}
 
@@ -7945,13 +7956,15 @@ static int intel_crtc_compute_config(struct intel_crtc *crtc,
 	 */
 	if (pipe_config->pipe_src_w & 1) {
 		if (pipe_config->double_wide) {
-			DRM_DEBUG_KMS("Odd pipe source width not supported with double wide pipe\n");
+			drm_dbg_kms(&dev_priv->drm,
+				    "Odd pipe source width not supported with double wide pipe\n");
 			return -EINVAL;
 		}
 
 		if (intel_crtc_has_type(pipe_config, INTEL_OUTPUT_LVDS) &&
 		    intel_is_dual_link_lvds(dev_priv)) {
-			DRM_DEBUG_KMS("Odd pipe source width not supported with dual link LVDS\n");
+			drm_dbg_kms(&dev_priv->drm,
+				    "Odd pipe source width not supported with dual link LVDS\n");
 			return -EINVAL;
 		}
 	}
@@ -8036,9 +8049,10 @@ static void intel_panel_sanitize_ssc(struct drm_i915_private *dev_priv)
 			DREF_SSC1_ENABLE;
 
 		if (dev_priv->vbt.lvds_use_ssc != bios_lvds_use_ssc) {
-			DRM_DEBUG_KMS("SSC %s by BIOS, overriding VBT which says %s\n",
-				      enableddisabled(bios_lvds_use_ssc),
-				      enableddisabled(dev_priv->vbt.lvds_use_ssc));
+			drm_dbg_kms(&dev_priv->drm,
+				    "SSC %s by BIOS, overriding VBT which says %s\n",
+				    enableddisabled(bios_lvds_use_ssc),
+				    enableddisabled(dev_priv->vbt.lvds_use_ssc));
 			dev_priv->vbt.lvds_use_ssc = bios_lvds_use_ssc;
 		}
 	}
@@ -8868,7 +8882,9 @@ static int i8xx_crtc_compute_clock(struct intel_crtc *crtc,
 	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_LVDS)) {
 		if (intel_panel_use_ssc(dev_priv)) {
 			refclk = dev_priv->vbt.lvds_ssc_freq;
-			DRM_DEBUG_KMS("using SSC reference clock of %d kHz\n", refclk);
+			drm_dbg_kms(&dev_priv->drm,
+				    "using SSC reference clock of %d kHz\n",
+				    refclk);
 		}
 
 		limit = &intel_limits_i8xx_lvds;
@@ -8881,7 +8897,8 @@ static int i8xx_crtc_compute_clock(struct intel_crtc *crtc,
 	if (!crtc_state->clock_set &&
 	    !i9xx_find_best_dpll(limit, crtc_state, crtc_state->port_clock,
 				 refclk, NULL, &crtc_state->dpll)) {
-		DRM_ERROR("Couldn't find PLL settings for mode!\n");
+		drm_err(&dev_priv->drm,
+			"Couldn't find PLL settings for mode!\n");
 		return -EINVAL;
 	}
 
@@ -8903,7 +8920,9 @@ static int g4x_crtc_compute_clock(struct intel_crtc *crtc,
 	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_LVDS)) {
 		if (intel_panel_use_ssc(dev_priv)) {
 			refclk = dev_priv->vbt.lvds_ssc_freq;
-			DRM_DEBUG_KMS("using SSC reference clock of %d kHz\n", refclk);
+			drm_dbg_kms(&dev_priv->drm,
+				    "using SSC reference clock of %d kHz\n",
+				    refclk);
 		}
 
 		if (intel_is_dual_link_lvds(dev_priv))
@@ -8923,7 +8942,8 @@ static int g4x_crtc_compute_clock(struct intel_crtc *crtc,
 	if (!crtc_state->clock_set &&
 	    !g4x_find_best_dpll(limit, crtc_state, crtc_state->port_clock,
 				refclk, NULL, &crtc_state->dpll)) {
-		DRM_ERROR("Couldn't find PLL settings for mode!\n");
+		drm_err(&dev_priv->drm,
+			"Couldn't find PLL settings for mode!\n");
 		return -EINVAL;
 	}
 
@@ -8946,7 +8966,9 @@ static int pnv_crtc_compute_clock(struct intel_crtc *crtc,
 	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_LVDS)) {
 		if (intel_panel_use_ssc(dev_priv)) {
 			refclk = dev_priv->vbt.lvds_ssc_freq;
-			DRM_DEBUG_KMS("using SSC reference clock of %d kHz\n", refclk);
+			drm_dbg_kms(&dev_priv->drm,
+				    "using SSC reference clock of %d kHz\n",
+				    refclk);
 		}
 
 		limit = &pnv_limits_lvds;
@@ -8957,7 +8979,8 @@ static int pnv_crtc_compute_clock(struct intel_crtc *crtc,
 	if (!crtc_state->clock_set &&
 	    !pnv_find_best_dpll(limit, crtc_state, crtc_state->port_clock,
 				refclk, NULL, &crtc_state->dpll)) {
-		DRM_ERROR("Couldn't find PLL settings for mode!\n");
+		drm_err(&dev_priv->drm,
+			"Couldn't find PLL settings for mode!\n");
 		return -EINVAL;
 	}
 
@@ -8980,7 +9003,9 @@ static int i9xx_crtc_compute_clock(struct intel_crtc *crtc,
 	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_LVDS)) {
 		if (intel_panel_use_ssc(dev_priv)) {
 			refclk = dev_priv->vbt.lvds_ssc_freq;
-			DRM_DEBUG_KMS("using SSC reference clock of %d kHz\n", refclk);
+			drm_dbg_kms(&dev_priv->drm,
+				    "using SSC reference clock of %d kHz\n",
+				    refclk);
 		}
 
 		limit = &intel_limits_i9xx_lvds;
@@ -8991,7 +9016,8 @@ static int i9xx_crtc_compute_clock(struct intel_crtc *crtc,
 	if (!crtc_state->clock_set &&
 	    !i9xx_find_best_dpll(limit, crtc_state, crtc_state->port_clock,
 				 refclk, NULL, &crtc_state->dpll)) {
-		DRM_ERROR("Couldn't find PLL settings for mode!\n");
+		drm_err(&dev_priv->drm,
+			"Couldn't find PLL settings for mode!\n");
 		return -EINVAL;
 	}
 
@@ -9126,7 +9152,7 @@ i9xx_get_initial_plane_config(struct intel_crtc *crtc,
 
 	intel_fb = kzalloc(sizeof(*intel_fb), GFP_KERNEL);
 	if (!intel_fb) {
-		DRM_DEBUG_KMS("failed to alloc fb\n");
+		drm_dbg_kms(&dev_priv->drm, "failed to alloc fb\n");
 		return;
 	}
 
@@ -9179,10 +9205,11 @@ i9xx_get_initial_plane_config(struct intel_crtc *crtc,
 
 	plane_config->size = fb->pitches[0] * aligned_height;
 
-	DRM_DEBUG_KMS("%s/%s with fb: size=%dx%d@%d, offset=%x, pitch %d, size 0x%x\n",
-		      crtc->base.name, plane->base.name, fb->width, fb->height,
-		      fb->format->cpp[0] * 8, base, fb->pitches[0],
-		      plane_config->size);
+	drm_dbg_kms(&dev_priv->drm,
+		    "%s/%s with fb: size=%dx%d@%d, offset=%x, pitch %d, size 0x%x\n",
+		    crtc->base.name, plane->base.name, fb->width, fb->height,
+		    fb->format->cpp[0] * 8, base, fb->pitches[0],
+		    plane_config->size);
 
 	plane_config->fb = intel_fb;
 }
@@ -9429,8 +9456,9 @@ static void ilk_init_pch_refclk(struct drm_i915_private *dev_priv)
 		}
 	}
 
-	DRM_DEBUG_KMS("has_panel %d has_lvds %d has_ck505 %d using_ssc_source %d\n",
-		      has_panel, has_lvds, has_ck505, using_ssc_source);
+	drm_dbg_kms(&dev_priv->drm,
+		    "has_panel %d has_lvds %d has_ck505 %d using_ssc_source %d\n",
+		    has_panel, has_lvds, has_ck505, using_ssc_source);
 
 	/* Ironlake: try to setup display ref clock before DPLL
 	 * enabling. This is only under driver's control after
@@ -9489,7 +9517,7 @@ static void ilk_init_pch_refclk(struct drm_i915_private *dev_priv)
 
 		/* SSC must be turned on before enabling the CPU output  */
 		if (intel_panel_use_ssc(dev_priv) && can_ssc) {
-			DRM_DEBUG_KMS("Using SSC on panel\n");
+			drm_dbg_kms(&dev_priv->drm, "Using SSC on panel\n");
 			val |= DREF_SSC1_ENABLE;
 		} else
 			val &= ~DREF_SSC1_ENABLE;
@@ -9504,7 +9532,8 @@ static void ilk_init_pch_refclk(struct drm_i915_private *dev_priv)
 		/* Enable CPU source on CPU attached eDP */
 		if (has_cpu_edp) {
 			if (intel_panel_use_ssc(dev_priv) && can_ssc) {
-				DRM_DEBUG_KMS("Using SSC on eDP\n");
+				drm_dbg_kms(&dev_priv->drm,
+					    "Using SSC on eDP\n");
 				val |= DREF_CPU_SOURCE_OUTPUT_DOWNSPREAD;
 			} else
 				val |= DREF_CPU_SOURCE_OUTPUT_NONSPREAD;
@@ -9515,7 +9544,7 @@ static void ilk_init_pch_refclk(struct drm_i915_private *dev_priv)
 		POSTING_READ(PCH_DREF_CONTROL);
 		udelay(200);
 	} else {
-		DRM_DEBUG_KMS("Disabling CPU source output\n");
+		drm_dbg_kms(&dev_priv->drm, "Disabling CPU source output\n");
 
 		val &= ~DREF_CPU_SOURCE_OUTPUT_MASK;
 
@@ -9527,7 +9556,7 @@ static void ilk_init_pch_refclk(struct drm_i915_private *dev_priv)
 		udelay(200);
 
 		if (!using_ssc_source) {
-			DRM_DEBUG_KMS("Disabling SSC source\n");
+			drm_dbg_kms(&dev_priv->drm, "Disabling SSC source\n");
 
 			/* Turn off the SSC source */
 			val &= ~DREF_SSC_SOURCE_MASK;
@@ -9555,7 +9584,7 @@ static void lpt_reset_fdi_mphy(struct drm_i915_private *dev_priv)
 
 	if (wait_for_us(I915_READ(SOUTH_CHICKEN2) &
 			FDI_MPHY_IOSFSB_RESET_STATUS, 100))
-		DRM_ERROR("FDI mPHY reset assert timeout\n");
+		drm_err(&dev_priv->drm, "FDI mPHY reset assert timeout\n");
 
 	tmp = I915_READ(SOUTH_CHICKEN2);
 	tmp &= ~FDI_MPHY_IOSFSB_RESET_CTL;
@@ -9563,7 +9592,7 @@ static void lpt_reset_fdi_mphy(struct drm_i915_private *dev_priv)
 
 	if (wait_for_us((I915_READ(SOUTH_CHICKEN2) &
 			 FDI_MPHY_IOSFSB_RESET_STATUS) == 0, 100))
-		DRM_ERROR("FDI mPHY reset de-assert timeout\n");
+		drm_err(&dev_priv->drm, "FDI mPHY reset de-assert timeout\n");
 }
 
 /* WaMPhyProgramming:hsw */
@@ -9845,17 +9874,17 @@ static void lpt_init_pch_refclk(struct drm_i915_private *dev_priv)
 	dev_priv->pch_ssc_use = 0;
 
 	if (spll_uses_pch_ssc(dev_priv)) {
-		DRM_DEBUG_KMS("SPLL using PCH SSC\n");
+		drm_dbg_kms(&dev_priv->drm, "SPLL using PCH SSC\n");
 		dev_priv->pch_ssc_use |= BIT(DPLL_ID_SPLL);
 	}
 
 	if (wrpll_uses_pch_ssc(dev_priv, DPLL_ID_WRPLL1)) {
-		DRM_DEBUG_KMS("WRPLL1 using PCH SSC\n");
+		drm_dbg_kms(&dev_priv->drm, "WRPLL1 using PCH SSC\n");
 		dev_priv->pch_ssc_use |= BIT(DPLL_ID_WRPLL1);
 	}
 
 	if (wrpll_uses_pch_ssc(dev_priv, DPLL_ID_WRPLL2)) {
-		DRM_DEBUG_KMS("WRPLL2 using PCH SSC\n");
+		drm_dbg_kms(&dev_priv->drm, "WRPLL2 using PCH SSC\n");
 		dev_priv->pch_ssc_use |= BIT(DPLL_ID_WRPLL2);
 	}
 
@@ -10161,8 +10190,9 @@ static int ilk_crtc_compute_clock(struct intel_crtc *crtc,
 
 	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_LVDS)) {
 		if (intel_panel_use_ssc(dev_priv)) {
-			DRM_DEBUG_KMS("using SSC reference clock of %d kHz\n",
-				      dev_priv->vbt.lvds_ssc_freq);
+			drm_dbg_kms(&dev_priv->drm,
+				    "using SSC reference clock of %d kHz\n",
+				    dev_priv->vbt.lvds_ssc_freq);
 			refclk = dev_priv->vbt.lvds_ssc_freq;
 		}
 
@@ -10184,15 +10214,17 @@ static int ilk_crtc_compute_clock(struct intel_crtc *crtc,
 	if (!crtc_state->clock_set &&
 	    !g4x_find_best_dpll(limit, crtc_state, crtc_state->port_clock,
 				refclk, NULL, &crtc_state->dpll)) {
-		DRM_ERROR("Couldn't find PLL settings for mode!\n");
+		drm_err(&dev_priv->drm,
+			"Couldn't find PLL settings for mode!\n");
 		return -EINVAL;
 	}
 
 	ilk_compute_dpll(crtc, crtc_state, NULL);
 
 	if (!intel_reserve_shared_dplls(state, crtc, NULL)) {
-		DRM_DEBUG_KMS("failed to find PLL for pipe %c\n",
-			      pipe_name(crtc->pipe));
+		drm_dbg_kms(&dev_priv->drm,
+			    "failed to find PLL for pipe %c\n",
+			    pipe_name(crtc->pipe));
 		return -EINVAL;
 	}
 
@@ -10323,7 +10355,7 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
 
 	intel_fb = kzalloc(sizeof(*intel_fb), GFP_KERNEL);
 	if (!intel_fb) {
-		DRM_DEBUG_KMS("failed to alloc fb\n");
+		drm_dbg_kms(&dev_priv->drm, "failed to alloc fb\n");
 		return;
 	}
 
@@ -10420,10 +10452,11 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
 
 	plane_config->size = fb->pitches[0] * aligned_height;
 
-	DRM_DEBUG_KMS("%s/%s with fb: size=%dx%d@%d, offset=%x, pitch %d, size 0x%x\n",
-		      crtc->base.name, plane->base.name, fb->width, fb->height,
-		      fb->format->cpp[0] * 8, base, fb->pitches[0],
-		      plane_config->size);
+	drm_dbg_kms(&dev_priv->drm,
+		    "%s/%s with fb: size=%dx%d@%d, offset=%x, pitch %d, size 0x%x\n",
+		    crtc->base.name, plane->base.name, fb->width, fb->height,
+		    fb->format->cpp[0] * 8, base, fb->pitches[0],
+		    plane_config->size);
 
 	plane_config->fb = intel_fb;
 	return;
@@ -10587,8 +10620,9 @@ static int hsw_crtc_compute_clock(struct intel_crtc *crtc,
 			intel_get_crtc_new_encoder(state, crtc_state);
 
 		if (!intel_reserve_shared_dplls(state, crtc, encoder)) {
-			DRM_DEBUG_KMS("failed to find PLL for pipe %c\n",
-				      pipe_name(crtc->pipe));
+			drm_dbg_kms(&dev_priv->drm,
+				    "failed to find PLL for pipe %c\n",
+				    pipe_name(crtc->pipe));
 			return -EINVAL;
 		}
 	}
@@ -10664,7 +10698,7 @@ static void bxt_get_ddi_pll(struct drm_i915_private *dev_priv,
 		id = DPLL_ID_SKL_DPLL2;
 		break;
 	default:
-		DRM_ERROR("Incorrect port type\n");
+		drm_err(&dev_priv->drm, "Incorrect port type\n");
 		return;
 	}
 
@@ -11185,7 +11219,8 @@ static int intel_cursor_check_surface(struct intel_plane_state *plane_state)
 						    plane_state, 0);
 
 	if (src_x != 0 || src_y != 0) {
-		DRM_DEBUG_KMS("Arbitrary cursor panning not supported\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "Arbitrary cursor panning not supported\n");
 		return -EINVAL;
 	}
 
@@ -11518,9 +11553,10 @@ static int i9xx_check_cursor(struct intel_crtc_state *crtc_state,
 
 	/* Check for which cursor types we support */
 	if (!i9xx_cursor_size_ok(plane_state)) {
-		DRM_DEBUG("Cursor dimension %dx%d not supported\n",
-			  drm_rect_width(&plane_state->uapi.dst),
-			  drm_rect_height(&plane_state->uapi.dst));
+		drm_dbg(&dev_priv->drm,
+			"Cursor dimension %dx%d not supported\n",
+			drm_rect_width(&plane_state->uapi.dst),
+			drm_rect_height(&plane_state->uapi.dst));
 		return -EINVAL;
 	}
 
@@ -11529,9 +11565,10 @@ static int i9xx_check_cursor(struct intel_crtc_state *crtc_state,
 
 	if (fb->pitches[0] !=
 	    drm_rect_width(&plane_state->uapi.dst) * fb->format->cpp[0]) {
-		DRM_DEBUG_KMS("Invalid cursor stride (%u) (cursor width %d)\n",
-			      fb->pitches[0],
-			      drm_rect_width(&plane_state->uapi.dst));
+		drm_dbg_kms(&dev_priv->drm,
+			    "Invalid cursor stride (%u) (cursor width %d)\n",
+			    fb->pitches[0],
+			    drm_rect_width(&plane_state->uapi.dst));
 		return -EINVAL;
 	}
 
@@ -11547,7 +11584,8 @@ static int i9xx_check_cursor(struct intel_crtc_state *crtc_state,
 	 */
 	if (IS_CHERRYVIEW(dev_priv) && pipe == PIPE_C &&
 	    plane_state->uapi.visible && plane_state->uapi.dst.x1 < 0) {
-		DRM_DEBUG_KMS("CHV cursor C not allowed to straddle the left screen edge\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "CHV cursor C not allowed to straddle the left screen edge\n");
 		return -EINVAL;
 	}
 
@@ -11735,9 +11773,9 @@ int intel_get_load_detect_pipe(struct drm_connector *connector,
 	struct intel_crtc_state *crtc_state;
 	int ret, i = -1;
 
-	DRM_DEBUG_KMS("[CONNECTOR:%d:%s], [ENCODER:%d:%s]\n",
-		      connector->base.id, connector->name,
-		      encoder->base.id, encoder->name);
+	drm_dbg_kms(&dev_priv->drm, "[CONNECTOR:%d:%s], [ENCODER:%d:%s]\n",
+		    connector->base.id, connector->name,
+		    encoder->base.id, encoder->name);
 
 	old->restore_state = NULL;
 
@@ -11788,7 +11826,8 @@ int intel_get_load_detect_pipe(struct drm_connector *connector,
 	 * If we didn't find an unused CRTC, don't use any.
 	 */
 	if (!crtc) {
-		DRM_DEBUG_KMS("no pipe available for load-detect\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "no pipe available for load-detect\n");
 		ret = -ENODEV;
 		goto fail;
 	}
@@ -11839,13 +11878,16 @@ int intel_get_load_detect_pipe(struct drm_connector *connector,
 	if (!ret)
 		ret = drm_atomic_add_affected_planes(restore_state, crtc);
 	if (ret) {
-		DRM_DEBUG_KMS("Failed to create a copy of old state to restore: %i\n", ret);
+		drm_dbg_kms(&dev_priv->drm,
+			    "Failed to create a copy of old state to restore: %i\n",
+			    ret);
 		goto fail;
 	}
 
 	ret = drm_atomic_commit(state);
 	if (ret) {
-		DRM_DEBUG_KMS("failed to set mode on load-detect pipe\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "failed to set mode on load-detect pipe\n");
 		goto fail;
 	}
 
@@ -11956,8 +11998,9 @@ static void i9xx_crtc_clock_get(struct intel_crtc *crtc,
 				7 : 14;
 			break;
 		default:
-			DRM_DEBUG_KMS("Unknown DPLL mode %08x in programmed "
-				  "mode\n", (int)(dpll & DPLL_MODE_MASK));
+			drm_dbg_kms(&dev_priv->drm,
+				    "Unknown DPLL mode %08x in programmed "
+				    "mode\n", (int)(dpll & DPLL_MODE_MASK));
 			return;
 		}
 
@@ -12203,11 +12246,12 @@ int intel_plane_atomic_calc_changes(const struct intel_crtc_state *old_crtc_stat
 	turn_off = was_visible && (!visible || mode_changed);
 	turn_on = visible && (!was_visible || mode_changed);
 
-	DRM_DEBUG_ATOMIC("[CRTC:%d:%s] with [PLANE:%d:%s] visible %i -> %i, off %i, on %i, ms %i\n",
-			 crtc->base.base.id, crtc->base.name,
-			 plane->base.base.id, plane->base.name,
-			 was_visible, visible,
-			 turn_off, turn_on, mode_changed);
+	drm_dbg_atomic(&dev_priv->drm,
+		       "[CRTC:%d:%s] with [PLANE:%d:%s] visible %i -> %i, off %i, on %i, ms %i\n",
+		       crtc->base.base.id, crtc->base.name,
+		       plane->base.base.id, plane->base.name,
+		       was_visible, visible,
+		       turn_off, turn_on, mode_changed);
 
 	if (turn_on) {
 		if (INTEL_GEN(dev_priv) < 5 && !IS_G4X(dev_priv))
@@ -12384,8 +12428,9 @@ static int icl_check_nv12_planes(struct intel_crtc_state *crtc_state)
 		}
 
 		if (!linked_state) {
-			DRM_DEBUG_KMS("Need %d free Y planes for planar YUV\n",
-				      hweight8(crtc_state->nv12_planes));
+			drm_dbg_kms(&dev_priv->drm,
+				    "Need %d free Y planes for planar YUV\n",
+				    hweight8(crtc_state->nv12_planes));
 
 			return -EINVAL;
 		}
@@ -12396,7 +12441,8 @@ static int icl_check_nv12_planes(struct intel_crtc_state *crtc_state)
 		linked_state->planar_linked_plane = plane;
 		crtc_state->active_planes |= BIT(linked->id);
 		crtc_state->update_planes |= BIT(linked->id);
-		DRM_DEBUG_KMS("Using %s as Y plane for %s\n", linked->base.name, plane->base.name);
+		drm_dbg_kms(&dev_priv->drm, "Using %s as Y plane for %s\n",
+			    linked->base.name, plane->base.name);
 
 		/* Copy parameters to slave plane */
 		linked_state->ctl = plane_state->ctl | PLANE_CTL_YUV420_Y_PLANE;
@@ -12528,8 +12574,9 @@ static int icl_compute_port_sync_crtc_state(struct drm_connector *connector,
 	drm_connector_list_iter_end(&conn_iter);
 
 	if (!master_crtc) {
-		DRM_DEBUG_KMS("Could not find Master CRTC for Slave CRTC %d\n",
-			      crtc->base.id);
+		drm_dbg_kms(&dev_priv->drm,
+			    "Could not find Master CRTC for Slave CRTC %d\n",
+			    crtc->base.id);
 		return -EINVAL;
 	}
 
@@ -12542,10 +12589,11 @@ static int icl_compute_port_sync_crtc_state(struct drm_connector *connector,
 	crtc_state->master_transcoder = master_pipe_config->cpu_transcoder;
 	master_pipe_config->sync_mode_slaves_mask |=
 		BIT(crtc_state->cpu_transcoder);
-	DRM_DEBUG_KMS("Master Transcoder = %s added for Slave CRTC = %d, slave transcoder bitmask = %d\n",
-		      transcoder_name(crtc_state->master_transcoder),
-		      crtc->base.id,
-		      master_pipe_config->sync_mode_slaves_mask);
+	drm_dbg_kms(&dev_priv->drm,
+		    "Master Transcoder = %s added for Slave CRTC = %d, slave transcoder bitmask = %d\n",
+		    transcoder_name(crtc_state->master_transcoder),
+		    crtc->base.id,
+		    master_pipe_config->sync_mode_slaves_mask);
 
 	return 0;
 }
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
