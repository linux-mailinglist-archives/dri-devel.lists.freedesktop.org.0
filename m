Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA096B990B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 16:28:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1823410E825;
	Tue, 14 Mar 2023 15:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37D710E828
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 15:28:41 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id h3so16399770lja.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 08:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678807720;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dDrs6JyeTYzM6UbBJjwqEiLM0mM7HZ/Cu05l6aEARFA=;
 b=IFE6Gu3pkatgASwbx1ImpERuqNfGoEv4bKaRQZJgSsFYmX9pyq789ui74anr0GCEgf
 2xhhKtZyoTkYjXzPauAL1Zp41IK+Vpjlwq+hoO13s91dFAMtE6VgaJnabahi+PpOaeQo
 7cDgmExTSrb/GiJspQc4v8qgRrsmpmSSEM7cUYx38aDmKcw+l1lyUJ+yGQkPUySaOkpL
 1jT0ETnMz6lohpMpRS3SwQcgxd/g2g4M6hw4mQ2lAJYlCijRKOLW0Y5X40UVcfpE3jPE
 885KfrBnSHaQMS1LZzaG2dZVEoQFavz1LBj4jqiCpXSqIda3x3QRT0E1SgBQ7WHVOlY9
 cTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678807720;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dDrs6JyeTYzM6UbBJjwqEiLM0mM7HZ/Cu05l6aEARFA=;
 b=mVdYmfRZ3DtCZK2APeO1ddhGsJ0hJl59OJWpY3E2AkRswTVPcUIaqKSVi6fa1hSZLW
 Ns0Xhu6TgIwq07Trqwo3w1Bd+Fddn8DZ2AsX+oE/Irm+HscT0ILlbsq0qSs7305eAKKG
 qYh2IRb3S/uJNy5+9QKW3PhzwPNk/BblsQK/coz0apFQzCAGMkTrxJh6/vWo3O/jCQ+V
 ngkp4gVzc7q6mYQ2BORlfZih1FtKPXd/uf5MEmmYQ2PHj9GoAdLtJ9AiuBRyLJfu8KVU
 8q8K8o0cJDQIT3go+Bcz1wYEJ7qlqQUuWzC+mwwnyMh1t8jaBDC/VAsIqVoMcsRmRlh9
 zr7Q==
X-Gm-Message-State: AO0yUKXQ8lMVQTsvHL+222yWOjueJFWYCUbUelAyMeWcy7sb/gxYNFVq
 WlXEVC9nLg/ZVgDOXSRF0hzGPA==
X-Google-Smtp-Source: AK7set+AKW5h3+gpYUWs5M8YeHUiHDyWaDoRGbpKtAv13E6yGkGt34J83LUQNCU+EhNDQZ0o+KzEBA==
X-Received: by 2002:a2e:83c6:0:b0:293:5360:162b with SMTP id
 s6-20020a2e83c6000000b002935360162bmr4084469ljh.11.1678807719958; 
 Tue, 14 Mar 2023 08:28:39 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 27-20020a2e165b000000b002986a977bf2sm491529ljw.90.2023.03.14.08.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:28:39 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 14 Mar 2023 16:28:32 +0100
Subject: [PATCH v4 01/14] dt-bindings: display/msm: gpu: Document GMU
 wrapper-equipped A6xx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v4-1-e987eb79d03f@linaro.org>
References: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678807716; l=3204;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=6sAUPUwHP7+WUPx0qnkXu1yRwFCLU2UOzBhHFKkRGTM=;
 b=mV+9zzv7CDxkMqctTdkZFuDUkQFR5lB3OtJchHXfOYHhrrpWJ/oHSNLECv+KrnMciFrDa+s7/Rx9
 dsByIHe1CGn7Aexc8isUndJ0jhglIt6f9uZXVUBWv3VqK6RfeBKH
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
 .../devicetree/bindings/display/msm/gpu.yaml       | 57 ++++++++++++++++++----
 1 file changed, 48 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index d4191cca71fb..ac1a9bce2042 100644
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
@@ -157,16 +154,58 @@ allOf:
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
2.39.2

