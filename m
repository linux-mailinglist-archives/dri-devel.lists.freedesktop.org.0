Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 913EE665B8F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 13:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862C010E723;
	Wed, 11 Jan 2023 12:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F91110E716
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 12:37:26 +0000 (UTC)
X-UUID: b148a8a891ac11eda06fc9ecc4dadd91-20230111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=jykuStcNhIaqoh/2vR5M8cvji1f+ctzxDeF4MG+9YW0=; 
 b=RKRjS8/rMN40GOjerItxJVs0PBCfHWdRudgDLxhK9j/daUl4x/gA0lbXvvYrGni9oog0P0jKltk+6FciboM8x+LqAzsdrIupzC8xFh/GY1Go70qsEBdrtyvatGaNRB5Coyc1d3pbUlvbfzA3CbFeVB5AfS0xx/m6Csf0xDe+TpA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17, REQID:97e55e01-38ea-4e66-9de2-0982bbb8e867, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:543e81c, CLOUDID:ab4af68b-8530-4eff-9f77-222cf6e2895b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: b148a8a891ac11eda06fc9ecc4dadd91-20230111
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <allen-kh.cheng@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 34577008; Wed, 11 Jan 2023 20:37:21 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 11 Jan 2023 20:37:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 11 Jan 2023 20:37:19 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 9/9] arm64: dts: mediatek: mt8186: Add display nodes
Date: Wed, 11 Jan 2023 20:37:11 +0800
Message-ID: <20230111123711.32020-10-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230111123711.32020-1-allen-kh.cheng@mediatek.com>
References: <20230111123711.32020-1-allen-kh.cheng@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add display nodes and GCE info for MT8186 SoC. Also, add GCE
(Global Command Engine) properties to the display nodes in order to
enable the usage of the CMDQ (Command Queue), which is required for
operating the display.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 128 +++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index eab30ab01572..8670d37970ef 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -5,6 +5,7 @@
  */
 /dts-v1/;
 #include <dt-bindings/clock/mt8186-clk.h>
+#include <dt-bindings/gce/mt8186-gce.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/memory/mt8186-memory-port.h>
@@ -632,6 +633,15 @@
 			clocks = <&clk13m>;
 		};
 
+		gce: mailbox@1022c000 {
+			compatible = "mediatek,mt8186-gce";
+			reg = <0 0X1022c000 0 0x4000>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <2>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_GCE>;
+			clock-names = "gce";
+		};
+
 		scp: scp@10500000 {
 			compatible = "mediatek,mt8186-scp";
 			reg = <0 0x10500000 0 0x40000>,
@@ -1197,6 +1207,20 @@
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
+				 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
+		};
+
+		mutex: mutex@14001000 {
+			compatible = "mediatek,mt8186-disp-mutex";
+			reg = <0 0x14001000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_MUTEX0>;
+			interrupts = <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_DISP_STREAM_DONE_ENG_EVENT_0>,
+					      <CMDQ_EVENT_DISP_STREAM_DONE_ENG_EVENT_1>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
 		};
 
 		smi_common: smi@14002000 {
@@ -1230,6 +1254,49 @@
 			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
 		};
 
+		ovl0: ovl@14005000 {
+			compatible = "mediatek,mt8186-disp-ovl",
+				     "mediatek,mt8192-disp-ovl";
+			reg = <0 0x14005000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_OVL0>;
+			interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&iommu_mm IOMMU_PORT_L0_OVL_RDMA0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
+		ovl0_2l: ovl@14006000 {
+			compatible = "mediatek,mt8186-disp-ovl-2l",
+				     "mediatek,mt8192-disp-ovl-2l";
+			reg = <0 0x14006000 0 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
+			interrupts = <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&iommu_mm IOMMU_PORT_L1_OVL_2L_RDMA0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
+		};
+
+		rdma0: rdma@14007000 {
+			compatible = "mediatek,mt8186-disp-rdma",
+				     "mediatek,mt8183-disp-rdma";
+			reg = <0 0x14007000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
+			interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&iommu_mm IOMMU_PORT_L1_DISP_RDMA0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x7000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
+		color0: color@14009000 {
+			compatible = "mediatek,mt8186-disp-color",
+				     "mediatek,mt8173-disp-color";
+			reg = <0 0x14009000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
+			interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x8000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
 		dpi0: dpi@1400a000 {
 			compatible = "mediatek,mt8186-dpi";
 			reg = <0 0x1400a000 0 0x1000>;
@@ -1247,6 +1314,56 @@
 			};
 		};
 
+		ccorr0: ccorr@1400b000 {
+			compatible = "mediatek,mt8186-disp-ccorr",
+				     "mediatek,mt8192-disp-ccorr";
+			reg = <0 0x1400b000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
+			interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
+		aal0: aal@1400c000 {
+			compatible = "mediatek,mt8186-disp-aal",
+				     "mediatek,mt8183-disp-aal";
+			reg = <0 0x1400c000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_AAL0>;
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
+		gamma0: gamma@1400d000 {
+			compatible = "mediatek,mt8186-disp-gamma",
+				     "mediatek,mt8183-disp-gamma";
+			reg = <0 0x1400d000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
+			interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xd000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
+		postmask0: postmask@1400e000 {
+			compatible = "mediatek,mt8186-disp-postmask",
+				     "mediatek,mt8192-disp-postmask";
+			reg = <0 0x1400e000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_POSTMASK0>;
+			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
+		dither0: dither@1400f000 {
+			compatible = "mediatek,mt8186-disp-dither",
+				     "mediatek,mt8183-disp-dither";
+			reg = <0 0x1400f000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
+			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
 		dsi0: dsi@14013000 {
 			compatible = "mediatek,mt8186-dsi";
 			reg = <0 0x14013000 0 0x1000>;
@@ -1280,6 +1397,17 @@
 			#iommu-cells = <1>;
 		};
 
+		rdma1: rdma@1401f000 {
+			compatible = "mediatek,mt8186-disp-rdma",
+				     "mediatek,mt8183-disp-rdma";
+			reg = <0 0x1401f000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
+			interrupts = <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&iommu_mm IOMMU_PORT_L1_DISP_RDMA1>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xf000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
 		wpesys: clock-controller@14020000 {
 			compatible = "mediatek,mt8186-wpesys";
 			reg = <0 0x14020000 0 0x1000>;
-- 
2.18.0

