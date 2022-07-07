Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1722756AD87
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 23:32:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E1A011B4F5;
	Thu,  7 Jul 2022 21:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D909F11B05E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 21:32:10 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id s14so23856219ljs.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 14:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=deR1nxfWNzf3dpwLPDYkcufOtw07ZRiv7QMZfcD7n5Q=;
 b=aCvAysEOZv/lB2z2SXSndq3Rm/9OxE9vikZvWZXDkgaVHdKCRluxhSy/OrPtjbibpc
 gAETvrlfJtC+eM3bFRzoOZcxo9CP96APqbcPOHsLXe8VGWmOmMwxaqp24dCYthWZYRie
 RvSb3ak/GBBOEW6JTFEYqQXWF9/kfkg8yiH5MmJU5JXq+yZrOCz4L9K882Od2aewaAo/
 yRhbSbESWtTkkObDlbVapdi8EjKTqx0GY+ors3TxuhMo8X/ocsp+EQ7zIzJg4vPdpANI
 A2Mrp8FdxxEvrE78B3hEhmmBD+EKIXxxa6JNtXUDtVEwXE6XTWPhPzwWJVWlosA4qrIo
 FDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=deR1nxfWNzf3dpwLPDYkcufOtw07ZRiv7QMZfcD7n5Q=;
 b=dPL4ORgmDdZVSgyU7h7KajmkypPRFyfZyxlS/9SDsQBX8TbRxiNQ8Qe8xlHWXZr6bj
 UDo4ZpofMhF+RWVfIKyuQTDqkUqrA2VK44DKntmRTRFeYr4f+1NzVIcjOch/cghY+ubj
 XrN3KYpX3vwR9Bnd9s4RR+56vk23tVmUO493CwrpFWoyXsbsOVxZijqMsxdj/DDzS9Hl
 6EwN1CcJ3ZU1sbRNdu7yZRYQcJAgOPG5/Ehmdp5X4BCmbVOO5lBjhDC3bRY5wwzbSTVo
 wwbU/tlR9KthX7cuYEDkAeJubEheQX0H1RoBH9tY1pMBvu7fCoyH4y+5j/On6oyOdEaB
 L/sg==
X-Gm-Message-State: AJIora+K/0ww2d2NGHDIaBi1w7kZOoQn2Z0pgf+1vsxq+cMEKyRkGPHC
 ES6I4eY1hK86ylMvaIUCsJPyog==
X-Google-Smtp-Source: AGRyM1syma+AzNNuFCY/QL5hX+OuBGxgZPtBeQejNm2Im/56/APYMORKQOJbo+AE8PAWbCqVxfie8A==
X-Received: by 2002:a05:651c:545:b0:25b:c791:816c with SMTP id
 q5-20020a05651c054500b0025bc791816cmr12841ljp.161.1657229530435; 
 Thu, 07 Jul 2022 14:32:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o19-20020ac24e93000000b0047f8cb94004sm7046709lfr.35.2022.07.07.14.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 14:32:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 5/9] dt-bindings: msm/dp: account for clocks specific for qcom,
 sc7280-edp
Date: Fri,  8 Jul 2022 00:32:00 +0300
Message-Id: <20220707213204.2605816-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
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

On SC7280 platform the eDP controller uses an extended amount of clocks.
Since it is the only known platform using such configuration, use
if-then-else rather than listing each and every compatible string in the
if conditions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dp-controller.yaml   | 60 +++++++++++++++----
 1 file changed, 48 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index f00eae66196f..1ef845005b14 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -38,20 +38,12 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: AHB clock to enable register access
-      - description: Display Port AUX clock
-      - description: Display Port Link clock
-      - description: Link interface clock between DP and PHY
-      - description: Display Port Pixel clock
+    minItems: 5
+    maxItems: 7
 
   clock-names:
-    items:
-      - const: core_iface
-      - const: core_aux
-      - const: ctrl_link
-      - const: ctrl_link_iface
-      - const: stream_pixel
+    minItems: 5
+    maxItems: 7
 
   assigned-clocks:
     items:
@@ -119,6 +111,50 @@ required:
   - power-domains
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc7280-edp
+    then:
+      properties:
+        clocks:
+          items:
+            - description: XO clock
+            - description: eDP reference clock
+            - description: AHB clock to enable register access
+            - description: Display Port AUX clock
+            - description: Display Port Link clock
+            - description: Link interface clock between DP and PHY
+            - description: Display Port Pixel clock
+        clock-names:
+          items:
+            - const: core_xo
+            - const: core_ref
+            - const: core_iface
+            - const: core_aux
+            - const: ctrl_link
+            - const: ctrl_link_iface
+            - const: stream_pixel
+    else:
+      properties:
+        clocks:
+          items:
+            - description: AHB clock to enable register access
+            - description: Display Port AUX clock
+            - description: Display Port Link clock
+            - description: Link interface clock between DP and PHY
+            - description: Display Port Pixel clock
+        clock-names:
+          items:
+            - const: core_iface
+            - const: core_aux
+            - const: ctrl_link
+            - const: ctrl_link_iface
+            - const: stream_pixel
+
 additionalProperties: false
 
 examples:
-- 
2.35.1

