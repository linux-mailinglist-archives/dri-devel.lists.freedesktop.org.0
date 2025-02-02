Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF75A24DC4
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 13:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2081910E323;
	Sun,  2 Feb 2025 12:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="C37oEufz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4FF10E323
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2025 12:07:45 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5401c52000fso3352782e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Feb 2025 04:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738498064; x=1739102864; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LqCNtXhuNOYeqhnCsh823VdwuB53D/PNW9qZaLjqVbo=;
 b=C37oEufzmRw6+KvYPdiEkSeAUw1mqXz3yctV7zp4qt8YVugEGXerXQAeje2j68oDTS
 j2EpF3NvCA8Vr4Fvf+dQnDFGEjrJoGRZC9hhE5hFgBnsX7eqBnT14E3I7ZkN68DQoArs
 PTmowKi3Jxw4mBDQ0Dm+n14uwcZ9NIwJGBbY4MDo33iGzN/O2m8vTPPYd38y0C++cdQt
 JgBdc+ysx/LMyFKvRJkOpVPs4PIljbY3MR9KQllV/uqtCsXx51UcFdjMZpNf5FsIHHLj
 Ku1T/55NdUloeuJ7LuZjBWNG++nV5SPdhIinRxh5dEThBclLgWAGbOD8l4e6Y5xmiedI
 bQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738498064; x=1739102864;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LqCNtXhuNOYeqhnCsh823VdwuB53D/PNW9qZaLjqVbo=;
 b=wNUNrobmXh7Dkx6wO5EdnPLaCkmmXFQbemamJQdX9341XiS2fMYNTTnyZaF/2Dd3Ki
 /YdQR+bHS2r2AIEbdEjq7SwzAl97kjt6Z09qIdQgJymxrZnIw/kEr+n7DdZrv0qLjp9B
 TLkq41Lnu5+YLSaRCeGklgQaRYbYsALcm5pZL6Shr/e9N4h1yHsAuzzKQ6k7YE7PxCbA
 sbAaTtuAurZm+R2rjhCiANTtNveXwA+0hf6v9mIJq48zfT6mXrrGxvLFAo4ULHw5o5HU
 DpwmuNq4ryXFr4SuCMs63BbGdrMbDgGjUdgerlisH0r2rQskBqExwMt/S5I73KHT2hRm
 RArw==
X-Gm-Message-State: AOJu0YwsWUZOTzoFoJoJZDLPGokIbWwPEK7zi7Foj18Cv4hIM44CWN9D
 4PxCLMK7MlRf4bwLsegJOoaWQCTwrQdwbk+lwyLeLu36/eCLxoN8ONPLsThtVsI=
X-Gm-Gg: ASbGnctJdBnCHIlLiLlOU0YU/VsDt1xQmjiwvtdq1KZgJk2PeDYaQHTmuB/nvt2GnLF
 knsOvpj97/GBtm5KLroBm+ivrQYXdJugFfQupzb6RN0tSnd74fTJPhHH5z5/4tLqJV55l2zWnj4
 tFKrHyktCYrpQfVPBcZkSFAkwNvFFvxgcpYYQc1aZba/EtXjjbftcA1LAbIu2lAzx0zB8JgIaKp
 E2tSP2d6okGQJfcUR/Q4qmwHzVEjacUonYj9o/jctZSKxIeKfKPxA3VwEWK/mFAQqIiB/tS/G56
 NXXn1QxDSql7yvcBcKNdFL4=
X-Google-Smtp-Source: AGHT+IHr7sXeenRYFXiYfSUh0XCasjLH+ETIN+FWeMq7T/9YHqjN5t+NsrCsV2QtcWGL+bXErXIfyg==
X-Received: by 2002:ac2:46ef:0:b0:543:c3d9:418d with SMTP id
 2adb3069b0e04-543e4be9663mr4977894e87.22.1738498063807; 
 Sun, 02 Feb 2025 04:07:43 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebe10678sm960695e87.101.2025.02.02.04.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Feb 2025 04:07:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Feb 2025 14:07:19 +0200
Subject: [PATCH v4 12/12] drm/bridge: adv7511: switch to the HDMI connector
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-drm-hdmi-connector-cec-v4-12-a71620a54d50@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=34304;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=lJ6Es1IE98Dx2z3zkRUZMAXEtuf423vs1ZA2ENaTKvk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnn1/wTXctcS+e7c+ryjIb9Ats5UX07EZRsdnMR
 uDBBovMoVKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ59f8AAKCRCLPIo+Aiko
 1eGSCACOzuQeCiMfrpGaq0r+h/M8wxX6e7LCBNhwtbaVXeTtZbtisKjZlFxUc8KoLIbbr7hBJj4
 SzizOxNLzdnDv0pA69ZRyEXQmTdBEisn8Pe53X4h+5PuuvDBCCvCUGqU+9rDU498PPsXgh/Aa7R
 5TMk6s5U8Lwory5JL3ZshPDbZ5adGBIoA1qCibAcMAVvoZKTN/YelP32rAhg4fANTo4mXKNEc64
 VxedvUtrqgP7+hQN6hwADZ/m+zxR57V8jMFhxrkWS2TyQHHdi7Ox+clMALUC4CbKyJ0q7r9Dh2I
 u6+sciwzjNBF9ZBmdhw1aMAMjxSfielIozeZmd8gT3jFeplF
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

Rewrite the ADV7511 driver to use implementation provided by the DRM
HDMI connector framework, including the Audio and CEC bits. Drop the
in-bridge connector support and use drm_bridge_connector if the host
requires the connector to be provided by the bridge.

