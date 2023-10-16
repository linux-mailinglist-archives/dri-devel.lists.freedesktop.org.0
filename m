Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC147CA5B0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 12:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEABC10E19C;
	Mon, 16 Oct 2023 10:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D5110E18B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 10:40:22 +0000 (UTC)
X-UUID: 654fdd106c1011eea33bb35ae8d461a2-20231016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=zgkOJnOawwpjAbjIZp4Lc3rk4l55K1RyKg+GjJmZMqQ=; 
 b=ozz8NGROnl6BL3UEh/XEWyaKAJf0a9UWHmHXkrMJlK+nUA7HBX9bWIfmdefOocDleTgyRJth3SbRmRmbSRGNaZJFs1GkhmXk1GyFZXfzl7xTw9XXpTVWiaJ9Mts0YQrW96DiqK2AB6k1jjVVaCzx1kqaTmiE24/kU4aIgUtlUwA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:2ab9b055-12ea-42ec-8ce0-05bc3c961d24, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:5f78ec9, CLOUDID:1791fcbf-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 654fdd106c1011eea33bb35ae8d461a2-20231016
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 823148627; Mon, 16 Oct 2023 18:40:17 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 16 Oct 2023 18:40:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 16 Oct 2023 18:40:16 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v8 20/23] drm/mediatek: Remove the redundant driver data for
 DPI
Date: Mon, 16 Oct 2023 18:40:07 +0800
Message-ID: <20231016104010.3270-21-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231016104010.3270-1-shawn.sung@mediatek.com>
References: <20231016104010.3270-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.042700-8.000000
X-TMASE-MatchedRID: JqvUv0YB5EdF/TNFimjSuBIRh9wkXSlFuLwbhNl9B5Waecho1pk4sZsn
 GP/L/vukqf82uGal6CMnOAFYLaUTjQDNPxu11HXj4pdq9sdj8LXuSXYuvnu1YQ6QlBHhBZuwnLY
 ZeTdR6/nW423XW2hpe8WTKA6C26DEEXiXWg39uY6eAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8h+IC
 quNi0WJEAJUI51LZL6xHfdVsFjU29pvAeT5M6Jp1Djv3Ert5O8ftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.042700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 228F4B23E4C0A2CB8DE72C3EB65FDB67E2FCE17A53409842098B068B3A57E0702000:8
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hsiao Chien
 Sung <shawn.sung@mediatek.com>, Sean Paul <sean@poorly.run>,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DPI input is in 1T2P mode on both MT8195 and MT8188.
Remove the redundant driver data to align the settings, or
the screen will glitch.

Fixes: 2847cd7e6403 ("drm/mediatek: Add mt8188 dpi compatibles and platform data")

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 1bf6041dd88b..d633f1ca3e71 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -967,20 +967,6 @@ static const struct mtk_dpi_conf mt8186_conf = {
 	.csc_enable_bit = CSC_ENABLE,
 };
 
-static const struct mtk_dpi_conf mt8188_dpintf_conf = {
-	.cal_factor = mt8195_dpintf_calculate_factor,
-	.max_clock_khz = 600000,
-	.output_fmts = mt8195_output_fmts,
-	.num_output_fmts = ARRAY_SIZE(mt8195_output_fmts),
-	.pixels_per_iter = 4,
-	.input_2pixel = false,
-	.dimension_mask = DPINTF_HPW_MASK,
-	.hvsize_mask = DPINTF_HSIZE_MASK,
-	.channel_swap_shift = DPINTF_CH_SWAP,
-	.yuv422_en_bit = DPINTF_YUV422_EN,
-	.csc_enable_bit = DPINTF_CSC_ENABLE,
-};
-
 static const struct mtk_dpi_conf mt8192_conf = {
 	.cal_factor = mt8183_calculate_factor,
 	.reg_h_fre_con = 0xe0,
@@ -1104,7 +1090,7 @@ static const struct of_device_id mtk_dpi_of_ids[] = {
 	{ .compatible = "mediatek,mt8173-dpi", .data = &mt8173_conf },
 	{ .compatible = "mediatek,mt8183-dpi", .data = &mt8183_conf },
 	{ .compatible = "mediatek,mt8186-dpi", .data = &mt8186_conf },
-	{ .compatible = "mediatek,mt8188-dp-intf", .data = &mt8188_dpintf_conf },
+	{ .compatible = "mediatek,mt8188-dp-intf", .data = &mt8195_dpintf_conf },
 	{ .compatible = "mediatek,mt8192-dpi", .data = &mt8192_conf },
 	{ .compatible = "mediatek,mt8195-dp-intf", .data = &mt8195_dpintf_conf },
 	{ /* sentinel */ },
-- 
2.18.0

