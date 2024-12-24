Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0D89FC2D4
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 00:11:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D7C10E2B8;
	Tue, 24 Dec 2024 23:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GS71nQ5+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6D210E2B8
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 23:11:33 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-3043e84c687so45690751fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 15:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735081832; x=1735686632; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/r+u0sZE5D8VurlC5VRIQEwPG+dElpWFh3HNgGqIo1o=;
 b=GS71nQ5+nCMUBpBQ4LaYT+d92tBjoCCMor+HRsG2ZwlUlQ7KdgbtDGxEEKfERNk5hs
 eJEK/lPNQRCAJCZmpWBblcApn3fp0d1jUZ0bbbbLcPvF7K4LCpt5yKqRS+fQSjs9Xpy4
 bPhuuaIT32kUcnwwyQMWFfykaUYaoPmnf7XXoPwYj3WwPHVSdJVqFA5TSsObdY8FehKy
 caZ4ByW2pfbyPU2Wa7EIWHPqFQXiKDCXTF7Euwu2fSPluHZbSKwsZiAh+5Z0OShfjizC
 wwx7CUNodtoGtgbIeTODv0Q28Lcr+XRLjrbryH2pY1/gsC2CsOdUQGVFtqgavr0LcYDB
 cL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735081832; x=1735686632;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/r+u0sZE5D8VurlC5VRIQEwPG+dElpWFh3HNgGqIo1o=;
 b=HcNPzr1Hm55qqe9hWlecOLCWT5R6qmkdeRkprKglpaoSAh8nS2Uh9ZKAwY3snIHeeQ
 dBCRD+ngs7VGyN8U/tbahQElUFbbdnJSJfTjyjHTT1GTfmEVdd2Etng8OZTHncnM3XRo
 POky6mogYGi0tDYDk9vuSVeYTSXzZLqYGUcOQ551o5/8dC5wJAonqt3Sq7C4hvM/wrA1
 x0ygozxY4e5/KdhMh/xTcjLUyufhBv2E4H11ovt8yQLP6zZverdqt5rJFl/HxjCmtXjE
 L5UMnwrdjRKofjf82G4Si/EgJYEbr1q8O4KBJtr11s1GZARtfKBbI+ZP1mkCJkH9AO5C
 YHww==
X-Gm-Message-State: AOJu0YwwnS1dnlt7VTOkK8Km2MtnoiC2JDd2p//SfhdqBE4pmE2udPJJ
 8HU555teIMs03hYDCIr0CP/iQrcUhZJSu0b1WHbi+mtvi8nfzR0EDzISUvNskGM=
X-Gm-Gg: ASbGncvyrdMSxLDxzpi9wdrB53f3XzwtNBuf1wxTWBWiKFtHEWU9xvpa91doNtJqBSG
 zlfwsD94s0ljD9jGzlPoc47gxrYcCGd0JiRhk6QLHahXh/8tJljlKOcjgTGfFB4DiucKJ3QEBG7
 iAelZKwgqcct/9yR0X5ejtKprdGbVCi3bjI0tLLPSG4XVSDh9Lsw/bukY77JSiXKF2MoZrAlgbV
 DlS2AIw2DwBfZlfdcpfEj8zZ+GoWM3aw1UeISVQkxv3XKLW0XssONUkEoLtKQbk
X-Google-Smtp-Source: AGHT+IGjrUB2TLrzUQREEAc+sh0JQA205RIs49HjA/2I8kEtZbGCHfFtOhnbPSuud5zG5HU9ctH4Wg==
X-Received: by 2002:a05:6512:3f0d:b0:540:358d:d9b5 with SMTP id
 2adb3069b0e04-542294ae2e9mr5758211e87.0.1735081831786; 
 Tue, 24 Dec 2024 15:10:31 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f5f74sm1721283e87.43.2024.12.24.15.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 15:10:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 25 Dec 2024 01:10:14 +0200
Subject: [PATCH RFC/RFT 6/9] drm/display: bridge-connector: hook in CEC
 notifier support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241225-drm-hdmi-connector-cec-v1-6-b80380c67221@linaro.org>
References: <20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org>
In-Reply-To: <20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org>
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
 bh=90ejgcy/tGTeJU3XG+cQM6w/AiRHbpg85t5Qz6ihKHQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaz9W9t2brPmk3nz0O8zZEEUvpaYxz558zo7IB
 EI4VTfwLoqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2s/VgAKCRCLPIo+Aiko
 1XR3B/93XfwazjnkzjUluIQWuNP9h20/xSLWiT2KkQvFMkqFAKZl7sZlhjifLwUl2MZmr5AEEL3
 L8tbeBq8BCfg4VBQpUQAAuRudKXxW1tR+i1CMUTLwXsBOa7//5ROpwTD/mCRf08JdN41ldhQ3O7
 m1WEVTps/Hq4l/NCD3dScYOHgWk9+yL0RJ7EaWWeO3wJhAmuDehNEcHjiP0Iy5DpyxNeSRrNzFd
 +P09EG4eTy9xsaQyPJrylcXpYrTrebv+3xReXzQBvNUv+KA0lZkLbh/PSjUYzXncj3UR5mXuN70
 dU3h/5S0IE0oGZcH8i2ZzjLG8kOlyzsk1rZM8/lugPxohmXz
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
index e53f01681b795c41879167d066d382952bf50bce..291abb4bcfefd12e1a57a22ba5ccce21c15196a4 100644
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

