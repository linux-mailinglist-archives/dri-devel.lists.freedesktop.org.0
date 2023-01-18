Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A610D672499
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 18:16:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2CD10E7B2;
	Wed, 18 Jan 2023 17:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9115510E7B2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 17:16:29 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 f19-20020a1c6a13000000b003db0ef4dedcso1875584wmc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 09:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2VmHwT2W1r2KJ9vVd+Obmx+OW0hRU9rIhD2h7gpT89A=;
 b=endZfDbh4lE9yNNz3mbwbH6CJvWxwCipLVs/4YoAOC5zgwekpgl9Ln3tPR4nO0pAOG
 byCSvLtp1lpUczwGF6GmyJDtim7iPGhUsJwc4/nNlnrHaVXRIMvM88vqAjhJl5V8yapO
 Xg1WuvSwvuxn5J8hYrtenLdCm7yc2e7IT/KuC/qyNxU/YcK7NDmlcpP2VBUR0lRI70Ey
 PEAbHdH1Ar2kvp3X8Pe/d80mr0uLKacD3Q2P//Q585BwRasRK8hUfxzYczy8jwgjgsfZ
 N/O01+bxrqbGYF4wa/acoOXZzYyoJXpH65QxJL2hpXK23U7+ZvQwhwWK3kerdqsbjC3X
 dShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2VmHwT2W1r2KJ9vVd+Obmx+OW0hRU9rIhD2h7gpT89A=;
 b=kD5Ict8CUOD6shHEyslvuqfr8aJpRKVU6on9NUoROmJHyMXD0X3WRNBxZ1gc/ee6eu
 EwRVncU1PLc97w66vHBjEVpEkIbqXlNFOtBgpssSNcelAGb4zYvb5AoeSg9Y42/Jgv7k
 zHTdQqAxVCp7r1TsLjsuA+t8h9pBI3wzRHNiuRDEAcGhVvrS0NUTYBmNEJogeIW9UxeW
 dh5d+QB6gHOu55Wj+IMGq/b3nW0aGPu9fFwlmWoB3CalIVMc36UdRPFhGKzPzEHbZUhO
 G4o2oCJCtNT6kwdeQuBTXewfdjfLsJJvf63xHWSL+FYkMQK8FmyhE/cj/peGYQJ8F2oM
 Xu+Q==
X-Gm-Message-State: AFqh2krOVIAJqk5ZJrLho4W3AW5+BnYa2SyjHGt1X8b3WWkvCEBcNDEu
 eD+ewIgorL+QvC4eHkZXqFStDw==
X-Google-Smtp-Source: AMrXdXsBTKTi5nyNEefgZL1LbZsX4ZxOjpY5LrHyG7RHln4j9K2WBxcpKH9KgWHG8Q09jj17aktMeA==
X-Received: by 2002:a05:600c:4fcb:b0:3db:1919:41b5 with SMTP id
 o11-20020a05600c4fcb00b003db191941b5mr1677074wmq.21.1674062187979; 
 Wed, 18 Jan 2023 09:16:27 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 t13-20020a05600c198d00b003cfa81e2eb4sm2772780wmq.38.2023.01.18.09.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 09:16:27 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v9 1/2] dt-bindings: msm: dsi-controller-main: Add compatible
 strings for every current SoC
Date: Wed, 18 Jan 2023 17:16:20 +0000
Message-Id: <20230118171621.102694-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230118171621.102694-1-bryan.odonoghue@linaro.org>
References: <20230118171621.102694-1-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 bryan.odonoghue@linaro.org, swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently we do not differentiate between the various users of the
qcom,mdss-dsi-ctrl. The driver is flexible enough to operate from one
compatible string but, the hardware does have some significant differences
in the number of clocks.

To facilitate documenting the clocks add the following compatible strings

- qcom,apq8064-dsi-ctrl
- qcom,msm8916-dsi-ctrl
- qcom,msm8953-dsi-ctrl
- qcom,msm8974-dsi-ctrl
- qcom,msm8996-dsi-ctrl
- qcom,msm8998-dsi-ctrl
- qcom,sc7180-dsi-ctrl
- qcom,sc7280-dsi-ctrl
- qcom,sdm660-dsi-ctrl
- qcom,sdm845-dsi-ctrl
- qcom,sm8150-dsi-ctrl
- qcom,sm8250-dsi-ctrl
- qcom,sm8350-dsi-ctrl
- qcom,sm8450-dsi-ctrl
- qcom,sm8550-dsi-ctrl
- qcom,qcm2290-dsi-ctrl

