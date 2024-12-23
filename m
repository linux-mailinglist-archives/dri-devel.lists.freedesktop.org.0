Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6A89FA972
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 03:59:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2A510E2DD;
	Mon, 23 Dec 2024 02:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tJKhIhS1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A9E10E2DD
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 02:59:08 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-3003c82c95cso30920701fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 18:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734922747; x=1735527547; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PHQ6L1p4ZgOXBrs8Cm9MbQWNyPAYxCK7Fp0jvW1Ej/E=;
 b=tJKhIhS1H7O9WDmlZ0mkoTgM5UZ2O6XJmgRR0d1w8Vw6LNk7QSQjLX8gLiq9AYo6Ic
 K+pPugaTc7zoQtbaW04pWRM46AL3N2ADillQIzQ9F9BK+guUmxumKd9NgI+lGorEFY0E
 nACK9wsAorJD0uG8nlZDITYKM9zSs7mSEqkcrN5Fi8ipOoiCWUQLljj3NNO7I5QTT2lP
 Ks6Ss+prWbrE1P0tN5vIurC/Am9J6F3M3hq4wa/OjyKLvw2q5bG6yjb9AsnUnK1lM3Ql
 mfMtk2xEZvRAyjF8R9rRsiFhchOQywjVWqPYFl39VsYIInOerwtfHHlRMQOQNhK6mB/w
 UYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734922747; x=1735527547;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PHQ6L1p4ZgOXBrs8Cm9MbQWNyPAYxCK7Fp0jvW1Ej/E=;
 b=q0S6VmAIqDgywW2IDp1TxnpgPyQ2xKmrBTNa4LCjI28S60aVDu14r7Gnx/HPtf8kLm
 uSKPbwrOkSjtG0rkvjWhUJwH0UzWF7LBYw8ZyZ+B9nqsYlWqEM7407244X79LWAFpbYU
 Hjv8pWDxqeE9qVdMSjslD66LCseCDD3soWE3RgQw8NEfnABdC9R4Du2JL37rWrjjzN+u
 wSOPpaivVcPzCU2HOS9MenrQTE9jKvAeMiDuKGro8aQ9bM7c6cNdwrAdXVlrUeJv1CsC
 5ZhhYdNufZf4HwvnMTlZs1j/Cmqw+IWO9w2/f8K4TaCKpKxzBA/XIUPQQ7Hp2RroNXJ1
 Wdcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeFlCADMSgMVOBTStJQAfFCWw5YBEDZpxeECPi4MArRQByFVzK2crKLQQd7DVUf40tXxKNdt7U604=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5MgbeF1NpLF81tvss/E0RtZtd1O16KKDdiZ+46Zj9CqY3zL7E
 bgoyoHjoEAzzvr7sel2kE1Dd7dCBVfixAMSkqtb9C+REGbQzL/remSG3kxam6SM=
X-Gm-Gg: ASbGncuJ5ygVRNOjnomFNDieOzKZfFSH+XF9vvtkT2Fr94Ixvrt8D3Io+iX23aLnkrX
 EyQ7YOD5bHaAkJybVHXHmXsRPwFptdPs24SXP9Oa++RzpSuQMumcPyc2Ahg5dTY+Vxi2Sna7Hn0
 slHe7ml7WyU47ExMuJ7ZAU9Qr4MCuLXbLdgZpBLQEQ2/Rl5DsBCqbfJbXcFO4qn5Od6u4YzNh1K
 Mco1jm0Wt8LM1PCLYfHCRBxBBe6zC7T4qOp4INgk5vQgMQ9edz0KjZXqUErrOVP
X-Google-Smtp-Source: AGHT+IE6lVWeBIUt+Uqrf1q36CYt6rpaS2h141WdhTk6NIlGRxCHTf7pq7Q020ezxWwAEktao1v9Ag==
X-Received: by 2002:a2e:a548:0:b0:300:1bf1:df23 with SMTP id
 38308e7fff4ca-30468567e29mr34630591fa.12.1734922746851; 
 Sun, 22 Dec 2024 18:59:06 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f658csm1124639e87.44.2024.12.22.18.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2024 18:59:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 23 Dec 2024 04:58:54 +0200
Subject: [PATCH v9 03/10] drm/connector: implement generic HDMI audio helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-drm-bridge-hdmi-connector-v9-3-6ce16bcedb8b@linaro.org>
References: <20241223-drm-bridge-hdmi-connector-v9-0-6ce16bcedb8b@linaro.org>
In-Reply-To: <20241223-drm-bridge-hdmi-connector-v9-0-6ce16bcedb8b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=14476;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=B9P92PFhkCTQpco0xveLqYEZsXn8Mpu4GqS1QN46NcM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaNHwZOFvTQuLH5Oc3p7J3MNtlJATJAoA8LKIS
 UJUyeMKIryJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2jR8AAKCRCLPIo+Aiko
 1SQnB/9aqSfRw3EVUYqTmPeJne6W1SP4dsi9dZnXmpEGkTQ/RVnfQJccHBNa79SvRqu7l87MCWH
 5K6uZHAY7eQzk9/Fsh3F06ifZaYg31VfAUec+kdcfbfhl4LwRb010cVldVQfh9Sa6dihN67QCDl
 pLXzcbkuKpSZqz/xVWYhBW8Nhe0CpHG0OGr+x3WOuoctySWFqFBtrlGrmgwO6fXVs+Ulx0LKLgF
 /HrAK9irNJh52+hLxgkhOJ5hLO/canNKuNazEJXe/yJCdQLWaDkOOpqf+4zEiQiAetciKaNmkGP
 +FubgRFMMjwVI9sXhtPJsYXrVaGcA3/CFGKg9GgvWvid11Ws
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
 drivers/gpu/drm/display/Kconfig                 |   6 +
 drivers/gpu/drm/display/Makefile                |   2 +
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 189 ++++++++++++++++++++++++
 drivers/gpu/drm/drm_connector.c                 |   5 +
 include/drm/drm_connector.h                     | 125 ++++++++++++++++
 5 files changed, 327 insertions(+)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 6a4e892afcf8966b45f50ce1f2530707441eda51..80c1953cac14a088d764acd45df03debfcb95e7c 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -75,6 +75,12 @@ config DRM_DISPLAY_HDCP_HELPER
 	help
 	  DRM display helpers for HDCP.
 
