Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BF26D3053
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 13:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B60410E241;
	Sat,  1 Apr 2023 11:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297A710E22D
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Apr 2023 11:54:56 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id j11so32195137lfg.13
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Apr 2023 04:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680350095;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1zLOaNti8US4yjllYIUZXiOKkjRQYJjDZ58RHJWDDs4=;
 b=RuNCVGTaN5gZnDQnvL6Nhf5iCmkua53Vi4bno/QMxLBaTtqkqGPCyrmvByqtzYkmHW
 Xr4YdeQqCir0ro2gRn+mbRb7xIzxOJ3hYAb+KvA16dWVsaHuNJ8LfrM3EErpnjB7qi+X
 feoiKpibMclNNCJ/GIaDM3Km77vZPtf/TNszA7bFAn9ZZeXR00DgG079KZVG7gZuGdz+
 PrAr6cYKl4b0txU4BYmbaIYMxVWPIln/rdoIR4uXbrCRmW8LEinj1gPm346qCaeVYa52
 YkxuxLNoeEQ33EPIiQ4tqELVVoYzZADHPEmAyTUCXTYDBI22vn1jLlHplWtj2z9xEALw
 R+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680350095;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1zLOaNti8US4yjllYIUZXiOKkjRQYJjDZ58RHJWDDs4=;
 b=ehuEDtS9tS1ll1NGcKN4FotZGLC8YAoUiGdBX61mAtCWKTeXVyRHbCu2VI0HM75h0W
 26MuvrpEI8XzJKZAyVsJy4LOFg+CrxH4AMCh8fsQGI06IUxhKi9KfgZvZtLr6t8xoWiJ
 U1/pRBhUm9fN0FPuPt+fnLbjDLI4mCPoqFAoQjE9XENSzMDFvMt2Of+/T9QyhnDk70ba
 5V5gbZ2VBrTpVlHZ39I/nHceq5Bh17f3L6vThcSqLat69vmPkZFBrZTMUBgpezoWQpS0
 bFYay19T/aa516V9MxTDGocKw+Xyg3foosa4M1vn3qhL4n30bh9An07vh4Xu+wt6SykL
 XrNg==
X-Gm-Message-State: AAQBX9ezyYQVirwDRzbIWq7wMVrv4xQFHZHYQGXmzQ6SSqDLqq/o4l/o
 /QrQvqmuiQRiwImjGRSugpV5Ww==
X-Google-Smtp-Source: AKy350YuzizgJ6QE3l39U5ozbe45B4Y6XvzYkEt87TCXHM2UIwCbBE/2TFoNySQXVHG7Z0SLkqf7ag==
X-Received: by 2002:ac2:5fc8:0:b0:4eb:1294:983d with SMTP id
 q8-20020ac25fc8000000b004eb1294983dmr5425511lfg.7.1680350095725; 
 Sat, 01 Apr 2023 04:54:55 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 w8-20020ac254a8000000b004e83f386878sm786737lfk.153.2023.04.01.04.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Apr 2023 04:54:55 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 01 Apr 2023 13:54:39 +0200
Subject: [PATCH v6 02/15] dt-bindings: display/msm: gpu: Document GMU
 wrapper-equipped A6xx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v6-2-2034115bb60c@linaro.org>
References: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680350084; l=3273;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=PlpPtlQZuCcXGxNxg4tBwrBjp8RpPmQvuWz5XR9uQF0=;
 b=+zjHJg9qutShAJ+HmZMGEEq7+Hwtxprz8Uf0MwcBkcf4tKJyKXX8ACUw+IsQJxplDgzmP73Z/0eG
 +njJZ0tHCn31Hsd2F4BPwa8r9Kco4MJPEyAU5Cqxoicl6iIaikX5
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

