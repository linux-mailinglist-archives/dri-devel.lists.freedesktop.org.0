Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECB714E95B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 09:04:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196136FAA0;
	Fri, 31 Jan 2020 08:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95BD6F91D;
 Thu, 30 Jan 2020 08:33:19 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id w15so2939950wru.4;
 Thu, 30 Jan 2020 00:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dHODT5F3MVXDIl9ni3de8cAXpEfjT06B9onUe8P5bB8=;
 b=j2pC9br02rq19XGwrG/x2cKlCe6xTN1nqpHCFAWm28TBYfareSDhs2ENq8vg3zgYmK
 LfPNZ8+pnRZ5GL2iB1UNCjsldxKBq/43BuYKr4wIzx55uaoDM0lm4knD4TpN2g1Ykip9
 0e4Yep8g1bsRNSnMPaXYOcso1qSBGjxx0v+I40o0dloI7VY8eTY+Mx7nvWurIqsbr+HO
 Gj/5QQuOw4NIXBjTKh8rKWe/zs9Aaqe8NcdSOeOcSqLLZREJpQyAUvzaX5n3dj2c16N9
 lr6cQZNR+YkIdgT+PRikTF/SFUBs6gjQ0TnWkAx/MBE/Gl+Y1rzZTGBSWeVvndHWJYfE
 7q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dHODT5F3MVXDIl9ni3de8cAXpEfjT06B9onUe8P5bB8=;
 b=VXCzQUfl9GKDQHrHVuIkRkWWNtrlgPmWVXSfS5627/4NqiXMRnE/2B+ht2vHnqQq9X
 mUmHtSnLZjxBmiG3/Oy1DIGWtkDaj738ULqA1Y46gNg3fXM+sa/gLdpR+C1+sAC8g6Kd
 skPXN1K9GfdAwQXjAKt2B61rrz3bjGuA7p5RLN+XLZuc9qLmqu7ehbzvEnDHQbEEwEXI
 DDSWlFeuOJ1+GvpgYkMR7HWQkExHkAOrIjEy9gGSHU0/+FfY6fPR3sxJ10kmTzsVzmHo
 nxq3tviuH29b75G/bYVaDnWRBosc53GV9AOPzh7vaa6tvt9SCzpuI98dTMOqNHT43dja
 96Pw==
X-Gm-Message-State: APjAAAVnnZLByKkbrrgV08qLKQpXbaDConPZo1hpAYundVLVLXqCIUki
 tF/gfPEVtM4P947ifszIs2M=
X-Google-Smtp-Source: APXvYqwAqywSufXXHXz/zHpiS3kRm1cX4GXxvibdvK8frwOKsIm3oHHxNNcyN662HZzfrEsidm5ksA==
X-Received: by 2002:adf:a453:: with SMTP id e19mr3658095wra.305.1580373198047; 
 Thu, 30 Jan 2020 00:33:18 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id i11sm6363678wrs.10.2020.01.30.00.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 00:33:17 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 12/12] drm/i915/panel: automatic conversion to drm_device
 based logging macros.
Date: Thu, 30 Jan 2020 11:32:29 +0300
Message-Id: <20200130083229.12889-13-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200130083229.12889-1-wambui.karugax@gmail.com>
References: <20200130083229.12889-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 31 Jan 2020 08:04:00 +0000
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

Converts various instances of the printk based drm logging macros to the
struct drm_device based logging macros in i915/display/intel_panel.c
using the following coccinelle script that transforms based on the
existence of a struct drm_i915_private device pointer:
@@
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

@@
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

