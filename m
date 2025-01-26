Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA826A1C800
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 14:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D0C10E1DB;
	Sun, 26 Jan 2025 13:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sBEWK/F1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF84D10E1D2
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 13:29:22 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-54024aa9febso3873254e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 05:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737898161; x=1738502961; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WHkaqh97FX5NK3tiGexBaGATffLfTWz5HBGvpvU9JzI=;
 b=sBEWK/F1FXixR9sbBuettgbyqcvB/Owq8129oZ6ooQhiAZN/ECJ9CO0C1DUPIJJJWC
 /eey9C1js5uc/zEIFq+R94nsLI26rrsHF+AW9vDSF3WcCuJsb68L4C3bQ4MGKlrvwW/Z
 RzWahYn+vT99q5JqHoY7ZQClzxO72udVHvMdHxTYoycxjY89UXA/s+JTzGZzIRJH4L4J
 xx4sZpa+Abcw3VZigGVA9ouWxpa9jwloCXj3YYAbt8yyqXWNsmVs2o43bRgHch5TBrSL
 T1HV9bYteae3S/Ci+CE8Em/gIeJW6tiXKdqBuhPIgqRh/5sqfFEvYWnOBEDaNOFB6nbB
 SloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737898161; x=1738502961;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WHkaqh97FX5NK3tiGexBaGATffLfTWz5HBGvpvU9JzI=;
 b=CwSVmR0J/0iIKMcW83h9/VURNa7rGYQrl0AgVopcDKyEjpEImngnxEcOnY1UgDBgad
 wFgWuhLAMsYACV14CeFaBO9J9vKmqN2rlMGyCsL2THnQSmkJPR9F9skLPvV2M0Ryb5+0
 MVnFifZc8tyXnRTrxrYoJExYM++hds5ooDAuGfORBVlgsd6LipqfwCON/dlEgcszD7QD
 XhtJ5tNsyA9NRQHt2fODC2JZGS73hTtg8MLGBJB5FhRWYhSL3tjDnooVW2cOZ3lTmHAz
 j6pdGzQtMFaTf9K4OUtuvZ/ZhctFvq8vfGQx1x7Ut7BISsxA1WS7cPxsz2mqVcf1solZ
 vjMA==
X-Gm-Message-State: AOJu0Yy+mGWZhDiXW9OdVFhY0/eIn16Q/0EEXNehKkOT7H7XitD8A69p
 krgQ2uHwpaD+SI/AJpUAB7CeHvH9Ga1s9SuNdR0iAa29eGHzyx+1I0gA3YJrg14=
X-Gm-Gg: ASbGncuCdEXaOgM7rlaPRxjn0NedHj7P5T946+icEc1rFwG9+fGj7+DdurfmTPiTHAI
 KImWtKSdv4vvH9Cg9Kkz2rc90eTxLzs4ijaRzrW7aIy7mjhj+ropB3fx7+e4zWLfanV/WXCsNQ0
 oNUkTpCcfLNDz58sVXaA819bzSLeScfcWvXJyhvcgpp51UfONChOXDYncbqiZl5INNQ56ywk/BY
 5Uf+2xIghtfkSf4fM7Ci3eiLFYTDk/7gZo0OFx5e4DydRGTF/UQR4SpL1jGRxn/cxwOmd0ziVOB
 ZccD8v5Cp56yVbMMOdCr9ug=
X-Google-Smtp-Source: AGHT+IEmnk0UB4SJeTDzm9WgvYSNKbhk5XBGUNzl4sq2v2jpKfa3K9WebNLlF40lsVrNumqRwggjMg==
X-Received: by 2002:ac2:54b9:0:b0:53e:ca48:776e with SMTP id
 2adb3069b0e04-5439c282d8fmr9525511e87.36.1737898161083; 
 Sun, 26 Jan 2025 05:29:21 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543cbbd4cf8sm770488e87.201.2025.01.26.05.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 05:29:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 26 Jan 2025 15:29:10 +0200
Subject: [PATCH v3 05/10] drm/display: bridge-connector: hook in CEC
 notifier support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250126-drm-hdmi-connector-cec-v3-5-5b5b2d4956da@linaro.org>
