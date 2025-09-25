Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8488EB9D793
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 07:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A1310E843;
	Thu, 25 Sep 2025 05:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="UM4ZFUa7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4F510E284;
 Thu, 25 Sep 2025 05:36:21 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONehkU018023;
 Thu, 25 Sep 2025 05:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=VXX3PGCPF9l
 NozZrxlTwitxdptvJzs7CuvBEkynJy4g=; b=UM4ZFUa7wWlH/lxvIZjKdz2GJir
 y60/YwuuxVMLT58QCtchkMqUYgGvieQayyDabqKqV2nGx1lX4KkYxgnPC0ggrwZ7
 J3eOW3M1jcAIiMIXR2+dFSZdK8jYVdcZYXwhuG8cg5vTJKaxyYSVY7ZsiMmglFYM
 R0eD3AKYFtt+vXKWbYyyn4nBNr5/uVI1+DA8IHEf5Gqo9EZe6rL1+7+Bfh5YfHZI
 6xU0rZCLWEjkn34VsoCFmOXHd4q5IUSJsmVtSe3+p9oRWstYkL5UMoYA5Pi5wnqU
 e9e8SU8GqJmeOMhGucDpIvygg3BqEDFuq9KXht51rlTsoJhTjXE7OLLwDGw==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kkaugn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Sep 2025 05:36:11 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 58P5a7Dc000678; 
 Thu, 25 Sep 2025 05:36:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 499nbm8bwf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Sep 2025 05:36:07 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 58P5a7cS000660;
 Thu, 25 Sep 2025 05:36:07 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com
 [10.213.99.91])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 58P5a6FB000657
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Sep 2025 05:36:07 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
 id 255EF3B4; Thu, 25 Sep 2025 11:06:06 +0530 (+0530)
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
Subject: [PATCH 1/3] dt-bindings: display: msm: document DSI controller and
 phy on QCS8300
Date: Thu, 25 Sep 2025 11:06:00 +0530
Message-Id: <20250925053602.4105329-2-quic_amakhija@quicinc.com>
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
X-Proofpoint-GUID: Qwh-W-Q8ip15Q4aUMa360ZcRre-vpyuv
X-Proofpoint-ORIG-GUID: Qwh-W-Q8ip15Q4aUMa360ZcRre-vpyuv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX6X8zR/UoiwWo
 UKrpqfkI7YDYSfXKcMEoBYZ7C1k3Bh7Ha7xrnqc6zjqTKwP6N8LV6IMDT0rSsPGbmTRgKgnZWM5
 vB1AibQVeXyRUUNSEoeVODTvyu/9vh5rvAC9qbfAO7wyek3IMsafuxa4jXQGiWCugJmF3+dlawu
 2lO3khYUpyCFWfD/g2RvQx6L6f1++oviKDzOS8CLTF7q6hhrqCILzfW+iC84tVXwc91qPuIyZVG
 NtDnEpfC4bt6cdKngFPkPCe0hLCS1ON95ZZHRLBER4DuQ6frtEs/n+ehcKVg1vccCnF1/GKfHLl
 EXxmgh5HkzwcyXe/bC9nm5iPoKtsgxWqAiJuE1v22P9N2UNIfsiIU8FX2XNtyrKuaPPQ37IQsOi
 FA6yaW2N
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d4d4cb cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=1lCBw_x746PEtCWBGlsA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089
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

Document DSI controller and phy on QCS8300 platform.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
---
 .../display/msm/qcom,qcs8300-mdss.yaml        | 100 +++++++++++++++++-
 1 file changed, 99 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
index e96baaae9ba9..f34823ed4433 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
@@ -53,13 +53,23 @@ patternProperties:
         contains:
           const: qcom,qcs8300-dp
 
+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,sa8775p-dsi-ctrl
+
   "^phy@[0-9a-f]+$":
     type: object
     additionalProperties: true
     properties:
       compatible:
         contains:
-          const: qcom,qcs8300-edp-phy
+          enum:
+            - qcom,qcs8300-edp-phy
+            - qcom,sa8775p-dsi-phy-5nm
 
 required:
   - compatible
@@ -71,6 +81,7 @@ examples:
     #include <dt-bindings/interconnect/qcom,icc.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
     #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
     #include <dt-bindings/interconnect/qcom,qcs8300-rpmh.h>
     #include <dt-bindings/power/qcom,rpmhpd.h>
@@ -142,6 +153,14 @@ examples:
                          remote-endpoint = <&mdss_dp0_in>;
                     };
                 };
+
+                port@1 {
+                    reg = <1>;
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&mdss_dsi0_in>;
+                    };
+                };
+
             };
 
             mdp_opp_table: opp-table {
@@ -169,6 +188,85 @@ examples:
             };
         };
 
+        dsi@ae94000 {
+            compatible = "qcom,sa8775p-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+            reg = <0x0ae94000 0x400>;
+            reg-names = "dsi_ctrl";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <4>;
+
+            clocks = <&dispcc MDSS_DISP_CC_MDSS_BYTE0_CLK>,
+                     <&dispcc MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK>,
+                     <&dispcc MDSS_DISP_CC_MDSS_PCLK0_CLK>,
+                     <&dispcc MDSS_DISP_CC_MDSS_ESC0_CLK>,
+                     <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
+                     <&gcc GCC_DISP_HF_AXI_CLK>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus";
+            assigned-clocks = <&dispcc MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC>,
+                              <&dispcc MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC>;
+            assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+            phys = <&mdss_dsi0_phy>;
+
+            operating-points-v2 = <&dsi0_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            vdda-supply = <&vreg_l5a>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    mdss0_dsi0_in: endpoint {
+                        remote-endpoint = <&dpu_intf1_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    mdss0_dsi0_out: endpoint { };
+                };
+            };
+
+            dsi0_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-358000000 {
+                    opp-hz = /bits/ 64 <358000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+            };
+        };
+
+        mdss_dsi0_phy: phy@ae94400 {
+            compatible = "qcom,sa8775p-dsi-phy-5nm";
+            reg = <0x0ae94400 0x200>,
+                  <0x0ae94600 0x280>,
+                  <0x0ae94900 0x27c>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            clocks = <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
+                     <&rpmhcc RPMH_CXO_CLK>;
+            clock-names = "iface", "ref";
+
+            vdds-supply = <&vreg_l4a>;
+          };
+
         mdss_dp0_phy: phy@aec2a00 {
             compatible = "qcom,qcs8300-edp-phy", "qcom,sa8775p-edp-phy";
 
-- 
2.34.1

