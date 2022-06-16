Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD9854E707
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 18:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB68A11A4A7;
	Thu, 16 Jun 2022 16:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA6B11A475
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:55:42 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC07CK027888;
 Thu, 16 Jun 2022 09:34:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=vz4pTGb6RSnyR0fnPsokrNw+ENVF1PSgVY/ErFIGaJk=;
 b=k9RWvVinNmtMe5Nb7NgXildwXPhXJUHuJBSkRA/KjsULbV3w0m3mR5UCBvczGvECdVjR
 kNgpda6Ex6j62ZKzMPndIGdwEBBzqPl3Z33txwLlHSEzkQH1IryDpHFNYfTPKg0pwJSt
 LrqOW3Lxze2FktmEJTrq/96TlaeBVgcatoRMrcBZdFKlq+53gbZsBDMN9GffVmBDNOAF
 1HyTU2S7wFULz5iM92kNKl7FEvvi/okQdfX7SBLRCohmsJZNBZ88wyqImPfjko//bZk9
 m1vfYGFcJHHcBnKEuTNPoTG44GVr5NSRlm464R/6nKXtRFkPVMzKiawpXVnXa/kCfRWJ MQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf35vuu-17
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
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3A14B11D3;
 Thu, 16 Jun 2022 14:34:34 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 54/96] ASoC: nau*: Remove now redundant non_legacy_dai_naming
 flag
Date: Thu, 16 Jun 2022 15:33:47 +0100
Message-ID: <20220616143429.1324494-55-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 3bfzhGq0CpGlzuP7AtLd48QqaW86OkC3
X-Proofpoint-ORIG-GUID: 3bfzhGq0CpGlzuP7AtLd48QqaW86OkC3
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
 sound/soc/codecs/nau8315.c | 1 -
 sound/soc/codecs/nau8540.c | 1 -
 sound/soc/codecs/nau8810.c | 1 -
 sound/soc/codecs/nau8821.c | 1 -
 sound/soc/codecs/nau8822.c | 1 -
 sound/soc/codecs/nau8824.c | 1 -
 sound/soc/codecs/nau8825.c | 1 -
 7 files changed, 7 deletions(-)

diff --git a/sound/soc/codecs/nau8315.c b/sound/soc/codecs/nau8315.c
index 2b66e3f7a8b7f..ad4dce9e50807 100644
--- a/sound/soc/codecs/nau8315.c
+++ b/sound/soc/codecs/nau8315.c
@@ -93,7 +93,6 @@ static const struct snd_soc_component_driver nau8315_component_driver = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_dai_ops nau8315_dai_ops = {
diff --git a/sound/soc/codecs/nau8540.c b/sound/soc/codecs/nau8540.c
index 347c715e22a4b..58f70a02f18aa 100644
--- a/sound/soc/codecs/nau8540.c
+++ b/sound/soc/codecs/nau8540.c
@@ -806,7 +806,6 @@ static const struct snd_soc_component_driver nau8540_component_driver = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config nau8540_regmap_config = {
diff --git a/sound/soc/codecs/nau8810.c b/sound/soc/codecs/nau8810.c
index 7b3b1e4ac2465..ccb512c21d748 100644
--- a/sound/soc/codecs/nau8810.c
+++ b/sound/soc/codecs/nau8810.c
@@ -866,7 +866,6 @@ static const struct snd_soc_component_driver nau8810_component_driver = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int nau8810_i2c_probe(struct i2c_client *i2c)
diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index ce4e7f46bb067..6453e93678d22 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -1430,7 +1430,6 @@ static const struct snd_soc_component_driver nau8821_component_driver = {
 	.dapm_routes		= nau8821_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(nau8821_dapm_routes),
 	.suspend_bias_off	= 1,
-	.non_legacy_dai_naming	= 1,
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
index 3907d1dd8ceef..1aef281a99727 100644
--- a/sound/soc/codecs/nau8822.c
+++ b/sound/soc/codecs/nau8822.c
@@ -1083,7 +1083,6 @@ static const struct snd_soc_component_driver soc_component_dev_nau8822 = {
 	.idle_bias_on			= 1,
 	.use_pmdown_time		= 1,
 	.endianness			= 1,
-	.non_legacy_dai_naming		= 1,
 };
 
 static const struct regmap_config nau8822_regmap_config = {
diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index 2a7c935085353..ad54d70f7d8e7 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -1544,7 +1544,6 @@ static const struct snd_soc_component_driver nau8824_component_driver = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_dai_ops nau8824_dai_ops = {
diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index 20e45a337b8f2..907ec88c759a8 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -2478,7 +2478,6 @@ static const struct snd_soc_component_driver nau8825_component_driver = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static void nau8825_reset_chip(struct regmap *regmap)
-- 
2.30.2

