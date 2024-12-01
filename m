Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B24D9DF43F
	for <lists+dri-devel@lfdr.de>; Sun,  1 Dec 2024 01:44:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C36E10E3D7;
	Sun,  1 Dec 2024 00:44:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KpYvDGIY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC5E10E5F3
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Dec 2024 00:44:40 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5cfa1ec3b94so3459413a12.2
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 16:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733013879; x=1733618679; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SGZ90COHRkhh8UlEhkaIl4zaxPrKoR1+whYcWjnYlhQ=;
 b=KpYvDGIYS2PUjiP6XG9fzYsB7PDI1z04Y2AeKfdLAMxw7VGWniPoCppHR6wkCi8FKw
 NgIeSf0i0XI+fJV+pS0pz4LBfeVCuOOe71u0dINvZShgtLvhBUnCKD5uHCyugmIwafw/
 yIWCrfxoDj9i8z+r8EamnhO51a3AogST2V7aiGhUUMgCO2vvF60+MMlPAGEVO6cSC9zm
 cfeBiUzNY/hf1sK42GgNvsbAQyx81BwqUjv9VHUo+WKFEU0xNfnceqlHTWUbnHDbDakM
 ndHVdW93zjBxV+RRGQyKiBXpxNxQi5n3HDBW6qqyz34vpLwJQcoRlkY1TGJptymA0eJE
 L9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733013879; x=1733618679;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SGZ90COHRkhh8UlEhkaIl4zaxPrKoR1+whYcWjnYlhQ=;
 b=qPcSIgUwdME8eL7nW3LUCGLoPws7fB2ELCTxBNbUZTo/qpybKThkDEI6dfQCf+1acp
 yb6Xx8nfiO7vdEO//AfPvf+QQ0xK634ICgD+/CW5Wa3sUe6ctyAUQ2ogvT6BH6fgDmwy
 L0LJkwf82jTPlpY6+pOYaOd26z2QBRTnegSpxHIbpcoo8pb9eefnUreuuJWyW8tEdoFh
 fOKd6yHFJHBbIjIgjFSt7XoM/h4dvxI42ZKsIRzSMhD5n6IZilmhqmZqV73szTWe64ZO
 NLsyBJEZ4pUEInWgmpuPa3xgD2NYwNkwGOTO2fNfNWwW4ItmSytbPbXkN/lCJmV9B7Qr
 iwww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgcsQQi7/NUWMXVe6TLy0uHXQ8Q/Bvvh0W26kF/BdnYJQrvTd0H4X8y+frRsZxZKdRvpUMNXeocK8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQP2RTDWroJX4V8DN9zLQ7GRtMtOYQn6f0yfaBHUP7plxk2YfU
 zJpGuUbU890eV8y4rmqul9RmcRVchAncRDgvh3nJmwY/oJJwVCOLtBBpgKf4t/0=
X-Gm-Gg: ASbGncuMogyd939BdGXLb57bZUn/TfukMMh+jlmmf6N4ppwME1QUYq061EbXDQiq7Q8
 GVDSoa4hSXoecXWeGGgRlIsrO+XB7WhNx47Dicelg/CQM9FzMoDjl2hgVurzEuLA8/b+E28VAG1
 RTPMIGjR3OHXfH4a7RWq9qDWRgOsqbDs3VOHN2wzrbAxh7KHetU/wFa+GLw1w+Q7tDZlbcfp9nN
 v+18YXw3D1UTnNJkuyC4fq6o2kGbpahSTP2UAYyQKe8W9LmH8jdoB+uYw==
X-Google-Smtp-Source: AGHT+IEuj24wJkdaiYnuCPHz/SWi8S/hVs+sJ2WiYm+fByjgRzStWY16LTJ+uayPA8mD5ACDx5cP6A==
X-Received: by 2002:a05:6402:3226:b0:5d0:e254:cbb3 with SMTP id
 4fb4d7f45d1cf-5d0e254cf27mr488656a12.27.1733013878965; 
 Sat, 30 Nov 2024 16:44:38 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d097e8d817sm3400359a12.63.2024.11.30.16.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 16:44:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 02:44:12 +0200
