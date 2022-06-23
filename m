Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D02559296
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 08:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720D811215A;
	Fri, 24 Jun 2022 06:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5D510F672
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 12:53:24 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NBNlqc015665;
 Thu, 23 Jun 2022 07:52:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=ZbauxbsNGm9xAny7IOFo1jE6ACKMKJr4mljuYL9lUZI=;
 b=MPOwFXqDN8U9oWJdwNA8OUN36n09Lwt7sCkNUOXrxAZEsn1kLXd8EWGvHR94XHJRWJ2+
 wUTXVn2epUkeGplkeA8tOMY58rJssAY04gDxp8tIIBnEZ0gtnYWSQmmux7y8Gva5IZ9P
 gWra0YGJHEyl19vGXXuUhQOHzy64bH3dFQR4O0BoKGeQAQms4QuWsLkmBEbOHukSalEB
 Iq12/pnW7/zGJW2PHEe7nlC8N5LTf6V3pU6ZAH3hUQdAV2XMqma/PmAAK9Xol5PoMGOr
 rneYRbpms0AQtiA5y9nhpjGYlLQ2uWpioPh8vdcy+oQ7F+S/dzyXizGpuxu7cvayMOCR SA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41fa4j-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jun 2022 07:52:59 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:52 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 23 Jun 2022 13:52:52 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 52A0711D3;
 Thu, 23 Jun 2022 12:52:52 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 18/96] ASoC: amd: Migrate to new style legacy DAI naming
 flag
Date: Thu, 23 Jun 2022 13:51:32 +0100
Message-ID: <20220623125250.2355471-19-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: IA-ECFlg29Sq85BFJIbLgooa5MDsQMWw
X-Proofpoint-ORIG-GUID: IA-ECFlg29Sq85BFJIbLgooa5MDsQMWw
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
 sound/soc/amd/acp/acp-platform.c     | 15 ++++++++-------
 sound/soc/amd/raven/acp3x-i2s.c      |  3 ++-
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 13 +++++++------
 sound/soc/amd/vangogh/acp5x-i2s.c    |  1 +
 sound/soc/amd/yc/acp6x-pdm-dma.c     | 13 +++++++------
 5 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 65a809e2c29ff..3c4fd8b805891 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -267,13 +267,14 @@ static int acp_dma_close(struct snd_soc_component *component,
 }
 
 static const struct snd_soc_component_driver acp_pcm_component = {
-	.name		= DRV_NAME,
-	.open		= acp_dma_open,
-	.close		= acp_dma_close,
-	.hw_params	= acp_dma_hw_params,
-	.pointer	= acp_dma_pointer,
-	.mmap		= acp_dma_mmap,
-	.pcm_construct	= acp_dma_new,
+	.name			= DRV_NAME,
+	.open			= acp_dma_open,
+	.close			= acp_dma_close,
+	.hw_params		= acp_dma_hw_params,
+	.pointer		= acp_dma_pointer,
+	.mmap			= acp_dma_mmap,
+	.pcm_construct		= acp_dma_new,
+	.legacy_dai_naming	= 1,
 };
 
 int acp_platform_register(struct device *dev)
diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index de6f70d7ef364..aa38cef1776da 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -257,7 +257,8 @@ static const struct snd_soc_dai_ops acp3x_i2s_dai_ops = {
 };
 
 static const struct snd_soc_component_driver acp3x_dai_component = {
-	.name           = DRV_NAME,
+	.name			= DRV_NAME,
+	.legacy_dai_naming	= 1,
 };
 
 static struct snd_soc_dai_driver acp3x_i2s_dai = {
diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index 8c42345ee41e9..7203c6488df0e 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -363,12 +363,13 @@ static struct snd_soc_dai_driver acp_pdm_dai_driver = {
 };
 
 static const struct snd_soc_component_driver acp_pdm_component = {
-	.name		= DRV_NAME,
-	.open		= acp_pdm_dma_open,
-	.close		= acp_pdm_dma_close,
-	.hw_params	= acp_pdm_dma_hw_params,
-	.pointer	= acp_pdm_dma_pointer,
-	.pcm_construct	= acp_pdm_dma_new,
+	.name			= DRV_NAME,
+	.open			= acp_pdm_dma_open,
+	.close			= acp_pdm_dma_close,
+	.hw_params		= acp_pdm_dma_hw_params,
+	.pointer		= acp_pdm_dma_pointer,
+	.pcm_construct		= acp_pdm_dma_new,
+	.legacy_dai_naming	= 1,
 };
 
 static int acp_pdm_audio_probe(struct platform_device *pdev)
diff --git a/sound/soc/amd/vangogh/acp5x-i2s.c b/sound/soc/amd/vangogh/acp5x-i2s.c
index 72c8c68e59336..773e96f1b4dd6 100644
--- a/sound/soc/amd/vangogh/acp5x-i2s.c
+++ b/sound/soc/amd/vangogh/acp5x-i2s.c
@@ -345,6 +345,7 @@ static const struct snd_soc_dai_ops acp5x_i2s_dai_ops = {
 
 static const struct snd_soc_component_driver acp5x_dai_component = {
 	.name = "acp5x-i2s",
+	.legacy_dai_naming = 1,
 };
 
 static struct snd_soc_dai_driver acp5x_i2s_dai = {
diff --git a/sound/soc/amd/yc/acp6x-pdm-dma.c b/sound/soc/amd/yc/acp6x-pdm-dma.c
index 7e66393e41535..acecd6a4ec4b1 100644
--- a/sound/soc/amd/yc/acp6x-pdm-dma.c
+++ b/sound/soc/amd/yc/acp6x-pdm-dma.c
@@ -335,12 +335,13 @@ static struct snd_soc_dai_driver acp6x_pdm_dai_driver = {
 };
 
 static const struct snd_soc_component_driver acp6x_pdm_component = {
-	.name		= DRV_NAME,
-	.open		= acp6x_pdm_dma_open,
-	.close		= acp6x_pdm_dma_close,
-	.hw_params	= acp6x_pdm_dma_hw_params,
-	.pointer	= acp6x_pdm_dma_pointer,
-	.pcm_construct	= acp6x_pdm_dma_new,
+	.name			= DRV_NAME,
+	.open			= acp6x_pdm_dma_open,
+	.close			= acp6x_pdm_dma_close,
+	.hw_params		= acp6x_pdm_dma_hw_params,
+	.pointer		= acp6x_pdm_dma_pointer,
+	.pcm_construct		= acp6x_pdm_dma_new,
+	.legacy_dai_naming	= 1,
 };
 
 static int acp6x_pdm_audio_probe(struct platform_device *pdev)
-- 
2.30.2

