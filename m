Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F04A2DE16
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 14:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD0710E320;
	Sun,  9 Feb 2025 13:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="srByxz9T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B201310E330
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 13:41:25 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5450cf3ef63so31108e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Feb 2025 05:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739108484; x=1739713284; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TXvHeC1Yf2GuOiuplAspcKQmKn7+kgoDshB/4Jadi1Q=;
 b=srByxz9TaFqRrOt4UDKziGNq9Sy/FWg4QNtGpmFR1d11VOglrfX3i4JlCcvk/s4DYp
 iNXGgyDucPYLioGZP5sZfplkjl6FV4VG3Jf2f/tr6Qj6n2euYJn84ZgRqYaRbqhHrt3k
 8hvcgUDPcYc4JFCQBuLbvqU/hfuYoHAAOoGbwtOYS3aiGrUTGfRZoW+n7Hvaq1gDxKC8
 SwxaTR0qcMqZ/b5N/P9TSm/7RRzLIs8H2xuUX8MYYy6uhZl5EXMEZ13ENCaGzAzPfDhg
 cUlPX2l6CiPwFoKlLk+FlmHsp8iukidpVQiq+LWbRlRWbTBNSrSdJ21ZQJDbh3lLs4eJ
 hY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739108484; x=1739713284;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TXvHeC1Yf2GuOiuplAspcKQmKn7+kgoDshB/4Jadi1Q=;
 b=O2syniiSvZ+09/ES1qNA1xjJBUlvHaCLj7lCMZsJs9nXoVmND4jkG0KLYktUKRn5sc
 YjO/bWeqM9MtQpFaEpX9BLsa9ISu36HbwbDfYBlD2QxSLM/jvop2lrSk3zmXVTrWmXKl
 XN2gou57qR5sEOIw8mo69faykEWckoch05Ec5706eO2loYf5fbfFBrrAI8cynTNyBXgr
 9TyTgNP/dBoXlgk9sHFvwdC8x+kzRFNPnGwJb7LtrAOtn7XroryYNPbbgdiE25DKYYNH
 2RtsMklW+g2o4zs9xtixgBGGi2WRE8+2fxgENAHjRvhmrl+xKJo93CeYCybNK9P0roI2
 owVA==
X-Gm-Message-State: AOJu0YzmH33gzU1KS5/M9vrg9niELNqNjOLxbWUyV1DSxq/yT4zdl9JT
 AsjpuOoGINueGBr7TBR7sq3TcJvCUp3YK0pt2FM3/F/ll2DmpFbgHGbb9zewQRU=
X-Gm-Gg: ASbGncuF25VwTlyMIDm6WZ+PbKKfro9XeLylEIrKjOSIwC3VSt9Dg+kZ/TnKKhVUk/r
 MNpqPqV+rUMqu7XrG2bTRI4dbYaOY7uOaGlqBP3RhcXHI9saa6kvEq/WDXXukgq+oBjEdNkbAwV
 1a0MD9sxhmOMKTmkSZk22lEm2sMBCsyGuqZkGvxVHQ7uh2azDKyB9qSbTXhxlxBN3svDfnpFHdA
 uDOIcO5jG4KxYnCkC6f7JR7wSD2gyKYVwRKgMQaDJgBRQMFJCAceoQdfhXcBQ1pN6OnT3hY3giT
 rrm6GSyHYNdvHzBOGhtGZrE=
X-Google-Smtp-Source: AGHT+IFfWR4dVE7Cp59mLMpuwlAs8llhkbly9sjeAkaRfVljjLw1MFuB0NCAsLP3fdi6iyWTdSlnGQ==
X-Received: by 2002:a05:6512:3288:b0:545:5d:a5c3 with SMTP id
 2adb3069b0e04-545005da7eemr1795633e87.4.1739108483912; 
 Sun, 09 Feb 2025 05:41:23 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545069b3f77sm362914e87.63.2025.02.09.05.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2025 05:41:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 15:41:18 +0200
