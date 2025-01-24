Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C0BA1BE1F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 22:50:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2582210EA2A;
	Fri, 24 Jan 2025 21:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vwlIyL88";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8929F10EA31
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 21:48:01 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-54287a3ba3cso3413379e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 13:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737755280; x=1738360080; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jaIXZ620c8SPNqR/EOcjeZxHQVhRhL3PSxW+/q8xH8Y=;
 b=vwlIyL88hD9iqeex3E//9lGpdTnY3o0S4Y6Km1zz6MIAonOd0n45+EBoZUa8aCP2s2
 eptwcuI1wUMQvc2Eum1yxIFrdtQ3c+WFoMUQYXOy4RXMaoC5SULnGH/4zjxT9eYqZgZB
 7b4/73S/eFZTZNYFOsbNIG9GVReFNSXj6+lEesJr8zo2GXU0SMwHF29UW8cgoq0eDpxi
 ZjCZi2snTCXHuq4m2gNAv/CKWwGONicGHWtVI/VdY1DbCClkE/2i6CrQbe064IuPhHgG
 CvRlKPc5GAaGfbjWqRzMeSUe2zRAJrpVnE38M8CeSjZR/OpIMOtic2NCifYdVzgy2GjI
 ibGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737755280; x=1738360080;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jaIXZ620c8SPNqR/EOcjeZxHQVhRhL3PSxW+/q8xH8Y=;
 b=DoNzrZP4DXfHo1Gkz5Ru2b+Ii6jxIU1EW6zlJ0/QsF4udOr6Vi7VOT0LV2E4tihanr
 KirfU55UGPfwgu3eBzd8SD/MAd5eX20SGwXG+YhWxpttpDa5QkYNucKBGPXT562whVT2
 ++wGa3qgF1rnpaz3sY2ciy0znOpxx2mgBcT+NGS/dXYMCPLSNbD+bWb41q9o9fCUGEx/
 Wy4Pe3cbrE7+0NbvhVn9YSRHnE55UR8IlLOThyUv/H/lXHIpLwqt6T8EA4KzyrjeXVh5
 IUV3ly0QkSOU/G4AwZWgRluCKDmWIwNWpu7NXvho8GKSZCdSVW6XehwJX7Rwar02JjZy
 xCTA==
X-Gm-Message-State: AOJu0YyD2X3Akthk3zNURnHgz2e7K8rZzGv0OLAcLH0/OjNifP/J8mj7
 Jo59cmn7PRJnxFZftnbnZuvK4txbbczuj9AY2FMXHhnVF2YmieV3HIMYm9X1+mI=
X-Gm-Gg: ASbGncvqc7YV5SK1QiWt3NEYOfwlBEJ5kSFzdBHq0rsXZz9psnLCHQ85LYJ0RkfkMxF
 qZGL8eoXldq1lLskyTlGdKLCn8mCJOh/oH3rg9QeAgyLZzIiSbT55+qaZDTDFl5R8FJalOe58Xb
 2MRlZmfET3ilD0GwtfBer6JVakRnpF0/+9SQ7/I+0wsC2rZG9fOGq8R9V7A6SdUwhQSMHfFuZcv
 O3wfmVuCS/uGAjrsoJZrzS+8dGDxklb+MFAu/rquYk2dRDMH+48MozYagH0ii4Xyw4NDjwsOJp3
 SRw4wou9MWiK
X-Google-Smtp-Source: AGHT+IEmwBFQTTopeGcaCwwyWTXN2DhizvSViHjXm/kfxIMxd8HWEBRaoukAypMxXebY6h/olO6r+g==
X-Received: by 2002:a05:6512:3d0b:b0:542:21f8:d6bd with SMTP id
 2adb3069b0e04-543c7dab41fmr1968649e87.22.1737755279688; 
 Fri, 24 Jan 2025 13:47:59 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8237491sm425014e87.104.2025.01.24.13.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 13:47:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 23:47:47 +0200
