Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C735A3899B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 17:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10BE310E553;
	Mon, 17 Feb 2025 16:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="e+TfsZR/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A5510E547
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 16:41:52 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-abad214f9c9so53953066b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 08:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739810511; x=1740415311; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XMKKgpnl8eYech7ysqKuZzSoqRmn3tzrEprN1J+JmkM=;
 b=e+TfsZR/7YxrBqPNcltBPB42sh8g7TtdqNSqsDgOdYV7AElmd3G63xCWhdVFRUfLxt
 MRT/MwadrNb484gQM7GyAEXMnvF1JyPn+yG7V/TpZVG8CASMk9PKNd2beVs/iY7eqFTQ
 tXPOIMK7SDXWyQYJOpnvm13+FxdTpdNRSRchHpIRIub1yAgqevfenDfOpIE+BY5/sMYB
 1imz6qyfIAQ5FhQzzjTiYFeohYBlmq9xF3I8pMYrYfhDPEo0UtkDl8TcooGzFszAsTE2
 28X68TCbJ2Sx3CARTHa0hsHRGtp2GGcx8WcEledLZEHonbwig8AOISw0AGAE+E+VlfzC
 23og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739810511; x=1740415311;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XMKKgpnl8eYech7ysqKuZzSoqRmn3tzrEprN1J+JmkM=;
 b=EAr9I5NkvpdwIaX6M6qSnoZT8i9HhznA7h5PFEf9yZjZ1pKfQSJ2R03cFAq1a4teYs
 p0y4lwgh8r/asqalfu4B3l7IIn6SGmXN1A6/5Q7ydAS1aWuTMQyOuSDsSDneqsTsKIhe
 OSj2wENbFpMAuvwELG9fJLQFZtcQY1JhxPVu0C+362YJ4s53S71np/632vzJuTGSfMbo
 wX6DvwDhQWyAPf/2SAtgqnJPTNgPGFUO52tkSSEkMw0aTIrkWYeWFCD8X/4TmiOwqDkZ
 6k44yGbuGRb/2ieyvktMQVtSA/jb9rO6ecmoZFpSotDoopdrdM1lxxVIYPT0fuRn2X7N
 rMTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7GbxiNxO8KqWN7cD+3jkVCVwF8xykn0YtY+d3MlVZhUfzyA924dMVfxKUELWEqyhfuuHWAL3mkNw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzazqpcsmMNyxZ7Ccglt+opwUQrkVz/kiubhVVkiEJuTY/Tc6vM
 u8J5iGlmiPrt+S/bzMusTXQzfce7IYddmP2dP2XJVmtkdflWVq1jsF/b4v+haBg=
X-Gm-Gg: ASbGncu+czrJjF2Jk3bSzreYwfNBMYJwAtru2UKlBPGUNCo1Jup50+4W7ifmVGToR4a
 JF8qMZwC4CvE9zd5iQ7cUHrlcP2dUNfPi7jLCXjELATxwkdHZzwBbwJJVtuvbws5Qz4+fYDdiky
 //daWytjqmXQCC3VkWNO8rdl1ztQ4S5yps7jrHLuqcOIULp6XFR1YIFYT7KRQKIr2Fu/GLX86ca
 XtRTU1TgGJ7F+xO+BSxfG9UjEHnATrYCuo+IjnNhzJ9sKaRL+67GNyqG6nUayzQ7eMq2cw0gL/0
 mla3Dm4LWT/mc6tPkNx1qUHo0ShX634=
X-Google-Smtp-Source: AGHT+IGTzswrtCJPCqfyggi5m80u/jkul3kNxHxJa5SXSan9y/8fkbrnZlDazfpdDBs98is0eJDstg==
X-Received: by 2002:a17:907:d8b:b0:aa6:6792:8bce with SMTP id
 a640c23a62f3a-abb709319d6mr401797666b.3.1739810511229; 
 Mon, 17 Feb 2025 08:41:51 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbac781b78sm82647966b.60.2025.02.17.08.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 08:41:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 17:41:25 +0100
Subject: [PATCH v2 04/16] dt-bindings: display/msm: dsi-controller-main:
 Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-b4-sm8750-display-v2-4-d201dcdda6a4@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
