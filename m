Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A893962E8AF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 23:50:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26FC10E6B9;
	Thu, 17 Nov 2022 22:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDFEF10E6B3;
 Thu, 17 Nov 2022 22:50:01 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AHMbFHT030316; Thu, 17 Nov 2022 22:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=T537qOo17geAOmu1pZD6rtKP19DhOxpquTefBQYKx28=;
 b=DWG4h6e2djfb0NT4vrGgpg9uni/sk0txgY5Qb4bUdIJBaarRs3943jo6utrmRr7Z4oSS
 FO0UKc8WEVwX8xr84xRjATHX16UD9ypu9+4asvQp4sM2HFmAEYkseoU6bsdk7zbjUqVt
 sWKhOID182dtVUUMQiJLBRzKO/d3HE/S+kB7W2yG8ABhqS4oIm85uRDTicLmzvh2/S31
 N5z/JtK0GgtPNMpHRikY3HoQm5UFCbL9RSmYWt5hcOI/KL9qG48t7Q3ABdmVNo5Hbh7K
 AalnClLt7X7GZQeqUTS0+KmPIemHSD1z2x4jnUzeGZO4sGpxQiwTjZvy+SguHXGjDzmX 4A== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kwwwmg0s4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Nov 2022 22:49:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AHMnsCQ005826
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Nov 2022 22:49:54 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 17 Nov 2022 14:49:53 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH v3 1/2] arm64: dts: qcom: add data-lanes and link-freuencies
 into dp_out endpoint
Date: Thu, 17 Nov 2022 14:49:28 -0800
Message-ID: <1668725369-6331-2-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1668725369-6331-1-git-send-email-quic_khsieh@quicinc.com>
References: <1668725369-6331-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 0kF-fTS6BwVMMUgY7jeFxII5pAUvd-G2
X-Proofpoint-GUID: 0kF-fTS6BwVMMUgY7jeFxII5pAUvd-G2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_06,2022-11-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 mlxlogscore=997
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211170161
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add both data-lanes and link-frequencies property to dp_out endpoint.
Also set link-frequencies to 810000 khz at herobrine platform to have
max link rate limited at 810000 khz (HBR3).

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi   |  9 ++++++++-
 arch/arm64/boot/dts/qcom/sc7180.dtsi           |  5 -----
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 10 +++++++++-
 arch/arm64/boot/dts/qcom/sc7280.dtsi           |  5 -----
 4 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 754d2d6..6bf57fc 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -812,7 +812,14 @@ hp_i2c: &i2c9 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&dp_hot_plug_det>;
-	data-lanes = <0 1>;
+	ports {
+		port@1 {
+			reg = <1>;
+			dp_out: endpoint {
+				data-lanes = <0 1>;
+			};
+		};
+	};
 };
 
 &pm6150_adc {
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index c0f6bfd..def5521 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3116,11 +3116,6 @@
 							remote-endpoint = <&dpu_intf0_out>;
 						};
 					};
-
-					port@1 {
-						reg = <1>;
-						dp_out: endpoint { };
-					};
 				};
 
 				dp_opp_table: opp-table {
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 93e39fc..e8fca18 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -440,7 +440,15 @@ ap_i2c_tpm: &i2c14 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&dp_hot_plug_det>;
-	data-lanes = <0 1>;
+	ports {
+		port@1 {
+			reg = <1>;
+			dp_out: endpoint {
+				data-lanes = <0 1>;
+				link-frequencies=<810000>;
+			};
+		};
+	};
 };
 
 &mdss_mdp {
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index a646405..4afe53b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3899,11 +3899,6 @@
 							remote-endpoint = <&dpu_intf0_out>;
 						};
 					};
-
-					port@1 {
-						reg = <1>;
-						dp_out: endpoint { };
-					};
 				};
 
 				dp_opp_table: opp-table {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

