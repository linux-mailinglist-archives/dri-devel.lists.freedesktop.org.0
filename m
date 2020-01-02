Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEC012E536
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 11:58:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C166E05C;
	Thu,  2 Jan 2020 10:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0ED9D89836
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 04:02:18 +0000 (UTC)
X-UUID: 856de58812ad4402a162c14f81fdd22f-20200102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Y+wnhftACJUbMqxqcT6o9ZJKyh318rnGWmRv6biQamY=; 
 b=hb85hflm5NBoevuL6pQomkks4Ush40qDzlexG42iIG4W+5nDgGu+5tec8dZuI1b3rVoHGcmWSUDznCKnt8GsLfSjf2NsclV0evZuknF5L6Dmibv6rqya4ULesUdKggZMv3/eIBHKdqZ8cbnCTpylLOWuxJ3ZlvkfFVIkpLTYyvw=;
X-UUID: 856de58812ad4402a162c14f81fdd22f-20200102
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1092311655; Thu, 02 Jan 2020 12:02:15 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 2 Jan 2020 12:01:48 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 2 Jan 2020 12:01:33 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6, 01/14] arm64: dts: add display nodes for mt8183
Date: Thu, 2 Jan 2020 12:00:11 +0800
Message-ID: <1577937624-14313-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1577937624-14313-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1577937624-14313-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Thu, 02 Jan 2020 10:58:15 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch add display nodes for mt8183

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 103 +++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 91217e4f..de1ea00 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -30,6 +30,11 @@
 		i2c9 = &i2c9;
 		i2c10 = &i2c10;
 		i2c11 = &i2c11;
+		ovl0 = &ovl0;
+		ovl_2l0 = &ovl_2l0;
+		ovl_2l1 = &ovl_2l1;
+		rdma0 = &rdma0;
+		rdma1 = &rdma1;
 	};
 
 	cpus {
@@ -648,9 +653,107 @@
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8183-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
 			#clock-cells = <1>;
 		};
 
+		ovl0: ovl@14008000 {
+			compatible = "mediatek,mt8183-disp-ovl";
+			reg = <0 0x14008000 0 0x1000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_OVL0>;
+			mediatek,larb = <&larb0>;
+		};
+
+		ovl_2l0: ovl@14009000 {
+			compatible = "mediatek,mt8183-disp-ovl-2l";
+			reg = <0 0x14009000 0 0x1000>;
+			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
+			mediatek,larb = <&larb0>;
+		};
+
+		ovl_2l1: ovl@1400a000 {
+			compatible = "mediatek,mt8183-disp-ovl-2l";
+			reg = <0 0x1400a000 0 0x1000>;
+			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_OVL1_2L>;
+			mediatek,larb = <&larb0>;
+		};
+
+		rdma0: rdma@1400b000 {
+			compatible = "mediatek,mt8183-disp-rdma";
+			reg = <0 0x1400b000 0 0x1000>;
+			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
+			mediatek,larb = <&larb0>;
+			mediatek,rdma_fifo_size = <5>;
+		};
+
+		rdma1: rdma@1400c000 {
+			compatible = "mediatek,mt8183-disp-rdma1";
+			reg = <0 0x1400c000 0 0x1000>;
+			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
+			mediatek,larb = <&larb0>;
+			mediatek,rdma_fifo_size = <2>;
+		};
+
+		color0: color@1400e000 {
+			compatible = "mediatek,mt8183-disp-color",
+				     "mediatek,mt8173-disp-color";
+			reg = <0 0x1400e000 0 0x1000>;
+			interrupts = <GIC_SPI 231 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
+		};
+
+		ccorr0: ccorr@1400f000 {
+			compatible = "mediatek,mt8183-disp-ccorr";
+			reg = <0 0x1400f000 0 0x1000>;
+			interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
+		};
+
+		aal0: aal@14010000 {
+			compatible = "mediatek,mt8183-disp-aal",
+				     "mediatek,mt8173-disp-aal";
+			reg = <0 0x14010000 0 0x1000>;
+			interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_AAL0>;
+		};
+
+		gamma0: gamma@14011000 {
+			compatible = "mediatek,mt8183-disp-gamma",
+				     "mediatek,mt8173-disp-gamma";
+			reg = <0 0x14011000 0 0x1000>;
+			interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
+		};
+
+		dither0: dither@14012000 {
+			compatible = "mediatek,mt8183-disp-dither";
+			reg = <0 0x14012000 0 0x1000>;
+			interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
+		};
+
+		mutex: mutex@14016000 {
+			compatible = "mediatek,mt8183-disp-mutex";
+			reg = <0 0x14016000 0 0x1000>;
+			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+		};
+
 		smi_common: smi@14019000 {
 			compatible = "mediatek,mt8183-smi-common", "syscon";
 			reg = <0 0x14019000 0 0x1000>;
-- 
1.8.1.1.dirty
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
