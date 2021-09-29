Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 218C741BC75
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 03:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA836E153;
	Wed, 29 Sep 2021 01:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555786E152
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 01:39:18 +0000 (UTC)
X-UUID: 6cbb40f07cba4bbbb3a41d7b8bd9cd42-20210929
X-UUID: 6cbb40f07cba4bbbb3a41d7b8bd9cd42-20210929
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 155068044; Wed, 29 Sep 2021 09:39:15 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 29 Sep 2021 09:39:11 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Sep 2021 09:39:09 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>
CC: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, Matthias Kaehlcke
 <mka@chromium.org>, <anan.sun@mediatek.com>, <yi.kuo@mediatek.com>,
 <acourbot@chromium.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Tiffany Lin <tiffany.lin@mediatek.com>, "Dafna
 Hirschfeld" <dafna.hirschfeld@collabora.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 <anthony.huang@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH v8 12/12] arm64: dts: mediatek: Get rid of mediatek,
 larb for MM nodes
Date: Wed, 29 Sep 2021 09:37:19 +0800
Message-ID: <20210929013719.25120-13-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210929013719.25120-1-yong.wu@mediatek.com>
References: <20210929013719.25120-1-yong.wu@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After adding device_link between the IOMMU consumer and smi,
the mediatek,larb is unnecessary now.

CC: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Evan Green <evgreen@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 16 ----------------
 arch/arm64/boot/dts/mediatek/mt8183.dtsi |  6 ------
 2 files changed, 22 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index d9e005ae5bb0..205c221696a6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1009,7 +1009,6 @@
 				 <&mmsys CLK_MM_MUTEX_32K>;
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			iommus = <&iommu M4U_PORT_MDP_RDMA0>;
-			mediatek,larb = <&larb0>;
 			mediatek,vpu = <&vpu>;
 		};
 
@@ -1020,7 +1019,6 @@
 				 <&mmsys CLK_MM_MUTEX_32K>;
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			iommus = <&iommu M4U_PORT_MDP_RDMA1>;
-			mediatek,larb = <&larb4>;
 		};
 
 		mdp_rsz0: rsz@14003000 {
@@ -1050,7 +1048,6 @@
 			clocks = <&mmsys CLK_MM_MDP_WDMA>;
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			iommus = <&iommu M4U_PORT_MDP_WDMA>;
-			mediatek,larb = <&larb0>;
 		};
 
 		mdp_wrot0: wrot@14007000 {
@@ -1059,7 +1056,6 @@
 			clocks = <&mmsys CLK_MM_MDP_WROT0>;
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			iommus = <&iommu M4U_PORT_MDP_WROT0>;
-			mediatek,larb = <&larb0>;
 		};
 
 		mdp_wrot1: wrot@14008000 {
@@ -1068,7 +1064,6 @@
 			clocks = <&mmsys CLK_MM_MDP_WROT1>;
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			iommus = <&iommu M4U_PORT_MDP_WROT1>;
-			mediatek,larb = <&larb4>;
 		};
 
 		ovl0: ovl@1400c000 {
@@ -1078,7 +1073,6 @@
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			clocks = <&mmsys CLK_MM_DISP_OVL0>;
 			iommus = <&iommu M4U_PORT_DISP_OVL0>;
-			mediatek,larb = <&larb0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
 		};
 
@@ -1089,7 +1083,6 @@
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			clocks = <&mmsys CLK_MM_DISP_OVL1>;
 			iommus = <&iommu M4U_PORT_DISP_OVL1>;
-			mediatek,larb = <&larb4>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xd000 0x1000>;
 		};
 
@@ -1100,7 +1093,6 @@
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
 			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
-			mediatek,larb = <&larb0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
 		};
 
@@ -1111,7 +1103,6 @@
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
 			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
-			mediatek,larb = <&larb4>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
 		};
 
@@ -1122,7 +1113,6 @@
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			clocks = <&mmsys CLK_MM_DISP_RDMA2>;
 			iommus = <&iommu M4U_PORT_DISP_RDMA2>;