Subject: [PATCH v5 8/9] drm/vc4: hdmi: switch to using generic HDMI Codec
 infrastructure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-bridge-hdmi-connector-v5-8-b5316e82f61a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6838;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Ma9Aer0yQKkPHw5XCvFB8jWTtBBoIVZ9qBNvPW3rvQ8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS7FZ4tmicFhQlw+on0M82fbNPsjbm2ahGe5sf
 wHeohELK7SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0uxWQAKCRCLPIo+Aiko
 1SrpB/0R+8/5hrJd7crbg9lLNJcq0FHxpkM9gabyC14zRcox9Asqiup1f6TtU3C50WBNXkRLaZO
 kIcaylCukwHvAZrdkc0lPBEjlNGr/QkU5iepK9TWZviccyluWx62YJQiMMz5dtiuf1hmqA3sFay
 1pp9kSbNF1DIM46JcStOGH5BN0/aWa6sPI0oKq+jLo/PkcAAkGn0Ge/MFXGN2Gi/MqLNSfLOJei
 okGcToPWHEFwn9SpyOgh3psVdS/hp5AshPJ5fKDp3KVEfF6ap0ITfnaPaxmIVyRQAjw6SpYmld/
 DMXaRWxEf0M5fuxqFaf8eTxhci+D8dKE9L7FSAb4Bo5vBLSt
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

Drop driver-specific implementation and use the generic HDMI Codec
framework in order to implement the HDMI audio support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 68 ++++++++++--------------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  2 --
 2 files changed, 15 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 7295834e75fb1ab0cd241ed274e675567e66870b..d0a9aff7ad43016647493263c00d593296a1e3ad 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -595,6 +595,9 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	if (vc4_hdmi->variant->supports_hdr)
 		max_bpc = 12;
 
+	connector->hdmi_codec.max_i2s_channels = 8;
+	connector->hdmi_codec.i2s = 1;
+
 	ret = drmm_connector_hdmi_init(dev, connector,
 				       "Broadcom", "Videocore",
 				       &vc4_hdmi_connector_funcs,
@@ -1706,9 +1709,12 @@ vc4_hdmi_connector_clock_valid(const struct drm_connector *connector,
 	return MODE_OK;
 }
 
+static const struct drm_connector_hdmi_codec_funcs vc4_hdmi_codec_funcs;
+
 static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs = {
 	.tmds_char_rate_valid	= vc4_hdmi_connector_clock_valid,
 	.write_infoframe	= vc4_hdmi_write_infoframe,
+	.codec_funcs		= &vc4_hdmi_codec_funcs,
 };
 
 #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
@@ -1922,9 +1928,9 @@ static bool vc4_hdmi_audio_can_stream(struct vc4_hdmi *vc4_hdmi)
 	return true;
 }
 
