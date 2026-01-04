Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4EDCF1084
	for <lists+dri-devel@lfdr.de>; Sun, 04 Jan 2026 14:48:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C69810E215;
	Sun,  4 Jan 2026 13:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="VqbYuYpL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4352210E0EE;
 Sun,  4 Jan 2026 13:48:00 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6044RWhB3174908; Sun, 4 Jan 2026 13:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=/4F526mnmA1
 dpNXOIzVljAysEGPsj7fLjWpRMm6pkqk=; b=VqbYuYpLOON65mpDBgQ44UW+KU7
 yAP3sUTOs3wS2lRy2GFHzuxVnq4r6Tjla06qNs8r8Nq6tP9zzz7RaJGeqkMbssdi
 NK+pOvai0fAC1G9GGpWJMEoNxThIb1ZzJFLqDCX+K+K5tu2syglgRqR7U+QZSCol
 6mNMBu+0P0OwcSPXiBRtIgdqWKCbHWzjFJAgsFl6nIflFCL16uOnpfSi9zbAHEUB
 dOXTgw8OFkpsh1e7o5DYCp7hO3by2att9jvJS7UkvKhizJ4rB/R6Sztp5mJTAzAi
 I0vY1RbLVE/WqhtDzHvXBPiuecSM5WPpJfLQvY717cqTRCJnHTiipG1UVkA==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bev9ha0nt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 04 Jan 2026 13:47:51 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 604DilrW017229; 
 Sun, 4 Jan 2026 13:47:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4bev6kkx49-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 04 Jan 2026 13:44:48 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 604DimLC017250;
 Sun, 4 Jan 2026 13:44:48 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com
 [10.213.99.91])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 604DimdT017249
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 04 Jan 2026 13:44:48 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
 id 9D8395A5; Sun,  4 Jan 2026 19:14:46 +0530 (+0530)
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
Subject: [PATCH v5 5/5] arm64: dts: qcom: qcs8300-ride: add anx7625 DSI to DP
 bridge node
Date: Sun,  4 Jan 2026 19:14:42 +0530
Message-Id: <20260104134442.732876-6-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260104134442.732876-1-quic_amakhija@quicinc.com>
References: <20260104134442.732876-1-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA0MDEyNyBTYWx0ZWRfX1hHvRqLKg8BI
 Ei51k4LVYZSrxT57icN/jaq2RqYBUvrK2Wrl8mAoAKiZh+0ZvDCKHoEsmIWwqlScYCtNPfMtfC8
 rBKClnogTCfT3eZQ+o+zOGOec9+nhUvyOoocnQAnpHQblgSuDui4eAMhOvwqR60ULnwk6VFILCw
 2o1QfgaZad6yyZG6QlSxSFkfQfS+FaS0NBQrmQsuPAterCizls5H89BuQGiRCX0PlNhbK5N/K5S
 Y464eIDanRgBaTNEajKhjRB0PcSeqtPU+30mw+yBw+dv9GFVU7gUAgFK3Q6qNLX3E/5lBIMTqcL
 4o9ULYyFu3pyQwoHg4MEXo3aJH/hjEqIINAB31XOYzA/M7EAndR2DQfbnuNwdQiKstI7Tfla8XH
 cHA43HJR+kICT6LjYg23395rhu5kTlfLjJgZCOGTg1FKuBoDjquye2ZEowqzwoRrbDrH0AsFpIx
 uOo7jL5W/bVlaGRuPTw==
X-Proofpoint-GUID: NUbxEqFgbk1ewQUO5Nsz54OE9DatwLAm
X-Authority-Analysis: v=2.4 cv=RrbI7SmK c=1 sm=1 tr=0 ts=695a6f87 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=PkzH0pPD3_lowiemrhkA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: NUbxEqFgbk1ewQUO5Nsz54OE9DatwLAm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-04_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601040127
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 177 ++++++++++++++++++++++
 1 file changed, 177 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 4a8ac26846c6..8d324bf85e4d 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -24,6 +24,69 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	vreg_12p0: regulator-vreg-12p0 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_12P0";
+
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_5p0: regulator-vreg-5p0 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_5P0";
+
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		vin-supply = <&vreg_12p0>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_1p8: regulator-vreg-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_1P8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		vin-supply = <&vreg_5p0>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_1p0: regulator-vreg-1p0 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_1P0";
+
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1000000>;
+
+		vin-supply = <&vreg_1p8>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_3p0: regulator-vreg-3p0 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_3P0";
+
+		regulator-min-microvolt = <3000000>;
+		regulator-max-microvolt = <3000000>;
+
+		vin-supply = <&vreg_12p0>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	dp0-connector {
 		compatible = "dp-connector";
 		label = "DP0";
@@ -36,6 +99,18 @@ dp0_connector_in: endpoint {
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
@@ -316,6 +391,73 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcs8300/a623_zap.mbn";
 };
 
+&i2c8 {
+	clock-frequency = <400000>;
+
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
+		reg = <0x70>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
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
+
+							remote-endpoint = <&mdss_dsi0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dsi2dp_bridge_out: endpoint {
+
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
@@ -353,10 +495,31 @@ &mdss_dp0_phy {
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
@@ -414,6 +577,20 @@ ethernet0_mdio: ethernet0-mdio-pins {
 		};
 	};
 
+	io_expander_reset_active: io-expander-reset-active-state {
+		pins = "gpio66";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	io_expander_intr_active: io-expander-intr-active-state {
+		pins = "gpio93";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	dp_hot_plug_det: dp-hot-plug-det-state {
 		pins = "gpio94";
 		function = "edp0_hot";
-- 
2.34.1

