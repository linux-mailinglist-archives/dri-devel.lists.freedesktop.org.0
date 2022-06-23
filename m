Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9125592FF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 08:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A822F112615;
	Fri, 24 Jun 2022 06:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A46F10FA26
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 12:53:24 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NAKUt6006859;
 Thu, 23 Jun 2022 07:53:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=dUxxZ4yDTMkaufibeeycQHK/CLz3N70DLkPSTZOUSSI=;
 b=MIRx9pjtG5TdiUU3IET63IKViso5x909aYgg7DCr+swfpiGDCavhcBywAJLbbe6OYr07
 9wyfuvS173BKrtnH4c0KH6o1XjBa+oCgjdpHaLkHMJ3r6A8Ll1liBC+Q7L5ijY8lnZz5
 STev8PU0TlIAZOxxrVEASwzuUKaw9IGWhIufutbqQBuWzrXRmWIGQfZRiCd0TYIsXnKV
 lqyGkTVFdKfWjPaknA4eAcubfb9qK9W7yzwkn5G3e9KGgDWoUVZStxQL544bntqNOPdX
 pK4ohFJTHueVqGtCZRYeq2Ra6dYhsbqaUmZYi8gnVWNKRotcRYp52YwxBP/sLnpMTunb Xw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41fa4u-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jun 2022 07:53:04 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:55 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 23 Jun 2022 13:52:55 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EB54011D3;
 Thu, 23 Jun 2022 12:52:54 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 47/96] ASoC: ak*: Remove now redundant
 non_legacy_dai_naming flag
Date: Thu, 23 Jun 2022 13:52:01 +0100
Message-ID: <20220623125250.2355471-48-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: yhocI9fY_9yTWOFp6cJEZ5XQk0yCQbo3
X-Proofpoint-ORIG-GUID: yhocI9fY_9yTWOFp6cJEZ5XQk0yCQbo3
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Fri, 24 Jun 2022 06:01:35 +0000
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
 frattaroli.nicolas@gmail.com, linux-rockchip@lists.infradead.org,
 linux-imx@nxp.com, linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
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
 sound/soc/codecs/ak4104.c | 1 -
 sound/soc/codecs/ak4118.c | 1 -
 sound/soc/codecs/ak4375.c | 1 -
 sound/soc/codecs/ak4458.c | 2 --
 sound/soc/codecs/ak4535.c | 1 -
 sound/soc/codecs/ak4554.c | 1 -
 sound/soc/codecs/ak4613.c | 1 -
 sound/soc/codecs/ak4641.c | 1 -
 sound/soc/codecs/ak4642.c | 1 -
 sound/soc/codecs/ak4671.c | 1 -
 sound/soc/codecs/ak5386.c | 1 -
 sound/soc/codecs/ak5558.c | 2 --
 12 files changed, 14 deletions(-)

