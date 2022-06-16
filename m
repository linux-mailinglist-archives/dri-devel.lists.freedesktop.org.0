Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5555454E6FD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 18:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CC6113FBC;
	Thu, 16 Jun 2022 16:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD4311A479
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:55:22 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC0DJe015765;
 Thu, 16 Jun 2022 09:34:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=ywxDxyPYvrEKuL+MgnDui0khdcCuhp+qKYexP3Zb2Og=;
 b=V3x6YxqB+qnMMAPs3Co5fjPda804QIKTfyFpTKz+t1I+tEUdjlYqpKfzjts6byM7XRks
 RVljc/yi1IQWPMk8qqcxDW1HCw64X8ZmX2n8HyQQP6U77U5mzIKVbmERTgiv+4kUiRnh
 HhW/HN8JCPKYAuoPy9kcmjBOGEtrZy1jNeqHEerNA49oSzD0SVdCZ3DdeVS817qvAFhI
 YICN9yBYM9EOTrUP55eWWNLIwXWrpScBaDp7/cvlLQwOFu4dyDPOKj6ffpCUKQMeFmKP
 jOI9dExRRuCWD/k54V95pPvlp/4HeO0yQDxQpdQdPgBqiii0qWyS3PHNcSl7Dp0rlQm3 mg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq5w3h-12
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:39 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:32 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6F79811DA;
 Thu, 16 Jun 2022 14:34:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 31/96] ASoC: ti: Migrate to new style legacy DAI naming flag
Date: Thu, 16 Jun 2022 15:33:24 +0100
Message-ID: <20220616143429.1324494-32-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: kGoXYMhDsKFWJHfjEh22Y1Gt_QnQ90zz
X-Proofpoint-GUID: kGoXYMhDsKFWJHfjEh22Y1Gt_QnQ90zz
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

Change the legacy DAI naming flag from opting in to the new scheme
(non_legacy_dai_naming), to opting out of it (legacy_dai_naming).
These drivers appear to be on the CPU side of the DAI link and
currently uses the legacy naming, so add the new flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/ti/davinci-i2s.c   | 3 ++-
 sound/soc/ti/davinci-mcasp.c | 3 ++-
 sound/soc/ti/davinci-vcif.c  | 3 ++-
 sound/soc/ti/omap-dmic.c     | 3 ++-
 sound/soc/ti/omap-hdmi.c     | 1 +
 sound/soc/ti/omap-mcbsp.c    | 3 ++-
 sound/soc/ti/omap-mcpdm.c    | 7 ++++---
 7 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index fe572b720b094..e6e77a5f3c1e7 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -640,7 +640,8 @@ static struct snd_soc_dai_driver davinci_i2s_dai = {
 };
 
 static const struct snd_soc_component_driver davinci_i2s_component = {
-	.name		= DRV_NAME,
+	.name			= DRV_NAME,
+	.legacy_dai_naming	= 1,
 };
 
 static int davinci_i2s_probe(struct platform_device *pdev)
diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index e2aab4729f3ab..45ffcc7aadc93 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -1765,7 +1765,8 @@ static struct snd_soc_dai_driver davinci_mcasp_dai[] = {
 };
 
 static const struct snd_soc_component_driver davinci_mcasp_component = {
-	.name		= "davinci-mcasp",
+	.name			= "davinci-mcasp",
+	.legacy_dai_naming	= 1,
 };
 
 /* Some HW specific values and defaults. The rest is filled in from DT. */
diff --git a/sound/soc/ti/davinci-vcif.c b/sound/soc/ti/davinci-vcif.c
index f810123cc4070..36fa97e2b9e22 100644
--- a/sound/soc/ti/davinci-vcif.c
+++ b/sound/soc/ti/davinci-vcif.c
@@ -185,7 +185,8 @@ static struct snd_soc_dai_driver davinci_vcif_dai = {
 };
 
 static const struct snd_soc_component_driver davinci_vcif_component = {
-	.name		= "davinci-vcif",
+	.name			= "davinci-vcif",
+	.legacy_dai_naming	= 1,
 };
 
 static int davinci_vcif_probe(struct platform_device *pdev)
diff --git a/sound/soc/ti/omap-dmic.c b/sound/soc/ti/omap-dmic.c
index f3eed20611a3f..825c70a443dad 100644
--- a/sound/soc/ti/omap-dmic.c
+++ b/sound/soc/ti/omap-dmic.c
@@ -453,7 +453,8 @@ static struct snd_soc_dai_driver omap_dmic_dai = {
 };
 
 static const struct snd_soc_component_driver omap_dmic_component = {
-	.name		= "omap-dmic",
+	.name			= "omap-dmic",
+	.legacy_dai_naming	= 1,
 };
 
 static int asoc_dmic_probe(struct platform_device *pdev)
diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index 3328c02f93c74..0dc0475670ffe 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -275,6 +275,7 @@ static const struct snd_soc_dai_ops hdmi_dai_ops = {
 
 static const struct snd_soc_component_driver omap_hdmi_component = {
 	.name = "omapdss_hdmi",
+	.legacy_dai_naming = 1,
 };
 
 static struct snd_soc_dai_driver omap5_hdmi_dai = {
diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 58d8e200a7b97..76df0e7844f8f 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -1317,7 +1317,8 @@ static struct snd_soc_dai_driver omap_mcbsp_dai = {
 };
 
 static const struct snd_soc_component_driver omap_mcbsp_component = {
-	.name		= "omap-mcbsp",
+	.name			= "omap-mcbsp",
+	.legacy_dai_naming	= 1,
 };
 
 static struct omap_mcbsp_platform_data omap2420_pdata = {
diff --git a/sound/soc/ti/omap-mcpdm.c b/sound/soc/ti/omap-mcpdm.c
index fafb2998ad0df..0b18a7bfd3fd7 100644
--- a/sound/soc/ti/omap-mcpdm.c
+++ b/sound/soc/ti/omap-mcpdm.c
@@ -524,9 +524,10 @@ static struct snd_soc_dai_driver omap_mcpdm_dai = {
 };
 
 static const struct snd_soc_component_driver omap_mcpdm_component = {
-	.name		= "omap-mcpdm",
-	.suspend	= omap_mcpdm_suspend,
-	.resume		= omap_mcpdm_resume,
+	.name			= "omap-mcpdm",
+	.suspend		= omap_mcpdm_suspend,
+	.resume			= omap_mcpdm_resume,
+	.legacy_dai_naming	= 1,
 };
 
 void omap_mcpdm_configure_dn_offsets(struct snd_soc_pcm_runtime *rtd,
-- 
2.30.2