Subject: [PATCH v2 1/3] drm/display: bridge-connector: add DisplayPort bridges
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-dp-hdmi-audio-v2-1-16db6ebf22ff@linaro.org>
References: <20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org>
In-Reply-To: <20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Hermes Wu <Hermes.wu@ite.com.tw>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5826;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mpzXyzeB8MzX6qw01rpg9ImZYnr1dtKSgAZWq7ewrIQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqLB/MpuXYwXU8Xj/Lh0xVwrD3W64fefaVBNlZ
 JNVGPX71heJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6iwfwAKCRCLPIo+Aiko
 1ecxB/47Oce9OKy+1aFzInu1wh5qqasUXCpnLE4Z8APX+W3GlNn8p7bwQe1P3yNVdCndtot1S4s
 3TuLj2naiOr0bEZekqzjOocybKNuztrAZAaYpQJ87HbDhyF0rXQ7F9PpipsyVqD6fPhJMGd9jZi
 4A1FR0fMJuXTccfi3sKI44hcFTGIEqOkIrtPCq7xXs7PULA6H7adC/ezkC9WqVmtmDhU968w66M
 EGzmUlqS3sfBOtfmSpKbwS02w2uYW3iNYUS4jD5ntqZXpkCFr7C2M83xsrwp8wbTOWS+4l4pyl8
 PCkkfg4j6GgsgIKp806ySbNov4JdUMj9oZ4wLgK6q5gOv15j
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM HDMI Codec framework is useful not only for the HDMI bridges, but
also for the DisplayPort bridges. Add new DRM_BRIDGE_OP_DisplayPort
define in order to distinguish DP bridges. Create HDMI codec device
automatically for DP bridges which have declared audio support.

Note, unlike HDMI devices, which already have a framework to handle HPD
notifications in a standard way, DP drivers don't (yet?) have such a
framework. As such it is necessary to manually call
drm_connector_hdmi_audio_plugged_notify(). This requirement hopefully
can be lifted later on, if/when DRM framework gets better DisplayPort
ports support in the core layer.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 66 ++++++++++++++++++++------
 include/drm/drm_bridge.h                       | 14 +++++-
 2 files changed, 65 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 30c736fc0067e31a97db242e5b16ea8a5b4cf359..5e031395b801f9a1371dcb4ac09f3da23e4615dd 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -98,6 +98,13 @@ struct drm_bridge_connector {
 	 * HDMI connector infrastructure, if any (see &DRM_BRIDGE_OP_HDMI).
 	 */
 	struct drm_bridge *bridge_hdmi;
+	/**
+	 * @bridge_dp:
+	 *
+	 * The bridge in the chain that implements necessary support for the
+	 * DisplayPort connector infrastructure, if any (see &DRM_BRIDGE_OP_DisplayPort).
+	 */
+	struct drm_bridge *bridge_dp;
 };
 
 #define to_drm_bridge_connector(x) \
@@ -496,6 +503,25 @@ static const struct drm_connector_hdmi_audio_funcs drm_bridge_connector_hdmi_aud
 	.mute_stream = drm_bridge_connector_audio_mute_stream,
 };
 
+static int drm_bridge_connector_hdmi_audio_init(struct drm_connector *connector,
+						struct drm_bridge *bridge)
+{
+	if (!bridge->hdmi_audio_max_i2s_playback_channels &&
+	    !bridge->hdmi_audio_spdif_playback)
+		return 0;
+
+	if (!bridge->funcs->hdmi_audio_prepare ||
+	    !bridge->funcs->hdmi_audio_shutdown)
+		return -EINVAL;
+
+	return drm_connector_hdmi_audio_init(connector,
+					     bridge->hdmi_audio_dev,
+					     &drm_bridge_connector_hdmi_audio_funcs,
+					     bridge->hdmi_audio_max_i2s_playback_channels,
+					     bridge->hdmi_audio_spdif_playback,
+					     bridge->hdmi_audio_dai_port);
+}
+
 /* -----------------------------------------------------------------------------
  * Bridge Connector Initialisation
  */
