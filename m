Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5E59E6B91
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 11:17:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554D510F087;
	Fri,  6 Dec 2024 10:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="km8QoTRR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980A410F093
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 10:16:57 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53e2baf3160so883989e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 02:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733480216; x=1734085016; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vdhbM8g3M0NP93FMRv6ZaSecbbnwku8p9d6VdNVGSLw=;
 b=km8QoTRRvQedoaoQcFUs41dF32QaL4GIkEZ5ErIUDz7tUDCfpxCv3IIyf1m0rgd7iM
 RbUU/6UM13tZ/CCciOHre/TmxzY9aTQnBbpiT3sFGF7GIoijjX2XEZcfMKD4rqHeGKtG
 IIqxc3XH22r8me/YQpgBFGFWbK3cWhhGfY0gbqufYlW2JAOgzS5sq/KIkBpi+IgmKwDn
 fhYFfHV9WXSuSX3mTspHj8XGN3YDAng2ptMmSnLIKM+qV2OK51V3nzD+8QFt2tsvcB4Y
 F0nI7nBJcCC6Ww3UwKJknoFbZDiSCX4aGry6ZSPqmw53V7A/GeLdJZoghvOZe2+PNzXW
 XKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733480216; x=1734085016;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vdhbM8g3M0NP93FMRv6ZaSecbbnwku8p9d6VdNVGSLw=;
 b=XzBlEk3c/oOqJv06rUtDBCQTNnx3kGNK7AiPvhenPCNP5GpsDS3gYBp7SRElfzw/yM
 +hnN0kbEpl+se3nJjFTAesvnwMD9scyjigaidf+YrkvK5qq5Iq844OhiEuF6/f7+PKPp
 j/H2IKr9w8MnWTN0SZNggpHQIZ+giTb8vsfobtSqOvzpen98MSo0hJ6VG62nsK2x443w
 ItTSxaL9hgZNiwraoqeWaR0rHN48L74z1n3CeiqsC1C5qzM/pppOPiHtWXQ0kKc8Rnom
 VnN7YvCWxkmrWGMaV8LDrROR2x0U+P7lkNQ8I0+n4wp6WP65BeVqxLP9b1ZOwNAKpAX8
 Iq5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYWmmzMvfRvdE8FrumFMc0ROp14VSeouQYmUhnDm3jivB94am9An1AC29Ilcw/ad2kkI1tKtHUXH0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUNAIVUMc50pXFHnyf/mwsV0UQjrzBTn4JXEzGh6Fdw9OhFE2Y
 G6+NkgXXlM5M1u598JQJ8cOcigU200uMNtnTbjFkKETKs/ujnNHuMEFpC7LHrt4=
X-Gm-Gg: ASbGncvZ0hqovWGPO7JoERt4pvywupCVWm5gB7B8atz45QBlNyliTMA897+EXwpVjxX
 kDkcPWMuYnCyclPDxDwXxqD/z3oS0yDxog/CE8VdgVXDOWSYGbCEaHtY5SpyCEePgxhI1gKbhL7
 3IC/1fqnlU2n1ut26WsvcnBGjeDJZDBeKh0x/8+4OpJ3mpQ2vi55hmD4EUjJVCXqpXMvtoUhN9r
 tAWMVSkTNEasUnXnmfITquv5BITP2skYczOS/E9uRhrlTsXT3yBDt2Aqw==
X-Google-Smtp-Source: AGHT+IHLAMrwNntawycHSzAoyVtOkC7Gtw6N52xdlcAMQPWcfc0l+WCOL0Lh45bakS9i5aF/g9qeYQ==
X-Received: by 2002:a05:6512:1594:b0:53e:284a:70e9 with SMTP id
 2adb3069b0e04-53e2c2f0085mr1211346e87.57.1733480215645; 
 Fri, 06 Dec 2024 02:16:55 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e2294738fsm462355e87.52.2024.12.06.02.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 02:16:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 12:15:59 +0200