Subject: [PATCH v6 7/7] drm/msm/hdmi: use DRM HDMI Audio framework
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-bridge-hdmi-connector-v6-7-1592632327f7@linaro.org>
References: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
In-Reply-To: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9947;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=6A5aCLP00sWata8KRfqPQ5CnVO9JUTbJd1uu3Qp6jAs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnlAqAxeZ6YSaN8+dfdt7IoI//rQ2ZAxV9zfeRs
 UpqIcCteOyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5QKgAAKCRCLPIo+Aiko
 1QwVB/9dMKxRddY8I5MDYek73fiBn9x3ZEFQd0JfxtaRF/VgkVHFrFKbjIrBV+z1Rg2KAwJNxy4
 7QYFARie061bIx6cVjcWiIamSx3+K8lUJxIz4ceJO8tmTEx2Lj+HtskYjna5a3REaCPH7xAhKiY
 t3thqpF2kD1adjT8v1Cxl5Tn6ld9iX0f7P5Wk2WitB+G6z56ydKEGGddvPcyNMLK+/mKEppRwQ7
 otiWSqZYHnN8FUB1ojTJ0Knm71zxHNShGEmpawiJX5sOuz8SBN56hYcDE2lA6l48Ly23yP3Qemv
 RuQ062QkO9/3LHRtlXxXyCjt4gvBBtbLOAVO/dPK2ozlU2oC
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

In order to simplify the driver even further and to remove the
boilerplate code, rewrite the audio interface to use the DRM HDMI Audio
framework.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        | 91 ----------------------------------
 drivers/gpu/drm/msm/hdmi/hdmi.h        | 20 ++++----
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c  | 75 +++++++++++++++++++++++-----
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  5 ++
 4 files changed, 76 insertions(+), 115 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 6b77e0fb8d5ec218dfbf58215e2e12ad1dfb1b85..248541ff449204c72cd444458dadb9ae4a0a53d1 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -14,7 +14,6 @@
 #include <drm/drm_of.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
-#include <sound/hdmi-codec.h>
 #include "hdmi.h"
 
 void msm_hdmi_set_mode(struct hdmi *hdmi, bool power_on)
@@ -245,87 +244,6 @@ static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		.hpd_freq      = hpd_clk_freq_8x74,
 };
 
-/*
- * HDMI audio codec callbacks
- */
-static int msm_hdmi_audio_hw_params(struct device *dev, void *data,
-				    struct hdmi_codec_daifmt *daifmt,
-				    struct hdmi_codec_params *params)
-{
-	struct hdmi *hdmi = dev_get_drvdata(dev);
-	unsigned int rate;
-	int ret;
-
-	DRM_DEV_DEBUG(dev, "%u Hz, %d bit, %d channels\n", params->sample_rate,
-		 params->sample_width, params->cea.channels);
-
-	switch (params->sample_rate) {
-	case 32000:
-		rate = HDMI_SAMPLE_RATE_32KHZ;
-		break;
-	case 44100:
-		rate = HDMI_SAMPLE_RATE_44_1KHZ;
-		break;
-	case 48000:
-		rate = HDMI_SAMPLE_RATE_48KHZ;
-		break;
-	case 88200:
-		rate = HDMI_SAMPLE_RATE_88_2KHZ;
-		break;
-	case 96000:
-		rate = HDMI_SAMPLE_RATE_96KHZ;
-		break;
-	case 176400:
-		rate = HDMI_SAMPLE_RATE_176_4KHZ;
-		break;
-	case 192000:
-		rate = HDMI_SAMPLE_RATE_192KHZ;
-		break;
-	default:
-		DRM_DEV_ERROR(dev, "rate[%d] not supported!\n",
-			params->sample_rate);
-		return -EINVAL;
-	}
-
-	ret = drm_atomic_helper_connector_hdmi_update_audio_infoframe(hdmi->connector,
-								      &params->cea);
-	if (ret)
-		return ret;
-
-	msm_hdmi_audio_info_setup(hdmi, rate, params->cea.channels);
-
-	return 0;
-}
-
-static void msm_hdmi_audio_shutdown(struct device *dev, void *data)
-{
-	struct hdmi *hdmi = dev_get_drvdata(dev);
-
-	drm_atomic_helper_connector_hdmi_clear_audio_infoframe(hdmi->connector);
-	msm_hdmi_audio_disable(hdmi);
-}
-
-static const struct hdmi_codec_ops msm_hdmi_audio_codec_ops = {
-	.hw_params = msm_hdmi_audio_hw_params,
-	.audio_shutdown = msm_hdmi_audio_shutdown,
-};
-
-static struct hdmi_codec_pdata codec_data = {
-	.ops = &msm_hdmi_audio_codec_ops,
-	.max_i2s_channels = 8,
-	.i2s = 1,
-};
-
-static int msm_hdmi_register_audio_driver(struct hdmi *hdmi, struct device *dev)
-{
-	hdmi->audio_pdev = platform_device_register_data(dev,
-							 HDMI_CODEC_DRV_NAME,
-							 PLATFORM_DEVID_AUTO,
-							 &codec_data,
-							 sizeof(codec_data));
-	return PTR_ERR_OR_ZERO(hdmi->audio_pdev);
-}
-
 static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct msm_drm_private *priv = dev_get_drvdata(master);
