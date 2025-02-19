Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E00A3BF44
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 14:00:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE18A10E7F1;
	Wed, 19 Feb 2025 13:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hlq6+HFa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD9310E7E5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 13:00:41 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-3076262bfc6so70513431fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 05:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739970040; x=1740574840; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UA/ae65dJcijQfpxVUYtXz0WivRGDbHVcrFLsexPuM8=;
 b=hlq6+HFaWPmNgOJkYRboV8MzVznHaHUHzTaDjXYcI0kf+P+Cnkz4b6jiR/htVcUh3a
 5irxSVluPSms+kh6gGqaW3rWlTJDtbZyt209VBdOzESO31DZZF0Co1teVydxQ9iYPyMb
 ZPFvNmzetTdMMKE7cPcDNIOzqqhCUEgYDIhGGWD5dlxZ1n6AAPFqbB8h33PYWcojdrwz
 RcPp741h1jn0mSGDG8FvYrgv4WhFYZRuOPRDI/7qfg0+35JIvlhXTowIILwV8o69AFls
 DTdsU0jzlw0hv7F7fYsH0/RFvEmfJCtEwEyFE/cGq2/3lhqoYPVdSW5qk1mHHVTORtiV
 4lrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739970040; x=1740574840;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UA/ae65dJcijQfpxVUYtXz0WivRGDbHVcrFLsexPuM8=;
 b=j45EEssMDrRZ1lRb2epn172B04RSj3kxDSBGYXRVYdNWlNN6rLfTNsjv2MLmUl4ZJH
 r3QJ+aSUvd3D1/moMT1zD2X2B4mLyPvP4d9JNmLqbRMbKybK5tK/oYHWf6qlDTmoi4qB
 k0CQwJANEXv8C2U/MsAi+X6ZP9ayFgq26ynQoYXQZxal/zv6pPWYxIZX/oz+2W6AtRbE
 wESyZbOqLhSqy0ciBCugQ2doE7PhtjBYZ0b/Wm5QBezaiq14q+VkdkutsJVGcA4u71uU
 YojDrWN48oNcjBxFCAXPKPc1OJ/ivdm9JZOB/8UCxib2QvYF6QyLN1J257DyKdGPgqWt
 HWmg==
X-Gm-Message-State: AOJu0YykeZWezi1bOHisbXruwdhI2s/InCZK/wLg1PqF1S7z19Wj/7My
 q+NJ/nxIAdMIjRfTPr0/RtnH5190BBRjg8HWgjf2K2kyOWWu3CVYaTHwZpZdcEA=
X-Gm-Gg: ASbGncuZFFl8HcC5ximMF3ns0OmA1DQB2wADKPSzYGAAP1sZweYiZN5aA7rPO8YgIHd
 U/AhPzc9leh9ImG06EZ9Ayxoh+Z5PWjIbNFsLcJfScfFUQUNY9SQ5Xv0DwwrJAxIl7Fs2dWDQsT
 u2NMulieZU/cr9u1uNCZAZPyksaM26VugvuZceNUNSBT0NipreZjQQwsB3VaZa56p+xrSa9VFjL
 8f1P+HJIowuDqagm1S3tv4HI/yl04WRcPa4USVzLa7TeMQV8b3Kmr7yrgeYscMN0c+T9rS+4rnZ
 ZkLQ6yQe71lXx+nC4NWBri4=
X-Google-Smtp-Source: AGHT+IF0NxCRIqMiMjlIRg1cehA4e7YLydqlHY3l0rs4umckPwvvAbFoyKQ7w8Ep1YqYWgzRdvT5mA==
X-Received: by 2002:a05:6512:a91:b0:545:2302:6835 with SMTP id
 2adb3069b0e04-5452fe2e483mr5436482e87.2.1739970039631; 
 Wed, 19 Feb 2025 05:00:39 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f105a3dsm2179515e87.144.2025.02.19.05.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 05:00:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 19 Feb 2025 15:00:31 +0200
