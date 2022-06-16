Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A95B54E706
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 18:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2776A11A38E;
	Thu, 16 Jun 2022 16:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687C911A449
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:55:43 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GBnCaL029573;
 Thu, 16 Jun 2022 09:34:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=lUR098xjWteEbH1+FUtUPo6I+j1bPK4ArKFxC7siG8M=;
 b=XTw7XT5/tRoU84b9ZED4jcQzVAKM2wCORBLfUZzoaYCwk6YYNSTc/N8eNgdo4wuSf9nz
 bqBPAIb31fQtnDqkFfEPYgMzwMyz7O1XIAw1i6O2d+2xmg/eyCeD48Y/9UXyybOOX2z0
 lfxdgyIS411qSriRX8SAKQQ8pL4N2fyX04qvTtg26VWVALzzYzFrzrsdGEEXyl/h9usQ
 iIDVOjATlUDrQZuUOkObGSapaNUjTyWCJspLwLw/X7g3TwsqgJzPlfdzwcaOOGXVV3g2
 8Q7MeCade04EvPuxG6QItkoQQo0Uc4OA5/s8HG6HEJUTBGfBxY+APK0/RqLSa66ZaBzg EQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq5w3m-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:43 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:33 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:33 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E639A11D4;
 Thu, 16 Jun 2022 14:34:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 37/96] ASoC: meson: Remove now redundant non_legacy_dai_naming
 flag
Date: Thu, 16 Jun 2022 15:33:30 +0100
Message-ID: <20220616143429.1324494-38-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: nAqQYQX3tRsdxNBDXewgD7kcqwRQfft5
X-Proofpoint-GUID: nAqQYQX3tRsdxNBDXewgD7kcqwRQfft5
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
 sound/soc/meson/aiu-acodec-ctrl.c | 1 -
 sound/soc/meson/aiu-codec-ctrl.c  | 1 -
 sound/soc/meson/g12a-toacodec.c   | 2 --
 sound/soc/meson/g12a-tohdmitx.c   | 1 -
 sound/soc/meson/t9015.c           | 1 -
 5 files changed, 6 deletions(-)

diff --git a/sound/soc/meson/aiu-acodec-ctrl.c b/sound/soc/meson/aiu-acodec-ctrl.c
index 3776b073a3dbb..d0f0ada5f4bce 100644
--- a/sound/soc/meson/aiu-acodec-ctrl.c
+++ b/sound/soc/meson/aiu-acodec-ctrl.c
@@ -192,7 +192,6 @@ static const struct snd_soc_component_driver aiu_acodec_ctrl_component = {
 	.num_dapm_routes	= ARRAY_SIZE(aiu_acodec_ctrl_routes),
 	.of_xlate_dai_name	= aiu_acodec_of_xlate_dai_name,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_prefix		= "acodec",
 #endif
diff --git a/sound/soc/meson/aiu-codec-ctrl.c b/sound/soc/meson/aiu-codec-ctrl.c
index 286ac4983d40c..84c10956c2414 100644
--- a/sound/soc/meson/aiu-codec-ctrl.c
+++ b/sound/soc/meson/aiu-codec-ctrl.c
@@ -139,7 +139,6 @@ static const struct snd_soc_component_driver aiu_hdmi_ctrl_component = {
 	.num_dapm_routes	= ARRAY_SIZE(aiu_hdmi_ctrl_routes),
 	.of_xlate_dai_name	= aiu_hdmi_of_xlate_dai_name,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_prefix		= "hdmi",
 #endif
diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index 1dfee1396843c..ddc667956cf5e 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -242,7 +242,6 @@ static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
 	.dapm_routes		= g12a_toacodec_routes,
 	.num_dapm_routes	= ARRAY_SIZE(g12a_toacodec_routes),
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
@@ -254,7 +253,6 @@ static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
 	.dapm_routes		= g12a_toacodec_routes,
 	.num_dapm_routes	= ARRAY_SIZE(g12a_toacodec_routes),
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config g12a_toacodec_regmap_cfg = {
diff --git a/sound/soc/meson/g12a-tohdmitx.c b/sound/soc/meson/g12a-tohdmitx.c
index 6c99052feafd8..579a04ad4d197 100644
--- a/sound/soc/meson/g12a-tohdmitx.c
+++ b/sound/soc/meson/g12a-tohdmitx.c
@@ -226,7 +226,6 @@ static const struct snd_soc_component_driver g12a_tohdmitx_component_drv = {
 	.dapm_routes		= g12a_tohdmitx_routes,
 	.num_dapm_routes	= ARRAY_SIZE(g12a_tohdmitx_routes),
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config g12a_tohdmitx_regmap_cfg = {
diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
index a9b8c4e77d405..9c6b4dac68932 100644
--- a/sound/soc/meson/t9015.c
+++ b/sound/soc/meson/t9015.c
@@ -234,7 +234,6 @@ static const struct snd_soc_component_driver t9015_codec_driver = {
 	.num_dapm_routes	= ARRAY_SIZE(t9015_dapm_routes),
 	.suspend_bias_off	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config t9015_regmap_config = {
-- 
2.30.2

