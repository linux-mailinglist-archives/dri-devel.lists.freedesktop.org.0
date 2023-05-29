Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F281714ACA
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 15:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7598D10E29E;
	Mon, 29 May 2023 13:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B906F10E291
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 13:52:28 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2af2e908163so35474511fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 06:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685368346; x=1687960346;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0cuLBlArSvHUOuH6GEvI+l8s8FmhxL3706TAOMTxRVY=;
 b=XxzGjWQkuX8LH1JQ7CLt/0mi5Dm/25JxSyFPsjCuYSfUVBVhjRGwGqv91xjoy68Dyx
 lQm/v31HyrGZI+4mNlbjrfyKWeKwnDHvMVAfwwZ3iaHhZtSDRYNTzl9fcupcp3lMvm7T
 Bfz68Iq/fF7OA5qoyiAO6aCQ9EyIj3WA6YmyZqINJvt45HyDp1VXFe8klqk/1Vk0xeTT
 zOGGXvyxs6PPMOmd7/8ZYMkX8BxHNFdldENu1RaKkDI706eS3M+AJ6rmLCzk4qAPrJ4b
 1V8Kd0vkfkV0Ni2NrMDul1J/ZJwckXbHjX7rJyy1u+clEEq87I73Q8GDww8Nevtck83B
 i93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685368346; x=1687960346;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0cuLBlArSvHUOuH6GEvI+l8s8FmhxL3706TAOMTxRVY=;
 b=Zm7aNaFGkcH6X9V6fx0OeiyJ0T+ty9NEPZ3jqG7EtcEfy1zICGgIHo/3Wv9N0Myn7A
 Ng2ST1jDrcdwYlXbqLltl1vy5jYv/1KO7GoBwsJJRIstkqTcVrj9dWkW/fk++2Vo2Fs8
 /fZ+VwpT8t2vCATiwGAmpXuCbA7NV8bx6ztmVzNtngRxtu0FIp2LJWkRz/zzcg2OPyZ5
 If1OZBLFruANsmu+zvfZM1uy4sqHjVnwQ50XaNzykIEFE/F8vDRYhphd+t5qtl2mTzyF
 /hRpAeyZ9CSNkgqdAImQ4nrhRWAL4TxUhmCyfAUYwFZbbYTzdPB6JWtU4dmCTEwPkq6+
 +SDw==
X-Gm-Message-State: AC+VfDwgZaw1q6sbvbgpKruzSPGZkQzSFdBvGYXGCsPcjdmOA5LuqMHz
 pgnoayEPhBF3GxucJjnUKTUJpQ==
X-Google-Smtp-Source: ACHHUZ7dMjgZ9WVHIEU+tVT0Q3+//eHqvTy4CAUADfUE1SAhXgcKAYZrLMtD+SYYS9149f1KFUihVQ==
X-Received: by 2002:ac2:4a76:0:b0:4f4:dfd4:33e4 with SMTP id
 q22-20020ac24a76000000b004f4dfd433e4mr3271117lfp.51.1685368346747; 
 Mon, 29 May 2023 06:52:26 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
 by smtp.gmail.com with ESMTPSA id
 c16-20020ac25310000000b004f2532cfbc1sm4700lfh.81.2023.05.29.06.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 May 2023 06:52:26 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 29 May 2023 15:52:20 +0200
Subject: [PATCH v8 01/18] dt-bindings: display/msm: gpu: Document GMU
 wrapper-equipped A6xx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v8-1-69c68206609e@linaro.org>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685368343; l=3273;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=b6+fi5fCGzlZMR9R+EmbwaeFE4doeq5ZoHaz6yo6/U0=;
 b=m5YOP8qYT6dteRhaCWAzqoub/NNS3RW0KZBOeIYF3MKua6KdI4RiWWLpW7I6Fy6ZMfxp+15X6
 +rinzEhHTBwB/9fp6GCRvBGXTrTZMh02HHtjB9HCnCO5j/+wfoW3B3f
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
2.40.1

