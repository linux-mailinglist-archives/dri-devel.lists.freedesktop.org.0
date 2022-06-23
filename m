Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A28375592DD
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 08:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7765F112247;
	Fri, 24 Jun 2022 06:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C043310EE18
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 12:53:22 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NAKUt9006859;
 Thu, 23 Jun 2022 07:53:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=ed4emzUJTohq/e8wpqVyWmmKyLgimfFl0YhHiaRz77c=;
 b=OOiJGmG85L484CfcVnS3FexGssS82qr/6OzuHB+u4DnIR+yr5LBJPWrZid6Y97RkMMLk
 HW362I/IrKo20aNL1CzMVL0r16KcIUHHIEuAVeHQgNPdN3gSMhqxSksf16eRVmA5J1w8
 nfTE7yVo9hsJhlwd/XRIsSpMEHAq7jcms26rtTOQ633lBKlSZv9wGzjfAwLAhAHQto/w
 fztnUzMKfWIMDHG4qZyh3fgzUUScuSi9+FNiV43P7IhneD2JsYz/ZlOHzCUvX04aCwYB
 FHZivDvf2fRqQZg1Q56oVApolaEfpiuei+T/jjZsLe+/WDDQaJDM9eCEmmGXUfBC1DCD EQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41fa4u-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jun 2022 07:53:06 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:56 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 23 Jun 2022 13:52:56 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 50ECE11D1;
 Thu, 23 Jun 2022 12:52:56 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 63/96] ASoC: twl*: Remove now redundant
 non_legacy_dai_naming flag
Date: Thu, 23 Jun 2022 13:52:17 +0100
Message-ID: <20220623125250.2355471-64-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 9u5ASWETBhCYKbud3W7eaHnWhTYCWAHQ
X-Proofpoint-ORIG-GUID: 9u5ASWETBhCYKbud3W7eaHnWhTYCWAHQ
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
 sound/soc/codecs/twl4030.c | 1 -
 sound/soc/codecs/twl6040.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
index 87b58017094b2..e48768233e208 100644
--- a/sound/soc/codecs/twl4030.c
+++ b/sound/soc/codecs/twl4030.c
@@ -2195,7 +2195,6 @@ static const struct snd_soc_component_driver soc_component_dev_twl4030 = {
 	.num_dapm_routes	= ARRAY_SIZE(intercon),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int twl4030_codec_probe(struct platform_device *pdev)
diff --git a/sound/soc/codecs/twl6040.c b/sound/soc/codecs/twl6040.c
index b37203336c4e0..dd5ee5dc0cd75 100644
--- a/sound/soc/codecs/twl6040.c
+++ b/sound/soc/codecs/twl6040.c
@@ -1153,7 +1153,6 @@ static const struct snd_soc_component_driver soc_component_dev_twl6040 = {
 	.suspend_bias_off	= 1,
 	.idle_bias_on		= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int twl6040_codec_probe(struct platform_device *pdev)
-- 
2.30.2

