Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6B270D5D4
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 09:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D55C10E3EC;
	Tue, 23 May 2023 07:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB2510E3E0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 07:46:52 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f3b9755961so3073161e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 00:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684828010; x=1687420010;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NO5fRgfBpga7Z40GIKnv5Lmg/IglAEvXvStQNi4ygG0=;
 b=ZIEPHyEoJzLknZW2Suf39kYWaecX1LflenGK9SX5Wkw5TM2kJjRD3k6nDMlpsIulZK
 7Ml3806zEk8CxZaS+marGCXuaVs5JB57npVSWeByC7Sm6wC76Uj9qpki2JU/9FHxS2ZI
 pfUHeRvU1hogUBeTjD2NednKP1uOCEm87YCRQe9E0u56752K7C4XrkvgU8kOrDx4B2Bo
 eulRwSLPszer8olu6btg0goUeC7thdBJj+jg3jz2R33bsPnWg2nLB/nkqSEDpKLkLGwZ
 4EKl6zkNUH+fD2oCuLBkAEWcH2lv36r8sHNGr8+pYpBps3be3SRXbi8L2odx7ZXfkNqx
 s83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684828010; x=1687420010;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NO5fRgfBpga7Z40GIKnv5Lmg/IglAEvXvStQNi4ygG0=;
 b=Mj4DcLmYnPNampK6wz3Q+D8QmlF8Bt/qFm9H76e1yGlPVdwqO6zJ+8ctpShF3NehPj
 Q255cm6BHqukZAhIocJKUg1QTIhleNkwrj+/yjsFvI5G5vOgx+SqUZjdR5JLNa2AAAFx
 XW7iVvHmE94Q79vn2oJO1rjmbmCmuUtiDVpdGqrBAvu/lpZPRh8Bz97ySpHRihR2zoiz
 CIrugAEpGFcwAhjC/sztRmBQcjga3HjULlJi2YlWJUiCLNOrtTYH9FocH6n2fFWzIwFL
 cKsIvep9SYGOWj982caNzl3LAYle5XAfi5JIs5S0ihm6aoUQI5K7kvhNavEeGxZ4jEuU
 RYLQ==
X-Gm-Message-State: AC+VfDy+U2mT6uni3BRjkMoUHPb4RGJtffqHfcCDTCWiQK2DyiOKgnfS
 1AJUYmQhnehG54sGpnQNlmi1wg==
X-Google-Smtp-Source: ACHHUZ71JVmKh/tdS2RYAwVRVuFCKvLjiA3bfXy1Dgf8RKwZheiPzPj99AbW0bM/Es5vcP/qS5l2QQ==
X-Received: by 2002:a19:ae1a:0:b0:4e9:cfd2:e2d with SMTP id
 f26-20020a19ae1a000000b004e9cfd20e2dmr4270367lfc.65.1684828010333; 
 Tue, 23 May 2023 00:46:50 -0700 (PDT)
Received: from [192.168.1.101] (abyk138.neoplus.adsl.tpnet.pl. [83.9.30.138])
 by smtp.gmail.com with ESMTPSA id
 t9-20020ac25489000000b004eb0c51780bsm1257070lfk.29.2023.05.23.00.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 00:46:49 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 23 May 2023 09:46:14 +0200
Subject: [PATCH v5 03/12] dt-bindings: display/msm: sc7180-dpu: Describe
 SM6350 and SM6375
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v5-3-998b4d2f7dd1@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684828003; l=2117;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=0YTG0EAw+lDImyg5bB4Ke78N5DjTkdTQlY35rQdmXMI=;
 b=PHp0G4FhTqfvDuJ0a+D+2q6mMJa+Nwdr6F7LU3/mfGPFYlmLMf1YqUCyHEpLozcE6jCwyOP7y
 msjNM7JwYKCDFZGP5JteN8dX5wBsbcRqZuN/4W3O7Otz7m5nz44afFt
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SC7180, SM6350 and SM6375 use a rather similar hw setup for DPU, with
the main exception being that the last one requires an additional
throttle clock.

It is not well understood yet, but failing to toggle it on makes the
display hardware stall and not output any frames.

Document SM6350 and SM6375 DPU.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/display/msm/qcom,sc7180-dpu.yaml      | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
index 1fb8321d9ee8..630b11480496 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
@@ -13,7 +13,10 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    const: qcom,sc7180-dpu
+    enum:
+      - qcom,sc7180-dpu
+      - qcom,sm6350-dpu
+      - qcom,sm6375-dpu
 
   reg:
     items:
@@ -26,6 +29,7 @@ properties:
       - const: vbif
 
   clocks:
+    minItems: 6
     items:
       - description: Display hf axi clock
       - description: Display ahb clock
@@ -33,8 +37,10 @@ properties:
       - description: Display lut clock
       - description: Display core clock
       - description: Display vsync clock
+      - description: Display core throttle clock
 
   clock-names:
+    minItems: 6
     items:
       - const: bus
       - const: iface
@@ -42,6 +48,7 @@ properties:
       - const: lut
       - const: core
       - const: vsync
+      - const: throttle
 
 required:
   - compatible
@@ -52,6 +59,20 @@ required:
 
 unevaluatedProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: qcom,sm6375-dpu
+
+    then:
+      properties:
+        clocks:
+          minItems: 7
+
+        clock-names:
+          minItems: 7
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,dispcc-sc7180.h>

-- 
2.40.1

