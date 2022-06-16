Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9975D54E748
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 18:28:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA42711A5BE;
	Thu, 16 Jun 2022 16:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B3410E184
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:59:38 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC0DJl015765;
 Thu, 16 Jun 2022 09:34:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=UfIVoiyrr0PaK6vO15ORy8wXl4DXJ8/i6VmGeqPwiv4=;
 b=dzLJl9Lkj9O5Kd+H87644Mn5sWPfI9SCNZAiSIv0C9QZmrqSzoa3s1aBOlNulpTjJ4GY
 FxfnFh0Qav4YSbgNnCMni2PWx4kxeG6Nw83vh5vIiVqIAyVundlnE1mfK2+JUlrdT8ng
 iexT8Q9fWzhUj/RtqMZbwTvXBsBzTPdQBlkGyAplpdcpbbz6Y+HuF9d+dJmOridJ5hqo
 bH3hAciA5YQfgQbJU1MzhClBAtYhiA0tlxS9E0r4yGrNZePS9v65HOZTGxexDgIcsh34
 BeKgD3Ng5Kb5xE5ajyG9JiQWHOpne+kMbJe6ZEkRJCWoTNqN9SAOgBS9aSiB3IwZLAJM oA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq5w3h-19
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:44 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:34 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:34 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 17B4411DA;
 Thu, 16 Jun 2022 14:34:34 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 52/96] ASoC: max*: Remove now redundant non_legacy_dai_naming
 flag
Date: Thu, 16 Jun 2022 15:33:45 +0100
Message-ID: <20220616143429.1324494-53-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: nfKlmdZ51oapSsIYno9CbWxmrBexolYn
X-Proofpoint-GUID: nfKlmdZ51oapSsIYno9CbWxmrBexolYn
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
 sound/soc/codecs/max98088.c  | 1 -
 sound/soc/codecs/max98090.c  | 1 -
 sound/soc/codecs/max98095.c  | 1 -
 sound/soc/codecs/max98357a.c | 1 -
 sound/soc/codecs/max98371.c  | 1 -
 sound/soc/codecs/max98373.c  | 2 --
 sound/soc/codecs/max98390.c  | 1 -
 sound/soc/codecs/max98396.c  | 2 --
 sound/soc/codecs/max9850.c   | 1 -
 sound/soc/codecs/max98520.c  | 1 -
 sound/soc/codecs/max9860.c   | 1 -
 sound/soc/codecs/max9867.c   | 1 -
 sound/soc/codecs/max98925.c  | 1 -
 sound/soc/codecs/max98926.c  | 1 -
 sound/soc/codecs/max98927.c  | 1 -
 15 files changed, 17 deletions(-)

diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
index 5ef2e1279ee71..08e5c606ff27d 100644
--- a/sound/soc/codecs/max98088.c
+++ b/sound/soc/codecs/max98088.c
@@ -1734,7 +1734,6 @@ static const struct snd_soc_component_driver soc_component_dev_max98088 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct i2c_device_id max98088_i2c_id[] = {
diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 72471cdb22292..142083b13ac3b 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2519,7 +2519,6 @@ static const struct snd_soc_component_driver soc_component_dev_max98090 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config max98090_regmap = {
diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index 7bca99fa61b54..44aa58fcc23f8 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -2103,7 +2103,6 @@ static const struct snd_soc_component_driver soc_component_dev_max98095 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct i2c_device_id max98095_i2c_id[] = {
diff --git a/sound/soc/codecs/max98357a.c b/sound/soc/codecs/max98357a.c
index 9188127638848..2a2b286f1747f 100644
--- a/sound/soc/codecs/max98357a.c
+++ b/sound/soc/codecs/max98357a.c
@@ -93,7 +93,6 @@ static const struct snd_soc_component_driver max98357a_component_driver = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_dai_ops max98357a_dai_ops = {
diff --git a/sound/soc/codecs/max98371.c b/sound/soc/codecs/max98371.c
index 800f2bca6a0f1..bac9d1bcf60ae 100644
--- a/sound/soc/codecs/max98371.c
+++ b/sound/soc/codecs/max98371.c
@@ -351,7 +351,6 @@ static const struct snd_soc_component_driver max98371_component = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config max98371_regmap = {
diff --git a/sound/soc/codecs/max98373.c b/sound/soc/codecs/max98373.c
index e14fe98349a5e..9a84c0ed395e6 100644
--- a/sound/soc/codecs/max98373.c
+++ b/sound/soc/codecs/max98373.c
@@ -436,7 +436,6 @@ const struct snd_soc_component_driver soc_codec_dev_max98373 = {
 	.num_dapm_routes	= ARRAY_SIZE(max98373_audio_map),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 EXPORT_SYMBOL_GPL(soc_codec_dev_max98373);
 
@@ -450,7 +449,6 @@ const struct snd_soc_component_driver soc_codec_dev_max98373_sdw = {
 	.num_dapm_routes	= ARRAY_SIZE(max98373_audio_map),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 EXPORT_SYMBOL_GPL(soc_codec_dev_max98373_sdw);
 
diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index d83f81d9ff4ea..5c08166a8dc62 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -983,7 +983,6 @@ static const struct snd_soc_component_driver soc_codec_dev_max98390 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config max98390_regmap = {
diff --git a/sound/soc/codecs/max98396.c b/sound/soc/codecs/max98396.c
index 56eb62bb041f9..225effede9d25 100644
--- a/sound/soc/codecs/max98396.c
+++ b/sound/soc/codecs/max98396.c
@@ -1453,7 +1453,6 @@ static const struct snd_soc_component_driver soc_codec_dev_max98396 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_component_driver soc_codec_dev_max98397 = {
@@ -1467,7 +1466,6 @@ static const struct snd_soc_component_driver soc_codec_dev_max98397 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config max98396_regmap = {
diff --git a/sound/soc/codecs/max9850.c b/sound/soc/codecs/max9850.c
index 9ca6fc254883c..a6733396b0cad 100644
--- a/sound/soc/codecs/max9850.c
+++ b/sound/soc/codecs/max9850.c
@@ -296,7 +296,6 @@ static const struct snd_soc_component_driver soc_component_dev_max9850 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int max9850_i2c_probe(struct i2c_client *i2c)
diff --git a/sound/soc/codecs/max98520.c b/sound/soc/codecs/max98520.c
index f0f085ecab550..5edd6f90f8a7b 100644
--- a/sound/soc/codecs/max98520.c
+++ b/sound/soc/codecs/max98520.c
@@ -657,7 +657,6 @@ static const struct snd_soc_component_driver soc_codec_dev_max98520 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config max98520_regmap = {
diff --git a/sound/soc/codecs/max9860.c b/sound/soc/codecs/max9860.c
index a1d0179e12c76..771b3dcd6cc32 100644
--- a/sound/soc/codecs/max9860.c
+++ b/sound/soc/codecs/max9860.c
@@ -537,7 +537,6 @@ static const struct snd_soc_component_driver max9860_component_driver = {
 	.num_dapm_routes	= ARRAY_SIZE(max9860_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 #ifdef CONFIG_PM
diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index eb628b7e84f55..6d2941a9dbd6e 100644
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -589,7 +589,6 @@ static const struct snd_soc_component_driver max9867_component = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static bool max9867_volatile_register(struct device *dev, unsigned int reg)
diff --git a/sound/soc/codecs/max98925.c b/sound/soc/codecs/max98925.c
index 63849ebcfd354..c24d9f2c8874d 100644
--- a/sound/soc/codecs/max98925.c
+++ b/sound/soc/codecs/max98925.c
@@ -544,7 +544,6 @@ static const struct snd_soc_component_driver soc_component_dev_max98925 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config max98925_regmap = {
diff --git a/sound/soc/codecs/max98926.c b/sound/soc/codecs/max98926.c
index 56e0a87c7112f..bffd56e240e9a 100644
--- a/sound/soc/codecs/max98926.c
+++ b/sound/soc/codecs/max98926.c
@@ -496,7 +496,6 @@ static const struct snd_soc_component_driver soc_component_dev_max98926 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config max98926_regmap = {
diff --git a/sound/soc/codecs/max98927.c b/sound/soc/codecs/max98927.c
index b7cff76d7b5b9..9cce7c0f01424 100644
--- a/sound/soc/codecs/max98927.c
+++ b/sound/soc/codecs/max98927.c
@@ -832,7 +832,6 @@ static const struct snd_soc_component_driver soc_component_dev_max98927 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config max98927_regmap = {
-- 
2.30.2