Deprecate qcom,dsi-ctrl-6g-qcm2290 in favour of the desired format while we
do so.

Several MDSS yaml files exist which document the dsi sub-node.
For each existing SoC MDSS yaml, provide the right dsi compat string.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../display/msm/dsi-controller-main.yaml      | 30 ++++++++++++++++---
 .../bindings/display/msm/qcom,mdss.yaml       |  3 +-
 .../display/msm/qcom,msm8998-mdss.yaml        |  8 +++--
 .../display/msm/qcom,sc7180-mdss.yaml         |  6 ++--
 .../display/msm/qcom,sc7280-mdss.yaml         |  6 ++--
 .../display/msm/qcom,sdm845-mdss.yaml         |  8 +++--
 .../display/msm/qcom,sm8150-mdss.yaml         |  8 +++--
 .../display/msm/qcom,sm8250-mdss.yaml         |  8 +++--
 .../display/msm/qcom,sm8350-mdss.yaml         |  6 ++--
 .../display/msm/qcom,sm8450-mdss.yaml         |  8 +++--
 10 files changed, 65 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 6e2fd6e9fa7f0..35668caa190c4 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -14,9 +14,31 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - qcom,mdss-dsi-ctrl
-      - qcom,dsi-ctrl-6g-qcm2290
+    oneOf:
+      - items:
+          - enum:
+              - qcom,apq8064-dsi-ctrl
+              - qcom,msm8916-dsi-ctrl
+              - qcom,msm8953-dsi-ctrl
+              - qcom,msm8974-dsi-ctrl
+              - qcom,msm8996-dsi-ctrl
+              - qcom,msm8998-dsi-ctrl
+              - qcom,qcm2290-dsi-ctrl
+              - qcom,sc7180-dsi-ctrl
+              - qcom,sc7280-dsi-ctrl
+              - qcom,sdm660-dsi-ctrl
+              - qcom,sdm845-dsi-ctrl
+              - qcom,sm8150-dsi-ctrl
+              - qcom,sm8250-dsi-ctrl
+              - qcom,sm8350-dsi-ctrl
+              - qcom,sm8450-dsi-ctrl
+              - qcom,sm8550-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
+      - items:
+          - enum:
+              - dsi-ctrl-6g-qcm2290
+          - const: qcom,mdss-dsi-ctrl
+        deprecated: true
 
   reg:
     maxItems: 1
