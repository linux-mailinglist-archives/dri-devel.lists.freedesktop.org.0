Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D534E7CA5C3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 12:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3C610E18B;
	Mon, 16 Oct 2023 10:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3BF10E19C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 10:40:22 +0000 (UTC)
X-UUID: 63ea3a4c6c1011ee8051498923ad61e6-20231016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=e3ahd3M0XcppL08N+KpDhIH1BYr1qRQbibyyNReplTw=; 
 b=QbLYzpRyreo660/Nd1x9+jeARGKKK747BUW2bsco4E0kXprVkNEz25YIdJb3g9qrE7RaQl+A+w6JY7ovc8rJC3SgHlIvihD99PBVtiHT+sXALm8aw6Afe1M7Aat6uGF3tNPK9K1NLlX1PeQkYk/PtOxmtEAOrndlwU7tfjvx1BU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:8f87a650-58e9-45b9-9f93-26e5bcda4824, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:5790fcbf-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 63ea3a4c6c1011ee8051498923ad61e6-20231016
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 586376697; Mon, 16 Oct 2023 18:40:14 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 16 Oct 2023 18:40:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 16 Oct 2023 18:40:13 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK
 Hu <ck.hu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v8 06/23] dt-bindings: reset: mt8188: Add VDOSYS reset control
 bits
Date: Mon, 16 Oct 2023 18:39:53 +0800
Message-ID: <20231016104010.3270-7-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231016104010.3270-1-shawn.sung@mediatek.com>
References: <20231016104010.3270-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Hsiao Chien Sung <shawn.sung@mediatek.com>, Sean Paul <sean@poorly.run>,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add MT8188 VDOSYS0 and VDOSYS1 reset control bits.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 include/dt-bindings/reset/mt8188-resets.h | 75 +++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/include/dt-bindings/reset/mt8188-resets.h b/include/dt-bindings/reset/mt8188-resets.h
index ba9a5e9b8899..5a58c54e7d20 100644
--- a/include/dt-bindings/reset/mt8188-resets.h
+++ b/include/dt-bindings/reset/mt8188-resets.h
@@ -38,4 +38,79 @@
 #define MT8188_INFRA_RST1_THERMAL_CTRL_RST         1
 #define MT8188_INFRA_RST3_PTP_CTRL_RST             2
 
+#define MT8188_VDO0_RST_DISP_OVL0		0
+#define MT8188_VDO0_RST_FAKE_ENG0		1
+#define MT8188_VDO0_RST_DISP_CCORR0		2
+#define MT8188_VDO0_RST_DISP_MUTEX0		3
+#define MT8188_VDO0_RST_DISP_GAMMA0		4
+#define MT8188_VDO0_RST_DISP_DITHER0		5
+#define MT8188_VDO0_RST_DISP_WDMA0		6
+#define MT8188_VDO0_RST_DISP_RDMA0		7
+#define MT8188_VDO0_RST_DSI0			8
+#define MT8188_VDO0_RST_DSI1			9
+#define MT8188_VDO0_RST_DSC_WRAP0		10
+#define MT8188_VDO0_RST_VPP_MERGE0		11
+#define MT8188_VDO0_RST_DP_INTF0		12
+#define MT8188_VDO0_RST_DISP_AAL0		13
+#define MT8188_VDO0_RST_INLINEROT0		14
+#define MT8188_VDO0_RST_APB_BUS			15
+#define MT8188_VDO0_RST_DISP_COLOR0		16
+#define MT8188_VDO0_RST_MDP_WROT0		17
+#define MT8188_VDO0_RST_DISP_RSZ0		18
+
+#define MT8188_VDO1_RST_SMI_LARB2		0
+#define MT8188_VDO1_RST_SMI_LARB3		1
+#define MT8188_VDO1_RST_GALS			2
+#define MT8188_VDO1_RST_FAKE_ENG0		3
+#define MT8188_VDO1_RST_FAKE_ENG1		4
+#define MT8188_VDO1_RST_MDP_RDMA0		5
+#define MT8188_VDO1_RST_MDP_RDMA1		6
+#define MT8188_VDO1_RST_MDP_RDMA2		7
+#define MT8188_VDO1_RST_MDP_RDMA3		8
+#define MT8188_VDO1_RST_VPP_MERGE0		9
+#define MT8188_VDO1_RST_VPP_MERGE1		10
+#define MT8188_VDO1_RST_VPP_MERGE2		11
+#define MT8188_VDO1_RST_VPP_MERGE3		12
+#define MT8188_VDO1_RST_VPP_MERGE4		13
+#define MT8188_VDO1_RST_VPP2_TO_VDO1_DL_ASYNC	14
+#define MT8188_VDO1_RST_VPP3_TO_VDO1_DL_ASYNC	15
+#define MT8188_VDO1_RST_DISP_MUTEX		16
+#define MT8188_VDO1_RST_MDP_RDMA4		17
+#define MT8188_VDO1_RST_MDP_RDMA5		18
+#define MT8188_VDO1_RST_MDP_RDMA6		19
+#define MT8188_VDO1_RST_MDP_RDMA7		20
+#define MT8188_VDO1_RST_DP_INTF1_MMCK		21
+#define MT8188_VDO1_RST_DPI0_MM_CK		22
+#define MT8188_VDO1_RST_DPI1_MM_CK		23
+#define MT8188_VDO1_RST_MERGE0_DL_ASYNC		24
+#define MT8188_VDO1_RST_MERGE1_DL_ASYNC		25
+#define MT8188_VDO1_RST_MERGE2_DL_ASYNC		26
+#define MT8188_VDO1_RST_MERGE3_DL_ASYNC		27
+#define MT8188_VDO1_RST_MERGE4_DL_ASYNC		28
+#define MT8188_VDO1_RST_VDO0_DSC_TO_VDO1_DL_ASYNC	29
+#define MT8188_VDO1_RST_VDO0_MERGE_TO_VDO1_DL_ASYNC	30
+#define MT8188_VDO1_RST_PADDING0		31
+#define MT8188_VDO1_RST_PADDING1		32
+#define MT8188_VDO1_RST_PADDING2		33
+#define MT8188_VDO1_RST_PADDING3		34
+#define MT8188_VDO1_RST_PADDING4		35
+#define MT8188_VDO1_RST_PADDING5		36
+#define MT8188_VDO1_RST_PADDING6		37
+#define MT8188_VDO1_RST_PADDING7		38
+#define MT8188_VDO1_RST_DISP_RSZ0		39
+#define MT8188_VDO1_RST_DISP_RSZ1		40
+#define MT8188_VDO1_RST_DISP_RSZ2		41
+#define MT8188_VDO1_RST_DISP_RSZ3		42
+#define MT8188_VDO1_RST_HDR_VDO_FE0		43
+#define MT8188_VDO1_RST_HDR_GFX_FE0		44
+#define MT8188_VDO1_RST_HDR_VDO_BE		45
+#define MT8188_VDO1_RST_HDR_VDO_FE1		46
+#define MT8188_VDO1_RST_HDR_GFX_FE1		47
+#define MT8188_VDO1_RST_DISP_MIXER		48
+#define MT8188_VDO1_RST_HDR_VDO_FE0_DL_ASYNC	49
+#define MT8188_VDO1_RST_HDR_VDO_FE1_DL_ASYNC	50
+#define MT8188_VDO1_RST_HDR_GFX_FE0_DL_ASYNC	51
+#define MT8188_VDO1_RST_HDR_GFX_FE1_DL_ASYNC	52
+#define MT8188_VDO1_RST_HDR_VDO_BE_DL_ASYNC	53
+
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8188 */
-- 
2.18.0