Note: currently only AVI InfoFrames are supported. Existing driver
doesn't support programming any other InfoFrames directly and Audio
InfoFrame seems to be programmed using individual bits and pieces rather
than programming it directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/adv7511/Kconfig         |   5 +-
 drivers/gpu/drm/bridge/adv7511/adv7511.h       |  51 ++--
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c |  77 +-----
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c   |  56 ++--
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c   | 342 +++++++++++--------------
 drivers/gpu/drm/bridge/adv7511/adv7533.c       |   4 -
 6 files changed, 206 insertions(+), 329 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/Kconfig b/drivers/gpu/drm/bridge/adv7511/Kconfig
index f46a5e26b5dd640670afa21802f9019d5c7439fb..59a5256ce8a6e16dfbf1848a7c85ac7d709a68ed 100644
--- a/drivers/gpu/drm/bridge/adv7511/Kconfig
+++ b/drivers/gpu/drm/bridge/adv7511/Kconfig
@@ -5,6 +5,9 @@ config DRM_I2C_ADV7511
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	select DRM_MIPI_DSI
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
+	select DRM_DISPLAY_HDMI_STATE_HELPER
 	help
 	  Support for the Analog Devices ADV7511(W)/13/33/35 HDMI encoders.
 
@@ -19,7 +22,7 @@ config DRM_I2C_ADV7511_AUDIO
 config DRM_I2C_ADV7511_CEC
 	bool "ADV7511/33/35 HDMI CEC driver"
 	depends on DRM_I2C_ADV7511
-	select CEC_CORE
+	select DRM_DISPLAY_HDMI_CEC_HELPER
 	default y
 	help
 	  When selected the HDMI transmitter will support the CEC feature.
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index ec0b7f3d889c4eedeb1d80369fd2a160cd0e2968..530eb124b8969441939d8a1b7e9c1268eb929672 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -313,16 +313,11 @@ enum adv7511_csc_scaling {
  * @csc_enable:			Whether to enable color space conversion
  * @csc_scaling_factor:		Color space conversion scaling factor
  * @csc_coefficents:		Color space conversion coefficents
- * @hdmi_mode:			Whether to use HDMI or DVI output mode
- * @avi_infoframe:		HDMI infoframe
  */
 struct adv7511_video_config {
 	bool csc_enable;
 	enum adv7511_csc_scaling csc_scaling_factor;
 	const uint16_t *csc_coefficents;
-
-	bool hdmi_mode;
-	struct hdmi_avi_infoframe avi_infoframe;
 };
 
 enum adv7511_type {
@@ -337,6 +332,7 @@ struct adv7511_chip_info {
 	enum adv7511_type type;
 	unsigned int max_mode_clock_khz;
 	unsigned int max_lane_freq_khz;
+	const char *name;
 	const char * const *supply_names;
 	unsigned int num_supplies;
 	unsigned int reg_cec_offset;
@@ -371,7 +367,6 @@ struct adv7511 {
 	struct work_struct hpd_work;
 
 	struct drm_bridge bridge;
-	struct drm_connector connector;
 
 	bool embedded_sync;
 	enum adv7511_sync_polarity vsync_polarity;
@@ -389,9 +384,7 @@ struct adv7511 {
 	bool use_timing_gen;
 
 	const struct adv7511_chip_info *info;
-	struct platform_device *audio_pdev;
 
-	struct cec_adapter *cec_adap;
 	u8   cec_addr[ADV7511_MAX_ADDRS];
 	u8   cec_valid_addrs;
 	bool cec_enabled_adap;
@@ -399,16 +392,24 @@ struct adv7511 {
 	u32 cec_clk_freq;
 };
 
+static inline struct adv7511 *bridge_to_adv7511(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct adv7511, bridge);
+}
+
 #ifdef CONFIG_DRM_I2C_ADV7511_CEC
-int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511);
+int adv7511_cec_init(struct drm_connector *connector,
+		     struct drm_bridge *bridge);
+int adv7511_cec_enable(struct drm_bridge *bridge, bool enable);
+int adv7511_cec_log_addr(struct drm_bridge *bridge, u8 addr);
+int adv7511_cec_transmit(struct drm_bridge *bridge, u8 attempts,
+			      u32 signal_free_time, struct cec_msg *msg);
 int adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1);
 #else
-static inline int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
-{
-	regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL,
-		     ADV7511_CEC_CTRL_POWER_DOWN);
-	return 0;
-}
+#define adv7511_cec_init NULL
+#define adv7511_cec_enable NULL
+#define adv7511_cec_log_addr NULL
+#define adv7511_cec_transmit NULL
 #endif
 
 void adv7533_dsi_power_on(struct adv7511 *adv);
@@ -421,16 +422,18 @@ int adv7533_attach_dsi(struct adv7511 *adv);
 int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv);
 
 #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
-int adv7511_audio_init(struct device *dev, struct adv7511 *adv7511);
-void adv7511_audio_exit(struct adv7511 *adv7511);
+int adv7511_hdmi_audio_startup(struct drm_connector *connector,
+			       struct drm_bridge *bridge);
+void adv7511_hdmi_audio_shutdown(struct drm_connector *connector,
+				 struct drm_bridge *bridge);
+int adv7511_hdmi_audio_prepare(struct drm_connector *connector,
+			       struct drm_bridge *bridge,
+			       struct hdmi_codec_daifmt *fmt,
+			       struct hdmi_codec_params *hparms);
 #else /*CONFIG_DRM_I2C_ADV7511_AUDIO */