@@ -149,7 +171,7 @@ examples:
      #include <dt-bindings/power/qcom-rpmpd.h>
 
      dsi@ae94000 {
-           compatible = "qcom,mdss-dsi-ctrl";
+           compatible = "qcom,sc7180-dsi-ctrl", "qcom,mdss-dsi-ctrl";
            reg = <0x0ae94000 0x400>;
            reg-names = "dsi_ctrl";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index ba0460268731b..c194bea46c72f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -94,7 +94,8 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,mdss-dsi-ctrl
+        contains:
+          const: qcom,mdss-dsi-ctrl
 
   "^phy@[1-9a-f][0-9a-f]*$":
     type: object
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
index 8b82eef28162c..3c2b6ed98a568 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
@@ -46,7 +46,9 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,mdss-dsi-ctrl
+        items:
+          - const: qcom,msm8998-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object
@@ -128,7 +130,7 @@ examples:
         };
 
         dsi@c994000 {
-            compatible = "qcom,mdss-dsi-ctrl";
+            compatible = "qcom,msm8998-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x0c994000 0x400>;
             reg-names = "dsi_ctrl";
 
@@ -198,7 +200,7 @@ examples:
         };
 
         dsi@c996000 {
-            compatible = "qcom,mdss-dsi-ctrl";
+            compatible = "qcom,msm8998-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x0c996000 0x400>;
             reg-names = "dsi_ctrl";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
index 5db9b3ab03c98..42ef06edddc42 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
@@ -58,7 +58,9 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,mdss-dsi-ctrl
+        items:
+          - const: qcom,sc7180-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object
@@ -144,7 +146,7 @@ examples:
         };
 
         dsi@ae94000 {
-            compatible = "qcom,mdss-dsi-ctrl";
+            compatible = "qcom,sc7180-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x0ae94000 0x400>;
             reg-names = "dsi_ctrl";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
index a4e3ada2affcf..078e1d1a7d2fc 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
@@ -58,7 +58,9 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,mdss-dsi-ctrl
+        items:
+          - const: qcom,sc7280-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
 
   "^edp@[0-9a-f]+$":
     type: object
@@ -165,7 +167,7 @@ examples:
         };
 
         dsi@ae94000 {
-            compatible = "qcom,mdss-dsi-ctrl";
+            compatible = "qcom,sc7280-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x0ae94000 0x400>;
             reg-names = "dsi_ctrl";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
index 8f60be6147d88..6ecb00920d7f6 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
@@ -56,7 +56,9 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,mdss-dsi-ctrl
+        items:
+          - const: qcom,sdm845-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object
@@ -136,7 +138,7 @@ examples:
         };
 
         dsi@ae94000 {
-            compatible = "qcom,mdss-dsi-ctrl";
+            compatible = "qcom,sdm845-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x0ae94000 0x400>;
             reg-names = "dsi_ctrl";
 
@@ -206,7 +208,7 @@ examples:
         };
 
         dsi@ae96000 {
-            compatible = "qcom,mdss-dsi-ctrl";
+            compatible = "qcom,sdm845-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x0ae96000 0x400>;
             reg-names = "dsi_ctrl";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
index 55b41e4573dc8..5182e958e0691 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
@@ -55,7 +55,9 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,mdss-dsi-ctrl
+        items:
+          - const: qcom,sm8150-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object
@@ -167,7 +169,7 @@ examples:
         };
 
         dsi@ae94000 {
-            compatible = "qcom,mdss-dsi-ctrl";
+            compatible = "qcom,sm8150-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x0ae94000 0x400>;
             reg-names = "dsi_ctrl";
 
@@ -257,7 +259,7 @@ examples:
         };
 
         dsi@ae96000 {
-            compatible = "qcom,mdss-dsi-ctrl";
+            compatible = "qcom,sm8150-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x0ae96000 0x400>;
             reg-names = "dsi_ctrl";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
index 571dc6560266c..368d3db0ce967 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
@@ -54,7 +54,9 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,mdss-dsi-ctrl
+        items:
+          - const: qcom,sm8250-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object
@@ -169,7 +171,7 @@ examples:
         };
 
         dsi@ae94000 {
-            compatible = "qcom,mdss-dsi-ctrl";
+            compatible = "qcom,sm8250-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x0ae94000 0x400>;
             reg-names = "dsi_ctrl";
 
@@ -259,7 +261,7 @@ examples:
         };
 
         dsi@ae96000 {
-            compatible = "qcom,mdss-dsi-ctrl";
+            compatible = "qcom,sm8250-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x0ae96000 0x400>;
             reg-names = "dsi_ctrl";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
index 0d452f22f5569..4d94dbff30541 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
@@ -56,7 +56,9 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,mdss-dsi-ctrl
+        items:
+          - const: qcom,sm8350-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object
@@ -169,7 +171,7 @@ examples:
         };
 
         dsi0: dsi@ae94000 {
-            compatible = "qcom,mdss-dsi-ctrl";
+            compatible = "qcom,sm8350-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x0ae94000 0x400>;
             reg-names = "dsi_ctrl";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
index c268e0b662cf9..4c6929e2534c2 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
@@ -46,7 +46,9 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,mdss-dsi-ctrl
+        items:
+          - const: qcom,sm8450-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object
@@ -175,7 +177,7 @@ examples:
         };
 
         dsi@ae94000 {
-            compatible = "qcom,mdss-dsi-ctrl";
+            compatible = "qcom,sm8450-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x0ae94000 0x400>;
             reg-names = "dsi_ctrl";
 
@@ -270,7 +272,7 @@ examples:
         };
 
         dsi@ae96000 {
-            compatible = "qcom,mdss-dsi-ctrl";
+            compatible = "qcom,sm8450-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x0ae96000 0x400>;
             reg-names = "dsi_ctrl";
 
-- 
2.38.1

