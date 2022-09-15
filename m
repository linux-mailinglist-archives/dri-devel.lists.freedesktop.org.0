Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7645B9C17
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 15:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E785610EB36;
	Thu, 15 Sep 2022 13:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6900B10EB25
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 13:37:54 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id w8so30410545lft.12
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 06:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=/rfng3AhNVbCjffD+zYL4fZIFA+szevKgvgA9KHfqnw=;
 b=jN1kwkWHYLDBiqe4bwBEbqLHts1QMAEfvWDh2CTwqApWS6f3jpDWR4QNkqI2kaZu0p
 cX95IngFmqlbm8YkuXpzbW4T54r8l/PWz7vLdr3p6gWEdX2AKMowkwpXP8Ty+Cl/NH5Y
 v7AOb8jzGhx1AruXm/DgvzKpg5CedgGU3gWqMq4CZ2CmYnSMU5izwU3zCmRnqyjRcQK8
 TH4TInA1B1/pml9Pq/yoQ+MY4PNCQ3RSqZyb6cFibIjVU3KdYXN/QkUKj5dqtRNyjbYU
 Kft5OyCaS9PICOcDC5aNcVjWYbBU1+pW/DECqaZOmIN9IRgynSE48Oglit8FXWhp7JD4
 1ZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/rfng3AhNVbCjffD+zYL4fZIFA+szevKgvgA9KHfqnw=;
 b=rHEh/k2g1baVDQKzDNq9jF7uvbnCp9JEh1ajZiYCFSxCOj7XzoZRc6NRjVCo6fV1KP
 qQz68g1JOVux/TC3w0C7EFsvsVo9HhWmaROeVMMWg8HoQ+07wGKbd5ITTtq7/V3Cbg5o
 WKRE74cItLDTDcPnEi3LRhavperqbVMCpfglDHhjMNriDu7w57Zbq7aNg71tqyCGve0R
 a9zXzp1PPKFJIFFS/igXhOltS8u8wNxFxj3FFf+J1+1tQChp+dU3gGUYzJJPLokHoLDH
 axtMB3Rfo+t36uDF4Y4ViLkQdVbl5394MahUMmXbYezFSj/TCyXoFdhiuLkAtl6G+khw
 hlSw==
X-Gm-Message-State: ACrzQf2nLx/AjXs8WkmP3squunxCgfCYW54KVSbvHXtvD3c7Lv1l2tPt
 sFg7vrfZQ7kLvJteT67ozArw/g==
X-Google-Smtp-Source: AA6agR7DxSf/jltB/uufDYnEUj+NWa15KLKu6xbVAL7SlezLzpUp8QvUZWRH9lFxruK+6c12yXKcsQ==
X-Received: by 2002:a05:6512:a89:b0:49d:b866:6330 with SMTP id
 m9-20020a0565120a8900b0049db8666330mr2278101lfu.346.1663249073895; 
 Thu, 15 Sep 2022 06:37:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 2-20020a2e0902000000b0026ad753448fsm3142634ljj.85.2022.09.15.06.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 06:37:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v7 12/12] dt-bindings: display/msm: add support for the
 display on SM8250
Date: Thu, 15 Sep 2022 16:37:42 +0300
Message-Id: <20220915133742.115218-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
SM8250 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/mdss-common.yaml     |   4 +-
 .../bindings/display/msm/qcom,sm8250-dpu.yaml |  92 ++++++++++++++++
 .../display/msm/qcom,sm8250-mdss.yaml         | 103 ++++++++++++++++++
 3 files changed, 197 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index 2a476bd0215e..27d7242657b2 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -27,11 +27,11 @@ properties:
 
   clocks:
     minItems: 2
-    maxItems: 3
+    maxItems: 4
 
   clock-names:
     minItems: 2
-    maxItems: 3
+    maxItems: 4
 
   interrupts:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml
new file mode 100644
index 000000000000..9ff8a265c85f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm8250-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8250 Display DPU
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sm8250-dpu
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
+      - description: Display ahb clock
+      - description: Display hf axi clock
+      - description: Display core clock
+      - description: Display vsync clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: core
+      - const: vsync
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sm8250.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-controller@ae01000 {
+        compatible = "qcom,sm8250-dpu";
+        reg = <0x0ae01000 0x8f000>,
+              <0x0aeb0000 0x2008>;
+        reg-names = "mdp", "vbif";
+
+        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+        clock-names = "iface", "bus", "core", "vsync";
+
+        assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+        assigned-clock-rates = <19200000>;
+
+        operating-points-v2 = <&mdp_opp_table>;
+        power-domains = <&rpmhpd SM8250_MMCX>;
+
+        interrupt-parent = <&mdss>;
+        interrupts = <0>;
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
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
new file mode 100644
index 000000000000..ec806535b804
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm8250-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8250 Display MDSS
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+description:
+  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
+  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
+  bindings of MDSS are mentioned for SM8250 target.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,sm8250-mdss
+
+  clocks:
+    items:
+      - description: Display AHB clock from gcc
+      - description: Display hf axi clock
+      - description: Display sf axi clock
+      - description: Display core clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: nrt_bus
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
+        const: qcom,sm8250-dpu
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,mdss-dsi-ctrl
+
+  "^dsi-phy@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,dsi-phy-7nm
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sm8250.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-subsystem@ae00000 {
+        compatible = "qcom,sm8250-mdss";
+        reg = <0x0ae00000 0x1000>;
+        reg-names = "mdss";
+
+        interconnects = <&mmss_noc MASTER_MDP_PORT0 &mc_virt SLAVE_EBI_CH0>,
+                        <&mmss_noc MASTER_MDP_PORT1 &mc_virt SLAVE_EBI_CH0>;
+        interconnect-names = "mdp0-mem", "mdp1-mem";
+
+        power-domains = <&dispcc MDSS_GDSC>;
+
+        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&gcc GCC_DISP_SF_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+        clock-names = "iface", "bus", "nrt_bus", "core";
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        iommus = <&apps_smmu 0x820 0x402>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+    };
+...
-- 
2.35.1

