Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 740496D130A
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 01:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86F410F0B0;
	Thu, 30 Mar 2023 23:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5154B10F0A0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 23:25:26 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id g17so26675498lfv.4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 16:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680218724;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1zLOaNti8US4yjllYIUZXiOKkjRQYJjDZ58RHJWDDs4=;
 b=m0/n+I1/rpVCuLYzGLyA+DdSFDWUHEW0zjoWQveb0CSVB7dFpJHcd4bM8YIjOg0yZe
 WfYR3m9h7WRhMe+KuydHADTAar48MOvj4k80PJ8Xd9lIs65AHoGepG1pCPf+2QGq/npG
 N0NhvqG8qBG9B2WIP9msAlEtR3d4QA2lOcZ9drv9ZypulWwOHhYAhG2WVMl/1tmg39yL
 IW6In+inoJDNOC9Axa42Xj3yvm807byLF5/DtxrESKDBmaQrcOgtf5iV0tZG8GsTiWxP
 3UEWnfM2QUOMtJorWMljBfKsTIuKcxMjDCPfVfeYmYXt3KSQNpTMtOJB14N5BJ48b62+
 tDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680218724;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1zLOaNti8US4yjllYIUZXiOKkjRQYJjDZ58RHJWDDs4=;
 b=bIjMlDEx1NO0/uZn5TcBKkuyoLb3Vb0dz/5LlTQBGTcgMztNZh35rtyTVZk2a3kST2
 gU767ggoSXMYII0KeXFs61NygUVKYGnVRXkKKvHu4nHTzlSQD2AqCNBtuaPV2jQj9mMB
 SoKKUX7MertivTzPOKSk/ccdUjhclO0rq87p2pOWVAfg29PVYYLt2OjO6TRlb0WOJYYY
 xp83Schq8u7CvJ3Xq8pkl3sY8b6+zOUBcUaFeDP4zdZnxxdfjwzdUGanbxcSnaLyw3r5
 sHlKjNX+hSh9CcMKoRUl3Z/5+b7VJm1044bOamfPqMCQpmllLLSh2rz9iRHStx0BZIgP
 IEvg==
X-Gm-Message-State: AAQBX9c4q9b1jh9bcRJy5rkkn5O42lj+ApnpqjVnpHSEeLMagvsU5nyv
 h8+qtK2yglZt++AaePIf9iMRiQ==
X-Google-Smtp-Source: AKy350ZaKAaf6EsDAOCPMKcvbTa5NWbhgOfiPYIRR8JDxCkib3p5Nc8jwuUQmDcwGJJz6ZQ1WJmm2w==
X-Received: by 2002:ac2:418a:0:b0:4e8:595c:60f9 with SMTP id
 z10-20020ac2418a000000b004e8595c60f9mr6550954lfh.32.1680218724592; 
 Thu, 30 Mar 2023 16:25:24 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 g26-20020ac2539a000000b004dda80cabf0sm127241lfh.172.2023.03.30.16.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 16:25:24 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 31 Mar 2023 01:25:16 +0200
Subject: [PATCH v5 02/15] dt-bindings: display/msm: gpu: Document GMU
 wrapper-equipped A6xx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v5-2-bf774b9a902a@linaro.org>
References: <20230223-topic-gmuwrapper-v5-0-bf774b9a902a@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v5-0-bf774b9a902a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680218720; l=3273;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=PlpPtlQZuCcXGxNxg4tBwrBjp8RpPmQvuWz5XR9uQF0=;
 b=KUKJHvyF8TeKLZ1JC4RG82LkCQbs0eIjTo2BDGIuExX8mjD2ACUXufSJ+O8lmTu3l6DwK31ObAMz
 ZezGDG5fDNQyEQMQtlcKxbonhN8RJmDY9FKNyjVLlfpZWp8jDON5
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "GMU Wrapper" is Qualcomm's name for "let's treat the GPU blocks
we'd normally assign to the GMU as if they were a part of the GMU, even
though they are not". It's a (good) software representation of the GMU_CX
and GMU_GX register spaces within the GPUSS that helps us programatically
treat these de-facto GMU-less parts in a way that's very similar to their
GMU-equipped cousins, massively saving up on code duplication.

The "wrapper" register space was specifically designed to mimic the layout
of a real GMU, though it rather obviously does not have the M3 core et al.

GMU wrapper-equipped A6xx GPUs require clocks and clock-names to be
specified under the GPU node, just like their older cousins. Account
for that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/gpu.yaml       | 61 ++++++++++++++++++----
 1 file changed, 52 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 5dabe7b6794b..58ca8912a8c3 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -36,10 +36,7 @@ properties:
 
   reg-names:
     minItems: 1
-    items:
-      - const: kgsl_3d0_reg_memory
-      - const: cx_mem
-      - const: cx_dbgc
+    maxItems: 3
 
   interrupts:
     maxItems: 1
@@ -157,16 +154,62 @@ allOf:
       required:
         - clocks
         - clock-names
+
   - if:
       properties:
         compatible:
           contains:
-            pattern: '^qcom,adreno-6[0-9][0-9]\.[0-9]$'
-
-    then: # Since Adreno 6xx series clocks should be defined in GMU
+            enum:
+              - qcom,adreno-610.0
+              - qcom,adreno-619.1
+    then:
       properties:
-        clocks: false
-        clock-names: false
+        clocks:
+          minItems: 6
+          maxItems: 6
+
+        clock-names:
+          items:
+            - const: core
+              description: GPU Core clock
+            - const: iface
+              description: GPU Interface clock
+            - const: mem_iface
+              description: GPU Memory Interface clock
+            - const: alt_mem_iface
+              description: GPU Alternative Memory Interface clock
+            - const: gmu
+              description: CX GMU clock
+            - const: xo
+              description: GPUCC clocksource clock
+
+        reg-names:
+          minItems: 1
+          items:
+            - const: kgsl_3d0_reg_memory
+            - const: cx_dbgc
+
+      required:
+        - clocks
+        - clock-names
+    else:
+      if:
+        properties:
+          compatible:
+            contains:
+              pattern: '^qcom,adreno-6[0-9][0-9]\.[0-9]$'
+
+      then: # Starting with A6xx, the clocks are usually defined in the GMU node
+        properties:
+          clocks: false
+          clock-names: false
+
+          reg-names:
+            minItems: 1
+            items:
+              - const: kgsl_3d0_reg_memory
+              - const: cx_mem
+              - const: cx_dbgc
 
 examples:
   - |

-- 
2.40.0

