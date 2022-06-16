Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BDF54E6FA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 18:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F168911A38A;
	Thu, 16 Jun 2022 16:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C6511A449
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:55:30 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GBnCaP029573;
 Thu, 16 Jun 2022 09:34:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=cQdXkHjIfdABxICRyXLMQvZ7JRraXFv/PnLRBa0ESzw=;
 b=Jl2nooIzsiWYjdNBlpBkF2/ly/ePJsyAwFU9AKiP3Pt6axdOD8QXvBZ2sClgOox81O3z
 hBBj8uX1txWJNr/LizNRfc6YYIdmTeIwvOxm0ZFelhP0aCoOowvXtOJYyu0kL8TSq+Hu
 wv+CMAg5BKIS2nI5Rc4YekvFlH+Sii21EduXNjYyiV1s03+qjGhiiGEkbX7S/HM2uN0e
 S2Z8b62tGM1a6EImkUlAKzcdcRjwUYKMLkrGY6w4Lb9pU2qAprFk/P78QJRq88DbwI6U
 CR/JlMudGFu+dnWTUy4soslWDrvs9Xn7JssdYKpgQYhhd40K62ktH6eiR57UqxlOxjwP YA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq5w3m-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:46 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:34 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:34 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4FEAB11DA;
 Thu, 16 Jun 2022 14:34:34 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 55/96] ASoC: pcm*: Remove now redundant non_legacy_dai_naming
 flag
Date: Thu, 16 Jun 2022 15:33:48 +0100
Message-ID: <20220616143429.1324494-56-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: oK2INGdRnu1-Pm_VYVfbsvlywSJrYsH_
X-Proofpoint-GUID: oK2INGdRnu1-Pm_VYVfbsvlywSJrYsH_
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
 sound/soc/codecs/pcm1681.c  | 1 -
 sound/soc/codecs/pcm1789.c  | 1 -
 sound/soc/codecs/pcm179x.c  | 1 -
 sound/soc/codecs/pcm186x.c  | 2 --
 sound/soc/codecs/pcm3008.c  | 1 -
 sound/soc/codecs/pcm3168a.c | 1 -
 sound/soc/codecs/pcm5102a.c | 1 -
 sound/soc/codecs/pcm512x.c  | 1 -
 8 files changed, 9 deletions(-)

diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
index 20eb04c8a41a0..3591f6f53901f 100644
--- a/sound/soc/codecs/pcm1681.c
+++ b/sound/soc/codecs/pcm1681.c
@@ -290,7 +290,6 @@ static const struct snd_soc_component_driver soc_component_dev_pcm1681 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct i2c_device_id pcm1681_i2c_id[] = {
diff --git a/sound/soc/codecs/pcm1789.c b/sound/soc/codecs/pcm1789.c
index 35788b57e11f9..3ab381e9a8566 100644
--- a/sound/soc/codecs/pcm1789.c
+++ b/sound/soc/codecs/pcm1789.c
@@ -229,7 +229,6 @@ static const struct snd_soc_component_driver soc_component_dev_pcm1789 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 int pcm1789_common_init(struct device *dev, struct regmap *regmap)
diff --git a/sound/soc/codecs/pcm179x.c b/sound/soc/codecs/pcm179x.c
index ee60373d7d254..f52ff66b6e644 100644
--- a/sound/soc/codecs/pcm179x.c
+++ b/sound/soc/codecs/pcm179x.c
@@ -207,7 +207,6 @@ static const struct snd_soc_component_driver soc_component_dev_pcm179x = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 int pcm179x_common_init(struct device *dev, struct regmap *regmap)
diff --git a/sound/soc/codecs/pcm186x.c b/sound/soc/codecs/pcm186x.c
index fda9d7ee3fe6b..dd21803ba13cb 100644
--- a/sound/soc/codecs/pcm186x.c
+++ b/sound/soc/codecs/pcm186x.c
@@ -578,7 +578,6 @@ static struct snd_soc_component_driver soc_codec_dev_pcm1863 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static struct snd_soc_component_driver soc_codec_dev_pcm1865 = {
@@ -593,7 +592,6 @@ static struct snd_soc_component_driver soc_codec_dev_pcm1865 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static bool pcm186x_volatile(struct device *dev, unsigned int reg)
diff --git a/sound/soc/codecs/pcm3008.c b/sound/soc/codecs/pcm3008.c
index aef40ec40aa16..09c6c1326833d 100644
--- a/sound/soc/codecs/pcm3008.c
+++ b/sound/soc/codecs/pcm3008.c
@@ -102,7 +102,6 @@ static const struct snd_soc_component_driver soc_component_dev_pcm3008 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int pcm3008_codec_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index cf27f05dc46ab..9d6431338fb71 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -716,7 +716,6 @@ static const struct snd_soc_component_driver pcm3168a_driver = {
 	.num_dapm_routes	= ARRAY_SIZE(pcm3168a_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 int pcm3168a_probe(struct device *dev, struct regmap *regmap)
diff --git a/sound/soc/codecs/pcm5102a.c b/sound/soc/codecs/pcm5102a.c
index f39f98bbc97fd..3401a25341e61 100644
--- a/sound/soc/codecs/pcm5102a.c
+++ b/sound/soc/codecs/pcm5102a.c
@@ -28,7 +28,6 @@ static struct snd_soc_component_driver soc_component_dev_pcm5102a = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int pcm5102a_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index a3ff4a07aff72..767463e82665c 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -1512,7 +1512,6 @@ static const struct snd_soc_component_driver pcm512x_component_driver = {
 	.num_dapm_routes	= ARRAY_SIZE(pcm512x_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_range_cfg pcm512x_range = {
-- 
2.30.2

