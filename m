Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AE1A08F62
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 12:30:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3DC10F077;
	Fri, 10 Jan 2025 11:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vs2P1TUv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4175A10F077
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 11:30:03 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53e3a227b82so1730131e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 03:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736508541; x=1737113341; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=W/tqSb31qGGCwBlb1m0/W2hThVfhbDZ9QU4QBFYB05E=;
 b=vs2P1TUv8GQaZHMe5fUTwI2VErNR+W/3LL7zQklAzaBdzAXdR3GL0Jcd9rQikJY1UW
 TicMFJ+1Ng7rc0Rr7/BEXtt4TGaRn5Mwde4g09abfWXW/DgVqedfVjVkLA7LE9Sxxrod
 /1pdvC9lxJsoIkQdpHb1SzDy4I2lvmNmSte+PoITmwEO8SAMgqOGuHBz8XVcQBA/fBkt
 hK+54MhWEyLxC4Gd3sqYPuBxez5UEOhzfhdM6tNMsl5wt5sfmGL8uDYfNKAiX8H043Wk
 /zPg8srT8qm16viRtuTZupaRFylYkpz/HQxMvVgBfb6KhPKq1dOwnylcWEtrkRUuOJkt
 bUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736508541; x=1737113341;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W/tqSb31qGGCwBlb1m0/W2hThVfhbDZ9QU4QBFYB05E=;
 b=xTyshQC1p9BY0EAJQroNroFpB6R2bZ53Bcs81kCpnlRUssqOnmyjNXlnpK3nqtTgi3
 xp5RrADAhC10IwI3E2l4FSe/p3lFYmF6dzCDvYDBSRtBGgciM6rUsz6d+FzsO3syfJqJ
 ZPMTmjxCAkpa0Swm1PPt5c3FynjoeJGsUbQm1MpHAu85INyjhdvtJqV5p5L81nuKhpew
 qY0saiPGKzca2YNdhHa1rU97mFIaLBk1cKS4fGbIj1PKRji0aXrHUnxPT/IcJ8Nh7rHG
 7e8ldur0vcMcvaGQrCvic1ZuwKbz8k9mQ5o4I3ZUx9sA1mNgbSPZB9zNQ+IpOJQ3VySr
 uVHw==
X-Gm-Message-State: AOJu0YwH6T0473AoEiz1jbrrYf39AuGkS322EFfxSW+6zH+c01UqX/Hf
 aZae+yavZar8O5updZkEQsS/mp+/aZhtQFZi/AOS98HlPNwgg9Kh8EpzoTqP/Sc=
X-Gm-Gg: ASbGnctZgdmkf3T5/AzYIUQkA9/ZbcNAJlS3HCJM6j0AHiXQgRYRCQfqvvZtpD+LeIm
 X2AJgN/xbCjhfESG2QNuyuyxqyRJ8rKfsCIZvlys1Lo8gm8XtZ7QiZouEg4vZvqJ6m+JsX8RjN8
 xlnAtnsb3M5gZmFgqMnUNSJWhFd0LWXVUMQehs/FcfpJCN90Pz42exbQt/eRm8w46orh/KV5GWO
 yJ495b7CBz2cG1rpPEa1a85XnE4PNhj3Ef8pdPeJ9MKZGy0R4+4kN60QjIIRfQj
X-Google-Smtp-Source: AGHT+IHhxltgCHaHz0RpWVzZinhG2zG9rGhewcWu1qAIsyOS2v+ld6wbJKx2apoM8Z8I5cqyOGcYjw==
X-Received: by 2002:a05:6512:114f:b0:542:1b6a:b476 with SMTP id
 2adb3069b0e04-542845a6e3fmr2961801e87.7.1736508541496; 
 Fri, 10 Jan 2025 03:29:01 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff1c78e8sm4711081fa.86.2025.01.10.03.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 03:29:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 10 Jan 2025 13:28:48 +0200
Subject: [PATCH RFC/RFT v2 5/8] drm/display: bridge-connector: hook in CEC
 notifier support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-drm-hdmi-connector-cec-v2-5-9067c8f34663@linaro.org>
References: <20250110-drm-hdmi-connector-cec-v2-0-9067c8f34663@linaro.org>
In-Reply-To: <20250110-drm-hdmi-connector-cec-v2-0-9067c8f34663@linaro.org>
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
 bh=b4oCscnxFqOQjxw6r241dx0Y/7ZqV4V9S3UFT8VHuZw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBngQRu1ODTVx+2MoDccv0P1SZLBZWClocFuvy4c
 PA43qEOuH6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4EEbgAKCRCLPIo+Aiko
 1ckdCACEbgQTQdXF1XWpi5tWWZLD92j+uV6osStPBSjAefbhu/oGntH4J2FGKB/iPRxkMzGuDsw
 1DP8jcxUNWsv35adX2J386EK6JGsdtrvcjD1RDUggYSw4RMNgOCnWW/b3X+g+yZgd0VqNFP4y9H
 XkP68ut+b0/MuQwKkCi3KBuBCN7v8rrtMxLFNjHmnw13CXrhMIVzhfpsjB7foomi/vadfoZpbkd
 g4hUOhLlcVJbQXpsLkbrLRW1lCdPoCJv9TJYYyO+WxkLIIXODOVJWRjLW3rdYC69TL+Zb1sCaP/
 i2xGu0nIUxdGbLXsFNYOUcS6dMDJFBIY6qnSsydrAZFbmH8U
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
index 32108307de66560029ddf319169ac7d7e2af40d2..5f11243dea9c889e90a5074955f5a56208f8d622 100644
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

