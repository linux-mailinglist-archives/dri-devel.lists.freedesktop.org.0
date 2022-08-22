Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D602159C9E6
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 22:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D7AA1AA5;
	Mon, 22 Aug 2022 20:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB82A1A2F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 20:18:13 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id m5so6179085lfj.4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 13:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=YumEi+1R+LSFWRkSParSS1iXx5FRr/cl1lyMwhOFsoo=;
 b=UT3/rxv7uMjVi0Jj6q3WOTHHnYuPvpfFu1/NM+mKVOm/ypM+YS4zwDushgYEjZe6me
 4yJU8ZnpPUBzGRZG6WFL6SLiXsz8pQyWSycG/oGCW2MgLZz5zsaI5TZl2dQRqAijd4B2
 QIY6FL6hUKrWCiOHWWt07jbW32GnRG7QbTJ38XrF2heq1IqtBUFizyd3PGaIZaa5YW79
 Tkm+aMV8C18BvPnlBaOezwLKIwKry5cBObrCf0IaYPsBioqHlEZt73E9LTh+IWx0QnNw
 johGhdDjE9hlanxchuV6il2H7xgbNADDcbmiZr7fxTGzG9PGs2mnDBKNuxadY6ZqENQU
 Jk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=YumEi+1R+LSFWRkSParSS1iXx5FRr/cl1lyMwhOFsoo=;
 b=DnsHuc1rgZRplRrH/AR/Hff+x0zZKmBCtLVUghAp6cLYdeicfLOFqrOhNphyBH5UHG
 QrDcNftogyOH2/wPFD3WescF+Z2KM62sMubaE8I23S9Fsz0Bad4rIoIcH7F4D/eiNUgt
 PFmePfKmFTS7qymPwbEzVSXXG05KUiW6eP1YIs/kGys8KRFbxImrkbGGJfRC5n7p10FJ
 q+9vUhYk/NCBhISDahqGqOnij1L2lkMkeYdX/C9b7AvqtjG6x9O7Q0UgrSe1OU2Ax/Pt
 vn6686wTpwrDiLHUkYFpUfIxlTkCAb0ZnleMFv1O/KsUQ01PNUQth9ghFwo1s99am1cg
 B2ww==
X-Gm-Message-State: ACgBeo3KXGEE7RzDae/GpZ4m4/xDvrJGq7xJtCZLnCkYHDiHmTJtPvSF
 MJKoyk4g5DfYYr7xGDfG3bnA/A==
X-Google-Smtp-Source: AA6agR4PM8BJDqLB0SGfwn/GeUf+uzXSEdXVt4CvfgfoIRAQu2NrWfjQNbVg0mo0Db7a4++bx5YhfQ==
X-Received: by 2002:a05:6512:3984:b0:492:da1b:9683 with SMTP id
 j4-20020a056512398400b00492da1b9683mr4021826lfu.58.1661199491847; 
 Mon, 22 Aug 2022 13:18:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 h16-20020a2e5310000000b0025e5cd1620fsm2000429ljb.57.2022.08.22.13.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 13:18:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 2/9] dt-bindings: display/msm: move qcom,
 sdm845-mdss schema to mdss.yaml
Date: Mon, 22 Aug 2022 23:18:01 +0300
Message-Id: <20220822201808.347783-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220822201808.347783-1-dmitry.baryshkov@linaro.org>
References: <20220822201808.347783-1-dmitry.baryshkov@linaro.org>
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

Move schema for qcom,sdm845-mdss from dpu-sdm845.yaml to mdss.yaml so
that the dpu file describes only the DPU schema.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-sdm845.yaml      | 135 ++++-----------
 .../devicetree/bindings/display/msm/mdss.yaml | 156 ++++++++++++++----
 2 files changed, 160 insertions(+), 131 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index 2bb8896beffc..2074e954372f 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -10,139 +10,74 @@ maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 description: |
-  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
-  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
-  bindings of MDSS and DPU are mentioned for SDM845 target.
+  Device tree bindings for the DPU display controller for SDM845 target.
 
 properties:
   compatible:
     items:
-      - const: qcom,sdm845-mdss
+      - const: qcom,sdm845-dpu
 
   reg:
-    maxItems: 1
+    items:
+      - description: Address offset and size for mdp register set
+      - description: Address offset and size for vbif register set
 
   reg-names:
-    const: mdss
-
-  power-domains:
-    maxItems: 1
+    items:
+      - const: mdp
+      - const: vbif
 
   clocks:
     items:
-      - description: Display AHB clock from gcc
+      - description: Display ahb clock
+      - description: Display axi clock
       - description: Display core clock
+      - description: Display vsync clock
 
   clock-names:
     items:
       - const: iface
+      - const: bus
       - const: core
+      - const: vsync
 
   interrupts:
     maxItems: 1
 
-  interrupt-controller: true
-
-  "#address-cells": true
-
-  "#size-cells": true
-
-  "#interrupt-cells":
-    const: 1
-
-  iommus:
-    items:
-      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
-      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
-
-  ranges: true
-
-  resets:
-    items:
-      - description: MDSS_CORE reset
+  power-domains:
+    maxItems: 1
 