Subject: [PATCH v3 2/2] drm/msm/dp: reuse generic HDMI codec implementation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-dp-hdmi-audio-v3-2-42900f034b40@linaro.org>
References: <20250219-dp-hdmi-audio-v3-0-42900f034b40@linaro.org>
In-Reply-To: <20250219-dp-hdmi-audio-v3-0-42900f034b40@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13527;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=U/gNytEjj+Osi04cD23DBpgjdETaR5pcolmErPhzGiw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntdXxmOY9k7pp7KsmMotgjRJHDAeq4qCEyvQ1U
 PzprxNs3l+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7XV8QAKCRCLPIo+Aiko
 1RmpB/9wz/EEEsNLIjDapowu64y1zRUIiXM8VTH1G+ghO+WMMhuEDZlj/eA4VQ78NBsiFsvpU6T
 9ggrfOS7+tQvxL/s37BS2FVi11tqal5WdCyqAiFBl2zN9VG4/gQnWWKlVX76oYZb+e+B4GyZ0+K
 jTsvoRYKqW8Ou97JMQw+yp/QTS4U5wxEpIek/zTpyGWaLNDZ0IMnd3DerUANjXp0VWylZXAY4yi
 nZpeu1R1uWYJ6/BTYEmP1H8gOJ7hCYpkRaYcy4szmZxpGqLq8G0BzyTKsx9qY7DhKi9RfREcB7u
 xcWnbtX2MmozqZ2dOPJzikbfzVhzO8J7UcHj5PEAzTRgtTiR
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

The MSM DisplayPort driver implements several HDMI codec functions
in the driver, e.g. it manually manages HDMI codec device registration,
returning ELD and plugged_cb support. In order to reduce code
duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
integration.

As a part of this change, also drop the call to
drm_connector_attach_dp_subconnector_property(), it is now being handled
by the drm_bridge_connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Kconfig         |   1 +
 drivers/gpu/drm/msm/dp/dp_audio.c   | 131 ++++--------------------------------
 drivers/gpu/drm/msm/dp/dp_audio.h   |  27 ++------
 drivers/gpu/drm/msm/dp/dp_display.c |  28 ++------
 drivers/gpu/drm/msm/dp/dp_display.h |   6 --
 drivers/gpu/drm/msm/dp/dp_drm.c     |   8 +++
 6 files changed, 31 insertions(+), 170 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 7ec833b6d8292f8cb26cfe5582812f2754cd4d35..fe36a3bcfe03994952d1b5e1b423e923e3e3b014 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -104,6 +104,7 @@ config DRM_MSM_DPU
 config DRM_MSM_DP
 	bool "Enable DisplayPort support in MSM DRM driver"
 	depends on DRM_MSM
+	select DRM_DISPLAY_HDMI_AUDIO_HELPER
 	select RATIONAL
 	default y
 	help
diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 70fdc9fe228a7149546accd8479a9e4397f3d5dd..f8bfb908f9b4bf93ad5480f0785e3aed23dde160 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -13,13 +13,13 @@
 
 #include "dp_catalog.h"
 #include "dp_audio.h"
+#include "dp_drm.h"
 #include "dp_panel.h"
 #include "dp_reg.h"
 #include "dp_display.h"
 #include "dp_utils.h"
 
 struct msm_dp_audio_private {
-	struct platform_device *audio_pdev;
 	struct platform_device *pdev;
 	struct drm_device *drm_dev;
 	struct msm_dp_catalog *catalog;
@@ -160,24 +160,11 @@ static void msm_dp_audio_enable(struct msm_dp_audio_private *audio, bool enable)
 	msm_dp_catalog_audio_enable(catalog, enable);
 }
 
