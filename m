Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72240145725
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 14:52:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65F16F527;
	Wed, 22 Jan 2020 13:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CCF6F4AC;
 Wed, 22 Jan 2020 11:09:04 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y11so6790538wrt.6;
 Wed, 22 Jan 2020 03:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H19LzmYggaesDXtEZDwh7u/7TkqREkYnYxII4Ov/FxY=;
 b=D8I7MuSqm+Vsp+fTot3jYo/1JfRfpBTkvkqtSLg2A7kWk5PjmIxSuVjD6PaqdJ492O
 sy5FLDERt6DrRROXD7kaD5ZKs+0A78HVyDCXt77vkI9tK6yahn27xbsUhIVdDDCLXnS2
 fq06o+3p9ojyKgvy/b056NX3iHg16UPWVCLTgE5MCnzHAss9MCaqDwvX1F2f2ZkarTtb
 KXpZj6Zk5AcWAqorgECXbEI+ukhH089UT5uwLbloZeWFApyV4ft3tmYjF4/bOsFlO46k
 ZnexK24yHIidWaEP3oxIY7Ds2YwYjl0oC6IUNMw/IT6QFqmUwQJrbp/KlkFhoj85FaTU
 mYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H19LzmYggaesDXtEZDwh7u/7TkqREkYnYxII4Ov/FxY=;
 b=mtd/9wvORH8cy+MR+uhgbZU/e2goB5RwavVlBVIXIUtDhSFDyD2WVBt/kBeTCAHrld
 SPz8e2W1NBawGvB/4pyAfrFYtxI4YusLK2E+cuaDCXwPO9ocKdal7InZuO3KDSWv0vXj
 9HV0ZFeCNtUc/gAargQw1tYUu0ZcBH/dBQetVs9aFYo9THQ5NrXdmtX7VPg7alH6Gqba
 S+Gpj2krpMudCb5UK72AeMIf9UMkMhffiSO8h3ILMp0L0FIKuMuACGNlMfbST8NZB2aC
 KnSqwBani+96TpDkggTKqtlJT15g8vTPe6GcGC7hsP+JuNC1cSY8CgOLZ0+ssOWlnLmZ
 B48Q==
X-Gm-Message-State: APjAAAXKQCuc2GXvs6I1FN5PnhVssftDgqOP+YLmjNLLMl9iMX0vPQxL
 wmR9RFx7BpeVLjKSoAvxVBQ=
X-Google-Smtp-Source: APXvYqxSOkhko/Bihzg09FnNTe4xUe4YF11xxLxZ8CgYdAmu4tH3Jih2k6R7TNwTlNM0XXakLmPHMw==
X-Received: by 2002:adf:90ee:: with SMTP id
 i101mr10436470wri.417.1579691342204; 
 Wed, 22 Jan 2020 03:09:02 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id l3sm52454380wrt.29.2020.01.22.03.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 03:09:01 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 4/6] drm/i915/dp: conversion to struct drm_device logging
 macros.
Date: Wed, 22 Jan 2020 14:08:42 +0300
Message-Id: <20200122110844.2022-5-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122110844.2022-1-wambui.karugax@gmail.com>
References: <20200122110844.2022-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Jan 2020 13:52:23 +0000
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

This converts various instances of printk based logging macros in
i915/display/intel_dp.c with the new struct drm_device based logging
macros using the following coccinelle script:
@rule1@
identifier fn, T;
@@

fn(...,struct drm_i915_private *T,...) {
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

New checkpatch warnings were fixed manually.

v2: fix merge conflict with new changes in file.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 357 ++++++++++++++----------
 1 file changed, 205 insertions(+), 152 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 748e4614d25a..63de5d53575f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -514,12 +514,13 @@ static u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
 	 */
 	bits_per_pixel = (link_clock * lane_count * 8) /
 			 intel_dp_mode_to_fec_clock(mode_clock);
-	DRM_DEBUG_KMS("Max link bpp: %u\n", bits_per_pixel);
+	drm_dbg_kms(&i915->drm, "Max link bpp: %u\n", bits_per_pixel);
 
 	/* Small Joiner Check: output bpp <= joiner RAM (bits) / Horiz. width */
 	max_bpp_small_joiner_ram = small_joiner_ram_size_bits(i915) /
 		mode_hdisplay;
-	DRM_DEBUG_KMS("Max small joiner bpp: %u\n", max_bpp_small_joiner_ram);
+	drm_dbg_kms(&i915->drm, "Max small joiner bpp: %u\n",
+		    max_bpp_small_joiner_ram);
 
 	/*
 	 * Greatest allowed DSC BPP = MIN (output BPP from available Link BW
@@ -529,8 +530,8 @@ static u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
 
 	/* Error out if the max bpp is less than smallest allowed valid bpp */
 	if (bits_per_pixel < valid_dsc_bpp[0]) {
-		DRM_DEBUG_KMS("Unsupported BPP %u, min %u\n",
-			      bits_per_pixel, valid_dsc_bpp[0]);
+		drm_dbg_kms(&i915->drm, "Unsupported BPP %u, min %u\n",
+			    bits_per_pixel, valid_dsc_bpp[0]);
 		return 0;
 	}
 
@@ -761,9 +762,10 @@ vlv_power_sequencer_kick(struct intel_dp *intel_dp)
 		 intel_dig_port->base.base.name))
 		return;
 
