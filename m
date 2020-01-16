Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EEF1404F4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 09:13:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751366F406;
	Fri, 17 Jan 2020 08:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856D16ECF6;
 Thu, 16 Jan 2020 13:10:07 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id b6so19124561wrq.0;
 Thu, 16 Jan 2020 05:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JNupCCKqoY5F0+PAwaIk/WkEJSIlq6ISDpdmeIR34+w=;
 b=Wfzf11nYniVtHZ+92d2FIGC/c9kij4uvOCYca6fKIFE1VeSffvZNBJJf9ery8oav0S
 JO4esCqPAPgGYZu/o3YHGCVlXjPX5WO9zoE0KKJ1QmH6PQRWbMoJa95pm5J6BxUVg+tA
 n68B0e7LK6qDJWkh3CYVQj5Naq+C4xSKjW3wWs9arQ5S+9BUa4/HvMIWwaoqW7WfySSh
 dCc+tPuJuuIE4FKHkKFww8iqf50dPLvo/axqwzM4kf1mQ2rvFPhZ6kA5g9r0cHl7QvCG
 hy1Xrh3OkZMwOyM840Ku2p9PG15jefaGWK7vU0Eow6VnOhL5PBY5UzbyWTWQQ8O6FhZC
 ADxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JNupCCKqoY5F0+PAwaIk/WkEJSIlq6ISDpdmeIR34+w=;
 b=JzudSNry+LS9v17y3R0pUOuDh9DFgEEm47mtnGOPyQl2ALzSxufouX0/NTqBb8iwCi
 OJucL5deTZXSYGXVYR9iLNyfNuGF1iu2AaeA5R4Lw9X60hTJLVbwLbxM7jy3MB4S3WV3
 az86+4kz33f8HDCJl6NqlL0usFpfi2iArHkPkGreRd77rYZWLxiLhKd9M+9Zlsdc2Ozz
 XwxpzRpKYnXZakJ7MulODa0FLq7PJp0s+PKA/qDEUefpsEG6LjPvZkgUQox2QLL+hQIR
 7udbV70tb3xFh7pRi3KDicfzQeKn3QOGK3TRpOZevZw+EhUPY1bE4QoZ09UqKES9/wjJ
 ziBQ==
X-Gm-Message-State: APjAAAUyL0Poueu9TxGLaXYsN6nfji2G/LfcHW5xKZWMGL6xUianHwtz
 xLFqxDWNzbDO7saX5z3HNFI=
X-Google-Smtp-Source: APXvYqz+jk35txgONGp/QPMaZzJD1PS5SuGk2jv8tF5S3+CsJ7cIt+jtNFcmfb4Vmf/X5iFA9jWlbA==
X-Received: by 2002:adf:d0c1:: with SMTP id z1mr3329759wrh.371.1579180205569; 
 Thu, 16 Jan 2020 05:10:05 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id k8sm29087196wrl.3.2020.01.16.05.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 05:10:05 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 3/4] drm/i915/display: conversion to new logging macros part 3
Date: Thu, 16 Jan 2020 16:09:46 +0300
Message-Id: <20200116130947.15464-4-wambui.karugax@gmail.com>
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

New checkpatch warnings were fixed manually.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 395 +++++++++++--------
 1 file changed, 223 insertions(+), 172 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index af8f1e0914a5..58d5333d3ad9 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -12637,7 +12637,8 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
 	if (dev_priv->display.compute_pipe_wm) {
 		ret = dev_priv->display.compute_pipe_wm(crtc_state);
 		if (ret) {
-			DRM_DEBUG_KMS("Target pipe watermarks are invalid\n");
+			drm_dbg_kms(&dev_priv->drm,
+				    "Target pipe watermarks are invalid\n");
 			return ret;
 		}
 	}
@@ -12653,7 +12654,8 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
 		 */
 		ret = dev_priv->display.compute_intermediate_wm(crtc_state);
 		if (ret) {
-			DRM_DEBUG_KMS("No valid intermediate pipe watermarks are possible\n");
+			drm_dbg_kms(&dev_priv->drm,
+				    "No valid intermediate pipe watermarks are possible\n");
 			return ret;
 		}
 	}
