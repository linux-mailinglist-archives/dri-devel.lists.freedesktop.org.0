Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC749D56DA
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 01:48:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB64710EAA5;
	Fri, 22 Nov 2024 00:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rq5+Wndt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E23D10EAA1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 00:47:55 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2fb5be4381dso19298191fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 16:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732236473; x=1732841273; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=O72gbUDbM7kl3JMP7ZBWI3LnDF87C5Sg9KKzLKy42H4=;
 b=rq5+Wndt1p3pA2XcZ+ihjaSgKMD9kLtwnXxVK4cDxQyXAEHvbyD3Ow/AS4woTlunSm
 5t6+DQtVRb6sXXNB66O4s+/LPyEJ6ZjE5VvD6wFCH45Zp+syECivJQ309sPE4eVtsHqL
 hXlUwvsJC30kO6TlHiPyYtNfQtk5OTmnjO0oLTp7bQ+0av9taDqY1x4xTObol7pG5K/r
 7ywCeubwPIb1kgrSnEZZ0a6TbZKa9SefBTGSkZ13tlorsDNT3g9xqD59PSICcVDDqXE8
 pKDSmCmgvkaiz+VRyG666eKXRms6KYezgk3ucuSBKyLkQiNGNU+ZRR82zh8VC2cdj2yi
 tozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732236473; x=1732841273;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O72gbUDbM7kl3JMP7ZBWI3LnDF87C5Sg9KKzLKy42H4=;
 b=GTIO1zxpCt25+8wrBM1Ue0VzZAHaxlTgWIOhEaAqohcbgT5I/0DA0wVxnvidn2ijle
 aiX6DgPomowapDHEDqhnMF3k3QxW+nIFeE0x+lwYknnjp3itmWcEl9/4GmXGnsYeyy9r
 Ukn7vCVIq1NMU/3ZcSdlE+uQ/EBXf3xiWsIasOR7b5F9LsGlk7A5L1JwLEDJsnW24+de
 JZQ1iPT5SthR9Mw/eMn5QiGKfYL7AaZ7eZ/R9LchuVmeXSoDwU09+ZlSg485fVLfKQlR
 68E7N1UHzkxr6IOOkGFXfsP+yKWER1QQaNxcJOSH23eNJN1+/aa8TSoMpudyGvR5vDHk
 jfvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSyR6sqQGYfKGVceYY42Di+riem0ZW3K0taW4pux16v9Mo+wVM4PTvmRoYthOeAj1Lw3j/kRK5Kb0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrkRZf78EBMRSZ+ImznlSveO9n2r8zjsDra7nup/uz92khCtU4
 4iQF5Y1HxLxOih0iSS982waJQYVotbOQ6WOl3BZkv+P6J5zXV+WeTk+TCrPgvrU=
X-Gm-Gg: ASbGnctQWp3ovK+CllkVtdaG6zRSCRiNGo4Kq0aLIacuHGGs88uIsublbQSDx76/1k4
 HeXksnteiWV1JAmn2tsFae8vve3Qt51dK3iW5Wjn2gCrqyJz4f/37xfqEmjgkdOaur2p6R5y7TR
 18KvHXd0pPV+NvtGaVd/0MFCZnmePlJrqSesZdq2RUg89WDZcrSFV+tBMFbV62/GxDYsNdqJ7i8
 4foL6i9jLxlAUn0NKb92FZSKRcTwWJdWMRpmf4AkiZHyyqrV+FXDn4kRg==
X-Google-Smtp-Source: AGHT+IEw/tBhKCFnrD14V+38zGlfbN8e7LPKpMB+4Z8aXDW1EfcDZZTa3uwrT+gXFjqv/lAO6wbLqw==
X-Received: by 2002:a2e:bea5:0:b0:2fb:2b5d:215d with SMTP id
 38308e7fff4ca-2ffa70f6bf8mr2984791fa.7.1732236472809; 
 Thu, 21 Nov 2024 16:47:52 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffa5375caesm1083071fa.85.2024.11.21.16.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 16:47:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 02:47:35 +0200
Subject: [PATCH v4 5/7] drm/bridge: lt9611: switch to using the DRM HDMI
 codec framework
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-drm-bridge-hdmi-connector-v4-5-b4d69d6e3bd9@linaro.org>
References: <20241122-drm-bridge-hdmi-connector-v4-0-b4d69d6e3bd9@linaro.org>
In-Reply-To: <20241122-drm-bridge-hdmi-connector-v4-0-b4d69d6e3bd9@linaro.org>
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
 Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7869;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bt7FTSnaJ4ZdPpnvHjWH+URnk6jSCm36E7PfRw7YH9s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnP9So7yNOTs3PU0tlh/78i+WzL4AXI6hFFscud
 eqjnzdTataJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZz/UqAAKCRCLPIo+Aiko
 1a+2CACDNgeJkOfQ15ZRYAG61L1nsbntHptkDVFNvgxnghsubCnD8Fjge8LoUNrhPQ7yzQPyDv6
 hjAmdsvJtiRQeB42d6eGoAdtM1XrN5e91ZQwywq8qIv4bLly0EBycEehUneCuL4BPUMeF/GDHjw
 mcGVknPaIjdxXCcw4F2EmPaEdQHL55vOZDQZU/AoRDWRTaoYz+1VwNDlMIQr3nl5m1JIVRkCRZv
 KJlqXu7leU+ii/TlmrZn6njMhVV73rSKLZ0wTXspe39rtzxcUoewdI2kPb0Z3JryhM1uZR5SJsr
 5diZwzxk14+/B4gDnhm7IPXRWwP+z9IkbC+6pJnwbR3hyAH8
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

