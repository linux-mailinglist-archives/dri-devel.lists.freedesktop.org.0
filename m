Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A86654E754
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 18:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BB611A5B2;
	Thu, 16 Jun 2022 16:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2550B10F991
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:59:43 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC0DJY015765;
 Thu, 16 Jun 2022 09:34:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Z4rUFJQC8NApp1mf+grKH2chieKDYOmZYhpQ8q1UBdg=;
 b=e1rFS6HGcELEataAYSB9YKaFyfKYXDbP5iFBJ4Jj3DtlrzcfIjj8PPGa53F6eZ/iQwzg
 Yn0ko3toaVGMTOfsyjMtgG/u4zY9FUVL7r0LTx3TZYYuqhrJTMF5QukQ9FE1y9sWW1GX
 3mN+u23i9gm68Z5olpxtS92+89DEIv9a5+yfNICp9X2XkBr65UCnAGGVApAdOKq0ruAu
 my1utuOozAGt/1o7lc9StElt9zCcyZkTzDNW5I2ITlV8AW233jq7HSbut1TBtHtlGafv
 rG0j2OiLAA86owsx6N2MIW6eQ8pSS571tBG+3NxO3xiOGf/HhyqtIb8dBs0Q/+vukZUr qQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq5w3h-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:34 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:30 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9F971478;
 Thu, 16 Jun 2022 14:34:30 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 09/96] ASoC: bcm: Migrate to new style legacy DAI naming flag
Date: Thu, 16 Jun 2022 15:33:02 +0100
Message-ID: <20220616143429.1324494-10-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 3zHa20P_xhcoVdD1hy7wKILCc4DBWNEb
X-Proofpoint-GUID: 3zHa20P_xhcoVdD1hy7wKILCc4DBWNEb
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

Change the legacy DAI naming flag from opting in to the new scheme
(non_legacy_dai_naming), to opting out of it (legacy_dai_naming).
These drivers appear to be on the CPU side of the DAI link and
currently uses the legacy naming, so add the new flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/bcm/bcm2835-i2s.c          | 3 ++-
 sound/soc/bcm/bcm63xx-i2s-whistler.c | 1 +
 sound/soc/bcm/cygnus-ssp.c           | 7 ++++---
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
index e39c8d9f40995..f4d84774dac72 100644
--- a/sound/soc/bcm/bcm2835-i2s.c
+++ b/sound/soc/bcm/bcm2835-i2s.c
@@ -821,7 +821,8 @@ static const struct regmap_config bcm2835_regmap_config = {
 };
 
 static const struct snd_soc_component_driver bcm2835_i2s_component = {
-	.name		= "bcm2835-i2s-comp",
+	.name			= "bcm2835-i2s-comp",
+	.legacy_dai_naming	= 1,
 };
 
 static int bcm2835_i2s_probe(struct platform_device *pdev)
diff --git a/sound/soc/bcm/bcm63xx-i2s-whistler.c b/sound/soc/bcm/bcm63xx-i2s-whistler.c
index 527caf430715b..2da1384ffe911 100644
--- a/sound/soc/bcm/bcm63xx-i2s-whistler.c
+++ b/sound/soc/bcm/bcm63xx-i2s-whistler.c
@@ -218,6 +218,7 @@ static struct snd_soc_dai_driver bcm63xx_i2s_dai = {
 
 static const struct snd_soc_component_driver bcm63xx_i2s_component = {
 	.name = "bcm63xx",
+	.legacy_dai_naming = 1,
 };
 
 static int bcm63xx_i2s_dev_probe(struct platform_device *pdev)
diff --git a/sound/soc/bcm/cygnus-ssp.c b/sound/soc/bcm/cygnus-ssp.c
index 4bfa2d715ff4d..8b7a215730707 100644
--- a/sound/soc/bcm/cygnus-ssp.c
+++ b/sound/soc/bcm/cygnus-ssp.c
@@ -1201,9 +1201,10 @@ static const struct snd_soc_dai_driver cygnus_spdif_dai_info = {
 static struct snd_soc_dai_driver cygnus_ssp_dai[CYGNUS_MAX_PORTS];
 
 static const struct snd_soc_component_driver cygnus_ssp_component = {
-	.name		= "cygnus-audio",
-	.suspend	= cygnus_ssp_suspend,
-	.resume		= cygnus_ssp_resume,
+	.name			= "cygnus-audio",
+	.suspend		= cygnus_ssp_suspend,
+	.resume			= cygnus_ssp_resume,
+	.legacy_dai_naming	= 1,
 };
 
 /*
-- 
2.30.2

