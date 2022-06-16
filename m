Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDB554E713
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 18:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B58511A4D8;
	Thu, 16 Jun 2022 16:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF86A11A449
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:56:02 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25G4igBi030693;
 Thu, 16 Jun 2022 09:34:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=FjIUzY5vic3Zh5VYRT9K5OX6UftqESCVghQUpCGyoBo=;
 b=EUWs6xMzzdsaVhXWSypyBqim7Tk88Wq/hlZ7i0EHh1AbfSllzhp2RoH0QtnOVtaJ2Llt
 CmyIH9+GpFCVY2/OPy8He9D1A3EfL0Xk2zGRiJ04o646JP2NOA26z2pUMeC9311xJZps
 SsYbUiJafits/a78FXmfVs7YgYG2vAkDkuvIF0qfc13POETWom8UXqaOqEm8TyhcMpeG
 Gu0852s+zZUKfY3E/3cLr2V34oeOXcP2/9yJTFT3pE6Gd45PKOwcXCeO2FPKa+pbgAY1
 rHaAzJ6nFJf8gNIpQB0puf3V6gCRZWIfsJJxBIBe7OvodAsxxCvAAY8b06ioct+fKNt2 NQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf35vuw-13
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:47 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:34 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:34 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A1BDB11DB;
 Thu, 16 Jun 2022 14:34:34 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 60/96] ASoC: tas*: Remove now redundant non_legacy_dai_naming
 flag
Date: Thu, 16 Jun 2022 15:33:53 +0100
Message-ID: <20220616143429.1324494-61-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: xqRX8bURvElcWNIpqBUhtBxZZbZVp8Uk
X-Proofpoint-ORIG-GUID: xqRX8bURvElcWNIpqBUhtBxZZbZVp8Uk
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
 sound/soc/codecs/tas2552.c  | 1 -
 sound/soc/codecs/tas2562.c  | 2 --
 sound/soc/codecs/tas2764.c  | 1 -
 sound/soc/codecs/tas2770.c  | 1 -
 sound/soc/codecs/tas5086.c  | 1 -
 sound/soc/codecs/tas571x.c  | 1 -
 sound/soc/codecs/tas5720.c  | 2 --
 sound/soc/codecs/tas5805m.c | 1 -
 sound/soc/codecs/tas6424.c  | 1 -
 9 files changed, 11 deletions(-)

diff --git a/sound/soc/codecs/tas2552.c b/sound/soc/codecs/tas2552.c
index c98a9332dcc0e..bf3d8539a2688 100644
--- a/sound/soc/codecs/tas2552.c
+++ b/sound/soc/codecs/tas2552.c
@@ -668,7 +668,6 @@ static const struct snd_soc_component_driver soc_component_dev_tas2552 = {
 	.num_dapm_routes	= ARRAY_SIZE(tas2552_audio_map),
 	.idle_bias_on		= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config tas2552_regmap_config = {
diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index e62a3da16aed3..dc088a1c67213 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -589,7 +589,6 @@ static const struct snd_soc_component_driver soc_component_dev_tas2110 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_dapm_widget tas2562_dapm_widgets[] = {
@@ -629,7 +628,6 @@ static const struct snd_soc_component_driver soc_component_dev_tas2562 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_dai_ops tas2562_speaker_dai_ops = {
diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index d395feffb30b5..42f0c1e449ba4 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -548,7 +548,6 @@ static const struct snd_soc_component_driver soc_component_driver_tas2764 = {
 	.num_dapm_routes	= ARRAY_SIZE(tas2764_audio_map),
 	.idle_bias_on		= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct reg_default tas2764_reg_defaults[] = {
diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index f6037a148cb60..3cb634c282610 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -546,7 +546,6 @@ static const struct snd_soc_component_driver soc_component_driver_tas2770 = {
 	.num_dapm_routes	= ARRAY_SIZE(tas2770_audio_map),
 	.idle_bias_on		= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int tas2770_register_codec(struct tas2770_priv *tas2770)
diff --git a/sound/soc/codecs/tas5086.c b/sound/soc/codecs/tas5086.c
index 05b57bb1aea04..a864984225bc4 100644
--- a/sound/soc/codecs/tas5086.c
+++ b/sound/soc/codecs/tas5086.c
@@ -888,7 +888,6 @@ static const struct snd_soc_component_driver soc_component_dev_tas5086 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct i2c_device_id tas5086_i2c_id[] = {
diff --git a/sound/soc/codecs/tas571x.c b/sound/soc/codecs/tas571x.c
index 7b599664db205..4e7f20db57c4d 100644
--- a/sound/soc/codecs/tas571x.c
+++ b/sound/soc/codecs/tas571x.c
@@ -756,7 +756,6 @@ static const struct snd_soc_component_driver tas571x_component = {
 	.num_dapm_routes	= ARRAY_SIZE(tas571x_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static struct snd_soc_dai_driver tas571x_dai = {
diff --git a/sound/soc/codecs/tas5720.c b/sound/soc/codecs/tas5720.c
index 2ee06a95f3e4f..3885c0bf0b01c 100644
--- a/sound/soc/codecs/tas5720.c
+++ b/sound/soc/codecs/tas5720.c
@@ -572,7 +572,6 @@ static const struct snd_soc_component_driver soc_component_dev_tas5720 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_component_driver soc_component_dev_tas5722 = {
@@ -589,7 +588,6 @@ static const struct snd_soc_component_driver soc_component_dev_tas5722 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 /* PCM rates supported by the TAS5720 driver */
diff --git a/sound/soc/codecs/tas5805m.c b/sound/soc/codecs/tas5805m.c
index fa0e81ec875ad..b1bb614534f74 100644
--- a/sound/soc/codecs/tas5805m.c
+++ b/sound/soc/codecs/tas5805m.c
@@ -367,7 +367,6 @@ static const struct snd_soc_component_driver soc_codec_dev_tas5805m = {
 	.num_dapm_routes	= ARRAY_SIZE(tas5805m_audio_map),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int tas5805m_mute(struct snd_soc_dai *dai, int mute, int direction)
diff --git a/sound/soc/codecs/tas6424.c b/sound/soc/codecs/tas6424.c
index 9c9a6ec4d9779..63d2983c3fcf4 100644
--- a/sound/soc/codecs/tas6424.c
+++ b/sound/soc/codecs/tas6424.c
@@ -375,7 +375,6 @@ static struct snd_soc_component_driver soc_codec_dev_tas6424 = {
 	.num_dapm_routes	= ARRAY_SIZE(tas6424_audio_map),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_dai_ops tas6424_speaker_dai_ops = {
-- 
2.30.2

