Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9A89F3EE6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 01:40:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06E110E7F7;
	Tue, 17 Dec 2024 00:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HLTOHBDK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D9D10E7F7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 00:40:37 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53e3a227b82so4557762e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 16:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734396036; x=1735000836; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KCHeJGpaRER/lsmPfqQ2dmGVjRg1ifsOjIqsdJdQHug=;
 b=HLTOHBDKhqpmHcg6DJivuD7uozof7cIHFa5SYoUltESmbC03cgmdyoEE6WxCS+QKcU
 PqARGjofYYoNqc8F7qyVXU75tByaIgvGoM5xq9qiDDcQjAmS3zdxK7zGpFBzznySY9fw
 WEYUJviCiJ7mZx9C5vJ0JBnIdDKI+iyVf5u1RogCa6wQVJG0ge5f3gqfEtZo8aJdoSxq
 ilWE/mUavtON1dIimWEhZP0MOd+A+FWyL34WUVJ8/j2f7fyrd1WBZiIJyx/c/wN8D+m6
 QTKFwCwCa8vkl+shSmp0vxzEHIQc5tVkX3uEV/p+PyxnnNhmmiv0sWDnJBIB3As+L7io
 ah5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734396036; x=1735000836;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KCHeJGpaRER/lsmPfqQ2dmGVjRg1ifsOjIqsdJdQHug=;
 b=aMTfNUsMdN2kV1WGkA2vk/lFL20LhlywA3FOG493FD7U1/9yeOvs/nqcr90b1bl+mw
 sn37vR2t9efmktdnI2ywslJXiJ31FiYpEnwj+soWzrUUyqqF5BBSz9Oa5N4sCUjsOP6N
 1LLMZzU9gJbTJauDOVUqn7BfmY9IKBrtu+vkcMSf2E4UpFmJBnKxXhzn8yhQYYkPvXpX
 ZUI984WnMjrTa2tr1H+ymET2hE+UGisLRNoLQT3zhhvonrS3oK8uMNXiZFsO+/ciQ4pE
 0AlzHYMDVfPOEgD6bwW3pA2fZR65SBGkkax52mrnWilKxTllS1uXtO4DLfJftCHK/27G
 VjnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCCoAgI5b2UVdhGH9hE44I9glQ8+m5DgH75vNRfcLja4DXEhsf2KKcc/bS3JeNCNgyGP52tNyuvmE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwW3NaXgGPYazE/EdzLtpPLY+VkiZdEooZhRoJXuWGavpzJvWxC
 +0qhTa6OjIDI3RPPihfg3CsLOpupjdeTT/4Sx4LRHFKij1F++Loy030LjgXYdo4=
X-Gm-Gg: ASbGnctIZb7kwBvACZ2QC602MDInIC2pLzhuqfbAX+NzOnpyV42Kw8zCvSyfQsZrsqf
 Xwu7ISVjzjXopw14izwrPSw95AOeKAXuOFXhcCscAfhpSHjPkwoy7gzKrjf5Ly14jqGVBh3DlTu
 IWP1TEBUN+Uu4/0JJR0auS/cwgeihxs35jLnDjTxqCxynQSD3knRb65/Z5UpA/SWYUsmOZzbqqH
 4r2qv8fANeaIjN89s6cKNluJOozqAVZetqqXp1vF+t30culIwK9zBkXNxe0Z+yK
X-Google-Smtp-Source: AGHT+IHJPuU0odH6PcLuC9ghO5/3CvxnfJqJEgRSsbXX+5mEeQKdxa3o0xlRFaAxCNrb0PoVtHOaHg==
X-Received: by 2002:a05:6512:158e:b0:540:3566:5397 with SMTP id
 2adb3069b0e04-5409054f33fmr4113604e87.22.1734396035881; 
 Mon, 16 Dec 2024 16:40:35 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120ba9ab2sm1009122e87.74.2024.12.16.16.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 16:40:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 17 Dec 2024 02:40:25 +0200
