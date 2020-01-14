Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C28E13BAE9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 09:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73EAB6E88F;
	Wed, 15 Jan 2020 08:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2944D6E340;
 Tue, 14 Jan 2020 09:52:00 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u2so12892490wmc.3;
 Tue, 14 Jan 2020 01:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oGCRMtpxsQTKc5jGXY1VKdqCq6KYKB9/6saFjdzjIgw=;
 b=NiruZ9v0558r3PrgUmWWg1qKFHZIHjXWlJ3cOKmj9t79ALpc7S2ajGQuOGi9K9KCNy
 Z4t5zOY9xDKdbKKhJxwf4kWsZyq3y0G0pZKra3koIdvC+nJFl9nnFCyCRtOtJZOf9xfx
 +0gPUwyQtXzusRyyEh2SdiVZtrYOEW0vGYl9K6TGyxTpUKRchvBgsx6gT3SRF1Bzte4X
 EvesZT+ZmleWirN4gDS5kfaE7exklRUGzdGnTTDlKj1ct41HabzohTeL0Im/0rqF3+cT
 JWGBwPT0iUKHQ2dcgrAEL1T0caTZKGuIJFoayG3u2aOTNhjPJNLT7i5r+BZWI/vHmbcp
 k3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oGCRMtpxsQTKc5jGXY1VKdqCq6KYKB9/6saFjdzjIgw=;
 b=HpjOqIBh9h5sJGksYhdKOWHxieTH3LapiQEOVi5/wMK7v7M6eKGQ4+OdOn4FtV7bOD
 AVRoMcnwqtuCIWvnB2GtL3Bw2DASpXsHHxFqEYRO0mDhVvIXPNVGoAolLjVqSndx0/pT
 +td0YlS9PT3pbfPdqGVjeaaT36Yn0q5sY1QZxQTuwm2gNnAP1/NOceHNLKOQandeDZbb
 sXHIOMCDGP3fWheKDvNvIuTj6JCW7sxmLU+aiVtlRACg8/c4jiou5cHkV4xaPr/y+jwN
 NW2j6W1bz/hbb5Q70PsQWOUtHALmukA3+D09RSifdNqmnf2jo3v4Qqj0n/jIqojDHCQJ
 Gawg==
X-Gm-Message-State: APjAAAUfMLbwTkmOzUHjIHljNUDMq4/OSELVP2B7QIuSmAzXSe3C9O4X
 r09509mkCv6kXuTDnP2Lm7Y=
X-Google-Smtp-Source: APXvYqxVjpTxGR/JXpEr24pPGZwen4xi3m0jXUXU4ZkQpxT+HnYzHhyLLBYVbC5Lhq+vVo72sHKcoQ==
X-Received: by 2002:a1c:6585:: with SMTP id
 z127mr25651197wmb.113.1578995518760; 
 Tue, 14 Jan 2020 01:51:58 -0800 (PST)
Received: from localhost.localdomain ([154.70.37.104])
 by smtp.googlemail.com with ESMTPSA id y20sm17454881wmi.25.2020.01.14.01.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 01:51:58 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 2/5] drm/i915/audio: convert to new drm logging macros.
Date: Tue, 14 Jan 2020 12:51:04 +0300
Message-Id: <20200114095107.21197-3-wambui.karugax@gmail.com>
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

Converts the printk based logging macros in i915/display/intel_audio.c
to the struct drm_device based logging macros.
This transformation was achieved using the following coccinelle script
that matches the existence of the struct drm_i915_private device:

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