-static inline int adv7511_audio_init(struct device *dev, struct adv7511 *adv7511)
-{
-	return 0;
-}
-static inline void adv7511_audio_exit(struct adv7511 *adv7511)
-{
-}
+#define adv7511_hdmi_audio_startup NULL
+#define adv7511_hdmi_audio_shutdown NULL
+#define adv7511_hdmi_audio_prepare NULL
 #endif /* CONFIG_DRM_I2C_ADV7511_AUDIO */
 
 #endif /* __DRM_I2C_ADV7511_H__ */
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
index 36a7b6f085f9a0fa2c60660df4f569b24b49c4be..9d0193075528186f47ae73a284c25376c41075a4 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
@@ -55,11 +55,12 @@ static int adv7511_update_cts_n(struct adv7511 *adv7511)
 	return 0;
 }
 
-static int adv7511_hdmi_hw_params(struct device *dev, void *data,
-				  struct hdmi_codec_daifmt *fmt,
-				  struct hdmi_codec_params *hparms)
+int adv7511_hdmi_audio_prepare(struct drm_connector *connector,
+			       struct drm_bridge *bridge,
+			       struct hdmi_codec_daifmt *fmt,
+			       struct hdmi_codec_params *hparms)
 {
-	struct adv7511 *adv7511 = dev_get_drvdata(dev);
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
 	unsigned int audio_source, i2s_format = 0;
 	unsigned int invert_clock;
 	unsigned int rate;
@@ -158,9 +159,10 @@ static int adv7511_hdmi_hw_params(struct device *dev, void *data,
 	return 0;
 }
 
-static int audio_startup(struct device *dev, void *data)
+int adv7511_hdmi_audio_startup(struct drm_connector *connector,
+			       struct drm_bridge *bridge)
 {
-	struct adv7511 *adv7511 = dev_get_drvdata(dev);
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
 
 	regmap_update_bits(adv7511->regmap, ADV7511_REG_AUDIO_CONFIG,
 				BIT(7), 0);
@@ -194,69 +196,12 @@ static int audio_startup(struct device *dev, void *data)
 	return 0;
 }
 
-static void audio_shutdown(struct device *dev, void *data)
+void adv7511_hdmi_audio_shutdown(struct drm_connector *connector,
+				 struct drm_bridge *bridge)
 {
-	struct adv7511 *adv7511 = dev_get_drvdata(dev);
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
 
 	if (adv7511->audio_source == ADV7511_AUDIO_SOURCE_SPDIF)
 		regmap_update_bits(adv7511->regmap, ADV7511_REG_AUDIO_CONFIG,
 				   BIT(7), 0);
 }
-
-static int adv7511_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-					struct device_node *endpoint,
-					void *data)
-{
-	struct of_endpoint of_ep;
-	int ret;
-
-	ret = of_graph_parse_endpoint(endpoint, &of_ep);
-	if (ret < 0)
-		return ret;
-
-	/*
-	 * HDMI sound should be located as reg = <2>
-	 * Then, it is sound port 0
-	 */
-	if (of_ep.port == 2)
-		return 0;
-
-	return -EINVAL;
-}
-
-static const struct hdmi_codec_ops adv7511_codec_ops = {
-	.hw_params	= adv7511_hdmi_hw_params,
-	.audio_shutdown = audio_shutdown,
-	.audio_startup	= audio_startup,
-	.get_dai_id	= adv7511_hdmi_i2s_get_dai_id,
-};
-
-static const struct hdmi_codec_pdata codec_data = {
-	.ops = &adv7511_codec_ops,
-	.i2s_formats = (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |
-			SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_LE |
-			SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE),
-	.max_i2s_channels = 2,
-	.i2s = 1,
-	.no_i2s_capture = 1,
-	.spdif = 1,
-	.no_spdif_capture = 1,
-};
-
-int adv7511_audio_init(struct device *dev, struct adv7511 *adv7511)
-{
-	adv7511->audio_pdev = platform_device_register_data(dev,
-					HDMI_CODEC_DRV_NAME,
-					PLATFORM_DEVID_AUTO,
-					&codec_data,
-					sizeof(codec_data));
-	return PTR_ERR_OR_ZERO(adv7511->audio_pdev);
-}
-
-void adv7511_audio_exit(struct adv7511 *adv7511)
-{
-	if (adv7511->audio_pdev) {
-		platform_device_unregister(adv7511->audio_pdev);
-		adv7511->audio_pdev = NULL;
-	}
-}
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
index 2e9c88a2b5ed44ef0cd417c553ea7873d00e4a14..bc96f46bbc4480d3439e821991dab81ae4950208 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
@@ -12,6 +12,8 @@
 
 #include <media/cec.h>
 
+#include <drm/display/drm_hdmi_cec_helper.h>
+
 #include "adv7511.h"
 
 static const u8 ADV7511_REG_CEC_RX_FRAME_HDR[] = {
@@ -44,8 +46,8 @@ static void adv_cec_tx_raw_status(struct adv7511 *adv7511, u8 tx_raw_status)
 		return;
 
 	if (tx_raw_status & ADV7511_INT1_CEC_TX_ARBIT_LOST) {
-		cec_transmit_attempt_done(adv7511->cec_adap,
-					  CEC_TX_STATUS_ARB_LOST);
+		drm_bridge_cec_transmit_attempt_done(&adv7511->bridge,
+						     CEC_TX_STATUS_ARB_LOST);
 		return;
 	}
 	if (tx_raw_status & ADV7511_INT1_CEC_TX_RETRY_TIMEOUT) {
@@ -72,12 +74,13 @@ static void adv_cec_tx_raw_status(struct adv7511 *adv7511, u8 tx_raw_status)
 			if (low_drive_cnt)
 				status |= CEC_TX_STATUS_LOW_DRIVE;
 		}
-		cec_transmit_done(adv7511->cec_adap, status,
-				  0, nack_cnt, low_drive_cnt, err_cnt);
+		drm_bridge_cec_transmit_done(&adv7511->bridge, status,
+					     0, nack_cnt, low_drive_cnt,
+					     err_cnt);
 		return;
 	}
 	if (tx_raw_status & ADV7511_INT1_CEC_TX_READY) {
-		cec_transmit_attempt_done(adv7511->cec_adap, CEC_TX_STATUS_OK);
+		drm_bridge_cec_transmit_attempt_done(&adv7511->bridge, CEC_TX_STATUS_OK);
 		return;
 	}
 }