Checkpatch warnings were addressed manually.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_panel.c | 100 ++++++++++++---------
 1 file changed, 59 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index c03afcef85ae..1acefaf5ed1e 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -96,8 +96,9 @@ intel_panel_edid_downclock_mode(struct intel_connector *connector,
 	if (!downclock_mode)
 		return NULL;
 
-	DRM_DEBUG_KMS("[CONNECTOR:%d:%s] using downclock mode from EDID: ",
-		      connector->base.base.id, connector->base.name);
+	drm_dbg_kms(&dev_priv->drm,
+		    "[CONNECTOR:%d:%s] using downclock mode from EDID: ",
+		    connector->base.base.id, connector->base.name);
 	drm_mode_debug_printmodeline(downclock_mode);
 
 	return downclock_mode;
@@ -122,8 +123,9 @@ intel_panel_edid_fixed_mode(struct intel_connector *connector)
 		if (!fixed_mode)
 			return NULL;
 
-		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] using preferred mode from EDID: ",
-			      connector->base.base.id, connector->base.name);
+		drm_dbg_kms(&dev_priv->drm,
+			    "[CONNECTOR:%d:%s] using preferred mode from EDID: ",
+			    connector->base.base.id, connector->base.name);
 		drm_mode_debug_printmodeline(fixed_mode);
 
 		return fixed_mode;
@@ -138,8 +140,9 @@ intel_panel_edid_fixed_mode(struct intel_connector *connector)
 
 	fixed_mode->type |= DRM_MODE_TYPE_PREFERRED;
 
-	DRM_DEBUG_KMS("[CONNECTOR:%d:%s] using first mode from EDID: ",
-		      connector->base.base.id, connector->base.name);
+	drm_dbg_kms(&dev_priv->drm,
+		    "[CONNECTOR:%d:%s] using first mode from EDID: ",
+		    connector->base.base.id, connector->base.name);
 	drm_mode_debug_printmodeline(fixed_mode);
 
 	return fixed_mode;
@@ -162,8 +165,8 @@ intel_panel_vbt_fixed_mode(struct intel_connector *connector)
 
 	fixed_mode->type |= DRM_MODE_TYPE_PREFERRED;
 
-	DRM_DEBUG_KMS("[CONNECTOR:%d:%s] using mode from VBT: ",
-		      connector->base.base.id, connector->base.name);
+	drm_dbg_kms(&dev_priv->drm, "[CONNECTOR:%d:%s] using mode from VBT: ",
+		    connector->base.base.id, connector->base.name);
 	drm_mode_debug_printmodeline(fixed_mode);
 
 	info->width_mm = fixed_mode->width_mm;
