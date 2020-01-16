Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6BE1404F6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 09:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60AA96F410;
	Fri, 17 Jan 2020 08:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3DF6ECF5;
 Thu, 16 Jan 2020 13:09:59 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p17so3765280wmb.0;
 Thu, 16 Jan 2020 05:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q2RpGeurWqwLGX50r5GhDuSuo7yIz5UPcTabjPhRt28=;
 b=MDzpGZhf+sgJij2aj4rleIFGAVWYa9DIdZoQKcfJ9DGJZAXtpuE6bocH5gx321NbT6
 DwxXAbV1IAoO2GP/v2EHdHGHLZd+7LHnZ8fHCwmlR0C5fx4IpvM0w2oHSSf4qE0BNO2F
 BE7eQ4cBb5obw7n5lgT0iT9ugq6grDRSOc2lNrSbUPUvwJ5j+epXD8woi20XCRvQmmfj
 +ptsE4e7vJT1c05KuUrkEglAp97Z6Sxe0WaAHc5hnJpW+V5+Ebiz6rjXTacfMfNp6UIM
 mHPY2S5T8V7ddbqu8ekzc3t4etZOzRmSFkrgRf0I8tpKdP32WM8Td3bXBIiZWgOinB04
 VvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q2RpGeurWqwLGX50r5GhDuSuo7yIz5UPcTabjPhRt28=;
 b=BlzhxQh1hXUqfPNLbJz62zjvn+vHsnSfCBMolo7ksu6bCl/cOiO5OQS3ukqlEysrHp
 /hqbj1iKq8HzIs+scAC8w0AFjLsvXLmR2KN/v1bBYDftEtYwROfbqYqP5W5D121aaXBO
 dviv5w1jkDvhFLgTL0Zpz1cE2wRLMDNxFv1qnQ+/0uNV8HZSSZvJXhoPkgCCQ1wEpccQ
 IiO6MJ3vfQ86LF7IeUzvbF4Dv17Is4TBN/4ujxgMvk5bhocLiKA64n83PGY3Rc3C+08T
 yEjZ6QzjoIhpHw+JfGobV9miV57/xhdUqCJ2kHt/JtRIEJ9KHFwong9Et+BPBBCWoSzf
 3R6w==
X-Gm-Message-State: APjAAAX4FqcdKZ/VbM47J8+Q4N4tf98qWLgqqhdT7UGgpoErja3Bkar2
 3FhuJtr12SNemMOQUQagtEA=
X-Google-Smtp-Source: APXvYqydHqSGEZLTX/BYoIQMtlVAASm3q2Bm1MbF6CgmCb3brd6cCh2vAjugHPv4C/wTz9ZwHW4bTg==
X-Received: by 2002:a7b:c317:: with SMTP id k23mr6127176wmj.75.1579180198064; 
 Thu, 16 Jan 2020 05:09:58 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id k8sm29087196wrl.3.2020.01.16.05.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 05:09:57 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 1/4] drm/i915/display: conversion to new logging macros part 1
Date: Thu, 16 Jan 2020 16:09:44 +0300
Message-Id: <20200116130947.15464-2-wambui.karugax@gmail.com>
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

This is the first patch that starts the conversion of the printk based
logging macros in drm/i915/display/intel_display.c to the new struct
drm_device based logging macros.
This conversion was done using the following coccinelle script that
matches based on the existence of a struct drm_i915_private device:
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

Checkpatch warnings were fixed manually.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 227 +++++++++++--------
 1 file changed, 131 insertions(+), 96 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 59c375879186..e06c2e14b57d 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -235,7 +235,8 @@ static void intel_update_czclk(struct drm_i915_private *dev_priv)
 	dev_priv->czclk_freq = vlv_get_cck_clock_hpll(dev_priv, "czclk",
 						      CCK_CZ_CLOCK_CONTROL);
 
-	DRM_DEBUG_DRIVER("CZ clock rate: %d kHz\n", dev_priv->czclk_freq);
+	drm_dbg(&dev_priv->drm, "CZ clock rate: %d kHz\n",
+		dev_priv->czclk_freq);
 }
 
 static inline u32 /* units of 100MHz */
@@ -1063,8 +1064,9 @@ static void wait_for_pipe_scanline_moving(struct intel_crtc *crtc, bool state)
 
 	/* Wait for the display line to settle/start moving */
 	if (wait_for(pipe_scanline_is_moving(dev_priv, pipe) == state, 100))
