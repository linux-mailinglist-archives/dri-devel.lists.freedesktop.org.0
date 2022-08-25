Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 487415A0D28
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 11:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9002411216C;
	Thu, 25 Aug 2022 09:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCF81138C3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 09:51:09 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id x10so18900207ljq.4
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 02:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=bU2avyUHwN6VM4u370PvLRLbb5vzzoJzTSKFs8t/yUc=;
 b=DVMJfsEICPE3pNBGxzEZ+Y+ZnHdUMqwnApWscjXtl+5RVETcmjWnxyK3sx75jqtBRM
 hzdqAfI9Rt2e2iZQv0jDKzpDeIX3+rg8C86BPMonyXY4R1yII1YaSqgnCeNUYb+Z5iRH
 IJ0aYTsx+w6YppudYOvrfDwLR+O7LFGfdaQ+Lhj8Zb5PTb+Gb86SHht+xRA1q9ib/2pl
 as1J1pwcP4TsmDanTW6NgTK/iRtPo5CC3/RVzArmnB/aImfVhTzJeoHuiFFsUaQjwrle
 WxzbLUs2veuqWraFXix4a9ab5e16a5o5ULfYfSdTef2uz/pZG73kmn3TbA1ye6vkJgdE
 pPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=bU2avyUHwN6VM4u370PvLRLbb5vzzoJzTSKFs8t/yUc=;
 b=BB+wRedWlthjekUc5rvFi1uEkxHt0eBjmArmsfNjWKcKDYWi0hZIKqdvko5hb4mr1S
 7vhYKx6rT5kAkajqnvGWxPjvKd7y5SpHVTzec0NPrrse40Ay24qLIyRkMZhIysRtdayd
 FnWgUScPIFhz3gjw1Tf73T9Fux6EV49/lVilc98uVxbXyp+IC252fdN4agW+VGS2XQgg
 GZFxdT2hG4wRFWQJmXcfd+gwDNXOV2FpgLnqntVZNXxjD2BAoLEsDy189f4Tgw7jTJQD
 J2zgCHGu7Hm09FGwvw2aSiB7RzdnDI8P0nS048gCYHmnLQG3XiwX2RoUIhhoaNT4CZ8x
 ejwg==
X-Gm-Message-State: ACgBeo2WhjGccLA+wRrjEVeU0pkMyv9qyM25F1ixYQmnMhHr4V4cMjGN
 i6+1bJ7QaQgXg+O2xyb3jIygFg==
X-Google-Smtp-Source: AA6agR5RtW5hLmRPOyJZT/9z5WezpWHZf1PgD2CJ00Ltn05BRuiB11YQ4JWu4tqD6aXd4SJ42WP3rQ==
X-Received: by 2002:a2e:b809:0:b0:261:be83:a2b0 with SMTP id
 u9-20020a2eb809000000b00261be83a2b0mr847561ljo.219.1661421067787; 
 Thu, 25 Aug 2022 02:51:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 h10-20020a056512220a00b00492cfecf1c0sm398502lfu.245.2022.08.25.02.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 02:51:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v4 03/10] dt-bindings: display/msm: move qcom,
 sc7180-mdss schema to mdss.yaml
Date: Thu, 25 Aug 2022 12:50:56 +0300
Message-Id: <20220825095103.624891-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
References: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
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

Move schema for qcom,sc7180-mdss from dpu-sc7180.yaml to mdss.yaml so
that the dpu file describes only the DPU schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-sc7180.yaml      | 149 +++++-------------
 .../devicetree/bindings/display/msm/mdss.yaml |  66 +++++++-
 2 files changed, 102 insertions(+), 113 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
index d3c3e4b07897..9d4ec0b60c25 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
@@ -10,151 +10,78 @@ maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 description: |
-  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
-  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
-  bindings of MDSS and DPU are mentioned for SC7180 target.
+  Device tree bindings for the DPU display controller for SC7180 target.
 
 properties:
   compatible:
     items:
