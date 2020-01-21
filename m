Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E9E144D52
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820036F3E7;
	Wed, 22 Jan 2020 08:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC066ECF3;
 Tue, 21 Jan 2020 13:46:19 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id q10so3219582wrm.11;
 Tue, 21 Jan 2020 05:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=UNIcTSL4XEYB4rRpiPWbAJiWakZAf5Lw7/x5ajm6wos=;
 b=H7O0mrJB57sX+g3i8xUr4dROM2iOxSgMZU6SB26dvgq3LBlFS6uFTig0xieZY6PezR
 xGN2I/24A0TAhM32wUTYvC6KqYgkEnNzNXLTSo7KadkHk5aK9Tm/ZO+m69s/HS4/JSrJ
 G40kauF/2E1SriQzLecFtSLl7XZTX/wTkcV+rfcLvlpJL4EK+JVD9RASPEN93MpSaiN9
 tfw8YWiq6NBp5r2g+Kr56ZfH+zAXvEnCGD4kmTsYsIlNkPsFEAJGeXQC4vCgazGxNVQZ
 0JVTDesZUolGgCXJV0crK9LMIZK1N32ZgY61Q1pzt1cMmcdXQM0S1eJN9VjsLZGe5U98
 SkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=UNIcTSL4XEYB4rRpiPWbAJiWakZAf5Lw7/x5ajm6wos=;
 b=T9KsaOC0a9u+5IwIbygm3ayK4McO6UaxcjR4jCnssFGje8AjAR7DSSbB7bXH3A6PVk
 eBJeXLMgzecnDdubM5y0ZcUff5ewOIOZJgydtGyo03OrqHHJaJlM1ffT6omwu8UGUwvP
 i1LKYI0PLX39okLiphHvflwQUC0cabyXQgu7i2vwk14iVqD4i8AhO7stxJVNNUadgFOV
 fYwUE+3hYBpSPS1c0z2Vp3fXsQa1GFMI3dVttaS66QJ1gOhUSTymyCIVDVv3VlcLdLIT
 p+c6+SE0epk0b4CHUPYy3mEF4gpbqUm6PknT2JyyzCN7AU5m256Udz5ob/51dDXzPn3X
 XZgQ==
X-Gm-Message-State: APjAAAWE77e+XLZO8pHJAHauhdOShkfzkQCW6uoLr0WLIBA5me0hexmz
 pGqQME4VNwFnY2kZSv7cDjI=
X-Google-Smtp-Source: APXvYqwaYDPCll6qkPGbAYDWdpBdXRMHJY9h6+3/zKMS3/YJSv4Sw6UbqDIc0y5JMmHYzYXs0SiKWg==
X-Received: by 2002:adf:97d6:: with SMTP id t22mr5232404wrb.407.1579614377824; 
 Tue, 21 Jan 2020 05:46:17 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id x17sm51590093wrt.74.2020.01.21.05.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 05:46:17 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] drm/i915/audio: convert to struct drm_device logging
 macros.
Date: Tue, 21 Jan 2020 16:45:57 +0300
Message-Id: <20200121134559.17355-4-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200121134559.17355-1-wambui.karugax@gmail.com>
References: <20200121134559.17355-1-wambui.karugax@gmail.com>
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
MIME-Version: 1.0
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
 drivers/gpu/drm/i915/display/intel_audio.c | 73 +++++++++++++---------
 1 file changed, 42 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index b18040793d9e..f9f4460136b0 100644
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
@@ -701,14 +706,15 @@ void intel_audio_codec_enable(struct intel_encoder *encoder,
 
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
-			 encoder->base.base.id,
-			 encoder->base.name);
+	drm_dbg(&dev_priv->drm, "ELD on [CONNECTOR:%d:%s], [ENCODER:%d:%s]\n",
+		connector->base.id,
+		connector->name,
+		encoder->base.base.id,
+		encoder->base.name);
 
 	connector->eld[6] = drm_av_sync_delay(connector, adjusted_mode) / 2;
 
@@ -851,8 +857,9 @@ static unsigned long i915_audio_component_get_power(struct device *kdev)
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
@@ -992,7 +999,8 @@ static int i915_audio_component_sync_audio_rate(struct device *kdev, int port,
 	/* 1. get the pipe */
 	encoder = get_saved_enc(dev_priv, port, pipe);
 	if (!encoder || !encoder->base.crtc) {
-		DRM_DEBUG_KMS("Not valid for port %c\n", port_name(port));
+		drm_dbg_kms(&dev_priv->drm, "Not valid for port %c\n",
+			    port_name(port));
 		err = -ENODEV;
 		goto unlock;
 	}
@@ -1023,7 +1031,8 @@ static int i915_audio_component_get_eld(struct device *kdev, int port,
 
 	intel_encoder = get_saved_enc(dev_priv, port, pipe);
 	if (!intel_encoder) {
-		DRM_DEBUG_KMS("Not valid for port %c\n", port_name(port));
+		drm_dbg_kms(&dev_priv->drm, "Not valid for port %c\n",
+			    port_name(port));
 		mutex_unlock(&dev_priv->av_mutex);
 		return ret;
 	}
@@ -1119,15 +1128,17 @@ static void i915_audio_component_init(struct drm_i915_private *dev_priv)
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
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
