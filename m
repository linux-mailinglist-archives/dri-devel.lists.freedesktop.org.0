Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4A314E95D
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 09:04:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045EC6FAA1;
	Fri, 31 Jan 2020 08:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C7F6F91F;
 Thu, 30 Jan 2020 08:33:13 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t2so2960550wrr.1;
 Thu, 30 Jan 2020 00:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HkkZc+oxHHxOfhHaPbeltT/zuN5KDXhDtkeaC1PgunQ=;
 b=JV7KjiB8KiUeX9ukWRGXMGzJIcpXtjqbRimOo/LNAjsGoFzl9vxvI76Vnt1J2+xD4S
 a3i0LoDsChHCSY1HhMtq/oThvShI1Oz5WcSh56AyNGgnwVtmAp9QMU1DyaSXJKeZ4EVz
 qvpL/UVlnTN5+CLpnxj5jzuRirvTzlBsaW35HmOIKVq/x/GTX9RO7V6vzBYiOYSO9z/n
 PzYlRIUj4D/5mSaQ4daQfO2gPr/cqPGmx7zU8e6IupTG25lVTq03ErXgaumhSDbgtnyv
 7GkKIRbVvRjDbm8vS7m/oGsoASb865iAapN+luWD4YH621ZLshMRtV3LLbqSLpTA+eeM
 v/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HkkZc+oxHHxOfhHaPbeltT/zuN5KDXhDtkeaC1PgunQ=;
 b=hYRX/44GbhWLOm3Qm+/gLNW1poZssn9YhGQZPrHHypvBcSv39Rg2vV7/zJ2wXNi437
 VkL0IX/aGnopf6VWJsTfnM9Df0hAKhosMuRGjN1RTgNGoO8x/ev4FhAMTmZWfCgcV4GV
 sC/3svxaL3aJw1ANVhBCE9hsavLw/Ic9bgiU2Ckrck0ND0pNi2AJHSJ8baFpSV2jFIzm
 +47PLf5hQp8lpcnO3uxoFy2hIlYWpKyb/oeXbJc+h0E7N1Ew1CXtK766HSyb6ZNxTPvV
 ZMHf2CJHB4Asb69kSIWJNkmX2pHyoLjZIn5GDc0ebbZRqeZyW23QgyPrCgik+cwpdOl5
 Yo/w==
X-Gm-Message-State: APjAAAVbYYaNmALsxFMP2WUVluu13dX0cSszj6C1o5kgQcphbYfJgI5S
 67PHdxVYWB+YAEgr+5Kbg8A=
X-Google-Smtp-Source: APXvYqyTL392SUwyAN9OpkjPU4f1UAyUug+UVWWftWLDDnbRYB3r2WXgUw5PBH/4lKz5oYw7JILN8w==
X-Received: by 2002:adf:e88f:: with SMTP id d15mr3833691wrm.186.1580373191278; 
 Thu, 30 Jan 2020 00:33:11 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id i11sm6363678wrs.10.2020.01.30.00.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 00:33:10 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 10/12] drm/i915/psr: automatic conversion to drm_device based
 logging macros.
Date: Thu, 30 Jan 2020 11:32:27 +0300
Message-Id: <20200130083229.12889-11-wambui.karugax@gmail.com>
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

