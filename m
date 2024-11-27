Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A4E9DA2AE
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 08:07:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00A210E9E3;
	Wed, 27 Nov 2024 07:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="YIHNQN8n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABF110E9E6;
 Wed, 27 Nov 2024 07:07:28 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQKl406023533;
 Wed, 27 Nov 2024 07:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Zh1kPgwmQV0eEhY4bfadCi/DXljix7ic2ljhyEJMVXM=; b=YIHNQN8nLHRULgiL
 44dsjzKB8FRByd5RzTrXgbzKnPXrcdsJb9Boiglg6uQk6U+85ZDZnvLrVUkjkiDt
 qjgxwCfhO8axwMfEKe7gJDRYspJo56bAtZI3RsZTSlcqBiJVTVTuZFYj6md4iIjh
 K8/ELyT8NcUqeRXyaNNd+14blu2LLSe6h4csecc5JwP9TVey+bKm2kOagy38nx8F
 cQ/PHkrQffWnzCvjzFF1f4TkVzaTkrk3E2XWL6o8DslduERTrSI+dqixkQ1QNi1I
 2yXea7pJe07HUAqHsb5OMSZ0cZsnWpFShmuMQQkc9a+iAphMhxl/FeB/RpnZCMKm
 XkLFQg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435bf5k79s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2024 07:07:22 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AR77MJq018882
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2024 07:07:22 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 26 Nov 2024 23:07:15 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Wed, 27 Nov 2024 15:05:01 +0800
Subject: [PATCH 1/5] dt-bindings: display/msm: Document MDSS on QCS8300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241127-mdss_qcs8300-v1-1-29b2c3ee95b8@quicinc.com>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
In-Reply-To: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
To: Ritesh Kumar <quic_riteshk@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732691225; l=8484;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=NX2S3nQtsaLD5JO0v+GA++D1woh6VN/ZiDtUSCAYyPk=;
 b=oLKU+GSDmo+ZHQ/UBBknqO093090fG7l8f7NJ0rT6NPwhMymEsSnK+Es0pJ6xE8p+FyANbnty
 ahbTTwfETYoBErCbY3iGflBlqF20ZiVwHgRXqcm0rrvxWViI3GTyodg
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ZvXCbJEtZYQcbI552lJBfEN8U1AqTP-S
X-Proofpoint-GUID: ZvXCbJEtZYQcbI552lJBfEN8U1AqTP-S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 suspectscore=0 clxscore=1011 mlxlogscore=999 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411270058
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

Document the MDSS hardware found on the Qualcomm QCS8300 platform.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 239 +++++++++++++++++++++
 1 file changed, 239 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..87d6599d30b2b7b689eb31d3690c0de511aecb95
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
@@ -0,0 +1,239 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,qcs8300-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. QCS8300 Display MDSS
+
+maintainers:
+  - Yongxing Mou <quic_yongmou@quicinc.com>
+
+description:
+  QCS8300 MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
+  DPU display controller, DP interfaces and EDP etc.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,qcs8300-mdss
+
+  clocks:
+    items:
+      - description: Display AHB
+      - description: Display hf AXI
+      - description: Display core
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 3
+
+  interconnect-names:
+    maxItems: 3
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: qcom,qcs8300-dpu
+
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        items:
+          - const: qcom,qcs8300-dp
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
+    #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
+    #include <dt-bindings/interconnect/qcom,qcs8300-rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    mdss: display-subsystem@ae00000 {
+        compatible = "qcom,qcs8300-mdss";
+        reg = <0 0x0ae00000 0 0x1000>;
+        reg-names = "mdss";
+
+        interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ACTIVE_ONLY
+                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+                        <&mmss_noc MASTER_MDP1 QCOM_ICC_TAG_ACTIVE_ONLY
+                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+                        <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                         &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+        interconnect-names = "mdp0-mem",
+                             "mdp1-mem",
+                             "cpu-cfg";
+
+        power-domains = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_GDSC>;
+
+        clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+                 <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>;
+
+        interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        iommus = <&apps_smmu 0x1000 0x402>;
+
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        status = "disabled";
+
+        mdss_mdp: display-controller@ae01000 {
+            compatible = "qcom,qcs8300-dpu";
+            reg = <0 0x0ae01000 0 0x8f000>,
+                  <0 0x0aeb0000 0 0x2008>;
+            reg-names = "mdp", "vbif";
+
+            clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+            clock-names = "bus",
+                          "iface",
+                          "lut",
+                          "core",
+                          "vsync";
+
+            assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+            assigned-clock-rates = <19200000>;
+            operating-points-v2 = <&mdp_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            interrupt-parent = <&mdss>;
+            interrupts = <0>;
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    dpu_intf0_out: endpoint {
+                         remote-endpoint = <&mdss_dp0_in>;
+                    };
+                };
+            };
+
+            mdp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-375000000 {
+                    opp-hz = /bits/ 64 <375000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-500000000 {
+                    opp-hz = /bits/ 64 <500000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+
+                opp-575000000 {
+                    opp-hz = /bits/ 64 <575000000>;
+                    required-opps = <&rpmhpd_opp_turbo>;
+                };
+
+                opp-650000000 {
+                    opp-hz = /bits/ 64 <650000000>;
+                    required-opps = <&rpmhpd_opp_turbo_l1>;
+                };
+            };
+        };
+
+        mdss_dp0: displayport-controller@af54000 {
+            compatible = "qcom,qcs8300-dp";
+
+            pinctrl-0 = <&dp_hot_plug_det>;
+            pinctrl-names = "default";
+
+            reg = <0 0xaf54000 0 0x104>,
+                <0 0xaf54200 0 0x0c0>,
+                <0 0xaf55000 0 0x770>,
+                <0 0xaf56000 0 0x09c>;
+
+            interrupt-parent = <&mdss>;
+            interrupts = <12>;
+            clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+                <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+                <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
+                <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+                <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+            clock-names = "core_iface",
+                "core_aux",
+                "ctrl_link",
+                "ctrl_link_iface",
+                "stream_pixel";
+            assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+                 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
+            assigned-clock-parents = <&mdss_edp_phy 0>, <&mdss_edp_phy 1>;
+            phys = <&mdss_edp_phy>;
+            phy-names = "dp";
+            operating-points-v2 = <&dp_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            #sound-dai-cells = <0>;
+            status = "disabled";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    mdss_dp0_in: endpoint {
+                        remote-endpoint = <&dpu_intf0_out>;
+                    };
+                };
+
+                port@1 {
+                   reg = <1>;
+                   mdss_dp_out: endpoint { };
+                };
+            };
+
+            dp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-160000000 {
+                    opp-hz = /bits/ 64 <160000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-270000000 {
+                    opp-hz = /bits/ 64 <270000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-540000000 {
+                    opp-hz = /bits/ 64 <540000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-810000000 {
+                    opp-hz = /bits/ 64 <810000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+            };
+
+    };
+...

-- 
2.34.1

