Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8CF63E5D2
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 00:52:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D08310E4F9;
	Wed, 30 Nov 2022 23:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57DED10E4EB;
 Wed, 30 Nov 2022 23:52:17 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AUNgx70006289; Wed, 30 Nov 2022 23:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=J+BgIvm04YxowNybwAVKOK7g9tPuXhBNmY70zWiUOy0=;
 b=QSB34as+wbdWAcr5h5Sh8KUcYxFnntCSq8skIpEf1iEHTLXqZIiZr8o6Wmi3rH0RcFdV
 2htEbER7MxtswoaxDFgliHNeoSIlGoSQAdlsI+OcoYXv4iZyvxCmiHI05SJx1LkSldyx
 rCbHG7JTm0YYqRjT3UWAllnsHjv6YEpV3BS8AAVpvjvstBUuxlFBnaRRkholKKCPqhMa
 YcG7h1nHRO+BwNrrI9Y8sct8tZ+5p+BRvXfb67A7Ic5H5bvnPi++XFMicDQlIYAicWxE
 XOQMX7tSbKIwDmaZqok9W311LQGMTQJ3U4HrFYowiApr6fVeSzx8v4/td2APWDNyMiiv kg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m61crkkm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Nov 2022 23:52:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AUNqBtV024674
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Nov 2022 23:52:11 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 30 Nov 2022 15:52:10 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH v6 1/4] arm64: dts: qcom: add data-lanes and link-freuencies
 into dp_out endpoint
Date: Wed, 30 Nov 2022 15:51:47 -0800
Message-ID: <1669852310-22360-2-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1669852310-22360-1-git-send-email-quic_khsieh@quicinc.com>
References: <1669852310-22360-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 4mDf1ZVai0P0PGe0GK9mMRIRHf1o510X
X-Proofpoint-ORIG-GUID: 4mDf1ZVai0P0PGe0GK9mMRIRHf1o510X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-30_04,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 mlxscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211300169
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

Move data-lanes property from mdss_dp node to dp_out endpoint. Also
add link-frequencies property into dp_out endpoint as well. The last
frequency specified at link-frequencies will be the max link rate
supported by DP.

Changes in v5:
-- revert changes at sc7180.dtsi and sc7280.dtsi
-- add &dp_out to sc7180-trogdor.dtsi and sc7280-herobrine.dtsi

Changes in v6:
-- add data-lanes and link-frequencies to yaml

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml  | 17 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi            |  6 +++++-
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi          |  6 +++++-
 3 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 94bc6e1..af70343 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -90,6 +90,20 @@ properties:
         $ref: /schemas/graph.yaml#/properties/port
         description: Output endpoint of the controller
 
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+
+          properties:
+            link-frequencies: true
+            data-lanes: true
+
+          required:
+            - link-frequencies
+            - data-lanes
+
+          additionalProperties: false
+
 required:
   - compatible
   - reg
@@ -158,6 +172,9 @@ examples:
                 reg = <1>;
                 endpoint {
                     remote-endpoint = <&typec>;
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <160000000 270000000
+                                                  540000000 810000000>;
                 };
             };
         };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 754d2d6..39f0844 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -812,7 +812,11 @@ hp_i2c: &i2c9 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&dp_hot_plug_det>;
-	data-lanes = <0 1>;
+};
+
+&dp_out {
+    data-lanes = <0  1>;
+    link-frequencies = /bits/ 64 <160000000 270000000 540000000>;
 };
 
 &pm6150_adc {
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 93e39fc..b7c343d 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -440,7 +440,11 @@ ap_i2c_tpm: &i2c14 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&dp_hot_plug_det>;
-	data-lanes = <0 1>;
+};
+
+&dp_out {
+	data-lanes = <0  1>;
+	link-frequencies = /bits/ 64 <160000000 270000000 540000000 810000000>;
 };
 
 &mdss_mdp {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

