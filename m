Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5286A54E712
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 18:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3F311A4D7;
	Thu, 16 Jun 2022 16:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC27711A479
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:55:55 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25G4igBe030693;
 Thu, 16 Jun 2022 09:34:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=KldRAQaWlyO+eIosBDd1bGZgvOmvQGtuzz10esRY5l4=;
 b=k/9ab/S2XbU350x3WZAVH6h3cC08n3Wdy7SKnthddTO+4NQK7o5wFpBUuTQG4u6yqKI8
 OmZ5LxgOP7fNZD5i1IlQ4aqMMqV0tF1GOUC77KqVCXrD38hUQ219BOHLfQf7C4q/FNRt
 VtOXh26JMgoHmxSWZN58TQxw50iixwi1XPCV6ShMEd55iRuaifeciEzRsLujnVp3EBYz
 HSqOQigA3fjw8sU3dNwbsd2dnOfKIC8t0mEUMxA4mzE8Gac/FZHCkt6uBkOLJ947wSgo
 wRxft1LQLiSfvM3yBTa1et0CqJCeLVeAROsh3Mqi3En6eHK7yqIp59ZXbm6O6bTmdZOC tQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf35vuw-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:43 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:33 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:33 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A41F611D4;
 Thu, 16 Jun 2022 14:34:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 46/96] ASoC: ad*: Remove now redundant non_legacy_dai_naming
 flag
Date: Thu, 16 Jun 2022 15:33:39 +0100
Message-ID: <20220616143429.1324494-47-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 5GsZk63Ebre3qby9lir0QAv1OankcQSo
X-Proofpoint-ORIG-GUID: 5GsZk63Ebre3qby9lir0QAv1OankcQSo
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Thu, 16 Jun 2022 16:26:00 +0000
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
 sound/soc/codecs/ad1836.c   | 1 -
 sound/soc/codecs/ad193x.c   | 1 -
 sound/soc/codecs/ad1980.c   | 1 -
 sound/soc/codecs/ad73311.c  | 1 -
 sound/soc/codecs/adau1373.c | 1 -
 sound/soc/codecs/adau1701.c | 1 -
 sound/soc/codecs/adau1761.c | 1 -
 sound/soc/codecs/adau1781.c | 1 -
 sound/soc/codecs/adau1977.c | 1 -
 sound/soc/codecs/adau7002.c | 1 -
 sound/soc/codecs/adau7118.c | 1 -
 sound/soc/codecs/adav80x.c  | 1 -
 12 files changed, 12 deletions(-)