Subject: [PATCH v6 05/10] drm/bridge: lt9611: switch to using the DRM HDMI
 codec framework
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-bridge-hdmi-connector-v6-5-50dc145a9c06@linaro.org>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
In-Reply-To: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7839;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+67Db5QR/nsja/ue4a+VGF3IOxdNSnDuXouI0gIrYtg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3rQeU6JW1urPoTcvv+n0cF5DfM82cKPquzdU2UEp+a8d
 Xf1P5rdyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJvOZg/6d1qv6zrv4+PZEE
 XnYWXQmH3C3vpBjnH3v4oaFKQqV17vf7M6fdfj33n6dt8K/mlGMhuj166gWtkdkBXt3foyT3pE0
 +XbWplHXd7EApkYa+IimTfR1KB9/UiE83Sr7Lpf+hNnhidYbSWVnf/k3zki80N78496XvfxGXxQ
 nvg6aVUxbMlWOoXc682meZS7L3D0HeAl/d7bdktOf5XHerm/9IjXHmzGO3dp5/p3SiNUJRXaP29
 iSFl4fui7s4J4vJLv8md+OMxNJZ79qS2n6e/et2cFaHW2aOBFMkr5cpj7BH5fTjAs89rD55bb4z
 aaq+S7G76c3nMowSK8SWMz1b8tUxpdjxWoH3GvUC1ccMAA==
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
 drivers/gpu/drm/bridge/lontium-lt9611.c | 170 +++++++++++++-------------------
 1 file changed, 68 insertions(+), 102 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 60b7305c0fd1935e35742713c78937392b7faa79..63aa751c412fb90d6edb4b5331138e94f19de37d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -45,7 +45,6 @@ struct lt9611 {
 	struct device_node *dsi1_node;
 	struct mipi_dsi_device *dsi0;
 	struct mipi_dsi_device *dsi1;
-	struct platform_device *audio_pdev;
 
 	bool ac_mode;
 
@@ -864,6 +863,10 @@ static int lt9611_hdmi_clear_infoframe(struct drm_bridge *bridge,
 	unsigned int mask;
 
 	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AUDIO:
+		mask = LT9611_INFOFRAME_AUDIO;
+		break;
+
 	case HDMI_INFOFRAME_TYPE_AVI:
 		mask = LT9611_INFOFRAME_AVI;
 		break;
@@ -897,6 +900,11 @@ static int lt9611_hdmi_write_infoframe(struct drm_bridge *bridge,
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
@@ -940,6 +948,55 @@ lt9611_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
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
@@ -960,6 +1017,10 @@ static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.hdmi_tmds_char_rate_valid = lt9611_hdmi_tmds_char_rate_valid,
 	.hdmi_write_infoframe = lt9611_hdmi_write_infoframe,
 	.hdmi_clear_infoframe = lt9611_hdmi_clear_infoframe,
+
+	.hdmi_codec_audio_startup = lt9611_hdmi_codec_audio_startup,
+	.hdmi_codec_prepare = lt9611_hdmi_codec_prepare,
+	.hdmi_codec_audio_shutdown = lt9611_hdmi_codec_audio_shutdown,
 };
 
 static int lt9611_parse_dt(struct device *dev,
@@ -1013,102 +1074,6 @@ static int lt9611_read_device_rev(struct lt9611 *lt9611)
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
@@ -1172,6 +1137,9 @@ static int lt9611_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, lt9611);
 
+	/* Disable Audio InfoFrame, enabled by default */
+	regmap_update_bits(lt9611->regmap, 0x843d, LT9611_INFOFRAME_AUDIO, 0);
+
 	lt9611->bridge.funcs = &lt9611_bridge_funcs;
 	lt9611->bridge.of_node = client->dev.of_node;
 	lt9611->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
@@ -1180,6 +1148,9 @@ static int lt9611_probe(struct i2c_client *client)
 	lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	lt9611->bridge.vendor = "Lontium";
 	lt9611->bridge.product = "LT9611";
+	lt9611->bridge.hdmi_codec_dev = dev;
+	lt9611->bridge.hdmi_codec_max_i2s_playback_channels = 8;
+	lt9611->bridge.hdmi_codec_dai_port = 2;
 
 	drm_bridge_add(&lt9611->bridge);
 
@@ -1201,10 +1172,6 @@ static int lt9611_probe(struct i2c_client *client)
 
 	lt9611_enable_hpd_interrupts(lt9611);
 
-	ret = lt9611_audio_init(dev, lt9611);
-	if (ret)
-		goto err_remove_bridge;
-
 	return 0;
 
 err_remove_bridge:
@@ -1225,7 +1192,6 @@ static void lt9611_remove(struct i2c_client *client)
 	struct lt9611 *lt9611 = i2c_get_clientdata(client);
 
 	disable_irq(client->irq);
-	lt9611_audio_exit(lt9611);
 	drm_bridge_remove(&lt9611->bridge);
 
 	regulator_bulk_disable(ARRAY_SIZE(lt9611->supplies), lt9611->supplies);

-- 
2.39.5

