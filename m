Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F8846CB0B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 03:45:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6366E828;
	Wed,  8 Dec 2021 02:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0DC6E828
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Dec 2021 02:44:37 +0000 (UTC)
X-UUID: 0f7391a0449b48ee8c83880a3143910f-20211208
X-UUID: 0f7391a0449b48ee8c83880a3143910f-20211208
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1654805846; Wed, 08 Dec 2021 10:44:32 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 8 Dec 2021 10:44:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Dec 2021 10:44:31 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v10 22/22] arm64: dts: mt8195: add display node for vdosys1
Date: Wed, 8 Dec 2021 10:44:26 +0800
Message-ID: <20211208024426.15595-23-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211208024426.15595-1-nancy.lin@mediatek.com>
References: <20211208024426.15595-1-nancy.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add display node for vdosys1.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 222 +++++++++++++++++++++++
 1 file changed, 222 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index e136761345db..a69a7b57e070 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/power/mt8195-power.h>
+#include <dt-bindings/reset/mt8195-resets.h>
 
 / {
 	compatible = "mediatek,mt8195";
@@ -20,6 +21,22 @@
 	aliases {
 		gce0 = &gce0;
 		gce1 = &gce1;
+		ethdr0 = &ethdr0;
+		mutex0 = &mutex;
+		mutex1 = &mutex1;
+		merge1 = &merge1;
+		merge2 = &merge2;
+		merge3 = &merge3;
+		merge4 = &merge4;
+		merge5 = &merge5;
+		vdo1_rdma0 = &vdo1_rdma0;
+		vdo1_rdma1 = &vdo1_rdma1;
+		vdo1_rdma2 = &vdo1_rdma2;
+		vdo1_rdma3 = &vdo1_rdma3;
+		vdo1_rdma4 = &vdo1_rdma4;
+		vdo1_rdma5 = &vdo1_rdma5;
+		vdo1_rdma6 = &vdo1_rdma6;
+		vdo1_rdma7 = &vdo1_rdma7;
 	};
 
 	clocks {
@@ -1235,7 +1252,212 @@
 		vdosys1: syscon@1c100000 {
 			compatible = "mediatek,mt8195-vdosys1", "syscon";
 			reg = <0 0x1c100000 0 0x1000>;
+			mboxes = <&gce0 1 CMDQ_THR_PRIO_4>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x0000 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		mutex1: disp_mutex0@1c101000 {
+			compatible = "mediatek,mt8195-disp-mutex";
+			reg = <0 0x1c101000 0 0x1000>;
+			reg-names = "vdo1_mutex";
+			interrupts = <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			clocks = <&vdosys1 CLK_VDO1_DISP_MUTEX>;
+			clock-names = "vdo1_mutex";
+			mediatek,gce-events = <CMDQ_EVENT_VDO1_STREAM_DONE_ENG_0>;
+		};
+
+		vdo1_rdma0: vdo1_rdma@1c104000 {
+			compatible = "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c104000 0 0x1000>;
+			interrupts = <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA0>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x4000 0x1000>;
+		};
+
+		vdo1_rdma1: vdo1_rdma@1c105000 {
+			compatible = "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c105000 0 0x1000>;
+			interrupts = <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA1>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			iommus = <&iommu_vpp M4U_PORT_L3_MDP_RDMA1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x5000 0x1000>;
+		};
+
+		vdo1_rdma2: vdo1_rdma@1c106000 {
+			compatible = "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c106000 0 0x1000>;
+			interrupts = <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA2>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA2>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x6000 0x1000>;
+		};
+
+		vdo1_rdma3: vdo1_rdma@1c107000 {
+			compatible = "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c107000 0 0x1000>;
+			interrupts = <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA3>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			iommus = <&iommu_vpp M4U_PORT_L3_MDP_RDMA3>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x7000 0x1000>;
+		};
+
+		vdo1_rdma4: vdo1_rdma@1c108000 {
+			compatible = "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c108000 0 0x1000>;
+			interrupts = <GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA4>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA4>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x8000 0x1000>;
+		};
+
+		vdo1_rdma5: vdo1_rdma@1c109000 {
+			compatible = "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c109000 0 0x1000>;
+			interrupts = <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA5>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			iommus = <&iommu_vpp M4U_PORT_L3_MDP_RDMA5>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x9000 0x1000>;
+		};
+
+		vdo1_rdma6: vdo1_rdma@1c10a000 {
+			compatible = "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c10a000 0 0x1000>;
+			interrupts = <GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA6>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA6>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xa000 0x1000>;
+		};
+
+		vdo1_rdma7: vdo1_rdma@1c10b000 {
+			compatible = "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c10b000 0 0x1000>;
+			interrupts = <GIC_SPI 502 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA7>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			iommus = <&iommu_vpp M4U_PORT_L3_MDP_RDMA7>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xb000 0x1000>;
+		};
+
+		merge1: disp_vpp_merge@1c10c000 {
+			compatible = "mediatek,mt8195-disp-merge";
+			reg = <0 0x1c10c000 0 0x1000>;
+			interrupts = <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE0>,
+				 <&vdosys1 CLK_VDO1_MERGE0_DL_ASYNC>;
+			clock-names = "merge","merge_async";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xc000 0x1000>;
+			mediatek,merge-mute = <1>;
+			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE0_DL_ASYNC>;
+		};
+
+		merge2: disp_vpp_merge@1c10d000 {
+			compatible = "mediatek,mt8195-disp-merge";
+			reg = <0 0x1c10d000 0 0x1000>;
+			interrupts = <GIC_SPI 504 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE1>,
+				 <&vdosys1 CLK_VDO1_MERGE1_DL_ASYNC>;
+			clock-names = "merge","merge_async";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xd000 0x1000>;
+			mediatek,merge-mute = <1>;
+			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE1_DL_ASYNC>;
+		};
+
+		merge3: disp_vpp_merge@1c10e000 {
+			compatible = "mediatek,mt8195-disp-merge";
+			reg = <0 0x1c10e000 0 0x1000>;
+			interrupts = <GIC_SPI 505 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE2>,
+				 <&vdosys1 CLK_VDO1_MERGE2_DL_ASYNC>;
+			clock-names = "merge","merge_async";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xe000 0x1000>;
+			mediatek,merge-mute = <1>;
+			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE2_DL_ASYNC>;
+		};
+
+		merge4: disp_vpp_merge@1c10f000 {
+			compatible = "mediatek,mt8195-disp-merge";
+			reg = <0 0x1c10f000 0 0x1000>;
+			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE3>,
+				 <&vdosys1 CLK_VDO1_MERGE3_DL_ASYNC>;
+			clock-names = "merge","merge_async";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xf000 0x1000>;
+			mediatek,merge-mute = <1>;
+			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE3_DL_ASYNC>;
+		};
+
+		merge5: disp_vpp_merge@1c110000 {
+			compatible = "mediatek,mt8195-disp-merge";
+			reg = <0 0x1c110000 0 0x1000>;
+			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE4>,
+				 <&vdosys1 CLK_VDO1_MERGE4_DL_ASYNC>;
+			clock-names = "merge","merge_async";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0x0000 0x1000>;
+			mediatek,merge-fifo-en = <1>;
+			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE4_DL_ASYNC>;
+		};
+
+		ethdr0: disp_ethdr@1c114000 {
+			compatible = "mediatek,mt8195-disp-ethdr";
+			reg = <0 0x1c114000 0 0x1000>,
+			      <0 0x1c115000 0 0x1000>,
+			      <0 0x1c117000 0 0x1000>,
+			      <0 0x1c119000 0 0x1000>,
+			      <0 0x1c11A000 0 0x1000>,
+			      <0 0x1c11B000 0 0x1000>,
+			      <0 0x1c11C000 0 0x1000>;
+			reg-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
+				    "vdo_be", "adl_ds";
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0x4000 0x1000>,
+						  <&gce0 SUBSYS_1c11XXXX 0x5000 0x1000>,
+						  <&gce0 SUBSYS_1c11XXXX 0x7000 0x1000>,
+						  <&gce0 SUBSYS_1c11XXXX 0x9000 0x1000>,
+						  <&gce0 SUBSYS_1c11XXXX 0xA000 0x1000>,
+						  <&gce0 SUBSYS_1c11XXXX 0xB000 0x1000>,
+						  <&gce0 SUBSYS_1c11XXXX 0xC000 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_DISP_MIXER>,
+				 <&vdosys1 CLK_VDO1_HDR_VDO_FE0>,
+				 <&vdosys1 CLK_VDO1_HDR_VDO_FE1>,
+				 <&vdosys1 CLK_VDO1_HDR_GFX_FE0>,
+				 <&vdosys1 CLK_VDO1_HDR_GFX_FE1>,
+				 <&vdosys1 CLK_VDO1_HDR_VDO_BE>,
+				 <&vdosys1 CLK_VDO1_26M_SLOW>,
+				 <&vdosys1 CLK_VDO1_HDR_VDO_FE0_DL_ASYNC>,
+				 <&vdosys1 CLK_VDO1_HDR_VDO_FE1_DL_ASYNC>,
+				 <&vdosys1 CLK_VDO1_HDR_GFX_FE0_DL_ASYNC>,
+				 <&vdosys1 CLK_VDO1_HDR_GFX_FE1_DL_ASYNC>,
+				 <&vdosys1 CLK_VDO1_HDR_VDO_BE_DL_ASYNC>,
+				 <&topckgen CLK_TOP_ETHDR>;
+			clock-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
+				      "vdo_be", "adl_ds", "vdo_fe0_async", "vdo_fe1_async",
+				      "gfx_fe0_async", "gfx_fe1_async","vdo_be_async",
+				      "ethdr_top";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			iommus = <&iommu_vpp M4U_PORT_L3_HDR_DS>,
+				 <&iommu_vpp M4U_PORT_L3_HDR_ADL>;
+			interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH 0>; /* disp mixer */
+			resets = <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC>,
+				 <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC>,
+				 <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC>,
+				 <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC>,
+				 <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC>;
 		};
 	};
 
-- 
2.18.0