@@ -12900,22 +12902,24 @@ static void intel_dump_pipe_config(const struct intel_crtc_state *pipe_config,
 	char buf[64];
 	int i;
 
-	DRM_DEBUG_KMS("[CRTC:%d:%s] enable: %s %s\n",
-		      crtc->base.base.id, crtc->base.name,
-		      yesno(pipe_config->hw.enable), context);
+	drm_dbg_kms(&dev_priv->drm, "[CRTC:%d:%s] enable: %s %s\n",
+		    crtc->base.base.id, crtc->base.name,
+		    yesno(pipe_config->hw.enable), context);
 
 	if (!pipe_config->hw.enable)
 		goto dump_planes;
 
 	snprintf_output_types(buf, sizeof(buf), pipe_config->output_types);
-	DRM_DEBUG_KMS("active: %s, output_types: %s (0x%x), output format: %s\n",
-		      yesno(pipe_config->hw.active),
-		      buf, pipe_config->output_types,
-		      output_formats(pipe_config->output_format));
+	drm_dbg_kms(&dev_priv->drm,
+		    "active: %s, output_types: %s (0x%x), output format: %s\n",
+		    yesno(pipe_config->hw.active),
+		    buf, pipe_config->output_types,
+		    output_formats(pipe_config->output_format));
 
-	DRM_DEBUG_KMS("cpu_transcoder: %s, pipe bpp: %i, dithering: %i\n",
-		      transcoder_name(pipe_config->cpu_transcoder),
-		      pipe_config->pipe_bpp, pipe_config->dither);
+	drm_dbg_kms(&dev_priv->drm,
+		    "cpu_transcoder: %s, pipe bpp: %i, dithering: %i\n",
+		    transcoder_name(pipe_config->cpu_transcoder),
+		    pipe_config->pipe_bpp, pipe_config->dither);
 
 	if (pipe_config->has_pch_encoder)
 		intel_dump_m_n_config(pipe_config, "fdi",
@@ -12931,13 +12935,15 @@ static void intel_dump_pipe_config(const struct intel_crtc_state *pipe_config,
 					      &pipe_config->dp_m2_n2);
 	}
 
-	DRM_DEBUG_KMS("audio: %i, infoframes: %i, infoframes enabled: 0x%x\n",
-		      pipe_config->has_audio, pipe_config->has_infoframe,
-		      pipe_config->infoframes.enable);
+	drm_dbg_kms(&dev_priv->drm,
+		    "audio: %i, infoframes: %i, infoframes enabled: 0x%x\n",
+		    pipe_config->has_audio, pipe_config->has_infoframe,
+		    pipe_config->infoframes.enable);
 
 	if (pipe_config->infoframes.enable &
 	    intel_hdmi_infoframe_enable(HDMI_PACKET_TYPE_GENERAL_CONTROL))
-		DRM_DEBUG_KMS("GCP: 0x%x\n", pipe_config->infoframes.gcp);
+		drm_dbg_kms(&dev_priv->drm, "GCP: 0x%x\n",
+			    pipe_config->infoframes.gcp);
 	if (pipe_config->infoframes.enable &
 	    intel_hdmi_infoframe_enable(HDMI_INFOFRAME_TYPE_AVI))
 		intel_dump_infoframe(dev_priv, &pipe_config->infoframes.avi);
@@ -12948,50 +12954,56 @@ static void intel_dump_pipe_config(const struct intel_crtc_state *pipe_config,
 	    intel_hdmi_infoframe_enable(HDMI_INFOFRAME_TYPE_VENDOR))
 		intel_dump_infoframe(dev_priv, &pipe_config->infoframes.hdmi);
 
-	DRM_DEBUG_KMS("requested mode:\n");
+	drm_dbg_kms(&dev_priv->drm, "requested mode:\n");
 	drm_mode_debug_printmodeline(&pipe_config->hw.mode);
-	DRM_DEBUG_KMS("adjusted mode:\n");
+	drm_dbg_kms(&dev_priv->drm, "adjusted mode:\n");
 	drm_mode_debug_printmodeline(&pipe_config->hw.adjusted_mode);
 	intel_dump_crtc_timings(&pipe_config->hw.adjusted_mode);
-	DRM_DEBUG_KMS("port clock: %d, pipe src size: %dx%d, pixel rate %d\n",
-		      pipe_config->port_clock,
-		      pipe_config->pipe_src_w, pipe_config->pipe_src_h,
-		      pipe_config->pixel_rate);
+	drm_dbg_kms(&dev_priv->drm,
+		    "port clock: %d, pipe src size: %dx%d, pixel rate %d\n",
+		    pipe_config->port_clock,
+		    pipe_config->pipe_src_w, pipe_config->pipe_src_h,
+		    pipe_config->pixel_rate);
 
 	if (INTEL_GEN(dev_priv) >= 9)
-		DRM_DEBUG_KMS("num_scalers: %d, scaler_users: 0x%x, scaler_id: %d\n",
-			      crtc->num_scalers,
-			      pipe_config->scaler_state.scaler_users,
-		              pipe_config->scaler_state.scaler_id);
+		drm_dbg_kms(&dev_priv->drm,
+			    "num_scalers: %d, scaler_users: 0x%x, scaler_id: %d\n",
+			    crtc->num_scalers,
+			    pipe_config->scaler_state.scaler_users,
+			    pipe_config->scaler_state.scaler_id);
 
 	if (HAS_GMCH(dev_priv))
-		DRM_DEBUG_KMS("gmch pfit: control: 0x%08x, ratios: 0x%08x, lvds border: 0x%08x\n",
-			      pipe_config->gmch_pfit.control,
-			      pipe_config->gmch_pfit.pgm_ratios,
-			      pipe_config->gmch_pfit.lvds_border_bits);
+		drm_dbg_kms(&dev_priv->drm,
+			    "gmch pfit: control: 0x%08x, ratios: 0x%08x, lvds border: 0x%08x\n",
+			    pipe_config->gmch_pfit.control,
+			    pipe_config->gmch_pfit.pgm_ratios,
+			    pipe_config->gmch_pfit.lvds_border_bits);
 	else
-		DRM_DEBUG_KMS("pch pfit: pos: 0x%08x, size: 0x%08x, %s, force thru: %s\n",
-			      pipe_config->pch_pfit.pos,
-			      pipe_config->pch_pfit.size,
-			      enableddisabled(pipe_config->pch_pfit.enabled),
-			      yesno(pipe_config->pch_pfit.force_thru));
+		drm_dbg_kms(&dev_priv->drm,
+			    "pch pfit: pos: 0x%08x, size: 0x%08x, %s, force thru: %s\n",
+			    pipe_config->pch_pfit.pos,
+			    pipe_config->pch_pfit.size,
+			    enableddisabled(pipe_config->pch_pfit.enabled),
+			    yesno(pipe_config->pch_pfit.force_thru));
 
-	DRM_DEBUG_KMS("ips: %i, double wide: %i\n",
-		      pipe_config->ips_enabled, pipe_config->double_wide);
+	drm_dbg_kms(&dev_priv->drm, "ips: %i, double wide: %i\n",
+		    pipe_config->ips_enabled, pipe_config->double_wide);
 
 	intel_dpll_dump_hw_state(dev_priv, &pipe_config->dpll_hw_state);
 
 	if (IS_CHERRYVIEW(dev_priv))
-		DRM_DEBUG_KMS("cgm_mode: 0x%x gamma_mode: 0x%x gamma_enable: %d csc_enable: %d\n",
-			      pipe_config->cgm_mode, pipe_config->gamma_mode,
-			      pipe_config->gamma_enable, pipe_config->csc_enable);
+		drm_dbg_kms(&dev_priv->drm,
+			    "cgm_mode: 0x%x gamma_mode: 0x%x gamma_enable: %d csc_enable: %d\n",
+			    pipe_config->cgm_mode, pipe_config->gamma_mode,
+			    pipe_config->gamma_enable, pipe_config->csc_enable);
 	else
-		DRM_DEBUG_KMS("csc_mode: 0x%x gamma_mode: 0x%x gamma_enable: %d csc_enable: %d\n",
-			      pipe_config->csc_mode, pipe_config->gamma_mode,
-			      pipe_config->gamma_enable, pipe_config->csc_enable);
+		drm_dbg_kms(&dev_priv->drm,
+			    "csc_mode: 0x%x gamma_mode: 0x%x gamma_enable: %d csc_enable: %d\n",
+			    pipe_config->csc_mode, pipe_config->gamma_mode,
+			    pipe_config->gamma_enable, pipe_config->csc_enable);
 
-	DRM_DEBUG_KMS("MST master transcoder: %s\n",
-		      transcoder_name(pipe_config->mst_master_transcoder));
+	drm_dbg_kms(&dev_priv->drm, "MST master transcoder: %s\n",
+		    transcoder_name(pipe_config->mst_master_transcoder));
 
 dump_planes:
 	if (!state)
@@ -13398,16 +13410,17 @@ pipe_config_infoframe_mismatch(struct drm_i915_private *dev_priv,
 		if (!drm_debug_enabled(DRM_UT_KMS))
 			return;
 
-		DRM_DEBUG_KMS("fastset mismatch in %s infoframe\n", name);
-		DRM_DEBUG_KMS("expected:\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "fastset mismatch in %s infoframe\n", name);
+		drm_dbg_kms(&dev_priv->drm, "expected:\n");
 		hdmi_infoframe_log(KERN_DEBUG, dev_priv->drm.dev, a);
-		DRM_DEBUG_KMS("found:\n");
+		drm_dbg_kms(&dev_priv->drm, "found:\n");
 		hdmi_infoframe_log(KERN_DEBUG, dev_priv->drm.dev, b);
 	} else {
-		DRM_ERROR("mismatch in %s infoframe\n", name);
-		DRM_ERROR("expected:\n");
+		drm_err(&dev_priv->drm, "mismatch in %s infoframe\n", name);
+		drm_err(&dev_priv->drm, "expected:\n");
 		hdmi_infoframe_log(KERN_ERR, dev_priv->drm.dev, a);
-		DRM_ERROR("found:\n");
+		drm_err(&dev_priv->drm, "found:\n");
 		hdmi_infoframe_log(KERN_ERR, dev_priv->drm.dev, b);
 	}
 }
@@ -13464,7 +13477,8 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 		!(pipe_config->hw.mode.private_flags & I915_MODE_FLAG_INHERITED);
 
 	if (fixup_inherited && !fastboot_enabled(dev_priv)) {
-		DRM_DEBUG_KMS("initial modeset and fastboot not set\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "initial modeset and fastboot not set\n");
 		ret = false;
 	}
 
@@ -13858,9 +13872,10 @@ static void verify_wm_state(struct intel_crtc *crtc,
 
 	if (INTEL_GEN(dev_priv) >= 11 &&
 	    hw->ddb.enabled_slices != sw_ddb->enabled_slices)
-		DRM_ERROR("mismatch in DBUF Slices (expected %u, got %u)\n",
-			  sw_ddb->enabled_slices,
-			  hw->ddb.enabled_slices);
+		drm_err(&dev_priv->drm,
+			"mismatch in DBUF Slices (expected %u, got %u)\n",
+			sw_ddb->enabled_slices,
+			hw->ddb.enabled_slices);
 
 	/* planes */
 	for_each_universal_plane(dev_priv, pipe, plane) {
@@ -13875,26 +13890,28 @@ static void verify_wm_state(struct intel_crtc *crtc,
 						&sw_plane_wm->wm[level]))
 				continue;
 
-			DRM_ERROR("mismatch in WM pipe %c plane %d level %d (expected e=%d b=%u l=%u, got e=%d b=%u l=%u)\n",
-				  pipe_name(pipe), plane + 1, level,
-				  sw_plane_wm->wm[level].plane_en,
-				  sw_plane_wm->wm[level].plane_res_b,
-				  sw_plane_wm->wm[level].plane_res_l,
-				  hw_plane_wm->wm[level].plane_en,
-				  hw_plane_wm->wm[level].plane_res_b,
-				  hw_plane_wm->wm[level].plane_res_l);
+			drm_err(&dev_priv->drm,
+				"mismatch in WM pipe %c plane %d level %d (expected e=%d b=%u l=%u, got e=%d b=%u l=%u)\n",
+				pipe_name(pipe), plane + 1, level,
+				sw_plane_wm->wm[level].plane_en,
+				sw_plane_wm->wm[level].plane_res_b,
+				sw_plane_wm->wm[level].plane_res_l,
+				hw_plane_wm->wm[level].plane_en,
+				hw_plane_wm->wm[level].plane_res_b,
+				hw_plane_wm->wm[level].plane_res_l);
 		}
 
 		if (!skl_wm_level_equals(&hw_plane_wm->trans_wm,
 					 &sw_plane_wm->trans_wm)) {
-			DRM_ERROR("mismatch in trans WM pipe %c plane %d (expected e=%d b=%u l=%u, got e=%d b=%u l=%u)\n",
-				  pipe_name(pipe), plane + 1,
-				  sw_plane_wm->trans_wm.plane_en,
-				  sw_plane_wm->trans_wm.plane_res_b,
-				  sw_plane_wm->trans_wm.plane_res_l,
-				  hw_plane_wm->trans_wm.plane_en,
-				  hw_plane_wm->trans_wm.plane_res_b,
-				  hw_plane_wm->trans_wm.plane_res_l);
+			drm_err(&dev_priv->drm,
+				"mismatch in trans WM pipe %c plane %d (expected e=%d b=%u l=%u, got e=%d b=%u l=%u)\n",
+				pipe_name(pipe), plane + 1,
+				sw_plane_wm->trans_wm.plane_en,
+				sw_plane_wm->trans_wm.plane_res_b,
+				sw_plane_wm->trans_wm.plane_res_l,
+				hw_plane_wm->trans_wm.plane_en,
+				hw_plane_wm->trans_wm.plane_res_b,
+				hw_plane_wm->trans_wm.plane_res_l);
 		}
 
 		/* DDB */
@@ -13902,10 +13919,11 @@ static void verify_wm_state(struct intel_crtc *crtc,
 		sw_ddb_entry = &new_crtc_state->wm.skl.plane_ddb_y[plane];
 
 		if (!skl_ddb_entry_equal(hw_ddb_entry, sw_ddb_entry)) {
-			DRM_ERROR("mismatch in DDB state pipe %c plane %d (expected (%u,%u), found (%u,%u))\n",
-				  pipe_name(pipe), plane + 1,
-				  sw_ddb_entry->start, sw_ddb_entry->end,
-				  hw_ddb_entry->start, hw_ddb_entry->end);
+			drm_err(&dev_priv->drm,
+				"mismatch in DDB state pipe %c plane %d (expected (%u,%u), found (%u,%u))\n",
+				pipe_name(pipe), plane + 1,
+				sw_ddb_entry->start, sw_ddb_entry->end,
+				hw_ddb_entry->start, hw_ddb_entry->end);
 		}
 	}
 
@@ -13927,26 +13945,28 @@ static void verify_wm_state(struct intel_crtc *crtc,
 						&sw_plane_wm->wm[level]))
 				continue;
 
-			DRM_ERROR("mismatch in WM pipe %c cursor level %d (expected e=%d b=%u l=%u, got e=%d b=%u l=%u)\n",
-				  pipe_name(pipe), level,
-				  sw_plane_wm->wm[level].plane_en,
-				  sw_plane_wm->wm[level].plane_res_b,
-				  sw_plane_wm->wm[level].plane_res_l,
-				  hw_plane_wm->wm[level].plane_en,
-				  hw_plane_wm->wm[level].plane_res_b,
-				  hw_plane_wm->wm[level].plane_res_l);
+			drm_err(&dev_priv->drm,
+				"mismatch in WM pipe %c cursor level %d (expected e=%d b=%u l=%u, got e=%d b=%u l=%u)\n",
+				pipe_name(pipe), level,
+				sw_plane_wm->wm[level].plane_en,
+				sw_plane_wm->wm[level].plane_res_b,
+				sw_plane_wm->wm[level].plane_res_l,
+				hw_plane_wm->wm[level].plane_en,
+				hw_plane_wm->wm[level].plane_res_b,
+				hw_plane_wm->wm[level].plane_res_l);
 		}
 
 		if (!skl_wm_level_equals(&hw_plane_wm->trans_wm,
 					 &sw_plane_wm->trans_wm)) {
-			DRM_ERROR("mismatch in trans WM pipe %c cursor (expected e=%d b=%u l=%u, got e=%d b=%u l=%u)\n",
-				  pipe_name(pipe),
-				  sw_plane_wm->trans_wm.plane_en,
-				  sw_plane_wm->trans_wm.plane_res_b,
-				  sw_plane_wm->trans_wm.plane_res_l,
-				  hw_plane_wm->trans_wm.plane_en,
-				  hw_plane_wm->trans_wm.plane_res_b,
-				  hw_plane_wm->trans_wm.plane_res_l);
+			drm_err(&dev_priv->drm,
+				"mismatch in trans WM pipe %c cursor (expected e=%d b=%u l=%u, got e=%d b=%u l=%u)\n",
+				pipe_name(pipe),
+				sw_plane_wm->trans_wm.plane_en,
+				sw_plane_wm->trans_wm.plane_res_b,
+				sw_plane_wm->trans_wm.plane_res_l,
+				hw_plane_wm->trans_wm.plane_en,
+				hw_plane_wm->trans_wm.plane_res_b,
+				hw_plane_wm->trans_wm.plane_res_l);
 		}
 
 		/* DDB */