diff --git a/sound/soc/codecs/ad1836.c b/sound/soc/codecs/ad1836.c
index 29e1689da67ff..2c64df96b5ce9 100644
--- a/sound/soc/codecs/ad1836.c
+++ b/sound/soc/codecs/ad1836.c
@@ -332,7 +332,6 @@ static const struct snd_soc_component_driver soc_component_dev_ad1836 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct reg_default ad1836_reg_defaults[] = {
diff --git a/sound/soc/codecs/ad193x.c b/sound/soc/codecs/ad193x.c
index 30b98b4267e13..1d3c4d94b4ae9 100644
--- a/sound/soc/codecs/ad193x.c
+++ b/sound/soc/codecs/ad193x.c
@@ -523,7 +523,6 @@ static const struct snd_soc_component_driver soc_component_dev_ad193x = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 const struct regmap_config ad193x_regmap_config = {
diff --git a/sound/soc/codecs/ad1980.c b/sound/soc/codecs/ad1980.c
index 9fd2023da218f..5e777d7fd5d91 100644
--- a/sound/soc/codecs/ad1980.c
+++ b/sound/soc/codecs/ad1980.c
@@ -302,7 +302,6 @@ static const struct snd_soc_component_driver soc_component_dev_ad1980 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int ad1980_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/ad73311.c b/sound/soc/codecs/ad73311.c
index b98bf19f594e0..f6090ac57e937 100644
--- a/sound/soc/codecs/ad73311.c
+++ b/sound/soc/codecs/ad73311.c
@@ -58,7 +58,6 @@ static const struct snd_soc_component_driver soc_component_dev_ad73311 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int ad73311_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/adau1373.c b/sound/soc/codecs/adau1373.c
index a9032b5c8d782..7f832d00ab177 100644
--- a/sound/soc/codecs/adau1373.c
+++ b/sound/soc/codecs/adau1373.c
@@ -1470,7 +1470,6 @@ static const struct snd_soc_component_driver adau1373_component_driver = {
 	.num_dapm_routes	= ARRAY_SIZE(adau1373_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int adau1373_i2c_probe(struct i2c_client *client)
diff --git a/sound/soc/codecs/adau1701.c b/sound/soc/codecs/adau1701.c
index 98768e5300f09..135a7db7fcf95 100644
--- a/sound/soc/codecs/adau1701.c
+++ b/sound/soc/codecs/adau1701.c
@@ -772,7 +772,6 @@ static const struct snd_soc_component_driver adau1701_component_drv = {
 	.set_sysclk		= adau1701_set_sysclk,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config adau1701_regmap = {
diff --git a/sound/soc/codecs/adau1761.c b/sound/soc/codecs/adau1761.c
index 8f887227981f1..3ccc7acac2056 100644
--- a/sound/soc/codecs/adau1761.c
+++ b/sound/soc/codecs/adau1761.c
@@ -930,7 +930,6 @@ static const struct snd_soc_component_driver adau1761_component_driver = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 #define ADAU1761_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE | \
diff --git a/sound/soc/codecs/adau1781.c b/sound/soc/codecs/adau1781.c
index 74dc3344b2590..ff6be24863bfb 100644
--- a/sound/soc/codecs/adau1781.c
+++ b/sound/soc/codecs/adau1781.c
@@ -439,7 +439,6 @@ static const struct snd_soc_component_driver adau1781_component_driver = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 #define ADAU1781_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE | \
diff --git a/sound/soc/codecs/adau1977.c b/sound/soc/codecs/adau1977.c
index 5fcbdf2ec313c..7a9672f94fc6c 100644
--- a/sound/soc/codecs/adau1977.c
+++ b/sound/soc/codecs/adau1977.c
@@ -876,7 +876,6 @@ static const struct snd_soc_component_driver adau1977_component_driver = {
 	.num_dapm_routes	= ARRAY_SIZE(adau1977_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int adau1977_setup_micbias(struct adau1977 *adau1977)
diff --git a/sound/soc/codecs/adau7002.c b/sound/soc/codecs/adau7002.c
index 0e00de6ce3fb1..401bafabc8eb4 100644
--- a/sound/soc/codecs/adau7002.c
+++ b/sound/soc/codecs/adau7002.c
@@ -91,7 +91,6 @@ static const struct snd_soc_component_driver adau7002_component_driver = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int adau7002_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/adau7118.c b/sound/soc/codecs/adau7118.c
index 841229dcbca10..bbb0972498876 100644
--- a/sound/soc/codecs/adau7118.c
+++ b/sound/soc/codecs/adau7118.c
@@ -442,7 +442,6 @@ static const struct snd_soc_component_driver adau7118_component_driver = {
 	.num_dapm_widgets	= ARRAY_SIZE(adau7118_widgets),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static void adau7118_regulator_disable(void *data)
diff --git a/sound/soc/codecs/adav80x.c b/sound/soc/codecs/adav80x.c
index 90f3a5e9e31f4..fcff35f26cecb 100644
--- a/sound/soc/codecs/adav80x.c
+++ b/sound/soc/codecs/adav80x.c
@@ -842,7 +842,6 @@ static const struct snd_soc_component_driver adav80x_component_driver = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 int adav80x_bus_probe(struct device *dev, struct regmap *regmap)
-- 
2.30.2

