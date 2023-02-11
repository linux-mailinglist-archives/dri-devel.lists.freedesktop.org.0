Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F28B76930E6
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 13:27:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E3510E2C0;
	Sat, 11 Feb 2023 12:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9336910E2B7
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 12:27:07 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id gr7so21871150ejb.5
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 04:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Sr0+FcNcwlLHfN/b6mswiQ+4MJsV8lR4+MatDfQmDI=;
 b=m8ZU92O8sLl9jYSFZZzF2leZ/BFju78vMOcPstAcnRDDDZxFVTRxff6KKOUpGKQ50L
 bYZMagePDvAdnSUAK1g3ESu6J+bAtGB/V6i6MuEEyavLN8mH+uWS0JnmwUJjkK75gmFQ
 9VfN5S+Om32dBp1r/iVCYNsUSWYMP/LQovCHtIhXDWIksL2HgHYQBGF47N3DXjdqcXD5
 nQeOECaEnhJfoVLS9bZh66ZGsJ2XbD17aDRwJ31M36hrW1OoOQlpC3MQh2Itiup/F2Xz
 rCW5cSRQrPYnDEEDAzFHskZbvee5YTu1nfSVywCGuJsxaaZbN0sDDOUlSjQ5SwwreRSv
 kUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Sr0+FcNcwlLHfN/b6mswiQ+4MJsV8lR4+MatDfQmDI=;
 b=uxf0Pq0Ghj84MmPfRKrYliLQPE0hAyYfVvRDdHperTk2SsRzGqUEW3GOLaSX6SkZYR
 y9c7pJM9eLy2yMDGy1RLPa9rzL9DZ1qgYOu2ebekN1Q5wfl6o/bi9LFCj8wQAfgIu647
 f5NCH9mfJ66CanPGWd6XlXtJlgHBeA4Vl43PNteBzvF6QqRp9g4qqNDu2vKqEaAP9Mmq
 sx1/H5QgHQJ1qvsOPtsvgrOX171oioNKIU9UyMPextjeUKXniMEaWccz2IohqCd6iLwN
 phA/YwGUnCzLh5SaVMzhNDVkUjyZKsSagL5P94mW2hOOjxmmYy2XNx28NCEP/qL6jlo0
 7vYA==
X-Gm-Message-State: AO0yUKU9WplZmK6QiFyRN9jaSEKSkErKi538kPKalSnE6jE89s7uJ0jZ
 MrUTjZ2sxK9uCKH3VhyX6Al2ww==
X-Google-Smtp-Source: AK7set/duDr1VxOmVbidCgrxRbAnclOyfs2uRSycha7k9NSTEY1i0X2kGhQr7gE+4F9LEgRHKYurug==
X-Received: by 2002:a17:906:ce28:b0:878:7349:5ce6 with SMTP id
 sd8-20020a170906ce2800b0087873495ce6mr19310414ejb.71.1676118426014; 
 Sat, 11 Feb 2023 04:27:06 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 mv9-20020a170907838900b0087bd2ebe474sm3767941ejc.208.2023.02.11.04.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 04:27:05 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 03/10] dt-bindings: display/msm: Add SM6350 DPU & MDSS
Date: Sat, 11 Feb 2023 13:26:49 +0100
Message-Id: <20230211122656.1479141-4-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document 6350 DPU and MDSS.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/display/msm/qcom,sm6350-dpu.yaml |  94 ++++++++
 .../display/msm/qcom,sm6350-mdss.yaml         | 213 ++++++++++++++++++
 2 files changed, 307 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm6350-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6350-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-dpu.yaml
