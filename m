Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A911B9E6B8C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 11:16:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA3710E60C;
	Fri,  6 Dec 2024 10:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="U4+z8xyo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC98810E60C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 10:16:48 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53de92be287so1887934e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 02:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733480207; x=1734085007; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XdpsanGAJq/HJAcg8LOfnw7m4WhAfgPQTWEy7/V+0WA=;
 b=U4+z8xyoIJid1iTd7ydbcJ7Xkb/ShsIGWWWJhVsto9CDpiHVy9pdgGmrGIpEOPUfu3
 TTouec7REP7HuNAqMf1Q3wH1Y7U+O+KZtJOsLwTiUc+lEr3XfLhqOwYgIfsTiTx0uQRK
 gGrXV/MSBVW2xa66OjnvCzTSAoQgavU3X8ZNq/rApJHoIVWrAU6XaYMzr28UsJ7w601U
 3zkPea6M2iosha59YhCgazrJFH4driKqtaAE7OCz/NaGD7Wq/ZAUTFPFsHdVrqy8VC8d
 uaOVj2hYbxV7trWRqaykgvD9AxBI1IzNL3nnq1J/0mNvX+IeY2exgBN4IL731hwdqFqq
 SU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733480207; x=1734085007;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XdpsanGAJq/HJAcg8LOfnw7m4WhAfgPQTWEy7/V+0WA=;
 b=B9MYUuNz9dRomHyxKcLKdKVVBuDppIb6TdaFDf3jxJHUqZm6vtCH4VJGozgKl4PdFT
 zjVQ5OfEPmAkRC55cag+eIR/OTEKJPj2Xgf8+urrKpODI5/1gJNJ9meWtUv6RslnuO3O
 PyktmP9+YmNGJmZ+iLWq+yGQOVOIi3fD7vdd9JwZ24QXTPy+2ROBQWCgLTlI3EbouC6B
 tnp5uMy8Xy0JgAIvsU0nYs+YKnEVyd6FpXr9q2MDwiXwilpwK5xpNjK+rIWsIqt0N7l+
 OL19ZG1Fr49HStJAvXONP0IHr0BCxKuRhXk5KpRV4jadwH7tmW2HnezsXVbwp8t8JfeA
 kppw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQZ5YjCWX5xw06TOOie3D2u1Wmp8egHW/Lr0rXhs4mzAtOmqEje8vf0tN7Ad8+VXkqu3EdW/EFIRE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yws0N1ZavLvurcLOlbVtYQW85XwW2KNcR728YhWz6QYT4TPudGj
 qOhAHsS5xE+RwYn3yVZQtVC4qNcHaLDcpQCJ1uEEjJJW5kzl2Tn4CYZRKJybQ3Q=
X-Gm-Gg: ASbGncsZHjCoN/FhseevZT3urwlCIlLqV8Qa+uwnwL3ZksdAujE7WPtCVuJQYQep0rU
 Zn9JVaDfxHs2Edx+7K1ux4yp1oga7ydVDosXV/5+exhV21DohhA3wNgNcHCzYWnpFHxjxHBqf7l
 GA2K12Nnpdkbn4xCkaD8SJh2G+o1fAb+uUAEigFrKqynRemOWVhspyjyvpgobofc/Upx11Dou6+
 QVSG3pZHwGA0s7sLUrcEuTKB+FHoycG+g+J9CtLGaq/ZP5T6wctDrzZUA==
X-Google-Smtp-Source: AGHT+IFkrbYIrOOX+notTKc9sLOnekf4EyYqfJ1UPx3hlsMd+eSwOGD1rvbmH6UCcVPjOPfN3YJGzQ==
X-Received: by 2002:ac2:5212:0:b0:53e:2ed9:8122 with SMTP id
 2adb3069b0e04-53e2ed98271mr483402e87.22.1733480207015; 
 Fri, 06 Dec 2024 02:16:47 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e2294738fsm462355e87.52.2024.12.06.02.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 02:16:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 12:15:55 +0200
Subject: [PATCH v6 01/10] ASoC: hdmi-codec: pass data to get_dai_id too
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-bridge-hdmi-connector-v6-1-50dc145a9c06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5692;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mf+Mbo35eir6B+rLArs//796iJiX64HF7YQK4dBg7Bc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUs8IaYJW+k5SE3hHwYqHHBuqemef33RuRKCYf
 kdE0NK2gquJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LPCAAKCRCLPIo+Aiko
 1bSBCACCtZjKIQS+Bj+44o3OJdoyxZmYPBE6MN//iugAoMcK5In7DBzfTnazsoUgTXTlJV+KBzs
 K6VspCTgwjXkFNiH18fKKUpEoIblZrZeBNA54jsgl/75JHwhjlILpGNMzV0lJBIo8lBXgNRV5eE
 E06RaRtbicWAG/0OLMg6mHDo84Mrjz+ZkZUuGHOJUDN/Ssh5ykbFVbytxek+cFeC9IPAdQkmGw2
 pRkjnWyIDW3lVFvTJWIm5m767qmw/GNwPGZNllOJBhOkjd0rWVf8PyVasjzuZE0D7sQ1jypZYWF
 b5EcXqqIdOsFD4zZYm5ADR/o1EstOZMJ740FO/kps0HNPO//
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

