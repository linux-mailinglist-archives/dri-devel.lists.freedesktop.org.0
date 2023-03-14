Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 725B06B9911
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 16:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C001D10E835;
	Tue, 14 Mar 2023 15:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 743DC10E82E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 15:28:43 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id by8so16411557ljb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 08:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678807721;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FfpC0lXYq1ll6nbzoGKkSBMv0WmddnDy3ZKS7f0bm/s=;
 b=nuXeOgG35nLhpQRRtNMHfnLyZD6r104D193hTDJ6SUD6UTROZX49ztDyCxB5b/yXQL
 Rqb9pP3md5/C8Pu3IazHspSOZQQVt6W22h0N8rTzTPk8yL945NI0eDpXxvOZh69Nnhfs
 TRklrmiV3rQZHKy6dGYTuwmTbUntIN6lfgzEuNuJNcgyR/Xieck5pWDmV7+LPzgoZZt4
 UDwFts4TWGaGsk6Xz/9N4rVmOXQ9JM27IvkiXSBEjZtHVhlPpIM1T8jxGBF9WQoJz3IU
 wCS5jes6BWXkCB+bOFcYDWwwKfFxpQGAxDdRge+5gd4JroLTe6+UmvpmXAUOXiD4DVwu
 vSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678807721;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FfpC0lXYq1ll6nbzoGKkSBMv0WmddnDy3ZKS7f0bm/s=;
 b=OSitEm6Y5yAnGoa7EdBPJ3uZ08DVji8NUokhHfSkFRbIkPOtFXo7w1KrDo0sf2Vce5
 QBWJYkM4OBDXbPa1PmXZwYU/k0i2wmsZCe9sbYH0hwqwgc1Mg5QSVUPIs5SrrwoiIyPO
 u0/oIjgssV9jxcuT/Fxok6/0RyWJdnpVS+GGdP7nvuK3vWEIraioH5eRhJS7+uWjnGaD
 VSjGGfwR5BK+rcb9I+8lImPSQ2R7ABRK4QUHgl8y0/1MDOGIz9LoaeZyVlrbWhQDnxkD
 pthr69L8dnA4KhjVFE2TewLemXvHeUO+6/4ZPjh5Yni476ZNYvsMgwoieC3hn/qcbyTN
 cpHg==
X-Gm-Message-State: AO0yUKXSma6/kjbIyL7OPG6RjhkkFjM90H5NKN3SxhQART9tVBlS0kDg
 VeFPY0z3okGvCJaow+kUeNYyJA==
X-Google-Smtp-Source: AK7set/WntUhZuSNUQTrPjCTj4ukX0xl87beorxjM9H0yP4/SY9PWs7JVDdulaM8wwYD1Se+d2giaQ==
X-Received: by 2002:a2e:93c6:0:b0:295:a33f:5349 with SMTP id
 p6-20020a2e93c6000000b00295a33f5349mr11157007ljh.26.1678807721760; 
 Tue, 14 Mar 2023 08:28:41 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 27-20020a2e165b000000b002986a977bf2sm491529ljw.90.2023.03.14.08.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:28:41 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 14 Mar 2023 16:28:33 +0100
Subject: [PATCH v4 02/14] dt-bindings: display/msm/gmu: Add GMU wrapper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v4-2-e987eb79d03f@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678807716; l=3283;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=UT3xDmXTHRxoAqg/suyw+w4CBgyq4mbs1kv24/YUgS4=;
 b=Yj3XYeUYs1m8xSmfDaz+G1H2jht5+3yszWDs4/x/w6AR5a0OpS9HKzKChzuLlKQk2FjWMjVL954/
 cJyNHPETCk3lA8OCiyigoRSsoyRRc0ziAMQ3HyyxyrTvcopQdhtW
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

To sum it all up, the GMU wrapper is essentially a register space within
the GPU, which Linux sees as a dumbed-down regular GMU: there's no clocks,
interrupts, multiple reg spaces, iommus and OPP. Document it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 49 ++++++++++++++++------
 1 file changed, 37 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index ab14e81cb050..021373e686e1 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -19,16 +19,18 @@ description: |
 
 properties:
   compatible:
-    items:
-      - pattern: '^qcom,adreno-gmu-6[0-9][0-9]\.[0-9]$'
-      - const: qcom,adreno-gmu
+    oneOf:
+      - items:
+          - pattern: '^qcom,adreno-gmu-6[0-9][0-9]\.[0-9]$'
+          - const: qcom,adreno-gmu
+      - const: qcom,adreno-gmu-wrapper
 
   reg:
-    minItems: 3
+    minItems: 1
     maxItems: 4
 
   reg-names:
-    minItems: 3
+    minItems: 1
     maxItems: 4
 
   clocks:
@@ -44,7 +46,6 @@ properties:
       - description: GMU HFI interrupt
       - description: GMU interrupt
 
-
   interrupt-names:
     items:
       - const: hfi
@@ -72,14 +73,8 @@ required:
   - compatible
   - reg
   - reg-names
-  - clocks
-  - clock-names
-  - interrupts
-  - interrupt-names
   - power-domains
   - power-domain-names
-  - iommus
-  - operating-points-v2
 
 additionalProperties: false
 
@@ -216,6 +211,27 @@ allOf:
             - const: cxo
             - const: axi
             - const: memnoc
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-gmu-wrapper
+    then:
+      properties:
+        reg:
+          items:
+            - description: GMU wrapper register space
+        reg-names:
+          items:
+            - const: gmu
+    else:
+      required:
+        - clocks
+        - clock-names
+        - interrupts
+        - interrupt-names
+        - iommus
+        - operating-points-v2
 
 examples:
   - |
@@ -249,3 +265,12 @@ examples:
         iommus = <&adreno_smmu 5>;
         operating-points-v2 = <&gmu_opp_table>;
     };
+
+    gmu_wrapper: gmu@596a000 {
+        compatible = "qcom,adreno-gmu-wrapper";
+        reg = <0x0596a000 0x30000>;
+        reg-names = "gmu";
+        power-domains = <&gpucc GPU_CX_GDSC>,
+                        <&gpucc GPU_GX_GDSC>;
+        power-domain-names = "cx", "gx";
+    };

-- 
2.39.2

