Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 240F45592BC
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 08:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C40D112201;
	Fri, 24 Jun 2022 06:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3ADD10E3FB
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 12:54:16 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25N5mxl2032604;
 Thu, 23 Jun 2022 07:52:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=2TN13SaBviXFLG5SogVSnAtaPuCmUdh8Cf5QqA62gzA=;
 b=EOTlOnH8pctgJTry5VCna9k3q3MRmr/xXoM4xAxgv2lpwAj0GRqpu1sgv8an3p76nPGH
 mInGBCUVEi9k4uCS4i8oFHI19rG6LJnHRmw+KNNMSlgEJGmcn1nZ0SWTxDv8p6IUfB4I
 TRwXQmjHKo0K/1x1SYKJelmlrty4ifrNTTJ5O/JEeYjux9KxOO8ZSP1gqayGRlnEjGb0
 +HxLT3fO6H0Ximlt+ggLmdImRkEQN5gpntfeocijtL1MwPU5Yukq1SrykhT5KOkIkBZ9
 5aQr5UKMfHn+e9xI069MAnMSnJtALJnXy7gDwcoEjrbNqfJRzJ/bIyyN9T9mdZiWSulw IA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gsb4p6wvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jun 2022 07:52:57 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:51 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 23 Jun 2022 13:52:51 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A0B1A478;
 Thu, 23 Jun 2022 12:52:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 11/96] ASoC: tegra: Migrate to new style legacy DAI naming
 flag
Date: Thu, 23 Jun 2022 13:51:25 +0100
Message-ID: <20220623125250.2355471-12-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: l3ItothFqpLn9VhF4Abg4vb-bkIOqzIE
X-Proofpoint-ORIG-GUID: l3ItothFqpLn9VhF4Abg4vb-bkIOqzIE
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
 sound/soc/tegra/tegra20_ac97.c  | 3 ++-
 sound/soc/tegra/tegra20_i2s.c   | 3 ++-
 sound/soc/tegra/tegra20_spdif.c | 1 +
 sound/soc/tegra/tegra30_i2s.c   | 3 ++-
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index c454a34c15c4c..e17375c6cddb9 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -239,7 +239,8 @@ static struct snd_soc_dai_driver tegra20_ac97_dai = {
 };
 
 static const struct snd_soc_component_driver tegra20_ac97_component = {
-	.name		= DRV_NAME,
+	.name			= DRV_NAME,
+	.legacy_dai_naming	= 1,
 };
 
 static bool tegra20_ac97_wr_rd_reg(struct device *dev, unsigned int reg)
diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index 2e1a726602f02..fff0cd6588f56 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -338,7 +338,8 @@ static const struct snd_soc_dai_driver tegra20_i2s_dai_template = {
 };
 
 static const struct snd_soc_component_driver tegra20_i2s_component = {
-	.name		= DRV_NAME,
+	.name			= DRV_NAME,
+	.legacy_dai_naming	= 1,
 };
 
 static bool tegra20_i2s_wr_rd_reg(struct device *dev, unsigned int reg)
diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 64c2f304f2542..ca7b222e07d05 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -264,6 +264,7 @@ static struct snd_soc_dai_driver tegra20_spdif_dai = {
 
 static const struct snd_soc_component_driver tegra20_spdif_component = {
 	.name = "tegra20-spdif",
+	.legacy_dai_naming = 1,
 };
 
 static bool tegra20_spdif_wr_rd_reg(struct device *dev, unsigned int reg)
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 3aa157c82ae23..10cd37096fb33 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -331,7 +331,8 @@ static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {
 };
 
 static const struct snd_soc_component_driver tegra30_i2s_component = {
-	.name		= DRV_NAME,
+	.name			= DRV_NAME,
+	.legacy_dai_naming	= 1,
 };
 
 static bool tegra30_i2s_wr_rd_reg(struct device *dev, unsigned int reg)
-- 
2.30.2

