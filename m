Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8836A9FA973
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 03:59:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2542910E2E6;
	Mon, 23 Dec 2024 02:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="B5eZrUV1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B6C10E2DD
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 02:59:11 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5401ab97206so3823522e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 18:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734922749; x=1735527549; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=z2q30FiU2kdxdOy5ojiv04mf5uaTWBkcHZl8lzfDLTc=;
 b=B5eZrUV1RULs/kEfeqn3RqiwoeRuhSs9/5l5eM0Bkl6qb4PDL9rQQBcfPaVpQMp7eh
 yJ/ofjwqBgw6wiIcHmLDpr4E5J3TOpv+6dn10vT//P9lkCF+tbFZ37PuSCXsBpTZUvEa
 93YpD3RysmTsVSjXEx5DOUbeDNSaFzOSILzX4lxZPgz2HzN/IyKA2xQ3xD6QbWWS1JAd
 PpPD3YbwU223wXyPSCkssK8jJWj+DDpeQIXTW61I+cDCoRjFslkIHmTIXaGaHASbNhTR
 1VBlr5VzczMTvXFThg/JICF4xXQrvXsilhggDLlxCZyLZz75+i72rqOkTx4cY6OxdQkM
 PCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734922749; x=1735527549;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z2q30FiU2kdxdOy5ojiv04mf5uaTWBkcHZl8lzfDLTc=;
 b=mVsKSXUL2P6XN4mjGTkI0tOfnBzjFWuyxyH0NyJJKncloPaLiC3BPA81UYsQX6IAvf
 yXde6CWhbCI+C910sq7Dj0akbOTxpqfzBa+Dj3Y4IcMbUDAiFNcYtEpLC4B9kNfRNQZs
 GL2cRBz+boYapShULwU+gw/SFrE/hL2ue1/dfF/eZt9rIMMI1Wk1a6fjuI9Ze7pcHGXV
 QuF5fPgur4oPUpaziQkXg4ULyd/nWjynx4RsoJS2vXZwguzKt8I5gPSj2Hd+cykKObbx
 0lh0ueU5RIjFueBu15H8sCDqnD612FJTYQ2MchR/GCh2alambFUFI6TEbYJ5SdxEfpR5
 3iow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnun2prd6eGKGpLoEqWJ6TV1H0gRjw+CdEI3PsslaV7Akqg1Km97/hIRIAHUsqJGxhb6g9RfFfdL8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxia6c3P9zuEZ0T0mm7zl4Rde/ufAQfmsP68aPV9F+6qAmbuMJN
 1Ngmprpx3q7x+MjBly10jPPO4liovUIMqhBx8eu3Nv33wF0nf3otA6cV8Qj7+fo=
X-Gm-Gg: ASbGncvhAfLA4Jmv74fMOAcFmwaEHYqWVx5L/rRzduIkw6f2BILYplL7jobS+MlEctY
 y7JXpNbjw9QZJCNenXXDSJtGpMZ0WGWjPimQM55wMpSScE2qmexo4/M0xxZoD0IauFCYpLYJHWb
 AppLKUxiTTR81IuGao0KImVEw6vRWFZSQMejt9XyyBgpVa7hVNP8dbp+op0CtqVUYIZPNeETncc
 wLqdlZPq9vtNeEwWikgzt9Rud1wnLYTxqq+183GlJMF/vIbcGQ8WCA2fcCeFZ4G
X-Google-Smtp-Source: AGHT+IH+mMgpSqhLtPYkVEl3FHzfsrqM03yK9hRbUUbuApkQNkBP+dvHvKVpZfEnRZpArS5q37sUhQ==
X-Received: by 2002:a05:6512:31c9:b0:53e:385c:e881 with SMTP id
 2adb3069b0e04-5422954fdbfmr3519417e87.30.1734922749388; 
 Sun, 22 Dec 2024 18:59:09 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f658csm1124639e87.44.2024.12.22.18.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2024 18:59:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 23 Dec 2024 04:58:55 +0200
