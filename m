Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1919DF43A
	for <lists+dri-devel@lfdr.de>; Sun,  1 Dec 2024 01:44:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AAD110E5DC;
	Sun,  1 Dec 2024 00:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rsaTlBnk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A5810E3D7
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Dec 2024 00:44:26 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5cf6f367f97so3538114a12.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 16:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733013865; x=1733618665; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UmsNhbcOu0CL1PS3KGzwEdaRMJlXKDzwHWxwdzXZd0g=;
 b=rsaTlBnk/VbM2RXqX9Rc0GJ7FzecwJv2Nn/wispolBMMzoMEHQvBGzy4xcWwHyyD15
 fJYIYWpjxzQHWl7fYihc3UtRNcmT7humJrTR+cAqBmyxVCJKxhxXMtxpGx5BNLEaVjps
 q2m4mY7w3DiVY+rjVGMcEKXLawh4YhmqqqrTK1jjmaUibjURQtWsUg/we0fL5Vrsc3ve
 m2JPJzVokareRIHjuxUd7RD5R+xfXmb36APwVk3sz7kmhj2TD58CfS1jKEzi81EbKOcU
 NdazKIZe+QBOJHqgPuK9HQ7TaGlYgoTOeF2TsbXa1lE/0N0JD+BZ5CaM/t3j4lqBTIU8
 Jfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733013865; x=1733618665;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UmsNhbcOu0CL1PS3KGzwEdaRMJlXKDzwHWxwdzXZd0g=;
 b=krNYlqnfsMpmlzodbll8cF+AHdZU5WDoAXPU3pSNqIEyAzj6AbyB1lvjdE6o9IpJtz
 +/VBEz18GCmpPL2F0oy34yjyS54eu8tu+wg9XIhJLy1kDyGGvVcpBCgA4uzcm4D6HxrZ
 G1UiWKekYoA85CLsVMFvkRokqSO0Bw5aCNDW4ONyNkkywz0+dLvrp1iN3F454TFDxfhw
 6urZy83iV6ircx0tK0MfZ+uJ4T1cyugriB246Ek9yAjQ8W+cpciXYM/wvdS+u4JDfhJ7
 JEkChUpqVKMEOLfdthsO06IE9SHAyIbJ/EvtZS0VoerhNGFIVsmWyJC1mS1snfjhSbmY
 +VsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwo1iL7R36tuNdGkeJOfb/fR+YOM5dL1aSS8rWbP3RB/g4wE96ycVx+L/aZ3B/vZC4mZgyXKq3BDA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7wYgOSQQmqPE8P9Q/iitOZn20sydSSV/+TL2zX2YjmTa/D/YC
 JXaZS0erzC5J/GwQG1UU/Wh+ZJsQ2xWxV+yYrC4F0GelR+FPweON0zroLrvTydo=
X-Gm-Gg: ASbGncvX1qEDI04CBeP9Q9nO2mR41Dt9vhGYOJzu9AXJAKC9LP5oR75pAQT+HeGpkO7
 oW5ovvpm340JOz7/YJL8vo9B6Ft3WlrMMTs8PDPAJ2oCZ/Pm+VH2vnPdhhcRtm8dng3sAUk0VzM
 wogP3pZ6eNyXeh4pw2/HyuzEL7LR1CIkfRv8NSZNCB73ChKAncqsL+KLXPehiO/UIl9FIWZA1Sm
 8o7c4Wx4GtA/c6Yd82YepYhT6NGK9UNiXYngPQawgf3eu+zR8qsMacU+A==
X-Google-Smtp-Source: AGHT+IEOQgCU/ciK2BLFt5F62aFll5Go0AsFhIY7tTp79PQBYDk+ZtnRfsWuOC/je2OdnLrhN75fLA==
X-Received: by 2002:a05:6402:3907:b0:5d0:d789:1aff with SMTP id
 4fb4d7f45d1cf-5d0d7891d9cmr1609710a12.25.1733013865221; 
 Sat, 30 Nov 2024 16:44:25 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d097e8d817sm3400359a12.63.2024.11.30.16.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 16:44:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 02:44:08 +0200
Subject: [PATCH v5 4/9] drm/bridge: connector: add support for HDMI codec
 framework
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-bridge-hdmi-connector-v5-4-b5316e82f61a@linaro.org>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
In-Reply-To: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6723;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=VCAvQVMxBhx8BnYWztLsVnSCZi3RzfwM/RTfomnZ9hc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS7FYyGqWCdvL/agCm3oxLGVFMzbydzZgwc5DM
 q2eeG2nwdiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0uxWAAKCRCLPIo+Aiko
 1XpTB/9Cgu7H+ULeYHSkB+Ullw1WhHtCEAurZAaD/vRAak11AeLncSmVHPKEONzTxv9lc6+qMRw
 0ZHgk7AbwW3rY1WIvvzV+xdktOFP5pqYPG0nsqCM8a/tfbjLV+OdHUsPQHREwGdD7LWooD+rdpU
 bOoFqrkhfIZBjAECg0Im300H/CtCIZKYWv4ctOqXdvrpIPJUlSxnPds5ZcAgBkA81L37EFaknM2
 DO0g+bf7X1Wlx/5qs0za+0xre+4sYRFXvo6sblVTJliJ4NLFTu3Qcyrit1FIp02HfUao1TxjLx0
 lvKFEyqr/++yUZm4hijRiHmxky7ypJVh24iYA2pEgx5Q0dX6
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 95 +++++++++++++++++++++++++-
 include/drm/drm_bridge.h                       | 23 +++++++
 2 files changed, 116 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 320c297008aaa8b6ef5b1f4c71928849b202e8ac..12ab9f14cc8a8672478ae2804c9a68d766d88ea5 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -20,6 +20,8 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
