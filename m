Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F23956CE48
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 11:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22359112546;
	Sun, 10 Jul 2022 09:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D30510FF62
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 09:00:47 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id e28so678327lfj.4
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 02:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LZmw/9n0J4sxjxv7YAo4yzPry54U6TAPdmwFIYw1fWI=;
 b=EIH7k5vVqdVKYpxlaQzHyYnEgHz7p1gff6K2AC/cMhoUQgzah7HipjO04bFdczBIW0
 /oeiNBqqzaMuXqc0qjNpih0nHH4+sX2DJeWjcS6Rr9IwhEv99gWIDZUBW3xj4MtWlXj6
 DJHOcm60bHgFXHHhztk6gGbl4qQf11NAq7w86j0noHkv+aEROgFRgNEcm/q23+0uvj6w
 El8GjTbXI772es+8yOz4kI6ULWwzkkVB2J8OFIqg3i+z5dM8mNS8kEXAjubw7THFzFp/
 ojibgkuxvDc8Njpx8wxSTkU8IiTpIMmIGrd5uBqevpqqh9JuaTPGzVF/vMZ/ANpGp/sH
 f1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LZmw/9n0J4sxjxv7YAo4yzPry54U6TAPdmwFIYw1fWI=;
 b=FipneWsBtUoNLRyb5cuxnbATgsXotlN0O8Yf6i1d22QdnW/QpJZIwhXxe6KoxRE4ba
 B+VXFrpa+Nwt2JPiGchEM4382vy2XKAy9oWOfXF6uq5ojvunAByGu25DmvwQfFUb8L9q
 NRbdc1+iyTMLRYF2lab30W8TxaRKeSUYBxLTVdFS/vnOq3Qjibhm1fPxHJjDTcXEaOFQ
 bYqs8w/bAxC3i2GK1LHf01WsMSVNQFnLIJxieJ4csionvA8OxFyZB5LSmrx84yqMBQLx
 Exn+eK9iRF8I3vnS80PQsgnVdvCp7M+gqLPc7NRqKIgL5BAUZp/pN/fJIiZsmb8n2+xT
 Y7Ag==
X-Gm-Message-State: AJIora8/9NkYJgbxCMKrGUrs8ICacU/3j0boW8xQdsaAeQNgopRXPITV
 F5imoyR3wbS2zSk4SOqUPcUt3w==
X-Google-Smtp-Source: AGRyM1vID3BbBxGW6+jsKggDcSujbkNN8erm+mJpghfomNtLqro6d+fKaIBq3gwGe5hV01+/Gv2l4g==
X-Received: by 2002:ac2:4d93:0:b0:489:c69d:59c0 with SMTP id
 g19-20020ac24d93000000b00489c69d59c0mr6551482lfe.329.1657443645261; 
 Sun, 10 Jul 2022 02:00:45 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u16-20020a056512095000b004896b58f2fasm822881lft.270.2022.07.10.02.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 02:00:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 05/11] dt-bindings: display/msm: move qcom,
 sdm845-mdss schema to mdss.yaml
Date: Sun, 10 Jul 2022 12:00:34 +0300
Message-Id: <20220710090040.35193-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
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
index ba674a261b18..7d4ab3d71d2d 100644
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
 
+  "^display-controller@(0|[1-9a-f][0-9a-f]*)$":
+    $ref: dpu-sdm845.yaml
+
   "^dsi@(0|[1-9a-f][0-9a-f]*)$":
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