-	DRM_DEBUG_KMS("kicking pipe %c power sequencer for [ENCODER:%d:%s]\n",
-		      pipe_name(pipe), intel_dig_port->base.base.base.id,
-		      intel_dig_port->base.base.name);
+	drm_dbg_kms(&dev_priv->drm,
+		    "kicking pipe %c power sequencer for [ENCODER:%d:%s]\n",
+		    pipe_name(pipe), intel_dig_port->base.base.base.id,
+		    intel_dig_port->base.base.name);
 
 	/* Preserve the BIOS-computed detected bit. This is
 	 * supposed to be read-only.
@@ -790,8 +792,9 @@ vlv_power_sequencer_kick(struct intel_dp *intel_dp)
 
 		if (vlv_force_pll_on(dev_priv, pipe, IS_CHERRYVIEW(dev_priv) ?
 				     &chv_dpll[0].dpll : &vlv_dpll[0].dpll)) {
-			DRM_ERROR("Failed to force on pll for pipe %c!\n",
-				  pipe_name(pipe));
+			drm_err(&dev_priv->drm,
+				"Failed to force on pll for pipe %c!\n",
+				pipe_name(pipe));
 			return;
 		}
 	}
@@ -881,10 +884,11 @@ vlv_power_sequencer_pipe(struct intel_dp *intel_dp)
 	vlv_steal_power_sequencer(dev_priv, pipe);
 	intel_dp->pps_pipe = pipe;
 
-	DRM_DEBUG_KMS("picked pipe %c power sequencer for [ENCODER:%d:%s]\n",
-		      pipe_name(intel_dp->pps_pipe),
-		      intel_dig_port->base.base.base.id,
-		      intel_dig_port->base.base.name);
+	drm_dbg_kms(&dev_priv->drm,
+		    "picked pipe %c power sequencer for [ENCODER:%d:%s]\n",
+		    pipe_name(intel_dp->pps_pipe),
+		    intel_dig_port->base.base.base.id,
+		    intel_dig_port->base.base.name);
 
 	/* init power sequencer on this pipe and port */
 	intel_dp_init_panel_power_sequencer(intel_dp);
@@ -992,16 +996,18 @@ vlv_initial_power_sequencer_setup(struct intel_dp *intel_dp)
 
 	/* didn't find one? just let vlv_power_sequencer_pipe() pick one when needed */
 	if (intel_dp->pps_pipe == INVALID_PIPE) {
-		DRM_DEBUG_KMS("no initial power sequencer for [ENCODER:%d:%s]\n",
-			      intel_dig_port->base.base.base.id,
-			      intel_dig_port->base.base.name);
+		drm_dbg_kms(&dev_priv->drm,
+			    "no initial power sequencer for [ENCODER:%d:%s]\n",
+			    intel_dig_port->base.base.base.id,
+			    intel_dig_port->base.base.name);
 		return;
 	}
 
-	DRM_DEBUG_KMS("initial power sequencer for [ENCODER:%d:%s]: pipe %c\n",
-		      intel_dig_port->base.base.base.id,
-		      intel_dig_port->base.base.name,
-		      pipe_name(intel_dp->pps_pipe));
+	drm_dbg_kms(&dev_priv->drm,
+		    "initial power sequencer for [ENCODER:%d:%s]: pipe %c\n",
+		    intel_dig_port->base.base.base.id,
+		    intel_dig_port->base.base.name,
+		    pipe_name(intel_dp->pps_pipe));
 
 	intel_dp_init_panel_power_sequencer(intel_dp);
 	intel_dp_init_panel_power_sequencer_registers(intel_dp, false);
@@ -1163,9 +1169,9 @@ intel_dp_check_edp(struct intel_dp *intel_dp)
 
 	if (!edp_have_panel_power(intel_dp) && !edp_have_panel_vdd(intel_dp)) {
 		WARN(1, "eDP powered off while attempting aux channel communication.\n");
-		DRM_DEBUG_KMS("Status 0x%08x Control 0x%08x\n",
-			      I915_READ(_pp_stat_reg(intel_dp)),
-			      I915_READ(_pp_ctrl_reg(intel_dp)));
+		drm_dbg_kms(&dev_priv->drm, "Status 0x%08x Control 0x%08x\n",
+			    I915_READ(_pp_stat_reg(intel_dp)),
+			    I915_READ(_pp_ctrl_reg(intel_dp)));
 	}
 }
 
@@ -1186,8 +1192,9 @@ intel_dp_aux_wait_done(struct intel_dp *intel_dp)
 	trace_i915_reg_rw(false, ch_ctl, status, sizeof(status), true);
 
 	if (!done)
-		DRM_ERROR("%s did not complete or timeout within %ums (status 0x%08x)\n",
-			  intel_dp->aux.name, timeout_ms, status);
+		drm_err(&i915->drm,
+			"%s did not complete or timeout within %ums (status 0x%08x)\n",
+			intel_dp->aux.name, timeout_ms, status);
 #undef C
 
 	return status;
@@ -1435,7 +1442,8 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 	}
 
 	if ((status & DP_AUX_CH_CTL_DONE) == 0) {
-		DRM_ERROR("dp_aux_ch not done status 0x%08x\n", status);
+		drm_err(&i915->drm, "dp_aux_ch not done status 0x%08x\n",
+			status);
 		ret = -EBUSY;
 		goto out;
 	}
@@ -1445,7 +1453,8 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 	 * Timeouts occur when the sink is not connected
 	 */
 	if (status & DP_AUX_CH_CTL_RECEIVE_ERROR) {
-		DRM_ERROR("dp_aux_ch receive error status 0x%08x\n", status);
+		drm_err(&i915->drm, "dp_aux_ch receive error status 0x%08x\n",
+			status);
 		ret = -EIO;
 		goto out;
 	}
@@ -1453,7 +1462,8 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 	/* Timeouts occur when the device isn't connected, so they're
 	 * "normal" -- don't fill the kernel log with these */
 	if (status & DP_AUX_CH_CTL_TIME_OUT_ERROR) {
-		DRM_DEBUG_KMS("dp_aux_ch timeout status 0x%08x\n", status);
+		drm_dbg_kms(&i915->drm, "dp_aux_ch timeout status 0x%08x\n",
+			    status);
 		ret = -ETIMEDOUT;
 		goto out;
 	}
