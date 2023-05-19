Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E11FC709D35
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 19:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF7C10E5D4;
	Fri, 19 May 2023 17:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89FDF10E5B8
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 17:04:38 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f14468ef54so4011207e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 10:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684515878; x=1687107878;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NO5fRgfBpga7Z40GIKnv5Lmg/IglAEvXvStQNi4ygG0=;
 b=Bbdb+1QThMlF638M4Pv9G/iJljUA7x+KqM8jdrVQsDF4imUidG7ALAqVodbIShi3UM
 3BP6HsF/5MYh9RSn6zQ6wynq2wfhZjKLvvE36Ow7H2ll+yi2x6N5bS1CqoKd2YxtY/22
 62ATGeNmNM6yVKg8r7JCQTN1JTMTc7kGs72gzf9PbJiccXDMtT3KnlhUz/Z212YJoNtf
 qgutCap1f3InoMPkzkPePQt4DA0nz8deZyxdalH8ACi2vSwmtwaFoINGIZLjnA6ZGZct
 0lH16Dtre1Bq2uDq8w6uCTfEt27FE7iubGsTs1f20vFNlI+lDIoO2phnBqQoollyu5AJ
 SGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684515878; x=1687107878;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NO5fRgfBpga7Z40GIKnv5Lmg/IglAEvXvStQNi4ygG0=;
 b=Zo2jX5CfUXMY2VzBqeDbQ2CXUBitgwpTLMrJRpbFxqlw0n5j1UPYQIRy7iq+ISl1bk
 u9FxS0C2czQPnMF7vW4n0d6Q9QwiQ9BVBs0ZEHmiWcDvus2abyEsD7fD+bBrIyB6GhvZ
 37XTkBUfx7H2soUgBN9xxPV2VoFjDhh/WbTwZXNTU26m/efPejV7QhwvyYn4p8dwzWN4
 6HrHq98y38bDlc+OVJrbBD6kCVgCYiQ6li91UXHwqiSuZ1do2h5MBludCN3gxs1N2oQ8
 AyiLIX1JcyX3n1KAOvQM6C7zObWI/bEKa+cON20iM/Ia367DLWfagd24+ke7AtTEaul3
 QmoA==
X-Gm-Message-State: AC+VfDyP87hQsfOJp6n3Dw/QzPQZ1MFl7NevFrz95QwBW9ZB/kCn24Gx
 RNApeNTV/7ud0YPdLB7/wHFc26Jk1M0GZwAoxw4=
X-Google-Smtp-Source: ACHHUZ6pbneutyD2zQncnD7WKo5DHNLnuaD2QVdYjB+RwAqZmitfAl2aZHnLP9npNSJQHFfDJsrcAQ==
X-Received: by 2002:ac2:5973:0:b0:4f1:26f5:7814 with SMTP id
 h19-20020ac25973000000b004f126f57814mr970085lfp.20.1684515878014; 
 Fri, 19 May 2023 10:04:38 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a19f806000000b004f38260f196sm654478lff.218.2023.05.19.10.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 10:04:37 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 19 May 2023 19:04:24 +0200
Subject: [PATCH v4 03/12] dt-bindings: display/msm: sc7180-dpu: Describe
 SM6350 and SM6375
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v4-3-68e7e25d70e1@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v4-0-68e7e25d70e1@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v4-0-68e7e25d70e1@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684515870; l=2117;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=0YTG0EAw+lDImyg5bB4Ke78N5DjTkdTQlY35rQdmXMI=;
 b=EcOimJs07IbYQ2waHhEPLsH7OslP142E9bndaFUYKcyL2n6tgLHuuW7brAv8TZhjdQaFnDZ3/
 9VabXvrY1UfByI35KRw5KZoGRHacXGXeCjrP4j+ZOfzWFDWDIRsUsZ5
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