Converts instances of the printk based logging macros to the struct
drm_device based logging macros in i915/display/intel_psr.c using the
following coccinelle script that transforms based on the existence of a
drm_i915_private device pointer:
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
 drivers/gpu/drm/i915/display/intel_psr.c | 128 ++++++++++++++---------
 1 file changed, 77 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index e41ed962aa80..97d22448c6a7 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -174,14 +174,16 @@ void intel_psr_irq_handler(struct drm_i915_private *dev_priv, u32 psr_iir)
 
 	if (psr_iir & EDP_PSR_PRE_ENTRY(trans_shift)) {
 		dev_priv->psr.last_entry_attempt = time_ns;
-		DRM_DEBUG_KMS("[transcoder %s] PSR entry attempt in 2 vblanks\n",
-			      transcoder_name(cpu_transcoder));
+		drm_dbg_kms(&dev_priv->drm,
+			    "[transcoder %s] PSR entry attempt in 2 vblanks\n",
+			    transcoder_name(cpu_transcoder));
 	}
 
 	if (psr_iir & EDP_PSR_POST_EXIT(trans_shift)) {
 		dev_priv->psr.last_exit = time_ns;
-		DRM_DEBUG_KMS("[transcoder %s] PSR exit completed\n",
-			      transcoder_name(cpu_transcoder));
+		drm_dbg_kms(&dev_priv->drm,
+			    "[transcoder %s] PSR exit completed\n",
+			    transcoder_name(cpu_transcoder));
 
 		if (INTEL_GEN(dev_priv) >= 9) {
 			u32 val = intel_de_read(dev_priv,
@@ -197,7 +199,7 @@ void intel_psr_irq_handler(struct drm_i915_private *dev_priv, u32 psr_iir)
 	if (psr_iir & EDP_PSR_ERROR(trans_shift)) {
 		u32 val;
 
-		DRM_WARN("[transcoder %s] PSR aux error\n",
+		drm_warn(&dev_priv->drm, "[transcoder %s] PSR aux error\n",
 			 transcoder_name(cpu_transcoder));
 
 		dev_priv->psr.irq_aux_error = true;
@@ -272,7 +274,8 @@ void intel_psr_init_dpcd(struct intel_dp *intel_dp)
 		to_i915(dp_to_dig_port(intel_dp)->base.base.dev);
 
 	if (dev_priv->psr.dp) {
-		DRM_WARN("More than one eDP panel found, PSR support should be extended\n");
+		drm_warn(&dev_priv->drm,
+			 "More than one eDP panel found, PSR support should be extended\n");
 		return;
 	}
 
@@ -281,16 +284,18 @@ void intel_psr_init_dpcd(struct intel_dp *intel_dp)
 
 	if (!intel_dp->psr_dpcd[0])
 		return;
-	DRM_DEBUG_KMS("eDP panel supports PSR version %x\n",
-		      intel_dp->psr_dpcd[0]);
+	drm_dbg_kms(&dev_priv->drm, "eDP panel supports PSR version %x\n",
+		    intel_dp->psr_dpcd[0]);
 
 	if (drm_dp_has_quirk(&intel_dp->desc, DP_DPCD_QUIRK_NO_PSR)) {
-		DRM_DEBUG_KMS("PSR support not currently available for this panel\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "PSR support not currently available for this panel\n");
 		return;
 	}
 
 	if (!(intel_dp->edp_dpcd[1] & DP_EDP_SET_POWER_CAP)) {
-		DRM_DEBUG_KMS("Panel lacks power state control, PSR cannot be enabled\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "Panel lacks power state control, PSR cannot be enabled\n");
 		return;
 	}
 
@@ -318,8 +323,8 @@ void intel_psr_init_dpcd(struct intel_dp *intel_dp)
 		 * GTC first.
 		 */
 		dev_priv->psr.sink_psr2_support = y_req && alpm;
-		DRM_DEBUG_KMS("PSR2 %ssupported\n",
-			      dev_priv->psr.sink_psr2_support ? "" : "not ");
+		drm_dbg_kms(&dev_priv->drm, "PSR2 %ssupported\n",
+			    dev_priv->psr.sink_psr2_support ? "" : "not ");
 
 		if (dev_priv->psr.sink_psr2_support) {
 			dev_priv->psr.colorimetry_support =
@@ -588,7 +593,7 @@ static void tgl_dc5_idle_thread(struct work_struct *work)
 	if (delayed_work_pending(&dev_priv->psr.idle_work))
 		goto unlock;
 
-	DRM_DEBUG_KMS("DC5/6 idle thread\n");
+	drm_dbg_kms(&dev_priv->drm, "DC5/6 idle thread\n");
 	tgl_psr2_disable_dc3co(dev_priv);
 unlock:
 	mutex_unlock(&dev_priv->psr.lock);
@@ -646,8 +651,9 @@ static bool intel_psr2_config_valid(struct intel_dp *intel_dp,
 		return false;
 
 	if (!transcoder_has_psr2(dev_priv, crtc_state->cpu_transcoder)) {
-		DRM_DEBUG_KMS("PSR2 not supported in transcoder %s\n",
-			      transcoder_name(crtc_state->cpu_transcoder));
+		drm_dbg_kms(&dev_priv->drm,
+			    "PSR2 not supported in transcoder %s\n",
+			    transcoder_name(crtc_state->cpu_transcoder));
 		return false;
 	}
 
@@ -657,7 +663,8 @@ static bool intel_psr2_config_valid(struct intel_dp *intel_dp,
 	 * over PSR2.
 	 */
 	if (crtc_state->dsc.compression_enable) {
-		DRM_DEBUG_KMS("PSR2 cannot be enabled since DSC is enabled\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "PSR2 cannot be enabled since DSC is enabled\n");
 		return false;
 	}
 
@@ -676,15 +683,17 @@ static bool intel_psr2_config_valid(struct intel_dp *intel_dp,
 	}
 
 	if (crtc_hdisplay > psr_max_h || crtc_vdisplay > psr_max_v) {
-		DRM_DEBUG_KMS("PSR2 not enabled, resolution %dx%d > max supported %dx%d\n",
-			      crtc_hdisplay, crtc_vdisplay,
-			      psr_max_h, psr_max_v);
+		drm_dbg_kms(&dev_priv->drm,
+			    "PSR2 not enabled, resolution %dx%d > max supported %dx%d\n",
+			    crtc_hdisplay, crtc_vdisplay,
+			    psr_max_h, psr_max_v);
 		return false;
 	}
 
 	if (crtc_state->pipe_bpp > max_bpp) {
-		DRM_DEBUG_KMS("PSR2 not enabled, pipe bpp %d > max supported %d\n",
-			      crtc_state->pipe_bpp, max_bpp);
+		drm_dbg_kms(&dev_priv->drm,
+			    "PSR2 not enabled, pipe bpp %d > max supported %d\n",
+			    crtc_state->pipe_bpp, max_bpp);
 		return false;
 	}
 
@@ -695,13 +704,15 @@ static bool intel_psr2_config_valid(struct intel_dp *intel_dp,
 	 * x granularity.
 	 */
 	if (crtc_hdisplay % dev_priv->psr.su_x_granularity) {
-		DRM_DEBUG_KMS("PSR2 not enabled, hdisplay(%d) not multiple of %d\n",
-			      crtc_hdisplay, dev_priv->psr.su_x_granularity);
+		drm_dbg_kms(&dev_priv->drm,
+			    "PSR2 not enabled, hdisplay(%d) not multiple of %d\n",
+			    crtc_hdisplay, dev_priv->psr.su_x_granularity);
 		return false;
 	}
 
 	if (crtc_state->crc_enabled) {
-		DRM_DEBUG_KMS("PSR2 not enabled because it would inhibit pipe CRC calculation\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "PSR2 not enabled because it would inhibit pipe CRC calculation\n");
 		return false;
 	}
 
@@ -731,31 +742,36 @@ void intel_psr_compute_config(struct intel_dp *intel_dp,
 	 * hardcoded to PORT_A
 	 */
 	if (dig_port->base.port != PORT_A) {
-		DRM_DEBUG_KMS("PSR condition failed: Port not supported\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "PSR condition failed: Port not supported\n");
 		return;
 	}
 
 	if (dev_priv->psr.sink_not_reliable) {
-		DRM_DEBUG_KMS("PSR sink implementation is not reliable\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "PSR sink implementation is not reliable\n");
 		return;
 	}
 
 	if (adjusted_mode->flags & DRM_MODE_FLAG_INTERLACE) {
-		DRM_DEBUG_KMS("PSR condition failed: Interlaced mode enabled\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "PSR condition failed: Interlaced mode enabled\n");
 		return;
 	}
 
 	psr_setup_time = drm_dp_psr_setup_time(intel_dp->psr_dpcd);
 	if (psr_setup_time < 0) {
-		DRM_DEBUG_KMS("PSR condition failed: Invalid PSR setup time (0x%02x)\n",
-			      intel_dp->psr_dpcd[1]);
+		drm_dbg_kms(&dev_priv->drm,
+			    "PSR condition failed: Invalid PSR setup time (0x%02x)\n",
+			    intel_dp->psr_dpcd[1]);
 		return;
 	}
 
 	if (intel_usecs_to_scanlines(adjusted_mode, psr_setup_time) >
 	    adjusted_mode->crtc_vtotal - adjusted_mode->crtc_vdisplay - 1) {
-		DRM_DEBUG_KMS("PSR condition failed: PSR setup time (%d us) too long\n",
-			      psr_setup_time);
+		drm_dbg_kms(&dev_priv->drm,
+			    "PSR condition failed: PSR setup time (%d us) too long\n",
+			    psr_setup_time);
 		return;
 	}
 
@@ -875,12 +891,13 @@ static void intel_psr_enable_locked(struct drm_i915_private *dev_priv,
 	}
 	if (val) {
 		dev_priv->psr.sink_not_reliable = true;
-		DRM_DEBUG_KMS("PSR interruption error set, not enabling PSR\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "PSR interruption error set, not enabling PSR\n");
 		return;
 	}
 
-	DRM_DEBUG_KMS("Enabling PSR%s\n",
-		      dev_priv->psr.psr2_enabled ? "2" : "1");
+	drm_dbg_kms(&dev_priv->drm, "Enabling PSR%s\n",
+		    dev_priv->psr.psr2_enabled ? "2" : "1");
 	intel_psr_setup_vsc(intel_dp, crtc_state);
 	intel_psr_enable_sink(intel_dp);
 	intel_psr_enable_source(intel_dp, crtc_state);
@@ -912,7 +929,7 @@ void intel_psr_enable(struct intel_dp *intel_dp,
 	mutex_lock(&dev_priv->psr.lock);
 
 	if (!psr_global_enabled(dev_priv->psr.debug)) {
-		DRM_DEBUG_KMS("PSR disabled by flag\n");
+		drm_dbg_kms(&dev_priv->drm, "PSR disabled by flag\n");
 		goto unlock;
 	}
 
@@ -970,8 +987,8 @@ static void intel_psr_disable_locked(struct intel_dp *intel_dp)
 	if (!dev_priv->psr.enabled)
 		return;
 
-	DRM_DEBUG_KMS("Disabling PSR%s\n",
-		      dev_priv->psr.psr2_enabled ? "2" : "1");
+	drm_dbg_kms(&dev_priv->drm, "Disabling PSR%s\n",
+		    dev_priv->psr.psr2_enabled ? "2" : "1");
 
 	intel_psr_exit(dev_priv);
 
@@ -986,7 +1003,7 @@ static void intel_psr_disable_locked(struct intel_dp *intel_dp)
 	/* Wait till PSR is idle */
 	if (intel_de_wait_for_clear(dev_priv, psr_status,
 				    psr_status_mask, 2000))
-		DRM_ERROR("Timed out waiting PSR idle state\n");
+		drm_err(&dev_priv->drm, "Timed out waiting PSR idle state\n");
 
 	/* Disable PSR on Sink */
 	drm_dp_dpcd_writeb(&intel_dp->aux, DP_PSR_EN_CFG, 0);
@@ -1154,7 +1171,8 @@ static bool __psr_wait_for_idle_locked(struct drm_i915_private *dev_priv)
 
 	err = intel_de_wait_for_clear(dev_priv, reg, mask, 50);
 	if (err)
-		DRM_ERROR("Timed out waiting for PSR Idle for re-enable\n");
+		drm_err(&dev_priv->drm,
+			"Timed out waiting for PSR Idle for re-enable\n");
 
 	/* After the unlocked wait, verify that PSR is still wanted! */
 	mutex_lock(&dev_priv->psr.lock);
@@ -1218,7 +1236,7 @@ int intel_psr_debug_set(struct drm_i915_private *dev_priv, u64 val)
 
 	if (val & ~(I915_PSR_DEBUG_IRQ | I915_PSR_DEBUG_MODE_MASK) ||
 	    mode > I915_PSR_DEBUG_FORCE_PSR1) {
-		DRM_DEBUG_KMS("Invalid debug mask %llx\n", val);
+		drm_dbg_kms(&dev_priv->drm, "Invalid debug mask %llx\n", val);
 		return -EINVAL;
 	}
 
@@ -1474,14 +1492,15 @@ static void psr_alpm_check(struct intel_dp *intel_dp)
 
 	r = drm_dp_dpcd_readb(aux, DP_RECEIVER_ALPM_STATUS, &val);
 	if (r != 1) {
-		DRM_ERROR("Error reading ALPM status\n");
+		drm_err(&dev_priv->drm, "Error reading ALPM status\n");
 		return;
 	}
 
 	if (val & DP_ALPM_LOCK_TIMEOUT_ERROR) {
 		intel_psr_disable_locked(intel_dp);
 		psr->sink_not_reliable = true;
-		DRM_DEBUG_KMS("ALPM lock timeout error, disabling PSR\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "ALPM lock timeout error, disabling PSR\n");
 
 		/* Clearing error */
 		drm_dp_dpcd_writeb(aux, DP_RECEIVER_ALPM_STATUS, val);
@@ -1497,14 +1516,15 @@ static void psr_capability_changed_check(struct intel_dp *intel_dp)
 
 	r = drm_dp_dpcd_readb(&intel_dp->aux, DP_PSR_ESI, &val);
 	if (r != 1) {
-		DRM_ERROR("Error reading DP_PSR_ESI\n");
+		drm_err(&dev_priv->drm, "Error reading DP_PSR_ESI\n");
 		return;
 	}
 
 	if (val & DP_PSR_CAPS_CHANGE) {
 		intel_psr_disable_locked(intel_dp);
 		psr->sink_not_reliable = true;
-		DRM_DEBUG_KMS("Sink PSR capability changed, disabling PSR\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "Sink PSR capability changed, disabling PSR\n");
 
 		/* Clearing it */
 		drm_dp_dpcd_writeb(&intel_dp->aux, DP_PSR_ESI, val);
@@ -1529,7 +1549,8 @@ void intel_psr_short_pulse(struct intel_dp *intel_dp)
 		goto exit;
 
 	if (psr_get_status_and_error_status(intel_dp, &status, &error_status)) {
-		DRM_ERROR("Error reading PSR status or error status\n");
+		drm_err(&dev_priv->drm,
+			"Error reading PSR status or error status\n");
 		goto exit;
 	}
 
@@ -1539,17 +1560,22 @@ void intel_psr_short_pulse(struct intel_dp *intel_dp)
 	}
 
 	if (status == DP_PSR_SINK_INTERNAL_ERROR && !error_status)
-		DRM_DEBUG_KMS("PSR sink internal error, disabling PSR\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "PSR sink internal error, disabling PSR\n");
 	if (error_status & DP_PSR_RFB_STORAGE_ERROR)
-		DRM_DEBUG_KMS("PSR RFB storage error, disabling PSR\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "PSR RFB storage error, disabling PSR\n");
 	if (error_status & DP_PSR_VSC_SDP_UNCORRECTABLE_ERROR)
-		DRM_DEBUG_KMS("PSR VSC SDP uncorrectable error, disabling PSR\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "PSR VSC SDP uncorrectable error, disabling PSR\n");
 	if (error_status & DP_PSR_LINK_CRC_ERROR)
-		DRM_DEBUG_KMS("PSR Link CRC error, disabling PSR\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "PSR Link CRC error, disabling PSR\n");
 
 	if (error_status & ~errors)
-		DRM_ERROR("PSR_ERROR_STATUS unhandled errors %x\n",
-			  error_status & ~errors);
+		drm_err(&dev_priv->drm,
+			"PSR_ERROR_STATUS unhandled errors %x\n",
+			error_status & ~errors);
 	/* clear status register */
 	drm_dp_dpcd_writeb(&intel_dp->aux, DP_PSR_ERROR_STATUS, error_status);
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
