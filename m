Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1715470710
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 18:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFEF310EC27;
	Fri, 10 Dec 2021 17:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEADD10EC27
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 17:26:57 +0000 (UTC)
X-UUID: 344d5e2cb4cb422b9269a40dec9f715b-20211211
X-UUID: 344d5e2cb4cb422b9269a40dec9f715b-20211211
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <flora.fu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1185051759; Sat, 11 Dec 2021 01:26:53 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Dec 2021 01:26:52 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 11 Dec 2021 01:26:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:26:51 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
Subject: [PATCH 15/17] arm64: dts: mt8192: Add APU power nodes
Date: Sat, 11 Dec 2021 01:26:03 +0800
Message-ID: <20211210172605.30618-16-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210172605.30618-1-flora.fu@mediatek.com>
References: <20211210172605.30618-1-flora.fu@mediatek.com>
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
Cc: JB Tsai <jb.tsai@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Flora Fu <flora.fu@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add APU power node for MT8192.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 61 ++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index de73fbf0cb90..f95d381ff1cc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -996,6 +996,67 @@
 			};
 		};
 
+		apusys_power: apusys_power@190f1000 {
+			compatible = "mediatek,mt8192-apu-power";
+			reg = <0 0x190f1000 0 0x1000>,
+			      <0 0x19000600 0 0x100>;
+			reg-names = "apu_pcu",
+				    "apu_spare";
+			power-domains = <&apuspm 0>;
+			clocks = <&topckgen CLK_TOP_DSP_SEL>,
+				<&topckgen CLK_TOP_DSP1_SEL>,
+				<&topckgen CLK_TOP_DSP1_NPUPLL_SEL>,
+				<&topckgen CLK_TOP_DSP2_SEL>,
+				<&topckgen CLK_TOP_DSP2_NPUPLL_SEL>,
+				<&topckgen CLK_TOP_DSP5_SEL>,
+				<&topckgen CLK_TOP_DSP5_APUPLL_SEL>,
+				<&topckgen CLK_TOP_IPU_IF_SEL>,
+				<&clk26m>,
+				<&topckgen CLK_TOP_MAINPLL_D4_D2>,
+				<&topckgen CLK_TOP_UNIVPLL_D4_D2>,
+				<&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+				<&topckgen CLK_TOP_MMPLL_D6>,
+				<&topckgen CLK_TOP_MMPLL_D5>,
+				<&topckgen CLK_TOP_MMPLL_D4>,
+				<&topckgen CLK_TOP_UNIVPLL_D5>,
+				<&topckgen CLK_TOP_UNIVPLL_D4>,
+				<&topckgen CLK_TOP_UNIVPLL_D3>,
+				<&topckgen CLK_TOP_MAINPLL_D6>,
+				<&topckgen CLK_TOP_MAINPLL_D4>,
+				<&topckgen CLK_TOP_MAINPLL_D3>,
+				<&topckgen CLK_TOP_TVDPLL>,
+				<&topckgen CLK_TOP_APUPLL>,
+				<&topckgen CLK_TOP_NPUPLL>,
+				<&apmixedsys CLK_APMIXED_APUPLL>,
+				<&apmixedsys CLK_APMIXED_NPUPLL>;
+			clock-names = "clk_top_dsp_sel",
+				"clk_top_dsp1_sel",
+				"clk_top_dsp1_npupll_sel",
+				"clk_top_dsp2_sel",
+				"clk_top_dsp2_npupll_sel",
+				"clk_top_dsp5_sel",
+				"clk_top_dsp5_apupll_sel",
+				"clk_top_ipu_if_sel",
+				"clk_top_clk26m",
+				"clk_top_mainpll_d4_d2",
+				"clk_top_univpll_d4_d2",
+				"clk_top_univpll_d6_d2",
+				"clk_top_mmpll_d6",
+				"clk_top_mmpll_d5",
+				"clk_top_mmpll_d4",
+				"clk_top_univpll_d5",
+				"clk_top_univpll_d4",
+				"clk_top_univpll_d3",
+				"clk_top_mainpll_d6",
+				"clk_top_mainpll_d4",
+				"clk_top_mainpll_d3",
+				"clk_top_tvdpll_ck",
+				"clk_top_apupll_ck",
+				"clk_top_npupll_ck",
+				"clk_apmixed_apupll_rate",
+				"clk_apmixed_npupll_rate";
+		};
+
 		camsys: clock-controller@1a000000 {
 			compatible = "mediatek,mt8192-camsys";
 			reg = <0 0x1a000000 0 0x1000>;
-- 
2.18.0

