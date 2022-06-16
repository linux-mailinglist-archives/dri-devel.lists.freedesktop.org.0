Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3A254E6F8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 18:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE4D11A27C;
	Thu, 16 Jun 2022 16:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6761511A449
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:55:42 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC0DJW015765;
 Thu, 16 Jun 2022 09:34:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Cu9tESwNAJCqNud4CH2wl7Pn1vWEacIdyZK6FUTRt2s=;
 b=PAz/g0rjubbGkRjrBHF0c4dZv/OlvpTI8TfaO0pUyaADbon0FQ8DyIkNCUmMbs4AUlfS
 bJK8po3cHaRtvQ8YZttKOf6ObNwEmI1kD+abQUibawuPnqr3sl/tuMKFS8Umu1I5Ybw5
 Ks3oFBiPdlGykKR7dKWgBR+gLWSMb4PzYqmmujJZjmdHmKyec8d8kRhoEuMJQaYTf/4v
 CkR2m9TWVrp76dRt6qdGNhR1CGqKh72GJ8WN12UYR54BptBPrBhkxkxsfdnow9QabD0w
 /LRw1ZqdsPoFccwMCP8plX5gHiYVYMuTktYy2EciCzEb5/7g3NoN47svNZONsJFU72d4 hQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq5w3h-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:33 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:30 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3EFD011D3;
 Thu, 16 Jun 2022 14:34:30 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 04/96] ASoC: img: Migrate to new style legacy DAI naming flag
Date: Thu, 16 Jun 2022 15:32:57 +0100
Message-ID: <20220616143429.1324494-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: OBaTEOosaVBg-9k3CHW6e7_Ho2rcqpWo
X-Proofpoint-GUID: OBaTEOosaVBg-9k3CHW6e7_Ho2rcqpWo
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
 sound/soc/img/img-i2s-in.c       | 3 ++-
 sound/soc/img/img-i2s-out.c      | 3 ++-
 sound/soc/img/img-parallel-out.c | 3 ++-
 sound/soc/img/img-spdif-in.c     | 3 ++-
 sound/soc/img/img-spdif-out.c    | 3 ++-
 5 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/sound/soc/img/img-i2s-in.c b/sound/soc/img/img-i2s-in.c
index 97cab6d95b169..56bb7bbd3976c 100644
--- a/sound/soc/img/img-i2s-in.c
+++ b/sound/soc/img/img-i2s-in.c
@@ -386,7 +386,8 @@ static int img_i2s_in_dai_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_component_driver img_i2s_in_component = {
-	.name = "img-i2s-in"
+	.name = "img-i2s-in",
+	.legacy_dai_naming = 1,
 };
 
 static int img_i2s_in_dma_prepare_slave_config(struct snd_pcm_substream *st,
diff --git a/sound/soc/img/img-i2s-out.c b/sound/soc/img/img-i2s-out.c
index 9ec6fc528e2b4..e3c6e662aa867 100644
--- a/sound/soc/img/img-i2s-out.c
+++ b/sound/soc/img/img-i2s-out.c
@@ -394,7 +394,8 @@ static int img_i2s_out_dai_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_component_driver img_i2s_out_component = {
-	.name = "img-i2s-out"
+	.name = "img-i2s-out",
+	.legacy_dai_naming = 1,
 };
 
 static int img_i2s_out_dma_prepare_slave_config(struct snd_pcm_substream *st,
diff --git a/sound/soc/img/img-parallel-out.c b/sound/soc/img/img-parallel-out.c
index cd6a6a8257419..08506b05e2265 100644
--- a/sound/soc/img/img-parallel-out.c
+++ b/sound/soc/img/img-parallel-out.c
@@ -201,7 +201,8 @@ static struct snd_soc_dai_driver img_prl_out_dai = {
 };
 
 static const struct snd_soc_component_driver img_prl_out_component = {
-	.name = "img-prl-out"
+	.name = "img-prl-out",
+	.legacy_dai_naming = 1,
 };
 
 static int img_prl_out_probe(struct platform_device *pdev)
diff --git a/sound/soc/img/img-spdif-in.c b/sound/soc/img/img-spdif-in.c
index a79d1ccaeec01..3f1d1a7e8735b 100644
--- a/sound/soc/img/img-spdif-in.c
+++ b/sound/soc/img/img-spdif-in.c
@@ -711,7 +711,8 @@ static struct snd_soc_dai_driver img_spdif_in_dai = {
 };
 
 static const struct snd_soc_component_driver img_spdif_in_component = {
-	.name = "img-spdif-in"
+	.name = "img-spdif-in",
+	.legacy_dai_naming = 1,
 };
 
 static int img_spdif_in_probe(struct platform_device *pdev)
diff --git a/sound/soc/img/img-spdif-out.c b/sound/soc/img/img-spdif-out.c
index f7062eba2611a..983761d3fa7e6 100644
--- a/sound/soc/img/img-spdif-out.c
+++ b/sound/soc/img/img-spdif-out.c
@@ -316,7 +316,8 @@ static struct snd_soc_dai_driver img_spdif_out_dai = {
 };
 
 static const struct snd_soc_component_driver img_spdif_out_component = {
-	.name = "img-spdif-out"
+	.name = "img-spdif-out",
+	.legacy_dai_naming = 1,
 };
 
 static int img_spdif_out_probe(struct platform_device *pdev)
-- 
2.30.2

