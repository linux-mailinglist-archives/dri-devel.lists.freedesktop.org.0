Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD5E638A3C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 13:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2D610E75B;
	Fri, 25 Nov 2022 12:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5A810E0FC
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 12:36:49 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso6092713wme.5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 04:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7j/kQFYflTNFFJrzZdMMiJ3sr+ALnckYYvuv4i4+EBs=;
 b=XMwGtK90dUtQlnIOiJyXMPHCSY5xAz3FvYihmTzTbrjceo3A92UOB4jRWVeNlyLBY3
 iJtL3UhtGznD+qNWYf3tO+Qs2TWOYPxHGSe2m/ghxILhNxEsOxdGxNBYhR1pDXDDFi8g
 imbXjCU4w4FIa+MK23YukkcwI0EdVt/bs63mY1SS9qamlRiw5SAHBPcegd4iuI2gb+RS
 gOUDlHBekTHeJK8yChmMtUqIh1iTWmKnkiRdvVE9NrtCz2s2V+DJ8MfsHTea5LsiKaSA
 Rp2OyoImFDkNLE3aMtymadPHB3BhiQaflwPQZaXHVFO4dOGhhEObwTmO8Cm6Nf8SoVmr
 WBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7j/kQFYflTNFFJrzZdMMiJ3sr+ALnckYYvuv4i4+EBs=;
 b=MLWDlNL0WKH1rPLhr80TN5EksPuV2HGM3TCrA1cKtWRo24ql/vPWILfxh9oj6VZVrR
 ke/iJVMfSnmIQN+7gS6EK/OYr7yLb2KhpeipMbBMinDJczfujAYmJzkfQ0QfhAjNVIIh
 hwhNnmnjoeQpcqUf6wquqJI52oTpw+WHi3o8iJYQ0AQqD17+5vc8Wf6N463P6K55vdyi
 UzGVcqz+Eh4rWHd+YMUREAm/QnWf6W1WjNSKuxEjAgsUoR04kgQC6FSBhVBcQuGNvrMd
 HPgOIQTRkhvxbnnPTwONVUC9c9PTn0wbw1wxFjmZcR924ptWhwNLv2EC1r2IzSKRD7iR
 E9EA==
X-Gm-Message-State: ANoB5pmDOJOjt+fV9CdIKGAac88TG/uR5hhvnbjexfcknlQCfi0e7SAD
 BRtat8WZVxJy3pczVTyEt7BEzA==
X-Google-Smtp-Source: AA0mqf4GoGxj2srPZbKj+YQ8nVTh1yNiOvNQMVEWVugDeMEMjsxIm8tctKlLHbWeq44MO4nE2CnaSw==
X-Received: by 2002:a05:600c:34d3:b0:3cf:a7a8:b712 with SMTP id
 d19-20020a05600c34d300b003cfa7a8b712mr13880433wmq.124.1669379807842; 
 Fri, 25 Nov 2022 04:36:47 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 04:36:47 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v4 05/18] dt-bindings: msm: dsi-controller-main: Document
 clocks on a per compatible basis
Date: Fri, 25 Nov 2022 12:36:25 +0000
Message-Id: <20221125123638.823261-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
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

Each compatible has a different set of clocks which are associated with it.
Add in the list of clocks for each compatible.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../display/msm/dsi-controller-main.yaml      | 152 ++++++++++++++++--
 1 file changed, 142 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 0cd2079137b02..88aac7d33555c 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -9,9 +9,6 @@ title: Qualcomm Display DSI controller
 maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
-allOf:
-  - $ref: "../dsi-controller.yaml#"
-
 properties:
   compatible:
     items:
@@ -48,13 +45,8 @@ properties:
       - description: Display AXI clock
 
   clock-names:
-    items:
-      - const: byte
-      - const: byte_intf
-      - const: pixel
-      - const: core
-      - const: iface
-      - const: bus
+    minItems: 6
+    maxItems: 9
 
   phys:
     maxItems: 1
@@ -147,6 +139,146 @@ required:
   - assigned-clock-parents
   - ports
 
+allOf:
+  - $ref: "../dsi-controller.yaml#"
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,apq8064-dsi-ctrl
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
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8916-dsi-ctrl
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
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8974-dsi-ctrl
+    then:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          items:
+            - const: iface
+            - const: bus
+            - const: vsync
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8996-dsi-ctrl
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
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc7180-dsi-ctrl
+              - qcom,sc7280-dsi-ctrl
+              - qcom,sm8250-dsi-ctrl
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
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sdm630-dsi-ctrl
+              - qcom,sdm660-dsi-ctrl
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
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sdm845-dsi-ctrl
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
-- 
2.38.1