Subject: [PATCH v7 03/10] drm/connector: implement generic HDMI codec helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-drm-bridge-hdmi-connector-v7-3-cb9df2b6a515@linaro.org>
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
In-Reply-To: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13527;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=2lJsEGwVWJMdg2hXxYFnGcwjvKU3FTtNetX0R5HTLLI=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3rCiYoUtaXf7Go4+RattEh/n3zmG9+ZmOC6KB6ZuufxP
 +osXWI6GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjAR9iUcDBMzGHL9bmtcLUyT
 b9QylK89PXFORtdambqZYrsEw8quHrpzd0KX11q9p7/+8T0/L+Ekxf69wNCLIz/T7rv4p47M01W
 HErZlTzlTbsh5R0h1i8DTD/vCTy1jd0s6FWe1uG6bi6zRrNlTstT6e3zVc1ffKhe8uaqOa8vLA7
 wLrQJ37g5QmhZZxb2c3e2x70L2EzNeXM6eKuAw/dhTn5jsqJwfQX23p3sV7J7Nabl74Z71udKxJ
 lx1F9PDCg/mT7I/t0vg7BXGTpPPdrLWCjYC/h9cP33m65T1OeKszriy5f9dCTt9p8erfVWj2naI
 c1lf+JR6bO8tZUc22QUbLj9tk/2hVz8vQ7I+qiTVLPMMAA==
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

Several DRM drivers implement HDMI codec support (despite its name it
applies to both HDMI and DisplayPort drivers). Implement generic
framework to be used by these drivers. This removes a requirement to
implement get_eld() callback and provides default implementation for
codec's plug handling.

The framework is integrated with the DRM HDMI Connector framework, but
can be used by DisplayPort drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/Makefile                   |   1 +
 drivers/gpu/drm/drm_connector.c            |   5 +
 drivers/gpu/drm/drm_connector_hdmi_codec.c | 189 +++++++++++++++++++++++++++++
 include/drm/drm_connector.h                | 125 +++++++++++++++++++
 4 files changed, 320 insertions(+)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 19fb370fbc56772077973c864df71e4b8e0bf99b..46e6dbc355afe4015ff2327ba04211cdc011a0b7 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -42,6 +42,7 @@ drm-y := \
 	drm_cache.o \
 	drm_color_mgmt.o \
 	drm_connector.o \
+	drm_connector_hdmi_codec.o \
 	drm_crtc.o \
 	drm_displayid.o \
 	drm_drv.o \
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index bbdaaf7022b62d84594a29f1b60144920903a99a..4abfbded962bf45b793a2bd5b1b5c4d9f478a1f7 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -33,6 +33,7 @@
 #include <drm/drm_sysfs.h>
 #include <drm/drm_utils.h>
 
+#include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/uaccess.h>
 
@@ -280,6 +281,7 @@ static int __drm_connector_init(struct drm_device *dev,
 	mutex_init(&connector->eld_mutex);
 	mutex_init(&connector->edid_override_mutex);
 	mutex_init(&connector->hdmi.infoframes.lock);
+	mutex_init(&connector->hdmi_codec.lock);
 	connector->edid_blob_ptr = NULL;
 	connector->epoch_counter = 0;
 	connector->tile_blob_ptr = NULL;
@@ -632,6 +634,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
 		    DRM_CONNECTOR_REGISTERED))
 		drm_connector_unregister(connector);
 