-			mediatek,larb = <&larb4>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0 0x1000>;
 		};
 
@@ -1133,7 +1123,6 @@
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			clocks = <&mmsys CLK_MM_DISP_WDMA0>;
 			iommus = <&iommu M4U_PORT_DISP_WDMA0>;
-			mediatek,larb = <&larb0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
 		};
 
@@ -1144,7 +1133,6 @@
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			clocks = <&mmsys CLK_MM_DISP_WDMA1>;
 			iommus = <&iommu M4U_PORT_DISP_WDMA1>;
-			mediatek,larb = <&larb4>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
 		};
 
@@ -1395,7 +1383,6 @@
 			      <0 0x16027800 0 0x800>,	/* VDEC_HWB */
 			      <0 0x16028400 0 0x400>;	/* VDEC_HWG */
 			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_LOW>;
-			mediatek,larb = <&larb1>;
 			iommus = <&iommu M4U_PORT_HW_VDEC_MC_EXT>,
 				 <&iommu M4U_PORT_HW_VDEC_PP_EXT>,
 				 <&iommu M4U_PORT_HW_VDEC_AVC_MV_EXT>,
@@ -1463,7 +1450,6 @@
 			compatible = "mediatek,mt8173-vcodec-enc";
 			reg = <0 0x18002000 0 0x1000>;	/* VENC_SYS */
 			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
-			mediatek,larb = <&larb3>;
 			iommus = <&iommu M4U_PORT_VENC_RCPU>,
 				 <&iommu M4U_PORT_VENC_REC>,
 				 <&iommu M4U_PORT_VENC_BSDMA>,
@@ -1491,7 +1477,6 @@
 			clock-names = "jpgdec-smi",
 				      "jpgdec";
 			power-domains = <&spm MT8173_POWER_DOMAIN_VENC>;
-			mediatek,larb = <&larb3>;
 			iommus = <&iommu M4U_PORT_JPGDEC_WDMA>,
 				 <&iommu M4U_PORT_JPGDEC_BSDMA>;
 		};
@@ -1525,7 +1510,6 @@
 				 <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
 				 <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
 				 <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
-			mediatek,larb = <&larb5>;
 			mediatek,vpu = <&vpu>;
 			clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
 			clock-names = "venc_lt_sel";
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index bead8e486239..d214ff0f4f59 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1239,7 +1239,6 @@
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_OVL0>;
 			iommus = <&iommu M4U_PORT_DISP_OVL0>;
-			mediatek,larb = <&larb0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x8000 0x1000>;
 		};
 
@@ -1250,7 +1249,6 @@
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
 			iommus = <&iommu M4U_PORT_DISP_2L_OVL0_LARB0>;
-			mediatek,larb = <&larb0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000 0x1000>;
 		};
 
@@ -1261,7 +1259,6 @@
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_OVL1_2L>;
 			iommus = <&iommu M4U_PORT_DISP_2L_OVL1_LARB0>;
-			mediatek,larb = <&larb0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xa000 0x1000>;
 		};
 
@@ -1272,7 +1269,6 @@
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
 			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
-			mediatek,larb = <&larb0>;
 			mediatek,rdma-fifo-size = <5120>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
 		};
@@ -1284,7 +1280,6 @@
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
 			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
-			mediatek,larb = <&larb0>;
 			mediatek,rdma-fifo-size = <2048>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
 		};
@@ -1441,7 +1436,6 @@
 			compatible = "mediatek,mt8183-jpgenc", "mediatek,mtk-jpgenc";
 			reg = <0 0x17030000 0 0x1000>;
 			interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_LOW>;
-			mediatek,larb = <&larb4>;
 			iommus = <&iommu M4U_PORT_JPGENC_RDMA>,
 				 <&iommu M4U_PORT_JPGENC_BSDMA>;
 			power-domains = <&spm MT8183_POWER_DOMAIN_VENC>;
-- 
2.18.0

