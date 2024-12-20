Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A7E9F9A1F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 20:17:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5D510F034;
	Fri, 20 Dec 2024 19:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="F1OebI+B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0D610F034
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 19:17:14 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-3035046d4bfso19850501fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 11:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734722232; x=1735327032; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CKoOABPrRZgXfqcXTeN3ithnZW9z7vvoLY1QJGjHJvg=;
 b=F1OebI+BDIXom/dBWXmsPb2j8r04N+K1SH/bH9E2jt8GPwP7hf/cWIX+YE4J8h9SjC
 /s+4dAnp7UxwslKWp+Be+CNUJet82oiF8clSlQbYF7aVhxM0cfmny4HFxCwRUjiGnLw/
 Q8/1vHWXcVl28NB23dImH6BXAPorW4hS6SP4/9Q0lUePbxi8Oxj1UXsgG+HR0KbV3XdH
 bzZ7FRkX/gmmtxx/9en3jK2ZZZXHxG+jF6LLmjz08ubKlVrIYdwNllX9QjCPrIalnoMr
 p9rNbShTTjwEeEYwoXmbcw19+aYFn1INGKD26aasuwucAmcG1epuqo6yGr+u2uutE46t
 KQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734722232; x=1735327032;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CKoOABPrRZgXfqcXTeN3ithnZW9z7vvoLY1QJGjHJvg=;
 b=MgvywfFIEI/RxDvF2kpABTBhs1zwS54/85KRpN/u0nV9B8oPJ7+n8pjdE9PRmrvLtl
 sZ23gJ5gfy1fZxLZqr9t8Z4q3KVVPVEOfmbAcBpBGvWQqCmXrtSqQRWXS1cGbT7Am77r
 plkORihPTk9GtvBC3WwlQ4+32MU5R2/2ozfHXJO6RmOJOeqCcWKdpwG+qxkcuP3K7Tbo
 uGhrR3Mn4NqmmL07dMNmJl7MpB7BBjAbtFMUY/fBm43RufSAUDr53MXWVXcJxVGx3ghZ
 LaPkhfv3YWVCEPi33pzYlFRj7QAQINfO2diQk8L4rBYDsOeV1Wk+roQvX8WbuyRsAjSI
 VAEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzwOKd2OvIH/iTXMsmCl8hNFiUr1Gc80WA3CNcrs0qSKcXfQHRhl0YJGsKyKwihq1vv3X8QB048U8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz72wtqk497DS9EpaqoimNMKSMCRsVWDkdOmbQ93idQOxOFIMcY
 3M6mv/GIOSHSNZ3Td8FaO9mubvAOxX/3YVfehX0DqXZAQ5D31I6x4EjxbNeiohQ=
X-Gm-Gg: ASbGncveRdaVVwd9ne9hmg2l8t/EpLia5ncFrfHS5hpUNRDKk2MnrHrbhsq10amsU8P
 DZ2f8O++WkuHmST/501Dop8g1n6S4opEOKkqd5JIpwO/hlxrLJrwfkyXcwgvFhJy9GqK0X0HDda
 XOFrYvpmcgPMvvPQBcWHGwBX3Ej1OZEfl2N8KHvaye/jiiPw1JqCwAma/PjM7wT1RrratKLvuHj
 weigQOjZdaGA+siFRbP7l/4LRC3ZfCoyN4rAs07FH1QXEXseXqdpabd4hBUHzRr
X-Google-Smtp-Source: AGHT+IEDKA8IkHov3D89B0qyU7N0Y4iRur8PhTx3pV/7pAtnvYG9YUZQc2LAkxPoFmbyVSQ9ubZmuQ==
X-Received: by 2002:a05:6512:3b99:b0:540:5b5b:4289 with SMTP id
 2adb3069b0e04-5422959c788mr1378632e87.47.1734722232439; 
 Fri, 20 Dec 2024 11:17:12 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223813877sm545141e87.149.2024.12.20.11.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 11:17:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 21:17:00 +0200
