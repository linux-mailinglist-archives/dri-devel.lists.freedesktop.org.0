Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CF762FA5F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 17:37:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A16710E76F;
	Fri, 18 Nov 2022 16:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D3610E76F;
 Fri, 18 Nov 2022 16:36:47 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AIFcuNW010364; Fri, 18 Nov 2022 16:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=mr1g6sl4FhzQuin8o/DMNTA7cuiMajxy6C/C+26lR5o=;
 b=F941xFz/dHkMgZT9PY5RmYnuesS6kWG+SLepdoKVav1NB5rbWrFhMPe1hvo0om0orKpY
 TuARPUQhyi3wJDeOo8h4PFHkhQAEHVqCeUFPLR6SZ5KjKbkN6uUf+YHvFvdvtUTH/xfP
 PHrA1/mq1ekKGLo7vnqRTqIU9GCHmvlQA258h9OE4BwAUhXGiJr9ww1OePQylTSoIwqb
 Kx8tYH6YFXq3g2JA3IxzbHDqrFxWZ5iEGIkn1ersjjIHk9fe2xCrpDLxJLibhmccifgS
 o+Q5nDDmvDFd8x70kuyfO8OjXow/9jOLzU/UXNbnPD20U2T6/XpTDydQ0hazWYNQ+JN1 KA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kx0xrhpfh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Nov 2022 16:36:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AIGafOI016540
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Nov 2022 16:36:41 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Fri, 18 Nov 2022 08:36:40 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH v4 1/2] arm64: dts: qcom: add data-lanes and link-freuencies
 into dp_out endpoint
Date: Fri, 18 Nov 2022 08:36:28 -0800
Message-ID: <1668789389-14617-2-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1668789389-14617-1-git-send-email-quic_khsieh@quicinc.com>
References: <1668789389-14617-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: VpDVpmtEljvBj1wfTxcZM5x57LNYF97X
X-Proofpoint-ORIG-GUID: VpDVpmtEljvBj1wfTxcZM5x57LNYF97X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_04,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211180096
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
index eae22e6..b0d6ae9 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -814,7 +814,14 @@ hp_i2c: &i2c9 {
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
index 58976a1b..2946d8a 100644
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
index c11e371..fc18ab9 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -442,7 +442,15 @@ ap_i2c_tpm: &i2c14 {
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
index 2125803..1990cc96 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -4132,11 +4132,6 @@
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

