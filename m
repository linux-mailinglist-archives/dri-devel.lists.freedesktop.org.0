Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD8B5592B4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 08:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FF711222A;
	Fri, 24 Jun 2022 06:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 385E8112AB3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 12:53:31 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NBNlqX015665;
 Thu, 23 Jun 2022 07:52:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=qFSgNYX1ptHx3ipGzxboQwtB9TZr5xpVdo+hP8vZjJM=;
 b=HfhzjAXCMyDKnCSTVEaiZi2yCshZSmIZ4cW4k5KaoUn+hTkmnUtwYl+IF2786FRHA97M
 V8oX/Hmfos3KV8FxDCstedHvWNPmO7iPh4uzF1Ox+kdcsrSW2qBGIY5GcspZYfiJx58h
 ylmk0kzxMDgXRy9b1ZqixT8NCA4SXemjtBcHCQ/MNNWATyZGsdGN9hTycYxjz00X3+El
 4F//2TbuTXe5qQfySRpLG+rgpYYV66xK7fd8BB/BJTx1C0SVkAg1MTpsrmf3wUM8YQn4
 l1zjSiE1GuFrWEMh8L9tMCXntgyp4GW6qWYPWQgz9nk9/qvmIe63PtFkXWbBrAWz+5Xa Mw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41fa4j-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jun 2022 07:52:55 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:51 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 23 Jun 2022 13:52:51 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6A5B1478;
 Thu, 23 Jun 2022 12:52:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 08/96] ASoC: stm32: Migrate to new style legacy DAI naming
 flag
Date: Thu, 23 Jun 2022 13:51:22 +0100
Message-ID: <20220623125250.2355471-9-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Dvzy2Hk5MagPDS3RATX6-WRRTOSLJq0B
X-Proofpoint-ORIG-GUID: Dvzy2Hk5MagPDS3RATX6-WRRTOSLJq0B
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
 sound/soc/stm/stm32_adfsdm.c  | 1 +
 sound/soc/stm/stm32_i2s.c     | 1 +
 sound/soc/stm/stm32_sai_sub.c | 1 +
 sound/soc/stm/stm32_spdifrx.c | 1 +
 4 files changed, 4 insertions(+)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index 122805160e70b..04f2912e14181 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -149,6 +149,7 @@ static const struct snd_soc_dai_driver stm32_adfsdm_dai = {
 
 static const struct snd_soc_component_driver stm32_adfsdm_dai_component = {
 	.name = "stm32_dfsdm_audio",
+	.legacy_dai_naming = 1,
 };
 
 static void stm32_memcpy_32to16(void *dest, const void *src, size_t n)
diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 32d885f84a922..6aafe793eec44 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -978,6 +978,7 @@ static const struct snd_dmaengine_pcm_config stm32_i2s_pcm_config = {
 
 static const struct snd_soc_component_driver stm32_i2s_component = {
 	.name = "stm32-i2s",
+	.legacy_dai_naming = 1,
 };
 
 static void stm32_i2s_dai_init(struct snd_soc_pcm_stream *stream,
diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 03cc6d12d18bb..eb31b49e65978 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1336,6 +1336,7 @@ static const struct snd_dmaengine_pcm_config stm32_sai_pcm_config_spdif = {
 
 static const struct snd_soc_component_driver stm32_component = {
 	.name = "stm32-sai",
+	.legacy_dai_naming = 1,
 };
 
 static const struct of_device_id stm32_sai_sub_ids[] = {
diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 6f7882c4fe6ad..0f71467567176 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -888,6 +888,7 @@ static const struct snd_pcm_hardware stm32_spdifrx_pcm_hw = {
 
 static const struct snd_soc_component_driver stm32_spdifrx_component = {
 	.name = "stm32-spdifrx",
+	.legacy_dai_naming = 1,
 };
 
 static const struct snd_dmaengine_pcm_config stm32_spdifrx_pcm_config = {
-- 
2.30.2

