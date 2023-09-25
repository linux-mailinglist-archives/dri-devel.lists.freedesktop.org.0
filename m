Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C686C7ADA6B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 16:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C2C10E270;
	Mon, 25 Sep 2023 14:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630CB10E268
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 14:50:39 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9a65f9147ccso809842966b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 07:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695653437; x=1696258237; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=55KLykjn1PnKwPDK5zu7mxi2gd1J0lug+paYekIyZv8=;
 b=cFnBWslfsHvAVl2zykwcclxMyCsQ6jnD7XMyUqurLJ3KW3foRshZllgFe1FQ8nDykW
 z7RiPH8vMFK6uvwZRoBsy+RhTg6NDBlFu5ASdUpJ0zMzX3R9bfJSgCT2rmGKdSfF1qzW
 QNL6LTUPapNKAbhLGGDnYeVOiwZjBre3assWFXQiv6Y5OcplNQiHFAFPFxF9Y8ItVLqS
 Juw7ffbpltkhAI/ZW3ekIIZKDkpsTuVyHxHOzhrSGL5pFxSX/wcvLRntoQsZ1t5JCCjr
 RfnzPvDnxP0FMh77zF2OnzuvQ0TaAMfZFO89BVuASuh3zC0mmFfaw6F21wh7TJ4Vlj/i
 41zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695653437; x=1696258237;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=55KLykjn1PnKwPDK5zu7mxi2gd1J0lug+paYekIyZv8=;
 b=GSgt1wF5Y5EKU9AbLh5w+RXsezxkTqw+ZFtcjhaQvyU8gNkfgzUJfKxDl27PAOnMPg
 ICXZk/P14ZYgXq/XbYLMrkmWjkUm7t+/09wqky7yx52j+GTgw0Joq4iLSMexy85mBif4
 ao6Q6+cftSk7O05bVG4NXVJI7tPrgemlxLPxjp6Rf4huyjcRL+l984SodkaBR7MMDsKS
 YBgYSiCLK26Py7pGoSGwE5hCivRotJ/GuYRKz03eYJD4oSQ36vlXHsfmuJJ0Q3ZQs/CM
 Whs40OWuTQap9Gvbj3Xo/YbvaYeWzbDTsG8hJl/Ob5R9TPe/CZtZG+oTlB1UP6OlKdR5
 LziA==
X-Gm-Message-State: AOJu0YzG6Kded0Jkm+TPTmQmbompahzcCq0ppUnWQXWdzcofWgOjv9id
 92YWD9mChhHtzCMzLIuh5I1tfrV6NBWLDMyv2nbcvg==
X-Google-Smtp-Source: AGHT+IFaXNxwlFWxMeQ/5HhV3ihSzn+GoLwlLRm3zMJhAHhxXB8RJs6h/QPnFbQfHoV4sGwMyi+Eww==
X-Received: by 2002:a17:906:1bb2:b0:9ae:5202:e611 with SMTP id
 r18-20020a1709061bb200b009ae5202e611mr6132132ejg.14.1695653437554; 
 Mon, 25 Sep 2023 07:50:37 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a170906a38800b0099bc2d1429csm6426640ejz.72.2023.09.25.07.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 07:50:37 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 25 Sep 2023 16:50:30 +0200
Subject: [PATCH v5 01/10] dt-bindings: display/msm/gmu: Add Adreno 7[34]0 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v5-1-3dc527b472d7@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v5-0-3dc527b472d7@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v5-0-3dc527b472d7@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Andy Gross <agross@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695653434; l=2826;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=uMWu7ymKY3eYzgWjGn5JPo+8PeGurJ1cuv0/kOUDIFY=;
 b=Au0tyJmG59eJHkGXgh4DHk2BrLSfA+/HoUwV5HtBq64LbTFibaQZfUzhkr/yPaIUtrIBPgr42
 n+Q1vPaYOCPB04BVrSZuGVaQwet2V7UvZG6HHVnWwglRKZLBvVEef6G
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
index d65926b4f054..428eb138881a 100644
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

