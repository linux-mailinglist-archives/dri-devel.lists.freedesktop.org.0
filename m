Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 480EC13BAD5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 09:28:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDA66E878;
	Wed, 15 Jan 2020 08:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C6F6E329;
 Tue, 14 Jan 2020 09:52:04 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p17so12937628wmb.0;
 Tue, 14 Jan 2020 01:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7jI0qSvbXRKZ2g5DG4N6uAQ5g0kpg2D2/s1ZbhUohYg=;
 b=m4weLjDa9WDMMt9WNw86x4lNB3fTOqFc1zeuM0Y2zFEkeaYvi5KENg7DDh0SPwSes1
 INl8oENPevI5K/5Oj8e3v1+FDxwr+7AP+WkMlwr+hCazkPkSHCRArXwj25+ct3WZFfBp
 afBrDbJrwED+lncW9CRn7A8fjlMb5VmBSYYxbR3WK65IH6KUxrtpz1e+rYvC0ItgG3gq
 I8Ts3/5OcOmVNBxJvXb9dCVYZQpdztCIOYcpVGkkro0OL6c9Z3zVsBPRUu+ZyANEyEAm
 mTDR1ecaet3lYNeEnS2b7iEUQoY+etd9mGaH4+Ei06xw7F4vbcteT7TK+FIwLCTwVzgZ
 /yNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7jI0qSvbXRKZ2g5DG4N6uAQ5g0kpg2D2/s1ZbhUohYg=;
 b=Y75sNxeLIxVp88P44UB/iUpAO0NvRYDKdt6IP1+qFHWQF6TXktrA/U6anUg5Jxsx7V
 HwVp9rVToGjfTheg6R3jQkt39a4kNIxQVnGx2FhEjFUAfvTZiiQ7//cqCU6r8iVFf1Od
 iYOAnsz2yrdCbx5IbEiAH2gGDW58ktjc8lWnsTlgdY44I7hW9K072y+2smd5dmdo5Auy
 QAjJj16XN3Yz/LqBArytGl+EPIUiuwC/Lh3rRV9S4WFRAoXuoQ3QvqYhiaKOxTHxHwlC
 3Ui23YeMsossbzki80URS90Xfj7qYQ6vWX0ikMFxNTiTBFJjVjTsvhBlMqdMcE6g91t9
 lUZg==
X-Gm-Message-State: APjAAAXwm5ArNrK7OoP0QXLaerXTAIf8x6fsjFJSKjJuq1R7Ns1JaCrE
 g/sH0I9Bj4j24zG14Rf0U6nd1x9MvoA=
X-Google-Smtp-Source: APXvYqz1b8fCJ9840iBW2hXzbE3hVQ3+Kk96Zhg4e8WS+G2Cuq+M4kMa6ZioytZ6dQ65zTcMOw5pEA==
X-Received: by 2002:a1c:6a12:: with SMTP id f18mr58132wmc.29.1578995522954;
 Tue, 14 Jan 2020 01:52:02 -0800 (PST)
Received: from localhost.localdomain ([154.70.37.104])
 by smtp.googlemail.com with ESMTPSA id y20sm17454881wmi.25.2020.01.14.01.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 01:52:02 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 3/5] drm/i915/bios: convert to new drm logging macros.
Date: Tue, 14 Jan 2020 12:51:05 +0300
Message-Id: <20200114095107.21197-4-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200114095107.21197-1-wambui.karugax@gmail.com>
References: <20200114095107.21197-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 Jan 2020 08:27:50 +0000
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

This replaces the printk based logging macros with the struct drm_device
based logging macros.
This conversion was achieved using the following coccinelle script that
transforms based on the existence of a struct drm_i915_private device:
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
)
...+>
}