@@ -13954,10 +13974,11 @@ static void verify_wm_state(struct intel_crtc *crtc,
 		sw_ddb_entry = &new_crtc_state->wm.skl.plane_ddb_y[PLANE_CURSOR];
 
 		if (!skl_ddb_entry_equal(hw_ddb_entry, sw_ddb_entry)) {
-			DRM_ERROR("mismatch in DDB state pipe %c cursor (expected (%u,%u), found (%u,%u))\n",
-				  pipe_name(pipe),
-				  sw_ddb_entry->start, sw_ddb_entry->end,
-				  hw_ddb_entry->start, hw_ddb_entry->end);
+			drm_err(&dev_priv->drm,
+				"mismatch in DDB state pipe %c cursor (expected (%u,%u), found (%u,%u))\n",
+				pipe_name(pipe),
+				sw_ddb_entry->start, sw_ddb_entry->end,
+				hw_ddb_entry->start, hw_ddb_entry->end);
 		}
 	}
 
@@ -14001,9 +14022,9 @@ verify_encoder_state(struct drm_i915_private *dev_priv, struct intel_atomic_stat
 		bool enabled = false, found = false;
 		enum pipe pipe;
 
-		DRM_DEBUG_KMS("[ENCODER:%d:%s]\n",
-			      encoder->base.base.id,
-			      encoder->base.name);
+		drm_dbg_kms(&dev_priv->drm, "[ENCODER:%d:%s]\n",
+			    encoder->base.base.id,
+			    encoder->base.name);
 
 		for_each_oldnew_connector_in_state(&state->base, connector, old_conn_state,
 						   new_conn_state, i) {
@@ -14055,7 +14076,8 @@ verify_crtc_state(struct intel_crtc *crtc,
 	intel_crtc_state_reset(old_crtc_state, crtc);
 	old_crtc_state->uapi.state = state;
 
-	DRM_DEBUG_KMS("[CRTC:%d:%s]\n", crtc->base.base.id, crtc->base.name);
+	drm_dbg_kms(&dev_priv->drm, "[CRTC:%d:%s]\n", crtc->base.base.id,
+		    crtc->base.name);
 
 	active = dev_priv->display.get_pipe_config(crtc, pipe_config);
 
@@ -14130,7 +14152,7 @@ verify_single_dpll_state(struct drm_i915_private *dev_priv,
 
 	memset(&dpll_hw_state, 0, sizeof(dpll_hw_state));
 
-	DRM_DEBUG_KMS("%s\n", pll->info->name);
+	drm_dbg_kms(&dev_priv->drm, "%s\n", pll->info->name);
 
 	active = pll->info->funcs->get_hw_state(dev_priv, pll, &dpll_hw_state);
 
@@ -14771,7 +14793,8 @@ static int intel_atomic_check(struct drm_device *dev,
 	}
 
 	if (any_ms && !check_digital_port_conflicts(state)) {
-		DRM_DEBUG_KMS("rejecting conflicting digital port configuration\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "rejecting conflicting digital port configuration\n");
 		ret = EINVAL;
 		goto fail;
 	}
@@ -15661,7 +15684,8 @@ static int intel_atomic_commit(struct drm_device *dev,
 
 	ret = intel_atomic_prepare_commit(state);
 	if (ret) {
-		DRM_DEBUG_ATOMIC("Preparing state failed with %i\n", ret);
+		drm_dbg_atomic(&dev_priv->drm,
+			       "Preparing state failed with %i\n", ret);
 		i915_sw_fence_commit(&state->commit_ready);
 		intel_runtime_pm_put(&dev_priv->runtime_pm, state->wakeref);
 		return ret;
@@ -16885,10 +16909,11 @@ static void intel_setup_outputs(struct drm_i915_private *dev_priv)
 		intel_crt_init(dev_priv);
 
 		if (I915_READ(GEN3_SDVOB) & SDVO_DETECTED) {
-			DRM_DEBUG_KMS("probing SDVOB\n");
+			drm_dbg_kms(&dev_priv->drm, "probing SDVOB\n");
 			found = intel_sdvo_init(dev_priv, GEN3_SDVOB, PORT_B);
 			if (!found && IS_G4X(dev_priv)) {
-				DRM_DEBUG_KMS("probing HDMI on SDVOB\n");
+				drm_dbg_kms(&dev_priv->drm,
+					    "probing HDMI on SDVOB\n");
 				intel_hdmi_init(dev_priv, GEN4_HDMIB, PORT_B);
 			}
 
@@ -16899,14 +16924,15 @@ static void intel_setup_outputs(struct drm_i915_private *dev_priv)
 		/* Before G4X SDVOC doesn't have its own detect register */
 
 		if (I915_READ(GEN3_SDVOB) & SDVO_DETECTED) {
-			DRM_DEBUG_KMS("probing SDVOC\n");
+			drm_dbg_kms(&dev_priv->drm, "probing SDVOC\n");
 			found = intel_sdvo_init(dev_priv, GEN3_SDVOC, PORT_C);
 		}
 
 		if (!found && (I915_READ(GEN3_SDVOC) & SDVO_DETECTED)) {
 
 			if (IS_G4X(dev_priv)) {
-				DRM_DEBUG_KMS("probing HDMI on SDVOC\n");
+				drm_dbg_kms(&dev_priv->drm,
+					    "probing HDMI on SDVOC\n");
 				intel_hdmi_init(dev_priv, GEN4_HDMIC, PORT_C);
 			}
 			if (IS_G4X(dev_priv))
@@ -17011,14 +17037,16 @@ static int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 		 */
 		if (tiling != I915_TILING_NONE &&
 		    tiling != intel_fb_modifier_to_tiling(mode_cmd->modifier[0])) {
-			DRM_DEBUG_KMS("tiling_mode doesn't match fb modifier\n");
+			drm_dbg_kms(&dev_priv->drm,
+				    "tiling_mode doesn't match fb modifier\n");
 			goto err;
 		}
 	} else {
 		if (tiling == I915_TILING_X) {
 			mode_cmd->modifier[0] = I915_FORMAT_MOD_X_TILED;
 		} else if (tiling == I915_TILING_Y) {
-			DRM_DEBUG_KMS("No Y tiling for legacy addfb\n");
+			drm_dbg_kms(&dev_priv->drm,
+				    "No Y tiling for legacy addfb\n");
 			goto err;
 		}
 	}
@@ -17028,10 +17056,11 @@ static int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 				      mode_cmd->modifier[0])) {
 		struct drm_format_name_buf format_name;
 
-		DRM_DEBUG_KMS("unsupported pixel format %s / modifier 0x%llx\n",
-			      drm_get_format_name(mode_cmd->pixel_format,
-						  &format_name),
-			      mode_cmd->modifier[0]);
+		drm_dbg_kms(&dev_priv->drm,
+			    "unsupported pixel format %s / modifier 0x%llx\n",
+			    drm_get_format_name(mode_cmd->pixel_format,
+						&format_name),
+			    mode_cmd->modifier[0]);
 		goto err;
 	}
 
@@ -17041,17 +17070,19 @@ static int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 	 */
 	if (INTEL_GEN(dev_priv) < 4 &&
 	    tiling != intel_fb_modifier_to_tiling(mode_cmd->modifier[0])) {
-		DRM_DEBUG_KMS("tiling_mode must match fb modifier exactly on gen2/3\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "tiling_mode must match fb modifier exactly on gen2/3\n");
 		goto err;
 	}
 
 	max_stride = intel_fb_max_stride(dev_priv, mode_cmd->pixel_format,
 					 mode_cmd->modifier[0]);
 	if (mode_cmd->pitches[0] > max_stride) {
-		DRM_DEBUG_KMS("%s pitch (%u) must be at most %d\n",
-			      mode_cmd->modifier[0] != DRM_FORMAT_MOD_LINEAR ?
-			      "tiled" : "linear",
-			      mode_cmd->pitches[0], max_stride);
+		drm_dbg_kms(&dev_priv->drm,
+			    "%s pitch (%u) must be at most %d\n",
+			    mode_cmd->modifier[0] != DRM_FORMAT_MOD_LINEAR ?
+			    "tiled" : "linear",
+			    mode_cmd->pitches[0], max_stride);
 		goto err;
 	}
 
@@ -17060,15 +17091,17 @@ static int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 	 * the fb pitch and fence stride match.
 	 */
 	if (tiling != I915_TILING_NONE && mode_cmd->pitches[0] != stride) {
-		DRM_DEBUG_KMS("pitch (%d) must match tiling stride (%d)\n",
-			      mode_cmd->pitches[0], stride);
+		drm_dbg_kms(&dev_priv->drm,
+			    "pitch (%d) must match tiling stride (%d)\n",
+			    mode_cmd->pitches[0], stride);
 		goto err;
 	}
 
 	/* FIXME need to adjust LINOFF/TILEOFF accordingly. */
 	if (mode_cmd->offsets[0] != 0) {
-		DRM_DEBUG_KMS("plane 0 offset (0x%08x) must be 0\n",
-			      mode_cmd->offsets[0]);
+		drm_dbg_kms(&dev_priv->drm,
+			    "plane 0 offset (0x%08x) must be 0\n",
+			    mode_cmd->offsets[0]);
 		goto err;
 	}
 
@@ -17078,14 +17111,16 @@ static int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 		u32 stride_alignment;
 
 		if (mode_cmd->handles[i] != mode_cmd->handles[0]) {
-			DRM_DEBUG_KMS("bad plane %d handle\n", i);
+			drm_dbg_kms(&dev_priv->drm, "bad plane %d handle\n",
+				    i);
 			goto err;
 		}
 
 		stride_alignment = intel_fb_stride_alignment(fb, i);
 		if (fb->pitches[i] & (stride_alignment - 1)) {
-			DRM_DEBUG_KMS("plane %d pitch (%d) must be at least %u byte aligned\n",
-				      i, fb->pitches[i], stride_alignment);
+			drm_dbg_kms(&dev_priv->drm,
+				    "plane %d pitch (%d) must be at least %u byte aligned\n",
+				    i, fb->pitches[i], stride_alignment);
 			goto err;
 		}
 
@@ -17093,9 +17128,10 @@ static int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			int ccs_aux_stride = gen12_ccs_aux_stride(fb, i);
 
 			if (fb->pitches[i] != ccs_aux_stride) {
-				DRM_DEBUG_KMS("ccs aux plane %d pitch (%d) must be %d\n",
-					      i,
-					      fb->pitches[i], ccs_aux_stride);
+				drm_dbg_kms(&dev_priv->drm,
+					    "ccs aux plane %d pitch (%d) must be %d\n",
+					    i,
+					    fb->pitches[i], ccs_aux_stride);
 				goto err;
 			}
 		}
@@ -17109,7 +17145,7 @@ static int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 
 	ret = drm_framebuffer_init(&dev_priv->drm, fb, &intel_fb_funcs);
 	if (ret) {
-		DRM_ERROR("framebuffer init failed %d\n", ret);
+		drm_err(&dev_priv->drm, "framebuffer init failed %d\n", ret);
 		goto err;
 	}
 
@@ -17484,7 +17520,7 @@ static void intel_update_fdi_pll_freq(struct drm_i915_private *dev_priv)
 		return;
 	}
 
-	DRM_DEBUG_DRIVER("FDI PLL freq=%d\n", dev_priv->fdi_pll_freq);
+	drm_dbg(&dev_priv->drm, "FDI PLL freq=%d\n", dev_priv->fdi_pll_freq);
 }
 
 static int intel_initial_commit(struct drm_device *dev)
@@ -17621,9 +17657,9 @@ int intel_modeset_init(struct drm_i915_private *i915)
 
 	intel_gmbus_setup(i915);
 
-	DRM_DEBUG_KMS("%d display pipe%s available.\n",
-		      INTEL_NUM_PIPES(i915),
-		      INTEL_NUM_PIPES(i915) > 1 ? "s" : "");
+	drm_dbg_kms(&i915->drm, "%d display pipe%s available.\n",
+		    INTEL_NUM_PIPES(i915),
+		    INTEL_NUM_PIPES(i915) > 1 ? "s" : "");
 
 	if (HAS_DISPLAY(i915) && INTEL_DISPLAY_ENABLED(i915)) {
 		for_each_pipe(i915, pipe) {
@@ -17692,7 +17728,7 @@ int intel_modeset_init(struct drm_i915_private *i915)
 	 */
 	ret = intel_initial_commit(dev);
 	if (ret)
-		DRM_DEBUG_KMS("Initial commit in probe failed.\n");
+		drm_dbg_kms(&i915->drm, "Initial commit in probe failed.\n");
 
 	return 0;
 }
@@ -17713,8 +17749,9 @@ void i830_enable_pipe(struct drm_i915_private *dev_priv, enum pipe pipe)
 
 	WARN_ON(i9xx_calc_dpll_params(48000, &clock) != 25154);
 
-	DRM_DEBUG_KMS("enabling pipe %c due to force quirk (vco=%d dot=%d)\n",
-		      pipe_name(pipe), clock.vco, clock.dot);
+	drm_dbg_kms(&dev_priv->drm,
+		    "enabling pipe %c due to force quirk (vco=%d dot=%d)\n",
+		    pipe_name(pipe), clock.vco, clock.dot);
 
 	fp = i9xx_dpll_compute_fp(&clock);
 	dpll = DPLL_DVO_2X_MODE |
@@ -17771,8 +17808,8 @@ void i830_disable_pipe(struct drm_i915_private *dev_priv, enum pipe pipe)
 {
 	struct intel_crtc *crtc = intel_get_crtc_for_pipe(dev_priv, pipe);
 
-	DRM_DEBUG_KMS("disabling pipe %c due to force quirk\n",
-		      pipe_name(pipe));
+	drm_dbg_kms(&dev_priv->drm, "disabling pipe %c due to force quirk\n",
+		    pipe_name(pipe));
 
 	WARN_ON(I915_READ(DSPCNTR(PLANE_A)) & DISPLAY_PLANE_ENABLE);
 	WARN_ON(I915_READ(DSPCNTR(PLANE_B)) & DISPLAY_PLANE_ENABLE);
@@ -17809,8 +17846,9 @@ intel_sanitize_plane_mapping(struct drm_i915_private *dev_priv)
 		if (pipe == crtc->pipe)
 			continue;
 
-		DRM_DEBUG_KMS("[PLANE:%d:%s] attached to the wrong pipe, disabling plane\n",
-			      plane->base.base.id, plane->base.name);
+		drm_dbg_kms(&dev_priv->drm,
+			    "[PLANE:%d:%s] attached to the wrong pipe, disabling plane\n",
+			    plane->base.base.id, plane->base.name);
 
 		plane_crtc = intel_get_crtc_for_pipe(dev_priv, pipe);
 		intel_plane_disable_noatomic(plane_crtc, plane);
@@ -17999,16 +18037,18 @@ static void intel_sanitize_encoder(struct intel_encoder *encoder)
 		crtc_state->hw.active;
 
 	if (crtc_state && has_bogus_dpll_config(crtc_state)) {
-		DRM_DEBUG_KMS("BIOS has misprogrammed the hardware. Disabling pipe %c\n",
-			      pipe_name(crtc->pipe));
+		drm_dbg_kms(&dev_priv->drm,
+			    "BIOS has misprogrammed the hardware. Disabling pipe %c\n",
+			    pipe_name(crtc->pipe));
 		has_active_crtc = false;
 	}
 
 	connector = intel_encoder_find_connector(encoder);
 	if (connector && !has_active_crtc) {
-		DRM_DEBUG_KMS("[ENCODER:%d:%s] has active connectors but no active pipe!\n",
-			      encoder->base.base.id,
-			      encoder->base.name);
+		drm_dbg_kms(&dev_priv->drm,
+			    "[ENCODER:%d:%s] has active connectors but no active pipe!\n",
+			    encoder->base.base.id,
+			    encoder->base.name);
 
 		/* Connector is active, but has no active pipe. This is
 		 * fallout from our resume register restoring. Disable
@@ -18016,9 +18056,10 @@ static void intel_sanitize_encoder(struct intel_encoder *encoder)
 		if (crtc_state) {
 			struct drm_encoder *best_encoder;
 
-			DRM_DEBUG_KMS("[ENCODER:%d:%s] manually disabled\n",
-				      encoder->base.base.id,
-				      encoder->base.name);
+			drm_dbg_kms(&dev_priv->drm,
+				    "[ENCODER:%d:%s] manually disabled\n",
+				    encoder->base.base.id,
+				    encoder->base.name);
 
 			/* avoid oopsing in case the hooks consult best_encoder */
 			best_encoder = connector->base.state->best_encoder;
@@ -18071,9 +18112,10 @@ static void readout_plane_state(struct drm_i915_private *dev_priv)
 
 		intel_set_plane_visible(crtc_state, plane_state, visible);
 
-		DRM_DEBUG_KMS("[PLANE:%d:%s] hw state readout: %s, pipe %c\n",
-			      plane->base.base.id, plane->base.name,
-			      enableddisabled(visible), pipe_name(pipe));
+		drm_dbg_kms(&dev_priv->drm,
+			    "[PLANE:%d:%s] hw state readout: %s, pipe %c\n",
+			    plane->base.base.id, plane->base.name,
+			    enableddisabled(visible), pipe_name(pipe));
 	}
 
 	for_each_intel_crtc(&dev_priv->drm, crtc) {
@@ -18113,9 +18155,10 @@ static void intel_modeset_readout_hw_state(struct drm_device *dev)
 		if (crtc_state->hw.active)
 			dev_priv->active_pipes |= BIT(crtc->pipe);
 
-		DRM_DEBUG_KMS("[CRTC:%d:%s] hw state readout: %s\n",
-			      crtc->base.base.id, crtc->base.name,
-			      enableddisabled(crtc_state->hw.active));
+		drm_dbg_kms(&dev_priv->drm,
+			    "[CRTC:%d:%s] hw state readout: %s\n",
+			    crtc->base.base.id, crtc->base.name,
+			    enableddisabled(crtc_state->hw.active));
 	}
 
 	readout_plane_state(dev_priv);
@@ -18143,8 +18186,9 @@ static void intel_modeset_readout_hw_state(struct drm_device *dev)
 		}
 		pll->active_mask = pll->state.crtc_mask;
 
-		DRM_DEBUG_KMS("%s hw state readout: crtc_mask 0x%08x, on %i\n",
-			      pll->info->name, pll->state.crtc_mask, pll->on);
+		drm_dbg_kms(&dev_priv->drm,
+			    "%s hw state readout: crtc_mask 0x%08x, on %i\n",
+			    pll->info->name, pll->state.crtc_mask, pll->on);
 	}
 
 	for_each_intel_encoder(dev, encoder) {
@@ -18162,10 +18206,11 @@ static void intel_modeset_readout_hw_state(struct drm_device *dev)
 			encoder->base.crtc = NULL;
 		}
 
-		DRM_DEBUG_KMS("[ENCODER:%d:%s] hw state readout: %s, pipe %c\n",
-			      encoder->base.base.id, encoder->base.name,
-			      enableddisabled(encoder->base.crtc),
-			      pipe_name(pipe));
+		drm_dbg_kms(&dev_priv->drm,
+			    "[ENCODER:%d:%s] hw state readout: %s, pipe %c\n",
+			    encoder->base.base.id, encoder->base.name,
+			    enableddisabled(encoder->base.crtc),
+			    pipe_name(pipe));
 	}
 
 	drm_connector_list_iter_begin(dev, &conn_iter);
@@ -18197,9 +18242,10 @@ static void intel_modeset_readout_hw_state(struct drm_device *dev)
 			connector->base.dpms = DRM_MODE_DPMS_OFF;
 			connector->base.encoder = NULL;
 		}
-		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] hw state readout: %s\n",
-			      connector->base.base.id, connector->base.name,
-			      enableddisabled(connector->base.encoder));
+		drm_dbg_kms(&dev_priv->drm,
+			    "[CONNECTOR:%d:%s] hw state readout: %s\n",
+			    connector->base.base.id, connector->base.name,
+			    enableddisabled(connector->base.encoder));
 	}
 	drm_connector_list_iter_end(&conn_iter);
 