@@ -116,7 +119,7 @@ static void adv7511_cec_rx(struct adv7511 *adv7511, int rx_buf)
 	regmap_update_bits(adv7511->regmap_cec,
 			   ADV7511_REG_CEC_RX_BUFFERS + offset, BIT(rx_buf), 0);
 
-	cec_received_msg(adv7511->cec_adap, &msg);
+	drm_bridge_cec_received_msg(&adv7511->bridge, &msg);
 }
 
 int adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
@@ -179,9 +182,9 @@ int adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
 	return IRQ_HANDLED;
 }
 
-static int adv7511_cec_adap_enable(struct cec_adapter *adap, bool enable)
+int adv7511_cec_enable(struct drm_bridge *bridge, bool enable)
 {
-	struct adv7511 *adv7511 = cec_get_drvdata(adap);
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
 	unsigned int offset = adv7511->info->reg_cec_offset;
 
 	if (adv7511->i2c_cec == NULL)
@@ -225,9 +228,9 @@ static int adv7511_cec_adap_enable(struct cec_adapter *adap, bool enable)
 	return 0;
 }
 
-static int adv7511_cec_adap_log_addr(struct cec_adapter *adap, u8 addr)
+int adv7511_cec_log_addr(struct drm_bridge *bridge, u8 addr)
 {
-	struct adv7511 *adv7511 = cec_get_drvdata(adap);
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
 	unsigned int offset = adv7511->info->reg_cec_offset;
 	unsigned int i, free_idx = ADV7511_MAX_ADDRS;
 
@@ -293,10 +296,10 @@ static int adv7511_cec_adap_log_addr(struct cec_adapter *adap, u8 addr)
 	return 0;
 }
 
-static int adv7511_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
-				     u32 signal_free_time, struct cec_msg *msg)
+int adv7511_cec_transmit(struct drm_bridge *bridge, u8 attempts,
+			 u32 signal_free_time, struct cec_msg *msg)
 {
-	struct adv7511 *adv7511 = cec_get_drvdata(adap);
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
 	unsigned int offset = adv7511->info->reg_cec_offset;
 	u8 len = msg->len;
 	unsigned int i;
@@ -328,12 +331,6 @@ static int adv7511_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 	return 0;
 }
 
-static const struct cec_adap_ops adv7511_cec_adap_ops = {
-	.adap_enable = adv7511_cec_adap_enable,
-	.adap_log_addr = adv7511_cec_adap_log_addr,
-	.adap_transmit = adv7511_cec_adap_transmit,
-};
-
 static int adv7511_cec_parse_dt(struct device *dev, struct adv7511 *adv7511)
 {
 	adv7511->cec_clk = devm_clk_get(dev, "cec");
@@ -348,21 +345,17 @@ static int adv7511_cec_parse_dt(struct device *dev, struct adv7511 *adv7511)
 	return 0;
 }
 
-int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
+int adv7511_cec_init(struct drm_connector *connector,
+		     struct drm_bridge *bridge)
 {
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
+	struct device *dev = &adv7511->i2c_main->dev;
 	unsigned int offset = adv7511->info->reg_cec_offset;
 	int ret = adv7511_cec_parse_dt(dev, adv7511);
 
 	if (ret)
 		goto err_cec_parse_dt;
 
-	adv7511->cec_adap = cec_allocate_adapter(&adv7511_cec_adap_ops,
-		adv7511, dev_name(dev), CEC_CAP_DEFAULTS, ADV7511_MAX_ADDRS);
-	if (IS_ERR(adv7511->cec_adap)) {
-		ret = PTR_ERR(adv7511->cec_adap);
-		goto err_cec_alloc;
-	}
-
 	regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL, 0);
 	/* cec soft reset */
 	regmap_write(adv7511->regmap_cec,
@@ -378,17 +371,8 @@ int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
 		     ADV7511_REG_CEC_CLK_DIV + offset,
 		     ((adv7511->cec_clk_freq / 750000) - 1) << 2);
 
-	ret = cec_register_adapter(adv7511->cec_adap, dev);
-	if (ret)
-		goto err_cec_register;
 	return 0;
 
-err_cec_register:
-	cec_delete_adapter(adv7511->cec_adap);
-	adv7511->cec_adap = NULL;
-err_cec_alloc:
-	dev_info(dev, "Initializing CEC failed with error %d, disabling CEC\n",
-		 ret);
 err_cec_parse_dt:
 	regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL,
 		     ADV7511_CEC_CTRL_POWER_DOWN);
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 1a76aea6a945ed4b23239edbf084681462fac1d9..60264bc903b58a72e8a2cd772ea07766c0ad12cf 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -12,14 +12,17 @@
 #include <linux/of.h>
 #include <linux/slab.h>
 