-      - const: qcom,sc7180-mdss
+      - const: qcom,sc7180-dpu
 
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
-      - description: Display AHB clock from dispcc
+      - description: Display hf axi clock
+      - description: Display ahb clock
+      - description: Display rotator clock
+      - description: Display lut clock
       - description: Display core clock
+      - description: Display vsync clock
 
   clock-names:
     items:
+      - const: bus
       - const: iface
-      - const: ahb
+      - const: rot
+      - const: lut
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
-
-  ranges: true
-
-  interconnects:
-    items:
-      - description: Interconnect path specifying the port ids for data bus
-
-  interconnect-names:
-    const: mdp0-mem
+  power-domains:
+    maxItems: 1
 
-  resets:
-    items:
-      - description: MDSS_CORE reset
+  operating-points-v2: true
 
-patternProperties:
-  "^display-controller@[0-9a-f]+$":
-    type: object
-    description: Node containing the properties of DPU.
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
-          - const: qcom,sc7180-dpu
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
-          - description: Display hf axi clock
-          - description: Display ahb clock
-          - description: Display rotator clock
-          - description: Display lut clock
-          - description: Display core clock
-          - description: Display vsync clock
-
-      clock-names:
-        items:
-          - const: bus
-          - const: iface
-          - const: rot
-          - const: lut
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
-
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
-          port@2:
-            $ref: /schemas/graph.yaml#/properties/port
-            description: DPU_INTF0 (DP)
-
-        required:
-          - port@0
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DPU_INTF1 (DSI1)
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DPU_INTF0 (DP)
 
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
index ef4709d87004..f86177bb2e8c 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - qcom,mdss
+      - qcom,sc7180-mdss
       - qcom,sdm845-mdss
 
   reg:
@@ -64,20 +65,21 @@ properties:
       - description: MDSS_CORE reset
 
   interconnects:
-    minItems: 2
+    minItems: 1
     items:
       - description: MDP port 0
       - description: MDP port 1
       - description: Rotator
 
   interconnect-names:
-    minItems: 2
+    minItems: 1
     items:
       - const: mdp0-mem
       - const: mdp1-mem
       - const: rotator-mem
 
   iommus:
+    minItems: 1
     items:
       - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
       - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
@@ -129,14 +131,39 @@ allOf:
             - const: mdss
 
         interconnects:
+          minItems: 1
           maxItems: 2
 
         interconnect-names:
+          minItems: 1
           maxItems: 2
 
       required:
         - iommus
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc7180-mdss
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Display AHB clock from gcc
+            - description: Display AHB clock from dispcc
+            - description: Display core clock
+
+        clock-names:
+          items:
+            - const: iface
+            - const: ahb
+            - const: core
+
+        iommus:
+          maxItems: 1
+
   - if:
       properties:
         compatible:
@@ -210,6 +237,38 @@ allOf:
                 - qcom,hdmi-tx-8994
                 - qcom,hdmi-tx-8996
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sc7180-mdss
+    then:
+      patternProperties:
+        "^display-controller@[1-9a-f][0-9a-f]*$":
+          type: object
+          properties:
+            compatible:
+              const: qcom,sc7180-dpu
+
+        "^displayport-controller@[1-9a-f][0-9a-f]*$":
+          type: object
+          properties:
+            compatible:
+              const: qcom,sc7180-dp
+
+        "^dsi@[1-9a-f][0-9a-f]*$":
+          type: object
+          properties:
+            compatible:
+              const: qcom,mdss-dsi-ctrl
+
+        "^dsi-phy@[1-9a-f][0-9a-f]*$":
+          type: object
+          properties:
+            compatible:
+              enum:
+                - qcom,dsi-phy-10nm
+
   - if:
       properties:
         compatible:
@@ -257,6 +316,9 @@ patternProperties:
   "^display-controller@[1-9a-f][0-9a-f]*$":
     type: object
 
+  "^displayport-controller@[1-9a-f][0-9a-f]*$":
+    type: object
+
   "^dsi@[1-9a-f][0-9a-f]*$":
     type: object
 
-- 
2.35.1

