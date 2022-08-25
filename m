Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 888385A0D3F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 11:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F81411B558;
	Thu, 25 Aug 2022 09:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8490113412
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 09:51:12 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id k22so4208534ljg.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 02:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=AnOiI4lCKkkAGpKT600Gp4Nhc+hErvdpb/jUGyKfm9c=;
 b=QXG9VrobunyyUAMSo6k97zFC6cQuxdKWgYn2wob73aGbrLh1/SBsQ114dvc9zagtrI
 uTCbyN3+qqmm6rIg2AmewTXPWj1+6l1aP9xmHu3kcIN5h8eUNpUWwwyJzZiU3gR7OiB8
 jgx3rAcDP6+kQ2Z1imlBrzosifskBWIyP0LRTtHTmfq1v0ejlEfsTigaEpn6BKE+DuAl
 4W/jhT+O0hMH3DyvDHILhXEtoOFeMkQZKJMxvWY1DsuctdLxMOIWYKL5q6E4bOrdBMJF
 5M6+SNHZSO+Wn5+qM5FnqtL0QLSuY7Mb7bUmqtfwYyhYdrm4Ti0XRgwhXGzQ70Jt00ok
 oa+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=AnOiI4lCKkkAGpKT600Gp4Nhc+hErvdpb/jUGyKfm9c=;
 b=6hajT6nLUtV/RJMBw7FxDLFyopoqNlDUEzGtgy5pu42IuOxb/0Bx2Hw0adFokJoyOy
 bKhrsTECNv5TTq1DOd08m+GijhMsxvL67MYv1X7NtBD55f/jTqGsOUnEtL/mOBrlFxBk
 SDxPqsmTO9K4ehpHyGjZscbdLBsgljNtyCJdOh8FmYNyPFfZ1E/rjJw7uwA1fbGTH0Du
 HY4LlyRzk+0R4/646Uy/OJHEBHSbVKs5kWkWYqQOpxhzapx2KTy9aWT5wJCJy3hgvIOX
 JmKfmQNdBsMCh/upLLcvFGu/Kh2FWhA5rKq4oilCA7HCZbmxj0Gb1bLoKpFtFDg8voYP
 zU7g==
X-Gm-Message-State: ACgBeo1D1KhFH5Uwm5VI/bXhv2vTucUbEYlxhiHB7A2VBmlCXjNroyrk
 +L2CMi+7yAO8z3p/8QNRDBGrNQ==
X-Google-Smtp-Source: AA6agR50l4e+jUR87LYZEeZPmJZKUYt6638NJbYjSZhfOYnEnBBtkOFu806Mkx+f6916VNXBDRVBQA==
X-Received: by 2002:a2e:5d5:0:b0:261:d1ee:6941 with SMTP id
 204-20020a2e05d5000000b00261d1ee6941mr905986ljf.137.1661421070584; 
 Thu, 25 Aug 2022 02:51:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 h10-20020a056512220a00b00492cfecf1c0sm398502lfu.245.2022.08.25.02.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 02:51:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v4 06/10] dt-bindings: display/msm: move qcom,
 msm8998-mdss schema to mdss.yaml
Date: Thu, 25 Aug 2022 12:50:59 +0300
Message-Id: <20220825095103.624891-7-dmitry.baryshkov@linaro.org>
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

Move schema for qcom,msm8998-mdss from dpu-msm8998.yaml to mdss.yaml so
that the dpu file describes only the DPU schema.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-msm8998.yaml     | 142 +++++-------------
 .../devicetree/bindings/display/msm/mdss.yaml |  49 ++++++
 2 files changed, 89 insertions(+), 102 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
index 2df64afb76e6..5caf46a1dd88 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
@@ -10,142 +10,80 @@ maintainers:
   - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
 
 description: |
-  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
-  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
-  bindings of MDSS and DPU are mentioned for MSM8998 target.
+  Device tree bindings for the DPU display controller for MSM8998 target.
 
 properties:
   compatible:
     items:
-      - const: qcom,msm8998-mdss
+      - const: qcom,msm8998-dpu
 
   reg:
-    maxItems: 1
+    items:
+      - description: Address offset and size for mdp register set
+      - description: Address offset and size for regdma register set
+      - description: Address offset and size for vbif register set
+      - description: Address offset and size for non-realtime vbif register set
 
   reg-names:
-    const: mdss
-
-  power-domains:
-    maxItems: 1
+    items:
+      - const: mdp
+      - const: regdma
+      - const: vbif
+      - const: vbif_nrt
 
   clocks:
     items:
-      - description: Display AHB clock
-      - description: Display AXI clock
+      - description: Display ahb clock
+      - description: Display axi clock
+      - description: Display mem-noc clock
       - description: Display core clock
+      - description: Display vsync clock
 
   clock-names:
     items:
       - const: iface
       - const: bus
+      - const: mnoc
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
-          - const: qcom,msm8998-dpu
-
-      reg:
-        items:
-          - description: Address offset and size for mdp register set
-          - description: Address offset and size for regdma register set
-          - description: Address offset and size for vbif register set
-          - description: Address offset and size for non-realtime vbif register set
-
-      reg-names:
-        items:
-          - const: mdp
-          - const: regdma
-          - const: vbif
-          - const: vbif_nrt
-
-      clocks:
-        items:
-          - description: Display ahb clock
-          - description: Display axi clock
-          - description: Display mem-noc clock
-          - description: Display core clock
-          - description: Display vsync clock
-
-      clock-names:
-        items:
-          - const: iface
-          - const: bus
-          - const: mnoc
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
index 0c6d68f2a450..1b469893732a 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - qcom,mdss
+      - qcom,msm8998-mdss
       - qcom,qcm2290-mdss
       - qcom,sc7180-mdss
       - qcom,sc7280-mdss
@@ -143,6 +144,28 @@ allOf:
       required:
         - iommus
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,msm8998-mdss
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Display AHB clock
+            - description: Display AXI clock
+            - description: Display core clock
+
+        clock-names:
+          items:
+            - const: iface
+            - const: bus
+            - const: core
+
+        iommus:
+          maxItems: 1
+
   - if:
       properties:
         compatible:
@@ -262,6 +285,32 @@ allOf:
                 - qcom,hdmi-tx-8994
                 - qcom,hdmi-tx-8996
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,msm8998-mdss
+    then:
+      patternProperties:
+        "^display-controller@[1-9a-f][0-9a-f]*$":
+          type: object
+          properties:
+            compatible:
+              const: qcom,msm8998-dpu
+
+        "^dsi@[1-9a-f][0-9a-f]*$":
+          type: object
+          properties:
+            compatible:
+              const: qcom,mdss-dsi-ctrl
+
+        "^phy@[1-9a-f][0-9a-f]*$":
+          type: object
+          properties:
+            compatible:
+              enum:
+                - qcom,dsi-phy-14nm
+
   - if:
       properties:
         compatible:
-- 
2.35.1