Subject: [PATCH v9 04/10] drm/bridge: connector: add support for HDMI codec
 framework
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-drm-bridge-hdmi-connector-v9-4-6ce16bcedb8b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8338;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=RBM60iOxkLJyQvTNN0AaiJOF4HQpHrP/kUP+6DoQeY0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaNHwnE0JYGY6NP3rLNpXqyf/jktH+BKkquwP/
 67ItmyPiKeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2jR8AAKCRCLPIo+Aiko
 1Zt7CACu0yqgD9WAAP9js9rcvcVUnaamUpB9QHQdo+992jjDsOP9jMdhI5P5oKMAmJ8caO9rZ8+
 SdEaD7APc/due+nPGqUXLlpQ1vsA3EsCbYtCfU+WqQeaAmOWJFFD+DaCbPEMS+etP9To+xNrRf0
 V1fallFpp5G6/ObujHPC0dlDIvkPcExaZ9i+mudSwjwthRoGKXDOrS8yrJw8Al9TTOlAYfVEKi3
 lFi7DfltiXTwHPAvLK/Lk1hnnA+HSURJLHCDCSQYKaCx6tYvIh50MkBLDZm9zEX1sl1Wr6eKrT9
 CrO+Cw2snOtE78olOgcgOkkzPNzAEymav7MAxAlBfLCPEAl0
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

Add necessary glue code to be able to use new HDMI codec framework from
the DRM bridge drivers. The drm_bridge implements a limited set of the
hdmi_codec_ops interface, with the functions accepting both
drm_connector and drm_bridge instead of just a generic void pointer.

This framework is integrated with the DRM HDMI Connector framework, but
can also be used for DisplayPort connectors.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/Kconfig                |  1 +
 drivers/gpu/drm/display/drm_bridge_connector.c | 98 ++++++++++++++++++++++++--
 include/drm/drm_bridge.h                       | 74 +++++++++++++++++++
 3 files changed, 169 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 80c1953cac14a088d764acd45df03debfcb95e7c..2619fa2476eb149e1befc3135131ed5aaeb5bb4c 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -15,6 +15,7 @@ if DRM_DISPLAY_HELPER
 
 config DRM_BRIDGE_CONNECTOR
 	bool
+	select DRM_DISPLAY_HDMI_AUDIO_HELPER
 	select DRM_DISPLAY_HDMI_STATE_HELPER
 	help
 	  DRM connector implementation terminating DRM bridge chains.
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 512ced87ea18c74e182a558a686ddd83de891814..cc955ee008d843d73fedb891e97143a4168fd311 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -374,6 +374,75 @@ static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
 	.write_infoframe = drm_bridge_connector_write_infoframe,
 };
 
+static int drm_bridge_connector_audio_startup(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	if (!bridge->funcs->hdmi_audio_startup)
+		return 0;
+
+	return bridge->funcs->hdmi_audio_startup(connector, bridge);
+}
+
+static int drm_bridge_connector_audio_prepare(struct drm_connector *connector,
+					      struct hdmi_codec_daifmt *fmt,
+					      struct hdmi_codec_params *hparms)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	return bridge->funcs->hdmi_audio_prepare(connector, bridge, fmt, hparms);
+}
+
+static void drm_bridge_connector_audio_shutdown(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return;
+
+	bridge->funcs->hdmi_audio_shutdown(connector, bridge);
+}
+
+static int drm_bridge_connector_audio_mute_stream(struct drm_connector *connector,
+					    bool enable, int direction)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	if (bridge->funcs->hdmi_audio_mute_stream)
+		return bridge->funcs->hdmi_audio_mute_stream(connector, bridge,
+							     enable, direction);
+	else
+		return -ENOTSUPP;
+}
+
+static const struct drm_connector_hdmi_audio_funcs drm_bridge_connector_hdmi_audio_funcs = {
+	.startup = drm_bridge_connector_audio_startup,
+	.prepare = drm_bridge_connector_audio_prepare,
+	.shutdown = drm_bridge_connector_audio_shutdown,
+	.mute_stream = drm_bridge_connector_audio_mute_stream,
+};
+
 /* -----------------------------------------------------------------------------
  * Bridge Connector Initialisation
  */
@@ -473,7 +542,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (connector_type == DRM_MODE_CONNECTOR_Unknown)
 		return ERR_PTR(-EINVAL);
 
