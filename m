Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C3579A561
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 10:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED2710E17A;
	Mon, 11 Sep 2023 08:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F51C10E11E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 07:42:53 +0000 (UTC)
X-UUID: cc813e58507611eea33bb35ae8d461a2-20230911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=e3ahd3M0XcppL08N+KpDhIH1BYr1qRQbibyyNReplTw=; 
 b=ruBFIxFefvGGol/RjzTxGqb2A8uo1+tEX04Ikq2lSR5mK8d43dVp32lsOV79IQFGug12Xk3m7+iTiM2q2aIHLFH+pYVCCiJvc/KUger+C0WvBM/0wmdqWsnhjdBhYL9AJEd/BmEBqlYKhv4rcEkHHcbM95KBM2KED2FD36hxZXA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:70b5ee82-b049-4693-876a-3a417c029b60, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-30
X-CID-META: VersionHash:0ad78a4, CLOUDID:9722cb13-4929-4845-9571-38c601e9c3c9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
 L:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,D
 KR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cc813e58507611eea33bb35ae8d461a2-20230911
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 674957740; Mon, 11 Sep 2023 15:42:46 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 15:42:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Sep 2023 15:42:44 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK
 Hu <ck.hu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [RESEND PATCH v6 06/20] dt-bindings: reset: mt8188: Add VDOSYS reset
 control bits
Date: Mon, 11 Sep 2023 15:42:19 +0800
Message-ID: <20230911074233.31556-7-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230911074233.31556-1-shawn.sung@mediatek.com>
References: <20230911074233.31556-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Mon, 11 Sep 2023 08:04:25 +0000
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, "Jason-JH
 . Lin" <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsiao Chien Sung <shawn.sung@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
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