@@ -564,6 +590,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
 			if (bridge_connector->bridge_hdmi)
 				return ERR_PTR(-EBUSY);
+			if (bridge_connector->bridge_dp)
+				return ERR_PTR(-EINVAL);
 			if (!bridge->funcs->hdmi_write_infoframe ||
 			    !bridge->funcs->hdmi_clear_infoframe)
 				return ERR_PTR(-EINVAL);
@@ -576,6 +604,16 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 				max_bpc = bridge->max_bpc;
 		}
 
+		if (bridge->ops & DRM_BRIDGE_OP_DisplayPort) {
+			if (bridge_connector->bridge_dp)
+				return ERR_PTR(-EBUSY);
+			if (bridge_connector->bridge_hdmi)
+				return ERR_PTR(-EINVAL);
+
+			bridge_connector->bridge_dp = bridge;
+
+		}
+
 		if (!drm_bridge_get_next_bridge(bridge))
 			connector_type = bridge->type;
 
@@ -612,21 +650,21 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (ret)
 			return ERR_PTR(ret);
 
-		if (bridge->hdmi_audio_max_i2s_playback_channels ||
-		    bridge->hdmi_audio_spdif_playback) {
-			if (!bridge->funcs->hdmi_audio_prepare ||
-			    !bridge->funcs->hdmi_audio_shutdown)
-				return ERR_PTR(-EINVAL);
+		ret = drm_bridge_connector_hdmi_audio_init(connector, bridge);
+		if (ret)
+			return ERR_PTR(ret);
+	} else if (bridge_connector->bridge_dp) {
+		bridge = bridge_connector->bridge_dp;
 
-			ret = drm_connector_hdmi_audio_init(connector,
-							    bridge->hdmi_audio_dev,
-							    &drm_bridge_connector_hdmi_audio_funcs,
-							    bridge->hdmi_audio_max_i2s_playback_channels,
-							    bridge->hdmi_audio_spdif_playback,
-							    bridge->hdmi_audio_dai_port);
-			if (ret)
-				return ERR_PTR(ret);
-		}
+		ret = drmm_connector_init(drm, connector,
+					  &drm_bridge_connector_funcs,
+					  connector_type, ddc);
+		if (ret)
+			return ERR_PTR(ret);
+
+		ret = drm_bridge_connector_hdmi_audio_init(connector, bridge);
+		if (ret)
+			return ERR_PTR(ret);
 	} else {
 		ret = drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 496dbbd2ad7edff7f091adfbe62de1e33ef0cf07..40f37444426b1b8ded25da9ba9e2963f18ad6267 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -811,9 +811,21 @@ enum drm_bridge_ops {
 	 *
 	 * Note: currently there can be at most one bridge in a chain that sets
 	 * this bit. This is to simplify corresponding glue code in connector
-	 * drivers.
+	 * drivers. Having both HDMI and DisplayPort bridges in the same bridge
+	 * chain is also not allowed.
 	 */
 	DRM_BRIDGE_OP_HDMI = BIT(4),
+	/**
+	 * @DRM_BRIDGE_OP_DisplayPort: The bridge provides DisplayPort connector
+	 * operations. Currently this is limited to the optional HDMI codec
+	 * support.
+	 *
+	 * Note: currently there can be at most one bridge in a chain that sets
+	 * this bit. This is to simplify corresponding glue code in connector
+	 * drivers. Having both HDMI and DisplayPort bridges in the same bridge
+	 * chain is also not allowed.
+	 */
+	DRM_BRIDGE_OP_DisplayPort = BIT(5),
 };
 
 /**

-- 
2.39.5

