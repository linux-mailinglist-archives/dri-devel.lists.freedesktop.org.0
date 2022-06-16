Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE1E54E71B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 18:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FACF11A576;
	Thu, 16 Jun 2022 16:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5CA89DC5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:59:30 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GBnCaS029573;
 Thu, 16 Jun 2022 09:34:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=UWurxK+sP2c9lc0Yu/j2Wc6oA/5aImP8chnPapm4C/Q=;
 b=BYuiF91fYAAyqtqVfOdEOWHTRMA0WwMBI2rbzabIDqunnDQ+Q3ZXBKMJxnvxrPhPLAOo
 2JIG4Zwf3mrepg4FkSZKI+D6AlnUrr5ycVJGfnCkXQO+eXvALbid5t+O0kNwRlC3mepU
 j5Mcg035jxhGlPEx8bJgXTQU76t7fTMKAo+mpyN28clBGHrYeam90p9zUqOqh3oL0qc9
 zoYk6WDYaYMP5bAGQrLW1YaCCbUFJ3LNTASKZlw+hcCE/ZDE2aGUHwWnhWjRYnwRo5iU
 OgqGEsNanHD0MgVOpTEfxIAJYDo677M/MUMRr6QVbJ0g52IqOp/PGMS+GUWH57Zz6+uO fA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq5w3m-12
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:49 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:35 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:35 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0A08C11D4;
 Thu, 16 Jun 2022 14:34:35 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 65/96] ASoC: wm*: Remove now redundant non_legacy_dai_naming
 flag
Date: Thu, 16 Jun 2022 15:33:58 +0100
Message-ID: <20220616143429.1324494-66-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: K_7RZPdDklQgX6DWSfWFEW-Zf8it4XnT
X-Proofpoint-GUID: K_7RZPdDklQgX6DWSfWFEW-Zf8it4XnT
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Thu, 16 Jun 2022 16:26:01 +0000
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
Cc: cezary.rojewski@intel.com, kuninori.morimoto.gx@renesas.com,
 airlied@linux.ie, alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org, kernel@pengutronix.de,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, vkoul@kernel.org,
 jarkko.nikula@bitmer.com, shawnguo@kernel.org, daniel@zonque.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ASoC core has now been changed to default to the non-legacy DAI
naming, as such drivers using the new scheme no longer need to specify
the non_legacy_dai_naming flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm0010.c     | 1 -
 sound/soc/codecs/wm1250-ev1.c | 1 -
 sound/soc/codecs/wm2000.c     | 1 -
 sound/soc/codecs/wm2200.c     | 1 -
 sound/soc/codecs/wm5100.c     | 1 -
 sound/soc/codecs/wm5102.c     | 1 -
 sound/soc/codecs/wm5110.c     | 1 -
 sound/soc/codecs/wm8350.c     | 1 -
 sound/soc/codecs/wm8400.c     | 1 -
 sound/soc/codecs/wm8510.c     | 1 -
 sound/soc/codecs/wm8523.c     | 1 -
 sound/soc/codecs/wm8524.c     | 1 -
 sound/soc/codecs/wm8580.c     | 1 -
 sound/soc/codecs/wm8711.c     | 1 -
 sound/soc/codecs/wm8727.c     | 1 -
 sound/soc/codecs/wm8728.c     | 1 -
 sound/soc/codecs/wm8731.c     | 1 -
 sound/soc/codecs/wm8737.c     | 1 -
 sound/soc/codecs/wm8741.c     | 1 -
 sound/soc/codecs/wm8750.c     | 1 -
 sound/soc/codecs/wm8753.c     | 1 -
 sound/soc/codecs/wm8770.c     | 1 -
 sound/soc/codecs/wm8776.c     | 1 -
 sound/soc/codecs/wm8782.c     | 1 -
 sound/soc/codecs/wm8804.c     | 1 -
 sound/soc/codecs/wm8900.c     | 1 -
 sound/soc/codecs/wm8903.c     | 1 -
 sound/soc/codecs/wm8904.c     | 1 -
 sound/soc/codecs/wm8940.c     | 1 -
 sound/soc/codecs/wm8955.c     | 1 -
 sound/soc/codecs/wm8960.c     | 1 -
 sound/soc/codecs/wm8961.c     | 1 -
 sound/soc/codecs/wm8962.c     | 1 -
 sound/soc/codecs/wm8971.c     | 1 -
 sound/soc/codecs/wm8974.c     | 1 -
 sound/soc/codecs/wm8978.c     | 1 -
 sound/soc/codecs/wm8983.c     | 1 -
 sound/soc/codecs/wm8985.c     | 1 -
 sound/soc/codecs/wm8988.c     | 1 -
 sound/soc/codecs/wm8990.c     | 1 -
 sound/soc/codecs/wm8991.c     | 1 -
 sound/soc/codecs/wm8993.c     | 1 -
 sound/soc/codecs/wm8994.c     | 1 -
 sound/soc/codecs/wm8995.c     | 1 -
 sound/soc/codecs/wm8996.c     | 2 --
 sound/soc/codecs/wm8997.c     | 1 -
 sound/soc/codecs/wm8998.c     | 1 -
 sound/soc/codecs/wm9081.c     | 1 -
 sound/soc/codecs/wm9090.c     | 1 -
 sound/soc/codecs/wm9705.c     | 1 -
 sound/soc/codecs/wm9712.c     | 1 -
 sound/soc/codecs/wm9713.c     | 1 -
 52 files changed, 53 deletions(-)

