Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F69A07688
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8E310EDBC;
	Thu,  9 Jan 2025 13:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aTInBtFk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C654B10EDC1
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 13:08:47 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-436203f1203so1351655e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 05:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736428126; x=1737032926; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uHRWkFVUYJcbnQ4lEEkkpM4EW1jEFq6Ihd+cartFoEo=;
 b=aTInBtFk6fgVxAGVxvetj9l58IlGVKRHgOcC4VinzkLYr7B2V9C2m6HpT0j4Rl8ygW
 jR/D+G7v3Zj4dq3eMny4JcLIJLNJ0n/Vvz4F6SyjPm/IE9t+1qQJjzLGhPnhXgIaXe9k
 9bSy8Qo16YG1GoDLJlRMfY34heiKW5NvfnapaD8y2wOFHBv21vPIf1AYn8rZE1A3vqgW
 X+W3GMBJLYWe/uqU1/ppBYt+cMTjg0CFUTDoNEDn2GanHNlMwCydJCzqaszoMC7TNJPL
 htmfU4uSyeEc2fqjK9HildgnaRw0nx2nUM2k0D+c3hR1qq4AmvrVm6gEzsVf/LzdyQW6
 HwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736428126; x=1737032926;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uHRWkFVUYJcbnQ4lEEkkpM4EW1jEFq6Ihd+cartFoEo=;
 b=jQVL6I57g7R35Qq73wSKhyYHq6MN4ARU8BYyxkUr56jnmekhoNzFr+kawuiONrz3zN
 xl7Tbf9DMNvV+5TtDtgscqDdeYlRDHxRcmNVpV+h979NWaQw2L44aV3P3W7mMpHfCp88
 4cpYmzhVA8NuCRxAC5/inGAHLW2ZmQhF+Kv6v//hMAUknjkwijVYbPsG2QTyV5KscDSq
 cKEYFHF7cFfN4wFYGcgyNA1rwDnySnqSOaLmrqkN0glMObqxQOhj00Xk3J4nFI/Wnt3S
 6MEmxuBmXukR5qxxfKZexjLkSrSM0bdeOjBdP68ITcGjkMDJybjMC2SXOSFRZiAyRQ3L
 9jyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWONQ5U10DZQTN+pq9zLhht59Cne9uK2mwTdJZ+JVApE1W7NfpTn5lZU+Llu36erpQOTaYa3ZfmvaI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2xTfsh1ZnCl6T5l/sNADZ3VH2KX7+3tyGK2hTbeoS3SFsir85
 AInUSWvFtoUdVZNP5DEl6/hP3Oj24XK/4wTBMiUbZ2nkzGL+i61GrT2eHy9QCUk=
X-Gm-Gg: ASbGncuuILQ3vkiIKrwg+a5XV7JObZBoDDt4wbgRBlJe4chznCOnbUYnwl2DVf4nML/
 FHw9iN20pxUxBgMAql8RNtFkv00IK7DFk+6vieCWsrGT20dop8YT37dsNhAbuo5FH7vtHi25v9t
 Uy2MjdL/DHqnxKbAumiMDv4cG8MbfoNPOojDAzBFS0ytNwu6cOA6eHVJ55i2bFu2fS/BXIkNKsP
 aGm7XXW6olZEOxDos77Ik7tQuYHtpj3DiS1DSGcx/wEk1nThys6ev+swLF7YpyVdJWXyMYV
X-Google-Smtp-Source: AGHT+IEF9iEco/3jygfFz2+wsWwY9iuB08FDT1mjl5kd6+TgpEtqRc7b7CFjp+6LWzrgMy9hb42Jlw==
X-Received: by 2002:a05:600c:5027:b0:434:a30b:5433 with SMTP id
 5b1f17b1804b1-436e26ff752mr25586615e9.5.1736428126203; 
 Thu, 09 Jan 2025 05:08:46 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b8124sm1789167f8f.81.2025.01.09.05.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 05:08:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 09 Jan 2025 14:08:28 +0100
