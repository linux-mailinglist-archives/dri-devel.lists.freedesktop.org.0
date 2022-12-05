Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D957642F2E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 18:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57C510E27B;
	Mon,  5 Dec 2022 17:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3A510E0C4;
 Mon,  5 Dec 2022 17:44:46 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B5Aod9O021296; Mon, 5 Dec 2022 17:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=W1aQpycSmB+zoNpJkyyrKHVUHQ58puMd7h1dj35A/O4=;
 b=hWGMEL3F7d3K39HYZiiaFQVIvw9UMcR0NIpCmedLRm6lDS71Qj4fJ2Z/6MubMZPtA2zx
 EIqeUDIM9TlHLP5lYWbTdM1Xzohyp4Dg1gJtPRTaYiTOEeSeFnrEVdy+xE/ZvQXwd96v
 7YmT2xecKVfUCAkVa21qwZwcwGcggmm8jSNm6jU91+AMZrstRdiLljdlPvZrVVzzMB5V
 LvCkXrMJmqOnXV+3Za7Y6cDk8E6H6e1ldvHREZT1OfB5SvGhcqsGdmU7hutlrLL5gnGz
 l2hBOVkX2R07f7diQZOiu0Wnyn/5/RJFAxs23iwctuZ/TeIo9VVrF+FCRJo1QlSjIFur 2g== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m7x264fxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Dec 2022 17:44:41 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B5HieI4001204
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 5 Dec 2022 17:44:40 GMT
Received: from th-lint-050.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 5 Dec 2022 09:44:39 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 01/13] dt-bindings: display/msm: Add binding for SC8280XP
 MDSS
Date: Mon, 5 Dec 2022 09:44:21 -0800
Message-ID: <20221205174433.16847-2-quic_bjorande@quicinc.com>
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
X-Proofpoint-GUID: BdeCoaEqk1PoFBS5hmQAmH-l4YlqxblY
X-Proofpoint-ORIG-GUID: BdeCoaEqk1PoFBS5hmQAmH-l4YlqxblY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-05_01,2022-12-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 impostorscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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

Add binding for the display subsystem and display processing unit in the
Qualcomm SC8280XP platform.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---

Changes since v3:
- Reworked on top of redesigned common yaml.

 .../display/msm/qcom,sc8280xp-dpu.yaml        | 122 +++++++++++++++
 .../display/msm/qcom,sc8280xp-mdss.yaml       | 143 ++++++++++++++++++
 2 files changed, 265 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-dpu.yaml
