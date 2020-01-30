Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1994A14E952
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 09:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F806FA91;
	Fri, 31 Jan 2020 08:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7616F919;
 Thu, 30 Jan 2020 08:33:04 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id s10so2773583wmh.3;
 Thu, 30 Jan 2020 00:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kya4/8Wbnv4vmokxOyL0Eup/HYclo1ALmYw9uxIEbi4=;
 b=ja7i3oaH/Ib+llOlQRhEGq0rWhseVyALyTsJoGK+Hu0wRN5KvESZ2dTYTmz18nvJZO
 T6nYs8xgtTdU0xSLPFYESd8Q0Ass35JoBsXvgoXv9RpNmz7AoyNBkd/evqU3gSdPIxE3
 ZHDO/Nis5p2dF4zdeeKa5NjoNPknlfNGCKvUwQ2DrO3zSIGnlHmNNnku7FFGdgy1SLKz
 xIJpChnvmbZ/AB2qT/m6uQ8wooOFvzCrUnEudHpjGapIyhs8rsEJlFiVmwP67o+ONFp0
 vK1QgMTgsMGHvEL9GkGHYVHMafeNigIYVx3LoKaXJvAw9XWwIq+w6OO9YBBNpjztga/K
 xmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kya4/8Wbnv4vmokxOyL0Eup/HYclo1ALmYw9uxIEbi4=;
 b=hbz5D64pFHoMKJMFz1gI36TjuwjMFWaFMoEZFYuKmiO0xZ2CWIaHM/Ya9mLRevh51M
 tLlJAVUiJxE5BzmjUUZYBowlX4hSEZeWo6HXDuNKONAOfytmLuR3C+si2nAw5GrhkMvt
 r1NYAfo/by70dk99giFg3sQEOaNSl8shxRc1HE6WuYnkESb6RZb3D5sjwIWKAi6gcFGg
 oeahEltEciiDElexvqQKatAUaWfXfAoOJqLHCvVCcPFn4LeB/4dUXIk/I8fFIxqFOBfV
 1lBWZlSD5W3U6g4qKUR4+wfE7qW1n4nXmQdcGu6k/bN4LhOunOIyLKAABJpbP/ftvvlk
 eqsA==
X-Gm-Message-State: APjAAAViNuetQeFh+uKb/Qh5+iaVGUXhenqTwWKzy7AK/1fGIxfSAqGN
 fEq8kfRHcTzdFhhl7UwHT4U=
X-Google-Smtp-Source: APXvYqwVmfLosBrDflGQNvPTxxesypnnu1jDu6zu6/cOwfqG6u0gLimLaOoke7eKnvRa7wVVxyKCWA==
X-Received: by 2002:a05:600c:2056:: with SMTP id
 p22mr3923889wmg.136.1580373182964; 
 Thu, 30 Jan 2020 00:33:02 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id i11sm6363678wrs.10.2020.01.30.00.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 00:33:02 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 08/12] drm/i915/sdvo: automatic conversion to drm_device based
 logging macros.
Date: Thu, 30 Jan 2020 11:32:25 +0300
Message-Id: <20200130083229.12889-9-wambui.karugax@gmail.com>
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