diff --git a/sound/soc/codecs/ak4104.c b/sound/soc/codecs/ak4104.c
index dc4747c77a7a1..ce99f30b4613a 100644
--- a/sound/soc/codecs/ak4104.c
+++ b/sound/soc/codecs/ak4104.c
@@ -248,7 +248,6 @@ static const struct snd_soc_component_driver soc_component_device_ak4104 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config ak4104_regmap = {
diff --git a/sound/soc/codecs/ak4118.c b/sound/soc/codecs/ak4118.c
index 5c4a78c16733b..b6d9a10bdccdc 100644
--- a/sound/soc/codecs/ak4118.c
+++ b/sound/soc/codecs/ak4118.c
@@ -342,7 +342,6 @@ static const struct snd_soc_component_driver soc_component_drv_ak4118 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config ak4118_regmap = {
diff --git a/sound/soc/codecs/ak4375.c b/sound/soc/codecs/ak4375.c
index 9a7b662016b9e..1ed004ba7cd23 100644
--- a/sound/soc/codecs/ak4375.c
+++ b/sound/soc/codecs/ak4375.c
@@ -473,7 +473,6 @@ static const struct snd_soc_component_driver soc_codec_dev_ak4375 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config ak4375_regmap = {
diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index baa9ff5d0ce50..ea33cc83c86c2 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -725,7 +725,6 @@ static const struct snd_soc_component_driver soc_codec_dev_ak4458 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_component_driver soc_codec_dev_ak4497 = {
@@ -740,7 +739,6 @@ static const struct snd_soc_component_driver soc_codec_dev_ak4497 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config ak4458_regmap = {
diff --git a/sound/soc/codecs/ak4535.c b/sound/soc/codecs/ak4535.c
index cc803e730c6ec..8c8c93eea7048 100644
--- a/sound/soc/codecs/ak4535.c
+++ b/sound/soc/codecs/ak4535.c
@@ -402,7 +402,6 @@ static const struct snd_soc_component_driver soc_component_dev_ak4535 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int ak4535_i2c_probe(struct i2c_client *i2c)
diff --git a/sound/soc/codecs/ak4554.c b/sound/soc/codecs/ak4554.c
index 8e60e2b56ad6d..b9607de5a1912 100644
--- a/sound/soc/codecs/ak4554.c
+++ b/sound/soc/codecs/ak4554.c
@@ -67,7 +67,6 @@ static const struct snd_soc_component_driver soc_component_dev_ak4554 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int ak4554_soc_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index d29d5e0db168e..f75c19ef35511 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -827,7 +827,6 @@ static const struct snd_soc_component_driver soc_component_dev_ak4613 = {
 	.num_dapm_routes	= ARRAY_SIZE(ak4613_intercon),
 	.idle_bias_on		= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static void ak4613_parse_of(struct ak4613_priv *priv,
diff --git a/sound/soc/codecs/ak4641.c b/sound/soc/codecs/ak4641.c
index d8d9cc712d679..88851e94b0452 100644
--- a/sound/soc/codecs/ak4641.c
+++ b/sound/soc/codecs/ak4641.c
@@ -535,7 +535,6 @@ static const struct snd_soc_component_driver soc_component_dev_ak4641 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config ak4641_regmap = {
diff --git a/sound/soc/codecs/ak4642.c b/sound/soc/codecs/ak4642.c
index 3c20ff5595eb4..914d5b1969f8c 100644
--- a/sound/soc/codecs/ak4642.c
+++ b/sound/soc/codecs/ak4642.c
@@ -559,7 +559,6 @@ static const struct snd_soc_component_driver soc_component_dev_ak4642 = {
 	.num_dapm_routes	= ARRAY_SIZE(ak4642_intercon),
 	.idle_bias_on		= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config ak4642_regmap = {
diff --git a/sound/soc/codecs/ak4671.c b/sound/soc/codecs/ak4671.c
index 60edcbe560141..cd76765f8cc08 100644
--- a/sound/soc/codecs/ak4671.c
+++ b/sound/soc/codecs/ak4671.c
@@ -616,7 +616,6 @@ static const struct snd_soc_component_driver soc_component_dev_ak4671 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config ak4671_regmap = {
diff --git a/sound/soc/codecs/ak5386.c b/sound/soc/codecs/ak5386.c
index c76bfff246028..0c5e00679c7d8 100644
--- a/sound/soc/codecs/ak5386.c
+++ b/sound/soc/codecs/ak5386.c
@@ -77,7 +77,6 @@ static const struct snd_soc_component_driver soc_component_ak5386 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int ak5386_set_dai_fmt(struct snd_soc_dai *codec_dai,
diff --git a/sound/soc/codecs/ak5558.c b/sound/soc/codecs/ak5558.c
index c94cfde3e4a86..887d2c04d647a 100644
--- a/sound/soc/codecs/ak5558.c
+++ b/sound/soc/codecs/ak5558.c
@@ -393,7 +393,6 @@ static const struct snd_soc_component_driver soc_codec_dev_ak5558 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_component_driver soc_codec_dev_ak5552 = {
@@ -408,7 +407,6 @@ static const struct snd_soc_component_driver soc_codec_dev_ak5552 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config ak5558_regmap = {
-- 
2.30.2

