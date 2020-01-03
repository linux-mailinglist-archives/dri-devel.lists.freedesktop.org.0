Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C070130212
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 12:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134986E42D;
	Sat,  4 Jan 2020 11:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 504A66E16B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 03:12:41 +0000 (UTC)
X-UUID: 31fb82bffcc34d23806bff134ece1770-20200103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=orKJ3lD5eoygsfmvTkj/+8hB2VHcMMOk4prxsozRjkE=; 
 b=Z/1dIcoJlayunT+RMA7WCGoubVSfqr7oDdz5brT3TENV7UWVjFnIjUlYCuQyMgzOb1m/auhq5v8z2dIgUNI+/OiqxNy4huwvvJvh7AJDZ1HE6DnS3nlSFovbWGrAz5AEWDQo673yWOIfzE6Flsx06v/5KVENrrB6+G90lR2Eats=;
X-UUID: 31fb82bffcc34d23806bff134ece1770-20200103
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1695416825; Fri, 03 Jan 2020 11:12:39 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 3 Jan 2020 11:12:11 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 3 Jan 2020 11:13:05 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [RESEND PATCH v6 02/17] arm64: dts: add display nodes for mt8183
Date: Fri, 3 Jan 2020 11:12:13 +0800
Message-ID: <1578021148-32413-3-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1578021148-32413-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1578021148-32413-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Sat, 04 Jan 2020 11:23:45 +0000
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
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 98 ++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 91217e4f..28beb1d 100644
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
@@ -648,9 +653,102 @@
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
+		};
+
+		ovl_2l0: ovl@14009000 {
+			compatible = "mediatek,mt8183-disp-ovl-2l";
+			reg = <0 0x14009000 0 0x1000>;
+			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
+		};
+
+		ovl_2l1: ovl@1400a000 {
+			compatible = "mediatek,mt8183-disp-ovl-2l";
+			reg = <0 0x1400a000 0 0x1000>;
+			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_OVL1_2L>;
+		};
+
+		rdma0: rdma@1400b000 {
+			compatible = "mediatek,mt8183-disp-rdma";
+			reg = <0 0x1400b000 0 0x1000>;
+			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
+			mediatek,rdma_fifo_size = <5120>;
+		};
+
+		rdma1: rdma@1400c000 {
+			compatible = "mediatek,mt8183-disp-rdma";
+			reg = <0 0x1400c000 0 0x1000>;
+			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
+			mediatek,rdma_fifo_size = <2048>;
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
