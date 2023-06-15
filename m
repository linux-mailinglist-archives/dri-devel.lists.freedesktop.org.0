Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE0A732343
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 01:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA46D10E573;
	Thu, 15 Jun 2023 23:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3C210E568
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 23:21:22 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f63006b4e3so11504992e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 16:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686871280; x=1689463280;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kMTREHxXwjgBGSRG8kW/LTEJK2OJPvk6iHyZ2GPscdU=;
 b=Pkb0AK4nFi7hIzVGvRr7NhaNT1nU+GExrpFaq/1jcZWwy6d1QwGae6yYpXyd6mLSSe
 xhn3HQngxDF4TdIhPMc/zgAMDu7A9zJ4unvX3PGO4Y9O1CfJ7fC4pAFBhdAe15Nmq9Sw
 11DDg653oJvXguZj5VPOL2L0PGP5UR8n8dPyzYYbIQDfkgvsiJs4js1xyBAjPII9TQuK
 agy//jrC4YsV1o8cOmybGHGtWW+G743LVcW7Bq4UIQrgDVU6oJxRMklGwlf6z/Y/PfJc
 NQNRid0Wf8Hza3VUQettnn0LvOGC4JG9Jb7f1gV0JmfNYScMpIt1I1dia+xppzkrmZl6
 +t2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686871280; x=1689463280;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kMTREHxXwjgBGSRG8kW/LTEJK2OJPvk6iHyZ2GPscdU=;
 b=iO6T85qsgI0EaEbIA3ol+ch/+S6C5VVzVm4yU2Q4y97MaDE5HxoceRk5DpJ/J7AEqT
 aT/RM8Rjlxzc9ip6Mg1Uz0G9AN9yqXq88g78LadT+ZTBSihgP+gmiOwBOoIQCS1elVtB
 6hf+HezxS4238ur1b+N7QC5lukzTdzHjWn6/o2f+pr4i805hlGDuWzvWdjFRutHl+C+n
 Lf3GNOSZ27bMjoXk+BesILM9W4RaYx74dRgV7b9XcYFoRpqSCEazqRVnnHXgRso4jykY
 D10hDyIjYeg7msWXpUbR1uk8pnYjlaMaj8zVt4UjGiwFh2juNd+8vkl/BqcGIAPXY5hk
 nmWw==
X-Gm-Message-State: AC+VfDxdfBGj4crk57jJQrKjacXi6gTY/dzqSHi4Hn+IBEVK2K6CuB1x
 kylYkMTSVaP4H921yYL7deonmQ==
X-Google-Smtp-Source: ACHHUZ6cNn0JLg7f+Qztkv/PVL4KcCqUQAJq/rv/AEJwrpXQdBTwKQzQhkGZiU6HLycUEYndgLtKEg==
X-Received: by 2002:ac2:504f:0:b0:4f5:1ac9:ab1b with SMTP id
 a15-20020ac2504f000000b004f51ac9ab1bmr105841lfm.23.1686871280052; 
 Thu, 15 Jun 2023 16:21:20 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a056512041900b004f24ee39661sm2744852lfk.137.2023.06.15.16.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 16:21:19 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 16 Jun 2023 01:20:42 +0200
Subject: [PATCH v9 01/20] dt-bindings: display/msm: gpu: Document GMU
 wrapper-equipped A6xx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v9-1-890d8f470c8b@linaro.org>
References: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686871276; l=3381;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=N5wcBgtggmBgTiMxeUpDDPAD+kSRlpLcAHOE+psk1YU=;
 b=2L8VGdGcd+tRVOs8WnvZF/iqW/m2UxCAWFnh4wAPUO1ZBpxv8CyiNLiwVP4OW7/EX71cOCozF
 omQYycOxjgNDN5jGLvnuBVrV9L0Zw2A1Tqwr3z26D54lBpWl7tyPVWU
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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

Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
2.41.0

