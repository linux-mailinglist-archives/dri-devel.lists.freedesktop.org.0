Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C232777F07B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 08:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD7F10E3FC;
	Thu, 17 Aug 2023 06:26:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B3C10E400
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 06:26:36 +0000 (UTC)
X-UUID: fed34de23cc611eeb20a276fd37b9834-20230817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=VDprCoZcO7oM1ZDNMMHOchmK+k9rb2fBKtIAYWRqCHw=; 
 b=TEG3Lsk408PmJdN37jHHP6boUAjMhGSHoyqS78OQxuNcaOHpRuGgFJYFDTUmnCGPPK+lEiS/dMf9wU3sWCYh8+1Qkv567Fgc+oxem8d14f7XTpvzYAct6zDUJujOsNmuIzj94megQyznSzejHNIC4r0U+AzrtolgFTPhsovTVI0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:6715ed90-c62d-4874-9a63-c6cfddb6a588, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:0ad78a4, CLOUDID:2d1a6e1f-33fd-4aaa-bb43-d3fd68d9d5ae,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: fed34de23cc611eeb20a276fd37b9834-20230817
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <shuijing.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1996567347; Thu, 17 Aug 2023 14:26:27 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 17 Aug 2023 14:26:25 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 17 Aug 2023 14:26:25 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, 
 <conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>
Subject: [PATCH v5,
 3/4] drm/mediatek: dp: Add the audio divider to mtk_dp_data struct
Date: Thu, 17 Aug 2023 14:26:34 +0800
Message-ID: <20230817062635.8786-4-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230817062635.8786-1-shuijing.li@mediatek.com>
References: <20230817062635.8786-1-shuijing.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Shuijing Li <shuijing.li@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Due to the difference of HW, different dividers need to be set.

Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
---
Changes in v4:
list all configuration for MT8188 and MT8195.
per suggestion from the previous thread:
https://lore.kernel.org/all/a9d1b9b7ef4780f51574d0bbbe28f6dd109a6ab8.camel@mediatek.com/
Changes in v3:
Separate these two things into two different patches.
per suggestion from the previous thread:
https://lore.kernel.org/lkml/e2ad22bcba31797f38a12a488d4246a01bf0cb2e.camel@mediatek.com/
Changes in v2:
- change the variables' name to be more descriptive
- add a comment that describes the function of mtk_dp_audio_sample_arrange
- reduce indentation by doing the inverse check
- add a definition of some bits
- add support for mediatek, mt8188-edp-tx
per suggestion from the previous thread:
https://lore.kernel.org/lkml/ac0fcec9-a2fe-06cc-c727-189ef7babe9c@collabora.com/
---
 drivers/gpu/drm/mediatek/mtk_dp.c     |  6 +++++-
 drivers/gpu/drm/mediatek/mtk_dp_reg.h | 18 ++++++++++++------
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index be557b6f5854..fb110374ad1f 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -140,6 +140,7 @@ struct mtk_dp_data {
 	const struct mtk_dp_efuse_fmt *efuse_fmt;
 	bool audio_supported;
 	bool audio_pkt_in_hblank_area;
+	u16 audio_m_div2_bit;
 };
 
 static const struct mtk_dp_efuse_fmt mt8195_edp_efuse_fmt[MTK_DP_CAL_MAX] = {
@@ -648,7 +649,7 @@ static void mtk_dp_audio_sdp_asp_set_channels(struct mtk_dp *mtk_dp,
 static void mtk_dp_audio_set_divider(struct mtk_dp *mtk_dp)
 {
 	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30BC,
-			   AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
+			   mtk_dp->data->audio_m_div2_bit,
 			   AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MASK);
 }
 
@@ -2623,6 +2624,7 @@ static const struct mtk_dp_data mt8188_dp_data = {
 	.efuse_fmt = mt8195_dp_efuse_fmt,
 	.audio_supported = true,
 	.audio_pkt_in_hblank_area = true,
+	.audio_m_div2_bit = MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
 };
 
 static const struct mtk_dp_data mt8195_edp_data = {
@@ -2630,6 +2632,7 @@ static const struct mtk_dp_data mt8195_edp_data = {
 	.smc_cmd = MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE,
 	.efuse_fmt = mt8195_edp_efuse_fmt,
 	.audio_supported = false,
+	.audio_m_div2_bit = MT8195_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
 };
 
 static const struct mtk_dp_data mt8195_dp_data = {
@@ -2637,6 +2640,7 @@ static const struct mtk_dp_data mt8195_dp_data = {
 	.smc_cmd = MTK_DP_SIP_ATF_VIDEO_UNMUTE,
 	.efuse_fmt = mt8195_dp_efuse_fmt,
 	.audio_supported = true,
+	.audio_m_div2_bit = MT8195_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
 };
 
 static const struct of_device_id mtk_dp_of_match[] = {
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
index f38d6ff12afe..709b79480693 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
+++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
@@ -159,12 +159,18 @@
 #define MTK_DP_ENC0_P0_30BC			0x30bc
 #define ISRC_CONT_DP_ENC0_P0				BIT(0)
 #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MASK	GENMASK(10, 8)
-#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_2	(1 << 8)
-#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_4	(2 << 8)
-#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_8	(3 << 8)
-#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2	(5 << 8)
-#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_4	(6 << 8)
-#define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_8	(7 << 8)
+#define MT8195_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_2	(1 << 8)
+#define MT8195_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_4	(2 << 8)
+#define MT8195_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_8	(3 << 8)
+#define MT8195_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2	(5 << 8)
+#define MT8195_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_4	(6 << 8)
+#define MT8195_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_8	(7 << 8)
+#define MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_2	(1 << 8)
+#define MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_4	(2 << 8)
+#define MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_8	(3 << 8)
+#define MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2	(4 << 8)
+#define MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_4	(5 << 8)
+#define MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_8	(7 << 8)
 #define MTK_DP_ENC0_P0_30D8			0x30d8
 #define MTK_DP_ENC0_P0_312C			0x312c
 #define ASP_HB2_DP_ENC0_P0_MASK				GENMASK(7, 0)
-- 
2.40.1