Checkpatch warnings were manually fixed.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_audio.c | 71 ++++++++++++----------
 1 file changed, 40 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index e406719a6716..57208440bf6d 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -315,7 +315,7 @@ static void g4x_audio_codec_disable(struct intel_encoder *encoder,
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
 	u32 eldv, tmp;
 
-	DRM_DEBUG_KMS("Disable audio codec\n");
+	drm_dbg_kms(&dev_priv->drm, "Disable audio codec\n");
 
 	tmp = I915_READ(G4X_AUD_VID_DID);
 	if (tmp == INTEL_AUDIO_DEVBLC || tmp == INTEL_AUDIO_DEVCL)
@@ -340,7 +340,8 @@ static void g4x_audio_codec_enable(struct intel_encoder *encoder,
 	u32 tmp;
 	int len, i;
 
-	DRM_DEBUG_KMS("Enable audio codec, %u bytes ELD\n", drm_eld_size(eld));
+	drm_dbg_kms(&dev_priv->drm, "Enable audio codec, %u bytes ELD\n",
+		    drm_eld_size(eld));
 
 	tmp = I915_READ(G4X_AUD_VID_DID);
 	if (tmp == INTEL_AUDIO_DEVBLC || tmp == INTEL_AUDIO_DEVCL)
@@ -360,7 +361,7 @@ static void g4x_audio_codec_enable(struct intel_encoder *encoder,
 	I915_WRITE(G4X_AUD_CNTL_ST, tmp);
 
 	len = min(drm_eld_size(eld) / 4, len);
-	DRM_DEBUG_DRIVER("ELD size %d\n", len);
+	drm_dbg(&dev_priv->drm, "ELD size %d\n", len);
 	for (i = 0; i < len; i++)
 		I915_WRITE(G4X_HDMIW_HDMIEDID, *((const u32 *)eld + i));
 
@@ -384,9 +385,10 @@ hsw_dp_audio_config_update(struct intel_encoder *encoder,
 	rate = acomp ? acomp->aud_sample_rate[port] : 0;
 	nm = audio_config_dp_get_n_m(crtc_state, rate);
 	if (nm)
-		DRM_DEBUG_KMS("using Maud %u, Naud %u\n", nm->m, nm->n);
+		drm_dbg_kms(&dev_priv->drm, "using Maud %u, Naud %u\n", nm->m,
+			    nm->n);
 	else
-		DRM_DEBUG_KMS("using automatic Maud, Naud\n");
+		drm_dbg_kms(&dev_priv->drm, "using automatic Maud, Naud\n");
 
 	tmp = I915_READ(HSW_AUD_CFG(cpu_transcoder));
 	tmp &= ~AUD_CONFIG_N_VALUE_INDEX;
@@ -437,13 +439,13 @@ hsw_hdmi_audio_config_update(struct intel_encoder *encoder,
 
 	n = audio_config_hdmi_get_n(crtc_state, rate);
 	if (n != 0) {
-		DRM_DEBUG_KMS("using N %d\n", n);
+		drm_dbg_kms(&dev_priv->drm, "using N %d\n", n);
 
 		tmp &= ~AUD_CONFIG_N_MASK;
 		tmp |= AUD_CONFIG_N(n);
 		tmp |= AUD_CONFIG_N_PROG_ENABLE;
 	} else {
-		DRM_DEBUG_KMS("using automatic N\n");
+		drm_dbg_kms(&dev_priv->drm, "using automatic N\n");
 	}
 
 	I915_WRITE(HSW_AUD_CFG(cpu_transcoder), tmp);
@@ -476,8 +478,8 @@ static void hsw_audio_codec_disable(struct intel_encoder *encoder,
 	enum transcoder cpu_transcoder = old_crtc_state->cpu_transcoder;
 	u32 tmp;
 
-	DRM_DEBUG_KMS("Disable audio codec on transcoder %s\n",
-		      transcoder_name(cpu_transcoder));
+	drm_dbg_kms(&dev_priv->drm, "Disable audio codec on transcoder %s\n",
+		    transcoder_name(cpu_transcoder));
 
 	mutex_lock(&dev_priv->av_mutex);
 
@@ -511,8 +513,9 @@ static void hsw_audio_codec_enable(struct intel_encoder *encoder,
 	u32 tmp;
 	int len, i;
 
-	DRM_DEBUG_KMS("Enable audio codec on transcoder %s, %u bytes ELD\n",
-		      transcoder_name(cpu_transcoder), drm_eld_size(eld));
+	drm_dbg_kms(&dev_priv->drm,
+		    "Enable audio codec on transcoder %s, %u bytes ELD\n",
+		     transcoder_name(cpu_transcoder), drm_eld_size(eld));
 
 	mutex_lock(&dev_priv->av_mutex);
 
@@ -561,9 +564,10 @@ static void ilk_audio_codec_disable(struct intel_encoder *encoder,
 	u32 tmp, eldv;
 	i915_reg_t aud_config, aud_cntrl_st2;
 
-	DRM_DEBUG_KMS("Disable audio codec on [ENCODER:%d:%s], pipe %c\n",
-		      encoder->base.base.id, encoder->base.name,
-		      pipe_name(pipe));
+	drm_dbg_kms(&dev_priv->drm,
+		    "Disable audio codec on [ENCODER:%d:%s], pipe %c\n",
+		     encoder->base.base.id, encoder->base.name,
+		     pipe_name(pipe));
 
 	if (WARN_ON(port == PORT_A))
 		return;
@@ -611,9 +615,10 @@ static void ilk_audio_codec_enable(struct intel_encoder *encoder,
 	int len, i;
 	i915_reg_t hdmiw_hdmiedid, aud_config, aud_cntl_st, aud_cntrl_st2;
 
-	DRM_DEBUG_KMS("Enable audio codec on [ENCODER:%d:%s], pipe %c, %u bytes ELD\n",
-		      encoder->base.base.id, encoder->base.name,
-		      pipe_name(pipe), drm_eld_size(eld));
+	drm_dbg_kms(&dev_priv->drm,
+		    "Enable audio codec on [ENCODER:%d:%s], pipe %c, %u bytes ELD\n",
+		    encoder->base.base.id, encoder->base.name,
+		    pipe_name(pipe), drm_eld_size(eld));
 
 	if (WARN_ON(port == PORT_A))
 		return;
@@ -701,14 +706,13 @@ void intel_audio_codec_enable(struct intel_encoder *encoder,
 
 	/* FIXME precompute the ELD in .compute_config() */
 	if (!connector->eld[0])
-		DRM_DEBUG_KMS("Bogus ELD on [CONNECTOR:%d:%s]\n",
-			      connector->base.id, connector->name);
+		drm_dbg_kms(&dev_priv->drm,
+			    "Bogus ELD on [CONNECTOR:%d:%s]\n",
+			    connector->base.id, connector->name);
 
-	DRM_DEBUG_DRIVER("ELD on [CONNECTOR:%d:%s], [ENCODER:%d:%s]\n",
-			 connector->base.id,
-			 connector->name,
-			 connector->encoder->base.id,
-			 connector->encoder->name);
+	drm_dbg(&dev_priv->drm, "ELD on [CONNECTOR:%d:%s], [ENCODER:%d:%s]\n",
+		connector->base.id, connector->name,
+		connector->encoder->base.id, connector->encoder->name);
 
 	connector->eld[6] = drm_av_sync_delay(connector, adjusted_mode) / 2;
 
@@ -851,8 +855,9 @@ static unsigned long i915_audio_component_get_power(struct device *kdev)
 	if (dev_priv->audio_power_refcount++ == 0) {
 		if (IS_TIGERLAKE(dev_priv) || IS_ICELAKE(dev_priv)) {
 			I915_WRITE(AUD_FREQ_CNTRL, dev_priv->audio_freq_cntrl);
-			DRM_DEBUG_KMS("restored AUD_FREQ_CNTRL to 0x%x\n",
-				      dev_priv->audio_freq_cntrl);
+			drm_dbg_kms(&dev_priv->drm,
+				    "restored AUD_FREQ_CNTRL to 0x%x\n",
+				    dev_priv->audio_freq_cntrl);
 		}
 
 		/* Force CDCLK to 2*BCLK as long as we need audio powered. */
@@ -992,7 +997,8 @@ static int i915_audio_component_sync_audio_rate(struct device *kdev, int port,
 	/* 1. get the pipe */
 	encoder = get_saved_enc(dev_priv, port, pipe);
 	if (!encoder || !encoder->base.crtc) {
-		DRM_DEBUG_KMS("Not valid for port %c\n", port_name(port));
+		drm_dbg_kms(&dev_priv->drm, "Not valid for port %c\n",
+			    port_name(port));
 		err = -ENODEV;
 		goto unlock;
 	}
@@ -1023,7 +1029,8 @@ static int i915_audio_component_get_eld(struct device *kdev, int port,
 
 	intel_encoder = get_saved_enc(dev_priv, port, pipe);
 	if (!intel_encoder) {
-		DRM_DEBUG_KMS("Not valid for port %c\n", port_name(port));
+		drm_dbg_kms(&dev_priv->drm, "Not valid for port %c\n",
+			    port_name(port));
 		mutex_unlock(&dev_priv->av_mutex);
 		return ret;
 	}
@@ -1119,15 +1126,17 @@ static void i915_audio_component_init(struct drm_i915_private *dev_priv)
 				  &i915_audio_component_bind_ops,
 				  I915_COMPONENT_AUDIO);
 	if (ret < 0) {
-		DRM_ERROR("failed to add audio component (%d)\n", ret);
+		drm_err(&dev_priv->drm,
+			"failed to add audio component (%d)\n", ret);
 		/* continue with reduced functionality */
 		return;
 	}
 
 	if (IS_TIGERLAKE(dev_priv) || IS_ICELAKE(dev_priv)) {
 		dev_priv->audio_freq_cntrl = I915_READ(AUD_FREQ_CNTRL);
-		DRM_DEBUG_KMS("init value of AUD_FREQ_CNTRL of 0x%x\n",
-			      dev_priv->audio_freq_cntrl);
+		drm_dbg_kms(&dev_priv->drm,
+			    "init value of AUD_FREQ_CNTRL of 0x%x\n",
+			    dev_priv->audio_freq_cntrl);
 	}
 
 	dev_priv->audio_component_registered = true;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