Make the Lontium LT9611 DSI-to-HDMI bridge driver use the DRM HDMI Codec
framework. This enables programming of Audio InfoFrames using the HDMI
Connector interface and also enables support for the missing features,
including the ELD retrieval and better hotplug support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 171 +++++++++++++-------------------
 1 file changed, 69 insertions(+), 102 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 6bc1b2476847c3bccbbf9874bb384c1f60674da6..f3ac67440a941327308ddf1fbb77744c6a8fe42e 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -45,7 +45,6 @@ struct lt9611 {
 	struct device_node *dsi1_node;
 	struct mipi_dsi_device *dsi0;
 	struct mipi_dsi_device *dsi1;
-	struct platform_device *audio_pdev;
 
 	bool ac_mode;
 
@@ -866,6 +865,10 @@ static int lt9611_hdmi_clear_infoframe(struct drm_bridge *bridge,
 	unsigned int mask;
 
 	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AUDIO:
+		mask = LT9611_INFOFRAME_AUDIO;
+		break;
+
 	case HDMI_INFOFRAME_TYPE_AVI:
 		mask = LT9611_INFOFRAME_AVI;
 		break;
@@ -899,6 +902,11 @@ static int lt9611_hdmi_write_infoframe(struct drm_bridge *bridge,
 	int i;
 
 	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AUDIO:
+		mask = LT9611_INFOFRAME_AUDIO;
+		addr = 0x84b2;
+		break;
+
 	case HDMI_INFOFRAME_TYPE_AVI:
 		mask = LT9611_INFOFRAME_AVI;
 		addr = 0x8440;
@@ -942,6 +950,55 @@ lt9611_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
+static int lt9611_hdmi_codec_audio_startup(struct drm_connector *connector,
+					   struct drm_bridge *bridge)
+{
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+
+	regmap_write(lt9611->regmap, 0x82d6, 0x8c);
+	regmap_write(lt9611->regmap, 0x82d7, 0x04);
+
+	regmap_write(lt9611->regmap, 0x8406, 0x08);
+	regmap_write(lt9611->regmap, 0x8407, 0x10);
+
+	regmap_write(lt9611->regmap, 0x8434, 0xd5);
+
+	return 0;
+}
+
+static int lt9611_hdmi_codec_prepare(struct drm_connector *connector,
+				     struct drm_bridge *bridge,
+				     struct hdmi_codec_daifmt *fmt,
+				     struct hdmi_codec_params *hparms)
+{
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+
+	if (hparms->sample_rate == 48000)
+		regmap_write(lt9611->regmap, 0x840f, 0x2b);
+	else if (hparms->sample_rate == 96000)
+		regmap_write(lt9611->regmap, 0x840f, 0xab);
+	else
+		return -EINVAL;
+
+	regmap_write(lt9611->regmap, 0x8435, 0x00);
+	regmap_write(lt9611->regmap, 0x8436, 0x18);
+	regmap_write(lt9611->regmap, 0x8437, 0x00);
+
+	return drm_atomic_helper_connector_hdmi_update_audio_infoframe(connector,
+								       &hparms->cea);
+}
+
+static void lt9611_hdmi_codec_audio_shutdown(struct drm_connector *connector,
+					     struct drm_bridge *bridge)
+{
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+
+	drm_atomic_helper_connector_hdmi_clear_audio_infoframe(connector);
+
+	regmap_write(lt9611->regmap, 0x8406, 0x00);
+	regmap_write(lt9611->regmap, 0x8407, 0x00);
+}
+
 static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.attach = lt9611_bridge_attach,
 	.mode_valid = lt9611_bridge_mode_valid,
@@ -962,6 +1019,10 @@ static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.hdmi_tmds_char_rate_valid = lt9611_hdmi_tmds_char_rate_valid,
 	.hdmi_write_infoframe = lt9611_hdmi_write_infoframe,
 	.hdmi_clear_infoframe = lt9611_hdmi_clear_infoframe,
+
+	.hdmi_codec_audio_startup = lt9611_hdmi_codec_audio_startup,
+	.hdmi_codec_prepare = lt9611_hdmi_codec_prepare,
+	.hdmi_codec_audio_shutdown = lt9611_hdmi_codec_audio_shutdown,
 };
 
 static int lt9611_parse_dt(struct device *dev,
@@ -1015,102 +1076,6 @@ static int lt9611_read_device_rev(struct lt9611 *lt9611)
 	return ret;
 }
 
-static int lt9611_hdmi_hw_params(struct device *dev, void *data,
-				 struct hdmi_codec_daifmt *fmt,
-				 struct hdmi_codec_params *hparms)
-{
-	struct lt9611 *lt9611 = data;
-
-	if (hparms->sample_rate == 48000)
-		regmap_write(lt9611->regmap, 0x840f, 0x2b);
-	else if (hparms->sample_rate == 96000)
-		regmap_write(lt9611->regmap, 0x840f, 0xab);
-	else
-		return -EINVAL;
-
-	regmap_write(lt9611->regmap, 0x8435, 0x00);
-	regmap_write(lt9611->regmap, 0x8436, 0x18);
-	regmap_write(lt9611->regmap, 0x8437, 0x00);
-
-	return 0;
-}
-
-static int lt9611_audio_startup(struct device *dev, void *data)
-{
-	struct lt9611 *lt9611 = data;
-
-	regmap_write(lt9611->regmap, 0x82d6, 0x8c);
-	regmap_write(lt9611->regmap, 0x82d7, 0x04);
-
-	regmap_write(lt9611->regmap, 0x8406, 0x08);
-	regmap_write(lt9611->regmap, 0x8407, 0x10);
-
-	regmap_write(lt9611->regmap, 0x8434, 0xd5);
-
-	return 0;
-}
-
-static void lt9611_audio_shutdown(struct device *dev, void *data)
-{
-	struct lt9611 *lt9611 = data;
-
-	regmap_write(lt9611->regmap, 0x8406, 0x00);
-	regmap_write(lt9611->regmap, 0x8407, 0x00);
-}
-
-static int lt9611_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-				      struct device_node *endpoint,
-				      void *data)
-{
-	struct of_endpoint of_ep;
-	int ret;
-
-	ret = of_graph_parse_endpoint(endpoint, &of_ep);
-	if (ret < 0)
-		return ret;
-
-	/*
-	 * HDMI sound should be located as reg = <2>
-	 * Then, it is sound port 0
-	 */
-	if (of_ep.port == 2)
-		return 0;
-
-	return -EINVAL;
-}
-
-static const struct hdmi_codec_ops lt9611_codec_ops = {
-	.hw_params	= lt9611_hdmi_hw_params,
-	.audio_shutdown = lt9611_audio_shutdown,
-	.audio_startup	= lt9611_audio_startup,
-	.get_dai_id	= lt9611_hdmi_i2s_get_dai_id,
-};
-
-static struct hdmi_codec_pdata codec_data = {
-	.ops = &lt9611_codec_ops,
-	.max_i2s_channels = 8,
-	.i2s = 1,
-};
-
-static int lt9611_audio_init(struct device *dev, struct lt9611 *lt9611)
-{
-	codec_data.data = lt9611;
-	lt9611->audio_pdev =
-		platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
-					      PLATFORM_DEVID_AUTO,
-					      &codec_data, sizeof(codec_data));
-
-	return PTR_ERR_OR_ZERO(lt9611->audio_pdev);
-}
-
-static void lt9611_audio_exit(struct lt9611 *lt9611)
-{
-	if (lt9611->audio_pdev) {
-		platform_device_unregister(lt9611->audio_pdev);
-		lt9611->audio_pdev = NULL;
-	}
-}
-
 static int lt9611_probe(struct i2c_client *client)
 {
 	struct lt9611 *lt9611;
@@ -1174,6 +1139,9 @@ static int lt9611_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, lt9611);
 
