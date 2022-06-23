Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CEA5592D2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 08:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A21811236E;
	Fri, 24 Jun 2022 06:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAA510FC8D
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 12:53:24 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NBNlqg015665;
 Thu, 23 Jun 2022 07:53:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=NdWNqGk7KYNCnb6vF06SM0HZUNiwmzGy7/npWlCANTY=;
 b=pl9GZ0sm4izeOpQNlz1JULcTPTAF8z8IksyRkNGDBos6hUEv38UxIz3WaS2uwspoNo47
 ZfOxyKCYduHCyLqEYRfcWfOs6k/P7mOdn4vc/5P7Yaoc/R2vE0x7lV7Be/BIsdR9lrz9
 BX4eJOfc17ShLxE1DluYe4mSxomVwJgTJlaJZAzEPfAloyKWyMO/wk0+Mk1v111PzUIJ
 RyBhnCy3ndtaCR6TGiTO8FxBFW8r7H8/9Rm/cYdEKA+JU+60glrwZ+mb/AkJogZdMmoO
 voHl0eP1NeD5EBRSNjOMJkyHQDejWPxJ3QSicvN07rqRn4kP5BfV1m6uDdhRf6bWSS25 OQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41fa4j-13
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jun 2022 07:53:03 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:53 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 23 Jun 2022 13:52:53 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B8B4E11D3;
 Thu, 23 Jun 2022 12:52:53 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 33/96] ASoC: samsung: Migrate to new style legacy DAI
 naming flag
Date: Thu, 23 Jun 2022 13:51:47 +0100
Message-ID: <20220623125250.2355471-34-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: v0oFCxrSCxmZrVeXEmSq3Ws8-owDeSPN
X-Proofpoint-ORIG-GUID: v0oFCxrSCxmZrVeXEmSq3Ws8-owDeSPN
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

Change the legacy DAI naming flag from opting in to the new scheme
(non_legacy_dai_naming), to opting out of it (legacy_dai_naming).
These drivers appear to be on the CPU side of the DAI link and
currently uses the legacy naming, so add the new flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/samsung/i2s.c         | 2 ++
 sound/soc/samsung/pcm.c         | 3 ++-
 sound/soc/samsung/s3c2412-i2s.c | 7 ++++---
 sound/soc/samsung/s3c24xx-i2s.c | 7 ++++---
 sound/soc/samsung/spdif.c       | 7 ++++---
 5 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index fdd9561c6a9f3..9505200f3d11b 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1143,6 +1143,8 @@ static const struct snd_soc_component_driver samsung_i2s_component = {
 
 	.suspend = i2s_suspend,
 	.resume = i2s_resume,
+
+	.legacy_dai_naming = 1,
 };
 
 #define SAMSUNG_I2S_FMTS (SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_S16_LE | \
diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index c2eb3534bfccb..e859252ae5e6e 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -480,7 +480,8 @@ static struct snd_soc_dai_driver s3c_pcm_dai[] = {
 };
 
 static const struct snd_soc_component_driver s3c_pcm_component = {
-	.name		= "s3c-pcm",
+	.name			= "s3c-pcm",
+	.legacy_dai_naming	= 1,
 };
 
 static int s3c_pcm_dev_probe(struct platform_device *pdev)
diff --git a/sound/soc/samsung/s3c2412-i2s.c b/sound/soc/samsung/s3c2412-i2s.c
index ec1c6f9d76ac7..0579a352961cc 100644
--- a/sound/soc/samsung/s3c2412-i2s.c
+++ b/sound/soc/samsung/s3c2412-i2s.c
@@ -192,9 +192,10 @@ static struct snd_soc_dai_driver s3c2412_i2s_dai = {
 };
 
 static const struct snd_soc_component_driver s3c2412_i2s_component = {
-	.name		= "s3c2412-i2s",
-	.suspend	= s3c2412_i2s_suspend,
-	.resume		= s3c2412_i2s_resume,
+	.name			= "s3c2412-i2s",
+	.suspend		= s3c2412_i2s_suspend,
+	.resume			= s3c2412_i2s_resume,
+	.legacy_dai_naming	= 1,
 };
 
 static int s3c2412_iis_dev_probe(struct platform_device *pdev)
diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index 4082ad7cbcc11..e760fc8b42636 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -415,9 +415,10 @@ static struct snd_soc_dai_driver s3c24xx_i2s_dai = {
 };
 
 static const struct snd_soc_component_driver s3c24xx_i2s_component = {
-	.name		= "s3c24xx-i2s",
-	.suspend	= s3c24xx_i2s_suspend,
-	.resume		= s3c24xx_i2s_resume,
+	.name			= "s3c24xx-i2s",
+	.suspend		= s3c24xx_i2s_suspend,
+	.resume			= s3c24xx_i2s_resume,
+	.legacy_dai_naming	= 1,
 };
 
 static int s3c24xx_iis_dev_probe(struct platform_device *pdev)
diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index 47b6d19e43ffb..7d815e237e5c6 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -352,9 +352,10 @@ static struct snd_soc_dai_driver samsung_spdif_dai = {
 };
 
 static const struct snd_soc_component_driver samsung_spdif_component = {
-	.name		= "samsung-spdif",
-	.suspend	= spdif_suspend,
-	.resume		= spdif_resume,
+	.name			= "samsung-spdif",
+	.suspend		= spdif_suspend,
+	.resume			= spdif_resume,
+	.legacy_dai_naming	= 1,
 };
 
 static int spdif_probe(struct platform_device *pdev)
-- 
2.30.2

