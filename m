Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B8E5B9C1A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 15:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3159810EB23;
	Thu, 15 Sep 2022 13:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79EF10EB34
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 13:37:49 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id bn9so22228283ljb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 06:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=SCI6D5X4mRTpkQ1oFKXi2cH6JHc9Zl+mWS9mB2dRkfM=;
 b=X1xYeK6yL0FddiHeGOc5DbpepqpXoqvzK0cpR24yjiBrLtOHFkI9WdAy/E8nJqBFY6
 yoMPya1z5JzSPdS4TY9a7660bcoTKe5cbzd3n/9Y1tBL13sflLpT/lbuHRB6XIaRLyyR
 RI73tSEiLr5CWjtJIxAlS2XDGYQSDz6g0dQvL1Opui/9bUMTQ5+IzYg1RbR7/8uMzsPV
 +65TfMmgD8XOt4WXk6wJtP8UDeo7Pn92HObi2tGOUrdM5KHQ81ZrIxJg6eUBRx4VZ16v
 jg4r2TjMe61K77I6Nkax/3aOLwY9zq0euqsGnnZLWcwbSwaOgnGktwkojjD122IqKK6t
 GqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=SCI6D5X4mRTpkQ1oFKXi2cH6JHc9Zl+mWS9mB2dRkfM=;
 b=47DfOcsMur09/DivveOcSFJcNfdY8tBQPh8JUMba7+5kyPcQGz5/8I1GPcjdlVZRxd
 iT+7miJivAWf6OJflD3MYrhCMnVf+tNoHTPJDgvvpoo2UJ4zTx4OFC6wA1IchISEhNDw
 g4FkZlxaEGHLFEPugeBdbTED2zPLl0+9YW66gElr70mpHadof2XxykZ9RMar2xsfiLbp
 lAIn62EO8kwI6Qzku9E1zWriQnOjRMREpHk1hWWwzZh3544ZO8f+Q777p6zoOBwDU/XM
 Xv9Ne83thUbJxCFX111YmZ3yq3cAQhHGXdtXxaERdbEQ31zdjbxSnbydIMfJNvmSrrlt
 JqTw==
X-Gm-Message-State: ACgBeo3z2ZA+sLRLGsFjJC3eTUtE1R85wHksgI3gl2ldUeOGvyggMXPb
 hhst4s7XhGznOB5MQXk704mC9w==
X-Google-Smtp-Source: AA6agR5PnV/krJSIHO0oVG9GwUsbJCeqZ3jWkFxH4V+5XXdklxbMIApEsl46tDDMy3ip9qp+pcu3nw==
X-Received: by 2002:a2e:9650:0:b0:26b:ef42:7168 with SMTP id
 z16-20020a2e9650000000b0026bef427168mr7455643ljh.346.1663249067582; 
 Thu, 15 Sep 2022 06:37:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 2-20020a2e0902000000b0026ad753448fsm3142634ljj.85.2022.09.15.06.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 06:37:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v7 05/12] dt-bindings: display/msm: move common MDSS
 properties to mdss-common.yaml
Date: Thu, 15 Sep 2022 16:37:35 +0300
Message-Id: <20220915133742.115218-6-dmitry.baryshkov@linaro.org>
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

Move properties common to all MDSS DT nodes to the mdss-common.yaml.

This extends qcom,msm8998-mdss schema to allow interconnect nodes, which
will be added later, once msm8998 gains interconnect support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-msm8998.yaml     | 41 +--------
 .../bindings/display/msm/dpu-qcm2290.yaml     | 51 ++----------
 .../bindings/display/msm/dpu-sc7180.yaml      | 50 ++---------
 .../bindings/display/msm/dpu-sc7280.yaml      | 50 ++---------
 .../bindings/display/msm/dpu-sdm845.yaml      | 54 ++----------
 .../bindings/display/msm/mdss-common.yaml     | 83 +++++++++++++++++++
 6 files changed, 111 insertions(+), 218 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-common.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
index 200eeace1c71..67791dbc3b5d 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
@@ -14,20 +14,13 @@ description: |
   sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
   bindings of MDSS and DPU are mentioned for MSM8998 target.
 
