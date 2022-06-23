Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFE95592AC
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 08:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019FC112130;
	Fri, 24 Jun 2022 06:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BD410E5F9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 12:53:20 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NAKUt5006859;
 Thu, 23 Jun 2022 07:53:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=IRJFhcj+htr8j8A51xKsCTuIkZGBefkGMm7EkX0r/Yg=;
 b=X6AHZDHUi32P1Pya6Lf1nAVxQ+D0bLSdsb2TUYAKQaV2WlfJM0mL/72+xON73WjMbgfW
 VNbKkYlfPdxT9a7PIfsWU8FYvxDTaSJLz+7lWEhHQLs8htjseGZowWoTovb27zsu1mFO
 4rxJ8dOEGlgsiEcFrPvMHYCYiSRPBCTTWuudj7uqSZWFMgZL9P8SXUTgWVZrD1+F9NQy
 YIVoTalhQivUOZuBeJhgqsauiC0m45hrZ5bMOulhlmJTnwHjNWSl3/xZGsRLDkndWKDN
 rPicPIUIzt7n3QmYJPRDYwj2MgVigHTssYgadopFNECm9keAMxVB7AvBGFsfdiyPonMV ug== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41fa4u-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jun 2022 07:53:03 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:54 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 23 Jun 2022 13:52:54 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9CB7711D1;
 Thu, 23 Jun 2022 12:52:54 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 44/96] ASoC: topology: KUnit: Remove now redundant
 non_legacy_dai_naming flag
Date: Thu, 23 Jun 2022 13:51:58 +0100
Message-ID: <20220623125250.2355471-45-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: GtvL_AZVvXuE77-O9X0l-x3NYt0RlWyb
X-Proofpoint-ORIG-GUID: GtvL_AZVvXuE77-O9X0l-x3NYt0RlWyb
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

The ASoC core has now been changed to default to the non-legacy DAI
naming, as such drivers using the new scheme no longer need to specify
the non_legacy_dai_naming flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/soc-topology-test.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index 225d743559741..3acd42a288d6c 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -104,7 +104,6 @@ static const struct snd_soc_component_driver test_component = {
 	.name = "sound-soc-topology-test",
 	.probe = d_probe,
 	.remove = d_remove,
-	.non_legacy_dai_naming = 1,
 };
 
 /* ===== TOPOLOGY TEMPLATES ================================================= */
@@ -238,7 +237,6 @@ static int d_probe_null_comp(struct snd_soc_component *component)
 static const struct snd_soc_component_driver test_component_null_comp = {
 	.name = "sound-soc-topology-test",
 	.probe = d_probe_null_comp,
-	.non_legacy_dai_naming = 1,
 };
 
 static void snd_soc_tplg_test_load_with_null_comp(struct kunit *test)
@@ -344,7 +342,6 @@ static int d_probe_null_fw(struct snd_soc_component *component)
 static const struct snd_soc_component_driver test_component_null_fw = {
 	.name = "sound-soc-topology-test",
 	.probe = d_probe_null_fw,
-	.non_legacy_dai_naming = 1,
 };
 
 static void snd_soc_tplg_test_load_with_null_fw(struct kunit *test)
-- 
2.30.2

