Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEEE620433
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 00:57:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943D910E3E9;
	Mon,  7 Nov 2022 23:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C67110E320
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 23:57:07 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id 5so7826830wmo.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 15:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5H4aIH5vgrqEjkb0c4TPSI9rlEkjF0KuTX6JDaV2C+Q=;
 b=I8vHBi1wTF81RoXMibJDd+V1bea1cticVTZR4pKMBnuwoTwzVwfXple4alROtnU9tR
 P3wwltR+nDb6g+v+MJ+OxP5WniGWwjPRvbhc6W36L/uBwYdhLSi37N71OpLpIvs2qqx9
 IJf/JnQ1a3Rg+EuHzmJJM4A0sVT1d8Gq5Om6cLIKGUnibvbj/jXFmXm0zx2Rbg5NL5oJ
 ZQRA0PQtl0405XEhs6Or3yw4i/OwF54BKP5Uwp5XAjVQbZ4tKR2pU4HDuCqC4S0sL1j9
 p86GrpOSi45B+6Gj8wsE26GqdQGt8LNx3hlr1DPZ4DjIsFtavBOHF6Dyw6kZR5ZrzaDK
 lADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5H4aIH5vgrqEjkb0c4TPSI9rlEkjF0KuTX6JDaV2C+Q=;
 b=g/ml/a37Dbu3P2v27dWabd3gfMfb4lZ1pnRJlHzaSREy8/M+hbT4G4Ruab19uWsrl6
 m+DzIac4OWDAy6WQukxrDtrGughiKW9Ed5fLSaJFNH1Bg+sycLjoDh0pExSNLP0vBZ7h
 abQu50PeP1pDnTTXMoAdmzW4xXqhPV3tiu7URZdK0lh7XLvN8Z6rJ6dBCzi63MURDzlF
 EX2f3y/XCG2Vl/vgTBP3dz+khBiQ10/EwIbzedneYbx9ukmClAt+vecN35CKbfP7n/7u
 8YxF42an6QhkCKxtmG+LGv/UaE1fzzlsN/Z+zGX7Z0kX7CZedqneERGmK9He7XILiVPO
 4dZg==
X-Gm-Message-State: ACrzQf1XiBAe/jMZBNtWWb57mc9WkF7lSpd8yE4JKic2mf/bhUUvtX1Y
 Uy7hwmynpOyhedAflpAVLm5Bvw==
X-Google-Smtp-Source: AMsMyM5PpcWg9aHzhtCQyM0rQQT6CqD/DaJpW9c3F0kxcx6U15WTxwlB0TibX2THeNPu7nZvd6GBjw==
X-Received: by 2002:a05:600c:548a:b0:3cf:a358:ee3 with SMTP id
 iv10-20020a05600c548a00b003cfa3580ee3mr8953419wmb.12.1667865424999; 
 Mon, 07 Nov 2022 15:57:04 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 b18-20020a056000055200b00236545edc91sm8386161wrf.76.2022.11.07.15.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 15:57:04 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 08/18] dt-bindings: msm: dsi-controller-main: Document
 clocks on a per compatible basis
Date: Mon,  7 Nov 2022 23:56:44 +0000
Message-Id: <20221107235654.1769462-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Each compatible has a different set of clocks which are associated with it.
Add in the list of clocks for each compatible.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../display/msm/dsi-controller-main.yaml      | 177 +++++++++++++++---
 1 file changed, 150 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 9db3e63acda3d..c975df0ca22fc 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -9,24 +9,22 @@ title: Qualcomm Display DSI controller
 maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
-allOf:
-  - $ref: "../dsi-controller.yaml#"
-
 properties:
   compatible:
