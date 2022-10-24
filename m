Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF7060B217
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 18:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDF010E4B6;
	Mon, 24 Oct 2022 16:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E49810E43A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 16:42:35 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id bn35so4824274ljb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 09:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TaXlLu55aUSWM9Cz3zheB3Tvou5cVNjDkYkXMOzFMPU=;
 b=dU//SWiBlfsGOOfV9w2Hfvk0BsvebkgDH/Lm6PogTF3NgtOml7FcJAmM94qre5/Y4U
 KUvd6u5t1b0lpO+75gNexk0ceAb/e+hRb1avNkLrJzmCZ+zn2iQ0Ks7pMjTzBNKK1GqT
 JjICe5H3yPLV8gQ1oZwfDMy1jbfz2Qn+CmvS7dyaqN/AyfY1I7JlR1iZodAThzu3O1nJ
 obYulzyqKiDn0KKejCg6SQM+RXdrUZSYiIQD7fGvJUeg339BhZV7v3A+MAM6mjKeAhaQ
 GtzGS4gVB7aCRikciu5uTkG/oAdtpJGO51px3qmN2Fdu7H2TIYq6/LQdaV2FJv37osOw
 FPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TaXlLu55aUSWM9Cz3zheB3Tvou5cVNjDkYkXMOzFMPU=;
 b=fqvvd/yiUWrhYnqhOxrQj/7rEkQ5xFukz9ofKHwFqf0pqjKhQdDOlXXE6ufGfOusnh
 rUpJqKFKrb4VgQVvNQwW6E/5JWeterjkf4gj5TnPSuGvQDk6MqsS4bQGJp2YAsJwiVFA
 x6m4FZ+yzpIdodbhJ+yeqCxQlkTT6kgrNGum6PiofDXUitSN1a8afxumeB1rrNAtN8wy
 q2AlsVJ8b4EBQ6lYgp1CoDQCCMsLC1HyBCtlN7+pn1KZ8vQBCHIyAqd3Rmm6fhwlOpko
 6xWLidZY5EAY0y4rzYCmV1+rENhMZp2sK9bRXMuHL7nnJFc56vLu+0R5Wmsnuvd1mPlN
 rk6A==
X-Gm-Message-State: ACrzQf2KvmSiytyq2GY7R+sKCSy7R2U2qzZUq2JNqvBTldMiXv5NdtSD
 D1IL7kMWQP8/F/jT2lVCa4Rd2w==
X-Google-Smtp-Source: AMsMyM4XwyyJXQNliU0D7Re1jXusH0Qqfg69qmytcN76GbBbtIFXQX6U2DndHTTnDMNv1APVGhbv4A==
X-Received: by 2002:a2e:b16b:0:b0:26e:9408:8301 with SMTP id
 a11-20020a2eb16b000000b0026e94088301mr12292575ljm.523.1666629753262; 
 Mon, 24 Oct 2022 09:42:33 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 k14-20020ac2456e000000b004948378080csm4593978lfm.290.2022.10.24.09.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 09:42:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v9 08/12] dt-bindings: display/msm: split dpu-sdm845 into DPU
 and MDSS parts
Date: Mon, 24 Oct 2022 19:42:21 +0300
Message-Id: <20221024164225.3236654-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
References: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to make the schema more readable, split dpu-sdm845 into the DPU
and MDSS parts, each one describing just a single device binding.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-sdm845.yaml      | 148 ------------------
 .../bindings/display/msm/qcom,sdm845-dpu.yaml |  90 +++++++++++
 .../display/msm/qcom,sdm845-mdss.yaml         | 117 ++++++++++++++
 3 files changed, 207 insertions(+), 148 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
