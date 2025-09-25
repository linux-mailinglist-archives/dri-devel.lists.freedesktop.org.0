Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD70B9D778
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 07:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2D810E848;
	Thu, 25 Sep 2025 05:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="LyVtKZUs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79FE10E284;
 Thu, 25 Sep 2025 05:36:20 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P12k0R002657;
 Thu, 25 Sep 2025 05:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=yzNnfl7EJyP
 KB8gHA9RGcJIFQTJLRh8klkIx48fMJ+M=; b=LyVtKZUsNo72Hx66Pn6uuoZ73Qc
 IdH2UpmWkYeo1Ah6jj0h/OD+XAGFnsEgaKq4qgEYQu5WuynRdcle1pdatn90nea3
 G7fLisxIRs1yjuo8juR3ba3ZUM7cX5MqsBLFeX9ePEToBi9ul1Q2+Qcgr9UKL0H8
 qIOdPKxo7M+YUfv9XWPhRpPkNMjszFl/I3tlgjLbZAB18S447RK9aNjyxufxTC3A
 Nl+B3Tc4MMD+aiSl+Zc51cUz/lLdf4SyQFVMCwBmNyj1zeBAF9Flygibyk5khM3m
 w50hEc9aNuyS7PlzyaD6aYhhc1ubhhT27R3rebX5XZZMT/lUeqS+hA5boOQ==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajf1dta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Sep 2025 05:36:10 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 58P5a8Kc000689; 
 Thu, 25 Sep 2025 05:36:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 499nbm8bwk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Sep 2025 05:36:07 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 58P5Yjcp031572;
 Thu, 25 Sep 2025 05:36:07 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com
 [10.213.99.91])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 58P5a6ho000659
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Sep 2025 05:36:07 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
 id 2A9CB599; Thu, 25 Sep 2025 11:06:06 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
 dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Subject: [PATCH 2/3] arm64: dts: qcom: qcs8300: add Display Serial Interface
 device nodes
Date: Thu, 25 Sep 2025 11:06:01 +0530
Message-Id: <20250925053602.4105329-3-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925053602.4105329-1-quic_amakhija@quicinc.com>
References: <20250925053602.4105329-1-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: D_RoGu3GJcLuVG1mnHEc6XIRsqB2eW_n
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d4d4cb cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=1g-yL74UmBKldWw2PtEA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfX97f4FczTeujD
 iTnjS0/sUJxyqqEXt//A4bVXxEkteNk8ETGREU6HNSKoWH8shrUYeS8Q+prg2Z3slb4Gy6ML11b
 hhQlMu3cIn/5x85igC6TwWbg2VjBIZmTYm9EhYlNURoHqNI/uv0JtsYmh+TRwMnU58OJMLQNZh/
 Yu0UzFV/Bz5bPMfTmh1ztQi2sMp0WeOgRRTems4yjYN7zmcqpDabSIgE14/RyYA8CExq60ew9MU
 SNmqcUbC+L0+pcx70GTdavGtog7m1B5dmbzl5HtbjSgkVEfKi6OYj1AUP3R2oLY9BXV73FGtNQo
 nOCt3L7IhKuv2nuoxSCQu6d5af4lA3HaEb+pudeiOyoQc5xgJYGmAdfl3NpON5xJkUgAuDMgUqT
 Zm0nzh3/
X-Proofpoint-ORIG-GUID: D_RoGu3GJcLuVG1mnHEc6XIRsqB2eW_n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168
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

Add device tree nodes for the DSI0 controller with their corresponding
PHY found on Qualcomm QCS8300 SoC.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 95 ++++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index e0e1f63fc45b..834ae0522f2f 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
@@ -4854,6 +4855,13 @@ dpu_intf0_out: endpoint {
 							remote-endpoint = <&mdss_dp0_in>;
 						};
 					};
+
+					port@1 {
+						reg = <1>;
+						dpu_intf1_out: endpoint {
+							remote-endpoint = <&mdss_dsi0_in>;
+						};
+					};
 				};
 
 				mdp_opp_table: opp-table {
@@ -4881,6 +4889,89 @@ opp-650000000 {
 				};
 			};
 
+			mdss_dsi0: dsi@ae94000 {
+				compatible =  "qcom,sa8775p-dsi-ctrl","qcom,mdss-dsi-ctrl";
+				reg = <0x0 0x0ae94000 0x0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4>;
+
+				clocks = <&dispcc MDSS_DISP_CC_MDSS_BYTE0_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_PCLK0_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_ESC0_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
+
+				phys = <&mdss_dsi0_phy>;
+
+				operating-points-v2 = <&mdss_dsi_opp_table>;
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_dsi0_in: endpoint {
+							remote-endpoint = <&dpu_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdss_dsi0_out: endpoint {
+						};
+					};
+				};
+
+				mdss_dsi_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-358000000 {
+						opp-hz = /bits/ 64 <358000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+				};
+			};
+
+			mdss_dsi0_phy: phy@ae94400 {
+				compatible = "qcom,sa8775p-dsi-phy-5nm";
+				reg = <0x0 0x0ae94400 0x0 0x200>,
+				      <0x0 0x0ae94600 0x0 0x280>,
+				      <0x0 0x0ae94900 0x0 0x27c>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+
 			mdss_dp0_phy: phy@aec2a00 {
 				compatible = "qcom,qcs8300-edp-phy", "qcom,sa8775p-edp-phy";
 
@@ -5008,7 +5099,9 @@ dispcc: clock-controller@af00000 {
 				 <&mdss_dp0_phy 0>,
 				 <&mdss_dp0_phy 1>,
 				 <0>, <0>,
-				 <0>, <0>, <0>, <0>;
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <0>, <0>;
 			power-domains = <&rpmhpd RPMHPD_MMCX>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
-- 
2.34.1

