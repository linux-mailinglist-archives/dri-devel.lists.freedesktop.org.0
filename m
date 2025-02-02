Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9AAA24DC3
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 13:07:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E65B10E278;
	Sun,  2 Feb 2025 12:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mQNQnJ5f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0197910E278
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2025 12:07:43 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53e3a227b82so3086084e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Feb 2025 04:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738498062; x=1739102862; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+MoLTLfgvVTsssQwkzTJYb/dVBWcoZtvFgCsxLGAPgE=;
 b=mQNQnJ5fjuOgVavameAGqDWcJK7fpXmvq6sOXu9CgGxV+DX24CoieDBG9HJ+PD70sS
 yhBHV9ckrVTRlSNjTVZA4uU1vOkzDOUO/GmeR533QA84lHhK1aalRiLaPNLwa8q4nIFO
 Qth/laL1S9SOzfNGnsB3WtvONAtrswabvkczj6fsITtiBo9XSvRdnG+AUQvA/xKyrv3C
 nMwBOGxxT0wC1LT0bhGGGzoQ76c+3PDGOXgKFb6XZ1OMtHQYRzqCta3AxiKOYnO6De9R
 p7booaV2dcmaNaGjYdg6pNP7JqHb6ENlG093D0DWb0oHYuYYTxWeyw3D/pNdGOQChlK0
 iDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738498062; x=1739102862;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+MoLTLfgvVTsssQwkzTJYb/dVBWcoZtvFgCsxLGAPgE=;
 b=tyiJgapq6IlqLTTp4xPUUSnTL1hEINFI3r6su2icto3eLt7IVRQ9UGtR8c/ZdZtCFf
 ZYiibV8Of0dzuHEvhISQEoN7hV7eaaj8xe+Bw0jMkMTpedrTwMog92zTip/11I6JCZGm
 aFXnNVd/Ccks/zyD3Yf7h/22FSOyQ3l+7BLv3/OmmTHfPzmRCuyGtqQhDaJO81jZVRTx
 HfvKibzX+w/ewEV7pblkRHLluBJl6GZ04JM7BUh9c5IaCwzGy9RMIyhhG0S4PZjVxTBs
 /jDkxLM5g2mgadJuMEcRsfziAtcbrnhoe3wyF0prWy9kjBnOoYwNLsAZVSWVuBnjVRes
 zZYg==
X-Gm-Message-State: AOJu0Yw1Gyl045/KT/VwD1DD6K+25BUOJrX3Fu2FriLAOH6Pken8MmL/
 HIgg7Ba+NMd0iJ30RDCg9ePB1w+nmZ2IbG0rwoRBETePJ3exMNK4Sa10ZGDdvmo=
X-Gm-Gg: ASbGncuPthwspu3ZDECz7EC+dMM/ao9LlIIKwyhiceka5J0iqCADYDPnrlixHfhJUBw
 cXwHf1TCJkWA1uiTEN3Nr6dMsv+IS/lEzABL+RNKzY809zbZcW1wLg0XWFs807og7TTcKM8UR14
 U40rEdHnv5lqwnYIVWX6sdH97T1fZ8m9tFlc2rgExdKeMi1v6Ogh3+D51L6uiJp+nYiby6tYfQK
 k8NvHw9UCXcQoDxYKp7qgA/iOwvvFquZiTl95pTTxLl8EH454e/ZLo4muXRTShT4tdVbG9EpWd5
 a7LkdJXnfab7iGWnkpYjBsc=
X-Google-Smtp-Source: AGHT+IEUfKalUUWmsX+oOc7nb71WmMl6KQYlZpeoQhbwmbgJuGfKMeIWAK+je0Hh3gf7oZept1ESmQ==
X-Received: by 2002:ac2:4359:0:b0:542:63a8:3939 with SMTP id
 2adb3069b0e04-543e4bda7f7mr4400941e87.8.1738498062162; 
 Sun, 02 Feb 2025 04:07:42 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebe10678sm960695e87.101.2025.02.02.04.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Feb 2025 04:07:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Feb 2025 14:07:18 +0200