deleted file mode 100644
index ae649bb6aa81..000000000000
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ /dev/null
@@ -1,148 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/display/msm/dpu-sdm845.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm Display DPU dt properties for SDM845 target
-
-maintainers:
-  - Krishna Manikandan <quic_mkrishn@quicinc.com>
-
-description: |
-  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
-  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
-  bindings of MDSS and DPU are mentioned for SDM845 target.
-
-$ref: /schemas/display/msm/mdss-common.yaml#
-
-properties:
-  compatible:
-    items:
-      - const: qcom,sdm845-mdss
-
-  clocks:
-    items:
-      - description: Display AHB clock from gcc
-      - description: Display core clock
-
-  clock-names:
-    items:
-      - const: iface
-      - const: core
-
-  iommus:
-    maxItems: 2
-
-  interconnects:
-    maxItems: 2
-
-  interconnect-names:
-    maxItems: 2
-
-patternProperties:
-  "^display-controller@[0-9a-f]+$":
-    type: object
-    $ref: /schemas/display/msm/dpu-common.yaml#
-    description: Node containing the properties of DPU.
-    unevaluatedProperties: false
-
-    properties:
-      compatible:
-        items:
-          - const: qcom,sdm845-dpu
-
-      reg:
-        items:
-          - description: Address offset and size for mdp register set
-          - description: Address offset and size for vbif register set
-
-      reg-names:
-        items:
-          - const: mdp
-          - const: vbif
-
-      clocks:
-        items:
-          - description: Display GCC bus clock
-          - description: Display ahb clock
-          - description: Display axi clock
-          - description: Display core clock
-          - description: Display vsync clock
-
-      clock-names:
-        items:
-          - const: gcc-bus
-          - const: iface
-          - const: bus
-          - const: core
-          - const: vsync
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
-    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/power/qcom-rpmpd.h>
-
-    display-subsystem@ae00000 {
-          #address-cells = <1>;
-          #size-cells = <1>;
-          compatible = "qcom,sdm845-mdss";
-          reg = <0x0ae00000 0x1000>;
-          reg-names = "mdss";
-          power-domains = <&dispcc MDSS_GDSC>;
-
-          clocks = <&gcc GCC_DISP_AHB_CLK>,
-                   <&dispcc DISP_CC_MDSS_MDP_CLK>;
-          clock-names = "iface", "core";
-
-          interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
-          interrupt-controller;
-          #interrupt-cells = <1>;
-
-          iommus = <&apps_smmu 0x880 0x8>,
-                   <&apps_smmu 0xc80 0x8>;
-          ranges;
-
-          display-controller@ae01000 {
-                    compatible = "qcom,sdm845-dpu";
-                    reg = <0x0ae01000 0x8f000>,
-                          <0x0aeb0000 0x2008>;
-                    reg-names = "mdp", "vbif";
-
-                    clocks = <&gcc GCC_DISP_AXI_CLK>,
-                             <&dispcc DISP_CC_MDSS_AHB_CLK>,
-                             <&dispcc DISP_CC_MDSS_AXI_CLK>,
-                             <&dispcc DISP_CC_MDSS_MDP_CLK>,
-                             <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-                    clock-names = "gcc-bus", "iface", "bus", "core", "vsync";
-
-                    interrupt-parent = <&mdss>;
-                    interrupts = <0>;
-                    power-domains = <&rpmhpd SDM845_CX>;
-                    operating-points-v2 = <&mdp_opp_table>;
-
-                    ports {
-                           #address-cells = <1>;
-                           #size-cells = <0>;
-
-                           port@0 {
-                                   reg = <0>;
-                                   dpu_intf1_out: endpoint {
-                                                  remote-endpoint = <&dsi0_in>;
-                                   };
-                           };
-
-                           port@1 {
-                                   reg = <1>;
-                                   dpu_intf2_out: endpoint {
-                                                  remote-endpoint = <&dsi1_in>;
-                                   };
-                           };
-                    };
-          };
-    };
-...
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
new file mode 100644
index 000000000000..5719b45f2860
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sdm845-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DPU dt properties for SDM845 target
+
+maintainers:
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,sdm845-dpu
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
+      - description: Display GCC bus clock
+      - description: Display ahb clock
+      - description: Display axi clock
+      - description: Display core clock
+      - description: Display vsync clock
+
+  clock-names:
+    items:
+      - const: gcc-bus
+      - const: iface
+      - const: bus
+      - const: core
+      - const: vsync
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-controller@ae01000 {
+        compatible = "qcom,sdm845-dpu";
+        reg = <0x0ae01000 0x8f000>,
+              <0x0aeb0000 0x2008>;
+        reg-names = "mdp", "vbif";
+
+        clocks = <&gcc GCC_DISP_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&dispcc DISP_CC_MDSS_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+        clock-names = "gcc-bus", "iface", "bus", "core", "vsync";
+
+        interrupt-parent = <&mdss>;
+        interrupts = <0>;
+        power-domains = <&rpmhpd SDM845_CX>;
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
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
new file mode 100644
index 000000000000..47fe66f4da54
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sdm845-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SDM845 Display MDSS
+
+maintainers:
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
+
+description:
+  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
+  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
+  bindings of MDSS are mentioned for SDM845 target.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,sdm845-mdss
+
+  clocks:
+    items:
+      - description: Display AHB clock from gcc
+      - description: Display core clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+
+  iommus:
+    maxItems: 2
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
+        const: qcom,sdm845-dpu
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-subsystem@ae00000 {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        compatible = "qcom,sdm845-mdss";
+        reg = <0x0ae00000 0x1000>;
+        reg-names = "mdss";
+        power-domains = <&dispcc MDSS_GDSC>;
+
+        clocks = <&gcc GCC_DISP_AHB_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+        clock-names = "iface", "core";
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        iommus = <&apps_smmu 0x880 0x8>,
+                 <&apps_smmu 0xc80 0x8>;
+        ranges;
+
+        display-controller@ae01000 {
+            compatible = "qcom,sdm845-dpu";
+            reg = <0x0ae01000 0x8f000>,
+                  <0x0aeb0000 0x2008>;
+            reg-names = "mdp", "vbif";
+
+            clocks = <&gcc GCC_DISP_AXI_CLK>,
+                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&dispcc DISP_CC_MDSS_AXI_CLK>,
+                     <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+            clock-names = "gcc-bus", "iface", "bus", "core", "vsync";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <0>;
+            power-domains = <&rpmhpd SDM845_CX>;
+            operating-points-v2 = <&mdp_opp_table>;
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
+    };
+...
-- 
2.35.1