@@ -1468,8 +1478,9 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 	 * drm layer takes care for the necessary retries.
 	 */
 	if (recv_bytes == 0 || recv_bytes > 20) {
-		DRM_DEBUG_KMS("Forbidden recv_bytes = %d on aux transaction\n",
-			      recv_bytes);
+		drm_dbg_kms(&i915->drm,
+			    "Forbidden recv_bytes = %d on aux transaction\n",
+			    recv_bytes);
 		ret = -EBUSY;
 		goto out;
 	}
@@ -1913,8 +1924,9 @@ static int intel_dp_compute_bpp(struct intel_dp *intel_dp,
 		/* Get bpp from vbt only for panels that dont have bpp in edid */
 		if (intel_connector->base.display_info.bpc == 0 &&
 		    dev_priv->vbt.edp.bpp && dev_priv->vbt.edp.bpp < bpp) {
-			DRM_DEBUG_KMS("clamping bpp for eDP panel to BIOS-provided %i\n",
-				      dev_priv->vbt.edp.bpp);
+			drm_dbg_kms(&dev_priv->drm,
+				    "clamping bpp for eDP panel to BIOS-provided %i\n",
+				    dev_priv->vbt.edp.bpp);
 			bpp = dev_priv->vbt.edp.bpp;
 		}
 	}
@@ -2110,7 +2122,8 @@ static int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 
 	/* Min Input BPC for ICL+ is 8 */
 	if (pipe_bpp < 8 * 3) {
-		DRM_DEBUG_KMS("No DSC support for less than 8bpc\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "No DSC support for less than 8bpc\n");
 		return -EINVAL;
 	}
 
@@ -2145,7 +2158,8 @@ static int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 						     adjusted_mode->crtc_clock,
 						     adjusted_mode->crtc_hdisplay);
 		if (!dsc_max_output_bpp || !dsc_dp_slice_count) {
-			DRM_DEBUG_KMS("Compressed BPP/Slice Count not supported\n");
+			drm_dbg_kms(&dev_priv->drm,
+				    "Compressed BPP/Slice Count not supported\n");
 			return -EINVAL;
 		}
 		pipe_config->dsc.compressed_bpp = min_t(u16,
@@ -2162,26 +2176,28 @@ static int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 		if (pipe_config->dsc.slice_count > 1) {
 			pipe_config->dsc.dsc_split = true;
 		} else {
-			DRM_DEBUG_KMS("Cannot split stream to use 2 VDSC instances\n");
+			drm_dbg_kms(&dev_priv->drm,
+				    "Cannot split stream to use 2 VDSC instances\n");
 			return -EINVAL;
 		}
 	}
 
 	ret = intel_dp_dsc_compute_params(&dig_port->base, pipe_config);
 	if (ret < 0) {
-		DRM_DEBUG_KMS("Cannot compute valid DSC parameters for Input Bpp = %d "
-			      "Compressed BPP = %d\n",
-			      pipe_config->pipe_bpp,
-			      pipe_config->dsc.compressed_bpp);
+		drm_dbg_kms(&dev_priv->drm,
+			    "Cannot compute valid DSC parameters for Input Bpp = %d "
+			    "Compressed BPP = %d\n",
+			    pipe_config->pipe_bpp,
+			    pipe_config->dsc.compressed_bpp);
 		return ret;
 	}
 
 	pipe_config->dsc.compression_enable = true;
-	DRM_DEBUG_KMS("DP DSC computed with Input Bpp = %d "
-		      "Compressed Bpp = %d Slice Count = %d\n",
-		      pipe_config->pipe_bpp,
-		      pipe_config->dsc.compressed_bpp,
-		      pipe_config->dsc.slice_count);
+	drm_dbg_kms(&dev_priv->drm, "DP DSC computed with Input Bpp = %d "
+		    "Compressed Bpp = %d Slice Count = %d\n",
+		    pipe_config->pipe_bpp,
+		    pipe_config->dsc.compressed_bpp,
+		    pipe_config->dsc.slice_count);
 
 	return 0;
 }
@@ -2585,18 +2601,20 @@ static void wait_panel_status(struct intel_dp *intel_dp,
 	pp_stat_reg = _pp_stat_reg(intel_dp);
 	pp_ctrl_reg = _pp_ctrl_reg(intel_dp);
 
-	DRM_DEBUG_KMS("mask %08x value %08x status %08x control %08x\n",
-			mask, value,
-			I915_READ(pp_stat_reg),
-			I915_READ(pp_ctrl_reg));
+	drm_dbg_kms(&dev_priv->drm,
+		    "mask %08x value %08x status %08x control %08x\n",
+		    mask, value,
+		    I915_READ(pp_stat_reg),
+		    I915_READ(pp_ctrl_reg));
 
 	if (intel_de_wait_for_register(dev_priv, pp_stat_reg,
 				       mask, value, 5000))
-		DRM_ERROR("Panel status timeout: status %08x control %08x\n",
-				I915_READ(pp_stat_reg),
-				I915_READ(pp_ctrl_reg));
+		drm_err(&dev_priv->drm,
+			"Panel status timeout: status %08x control %08x\n",
+			I915_READ(pp_stat_reg),
+			I915_READ(pp_ctrl_reg));
 
-	DRM_DEBUG_KMS("Wait complete\n");
+	drm_dbg_kms(&dev_priv->drm, "Wait complete\n");
 }
 
 static void wait_panel_on(struct intel_dp *intel_dp)
@@ -2691,9 +2709,9 @@ static bool edp_panel_vdd_on(struct intel_dp *intel_dp)
 	intel_display_power_get(dev_priv,
 				intel_aux_power_domain(intel_dig_port));
 
-	DRM_DEBUG_KMS("Turning [ENCODER:%d:%s] VDD on\n",
-		      intel_dig_port->base.base.base.id,
-		      intel_dig_port->base.base.name);
+	drm_dbg_kms(&dev_priv->drm, "Turning [ENCODER:%d:%s] VDD on\n",
+		    intel_dig_port->base.base.base.id,
+		    intel_dig_port->base.base.name);
 
 	if (!edp_have_panel_power(intel_dp))
 		wait_panel_power_cycle(intel_dp);