-    enum:
-      - qcom,dsi-ctrl-6g-qcm2290
-      - qcom,mdss-dsi-ctrl
-      - qcom,mdss-dsi-ctrl-apq8064
-      - qcom,mdss-dsi-ctrl-msm8916
-      - qcom,mdss-dsi-ctrl-msm8974
-      - qcom,mdss-dsi-ctrl-msm8996
-      - qcom,mdss-dsi-ctrl-sc7180
-      - qcom,mdss-dsi-ctrl-sc7280
-      - qcom,mdss-dsi-ctrl-sdm630
-      - qcom,mdss-dsi-ctrl-sdm660
-      - qcom,mdss-dsi-ctrl-sdm845
-      - qcom,mdss-dsi-ctrl-sm8250
+    items:
+      - enum:
+          - qcom,dsi-ctrl-6g-qcm2290
+          - qcom,mdss-dsi-ctrl-apq8064
+          - qcom,mdss-dsi-ctrl-msm8916
+          - qcom,mdss-dsi-ctrl-msm8974
+          - qcom,mdss-dsi-ctrl-msm8996
+          - qcom,mdss-dsi-ctrl-sc7180
+          - qcom,mdss-dsi-ctrl-sc7280
+          - qcom,mdss-dsi-ctrl-sdm630
+          - qcom,mdss-dsi-ctrl-sdm660
+          - qcom,mdss-dsi-ctrl-sdm845
+          - qcom,mdss-dsi-ctrl-sm8250
+      - const: qcom,mdss-dsi-ctrl
 
   reg:
     maxItems: 1
@@ -51,17 +49,8 @@ properties:
     minItems: 6
 
   clock-names:
-    items:
-      - const: byte
-      - const: byte_intf
-      - const: pixel
-      - const: core
-      - const: iface
-      - const: bus
-      - const: core_mmss
-      - const: mdp_core
-      - const: mnoc
     minItems: 6
+    maxItems: 9
 
   phys:
     maxItems: 1
@@ -169,6 +158,140 @@ required:
   - vddio-supply
   - vdda-supply
 
+allOf:
+  - $ref: "../dsi-controller.yaml#"
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,mdss-dsi-ctrl-apq8064
+    then:
+      properties:
+        clocks:
+          maxItems: 7
+        clock-names:
+          items:
+            - const: iface
+            - const: bus
+            - const: core_mmss
+            - const: src
+            - const: byte
+            - const: pixel
+            - const: core
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,mdss-dsi-ctrl-msm8916
+    then:
+      properties:
+        clocks:
+          maxItems: 6
+        clock-names:
+          items:
+            - const: mdp_core
+            - const: iface
+            - const: bus
+            - const: byte
+            - const: pixel
+            - const: core
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,mdss-dsi-ctrl-msm8974
+    then:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          items:
+            - const: iface
+            - const: bus
+            - const: vsync
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,mdss-dsi-ctrl-msm8996
+    then:
+      properties:
+        clocks:
+          maxItems: 7
+        clock-names:
+          items:
+            - const: mdp_core
+            - const: byte
+            - const: iface
+            - const: bus
+            - const: core_mmss
+            - const: pixel
+            - const: core
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,mdss-dsi-ctrl-sc7180
+              - qcom,mdss-dsi-ctrl-sc7280
+              - qcom,mdss-dsi-ctrl-sm8250
+    then:
+      properties:
+        clocks:
+          maxItems: 6
+        clock-names:
+          items:
+            - const: byte
+            - const: byte_intf
+            - const: pixel
+            - const: core
+            - const: iface
+            - const: bus
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,mdss-dsi-ctrl-sdm630
+              - qcom,mdss-dsi-ctrl-sdm660
+    then:
+      properties:
+        clocks:
+          maxItems: 9
+        clock-names:
+          items:
+            - const: mdp_core
+            - const: byte
+            - const: byte_intf
+            - const: mnoc
+            - const: iface
+            - const: bus
+            - const: core_mmss
+            - const: pixel
+            - const: core
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,mdss-dsi-ctrl-sdm845
+    then:
+      properties:
+        clocks:
+          maxItems: 6
+        clock-names:
+          items:
+            - const: byte
+            - const: byte_intf
+            - const: pixel
+            - const: core
+            - const: iface
+            - const: bus
+
 additionalProperties: false
 
 examples:
@@ -179,7 +302,7 @@ examples:
      #include <dt-bindings/power/qcom-rpmpd.h>
 
      dsi@ae94000 {
-           compatible = "qcom,mdss-dsi-ctrl";
+           compatible = "qcom,mdss-dsi-ctrl-sc7180", "qcom,mdss-dsi-ctrl";
            reg = <0x0ae94000 0x400>;
            reg-names = "dsi_ctrl";
 
-- 
2.38.1

