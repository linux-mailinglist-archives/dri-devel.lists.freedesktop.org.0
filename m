Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C95B7A4207
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAF110E1E6;
	Mon, 18 Sep 2023 07:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B6910E3AA
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 07:58:12 +0000 (UTC)
X-UUID: 1c572f66514211ee8051498923ad61e6-20230912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Hd86NQfy2/lhvIbniSQO9dAVZPI8a5X3Ca7Vv9yeC14=; 
 b=XMln9Jm45RDlVIvEgzMf8JWLyUqzthP4wpyyX0dN/NLZqQbCa2LKk8u/KQks7dEvqtlAdIDh8ccOokwLlIEq1qfBfGPetaa+GqOPxTbhG9HWdhnlV9jo7LG6gTy15rKsAkciG5AUsZsI9uJObR0YTxt1IxKiGUTfiNf8bGMu9Qs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:7e12c21f-65a8-4013-8441-cea9ed231686, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:0ad78a4, CLOUDID:bc5199ef-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1c572f66514211ee8051498923ad61e6-20230912
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1899123964; Tue, 12 Sep 2023 15:58:08 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Sep 2023 15:58:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Sep 2023 15:58:06 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v5 01/14] arm64: dts: mediatek: mt8183: correct MDP3
 DMA-related nodes
Date: Tue, 12 Sep 2023 15:57:52 +0800
Message-ID: <20230912075805.11432-2-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230912075805.11432-1-moudy.ho@mediatek.com>
References: <20230912075805.11432-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.350500-8.000000
X-TMASE-MatchedRID: 0VUFvhcn2zGtGUuyWCB/Kov2/i8VNqeOTJDl9FKHbrmcq6An+rYU0aPF
 jJEFr+olwXCBO/GKkVr3FLeZXNZS4CiM3WUt6LtFq75+vYUEA6c1eDdHSu1zer3ImkgySmfNZD2
 GrhvHTdNT/H8FxK09S4RGm6Pfc7I/U5SBgP48jsZUtJVflqbs7O3+vHT2M5IReZUpm6wun3ba/0
 6NhYDa4wyzCDjlUx89djekYOaiKTo=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.350500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4A4A701C13C3B14EFF21FAE6838F6E2B81B29EBD16EA211067CC0034D71129622000:8
X-MTK: N
X-Mailman-Approved-At: Mon, 18 Sep 2023 07:16:21 +0000
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
 dri-devel@lists.freedesktop.org, Moudy
 Ho <moudy.ho@mediatek.com>, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to generalize the node names, the DMA-related nodes
corresponding to MT8183 MDP3 need to be corrected.

Fixes: 60a2fb8d202a ("arm64: dts: mt8183: add MediaTek MDP3 nodes")
Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 5169779d01df..bab68c233792 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1781,7 +1781,7 @@
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
 		};
 
-		mdp3-rdma0@14001000 {
+		dma-controller0@14001000 {
 			compatible = "mediatek,mt8183-mdp3-rdma";
 			reg = <0 0x14001000 0 0x1000>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x1000 0x1000>;
@@ -1793,6 +1793,7 @@
 			iommus = <&iommu M4U_PORT_MDP_RDMA0>;
 			mboxes = <&gce 20 CMDQ_THR_PRIO_LOWEST 0>,
 				 <&gce 21 CMDQ_THR_PRIO_LOWEST 0>;
+			#dma-cells = <1>;
 		};
 
 		mdp3-rsz0@14003000 {
@@ -1813,7 +1814,7 @@
 			clocks = <&mmsys CLK_MM_MDP_RSZ1>;
 		};
 
-		mdp3-wrot0@14005000 {
+		dma-controller@14005000 {
 			compatible = "mediatek,mt8183-mdp3-wrot";
 			reg = <0 0x14005000 0 0x1000>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
@@ -1822,6 +1823,7 @@
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_MDP_WROT0>;
 			iommus = <&iommu M4U_PORT_MDP_WROT0>;
+			#dma-cells = <1>;
 		};
 
 		mdp3-wdma@14006000 {
-- 
2.18.0

