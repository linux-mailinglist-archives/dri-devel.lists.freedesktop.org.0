Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 241F854E752
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 18:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841EF11A478;
	Thu, 16 Jun 2022 16:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0D110E184
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:59:33 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GBnCaM029573;
 Thu, 16 Jun 2022 09:34:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=XTmK71WuLA/9Ac99kLz4eBCLnu0emzzD2gDzWBOz9gw=;
 b=ouPrD0vUxrg5wqwMz6ytNI/eWUqeRG+CjEflUIy7GD/jbt5am5B8H/CHpL8CWd6OGrBT
 UJJlZGtExSrRRjCpUFflt9skPyFYfYfJIrm+HQ3aCT92QE/KMewWIRyOilJowkzFEwyk
 jX0WDjYT2amA/MfjQd2oJHmKBXztvsMq7mGBAC5VzZrcNv02PjgkjrMbyausVAh1JxgM
 IHDI5tJJCPJxA9UW1iMq9nXTJkKB4g7V/MAIJqA8nhnGFoHSEaAO3vaSzf1oFPTMaefC
 BwxhPiyuRl3eZt9cknm4Ms2c8WXSAjgAJZwghjhMmM9eXg5m2m/2qExHxQ+hDjdYjl2b KA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq5w3m-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:44 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:33 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:33 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8263711DA;
 Thu, 16 Jun 2022 14:34:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 44/96] ASoC: topology: KUnit: Remove now redundant
 non_legacy_dai_naming flag
Date: Thu, 16 Jun 2022 15:33:37 +0100
Message-ID: <20220616143429.1324494-45-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: nFsoe9Gac6mxi3v6zo_f_OUaPb_Nl9IN
X-Proofpoint-GUID: nFsoe9Gac6mxi3v6zo_f_OUaPb_Nl9IN
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

The ASoC core has now been changed to default to the non-legacy DAI
naming, as such drivers using the new scheme no longer need to specify
the non_legacy_dai_naming flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/soc-topology-test.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index ae3968161509c..f3ba2be259e5c 100644
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
@@ -346,7 +344,6 @@ static int d_probe_null_fw(struct snd_soc_component *component)
 static const struct snd_soc_component_driver test_component_null_fw = {
 	.name = "sound-soc-topology-test",
 	.probe = d_probe_null_fw,
-	.non_legacy_dai_naming = 1,
 };
 
 static void snd_soc_tplg_test_load_with_null_fw(struct kunit *test)
-- 
2.30.2