+	platform_device_unregister(connector->hdmi_codec.codec_pdev);
+
 	if (connector->privacy_screen) {
 		drm_privacy_screen_put(connector->privacy_screen);
 		connector->privacy_screen = NULL;
@@ -670,6 +674,7 @@ void drm_connector_cleanup(struct drm_connector *connector)
 		connector->funcs->atomic_destroy_state(connector,
 						       connector->state);
 
+	mutex_destroy(&connector->hdmi_codec.lock);
 	mutex_destroy(&connector->hdmi.infoframes.lock);
 	mutex_destroy(&connector->mutex);
 
diff --git a/drivers/gpu/drm/drm_connector_hdmi_codec.c b/drivers/gpu/drm/drm_connector_hdmi_codec.c
new file mode 100644
index 0000000000000000000000000000000000000000..a6e2f27c3f7ff9d57cf19c055870001daff4c676
--- /dev/null
+++ b/drivers/gpu/drm/drm_connector_hdmi_codec.c
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (c) 2024 Linaro Ltd
+ */
+
+#include <linux/mutex.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_connector.h>
+#include <drm/drm_device.h>
+
+#include <sound/hdmi-codec.h>
+
+static int drm_connector_hdmi_codec_audio_startup(struct device *dev, void *data)
+{
+	struct drm_connector *connector = data;
+	const struct drm_connector_hdmi_codec_funcs *funcs =
+		connector->hdmi_codec.funcs;
+
+	if (funcs->audio_startup)
+		return funcs->audio_startup(connector);
+
+	return 0;
+}
+
+static int drm_connector_hdmi_codec_prepare(struct device *dev, void *data,
+					    struct hdmi_codec_daifmt *fmt,
+					    struct hdmi_codec_params *hparms)
+{
+	struct drm_connector *connector = data;
+	const struct drm_connector_hdmi_codec_funcs *funcs =
+		connector->hdmi_codec.funcs;
+
+	return funcs->prepare(connector, fmt, hparms);
+}
+
+static void drm_connector_hdmi_codec_audio_shutdown(struct device *dev, void *data)
+{
+	struct drm_connector *connector = data;
+	const struct drm_connector_hdmi_codec_funcs *funcs =
+		connector->hdmi_codec.funcs;
+
+	return funcs->audio_shutdown(connector);
+}
+
+static int drm_connector_hdmi_codec_mute_stream(struct device *dev, void *data,
+						bool enable, int direction)
+{
+	struct drm_connector *connector = data;
+	const struct drm_connector_hdmi_codec_funcs *funcs =
+		connector->hdmi_codec.funcs;
+
+	if (funcs->mute_stream)
+		return funcs->mute_stream(connector, enable, direction);
+
+	return -ENOTSUPP;
+}
+
+static int drm_connector_hdmi_codec_get_dai_id(struct snd_soc_component *comment,
+		  struct device_node *endpoint,
+		  void *data)
+{
+	struct drm_connector *connector = data;
+	struct of_endpoint of_ep;
+	int ret;
+
+	if (connector->hdmi_codec.dai_port < 0)
+		return -ENOTSUPP;
+
+	ret = of_graph_parse_endpoint(endpoint, &of_ep);
+	if (ret < 0)
+		return ret;
+
+	if (of_ep.port == connector->hdmi_codec.dai_port)
+		return 0;
+
+	return -EINVAL;
+}
+
+static int drm_connector_hdmi_codec_get_eld(struct device *dev, void *data,
+					    uint8_t *buf, size_t len)
+{
+	struct drm_connector *connector = data;
+
+	mutex_lock(&connector->eld_mutex);
+	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
+	mutex_unlock(&connector->eld_mutex);
+
+	return 0;
+}
+
+static int drm_connector_hdmi_codec_hook_plugged_cb(struct device *dev,
+						    void *data,
+						    hdmi_codec_plugged_cb fn,
+						    struct device *codec_dev)
+{
+	struct drm_connector *connector = data;
+
+	mutex_lock(&connector->hdmi_codec.lock);
+
+	connector->hdmi_codec.plugged_cb = fn;
+	connector->hdmi_codec.plugged_cb_dev = codec_dev;
+
+	fn(codec_dev, connector->hdmi_codec.last_state);
+
+	mutex_unlock(&connector->hdmi_codec.lock);
+
+	return 0;
+}
+
+void drm_connector_hdmi_codec_plugged_notify(struct drm_connector *connector,
+					     bool plugged)
+{
+	mutex_lock(&connector->hdmi_codec.lock);
+
+	connector->hdmi_codec.last_state = plugged;
+
+	if (connector->hdmi_codec.plugged_cb &&
+	    connector->hdmi_codec.plugged_cb_dev)
+		connector->hdmi_codec.plugged_cb(connector->hdmi_codec.plugged_cb_dev,
+						 connector->hdmi_codec.last_state);
+
+	mutex_unlock(&connector->hdmi_codec.lock);
+}
+EXPORT_SYMBOL(drm_connector_hdmi_codec_plugged_notify);
+
+static const struct hdmi_codec_ops drm_connector_hdmi_codec_ops = {
+	.audio_startup = drm_connector_hdmi_codec_audio_startup,
+	.prepare = drm_connector_hdmi_codec_prepare,
+	.audio_shutdown = drm_connector_hdmi_codec_audio_shutdown,
+	.mute_stream = drm_connector_hdmi_codec_mute_stream,
+	.get_eld = drm_connector_hdmi_codec_get_eld,
+	.get_dai_id = drm_connector_hdmi_codec_get_dai_id,
+	.hook_plugged_cb = drm_connector_hdmi_codec_hook_plugged_cb,
+};
+
+/**
+ * drm_connector_hdmi_audio_init - Initialize HDMI Codec device for the DRM connector
+ * @connector: A pointer to the connector to allocate codec for
+ * @hdmi_codec_dev: device to be used as a parent for the HDMI Codec
+ * @funcs: callbacks for this HDMI Codec
+ * @max_i2s_playback_channels: maximum number of playback I2S channels
+ * @spdif_playback: set if HDMI codec has S/PDIF playback port
+ * @dai_port: sound DAI port, -1 if it is not enabled
+ *
+ * Create a HDMI codec device to be used with the specified connector.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drm_connector_hdmi_audio_init(struct drm_connector *connector,
+				  struct device *hdmi_codec_dev,
+				  const struct drm_connector_hdmi_codec_funcs *funcs,
+				  unsigned int max_i2s_playback_channels,
+				  bool spdif_playback,
+				  int dai_port)
+{
+	struct hdmi_codec_pdata codec_pdata = {
+		.ops = &drm_connector_hdmi_codec_ops,
+		.max_i2s_channels = max_i2s_playback_channels,
+		.i2s = !!max_i2s_playback_channels,
+		.spdif = spdif_playback,
+		.no_i2s_capture = true,
+		.no_spdif_capture = true,
+		.data = connector,
+	};
+	struct platform_device *pdev;
+
+	if (!funcs ||
+	    !funcs->prepare ||
+	    !funcs->audio_shutdown)
+		return -EINVAL;
+
+	connector->hdmi_codec.funcs = funcs;
+	connector->hdmi_codec.dai_port = dai_port;
+
+	pdev = platform_device_register_data(hdmi_codec_dev,
+					     HDMI_CODEC_DRV_NAME,
+					     PLATFORM_DEVID_AUTO,
+					     &codec_pdata, sizeof(codec_pdata));
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	connector->hdmi_codec.codec_pdev = pdev;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_hdmi_audio_init);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 1e2b25e204cb523d61d30f5409faa059bf2b86eb..536d604b6fb27368c43805a2ecf57fac06b3d472 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -46,6 +46,8 @@ struct drm_property_blob;
 struct drm_printer;
 struct drm_privacy_screen;
 struct edid;
+struct hdmi_codec_daifmt;
+struct hdmi_codec_params;
 struct i2c_adapter;
 
 enum drm_connector_force {
@@ -1141,6 +1143,53 @@ struct drm_connector_state {
 	struct drm_connector_hdmi_state hdmi;
 };
 
+struct drm_connector_hdmi_codec_funcs {
+	/**
+	 * @audio_startup:
+	 *
+	 * Called when ASoC starts an audio stream setup. The
+	 * @hdmi_audio_startup is optional.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*audio_startup)(struct drm_connector *connector);
+
+	/**
+	 * @prepare:
+	 * Configures HDMI-encoder for audio stream. Can be called
+	 * multiple times for each setup. Mandatory.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*prepare)(struct drm_connector *connector,
+		       struct hdmi_codec_daifmt *fmt,
+		       struct hdmi_codec_params *hparms);
+
+	/**
+	 * @audio_shutdown:
+	 *
+	 * Shut down the audio stream. Mandatory.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	void (*audio_shutdown)(struct drm_connector *connector);
+
+	/**
+	 * @mute_stream:
+	 *
+	 * Mute/unmute HDMI audio stream. The @mute_stream callback is
+	 * optional.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*mute_stream)(struct drm_connector *connector,
+			   bool enable, int direction);
+};
+
 /**
  * struct drm_connector_hdmi_funcs - drm_hdmi_connector control functions
  */
@@ -1660,6 +1709,68 @@ struct drm_cmdline_mode {
 	bool tv_mode_specified;
 };
 
+/**
+ * struct drm_connector_hdmi_codec - DRM gemeric HDMI Codec-related structure
+ *
+ * HDMI drivers usually incorporate a HDMI Codec. This structure expresses the
+ * generic HDMI Codec as used by the DRM HDMI Codec framework.
+ */
+struct drm_connector_hdmi_codec {
+	/**
+	 * @funcs:
+	 *
+	 * Implementation of the HDMI codec functionality to be used by the DRM
+	 * HDMI Codec framework.
+	 */
+	const struct drm_connector_hdmi_codec_funcs *funcs;
+
+	/**
+	 * @codec_pdev:
+	 *
+	 * Platform device created to hold the HDMI Codec. It will be
+	 * automatically unregistered during drm_connector_cleanup().
+	 */
+	struct platform_device *codec_pdev;
+
+	/**
+	 * @lock:
+	 *
+	 * Mutex to protect @last_state, @plugged_cb and @plugged_cb_dev.
+	 */
+	struct mutex lock;
+
+	/**
+	 * @plugged_cb:
+	 *
+	 * Callback to be called when the HDMI sink get plugged to or unplugged
+	 * from this connector. This is assigned by the framework when
+	 * requested by the ASoC code.
+	 */
+	void (*plugged_cb)(struct device *dev, bool plugged);
+
+	/**
+	 * @plugged_cb_dev:
+	 *
+	 * The data for @plugged_cb(). It is being provided by the ASoC.
+	 */
+	struct device *plugged_cb_dev;
+
+	/**
+	 * @last_state:
+	 *
+	 * Last plugged state recored by the framework. It is used to correctly
+	 * report the state to @plugged_cb().
+	 */
+	bool last_state;
+
+	/**
+	 * @dai_port:
+	 *
+	 * The port in DT that is used for the Codec DAI.
+	 */
+	int dai_port;
+};
+
 /*
  * struct drm_connector_hdmi - DRM Connector HDMI-related structure
  */
@@ -2121,6 +2232,11 @@ struct drm_connector {
 	 * @hdmi: HDMI-related variable and properties.
 	 */
 	struct drm_connector_hdmi hdmi;
+
+	/**
+	 * @hdmi_codec: HDMI codec properties and non-DRM state.
+	 */
+	struct drm_connector_hdmi_codec hdmi_codec;
 };
 
 #define obj_to_connector(x) container_of(x, struct drm_connector, base)
@@ -2148,12 +2264,21 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct i2c_adapter *ddc,
 			     unsigned long supported_formats,
 			     unsigned int max_bpc);
+int drm_connector_hdmi_audio_init(struct drm_connector *connector,
+				  struct device *hdmi_codec_dev,
+				  const struct drm_connector_hdmi_codec_funcs *funcs,
+				  unsigned int max_i2s_playback_channels,
+				  bool spdif_playback,
+				  int sound_dai_port);
 void drm_connector_attach_edid_property(struct drm_connector *connector);
 int drm_connector_register(struct drm_connector *connector);
 void drm_connector_unregister(struct drm_connector *connector);
 int drm_connector_attach_encoder(struct drm_connector *connector,
 				      struct drm_encoder *encoder);
 
+void drm_connector_hdmi_codec_plugged_notify(struct drm_connector *connector,
+					     bool plugged);
+
 void drm_connector_cleanup(struct drm_connector *connector);
 
 static inline unsigned int drm_connector_index(const struct drm_connector *connector)

-- 
2.39.5