Converts instances of the printk based drm logging macros to the new
struct drm_device based logging macros in i915/display/intel_sdvo.c
This was done automatically using the following coccinelle script that
matches based on the existence of a drm_i915_private device pointer:
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
 drivers/gpu/drm/i915/display/intel_sdvo.c | 29 +++++++++++++----------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 225b6402718e..4ddb81428cab 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -1477,7 +1477,8 @@ static void intel_sdvo_pre_enable(struct intel_encoder *intel_encoder,
 	else
 		intel_sdvo_get_dtd_from_mode(&output_dtd, mode);
 	if (!intel_sdvo_set_output_timing(intel_sdvo, &output_dtd))
-		DRM_INFO("Setting output timings on %s failed\n",
+		drm_info(&dev_priv->drm,
+			 "Setting output timings on %s failed\n",
 			 SDVO_NAME(intel_sdvo));
 
 	/* Set the input timing to the screen. Assume always input 0. */
@@ -1501,7 +1502,8 @@ static void intel_sdvo_pre_enable(struct intel_encoder *intel_encoder,
 	if (IS_TV(intel_sdvo_connector) || IS_LVDS(intel_sdvo_connector))
 		input_dtd.part2.sdvo_flags = intel_sdvo->dtd_sdvo_flags;
 	if (!intel_sdvo_set_input_timing(intel_sdvo, &input_dtd))
-		DRM_INFO("Setting input timings on %s failed\n",
+		drm_info(&dev_priv->drm,
+			 "Setting input timings on %s failed\n",
 			 SDVO_NAME(intel_sdvo));
 
 	switch (crtc_state->pixel_multiplier) {
@@ -1622,7 +1624,7 @@ static void intel_sdvo_get_config(struct intel_encoder *encoder,
 		 * Some sdvo encoders are not spec compliant and don't
 		 * implement the mandatory get_timings function.
 		 */
-		DRM_DEBUG_DRIVER("failed to retrieve SDVO DTD\n");
+		drm_dbg(&dev_priv->drm, "failed to retrieve SDVO DTD\n");
 		pipe_config->quirks |= PIPE_CONFIG_QUIRK_MODE_SYNC_FLAGS;
 	} else {
 		if (dtd.part2.dtd_flags & DTD_FLAG_HSYNC_POSITIVE)
@@ -1813,8 +1815,9 @@ static void intel_enable_sdvo(struct intel_encoder *encoder,
 	 * a given it the status is a success, we succeeded.
 	 */
 	if (success && !input1) {
-		DRM_DEBUG_KMS("First %s output reported failure to "
-				"sync\n", SDVO_NAME(intel_sdvo));
+		drm_dbg_kms(&dev_priv->drm,
+			    "First %s output reported failure to "
+			    "sync\n", SDVO_NAME(intel_sdvo));
 	}
 
 	if (0)
@@ -2226,8 +2229,8 @@ static void intel_sdvo_get_lvds_modes(struct drm_connector *connector)
 	struct drm_i915_private *dev_priv = to_i915(connector->dev);
 	struct drm_display_mode *newmode;
 
-	DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n",
-		      connector->base.id, connector->name);
+	drm_dbg_kms(&dev_priv->drm, "[CONNECTOR:%d:%s]\n",
+		    connector->base.id, connector->name);
 
 	/*
 	 * Fetch modes from VBT. For SDVO prefer the VBT mode since some
@@ -3276,8 +3279,9 @@ bool intel_sdvo_init(struct drm_i915_private *dev_priv,
 		u8 byte;
 
 		if (!intel_sdvo_read_byte(intel_sdvo, i, &byte)) {
-			DRM_DEBUG_KMS("No SDVO device found on %s\n",
-				      SDVO_NAME(intel_sdvo));
+			drm_dbg_kms(&dev_priv->drm,
+				    "No SDVO device found on %s\n",
+				    SDVO_NAME(intel_sdvo));
 			goto err;
 		}
 	}
@@ -3300,8 +3304,9 @@ bool intel_sdvo_init(struct drm_i915_private *dev_priv,
 
 	if (intel_sdvo_output_setup(intel_sdvo,
 				    intel_sdvo->caps.output_flags) != true) {
-		DRM_DEBUG_KMS("SDVO output failed to setup on %s\n",
-			      SDVO_NAME(intel_sdvo));
+		drm_dbg_kms(&dev_priv->drm,
+			    "SDVO output failed to setup on %s\n",
+			    SDVO_NAME(intel_sdvo));
 		/* Output_setup can leave behind connectors! */
 		goto err_output;
 	}
@@ -3338,7 +3343,7 @@ bool intel_sdvo_init(struct drm_i915_private *dev_priv,
 						    &intel_sdvo->pixel_clock_max))
 		goto err_output;
 
-	DRM_DEBUG_KMS("%s device VID/DID: %02X:%02X.%02X, "
+	drm_dbg_kms(&dev_priv->drm, "%s device VID/DID: %02X:%02X.%02X, "
 			"clock range %dMHz - %dMHz, "
 			"input 1: %c, input 2: %c, "
 			"output 1: %c, output 2: %c\n",
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
