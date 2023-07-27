Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9610B7665A1
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 09:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A1510E669;
	Fri, 28 Jul 2023 07:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F44310E1D9;
 Thu, 27 Jul 2023 09:09:37 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36R5HQZH010751; Thu, 27 Jul 2023 09:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc : subject : date : message-id; s=qcppdkim1;
 bh=cPveW7OVzyQ4bO33Zary25f0VwjKBvH+4mlxbM7Hqvo=;
 b=IXw01TDVe9axGDhq8S8gqRPooBWZaEvPDxkLJOtiYr3i+O/MRB475XTCVVeefgQs8QqR
 5KgvjDK+TEcWqZl9P/g5p0iGdMGR8wJYnc4sl9TrlZLRqzp12J99BNhNMXUiDLFpg1yD
 kuzMASxoB7psSkKHTtLZWDfELDkmCbUgtYKYLeRxJ1myv6Wjp5Ol3LVGurAqhvOXno/Y
 NKT82ycHnCVQ8wtiStKlqT4jx5XiHNSgL0vZaq/YCXd/l3pxes0Fc2tkpJo3JYYYRwSg
 ov1WnVBiHniwhVxASWr4gwdZo7SjGSEw1RXlpWf7Q+g0Kim9LDnIjbawzngcyLjyC7vg mw== 
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s3f580tmx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jul 2023 09:09:28 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 36R99JnQ023240; 
 Thu, 27 Jul 2023 09:09:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3s086m8bh6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 27 Jul 2023 09:09:19 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36R99IZh023212;
 Thu, 27 Jul 2023 09:09:18 GMT
Received: from hu-sgudaval-hyd.qualcomm.com (hu-rohiagar-hyd.qualcomm.com
 [10.213.106.138])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 36R99HTh023211;
 Thu, 27 Jul 2023 09:09:18 +0000
Received: by hu-sgudaval-hyd.qualcomm.com (Postfix, from userid 3970568)
 id 46FC01930; Thu, 27 Jul 2023 14:39:17 +0530 (+0530)
From: Rohit Agarwal <quic_rohiagar@quicinc.com>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org
Subject: [PATCH v2] dt-bindings: qcom: Update RPMHPD entries for some SoCs
Date: Thu, 27 Jul 2023 14:39:13 +0530
Message-Id: <1690448953-23425-1-git-send-email-quic_rohiagar@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 68_YYgDFajGIb7oXhc1T_Z1I7_oRfVVz
X-Proofpoint-ORIG-GUID: 68_YYgDFajGIb7oXhc1T_Z1I7_oRfVVz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_08,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=863 mlxscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307270081
X-Mailman-Approved-At: Fri, 28 Jul 2023 07:44:51 +0000
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
Cc: ulf.hansson@linaro.org, mturquette@baylibre.com,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_vgarodia@quicinc.com, marijn.suijten@somainline.org,
 linux-clk@vger.kernel.org, rfoss@kernel.org, jonathan@marek.ca,
 stanimir.k.varbanov@gmail.com, agross@kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, bhupesh.sharma@linaro.org,
 mani@kernel.org, linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 Rohit Agarwal <quic_rohiagar@quicinc.com>, mchehab@kernel.org, sean@poorly.run,
 neil.armstrong@linaro.org, mathieu.poirier@linaro.org, sboyd@kernel.org,
 vladimir.zapolskiy@linaro.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, quic_tdas@quicinc.com,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the RPMHPD references with new bindings defined in rpmhpd.h
for Qualcomm SoCs SM8[2345]50.

Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
---
 Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml   | 4 ++--
 Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml  | 4 ++--
 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml    | 4 ++--
 Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml   | 4 ++--
 Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml  | 4 ++--
 Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml   | 4 ++--
 Documentation/devicetree/bindings/clock/qcom,videocc.yaml         | 4 ++--
 .../devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml          | 4 ++--
 .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml         | 8 ++++----
 .../devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml          | 4 ++--
 .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml         | 6 +++---
 .../devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml          | 4 ++--
 .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml         | 8 ++++----
 .../devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml          | 4 ++--
 .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml         | 8 ++++----
 Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml    | 4 ++--
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml              | 4 ++--
 Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml | 6 +++---
 18 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
