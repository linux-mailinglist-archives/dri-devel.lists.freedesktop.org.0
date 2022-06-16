Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6F954E714
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 18:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FF111A4AE;
	Thu, 16 Jun 2022 16:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E65811A449
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:55:35 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GBnCaI029573;
 Thu, 16 Jun 2022 09:34:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=mIa1mkeEkrDJt0gyT2HtnOxCb8TL4rQN20e++H56G2c=;
 b=WF++K2livlbXpnkZLU36xjroMdLavKv47c7KhXYxHJ4WSkyR4VqtHiV2Eul68RXkLdI9
 /8iLqZPBRVmFElqqX8dkPma0XjdzDfFVTSWhwxfvghoaanoULYURQ221tIhmMTA04P+c
 6ODQfViNSnC67OdV7BaUPZEJNbAyCLgiREWik52KQG/SuBpWuUCiabIGCnu/Jixy9gTM
 Nh4q9k60goUMaVqzHn+HzIvjcChdzkM6Ha9EKD9QwIa8YPYIOpIwaLBn6kpF0wWRVVHA
 jm0eWBzaawskt5ekD9OPUlnlqrKLffkRs4m63XFWJeAtSe9tBvOTu4G6fu56rO67l6C1 Qw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq5w3m-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:40 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:32 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 053C511D3;
 Thu, 16 Jun 2022 14:34:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 26/96] ASoC: rockchip: Migrate to new style legacy DAI naming
 flag
Date: Thu, 16 Jun 2022 15:33:19 +0100
Message-ID: <20220616143429.1324494-27-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: IpsGq9FoaXt-9eT2DdnEMXdnzL34HmIT
X-Proofpoint-GUID: IpsGq9FoaXt-9eT2DdnEMXdnzL34HmIT
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
 sound/soc/rockchip/rockchip_i2s.c     | 1 +
 sound/soc/rockchip/rockchip_i2s_tdm.c | 1 +
 sound/soc/rockchip/rockchip_pdm.c     | 1 +
 sound/soc/rockchip/rockchip_spdif.c   | 1 +
 4 files changed, 4 insertions(+)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 47a3971a9ce14..2eb1a9bf4c00b 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -498,6 +498,7 @@ static struct snd_soc_dai_driver rockchip_i2s_dai = {
 
 static const struct snd_soc_component_driver rockchip_i2s_component = {
 	.name = DRV_NAME,
+	.legacy_dai_naming = 1,
 };
 
 static bool rockchip_i2s_wr_reg(struct device *dev, unsigned int reg)
diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 48b3ecfa58b46..2aad0f309cb63 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -1120,6 +1120,7 @@ static const struct snd_soc_dai_ops rockchip_i2s_tdm_dai_ops = {
 
 static const struct snd_soc_component_driver rockchip_i2s_tdm_component = {
 	.name = DRV_NAME,
+	.legacy_dai_naming = 1,
 };
 
 static bool rockchip_i2s_tdm_wr_reg(struct device *dev, unsigned int reg)
diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index 64d9891b6434f..6d93155411b03 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -405,6 +405,7 @@ static struct snd_soc_dai_driver rockchip_pdm_dai = {
 
 static const struct snd_soc_component_driver rockchip_pdm_component = {
 	.name = "rockchip-pdm",
+	.legacy_dai_naming = 1,
 };
 
 static int rockchip_pdm_runtime_suspend(struct device *dev)
diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index d027ca4b17964..8bef572d3cbc1 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -225,6 +225,7 @@ static struct snd_soc_dai_driver rk_spdif_dai = {
 
 static const struct snd_soc_component_driver rk_spdif_component = {
 	.name = "rockchip-spdif",
+	.legacy_dai_naming = 1,
 };
 
 static bool rk_spdif_wr_reg(struct device *dev, unsigned int reg)
-- 
2.30.2