+#include <sound/hdmi-codec.h>
+
 /**
  * DOC: overview
  *
@@ -354,10 +356,80 @@ static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
 	return bridge->funcs->hdmi_write_infoframe(bridge, type, buffer, len);
 }
 
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
+	if (bridge->funcs->hdmi_codec_audio_startup)
+		return bridge->funcs->hdmi_codec_audio_startup(connector, bridge);
+	else
+		return 0;
+}
+
+static int drm_bridge_connector_prepare(struct drm_connector *connector,
+					struct hdmi_codec_daifmt *fmt,
+					struct hdmi_codec_params *hparms)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	return bridge->funcs->hdmi_codec_prepare(connector, bridge, fmt, hparms);
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
+	bridge->funcs->hdmi_codec_audio_shutdown(connector, bridge);
+}
+
+static int drm_bridge_connector_mute_stream(struct drm_connector *connector,
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
+	if (bridge->funcs->hdmi_codec_mute_stream)
+		return bridge->funcs->hdmi_codec_mute_stream(connector, bridge,
+							     enable, direction);
+	else
+		return -ENOTSUPP;
+}
+
+static const struct drm_connector_hdmi_codec_funcs drm_bridge_connector_hdmi_codec_funcs = {
+	.audio_startup = drm_bridge_connector_audio_startup,
+	.prepare = drm_bridge_connector_prepare,
+	.audio_shutdown = drm_bridge_connector_audio_shutdown,
+	.mute_stream = drm_bridge_connector_mute_stream,
+};
+
 static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
 	.tmds_char_rate_valid = drm_bridge_connector_tmds_char_rate_valid,
 	.clear_infoframe = drm_bridge_connector_clear_infoframe,
 	.write_infoframe = drm_bridge_connector_write_infoframe,
+	.codec_funcs = &drm_bridge_connector_hdmi_codec_funcs,
 };
 
 /* -----------------------------------------------------------------------------
@@ -459,7 +531,25 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (connector_type == DRM_MODE_CONNECTOR_Unknown)
 		return ERR_PTR(-EINVAL);
 
-	if (bridge_connector->bridge_hdmi)
+	if (bridge_connector->bridge_hdmi) {
+		bridge = bridge_connector->bridge_hdmi;
+
+		if (bridge->hdmi_codec_i2s ||
+		    bridge->hdmi_codec_spdif) {
+			if (!bridge->funcs->hdmi_codec_prepare ||
+			    !bridge->funcs->hdmi_codec_audio_shutdown)
+				return ERR_PTR(-EINVAL);
+
+			bridge_connector->bridge_hdmi = bridge;
+
+			connector->hdmi_codec.dev = bridge->hdmi_codec_dev;
+			connector->hdmi_codec.i2s = bridge->hdmi_codec_i2s;
+			connector->hdmi_codec.spdif = bridge->hdmi_codec_spdif;
+			connector->hdmi_codec.max_i2s_channels =
+				bridge->hdmi_codec_max_i2s_channels;
+			connector->hdmi_codec.sound_dai_port = bridge->hdmi_codec_dai_port;
+		}
+
 		ret = drmm_connector_hdmi_init(drm, connector,
 					       bridge_connector->bridge_hdmi->vendor,
 					       bridge_connector->bridge_hdmi->product,
@@ -468,10 +558,11 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 					       connector_type, ddc,
 					       supported_formats,
 					       max_bpc);
-	else
+	} else {
 		ret = drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
 					  connector_type, ddc);
+	}
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index e8d735b7f6a480468c88287e2517b387ceec0f22..0ef9580ef6669f84327bdcb85a24fc83f76541bb 100644
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
@@ -676,6 +678,21 @@ struct drm_bridge_funcs {
 				    enum hdmi_infoframe_type type,
 				    const u8 *buffer, size_t len);
 
+	int (*hdmi_codec_audio_startup)(struct drm_connector *connector,
+					struct drm_bridge *bridge);
+
+	int (*hdmi_codec_prepare)(struct drm_connector *connector,
+				  struct drm_bridge *bridge,
+				  struct hdmi_codec_daifmt *fmt,
+				  struct hdmi_codec_params *hparms);
+
+	void (*hdmi_codec_audio_shutdown)(struct drm_connector *connector,
+					  struct drm_bridge *bridge);
+
+	int (*hdmi_codec_mute_stream)(struct drm_connector *connector,
+				      struct drm_bridge *bridge,
+				      bool enable, int direction);
+
 	/**
 	 * @debugfs_init:
 	 *
@@ -859,6 +876,12 @@ struct drm_bridge {
 	 * @DRM_BRIDGE_OP_HDMI is set.
 	 */
 	unsigned int max_bpc;
+
+	struct device *hdmi_codec_dev;
+	int hdmi_codec_max_i2s_channels;
+	unsigned int hdmi_codec_i2s : 1;
+	unsigned int hdmi_codec_spdif : 1;
+	int hdmi_codec_dai_port;
 };
 
 static inline struct drm_bridge *

-- 
2.39.5