@@ -18263,9 +18309,10 @@ static void intel_modeset_readout_hw_state(struct drm_device *dev)
 					crtc_state->min_cdclk[plane->id] =
 						crtc_state->pixel_rate;
 			}
-			DRM_DEBUG_KMS("[PLANE:%d:%s] min_cdclk %d kHz\n",
-				      plane->base.base.id, plane->base.name,
-				      crtc_state->min_cdclk[plane->id]);
+			drm_dbg_kms(&dev_priv->drm,
+				    "[PLANE:%d:%s] min_cdclk %d kHz\n",
+				    plane->base.base.id, plane->base.name,
+				    crtc_state->min_cdclk[plane->id]);
 		}
 
 		if (crtc_state->hw.active) {
@@ -18336,8 +18383,9 @@ static void ibx_sanitize_pch_hdmi_port(struct drm_i915_private *dev_priv,
 	    (val & SDVO_PIPE_SEL_MASK) == SDVO_PIPE_SEL(PIPE_A))
 		return;
 
-	DRM_DEBUG_KMS("Sanitizing transcoder select for HDMI %c\n",
-		      port_name(port));
+	drm_dbg_kms(&dev_priv->drm,
+		    "Sanitizing transcoder select for HDMI %c\n",
+		    port_name(port));
 
 	val &= ~SDVO_PIPE_SEL_MASK;
 	val |= SDVO_PIPE_SEL(PIPE_A);
@@ -18354,8 +18402,9 @@ static void ibx_sanitize_pch_dp_port(struct drm_i915_private *dev_priv,
 	    (val & DP_PIPE_SEL_MASK) == DP_PIPE_SEL(PIPE_A))
 		return;
 
-	DRM_DEBUG_KMS("Sanitizing transcoder select for DP %c\n",
-		      port_name(port));
+	drm_dbg_kms(&dev_priv->drm,
+		    "Sanitizing transcoder select for DP %c\n",
+		    port_name(port));
 
 	val &= ~DP_PIPE_SEL_MASK;
 	val |= DP_PIPE_SEL(PIPE_A);
@@ -18456,8 +18505,9 @@ intel_modeset_setup_hw_state(struct drm_device *dev,
 		if (!pll->on || pll->active_mask)
 			continue;
 
-		DRM_DEBUG_KMS("%s enabled but not in use, disabling\n",
-			      pll->info->name);
+		drm_dbg_kms(&dev_priv->drm,
+			    "%s enabled but not in use, disabling\n",
+			    pll->info->name);
 
 		pll->info->funcs->disable(dev_priv, pll);
 		pll->on = false;
@@ -18517,7 +18567,8 @@ void intel_display_resume(struct drm_device *dev)
 	drm_modeset_acquire_fini(&ctx);
 
 	if (ret)
-		DRM_ERROR("Restoring old state failed with %i\n", ret);
+		drm_err(&dev_priv->drm,
+			"Restoring old state failed with %i\n", ret);
 	if (state)
 		drm_atomic_state_put(state);
 }
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
