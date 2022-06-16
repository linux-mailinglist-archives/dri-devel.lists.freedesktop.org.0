Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7812054E74B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 18:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B1D11A5C4;
	Thu, 16 Jun 2022 16:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB2D11A449
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:57:35 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC0DJX015765;
 Thu, 16 Jun 2022 09:34:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=NITDP0/FzeUs4judT0jNQp5cBIgyRfB6xBGDNoV8sco=;
 b=ClzRE7fBiz+GWthoVNTPsY6Fx7c1X8cRUAIgzZ/qS9WG1RR6BXUoQY5FA7DIngYuUoiJ
 UvkNB3gdBMNIHksHNt3Phkpfr9SzcHgu4ysbvMxlRGGU+cbkgeT1b4dZl7HeyVIu2HPC
 TorThIqOBQiSLb9VC0I7Z3tZtk+FO0fIGPDUS/tyD2jhLcRCU/mtH/6ukYWVuq4DI+s6
 C8ADRe0WLljJiNOfEOeO2j+guVW5X/20k8sq81CpH+oTaqmNgT1vU1JzpfiJ/CdAm/uA
 svK8DaIsOfCaIagQ7D2Cv8B5aGSbGxCn8Sl/OSnvV25h6mVJFQOqo7s73LELeZpRWEEB Uw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq5w3h-5
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
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 692FC11D1;
 Thu, 16 Jun 2022 14:34:30 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 06/96] ASoC: jz4740-i2c: Migrate to new style legacy DAI
 naming flag
Date: Thu, 16 Jun 2022 15:32:59 +0100
Message-ID: <20220616143429.1324494-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: iSA6Egfg7F-z7JxBynJ2xhU-srF922i2
X-Proofpoint-GUID: iSA6Egfg7F-z7JxBynJ2xhU-srF922i2
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
This driver appears to be on the CPU side of the DAI link and
currently uses the legacy naming, so add the new flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 446c5e0615649..79afac0c50038 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -498,9 +498,10 @@ static const struct i2s_soc_info jz4780_i2s_soc_info = {
 };
 
 static const struct snd_soc_component_driver jz4740_i2s_component = {
-	.name		= "jz4740-i2s",
-	.suspend	= jz4740_i2s_suspend,
-	.resume		= jz4740_i2s_resume,
+	.name			= "jz4740-i2s",
+	.suspend		= jz4740_i2s_suspend,
+	.resume			= jz4740_i2s_resume,
+	.legacy_dai_naming	= 1,
 };
 
 static const struct of_device_id jz4740_of_matches[] = {
-- 
2.30.2

