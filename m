Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD06A43F26
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 13:19:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E18010E678;
	Tue, 25 Feb 2025 12:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="MbE9xlnY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B05F10E662;
 Tue, 25 Feb 2025 12:18:48 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8Fbrp030174;
 Tue, 25 Feb 2025 12:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Eh+JTm9jQ8D
 Sd3ImsdnoomCRpMDnUsaYSUlaPU1wMhw=; b=MbE9xlnYxtxIWGgJ4fZfGIaXsTN
 dAThnrPSJ0Ai4m7wCt9BmP1CMXG2I8taMM7J4O/0aIrpnZHtYSxwaVc7yDdIRX8j
 MSsduovD0urQuIsouc4/jNAaSbaQ0nsrq2F45xqW0L6m+pQO9gwB9YXmCb2ZFUgH
 LCDMM0FS+aQ9CytHudEj2i31kX+ppKP3CjDfLnoSir20oz8HTd74DX26Zub2cQBZ
 oeYR3DmLUw4Nzi3Yon31Xx1YvEH+NorRJ+dMsB76+TW5o3vWj7/XGwh44Rf1s/Jf
 oefEFxKwSOJ2LdK3N9VEVDK+9XOV3QC+ZVFnsyZGenaj2z9BOAgQ4zXzixA==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y49egya0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Feb 2025 12:18:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51PCIYYg004545; 
 Tue, 25 Feb 2025 12:18:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 44y7nkx1yc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Feb 2025 12:18:34 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51PCIYAQ004513;
 Tue, 25 Feb 2025 12:18:34 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com
 [10.213.99.91])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 51PCIYbf004501
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Feb 2025 12:18:34 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
 id A315A58B; Tue, 25 Feb 2025 17:48:32 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: [PATCH 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI to DP
 bridge nodes
Date: Tue, 25 Feb 2025 17:48:20 +0530
Message-Id: <20250225121824.3869719-8-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: _SL81gX0XeJnKqcA5a3whcdoQQugG1TX
X-Proofpoint-GUID: _SL81gX0XeJnKqcA5a3whcdoQQugG1TX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502250086
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

Add anx7625 DSI to DP bridge device nodes.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 136 ++++++++++++++++++++-
 1 file changed, 135 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 175f8b1e3b2d..151f66512303 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -517,9 +517,128 @@ &i2c11 {
 
 &i2c18 {
 	clock-frequency = <400000>;
-	pinctrl-0 = <&qup_i2c18_default>;
+	pinctrl-0 = <&qup_i2c18_default>,
+			<&io_expander_intr_active>,
+			<&io_expander_reset_active>;
 	pinctrl-names = "default";
+
 	status = "okay";
+
+	io_expander: gpio@74 {
+		compatible = "ti,tca9539";
+		reg = <0x74>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <98 IRQ_TYPE_EDGE_BOTH>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		pinctrl-0 = <&dsi0_int_pin>,
+				<&dsi0_cbl_det_pin>,
+				<&dsi1_int_pin>,
+				<&dsi1_cbl_det_pin>;
+		pinctrl-names = "default";
+
+		dsi0_int_pin: gpio2_cfg {
+			pins = "gpio2";
+			input-enable;
+			bias-disable;
+		};
+
+		dsi0_cbl_det_pin: gpio3_cfg {
+			pins = "gpio3";
+			bias-pull-down;
+		};
+
+		dsi1_int_pin: gpio10_cfg {
+			pins = "gpio10";
+			input-enable;
+			bias-disable;
+		};
+
+		dsi1_cbl_det_pin: gpio11_cfg {
+			pins = "gpio11";
+			bias-pull-down;
+		};
+	};
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9543";
+		#address-cells = <1>;
+
+		#size-cells = <0>;
+		reg = <0x70>;
+
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			anx_bridge_1: anx7625@58 {
+				compatible = "analogix,anx7625";
+				reg = <0x58>;
+				interrupt-parent = <&io_expander>;
+				interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
+				enable-gpios = <&io_expander 1 0>;
+				reset-gpios = <&io_expander 0 0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					dsi2dp_bridge_1_in: port@0 {
+						reg = <0>;
+
+						anx7625_1_in: endpoint {
+							remote-endpoint = <&mdss0_dsi0_out>;
+						};
+					};
+
+					dsi2dp_bridge_1_out: port@1 {
+						reg = <1>;
+
+						anx7625_1_out: endpoint { };
+					};
+				};
+			};
+		};
+
+		i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			anx_bridge_2: anx7625@58 {
+				compatible = "analogix,anx7625";
+				reg = <0x58>;
+				interrupt-parent = <&io_expander>;
+				interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
+				enable-gpios = <&io_expander 9 0>;
+				reset-gpios = <&io_expander 8 0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					dsi2dp_bridge_2_in: port@0 {
+						reg = <0>;
+
+						anx7625_2_in: endpoint {
+							remote-endpoint = <&mdss0_dsi1_out>;
+						};
+					};
+
+					dsi2dp_bridge_2_out: port@1 {
+						reg = <1>;
+
+						anx7625_2_out: endpoint { };
+					};
+				};
+			};
+		};
+	};
+
 };
 
 &mdss0 {
@@ -714,6 +833,21 @@ ethernet0_mdio: ethernet0-mdio-pins {
 		};
 	};
 
+	io_expander_intr_active: io-expander-intr-active-state {
+		pins = "gpio98";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	io_expander_reset_active: io-expander-reset-active-state {
+		pins = "gpio97";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
 	qup_uart10_default: qup-uart10-state {
 		pins = "gpio46", "gpio47";
 		function = "qup1_se3";
-- 
2.34.1

