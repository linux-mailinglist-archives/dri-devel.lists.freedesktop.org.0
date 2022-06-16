Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 101FF54E72B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 18:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8AC11A583;
	Thu, 16 Jun 2022 16:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985BA11A449
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:57:39 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC0DJj015765;
 Thu, 16 Jun 2022 09:34:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=5bK/QZrLcWERzY3e0jhFerdtweK8ZENCCoi3qpxDZlU=;
 b=DqWgHFFFcSbpAIgcXWDSdK+OAwAsXKMDAnsEmv8NW1JBE316YSKrIgKmWyaOt2oLv+My
 bijYJihcaWoZXRWTQrrUZcn9gKUQMf63rn3XbgVUTI5ATCPL/LKsG5mjrteenHiHifYe
 NBJ8V3BAgkGATmqrZBmslYbzUOGu8xTqa52Qn3q8CR4s8y5LOIOfwhsaUJVLBs1dniUJ
 hQHxDIL5AFuSTmuQ0jOxXvODrgiHMFYSSZv1RGzEBn12LY7fumfjbZneOdbJlcL9Y0Zh
 a3cyQgnkgCM7Go1YI2rGVqGELc5UQCaFdbNXQZLexu9klUa/s8rQUjkESBDxh6ROP2dp Yg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq5w3h-17
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
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D332611D3;
 Thu, 16 Jun 2022 14:34:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 49/96] ASoC: cs*: Remove now redundant non_legacy_dai_naming
 flag
Date: Thu, 16 Jun 2022 15:33:42 +0100
Message-ID: <20220616143429.1324494-50-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 6iAX7z_NLpWDekTwN8-lhaT-bdXw-z8J
X-Proofpoint-GUID: 6iAX7z_NLpWDekTwN8-lhaT-bdXw-z8J
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
 sound/soc/codecs/cs35l32.c | 1 -
 sound/soc/codecs/cs35l33.c | 1 -
 sound/soc/codecs/cs35l34.c | 1 -
 sound/soc/codecs/cs35l35.c | 1 -
 sound/soc/codecs/cs35l36.c | 1 -
 sound/soc/codecs/cs4234.c  | 1 -
 sound/soc/codecs/cs4265.c  | 1 -
 sound/soc/codecs/cs4270.c  | 1 -
 sound/soc/codecs/cs4271.c  | 1 -
 sound/soc/codecs/cs42l42.c | 1 -
 sound/soc/codecs/cs42l51.c | 1 -
 sound/soc/codecs/cs42l52.c | 1 -
 sound/soc/codecs/cs42l56.c | 1 -
 sound/soc/codecs/cs42l73.c | 1 -
 sound/soc/codecs/cs42xx8.c | 1 -
 sound/soc/codecs/cs43130.c | 1 -
 sound/soc/codecs/cs4341.c  | 1 -
 sound/soc/codecs/cs4349.c  | 1 -
 sound/soc/codecs/cs47l15.c | 1 -
 sound/soc/codecs/cs47l24.c | 1 -
 sound/soc/codecs/cs47l35.c | 1 -
 sound/soc/codecs/cs47l85.c | 1 -
 sound/soc/codecs/cs47l90.c | 1 -
 sound/soc/codecs/cs47l92.c | 1 -
 sound/soc/codecs/cs53l30.c | 1 -
 25 files changed, 25 deletions(-)

