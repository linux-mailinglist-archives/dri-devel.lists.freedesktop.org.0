Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBA95A9468
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 12:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557E510E6AA;
	Thu,  1 Sep 2022 10:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68A310E699
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 10:23:19 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id m7so14815310lfq.8
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Sep 2022 03:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=S5rOAiBOQhV9HJ1M+D/hRwWg34A/BT47JDpJ80EyBP0=;
 b=GNb/UJuLtKH7wvp8HdTx7ECgQY25C+K6F/b+v8mSYb5uNWgv1meK7Xlam4mWxZJdMS
 RXog33Iihwg9xsrpaUhzR9doRVKlVrhMwyT7JE4IlgzAWyent0FdlwF/LSXECuHuHxN8
 GVhjS9sly8UBZIKLFVPKLkh1OQPsmx82+YcvnLitUIuoh5alaykidpGUybdr0QnUSaFU
 a1gPPxqwaV0GAIFuLOTueLSO5fVa/qhah6wI/vALA1lL/lu0KbO332nud0aB5GANkGSM
 pQndZtleqZDxBL/e12Et2JQaGteiEImNsbKZ5D9aLkuRs9t1L5aO8IiyNuIBWWd4YgjA
 MhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=S5rOAiBOQhV9HJ1M+D/hRwWg34A/BT47JDpJ80EyBP0=;
 b=lcMmycknkj+aQoPeMTag1tbmnQrtcwYofTeiXBtDWcuMyVNoBqz1fDDcdeJD9IlXKw
 cgzKE8XaERQg7HoI4lP+hvbtnD+y5KDRx2uyp9a5f1LIeu1Hr7wtdywmOjdKYulVMAP2
 Ov8s/Llpbept22ktoVOFsib5zOdr/jP8uI8vBiU1zO7/FkCOvKSf4Cyxz5pqpiTY0Gbp
 eaD7G8MHZJLIBaNdweZO1A+cIsjPhD0ImKLQo2iJBcsjdNgeS1efb13iys1Ilm53w8fT
 TBLRkzUAk/5V0KlWken12L1bWthAFNoWujXId1eSSB8TGSjvKyyoTMHtXxglvsYP6HS6
 tlgA==
X-Gm-Message-State: ACgBeo1oig8flCmQ/jgPA/1gwVcQ3KsrP7Iudu+napEDcPB30RKKiN9M
 1nNmFDReak3ki3uXPmk3gfDbJA==
X-Google-Smtp-Source: AA6agR508sT2Rj3XDruBvQtYfaRxPy3YJ5nU0nf3ocKGo6wujWEaf7z9Ot6qtLOIdNCdtfAvlY8lBQ==
X-Received: by 2002:a05:6512:2313:b0:48a:e615:289b with SMTP id
 o19-20020a056512231300b0048ae615289bmr10114531lfu.201.1662027797761; 
 Thu, 01 Sep 2022 03:23:17 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z19-20020a056512371300b004949ea5480fsm123453lfr.97.2022.09.01.03.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 03:23:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v6 04/12] dt-bindings: display/msm: move common DPU properties
 to dpu-common.yaml
Date: Thu,  1 Sep 2022 13:23:04 +0300
Message-Id: <20220901102312.2005553-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move properties common to all DPU DT nodes to the dpu-common.yaml.

Note, this removes description of individual DPU port@ nodes. However
such definitions add no additional value. The reg values do not
correspond to hardware INTF indices. The driver discovers and binds
these ports not paying any care for the order of these items. Thus just
leave the reference to graph.yaml#/properties/ports and the description.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-common.yaml      | 44 ++++++++++++++++++
 .../bindings/display/msm/dpu-msm8998.yaml     | 46 ++-----------------
 .../bindings/display/msm/dpu-qcm2290.yaml     | 41 ++---------------
 .../bindings/display/msm/dpu-sc7180.yaml      | 45 ++----------------
 .../bindings/display/msm/dpu-sc7280.yaml      | 45 ++----------------
 .../bindings/display/msm/dpu-sdm845.yaml      | 46 ++-----------------
 6 files changed, 64 insertions(+), 203 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
new file mode 100644
index 000000000000..bf5764e9932b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
@@ -0,0 +1,44 @@
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dpu-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DPU dt properties (common properties)
+
+maintainers:
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+  - Rob Clark <robdclark@gmail.com>
+
+description: |
+  Common properties for QCom DPU display controller.
+
+properties:
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      Contains the list of output ports from DPU device. These ports
+      connect to interfaces that are external to the DPU hardware,
+      such as DSI, DP etc.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - interrupts
+  - power-domains
+  - operating-points-v2
+  - ports
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
index 253665c693e6..0d6743eabd27 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
@@ -62,7 +62,10 @@ patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
     description: Node containing the properties of DPU.
