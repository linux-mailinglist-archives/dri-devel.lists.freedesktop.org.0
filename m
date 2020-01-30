Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B40914E957
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 09:04:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAB76FA9D;
	Fri, 31 Jan 2020 08:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB8D6F913;
 Thu, 30 Jan 2020 08:32:52 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id g17so2966113wro.2;
 Thu, 30 Jan 2020 00:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2pcDxaz1r4lnc+nRs7lVUX0N/1Eh6e9jSwk1X6FXGgE=;
 b=qUmWV/5yag6pLFCbZLyu5GznADzlwTRav4iWYGR55YHD1vX4gxk/Wng1gIw5k8vWrr
 Qpp/Q3a8uW102Gliljtw4iKyjf3V+8d326VADG22ie70Kqi38OjRVVULgrfsToDgODLN
 gZcFzxhWuB86jxVr9jNI1p4331Or4oLILxkoOq78l+USXSQqEkKLurC6HVc3qIJXcTAG
 mzGpf0Yv29EYgKslTRvZWPGdFZUPhxlPoZ5xRjPdn7FWF5jkINn861WOAQZ4C4OWXM9u
 gZK5XAPStnjuIYNgXpt6rDRdKQXxdYpU+WnpPrMYmyPya4GIozZxvXFTSiz90mbJPIc6
 dobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2pcDxaz1r4lnc+nRs7lVUX0N/1Eh6e9jSwk1X6FXGgE=;
 b=qTiFAwMS8CMF9S4vDmeET9zKpDUIHinXnhL14IQ5oWREOiwG0DnQt9XIxa9guxOsVz
 /LkOwKxMgbs9F3J3DQO0chCFOr4NmxMIdtLcOjI3kwcOuazf+O8duvStQ1RNKpUnpJ8b
 CX6kifyN+8tqZ4IMQNQeXaYBDZ/Mizg+4XH+8/4R06EelfQ/Frl1Ueduk41MN4qptFrN
 dHH4AJv3SIGMbpvA2AtymzUPLk13wtc8Bgww1BdY/UKaVf6l8UMbT5+kCePvBHMOJVpc
 rZ/cjWF6LYD6bT7hPeipnfPlxhMilML7C5mQz2UupLhUcwXAPecWB3Epi/HMpNUVrZyK
 TTog==
X-Gm-Message-State: APjAAAUBPKUtzkWgp6z8HeGXsZCROnpaIvTh/JKt4/kN2d7xghnRis8O
 y6i12CG4i3gCxh9zsEpENwg=
X-Google-Smtp-Source: APXvYqzbNJO+RIK8BP1aWXfkEitt7hAQWMdFXdmI8BW8FcpP2VAjvf1Fd/Wl7WwHBFCzT96ZppILzA==
X-Received: by 2002:a5d:53c1:: with SMTP id a1mr3868300wrw.373.1580373171373; 
 Thu, 30 Jan 2020 00:32:51 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id i11sm6363678wrs.10.2020.01.30.00.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 00:32:50 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 05/12] drm/i915/tv: automatic conversion to drm_device based
 logging macros.
Date: Thu, 30 Jan 2020 11:32:22 +0300
Message-Id: <20200130083229.12889-6-wambui.karugax@gmail.com>
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

Converts most uses of the printk based logging macros to the struct
drm_device based logging macros in i915/display/intel_tv.c using the
following coccinelle script that matches based on the existence of a
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

