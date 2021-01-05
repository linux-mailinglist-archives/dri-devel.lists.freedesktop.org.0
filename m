Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 274302EBB65
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 09:53:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E001789D87;
	Wed,  6 Jan 2021 08:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id EC87F6E0A1
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 08:34:24 +0000 (UTC)
X-UUID: 8149ad59a5a94c24b441a5f9a16179fd-20210105
X-UUID: 8149ad59a5a94c24b441a5f9a16179fd-20210105
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <nick.fan@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1558010598; Tue, 05 Jan 2021 16:34:18 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 16:34:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 5 Jan 2021 16:34:16 +0800
From: Nick Fan <Nick.Fan@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 2/2] arm64: dts: mt8192: Add node for the Mali GPU
Date: Tue, 5 Jan 2021 16:34:06 +0800
Message-ID: <20210105083406.14025-2-Nick.Fan@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210105083406.14025-1-Nick.Fan@mediatek.com>
References: <20210105083406.14025-1-Nick.Fan@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Wed, 06 Jan 2021 08:52:53 +0000
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Nick Fan <Nick.Fan@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a basic GPU node for mt8192.

Signed-off-by: Nick Fan <Nick.Fan@mediatek.com>
---
This patch depends on Mediatek power and regulator support.

Listed as following.

[1]https://lore.kernel.org/patchwork/patch/1336293/
[2]https://patchwork.kernel.org/project/linux-mediatek/list/?series=374013
[3]https://lore.kernel.org/patchwork/patch/1356037/
[4]https://patchwork.kernel.org/project/linux-mediatek/list/?series=405777
[5]https://lore.kernel.org/patchwork/patch/1356175/
[6]https://patchwork.kernel.org/project/linux-mediatek/patch/1605700894-32699-6-git-send-email-hsin-hsiung.wang@mediatek.com/
[7]https://patchwork.kernel.org/project/linux-mediatek/patch/1608104827-7937-10-git-send-email-hsin-hsiung.wang@mediatek.com/
---
---
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts |   7 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi    | 176 ++++++++++++++++++++
 2 files changed, 183 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
index 6c1e2b3e8a60..48c0e240dd92 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
@@ -5,6 +5,7 @@
  */
 /dts-v1/;
 #include "mt8192.dtsi"
+#include "mt6359.dtsi"
 
 / {
 	model = "MediaTek MT8192 evaluation board";
@@ -70,6 +71,12 @@
 	};
 };
 
+&gpu {
+	supply-names = "mali","sram";
+	mali-supply = <&mt6315_7_vbuck1>;
+	sram-supply = <&mt6359_vsram_others_ldo_reg>;
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index d6a4ad242a33..725c5976d17d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -822,6 +822,182 @@
 			#clock-cells = <1>;
 		};
 
