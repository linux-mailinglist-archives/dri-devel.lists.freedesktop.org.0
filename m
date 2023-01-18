Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C9D671755
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 10:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AFEB10E6F5;
	Wed, 18 Jan 2023 09:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6FB10E1F5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 09:18:38 +0000 (UTC)
X-UUID: 14193da8971111eda06fc9ecc4dadd91-20230118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=6UfPCtl41bcfH9eSwKhVX1fjAFc/UHUKxbvv3r6mvds=; 
 b=SvC//2bRggVvktgzV1FhI3auixHAwCnKv0wUE+ymUOEo8VrUI65Pzz/tQjwR6WSjhiQ6hZwv0OHTy+Bl1QD6a4wupn+rQBPEv6DifxjilNST2APGwCoyNh+AwbECi2P7KRQKwmh1/9eRFimqwlReQZ41+KvqUbFnQ9nnuvpouiQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18, REQID:22a2f5ad-bdfe-427f-9530-8edbad65990a, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.18, REQID:22a2f5ad-bdfe-427f-9530-8edbad65990a, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:3ca2d6b, CLOUDID:274b0055-dd49-462e-a4be-2143a3ddc739,
 B
 ulkID:230118171834DBVX4E9N,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
 il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
 I:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 14193da8971111eda06fc9ecc4dadd91-20230118
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <allen-kh.cheng@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 218072906; Wed, 18 Jan 2023 17:18:32 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 18 Jan 2023 17:18:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 18 Jan 2023 17:18:31 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 1/9] arm64: dts: mediatek: mt8186: Add MTU3 nodes
Date: Wed, 18 Jan 2023 17:18:21 +0800
Message-ID: <20230118091829.755-2-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
References: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
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

Add MTU3 nodes for MT8186 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 75 ++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index c0a3afd55eaf..3d88480913eb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -908,6 +908,43 @@
 			status = "disabled";
 		};
 
+		ssusb0: usb@11201000 {
+			compatible = "mediatek,mt8186-mtu3",
+				     "mediatek,mtu3";
+			reg = <0 0x11201000 0 0x2dff>,
+			      <0 0x11203e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			clocks = <&topckgen CLK_TOP_USB_TOP>,
+				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_REF>,
+				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_HCLK>,
+				 <&infracfg_ao CLK_INFRA_AO_ICUSB>;
+			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck";
+			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&u2port0 PHY_TYPE_USB2>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_SSUSB>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			usb_host0: usb@11200000 {
+				compatible = "mediatek,mt8186-xhci",
+					     "mediatek,mtk-xhci";
+				reg = <0 0x11200000 0 0x1000>;
+				reg-names = "mac";
+				clocks = <&topckgen CLK_TOP_USB_TOP>,
+					 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_REF>,
+					 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_HCLK>,
+					 <&infracfg_ao CLK_INFRA_AO_ICUSB>,
+					 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_XHCI>;
+				clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
+				interrupts = <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH 0>;
+				mediatek,syscon-wakeup = <&pericfg 0x420 2>;
+				wakeup-source;
+				status = "disabled";
+			};
+		};
+
 		mmc0: mmc@11230000 {
 			compatible = "mediatek,mt8186-mmc",
 				     "mediatek,mt8183-mmc";
@@ -939,6 +976,44 @@
 			status = "disabled";
 		};
 
+		ssusb1: usb@11281000 {
+			compatible = "mediatek,mt8186-mtu3",
+				     "mediatek,mtu3";
+			reg = <0 0x11281000 0 0x2dff>,
+			      <0 0x11283e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_SYS>,
+				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_REF>,
+				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_HCLK>,
+				 <&clk26m>;
+			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck";
+			interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&u2port1 PHY_TYPE_USB2>,
+			       <&u3port1 PHY_TYPE_USB3>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_SSUSB_P1>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			usb_host1: usb@11280000 {
+				compatible = "mediatek,mt8186-xhci",
+					     "mediatek,mtk-xhci";
+				reg = <0 0x11280000 0 0x1000>;
+				reg-names = "mac";
+				clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_SYS>,
+					 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_REF>,
+					 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_HCLK>,
+					 <&clk26m>,
+					 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_XHCI>;
+				clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck","xhci_ck";
+				interrupts = <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH 0>;
+				mediatek,syscon-wakeup = <&pericfg 0x424 2>;
+				wakeup-source;
+				status = "disabled";
+			};
+		};
+
 		u3phy0: t-phy@11c80000 {
 			compatible = "mediatek,mt8186-tphy",
 				     "mediatek,generic-tphy-v2";
-- 
2.18.0

