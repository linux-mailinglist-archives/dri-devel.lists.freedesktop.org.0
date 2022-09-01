Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEB05A9472
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 12:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DA810E6AB;
	Thu,  1 Sep 2022 10:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DE110E699
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 10:23:21 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id q7so23708858lfu.5
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Sep 2022 03:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=WQg7blSGne2/YmKGXSUdX/PkxQiySd7D40Q+frbabYM=;
 b=adRgYkv4qLcuapm2heBdOJY91oFdYZ6pTjFMSTqvroXUvpRi2FWS9hs09r+y8c1gJX
 TZNPexRMqdr1Kc19Q8pGCfOr4ePkk4YdcFoegFfC89gZL32HJLB6gSn5Thr+0pnjR00G
 y4NTJPYz9N0MV2T8hqhTx4x9X/c1bbjZ1HRKEL6HPzl10iEwzVN2ZgHWSvpL4w9E4Cpe
 h+IuK49L5EDCkdiIGCx2D8ViekbdC6fF/7czaeUggbpgmHu0vl8vWnXimbcYRoyXRsRH
 IdhEcwEBA+aEzGnsNv9d316+a8WNq5s30WF2KcbZR1QXAGaHtGDIecDp6N0mwtKi+WRj
 qwig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WQg7blSGne2/YmKGXSUdX/PkxQiySd7D40Q+frbabYM=;
 b=A8f9hII1HplQZG0f4SCTTZDZFrrUB84R6NIodo8jAHYAtDmv+9Wte9eaD1LM1CFp67
 rrI8f3j2XJ8B7WQiP48vzfhMCKasFYPBOYbhIVjXixiYf8SQhBGgcSlrggbi81Xltc07
 Oa5GweIUTYlo5AVQ0CstId7EFqUZfQ+VmLcrDtWsZuCxqXfcQbvzysqy3T9Wt8t5n5ux
 3S6cj71gZuvgDQdSfkfh1Ur6cKDqSOu6eDH2sfz7XOkslO17bGblI3Vm7jP2fJyDlp0v
 Nr2FWgCbyHG+NewFWLFmIsu2oUd9gmerwPXYkUEcdXqMlV2kD8NpAkfRBji/MhM2jsWf
 7ybA==
X-Gm-Message-State: ACgBeo2qB5VprqxFRt5z8WiBSfW6YSGIwScb2DrvyMIe8/wFUj+OV2xO
 vb88iQ8axtfXKPoH/qqneGjhgQ==
X-Google-Smtp-Source: AA6agR4kcatPmBgi+0GPd2dkLlqf+NpScKMAYQ/upCslupZjlWgJMWFnkgUpX4BqR4KQtn47zh2IlA==
X-Received: by 2002:ac2:4c54:0:b0:48c:9d53:80aa with SMTP id
 o20-20020ac24c54000000b0048c9d5380aamr9740108lfk.529.1662027798914; 
 Thu, 01 Sep 2022 03:23:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z19-20020a056512371300b004949ea5480fsm123453lfr.97.2022.09.01.03.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 03:23:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v6 05/12] dt-bindings: display/msm: move common MDSS
 properties to mdss-common.yaml
Date: Thu,  1 Sep 2022 13:23:05 +0300
Message-Id: <20220901102312.2005553-6-dmitry.baryshkov@linaro.org>
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

Move properties common to all MDSS DT nodes to the mdss-common.yaml.

This extends qcom,msm8998-mdss schema to allow interconnect nodes, which
will be added later, once msm8998 gains interconnect support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-msm8998.yaml     | 42 ++--------
 .../bindings/display/msm/dpu-qcm2290.yaml     | 52 ++----------
 .../bindings/display/msm/dpu-sc7180.yaml      | 51 ++----------
 .../bindings/display/msm/dpu-sc7280.yaml      | 51 ++----------
 .../bindings/display/msm/dpu-sdm845.yaml      | 55 ++----------
 .../bindings/display/msm/mdss-common.yaml     | 83 +++++++++++++++++++
 6 files changed, 116 insertions(+), 218 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-common.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
index 0d6743eabd27..1e6b7e15f1c5 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
@@ -14,20 +14,14 @@ description: |
   sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
   bindings of MDSS and DPU are mentioned for MSM8998 target.
 
+allOf:
+  - $ref: /schemas/display/msm/mdss-common.yaml#
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
@@ -40,23 +34,8 @@ properties:
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
@@ -102,18 +81,7 @@ patternProperties:
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
index bec3c131c0dc..1c6dd7969a61 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -14,20 +14,14 @@ description: |
   sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
   and DPU are mentioned for QCM2290 target.
 
+allOf:
+  - $ref: /schemas/display/msm/mdss-common.yaml#
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
@@ -40,35 +34,14 @@ properties:
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
@@ -110,18 +83,7 @@ patternProperties:
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
index 732b9d8f968a..47e74f78e939 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
@@ -14,20 +14,14 @@ description: |
   sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
   bindings of MDSS and DPU are mentioned for SC7180 target.
 
+allOf:
+  - $ref: /schemas/display/msm/mdss-common.yaml#
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
@@ -40,34 +34,14 @@ properties:
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
@@ -111,18 +85,7 @@ patternProperties:
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
index 4889129660c6..7dc624a26e2e 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
@@ -14,19 +14,13 @@ description: |
   sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
   bindings of MDSS and DPU are mentioned for SC7280.
 
+allOf:
+  - $ref: /schemas/display/msm/mdss-common.yaml#
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
@@ -39,34 +33,14 @@ properties:
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
@@ -109,18 +83,7 @@ patternProperties:
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
index b275f928a921..7e9d7c7f3538 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -14,20 +14,14 @@ description: |
   sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
   bindings of MDSS and DPU are mentioned for SDM845 target.
 
+allOf:
+  - $ref: /schemas/display/msm/mdss-common.yaml#
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
@@ -38,38 +32,14 @@ properties:
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
-      - description: Interconnect path specifying the port ids for data bus
-      - description: Interconnect path specifying the port ids for data bus
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
@@ -111,18 +81,7 @@ patternProperties:
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
index 000000000000..053c1e889552
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/mdss-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display MDSS dt properties (common properties)
+
+maintainers:
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+  - Rob Clark <robdclark@gmail.com>
+
+description: |
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
+      - description: Interconnect path specifying the port ids for data bus
+      - description: Interconnect path specifying the port ids for data bus
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