@@ -337,12 +255,6 @@ static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
 		return err;
 	priv->hdmi = hdmi;
 
-	err = msm_hdmi_register_audio_driver(hdmi, dev);
-	if (err) {
-		DRM_ERROR("Failed to attach an audio codec %d\n", err);
-		hdmi->audio_pdev = NULL;
-	}
-
 	return 0;
 }
 
@@ -352,9 +264,6 @@ static void msm_hdmi_unbind(struct device *dev, struct device *master,
 	struct msm_drm_private *priv = dev_get_drvdata(master);
 
 	if (priv->hdmi) {
-		if (priv->hdmi->audio_pdev)
-			platform_device_unregister(priv->hdmi->audio_pdev);
-
 		if (priv->hdmi->bridge)
 			msm_hdmi_hpd_disable(priv->hdmi);
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index ab169b77377097dc22c0c718f65024cb8ad1d317..88a41be7c6fc2f878a1c372a0c75b3277f24f893 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -33,7 +33,6 @@ struct hdmi_hdcp_ctrl;
 struct hdmi {
 	struct drm_device *dev;
 	struct platform_device *pdev;
-	struct platform_device *audio_pdev;
 
 	const struct hdmi_platform_config *config;
 
@@ -205,16 +204,15 @@ static inline int msm_hdmi_pll_8998_init(struct platform_device *pdev)
 /*
  * audio:
  */
-#define	HDMI_SAMPLE_RATE_32KHZ		0
-#define	HDMI_SAMPLE_RATE_44_1KHZ	1
-#define	HDMI_SAMPLE_RATE_48KHZ		2
-#define	HDMI_SAMPLE_RATE_88_2KHZ	3
-#define	HDMI_SAMPLE_RATE_96KHZ		4
-#define	HDMI_SAMPLE_RATE_176_4KHZ	5
-#define	HDMI_SAMPLE_RATE_192KHZ		6
-
-int msm_hdmi_audio_info_setup(struct hdmi *hdmi, int rate, int channels);
-int msm_hdmi_audio_disable(struct hdmi *hdmi);
+struct hdmi_codec_daifmt;
+struct hdmi_codec_params;
+
+int msm_hdmi_bridge_audio_prepare(struct drm_connector *connector,
+				  struct drm_bridge *bridge,
+				  struct hdmi_codec_daifmt *daifmt,
+				  struct hdmi_codec_params *params);
+void msm_hdmi_bridge_audio_shutdown(struct drm_connector *connector,
+				    struct drm_bridge *bridge);
 
 /*
  * hdmi bridge:
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_audio.c b/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
index 924654bfb48cf17feadea1c0661ee6ee4e1b4589..9c5b5310bfeb54902d7d0687909afc79e320f560 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
@@ -4,7 +4,12 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <drm/display/drm_hdmi_state_helper.h>
+
 #include <linux/hdmi.h>
+
+#include <sound/hdmi-codec.h>
+
 #include "hdmi.h"
 
 /* Supported HDMI Audio sample rates */
@@ -68,7 +73,8 @@ static const struct hdmi_msm_audio_arcs *get_arcs(unsigned long int pixclock)
 	return NULL;
 }
 
-static int msm_hdmi_audio_update(struct hdmi *hdmi)
+static int msm_hdmi_audio_update(struct hdmi *hdmi,
+				 struct drm_connector *connector)
 {
 	struct hdmi_audio *audio = &hdmi->audio;
 	const struct hdmi_msm_audio_arcs *arcs = NULL;
@@ -76,7 +82,7 @@ static int msm_hdmi_audio_update(struct hdmi *hdmi)
 	uint32_t acr_pkt_ctrl, vbi_pkt_ctrl, aud_pkt_ctrl;
 	uint32_t audio_config;
 
-	if (!hdmi->connector->display_info.is_hdmi)
+	if (!connector->display_info.is_hdmi)
 		return -EINVAL;
 
 	DBG("audio: enabled=%d, channels=%d, rate=%d",
@@ -192,29 +198,72 @@ static int msm_hdmi_audio_update(struct hdmi *hdmi)
 	return 0;
 }
 
-int msm_hdmi_audio_info_setup(struct hdmi *hdmi, int rate, int channels)
+int msm_hdmi_bridge_audio_prepare(struct drm_connector *connector,
+				  struct drm_bridge *bridge,
+				  struct hdmi_codec_daifmt *daifmt,
+				  struct hdmi_codec_params *params)
 {
-	if (!hdmi)
-		return -ENXIO;
-
-	if ((rate < 0) || (rate >= MSM_HDMI_SAMPLE_RATE_MAX))
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
+	unsigned int rate;
+	int ret;
+
+	drm_dbg_driver(bridge->dev, "%u Hz, %d bit, %d channels\n",
+		       params->sample_rate,
+		       params->sample_width,
+		       params->cea.channels);
+
+	switch (params->sample_rate) {
+	case 32000:
+		rate = MSM_HDMI_SAMPLE_RATE_32KHZ;
+		break;
+	case 44100:
+		rate = MSM_HDMI_SAMPLE_RATE_44_1KHZ;
+		break;
+	case 48000:
+		rate = MSM_HDMI_SAMPLE_RATE_48KHZ;
+		break;
+	case 88200:
+		rate = MSM_HDMI_SAMPLE_RATE_88_2KHZ;
+		break;
+	case 96000:
+		rate = MSM_HDMI_SAMPLE_RATE_96KHZ;
+		break;
+	case 176400:
+		rate = MSM_HDMI_SAMPLE_RATE_176_4KHZ;
+		break;
+	case 192000:
+		rate = MSM_HDMI_SAMPLE_RATE_192KHZ;
+		break;
+	default:
+		drm_err(bridge->dev, "rate[%d] not supported!\n",
+			params->sample_rate);
 		return -EINVAL;
+	}
+
+	ret = drm_atomic_helper_connector_hdmi_update_audio_infoframe(connector,
+								      &params->cea);
+	if (ret)
+		return ret;
 
 	hdmi->audio.rate = rate;
-	hdmi->audio.channels = channels;
+	hdmi->audio.channels = params->cea.channels;
 	hdmi->audio.enabled = true;
 
-	return msm_hdmi_audio_update(hdmi);
+	return msm_hdmi_audio_update(hdmi, connector);
 }
 
-int msm_hdmi_audio_disable(struct hdmi *hdmi)
+void msm_hdmi_bridge_audio_shutdown(struct drm_connector *connector,
+				    struct drm_bridge *bridge)
 {
-	if (!hdmi)
-		return -ENXIO;
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
+
+	drm_atomic_helper_connector_hdmi_clear_audio_infoframe(connector);
 
 	hdmi->audio.rate = 0;
 	hdmi->audio.channels = 2;
 	hdmi->audio.enabled = false;
 
-	return msm_hdmi_audio_update(hdmi);
+	msm_hdmi_audio_update(hdmi, connector);
 }
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index c31e1d33593de6480c0c2b7cb322a85e645ff332..8a1bbcf578b0749480799d9e5b2baf3778322edc 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -470,6 +470,8 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.hdmi_tmds_char_rate_valid = msm_hdmi_bridge_tmds_char_rate_valid,
 	.hdmi_clear_infoframe = msm_hdmi_bridge_clear_infoframe,
 	.hdmi_write_infoframe = msm_hdmi_bridge_write_infoframe,
+	.hdmi_audio_prepare = msm_hdmi_bridge_audio_prepare,
+	.hdmi_audio_shutdown = msm_hdmi_bridge_audio_shutdown,
 };
 
 static void
@@ -507,6 +509,9 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
 		DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_HDMI |
 		DRM_BRIDGE_OP_EDID;
+	bridge->hdmi_audio_max_i2s_playback_channels = 8;
+	bridge->hdmi_audio_dev = &hdmi->pdev->dev;
+	bridge->hdmi_audio_dai_port = -1;
 
 	ret = devm_drm_bridge_add(hdmi->dev->dev, bridge);
 	if (ret)

-- 
2.39.5

