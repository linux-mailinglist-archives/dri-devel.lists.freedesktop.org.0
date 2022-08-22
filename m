Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A9259C9E9
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 22:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59238A1AA6;
	Mon, 22 Aug 2022 20:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35260A1A34
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 20:18:16 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id v10so11664151ljh.9
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 13:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Vxo5yaUMYooE+1KIds1knRD16Nz+JL2plyldR5AEjpk=;
 b=jOAYtYtSN8y1o8sJL+7V4ARaZDboFbPPu6p3rSbBbOALPUB30XZBx/6PbihvpJ0A0D
 OxT4VG4hg+flgu0d/rnpp06TCkHulhlWyotLyaNf35q6wbUPhmFb7r1LpPyl3x1vmsjH
 94vS8bQzGMzrbBQ5rau+ScL+LZlgfzFSQSL4KxjJAsjpSsasm2eZW1OEtpGprHf4gvxn
 UUuRc01CaPTbeTAR4aQJotdwsAtIvx73DvJwTgFY5HOVI/gnK0ZRAnByL2pcbdSCVIIK
 vAtFis4YEjg2cu6FLp6XWvJVFCkILHCc4b5EvmyDQDTGGitsIuDKOPR340QUBHllpC4H
 Dcvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Vxo5yaUMYooE+1KIds1knRD16Nz+JL2plyldR5AEjpk=;
 b=rcTqr64ktZ2fqTaTeTA+wSAOW0tkIxThNhWGCFqxckjFLaLNuB0DES/Vwple4J7dR1
 VMyu3aBLnQbssPE36FqV6rxaVhL6OC9v94Xn1TKOygO8iL9D/tQpg3/BncYfP74i6Nq7
 vhxd76vK819uyic9pwM6rzzG78mcPNygZpnaswzdUiMfwV5HJQpu+RBc4rn/Q7OxBSfK
 TKZCdCvNZNebqPfXrTVw1XchxMmDw+rUTH7grapEfDi4xh0drYkS3Nfs5j9loHIEYQe3
 emWlqvjnhbCiJ/GGzJm7xFYo7oahG09elGjCFfjrJ0w1U/t5VVRRuemqlM8pDHsdRBQ+
 MPOg==
X-Gm-Message-State: ACgBeo3rZClS3T2zs39XfhhjSJldK4uEeou8wErxWnfH8LY5IpxEIyd9
 MNdIa5JjJXhMgCRcdZkzREZTtw==
X-Google-Smtp-Source: AA6agR4WeoVuiJ/1TpmB/OZ9IDo6FoRpSF1AEatf1S8UeKerg0NOGvu5kiDvcNBptdJZLxeFQdc7HQ==
X-Received: by 2002:a2e:8e99:0:b0:261:d303:35c1 with SMTP id
 z25-20020a2e8e99000000b00261d30335c1mr1198501ljk.116.1661199495718; 
 Mon, 22 Aug 2022 13:18:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 h16-20020a2e5310000000b0025e5cd1620fsm2000429ljb.57.2022.08.22.13.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 13:18:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 6/9] dt-bindings: display/msm: move qcom,
 msm8998-mdss schema to mdss.yaml
Date: Mon, 22 Aug 2022 23:18:05 +0300
Message-Id: <20220822201808.347783-7-dmitry.baryshkov@linaro.org>
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

Move schema for qcom,msm8998-mdss from dpu-msm8998.yaml to mdss.yaml so
that the dpu file describes only the DPU schema.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-msm8998.yaml     | 142 +++++-------------
 .../devicetree/bindings/display/msm/mdss.yaml |  24 +++
 2 files changed, 64 insertions(+), 102 deletions(-)

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
index 8bb7525681de..1e1e4b32f29f 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
@@ -17,6 +17,7 @@ description:
 properties:
   compatible:
     enum:
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
@@ -230,6 +253,7 @@ patternProperties:
 
   "^display-controller@[1-9a-f][0-9a-f]*$":
     oneOf:
+      - $ref: dpu-msm8998.yaml
       - $ref: dpu-qcm2290.yaml
       - $ref: dpu-sc7180.yaml
       - $ref: dpu-sc7280.yaml
-- 
2.35.1