In-Reply-To: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4323;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=FNsPxO6mm9uvgk0lAHityCPGUm1IzGbPMEBflLcDTzQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBns2a6eg8jKK/RyyaSz8JokEoix1Mba5jwcyKxz
 FO5fmLKv6WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7NmugAKCRDBN2bmhouD
 11K6D/9qb6pfJNR2w2GtVlMN7d8ELbhuFInPw/YrDqYbjRjjK8MhlXYbxJTlajHlFjFi3ExrZGx
 sBE3DApk9QvzyBCSGHOfZGJNuBDb9zfiAkZt7Ex92J/MYL/C2Bg1Wh+4QAoDAXIwaUwoCEaETQc
 caUPi68WvWibTHHsc/rQ9TsEjVy+itoerpNvAJSTitx+8NsA8LDCFehtWhwQi2RpVIYS8m1tKmn
 ksS/cAr4+cv1K8ugg8QAcam5ocLhlP4vz5SPSE86Fzv4atS46ElxDsQDhejkRLO5hSs6Vyu1F10
 lxB2c4WXY3najNn2IiqNyKm/gevpykFBuTO+8IJ7MEyoH2VchQaLB7SrCudDOREu6cH/5WDSB0h
 silAL371P/9bSpWtPo0TeiTt12hfvONwbfUHwGK4SRO14Qr2w6rGfmos6AisxRJvkbqBV2wmvd7
 JR1K61cvTQS9ar5LXko4R5mVMdo3XYNaM1zX9zpUmHcS3yoycR4LWnPrYKJbXABGss3Slk5do/+
 tNfiRY33icnQKFLtak6GypMaMPzR3ePvODZa9vSgeVuXFDC7e+BrRtkNBJIeB4HH25Y40yfvkMR
 iIjsSB8gFp1Xmv7awTYvw/VokxjsgpcJmvNZrNk5J00+cEgaZw7lqFaKc97MeuIo2HmpsfdVLfV
 7XM1+fP1WV+e7bg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DSI controller for Qualcomm SM8750 SoC which is quite different from
previous (SM8650) generation.

It does not allow the display clock controller clocks like "byte" and
"pixel" to be reparented to DSI PHY PLLs while the DSI PHY PLL is not
configured (not prepared, rate not set).  Therefore
assigned-clock-parents are not working here and driver is responsible
for reparenting clocks with proper procedure.  These clocks are now
inputs to the DSI controller device.

Except that SM8750 DSI comes with several differences, new blocks and
changes in registers, making it incompatible with SM8650.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml  | 54 ++++++++++++++++++++--
 1 file changed, 49 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 2aab33cd0017cd4a0c915b7297bb3952e62561fa..8ecb2d8e296edf555df7380eac284b41a3f000a5 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -40,6 +40,7 @@ properties:
               - qcom,sm8450-dsi-ctrl
               - qcom,sm8550-dsi-ctrl
               - qcom,sm8650-dsi-ctrl
+              - qcom,sm8750-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
@@ -68,11 +69,11 @@ properties:
        - mnoc:: MNOC clock
        - pixel:: Display pixel clock.
     minItems: 3
-    maxItems: 9
+    maxItems: 12
 
   clock-names:
     minItems: 3
-    maxItems: 9
+    maxItems: 12
 
   phys:
     maxItems: 1
@@ -107,7 +108,8 @@ properties:
     minItems: 2
     maxItems: 4
     description: |
-      Parents of "byte" and "pixel" for the given platform.
+      For DSI on SM8650 and older: parents of "byte" and "pixel" for the given
+      platform.
       For DSIv2 platforms this should contain "byte", "esc", "src" and
       "pixel_src" clocks.
 
@@ -216,8 +218,6 @@ required:
   - clocks
   - clock-names
   - phys
-  - assigned-clocks
-  - assigned-clock-parents
   - ports
 
 allOf:
@@ -242,6 +242,9 @@ allOf:
             - const: byte
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -264,6 +267,9 @@ allOf:
             - const: byte
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -286,6 +292,9 @@ allOf:
             - const: pixel
             - const: core
             - const: core_mmss
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -307,6 +316,9 @@ allOf:
             - const: core_mmss
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -342,6 +354,35 @@ allOf:
             - const: core
             - const: iface
             - const: bus
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8750-dsi-ctrl
+    then:
+      properties:
+        clocks:
+          minItems: 12
+          maxItems: 12
+        clock-names:
+          items:
+            - const: byte
+            - const: byte_intf
+            - const: pixel
+            - const: core
+            - const: iface
+            - const: bus
+            - const: dsi_pll_pixel
+            - const: dsi_pll_byte
+            - const: esync
+            - const: osc
+            - const: byte_src
+            - const: pixel_src
 
   - if:
       properties:
@@ -365,6 +406,9 @@ allOf:
             - const: core_mmss
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
 unevaluatedProperties: false
 

-- 
2.43.0