References: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
In-Reply-To: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4084;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/jsOvxmo9hww94WNxXcKKcEbKigL+a1mybJ59QI/uaw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnljik10DbWjBxmbwXYxJDtHkvwc/vBACwPceo3
 MGJ1DGhS9iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5Y4pAAKCRCLPIo+Aiko
 1WbCCACSLcv6sQHDsQBgz28DGAgyP+HvXdXCf+ihbYLJzh1UBV2MgVhof0dsTHw/FLHvIiiQY4h
 MCVgx9bAxper6WX4WAfP5ym1uOIRDu/iBcWSqxJRgEb0hXWkKlnSbfJMD1Zl+djdFKpv4URB3tt
 EFCK2AtDdrysENkQep6Gjp7yuFOcsfine+21bXlc1paPI4jCj0tO/rKZbkQGyP/RZdgPNsh6oe8
 6GCiZ+5WbejS+7jSk6KbJR4DFt23xmcvJX+uTSB6QwTnTHaqwrxy5ehZOjvQofoZ7RwY8W+ghAt
 HANvEDZzfzcJNEm0obk/Y+mUs/jEeg00wMUIkqiLk6Gs9ZbU
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

Allow HDMI DRM bridges to create CEC notifier. Physical address is
handled automatically by drm_atomic_helper_connector_hdmi_hotplug()
being called from .detect() path.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c        |  2 +-
 drivers/gpu/drm/display/Kconfig                |  1 +
 drivers/gpu/drm/display/drm_bridge_connector.c | 11 ++++++++++-
 include/drm/drm_bridge.h                       |  9 +++++++--
 4 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 0df2c68e45897f2f2eed10a56dd670582526180b..158a4966ac00657074b11e93dc9bcab41c16db18 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1252,7 +1252,7 @@ static int lt9611_probe(struct i2c_client *client)
 	lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	lt9611->bridge.vendor = "Lontium";
 	lt9611->bridge.product = "LT9611";
-	lt9611->bridge.hdmi_audio_dev = dev;
+	lt9611->bridge.hdmi_dev = dev;
 	lt9611->bridge.hdmi_audio_max_i2s_playback_channels = 8;
 	lt9611->bridge.hdmi_audio_dai_port = 2;
 
diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 49da9b768acf3e5f84f2cefae4bb042cfd57a50c..d35d945a3811c30247a9f3e282a16c9eedd0d4e9 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -16,6 +16,7 @@ if DRM_DISPLAY_HELPER
 config DRM_BRIDGE_CONNECTOR
 	bool
 	select DRM_DISPLAY_HDMI_AUDIO_HELPER
+	select DRM_DISPLAY_HDMI_CEC_HELPER
 	select DRM_DISPLAY_HDMI_STATE_HELPER
 	help
 	  DRM connector implementation terminating DRM bridge chains.
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 0397e62f9cbc93321caeae99982f5e3c66d308c5..9f234bc647d5c0880d4c42aea130074b7fa54573 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -20,6 +20,7 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/display/drm_hdmi_audio_helper.h>
+#include <drm/display/drm_hdmi_cec_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
@@ -616,7 +617,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 				return ERR_PTR(-EINVAL);
 
 			ret = drm_connector_hdmi_audio_init(connector,
-							    bridge->hdmi_audio_dev,
+							    bridge->hdmi_dev,
 							    &drm_bridge_connector_hdmi_audio_funcs,
 							    bridge->hdmi_audio_max_i2s_playback_channels,
 							    bridge->hdmi_audio_spdif_playback,
@@ -624,6 +625,14 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			if (ret)
 				return ERR_PTR(ret);
 		}
+
+		if (bridge->hdmi_cec_notifier) {
+			ret = drm_connector_hdmi_cec_notifier_register(connector,
+								       NULL,
+								       bridge->hdmi_dev);
+			if (ret)
+				return ERR_PTR(ret);
+		}
 	} else {
 		ret = drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 4b84faf14e368310dd20aa964e8178ec80aa6fa7..1f1670e3c6aac39b8b891b0d5e7e91254eb0d3a1 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -914,9 +914,9 @@ struct drm_bridge {
 	unsigned int max_bpc;
 
 	/**
-	 * @hdmi_audio_dev: device to be used as a parent for the HDMI Codec
+	 * @hdmi_dev: device to be used as a parent for the HDMI Codec
 	 */
-	struct device *hdmi_audio_dev;
+	struct device *hdmi_dev;
 
 	/**
 	 * @hdmi_audio_max_i2s_playback_channels: maximum number of playback
@@ -933,6 +933,11 @@ struct drm_bridge {
 	 * @hdmi_audio_dai_port: sound DAI port, -1 if it is not enabled
 	 */
 	int hdmi_audio_dai_port;
+
+	/**
+	 * @hdmi_cec_notifier: use this bridge to register a CEC notifier
+	 */
+	bool hdmi_cec_notifier;
 };
 
 static inline struct drm_bridge *

-- 
2.39.5