-	if (bridge_connector->bridge_hdmi)
+	if (bridge_connector->bridge_hdmi) {
+		bridge = bridge_connector->bridge_hdmi;
+
 		ret = drmm_connector_hdmi_init(drm, connector,
 					       bridge_connector->bridge_hdmi->vendor,
 					       bridge_connector->bridge_hdmi->product,
@@ -482,12 +553,31 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 					       connector_type, ddc,
 					       supported_formats,
 					       max_bpc);
-	else
+		if (ret)
+			return ERR_PTR(ret);
+
+		if (bridge->hdmi_audio_max_i2s_playback_channels ||
+		    bridge->hdmi_audio_spdif_playback) {
+			if (!bridge->funcs->hdmi_audio_prepare ||
+			    !bridge->funcs->hdmi_audio_shutdown)
+				return ERR_PTR(-EINVAL);
+
+			ret = drm_connector_hdmi_audio_init(connector,
+							    bridge->hdmi_audio_dev,
+							    &drm_bridge_connector_hdmi_audio_funcs,
+							    bridge->hdmi_audio_max_i2s_playback_channels,
+							    bridge->hdmi_audio_spdif_playback,
+							    bridge->hdmi_audio_dai_port);
+			if (ret)
+				return ERR_PTR(ret);
+		}
+	} else {
 		ret = drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
 					  connector_type, ddc);
-	if (ret)
-		return ERR_PTR(ret);
+		if (ret)
+			return ERR_PTR(ret);
+	}
 
 	drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index e8d735b7f6a480468c88287e2517b387ceec0f22..4b84faf14e368310dd20aa964e8178ec80aa6fa7 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -41,6 +41,8 @@ struct drm_display_info;
 struct drm_minor;
 struct drm_panel;
 struct edid;
+struct hdmi_codec_daifmt;
+struct hdmi_codec_params;
 struct i2c_adapter;
 
 /**
@@ -676,6 +678,57 @@ struct drm_bridge_funcs {
 				    enum hdmi_infoframe_type type,
 				    const u8 *buffer, size_t len);
 
+	/**
+	 * @hdmi_audio_startup:
+	 *
+	 * Called when ASoC starts an audio stream setup. The
+	 * @hdmi_audio_startup() is optional.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*hdmi_audio_startup)(struct drm_connector *connector,
+				  struct drm_bridge *bridge);
+
+	/**
+	 * @prepare:
+	 * Configures HDMI-encoder for audio stream. Can be called multiple
+	 * times for each setup. Mandatory if HDMI audio is enabled in the
+	 * bridge's configuration.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*hdmi_audio_prepare)(struct drm_connector *connector,
+				  struct drm_bridge *bridge,
+				  struct hdmi_codec_daifmt *fmt,
+				  struct hdmi_codec_params *hparms);
+
+	/**
+	 * @hdmi_audio_shutdown:
+	 *
+	 * Shut down the audio stream. Mandatory if HDMI audio is enabled in
+	 * the bridge's configuration.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	void (*hdmi_audio_shutdown)(struct drm_connector *connector,
+				    struct drm_bridge *bridge);
+
+	/**
+	 * @hdmi_audio_mute_stream:
+	 *
+	 * Mute/unmute HDMI audio stream. The @hdmi_audio_mute_stream callback
+	 * is optional.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*hdmi_audio_mute_stream)(struct drm_connector *connector,
+				      struct drm_bridge *bridge,
+				      bool enable, int direction);
+
 	/**
 	 * @debugfs_init:
 	 *
@@ -859,6 +912,27 @@ struct drm_bridge {
 	 * @DRM_BRIDGE_OP_HDMI is set.
 	 */
 	unsigned int max_bpc;
+
+	/**
+	 * @hdmi_audio_dev: device to be used as a parent for the HDMI Codec
+	 */
+	struct device *hdmi_audio_dev;
+
+	/**
+	 * @hdmi_audio_max_i2s_playback_channels: maximum number of playback
+	 * I2S channels for the HDMI codec
+	 */
+	int hdmi_audio_max_i2s_playback_channels;
+
+	/**
+	 * @hdmi_audio_spdif_playback: set if HDMI codec has S/PDIF playback port
+	 */
+	unsigned int hdmi_audio_spdif_playback : 1;
+
+	/**
+	 * @hdmi_audio_dai_port: sound DAI port, -1 if it is not enabled
+	 */
+	int hdmi_audio_dai_port;
 };
 
 static inline struct drm_bridge *

-- 
2.39.5