-    additionalProperties: false
+    unevaluatedProperties: false
+
+    allOf:
+      - $ref: /schemas/display/msm/dpu-common.yaml#
 
     properties:
       compatible:
@@ -99,47 +102,6 @@ patternProperties:
           - const: core
           - const: vsync
 
-      interrupts:
-        maxItems: 1
-
-      power-domains:
-        maxItems: 1
-
-      operating-points-v2: true
-      opp-table:
-        type: object
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
-          port@1:
-            $ref: /schemas/graph.yaml#/properties/port
-            description: DPU_INTF2 (DSI2)
-
-        required:
-          - port@0
-          - port@1
-
-    required:
-      - compatible
-      - reg
-      - reg-names
-      - clocks
-      - interrupts
-      - power-domains
-      - operating-points-v2
-      - ports
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
index c5824e1d2382..bec3c131c0dc 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -74,7 +74,10 @@ patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
     description: Node containing the properties of DPU.
-    additionalProperties: false
+    unevaluatedProperties: false
+
+    allOf:
+      - $ref: /schemas/display/msm/dpu-common.yaml#
 
     properties:
       compatible:
@@ -107,42 +110,6 @@ patternProperties:
           - const: lut
           - const: vsync
 
-      interrupts:
-        maxItems: 1
-
-      power-domains:
-        maxItems: 1
-
-      operating-points-v2: true
-      opp-table:
-        type: object
-
-      ports:
-        $ref: /schemas/graph.yaml#/properties/ports
-        description: |
-          Contains the list of output ports from DPU device. These ports
-          connect to interfaces that are external to the DPU hardware,
-          such as DSI. Each output port contains an endpoint that
-          describes how it is connected to an external interface.
-
-        properties:
-          port@0:
-            $ref: /schemas/graph.yaml#/properties/port
-            description: DPU_INTF1 (DSI1)
-
-        required:
-          - port@0
-
-    required:
-      - compatible
-      - reg
-      - reg-names
-      - clocks
-      - interrupts
-      - power-domains
-      - operating-points-v2
-      - ports
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
index 4890bc25f3fd..732b9d8f968a 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
@@ -73,7 +73,10 @@ patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
     description: Node containing the properties of DPU.
-    additionalProperties: false
+    unevaluatedProperties: false
+
+    allOf:
+      - $ref: /schemas/display/msm/dpu-common.yaml#
 
     properties:
       compatible:
@@ -108,46 +111,6 @@ patternProperties:
           - const: core
           - const: vsync
 
-      interrupts:
-        maxItems: 1
-
-      power-domains:
-        maxItems: 1
-
-      operating-points-v2: true
-      opp-table:
-        type: object
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
-
-    required:
-      - compatible
-      - reg
-      - reg-names
-      - clocks
-      - interrupts
-      - power-domains
-      - operating-points-v2
-      - ports
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
index 584d646021d5..4889129660c6 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
@@ -72,7 +72,10 @@ patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
     description: Node containing the properties of DPU.
-    additionalProperties: false
+    unevaluatedProperties: false
+
+    allOf:
+      - $ref: /schemas/display/msm/dpu-common.yaml#
 
     properties:
       compatible:
@@ -106,46 +109,6 @@ patternProperties:
           - const: core
           - const: vsync
 
-      interrupts:
-        maxItems: 1
-
-      power-domains:
-        maxItems: 1
-
-      operating-points-v2: true
-      opp-table:
-        type: object
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
-
-    required:
-      - compatible
-      - reg
-      - reg-names
-      - clocks
-      - interrupts
-      - power-domains
-      - operating-points-v2
-      - ports
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index ff19555d04e2..b275f928a921 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -75,7 +75,10 @@ patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
     description: Node containing the properties of DPU.
-    additionalProperties: false
+    unevaluatedProperties: false
+
+    allOf:
+      - $ref: /schemas/display/msm/dpu-common.yaml#
 
     properties:
       compatible:
@@ -108,47 +111,6 @@ patternProperties:
           - const: core
           - const: vsync
 
-      interrupts:
-        maxItems: 1
-
-      power-domains:
-        maxItems: 1
-
-      operating-points-v2: true
-      opp-table:
-        type: object
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
-          port@1:
-            $ref: /schemas/graph.yaml#/properties/port
-            description: DPU_INTF2 (DSI2)
-
-        required:
-          - port@0
-          - port@1
-
-    required:
-      - compatible
-      - reg
-      - reg-names
-      - clocks
-      - interrupts
-      - power-domains
-      - operating-points-v2
-      - ports
-
 required:
   - compatible
   - reg
-- 
2.35.1