new file mode 100644
index 000000000000..979fcf81afc9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-dpu.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm6350-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DPU dt properties for SM6350 target
+
+maintainers:
+  - Konrad Dybcio <konrad.dybcio@linaro.org>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,sm6350-dpu
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
+      - description: Display axi clock
+      - description: Display ahb clock
+      - description: Display rot clock
+      - description: Display lut clock
+      - description: Display core clock
+      - description: Display vsync clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: iface
+      - const: rot
+      - const: lut
+      - const: core
+      - const: vsync
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sm6350.h>
+    #include <dt-bindings/clock/qcom,gcc-sm6350.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-controller@ae01000 {
+        compatible = "qcom,sm6350-dpu";
+        reg = <0x0ae01000 0x8f000>,
+              <0x0aeb0000 0x2008>;
+        reg-names = "mdp", "vbif";
+
+        clocks = <&gcc GCC_DISP_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&dispcc DISP_CC_MDSS_ROT_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+        clock-names = "bus", "iface", "rot", "lut", "core",
+                      "vsync";
+
+        interrupt-parent = <&mdss>;
+        interrupts = <0>;
+        power-domains = <&rpmhpd SM6350_CX>;
+        operating-points-v2 = <&mdp_opp_table>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                endpoint {
+                    remote-endpoint = <&dsi0_in>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                endpoint {
+                    remote-endpoint = <&dsi1_in>;
+                };
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
new file mode 100644
index 000000000000..4fda5205494e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
@@ -0,0 +1,213 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm6350-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM6350 Display MDSS
+
+maintainers:
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
+
+description:
+  SM6350 MSM Mobile Display Subsystem (MDSS), which encapsulates sub-blocks
+  like DPU display controller, DSI and DP interfaces etc.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,sm6350-mdss
+
+  clocks:
+    items:
+      - description: Display AHB clock from gcc
+      - description: Display AXI clock from gcc
+      - description: Display core clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: core
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    maxItems: 2
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sm6350-dpu
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+          - const: qcom,sm6350-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,dsi-phy-10nm
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sm6350.h>
+    #include <dt-bindings/clock/qcom,gcc-sm6350.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-subsystem@ae00000 {
+        compatible = "qcom,sm6350-mdss";
+        reg = <0x0ae00000 0x1000>;
+        reg-names = "mdss";
+
+        power-domains = <&dispcc MDSS_GDSC>;
+
+        clocks = <&gcc GCC_DISP_AHB_CLK>,
+                 <&gcc GCC_DISP_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+        clock-names = "iface", "bus", "core";
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        iommus = <&apps_smmu 0x800 0x2>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        display-controller@ae01000 {
+            compatible = "qcom,sm6350-dpu";
+            reg = <0x0ae01000 0x8f000>,
+                  <0x0aeb0000 0x2008>;
+            reg-names = "mdp", "vbif";
+
+            clocks = <&gcc GCC_DISP_AXI_CLK>,
+              <&dispcc DISP_CC_MDSS_AHB_CLK>,
+              <&dispcc DISP_CC_MDSS_ROT_CLK>,
+              <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+              <&dispcc DISP_CC_MDSS_MDP_CLK>,
+              <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+            clock-names = "bus", "iface", "rot", "lut", "core",
+                    "vsync";
+
+            assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                              <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
+                              <&dispcc DISP_CC_MDSS_ROT_CLK>,
+                              <&dispcc DISP_CC_MDSS_AHB_CLK>;
+            assigned-clock-rates = <300000000>,
+                                   <19200000>,
+                                   <19200000>,
+                                   <19200000>;
+
+            interrupt-parent = <&mdss>;
+            interrupts = <0>;
+            operating-points-v2 = <&mdp_opp_table>;
+            power-domains = <&rpmhpd SM6350_CX>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&dsi0_in>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    dpu_intf2_out: endpoint {
+                        remote-endpoint = <&dsi1_in>;
+                    };
+                };
+            };
+        };
+
+        dsi@ae94000 {
+            compatible = "qcom,sm6350-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+            reg = <0x0ae94000 0x400>;
+            reg-names = "dsi_ctrl";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <4>;
+
+            clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+                     <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+                     <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+                     <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&gcc GCC_DISP_AXI_CLK>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus";
+
+            assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+                              <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+            assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
+            operating-points-v2 = <&dsi_opp_table>;
+            power-domains = <&rpmhpd SM6350_MX>;
+
+            phys = <&dsi0_phy>;
+            phy-names = "dsi";
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
+                    dsi0_in: endpoint {
+                        remote-endpoint = <&dpu_intf1_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    dsi0_out: endpoint {
+                    };
+                };
+            };
+        };
+
+        dsi0_phy: phy@ae94400 {
+            compatible = "qcom,dsi-phy-10nm";
+            reg = <0x0ae94400 0x200>,
+                  <0x0ae94600 0x280>,
+                  <0x0ae94a00 0x1e0>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>, <&rpmhcc RPMH_CXO_CLK>;
+            clock-names = "iface", "ref";
+        };
+    };
+...
-- 
2.39.1

