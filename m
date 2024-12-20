Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6659F9A1E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 20:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B4610E4EF;
	Fri, 20 Dec 2024 19:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AIbESzo6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C290910E4EF
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 19:17:09 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-54025432becso2374310e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 11:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734722228; x=1735327028; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SbqFqEWhdexua+X7kS2heKGav8iVEOxoFkfoy1VF4D4=;
 b=AIbESzo6yMSvZZ5y7OhmpiTHSIIKb22jpTWCc26sMabzQ1rrw60c9jOk581V5t+n/C
 +kgXngtV1OAwhKL9QuedgNZelukC7fdrnHnvARt1t1Y4NNRoct+jPxgAOTYR9+MO2cyT
 E+dvcS+NERCB5TO5pgyJilsUH7R7SiWds1mjE5rHdQVCrAaO/e2J1F46FqaGXnsTjNzD
 RGcZW0s13165LS3ecasYsIh4x/jA5OLexM3NUZsrQ3YiqqcCWr8JSNCiln9ocMFLKimY
 qDd13i46MxM5foAfPtqLvBy+apxPdamRKr6XjFjXWuKQ9dyhoBkqOoC9hs9yz++xhTgc
 ELbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734722228; x=1735327028;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SbqFqEWhdexua+X7kS2heKGav8iVEOxoFkfoy1VF4D4=;
 b=F08pfwYvm/DAAlcJ3dLhXAHI9nGTI8ZghEwFYru6QgHhZ57k8pzsx2+lUrYO8G4StG
 JLskvgD8p7gAK2BdSoo64Z1EYp5fsK6oi5kdxoFbR7hUeplm0Cn11pbMepfVFUgDovo/
 ZwO7rl5rgDfllhz6d7X/8xlK+E3CMZ4dOcFuY+iQ2GZxs/z2aIZ9H0NSeCtmwIgbJV5C
 pHYLARwBxe/POwGiYjhSrOjd8jd7bszr/MZ9AQuI84TjbkDtGFZXm2mPoZZxQ+2C4yXN
 XV+AES/eqiKIMEQzUQXt7I4ZEmPEGaZrGSuphUkJnIWAaDeOVY9+7U4sNPXPT6Mr1ypl
 Q8qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkq9cG6VJb7UB/HUXw0V2maIx2Se/D49Ccb5oebYDRYS+QL/fYl66MyprKW6KCd6QM1rwa1WAzslE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjR0tPR6PMmqiXgmELjDYF1piOVUO50eHrn5yrHPS+PhluaOTr
 bVJzTFND875p4emN18uPkPOozWfoDEKTdxBnqTlJLdG7b5gypzUJuOaYj1D0cqY=
X-Gm-Gg: ASbGncsI3fo8rGFo4W+nnoS5SZI5nu1LowqNpegC7kzjx2aEf2ospa81ZZ41iS7axWT
 vUY2WTAZbVkGRXwRT6RtqKSR04ewhFJqAd/7xBpj33KzbkJllhX9HSIX6Q1Qb8TxM6bbfBKxSIZ
 PEOBfocZy3I19HSharE1Aqc2tPw0bD6f1NUTobOqtHbLpSyUbyBtMxEyyXaytPEOYoxCnL0n/GK
 Bp535Td5JCJF9q2u6mhRH28KG03aEdwc+2SBQl8xw90cGv8Du1di3m34duUBKVk
X-Google-Smtp-Source: AGHT+IH+pgCMkj1f1D4uTVIQ8LE/rpsTVBWlpzRwVAuIIJM/o+Cur1S6iEYvpVA7gXnrQkHowsl5+w==
X-Received: by 2002:a05:6512:ba6:b0:542:241e:75ac with SMTP id
 2adb3069b0e04-54229524509mr1454579e87.5.1734722228039; 
 Fri, 20 Dec 2024 11:17:08 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223813877sm545141e87.149.2024.12.20.11.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 11:17:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 21:16:58 +0200
Subject: [PATCH v8 01/10] ASoC: hdmi-codec: pass data to get_dai_id too
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-drm-bridge-hdmi-connector-v8-1-2399dbae2990@linaro.org>
References: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
In-Reply-To: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5752;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=6koNmDXcOf4CbyeGeobrJUiApePK/ghJFVbajP7FMx0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZcKuvQVpmC050nEq/u3YGXeJFMKYu9J3CXE1b
 dpWj8ms6vyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2XCrgAKCRCLPIo+Aiko
 1ZGkB/0WVSPqmHWl3e+7V2eQahPUzFhUClcaYE/omJo1OjF8ARW3sg6SDDPLhn9RixBH4qkZk2Q
 fqqS2lfhu0vV7sf5sdEdFJsWxewSBZQfgnCfULlrnj4TxwnjOI2oDCG6/mJl4PbhbwA0AGeX7qD
 wyDusQ3hkbdCTj12FQNqj1mE0G23EWdJj1BGj2QzKfD1zBWdxpQx1WCewCpRmE/7+dFrRsh2Tsu
 2YRDnVC2DozseFJSxYYhMfaZdqXrhNM7ODIvS5Z2Xn+kR/YeqC6wEM9ng7a7BmeE4fEgSO+S8CM
 R/JjfPOi/40fY42rPl0FwM//z+b7+dZe6cK4O4ujymKofDqO
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
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
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
index 6238eabd23282d5f7e59a05d267737f40211aaf3..d65680d1bc8f2f27927b8a9d6926b72531791614 100644
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
index 74f726efc74613460a6eb9c41f0bbad2ab06208f..698a9a01783d28edc734b6932a7768978de65ffc 100644
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
index db9a5466060b663e88d58e85f24bf2d58d74a81c..f4c3ff1fdc6923eb7a8c0d8f7f92e7649c797d77 100644
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
index 127da22011b3235b049c38413e56d50414cf36fb..a02d30c0ba4221d7fee0eb50892ab4d8e8436004 100644
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
index f1c5a8d0fa90e2eb2ee488b6a5871b005f797ea1..2c903c9fe8052ab721445188fd2b75270a55f2b0 100644
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