The upcoming DRM connector HDMI codec implementation is going to use
codec-specific data in the .get_dai_id to get drm_connector. Pass data
to the callback, as it is done with other hdmi_codec_ops callbacks.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c      | 3 ++-
 drivers/gpu/drm/bridge/analogix/anx7625.c           | 3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611.c             | 3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c          | 3 ++-
 drivers/gpu/drm/bridge/sii902x.c                    | 3 ++-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 3 ++-
 include/sound/hdmi-codec.h                          | 3 ++-
 sound/soc/codecs/hdmi-codec.c                       | 2 +-
 8 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
index 61f4a38e7d2bf6905683cbc9e762b28ecc999d05..51fb9a574b4e28450b2598a92e2930ace5128b71 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
@@ -204,7 +204,8 @@ static void audio_shutdown(struct device *dev, void *data)
 }
 
 static int adv7511_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-					struct device_node *endpoint)
+					struct device_node *endpoint,
+					void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index c036bbc92ba96ec4663c55cca091cd5da9f6d271..943dd3cf57738d8c232d57d793756eb2e3bf1c5a 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1952,7 +1952,8 @@ static void anx7625_audio_shutdown(struct device *dev, void *data)
 }
 
 static int anx7625_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-				       struct device_node *endpoint)
+				       struct device_node *endpoint,
+				       void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 1ffbe473e4103dfc315a8cd3571e9407bf518797..60b7305c0fd1935e35742713c78937392b7faa79 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1057,7 +1057,8 @@ static void lt9611_audio_shutdown(struct device *dev, void *data)
 }
 
 static int lt9611_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-				      struct device_node *endpoint)
+				      struct device_node *endpoint,
+				      void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index f89af8203c9d67cb05b629b27f66cf996baedd16..77bc09b875323d88f7346db9d24ea89a355c99b1 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -522,7 +522,8 @@ static void lt9611uxc_audio_shutdown(struct device *dev, void *data)
 }
 
 static int lt9611uxc_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-					 struct device_node *endpoint)
+					 struct device_node *endpoint,
+					 void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 9be9cc5b902594ebe6e1ac29ab8684623e336796..f0be803cc2274ca2199ed7661cf752b0a91434b6 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -815,7 +815,8 @@ static int sii902x_audio_get_eld(struct device *dev, void *data,
 }
 
 static int sii902x_audio_get_dai_id(struct snd_soc_component *component,
-				    struct device_node *endpoint)
+				    struct device_node *endpoint,
+				    void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index 26c187d20d973dc65801a3baa59ecf57d20072eb..86c412e9cbc80bb82bad5db3aa0263a7acd9c2d7 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -148,7 +148,8 @@ static int dw_hdmi_i2s_get_eld(struct device *dev, void *data, uint8_t *buf,
 }
 
 static int dw_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-				  struct device_node *endpoint)
+				  struct device_node *endpoint,
+				  void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index 5e1a9eafd10f5d4f831abbb6f4c0fff661909584..b3407b47b4a7878532ecf3b08eeecd443d6fdb07 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -105,7 +105,8 @@ struct hdmi_codec_ops {
 	 * Optional
 	 */
 	int (*get_dai_id)(struct snd_soc_component *comment,
-			  struct device_node *endpoint);
+			  struct device_node *endpoint,
+			  void *data);
 
 	/*
 	 * Hook callback function to handle connector plug event.
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index d9df29a26f4f213a30a2ebcdb63a593f9cf4b901..f536ca60e162dca6b50b37854ca6de2c114bc2a1 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -995,7 +995,7 @@ static int hdmi_of_xlate_dai_id(struct snd_soc_component *component,
 	int ret = -ENOTSUPP; /* see snd_soc_get_dai_id() */
 
 	if (hcp->hcd.ops->get_dai_id)
-		ret = hcp->hcd.ops->get_dai_id(component, endpoint);
+		ret = hcp->hcd.ops->get_dai_id(component, endpoint, hcp->hcd.data);
 
 	return ret;
 }

-- 
2.39.5