@@ -2706,15 +2724,16 @@ static bool edp_panel_vdd_on(struct intel_dp *intel_dp)
 
 	I915_WRITE(pp_ctrl_reg, pp);
 	POSTING_READ(pp_ctrl_reg);
-	DRM_DEBUG_KMS("PP_STATUS: 0x%08x PP_CONTROL: 0x%08x\n",
-			I915_READ(pp_stat_reg), I915_READ(pp_ctrl_reg));
+	drm_dbg_kms(&dev_priv->drm, "PP_STATUS: 0x%08x PP_CONTROL: 0x%08x\n",
+		    I915_READ(pp_stat_reg), I915_READ(pp_ctrl_reg));
 	/*
 	 * If the panel wasn't on, delay before accessing aux channel
 	 */
 	if (!edp_have_panel_power(intel_dp)) {
-		DRM_DEBUG_KMS("[ENCODER:%d:%s] panel power wasn't enabled\n",
-			      intel_dig_port->base.base.base.id,
-			      intel_dig_port->base.base.name);
+		drm_dbg_kms(&dev_priv->drm,
+			    "[ENCODER:%d:%s] panel power wasn't enabled\n",
+			    intel_dig_port->base.base.base.id,
+			    intel_dig_port->base.base.name);
 		msleep(intel_dp->panel_power_up_delay);
 	}
 
@@ -2759,9 +2778,9 @@ static void edp_panel_vdd_off_sync(struct intel_dp *intel_dp)
 	if (!edp_have_panel_vdd(intel_dp))
 		return;
 
-	DRM_DEBUG_KMS("Turning [ENCODER:%d:%s] VDD off\n",
-		      intel_dig_port->base.base.base.id,
-		      intel_dig_port->base.base.name);
+	drm_dbg_kms(&dev_priv->drm, "Turning [ENCODER:%d:%s] VDD off\n",
+		    intel_dig_port->base.base.base.id,
+		    intel_dig_port->base.base.name);
 
 	pp = ilk_get_pp_control(intel_dp);
 	pp &= ~EDP_FORCE_VDD;
@@ -2773,8 +2792,8 @@ static void edp_panel_vdd_off_sync(struct intel_dp *intel_dp)
 	POSTING_READ(pp_ctrl_reg);
 
 	/* Make sure sequencer is idle before allowing subsequent activity */
-	DRM_DEBUG_KMS("PP_STATUS: 0x%08x PP_CONTROL: 0x%08x\n",
-	I915_READ(pp_stat_reg), I915_READ(pp_ctrl_reg));
+	drm_dbg_kms(&dev_priv->drm, "PP_STATUS: 0x%08x PP_CONTROL: 0x%08x\n",
+		    I915_READ(pp_stat_reg), I915_READ(pp_ctrl_reg));
 
 	if ((pp & PANEL_POWER_ON) == 0)
 		intel_dp->panel_power_off_time = ktime_get_boottime();
@@ -2846,9 +2865,9 @@ static void edp_panel_on(struct intel_dp *intel_dp)
 	if (!intel_dp_is_edp(intel_dp))
 		return;
 
