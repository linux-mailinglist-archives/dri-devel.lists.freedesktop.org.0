Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E70AA0768C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0FA310EDC4;
	Thu,  9 Jan 2025 13:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ok8Gqp+H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19DC10EDC4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 13:08:53 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3862e570832so83145f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 05:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736428132; x=1737032932; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7RJRN3DpHMoLX/jdimH6f+RprS9z729MmnmNKrGM77M=;
 b=ok8Gqp+HkvzJ0Kmva3bNXy8G+u4vOvQeg3fMJT8JKJ4tdkmdFvbMMIBdCFrrYiIRNm
 oHE073fWlmGtUJS63uR3U7o3hLbfv9P4GKi5R79wXK/d95LBOWsFoOZkMAZcX3uAVThC
 lruS9cR1uNVJBX8/LNCb9Y4aX2k1Ec3Ot/F0qtKkkYflDp+E4hra0Jo/zM4fr9/kJjqR
 XQShv5oSJmSobsevR5tWKBKCeumZvqFL0biXhYiI7zWSvxTa+pK4m7HDloSzdfDBrPrt
 3S6Dy9U3eRqyxDnoOW5gGPDvgiirazew+Fn7JLrHRVYzFxqBOtNMFRaUj+sHjIn10ESe
 TiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736428132; x=1737032932;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7RJRN3DpHMoLX/jdimH6f+RprS9z729MmnmNKrGM77M=;
 b=NklhD8YnmLVD2lh18fP2WZr6EDWBPObsOzuD14we9B1m6GOkB+Y5gKEaF1oiT26j3s
 ZEOVVrwqu8TmrjgGMbmNW/rFP2MkC+JpOad9TIkH4ybu7YhPkVhmxyZeH1wErX8y3HZl
 ZKJvNMjWgpT9bkfaGWybvT9I82ZSZ64+rVyV2nrhCcuYua3L0KWGo4CyiPqOEF7Aixcj
 4jf0jjpWckNEJgek+yRyHssmhdYeu+wzTB6AqVxSW7TdJLTtUPq0yxixYZjwVAoMmKf5
 oKd8VouhW+c+BTH4eANnrrXNXeKZcjEgL7kxLKtohmAXGh9NTGYOKrNvEx79W/8ktdqH
 gEcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKI5K0Nvg8v8/qpzg4fb6aroN06zLXBlKNv0OMaIt0DwVGdmgr3/S/v9xdCJbLxuuZ4wEgHCJhAp0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzP5KmPEjEGchXA772+5Sug/XRDXJSpGlDYXrRV6yDJ3T3rLSYc
 uqQFIHbflS/wTOzysigSmgPG9RM6P6pF8QWMCXFGfNR1WY2HGvv/WAAokk0PuYM=
X-Gm-Gg: ASbGncs1at+OsrLAW0UyL+eVl1BAL3hCxDq8QAZV512Y87ubRHA96MYO2/EjNl8iUMJ
 eWp5RSXsFKned8YguHEw9ZcuhuhVlno+KQP/ea2/ZJ7z0eggghIxYogVhIdJ26qCPnNJGW0UBMt
 2KuUcoIsUQQnu2+39nfEoA3X65YLKU938CgUDWgfH3XxGTUsIGlrAUmvLmDTvI3htG9ntj5L30U
 TWGTie/QO6aV/u8MEqvNKtn+VEueWlcietVDwMzJBp8+PKcVk731kaKZicWijs43YSytUuh
X-Google-Smtp-Source: AGHT+IEFtVovrr+9PFDGQDnE7Sg3h8FRd+yDLavnYBVOD7Bk6TIaMXWKNWm8UdpJMRZJX54VO5h+OQ==
X-Received: by 2002:a5d:47c4:0:b0:386:3a50:8c52 with SMTP id
 ffacd0b85a97d-38a872e89f6mr2463710f8f.7.1736428132105; 
 Thu, 09 Jan 2025 05:08:52 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b8124sm1789167f8f.81.2025.01.09.05.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 05:08:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 09 Jan 2025 14:08:31 +0100
Subject: [PATCH RFC 04/11] dt-bindings: display/msm: dsi-controller-main:
 Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-b4-sm8750-display-v1-4-b3f15faf4c97@linaro.org>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
In-Reply-To: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
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
 bh=MQ748T1GZYQKbZyfeje0RVYs6YjR4dtwJ7gT00apGuI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnf8pTE+bwb3XSoenIMZ8b4rrtee1vP2mwnRg55
 TXa2SIGWmKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3/KUwAKCRDBN2bmhouD
 10yjD/9mxwC99k3zdXUhEOPmdViV/Fj5ffAa0bDAXAN1NO4g3cSuJP5Y6vP8KIh1M2tafuLNXLK
 36DaRgCmXwWUlFQKyCmi3WrUv2mI/HL/U+3Pj4qJ0sBDqnMwrdcL/Ukhta1Xo5TAvKIx13zfgNY
 lIP8wr9CVDHty9XIaisa7zE13tV/G7/kmQAR6eHZs2+LV0/FT1tSaB8xNXZhLSu1goMjmFlhZP6
 IR+9bHOqhw5sNBfxu886mrNkhDka04a8LA37dZ0XZCOFvPW+F1TE+/c6ziguUZ1NZCwleUXLT9L
 U5LD2/mzmltKpWoIQ4GxjyHJo4EoK6oGvfgF0l5EBDlw5aY+fMq26ZwnW/lFFBCN9g9fD9J4cpJ
 lqwRNoZ/0ytG34MnYiWiQBfyP7vFZ8HSsH7YOnvDIHF/QKCZ26K0bvYvEaMqiPhJc8eRlglA4EG
 0/1hR4Wu4oploJAJbj3tvB3c07A0Qoo6lGzd52WqHl23nPvR8sSqUeIABgCnL1baF3fV2nWOmXs
 a8bjisCjrq4UYy4G+z3ZUxFdit9C89nO9cAOYPOanmSVs1xyaVGHGLjRzWCHb3lC28FmW9l5MNd
 zU+D6lzgW9mBMiPNHfMuyZiDfzJn/tdKEaHRRMnk6Jm3unA6dIBuaFWeV1TcT/oogRwfhNMOVMR
 VUJ69LaYhYIYVeA==
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
index c99dd06f2db9a7a77665ab057d05d87fd3ec2ec2..475b3b881c51c0bc526aed54955767a7149fb1d5 100644
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