-#include <media/cec.h>
+#include <sound/pcm.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/display/drm_hdmi_helper.h>
+#include <drm/display/drm_hdmi_state_helper.h>
 
 #include "adv7511.h"
 
@@ -203,62 +206,37 @@ static const uint16_t adv7511_csc_ycbcr_to_rgb[] = {
 
 static void adv7511_set_config_csc(struct adv7511 *adv7511,
 				   struct drm_connector *connector,
-				   bool rgb, bool hdmi_mode)
+				   bool rgb)
 {
 	struct adv7511_video_config config;
 	bool output_format_422, output_format_ycbcr;
 	unsigned int mode;
-	uint8_t infoframe[17];
-
-	config.hdmi_mode = hdmi_mode;
-
-	hdmi_avi_infoframe_init(&config.avi_infoframe);
-
-	config.avi_infoframe.scan_mode = HDMI_SCAN_MODE_UNDERSCAN;
 
 	if (rgb) {
 		config.csc_enable = false;
-		config.avi_infoframe.colorspace = HDMI_COLORSPACE_RGB;
+		output_format_422 = false;
+		output_format_ycbcr = false;
 	} else {
 		config.csc_scaling_factor = ADV7511_CSC_SCALING_4;
 		config.csc_coefficents = adv7511_csc_ycbcr_to_rgb;
 
 		if ((connector->display_info.color_formats &
 		     DRM_COLOR_FORMAT_YCBCR422) &&
-		    config.hdmi_mode) {
+		    connector->display_info.is_hdmi) {
 			config.csc_enable = false;
-			config.avi_infoframe.colorspace =
-				HDMI_COLORSPACE_YUV422;
-		} else {
-			config.csc_enable = true;
-			config.avi_infoframe.colorspace = HDMI_COLORSPACE_RGB;
-		}
-	}
-
-	if (config.hdmi_mode) {
-		mode = ADV7511_HDMI_CFG_MODE_HDMI;
-
-		switch (config.avi_infoframe.colorspace) {
-		case HDMI_COLORSPACE_YUV444:
-			output_format_422 = false;
-			output_format_ycbcr = true;
-			break;
-		case HDMI_COLORSPACE_YUV422:
 			output_format_422 = true;
 			output_format_ycbcr = true;
-			break;
-		default:
+		} else {
+			config.csc_enable = true;
 			output_format_422 = false;
 			output_format_ycbcr = false;
-			break;
 		}
-	} else {
-		mode = ADV7511_HDMI_CFG_MODE_DVI;
-		output_format_422 = false;
-		output_format_ycbcr = false;
 	}
 
-	adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_AVI_INFOFRAME);
+	if (connector->display_info.is_hdmi)
+		mode = ADV7511_HDMI_CFG_MODE_HDMI;
+	else
+		mode = ADV7511_HDMI_CFG_MODE_DVI;
 
 	adv7511_set_colormap(adv7511, config.csc_enable,
 			     config.csc_coefficents,
@@ -269,15 +247,6 @@ static void adv7511_set_config_csc(struct adv7511 *adv7511,
 
 	regmap_update_bits(adv7511->regmap, ADV7511_REG_HDCP_HDMI_CFG,
 			   ADV7511_HDMI_CFG_MODE_MASK, mode);
-
-	hdmi_avi_infoframe_pack(&config.avi_infoframe, infoframe,
-				sizeof(infoframe));
-
-	/* The AVI infoframe id is not configurable */
-	regmap_bulk_write(adv7511->regmap, ADV7511_REG_AVI_INFOFRAME_VERSION,
-			  infoframe + 1, sizeof(infoframe) - 1);
-
-	adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_AVI_INFOFRAME);
 }
 
 static void adv7511_set_link_config(struct adv7511 *adv7511,
@@ -446,22 +415,16 @@ static void adv7511_hpd_work(struct work_struct *work)
 	 * restore its state.
 	 */
 	if (status == connector_status_connected &&
-	    adv7511->connector.status == connector_status_disconnected &&
+	    adv7511->status == connector_status_disconnected &&
 	    adv7511->powered) {
 		regcache_mark_dirty(adv7511->regmap);
 		adv7511_power_on(adv7511);
 	}
 
-	if (adv7511->connector.status != status) {
-		adv7511->connector.status = status;
+	if (adv7511->status != status) {
+		adv7511->status = status;
 
-		if (adv7511->connector.dev) {
-			if (status == connector_status_disconnected)
-				cec_phys_addr_invalidate(adv7511->cec_adap);
-			drm_kms_helper_hotplug_event(adv7511->connector.dev);
-		} else {
-			drm_bridge_hpd_notify(&adv7511->bridge, status);
-		}
+		drm_bridge_hpd_notify(&adv7511->bridge, status);
 	}
 }
 
@@ -636,45 +599,11 @@ static const struct drm_edid *adv7511_edid_read(struct adv7511 *adv7511,
 	if (!adv7511->powered)
 		__adv7511_power_off(adv7511);
 
-	if (drm_edid) {
-		/*
-		 * FIXME: The CEC physical address should be set using
-		 * cec_s_phys_addr(adap,
-		 * connector->display_info.source_physical_address, false) from
-		 * a path that has read the EDID and called
-		 * drm_edid_connector_update().
-		 */
-		const struct edid *edid = drm_edid_raw(drm_edid);
-
-		adv7511_set_config_csc(adv7511, connector, adv7511->rgb,
-				       drm_detect_hdmi_monitor(edid));
-
-		cec_s_phys_addr_from_edid(adv7511->cec_adap, edid);
-	} else {
-		cec_s_phys_addr_from_edid(adv7511->cec_adap, NULL);
-	}
-
 	return drm_edid;
 }
 
-static int adv7511_get_modes(struct adv7511 *adv7511,
-			     struct drm_connector *connector)
-{
-	const struct drm_edid *drm_edid;
-	unsigned int count;
-
-	drm_edid = adv7511_edid_read(adv7511, connector);
-
-	drm_edid_connector_update(connector, drm_edid);
-	count = drm_edid_connector_add_modes(connector);
-
-	drm_edid_free(drm_edid);
-
-	return count;
-}
-
 static enum drm_connector_status
-adv7511_detect(struct adv7511 *adv7511, struct drm_connector *connector)
+adv7511_detect(struct adv7511 *adv7511)
 {
 	enum drm_connector_status status;
 	unsigned int val;
@@ -699,8 +628,6 @@ adv7511_detect(struct adv7511 *adv7511, struct drm_connector *connector)
 	if (status == connector_status_connected && hpd && adv7511->powered) {
 		regcache_mark_dirty(adv7511->regmap);
 		adv7511_power_on(adv7511);
-		if (connector)
-			adv7511_get_modes(adv7511, connector);
 		if (adv7511->status == connector_status_connected)
 			status = connector_status_disconnected;
 	} else {
@@ -719,17 +646,7 @@ adv7511_detect(struct adv7511 *adv7511, struct drm_connector *connector)
 	return status;
 }
 
-static enum drm_mode_status adv7511_mode_valid(struct adv7511 *adv7511,
-			      const struct drm_display_mode *mode)
-{
-	if (mode->clock > 165000)
-		return MODE_CLOCK_HIGH;
-
-	return MODE_OK;
-}
-
 static void adv7511_mode_set(struct adv7511 *adv7511,
-			     const struct drm_display_mode *mode,
 			     const struct drm_display_mode *adj_mode)
 {
 	unsigned int low_refresh_rate;
@@ -800,11 +717,11 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
 			vsync_polarity = 1;
 	}
 
-	if (drm_mode_vrefresh(mode) <= 24)
+	if (drm_mode_vrefresh(adj_mode) <= 24)
 		low_refresh_rate = ADV7511_LOW_REFRESH_RATE_24HZ;
-	else if (drm_mode_vrefresh(mode) <= 25)
+	else if (drm_mode_vrefresh(adj_mode) <= 25)
 		low_refresh_rate = ADV7511_LOW_REFRESH_RATE_25HZ;
-	else if (drm_mode_vrefresh(mode) <= 30)
+	else if (drm_mode_vrefresh(adj_mode) <= 30)
 		low_refresh_rate = ADV7511_LOW_REFRESH_RATE_30HZ;
 	else
 		low_refresh_rate = ADV7511_LOW_REFRESH_RATE_NONE;
@@ -826,77 +743,21 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
 	 * supposed to give better results.
 	 */
 
-	adv7511->f_tmds = mode->clock;
-}
-
-/* -----------------------------------------------------------------------------
- * DRM Connector Operations
- */
-
-static struct adv7511 *connector_to_adv7511(struct drm_connector *connector)
-{
-	return container_of(connector, struct adv7511, connector);
+	adv7511->f_tmds = adj_mode->clock;
 }
 
-static int adv7511_connector_get_modes(struct drm_connector *connector)
-{
-	struct adv7511 *adv = connector_to_adv7511(connector);
-
-	return adv7511_get_modes(adv, connector);
-}
-
-static enum drm_mode_status
-adv7511_connector_mode_valid(struct drm_connector *connector,
-			     const struct drm_display_mode *mode)
-{
-	struct adv7511 *adv = connector_to_adv7511(connector);
-
-	return adv7511_mode_valid(adv, mode);
-}
-
-static struct drm_connector_helper_funcs adv7511_connector_helper_funcs = {
-	.get_modes = adv7511_connector_get_modes,
-	.mode_valid = adv7511_connector_mode_valid,
-};
-
-static enum drm_connector_status
-adv7511_connector_detect(struct drm_connector *connector, bool force)
-{
-	struct adv7511 *adv = connector_to_adv7511(connector);
-
-	return adv7511_detect(adv, connector);
-}
-
-static const struct drm_connector_funcs adv7511_connector_funcs = {
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.detect = adv7511_connector_detect,
-	.destroy = drm_connector_cleanup,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
 static int adv7511_connector_init(struct adv7511 *adv)
 {
 	struct drm_bridge *bridge = &adv->bridge;
-	int ret;
-
-	if (adv->i2c_main->irq)
-		adv->connector.polled = DRM_CONNECTOR_POLL_HPD;
-	else
-		adv->connector.polled = DRM_CONNECTOR_POLL_CONNECT |
-				DRM_CONNECTOR_POLL_DISCONNECT;
+	struct drm_connector *connector;
 
-	ret = drm_connector_init(bridge->dev, &adv->connector,
-				 &adv7511_connector_funcs,
-				 DRM_MODE_CONNECTOR_HDMIA);
-	if (ret < 0) {
+	connector = drm_bridge_connector_init(bridge->dev, bridge->encoder);
+	if (IS_ERR(connector)) {
 		DRM_ERROR("Failed to initialize connector with drm\n");
-		return ret;
+		return PTR_ERR(connector);
 	}
-	drm_connector_helper_add(&adv->connector,
-				 &adv7511_connector_helper_funcs);
-	drm_connector_attach_encoder(&adv->connector, bridge->encoder);
+
+	drm_connector_attach_encoder(connector, bridge->encoder);
 
 	return 0;
 }
@@ -905,7 +766,7 @@ static int adv7511_connector_init(struct adv7511 *adv)
  * DRM Bridge Operations
  */
 
-static struct adv7511 *bridge_to_adv7511(struct drm_bridge *bridge)
+static const struct adv7511 *bridge_to_adv7511_const(const struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct adv7511, bridge);
 }
@@ -913,9 +774,31 @@ static struct adv7511 *bridge_to_adv7511(struct drm_bridge *bridge)
 static void adv7511_bridge_atomic_enable(struct drm_bridge *bridge,
 					 struct drm_bridge_state *bridge_state)
 {
+	struct drm_atomic_state *state = bridge_state->base.state;
 	struct adv7511 *adv = bridge_to_adv7511(bridge);
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
 
 	adv7511_power_on(adv);
+
+	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+	if (WARN_ON(!connector))
+		return;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (WARN_ON(!conn_state))
+		return;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	if (WARN_ON(!crtc_state))
+		return;
+
+	adv7511_set_config_csc(adv, connector, adv->rgb);
+
+	adv7511_mode_set(adv, &crtc_state->adjusted_mode);
+
+	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
 }
 
 static void adv7511_bridge_atomic_disable(struct drm_bridge *bridge,
@@ -926,13 +809,17 @@ static void adv7511_bridge_atomic_disable(struct drm_bridge *bridge,
 	adv7511_power_off(adv);
 }
 
-static void adv7511_bridge_mode_set(struct drm_bridge *bridge,
-				    const struct drm_display_mode *mode,
-				    const struct drm_display_mode *adj_mode)
+static enum drm_mode_status
+adv7511_bridge_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
+					 const struct drm_display_mode *mode,
+					 unsigned long long tmds_rate)
 {
-	struct adv7511 *adv = bridge_to_adv7511(bridge);
+	const struct adv7511 *adv = bridge_to_adv7511_const(bridge);
 
-	adv7511_mode_set(adv, mode, adj_mode);
+	if (mode->clock > 1000ULL * adv->info->max_mode_clock_khz)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
 }
 
 static enum drm_mode_status adv7511_bridge_mode_valid(struct drm_bridge *bridge,
@@ -941,10 +828,10 @@ static enum drm_mode_status adv7511_bridge_mode_valid(struct drm_bridge *bridge,
 {
 	struct adv7511 *adv = bridge_to_adv7511(bridge);
 
-	if (adv->info->has_dsi)
-		return adv7533_mode_valid(adv, mode);
-	else
-		return adv7511_mode_valid(adv, mode);
+	if (!adv->info->has_dsi)
+		return MODE_OK;
+
+	return adv7533_mode_valid(adv, mode);
 }
 
 static int adv7511_bridge_attach(struct drm_bridge *bridge,
@@ -977,7 +864,7 @@ static enum drm_connector_status adv7511_bridge_detect(struct drm_bridge *bridge
 {
 	struct adv7511 *adv = bridge_to_adv7511(bridge);
 
-	return adv7511_detect(adv, NULL);
+	return adv7511_detect(adv);
 }
 
 static const struct drm_edid *adv7511_bridge_edid_read(struct drm_bridge *bridge,
@@ -988,28 +875,71 @@ static const struct drm_edid *adv7511_bridge_edid_read(struct drm_bridge *bridge
 	return adv7511_edid_read(adv, connector);
 }
 
-static void adv7511_bridge_hpd_notify(struct drm_bridge *bridge,
-				      enum drm_connector_status status)
+static int adv7511_bridge_hdmi_clear_infoframe(struct drm_bridge *bridge,
+					       enum hdmi_infoframe_type type)
 {
-	struct adv7511 *adv = bridge_to_adv7511(bridge);
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
+
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AVI:
+		adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_AVI_INFOFRAME);
+		break;
+	default:
+		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
+		break;
+	}
+
+	return 0;
+}
+
+static int adv7511_bridge_hdmi_write_infoframe(struct drm_bridge *bridge,
+					       enum hdmi_infoframe_type type,
+					       const u8 *buffer, size_t len)
+{
+	struct adv7511 *adv7511 = bridge_to_adv7511(bridge);
+
+	adv7511_bridge_hdmi_clear_infoframe(bridge, type);
+
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AVI:
+		/* The AVI infoframe id is not configurable */
+		regmap_bulk_write(adv7511->regmap, ADV7511_REG_AVI_INFOFRAME_VERSION,
+				  buffer + 1, len - 1);
 
-	if (status == connector_status_disconnected)
-		cec_phys_addr_invalidate(adv->cec_adap);
+		adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_AVI_INFOFRAME);
+		break;
+	default:
+		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
+		break;
+	}
+
+	return 0;
 }
 
 static const struct drm_bridge_funcs adv7511_bridge_funcs = {
-	.mode_set = adv7511_bridge_mode_set,
 	.mode_valid = adv7511_bridge_mode_valid,
 	.attach = adv7511_bridge_attach,
 	.detect = adv7511_bridge_detect,
 	.edid_read = adv7511_bridge_edid_read,
-	.hpd_notify = adv7511_bridge_hpd_notify,
 
 	.atomic_enable = adv7511_bridge_atomic_enable,
 	.atomic_disable = adv7511_bridge_atomic_disable,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
+
+	.hdmi_tmds_char_rate_valid = adv7511_bridge_hdmi_tmds_char_rate_valid,
+	.hdmi_clear_infoframe = adv7511_bridge_hdmi_clear_infoframe,
+	.hdmi_write_infoframe = adv7511_bridge_hdmi_write_infoframe,
+
+	.hdmi_audio_startup = adv7511_hdmi_audio_startup,
+	.hdmi_audio_prepare = adv7511_hdmi_audio_prepare,
+	.hdmi_audio_shutdown = adv7511_hdmi_audio_shutdown,
+
+	.hdmi_cec_init = adv7511_cec_init,
+	.hdmi_cec_enable = adv7511_cec_enable,
+	.hdmi_cec_log_addr = adv7511_cec_log_addr,
+	.hdmi_cec_transmit = adv7511_cec_transmit,
 };
 
 /* -----------------------------------------------------------------------------
@@ -1320,22 +1250,40 @@ static int adv7511_probe(struct i2c_client *i2c)
 	if (adv7511->info->link_config)
 		adv7511_set_link_config(adv7511, &link_config);
 
-	ret = adv7511_cec_init(dev, adv7511);
-	if (ret)
-		goto err_unregister_cec;
+	regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL,
+		     ADV7511_CEC_CTRL_POWER_DOWN);
 
 	adv7511->bridge.funcs = &adv7511_bridge_funcs;
-	adv7511->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
+	adv7511->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
+		DRM_BRIDGE_OP_HDMI;
 	if (adv7511->i2c_main->irq)
 		adv7511->bridge.ops |= DRM_BRIDGE_OP_HPD;
 
+	adv7511->bridge.vendor = "Analog";
+	adv7511->bridge.product = adv7511->info->name;
+	adv7511->bridge.hdmi_dev = dev;
+
+#ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
+	adv7511->bridge.hdmi_audio_max_i2s_playback_channels = 2;
+	adv7511->bridge.hdmi_audio_i2s_formats = (SNDRV_PCM_FMTBIT_S16_LE |
+						  SNDRV_PCM_FMTBIT_S20_3LE |
+						  SNDRV_PCM_FMTBIT_S24_3LE |
+						  SNDRV_PCM_FMTBIT_S24_LE |
+						  SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE),
+	adv7511->bridge.hdmi_audio_spdif_playback = 1;
+	adv7511->bridge.hdmi_audio_dai_port = 2;
+#endif
+
+#ifdef CONFIG_DRM_I2C_ADV7511_CEC
+	adv7511->bridge.hdmi_cec_adapter_name = dev_name(dev);
+	adv7511->bridge.hdmi_cec_available_las = ADV7511_MAX_ADDRS;
+#endif
+
 	adv7511->bridge.of_node = dev->of_node;
 	adv7511->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 
 	drm_bridge_add(&adv7511->bridge);
 
-	adv7511_audio_init(dev, adv7511);
-
 	if (i2c->irq) {
 		init_waitqueue_head(&adv7511->wq);
 
@@ -1357,10 +1305,7 @@ static int adv7511_probe(struct i2c_client *i2c)
 	return 0;
 
 err_unregister_audio:
-	adv7511_audio_exit(adv7511);
 	drm_bridge_remove(&adv7511->bridge);
-err_unregister_cec:
-	cec_unregister_adapter(adv7511->cec_adap);
 	i2c_unregister_device(adv7511->i2c_cec);
 	clk_disable_unprepare(adv7511->cec_clk);
 err_i2c_unregister_packet:
@@ -1381,9 +1326,6 @@ static void adv7511_remove(struct i2c_client *i2c)
 
 	drm_bridge_remove(&adv7511->bridge);
 
-	adv7511_audio_exit(adv7511);
-
-	cec_unregister_adapter(adv7511->cec_adap);
 	i2c_unregister_device(adv7511->i2c_cec);
 	clk_disable_unprepare(adv7511->cec_clk);
 
@@ -1393,6 +1335,8 @@ static void adv7511_remove(struct i2c_client *i2c)
 
 static const struct adv7511_chip_info adv7511_chip_info = {
 	.type = ADV7511,
+	.name = "ADV7511",
+	.max_mode_clock_khz = 165000,
 	.supply_names = adv7511_supply_names,
 	.num_supplies = ARRAY_SIZE(adv7511_supply_names),
 	.link_config = true,
@@ -1400,6 +1344,7 @@ static const struct adv7511_chip_info adv7511_chip_info = {
 
 static const struct adv7511_chip_info adv7533_chip_info = {
 	.type = ADV7533,
+	.name = "ADV7533",
 	.max_mode_clock_khz = 80000,
 	.max_lane_freq_khz = 800000,
 	.supply_names = adv7533_supply_names,
@@ -1410,6 +1355,7 @@ static const struct adv7511_chip_info adv7533_chip_info = {
 
 static const struct adv7511_chip_info adv7535_chip_info = {
 	.type = ADV7535,
+	.name = "ADV7535",
 	.max_mode_clock_khz = 148500,
 	.max_lane_freq_khz = 891000,
 	.supply_names = adv7533_supply_names,
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index 4481489aaf5ebf164313c86cbf3447d2d7914ab9..3ed0fa56bb97c53c2d578c242603e195a574dc14 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -106,10 +106,6 @@ enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
 	struct mipi_dsi_device *dsi = adv->dsi;
 	u8 bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
 
-	/* Check max clock for either 7533 or 7535 */
-	if (mode->clock > adv->info->max_mode_clock_khz)
-		return MODE_CLOCK_HIGH;
-
 	/* Check max clock for each lane */
 	if (mode->clock * bpp > adv->info->max_lane_freq_khz * adv->num_dsi_lanes)
 		return MODE_CLOCK_HIGH;

-- 
2.39.5

