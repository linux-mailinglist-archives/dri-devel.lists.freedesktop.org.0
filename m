Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 822FC435BA1
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13EFF89DC2;
	Thu, 21 Oct 2021 07:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30E16E44F;
 Wed, 20 Oct 2021 13:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1634738360; x=1666274360;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=U0rU8Gb+Lpc3YPKHJrfuFjPuZQBxa9UuLlsXyP+hDIk=;
 b=MzndausYfRK5+augHATaPEHdOkKbu2N4lCo0BGb8sc648IUmO1Di+ING
 NJEl6peBflu3xokxktpnl550/84KGiCav1Mj/KkK9YKojUI82mBdunLTX
 Fn7NQNw5GxdHpEDOUY4UCyvHCwwYJqFpYFMRWQPL/IUkFvu1BOMlgOt7n 8=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 20 Oct 2021 06:59:20 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 20 Oct 2021 06:59:18 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
 by ironmsg02-blr.qualcomm.com with ESMTP; 20 Oct 2021 19:29:00 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
 id 24F6522266; Wed, 20 Oct 2021 19:28:59 +0530 (IST)
From: Krishna Manikandan <quic_mkrishn@quicinc.com>
To: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>, kalyan_t@codeaurora.org,
 sbillaka@codeaurora.org, abhinavk@codeaurora.org, robdclark@gmail.com,
 swboyd@chromium.org, bjorn.andersson@linaro.org, khsieh@codeaurora.org,
 rajeevny@codeaurora.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Subject: [PATCH v2 4/4] arm64: dts: qcom: sc7280: add edp display dt nodes
Date: Wed, 20 Oct 2021 19:28:53 +0530
Message-Id: <1634738333-3916-4-git-send-email-quic_mkrishn@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634738333-3916-1-git-send-email-quic_mkrishn@quicinc.com>
References: <1634738333-3916-1-git-send-email-quic_mkrishn@quicinc.com>
X-Mailman-Approved-At: Thu, 21 Oct 2021 07:25:31 +0000
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

From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>

Add edp controller and phy DT nodes for sc7280.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Signed-off-by: Krishna Manikandan <quic_mkrishn@quicinc.com>

Changes in v2:
    - Move regulator definitions to board file (Matthias Kaehlcke)
    - Move the gpio definitions to board file (Matthias Kaehlcke)
    - Move the pinconf to board file (Matthias Kaehlcke)
    - Move status property (Stephen Boyd)
    - Drop flags from interrupts (Stephen Boyd)
    - Add clock names one per line for readability (Stephen Boyd)
    - Rename edp-opp-table (Stephen Boyd)
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 107 ++++++++++++++++++++++++++++++++++-
 1 file changed, 106 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index dd35882..4450277 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2575,7 +2575,7 @@
 			reg = <0 0xaf00000 0 0x20000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
-				 <0>, <0>, <0>, <0>, <0>, <0>;
+				 <0>, <0>, <0>, <0>, <&edp_phy 0>, <&edp_phy 1>;
 			clock-names = "bi_tcxo", "gcc_disp_gpll0_clk",
 				      "dsi0_phy_pll_out_byteclk",
 				      "dsi0_phy_pll_out_dsiclk",
@@ -2662,6 +2662,13 @@
 							remote-endpoint = <&dsi0_in>;
 						};
 					};
+
+					port@1 {
+						reg = <1>;
+						dpu_intf5_out: endpoint {
+							remote-endpoint = <&edp_in>;
+						};
+					};
 				};
 
 				mdp_opp_table: opp-table {
@@ -2777,6 +2784,103 @@
 
 				status = "disabled";
 			};
+
+			msm_edp: edp@aea0000 {
+				compatible = "qcom,sc7280-edp";
+
+				reg = <0 0xaea0000 0 0x200>,
+				      <0 0xaea0200 0 0x200>,
+				      <0 0xaea0400 0 0xc00>,
+				      <0 0xaea1000 0 0x400>;
+
+				interrupt-parent = <&mdss>;
+				interrupts = <14>;
+
+				clocks = <&rpmhcc RPMH_CXO_CLK>,
+					 <&gcc GCC_EDP_CLKREF_EN>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_EDP_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_EDP_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_EDP_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK>;
+				clock-names = "core_xo",
+					      "core_ref",
+					      "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel";
+				#clock-cells = <1>;
+				assigned-clocks = <&dispcc DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
+				assigned-clock-parents = <&edp_phy 0>, <&edp_phy 1>;
+
+				phys = <&edp_phy>;
+				phy-names = "dp";
+
+				operating-points-v2 = <&edp_opp_table>;
+				power-domains = <&rpmhpd SC7280_CX>;
+
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					port@0 {
+						reg = <0>;
+						edp_in: endpoint {
+							remote-endpoint = <&dpu_intf5_out>;
+						};
+					};
+				};
+
+				edp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-160000000 {
+						opp-hz = /bits/ 64 <160000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+
+			edp_phy: phy@aec2000 {
+				compatible = "qcom,sc7280-edp-phy";
+
+				reg = <0 0xaec2a00 0 0x19c>,
+				      <0 0xaec2200 0 0xa0>,
+				      <0 0xaec2600 0 0xa0>,
+				      <0 0xaec2000 0 0x1c0>;
+
+				clocks = <&rpmhcc RPMH_CXO_CLK>,
+					 <&gcc GCC_EDP_CLKREF_EN>;
+				clock-names = "aux",
+					      "cfg_ahb";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
 		};
 
 		pdc: interrupt-controller@b220000 {
@@ -3932,6 +4036,7 @@
 							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
+
 		};
 
 		cpu1-thermal {
-- 
2.7.4