Subject: [PATCH v4 11/12] drm/bridge: allow limiting I2S formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-drm-hdmi-connector-cec-v4-11-a71620a54d50@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4155;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XuOnNZyKMEJb21dZJ9EH3JWXRxLeBXLJ2lTgW8+4Ysg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnn1/wiHzrUFyZRkzXg+ByNNejNZcYn/ntJumxS
 9JD2ckY6uiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ59f8AAKCRCLPIo+Aiko
 1ZaIB/9P498XbecyJ6BY6TpSBwrlCvRt4rxa7PvPWrV13TLDTs+X1LjJ24rZz+Qq0rjMnUDtBo8
 mMhyqMNGSjmGwz+xgpf2EiyXPJoDTUWv4RlWpevFe2FKXE7ZDI01M4ZedO/z/TBCaiORE+ky/bB
 LiMQQqU6JEM0WTatd3WuZTu7H//dzRLiHJhZwBaoFXaneIXnow+wJTpOv3GrXJ4NKWrOB0gEQwk
 QFn+Y/bhJ2xP4ALG4435t1OUdPWNWt0cC+vkGYwvn25Yjb44B2CqWA+xbd8Wo2ZeMCpI/pIQUM6
 WsPTDzmTmKtOdZiN68MGZaUqLtMdUKfjc9aLYmZrttcawjmU
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

By default HDMI codec registers all formats supported on the I2S bus.
Allow bridges (and connectors) to limit the list of the PCM formats
supported by the HDMI codec.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c  | 1 +
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 2 ++
 drivers/gpu/drm/vc4/vc4_hdmi.c                  | 2 +-
 include/drm/display/drm_hdmi_audio_helper.h     | 1 +
 include/drm/drm_bridge.h                        | 7 +++++++
 5 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 5b77fd59d79abddd419e611a7868b001857ccb37..28055bc2e7069d738bbe76b16c3bbde06f2d6e4e 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -698,6 +698,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 							    bridge->hdmi_dev,
 							    &drm_bridge_connector_hdmi_audio_funcs,
 							    bridge->hdmi_audio_max_i2s_playback_channels,
+							    bridge->hdmi_audio_i2s_formats,
 							    bridge->hdmi_audio_spdif_playback,
 							    bridge->hdmi_audio_dai_port);
 			if (ret)
diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
index 05afc9f0bdd6b6f00d74223a9d8875e6d16aea5f..589b0bd6c21366b83bd4d1131e89c71644ebc401 100644
--- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
@@ -154,6 +154,7 @@ int drm_connector_hdmi_audio_init(struct drm_connector *connector,
 				  struct device *hdmi_codec_dev,
 				  const struct drm_connector_hdmi_audio_funcs *funcs,
 				  unsigned int max_i2s_playback_channels,
+				  u64 i2s_formats,
 				  bool spdif_playback,
 				  int dai_port)
 {
@@ -161,6 +162,7 @@ int drm_connector_hdmi_audio_init(struct drm_connector *connector,
 		.ops = &drm_connector_hdmi_audio_ops,
 		.max_i2s_channels = max_i2s_playback_channels,
 		.i2s = !!max_i2s_playback_channels,
+		.i2s_formats = i2s_formats,
 		.spdif = spdif_playback,
 		.no_i2s_capture = true,
 		.no_spdif_capture = true,
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 1108983c44858382cb9f09b686956903645ebe0a..fcaba4a64a33b2267b22960772c2977b4109c67f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -582,7 +582,7 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 
 	ret = drm_connector_hdmi_audio_init(connector, dev->dev,
 					    &vc4_hdmi_audio_funcs,
-					    8, false, -1);
+					    8, 0, false, -1);
 	if (ret)
 		return ret;
 
diff --git a/include/drm/display/drm_hdmi_audio_helper.h b/include/drm/display/drm_hdmi_audio_helper.h
index c9a6faef4109f20ba79b610a9d5e8d5980efe2d1..44d910bdc72dd2fdbbe7ada65b67080d4a41e88b 100644
--- a/include/drm/display/drm_hdmi_audio_helper.h
+++ b/include/drm/display/drm_hdmi_audio_helper.h
@@ -14,6 +14,7 @@ int drm_connector_hdmi_audio_init(struct drm_connector *connector,
 				  struct device *hdmi_codec_dev,
 				  const struct drm_connector_hdmi_audio_funcs *funcs,
 				  unsigned int max_i2s_playback_channels,
+				  u64 i2s_formats,
 				  bool spdif_playback,
 				  int sound_dai_port);
 void drm_connector_hdmi_audio_plugged_notify(struct drm_connector *connector,
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index b55e80a57758e8b652eac0cd01cb245a04e221f5..3fcefe8c6720e193beefd7019fa456231181cddb 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -920,6 +920,13 @@ struct drm_bridge {
 	 */
 	int hdmi_audio_max_i2s_playback_channels;
 
+	/**
+	 * @hdmi_audio_i2s_formats: supported I2S formats, optional. The
+	 * default is to allow all formats supported by the corresponding I2S
+	 * bus driver.
+	 */
+	u64 hdmi_audio_i2s_formats;
+
 	/**
 	 * @hdmi_audio_spdif_playback: set if HDMI codec has S/PDIF playback port
 	 */

-- 
2.39.5