@@ -746,7 +749,8 @@ static void lpt_disable_backlight(const struct drm_connector_state *old_conn_sta
 	 */
 	tmp = intel_de_read(dev_priv, BLC_PWM_CPU_CTL2);
 	if (tmp & BLM_PWM_ENABLE) {
-		DRM_DEBUG_KMS("cpu backlight was enabled, disabling\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "cpu backlight was enabled, disabling\n");
 		intel_de_write(dev_priv, BLC_PWM_CPU_CTL2,
 			       tmp & ~BLM_PWM_ENABLE);
 	}
@@ -863,7 +867,8 @@ void intel_panel_disable_backlight(const struct drm_connector_state *old_conn_st
 	 * another client is not activated.
 	 */
 	if (dev_priv->drm.switch_power_state == DRM_SWITCH_POWER_CHANGING) {
-		DRM_DEBUG_DRIVER("Skipping backlight disable on vga switch\n");
+		drm_dbg(&dev_priv->drm,
+			"Skipping backlight disable on vga switch\n");
 		return;
 	}
 
@@ -887,7 +892,7 @@ static void lpt_enable_backlight(const struct intel_crtc_state *crtc_state,
 
 	pch_ctl1 = intel_de_read(dev_priv, BLC_PWM_PCH_CTL1);
 	if (pch_ctl1 & BLM_PCH_PWM_ENABLE) {
-		DRM_DEBUG_KMS("pch backlight already enabled\n");
+		drm_dbg_kms(&dev_priv->drm, "pch backlight already enabled\n");
 		pch_ctl1 &= ~BLM_PCH_PWM_ENABLE;
 		intel_de_write(dev_priv, BLC_PWM_PCH_CTL1, pch_ctl1);
 	}
@@ -939,14 +944,14 @@ static void pch_enable_backlight(const struct intel_crtc_state *crtc_state,
 
 	cpu_ctl2 = intel_de_read(dev_priv, BLC_PWM_CPU_CTL2);
 	if (cpu_ctl2 & BLM_PWM_ENABLE) {
-		DRM_DEBUG_KMS("cpu backlight already enabled\n");
+		drm_dbg_kms(&dev_priv->drm, "cpu backlight already enabled\n");
 		cpu_ctl2 &= ~BLM_PWM_ENABLE;
 		intel_de_write(dev_priv, BLC_PWM_CPU_CTL2, cpu_ctl2);
 	}
 
 	pch_ctl1 = intel_de_read(dev_priv, BLC_PWM_PCH_CTL1);
 	if (pch_ctl1 & BLM_PCH_PWM_ENABLE) {
-		DRM_DEBUG_KMS("pch backlight already enabled\n");
+		drm_dbg_kms(&dev_priv->drm, "pch backlight already enabled\n");
 		pch_ctl1 &= ~BLM_PCH_PWM_ENABLE;
 		intel_de_write(dev_priv, BLC_PWM_PCH_CTL1, pch_ctl1);
 	}
@@ -985,7 +990,7 @@ static void i9xx_enable_backlight(const struct intel_crtc_state *crtc_state,
 
 	ctl = intel_de_read(dev_priv, BLC_PWM_CTL);
 	if (ctl & BACKLIGHT_DUTY_CYCLE_MASK_PNV) {
-		DRM_DEBUG_KMS("backlight already enabled\n");
+		drm_dbg_kms(&dev_priv->drm, "backlight already enabled\n");
 		intel_de_write(dev_priv, BLC_PWM_CTL, 0);
 	}
 
@@ -1025,7 +1030,7 @@ static void i965_enable_backlight(const struct intel_crtc_state *crtc_state,
 
 	ctl2 = intel_de_read(dev_priv, BLC_PWM_CTL2);
 	if (ctl2 & BLM_PWM_ENABLE) {
-		DRM_DEBUG_KMS("backlight already enabled\n");
+		drm_dbg_kms(&dev_priv->drm, "backlight already enabled\n");
 		ctl2 &= ~BLM_PWM_ENABLE;
 		intel_de_write(dev_priv, BLC_PWM_CTL2, ctl2);
 	}
@@ -1060,7 +1065,7 @@ static void vlv_enable_backlight(const struct intel_crtc_state *crtc_state,
 
 	ctl2 = intel_de_read(dev_priv, VLV_BLC_PWM_CTL2(pipe));
 	if (ctl2 & BLM_PWM_ENABLE) {
-		DRM_DEBUG_KMS("backlight already enabled\n");
+		drm_dbg_kms(&dev_priv->drm, "backlight already enabled\n");
 		ctl2 &= ~BLM_PWM_ENABLE;
 		intel_de_write(dev_priv, VLV_BLC_PWM_CTL2(pipe), ctl2);
 	}
@@ -1093,7 +1098,8 @@ static void bxt_enable_backlight(const struct intel_crtc_state *crtc_state,
 	if (panel->backlight.controller == 1) {
 		val = intel_de_read(dev_priv, UTIL_PIN_CTL);
 		if (val & UTIL_PIN_ENABLE) {
-			DRM_DEBUG_KMS("util pin already enabled\n");
+			drm_dbg_kms(&dev_priv->drm,
+				    "util pin already enabled\n");
 			val &= ~UTIL_PIN_ENABLE;
 			intel_de_write(dev_priv, UTIL_PIN_CTL, val);
 		}
@@ -1108,7 +1114,7 @@ static void bxt_enable_backlight(const struct intel_crtc_state *crtc_state,
 	pwm_ctl = intel_de_read(dev_priv,
 				BXT_BLC_PWM_CTL(panel->backlight.controller));
 	if (pwm_ctl & BXT_BLC_PWM_ENABLE) {
-		DRM_DEBUG_KMS("backlight already enabled\n");
+		drm_dbg_kms(&dev_priv->drm, "backlight already enabled\n");
 		pwm_ctl &= ~BXT_BLC_PWM_ENABLE;
 		intel_de_write(dev_priv,
 			       BXT_BLC_PWM_CTL(panel->backlight.controller),
@@ -1144,7 +1150,7 @@ static void cnp_enable_backlight(const struct intel_crtc_state *crtc_state,
 	pwm_ctl = intel_de_read(dev_priv,
 				BXT_BLC_PWM_CTL(panel->backlight.controller));
 	if (pwm_ctl & BXT_BLC_PWM_ENABLE) {
-		DRM_DEBUG_KMS("backlight already enabled\n");
+		drm_dbg_kms(&dev_priv->drm, "backlight already enabled\n");
 		pwm_ctl &= ~BXT_BLC_PWM_ENABLE;
 		intel_de_write(dev_priv,
 			       BXT_BLC_PWM_CTL(panel->backlight.controller),
@@ -1213,7 +1219,7 @@ void intel_panel_enable_backlight(const struct intel_crtc_state *crtc_state,
 	if (!panel->backlight.present)
 		return;
 
-	DRM_DEBUG_KMS("pipe %c\n", pipe_name(pipe));
+	drm_dbg_kms(&dev_priv->drm, "pipe %c\n", pipe_name(pipe));
 
 	mutex_lock(&dev_priv->backlight_lock);
 
@@ -1238,7 +1244,7 @@ static u32 intel_panel_get_backlight(struct intel_connector *connector)
 
 	mutex_unlock(&dev_priv->backlight_lock);
 
-	DRM_DEBUG_DRIVER("get backlight PWM = %d\n", val);
+	drm_dbg(&dev_priv->drm, "get backlight PWM = %d\n", val);
 	return val;
 }
 
@@ -1534,22 +1540,26 @@ static u32 get_backlight_max_vbt(struct intel_connector *connector)
 	u32 pwm;
 
 	if (!panel->backlight.hz_to_pwm) {
-		DRM_DEBUG_KMS("backlight frequency conversion not supported\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "backlight frequency conversion not supported\n");
 		return 0;
 	}
 
 	if (pwm_freq_hz) {
-		DRM_DEBUG_KMS("VBT defined backlight frequency %u Hz\n",
-			      pwm_freq_hz);
+		drm_dbg_kms(&dev_priv->drm,
+			    "VBT defined backlight frequency %u Hz\n",
+			    pwm_freq_hz);
 	} else {
 		pwm_freq_hz = 200;
-		DRM_DEBUG_KMS("default backlight frequency %u Hz\n",
-			      pwm_freq_hz);
+		drm_dbg_kms(&dev_priv->drm,
+			    "default backlight frequency %u Hz\n",
+			    pwm_freq_hz);
 	}
 
 	pwm = panel->backlight.hz_to_pwm(connector, pwm_freq_hz);
 	if (!pwm) {
-		DRM_DEBUG_KMS("backlight frequency conversion failed\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "backlight frequency conversion failed\n");
 		return 0;
 	}
 
@@ -1576,8 +1586,9 @@ static u32 get_backlight_min_vbt(struct intel_connector *connector)
 	 */
 	min = clamp_t(int, dev_priv->vbt.backlight.min_brightness, 0, 64);
 	if (min != dev_priv->vbt.backlight.min_brightness) {
-		DRM_DEBUG_KMS("clamping VBT min backlight %d/255 to %d/255\n",
-			      dev_priv->vbt.backlight.min_brightness, min);
+		drm_dbg_kms(&dev_priv->drm,
+			    "clamping VBT min backlight %d/255 to %d/255\n",
+			    dev_priv->vbt.backlight.min_brightness, min);
 	}
 
 	/* vbt value is a coefficient in range [0..255] */
@@ -1627,7 +1638,8 @@ static int lpt_setup_backlight(struct intel_connector *connector, enum pipe unus
 				       panel->backlight.max);
 
 	if (cpu_mode) {
-		DRM_DEBUG_KMS("CPU backlight register was enabled, switching to PCH override\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "CPU backlight register was enabled, switching to PCH override\n");
 
 		/* Write converted CPU PWM value to PCH override register */
 		lpt_set_backlight(connector->base.state, panel->backlight.level);
@@ -1880,7 +1892,8 @@ static int pwm_setup_backlight(struct intel_connector *connector,
 	}
 
 	if (IS_ERR(panel->backlight.pwm)) {
-		DRM_ERROR("Failed to get the %s PWM chip\n", desc);
+		drm_err(&dev_priv->drm, "Failed to get the %s PWM chip\n",
+			desc);
 		panel->backlight.pwm = NULL;
 		return -ENODEV;
 	}
@@ -1894,7 +1907,7 @@ static int pwm_setup_backlight(struct intel_connector *connector,
 	retval = pwm_config(panel->backlight.pwm, CRC_PMIC_PWM_PERIOD_NS,
 			    CRC_PMIC_PWM_PERIOD_NS);
 	if (retval < 0) {
-		DRM_ERROR("Failed to configure the pwm chip\n");
+		drm_err(&dev_priv->drm, "Failed to configure the pwm chip\n");
 		pwm_put(panel->backlight.pwm);
 		panel->backlight.pwm = NULL;
 		return retval;
@@ -1907,7 +1920,8 @@ static int pwm_setup_backlight(struct intel_connector *connector,
 				 CRC_PMIC_PWM_PERIOD_NS);
 	panel->backlight.enabled = panel->backlight.level != 0;
 
-	DRM_INFO("Using %s PWM for LCD backlight control\n", desc);
+	drm_info(&dev_priv->drm, "Using %s PWM for LCD backlight control\n",
+		 desc);
 	return 0;
 }
 
@@ -1938,9 +1952,11 @@ int intel_panel_setup_backlight(struct drm_connector *connector, enum pipe pipe)
 
 	if (!dev_priv->vbt.backlight.present) {
 		if (dev_priv->quirks & QUIRK_BACKLIGHT_PRESENT) {
-			DRM_DEBUG_KMS("no backlight present per VBT, but present per quirk\n");
+			drm_dbg_kms(&dev_priv->drm,
+				    "no backlight present per VBT, but present per quirk\n");
 		} else {
-			DRM_DEBUG_KMS("no backlight present per VBT\n");
+			drm_dbg_kms(&dev_priv->drm,
+				    "no backlight present per VBT\n");
 			return 0;
 		}
 	}
@@ -1955,17 +1971,19 @@ int intel_panel_setup_backlight(struct drm_connector *connector, enum pipe pipe)
 	mutex_unlock(&dev_priv->backlight_lock);
 
 	if (ret) {
-		DRM_DEBUG_KMS("failed to setup backlight for connector %s\n",
-			      connector->name);
+		drm_dbg_kms(&dev_priv->drm,
+			    "failed to setup backlight for connector %s\n",
+			    connector->name);
 		return ret;
 	}
 
 	panel->backlight.present = true;
 
-	DRM_DEBUG_KMS("Connector %s backlight initialized, %s, brightness %u/%u\n",
-		      connector->name,
-		      enableddisabled(panel->backlight.enabled),
-		      panel->backlight.level, panel->backlight.max);
+	drm_dbg_kms(&dev_priv->drm,
+		    "Connector %s backlight initialized, %s, brightness %u/%u\n",
+		    connector->name,
+		    enableddisabled(panel->backlight.enabled),
+		    panel->backlight.level, panel->backlight.max);
 
 	return 0;
 }
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
