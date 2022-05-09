Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2A751F394
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 06:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2224911203F;
	Mon,  9 May 2022 04:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626CC112006
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 04:43:13 +0000 (UTC)
X-UUID: a4dd003742ad463ba2a903696cfd82d3-20220509
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:653e0cfb-9fb9-41e6-aae6-da27f919f0f8, OB:10,
 L
 OB:10,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,RULE:Release_Ham,A
 CTION:release,TS:103
X-CID-INFO: VERSION:1.1.4, REQID:653e0cfb-9fb9-41e6-aae6-da27f919f0f8, OB:10,
 LOB
 :10,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_GS981B3D,A
 CTION:quarantine,TS:103
X-CID-META: VersionHash:faefae9, CLOUDID:00de0fb3-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:915af79214d5,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,File:nil
 ,QS:0,BEC:nil
X-UUID: a4dd003742ad463ba2a903696cfd82d3-20220509
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1538270128; Mon, 09 May 2022 12:43:05 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 9 May 2022 12:43:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 May 2022 12:43:04 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>
Subject: [PATCH v2 2/3] dt-bindings: reset: mt8195: add vdosys1 reset control
 bit
Date: Mon, 9 May 2022 12:43:01 +0800
Message-ID: <20220509044302.27878-3-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220509044302.27878-1-rex-bc.chen@mediatek.com>
References: <20220509044302.27878-1-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Nancy.Lin" <nancy.lin@mediatek.com>

Add vdosys1 reset control bit for MT8195 platform.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 include/dt-bindings/reset/mt8195-resets.h | 45 +++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/include/dt-bindings/reset/mt8195-resets.h b/include/dt-bindings/reset/mt8195-resets.h
index a26bccc8b957..1ccfe2f28964 100644
--- a/include/dt-bindings/reset/mt8195-resets.h
+++ b/include/dt-bindings/reset/mt8195-resets.h
@@ -26,4 +26,49 @@
 
 #define MT8195_TOPRGU_SW_RST_NUM               16
 
+/* VDOSYS1 */
+#define MT8195_VDOSYS1_SW0_RST_B_SMI_LARB2                     0
+#define MT8195_VDOSYS1_SW0_RST_B_SMI_LARB3                     1
+#define MT8195_VDOSYS1_SW0_RST_B_GALS                          2
+#define MT8195_VDOSYS1_SW0_RST_B_FAKE_ENG0                     3
+#define MT8195_VDOSYS1_SW0_RST_B_FAKE_ENG1                     4
+#define MT8195_VDOSYS1_SW0_RST_B_MDP_RDMA0                     5
+#define MT8195_VDOSYS1_SW0_RST_B_MDP_RDMA1                     6
+#define MT8195_VDOSYS1_SW0_RST_B_MDP_RDMA2                     7
+#define MT8195_VDOSYS1_SW0_RST_B_MDP_RDMA3                     8
+#define MT8195_VDOSYS1_SW0_RST_B_VPP_MERGE0                    9
+#define MT8195_VDOSYS1_SW0_RST_B_VPP_MERGE1                    10
+#define MT8195_VDOSYS1_SW0_RST_B_VPP_MERGE2                    11
+#define MT8195_VDOSYS1_SW0_RST_B_VPP_MERGE3                    12
+#define MT8195_VDOSYS1_SW0_RST_B_VPP_MERGE4                    13
+#define MT8195_VDOSYS1_SW0_RST_B_VPP2_TO_VDO1_DL_ASYNC         14
+#define MT8195_VDOSYS1_SW0_RST_B_VPP3_TO_VDO1_DL_ASYNC         15
+#define MT8195_VDOSYS1_SW0_RST_B_DISP_MUTEX                    16
+#define MT8195_VDOSYS1_SW0_RST_B_MDP_RDMA4                     17
+#define MT8195_VDOSYS1_SW0_RST_B_MDP_RDMA5                     18
+#define MT8195_VDOSYS1_SW0_RST_B_MDP_RDMA6                     19
+#define MT8195_VDOSYS1_SW0_RST_B_MDP_RDMA7                     20
+#define MT8195_VDOSYS1_SW0_RST_B_DP_INTF0                      21
+#define MT8195_VDOSYS1_SW0_RST_B_DPI0                          22
+#define MT8195_VDOSYS1_SW0_RST_B_DPI1                          23
+#define MT8195_VDOSYS1_SW0_RST_B_DISP_MONITOR                  24
+#define MT8195_VDOSYS1_SW0_RST_B_MERGE0_DL_ASYNC               25
+#define MT8195_VDOSYS1_SW0_RST_B_MERGE1_DL_ASYNC               26
+#define MT8195_VDOSYS1_SW0_RST_B_MERGE2_DL_ASYNC               27
+#define MT8195_VDOSYS1_SW0_RST_B_MERGE3_DL_ASYNC               28
+#define MT8195_VDOSYS1_SW0_RST_B_MERGE4_DL_ASYNC               29
+#define MT8195_VDOSYS1_SW0_RST_B_VDO0_DSC_TO_VDO1_DL_ASYNC     30
+#define MT8195_VDOSYS1_SW0_RST_B_VDO0_MERGE_TO_VDO1_DL_ASYNC   31
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0                   32
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0                   33
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE                    34
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1                   48
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1                   49
+#define MT8195_VDOSYS1_SW1_RST_B_DISP_MIXER                    50
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC          51
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC          52
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC          53
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC          54
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC           55
+
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8195 */
-- 
2.18.0

