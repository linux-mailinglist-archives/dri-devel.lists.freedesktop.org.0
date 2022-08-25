Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5231B5A0D39
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 11:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5732B11AF9A;
	Thu, 25 Aug 2022 09:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE9411216C
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 09:51:10 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id d9so2818451ljl.8
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 02:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=s95KyTVgJCkOF9d3OhQcrMijE3hMZBRKUCbN8bvHKPE=;
 b=cxdw2Ixqm6n/M51A08Dh/JHWjmbNn60i8vxbO2dKR8S7r9I77mgOE4H5SLVkquaVMF
 kxjGRjibfCGOd9hQ/SIuSXS+aHXOHQbdIjN8GkvoNApccexBABmjiZz443eDglNqeFql
 dSRL+7oPBA0qpMWAE3zzgio03AvKpfygedwuNnuO3FI14xKw9YizeR10O4aTA7ivmErD
 MuHW9euAkhAz3akJ+AhP6h6mpNt7ze6OXUze9vbWwAr2sYg8WAtqep/CR2o3vaHnKELu
 45g9aJaM1m4kcSYLCeL+Ghq49X7AtwFk/HAX+LKt6+TJj49EY1W/Mjg1H+V9CPZSZZDF
 mI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=s95KyTVgJCkOF9d3OhQcrMijE3hMZBRKUCbN8bvHKPE=;
 b=YkXMi5PicTZ78qlch8/2EDA8w1rcZeNhqNsRwgLL/5iQIGOpyBpqjat9SNDIQBWd0t
 xNOCfL5Auaj4tPOGWreB+//g0z70M5+B4/aF+lha06GeyklE4io5jT1Ffy0z7cvhFyQ9
 7MqUfAID3kUML6GEiuSMH/iG1132X3oP8tgjh0kK4UuqMJyhNW0PR07XMTkKMxKvgWqL
 4aPMrIPWYp7EhldAV82q4+Bh86zOy1P4+ff2ILBW8Dy97oAKD4p7hCkhaOYrEh/xp7UC
 vefEyXZTEZtlC+Wr/Wbtbl8UIwBcKqAHIADKyvdVR2dHiQpZV58W0iFX47ltCSNVAUQw
 me8A==
X-Gm-Message-State: ACgBeo2vWTnPsLbh8JGz4ALd+fOefVG+wIDRQ1Irk+ek23m3TloH4+Ut
 tYvncLhSper/UYk5MqgVVM7/uA==
X-Google-Smtp-Source: AA6agR4gDhA2tCvvMlXWRUjyIPkSy0CnUD0JDYDwpwqcG+Sq+3aqnmkxVGHD157Nt7Bq++oqbQRuZw==
X-Received: by 2002:a2e:aa21:0:b0:261:e3b7:3e8d with SMTP id
 bf33-20020a2eaa21000000b00261e3b73e8dmr850858ljb.530.1661421068661; 
 Thu, 25 Aug 2022 02:51:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 h10-20020a056512220a00b00492cfecf1c0sm398502lfu.245.2022.08.25.02.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 02:51:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v4 04/10] dt-bindings: display/msm: move qcom,
 sc7280-mdss schema to mdss.yaml
Date: Thu, 25 Aug 2022 12:50:57 +0300
Message-Id: <20220825095103.624891-5-dmitry.baryshkov@linaro.org>
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

Move schema for qcom,sc7280-mdss from dpu-sc7280.yaml to mdss.yaml so
that the dpu file describes only the DPU schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-sc7280.yaml      | 148 +++++-------------
 .../devicetree/bindings/display/msm/mdss.yaml |  54 +++++++
 2 files changed, 92 insertions(+), 110 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
index f427eec3d3a4..349a454099ad 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
@@ -10,149 +10,77 @@ maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 description: |
-  Device tree bindings for MSM Mobile Display Subsystem (MDSS) that encapsulates
-  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
-  bindings of MDSS and DPU are mentioned for SC7280.
+  Device tree bindings for the DPU display controller for SC7280 target.
 
 properties:
   compatible:
-    const: qcom,sc7280-mdss
+    const: qcom,sc7280-dpu
 
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
+      - description: Display sf axi clock
+      - description: Display ahb clock
+      - description: Display lut clock
       - description: Display core clock
+      - description: Display vsync clock
 
   clock-names:
     items:
+      - const: bus
+      - const: nrt_bus
       - const: iface
-      - const: ahb
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
-        const: qcom,sc7280-dpu
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
-          - description: Display sf axi clock
-          - description: Display ahb clock
-          - description: Display lut clock
-          - description: Display core clock
-          - description: Display vsync clock
-
-      clock-names:
-        items:
-          - const: bus
-          - const: nrt_bus
-          - const: iface
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
-            description: DPU_INTF1 (DSI)
-
-          port@1:
-            $ref: /schemas/graph.yaml#/properties/port
-            description: DPU_INTF5 (EDP)
-
-        required:
-          - port@0
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DPU_INTF1 (DSI)
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DPU_INTF5 (EDP)
 
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
index f86177bb2e8c..8d748fc5359c 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - qcom,mdss
       - qcom,sc7180-mdss
+      - qcom,sc7280-mdss
       - qcom,sdm845-mdss
 
   reg:
@@ -147,6 +148,7 @@ allOf:
           contains:
             enum:
               - qcom,sc7180-mdss
+              - qcom,sc7280-mdss
     then:
       properties:
         clocks:
@@ -269,6 +271,52 @@ allOf:
               enum:
                 - qcom,dsi-phy-10nm
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sc7280-mdss
+    then:
+      patternProperties:
+        "^display-controller@[1-9a-f][0-9a-f]*$":
+          type: object
+          properties:
+            compatible:
+              const: qcom,sc7280-dpu
+
+        "^displayport-controller@[1-9a-f][0-9a-f]*$":
+          type: object
+          properties:
+            compatible:
+              const: qcom,sc7280-dp
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
+        "^edp@[1-9a-f][0-9a-f]*$":
+          type: object
+          properties:
+            compatible:
+              const: qcom,sc7280-edp
+
+        "^phy@[1-9a-f][0-9a-f]*$":
+          type: object
+          properties:
+            compatible:
+              enum:
+                - qcom,sc7280-dsi-phy-7nm
+                - qcom,sc7280-edp-phy
+
   - if:
       properties:
         compatible:
@@ -325,12 +373,18 @@ patternProperties:
   "^dsi-phy@[1-9a-f][0-9a-f]*$":
     type: object
 
+  "^edp@[1-9a-f][0-9a-f]*$":
+    type: object
+
   "^hdmi-phy@[1-9a-f][0-9a-f]*$":
     type: object
 
   "^hdmi-tx@[1-9a-f][0-9a-f]*$":
     type: object
 
+  "^phy@[1-9a-f][0-9a-f]*$":
+    type: object
+
 additionalProperties: false
 
 examples:
-- 
2.35.1

