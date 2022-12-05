Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B545642F47
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 18:45:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5014210E28D;
	Mon,  5 Dec 2022 17:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB0310E272;
 Mon,  5 Dec 2022 17:44:52 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B5FkaQ6016729; Mon, 5 Dec 2022 17:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=cPiUdWDuVl+ENxM6MKCuI5USol1Cbx+rOSHjW09DJOM=;
 b=aT6tCe+EPOIHjnTTG3JxTF5zNEzxEOECgdzf4F5PTVgsVvxssu4+XiHXc95HIRx+R3tU
 HjSuhHCC9RfwVFFkAkn6CZbsXsbXjUw1VM4c6IP2t6IAKnW8x6QVxufi1sgsZge5wobu
 0WmMUfc3uN/D72GcCUNeH3qqurpiRZPrJGjb+Fu/+cJ+XMrwlf+KMilVegbnHWpnFN2I
 6Tf8sfHaRZRjIOxw3BhRt/vNws/F3qDX6ey7j0A6PUY+a8MFkHJZmtM3iB9tu88oNpe/
 fMdJrOx4OwauaNtYkGzjHacyCp9bfUprIYbl1MxGFse5mfTrB95cWHmImQcyediTi1yW lw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m7v5md2aj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Dec 2022 17:44:47 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B5HikBw001233
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 5 Dec 2022 17:44:46 GMT
Received: from th-lint-050.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 5 Dec 2022 09:44:45 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 11/13] arm64: dts: qcom: sc8280xp: Define some of the
 display blocks
Date: Mon, 5 Dec 2022 09:44:31 -0800
Message-ID: <20221205174433.16847-12-quic_bjorande@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221205174433.16847-1-quic_bjorande@quicinc.com>
References: <20221205174433.16847-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: jdjRzRkySA_8QcyWgbRl4u4dMt45g43j
X-Proofpoint-GUID: jdjRzRkySA_8QcyWgbRl4u4dMt45g43j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-05_01,2022-12-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212050146
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Define the display clock controllers, the MDSS instances, the DP phys
and connect these together.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---

I did not add the USB-related DP controllers back into this patch. Will send
that separately once I've validated those again.

Changes since v3:
- None

 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 838 +++++++++++++++++++++++++
 1 file changed, 838 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 9f3132ac2857..c2f186495506 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -4,6 +4,7 @@
  * Copyright (c) 2022, Linaro Limited
  */
 
+#include <dt-bindings/clock/qcom,dispcc-sc8280xp.h>
 #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/interconnect/qcom,sc8280xp.h>
@@ -1698,6 +1699,44 @@ usb_1_qmpphy: phy@8903000 {
 			status = "disabled";
 		};
 
+		mdss1_dp0_phy: phy@8909a00 {
+			compatible = "qcom,sc8280xp-dp-phy";
+			reg = <0 0x08909a00 0 0x19c>,
+			      <0 0x08909200 0 0xec>,
+			      <0 0x08909600 0 0xec>,
+			      <0 0x08909000 0 0x1c8>;
+
+			clocks = <&dispcc1 DISP_CC_MDSS_DPTX0_AUX_CLK>,
+				 <&dispcc1 DISP_CC_MDSS_AHB_CLK>;
+			clock-names = "aux", "cfg_ahb";
+
+			power-domains = <&rpmhpd SC8280XP_MX>;
+
+			#clock-cells = <1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		mdss1_dp1_phy: phy@890ca00 {
+			compatible = "qcom,sc8280xp-dp-phy";
+			reg = <0 0x0890ca00 0 0x19c>,
+			      <0 0x0890c200 0 0xec>,
+			      <0 0x0890c600 0 0xec>,
+			      <0 0x0890c000 0 0x1c8>;
+
+			clocks = <&dispcc1 DISP_CC_MDSS_DPTX1_AUX_CLK>,
+				 <&dispcc1 DISP_CC_MDSS_AHB_CLK>;
+			clock-names = "aux", "cfg_ahb";
+
+			power-domains = <&rpmhpd SC8280XP_MX>;
+
+			#clock-cells = <1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		system-cache-controller@9200000 {
 			compatible = "qcom,sc8280xp-llcc";
 			reg = <0 0x09200000 0 0x58000>, <0 0x09600000 0 0x58000>;
@@ -1813,6 +1852,326 @@ usb_1_dwc3: usb@a800000 {
 			};
 		};
 
