Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F612C83040
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 02:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07FD810E344;
	Tue, 25 Nov 2025 01:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="H2xJD2p4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1897210E339;
 Tue, 25 Nov 2025 01:33:21 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AOJrr011090578; Tue, 25 Nov 2025 01:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=EMbAnnXe+hl
 AKawoAgGH8mvyEGnmlKzfDS8qlq2+dVE=; b=H2xJD2p4/4EFpBjzbpSuNOEs4Ff
 ibA4yN7hHNhR9tsyIKrSNqcrcs/Tm9Gh+Pak6jKciVwCKjC1Hl+qaBZ1sPS+MYpY
 5u+bgBAgCC2HIZfH99u4c3zjupAP7h5RdVEp5jmhA4rstLiu8FU9DoBj3yI/43V5
 2wGkJTxzU4H/G291uouB+DNU+p8hZEym1l4E2E6uWsWREOcDJwFNodXgE5R5C2+w
 3SlkJXbyBUEtjOzZ/oTg1bYCU2X5XLihwIxKViIjNM6NLvgxSdCpQYwnsw6TtO5c
 HSawNlYCyK8RvdQFTAKwvfELV+VUHYUbzz6TPAD7LLbATSS/fFocuLRDx2g==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amsst1j0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Nov 2025 01:33:09 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AP1X6GP027345; 
 Tue, 25 Nov 2025 01:33:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ak68mvfg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Nov 2025 01:33:06 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AP1X5T7027321;
 Tue, 25 Nov 2025 01:33:05 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com
 [10.213.99.91])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5AP1X5He027311
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Nov 2025 01:33:05 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
 id AF2565A4; Tue, 25 Nov 2025 07:03:04 +0530 (+0530)
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
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
Subject: [PATCH v3 4/5] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
Date: Tue, 25 Nov 2025 07:03:01 +0530
Message-Id: <20251125013302.3835909-5-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125013302.3835909-1-quic_amakhija@quicinc.com>
References: <20251125013302.3835909-1-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=bM0b4f+Z c=1 sm=1 tr=0 ts=69250755 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=1g-yL74UmBKldWw2PtEA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6Ug7YkMFf53pzKcelmrct9NZEjtSJhyR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDAxMSBTYWx0ZWRfXzknds28oqiSB
 FRSFkgGNmLwUWcFRqsIizHZRC84FVauty4q3lKrTvLggaWI2lql59TAIb4dpBamw9vnkgcRp/lD
 dBFWQSplC+DI1WaVcl/zJZ3nfhcs9jg2kHMqIb24CaBdMZvpLovNymL5qM+L5xssdyC9m1FSg9O
 8iLRl0jPrnBX+xXxi5W1tcwA+uHlC/Ovw7/IxeM6ZEBzsDZsSY7pVbYw7k0rFmsOtJHQBKZNQT1
 GzT6aExjPTDmQ3q/OuB+tO0yYcYFFaCIvuY+OWUGFmbK75KW/BHVtibWPKx250IpaoijLihi6Hu
 NjI4gNJwdAiruevZGmJCLVmaoho8RBAIWu2tp2zrDuI8nYYKa8ePLCNZ+pQgrocpyOEll9hvACW
 622GbL7uRk77xHIfz+sRpyjp9rTgTg==
X-Proofpoint-ORIG-GUID: 6Ug7YkMFf53pzKcelmrct9NZEjtSJhyR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250011
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 98 +++++++++++++++++++++++++++-
 1 file changed, 97 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index e44fd5c33816..82e1ab1b2e62 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
@@ -4861,6 +4862,13 @@ dpu_intf0_out: endpoint {
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
@@ -4888,6 +4896,92 @@ opp-650000000 {
 				};
 			};
 
+			mdss_dsi0: dsi@ae94000 {
+				compatible = "qcom,qcs8300-dsi-ctrl",
+					     "qcom,sa8775p-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
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
+				compatible = "qcom,qcs8300-dsi-phy-5nm",
+					     "qcom,sa8775p-dsi-phy-5nm";
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
 
@@ -5015,7 +5109,9 @@ dispcc: clock-controller@af00000 {
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

