Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A599156CE52
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 11:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A78C1120A4;
	Sun, 10 Jul 2022 09:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2196E11349B
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 09:00:52 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id m18so4250018lfg.10
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 02:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fe1PNr/dXeg4imVISsMZqCDXUMiTOmIDayYyUP6S6z0=;
 b=zdTmZes3Fl369CK60eQJwVn42TgsUGj/yItryZKgQoL98cpH7dj5CcDCr1E+xVf7Vm
 9bXoWSZdZdWXQ5q1qY3rVShFQh6dmhsOPm9/U+ZTrAyf0Jkqox0PXGfSzt5AdU9InIyW
 eAQ17HtRh1F6yxxtnoN9YiK4tOftux7tv0MxQuHsrkWCjhKt1abvRFpQKYcga6/vLOuM
 Vdo9o/P+tqOsdLUx8wqqeGhwf+gq6g4QJBve4T/+2FdsfsU9e+324W+v3F394g5UdAVe
 IM+8C1DufC61Q61VyNRZtcaKRTePDusMf3+1sSPP3Kj/Cs6Vu35tWM4i/nscnpWM86d5
 6nNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fe1PNr/dXeg4imVISsMZqCDXUMiTOmIDayYyUP6S6z0=;
 b=N8AnkjRlJphMetP3xkXBHLnXd1s99YVX/RXnbJLwncOLJmIoU82TLjYWa5NxbfX+2l
 79nmmtcFGdXT9QPxpy2lnu7IWcpwUrIhEQtwnmIbIYocjmgwktQ3k8FGHunts1v8XpeE
 xZHisK6gy8FcRb1edNrhj7hOCHFvLD4FBszN9nPZ6gnIbsRCpXBiSA215nAd1KYYTYKh
 WiZns4hWjaa9AmRiKQPEP76cJHQUoUrNDlWn84bloVJgV8nzdO3i8zvvH/hA8nmN7Zob
 L2EexceQrOj5Ihamed2imGIOrTqy8brXiRWt0kHeWXJ4EJpoBEMlQ6YfmWu5uEMzHPMd
 r3MA==
X-Gm-Message-State: AJIora/Mt50WcQ7dHNOKWJg4qiDRIC3HWJ5Cd/zus/9CEGvi6Fn3Zdu+
 WElwplKbiyZu2kzzv67wM3Bj/A==
X-Google-Smtp-Source: AGRyM1sdlojTIk4zjYI2rBOejL+VPlkBLnfGPzjW0lLmBOnaxooKLidNXwnKjk2VPbWL5s7pDGXzhw==
X-Received: by 2002:a05:6512:16a6:b0:47f:74b5:2704 with SMTP id
 bu38-20020a05651216a600b0047f74b52704mr8004893lfb.54.1657443650285; 
 Sun, 10 Jul 2022 02:00:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u16-20020a056512095000b004896b58f2fasm822881lft.270.2022.07.10.02.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 02:00:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 11/11] dt-bindings: display/msm: move common DPU properties
 to dpu-common.yaml
Date: Sun, 10 Jul 2022 12:00:40 +0300
Message-Id: <20220710090040.35193-12-dmitry.baryshkov@linaro.org>
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

Move properties common to all DPU DT nodes to the dpu-common.yaml.

Note, this removes description of individual DPU port@ nodes. However
such definitions add no additional value. The reg values do not
correspond to hardware INTF indices. The driver discovers and binds
these ports not paying any care for the order of these items. Thus just
leave the reference to graph.yaml#/properties/ports and the description.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-common.yaml      | 42 ++++++++++++++++++
 .../bindings/display/msm/dpu-msm8998.yaml     | 43 ++-----------------
 .../bindings/display/msm/dpu-qcm2290.yaml     | 39 ++---------------
 .../bindings/display/msm/dpu-sc7180.yaml      | 43 ++-----------------
 .../bindings/display/msm/dpu-sc7280.yaml      | 43 ++-----------------
 .../bindings/display/msm/dpu-sdm845.yaml      | 43 ++-----------------
 6 files changed, 62 insertions(+), 191 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
new file mode 100644
index 000000000000..14eda883e149
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
@@ -0,0 +1,42 @@
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dpu-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DPU dt properties (common properties)
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
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
index 5caf46a1dd88..158bd93a157f 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
@@ -47,45 +47,10 @@ properties:
       - const: core
       - const: vsync
 
