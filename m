Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D85E54E704
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 18:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7848311A4A0;
	Thu, 16 Jun 2022 16:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2C811A484
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:55:56 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC07C9027888;
 Thu, 16 Jun 2022 09:34:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=8CQSKjmzsDlZ0wmGn5pCtMbuJN3c/eN6aYD6PAfwFwE=;
 b=SHgtCg4oeqAkoaOR++2dDwvRLTuDTz8UIaKOa7WN8w7cBZostOUJNnruFpEhYdjaic1k
 +7iOA34gBti/GPMCE5NnzcqZ+mGh9OmTFS0wIEmBFDjbN38LMS00Vzj+DNA0KIGpYmAM
 UKAbye1BmrNIvXn8l46G+1U3V+fML2A3eF0Gd21QDiRls9m8fO59DhGbMhgBpJ4Zrv73
 xcwFtc/T2bpP1KcckHUX5egskR/T7o5D9dUkru1ZUfEKbaYN5cGghRG+2Msny/4DJEAd
 UeUOB83yF5ZJMs0hNA3JPqY9GKZ/OcaSDIrMzhmYL7Olh1AKSRxrCJf0shzrgDPldh0A Dw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf35vuu-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:36 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:31 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EBC7611D3;
 Thu, 16 Jun 2022 14:34:30 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 13/96] ASoC: xilinx: Migrate to new style legacy DAI naming
 flag
Date: Thu, 16 Jun 2022 15:33:06 +0100
Message-ID: <20220616143429.1324494-14-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: wzCxxBJRMOWUMt5liZTazDE8EHvkfRl4
X-Proofpoint-ORIG-GUID: wzCxxBJRMOWUMt5liZTazDE8EHvkfRl4
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
 sound/soc/xilinx/xlnx_formatter_pcm.c | 16 ++++++++--------
 sound/soc/xilinx/xlnx_i2s.c           |  1 +
 sound/soc/xilinx/xlnx_spdif.c         |  1 +
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 5c4158069a5a8..f5ac0aa312d6e 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -575,14 +575,14 @@ static int xlnx_formatter_pcm_new(struct snd_soc_component *component,
 }
 
 static const struct snd_soc_component_driver xlnx_asoc_component = {
-	.name		= DRV_NAME,
-	.set_sysclk	= xlnx_formatter_set_sysclk,
-	.open		= xlnx_formatter_pcm_open,
-	.close		= xlnx_formatter_pcm_close,
-	.hw_params	= xlnx_formatter_pcm_hw_params,
-	.trigger	= xlnx_formatter_pcm_trigger,
-	.pointer	= xlnx_formatter_pcm_pointer,
-	.pcm_construct	= xlnx_formatter_pcm_new,
+	.name			= DRV_NAME,
+	.set_sysclk		= xlnx_formatter_set_sysclk,
+	.open			= xlnx_formatter_pcm_open,
+	.close			= xlnx_formatter_pcm_close,
+	.hw_params		= xlnx_formatter_pcm_hw_params,
+	.trigger		= xlnx_formatter_pcm_trigger,
+	.pointer		= xlnx_formatter_pcm_pointer,
+	.pcm_construct		= xlnx_formatter_pcm_new,
 };
 
 static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
diff --git a/sound/soc/xilinx/xlnx_i2s.c b/sound/soc/xilinx/xlnx_i2s.c
index 4cc6ee7c81a32..9de92d35e30ee 100644
--- a/sound/soc/xilinx/xlnx_i2s.c
+++ b/sound/soc/xilinx/xlnx_i2s.c
@@ -158,6 +158,7 @@ static const struct snd_soc_dai_ops xlnx_i2s_dai_ops = {
 
 static const struct snd_soc_component_driver xlnx_i2s_component = {
 	.name = DRV_NAME,
+	.legacy_dai_naming = 1,
 };
 
 static const struct of_device_id xlnx_i2s_of_match[] = {
diff --git a/sound/soc/xilinx/xlnx_spdif.c b/sound/soc/xilinx/xlnx_spdif.c
index cba0e868a7d77..7342048e98751 100644
--- a/sound/soc/xilinx/xlnx_spdif.c
+++ b/sound/soc/xilinx/xlnx_spdif.c
@@ -226,6 +226,7 @@ static struct snd_soc_dai_driver xlnx_spdif_rx_dai = {
 
 static const struct snd_soc_component_driver xlnx_spdif_component = {
 	.name = "xlnx-spdif",
+	.legacy_dai_naming = 1,
 };
 
 static const struct of_device_id xlnx_spdif_of_match[] = {
-- 
2.30.2

