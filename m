Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9583F5592EA
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 08:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5AC112462;
	Fri, 24 Jun 2022 06:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF11710E5D6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 12:53:13 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25N5mxl3032604;
 Thu, 23 Jun 2022 07:52:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=A965WNpWYSDhf9ldMo6HdYu7YQa1FzA7GWkgiub9ZVc=;
 b=lZrg0fLeKcjSlEddZRwEHE6vt9yOt9whU1TnWxyQJ9rx5chpbQyHTNnCbR9pHMG/72Nl
 31ONDR3VFhCYSvr8bmU5x8ykuR5uX0+3qkDsZDbz3/LQDUcrFOJ1GTdZami+QObpm8RU
 AXi3Z2TJK5Q42QlsGKAOFau5Noa5dFQSW1/n8ZvD5JjsfUUN6l6tnA4XLv3m1lM+2dD9
 x+LMqiKGDOGeTw+gBbQo9AoZNfO5lXvBAeKsBp0AoRubkeH8+BeSdP2am+PfvOIfF94j
 ChKUtZXfLFQeq3Z/sOB623yfecX97+q+AVcE5WGWic3zutGOfwkkHUAflWzZbeIXGf94 2g== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gsb4p6wvu-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jun 2022 07:52:58 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:52 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 23 Jun 2022 13:52:52 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0AA2111D3;
 Thu, 23 Jun 2022 12:52:52 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 15/96] ASoC: Intel: Migrate to new style legacy DAI naming
 flag
Date: Thu, 23 Jun 2022 13:51:29 +0100
Message-ID: <20220623125250.2355471-16-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ZkIw7JjuYXjXMU4pvUvvigumQtaTVjt8
X-Proofpoint-ORIG-GUID: ZkIw7JjuYXjXMU4pvUvvigumQtaTVjt8
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
 sound/soc/intel/keembay/kmb_platform.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/keembay/kmb_platform.c b/sound/soc/intel/keembay/kmb_platform.c
index d10881fedc8bb..b4893365d01d5 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -388,15 +388,17 @@ static snd_pcm_uframes_t kmb_pcm_pointer(struct snd_soc_component *component,
 }
 
 static const struct snd_soc_component_driver kmb_component = {
-	.name		= "kmb",
-	.pcm_construct	= kmb_platform_pcm_new,
-	.open		= kmb_pcm_open,
-	.trigger	= kmb_pcm_trigger,
-	.pointer	= kmb_pcm_pointer,
+	.name			= "kmb",
+	.pcm_construct		= kmb_platform_pcm_new,
+	.open			= kmb_pcm_open,
+	.trigger		= kmb_pcm_trigger,
+	.pointer		= kmb_pcm_pointer,
+	.legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_component_driver kmb_component_dma = {
-	.name		= "kmb",
+	.name			= "kmb",
+	.legacy_dai_naming	= 1,
 };
 
 static int kmb_probe(struct snd_soc_dai *cpu_dai)
-- 
2.30.2