Subject: [PATCH RFC 01/11] dt-bindings: display/msm: dsi-controller-main:
 Combine if:then: entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-b4-sm8750-display-v1-1-b3f15faf4c97@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2973;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=IfZcYabdsZFdNzsj0O/kJeMDTVSlCJN19MOBQa68Yvo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnf8pRvAVm7n8iqcOs0PLBF+zrL6Wo3H3RqAvMO
 PB74U/ANkqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3/KUQAKCRDBN2bmhouD
 16wsEACVeHta1watLdItGSKKdsZJrWq+PIVjOq7NatwSmdBQ2MNeaHRvqntEMifiX9j0PKHUQBu
 u3lc/mq9QInohThDto7mc++GeuSCAy/U0911WnxWo4anPLdEnY+byETdnnR1mkRY3pqgArBSNmG
 RzbuOMZfKryR8gcSsrVhtweagmQTCVReR/Akx58KYimbd4cJI9zKzhxkzI3jBGYaFbeA2S+39IE
 VcUzWQn77+s1V/13WwPfbaMoMH+4hgoSIF/2R3EGVHS+1Aq4jj8NzD3Cdzl208hS7xde/a1/a7X
 cIyLitYR3k98kCbIwBekUjJWjU5b2fWVl7pNoq+VXi/kMyFv6r7AQsow0byPQoTzDTSSWr7+l9U
 dii1lywm7opZdmJqKkFx3ERN/vJdHFhqUDe0NPKt3e4zNxVFsjEtG2109ZWbldhCmzUuxO68q9L
 lIK92rDrn9kkh4bbbeKh/FBYXvtQy5Q2nkZFVVW1lEbTAX4Dmnfx2fqQ7G6r010qr0mV9wvFSlD
 zfpXzfhPhD8uS3JmS1nCYdvUtrgMftvXH3fSj+vBNXQ42/yIgmnOahqZ0s8JONl+xF2WvJTZEt/
 hiIAhRJfk9sdZ8DyZQvzmvq/TDvS7WCCmAjnBOQdJV7ut6HLgmStFWEPR8okSkmpAsvdl9kk/Sk
 HaoE/75ZdBL+zNQ==
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

Several devices have the same clock inputs, thus they can be in the same
if:then: clause, making everything smaller.  No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml  | 64 ++--------------------
 1 file changed, 5 insertions(+), 59 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index a9636b76854d0f781923e06b90503dec11b25763..a90255f60d9e31c9c7ed94816284fa8f0d71d392 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -248,24 +248,6 @@ allOf:
           contains:
             enum:
               - qcom,msm8916-dsi-ctrl
-    then:
-      properties:
-        clocks:
-          maxItems: 6
-        clock-names:
-          items:
-            - const: mdp_core
-            - const: iface
-            - const: bus
-            - const: byte
-            - const: pixel
-            - const: core
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
               - qcom,msm8953-dsi-ctrl
               - qcom,msm8976-dsi-ctrl
     then:
@@ -328,28 +310,13 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-dsi-ctrl
-              - qcom,sm6125-dsi-ctrl
-              - qcom,sm6350-dsi-ctrl
-    then:
-      properties:
-        clocks:
-          maxItems: 6
-        clock-names:
-          items:
-            - const: byte
-            - const: byte_intf
-            - const: pixel
-            - const: core
-            - const: iface
-            - const: bus
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
+              - qcom,sdm845-dsi-ctrl
+              - qcom,sm6115-dsi-ctrl
+              - qcom,sm6125-dsi-ctrl
+              - qcom,sm6350-dsi-ctrl
+              - qcom,sm6375-dsi-ctrl
               - qcom,sm6150-dsi-ctrl
               - qcom,sm7150-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
@@ -393,27 +360,6 @@ allOf:
             - const: pixel
             - const: core
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,sdm845-dsi-ctrl
-              - qcom,sm6115-dsi-ctrl
-              - qcom,sm6375-dsi-ctrl
-    then:
-      properties:
-        clocks:
-          maxItems: 6
-        clock-names:
-          items:
-            - const: byte
-            - const: byte_intf
-            - const: pixel
-            - const: core
-            - const: iface
-            - const: bus
-
 unevaluatedProperties: false
 
 examples:

-- 
2.43.0