+$ref: /schemas/display/msm/mdss-common.yaml#
+
 properties:
   compatible:
     items:
       - const: qcom,msm8998-mdss
 
-  reg:
-    maxItems: 1
-
-  reg-names:
-    const: mdss
-
-  power-domains:
-    maxItems: 1
-
   clocks:
     items:
       - description: Display AHB clock
@@ -40,23 +33,8 @@ properties:
       - const: bus
       - const: core
 
-  interrupts:
-    maxItems: 1
-
-  interrupt-controller: true
-
-  "#address-cells": true
-
-  "#size-cells": true
-
-  "#interrupt-cells":
-    const: 1
-
   iommus:
-    items:
-      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
-
-  ranges: true
+    maxItems: 1
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":
@@ -100,18 +78,7 @@ patternProperties:
           - const: core
           - const: vsync
 
-required:
-  - compatible
-  - reg
-  - reg-names
-  - power-domains
-  - clocks
-  - interrupts
-  - interrupt-controller
-  - iommus
-  - ranges
-
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
index d5f1d16b13d3..42e676bdda4e 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -14,20 +14,13 @@ description: |
   sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
   and DPU are mentioned for QCM2290 target.
 
+$ref: /schemas/display/msm/mdss-common.yaml#
+
 properties:
   compatible:
     items:
       - const: qcom,qcm2290-mdss
 
-  reg:
-    maxItems: 1
-
-  reg-names:
-    const: mdss
-
-  power-domains:
-    maxItems: 1
-
   clocks:
     items:
       - description: Display AHB clock from gcc
@@ -40,35 +33,14 @@ properties:
       - const: bus
       - const: core
 
-  interrupts:
-    maxItems: 1
-
-  interrupt-controller: true
-
-  "#address-cells": true
-
-  "#size-cells": true
-
-  "#interrupt-cells":
-    const: 1
-
   iommus:
-    items:
-      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
-      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
-
-  ranges: true
+    maxItems: 2
 
   interconnects:
-    items:
-      - description: Interconnect path specifying the port ids for data bus
+    maxItems: 1
 
   interconnect-names:
-    const: mdp0-mem
-
-  resets:
-    items:
-      - description: MDSS_CORE reset
+    maxItems: 1
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":
@@ -108,18 +80,7 @@ patternProperties:
           - const: lut
           - const: vsync
 
-required:
-  - compatible
-  - reg
-  - reg-names
-  - power-domains
-  - clocks
-  - interrupts
-  - interrupt-controller
-  - iommus
-  - ranges
-
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
index 2ac10664d79a..99d6bbd45faf 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
@@ -14,20 +14,13 @@ description: |
   sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
   bindings of MDSS and DPU are mentioned for SC7180 target.
 
+$ref: /schemas/display/msm/mdss-common.yaml#
+
 properties:
   compatible:
     items:
       - const: qcom,sc7180-mdss
 
-  reg:
-    maxItems: 1
-
-  reg-names:
-    const: mdss
-
-  power-domains:
-    maxItems: 1
-
   clocks:
     items:
       - description: Display AHB clock from gcc
@@ -40,34 +33,14 @@ properties:
       - const: ahb
       - const: core
 
-  interrupts:
-    maxItems: 1
-
-  interrupt-controller: true
-
-  "#address-cells": true
-
-  "#size-cells": true
-
-  "#interrupt-cells":
-    const: 1
-
   iommus:
-    items:
-      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
-
-  ranges: true
+    maxItems: 1
 
   interconnects:
-    items:
-      - description: Interconnect path specifying the port ids for data bus
+    maxItems: 1
 
   interconnect-names:
-    const: mdp0-mem
-
-  resets:
-    items:
-      - description: MDSS_CORE reset
+    maxItems: 1
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":
@@ -109,18 +82,7 @@ patternProperties:
           - const: core
           - const: vsync
 
-required:
-  - compatible
-  - reg
-  - reg-names
-  - power-domains
-  - clocks
-  - interrupts
-  - interrupt-controller
-  - iommus
-  - ranges
-
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
index 4ca7bc7f0185..01ff88c06c51 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
@@ -14,19 +14,12 @@ description: |
   sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
   bindings of MDSS and DPU are mentioned for SC7280.
 