-patternProperties:
-  "^display-controller@[0-9a-f]+$":
-    type: object
-    description: Node containing the properties of DPU.
+  operating-points-v2: true
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      Contains the list of output ports from DPU device. These ports
+      connect to interfaces that are external to the DPU hardware,
+      such as DSI, DP etc. Each output port contains an endpoint that
+      describes how it is connected to an external interface.
 
     properties:
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
-          - description: Display ahb clock
-          - description: Display axi clock
-          - description: Display core clock
-          - description: Display vsync clock
-
-      clock-names:
-        items:
-          - const: iface
-          - const: bus
-          - const: core
-          - const: vsync
-
-      interrupts:
-        maxItems: 1
-
-      power-domains:
-        maxItems: 1
-
-      operating-points-v2: true
-      ports:
-        $ref: /schemas/graph.yaml#/properties/ports
-        description: |
-          Contains the list of output ports from DPU device. These ports
-          connect to interfaces that are external to the DPU hardware,
-          such as DSI, DP etc. Each output port contains an endpoint that
-          describes how it is connected to an external interface.
-
-        properties:
-          port@0:
-            $ref: /schemas/graph.yaml#/properties/port
-            description: DPU_INTF1 (DSI1)
-
-          port@1:
-            $ref: /schemas/graph.yaml#/properties/port
-            description: DPU_INTF2 (DSI2)
-
-        required:
-          - port@0
-          - port@1
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DPU_INTF1 (DSI1)
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DPU_INTF2 (DSI2)
 
     required:
-      - compatible
-      - reg
-      - reg-names
-      - clocks
-      - interrupts
-      - power-domains
-      - operating-points-v2
-      - ports
+      - port@0
+      - port@1
 
 required:
   - compatible
   - reg
   - reg-names
-  - power-domains
   - clocks
   - interrupts
-  - interrupt-controller
-  - iommus
-  - ranges
+  - power-domains
+  - operating-points-v2
+  - ports
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/msm/mdss.yaml b/Documentation/devicetree/bindings/display/msm/mdss.yaml
index 6a8ec8310f6f..db36c54d6106 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
@@ -17,18 +17,16 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,sdm845-mdss
       - qcom,mdss
 
   reg:
-    minItems: 2
+    minItems: 1
     maxItems: 3
 
   reg-names:
-    minItems: 2
-    items:
-      - const: mdss_phys
-      - const: vbif_phys
-      - const: vbif_nrt_phys
+    minItems: 1
+    maxItems: 3
 
   interrupts:
     maxItems: 1
@@ -53,10 +51,10 @@ properties:
     maxItems: 4
 
   "#address-cells":
-    const: 1
+    enum: [1, 2]
 
   "#size-cells":
-    const: 1
+    enum: [1, 2]
 
   ranges:
     true
@@ -65,29 +63,99 @@ properties:
     items:
       - description: MDSS_CORE reset
 
-oneOf:
-  - properties:
-      clocks:
-        minItems: 3
-        maxItems: 4
-
-      clock-names:
-        minItems: 3
-        items:
-          - const: iface
-          - const: bus
-          - const: vsync
-          - const: core
-  - properties:
-      clocks:
-        minItems: 1
-        maxItems: 2
-
-      clock-names:
-        minItems: 1
-        items:
-          - const: iface
-          - const: core
+  interconnects:
+    minItems: 2
+    items:
+      - description: MDP port 0
+      - description: MDP port 1
+      - description: Rotator
+
+  interconnect-names:
+    minItems: 2
+    items:
+      - const: mdp0-mem
+      - const: mdp1-mem
+      - const: rotator-mem
+
+  iommus:
+    items:
+      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
+      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,mdss
+    then:
+      properties:
+        reg-names:
+          minItems: 2
+          items:
+            - const: mdss_phys
+            - const: vbif_phys
+            - const: vbif_nrt_phys
+      oneOf:
+        - properties:
+            clocks:
+              minItems: 3
+              maxItems: 4
+
+            clock-names:
+              minItems: 3
+              items:
+                - const: iface
+                - const: bus
+                - const: vsync
+                - const: core
+        - properties:
+            clocks:
+              minItems: 1
+              maxItems: 2
+
+            clock-names:
+              minItems: 1
+              items:
+                - const: iface
+                - const: core
+    else:
+      properties:
+        regs:
+          maxItems: 1
+
+        reg-names:
+          items:
+            - const: mdss
+
+        interconnects:
+          maxItems: 2
+
+        interconnect-names:
+          maxItems: 2
+
+      required:
+        - iommus
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sdm845-mdss
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Display AHB clock from gcc
+            - description: Display core clock
+
+        clock-names:
+          items:
+            - const: iface
+            - const: core
+
+        iommus:
+          minItems: 2
 
 required:
   - compatible
@@ -108,6 +176,9 @@ patternProperties:
     type: object
     # TODO: add reference once the mdp5 is converted
 
+  "^display-controller@[1-9a-f][0-9a-f]*$":
+    $ref: dpu-sdm845.yaml
+
   "^dsi@[1-9a-f][0-9a-f]*$":
     $ref: dsi-controller-main.yaml#
 
@@ -158,4 +229,27 @@ examples:
       ranges;
 
     };
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    display-subsystem@ae00000 {
+          #address-cells = <1>;
+          #size-cells = <1>;
+          compatible = "qcom,sdm845-mdss";
+          reg = <0x0ae00000 0x1000>;
+          reg-names = "mdss";
+          power-domains = <&dispcc MDSS_GDSC>;
+
+          clocks = <&gcc 19>,
+                   <&dispcc 12>;
+          clock-names = "iface", "core";
+
+          interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+          interrupt-controller;
+          #interrupt-cells = <1>;
+
+          iommus = <&apps_smmu 0x880 0x8>,
+                   <&apps_smmu 0xc80 0x8>;
+          ranges;
+        };
 ...
-- 
2.35.1

