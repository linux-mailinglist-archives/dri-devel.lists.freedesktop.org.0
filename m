Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4F3642F4B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 18:46:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992FB10E29D;
	Mon,  5 Dec 2022 17:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FBE310E28B;
 Mon,  5 Dec 2022 17:45:01 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B5AoS5o008254; Mon, 5 Dec 2022 17:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=wH5cOMuiiP59X94HEpI86zLt7NpKR+wQSuj/qzwktXA=;
 b=B5Q806MIahPFzdZP/8E2LJrYtrYVAL6Nom2iKgPUkCAdI95aEiRLtECkOU2MqMDXYzvC
 2yrO1+g+hu1nbYW88rK7svtP6pqQxYbmFsODYrGMw2iv9a9QCtIRoIcNc2s9jkt81Xlv
 qqdreDs7bF6sGMarpj7YtrLHI+xpxrxxOiFS1QytvCD3jYJSTemvuLyNULm2kzMUe6/H
 m5m8qfMEqLura934PsNlWDWR7u/l0mSpTlfY98SV0KZ27hAMA1iZjaVH3dT20T/S0sYS
 J0LOormdXq4K+WiDoHEFEU/u6Z/nJynLSBp5vQDh3khsZ3G03NXGuE4JoyGacC+2cS00 9A== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m7wsr4gmy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Dec 2022 17:44:48 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B5HilAZ006277
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 5 Dec 2022 17:44:47 GMT
Received: from th-lint-050.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 5 Dec 2022 09:44:46 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 13/13] arm64: dts: qcom: sa8295-adp: Enable DP instances
Date: Mon, 5 Dec 2022 09:44:33 -0800
Message-ID: <20221205174433.16847-14-quic_bjorande@quicinc.com>
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
X-Proofpoint-ORIG-GUID: bTNWNEM1j7ckbfEm3csz82CFR5lSAXSM
X-Proofpoint-GUID: bTNWNEM1j7ckbfEm3csz82CFR5lSAXSM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-05_01,2022-12-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 mlxlogscore=913
 priorityscore=1501 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212050145
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

The SA8295P ADP has, among other interfaces, six MiniDP connectors which
are connected to MDSS0 DP2 and DP3, and MDSS1 DP0 through DP3.

Enable Display Clock controllers, MDSS instanced, MDPs, DP controllers,
DP PHYs and link them all together.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---

Changes since v3:
- None

 arch/arm64/boot/dts/qcom/sa8295p-adp.dts | 243 ++++++++++++++++++++++-
 1 file changed, 241 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
index 6c29d7d757e0..d55c8c5304cc 100644
--- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
@@ -23,6 +23,90 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	dp2-connector {
+		compatible = "dp-connector";
+		label = "DP2";
+		type = "mini";
+
+		hpd-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+
+		port {
+			dp2_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp0_phy_out>;
+			};
+		};
+	};
+
+	dp3-connector {
+		compatible = "dp-connector";
+		label = "DP3";
+		type = "mini";
+
+		hpd-gpios = <&tlmm 45 GPIO_ACTIVE_HIGH>;
+
+		port {
+			dp3_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp1_phy_out>;
+			};
+		};
+	};
+
+	edp0-connector {
+		compatible = "dp-connector";
+		label = "EDP0";
+		type = "mini";
+
+		hpd-gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
+
+		port {
+			edp0_connector_in: endpoint {
+				remote-endpoint = <&mdss0_dp2_phy_out>;
+			};
+		};
+	};
+
+	edp1-connector {
+		compatible = "dp-connector";
+		label = "EDP1";
+		type = "mini";
+
+		hpd-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+
+		port {
+			edp1_connector_in: endpoint {
+				remote-endpoint = <&mdss0_dp3_phy_out>;
+			};
+		};
+	};
+
+	edp2-connector {
+		compatible = "dp-connector";
+		label = "EDP2";
+		type = "mini";
+
+		hpd-gpios = <&tlmm 7 GPIO_ACTIVE_HIGH>;
+
+		port {
+			edp2_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp2_phy_out>;
+			};
+		};
+	};
+
+	edp3-connector {
+		compatible = "dp-connector";
+		label = "EDP3";
+		type = "mini";
+
+		hpd-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+
+		port {
+			edp3_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp3_phy_out>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -163,13 +247,168 @@ vreg_l7g: ldo7 {
 
 		vreg_l8g: ldo8 {
 			regulator-name = "vreg_l8g";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <880000>;
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11g: ldo11 {
+			regulator-name = "vreg_l11g";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
 };
 
+&dispcc0 {
+	status = "okay";
+};
+
+&dispcc1 {
+	status = "okay";
+};
+
+&mdss0 {
+	status = "okay";
+};
+
+&mdss0_dp2 {
+	status = "okay";
+
+	data-lanes = <0 1 2 3>;
+
+	ports {
+		port@1 {
+			reg = <1>;
+			mdss0_dp2_phy_out: endpoint {
+				remote-endpoint = <&edp0_connector_in>;
+			};
+		};
+	};
+};
+
+&mdss0_dp2_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l8g>;
+	vdda-pll-supply = <&vreg_l3g>;
+};
+
+&mdss0_dp3 {
+	status = "okay";
+
+	data-lanes = <0 1 2 3>;
+
+	ports {
+		port@1 {
+			reg = <1>;
+			mdss0_dp3_phy_out: endpoint {
+				remote-endpoint = <&edp1_connector_in>;
+			};
+		};
+	};
+};
+
+&mdss0_dp3_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l8g>;
+	vdda-pll-supply = <&vreg_l3g>;
+};
+
+&mdss1 {
+	status = "okay";
+};
+
+&mdss1_dp0 {
+	status = "okay";
+
+	data-lanes = <0 1 2 3>;
+
+	ports {
+		port@1 {
+			reg = <1>;
+			mdss1_dp0_phy_out: endpoint {
+				remote-endpoint = <&dp2_connector_in>;
+			};
+		};
+	};
+};
+
+&mdss1_dp0_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l11g>;
+	vdda-pll-supply = <&vreg_l3g>;
+};
+
+&mdss1_dp1 {
+	status = "okay";
+
+	data-lanes = <0 1 2 3>;
+
+	ports {
+		port@1 {
+			reg = <1>;
+			mdss1_dp1_phy_out: endpoint {
+				remote-endpoint = <&dp3_connector_in>;
+			};
+		};
+	};
+};
+
+&mdss1_dp1_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l11g>;
+	vdda-pll-supply = <&vreg_l3g>;
+};
+
+&mdss1_dp2 {
+	status = "okay";
+
+	data-lanes = <0 1 2 3>;
+
+	ports {
+		port@1 {
+			reg = <1>;
+			mdss1_dp2_phy_out: endpoint {
+				remote-endpoint = <&edp2_connector_in>;
+			};
+		};
+	};
+};
+
+&mdss1_dp2_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l11g>;
+	vdda-pll-supply = <&vreg_l3g>;
+};
+
+&mdss1_dp3 {
+	status = "okay";
+
+	data-lanes = <0 1 2 3>;
+
+	ports {
+		port@1 {
+			reg = <1>;
+			mdss1_dp3_phy_out: endpoint {
+				remote-endpoint = <&edp3_connector_in>;
+			};
+		};
+	};
+};
+
+&mdss1_dp3_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l11g>;
+	vdda-pll-supply = <&vreg_l3g>;
+};
+
 &pcie2a {
 	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
-- 
2.37.3