Formatting warnings by checkpatch are addressed manually.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 357 +++++++++++++---------
 1 file changed, 211 insertions(+), 146 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 8beac06e3f10..0bfc59639db8 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -230,15 +230,18 @@ parse_panel_options(struct drm_i915_private *dev_priv,
 	if (ret >= 0) {
 		WARN_ON(ret > 0xf);
 		panel_type = ret;
-		DRM_DEBUG_KMS("Panel type: %d (OpRegion)\n", panel_type);
+		drm_dbg_kms(&dev_priv->drm, "Panel type: %d (OpRegion)\n",
+			    panel_type);
 	} else {
 		if (lvds_options->panel_type > 0xf) {
-			DRM_DEBUG_KMS("Invalid VBT panel type 0x%x\n",
-				      lvds_options->panel_type);
+			drm_dbg_kms(&dev_priv->drm,
+				    "Invalid VBT panel type 0x%x\n",
+				    lvds_options->panel_type);
 			return;
 		}
 		panel_type = lvds_options->panel_type;
-		DRM_DEBUG_KMS("Panel type: %d (VBT)\n", panel_type);
+		drm_dbg_kms(&dev_priv->drm, "Panel type: %d (VBT)\n",
+			    panel_type);
 	}
 
 	dev_priv->vbt.panel_type = panel_type;
@@ -253,15 +256,17 @@ parse_panel_options(struct drm_i915_private *dev_priv,
 	switch (drrs_mode) {
 	case 0:
 		dev_priv->vbt.drrs_type = STATIC_DRRS_SUPPORT;
-		DRM_DEBUG_KMS("DRRS supported mode is static\n");
+		drm_dbg_kms(&dev_priv->drm, "DRRS supported mode is static\n");
 		break;
 	case 2:
 		dev_priv->vbt.drrs_type = SEAMLESS_DRRS_SUPPORT;
-		DRM_DEBUG_KMS("DRRS supported mode is seamless\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "DRRS supported mode is seamless\n");
 		break;
 	default:
 		dev_priv->vbt.drrs_type = DRRS_NOT_SUPPORTED;
-		DRM_DEBUG_KMS("DRRS not supported (VBT input)\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "DRRS not supported (VBT input)\n");
 		break;
 	}
 }
@@ -298,7 +303,8 @@ parse_lfp_panel_dtd(struct drm_i915_private *dev_priv,
 
 	dev_priv->vbt.lfp_lvds_vbt_mode = panel_fixed_mode;
 
-	DRM_DEBUG_KMS("Found panel mode in BIOS VBT legacy lfp table:\n");
+	drm_dbg_kms(&dev_priv->drm,
+		    "Found panel mode in BIOS VBT legacy lfp table:\n");
 	drm_mode_debug_printmodeline(panel_fixed_mode);
 
 	fp_timing = get_lvds_fp_timing(bdb, lvds_lfp_data,
@@ -309,8 +315,9 @@ parse_lfp_panel_dtd(struct drm_i915_private *dev_priv,
 		if (fp_timing->x_res == panel_fixed_mode->hdisplay &&
 		    fp_timing->y_res == panel_fixed_mode->vdisplay) {
 			dev_priv->vbt.bios_lvds_val = fp_timing->lvds_reg_val;
-			DRM_DEBUG_KMS("VBT initial LVDS value %x\n",
-				      dev_priv->vbt.bios_lvds_val);
+			drm_dbg_kms(&dev_priv->drm,
+				    "VBT initial LVDS value %x\n",
+				    dev_priv->vbt.bios_lvds_val);
 		}
 	}
 }
@@ -329,20 +336,22 @@ parse_generic_dtd(struct drm_i915_private *dev_priv,
 		return;
 
 	if (generic_dtd->gdtd_size < sizeof(struct generic_dtd_entry)) {
-		DRM_ERROR("GDTD size %u is too small.\n",
-			  generic_dtd->gdtd_size);
+		drm_err(&dev_priv->drm, "GDTD size %u is too small.\n",
+			generic_dtd->gdtd_size);
 		return;
 	} else if (generic_dtd->gdtd_size !=
 		   sizeof(struct generic_dtd_entry)) {
-		DRM_ERROR("Unexpected GDTD size %u\n", generic_dtd->gdtd_size);
+		drm_err(&dev_priv->drm, "Unexpected GDTD size %u\n",
+			generic_dtd->gdtd_size);
 		/* DTD has unknown fields, but keep going */
 	}
 
 	num_dtd = (get_blocksize(generic_dtd) -
 		   sizeof(struct bdb_generic_dtd)) / generic_dtd->gdtd_size;
 	if (dev_priv->vbt.panel_type >= num_dtd) {
-		DRM_ERROR("Panel type %d not found in table of %d DTD's\n",
-			  dev_priv->vbt.panel_type, num_dtd);
+		drm_err(&dev_priv->drm,
+			"Panel type %d not found in table of %d DTD's\n",
+			dev_priv->vbt.panel_type, num_dtd);
 		return;
 	}
 
@@ -383,7 +392,8 @@ parse_generic_dtd(struct drm_i915_private *dev_priv,
 	else
 		panel_fixed_mode->flags |= DRM_MODE_FLAG_NVSYNC;
 
-	DRM_DEBUG_KMS("Found panel mode in BIOS VBT generic dtd table:\n");
+	drm_dbg_kms(&dev_priv->drm,
+		    "Found panel mode in BIOS VBT generic dtd table:\n");
 	drm_mode_debug_printmodeline(panel_fixed_mode);
 
 	dev_priv->vbt.lfp_lvds_vbt_mode = panel_fixed_mode;
@@ -420,8 +430,9 @@ parse_lfp_backlight(struct drm_i915_private *dev_priv,
 		return;
 
 	if (backlight_data->entry_size != sizeof(backlight_data->data[0])) {
-		DRM_DEBUG_KMS("Unsupported backlight data entry size %u\n",
-			      backlight_data->entry_size);
+		drm_dbg_kms(&dev_priv->drm,
+			    "Unsupported backlight data entry size %u\n",
+			    backlight_data->entry_size);
 		return;
 	}
 
@@ -429,8 +440,9 @@ parse_lfp_backlight(struct drm_i915_private *dev_priv,
 
 	dev_priv->vbt.backlight.present = entry->type == BDB_BACKLIGHT_TYPE_PWM;
 	if (!dev_priv->vbt.backlight.present) {
-		DRM_DEBUG_KMS("PWM backlight not present in VBT (type %u)\n",
-			      entry->type);
+		drm_dbg_kms(&dev_priv->drm,
+			    "PWM backlight not present in VBT (type %u)\n",
+			    entry->type);
 		return;
 	}
 
@@ -447,13 +459,14 @@ parse_lfp_backlight(struct drm_i915_private *dev_priv,
 	dev_priv->vbt.backlight.pwm_freq_hz = entry->pwm_freq_hz;
 	dev_priv->vbt.backlight.active_low_pwm = entry->active_low_pwm;
 	dev_priv->vbt.backlight.min_brightness = entry->min_brightness;
-	DRM_DEBUG_KMS("VBT backlight PWM modulation frequency %u Hz, "
-		      "active %s, min brightness %u, level %u, controller %u\n",
-		      dev_priv->vbt.backlight.pwm_freq_hz,
-		      dev_priv->vbt.backlight.active_low_pwm ? "low" : "high",
-		      dev_priv->vbt.backlight.min_brightness,
-		      backlight_data->level[panel_type],
-		      dev_priv->vbt.backlight.controller);
+	drm_dbg_kms(&dev_priv->drm,
+		    "VBT backlight PWM modulation frequency %u Hz, "
+		    "active %s, min brightness %u, level %u, controller %u\n",
+		    dev_priv->vbt.backlight.pwm_freq_hz,
+		    dev_priv->vbt.backlight.active_low_pwm ? "low" : "high",
+		    dev_priv->vbt.backlight.min_brightness,
+		    backlight_data->level[panel_type],
+		    dev_priv->vbt.backlight.controller);
 }
 
 /* Try to find sdvo panel data */
@@ -467,7 +480,8 @@ parse_sdvo_panel_data(struct drm_i915_private *dev_priv,
 
 	index = i915_modparams.vbt_sdvo_panel_type;
 	if (index == -2) {
-		DRM_DEBUG_KMS("Ignore SDVO panel mode from BIOS VBT tables.\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "Ignore SDVO panel mode from BIOS VBT tables.\n");
 		return;
 	}
 
@@ -493,7 +507,8 @@ parse_sdvo_panel_data(struct drm_i915_private *dev_priv,
 
 	dev_priv->vbt.sdvo_lvds_vbt_mode = panel_fixed_mode;
 
-	DRM_DEBUG_KMS("Found SDVO panel mode in BIOS VBT tables:\n");
+	drm_dbg_kms(&dev_priv->drm,
+		    "Found SDVO panel mode in BIOS VBT tables:\n");
 	drm_mode_debug_printmodeline(panel_fixed_mode);
 }
 
@@ -538,13 +553,14 @@ parse_general_features(struct drm_i915_private *dev_priv,
 	} else {
 		dev_priv->vbt.orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
 	}
-	DRM_DEBUG_KMS("BDB_GENERAL_FEATURES int_tv_support %d int_crt_support %d lvds_use_ssc %d lvds_ssc_freq %d display_clock_mode %d fdi_rx_polarity_inverted %d\n",
-		      dev_priv->vbt.int_tv_support,
-		      dev_priv->vbt.int_crt_support,
-		      dev_priv->vbt.lvds_use_ssc,
-		      dev_priv->vbt.lvds_ssc_freq,
-		      dev_priv->vbt.display_clock_mode,
-		      dev_priv->vbt.fdi_rx_polarity_inverted);
+	drm_dbg_kms(&dev_priv->drm,
+		    "BDB_GENERAL_FEATURES int_tv_support %d int_crt_support %d lvds_use_ssc %d lvds_ssc_freq %d display_clock_mode %d fdi_rx_polarity_inverted %d\n",
+		    dev_priv->vbt.int_tv_support,
+		    dev_priv->vbt.int_crt_support,
+		    dev_priv->vbt.lvds_use_ssc,
+		    dev_priv->vbt.lvds_ssc_freq,
+		    dev_priv->vbt.display_clock_mode,
+		    dev_priv->vbt.fdi_rx_polarity_inverted);
 }
 
 static const struct child_device_config *
@@ -566,7 +582,7 @@ parse_sdvo_device_mapping(struct drm_i915_private *dev_priv, u8 bdb_version)
 	 * accurate and doesn't have to be, as long as it's not too strict.
 	 */
 	if (!IS_GEN_RANGE(dev_priv, 3, 7)) {
-		DRM_DEBUG_KMS("Skipping SDVO device mapping\n");
+		drm_dbg_kms(&dev_priv->drm, "Skipping SDVO device mapping\n");
 		return;
 	}
 
@@ -584,14 +600,16 @@ parse_sdvo_device_mapping(struct drm_i915_private *dev_priv, u8 bdb_version)
 		if (child->dvo_port != DEVICE_PORT_DVOB &&
 		    child->dvo_port != DEVICE_PORT_DVOC) {
 			/* skip the incorrect SDVO port */
-			DRM_DEBUG_KMS("Incorrect SDVO port. Skip it\n");
+			drm_dbg_kms(&dev_priv->drm,
+				    "Incorrect SDVO port. Skip it\n");
 			continue;
 		}
-		DRM_DEBUG_KMS("the SDVO device with slave addr %2x is found on"
-			      " %s port\n",
-			      child->slave_addr,
-			      (child->dvo_port == DEVICE_PORT_DVOB) ?
-			      "SDVOB" : "SDVOC");
+		drm_dbg_kms(&dev_priv->drm,
+			    "the SDVO device with slave addr %2x is found on"
+			    " %s port\n",
+			    child->slave_addr,
+			    (child->dvo_port == DEVICE_PORT_DVOB) ?
+			    "SDVOB" : "SDVOC");
 		mapping = &dev_priv->vbt.sdvo_mappings[child->dvo_port - 1];
 		if (!mapping->initialized) {
 			mapping->dvo_port = child->dvo_port;
@@ -600,28 +618,30 @@ parse_sdvo_device_mapping(struct drm_i915_private *dev_priv, u8 bdb_version)
 			mapping->ddc_pin = child->ddc_pin;
 			mapping->i2c_pin = child->i2c_pin;
 			mapping->initialized = 1;
-			DRM_DEBUG_KMS("SDVO device: dvo=%x, addr=%x, wiring=%d, ddc_pin=%d, i2c_pin=%d\n",
-				      mapping->dvo_port,
-				      mapping->slave_addr,
-				      mapping->dvo_wiring,
-				      mapping->ddc_pin,
-				      mapping->i2c_pin);
+			drm_dbg_kms(&dev_priv->drm,
+				    "SDVO device: dvo=%x, addr=%x, wiring=%d, ddc_pin=%d, i2c_pin=%d\n",
+				    mapping->dvo_port, mapping->slave_addr,
+				    mapping->dvo_wiring, mapping->ddc_pin,
+				    mapping->i2c_pin);
 		} else {
-			DRM_DEBUG_KMS("Maybe one SDVO port is shared by "
-					 "two SDVO device.\n");
+			drm_dbg_kms(&dev_priv->drm,
+				    "Maybe one SDVO port is shared by "
+				    "two SDVO device.\n");
 		}
 		if (child->slave2_addr) {
 			/* Maybe this is a SDVO device with multiple inputs */
 			/* And the mapping info is not added */
-			DRM_DEBUG_KMS("there exists the slave2_addr. Maybe this"
-				" is a SDVO device with multiple inputs.\n");
+			drm_dbg_kms(&dev_priv->drm,
+				    "there exists the slave2_addr. Maybe this"
+				    " is a SDVO device with multiple inputs.\n");
 		}
 		count++;
 	}
 
 	if (!count) {
 		/* No SDVO device info is found */
-		DRM_DEBUG_KMS("No SDVO device info is found in VBT\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "No SDVO device info is found in VBT\n");
 	}
 }
 
@@ -662,7 +682,8 @@ parse_driver_features(struct drm_i915_private *dev_priv,
 	}
 
 	if (bdb->version < 228) {
-		DRM_DEBUG_KMS("DRRS State Enabled:%d\n", driver->drrs_enabled);
+		drm_dbg_kms(&dev_priv->drm, "DRRS State Enabled:%d\n",
+			    driver->drrs_enabled);
 		/*
 		 * If DRRS is not supported, drrs_type has to be set to 0.
 		 * This is because, VBT is configured in such a way that
@@ -740,8 +761,9 @@ parse_edp(struct drm_i915_private *dev_priv, const struct bdb_header *bdb)
 		dev_priv->vbt.edp.rate = DP_LINK_BW_2_7;
 		break;
 	default:
-		DRM_DEBUG_KMS("VBT has unknown eDP link rate value %u\n",
-			      edp_link_params->rate);
+		drm_dbg_kms(&dev_priv->drm,
+			    "VBT has unknown eDP link rate value %u\n",
+			     edp_link_params->rate);
 		break;
 	}
 
@@ -756,8 +778,9 @@ parse_edp(struct drm_i915_private *dev_priv, const struct bdb_header *bdb)
 		dev_priv->vbt.edp.lanes = 4;
 		break;
 	default:
-		DRM_DEBUG_KMS("VBT has unknown eDP lane count value %u\n",
-			      edp_link_params->lanes);
+		drm_dbg_kms(&dev_priv->drm,
+			    "VBT has unknown eDP lane count value %u\n",
+			    edp_link_params->lanes);
 		break;
 	}
 
@@ -775,8 +798,9 @@ parse_edp(struct drm_i915_private *dev_priv, const struct bdb_header *bdb)
 		dev_priv->vbt.edp.preemphasis = DP_TRAIN_PRE_EMPH_LEVEL_3;
 		break;
 	default:
-		DRM_DEBUG_KMS("VBT has unknown eDP pre-emphasis value %u\n",
-			      edp_link_params->preemphasis);
+		drm_dbg_kms(&dev_priv->drm,
+			    "VBT has unknown eDP pre-emphasis value %u\n",
+			    edp_link_params->preemphasis);
 		break;
 	}
 
@@ -794,8 +818,9 @@ parse_edp(struct drm_i915_private *dev_priv, const struct bdb_header *bdb)
 		dev_priv->vbt.edp.vswing = DP_TRAIN_VOLTAGE_SWING_LEVEL_3;
 		break;
 	default:
-		DRM_DEBUG_KMS("VBT has unknown eDP voltage swing value %u\n",
-			      edp_link_params->vswing);
+		drm_dbg_kms(&dev_priv->drm,
+			    "VBT has unknown eDP voltage swing value %u\n",
+			    edp_link_params->vswing);
 		break;
 	}
 
@@ -822,7 +847,7 @@ parse_psr(struct drm_i915_private *dev_priv, const struct bdb_header *bdb)
 
 	psr = find_section(bdb, BDB_PSR);
 	if (!psr) {
-		DRM_DEBUG_KMS("No PSR BDB found.\n");
+		drm_dbg_kms(&dev_priv->drm, "No PSR BDB found.\n");
 		return;
 	}
 
@@ -849,8 +874,9 @@ parse_psr(struct drm_i915_private *dev_priv, const struct bdb_header *bdb)
 		dev_priv->vbt.psr.lines_to_wait = PSR_8_LINES_TO_WAIT;
 		break;
 	default:
-		DRM_DEBUG_KMS("VBT has unknown PSR lines to wait %u\n",
-			      psr_table->lines_to_wait);
+		drm_dbg_kms(&dev_priv->drm,
+			    "VBT has unknown PSR lines to wait %u\n",
+			    psr_table->lines_to_wait);
 		break;
 	}
 
@@ -872,8 +898,9 @@ parse_psr(struct drm_i915_private *dev_priv, const struct bdb_header *bdb)
 			dev_priv->vbt.psr.tp1_wakeup_time_us = 0;
 			break;
 		default:
-			DRM_DEBUG_KMS("VBT tp1 wakeup time value %d is outside range[0-3], defaulting to max value 2500us\n",
-					psr_table->tp1_wakeup_time);
+			drm_dbg_kms(&dev_priv->drm,
+				    "VBT tp1 wakeup time value %d is outside range[0-3], defaulting to max value 2500us\n",
+				    psr_table->tp1_wakeup_time);
 			/* fallthrough */
 		case 2:
 			dev_priv->vbt.psr.tp1_wakeup_time_us = 2500;
@@ -891,8 +918,9 @@ parse_psr(struct drm_i915_private *dev_priv, const struct bdb_header *bdb)
 			dev_priv->vbt.psr.tp2_tp3_wakeup_time_us = 0;
 			break;
 		default:
-			DRM_DEBUG_KMS("VBT tp2_tp3 wakeup time value %d is outside range[0-3], defaulting to max value 2500us\n",
-					psr_table->tp2_tp3_wakeup_time);
+			drm_dbg_kms(&dev_priv->drm,
+				    "VBT tp2_tp3 wakeup time value %d is outside range[0-3], defaulting to max value 2500us\n",
+				    psr_table->tp2_tp3_wakeup_time);
 			/* fallthrough */
 		case 2:
 			dev_priv->vbt.psr.tp2_tp3_wakeup_time_us = 2500;
@@ -998,12 +1026,12 @@ parse_mipi_config(struct drm_i915_private *dev_priv,
 	 */
 	start = find_section(bdb, BDB_MIPI_CONFIG);
 	if (!start) {
-		DRM_DEBUG_KMS("No MIPI config BDB found");
+		drm_dbg_kms(&dev_priv->drm, "No MIPI config BDB found");
 		return;
 	}
 
-	DRM_DEBUG_DRIVER("Found MIPI Config block, panel index = %d\n",
-								panel_type);
+	drm_dbg(&dev_priv->drm, "Found MIPI Config block, panel index = %d\n",
+		panel_type);
 
 	/*
 	 * get hold of the correct configuration block and pps data as per
@@ -1271,7 +1299,8 @@ static void fixup_mipi_sequences(struct drm_i915_private *dev_priv)
 	if (!len)
 		return;
 
-	DRM_DEBUG_KMS("Using init OTP fragment to deassert reset\n");
+	drm_dbg_kms(&dev_priv->drm,
+		    "Using init OTP fragment to deassert reset\n");
 
 	/* Copy the fragment, update seq byte and terminate it */
 	init_otp = (u8 *)dev_priv->vbt.dsi.sequence[MIPI_SEQ_INIT_OTP];
@@ -1306,18 +1335,21 @@ parse_mipi_sequence(struct drm_i915_private *dev_priv,
 
 	sequence = find_section(bdb, BDB_MIPI_SEQUENCE);
 	if (!sequence) {
-		DRM_DEBUG_KMS("No MIPI Sequence found, parsing complete\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "No MIPI Sequence found, parsing complete\n");
 		return;
 	}
 
 	/* Fail gracefully for forward incompatible sequence block. */
 	if (sequence->version >= 4) {
-		DRM_ERROR("Unable to parse MIPI Sequence Block v%u\n",
-			  sequence->version);
+		drm_err(&dev_priv->drm,
+			"Unable to parse MIPI Sequence Block v%u\n",
+			sequence->version);
 		return;
 	}
 
-	DRM_DEBUG_DRIVER("Found MIPI sequence block v%u\n", sequence->version);
+	drm_dbg(&dev_priv->drm, "Found MIPI sequence block v%u\n",
+		sequence->version);
 
 	seq_data = find_panel_sequence_block(sequence, panel_type, &seq_size);
 	if (!seq_data)
@@ -1334,13 +1366,15 @@ parse_mipi_sequence(struct drm_i915_private *dev_priv,
 			break;
 
 		if (seq_id >= MIPI_SEQ_MAX) {
-			DRM_ERROR("Unknown sequence %u\n", seq_id);
+			drm_err(&dev_priv->drm, "Unknown sequence %u\n",
+				seq_id);
 			goto err;
 		}
 
 		/* Log about presence of sequences we won't run. */
 		if (seq_id == MIPI_SEQ_TEAR_ON || seq_id == MIPI_SEQ_TEAR_OFF)
-			DRM_DEBUG_KMS("Unsupported sequence %u\n", seq_id);
+			drm_dbg_kms(&dev_priv->drm,
+				    "Unsupported sequence %u\n", seq_id);
 
 		dev_priv->vbt.dsi.sequence[seq_id] = data + index;
 
@@ -1349,7 +1383,8 @@ parse_mipi_sequence(struct drm_i915_private *dev_priv,
 		else
 			index = goto_next_sequence(data, index, seq_size);
 		if (!index) {
-			DRM_ERROR("Invalid sequence %u\n", seq_id);
+			drm_err(&dev_priv->drm, "Invalid sequence %u\n",
+				seq_id);
 			goto err;
 		}
 	}
@@ -1360,7 +1395,7 @@ parse_mipi_sequence(struct drm_i915_private *dev_priv,
 
 	fixup_mipi_sequences(dev_priv);
 
-	DRM_DEBUG_DRIVER("MIPI related VBT parsing complete\n");
+	drm_dbg(&dev_priv->drm, "MIPI related VBT parsing complete\n");
 	return;
 
 err:
@@ -1385,13 +1420,15 @@ parse_compression_parameters(struct drm_i915_private *i915,
 	if (params) {
 		/* Sanity checks */
 		if (params->entry_size != sizeof(params->data[0])) {
-			DRM_DEBUG_KMS("VBT: unsupported compression param entry size\n");
+			drm_dbg_kms(&i915->drm,
+				    "VBT: unsupported compression param entry size\n");
 			return;
 		}
 
 		block_size = get_blocksize(params);
 		if (block_size < sizeof(*params)) {
-			DRM_DEBUG_KMS("VBT: expected 16 compression param entries\n");
+			drm_dbg_kms(&i915->drm,
+				    "VBT: expected 16 compression param entries\n");
 			return;
 		}
 	}
@@ -1403,12 +1440,14 @@ parse_compression_parameters(struct drm_i915_private *i915,
 			continue;
 
 		if (!params) {
-			DRM_DEBUG_KMS("VBT: compression params not available\n");
+			drm_dbg_kms(&i915->drm,
+				    "VBT: compression params not available\n");
 			continue;
 		}
 
 		if (child->compression_method_cps) {
-			DRM_DEBUG_KMS("VBT: CPS compression not supported\n");
+			drm_dbg_kms(&i915->drm,
+				    "VBT: CPS compression not supported\n");
 			continue;
 		}
 
@@ -1456,10 +1495,11 @@ static void sanitize_ddc_pin(struct drm_i915_private *dev_priv,
 
 	p = get_port_by_ddc_pin(dev_priv, info->alternate_ddc_pin);
 	if (p != PORT_NONE) {
-		DRM_DEBUG_KMS("port %c trying to use the same DDC pin (0x%x) as port %c, "
-			      "disabling port %c DVI/HDMI support\n",
-			      port_name(port), info->alternate_ddc_pin,
-			      port_name(p), port_name(p));
+		drm_dbg_kms(&dev_priv->drm,
+			    "port %c trying to use the same DDC pin (0x%x) as port %c, "
+			    "disabling port %c DVI/HDMI support\n",
+			    port_name(port), info->alternate_ddc_pin,
+			    port_name(p), port_name(p));
 
 		/*
 		 * If we have multiple ports supposedly sharing the
@@ -1507,10 +1547,11 @@ static void sanitize_aux_ch(struct drm_i915_private *dev_priv,
 
 	p = get_port_by_aux_ch(dev_priv, info->alternate_aux_channel);
 	if (p != PORT_NONE) {
-		DRM_DEBUG_KMS("port %c trying to use the same AUX CH (0x%x) as port %c, "
-			      "disabling port %c DP support\n",
-			      port_name(port), info->alternate_aux_channel,
-			      port_name(p), port_name(p));
+		drm_dbg_kms(&dev_priv->drm,
+			    "port %c trying to use the same AUX CH (0x%x) as port %c, "
+			    "disabling port %c DP support\n",
+			    port_name(port), info->alternate_aux_channel,
+			    port_name(p), port_name(p));
 
 		/*
 		 * If we have multiple ports supposedlt sharing the
@@ -1570,8 +1611,9 @@ static u8 map_ddc_pin(struct drm_i915_private *dev_priv, u8 vbt_pin)
 	if (vbt_pin < n_entries && ddc_pin_map[vbt_pin] != 0)
 		return ddc_pin_map[vbt_pin];
 
-	DRM_DEBUG_KMS("Ignoring alternate pin: VBT claims DDC pin %d, which is not valid for this platform\n",
-		      vbt_pin);
+	drm_dbg_kms(&dev_priv->drm,
+		    "Ignoring alternate pin: VBT claims DDC pin %d, which is not valid for this platform\n",
+		    vbt_pin);
 	return 0;
 }
 
@@ -1622,8 +1664,9 @@ static void parse_ddi_port(struct drm_i915_private *dev_priv,
 	info = &dev_priv->vbt.ddi_port_info[port];
 
 	if (info->child) {
-		DRM_DEBUG_KMS("More than one child device for port %c in VBT, using the first.\n",
-			      port_name(port));
+		drm_dbg_kms(&dev_priv->drm,
+			    "More than one child device for port %c in VBT, using the first.\n",
+			    port_name(port));
 		return;
 	}
 
@@ -1634,8 +1677,9 @@ static void parse_ddi_port(struct drm_i915_private *dev_priv,
 	is_edp = is_dp && (child->device_type & DEVICE_TYPE_INTERNAL_CONNECTOR);
 
 	if (port == PORT_A && is_dvi && INTEL_GEN(dev_priv) < 12) {
-		DRM_DEBUG_KMS("VBT claims port A supports DVI%s, ignoring\n",
-			      is_hdmi ? "/HDMI" : "");
+		drm_dbg_kms(&dev_priv->drm,
+			    "VBT claims port A supports DVI%s, ignoring\n",
+			    is_hdmi ? "/HDMI" : "");
 		is_dvi = false;
 		is_hdmi = false;
 	}
@@ -1651,11 +1695,12 @@ static void parse_ddi_port(struct drm_i915_private *dev_priv,
 	if (bdb_version >= 209)
 		info->supports_tbt = child->tbt;
 
-	DRM_DEBUG_KMS("Port %c VBT info: CRT:%d DVI:%d HDMI:%d DP:%d eDP:%d LSPCON:%d USB-Type-C:%d TBT:%d DSC:%d\n",
-		      port_name(port), is_crt, is_dvi, is_hdmi, is_dp, is_edp,
-		      HAS_LSPCON(dev_priv) && child->lspcon,
-		      info->supports_typec_usb, info->supports_tbt,
-		      devdata->dsc != NULL);
+	drm_dbg_kms(&dev_priv->drm,
+		    "Port %c VBT info: CRT:%d DVI:%d HDMI:%d DP:%d eDP:%d LSPCON:%d USB-Type-C:%d TBT:%d DSC:%d\n",
+		    port_name(port), is_crt, is_dvi, is_hdmi, is_dp, is_edp,
+		    HAS_LSPCON(dev_priv) && child->lspcon,
+		    info->supports_typec_usb, info->supports_tbt,
+		    devdata->dsc != NULL);
 
 	if (is_dvi) {
 		u8 ddc_pin;
@@ -1665,9 +1710,10 @@ static void parse_ddi_port(struct drm_i915_private *dev_priv,
 			info->alternate_ddc_pin = ddc_pin;
 			sanitize_ddc_pin(dev_priv, port);
 		} else {
-			DRM_DEBUG_KMS("Port %c has invalid DDC pin %d, "
-				      "sticking to defaults\n",
-				      port_name(port), ddc_pin);
+			drm_dbg_kms(&dev_priv->drm,
+				    "Port %c has invalid DDC pin %d, "
+				    "sticking to defaults\n",
+				    port_name(port), ddc_pin);
 		}
 	}
 
@@ -1680,9 +1726,10 @@ static void parse_ddi_port(struct drm_i915_private *dev_priv,
 	if (bdb_version >= 158) {
 		/* The VBT HDMI level shift values match the table we have. */
 		u8 hdmi_level_shift = child->hdmi_level_shifter_value;
-		DRM_DEBUG_KMS("VBT HDMI level shift for port %c: %d\n",
-			      port_name(port),
-			      hdmi_level_shift);
+		drm_dbg_kms(&dev_priv->drm,
+			    "VBT HDMI level shift for port %c: %d\n",
+			    port_name(port),
+			    hdmi_level_shift);
 		info->hdmi_level_shift = hdmi_level_shift;
 		info->hdmi_level_shift_set = true;
 	}
@@ -1706,19 +1753,22 @@ static void parse_ddi_port(struct drm_i915_private *dev_priv,
 		}
 
 		if (max_tmds_clock)
-			DRM_DEBUG_KMS("VBT HDMI max TMDS clock for port %c: %d kHz\n",
-				      port_name(port), max_tmds_clock);
+			drm_dbg_kms(&dev_priv->drm,
+				    "VBT HDMI max TMDS clock for port %c: %d kHz\n",
+				    port_name(port), max_tmds_clock);
 		info->max_tmds_clock = max_tmds_clock;
 	}
 
 	/* Parse the I_boost config for SKL and above */
 	if (bdb_version >= 196 && child->iboost) {
 		info->dp_boost_level = translate_iboost(child->dp_iboost_level);
-		DRM_DEBUG_KMS("VBT (e)DP boost level for port %c: %d\n",
-			      port_name(port), info->dp_boost_level);
+		drm_dbg_kms(&dev_priv->drm,
+			    "VBT (e)DP boost level for port %c: %d\n",
+			    port_name(port), info->dp_boost_level);
 		info->hdmi_boost_level = translate_iboost(child->hdmi_iboost_level);
-		DRM_DEBUG_KMS("VBT HDMI boost level for port %c: %d\n",
-			      port_name(port), info->hdmi_boost_level);
+		drm_dbg_kms(&dev_priv->drm,
+			    "VBT HDMI boost level for port %c: %d\n",
+			    port_name(port), info->hdmi_boost_level);
 	}
 
 	/* DP max link rate for CNL+ */
@@ -1738,8 +1788,9 @@ static void parse_ddi_port(struct drm_i915_private *dev_priv,
 			info->dp_max_link_rate = 162000;
 			break;
 		}
-		DRM_DEBUG_KMS("VBT DP max link rate for port %c: %d\n",
-			      port_name(port), info->dp_max_link_rate);
+		drm_dbg_kms(&dev_priv->drm,
+			    "VBT DP max link rate for port %c: %d\n",
+			    port_name(port), info->dp_max_link_rate);
 	}
 
 	info->child = child;
@@ -1773,19 +1824,21 @@ parse_general_definitions(struct drm_i915_private *dev_priv,
 
 	defs = find_section(bdb, BDB_GENERAL_DEFINITIONS);
 	if (!defs) {
-		DRM_DEBUG_KMS("No general definition block is found, no devices defined.\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "No general definition block is found, no devices defined.\n");
 		return;
 	}
 
 	block_size = get_blocksize(defs);
 	if (block_size < sizeof(*defs)) {
-		DRM_DEBUG_KMS("General definitions block too small (%u)\n",
-			      block_size);
+		drm_dbg_kms(&dev_priv->drm,
+			    "General definitions block too small (%u)\n",
+			    block_size);
 		return;
 	}
 
 	bus_pin = defs->crt_ddc_gmbus_pin;
-	DRM_DEBUG_KMS("crt_ddc_bus_pin: %d\n", bus_pin);
+	drm_dbg_kms(&dev_priv->drm, "crt_ddc_bus_pin: %d\n", bus_pin);
 	if (intel_gmbus_is_valid_pin(dev_priv, bus_pin))
 		dev_priv->vbt.crt_ddc_pin = bus_pin;
 
@@ -1804,19 +1857,22 @@ parse_general_definitions(struct drm_i915_private *dev_priv,
 	} else {
 		expected_size = sizeof(*child);
 		BUILD_BUG_ON(sizeof(*child) < 39);
-		DRM_DEBUG_DRIVER("Expected child device config size for VBT version %u not known; assuming %u\n",
-				 bdb->version, expected_size);
+		drm_dbg(&dev_priv->drm,
+			"Expected child device config size for VBT version %u not known; assuming %u\n",
+			bdb->version, expected_size);
 	}
 
 	/* Flag an error for unexpected size, but continue anyway. */
 	if (defs->child_dev_size != expected_size)
-		DRM_ERROR("Unexpected child device config size %u (expected %u for VBT version %u)\n",
-			  defs->child_dev_size, expected_size, bdb->version);
+		drm_err(&dev_priv->drm,
+			"Unexpected child device config size %u (expected %u for VBT version %u)\n",
+			defs->child_dev_size, expected_size, bdb->version);
 
 	/* The legacy sized child device config is the minimum we need. */
 	if (defs->child_dev_size < LEGACY_CHILD_DEVICE_CONFIG_SIZE) {
-		DRM_DEBUG_KMS("Child device config size %u is too small.\n",
-			      defs->child_dev_size);
+		drm_dbg_kms(&dev_priv->drm,
+			    "Child device config size %u is too small.\n",
+			    defs->child_dev_size);
 		return;
 	}
 
@@ -1828,8 +1884,9 @@ parse_general_definitions(struct drm_i915_private *dev_priv,
 		if (!child->device_type)
 			continue;
 
-		DRM_DEBUG_KMS("Found VBT child device with type 0x%x\n",
-			      child->device_type);
+		drm_dbg_kms(&dev_priv->drm,
+			    "Found VBT child device with type 0x%x\n",
+			    child->device_type);
 
 		devdata = kzalloc(sizeof(*devdata), GFP_KERNEL);
 		if (!devdata)
@@ -1847,7 +1904,8 @@ parse_general_definitions(struct drm_i915_private *dev_priv,
 	}
 
 	if (list_empty(&dev_priv->vbt.display_devices))
-		DRM_DEBUG_KMS("no child dev is parsed from VBT\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "no child dev is parsed from VBT\n");
 }
 
 /* Common defaults which may be overridden by VBT. */
@@ -1880,7 +1938,8 @@ init_vbt_defaults(struct drm_i915_private *dev_priv)
 	 */
 	dev_priv->vbt.lvds_ssc_freq = intel_bios_ssc_frequency(dev_priv,
 			!HAS_PCH_SPLIT(dev_priv));
-	DRM_DEBUG_KMS("Set default to SSC at %d kHz\n", dev_priv->vbt.lvds_ssc_freq);
+	drm_dbg_kms(&dev_priv->drm, "Set default to SSC at %d kHz\n",
+		    dev_priv->vbt.lvds_ssc_freq);
 }
 
 /* Defaults to initialize only if there is no VBT. */
@@ -1990,13 +2049,14 @@ static struct vbt_header *oprom_get_vbt(struct drm_i915_private *dev_priv)
 		goto err_unmap_oprom;
 
 	if (sizeof(struct vbt_header) > size) {
-		DRM_DEBUG_DRIVER("VBT header incomplete\n");
+		drm_dbg(&dev_priv->drm, "VBT header incomplete\n");
 		goto err_unmap_oprom;
 	}
 
 	vbt_size = ioread16(p + offsetof(struct vbt_header, vbt_size));
 	if (vbt_size > size) {
-		DRM_DEBUG_DRIVER("VBT incomplete (vbt_size overflows)\n");
+		drm_dbg(&dev_priv->drm,
+			"VBT incomplete (vbt_size overflows)\n");
 		goto err_unmap_oprom;
 	}
 
@@ -2039,7 +2099,8 @@ void intel_bios_init(struct drm_i915_private *dev_priv)
 	INIT_LIST_HEAD(&dev_priv->vbt.display_devices);
 
 	if (!HAS_DISPLAY(dev_priv) || !INTEL_DISPLAY_ENABLED(dev_priv)) {
-		DRM_DEBUG_KMS("Skipping VBT init due to disabled display.\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "Skipping VBT init due to disabled display.\n");
 		return;
 	}
 
@@ -2053,13 +2114,14 @@ void intel_bios_init(struct drm_i915_private *dev_priv)
 
 		vbt = oprom_vbt;
 
-		DRM_DEBUG_KMS("Found valid VBT in PCI ROM\n");
+		drm_dbg_kms(&dev_priv->drm, "Found valid VBT in PCI ROM\n");
 	}
 
 	bdb = get_bdb_header(vbt);
 
-	DRM_DEBUG_KMS("VBT signature \"%.*s\", BDB version %d\n",
-		      (int)sizeof(vbt->signature), vbt->signature, bdb->version);
+	drm_dbg_kms(&dev_priv->drm,
+		    "VBT signature \"%.*s\", BDB version %d\n",
+		    (int)sizeof(vbt->signature), vbt->signature, bdb->version);
 
 	/* Grab useful general definitions */
 	parse_general_features(dev_priv, bdb);
@@ -2084,7 +2146,8 @@ void intel_bios_init(struct drm_i915_private *dev_priv)
 
 out:
 	if (!vbt) {
-		DRM_INFO("Failed to find VBIOS tables (VBT)\n");
+		drm_info(&dev_priv->drm,
+			 "Failed to find VBIOS tables (VBT)\n");
 		init_vbt_missing_defaults(dev_priv);
 	}
 
@@ -2371,8 +2434,9 @@ bool intel_bios_is_dsi_present(struct drm_i915_private *dev_priv,
 		} else if (dvo_port == DVO_PORT_MIPIB ||
 			   dvo_port == DVO_PORT_MIPIC ||
 			   dvo_port == DVO_PORT_MIPID) {
-			DRM_DEBUG_KMS("VBT has unsupported DSI port %c\n",
-				      port_name(dvo_port - DVO_PORT_MIPIA));
+			drm_dbg_kms(&dev_priv->drm,
+				    "VBT has unsupported DSI port %c\n",
+				    port_name(dvo_port - DVO_PORT_MIPIA));
 		}
 	}
 
@@ -2524,8 +2588,9 @@ enum aux_ch intel_bios_port_aux_ch(struct drm_i915_private *dev_priv,
 	if (!info->alternate_aux_channel) {
 		aux_ch = (enum aux_ch)port;
 
-		DRM_DEBUG_KMS("using AUX %c for port %c (platform default)\n",
-			      aux_ch_name(aux_ch), port_name(port));
+		drm_dbg_kms(&dev_priv->drm,
+			    "using AUX %c for port %c (platform default)\n",
+			    aux_ch_name(aux_ch), port_name(port));
 		return aux_ch;
 	}
 
@@ -2557,8 +2622,8 @@ enum aux_ch intel_bios_port_aux_ch(struct drm_i915_private *dev_priv,
 		break;
 	}
 
-	DRM_DEBUG_KMS("using AUX %c for port %c (VBT)\n",
-		      aux_ch_name(aux_ch), port_name(port));
+	drm_dbg_kms(&dev_priv->drm, "using AUX %c for port %c (VBT)\n",
+		    aux_ch_name(aux_ch), port_name(port));
 
 	return aux_ch;
 }
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