diff --git a/sound/soc/codecs/cs35l32.c b/sound/soc/codecs/cs35l32.c
index badfc55bc5fa0..8ff6f66be86fa 100644
--- a/sound/soc/codecs/cs35l32.c
+++ b/sound/soc/codecs/cs35l32.c
@@ -236,7 +236,6 @@ static const struct snd_soc_component_driver soc_component_dev_cs35l32 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 /* Current and threshold powerup sequence Pg37 in datasheet */
diff --git a/sound/soc/codecs/cs35l33.c b/sound/soc/codecs/cs35l33.c
index 47dc0f6d90a2a..082025fa0370c 100644
--- a/sound/soc/codecs/cs35l33.c
+++ b/sound/soc/codecs/cs35l33.c
@@ -840,7 +840,6 @@ static const struct snd_soc_component_driver soc_component_dev_cs35l33 = {
 	.num_dapm_routes	= ARRAY_SIZE(cs35l33_audio_map),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config cs35l33_regmap = {
diff --git a/sound/soc/codecs/cs35l34.c b/sound/soc/codecs/cs35l34.c
index 50d509a060713..472ac982779be 100644
--- a/sound/soc/codecs/cs35l34.c
+++ b/sound/soc/codecs/cs35l34.c
@@ -787,7 +787,6 @@ static const struct snd_soc_component_driver soc_component_dev_cs35l34 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static struct regmap_config cs35l34_regmap = {
diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index 6b70afb70a674..714a759dca21b 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -1087,7 +1087,6 @@ static const struct snd_soc_component_driver soc_component_dev_cs35l35 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static struct regmap_config cs35l35_regmap = {
diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index dfe85dc2cd20f..4dc13e6f4874c 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -1300,7 +1300,6 @@ static const struct snd_soc_component_driver soc_component_dev_cs35l36 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static struct regmap_config cs35l36_regmap = {
diff --git a/sound/soc/codecs/cs4234.c b/sound/soc/codecs/cs4234.c
index 881c5ba70c0ed..b49a3cf21ebe2 100644
--- a/sound/soc/codecs/cs4234.c
+++ b/sound/soc/codecs/cs4234.c
@@ -660,7 +660,6 @@ static const struct snd_soc_component_driver soc_component_cs4234 = {
 	.controls		= cs4234_snd_controls,
 	.num_controls		= ARRAY_SIZE(cs4234_snd_controls),
 	.set_bias_level		= cs4234_set_bias_level,
-	.non_legacy_dai_naming	= 1,
 	.idle_bias_on		= 1,
 	.suspend_bias_off	= 1,
 	.endianness		= 1,
diff --git a/sound/soc/codecs/cs4265.c b/sound/soc/codecs/cs4265.c
index 86bfa8d5ec787..76c19802d5fe1 100644
--- a/sound/soc/codecs/cs4265.c
+++ b/sound/soc/codecs/cs4265.c
@@ -553,7 +553,6 @@ static const struct snd_soc_component_driver soc_component_cs4265 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config cs4265_regmap = {
diff --git a/sound/soc/codecs/cs4270.c b/sound/soc/codecs/cs4270.c
index 531f63b015547..ab0624662f117 100644
--- a/sound/soc/codecs/cs4270.c
+++ b/sound/soc/codecs/cs4270.c
@@ -619,7 +619,6 @@ static const struct snd_soc_component_driver soc_component_device_cs4270 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 /*
diff --git a/sound/soc/codecs/cs4271.c b/sound/soc/codecs/cs4271.c
index 7663f89ac6a24..2021cf4426061 100644
--- a/sound/soc/codecs/cs4271.c
+++ b/sound/soc/codecs/cs4271.c
@@ -642,7 +642,6 @@ static const struct snd_soc_component_driver soc_component_dev_cs4271 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int cs4271_common_probe(struct device *dev,
diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 6ca74c0d46eaa..d545a593a2516 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -581,7 +581,6 @@ static const struct snd_soc_component_driver soc_component_dev_cs42l42 = {
 	.num_controls		= ARRAY_SIZE(cs42l42_snd_controls),
 	.idle_bias_on		= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 /* Switch to SCLK. Atomic delay after the write to allow the switch to complete. */
diff --git a/sound/soc/codecs/cs42l51.c b/sound/soc/codecs/cs42l51.c
index 0e933181b5dbb..51721edd8f53c 100644
--- a/sound/soc/codecs/cs42l51.c
+++ b/sound/soc/codecs/cs42l51.c
@@ -600,7 +600,6 @@ static const struct snd_soc_component_driver soc_component_device_cs42l51 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static bool cs42l51_writeable_reg(struct device *dev, unsigned int reg)
diff --git a/sound/soc/codecs/cs42l52.c b/sound/soc/codecs/cs42l52.c
index 10e696406a71b..90bf535fc5a52 100644
--- a/sound/soc/codecs/cs42l52.c
+++ b/sound/soc/codecs/cs42l52.c
@@ -1061,7 +1061,6 @@ static const struct snd_soc_component_driver soc_component_dev_cs42l52 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 /* Current and threshold powerup sequence Pg37 */
diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index 510c94265b1f0..03e2540a0ba12 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -1114,7 +1114,6 @@ static const struct snd_soc_component_driver soc_component_dev_cs42l56 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config cs42l56_regmap = {
diff --git a/sound/soc/codecs/cs42l73.c b/sound/soc/codecs/cs42l73.c
index 5a9166289f366..0a146319755a6 100644
--- a/sound/soc/codecs/cs42l73.c
+++ b/sound/soc/codecs/cs42l73.c
@@ -1256,7 +1256,6 @@ static const struct snd_soc_component_driver soc_component_dev_cs42l73 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config cs42l73_regmap = {
diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
index 5d6ef660f851f..d14eb2f6e1dd4 100644
--- a/sound/soc/codecs/cs42xx8.c
+++ b/sound/soc/codecs/cs42xx8.c
@@ -497,7 +497,6 @@ static const struct snd_soc_component_driver cs42xx8_driver = {
 	.num_dapm_routes	= ARRAY_SIZE(cs42xx8_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 const struct cs42xx8_driver_data cs42448_data = {
diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index a2bce0f9f247b..ca4d47cc9c915 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -2345,7 +2345,6 @@ static struct snd_soc_component_driver soc_component_dev_cs43130 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config cs43130_regmap = {
diff --git a/sound/soc/codecs/cs4341.c b/sound/soc/codecs/cs4341.c
index 8ac043f1aae01..ac1696034846d 100644
--- a/sound/soc/codecs/cs4341.c
+++ b/sound/soc/codecs/cs4341.c
@@ -202,7 +202,6 @@ static const struct snd_soc_component_driver soc_component_cs4341 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct of_device_id __maybe_unused cs4341_dt_ids[] = {
diff --git a/sound/soc/codecs/cs4349.c b/sound/soc/codecs/cs4349.c
index 7069e9b548576..f7c5c2fd43046 100644
--- a/sound/soc/codecs/cs4349.c
+++ b/sound/soc/codecs/cs4349.c
@@ -260,7 +260,6 @@ static const struct snd_soc_component_driver soc_component_dev_cs4349 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config cs4349_regmap = {
diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index 391fd7da331fd..0193173b86376 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -1353,7 +1353,6 @@ static const struct snd_soc_component_driver soc_component_dev_cs47l15 = {
 	.num_dapm_routes	= ARRAY_SIZE(cs47l15_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int cs47l15_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/cs47l24.c b/sound/soc/codecs/cs47l24.c
index 6356f81aafc56..f9a2b865d7176 100644
--- a/sound/soc/codecs/cs47l24.c
+++ b/sound/soc/codecs/cs47l24.c
@@ -1203,7 +1203,6 @@ static const struct snd_soc_component_driver soc_component_dev_cs47l24 = {
 	.num_dapm_routes	= ARRAY_SIZE(cs47l24_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int cs47l24_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/cs47l35.c b/sound/soc/codecs/cs47l35.c
index db2f844b8b17f..c1032d6c9143f 100644
--- a/sound/soc/codecs/cs47l35.c
+++ b/sound/soc/codecs/cs47l35.c
@@ -1638,7 +1638,6 @@ static const struct snd_soc_component_driver soc_component_dev_cs47l35 = {
 	.num_dapm_routes	= ARRAY_SIZE(cs47l35_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int cs47l35_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index d4fedc5ad516e..215d8211aa59b 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -2582,7 +2582,6 @@ static const struct snd_soc_component_driver soc_component_dev_cs47l85 = {
 	.num_dapm_routes	= ARRAY_SIZE(cs47l85_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int cs47l85_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index 5aec937a24629..1ad6526c78717 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -2497,7 +2497,6 @@ static const struct snd_soc_component_driver soc_component_dev_cs47l90 = {
 	.num_dapm_routes	= ARRAY_SIZE(cs47l90_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int cs47l90_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index a1b8dcdb9f7b7..59da34b480a87 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -1958,7 +1958,6 @@ static const struct snd_soc_component_driver soc_component_dev_cs47l92 = {
 	.num_dapm_routes	= ARRAY_SIZE(cs47l92_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int cs47l92_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/cs53l30.c b/sound/soc/codecs/cs53l30.c
index 360ca2ffd5069..8796d8e84b7a2 100644
--- a/sound/soc/codecs/cs53l30.c
+++ b/sound/soc/codecs/cs53l30.c
@@ -899,7 +899,6 @@ static const struct snd_soc_component_driver cs53l30_driver = {
 	.num_dapm_routes	= ARRAY_SIZE(cs53l30_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static struct regmap_config cs53l30_regmap = {
-- 
2.30.2

