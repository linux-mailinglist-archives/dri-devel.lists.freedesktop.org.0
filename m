Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F29347EFFA
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 17:04:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9248D10E47B;
	Fri, 24 Dec 2021 16:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF86910E477;
 Fri, 24 Dec 2021 16:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1640361837; x=1671897837;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=FbBgJkn+Lbo7cjyLUJ9Kw+l/u5ykwaerywPkRTuktTg=;
 b=ZuKSV2dWg5wrBCgxYXwEbndWxLVdI1K33x+jDqCjG03T3r02PAYcZiJE
 FLJLbZkWkeb76Tr9+gzV0JEeMGqgtqtR/mtAEaNjhIwEeqsBQyY5fXKHN
 4z9uPSoe3DBygKVYatgDEdmuWbjNPTJWWu8z0FAQuVaNcXmDV99bf8sy/ Y=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 24 Dec 2021 08:03:56 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2021 08:03:56 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 24 Dec 2021 08:03:55 -0800
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 24 Dec 2021 08:03:50 -0800
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <agross@kernel.org>,
 <bjorn.andersson@linaro.org>, <robh+dt@kernel.org>
Subject: [PATCH v5 3/4] arm64: dts: qcom: sc7280: add edp display dt nodes
Date: Fri, 24 Dec 2021 21:33:12 +0530
Message-ID: <1640361793-26486-4-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1640361793-26486-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1640361793-26486-1-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: quic_kalyant@quicinc.com, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dianders@chromium.org, quic_abhinavk@quicinc.com, swboyd@chromium.org,
 seanpaul@chromium.org, quic_mkrishn@quicinc.com, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add edp controller and phy DT nodes for sc7280.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Signed-off-by: Krishna Manikandan <quic_mkrishn@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 107 ++++++++++++++++++++++++++++++++++-
 1 file changed, 105 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index fe53e0b..ba4dc230 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2770,8 +2770,8 @@
 				 <&mdss_dsi_phy 1>,
 				 <0>,
 				 <0>,
-				 <0>,
-				 <0>;
+				 <&mdss_edp_phy 0>,
+				 <&mdss_edp_phy 1>;
 			clock-names = "bi_tcxo",
 				      "gcc_disp_gpll0_clk",
 				      "dsi0_phy_pll_out_byteclk",
@@ -2859,6 +2859,13 @@
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
@@ -2974,6 +2981,102 @@
 
 				status = "disabled";
 			};
+
+			mdss_edp: edp@aea0000 {
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
+				assigned-clock-parents = <&mdss_edp_phy 0>, <&mdss_edp_phy 1>;
+
+				phys = <&mdss_edp_phy>;
+				phy-names = "dp";
+
+				operating-points-v2 = <&edp_opp_table>;
+				power-domains = <&rpmhpd SC7280_CX>;
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
+			mdss_edp_phy: phy@aec2a00 {
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
-- 
2.7.4

