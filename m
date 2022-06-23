Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BBB5592A0
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 08:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E80C112188;
	Fri, 24 Jun 2022 06:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504D110E5DC
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 12:53:19 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NBvlrF011978;
 Thu, 23 Jun 2022 07:52:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Tu/WQm2FL2SPUViv8WWXoQaXIl+eGAzL/AaxkzkbEBw=;
 b=DD+38VDD0o80wNycNX/vhRKVKJA6TzKywq+dC3EJJwBenl1JxktiKxEEwhTKguR9nIWh
 HdcraE9lA1qlJ40izR1a49m4D03vynq4lVjLODVU4CnUD/MJPZMB356lj3GlBtro46vp
 hvZZ0rCahrviixOwAdCfB4iryPy63ikwN02T7/ovXhYVhtiCdKKs9dde7afMQXPSEzz6
 hZLEGdnAcLvoqZtomT5R+b8EZEoO7AZslnBatBlQ8k7Khg0bpfuAjcB7y/VI4CXaqviL
 TF1PgSULAaqGiXVZX8xntwdv1wL/M86ERDdJS/bBV43oCYCU4wH1aXAGXAdaARSq3nXM uw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gsb4p6wvp-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jun 2022 07:52:59 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:53 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 23 Jun 2022 13:52:53 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E658411D3;
 Thu, 23 Jun 2022 12:52:52 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 24/96] ASoC: qcom: Migrate to new style legacy DAI naming
 flag
Date: Thu, 23 Jun 2022 13:51:38 +0100
Message-ID: <20220623125250.2355471-25-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: wVbUk9EDGXJ-wibpUtyKNMaQLq8KcH0w
X-Proofpoint-ORIG-GUID: wVbUk9EDGXJ-wibpUtyKNMaQLq8KcH0w
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
 sound/soc/qcom/lpass-cpu.c       |  1 +
 sound/soc/qcom/qdsp6/q6asm-dai.c | 23 ++++++++++++-----------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index e6846ad2b5fa4..6f1cd38000016 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -472,6 +472,7 @@ static int asoc_qcom_of_xlate_dai_name(struct snd_soc_component *component,
 static const struct snd_soc_component_driver lpass_cpu_comp_driver = {
 	.name = "lpass-cpu",
 	.of_xlate_dai_name = asoc_qcom_of_xlate_dai_name,
+	.legacy_dai_naming = 1,
 };
 
 static bool lpass_cpu_regmap_writeable(struct device *dev, unsigned int reg)
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index b74b67720ef43..5fc8088e63c81 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -1205,17 +1205,18 @@ static const struct snd_soc_dapm_widget q6asm_dapm_widgets[] = {
 };
 
 static const struct snd_soc_component_driver q6asm_fe_dai_component = {
-	.name		= DRV_NAME,
-	.open		= q6asm_dai_open,
-	.hw_params	= q6asm_dai_hw_params,
-	.close		= q6asm_dai_close,
-	.prepare	= q6asm_dai_prepare,
-	.trigger	= q6asm_dai_trigger,
-	.pointer	= q6asm_dai_pointer,
-	.pcm_construct	= q6asm_dai_pcm_new,
-	.compress_ops	= &q6asm_dai_compress_ops,
-	.dapm_widgets	= q6asm_dapm_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(q6asm_dapm_widgets),
+	.name			= DRV_NAME,
+	.open			= q6asm_dai_open,
+	.hw_params		= q6asm_dai_hw_params,
+	.close			= q6asm_dai_close,
+	.prepare		= q6asm_dai_prepare,
+	.trigger		= q6asm_dai_trigger,
+	.pointer		= q6asm_dai_pointer,
+	.pcm_construct		= q6asm_dai_pcm_new,
+	.compress_ops		= &q6asm_dai_compress_ops,
+	.dapm_widgets		= q6asm_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(q6asm_dapm_widgets),
+	.legacy_dai_naming	= 1,
 };
 
 static struct snd_soc_dai_driver q6asm_fe_dais_template[] = {
-- 
2.30.2