-static int vc4_hdmi_audio_startup(struct device *dev, void *data)
+static int vc4_hdmi_audio_startup(struct drm_connector *connector)
 {
-	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	int ret = 0;
@@ -1986,9 +1992,9 @@ static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
 
-static void vc4_hdmi_audio_shutdown(struct device *dev, void *data)
+static void vc4_hdmi_audio_shutdown(struct drm_connector *connector)
 {
-	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	int idx;
@@ -2058,13 +2064,12 @@ static int sample_rate_to_mai_fmt(int samplerate)
 }
 
 /* HDMI audio codec callbacks */
-static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
+static int vc4_hdmi_audio_prepare(struct drm_connector *connector,
 				  struct hdmi_codec_daifmt *daifmt,
 				  struct hdmi_codec_params *params)
 {
-	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
-	struct drm_connector *connector = &vc4_hdmi->connector;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	unsigned int sample_rate = params->sample_rate;
 	unsigned int channels = params->channels;
@@ -2076,7 +2081,7 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 	int ret = 0;
 	int idx;
 
-	dev_dbg(dev, "%s: %u Hz, %d bit, %d channels\n", __func__,
+	dev_dbg(&vc4_hdmi->pdev->dev, "%s: %u Hz, %d bit, %d channels\n", __func__,
 		sample_rate, params->sample_width, channels);
 
 	mutex_lock(&vc4_hdmi->mutex);
@@ -2215,40 +2220,12 @@ static const struct snd_dmaengine_pcm_config pcm_conf = {
 	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
 };
 
-static int vc4_hdmi_audio_get_eld(struct device *dev, void *data,
-				  uint8_t *buf, size_t len)
-{
-	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
-	struct drm_connector *connector = &vc4_hdmi->connector;
-
-	mutex_lock(&connector->eld_mutex);
-	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
-	mutex_unlock(&connector->eld_mutex);
-
-	return 0;
-}
-
-static const struct hdmi_codec_ops vc4_hdmi_codec_ops = {
-	.get_eld = vc4_hdmi_audio_get_eld,
+static const struct drm_connector_hdmi_codec_funcs vc4_hdmi_codec_funcs = {
 	.prepare = vc4_hdmi_audio_prepare,
 	.audio_shutdown = vc4_hdmi_audio_shutdown,
 	.audio_startup = vc4_hdmi_audio_startup,
 };
 
-static struct hdmi_codec_pdata vc4_hdmi_codec_pdata = {
-	.ops = &vc4_hdmi_codec_ops,
-	.max_i2s_channels = 8,
-	.i2s = 1,
-};
-
-static void vc4_hdmi_audio_codec_release(void *ptr)
-{
-	struct vc4_hdmi *vc4_hdmi = ptr;
-
-	platform_device_unregister(vc4_hdmi->audio.codec_pdev);
-	vc4_hdmi->audio.codec_pdev = NULL;
-}
-
 static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 {
 	const struct vc4_hdmi_register *mai_data =
@@ -2256,7 +2233,6 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	struct snd_soc_dai_link *dai_link = &vc4_hdmi->audio.link;
 	struct snd_soc_card *card = &vc4_hdmi->audio.card;
 	struct device *dev = &vc4_hdmi->pdev->dev;
-	struct platform_device *codec_pdev;
 	const __be32 *addr;
 	int index, len;
 	int ret;
@@ -2349,20 +2325,6 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 		return ret;
 	}
 
-	codec_pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
-						   PLATFORM_DEVID_AUTO,
-						   &vc4_hdmi_codec_pdata,
-						   sizeof(vc4_hdmi_codec_pdata));
-	if (IS_ERR(codec_pdev)) {
-		dev_err(dev, "Couldn't register the HDMI codec: %ld\n", PTR_ERR(codec_pdev));
-		return PTR_ERR(codec_pdev);
-	}
-	vc4_hdmi->audio.codec_pdev = codec_pdev;
-
-	ret = devm_add_action_or_reset(dev, vc4_hdmi_audio_codec_release, vc4_hdmi);
-	if (ret)
-		return ret;
-
 	dai_link->cpus		= &vc4_hdmi->audio.cpu;
 	dai_link->codecs	= &vc4_hdmi->audio.codec;
 	dai_link->platforms	= &vc4_hdmi->audio.platform;
@@ -2375,7 +2337,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	dai_link->stream_name = "MAI PCM";
 	dai_link->codecs->dai_name = "i2s-hifi";
 	dai_link->cpus->dai_name = dev_name(dev);
-	dai_link->codecs->name = dev_name(&codec_pdev->dev);
+	dai_link->codecs->name = dev_name(&vc4_hdmi->connector.hdmi_codec.codec_pdev->dev);
 	dai_link->platforms->name = dev_name(dev);
 
 	card->dai_link = dai_link;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index b2424a21da230db99db207efa293417faccd254d..e3d989ca302b72533c374dfa3fd0d5bd7fe64a82 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -104,8 +104,6 @@ struct vc4_hdmi_audio {
 	struct snd_soc_dai_link_component codec;
 	struct snd_soc_dai_link_component platform;
 	struct snd_dmaengine_dai_dma_data dma_data;
-	struct hdmi_audio_infoframe infoframe;
-	struct platform_device *codec_pdev;
 	bool streaming;
 };
 

-- 
2.39.5