+		mdss0: display-subsystem@ae00000 {
+			compatible = "qcom,sc8280xp-mdss";
+			reg = <0 0x0ae00000 0 0x1000>;
+			reg-names = "mdss";
+
+			power-domains = <&dispcc0 MDSS_GDSC>;
+
+			clocks = <&gcc GCC_DISP_AHB_CLK>,
+				 <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
+				 <&dispcc0 DISP_CC_MDSS_MDP_CLK>;
+			clock-names = "iface",
+				      "ahb",
+				      "core";
+
+			resets = <&dispcc0 DISP_CC_MDSS_CORE_BCR>;
+
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>,
+					<&mmss_noc MASTER_MDP1 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "mdp0-mem", "mdp1-mem";
+
+			iommus = <&apps_smmu 0x1000 0x402>;
+
+			status = "disabled";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			mdss0_mdp: display-controller@ae01000 {
+				compatible = "qcom,sc8280xp-dpu";
+				reg = <0 0x0ae01000 0 0x8f000>,
+				      <0 0x0aeb0000 0 0x2008>;
+				reg-names = "mdp", "vbif";
+
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&gcc GCC_DISP_SF_AXI_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "bus",
+					      "nrt_bus",
+					      "iface",
+					      "lut",
+					      "core",
+					      "vsync";
+
+				assigned-clocks = <&dispcc0 DISP_CC_MDSS_MDP_CLK>,
+						  <&dispcc0 DISP_CC_MDSS_VSYNC_CLK>;
+				assigned-clock-rates = <460000000>,
+						       <19200000>;
+
+				operating-points-v2 = <&mdss0_mdp_opp_table>;
+				power-domains = <&rpmhpd SC8280XP_MMCX>;
+
+				interrupt-parent = <&mdss0>;
+				interrupts = <0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@5 {
+						reg = <5>;
+						mdss0_intf5_out: endpoint {
+							remote-endpoint = <&mdss0_dp3_in>;
+						};
+					};
+
+					port@6 {
+						reg = <6>;
+						mdss0_intf6_out: endpoint {
+							remote-endpoint = <&mdss0_dp2_in>;
+						};
+					};
+				};
+
+				mdss0_mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-200000000 {
+						opp-hz = /bits/ 64 <200000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-300000000 {
+						opp-hz = /bits/ 64 <300000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-375000000 {
+						opp-hz = /bits/ 64 <375000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-500000000 {
+						opp-hz = /bits/ 64 <500000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+					opp-600000000 {
+						opp-hz = /bits/ 64 <600000000>;
+						required-opps = <&rpmhpd_opp_turbo_l1>;
+					};
+				};
+			};
+
+			mdss0_dp2: displayport-controller@ae9a000 {
+				compatible = "qcom,sc8280xp-dp";
+				reg = <0 0xae9a000 0 0x200>,
+				      <0 0xae9a200 0 0x200>,
+				      <0 0xae9a400 0 0x600>,
+				      <0 0xae9b000 0 0x400>;
+				interrupt-parent = <&mdss0>;
+				interrupts = <14>;
+				clocks = <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_DPTX2_AUX_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_DPTX2_LINK_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_DPTX2_LINK_INTF_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL0_CLK>;
+				clock-names = "core_iface", "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface", "stream_pixel";
+
+				assigned-clocks = <&dispcc0 DISP_CC_MDSS_DPTX2_LINK_CLK_SRC>,
+						  <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>;
+				assigned-clock-parents = <&mdss0_dp2_phy 0>, <&mdss0_dp2_phy 1>;
+
+				phys = <&mdss0_dp2_phy>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				operating-points-v2 = <&mdss0_dp2_opp_table>;
+				power-domains = <&rpmhpd SC8280XP_CX>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss0_dp2_in: endpoint {
+							remote-endpoint = <&mdss0_intf6_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+					};
+				};
+
+				mdss0_dp2_opp_table: opp-table {
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
+
+			mdss0_dp3: displayport-controller@aea0000 {
+				compatible = "qcom,sc8280xp-dp";
+				reg = <0 0xaea0000 0 0x200>,
+				      <0 0xaea0200 0 0x200>,
+				      <0 0xaea0400 0 0x600>,
+				      <0 0xaea1000 0 0x400>;
+				interrupt-parent = <&mdss0>;
+				interrupts = <15>;
+				clocks = <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_DPTX3_AUX_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_DPTX3_LINK_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_DPTX3_LINK_INTF_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_DPTX3_PIXEL0_CLK>;
+				clock-names = "core_iface", "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface", "stream_pixel";
+
+				assigned-clocks = <&dispcc0 DISP_CC_MDSS_DPTX3_LINK_CLK_SRC>,
+						  <&dispcc0 DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC>;
+				assigned-clock-parents = <&mdss0_dp3_phy 0>, <&mdss0_dp3_phy 1>;
+
+				phys = <&mdss0_dp3_phy>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				operating-points-v2 = <&mdss0_dp3_opp_table>;
+				power-domains = <&dispcc0 MDSS_GDSC>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss0_dp3_in: endpoint {
+							remote-endpoint = <&mdss0_intf5_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+					};
+				};
+
+				mdss0_dp3_opp_table: opp-table {
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
+		};
+
+		mdss0_dp2_phy: phy@aec2a00 {
+			compatible = "qcom,sc8280xp-dp-phy";
+			reg = <0 0x0aec2a00 0 0x19c>,
+			      <0 0x0aec2200 0 0xec>,
+			      <0 0x0aec2600 0 0xec>,
+			      <0 0x0aec2000 0 0x1c8>;
+
+			clocks = <&dispcc0 DISP_CC_MDSS_DPTX2_AUX_CLK>,
+				 <&dispcc0 DISP_CC_MDSS_AHB_CLK>;
+			clock-names = "aux", "cfg_ahb";
+
+			power-domains = <&rpmhpd SC8280XP_MX>;
+
+			#clock-cells = <1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		mdss0_dp3_phy: phy@aec5a00 {
+			compatible = "qcom,sc8280xp-dp-phy";
+			reg = <0 0x0aec5a00 0 0x19c>,
+			      <0 0x0aec5200 0 0xec>,
+			      <0 0x0aec5600 0 0xec>,
+			      <0 0x0aec5000 0 0x1c8>;
+
+			clocks = <&dispcc0 DISP_CC_MDSS_DPTX3_AUX_CLK>,
+				 <&dispcc0 DISP_CC_MDSS_AHB_CLK>;
+			clock-names = "aux", "cfg_ahb";
+
+			power-domains = <&rpmhpd SC8280XP_MX>;
+
+			#clock-cells = <1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		dispcc0: clock-controller@af00000 {
+			compatible = "qcom,sc8280xp-dispcc0";
+			reg = <0 0x0af00000 0 0x20000>;
+			clocks = <&gcc GCC_DISP_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&sleep_clk>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <&mdss0_dp2_phy 0>,
+				 <&mdss0_dp2_phy 1>,
+				 <&mdss0_dp3_phy 0>,
+				 <&mdss0_dp3_phy 1>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			power-domains = <&rpmhpd SC8280XP_MMCX>;
+			required-opps = <&rpmhpd_opp_nom>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+
+			status = "disabled";
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc8280xp-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
@@ -2425,6 +2784,485 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 				qcom,remote-pid = <12>;
 			};
 		};
+
+		mdss1: display-subsystem@22000000 {
+			compatible = "qcom,sc8280xp-mdss";
+			reg = <0 0x22000000 0 0x1000>;
+			reg-names = "mdss";
+
+			power-domains = <&dispcc1 MDSS_GDSC>;
+
+			clocks = <&gcc GCC_DISP_AHB_CLK>,
+				 <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
+				 <&dispcc1 DISP_CC_MDSS_MDP_CLK>;
+			clock-names = "iface",
+				      "ahb",
+				      "core";
+
+			resets = <&dispcc1 DISP_CC_MDSS_CORE_BCR>;
+
+			interrupts = <GIC_SPI 865 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			interconnects = <&mmss_noc MASTER_MDP_CORE1_0 0 &mc_virt SLAVE_EBI1 0>,
+					<&mmss_noc MASTER_MDP_CORE1_1 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "mdp0-mem", "mdp1-mem";
+
+			iommus = <&apps_smmu 0x1800 0x402>;
+
+			status = "disabled";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			mdss1_mdp: display-controller@22001000 {
+				compatible = "qcom,sc8280xp-dpu";
+				reg = <0 0x22001000 0 0x8f000>,
+				      <0 0x220b0000 0 0x2008>;
+				reg-names = "mdp", "vbif";
+
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&gcc GCC_DISP_SF_AXI_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "bus",
+					      "nrt_bus",
+					      "iface",
+					      "lut",
+					      "core",
+					      "vsync";
+
+				assigned-clocks = <&dispcc1 DISP_CC_MDSS_MDP_CLK>,
+						  <&dispcc1 DISP_CC_MDSS_VSYNC_CLK>;
+				assigned-clock-rates = <460000000>,
+						       <19200000>;
+
+				operating-points-v2 = <&mdss1_mdp_opp_table>;
+				power-domains = <&rpmhpd SC8280XP_MMCX>;
+
+				interrupt-parent = <&mdss1>;
+				interrupts = <0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss1_intf0_out: endpoint {
+							remote-endpoint = <&mdss1_dp0_in>;
+						};
+					};
+
+					port@4 {
+						reg = <4>;
+						mdss1_intf4_out: endpoint {
+							remote-endpoint = <&mdss1_dp1_in>;
+						};
+					};
+
+					port@5 {
+						reg = <5>;
+						mdss1_intf5_out: endpoint {
+							remote-endpoint = <&mdss1_dp3_in>;
+						};
+					};
+
+					port@6 {
+						reg = <6>;
+						mdss1_intf6_out: endpoint {
+							remote-endpoint = <&mdss1_dp2_in>;
+						};
+					};
+				};
+
+				mdss1_mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-200000000 {
+						opp-hz = /bits/ 64 <200000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-300000000 {
+						opp-hz = /bits/ 64 <300000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-375000000 {
+						opp-hz = /bits/ 64 <375000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-500000000 {
+						opp-hz = /bits/ 64 <500000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+					opp-600000000 {
+						opp-hz = /bits/ 64 <600000000>;
+						required-opps = <&rpmhpd_opp_turbo_l1>;
+					};
+				};
+			};
+
+			mdss1_dp0: displayport-controller@22090000 {
+				compatible = "qcom,sc8280xp-dp";
+				reg = <0 0x22090000 0 0x200>,
+				      <0 0x22090200 0 0x200>,
+				      <0 0x22090400 0 0x600>,
+				      <0 0x22091000 0 0x400>;
+				interrupt-parent = <&mdss1>;
+				interrupts = <12>;
+				clocks = <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_DPTX0_LINK_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+				clock-names = "core_iface", "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface", "stream_pixel";
+
+				assigned-clocks = <&dispcc1 DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+						  <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
+				assigned-clock-parents = <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>;
+
+				phys = <&mdss1_dp0_phy>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				operating-points-v2 = <&mdss1_dp0_opp_table>;
+				power-domains = <&rpmhpd SC8280XP_CX>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss1_dp0_in: endpoint {
+							remote-endpoint = <&mdss1_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+					};
+				};
+
+				mdss1_dp0_opp_table: opp-table {
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
+
+			};
+
+			mdss1_dp1: displayport-controller@22098000 {
+				compatible = "qcom,sc8280xp-dp";
+				reg = <0 0x22098000 0 0x200>,
+				      <0 0x22098200 0 0x200>,
+				      <0 0x22098400 0 0x600>,
+				      <0 0x22099000 0 0x400>;
+				interrupt-parent = <&mdss1>;
+				interrupts = <13>;
+				clocks = <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_DPTX1_AUX_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_DPTX1_LINK_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL0_CLK>;
+				clock-names = "core_iface", "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface", "stream_pixel";
+
+				assigned-clocks = <&dispcc1 DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
+						  <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>;
+				assigned-clock-parents = <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>;
+
+				phys = <&mdss1_dp1_phy>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				operating-points-v2 = <&mdss1_dp1_opp_table>;
+				power-domains = <&rpmhpd SC8280XP_CX>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss1_dp1_in: endpoint {
+							remote-endpoint = <&mdss1_intf4_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+					};
+				};
+
+				mdss1_dp1_opp_table: opp-table {
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
+
+			mdss1_dp2: displayport-controller@2209a000 {
+				compatible = "qcom,sc8280xp-dp";
+				reg = <0 0x2209a000 0 0x200>,
+				      <0 0x2209a200 0 0x200>,
+				      <0 0x2209a400 0 0x600>,
+				      <0 0x2209b000 0 0x400>;
+				interrupt-parent = <&mdss1>;
+				interrupts = <14>;
+				clocks = <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_DPTX2_AUX_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_DPTX2_LINK_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_DPTX2_LINK_INTF_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL0_CLK>;
+				clock-names = "core_iface", "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface", "stream_pixel";
+
+				assigned-clocks = <&dispcc1 DISP_CC_MDSS_DPTX2_LINK_CLK_SRC>,
+						  <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>;
+				assigned-clock-parents = <&mdss1_dp2_phy 0>, <&mdss1_dp2_phy 1>;
+
+				phys = <&mdss1_dp2_phy>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				operating-points-v2 = <&mdss1_dp2_opp_table>;
+				power-domains = <&rpmhpd SC8280XP_CX>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss1_dp2_in: endpoint {
+							remote-endpoint = <&mdss1_intf6_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+					};
+				};
+
+				mdss1_dp2_opp_table: opp-table {
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
+
+			mdss1_dp3: displayport-controller@220a0000 {
+				compatible = "qcom,sc8280xp-dp";
+				reg = <0 0x220a0000 0 0x200>,
+				      <0 0x220a0200 0 0x200>,
+				      <0 0x220a0400 0 0x600>,
+				      <0 0x220a1000 0 0x400>;
+				interrupt-parent = <&mdss1>;
+				interrupts = <15>;
+				clocks = <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_DPTX3_AUX_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_DPTX3_LINK_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_DPTX3_LINK_INTF_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_DPTX3_PIXEL0_CLK>;
+				clock-names = "core_iface", "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface", "stream_pixel";
+
+				assigned-clocks = <&dispcc1 DISP_CC_MDSS_DPTX3_LINK_CLK_SRC>,
+						  <&dispcc1 DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC>;
+				assigned-clock-parents = <&mdss1_dp3_phy 0>, <&mdss1_dp3_phy 1>;
+
+				phys = <&mdss1_dp3_phy>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				operating-points-v2 = <&mdss1_dp3_opp_table>;
+				power-domains = <&rpmhpd SC8280XP_CX>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss1_dp3_in: endpoint {
+							remote-endpoint = <&mdss1_intf5_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+					};
+				};
+
+				mdss1_dp3_opp_table: opp-table {
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
+		};
+
+		mdss1_dp2_phy: phy@220c2a00 {
+			compatible = "qcom,sc8280xp-dp-phy";
+			reg = <0 0x220c2a00 0 0x19c>,
+			      <0 0x220c2200 0 0xec>,
+			      <0 0x220c2600 0 0xec>,
+			      <0 0x220c2000 0 0x1c8>;
+
+			clocks = <&dispcc1 DISP_CC_MDSS_DPTX2_AUX_CLK>,
+				 <&dispcc1 DISP_CC_MDSS_AHB_CLK>;
+			clock-names = "aux", "cfg_ahb";
+
+			power-domains = <&rpmhpd SC8280XP_MX>;
+
+			#clock-cells = <1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		mdss1_dp3_phy: phy@220c5a00 {
+			compatible = "qcom,sc8280xp-dp-phy";
+			reg = <0 0x220c5a00 0 0x19c>,
+			      <0 0x220c5200 0 0xec>,
+			      <0 0x220c5600 0 0xec>,
+			      <0 0x220c5000 0 0x1c8>;
+
+			clocks = <&dispcc1 DISP_CC_MDSS_DPTX3_AUX_CLK>,
+				 <&dispcc1 DISP_CC_MDSS_AHB_CLK>;
+			clock-names = "aux", "cfg_ahb";
+
+			power-domains = <&rpmhpd SC8280XP_MX>;
+
+			#clock-cells = <1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		dispcc1: clock-controller@22100000 {
+			compatible = "qcom,sc8280xp-dispcc1";
+			reg = <0 0x22100000 0 0x20000>;
+			clocks = <&gcc GCC_DISP_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <0>,
+				 <&mdss1_dp0_phy 0>,
+				 <&mdss1_dp0_phy 1>,
+				 <&mdss1_dp1_phy 0>,
+				 <&mdss1_dp1_phy 1>,
+				 <&mdss1_dp2_phy 0>,
+				 <&mdss1_dp2_phy 1>,
+				 <&mdss1_dp3_phy 0>,
+				 <&mdss1_dp3_phy 1>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			power-domains = <&rpmhpd SC8280XP_MMCX>;
+			required-opps = <&rpmhpd_opp_nom>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+
+			status = "disabled";
+		};
 	};
 
 	thermal-zones {
-- 
2.37.3

