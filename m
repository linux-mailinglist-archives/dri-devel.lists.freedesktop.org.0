Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EB779CD11
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 12:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183D110E3EC;
	Tue, 12 Sep 2023 10:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CB410E3D9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 10:04:51 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9ad8bba8125so49543466b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 03:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694513090; x=1695117890; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oBaJ5OsgfXs2kkcWusba2RO2Avkk4yo/xOTdTxq4iI8=;
 b=FzBmo4IQ80hZd6lJJz2L8w4uvjYzx4fGIl8N2TCeWOa2vYttDh4xRQQKUuyNH9x04t
 AQfq4DEvv/rhlxG0ABj1c4eiOoH5snRt0WKmijtBqX2hB+EQ9PpgqvUNbjVoGxv2Z9KL
 n+eTq75oFGZJ8MTPUGWp1eo0TzXCAyRF91lLb2L0elWpN/CvRU06xDoqJLTb56c0y50N
 U8ievm3uGf40a2NejjvIPcyA9h+Eh+wPD+buySE3BMgxtSOWfw0Nacql80NJGcw+wHY7
 hw7d6YT7xXpK8CyQuni3w00JVaaR/OjC4F5Bc7sPPRGw4ukpiV3AEQWSwLdqFHKPrTLu
 6lCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694513090; x=1695117890;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oBaJ5OsgfXs2kkcWusba2RO2Avkk4yo/xOTdTxq4iI8=;
 b=j484IK69MkTD6CqzRRuzQUx3lxSvSZz4d66j9awWiqm+cAQsqYx4H80AoOSCUDcwXX
 R6sPFIo0Rf/RL3261G122YAGY9BOSnpLl23HKDPnWDHM7/lLefeZ/LGVtkm5m8/R/Hh1
 323KVDgKhGkeCGrWn4a1ACye9qGoqzuJkNPMeE4bmS7IVBLjJBimnrtcs8NazN44kI8A
 gs1U2Mmh8I1ctdNVYvwJmBNaqZVD7FaaoMyOrs4DXchHBFBHCpdTYwecwYR8061z5dFp
 MMZs5fI4wXALcOIs3Hzf4WjD6zuvp6aiuc52vDJpQWLjvFwHBBbDM+jiBXK/4n9d7rSe
 m3mw==
X-Gm-Message-State: AOJu0YxQwecre5CDakjTRay2UNK98N0dRZ2ZhRcONduPQaJK55TlqTBv
 jTuS8sF3CAPXBw6KpeFANkQOpg==
X-Google-Smtp-Source: AGHT+IE4LAvEmNCCVoXvt3XAFXhM5Mpn2quo2m/5P3cfpKZcxGQvFaRprrP23r/6yaZ7ma3Exgo1Vg==
X-Received: by 2002:a17:907:77c1:b0:99c:75f7:19c1 with SMTP id
 kz1-20020a17090777c100b0099c75f719c1mr10281192ejc.39.1694513089988; 
 Tue, 12 Sep 2023 03:04:49 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177248.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.248])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a170906060300b0099ce188be7fsm6592053ejb.3.2023.09.12.03.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 03:04:49 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 12 Sep 2023 12:04:43 +0200
Subject: [PATCH v4 01/10] dt-bindings: display/msm/gmu: Add Adreno 7[34]0 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v4-1-8b3e402795c1@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v4-0-8b3e402795c1@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v4-0-8b3e402795c1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694513085; l=2826;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=HNK2SS799OXNh7iy5vESf+h2uwh6BGHa1r43G7UvIKE=;
 b=+aNhNRKwvuwrMdhWRTbxNVQkwFcWZURLyBD2mwRyP/wVP/eXlh+1jqsekzIPBXb7Jrz+oB2AW
 9yvuwejWMdsBoppcj4wodblH7P/o/r0eUQ6Pxz7OycwtF0+lEdiYMWk
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GMU on the A7xx series is pretty much the same as on the A6xx parts.
It's now "smarter", needs a bit less register writes and controls more
things (like inter-frame power collapse) mostly internally (instead of
us having to write to G[PM]U_[CG]X registers from APPS)

The only difference worth mentioning is the now-required DEMET clock,
which is strictly required for things like asserting reset lines, not
turning it on results in GMU not being fully functional (all OOB requests
would fail and HFI would hang after the first submitted OOB).

Describe the A730 and A740 GMU.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 40 +++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 5fc4106110ad..20ddb89a4500 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -21,7 +21,7 @@ properties:
   compatible:
     oneOf:
       - items:
-          - pattern: '^qcom,adreno-gmu-6[0-9][0-9]\.[0-9]$'
+          - pattern: '^qcom,adreno-gmu-[67][0-9][0-9]\.[0-9]$'
           - const: qcom,adreno-gmu
       - const: qcom,adreno-gmu-wrapper
 
@@ -213,6 +213,44 @@ allOf:
             - const: axi
             - const: memnoc
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,adreno-gmu-730.1
+              - qcom,adreno-gmu-740.1
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+            - description: Resource controller registers
+            - description: GMU PDC registers
+        reg-names:
+          items:
+            - const: gmu
+            - const: rscc
+            - const: gmu_pdc
+        clocks:
+          items:
+            - description: GPU AHB clock
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU AXI clock
+            - description: GPU MEMNOC clock
+            - description: GMU HUB clock
+            - description: GPUSS DEMET clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: gmu
+            - const: cxo
+            - const: axi
+            - const: memnoc
+            - const: hub
+            - const: demet
+
   - if:
       properties:
         compatible:

-- 
2.42.0