index d6774db..59cc88a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
@@ -82,7 +82,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
-    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@af00000 {
       compatible = "qcom,sm8250-dispcc";
       reg = <0x0af00000 0x10000>;
@@ -103,7 +103,7 @@ examples:
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
-      power-domains = <&rpmhpd SM8250_MMCX>;
+      power-domains = <&rpmhpd RPMHPD_MMCX>;
       required-opps = <&rpmhpd_opp_low_svs>;
     };
 ...
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml
index 23505c8..d723bb1 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml
@@ -51,7 +51,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
-    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
 
     clock-controller@abf0000 {
       compatible = "qcom,sm8350-videocc";
@@ -59,7 +59,7 @@ examples:
       clocks = <&rpmhcc RPMH_CXO_CLK>,
                <&rpmhcc RPMH_CXO_CLK_A>,
                <&sleep_clk>;
-      power-domains = <&rpmhpd SM8350_MMCX>;
+      power-domains = <&rpmhpd RPMHPD_MMCX>;
       required-opps = <&rpmhpd_opp_low_svs>;
       #clock-cells = <1>;
       #reset-cells = <1>;
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index 87ae741..8178c35 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -64,7 +64,7 @@ examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sm8450.h>
     #include <dt-bindings/clock/qcom,rpmh.h>
-    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@ade0000 {
       compatible = "qcom,sm8450-camcc";
       reg = <0xade0000 0x20000>;
@@ -72,7 +72,7 @@ examples:
                <&rpmhcc RPMH_CXO_CLK>,
                <&rpmhcc RPMH_CXO_CLK_A>,
                <&sleep_clk>;
-      power-domains = <&rpmhpd SM8450_MMCX>;
+      power-domains = <&rpmhpd RPMHPD_MMCX>;
       required-opps = <&rpmhpd_opp_low_svs>;
       #clock-cells = <1>;
       #reset-cells = <1>;
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml
index 1dd1f69..2f22310 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml
@@ -76,7 +76,7 @@ examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sm8450.h>
     #include <dt-bindings/clock/qcom,rpmh.h>
-    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@af00000 {
       compatible = "qcom,sm8450-dispcc";
       reg = <0x0af00000 0x10000>;
@@ -91,7 +91,7 @@ examples:
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
-      power-domains = <&rpmhpd SM8450_MMCX>;
+      power-domains = <&rpmhpd RPMHPD_MMCX>;
       required-opps = <&rpmhpd_opp_low_svs>;
     };
 ...
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index f1c6dd5..bad8f01 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -64,13 +64,13 @@ examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sm8450.h>
     #include <dt-bindings/clock/qcom,rpmh.h>
-    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     videocc: clock-controller@aaf0000 {
       compatible = "qcom,sm8450-videocc";
       reg = <0x0aaf0000 0x10000>;
       clocks = <&rpmhcc RPMH_CXO_CLK>,
                <&gcc GCC_VIDEO_AHB_CLK>;
-      power-domains = <&rpmhpd SM8450_MMCX>;
+      power-domains = <&rpmhpd RPMHPD_MMCX>;
       required-opps = <&rpmhpd_opp_low_svs>;
       #clock-cells = <1>;
       #reset-cells = <1>;
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
index ab25f7c..c129f8c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
@@ -76,7 +76,7 @@ examples:
   - |
     #include <dt-bindings/clock/qcom,sm8550-gcc.h>
     #include <dt-bindings/clock/qcom,rpmh.h>
-    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@af00000 {
       compatible = "qcom,sm8550-dispcc";
       reg = <0x0af00000 0x10000>;
@@ -99,7 +99,7 @@ examples:
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
-      power-domains = <&rpmhpd SM8550_MMCX>;
+      power-domains = <&rpmhpd RPMHPD_MMCX>;
       required-opps = <&rpmhpd_opp_low_svs>;
     };
 ...
diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index 2b07146..6de01cf 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -124,7 +124,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
-    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@ab00000 {
       compatible = "qcom,sdm845-videocc";
       reg = <0x0ab00000 0x10000>;
@@ -133,7 +133,7 @@ examples:
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
-      power-domains = <&rpmhpd SM8250_MMCX>;
+      power-domains = <&rpmhpd RPMHPD_MMCX>;
       required-opps = <&rpmhpd_opp_low_svs>;
     };
 ...
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml
index 687c8c1..acd2ed3 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml
@@ -54,7 +54,7 @@ examples:
     #include <dt-bindings/clock/qcom,gcc-sm8250.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interconnect/qcom,sm8250.h>
-    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
 
     display-controller@ae01000 {
         compatible = "qcom,sm8250-dpu";
@@ -72,7 +72,7 @@ examples:
         assigned-clock-rates = <19200000>;
 
         operating-points-v2 = <&mdp_opp_table>;
-        power-domains = <&rpmhpd SM8250_MMCX>;
+        power-domains = <&rpmhpd RPMHPD_MMCX>;
 
         interrupt-parent = <&mdss>;
         interrupts = <0>;
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
index 368d3db..5cfb9b9 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
@@ -76,7 +76,7 @@ examples:
     #include <dt-bindings/clock/qcom,rpmh.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interconnect/qcom,sm8250.h>
-    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
 
     display-subsystem@ae00000 {
         compatible = "qcom,sm8250-mdss";
@@ -121,7 +121,7 @@ examples:
             assigned-clock-rates = <19200000>;
 
             operating-points-v2 = <&mdp_opp_table>;
-            power-domains = <&rpmhpd SM8250_MMCX>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
 
             interrupt-parent = <&mdss>;
             interrupts = <0>;
@@ -196,7 +196,7 @@ examples:
             assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
 
             operating-points-v2 = <&dsi_opp_table>;
-            power-domains = <&rpmhpd SM8250_MMCX>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
 
             phys = <&dsi0_phy>;
             phy-names = "dsi";
@@ -286,7 +286,7 @@ examples:
             assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
 
             operating-points-v2 = <&dsi_opp_table>;
-            power-domains = <&rpmhpd SM8250_MMCX>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
 
             phys = <&dsi1_phy>;
             phy-names = "dsi";
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml
index 1205003..1a4e035 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml
@@ -51,7 +51,7 @@ examples:
     #include <dt-bindings/clock/qcom,gcc-sm8350.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interconnect/qcom,sm8350.h>
-    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
 
     display-controller@ae01000 {
         compatible = "qcom,sm8350-dpu";
@@ -76,7 +76,7 @@ examples:
         assigned-clock-rates = <19200000>;
 
         operating-points-v2 = <&mdp_opp_table>;
-        power-domains = <&rpmhpd SM8350_MMCX>;
+        power-domains = <&rpmhpd RPMHPD_MMCX>;
 
         interrupt-parent = <&mdss>;
         interrupts = <0>;
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
index 79a226e..1056bed 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
@@ -75,7 +75,7 @@ examples:
     #include <dt-bindings/clock/qcom,rpmh.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interconnect/qcom,sm8350.h>
-    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
 
     display-subsystem@ae00000 {
         compatible = "qcom,sm8350-mdss";
@@ -128,7 +128,7 @@ examples:
             assigned-clock-rates = <19200000>;
 
             operating-points-v2 = <&mdp_opp_table>;
-            power-domains = <&rpmhpd SM8350_MMCX>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
 
             interrupt-parent = <&mdss>;
             interrupts = <0>;
@@ -197,7 +197,7 @@ examples:
                                  <&mdss_dsi0_phy 1>;
 
             operating-points-v2 = <&dsi_opp_table>;
-            power-domains = <&rpmhpd SM8350_MMCX>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
 
             phys = <&mdss_dsi0_phy>;
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
index 0d17ece..da3fd66 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
@@ -58,7 +58,7 @@ examples:
     #include <dt-bindings/clock/qcom,gcc-sm8450.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interconnect/qcom,sm8450.h>
-    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
 
     display-controller@ae01000 {
         compatible = "qcom,sm8450-dpu";
@@ -83,7 +83,7 @@ examples:
         assigned-clock-rates = <19200000>;
 
         operating-points-v2 = <&mdp_opp_table>;
-        power-domains = <&rpmhpd SM8450_MMCX>;
+        power-domains = <&rpmhpd RPMHPD_MMCX>;
 
         interrupt-parent = <&mdss>;
         interrupts = <0>;
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
index f26eb56..6dd21af 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
@@ -68,7 +68,7 @@ examples:
     #include <dt-bindings/clock/qcom,rpmh.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interconnect/qcom,sm8450.h>
-    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
 
     display-subsystem@ae00000 {
         compatible = "qcom,sm8450-mdss";
@@ -122,7 +122,7 @@ examples:
             assigned-clock-rates = <19200000>;
 
             operating-points-v2 = <&mdp_opp_table>;
-            power-domains = <&rpmhpd SM8450_MMCX>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
 
             interrupt-parent = <&mdss>;
             interrupts = <0>;
@@ -202,7 +202,7 @@ examples:
             assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
 
             operating-points-v2 = <&dsi_opp_table>;
-            power-domains = <&rpmhpd SM8450_MMCX>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
 
             phys = <&dsi0_phy>;
             phy-names = "dsi";
@@ -297,7 +297,7 @@ examples:
             assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
 
             operating-points-v2 = <&dsi_opp_table>;
-            power-domains = <&rpmhpd SM8450_MMCX>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
 
             phys = <&dsi1_phy>;
             phy-names = "dsi";
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml
index ff58a74..99908fb 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml
@@ -57,7 +57,7 @@ examples:
     #include <dt-bindings/clock/qcom,sm8550-dispcc.h>
     #include <dt-bindings/clock/qcom,sm8550-gcc.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
 
     display-controller@ae01000 {
         compatible = "qcom,sm8550-dpu";
@@ -82,7 +82,7 @@ examples:
         assigned-clock-rates = <19200000>;
 
         operating-points-v2 = <&mdp_opp_table>;
-        power-domains = <&rpmhpd SM8550_MMCX>;
+        power-domains = <&rpmhpd RPMHPD_MMCX>;
 
         interrupt-parent = <&mdss>;
         interrupts = <0>;
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
index 887be33..a464312 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
@@ -68,7 +68,7 @@ examples:
     #include <dt-bindings/clock/qcom,rpmh.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interconnect/qcom,sm8550-rpmh.h>
-    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
 
     display-subsystem@ae00000 {
         compatible = "qcom,sm8550-mdss";
@@ -122,7 +122,7 @@ examples:
             assigned-clock-rates = <19200000>;
 
             operating-points-v2 = <&mdp_opp_table>;
-            power-domains = <&rpmhpd SM8550_MMCX>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
 
             interrupt-parent = <&mdss>;
             interrupts = <0>;
@@ -197,7 +197,7 @@ examples:
             assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
 
             operating-points-v2 = <&dsi_opp_table>;
-            power-domains = <&rpmhpd SM8550_MMCX>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
 
             phys = <&dsi0_phy>;
             phy-names = "dsi";
@@ -286,7 +286,7 @@ examples:
             assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
 
             operating-points-v2 = <&dsi_opp_table>;
-            power-domains = <&rpmhpd SM8550_MMCX>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
 
             phys = <&dsi1_phy>;
             phy-names = "dsi";
diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
index 7915dcd..f66033a 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
@@ -106,7 +106,7 @@ examples:
     #include <dt-bindings/clock/qcom,videocc-sm8250.h>
     #include <dt-bindings/interconnect/qcom,sm8250.h>
     #include <dt-bindings/clock/qcom,gcc-sm8250.h>
-    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
 
     venus: video-codec@aa00000 {
         compatible = "qcom,sm8250-venus";
@@ -114,7 +114,7 @@ examples:
         interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
         power-domains = <&videocc MVS0C_GDSC>,
                         <&videocc MVS0_GDSC>,
-                        <&rpmhpd SM8250_MX>;
+                        <&rpmhpd RPMHPD_MX>;
         power-domain-names = "venus", "vcodec0", "mx";
 
         clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 6da28e6..80141eb 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -215,7 +215,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/qcom,gcc-sm8250.h>
     #include <dt-bindings/clock/qcom,rpmh.h>
-    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
 
     sdhc_2: mmc@8804000 {
       compatible = "qcom,sm8250-sdhci", "qcom,sdhci-msm-v5";
@@ -232,7 +232,7 @@ examples:
       iommus = <&apps_smmu 0x4a0 0x0>;
       qcom,dll-config = <0x0007642c>;
       qcom,ddr-config = <0x80040868>;
-      power-domains = <&rpmhpd SM8250_CX>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
 
       operating-points-v2 = <&sdhc2_opp_table>;
 
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
index af24f9a..9a04d19 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
@@ -139,7 +139,7 @@ examples:
     #include <dt-bindings/clock/qcom,rpmh.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/mailbox/qcom-ipcc.h>
-    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
 
     remoteproc@30000000 {
         compatible = "qcom,sm8450-adsp-pas";
@@ -160,8 +160,8 @@ examples:
 
         memory-region = <&adsp_mem>;
 
-        power-domains = <&rpmhpd SM8450_LCX>,
-                        <&rpmhpd SM8450_LMX>;
+        power-domains = <&rpmhpd RPMHPD_LCX>,
+                        <&rpmhpd RPMHPD_LMX>;
         power-domain-names = "lcx", "lmx";
 
         qcom,qmp = <&aoss_qmp>;
-- 
2.7.4

