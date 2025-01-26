Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7014A1C804
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 14:29:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2B710E209;
	Sun, 26 Jan 2025 13:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ETVD+Xjs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953D410E1EB
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 13:29:32 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-54024aa9febso3873332e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 05:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737898171; x=1738502971; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HGhjmb+uqSqvkEmufcjl2V40+leLLjqR5nwVjQpnnDA=;
 b=ETVD+XjszWmYGvGW/vnZfhkLeRnk0BbA5h9NXLJHCedm0cOKC6OOrIhACvRoU/x5ld
 KD+g0TuH/HqHhPdE9pAR+jwWiEUfh24iiP5dB/Qww8snpS3G9HltrS65l0Sh4SWK450Y
 9LaB1ArDfJ8IQZBju8rrcV2XWSCgcw4zdbrouA58zLus9bUFARH8G+BPEr9Lhvfp2aeo
 Z1d842aa2D83KsWHasldxvB+epVsq7dwOqTKJBuh3NthmxAlEdrKmYVXK0mhL1xaph/Z
 g12nXj6ICW5A54vOrPlhR2tMgpDtW4zRsCDbu2aWkyPYNZzr+FVQiOu8YBKjUJ1VGW7l
 nsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737898171; x=1738502971;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HGhjmb+uqSqvkEmufcjl2V40+leLLjqR5nwVjQpnnDA=;
 b=MEvx9KWx07zlEMguZMyrgVQBTyjE35o2yzwxybAngyBuRua6z/8B0looEyfZ0Vl9tl
 EV88EqL1JpAVMz6t8l6ZrRgX9zcrmGIvtL3ObFByYtzKWH74S03xfwxxGChKn9Y5+7YW
 K9Rc9LbhWJldJ9JEPqBQ7KBzWFacIr3dpHWVGrldy38c22FooMzqjI+a6HwU9FPGvo7E
 c95fYChMPlaoccWmp6FnIhRSBLX5EirVS9NQDlIEzrePC/vI9QWskKLnYJRsrwMgV48c
 yXFVQpDBGjK7YhfAnngk5HipjZw4ZJ0JUH13s2GOknMakgLrycYMN2J8lCOgG17TwHwq
 xgmw==
X-Gm-Message-State: AOJu0YwuucF6CHLC70iJfvEged9SwIkZqatlWPhTZoO0xohPEWSIgpDe
 dJubvK5m6VPbDTtEA0qlarOrIkJRMwqkV756JjflRx98UfjqPDHvNk723dZd6VE=
X-Gm-Gg: ASbGnctrq7WAUFLcMvIqcx7q5PgaKwBkulIQLEYjF6QQUHp778MvbMX4wim54riI5lO
 ft42PmYB8APf412He67TcWrcNYmLF861nTfjLCI8UY7sWkHp5oStnj5RfEg9JokSZdQaAbqRbjU
 pauJI7yNZLwoVE8BU3wrxLjAzmqhmp+8VZzNpjB3Zx8L4TzIjY1vMyKQl37Xgb420cj0DTK3YX/
 FWBhiudtR1Qnzfba7jiHshyEFVdTApsIIqoQvlxV8pgpjoo86W1TqFvTv3M41Q5079rH4Bj7f/t
 ylHGAUkxEqT9
X-Google-Smtp-Source: AGHT+IHJn1KiUo3Vc8J9Cci15tlfKfpOBbrYT330xqlvaSxCSdV7Lx8S0XyWdDjQ64i5ZLK2+EFYeA==
X-Received: by 2002:ac2:4acb:0:b0:540:1a0c:9ba6 with SMTP id
 2adb3069b0e04-5439c282d2bmr11295775e87.34.1737898170829; 
 Sun, 26 Jan 2025 05:29:30 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543cbbd4cf8sm770488e87.201.2025.01.26.05.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 05:29:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 26 Jan 2025 15:29:14 +0200
Subject: [PATCH v3 09/10] drm/bridge: allow limiting I2S formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250126-drm-hdmi-connector-cec-v3-9-5b5b2d4956da@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4008;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ASn3UQankdxlfhrL+CKAzYynXIH1IlHKS9zOuAB5WR4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnljikF9+yC/fA8RClEtPsWuyQ2DiNmGNb9dUCZ
 5Oabv7pqZWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5Y4pAAKCRCLPIo+Aiko
 1VmfB/kBgNMdpi9bIEMgrEFVMB8ztoZ8lIr4Gr1w3U6+wvRyn1IGyjrdxU7hic0WIa6W5ATt07L
 YX9N+KyCJkk+gBGOa1OrdACF0HaBEc55fQKAAP+csUYpdWlSYhAPUbB09dWvj14KDGk7nHpE8us
 f5sswFr6LaGY5DF6gF04u99ezewv/RMrxp3IQ1DSY4XQm5OUCTwOzyhSiP1khQqS8FGSrKSPKRT
 R89SG0VBNPBye3Drx4FpWUA0kO6Mr5mMUUSTvKZcedv/kuvo4yw2ijzaz8W2noDUb5KaLd0k7Gt
 GkKKXD09UBVJeB65hDQ2cHrMEKLoDrWR7h0wbzSyqtAjsAc5
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c  | 1 +
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 2 ++
 drivers/gpu/drm/vc4/vc4_hdmi.c                  | 2 +-
 include/drm/display/drm_hdmi_audio_helper.h     | 1 +
 include/drm/drm_bridge.h                        | 5 +++++
 5 files changed, 10 insertions(+), 1 deletion(-)

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
index b55e80a57758e8b652eac0cd01cb245a04e221f5..d16af5fe90cb48f6671e798d9dee61a359c9233f 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -920,6 +920,11 @@ struct drm_bridge {
 	 */
 	int hdmi_audio_max_i2s_playback_channels;
 
+	/**
+	 * @hdmi_audio_i2s_formats: supported I2S formats, optional
+	 */
+	u64 hdmi_audio_i2s_formats;
+
 	/**
 	 * @hdmi_audio_spdif_playback: set if HDMI codec has S/PDIF playback port
 	 */

-- 
2.39.5

