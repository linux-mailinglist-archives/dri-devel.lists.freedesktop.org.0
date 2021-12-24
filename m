Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFD147EFFE
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 17:04:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D2D10E482;
	Fri, 24 Dec 2021 16:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521AC10E47F;
 Fri, 24 Dec 2021 16:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1640361846; x=1671897846;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Wv7jJX1SHuwVC/JoGmPA+fGTd5ja6twIN7Yv448daFE=;
 b=LyxUieFDxQLx9ObnE2lnCK0NWA9SDJ9ylkFJe8jWVzeRiSH58FMZn08X
 oXa4Aup2PyWqt5N1yWmhIyAsrwO+ADUAjsT2uniJrB9mXGOCWKAEkBpsZ
 jiVUBvh3veSdBNb/bNwRDKai2LRNNa6zAOjsUgQItqdZ0jo+S7YN4/7ac g=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 24 Dec 2021 08:04:06 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2021 08:04:05 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 24 Dec 2021 08:04:05 -0800
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 24 Dec 2021 08:03:59 -0800
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <agross@kernel.org>,
 <bjorn.andersson@linaro.org>, <robh+dt@kernel.org>
Subject: [PATCH v5 4/4] arm64: dts: qcom: sc7280: Add Display Port node
Date: Fri, 24 Dec 2021 21:33:13 +0530
Message-ID: <1640361793-26486-5-git-send-email-quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com, dianders@chromium.org,
 quic_abhinavk@quicinc.com, swboyd@chromium.org, seanpaul@chromium.org,
 quic_mkrishn@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kuogee Hsieh <quic_khsieh@quicinc.com>

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 90 +++++++++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index ba4dc230..b3a0111 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2768,8 +2768,8 @@
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
 				 <&mdss_dsi_phy 0>,
 				 <&mdss_dsi_phy 1>,
-				 <0>,
-				 <0>,
+				 <&dp_phy 0>,
+				 <&dp_phy 1>,
 				 <&mdss_edp_phy 0>,
 				 <&mdss_edp_phy 1>;
 			clock-names = "bi_tcxo",
@@ -2866,6 +2866,13 @@
 							remote-endpoint = <&edp_in>;
 						};
 					};
+
+					port@2 {
+                                                reg = <2>;
+                                                dpu_intf0_out: endpoint {
+                                                        remote-endpoint = <&dp_in>;
+                                                };
+                                        };
 				};
 
 				mdp_opp_table: opp-table {
@@ -3077,6 +3084,79 @@
 
 				status = "disabled";
 			};
+
+			mdss_dp: displayport-controller@ae90000 {
+				compatible = "qcom,sc7280-dp";
+
+				reg = <0 0x0ae90000 0 0x1400>;
+
+				interrupt-parent = <&mdss>;
+				interrupts = <12>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
+				clock-names =	"core_iface",
+						"core_aux",
+						"ctrl_link",
+						"ctrl_link_iface",
+						"stream_pixel";
+				#clock-cells = <1>;
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+				assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
+				phys = <&dp_phy>;
+				phy-names = "dp";
+
+				operating-points-v2 = <&dp_opp_table>;
+				power-domains = <&rpmhpd SC7280_CX>;
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					port@0 {
+						reg = <0>;
+						dp_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dp_out: endpoint { };
+					};
+				};
+
+				dp_opp_table: opp-table {
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
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
 		};
 
 		pdc: interrupt-controller@b220000 {
@@ -3179,6 +3259,12 @@
 				bias-pull-up;
 			};
 
+			dp_hot_plug_det: dp-hot-plug-det {
+				pins = "gpio47";
+				function = "dp_hot";
+				bias-disable;
+                        };
+
 			qspi_clk: qspi-clk {
 				pins = "gpio14";
 				function = "qspi_clk";
-- 
2.7.4

