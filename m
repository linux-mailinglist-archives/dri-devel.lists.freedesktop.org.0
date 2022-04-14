Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5019C500712
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 09:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5224C10E113;
	Thu, 14 Apr 2022 07:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C68D10E142
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 02:53:50 +0000 (UTC)
X-UUID: 951cb7785ab044a8a5e4e2f9daa1c869-20220414
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:c4ce3310-c820-4909-a37c-50db0c739702, OB:20,
 L
 OB:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Release_Ham,A
 CTION:release,TS:108
X-CID-INFO: VERSION:1.1.4, REQID:c4ce3310-c820-4909-a37c-50db0c739702, OB:20,
 LOB
 :0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Spam_GS981B3D,A
 CTION:quarantine,TS:108
X-CID-META: VersionHash:faefae9, CLOUDID:d5b35178-0afa-4dca-bdec-ca54c998425a,
 C
 OID:ff9dd2f348b6,Recheck:0,SF:13|15|28|16|19|48,TC:nil,Content:0,EDM:-3,Fi
 le:nil,QS:0,BEC:nil
X-UUID: 951cb7785ab044a8a5e4e2f9daa1c869-20220414
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <nick.fan@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 806534880; Thu, 14 Apr 2022 10:53:45 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 14 Apr 2022 10:53:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 14 Apr 2022 10:53:43 +0800
From: Nick Fan <Nick.Fan@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 2/2] arm64: dts: mt8192: Add node for the Mali GPU
Date: Thu, 14 Apr 2022 10:50:23 +0800
Message-ID: <20220414025023.11516-2-Nick.Fan@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220414025023.11516-1-Nick.Fan@mediatek.com>
References: <20220414025023.11516-1-Nick.Fan@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Thu, 14 Apr 2022 07:38:34 +0000
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 wenst@chromium.org, Nick Fan <Nick.Fan@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a basic GPU node for mt8192.

Signed-off-by: Nick Fan <Nick.Fan@mediatek.com>
---
This patch depends on MediaTek power and regulator support.

Listed as following.

[1]https://patchwork.kernel.org/project/linux-mediatek/patch/1612678457-11548-4-git-send-email-hsin-hsiung.wang@mediatek.com/
[2]https://patchwork.kernel.org/project/linux-mediatek/patch/1622011927-359-9-git-send-email-hsin-hsiung.wang@mediatek.com/
[3]https://patchwork.kernel.org/project/linux-mediatek/patch/20220318144534.17996-3-allen-kh.cheng@mediatek.com/
[4]https://patchwork.kernel.org/project/linux-mediatek/patch/1605700894-32699-6-git-send-email-hsin-hsiung.wang@mediatek.com/
---
---
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts |   7 ++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi    | 124 ++++++++++++++++++++
 2 files changed, 131 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
index 3369cd962f11..e232089688b8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
@@ -5,6 +5,7 @@
  */
 /dts-v1/;
 #include "mt8192.dtsi"
+#include "mt6359.dtsi"
 
 / {
 	model = "MediaTek MT8192 evaluation board";
@@ -69,6 +70,12 @@
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
index 6150f99a9b87..5514f31f1aa2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -899,6 +899,130 @@
 			#clock-cells = <1>;
 		};
 
+		gpu: mali@13000000 {
+			compatible = "mediatek,mt8192-mali", "arm,mali-valhall";
+			reg = <0 0x13000000 0 0x4000>;
+			interrupts =
+				<GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>,
+				<GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH 0>,
+				<GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names =
+				"gpu",
+				"mmu",
+				"job";
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
+
+			gpu_opp_table: opp_table0 {
+				compatible = "operating-points-v2";
+				opp-shared;
+
+				opp-358000000 {
+					opp-hz = /bits/ 64 <358000000>;
+					opp-microvolt = <606250>, <750000>;
+				};
+
+				opp-399000000 {
+					opp-hz = /bits/ 64 <399000000>;
+					opp-microvolt = <618750>, <750000>;
+				};
+
+				opp-440000000 {
+					opp-hz = /bits/ 64 <440000000>;
+					opp-microvolt = <631250>, <750000>;
+				};
+
+				opp-482000000 {
+					opp-hz = /bits/ 64 <482000000>;
+					opp-microvolt = <643750>, <750000>;
+				};
+
+				opp-523000000 {
+					opp-hz = /bits/ 64 <523000000>;
+					opp-microvolt = <656250>, <750000>;
+				};
+
+				opp-564000000 {
+					opp-hz = /bits/ 64 <564000000>;
+					opp-microvolt = <668750>, <750000>;
+				};
+
+				opp-605000000 {
+					opp-hz = /bits/ 64 <605000000>;
+					opp-microvolt = <681250>, <750000>;
+				};
+
+				opp-647000000 {
+					opp-hz = /bits/ 64 <647000000>;
+					opp-microvolt = <693750>, <750000>;
+				};
+
+				opp-688000000 {
+					opp-hz = /bits/ 64 <688000000>;
+					opp-microvolt = <706250>, <750000>;
+				};
+
+				opp-724000000 {
+					opp-hz = /bits/ 64 <724000000>;
+					opp-microvolt = <725000>, <750000>;
+				};
+
+				opp-748000000 {
+					opp-hz = /bits/ 64 <748000000>;
+					opp-microvolt = <743750>, <750000>;
+				};
+
+				opp-772000000 {
+					opp-hz = /bits/ 64 <772000000>;
+					opp-microvolt = <750000>, <750000>;
+				};
+
+				opp-795000000 {
+					opp-hz = /bits/ 64 <795000000>;
+					opp-microvolt = <762500>, <762500>;
+				};
+
+				opp-819000000 {
+					opp-hz = /bits/ 64 <819000000>;
+					opp-microvolt = <775000>, <775000>;
+				};
+
+				opp-843000000 {
+					opp-hz = /bits/ 64 <843000000>;
+					opp-microvolt = <787500>, <787500>;
+				};
+
+				opp-866000000 {
+					opp-hz = /bits/ 64 <866000000>;
+					opp-microvolt = <800000>, <800000>;
+				};
+			};
+		};
+
 		mfgcfg: clock-controller@13fbf000 {
 			compatible = "mediatek,mt8192-mfgcfg";
 			reg = <0 0x13fbf000 0 0x1000>;
-- 
2.18.0