+config DRM_DISPLAY_HDMI_AUDIO_HELPER
+	bool
+	help
+	  DRM display helpers for HDMI Audio functionality (generic HDMI Codec
+	  implementation).
+
 config DRM_DISPLAY_HDMI_HELPER
 	bool
 	help
diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
index 629c834c3192c61ab8e071223c6a08b98d295b0c..b17879b957d5401721396e247fa346387cf6c48a 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -14,6 +14,8 @@ drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_TUNNEL) += \
 drm_display_helper-$(CONFIG_DRM_DISPLAY_DSC_HELPER) += \
 	drm_dsc_helper.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDCP_HELPER) += drm_hdcp_helper.o
+drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_AUDIO_HELPER) += \
+	drm_hdmi_audio_helper.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_HELPER) += \
 	drm_hdmi_helper.o \
 	drm_scdc_helper.o
diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
new file mode 100644
index 0000000000000000000000000000000000000000..cda9403e49ec35e9d9c118705934908b3ca925b0
--- /dev/null
+++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
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
+		connector->hdmi_audio.funcs;
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
+		connector->hdmi_audio.funcs;
+
+	return funcs->prepare(connector, fmt, hparms);
+}
+
+static void drm_connector_hdmi_audio_shutdown(struct device *dev, void *data)
+{
+	struct drm_connector *connector = data;
+	const struct drm_connector_hdmi_audio_funcs *funcs =
+		connector->hdmi_audio.funcs;
+
+	return funcs->shutdown(connector);
+}
+
+static int drm_connector_hdmi_audio_mute_stream(struct device *dev, void *data,
+						bool enable, int direction)
+{
+	struct drm_connector *connector = data;
+	const struct drm_connector_hdmi_audio_funcs *funcs =
+		connector->hdmi_audio.funcs;
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
+	if (connector->hdmi_audio.dai_port < 0)
+		return -ENOTSUPP;
+
+	ret = of_graph_parse_endpoint(endpoint, &of_ep);
+	if (ret < 0)
+		return ret;
+
+	if (of_ep.port == connector->hdmi_audio.dai_port)
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
+	mutex_lock(&connector->hdmi_audio.lock);
+
+	connector->hdmi_audio.plugged_cb = fn;
+	connector->hdmi_audio.plugged_cb_dev = codec_dev;
+
+	fn(codec_dev, connector->hdmi_audio.last_state);
+
+	mutex_unlock(&connector->hdmi_audio.lock);
+
+	return 0;
+}
+
+void drm_connector_hdmi_audio_plugged_notify(struct drm_connector *connector,
+					     bool plugged)
+{
+	mutex_lock(&connector->hdmi_audio.lock);
+
+	connector->hdmi_audio.last_state = plugged;
+
+	if (connector->hdmi_audio.plugged_cb &&
+	    connector->hdmi_audio.plugged_cb_dev)
+		connector->hdmi_audio.plugged_cb(connector->hdmi_audio.plugged_cb_dev,
+						 connector->hdmi_audio.last_state);
+
+	mutex_unlock(&connector->hdmi_audio.lock);
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
+	connector->hdmi_audio.funcs = funcs;
+	connector->hdmi_audio.dai_port = dai_port;
+
+	pdev = platform_device_register_data(hdmi_codec_dev,
+					     HDMI_CODEC_DRV_NAME,
+					     PLATFORM_DEVID_AUTO,
+					     &codec_pdata, sizeof(codec_pdata));
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	connector->hdmi_audio.codec_pdev = pdev;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_hdmi_audio_init);
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index ae6e71305f3000aff1cfe96b050061a300b9478e..1383fa9fff9bcf31488453e209a36c6fe97be2f1 100644
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
+	mutex_init(&connector->hdmi_audio.lock);
 	connector->edid_blob_ptr = NULL;
 	connector->epoch_counter = 0;
 	connector->tile_blob_ptr = NULL;
@@ -714,6 +716,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
 		    DRM_CONNECTOR_REGISTERED))
 		drm_connector_unregister(connector);
 
+	platform_device_unregister(connector->hdmi_audio.codec_pdev);
+
 	if (connector->privacy_screen) {
 		drm_privacy_screen_put(connector->privacy_screen);
 		connector->privacy_screen = NULL;
@@ -750,6 +754,7 @@ void drm_connector_cleanup(struct drm_connector *connector)
 		connector->funcs->atomic_destroy_state(connector,
 						       connector->state);
 
+	mutex_destroy(&connector->hdmi_audio.lock);
 	mutex_destroy(&connector->hdmi.infoframes.lock);
 	mutex_destroy(&connector->mutex);
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index d1be19242a5c5d7ab6b38cced1da336830b3848d..19e4256296657b0f1d203266d152cbba42f9726a 100644
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
+	 * @hdmi_audio: HDMI codec properties and non-DRM state.
+	 */
+	struct drm_connector_hdmi_audio hdmi_audio;
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