new file mode 100644
index 000000000000..f2c8e16cf067
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-dpu.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sc8280xp-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SC8280XP Display Processing Unit
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+
+description:
+  Device tree bindings for SC8280XP Display Processing Unit.
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sc8280xp-dpu
+
+  reg:
+    items:
+      - description: Address offset and size for mdp register set
+      - description: Address offset and size for vbif register set
+
+  reg-names:
+    items:
+      - const: mdp
+      - const: vbif
+
+  clocks:
+    items:
+      - description: Display hf axi clock
+      - description: Display sf axi clock
+      - description: Display ahb clock
+      - description: Display lut clock
+      - description: Display core clock
+      - description: Display vsync clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: nrt_bus
+      - const: iface
+      - const: lut
+      - const: core
+      - const: vsync
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sc8280xp.h>
+    #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sc8280xp.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-controller@ae01000 {
+        compatible = "qcom,sc8280xp-dpu";
+        reg = <0x0ae01000 0x8f000>,
+              <0x0aeb0000 0x2008>;
+        reg-names = "mdp", "vbif";
+
+        clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&gcc GCC_DISP_SF_AXI_CLK>,
+                 <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
+                 <&dispcc0 DISP_CC_MDSS_MDP_LUT_CLK>,
+                 <&dispcc0 DISP_CC_MDSS_MDP_CLK>,
+                 <&dispcc0 DISP_CC_MDSS_VSYNC_CLK>;
+        clock-names = "bus",
+                      "nrt_bus",
+                      "iface",
+                      "lut",
+                      "core",
+                      "vsync";
+
+        assigned-clocks = <&dispcc0 DISP_CC_MDSS_MDP_CLK>,
+                          <&dispcc0 DISP_CC_MDSS_VSYNC_CLK>;
+        assigned-clock-rates = <460000000>,
+                               <19200000>;
+
+        operating-points-v2 = <&mdp_opp_table>;
+        power-domains = <&rpmhpd SC8280XP_MMCX>;
+
+        interrupt-parent = <&mdss0>;
+        interrupts = <0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                endpoint {
+                    remote-endpoint = <&mdss0_dp0_in>;
+                };
+            };
+
+            port@4 {
+                reg = <4>;
+                endpoint {
+                    remote-endpoint = <&mdss0_dp1_in>;
+                };
+            };
+
+            port@5 {
+                reg = <5>;
+                endpoint {
+                    remote-endpoint = <&mdss0_dp3_in>;
+                };
+            };
+
+            port@6 {
+                reg = <6>;
+                endpoint {
+                    remote-endpoint = <&mdss0_dp2_in>;
+                };
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
new file mode 100644
index 000000000000..b67e7874ed56
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
@@ -0,0 +1,143 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sc8280xp-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SC8280XP Mobile Display Subsystem
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+
+description:
+  Device tree bindings for MSM Mobile Display Subsystem (MDSS) that encapsulates
+  sub-blocks like DPU display controller, DSI and DP interfaces etc.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sc8280xp-mdss
+
+  clocks:
+    items:
+      - description: Display AHB clock from gcc
+      - description: Display AHB clock from dispcc
+      - description: Display core clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: ahb
+      - const: core
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sc8280xp-dpu
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sc8280xp.h>
+    #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sc8280xp.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-subsystem@ae00000 {
+        compatible = "qcom,sc8280xp-mdss";
+        reg = <0x0ae00000 0x1000>;
+        reg-names = "mdss";
+
+        power-domains = <&dispcc0 MDSS_GDSC>;
+
+        clocks = <&gcc GCC_DISP_AHB_CLK>,
+                 <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
+                 <&dispcc0 DISP_CC_MDSS_MDP_CLK>;
+        clock-names = "iface",
+                      "ahb",
+                      "core";
+
+        resets = <&dispcc0 DISP_CC_MDSS_CORE_BCR>;
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>,
+                        <&mmss_noc MASTER_MDP1 0 &mc_virt SLAVE_EBI1 0>;
+        interconnect-names = "mdp0-mem", "mdp1-mem";
+
+        iommus = <&apps_smmu 0x1000 0x402>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        display-controller@ae01000 {
+            compatible = "qcom,sc8280xp-dpu";
+            reg = <0x0ae01000 0x8f000>,
+            <0x0aeb0000 0x2008>;
+            reg-names = "mdp", "vbif";
+
+            clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                     <&gcc GCC_DISP_SF_AXI_CLK>,
+                     <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
+                     <&dispcc0 DISP_CC_MDSS_MDP_LUT_CLK>,
+                     <&dispcc0 DISP_CC_MDSS_MDP_CLK>,
+                     <&dispcc0 DISP_CC_MDSS_VSYNC_CLK>;
+            clock-names = "bus",
+                          "nrt_bus",
+                          "iface",
+                          "lut",
+                          "core",
+                          "vsync";
+
+            assigned-clocks = <&dispcc0 DISP_CC_MDSS_VSYNC_CLK>;
+            assigned-clock-rates = <19200000>;
+
+            operating-points-v2 = <&mdss0_mdp_opp_table>;
+            power-domains = <&rpmhpd SC8280XP_MMCX>;
+
+            interrupt-parent = <&mdss0>;
+            interrupts = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    endpoint {
+                        remote-endpoint = <&mdss0_dp0_in>;
+                    };
+                };
+
+                port@4 {
+                    reg = <4>;
+                    endpoint {
+                        remote-endpoint = <&mdss0_dp1_in>;
+                    };
+                };
+
+                port@5 {
+                    reg = <5>;
+                    endpoint {
+                        remote-endpoint = <&mdss0_dp3_in>;
+                    };
+                };
+
+                port@6 {
+                    reg = <6>;
+                    endpoint {
+                        remote-endpoint = <&mdss0_dp2_in>;
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.37.3