+		gpu: mali@13000000 {
+			compatible = "mediatek,mt8192-mali", "arm,mali-valhall";
+			reg = <0 0x13000000 0 0x4000>;
+			interrupts =
+				<GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>,
+				<GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH 0>,
+				<GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH 0>,
+				<GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH 0>,
+				<GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names =
+				"GPU",
+				"MMU",
+				"JOB",
+				"EVENT",
+				"PWR";
+
+			clocks =
+				<&apmixedsys CLK_APMIXED_MFGPLL>,
+				<&topckgen CLK_TOP_MFG_PLL_SEL>,
+				<&topckgen CLK_TOP_MFG_REF_SEL>,
+				<&mfgcfg CLK_MFG_BG3D>;
+			clock-names =
+				"clk_main_parent",
+				"clk_mux",
+				"clk_sub_parent",
+				"subsys_mfg_cg";
+
+			power-domains =
+				<&spm MT8192_POWER_DOMAIN_MFG2>,
+				<&spm MT8192_POWER_DOMAIN_MFG3>,
+				<&spm MT8192_POWER_DOMAIN_MFG4>,
+				<&spm MT8192_POWER_DOMAIN_MFG5>,
+				<&spm MT8192_POWER_DOMAIN_MFG6>;
+			power-domain-names = "core0",
+					     "core1",
+					     "core2",
+					     "core3",
+					     "core4";
+
+			operating-points-v2 = <&gpu_opp_table>;
+			#cooling-cells = <2>;
+		};
+
+		gpu_opp_table: opp_table0 {
+			compatible = "operating-points-v2";
+			opp-shared;
+
+			opp-358000000 {
+				opp-hz = /bits/ 64 <358000000>;
+				opp-hz-real = /bits/ 64 <358000000>,
+					      /bits/ 64 <358000000>;
+				opp-microvolt = <606250>,
+						<750000>;
+			};
+
+			opp-399000000 {
+				opp-hz = /bits/ 64 <399000000>;
+				opp-hz-real = /bits/ 64 <399000000>,
+					      /bits/ 64 <399000000>;
+				opp-microvolt = <618750>,
+						<750000>;
+			};
+
+			opp-440000000 {
+				opp-hz = /bits/ 64 <440000000>;
+				opp-hz-real = /bits/ 64 <440000000>,
+					      /bits/ 64 <440000000>;
+				opp-microvolt = <631250>,
+						<750000>;
+			};
+
+			opp-482000000 {
+				opp-hz = /bits/ 64 <482000000>;
+				opp-hz-real = /bits/ 64 <482000000>,
+					      /bits/ 64 <482000000>;
+				opp-microvolt = <643750>,
+						<750000>;
+			};
+
+			opp-523000000 {
+				opp-hz = /bits/ 64 <523000000>;
+				opp-hz-real = /bits/ 64 <523000000>,
+					      /bits/ 64 <523000000>;
+				opp-microvolt = <656250>,
+						<750000>;
+			};
+
+			opp-564000000 {
+				opp-hz = /bits/ 64 <564000000>;
+				opp-hz-real = /bits/ 64 <564000000>,
+					      /bits/ 64 <564000000>;
+				opp-microvolt = <668750>,
+						<750000>;
+			};
+
+			opp-605000000 {
+				opp-hz = /bits/ 64 <605000000>;
+				opp-hz-real = /bits/ 64 <605000000>,
+					      /bits/ 64 <605000000>;
+				opp-microvolt = <681250>,
+						<750000>;
+			};
+
+			opp-647000000 {
+				opp-hz = /bits/ 64 <647000000>;
+				opp-hz-real = /bits/ 64 <647000000>,
+					      /bits/ 64 <647000000>;
+				opp-microvolt = <693750>,
+						<750000>;
+			};
+
+			opp-688000000 {
+				opp-hz = /bits/ 64 <688000000>;
+				opp-hz-real = /bits/ 64 <688000000>,
+					      /bits/ 64 <688000000>;
+				opp-microvolt = <706250>,
+						<750000>;
+			};
+
+			opp-724000000 {
+				opp-hz = /bits/ 64 <724000000>;
+				opp-hz-real = /bits/ 64 <724000000>,
+					      /bits/ 64 <724000000>;
+				opp-microvolt = <725000>,
+						<750000>;
+			};
+
+			opp-760000000 {
+				opp-hz = /bits/ 64 <760000000>;
+				opp-hz-real = /bits/ 64 <760000000>,
+					      /bits/ 64 <760000000>;
+				opp-microvolt = <743750>,
+						<750000>;
+			};
+
+			opp-795000000 {
+				opp-hz = /bits/ 64 <795000000>;
+				opp-hz-real = /bits/ 64 <795000000>,
+					      /bits/ 64 <795000000>;
+				opp-microvolt = <762500>,
+						<762500>;
+			};
+
+			opp-831000000 {
+				opp-hz = /bits/ 64 <831000000>;
+				opp-hz-real = /bits/ 64 <831000000>,
+					      /bits/ 64 <831000000>;
+				opp-microvolt = <781250>,
+						<781250>;
+			};
+
+			opp-855000000 {
+				opp-hz = /bits/ 64 <855000000>;
+				opp-hz-real = /bits/ 64 <855000000>,
+					      /bits/ 64 <855000000>;
+				opp-microvolt = <793750>,
+						<793750>;
+			};
+
+			opp-902000000 {
+				opp-hz = /bits/ 64 <902000000>;
+				opp-hz-real = /bits/ 64 <902000000>,
+					      /bits/ 64 <902000000>;
+				opp-microvolt = <818750>,
+						<818750>;
+			};
+
+			opp-950000000 {
+				opp-hz = /bits/ 64 <950000000>;
+				opp-hz-real = /bits/ 64 <950000000>,
+					      /bits/ 64 <950000000>;
+				opp-microvolt = <843750>,
+						<843750>;
+			};
+		};
+
 		mfgcfg: syscon@13fbf000 {
 			compatible = "mediatek,mt8192-mfgcfg", "syscon";
 			reg = <0 0x13fbf000 0 0x1000>;
-- 
2.18.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