Subject: [PATCH v8 03/10] drm/connector: implement generic HDMI audio helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-drm-bridge-hdmi-connector-v8-3-2399dbae2990@linaro.org>
References: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
In-Reply-To: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13551;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=E6uxh0yM6oGx82wcAEDQ6+YGYcpdHpIui66Yz4SLPi4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZcKuq7CtgK3GRNbzXLonjZlbzqizI9r4ianfK
 wNGssS4pfmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2XCrgAKCRCLPIo+Aiko
 1fhfB/4keulrDjA8uYDXtBtl0oL1sgzeuBX2TfU1soVzvUcq6JN9vRF+CbbIpcKuDj6QRz4tx7d
 cen7UAh2Mc9Bv9MqJFjOas34N1d+toi/bj7eqMTRn7rX4iW/zedsQ/yUxrB6iqqa4IeXPSc7dKq
 ulexXuDXCIXWFvwVKqy/8jWlR6Cd+PqcYQ5ICN2B6om12Ux+2J7uCewW/+5BhdBzbsDjfertVFr
 UxoTN1xJ5phFuLqX2NXCQTMce3C3U1KFF6LGd7YzT6Yi9ohwqR9G4FawLpKm8HwAfOGvvbBHZn+
 JZIwi+SBl6QF2xkh9KUQI5VCiUqx7T5iqx7pzAeKxOWiOrC5
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

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/Makefile                   |   1 +
 drivers/gpu/drm/drm_connector.c            |   5 +
 drivers/gpu/drm/drm_connector_hdmi_audio.c | 189 +++++++++++++++++++++++++++++
 include/drm/drm_connector.h                | 125 +++++++++++++++++++
 4 files changed, 320 insertions(+)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 19fb370fbc56772077973c864df71e4b8e0bf99b..4f7f8bde021f9713ab425fcfc9b687f3c7507d73 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -42,6 +42,7 @@ drm-y := \
 	drm_cache.o \
 	drm_color_mgmt.o \
 	drm_connector.o \
+	drm_connector_hdmi_audio.o \
 	drm_crtc.o \
 	drm_displayid.o \
 	drm_drv.o \
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index ae6e71305f3000aff1cfe96b050061a300b9478e..0669e0d9521c9d80efef1296180f23d6b38835b7 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -33,6 +33,7 @@
 #include <drm/drm_sysfs.h>
 #include <drm/drm_utils.h>
 
+#include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/uaccess.h>
 
@@ -281,6 +282,7 @@ static int drm_connector_init_only(struct drm_device *dev,
 	mutex_init(&connector->eld_mutex);
 	mutex_init(&connector->edid_override_mutex);
 	mutex_init(&connector->hdmi.infoframes.lock);
+	mutex_init(&connector->hdmi_codec.lock);
 	connector->edid_blob_ptr = NULL;
 	connector->epoch_counter = 0;
 	connector->tile_blob_ptr = NULL;
@@ -714,6 +716,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
 		    DRM_CONNECTOR_REGISTERED))
 		drm_connector_unregister(connector);
 