-static struct msm_dp_audio_private *msm_dp_audio_get_data(struct platform_device *pdev)
+static struct msm_dp_audio_private *msm_dp_audio_get_data(struct msm_dp *msm_dp_display)
 {
 	struct msm_dp_audio *msm_dp_audio;
-	struct msm_dp *msm_dp_display;
-
-	if (!pdev) {
-		DRM_ERROR("invalid input\n");
-		return ERR_PTR(-ENODEV);
-	}
-
-	msm_dp_display = platform_get_drvdata(pdev);
-	if (!msm_dp_display) {
-		DRM_ERROR("invalid input\n");
-		return ERR_PTR(-ENODEV);
-	}
 
 	msm_dp_audio = msm_dp_display->msm_dp_audio;
-
 	if (!msm_dp_audio) {
 		DRM_ERROR("invalid msm_dp_audio data\n");
 		return ERR_PTR(-EINVAL);
@@ -186,68 +173,16 @@ static struct msm_dp_audio_private *msm_dp_audio_get_data(struct platform_device
 	return container_of(msm_dp_audio, struct msm_dp_audio_private, msm_dp_audio);
 }
 
-static int msm_dp_audio_hook_plugged_cb(struct device *dev, void *data,
-		hdmi_codec_plugged_cb fn,
-		struct device *codec_dev)
-{
-
-	struct platform_device *pdev;
-	struct msm_dp *msm_dp_display;
-
-	pdev = to_platform_device(dev);
-	if (!pdev) {
-		pr_err("invalid input\n");
-		return -ENODEV;
-	}
-
-	msm_dp_display = platform_get_drvdata(pdev);
-	if (!msm_dp_display) {
-		pr_err("invalid input\n");
-		return -ENODEV;
-	}
-
-	return msm_dp_display_set_plugged_cb(msm_dp_display, fn, codec_dev);
-}
-
-static int msm_dp_audio_get_eld(struct device *dev,
-	void *data, uint8_t *buf, size_t len)
-{
-	struct platform_device *pdev;
-	struct msm_dp *msm_dp_display;
-
-	pdev = to_platform_device(dev);
-
-	if (!pdev) {
-		DRM_ERROR("invalid input\n");
-		return -ENODEV;
-	}
-
-	msm_dp_display = platform_get_drvdata(pdev);
-	if (!msm_dp_display) {
-		DRM_ERROR("invalid input\n");
-		return -ENODEV;
-	}
-
-	mutex_lock(&msm_dp_display->connector->eld_mutex);
-	memcpy(buf, msm_dp_display->connector->eld,
-		min(sizeof(msm_dp_display->connector->eld), len));
-	mutex_unlock(&msm_dp_display->connector->eld_mutex);
-
-	return 0;
-}
-
-int msm_dp_audio_hw_params(struct device *dev,
-	void *data,
-	struct hdmi_codec_daifmt *daifmt,
-	struct hdmi_codec_params *params)
+int msm_dp_audio_prepare(struct drm_connector *connector,
+			 struct drm_bridge *bridge,
+			 struct hdmi_codec_daifmt *daifmt,
+			 struct hdmi_codec_params *params)
 {
 	int rc = 0;
 	struct msm_dp_audio_private *audio;
-	struct platform_device *pdev;
 	struct msm_dp *msm_dp_display;
 
-	pdev = to_platform_device(dev);
-	msm_dp_display = platform_get_drvdata(pdev);
+	msm_dp_display = to_dp_bridge(bridge)->msm_dp_display;
 
 	/*
 	 * there could be cases where sound card can be opened even
@@ -262,7 +197,7 @@ int msm_dp_audio_hw_params(struct device *dev,
 		goto end;
 	}
 
-	audio = msm_dp_audio_get_data(pdev);
+	audio = msm_dp_audio_get_data(msm_dp_display);
 	if (IS_ERR(audio)) {
 		rc = PTR_ERR(audio);
 		goto end;
@@ -281,15 +216,14 @@ int msm_dp_audio_hw_params(struct device *dev,
 	return rc;
 }
 
-static void msm_dp_audio_shutdown(struct device *dev, void *data)
+void msm_dp_audio_shutdown(struct drm_connector *connector,
+			   struct drm_bridge *bridge)
 {
 	struct msm_dp_audio_private *audio;
-	struct platform_device *pdev;
 	struct msm_dp *msm_dp_display;
 
-	pdev = to_platform_device(dev);
-	msm_dp_display = platform_get_drvdata(pdev);
-	audio = msm_dp_audio_get_data(pdev);
+	msm_dp_display = to_dp_bridge(bridge)->msm_dp_display;
+	audio = msm_dp_audio_get_data(msm_dp_display);
 	if (IS_ERR(audio)) {
 		DRM_ERROR("failed to get audio data\n");
 		return;
@@ -311,47 +245,6 @@ static void msm_dp_audio_shutdown(struct device *dev, void *data)
 	msm_dp_display_signal_audio_complete(msm_dp_display);
 }
 
-static const struct hdmi_codec_ops msm_dp_audio_codec_ops = {
-	.hw_params = msm_dp_audio_hw_params,
-	.audio_shutdown = msm_dp_audio_shutdown,
-	.get_eld = msm_dp_audio_get_eld,
-	.hook_plugged_cb = msm_dp_audio_hook_plugged_cb,
-};
-
-static struct hdmi_codec_pdata codec_data = {
-	.ops = &msm_dp_audio_codec_ops,
-	.max_i2s_channels = 8,
-	.i2s = 1,
-};
-
-void msm_dp_unregister_audio_driver(struct device *dev, struct msm_dp_audio *msm_dp_audio)
-{
-	struct msm_dp_audio_private *audio_priv;
-
-	audio_priv = container_of(msm_dp_audio, struct msm_dp_audio_private, msm_dp_audio);
-
-	if (audio_priv->audio_pdev) {
-		platform_device_unregister(audio_priv->audio_pdev);
-		audio_priv->audio_pdev = NULL;
-	}
-}
-
-int msm_dp_register_audio_driver(struct device *dev,
-		struct msm_dp_audio *msm_dp_audio)
-{
-	struct msm_dp_audio_private *audio_priv;
-
-	audio_priv = container_of(msm_dp_audio,
-			struct msm_dp_audio_private, msm_dp_audio);
-
-	audio_priv->audio_pdev = platform_device_register_data(dev,
-						HDMI_CODEC_DRV_NAME,
-						PLATFORM_DEVID_AUTO,
-						&codec_data,
-						sizeof(codec_data));
-	return PTR_ERR_OR_ZERO(audio_priv->audio_pdev);
-}
-
 struct msm_dp_audio *msm_dp_audio_get(struct platform_device *pdev,
 			struct msm_dp_catalog *catalog)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_audio.h b/drivers/gpu/drm/msm/dp/dp_audio.h
index beea34cbab77f31b33873297dc454a9cee446240..58fc14693e48bff2b57ef7278983e5f21ee80ac7 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.h
+++ b/drivers/gpu/drm/msm/dp/dp_audio.h
@@ -35,23 +35,6 @@ struct msm_dp_audio {
 struct msm_dp_audio *msm_dp_audio_get(struct platform_device *pdev,
 			struct msm_dp_catalog *catalog);
 
-/**
- * msm_dp_register_audio_driver()
- *
- * Registers DP device with hdmi_codec interface.
- *
- * @dev: DP device instance.
- * @msm_dp_audio: an instance of msm_dp_audio module.
- *
- *
- * Returns the error code in case of failure, otherwise
- * zero on success.
- */
-int msm_dp_register_audio_driver(struct device *dev,
-		struct msm_dp_audio *msm_dp_audio);
-
-void msm_dp_unregister_audio_driver(struct device *dev, struct msm_dp_audio *msm_dp_audio);
-
 /**
  * msm_dp_audio_put()
  *
@@ -61,10 +44,12 @@ void msm_dp_unregister_audio_driver(struct device *dev, struct msm_dp_audio *msm
  */
 void msm_dp_audio_put(struct msm_dp_audio *msm_dp_audio);
 
-int msm_dp_audio_hw_params(struct device *dev,
-	void *data,
-	struct hdmi_codec_daifmt *daifmt,
-	struct hdmi_codec_params *params);
+int msm_dp_audio_prepare(struct drm_connector *connector,
+			 struct drm_bridge *bridge,
+			 struct hdmi_codec_daifmt *daifmt,
+			 struct hdmi_codec_params *params);
+void msm_dp_audio_shutdown(struct drm_connector *connector,
+			   struct drm_bridge *bridge);
 
 #endif /* _DP_AUDIO_H_ */
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3898850739abb90a777bc94ede0fb0ceef5e5162..adeb9658fbefcd0645785c660318d2325fd3e705 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -12,6 +12,7 @@
 #include <linux/phy/phy.h>
 #include <linux/delay.h>
 #include <drm/display/drm_dp_aux_bus.h>
+#include <drm/display/drm_hdmi_audio_helper.h>
 #include <drm/drm_edid.h>
 
 #include "msm_drv.h"
@@ -287,13 +288,6 @@ static int msm_dp_display_bind(struct device *dev, struct device *master,
 		goto end;
 	}
 
-
-	rc = msm_dp_register_audio_driver(dev, dp->audio);
-	if (rc) {
-		DRM_ERROR("Audio registration Dp failed\n");
-		goto end;
-	}
-
 	rc = msm_dp_hpd_event_thread_start(dp);
 	if (rc) {
 		DRM_ERROR("Event thread create failed\n");
@@ -315,7 +309,6 @@ static void msm_dp_display_unbind(struct device *dev, struct device *master,
 
 	of_dp_aux_depopulate_bus(dp->aux);
 
-	msm_dp_unregister_audio_driver(dev, dp->audio);
 	msm_dp_aux_unregister(dp->aux);
 	dp->drm_dev = NULL;
 	dp->aux->drm_dev = NULL;
@@ -611,9 +604,9 @@ static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
 			struct msm_dp_display_private, msm_dp_display);
 
 	/* notify audio subsystem only if sink supports audio */
-	if (msm_dp_display->plugged_cb && msm_dp_display->codec_dev &&
-			dp->audio_supported)
-		msm_dp_display->plugged_cb(msm_dp_display->codec_dev, plugged);
+	if (dp->audio_supported)
+		drm_connector_hdmi_audio_plugged_notify(msm_dp_display->connector,
+							plugged);
 }
 
 static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
@@ -892,19 +885,6 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 	return 0;
 }
 
-int msm_dp_display_set_plugged_cb(struct msm_dp *msm_dp_display,
-		hdmi_codec_plugged_cb fn, struct device *codec_dev)
-{
-	bool plugged;
-
-	msm_dp_display->plugged_cb = fn;
-	msm_dp_display->codec_dev = codec_dev;
-	plugged = msm_dp_display->link_ready;
-	msm_dp_display_handle_plugged_change(msm_dp_display, plugged);
-
-	return 0;
-}
-
 /**
  * msm_dp_bridge_mode_valid - callback to determine if specified mode is valid
  * @bridge: Pointer to drm bridge structure
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index ecbc2d92f546a346ee53adcf1b060933e4f54317..cc6e2cab36e9c0b1527ff292e547cbb4d69fd95c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -7,7 +7,6 @@
 #define _DP_DISPLAY_H_
 
 #include "dp_panel.h"
-#include <sound/hdmi-codec.h>
 #include "disp/msm_disp_snapshot.h"
 
 #define DP_MAX_PIXEL_CLK_KHZ	675000
@@ -15,7 +14,6 @@
 struct msm_dp {
 	struct drm_device *drm_dev;
 	struct platform_device *pdev;
-	struct device *codec_dev;
 	struct drm_connector *connector;
 	struct drm_bridge *next_bridge;
 	bool link_ready;
@@ -25,14 +23,10 @@ struct msm_dp {
 	bool is_edp;
 	bool internal_hpd;
 
-	hdmi_codec_plugged_cb plugged_cb;
-
 	struct msm_dp_audio *msm_dp_audio;
 	bool psr_supported;
 };
 
-int msm_dp_display_set_plugged_cb(struct msm_dp *msm_dp_display,
-		hdmi_codec_plugged_cb fn, struct device *codec_dev);
 int msm_dp_display_get_modes(struct msm_dp *msm_dp_display);
 bool msm_dp_display_check_video_test(struct msm_dp *msm_dp_display);
 int msm_dp_display_get_test_bpp(struct msm_dp *msm_dp_display);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 16b7913d1eefa8c2deb44df201a1977db23f4531..cf2a82c90e7d353757bd242524bdf9655935f5bd 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -11,6 +11,7 @@
 
 #include "msm_drv.h"
 #include "msm_kms.h"
+#include "dp_audio.h"
 #include "dp_drm.h"
 
 /**
@@ -113,6 +114,9 @@ static const struct drm_bridge_funcs msm_dp_bridge_ops = {
 	.hpd_disable  = msm_dp_bridge_hpd_disable,
 	.hpd_notify   = msm_dp_bridge_hpd_notify,
 	.debugfs_init = msm_dp_bridge_debugfs_init,
+
+	.hdmi_audio_prepare = msm_dp_audio_prepare,
+	.hdmi_audio_shutdown = msm_dp_audio_shutdown,
 };
 
 static int msm_edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
@@ -322,9 +326,13 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	 */
 	if (!msm_dp_display->is_edp) {
 		bridge->ops =
+			DRM_BRIDGE_OP_HDMI_AUDIO |
 			DRM_BRIDGE_OP_DETECT |
 			DRM_BRIDGE_OP_HPD |
 			DRM_BRIDGE_OP_MODES;
+		bridge->hdmi_audio_dev = &msm_dp_display->pdev->dev;
+		bridge->hdmi_audio_max_i2s_playback_channels = 8;
+		bridge->hdmi_audio_dai_port = -1;
 	}
 
 	rc = devm_drm_bridge_add(dev->dev, bridge);

-- 
2.39.5

