Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 223EAB9D76C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 07:36:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92F210E287;
	Thu, 25 Sep 2025 05:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="jWhaucmV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD18010E26B;
 Thu, 25 Sep 2025 05:36:20 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P4auhT028512;
 Thu, 25 Sep 2025 05:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=yobxXNa/fro
 SgE+YMNFVJpLBB2EAvaFBepQbx5Zmc3M=; b=jWhaucmVqtNcBZ+ehgFVqqvMRZA
 rAWhDSnYcPZVHvYJrkotDPHgr2lfJJ7CJ8OsAHhbeSg79Xe4G6O8agy7Lv39otkl
 F/PQppks39dIH9JWUMNbYo+h4JboP/H7gsGmcw4EO4IL5X2CO2vOFB1VJ2pt3uLr
 TmasyySQhK78vR3u9QWQdwVUwsGXq3Mpy+RZjQsBxaJYNLxiVmzESVS+Ck/i/d1X
 eIyKOyajfF2mmAcc5JjK/vv84EWQaopWOZpEau8RBtosHxY9BLDb4lJmma5s5F7T
 3nb8ncixwF8NgRiqxNVCXX8V2xP4fQXrpxSO2cAF9o/w5DmCa5n6p9rL+6g==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49cxup046j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Sep 2025 05:36:10 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 58P5a7nq000677; 
 Thu, 25 Sep 2025 05:36:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 499nbm8bwe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Sep 2025 05:36:07 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 58P5Yjcn031572;
 Thu, 25 Sep 2025 05:36:07 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com
 [10.213.99.91])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 58P5a6f5000656
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Sep 2025 05:36:07 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
 id 30B0959C; Thu, 25 Sep 2025 11:06:06 +0530 (+0530)
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
Subject: [PATCH 3/3] arm64: dts: qcom: qcs8300-ride: add anx7625 DSI to DP
 bridge node
Date: Thu, 25 Sep 2025 11:06:02 +0530
Message-Id: <20250925053602.4105329-4-quic_amakhija@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=B4a50PtM c=1 sm=1 tr=0 ts=68d4d4ca cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=PS1UjZDpBljCGRlzRBMA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDA0MiBTYWx0ZWRfX1JZ/aTcrww4o
 2gDmBqcBeooZW8KWe6nufqqSKK4ThUbXwN/rrwG37K3Q6GhGCK73v522NH+0QD+WcYV2ykzffbu
 JH/PGvR9nWG9EjQ38Dkeew8c8/q9t/CMaBYcuKdxTQVxB6eZcwvOcOgemTHWP6rlPmf0E7h/89D
 2MWQzNn3zZPTcamCos+02rQpspRULqdO7K/zJDGER6y7ZG8t+ZwVChqm6JfB7S6P/sg7ciWbLq5
 xS9MH3Y1YrEPk9X+jNi574o8n9z4TXW+a4tFkT8imJVIXTcEtW7onnSc/d62ljUVuNobfhjQ00v
 UKvSyDROldzlMEoKaTXPRpgVadbtmbXboNMTgwpm3Enbir140mCMbFQri9Hbwziyf3edPV1mvkw
 uiA7tV0L
X-Proofpoint-GUID: no2RLb3-7VDc7Vs2XrW85yfp5B6cdaIz
X-Proofpoint-ORIG-GUID: no2RLb3-7VDc7Vs2XrW85yfp5B6cdaIz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 phishscore=0 clxscore=1011 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509250042
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

Add anx7625 DSI to DP bridge device node.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 170 ++++++++++++++++++++++
 1 file changed, 170 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 891e49602c97..5d4040376857 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -24,6 +24,64 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	vreg_12p0: vreg-12p0-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_12P0";
+
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+
+	vreg_5p0: vreg-5p0-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_5P0";
+
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		vin-supply = <&vreg_12p0>;
+	};
+
+	vreg_1p8: vreg-1p8-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_1P8";
+
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		vin-supply = <&vreg_5p0>;
+	};
+
+	vreg_1p0: vreg-1p0-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_1P0";
+
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1000000>;
+
+		vin-supply = <&vreg_1p8>;
+	};
+
+	vreg_3p0: vreg-3p0-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_3P0";
+
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3000000>;
+		regulator-max-microvolt = <3000000>;
+
+		vin-supply = <&vreg_12p0>;
+	};
+
 	dp0-connector {
 		compatible = "dp-connector";
 		label = "DP0";
@@ -36,6 +94,18 @@ dp0_connector_in: endpoint {
 		};
 	};
 
+	dp-dsi0-connector {
+		compatible = "dp-connector";
+		label = "DSI0";
+		type = "full-size";
+
+		port {
+			dp_dsi0_connector_in: endpoint {
+				remote-endpoint = <&dsi2dp_bridge_out>;
+			};
+		};
+	};
+
 	regulator-usb2-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "USB2_VBUS";
@@ -316,6 +386,70 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcs8300/a623_zap.mbn";
 };
 
+&i2c8 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	io_expander: gpio@74 {
+		compatible = "ti,tca9539";
+		reg = <0x74>;
+		interrupts-extended = <&tlmm 93 IRQ_TYPE_EDGE_BOTH>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		reset-gpios = <&tlmm 66 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&io_expander_intr_active>,
+			    <&io_expander_reset_active>;
+		pinctrl-names = "default";
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
+			bridge@58 {
+				compatible = "analogix,anx7625";
+				reg = <0x58>;
+				interrupts-extended = <&io_expander 2 IRQ_TYPE_EDGE_FALLING>;
+				enable-gpios = <&io_expander 1 GPIO_ACTIVE_HIGH>;
+				reset-gpios = <&io_expander 0 GPIO_ACTIVE_HIGH>;
+				vdd10-supply = <&vreg_1p0>;
+				vdd18-supply = <&vreg_1p8>;
+				vdd33-supply = <&vreg_3p0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dsi2dp_bridge_in: endpoint {
+							remote-endpoint = <&mdss_dsi0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dsi2dp_bridge_out: endpoint {
+							remote-endpoint = <&dp_dsi0_connector_in>;
+						};
+					};
+				};
+			};
+		};
+	};
+};
+
 &pmm8650au_1_gpios {
 	usb2_en: usb2-en-state {
 		pins = "gpio7";
@@ -353,10 +487,31 @@ &mdss_dp0_phy {
 	status = "okay";
 };
 
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&dsi2dp_bridge_in>;
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
 
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/qcs8300/adsp.mbn";
 	status = "okay";
@@ -419,6 +574,21 @@ dp_hot_plug_det: dp-hot-plug-det-state {
 		function = "edp0_hot";
 		bias-disable;
 	};
+
+	io_expander_intr_active: io-expander-intr-active-state {
+		pins = "gpio93";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	io_expander_reset_active: io-expander-reset-active-state {
+		pins = "gpio66";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
 };
 
 &uart7 {
-- 
2.34.1