diff --git a/sound/soc/codecs/wm0010.c b/sound/soc/codecs/wm0010.c
index 1bef1c500c8e3..034a4e858c7e6 100644
--- a/sound/soc/codecs/wm0010.c
+++ b/sound/soc/codecs/wm0010.c
@@ -789,7 +789,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm0010 = {
 	.num_dapm_routes	= ARRAY_SIZE(wm0010_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 #define WM0010_RATES (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000)
diff --git a/sound/soc/codecs/wm1250-ev1.c b/sound/soc/codecs/wm1250-ev1.c
index b6366dea15a67..98343626078b6 100644
--- a/sound/soc/codecs/wm1250-ev1.c
+++ b/sound/soc/codecs/wm1250-ev1.c
@@ -144,7 +144,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm1250_ev1 = {
 	.set_bias_level		= wm1250_ev1_set_bias_level,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int wm1250_ev1_pdata(struct i2c_client *i2c)
diff --git a/sound/soc/codecs/wm2000.c b/sound/soc/codecs/wm2000.c
index ede5f2a982a63..14b4fd97488c8 100644
--- a/sound/soc/codecs/wm2000.c
+++ b/sound/soc/codecs/wm2000.c
@@ -803,7 +803,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm2000 = {
 	.num_dapm_routes	= ARRAY_SIZE(wm2000_audio_map),
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int wm2000_i2c_probe(struct i2c_client *i2c)
diff --git a/sound/soc/codecs/wm2200.c b/sound/soc/codecs/wm2200.c
index 1cd544580c832..7b4e162a298c0 100644
--- a/sound/soc/codecs/wm2200.c
+++ b/sound/soc/codecs/wm2200.c
@@ -2104,7 +2104,6 @@ static const struct snd_soc_component_driver soc_component_wm2200 = {
 	.dapm_routes		= wm2200_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(wm2200_dapm_routes),
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static irqreturn_t wm2200_irq(int irq, void *data)
diff --git a/sound/soc/codecs/wm5100.c b/sound/soc/codecs/wm5100.c
index a89870918174b..35a85ce6b4648 100644
--- a/sound/soc/codecs/wm5100.c
+++ b/sound/soc/codecs/wm5100.c
@@ -2389,7 +2389,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm5100 = {
 	.num_dapm_routes	= ARRAY_SIZE(wm5100_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config wm5100_regmap = {
diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index da2f8998df87a..8b1caac65c3af 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -2015,7 +2015,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm5102 = {
 	.num_dapm_routes	= ARRAY_SIZE(wm5102_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int wm5102_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
index 4973ba1ed7791..3a9b0a0e7b027 100644
--- a/sound/soc/codecs/wm5110.c
+++ b/sound/soc/codecs/wm5110.c
@@ -2381,7 +2381,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm5110 = {
 	.num_dapm_routes	= ARRAY_SIZE(wm5110_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int wm5110_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/wm8350.c b/sound/soc/codecs/wm8350.c
index 41504ce2a682f..66bd281095e1c 100644
--- a/sound/soc/codecs/wm8350.c
+++ b/sound/soc/codecs/wm8350.c
@@ -1613,7 +1613,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8350 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int wm8350_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/wm8400.c b/sound/soc/codecs/wm8400.c
index bf5e77c86aed6..19ce839f6ef7c 100644
--- a/sound/soc/codecs/wm8400.c
+++ b/sound/soc/codecs/wm8400.c
@@ -1322,7 +1322,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8400 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int wm8400_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/wm8510.c b/sound/soc/codecs/wm8510.c
index c6439d25006bf..e13f9780a111b 100644
--- a/sound/soc/codecs/wm8510.c
+++ b/sound/soc/codecs/wm8510.c
@@ -592,7 +592,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8510 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct of_device_id wm8510_of_match[] = {
diff --git a/sound/soc/codecs/wm8523.c b/sound/soc/codecs/wm8523.c
index ba35a0221dc84..66f6371d8acfa 100644
--- a/sound/soc/codecs/wm8523.c
+++ b/sound/soc/codecs/wm8523.c
@@ -422,7 +422,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8523 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct of_device_id wm8523_of_match[] = {
diff --git a/sound/soc/codecs/wm8524.c b/sound/soc/codecs/wm8524.c
index 81f858f6bd676..b56dcac602448 100644
--- a/sound/soc/codecs/wm8524.c
+++ b/sound/soc/codecs/wm8524.c
@@ -203,7 +203,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8524 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct of_device_id wm8524_of_match[] = {
diff --git a/sound/soc/codecs/wm8580.c b/sound/soc/codecs/wm8580.c
index 84020195314d9..ca796aa0aeb79 100644
--- a/sound/soc/codecs/wm8580.c
+++ b/sound/soc/codecs/wm8580.c
@@ -966,7 +966,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8580 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config wm8580_regmap = {
diff --git a/sound/soc/codecs/wm8711.c b/sound/soc/codecs/wm8711.c
index b68a1ebcd0617..383c6796e8a39 100644
--- a/sound/soc/codecs/wm8711.c
+++ b/sound/soc/codecs/wm8711.c
@@ -378,7 +378,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8711 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct of_device_id wm8711_of_match[] = {
diff --git a/sound/soc/codecs/wm8727.c b/sound/soc/codecs/wm8727.c
index 1a118b75b5398..d6b0a570dd87c 100644
--- a/sound/soc/codecs/wm8727.c
+++ b/sound/soc/codecs/wm8727.c
@@ -55,7 +55,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8727 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int wm8727_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/wm8728.c b/sound/soc/codecs/wm8728.c
index 119ff0a1bb35c..a3dbdbf40723e 100644
--- a/sound/soc/codecs/wm8728.c
+++ b/sound/soc/codecs/wm8728.c
@@ -221,7 +221,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8728 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct of_device_id wm8728_of_match[] = {
diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index 2408c4a591d55..d5ab3ba126a6b 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -561,7 +561,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8731 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 int wm8731_init(struct device *dev, struct wm8731_priv *wm8731)
diff --git a/sound/soc/codecs/wm8737.c b/sound/soc/codecs/wm8737.c
index 5778091d1c09f..90b54343370c4 100644
--- a/sound/soc/codecs/wm8737.c
+++ b/sound/soc/codecs/wm8737.c
@@ -583,7 +583,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8737 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct of_device_id wm8737_of_match[] = {
diff --git a/sound/soc/codecs/wm8741.c b/sound/soc/codecs/wm8741.c
index 871e2c5421b86..c7afa4f2795d8 100644
--- a/sound/soc/codecs/wm8741.c
+++ b/sound/soc/codecs/wm8741.c
@@ -528,7 +528,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8741 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct of_device_id wm8741_of_match[] = {
diff --git a/sound/soc/codecs/wm8750.c b/sound/soc/codecs/wm8750.c
index 1426fc1f7c5ac..2f6ee8d6639f8 100644
--- a/sound/soc/codecs/wm8750.c
+++ b/sound/soc/codecs/wm8750.c
@@ -719,7 +719,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8750 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct of_device_id wm8750_of_match[] = {
diff --git a/sound/soc/codecs/wm8753.c b/sound/soc/codecs/wm8753.c
index 931134d334eca..bb18f58dc670f 100644
--- a/sound/soc/codecs/wm8753.c
+++ b/sound/soc/codecs/wm8753.c
@@ -1492,7 +1492,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8753 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct of_device_id wm8753_of_match[] = {
diff --git a/sound/soc/codecs/wm8770.c b/sound/soc/codecs/wm8770.c
index 5f394065030d2..e03fee8869c37 100644
--- a/sound/soc/codecs/wm8770.c
+++ b/sound/soc/codecs/wm8770.c
@@ -617,7 +617,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8770 = {
 	.num_dapm_routes	= ARRAY_SIZE(wm8770_intercon),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct of_device_id wm8770_of_match[] = {
diff --git a/sound/soc/codecs/wm8776.c b/sound/soc/codecs/wm8776.c
index f164cb6744c49..936ea24621b0d 100644
--- a/sound/soc/codecs/wm8776.c
+++ b/sound/soc/codecs/wm8776.c
@@ -436,7 +436,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8776 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct of_device_id wm8776_of_match[] = {
diff --git a/sound/soc/codecs/wm8782.c b/sound/soc/codecs/wm8782.c
index f89855c616ebe..95ff4339d103b 100644
--- a/sound/soc/codecs/wm8782.c
+++ b/sound/soc/codecs/wm8782.c
@@ -99,7 +99,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8782 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int wm8782_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/wm8804.c b/sound/soc/codecs/wm8804.c
index 21bf0cfa1e7e7..0b234bae480e1 100644
--- a/sound/soc/codecs/wm8804.c
+++ b/sound/soc/codecs/wm8804.c
@@ -546,7 +546,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8804 = {
 	.num_dapm_routes	= ARRAY_SIZE(wm8804_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 const struct regmap_config wm8804_regmap_config = {
diff --git a/sound/soc/codecs/wm8900.c b/sound/soc/codecs/wm8900.c
index 84a3daf0c11e3..d6420df3505d5 100644
--- a/sound/soc/codecs/wm8900.c
+++ b/sound/soc/codecs/wm8900.c
@@ -1214,7 +1214,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8900 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config wm8900_regmap = {
diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 3c95c2aea5152..54e0a7628cd57 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -1893,7 +1893,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8903 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config wm8903_regmap = {
diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index 04bb8e3924977..ca6a01a230af4 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -2131,7 +2131,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8904 = {
 	.set_bias_level		= wm8904_set_bias_level,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config wm8904_regmap = {
diff --git a/sound/soc/codecs/wm8940.c b/sound/soc/codecs/wm8940.c
index 589394d420ced..8dac9fd885470 100644
--- a/sound/soc/codecs/wm8940.c
+++ b/sound/soc/codecs/wm8940.c
@@ -734,7 +734,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8940 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config wm8940_regmap = {
diff --git a/sound/soc/codecs/wm8955.c b/sound/soc/codecs/wm8955.c
index 80e3cbd704ee0..05ef45672ebc7 100644
--- a/sound/soc/codecs/wm8955.c
+++ b/sound/soc/codecs/wm8955.c
@@ -952,7 +952,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8955 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config wm8955_regmap = {
diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
index 8c8f32b230838..37956516d9976 100644
--- a/sound/soc/codecs/wm8960.c
+++ b/sound/soc/codecs/wm8960.c
@@ -1378,7 +1378,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8960 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config wm8960_regmap = {
diff --git a/sound/soc/codecs/wm8961.c b/sound/soc/codecs/wm8961.c
index 69eb731dbf4bb..7dc6aaf655767 100644
--- a/sound/soc/codecs/wm8961.c
+++ b/sound/soc/codecs/wm8961.c
@@ -895,7 +895,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8961 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config wm8961_regmap = {
diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 5cca89364280a..398c448ea8540 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3502,7 +3502,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8962 = {
 	.set_pll		= wm8962_set_fll,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 /* Improve power consumption for IN4 DC measurement mode */
diff --git a/sound/soc/codecs/wm8971.c b/sound/soc/codecs/wm8971.c
index 8a289b048e66d..4db9248de54ba 100644
--- a/sound/soc/codecs/wm8971.c
+++ b/sound/soc/codecs/wm8971.c
@@ -659,7 +659,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8971 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config wm8971_regmap = {
diff --git a/sound/soc/codecs/wm8974.c b/sound/soc/codecs/wm8974.c
index a8d7809f3f64b..010a394c705c1 100644
--- a/sound/soc/codecs/wm8974.c
+++ b/sound/soc/codecs/wm8974.c
@@ -682,7 +682,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8974 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int wm8974_i2c_probe(struct i2c_client *i2c)
diff --git a/sound/soc/codecs/wm8978.c b/sound/soc/codecs/wm8978.c
index 141f50bfec68a..a682f8020eb6d 100644
--- a/sound/soc/codecs/wm8978.c
+++ b/sound/soc/codecs/wm8978.c
@@ -1005,7 +1005,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8978 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config wm8978_regmap_config = {
diff --git a/sound/soc/codecs/wm8983.c b/sound/soc/codecs/wm8983.c
index ae89554d47bc9..50e6ac6ccbe03 100644
--- a/sound/soc/codecs/wm8983.c
+++ b/sound/soc/codecs/wm8983.c
@@ -987,7 +987,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8983 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config wm8983_regmap = {
diff --git a/sound/soc/codecs/wm8985.c b/sound/soc/codecs/wm8985.c
index cf2c32eac773a..751aa67308337 100644
--- a/sound/soc/codecs/wm8985.c
+++ b/sound/soc/codecs/wm8985.c
@@ -1116,7 +1116,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8985 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config wm8985_regmap = {
diff --git a/sound/soc/codecs/wm8988.c b/sound/soc/codecs/wm8988.c
index 27538d6598cf1..5dbdf647cd978 100644
--- a/sound/soc/codecs/wm8988.c
+++ b/sound/soc/codecs/wm8988.c
@@ -823,7 +823,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8988 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config wm8988_regmap = {
diff --git a/sound/soc/codecs/wm8990.c b/sound/soc/codecs/wm8990.c
index c9448a59c872f..589af286f133f 100644
--- a/sound/soc/codecs/wm8990.c
+++ b/sound/soc/codecs/wm8990.c
@@ -1217,7 +1217,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8990 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int wm8990_i2c_probe(struct i2c_client *i2c)
diff --git a/sound/soc/codecs/wm8991.c b/sound/soc/codecs/wm8991.c
index 998bc89bb7e12..30121993b7b4f 100644
--- a/sound/soc/codecs/wm8991.c
+++ b/sound/soc/codecs/wm8991.c
@@ -1243,7 +1243,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8991 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config wm8991_regmap = {
diff --git a/sound/soc/codecs/wm8993.c b/sound/soc/codecs/wm8993.c
index f4da77ec9d6c2..8db98b5a06bf4 100644
--- a/sound/soc/codecs/wm8993.c
+++ b/sound/soc/codecs/wm8993.c
@@ -1621,7 +1621,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8993 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int wm8993_i2c_probe(struct i2c_client *i2c)
diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index f117ec0c489f0..d3cfd3788f2ab 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -4614,7 +4614,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8994 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int wm8994_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/wm8995.c b/sound/soc/codecs/wm8995.c
index ea9727446707d..eed48bf339f24 100644
--- a/sound/soc/codecs/wm8995.c
+++ b/sound/soc/codecs/wm8995.c
@@ -2182,7 +2182,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8995 = {
 	.num_dapm_routes	= ARRAY_SIZE(wm8995_intercon),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config wm8995_regmap = {
diff --git a/sound/soc/codecs/wm8996.c b/sound/soc/codecs/wm8996.c
index f7bb27d1c76d0..17f307a310467 100644
--- a/sound/soc/codecs/wm8996.c
+++ b/sound/soc/codecs/wm8996.c
@@ -2695,8 +2695,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8996 = {
 	.set_pll		= wm8996_set_fll,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
-
 };
 
 #define WM8996_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
diff --git a/sound/soc/codecs/wm8997.c b/sound/soc/codecs/wm8997.c
index 38ef631d1a1ff..210ad662fc26d 100644
--- a/sound/soc/codecs/wm8997.c
+++ b/sound/soc/codecs/wm8997.c
@@ -1105,7 +1105,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8997 = {
 	.num_dapm_routes	= ARRAY_SIZE(wm8997_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int wm8997_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/wm8998.c b/sound/soc/codecs/wm8998.c
index 00b59fc9b1fe0..328f1946f584a 100644
--- a/sound/soc/codecs/wm8998.c
+++ b/sound/soc/codecs/wm8998.c
@@ -1325,7 +1325,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm8998 = {
 	.num_dapm_routes	= ARRAY_SIZE(wm8998_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int wm8998_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/wm9081.c b/sound/soc/codecs/wm9081.c
index 87b58448cea7c..d5151877d0fa2 100644
--- a/sound/soc/codecs/wm9081.c
+++ b/sound/soc/codecs/wm9081.c
@@ -1284,7 +1284,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm9081 = {
 	.num_dapm_routes	= ARRAY_SIZE(wm9081_audio_paths),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config wm9081_regmap = {
diff --git a/sound/soc/codecs/wm9090.c b/sound/soc/codecs/wm9090.c
index f7d80f1e37a80..ef3524c3f07fd 100644
--- a/sound/soc/codecs/wm9090.c
+++ b/sound/soc/codecs/wm9090.c
@@ -543,7 +543,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm9090 = {
 	.suspend_bias_off	= 1,
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config wm9090_regmap = {
diff --git a/sound/soc/codecs/wm9705.c b/sound/soc/codecs/wm9705.c
index 99fe8f3166248..d04902ef1d5f3 100644
--- a/sound/soc/codecs/wm9705.c
+++ b/sound/soc/codecs/wm9705.c
@@ -368,7 +368,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm9705 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int wm9705_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/wm9712.c b/sound/soc/codecs/wm9712.c
index 7515c9d4006e7..df9b7980706b2 100644
--- a/sound/soc/codecs/wm9712.c
+++ b/sound/soc/codecs/wm9712.c
@@ -692,7 +692,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm9712 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int wm9712_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/wm9713.c b/sound/soc/codecs/wm9713.c
index e0ce32dd4a811..5d2e54e06e30a 100644
--- a/sound/soc/codecs/wm9713.c
+++ b/sound/soc/codecs/wm9713.c
@@ -1257,7 +1257,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm9713 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int wm9713_probe(struct platform_device *pdev)
-- 
2.30.2

