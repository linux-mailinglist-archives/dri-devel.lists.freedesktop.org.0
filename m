Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF50A24DBD
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 13:07:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E51F10E31D;
	Sun,  2 Feb 2025 12:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Xd0Bn1TF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167C110E2DE
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2025 12:07:35 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5401c68b89eso3189259e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Feb 2025 04:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738498053; x=1739102853; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FsVgp1pNTXgcNWpTze5zyA6a1PWwEI2e/0X9lqFORpw=;
 b=Xd0Bn1TFZ6PiHquQMQrz9YVHj+EE42+OnlYE4riCuUsr0+CE0Xsgvla9kJtLobB7dQ
 JcxRHIX5g7S4oKjYgdjj23h4o0ayujMf55g2tPce/ZFGNS3sj8wah+v6wsbHF88vfws0
 wUzfM6pcHWH0FY2qQzXCs2dWLnZUAoWwiDyWHnppXjXaeXZJies1Pb8uWMAcysMUbi69
 N+auItLZyS/d7q3pBxmD8p749bFg47nCHtht9Nv3w1EYGlyZ+fjO7jiLWpTGnZoHGcss
 wvU6E/DImyd8WT1wykDQeaWnu84UKAEkHItd/TAOqDUaK9coshxKwHVbr4ZRIp7Jn0iX
 c6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738498053; x=1739102853;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FsVgp1pNTXgcNWpTze5zyA6a1PWwEI2e/0X9lqFORpw=;
 b=t4txrcZiuMHKyxhhMvHq8WWfpE7RbqWZWx7qvIJR3a8GCzwtQ4XMrZt6joZqhKxlYZ
 24duwSVbVoeNufcI23dXToCrq5wR7rb9ueEJ6db6FkwOtAvIMGKBL65Na16QO3WVL5cR
 I5Wt6cVGiJoH7sXQSkWVgEKZ1a5AvRk/b1ymW0rqq4j5rbVA6EMUXGOQVMKNu7Z7Vvzm
 ECXoSEe3d2cUcYHI9h1XIgVX7Yj8sXVWZqhwN3h1deeQ4QVNQQCb4NFdknCsZzKeWOe/
 LFLAU3NTYEsVleUW4Zi3d5oXqH6apNHFU1XYq0kZgUM71jAXQflMUXor3qBBnmSRuuIN
 pSLg==
X-Gm-Message-State: AOJu0YzHOuZK0+uxnS5X4GdKfcvaGHAMvWW5hd4hebsudpyI64CzaFgy
 DzaGuLSNUXK1FgSC8Y4FrKeLIAXuMw4wYWEmwNYxc/XTgDSqtxG2GCX27RICO0c=
X-Gm-Gg: ASbGncsUD4B/iLw2Nr5yABwKDH71FFLaJqeRKPJoj4VqS0vo2BQetuk+b9offXX/lnT
 aD7QS47gUMtC6jVTaTjEic0EA1wGttAc11PiU1sTMBOPlzCc4A7Dj6vRIZg2CLZ+8h2AJApKV98
 zqXuOhO6BBvlQXbDrFszfOcRxHW5VuWuwOVwsHLZix9wTGnvCYQzRQFXodvh8lK3WJBVgvhayrR
 DekwBT6Puzfl4Hh8KPUT8vse0xL4/SxqlQWR31H7ZHf4ksGKnhT66aCTNdgMQefggeHeDLXNwH3
 s3uO9k0+opYG4d+jURd3p1s=
X-Google-Smtp-Source: AGHT+IH7oEk4SHP2d+vsxmLK49lixNRWAPfIkqrNwkwhCJ0IBozqe3pGshBvPVntmxxiEl5p0wn0jw==
X-Received: by 2002:a05:6512:33cf:b0:542:986b:de08 with SMTP id
 2adb3069b0e04-543f0f3ef1bmr2840275e87.26.1738498053262; 
 Sun, 02 Feb 2025 04:07:33 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebe10678sm960695e87.101.2025.02.02.04.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Feb 2025 04:07:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Feb 2025 14:07:14 +0200
Subject: [PATCH v4 07/12] drm/display: bridge-connector: hook in CEC
 notifier support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-drm-hdmi-connector-cec-v4-7-a71620a54d50@linaro.org>
References: <20250202-drm-hdmi-connector-cec-v4-0-a71620a54d50@linaro.org>
In-Reply-To: <20250202-drm-hdmi-connector-cec-v4-0-a71620a54d50@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4248;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0Zce2MHZUThwasIdDT6Yj7aAuEOuVKLQ5WS8bTZxlU4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnn1/v2814W6wzHi9b9UxiJ3usIcbsVCSnxz9Io
 6eJUmccRcWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ59f7wAKCRCLPIo+Aiko
 1VlnB/41c1gxQJ0w6maHBjQWwKZYqsk4UYRS7Tf/wuIhPJ91XlzjsXZxKE63cJvrEyg+PWD6Isd
 +6Ut7nn26cOjhLkWUOgySHH2iwufdpSt4BObRsC+j8+o4PNj/i5ArOtR1Uu3EGU3qPH+VQg4CfK
 HV+t5WonR+tif/VvS43aMlj8Twl2OYzRfe4Rcr9JOnS0FiedLnDQL9pFrVBgSkv5ingRl7DtL/k
 mmjBUE4KK6InYMt+gL52cRBF1FMyZpHbFfgpUfMBsZFlEMyDa9L2ornVn79lNlTknSEuhy8dLY+
 kJf380Tx5seBhxkjnd0vpOM2Y5K99HDYfJkYLdljb2zIeQPc
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

The drm_bridge.hdmi_audio_dev field is renamed to hdmi_dev to facilitate
that it specifies just the HDMI device, common to both audio and CEC
implementations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c        |  2 +-
 drivers/gpu/drm/display/Kconfig                |  1 +
 drivers/gpu/drm/display/drm_bridge_connector.c | 11 ++++++++++-
 include/drm/drm_bridge.h                       |  9 +++++++--
 4 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index e650cd83fc8d880012edb8a85c69b2f1d378f64c..41156aee5d9f1ecd7bd3f0aeb866487325063c11 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1138,7 +1138,7 @@ static int lt9611_probe(struct i2c_client *client)
 	lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	lt9611->bridge.vendor = "Lontium";
 	lt9611->bridge.product = "LT9611";
-	lt9611->bridge.hdmi_audio_dev = dev;
+	lt9611->bridge.hdmi_dev = dev;
 	lt9611->bridge.hdmi_audio_max_i2s_playback_channels = 8;
 	lt9611->bridge.hdmi_audio_dai_port = 2;
 
diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 3b8fc8f99a3d89741d863749c52167beaf7be2e6..adc4e2f48a20f6702f2b4729d1e720a5f27647f6 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -17,6 +17,7 @@ if DRM_DISPLAY_HELPER
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