+	platform_device_unregister(connector->hdmi_codec.codec_pdev);
+
 	if (connector->privacy_screen) {
 		drm_privacy_screen_put(connector->privacy_screen);
 		connector->privacy_screen = NULL;
@@ -750,6 +754,7 @@ void drm_connector_cleanup(struct drm_connector *connector)
 		connector->funcs->atomic_destroy_state(connector,
 						       connector->state);
 
+	mutex_destroy(&connector->hdmi_codec.lock);
 	mutex_destroy(&connector->hdmi.infoframes.lock);
 	mutex_destroy(&connector->mutex);
 
diff --git a/drivers/gpu/drm/drm_connector_hdmi_audio.c b/drivers/gpu/drm/drm_connector_hdmi_audio.c
new file mode 100644
index 0000000000000000000000000000000000000000..bd7aab2fdfd3530d1f812ea058f5f6fd9d1c3b27
--- /dev/null
+++ b/drivers/gpu/drm/drm_connector_hdmi_audio.c
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
+static int drm_connector_hdmi_audio_startup(struct device *dev, void *data)
+{
+	struct drm_connector *connector = data;
+	const struct drm_connector_hdmi_audio_funcs *funcs =
+		connector->hdmi_codec.funcs;
+
+	if (funcs->startup)
+		return funcs->startup(connector);
+
+	return 0;
+}
+
+static int drm_connector_hdmi_audio_prepare(struct device *dev, void *data,
+					    struct hdmi_codec_daifmt *fmt,
+					    struct hdmi_codec_params *hparms)
+{
+	struct drm_connector *connector = data;
+	const struct drm_connector_hdmi_audio_funcs *funcs =
+		connector->hdmi_codec.funcs;
+
+	return funcs->prepare(connector, fmt, hparms);
+}
+
+static void drm_connector_hdmi_audio_shutdown(struct device *dev, void *data)
+{
+	struct drm_connector *connector = data;
+	const struct drm_connector_hdmi_audio_funcs *funcs =
+		connector->hdmi_codec.funcs;
+
+	return funcs->shutdown(connector);
+}
+
+static int drm_connector_hdmi_audio_mute_stream(struct device *dev, void *data,
+						bool enable, int direction)
+{
+	struct drm_connector *connector = data;
+	const struct drm_connector_hdmi_audio_funcs *funcs =
+		connector->hdmi_codec.funcs;
+
+	if (funcs->mute_stream)
+		return funcs->mute_stream(connector, enable, direction);
+
+	return -ENOTSUPP;
+}
+
+static int drm_connector_hdmi_audio_get_dai_id(struct snd_soc_component *comment,
+					       struct device_node *endpoint,
+					       void *data)
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
+static int drm_connector_hdmi_audio_get_eld(struct device *dev, void *data,
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
+static int drm_connector_hdmi_audio_hook_plugged_cb(struct device *dev,
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
+void drm_connector_hdmi_audio_plugged_notify(struct drm_connector *connector,
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
+EXPORT_SYMBOL(drm_connector_hdmi_audio_plugged_notify);
+
+static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops = {
+	.audio_startup = drm_connector_hdmi_audio_startup,
+	.prepare = drm_connector_hdmi_audio_prepare,
+	.audio_shutdown = drm_connector_hdmi_audio_shutdown,
+	.mute_stream = drm_connector_hdmi_audio_mute_stream,
+	.get_eld = drm_connector_hdmi_audio_get_eld,
+	.get_dai_id = drm_connector_hdmi_audio_get_dai_id,
+	.hook_plugged_cb = drm_connector_hdmi_audio_hook_plugged_cb,
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
+				  const struct drm_connector_hdmi_audio_funcs *funcs,
+				  unsigned int max_i2s_playback_channels,
+				  bool spdif_playback,
+				  int dai_port)
+{
+	struct hdmi_codec_pdata codec_pdata = {
+		.ops = &drm_connector_hdmi_audio_ops,
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
+	    !funcs->shutdown)
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
index d1be19242a5c5d7ab6b38cced1da336830b3848d..bdd8637196a608319e81fb3aee286ce0fd22cd9c 100644
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
 
+struct drm_connector_hdmi_audio_funcs {
+	/**
+	 * @startup:
+	 *
+	 * Called when ASoC starts an audio stream setup. The
+	 * @startup() is optional.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*startup)(struct drm_connector *connector);
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
+	 * @shutdown:
+	 *
+	 * Shut down the audio stream. Mandatory.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	void (*shutdown)(struct drm_connector *connector);
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
+ * struct drm_connector_hdmi_audio - DRM gemeric HDMI Codec-related structure
+ *
+ * HDMI drivers usually incorporate a HDMI Codec. This structure expresses the
+ * generic HDMI Codec as used by the DRM HDMI Codec framework.
+ */
+struct drm_connector_hdmi_audio {
+	/**
+	 * @funcs:
+	 *
+	 * Implementation of the HDMI codec functionality to be used by the DRM
+	 * HDMI Codec framework.
+	 */
+	const struct drm_connector_hdmi_audio_funcs *funcs;
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
+	struct drm_connector_hdmi_audio hdmi_codec;
 };
 
 #define obj_to_connector(x) container_of(x, struct drm_connector, base)
@@ -2153,6 +2269,12 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct i2c_adapter *ddc,
 			     unsigned long supported_formats,
 			     unsigned int max_bpc);
+int drm_connector_hdmi_audio_init(struct drm_connector *connector,
+				  struct device *hdmi_codec_dev,
+				  const struct drm_connector_hdmi_audio_funcs *funcs,
+				  unsigned int max_i2s_playback_channels,
+				  bool spdif_playback,
+				  int sound_dai_port);
 void drm_connector_attach_edid_property(struct drm_connector *connector);
 int drm_connector_register(struct drm_connector *connector);
 int drm_connector_dynamic_register(struct drm_connector *connector);
@@ -2160,6 +2282,9 @@ void drm_connector_unregister(struct drm_connector *connector);
 int drm_connector_attach_encoder(struct drm_connector *connector,
 				      struct drm_encoder *encoder);
 
+void drm_connector_hdmi_audio_plugged_notify(struct drm_connector *connector,
+					     bool plugged);
+
 void drm_connector_cleanup(struct drm_connector *connector);
 
 static inline unsigned int drm_connector_index(const struct drm_connector *connector)

-- 
2.39.5