-  interrupts:
-    maxItems: 1
-
-  power-domains:
-    maxItems: 1
-
-  operating-points-v2: true
-  ports:
-    $ref: /schemas/graph.yaml#/properties/ports
-    description: |
-      Contains the list of output ports from DPU device. These ports
-      connect to interfaces that are external to the DPU hardware,
-      such as DSI, DP etc. Each output port contains an endpoint that
-      describes how it is connected to an external interface.
-
-    properties:
-      port@0:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: DPU_INTF1 (DSI1)
-
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: DPU_INTF2 (DSI2)
-
-    required:
-      - port@0
-      - port@1
-
-required:
-  - compatible
-  - reg
-  - reg-names
-  - clocks
-  - interrupts
-  - power-domains
-  - operating-points-v2
-  - ports
-
-additionalProperties: false
+allOf:
+  - $ref: "/schemas/display/msm/dpu-common.yaml#"
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
index 8027319b1aad..0364261bf3d2 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -43,41 +43,10 @@ properties:
       - const: lut
       - const: vsync
 
-  interrupts:
-    maxItems: 1
-
-  power-domains:
-    maxItems: 1
-
-  operating-points-v2: true
-
-  ports:
-    $ref: /schemas/graph.yaml#/properties/ports
-    description: |
-      Contains the list of output ports from DPU device. These ports
-      connect to interfaces that are external to the DPU hardware,
-      such as DSI. Each output port contains an endpoint that
-      describes how it is connected to an external interface.
-
-    properties:
-      port@0:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: DPU_INTF1 (DSI1)
-
-    required:
-      - port@0
-
-required:
-  - compatible
-  - reg
-  - reg-names
-  - clocks
-  - interrupts
-  - power-domains
-  - operating-points-v2
-  - ports
-
-additionalProperties: false
+allOf:
+  - $ref: "/schemas/display/msm/dpu-common.yaml#"
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
index 9d4ec0b60c25..5df1f2d987c9 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
@@ -45,45 +45,10 @@ properties:
       - const: core
       - const: vsync
 
-  interrupts:
-    maxItems: 1
-
-  power-domains:
-    maxItems: 1
-
-  operating-points-v2: true
-
-  ports:
-    $ref: /schemas/graph.yaml#/properties/ports
-    description: |
-      Contains the list of output ports from DPU device. These ports
-      connect to interfaces that are external to the DPU hardware,
-      such as DSI, DP etc. Each output port contains an endpoint that
-      describes how it is connected to an external interface.
-
-    properties:
-      port@0:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: DPU_INTF1 (DSI1)
-
-      port@2:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: DPU_INTF0 (DP)
-
-    required:
-      - port@0
-
-required:
-  - compatible
-  - reg
-  - reg-names
-  - clocks
-  - interrupts
-  - power-domains
-  - operating-points-v2
-  - ports
-
-additionalProperties: false
+allOf:
+  - $ref: "/schemas/display/msm/dpu-common.yaml#"
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
index 349a454099ad..c822da588de0 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
@@ -44,45 +44,10 @@ properties:
       - const: core
       - const: vsync
 
-  interrupts:
-    maxItems: 1
-
-  power-domains:
-    maxItems: 1
-
-  operating-points-v2: true
-
-  ports:
-    $ref: /schemas/graph.yaml#/properties/ports
-    description: |
-      Contains the list of output ports from DPU device. These ports
-      connect to interfaces that are external to the DPU hardware,
-      such as DSI, DP etc. Each output port contains an endpoint that
-      describes how it is connected to an external interface.
-
-    properties:
-      port@0:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: DPU_INTF1 (DSI)
-
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: DPU_INTF5 (EDP)
-
-    required:
-      - port@0
-
-required:
-  - compatible
-  - reg
-  - reg-names
-  - clocks
-  - interrupts
-  - power-domains
-  - operating-points-v2
-  - ports
-
-additionalProperties: false
+allOf:
+  - $ref: "/schemas/display/msm/dpu-common.yaml#"
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index 42ff85e80f45..218c9d0f3fed 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -43,45 +43,10 @@ properties:
       - const: core
       - const: vsync
 
-  interrupts:
-    maxItems: 1
-
-  power-domains:
-    maxItems: 1
-
-  operating-points-v2: true
-  ports:
-    $ref: /schemas/graph.yaml#/properties/ports
-    description: |
-      Contains the list of output ports from DPU device. These ports
-      connect to interfaces that are external to the DPU hardware,
-      such as DSI, DP etc. Each output port contains an endpoint that
-      describes how it is connected to an external interface.
-
-    properties:
-      port@0:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: DPU_INTF1 (DSI1)
-
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: DPU_INTF2 (DSI2)
-
-    required:
-      - port@0
-      - port@1
-
-required:
-  - compatible
-  - reg
-  - reg-names
-  - clocks
-  - interrupts
-  - power-domains
-  - operating-points-v2
-  - ports
-
-additionalProperties: false
+allOf:
+  - $ref: "/schemas/display/msm/dpu-common.yaml#"
+
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.35.1