-		DRM_ERROR("pipe %c scanline %s wait timed out\n",
-			  pipe_name(pipe), onoff(state));
+		drm_err(&dev_priv->drm,
+			"pipe %c scanline %s wait timed out\n",
+			pipe_name(pipe), onoff(state));
 }
 
 static void intel_wait_for_pipe_scanline_stopped(struct intel_crtc *crtc)
@@ -1397,7 +1399,7 @@ static void _vlv_enable_pll(struct intel_crtc *crtc,
 	udelay(150);
 
 	if (intel_de_wait_for_set(dev_priv, DPLL(pipe), DPLL_LOCK_VLV, 1))
-		DRM_ERROR("DPLL %d failed to lock\n", pipe);
+		drm_err(&dev_priv->drm, "DPLL %d failed to lock\n", pipe);
 }
 
 static void vlv_enable_pll(struct intel_crtc *crtc,
@@ -1446,7 +1448,7 @@ static void _chv_enable_pll(struct intel_crtc *crtc,
 
 	/* Check PLL is locked */
 	if (intel_de_wait_for_set(dev_priv, DPLL(pipe), DPLL_LOCK_VLV, 1))
-		DRM_ERROR("PLL %d failed to lock\n", pipe);
+		drm_err(&dev_priv->drm, "PLL %d failed to lock\n", pipe);
 }
 
 static void chv_enable_pll(struct intel_crtc *crtc,
@@ -1694,7 +1696,8 @@ static void ilk_enable_pch_transcoder(const struct intel_crtc_state *crtc_state)
 
 	I915_WRITE(reg, val | TRANS_ENABLE);
 	if (intel_de_wait_for_set(dev_priv, reg, TRANS_STATE_ENABLE, 100))
-		DRM_ERROR("failed to enable transcoder %c\n", pipe_name(pipe));
+		drm_err(&dev_priv->drm, "failed to enable transcoder %c\n",
+			pipe_name(pipe));
 }
 
 static void lpt_enable_pch_transcoder(struct drm_i915_private *dev_priv,
@@ -1726,7 +1729,7 @@ static void lpt_enable_pch_transcoder(struct drm_i915_private *dev_priv,
 	I915_WRITE(LPT_TRANSCONF, val);
 	if (intel_de_wait_for_set(dev_priv, LPT_TRANSCONF,
 				  TRANS_STATE_ENABLE, 100))
-		DRM_ERROR("Failed to enable PCH transcoder\n");
+		drm_err(&dev_priv->drm, "Failed to enable PCH transcoder\n");
 }
 
 static void ilk_disable_pch_transcoder(struct drm_i915_private *dev_priv,
@@ -1748,7 +1751,8 @@ static void ilk_disable_pch_transcoder(struct drm_i915_private *dev_priv,
 	I915_WRITE(reg, val);
 	/* wait for PCH transcoder off, transcoder state */
 	if (intel_de_wait_for_clear(dev_priv, reg, TRANS_STATE_ENABLE, 50))
-		DRM_ERROR("failed to disable transcoder %c\n", pipe_name(pipe));
+		drm_err(&dev_priv->drm, "failed to disable transcoder %c\n",
+			pipe_name(pipe));
 
 	if (HAS_PCH_CPT(dev_priv)) {
 		/* Workaround: Clear the timing override chicken bit again. */
@@ -1769,7 +1773,7 @@ void lpt_disable_pch_transcoder(struct drm_i915_private *dev_priv)
 	/* wait for PCH transcoder off, transcoder state */
 	if (intel_de_wait_for_clear(dev_priv, LPT_TRANSCONF,
 				    TRANS_STATE_ENABLE, 50))
-		DRM_ERROR("Failed to disable PCH transcoder\n");
+		drm_err(&dev_priv->drm, "Failed to disable PCH transcoder\n");
 
 	/* Workaround: clear timing override bit. */
 	val = I915_READ(TRANS_CHICKEN2(PIPE_A));
@@ -1834,7 +1838,7 @@ static void intel_enable_pipe(const struct intel_crtc_state *new_crtc_state)
 	i915_reg_t reg;
 	u32 val;
 
-	DRM_DEBUG_KMS("enabling pipe %c\n", pipe_name(pipe));
+	drm_dbg_kms(&dev_priv->drm, "enabling pipe %c\n", pipe_name(pipe));
 
 	assert_planes_disabled(crtc);
 
@@ -1892,7 +1896,7 @@ void intel_disable_pipe(const struct intel_crtc_state *old_crtc_state)
 	i915_reg_t reg;
 	u32 val;
 
-	DRM_DEBUG_KMS("disabling pipe %c\n", pipe_name(pipe));
+	drm_dbg_kms(&dev_priv->drm, "disabling pipe %c\n", pipe_name(pipe));
 
 	/*
 	 * Make sure planes won't keep trying to pump pixels to us,
@@ -2537,8 +2541,9 @@ static int intel_fb_offset_to_xy(int *x, int *y,
 		alignment = 0;
 
 	if (alignment != 0 && fb->offsets[color_plane] % alignment) {
-		DRM_DEBUG_KMS("Misaligned offset 0x%08x for color plane %d\n",
-			      fb->offsets[color_plane], color_plane);
+		drm_dbg_kms(&dev_priv->drm,
+			    "Misaligned offset 0x%08x for color plane %d\n",
+			    fb->offsets[color_plane], color_plane);
 		return -EINVAL;
 	}
 
@@ -2548,9 +2553,10 @@ static int intel_fb_offset_to_xy(int *x, int *y,
 	/* Catch potential overflows early */
 	if (add_overflows_t(u32, mul_u32_u32(height, fb->pitches[color_plane]),
 			    fb->offsets[color_plane])) {
-		DRM_DEBUG_KMS("Bad offset 0x%08x or pitch %d for color plane %d\n",
-			      fb->offsets[color_plane], fb->pitches[color_plane],
-			      color_plane);
+		drm_dbg_kms(&dev_priv->drm,
+			    "Bad offset 0x%08x or pitch %d for color plane %d\n",
+			    fb->offsets[color_plane], fb->pitches[color_plane],
+			    color_plane);
 		return -ERANGE;
 	}
 
@@ -3034,8 +3040,9 @@ intel_fill_fb_info(struct drm_i915_private *dev_priv,
 
 		ret = intel_fb_offset_to_xy(&x, &y, fb, i);
 		if (ret) {
-			DRM_DEBUG_KMS("bad fb plane %d offset: 0x%x\n",
-				      i, fb->offsets[i]);
+			drm_dbg_kms(&dev_priv->drm,
+				    "bad fb plane %d offset: 0x%x\n",
+				    i, fb->offsets[i]);
 			return ret;
 		}
 
@@ -3054,8 +3061,9 @@ intel_fill_fb_info(struct drm_i915_private *dev_priv,
 		 */
 		if (i == 0 && i915_gem_object_is_tiled(obj) &&
 		    (x + width) * cpp > fb->pitches[i]) {
-			DRM_DEBUG_KMS("bad fb plane %d offset: 0x%x\n",
-				      i, fb->offsets[i]);
+			drm_dbg_kms(&dev_priv->drm,
+				    "bad fb plane %d offset: 0x%x\n",
+				     i, fb->offsets[i]);
 			return -EINVAL;
 		}
 
@@ -3111,8 +3119,9 @@ intel_fill_fb_info(struct drm_i915_private *dev_priv,
 	}
 
 	if (mul_u32_u32(max_size, tile_size) > obj->base.size) {
-		DRM_DEBUG_KMS("fb too big for bo (need %llu bytes, have %zu bytes)\n",
-			      mul_u32_u32(max_size, tile_size), obj->base.size);
+		drm_dbg_kms(&dev_priv->drm,
+			    "fb too big for bo (need %llu bytes, have %zu bytes)\n",
+			    mul_u32_u32(max_size, tile_size), obj->base.size);
 		return -EINVAL;
 	}
 
@@ -3408,8 +3417,9 @@ intel_alloc_initial_plane_obj(struct intel_crtc *crtc,
 	case I915_FORMAT_MOD_Y_TILED:
 		break;
 	default:
-		DRM_DEBUG_DRIVER("Unsupported modifier for initial FB: 0x%llx\n",
-				 fb->modifier);
+		drm_dbg(&dev_priv->drm,
+			"Unsupported modifier for initial FB: 0x%llx\n",
+			fb->modifier);
 		return false;
 	}
 
@@ -3440,12 +3450,12 @@ intel_alloc_initial_plane_obj(struct intel_crtc *crtc,
 	mode_cmd.flags = DRM_MODE_FB_MODIFIERS;
 
 	if (intel_framebuffer_init(to_intel_framebuffer(fb), obj, &mode_cmd)) {
-		DRM_DEBUG_KMS("intel fb init failed\n");
+		drm_dbg_kms(&dev_priv->drm, "intel fb init failed\n");
 		goto out;
 	}
 
 
-	DRM_DEBUG_KMS("initial plane fb obj %p\n", obj);
+	drm_dbg_kms(&dev_priv->drm, "initial plane fb obj %p\n", obj);
 	ret = true;
 out:
 	i915_gem_object_put(obj);
@@ -3493,9 +3503,10 @@ static void intel_plane_disable_noatomic(struct intel_crtc *crtc,
 	struct intel_plane_state *plane_state =
 		to_intel_plane_state(plane->base.state);
 
-	DRM_DEBUG_KMS("Disabling [PLANE:%d:%s] on [CRTC:%d:%s]\n",
-		      plane->base.base.id, plane->base.name,
-		      crtc->base.base.id, crtc->base.name);
+	drm_dbg_kms(&dev_priv->drm,
+		    "Disabling [PLANE:%d:%s] on [CRTC:%d:%s]\n",
+		    plane->base.base.id, plane->base.name,
+		    crtc->base.base.id, crtc->base.name);
 
 	intel_set_plane_visible(crtc_state, plane_state, false);
 	fixup_active_planes(crtc_state);
@@ -3606,8 +3617,9 @@ intel_find_initial_plane_obj(struct intel_crtc *intel_crtc,
 					   intel_plane_uses_fence(intel_state),
 					   &intel_state->flags);
 	if (IS_ERR(intel_state->vma)) {
-		DRM_ERROR("failed to pin boot fb on pipe %d: %li\n",
-			  intel_crtc->pipe, PTR_ERR(intel_state->vma));
+		drm_err(&dev_priv->drm,
+			"failed to pin boot fb on pipe %d: %li\n",
+			intel_crtc->pipe, PTR_ERR(intel_state->vma));
 
 		intel_state->vma = NULL;
 		drm_framebuffer_put(fb);
@@ -3798,8 +3810,9 @@ static int skl_check_main_surface(struct intel_plane_state *plane_state)
 		max_height = skl_max_plane_height();
 
 	if (w > max_width || h > max_height) {
-		DRM_DEBUG_KMS("requested Y/RGB source size %dx%d too big (limit %dx%d)\n",
-			      w, h, max_width, max_height);
+		drm_dbg_kms(&dev_priv->drm,
+			    "requested Y/RGB source size %dx%d too big (limit %dx%d)\n",
+			    w, h, max_width, max_height);
 		return -EINVAL;
 	}
 
@@ -3829,7 +3842,8 @@ static int skl_check_main_surface(struct intel_plane_state *plane_state)
 
 		while ((x + w) * cpp > plane_state->color_plane[0].stride) {
 			if (offset == 0) {
-				DRM_DEBUG_KMS("Unable to find suitable display surface offset due to X-tiling\n");
+				drm_dbg_kms(&dev_priv->drm,
+					    "Unable to find suitable display surface offset due to X-tiling\n");
 				return -EINVAL;
 			}
 
@@ -3854,7 +3868,8 @@ static int skl_check_main_surface(struct intel_plane_state *plane_state)
 
 		if (x != plane_state->color_plane[aux_plane].x ||
 		    y != plane_state->color_plane[aux_plane].y) {
-			DRM_DEBUG_KMS("Unable to find suitable display surface offset due to CCS\n");
+			drm_dbg_kms(&dev_priv->drm,
+				    "Unable to find suitable display surface offset due to CCS\n");
 			return -EINVAL;
 		}
 	}
@@ -4819,7 +4834,8 @@ void intel_prepare_reset(struct drm_i915_private *dev_priv)
 	wake_up_bit(&dev_priv->gt.reset.flags, I915_RESET_MODESET);
 
 	if (atomic_read(&dev_priv->gpu_error.pending_fb_pin)) {
-		DRM_DEBUG_KMS("Modeset potentially stuck, unbreaking through wedging\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "Modeset potentially stuck, unbreaking through wedging\n");
 		intel_gt_set_wedged(&dev_priv->gt);
 	}
 
@@ -4843,13 +4859,15 @@ void intel_prepare_reset(struct drm_i915_private *dev_priv)
 	state = drm_atomic_helper_duplicate_state(dev, ctx);
 	if (IS_ERR(state)) {
 		ret = PTR_ERR(state);
-		DRM_ERROR("Duplicating state failed with %i\n", ret);
+		drm_err(&dev_priv->drm, "Duplicating state failed with %i\n",
+			ret);
 		return;
 	}
 
 	ret = drm_atomic_helper_disable_all(dev, ctx);
 	if (ret) {
-		DRM_ERROR("Suspending crtc's failed with %i\n", ret);
+		drm_err(&dev_priv->drm, "Suspending crtc's failed with %i\n",
+			ret);
 		drm_atomic_state_put(state);
 		return;
 	}
@@ -4878,7 +4896,8 @@ void intel_finish_reset(struct drm_i915_private *dev_priv)
 		/* for testing only restore the display */
 		ret = __intel_display_resume(dev, state, ctx);
 		if (ret)
-			DRM_ERROR("Restoring old state failed with %i\n", ret);
+			drm_err(&dev_priv->drm,
+				"Restoring old state failed with %i\n", ret);
 	} else {
 		/*
 		 * The display has been reset as well,
@@ -4895,7 +4914,8 @@ void intel_finish_reset(struct drm_i915_private *dev_priv)
 
 		ret = __intel_display_resume(dev, state, ctx);
 		if (ret)
-			DRM_ERROR("Restoring old state failed with %i\n", ret);
+			drm_err(&dev_priv->drm,
+				"Restoring old state failed with %i\n", ret);
 
 		intel_hpd_init(dev_priv);
 	}
@@ -5053,16 +5073,16 @@ static void ilk_fdi_link_train(struct intel_crtc *crtc,
 	reg = FDI_RX_IIR(pipe);
 	for (tries = 0; tries < 5; tries++) {
 		temp = I915_READ(reg);
-		DRM_DEBUG_KMS("FDI_RX_IIR 0x%x\n", temp);
+		drm_dbg_kms(&dev_priv->drm, "FDI_RX_IIR 0x%x\n", temp);
 
 		if ((temp & FDI_RX_BIT_LOCK)) {
-			DRM_DEBUG_KMS("FDI train 1 done.\n");
+			drm_dbg_kms(&dev_priv->drm, "FDI train 1 done.\n");
 			I915_WRITE(reg, temp | FDI_RX_BIT_LOCK);
 			break;
 		}
 	}
 	if (tries == 5)
-		DRM_ERROR("FDI train 1 fail!\n");
+		drm_err(&dev_priv->drm, "FDI train 1 fail!\n");
 
 	/* Train 2 */
 	reg = FDI_TX_CTL(pipe);
@@ -5083,18 +5103,18 @@ static void ilk_fdi_link_train(struct intel_crtc *crtc,
 	reg = FDI_RX_IIR(pipe);
 	for (tries = 0; tries < 5; tries++) {
 		temp = I915_READ(reg);
-		DRM_DEBUG_KMS("FDI_RX_IIR 0x%x\n", temp);
+		drm_dbg_kms(&dev_priv->drm, "FDI_RX_IIR 0x%x\n", temp);
 
 		if (temp & FDI_RX_SYMBOL_LOCK) {
 			I915_WRITE(reg, temp | FDI_RX_SYMBOL_LOCK);
-			DRM_DEBUG_KMS("FDI train 2 done.\n");
+			drm_dbg_kms(&dev_priv->drm, "FDI train 2 done.\n");
 			break;
 		}
 	}
 	if (tries == 5)
-		DRM_ERROR("FDI train 2 fail!\n");
+		drm_err(&dev_priv->drm, "FDI train 2 fail!\n");
 
-	DRM_DEBUG_KMS("FDI train done\n");
+	drm_dbg_kms(&dev_priv->drm, "FDI train done\n");
 
 }
 
@@ -5168,10 +5188,11 @@ static void gen6_fdi_link_train(struct intel_crtc *crtc,
 		for (retry = 0; retry < 5; retry++) {
 			reg = FDI_RX_IIR(pipe);
 			temp = I915_READ(reg);
-			DRM_DEBUG_KMS("FDI_RX_IIR 0x%x\n", temp);
+			drm_dbg_kms(&dev_priv->drm, "FDI_RX_IIR 0x%x\n", temp);
 			if (temp & FDI_RX_BIT_LOCK) {
 				I915_WRITE(reg, temp | FDI_RX_BIT_LOCK);
-				DRM_DEBUG_KMS("FDI train 1 done.\n");
+				drm_dbg_kms(&dev_priv->drm,
+					    "FDI train 1 done.\n");
 				break;
 			}
 			udelay(50);
@@ -5180,7 +5201,7 @@ static void gen6_fdi_link_train(struct intel_crtc *crtc,
 			break;
 	}
 	if (i == 4)
-		DRM_ERROR("FDI train 1 fail!\n");
+		drm_err(&dev_priv->drm, "FDI train 1 fail!\n");
 
 	/* Train 2 */
 	reg = FDI_TX_CTL(pipe);
@@ -5221,10 +5242,11 @@ static void gen6_fdi_link_train(struct intel_crtc *crtc,
 		for (retry = 0; retry < 5; retry++) {
 			reg = FDI_RX_IIR(pipe);
 			temp = I915_READ(reg);
-			DRM_DEBUG_KMS("FDI_RX_IIR 0x%x\n", temp);
+			drm_dbg_kms(&dev_priv->drm, "FDI_RX_IIR 0x%x\n", temp);
 			if (temp & FDI_RX_SYMBOL_LOCK) {
 				I915_WRITE(reg, temp | FDI_RX_SYMBOL_LOCK);
-				DRM_DEBUG_KMS("FDI train 2 done.\n");
+				drm_dbg_kms(&dev_priv->drm,
+					    "FDI train 2 done.\n");
 				break;
 			}
 			udelay(50);
@@ -5233,9 +5255,9 @@ static void gen6_fdi_link_train(struct intel_crtc *crtc,
 			break;
 	}
 	if (i == 4)
-		DRM_ERROR("FDI train 2 fail!\n");
+		drm_err(&dev_priv->drm, "FDI train 2 fail!\n");
 
-	DRM_DEBUG_KMS("FDI train done.\n");
+	drm_dbg_kms(&dev_priv->drm, "FDI train done.\n");
 }
 
 /* Manual link training for Ivy Bridge A0 parts */
@@ -5259,8 +5281,8 @@ static void ivb_manual_fdi_link_train(struct intel_crtc *crtc,
 	POSTING_READ(reg);
 	udelay(150);
 
-	DRM_DEBUG_KMS("FDI_RX_IIR before link train 0x%x\n",
-		      I915_READ(FDI_RX_IIR(pipe)));
+	drm_dbg_kms(&dev_priv->drm, "FDI_RX_IIR before link train 0x%x\n",
+		    I915_READ(FDI_RX_IIR(pipe)));
 
 	/* Try each vswing and preemphasis setting twice before moving on */
 	for (j = 0; j < ARRAY_SIZE(snb_b_fdi_train_param) * 2; j++) {
@@ -5304,19 +5326,21 @@ static void ivb_manual_fdi_link_train(struct intel_crtc *crtc,
 		for (i = 0; i < 4; i++) {
 			reg = FDI_RX_IIR(pipe);
 			temp = I915_READ(reg);
-			DRM_DEBUG_KMS("FDI_RX_IIR 0x%x\n", temp);
+			drm_dbg_kms(&dev_priv->drm, "FDI_RX_IIR 0x%x\n", temp);
 
 			if (temp & FDI_RX_BIT_LOCK ||
 			    (I915_READ(reg) & FDI_RX_BIT_LOCK)) {
 				I915_WRITE(reg, temp | FDI_RX_BIT_LOCK);
-				DRM_DEBUG_KMS("FDI train 1 done, level %i.\n",
-					      i);
+				drm_dbg_kms(&dev_priv->drm,
+					    "FDI train 1 done, level %i.\n",
+					    i);
 				break;
 			}
 			udelay(1); /* should be 0.5us */
 		}
 		if (i == 4) {
-			DRM_DEBUG_KMS("FDI train 1 fail on vswing %d\n", j / 2);
+			drm_dbg_kms(&dev_priv->drm,
+				    "FDI train 1 fail on vswing %d\n", j / 2);
 			continue;
 		}
 
@@ -5339,23 +5363,25 @@ static void ivb_manual_fdi_link_train(struct intel_crtc *crtc,
 		for (i = 0; i < 4; i++) {
 			reg = FDI_RX_IIR(pipe);
 			temp = I915_READ(reg);
-			DRM_DEBUG_KMS("FDI_RX_IIR 0x%x\n", temp);
+			drm_dbg_kms(&dev_priv->drm, "FDI_RX_IIR 0x%x\n", temp);
 
 			if (temp & FDI_RX_SYMBOL_LOCK ||
 			    (I915_READ(reg) & FDI_RX_SYMBOL_LOCK)) {
 				I915_WRITE(reg, temp | FDI_RX_SYMBOL_LOCK);
-				DRM_DEBUG_KMS("FDI train 2 done, level %i.\n",
-					      i);
+				drm_dbg_kms(&dev_priv->drm,
+					    "FDI train 2 done, level %i.\n",
+					    i);
 				goto train_done;
 			}
 			udelay(2); /* should be 1.5us */
 		}
 		if (i == 4)
-			DRM_DEBUG_KMS("FDI train 2 fail on vswing %d\n", j / 2);
+			drm_dbg_kms(&dev_priv->drm,
+				    "FDI train 2 fail on vswing %d\n", j / 2);
 	}
 
 train_done:
-	DRM_DEBUG_KMS("FDI train done.\n");
+	drm_dbg_kms(&dev_priv->drm, "FDI train done.\n");
 }
 
 static void ilk_fdi_pll_enable(const struct intel_crtc_state *crtc_state)
@@ -5557,12 +5583,9 @@ static void lpt_program_iclkip(const struct intel_crtc_state *crtc_state)
 	WARN_ON(SBI_SSCDIVINTPHASE_DIR(phasedir) &
 		~SBI_SSCDIVINTPHASE_INCVAL_MASK);
 
-	DRM_DEBUG_KMS("iCLKIP clock: found settings for %dKHz refresh rate: auxdiv=%x, divsel=%x, phasedir=%x, phaseinc=%x\n",
-			clock,
-			auxdiv,
-			divsel,
-			phasedir,
-			phaseinc);
+	drm_dbg_kms(&dev_priv->drm,
+		    "iCLKIP clock: found settings for %dKHz refresh rate: auxdiv=%x, divsel=%x, phasedir=%x, phaseinc=%x\n",
+		    clock, auxdiv, divsel, phasedir, phaseinc);
 
 	mutex_lock(&dev_priv->sb_lock);
 
@@ -5671,7 +5694,8 @@ static void cpt_set_fdi_bc_bifurcation(struct drm_i915_private *dev_priv, bool e
 	if (enable)
 		temp |= FDI_BC_BIFURCATION_SELECT;
 
-	DRM_DEBUG_KMS("%sabling fdi C rx\n", enable ? "en" : "dis");
+	drm_dbg_kms(&dev_priv->drm, "%sabling fdi C rx\n",
+		    enable ? "en" : "dis");
 	I915_WRITE(SOUTH_CHICKEN1, temp);
 	POSTING_READ(SOUTH_CHICKEN1);
 }
@@ -5848,7 +5872,9 @@ static void cpt_verify_modeset(struct drm_i915_private *dev_priv,
 	udelay(500);
 	if (wait_for(I915_READ(dslreg) != temp, 5)) {
 		if (wait_for(I915_READ(dslreg) != temp, 5))
-			DRM_ERROR("mode set failed: pipe %c stuck\n", pipe_name(pipe));
+			drm_err(&dev_priv->drm,
+				"mode set failed: pipe %c stuck\n",
+				pipe_name(pipe));
 	}
 }
 
@@ -5963,7 +5989,8 @@ skl_update_scaler(struct intel_crtc_state *crtc_state, bool force_detach,
 	 */
 	if (INTEL_GEN(dev_priv) >= 9 && crtc_state->hw.enable &&
 	    need_scaler && adjusted_mode->flags & DRM_MODE_FLAG_INTERLACE) {
-		DRM_DEBUG_KMS("Pipe/Plane scaling not supported with IF-ID mode\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "Pipe/Plane scaling not supported with IF-ID mode\n");
 		return -EINVAL;
 	}
 
@@ -5982,10 +6009,11 @@ skl_update_scaler(struct intel_crtc_state *crtc_state, bool force_detach,
 			scaler_state->scaler_users &= ~(1 << scaler_user);
 			scaler_state->scalers[*scaler_id].in_use = 0;
 
-			DRM_DEBUG_KMS("scaler_user index %u.%u: "
-				"Staged freeing scaler id %d scaler_users = 0x%x\n",
-				intel_crtc->pipe, scaler_user, *scaler_id,
-				scaler_state->scaler_users);
+			drm_dbg_kms(&dev_priv->drm,
+				    "scaler_user index %u.%u: "
+				    "Staged freeing scaler id %d scaler_users = 0x%x\n",
+				    intel_crtc->pipe, scaler_user, *scaler_id,
+				    scaler_state->scaler_users);
 			*scaler_id = -1;
 		}
 		return 0;
@@ -5993,7 +6021,8 @@ skl_update_scaler(struct intel_crtc_state *crtc_state, bool force_detach,
 
 	if (format && intel_format_info_is_yuv_semiplanar(format, modifier) &&
 	    (src_h < SKL_MIN_YUV_420_SRC_H || src_w < SKL_MIN_YUV_420_SRC_W)) {
-		DRM_DEBUG_KMS("Planar YUV: src dimensions not met\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "Planar YUV: src dimensions not met\n");
 		return -EINVAL;
 	}
 
@@ -6006,18 +6035,20 @@ skl_update_scaler(struct intel_crtc_state *crtc_state, bool force_detach,
 	    (INTEL_GEN(dev_priv) < 11 &&
 	     (src_w > SKL_MAX_SRC_W || src_h > SKL_MAX_SRC_H ||
 	      dst_w > SKL_MAX_DST_W || dst_h > SKL_MAX_DST_H)))	{
-		DRM_DEBUG_KMS("scaler_user index %u.%u: src %ux%u dst %ux%u "
-			"size is out of scaler range\n",
-			intel_crtc->pipe, scaler_user, src_w, src_h, dst_w, dst_h);
+		drm_dbg_kms(&dev_priv->drm,
+			    "scaler_user index %u.%u: src %ux%u dst %ux%u "
+			    "size is out of scaler range\n",
+			    intel_crtc->pipe, scaler_user, src_w, src_h,
+			    dst_w, dst_h);
 		return -EINVAL;
 	}
 
 	/* mark this plane as a scaler user in crtc_state */
 	scaler_state->scaler_users |= (1 << scaler_user);
-	DRM_DEBUG_KMS("scaler_user index %u.%u: "
-		"staged scaling request for %ux%u->%ux%u scaler_users = 0x%x\n",
-		intel_crtc->pipe, scaler_user, src_w, src_h, dst_w, dst_h,
-		scaler_state->scaler_users);
+	drm_dbg_kms(&dev_priv->drm, "scaler_user index %u.%u: "
+		    "staged scaling request for %ux%u->%ux%u scaler_users = 0x%x\n",
+		    intel_crtc->pipe, scaler_user, src_w, src_h, dst_w, dst_h,
+		    scaler_state->scaler_users);
 
 	return 0;
 }
@@ -6088,9 +6119,10 @@ static int skl_update_scaler_plane(struct intel_crtc_state *crtc_state,
 
 	/* check colorkey */
 	if (plane_state->ckey.flags) {
-		DRM_DEBUG_KMS("[PLANE:%d:%s] scaling with color key not allowed",
-			      intel_plane->base.base.id,
-			      intel_plane->base.name);
+		drm_dbg_kms(&dev_priv->drm,
+			    "[PLANE:%d:%s] scaling with color key not allowed",
+			    intel_plane->base.base.id,
+			    intel_plane->base.name);
 		return -EINVAL;
 	}
 
@@ -6128,9 +6160,10 @@ static int skl_update_scaler_plane(struct intel_crtc_state *crtc_state,
 			break;
 		/* fall through */
 	default:
-		DRM_DEBUG_KMS("[PLANE:%d:%s] FB:%d unsupported scaling format 0x%x\n",
-			      intel_plane->base.base.id, intel_plane->base.name,
-			      fb->base.id, fb->format->format);
+		drm_dbg_kms(&dev_priv->drm,
+			    "[PLANE:%d:%s] FB:%d unsupported scaling format 0x%x\n",
+			    intel_plane->base.base.id, intel_plane->base.name,
+			    fb->base.id, fb->format->format);
 		return -EINVAL;
 	}
 
@@ -6236,7 +6269,8 @@ void hsw_enable_ips(const struct intel_crtc_state *crtc_state)
 		 * the HW state readout code will complain that the expected
 		 * IPS_CTL value is not the one we read. */
 		if (intel_de_wait_for_set(dev_priv, IPS_CTL, IPS_ENABLE, 50))
-			DRM_ERROR("Timed out waiting for IPS enable\n");
+			drm_err(&dev_priv->drm,
+				"Timed out waiting for IPS enable\n");
 	}
 }
 
@@ -6257,7 +6291,8 @@ void hsw_disable_ips(const struct intel_crtc_state *crtc_state)
 		 * instead.
 		 */
 		if (intel_de_wait_for_clear(dev_priv, IPS_CTL, IPS_ENABLE, 100))
-			DRM_ERROR("Timed out waiting for IPS disable\n");
+			drm_err(&dev_priv->drm,
+				"Timed out waiting for IPS disable\n");
 	} else {
 		I915_WRITE(IPS_CTL, 0);
 		POSTING_READ(IPS_CTL);
@@ -7418,8 +7453,8 @@ static void i9xx_pfit_disable(const struct intel_crtc_state *old_crtc_state)
 
 	assert_pipe_disabled(dev_priv, old_crtc_state->cpu_transcoder);
 
-	DRM_DEBUG_KMS("disabling pfit, current: 0x%08x\n",
-		      I915_READ(PFIT_CONTROL));
+	drm_dbg_kms(&dev_priv->drm, "disabling pfit, current: 0x%08x\n",
+		    I915_READ(PFIT_CONTROL));
 	I915_WRITE(PFIT_CONTROL, 0);
 }
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