-	DRM_DEBUG_KMS("Turn [ENCODER:%d:%s] panel power on\n",
-		      dp_to_dig_port(intel_dp)->base.base.base.id,
-		      dp_to_dig_port(intel_dp)->base.base.name);
+	drm_dbg_kms(&dev_priv->drm, "Turn [ENCODER:%d:%s] panel power on\n",
+		    dp_to_dig_port(intel_dp)->base.base.base.id,
+		    dp_to_dig_port(intel_dp)->base.base.name);
 
 	if (WARN(edp_have_panel_power(intel_dp),
 		 "[ENCODER:%d:%s] panel power already on\n",
@@ -2908,8 +2927,8 @@ static void edp_panel_off(struct intel_dp *intel_dp)
 	if (!intel_dp_is_edp(intel_dp))
 		return;
 
-	DRM_DEBUG_KMS("Turn [ENCODER:%d:%s] panel power off\n",
-		      dig_port->base.base.base.id, dig_port->base.base.name);
+	drm_dbg_kms(&dev_priv->drm, "Turn [ENCODER:%d:%s] panel power off\n",
+		    dig_port->base.base.base.id, dig_port->base.base.name);
 
 	WARN(!intel_dp->want_panel_vdd, "Need [ENCODER:%d:%s] VDD to turn off panel\n",
 	     dig_port->base.base.base.id, dig_port->base.base.name);
@@ -3084,8 +3103,8 @@ static void ilk_edp_pll_on(struct intel_dp *intel_dp,
 	assert_dp_port_disabled(intel_dp);
 	assert_edp_pll_disabled(dev_priv);
 
-	DRM_DEBUG_KMS("enabling eDP PLL for clock %d\n",
-		      pipe_config->port_clock);
+	drm_dbg_kms(&dev_priv->drm, "enabling eDP PLL for clock %d\n",
+		    pipe_config->port_clock);
 
 	intel_dp->DP &= ~DP_PLL_FREQ_MASK;
 
@@ -3124,7 +3143,7 @@ static void ilk_edp_pll_off(struct intel_dp *intel_dp,
 	assert_dp_port_disabled(intel_dp);
 	assert_edp_pll_enabled(dev_priv);
 
-	DRM_DEBUG_KMS("disabling eDP PLL\n");
+	drm_dbg_kms(&dev_priv->drm, "disabling eDP PLL\n");
 
 	intel_dp->DP &= ~DP_PLL_ENABLE;
 
@@ -3217,7 +3236,8 @@ static bool cpt_dp_port_selected(struct drm_i915_private *dev_priv,
 		}
 	}
 
-	DRM_DEBUG_KMS("No pipe for DP port %c found\n", port_name(port));
+	drm_dbg_kms(&dev_priv->drm, "No pipe for DP port %c found\n",
+		    port_name(port));
 
 	/* must initialize pipe to something for the asserts */
 	*pipe = PIPE_A;
@@ -3348,8 +3368,9 @@ static void intel_dp_get_config(struct intel_encoder *encoder,
 		 * up by the BIOS, and thus we can't get the mode at module
 		 * load.
 		 */
-		DRM_DEBUG_KMS("pipe has %d bpp for eDP panel, overriding BIOS-provided max %d bpp\n",
-			      pipe_config->pipe_bpp, dev_priv->vbt.edp.bpp);
+		drm_dbg_kms(&dev_priv->drm,
+			    "pipe has %d bpp for eDP panel, overriding BIOS-provided max %d bpp\n",
+			    pipe_config->pipe_bpp, dev_priv->vbt.edp.bpp);
 		dev_priv->vbt.edp.bpp = pipe_config->pipe_bpp;
 	}
 }
@@ -3442,8 +3463,9 @@ _intel_dp_set_link_train(struct intel_dp *intel_dp,
 	u8 train_pat_mask = drm_dp_training_pattern_mask(intel_dp->dpcd);
 
 	if (dp_train_pat & train_pat_mask)
-		DRM_DEBUG_KMS("Using DP training pattern TPS%d\n",
-			      dp_train_pat & train_pat_mask);
+		drm_dbg_kms(&dev_priv->drm,
+			    "Using DP training pattern TPS%d\n",
+			    dp_train_pat & train_pat_mask);
 
 	if (HAS_DDI(dev_priv)) {
 		u32 temp = I915_READ(intel_dp->regs.dp_tp_ctl);
@@ -3489,7 +3511,8 @@ _intel_dp_set_link_train(struct intel_dp *intel_dp,
 			*DP |= DP_LINK_TRAIN_PAT_2_CPT;
 			break;
 		case DP_TRAINING_PATTERN_3:
-			DRM_DEBUG_KMS("TPS3 not supported, using TPS2 instead\n");
+			drm_dbg_kms(&dev_priv->drm,
+				    "TPS3 not supported, using TPS2 instead\n");
 			*DP |= DP_LINK_TRAIN_PAT_2_CPT;
 			break;
 		}
@@ -3508,7 +3531,8 @@ _intel_dp_set_link_train(struct intel_dp *intel_dp,
 			*DP |= DP_LINK_TRAIN_PAT_2;
 			break;
 		case DP_TRAINING_PATTERN_3:
-			DRM_DEBUG_KMS("TPS3 not supported, using TPS2 instead\n");
+			drm_dbg_kms(&dev_priv->drm,
+				    "TPS3 not supported, using TPS2 instead\n");
 			*DP |= DP_LINK_TRAIN_PAT_2;
 			break;
 		}
@@ -3578,8 +3602,8 @@ static void intel_enable_dp(struct intel_encoder *encoder,
 	intel_dp_stop_link_train(intel_dp);
 
 	if (pipe_config->has_audio) {
-		DRM_DEBUG_DRIVER("Enabling DP audio on pipe %c\n",
-				 pipe_name(pipe));
+		drm_dbg(&dev_priv->drm, "Enabling DP audio on pipe %c\n",
+			pipe_name(pipe));
 		intel_audio_codec_enable(encoder, pipe_config, conn_state);
 	}
 }
@@ -3636,9 +3660,10 @@ static void vlv_detach_power_sequencer(struct intel_dp *intel_dp)
 	 * port select always when logically disconnecting a power sequencer
 	 * from a port.
 	 */
-	DRM_DEBUG_KMS("detaching pipe %c power sequencer from [ENCODER:%d:%s]\n",
-		      pipe_name(pipe), intel_dig_port->base.base.base.id,
-		      intel_dig_port->base.base.name);
+	drm_dbg_kms(&dev_priv->drm,
+		    "detaching pipe %c power sequencer from [ENCODER:%d:%s]\n",
+		    pipe_name(pipe), intel_dig_port->base.base.base.id,
+		    intel_dig_port->base.base.name);
 	I915_WRITE(pp_on_reg, 0);
 	POSTING_READ(pp_on_reg);
 
@@ -3663,9 +3688,10 @@ static void vlv_steal_power_sequencer(struct drm_i915_private *dev_priv,
 		if (intel_dp->pps_pipe != pipe)
 			continue;
 
-		DRM_DEBUG_KMS("stealing pipe %c power sequencer from [ENCODER:%d:%s]\n",
-			      pipe_name(pipe), encoder->base.base.id,
-			      encoder->base.name);
+		drm_dbg_kms(&dev_priv->drm,
+			    "stealing pipe %c power sequencer from [ENCODER:%d:%s]\n",
+			    pipe_name(pipe), encoder->base.base.id,
+			    encoder->base.name);
 
 		/* make sure vdd is off before we steal it */
 		vlv_detach_power_sequencer(intel_dp);
@@ -3707,9 +3733,10 @@ static void vlv_init_panel_power_sequencer(struct intel_encoder *encoder,
 	/* now it's all ours */
 	intel_dp->pps_pipe = crtc->pipe;
 
-	DRM_DEBUG_KMS("initializing pipe %c power sequencer for [ENCODER:%d:%s]\n",
-		      pipe_name(intel_dp->pps_pipe), encoder->base.base.id,
-		      encoder->base.name);
+	drm_dbg_kms(&dev_priv->drm,
+		    "initializing pipe %c power sequencer for [ENCODER:%d:%s]\n",
+		    pipe_name(intel_dp->pps_pipe), encoder->base.base.id,
+		    encoder->base.name);
 
 	/* init power sequencer on this pipe and port */
 	intel_dp_init_panel_power_sequencer(intel_dp);
@@ -4135,16 +4162,17 @@ intel_dp_set_signal_levels(struct intel_dp *intel_dp)
 	}
 
 	if (mask)
-		DRM_DEBUG_KMS("Using signal levels %08x\n", signal_levels);
-
-	DRM_DEBUG_KMS("Using vswing level %d%s\n",
-		      train_set & DP_TRAIN_VOLTAGE_SWING_MASK,
-		      train_set & DP_TRAIN_MAX_SWING_REACHED ? " (max)" : "");
-	DRM_DEBUG_KMS("Using pre-emphasis level %d%s\n",
-		      (train_set & DP_TRAIN_PRE_EMPHASIS_MASK) >>
-		      DP_TRAIN_PRE_EMPHASIS_SHIFT,
-		      train_set & DP_TRAIN_MAX_PRE_EMPHASIS_REACHED ?
-		      " (max)" : "");
+		drm_dbg_kms(&dev_priv->drm, "Using signal levels %08x\n",
+			    signal_levels);
+
+	drm_dbg_kms(&dev_priv->drm, "Using vswing level %d%s\n",
+		    train_set & DP_TRAIN_VOLTAGE_SWING_MASK,
+		    train_set & DP_TRAIN_MAX_SWING_REACHED ? " (max)" : "");
+	drm_dbg_kms(&dev_priv->drm, "Using pre-emphasis level %d%s\n",
+		    (train_set & DP_TRAIN_PRE_EMPHASIS_MASK) >>
+		    DP_TRAIN_PRE_EMPHASIS_SHIFT,
+		    train_set & DP_TRAIN_MAX_PRE_EMPHASIS_REACHED ?
+		    " (max)" : "");
 
 	intel_dp->DP = (intel_dp->DP & ~mask) | signal_levels;
 
@@ -4193,7 +4221,8 @@ void intel_dp_set_idle_link_train(struct intel_dp *intel_dp)
 
 	if (intel_de_wait_for_set(dev_priv, intel_dp->regs.dp_tp_status,
 				  DP_TP_STATUS_IDLE_DONE, 1))
-		DRM_ERROR("Timed out waiting for DP idle patterns\n");
+		drm_err(&dev_priv->drm,
+			"Timed out waiting for DP idle patterns\n");
 }
 
 static void
@@ -4209,7 +4238,7 @@ intel_dp_link_down(struct intel_encoder *encoder,
 	if (WARN_ON((I915_READ(intel_dp->output_reg) & DP_PORT_EN) == 0))
 		return;
 
-	DRM_DEBUG_KMS("\n");
+	drm_dbg_kms(&dev_priv->drm, "\n");
 
 	if ((IS_IVYBRIDGE(dev_priv) && port == PORT_A) ||
 	    (HAS_PCH_CPT(dev_priv) && port != PORT_A)) {
@@ -4388,8 +4417,9 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
 	if (drm_dp_dpcd_read(&intel_dp->aux, DP_EDP_DPCD_REV,
 			     intel_dp->edp_dpcd, sizeof(intel_dp->edp_dpcd)) ==
 			     sizeof(intel_dp->edp_dpcd))
-		DRM_DEBUG_KMS("eDP DPCD: %*ph\n", (int) sizeof(intel_dp->edp_dpcd),
-			      intel_dp->edp_dpcd);
+		drm_dbg_kms(&dev_priv->drm, "eDP DPCD: %*ph\n",
+			    (int)sizeof(intel_dp->edp_dpcd),
+			    intel_dp->edp_dpcd);
 
 	/*
 	 * This has to be called after intel_dp->edp_dpcd is filled, PSR checks
@@ -5279,7 +5309,8 @@ intel_dp_short_pulse(struct intel_dp *intel_dp)
 	intel_psr_short_pulse(intel_dp);
 
 	if (intel_dp->compliance.test_type == DP_TEST_LINK_TRAINING) {
-		DRM_DEBUG_KMS("Link Training Compliance Test requested\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "Link Training Compliance Test requested\n");
 		/* Send a Hotplug Uevent to userspace to start modeset */
 		drm_kms_helper_hotplug_event(&dev_priv->drm);
 	}
@@ -5654,8 +5685,8 @@ intel_dp_detect(struct drm_connector *connector,
 	struct intel_encoder *encoder = &dig_port->base;
 	enum drm_connector_status status;
 
-	DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n",
-		      connector->base.id, connector->name);
+	drm_dbg_kms(&dev_priv->drm, "[CONNECTOR:%d:%s]\n",
+		    connector->base.id, connector->name);
 	WARN_ON(!drm_modeset_is_locked(&dev_priv->drm.mode_config.connection_mutex));
 
 	/* Can't disconnect eDP */
@@ -5671,9 +5702,10 @@ intel_dp_detect(struct drm_connector *connector,
 		memset(intel_dp->dsc_dpcd, 0, sizeof(intel_dp->dsc_dpcd));
 
 		if (intel_dp->is_mst) {
-			DRM_DEBUG_KMS("MST device may have disappeared %d vs %d\n",
-				      intel_dp->is_mst,
-				      intel_dp->mst_mgr.mst_state);
+			drm_dbg_kms(&dev_priv->drm,
+				    "MST device may have disappeared %d vs %d\n",
+				    intel_dp->is_mst,
+				    intel_dp->mst_mgr.mst_state);
 			intel_dp->is_mst = false;
 			drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr,
 							intel_dp->is_mst);
@@ -5761,8 +5793,8 @@ intel_dp_force(struct drm_connector *connector)
 		intel_aux_power_domain(dig_port);
 	intel_wakeref_t wakeref;
 
-	DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n",
-		      connector->base.id, connector->name);
+	drm_dbg_kms(&dev_priv->drm, "[CONNECTOR:%d:%s]\n",
+		    connector->base.id, connector->name);
 	intel_dp_unset_edid(intel_dp);
 
 	if (connector->status != connector_status_connected)
@@ -6490,7 +6522,8 @@ static void intel_edp_panel_vdd_sanitize(struct intel_dp *intel_dp)
 	 * schedule a vdd off, so we don't hold on to the reference
 	 * indefinitely.
 	 */
-	DRM_DEBUG_KMS("VDD left on by BIOS, adjusting state tracking\n");
+	drm_dbg_kms(&dev_priv->drm,
+		    "VDD left on by BIOS, adjusting state tracking\n");
 	intel_display_power_get(dev_priv, intel_aux_power_domain(dig_port));
 
 	edp_panel_vdd_schedule_off(intel_dp);
@@ -6766,8 +6799,9 @@ intel_dp_init_panel_power_sequencer(struct intel_dp *intel_dp)
 	 */
 	if (dev_priv->quirks & QUIRK_INCREASE_T12_DELAY) {
 		vbt.t11_t12 = max_t(u16, vbt.t11_t12, 1300 * 10);
-		DRM_DEBUG_KMS("Increasing T12 panel delay as per the quirk to %d\n",
-			      vbt.t11_t12);
+		drm_dbg_kms(&dev_priv->drm,
+			    "Increasing T12 panel delay as per the quirk to %d\n",
+			    vbt.t11_t12);
 	}
 	/* T11_T12 delay is special and actually in units of 100ms, but zero
 	 * based in the hw (so we need to add 100 ms). But the sw vbt
@@ -6809,12 +6843,15 @@ intel_dp_init_panel_power_sequencer(struct intel_dp *intel_dp)
 	intel_dp->panel_power_cycle_delay = get_delay(t11_t12);
 #undef get_delay
 
-	DRM_DEBUG_KMS("panel power up delay %d, power down delay %d, power cycle delay %d\n",
-		      intel_dp->panel_power_up_delay, intel_dp->panel_power_down_delay,
-		      intel_dp->panel_power_cycle_delay);
+	drm_dbg_kms(&dev_priv->drm,
+		    "panel power up delay %d, power down delay %d, power cycle delay %d\n",
+		    intel_dp->panel_power_up_delay,
+		    intel_dp->panel_power_down_delay,
+		    intel_dp->panel_power_cycle_delay);
 
-	DRM_DEBUG_KMS("backlight on delay %d, off delay %d\n",
-		      intel_dp->backlight_on_delay, intel_dp->backlight_off_delay);
+	drm_dbg_kms(&dev_priv->drm, "backlight on delay %d, off delay %d\n",
+		    intel_dp->backlight_on_delay,
+		    intel_dp->backlight_off_delay);
 
 	/*
 	 * We override the HW backlight delays to 1 because we do manual waits
@@ -6866,7 +6903,8 @@ intel_dp_init_panel_power_sequencer_registers(struct intel_dp *intel_dp,
 		WARN(pp & PANEL_POWER_ON, "Panel power already on\n");
 
 		if (pp & EDP_FORCE_VDD)
-			DRM_DEBUG_KMS("VDD already on, disabling first\n");
+			drm_dbg_kms(&dev_priv->drm,
+				    "VDD already on, disabling first\n");
 
 		pp &= ~EDP_FORCE_VDD;
 
@@ -6920,12 +6958,13 @@ intel_dp_init_panel_power_sequencer_registers(struct intel_dp *intel_dp,
 		I915_WRITE(regs.pp_ctrl, pp_ctl);
 	}
 
-	DRM_DEBUG_KMS("panel power sequencer register settings: PP_ON %#x, PP_OFF %#x, PP_DIV %#x\n",
-		      I915_READ(regs.pp_on),
-		      I915_READ(regs.pp_off),
-		      i915_mmio_reg_valid(regs.pp_div) ?
-		      I915_READ(regs.pp_div) :
-		      (I915_READ(regs.pp_ctrl) & BXT_POWER_CYCLE_DELAY_MASK));
+	drm_dbg_kms(&dev_priv->drm,
+		    "panel power sequencer register settings: PP_ON %#x, PP_OFF %#x, PP_DIV %#x\n",
+		    I915_READ(regs.pp_on),
+		    I915_READ(regs.pp_off),
+		    i915_mmio_reg_valid(regs.pp_div) ?
+		    I915_READ(regs.pp_div) :
+		    (I915_READ(regs.pp_ctrl) & BXT_POWER_CYCLE_DELAY_MASK));
 }
 
 static void intel_dp_pps_init(struct intel_dp *intel_dp)
@@ -6962,22 +7001,24 @@ static void intel_dp_set_drrs_state(struct drm_i915_private *dev_priv,
 	enum drrs_refresh_rate_type index = DRRS_HIGH_RR;
 
 	if (refresh_rate <= 0) {
-		DRM_DEBUG_KMS("Refresh rate should be positive non-zero.\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "Refresh rate should be positive non-zero.\n");
 		return;
 	}
 
 	if (intel_dp == NULL) {
-		DRM_DEBUG_KMS("DRRS not supported.\n");
+		drm_dbg_kms(&dev_priv->drm, "DRRS not supported.\n");
 		return;
 	}
 
 	if (!intel_crtc) {
-		DRM_DEBUG_KMS("DRRS: intel_crtc not initialized\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "DRRS: intel_crtc not initialized\n");
 		return;
 	}
 
 	if (dev_priv->drrs.type < SEAMLESS_DRRS_SUPPORT) {
-		DRM_DEBUG_KMS("Only Seamless DRRS supported.\n");
+		drm_dbg_kms(&dev_priv->drm, "Only Seamless DRRS supported.\n");
 		return;
 	}
 
@@ -6986,13 +7027,14 @@ static void intel_dp_set_drrs_state(struct drm_i915_private *dev_priv,
 		index = DRRS_LOW_RR;
 
 	if (index == dev_priv->drrs.refresh_rate_type) {
-		DRM_DEBUG_KMS(
-			"DRRS requested for previously set RR...ignoring\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "DRRS requested for previously set RR...ignoring\n");
 		return;
 	}
 
 	if (!crtc_state->hw.active) {
-		DRM_DEBUG_KMS("eDP encoder disabled. CRTC not Active\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "eDP encoder disabled. CRTC not Active\n");
 		return;
 	}
 
@@ -7006,7 +7048,8 @@ static void intel_dp_set_drrs_state(struct drm_i915_private *dev_priv,
 			break;
 		case DRRS_MAX_RR:
 		default:
-			DRM_ERROR("Unsupported refreshrate type\n");
+			drm_err(&dev_priv->drm,
+				"Unsupported refreshrate type\n");
 		}
 	} else if (INTEL_GEN(dev_priv) > 6) {
 		i915_reg_t reg = PIPECONF(crtc_state->cpu_transcoder);
@@ -7029,7 +7072,8 @@ static void intel_dp_set_drrs_state(struct drm_i915_private *dev_priv,
 
 	dev_priv->drrs.refresh_rate_type = index;
 
-	DRM_DEBUG_KMS("eDP Refresh Rate set to : %dHz\n", refresh_rate);
+	drm_dbg_kms(&dev_priv->drm, "eDP Refresh Rate set to : %dHz\n",
+		    refresh_rate);
 }
 
 /**
@@ -7045,18 +7089,19 @@ void intel_edp_drrs_enable(struct intel_dp *intel_dp,
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
 
 	if (!crtc_state->has_drrs) {
-		DRM_DEBUG_KMS("Panel doesn't support DRRS\n");
+		drm_dbg_kms(&dev_priv->drm, "Panel doesn't support DRRS\n");
 		return;
 	}
 
 	if (dev_priv->psr.enabled) {
-		DRM_DEBUG_KMS("PSR enabled. Not enabling DRRS.\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "PSR enabled. Not enabling DRRS.\n");
 		return;
 	}
 
 	mutex_lock(&dev_priv->drrs.mutex);
 	if (dev_priv->drrs.dp) {
-		DRM_DEBUG_KMS("DRRS already enabled\n");
+		drm_dbg_kms(&dev_priv->drm, "DRRS already enabled\n");
 		goto unlock;
 	}
 
@@ -7282,25 +7327,28 @@ intel_dp_drrs_init(struct intel_connector *connector,
 	mutex_init(&dev_priv->drrs.mutex);
 
 	if (INTEL_GEN(dev_priv) <= 6) {
-		DRM_DEBUG_KMS("DRRS supported for Gen7 and above\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "DRRS supported for Gen7 and above\n");
 		return NULL;
 	}
 
 	if (dev_priv->vbt.drrs_type != SEAMLESS_DRRS_SUPPORT) {
-		DRM_DEBUG_KMS("VBT doesn't support DRRS\n");
+		drm_dbg_kms(&dev_priv->drm, "VBT doesn't support DRRS\n");
 		return NULL;
 	}
 
 	downclock_mode = intel_panel_edid_downclock_mode(connector, fixed_mode);
 	if (!downclock_mode) {
-		DRM_DEBUG_KMS("Downclock mode is not found. DRRS not supported\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "Downclock mode is not found. DRRS not supported\n");
 		return NULL;
 	}
 
 	dev_priv->drrs.type = dev_priv->vbt.drrs_type;
 
 	dev_priv->drrs.refresh_rate_type = DRRS_HIGH_RR;
-	DRM_DEBUG_KMS("seamless DRRS supported for eDP panel.\n");
+	drm_dbg_kms(&dev_priv->drm,
+		    "seamless DRRS supported for eDP panel.\n");
 	return downclock_mode;
 }
 
@@ -7330,7 +7378,8 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	 */
 	if (intel_get_lvds_encoder(dev_priv)) {
 		WARN_ON(!(HAS_PCH_IBX(dev_priv) || HAS_PCH_CPT(dev_priv)));
-		DRM_INFO("LVDS was detected, not registering eDP\n");
+		drm_info(&dev_priv->drm,
+			 "LVDS was detected, not registering eDP\n");
 
 		return false;
 	}
@@ -7346,7 +7395,8 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 
 	if (!has_dpcd) {
 		/* if this fails, presume the device is a ghost */
-		DRM_INFO("failed to retrieve link info, disabling eDP\n");
+		drm_info(&dev_priv->drm,
+			 "failed to retrieve link info, disabling eDP\n");
 		goto out_vdd_off;
 	}
 
@@ -7391,8 +7441,9 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 		if (pipe != PIPE_A && pipe != PIPE_B)
 			pipe = PIPE_A;
 
-		DRM_DEBUG_KMS("using pipe %c for initial backlight setup\n",
-			      pipe_name(pipe));
+		drm_dbg_kms(&dev_priv->drm,
+			    "using pipe %c for initial backlight setup\n",
+			    pipe_name(pipe));
 	}
 
 	intel_panel_init(&intel_connector->panel, fixed_mode, downclock_mode);
@@ -7504,9 +7555,10 @@ intel_dp_init_connector(struct intel_digital_port *intel_dig_port,
 		    port != PORT_B && port != PORT_C))
 		return false;
 
-	DRM_DEBUG_KMS("Adding %s connector on [ENCODER:%d:%s]\n",
-		      type == DRM_MODE_CONNECTOR_eDP ? "eDP" : "DP",
-		      intel_encoder->base.base.id, intel_encoder->base.name);
+	drm_dbg_kms(&dev_priv->drm,
+		    "Adding %s connector on [ENCODER:%d:%s]\n",
+		    type == DRM_MODE_CONNECTOR_eDP ? "eDP" : "DP",
+		    intel_encoder->base.base.id, intel_encoder->base.name);
 
 	drm_connector_init(dev, connector, &intel_dp_connector_funcs, type);
 	drm_connector_helper_add(connector, &intel_dp_connector_helper_funcs);
@@ -7544,7 +7596,8 @@ intel_dp_init_connector(struct intel_digital_port *intel_dig_port,
 	if (is_hdcp_supported(dev_priv, port) && !intel_dp_is_edp(intel_dp)) {
 		int ret = intel_hdcp_init(intel_connector, &intel_dp_hdcp_shim);
 		if (ret)
-			DRM_DEBUG_KMS("HDCP init failed, skipping.\n");
+			drm_dbg_kms(&dev_priv->drm,
+				    "HDCP init failed, skipping.\n");
 	}
 
 	/* For G4X desktop chip, PEG_BAND_GAP_DATA 3:0 must first be written
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