Checkpatch warnings were fixed manually.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_tv.c | 26 ++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
index fa155a028e2b..4f81ee26b7ab 100644
--- a/drivers/gpu/drm/i915/display/intel_tv.c
+++ b/drivers/gpu/drm/i915/display/intel_tv.c
@@ -1146,7 +1146,7 @@ intel_tv_get_config(struct intel_encoder *encoder,
 
 	intel_tv_mode_to_mode(&mode, &tv_mode);
 
-	DRM_DEBUG_KMS("TV mode:\n");
+	drm_dbg_kms(&dev_priv->drm, "TV mode:\n");
 	drm_mode_debug_printmodeline(&mode);
 
 	intel_tv_scale_mode_horiz(&mode, hdisplay,
@@ -1202,7 +1202,7 @@ intel_tv_compute_config(struct intel_encoder *encoder,
 
 	pipe_config->output_format = INTEL_OUTPUT_FORMAT_RGB;
 
-	DRM_DEBUG_KMS("forcing bpc to 8 for TV\n");
+	drm_dbg_kms(&dev_priv->drm, "forcing bpc to 8 for TV\n");
 	pipe_config->pipe_bpp = 8*3;
 
 	pipe_config->port_clock = tv_mode->clock;
@@ -1217,7 +1217,8 @@ intel_tv_compute_config(struct intel_encoder *encoder,
 		extra = adjusted_mode->crtc_vdisplay - vdisplay;
 
 		if (extra < 0) {
-			DRM_DEBUG_KMS("No vertical scaling for >1024 pixel wide modes\n");
+			drm_dbg_kms(&dev_priv->drm,
+				    "No vertical scaling for >1024 pixel wide modes\n");
 			return -EINVAL;
 		}
 
@@ -1250,7 +1251,7 @@ intel_tv_compute_config(struct intel_encoder *encoder,
 		tv_conn_state->bypass_vfilter = false;
 	}
 
-	DRM_DEBUG_KMS("TV mode:\n");
+	drm_dbg_kms(&dev_priv->drm, "TV mode:\n");
 	drm_mode_debug_printmodeline(adjusted_mode);
 
 	/*
@@ -1622,7 +1623,7 @@ intel_tv_detect_type(struct intel_tv *intel_tv,
 
 	type = -1;
 	tv_dac = intel_de_read(dev_priv, TV_DAC);
-	DRM_DEBUG_KMS("TV detected: %x, %x\n", tv_ctl, tv_dac);
+	drm_dbg_kms(&dev_priv->drm, "TV detected: %x, %x\n", tv_ctl, tv_dac);
 	/*
 	 *  A B C
 	 *  0 1 1 Composite
@@ -1630,16 +1631,19 @@ intel_tv_detect_type(struct intel_tv *intel_tv,
 	 *  0 0 0 Component
 	 */
 	if ((tv_dac & TVDAC_SENSE_MASK) == (TVDAC_B_SENSE | TVDAC_C_SENSE)) {
-		DRM_DEBUG_KMS("Detected Composite TV connection\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "Detected Composite TV connection\n");
 		type = DRM_MODE_CONNECTOR_Composite;
 	} else if ((tv_dac & (TVDAC_A_SENSE|TVDAC_B_SENSE)) == TVDAC_A_SENSE) {
-		DRM_DEBUG_KMS("Detected S-Video TV connection\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "Detected S-Video TV connection\n");
 		type = DRM_MODE_CONNECTOR_SVIDEO;
 	} else if ((tv_dac & TVDAC_SENSE_MASK) == 0) {
-		DRM_DEBUG_KMS("Detected Component TV connection\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "Detected Component TV connection\n");
 		type = DRM_MODE_CONNECTOR_Component;
 	} else {
-		DRM_DEBUG_KMS("Unrecognised TV connection\n");
+		drm_dbg_kms(&dev_priv->drm, "Unrecognised TV connection\n");
 		type = -1;
 	}
 
@@ -1800,7 +1804,7 @@ intel_tv_get_modes(struct drm_connector *connector)
 		 */
 		intel_tv_mode_to_mode(mode, tv_mode);
 		if (count == 0) {
-			DRM_DEBUG_KMS("TV mode:\n");
+			drm_dbg_kms(&dev_priv->drm, "TV mode:\n");
 			drm_mode_debug_printmodeline(mode);
 		}
 		intel_tv_scale_mode_horiz(mode, input->w, 0, 0);
@@ -1880,7 +1884,7 @@ intel_tv_init(struct drm_i915_private *dev_priv)
 		return;
 
 	if (!intel_bios_is_tv_present(dev_priv)) {
-		DRM_DEBUG_KMS("Integrated TV is not present.\n");
+		drm_dbg_kms(&dev_priv->drm, "Integrated TV is not present.\n");
 		return;
 	}
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
