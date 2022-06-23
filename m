Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB655592C8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 08:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E943F1121A8;
	Fri, 24 Jun 2022 06:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9824010E5F8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 12:53:20 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NAKUt8006859;
 Thu, 23 Jun 2022 07:53:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=2oOH0ajpjX51SxIUnf5QoeLn4u7Pp4JTnUSfyoYuy5c=;
 b=Yj3HxcQ5Nq5ttDCOuIp+XU/qOxpTKhDa4zZiD4WMR7xISVGlCB1hmBVuGJ0BkM3BZTpN
 y/U5WSLz+8E1M9oFO3oZPqaGyj63x4nwB6pNpRCeWWUgLqZKG904cJcvclX7XknHzBQ6
 410fbLz0gxVAv6/VeMcssQH3pwxJ2aDOgJfgXpSr6CJ63/rx6F9tw1UHMBGVj3m2UY/v
 vPlTt71PvwMVS2yGisURtucfUOoGQYxhXsK9wtU3Cg62+N1JiZc8+cYIRhUWFPic4S3Q
 8O4zh/A5/8Ml0yQQHB3jHBHy2vzZDtOfUw8DeM39+gqstUgvG2vgTNrebSDnRw3GxQOu kA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41fa4u-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jun 2022 07:53:05 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:55 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 23 Jun 2022 13:52:55 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3A00611D4;
 Thu, 23 Jun 2022 12:52:55 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 50/96] ASoC: da*: Remove now redundant
 non_legacy_dai_naming flag
Date: Thu, 23 Jun 2022 13:52:04 +0100
Message-ID: <20220623125250.2355471-51-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: sRpSKbzDDkWksB9kvIVycJdJBNHREjM2
X-Proofpoint-ORIG-GUID: sRpSKbzDDkWksB9kvIVycJdJBNHREjM2
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
 sound/soc/codecs/da7210.c | 1 -
 sound/soc/codecs/da7213.c | 1 -
 sound/soc/codecs/da7218.c | 1 -
 sound/soc/codecs/da7219.c | 1 -
 sound/soc/codecs/da732x.c | 1 -
 sound/soc/codecs/da9055.c | 1 -
 6 files changed, 6 deletions(-)

diff --git a/sound/soc/codecs/da7210.c b/sound/soc/codecs/da7210.c
index 76a21976ccddb..f838466bfebf8 100644
--- a/sound/soc/codecs/da7210.c
+++ b/sound/soc/codecs/da7210.c
@@ -1173,7 +1173,6 @@ static const struct snd_soc_component_driver soc_component_dev_da7210 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 #if IS_ENABLED(CONFIG_I2C)
diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 2e645dc60eda4..544ccbcfc8844 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -1922,7 +1922,6 @@ static const struct snd_soc_component_driver soc_component_dev_da7213 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config da7213_regmap_config = {
diff --git a/sound/soc/codecs/da7218.c b/sound/soc/codecs/da7218.c
index a5d7c350a3ded..91372909d184b 100644
--- a/sound/soc/codecs/da7218.c
+++ b/sound/soc/codecs/da7218.c
@@ -3040,7 +3040,6 @@ static const struct snd_soc_component_driver soc_component_dev_da7218 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 
diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index c18f76f370fc4..50ecf30e6136a 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -2647,7 +2647,6 @@ static const struct snd_soc_component_driver soc_component_dev_da7219 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 
diff --git a/sound/soc/codecs/da732x.c b/sound/soc/codecs/da732x.c
index 3f1cfee10df3f..2c5b0b74201c7 100644
--- a/sound/soc/codecs/da732x.c
+++ b/sound/soc/codecs/da732x.c
@@ -1503,7 +1503,6 @@ static const struct snd_soc_component_driver soc_component_dev_da732x = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int da732x_i2c_probe(struct i2c_client *i2c)
diff --git a/sound/soc/codecs/da9055.c b/sound/soc/codecs/da9055.c
index 9d8c8adc5d768..28043b4530df8 100644
--- a/sound/soc/codecs/da9055.c
+++ b/sound/soc/codecs/da9055.c
@@ -1460,7 +1460,6 @@ static const struct snd_soc_component_driver soc_component_dev_da9055 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config da9055_regmap_config = {
-- 
2.30.2