+	/* Disable Audio InfoFrame, enabled by default */
+	regmap_update_bits(lt9611->regmap, 0x843d, LT9611_INFOFRAME_AUDIO, 0);
+
 	lt9611->bridge.funcs = &lt9611_bridge_funcs;
 	lt9611->bridge.of_node = client->dev.of_node;
 	lt9611->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
@@ -1182,6 +1150,10 @@ static int lt9611_probe(struct i2c_client *client)
 	lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	lt9611->bridge.vendor = "Lontium";
 	lt9611->bridge.product = "LT9611";
+	lt9611->bridge.hdmi_codec_max_i2s_channels = 8;
+	lt9611->bridge.hdmi_codec_i2s = 1;
+	lt9611->bridge.hdmi_codec_dev = dev;
+	lt9611->bridge.hdmi_codec_dai_port = 2;
 
 	drm_bridge_add(&lt9611->bridge);
 
@@ -1203,10 +1175,6 @@ static int lt9611_probe(struct i2c_client *client)
 
 	lt9611_enable_hpd_interrupts(lt9611);
 
-	ret = lt9611_audio_init(dev, lt9611);
-	if (ret)
-		goto err_remove_bridge;
-
 	return 0;
 
 err_remove_bridge:
@@ -1227,7 +1195,6 @@ static void lt9611_remove(struct i2c_client *client)
 	struct lt9611 *lt9611 = i2c_get_clientdata(client);
 
 	disable_irq(client->irq);
-	lt9611_audio_exit(lt9611);
 	drm_bridge_remove(&lt9611->bridge);
 
 	regulator_bulk_disable(ARRAY_SIZE(lt9611->supplies), lt9611->supplies);

-- 
2.39.5