+$ref: /schemas/display/msm/mdss-common.yaml#
+
 properties:
   compatible:
     const: qcom,sc7280-mdss
 
-  reg:
-    maxItems: 1
-
-  reg-names:
-    const: mdss
-
-  power-domains:
-    maxItems: 1
-
   clocks:
     items:
       - description: Display AHB clock from gcc
@@ -39,34 +32,14 @@ properties:
       - const: ahb
       - const: core
 
-  interrupts:
-    maxItems: 1
-
-  interrupt-controller: true
-
-  "#address-cells": true
-
-  "#size-cells": true
-
-  "#interrupt-cells":
-    const: 1
-
   iommus:
-    items:
-      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
-
-  ranges: true
+    maxItems: 1
 
   interconnects:
-    items:
-      - description: Interconnect path specifying the port ids for data bus
+    maxItems: 1
 
   interconnect-names:
-    const: mdp0-mem
-
-  resets:
-    items:
-      - description: MDSS_CORE reset
+    maxItems: 1
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":
@@ -107,18 +80,7 @@ patternProperties:
           - const: core
           - const: vsync
 
-required:
-  - compatible
-  - reg
-  - reg-names
-  - power-domains
-  - clocks
-  - interrupts
-  - interrupt-controller
-  - iommus
-  - ranges
-
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index de193ca11265..ae649bb6aa81 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -14,20 +14,13 @@ description: |
   sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
   bindings of MDSS and DPU are mentioned for SDM845 target.
 
+$ref: /schemas/display/msm/mdss-common.yaml#
+
 properties:
   compatible:
     items:
       - const: qcom,sdm845-mdss
 
-  reg:
-    maxItems: 1
-
-  reg-names:
-    const: mdss
-
-  power-domains:
-    maxItems: 1
-
   clocks:
     items:
       - description: Display AHB clock from gcc
@@ -38,38 +31,14 @@ properties:
       - const: iface
       - const: core
 
-  interrupts:
-    maxItems: 1
-
-  interrupt-controller: true
-
-  "#address-cells": true
-
-  "#size-cells": true
-
-  "#interrupt-cells":
-    const: 1
-
   iommus:
-    items:
-      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
-      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
-
-  ranges: true
+    maxItems: 2
 
   interconnects:
-    items:
-      - description: Interconnect path from mdp0 port to the data bus
-      - description: Interconnect path from mdp1 port to the data bus
+    maxItems: 2
 
   interconnect-names:
-    items:
-      - const: mdp0-mem
-      - const: mdp1-mem
-
-  resets:
-    items:
-      - description: MDSS_CORE reset
+    maxItems: 2
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":
@@ -109,18 +78,7 @@ patternProperties:
           - const: core
           - const: vsync
 
-required:
-  - compatible
-  - reg
-  - reg-names
-  - power-domains
-  - clocks
-  - interrupts
-  - interrupt-controller
-  - iommus
-  - ranges
-
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
new file mode 100644
index 000000000000..2a476bd0215e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/mdss-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display MDSS common properties
+
+maintainers:
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+  - Rob Clark <robdclark@gmail.com>
+
+description:
+  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
+  sub-blocks like DPU display controller, DSI and DP interfaces etc.
+
+properties:
+  reg:
+    maxItems: 1
+
+  reg-names:
+    const: mdss
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 3
+
+  clock-names:
+    minItems: 2
+    maxItems: 3
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#address-cells": true
+
+  "#size-cells": true
+
+  "#interrupt-cells":
+    const: 1
+
+  iommus:
+    minItems: 1
+    items:
+      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
+      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
+
+  ranges: true
+
+  interconnects:
+    minItems: 1
+    items:
+      - description: Interconnect path from mdp0 (or a single mdp) port to the data bus
+      - description: Interconnect path from mdp1 port to the data bus
+
+  interconnect-names:
+    minItems: 1
+    items:
+      - const: mdp0-mem
+      - const: mdp1-mem
+
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - power-domains
+  - clocks
+  - interrupts
+  - interrupt-controller
+  - iommus
+  - ranges
+
+additionalProperties: true
-- 
2.35.1

