Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F41AC6E9EDA
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 00:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D2010ED1E;
	Thu, 20 Apr 2023 22:31:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5550A10ED0F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 22:31:28 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4ec8143400aso969427e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 15:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682029886; x=1684621886;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VJj4iUa0gP8dE+G0RSh+D7ANM6WUiBcMefoNYHpmjLo=;
 b=iLhtUyLEI5h9707Bz0eSJLkguwBa6XOJGzh37I0z2vb9Ca/QoEpeiMWcjQJqrI9Vkt
 QnD8TaJtg9wiBBv5Srk1pmhII07sprdy7KxQI1qs4W4zdqJ/6ZouOobyFrI2nQS04vNA
 tRbJv412j/22VhX2xsSLTn/9fdFvmpnt26wBHM2IS7/DqMvksvO2WZWJvV3/ckVNX4GO
 LkHNGyI0KN70paicigpYlelseajoNfziasQnGi1kOOSO4MWXJQu1sOMblsnIn7r6CaS7
 +EbUAuC1hKqrbSc75Rj2Fk5oOiEE3VyxvvWpoKJHM4dBoULM/p80aYwzah/Bc9+0eZNl
 +9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682029886; x=1684621886;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VJj4iUa0gP8dE+G0RSh+D7ANM6WUiBcMefoNYHpmjLo=;
 b=PpSoo/WpGn+ijte1idRdoGS9vEtFjBzEfmENm8E/mRWyF52d0ixvB9G+7tjM+5OeSF
 c0A6nSDpPVnlaVNI4/iKsSGkYRYTOC5tf92tSr5hs9Lf5Jf000IKVEUsiEkflaF+Qdu8
 vXlqYyJDTL8F0TtF043aIfid6YtRr9xz/akg6rkZW6YJFK0OxdKfbvynmN1mzxd8OR1v
 I7vmjBeY8Vrp2ALYD7YY1XcS5sknrrpEp/4tJBKzdokr33FZLvoq4EayRmmZTxqODa6J
 eZv6mu0TT//35EzvUBO77WaGvRLqVCET6FzYpRLKQlJYfU1q0drPYT7yrpoRJ352w+92
 n9tg==
X-Gm-Message-State: AAQBX9dueflM8UXcZMi5xLyatcpmGnoja0RRBRgH0uYpyibnw/iWDOqc
 dvc0K2AnQdThYBpoS22Wp0N+Zw==
X-Google-Smtp-Source: AKy350ZaZKdhevb+I6R02zGNmsqx/pDBw3ojmDsIhknsvSc29GRoNLxYD149FtIJnIMVKdZ7Ve5p7A==
X-Received: by 2002:ac2:44db:0:b0:4db:3847:12f0 with SMTP id
 d27-20020ac244db000000b004db384712f0mr740802lfm.50.1682029886498; 
 Thu, 20 Apr 2023 15:31:26 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 w8-20020ac25d48000000b004eedb66983csm324256lfd.273.2023.04.20.15.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 15:31:26 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 21 Apr 2023 00:31:12 +0200
Subject: [PATCH v2 03/13] dt-bindings: display/msm: Add SM6350 DPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v2-3-5def73f50980@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1682029879; l=3116;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Jn7UUu6GoDaa1TPUPCp5gGqhPJdOjKwB/r9DEtFoZ/8=;
 b=hT4Kv6Rl8AlI+YMEYKy2x199yWG2QcMaUez6pKcGxf95PxJ9gt3z6p728s1HkV514Q/8P2XvMAM1
 /Y9sppidCF+LVbqRnM8i2sidRJyhpuat81PIaTk/VypHfDVN6QLI
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

Document the SM6350 DPU.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/display/msm/qcom,sm6350-dpu.yaml      | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6350-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-dpu.yaml
new file mode 100644
index 000000000000..979fcf81afc9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-dpu.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm6350-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DPU dt properties for SM6350 target
+
+maintainers:
+  - Konrad Dybcio <konrad.dybcio@linaro.org>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,sm6350-dpu
+
+  reg:
+    items:
+      - description: Address offset and size for mdp register set
+      - description: Address offset and size for vbif register set
+
+  reg-names:
+    items:
+      - const: mdp
+      - const: vbif
+
+  clocks:
+    items:
+      - description: Display axi clock
+      - description: Display ahb clock
+      - description: Display rot clock
+      - description: Display lut clock
+      - description: Display core clock
+      - description: Display vsync clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: iface
+      - const: rot
+      - const: lut
+      - const: core
+      - const: vsync
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sm6350.h>
+    #include <dt-bindings/clock/qcom,gcc-sm6350.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-controller@ae01000 {
+        compatible = "qcom,sm6350-dpu";
+        reg = <0x0ae01000 0x8f000>,
+              <0x0aeb0000 0x2008>;
+        reg-names = "mdp", "vbif";
+
+        clocks = <&gcc GCC_DISP_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&dispcc DISP_CC_MDSS_ROT_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+        clock-names = "bus", "iface", "rot", "lut", "core",
+                      "vsync";
+
+        interrupt-parent = <&mdss>;
+        interrupts = <0>;
+        power-domains = <&rpmhpd SM6350_CX>;
+        operating-points-v2 = <&mdp_opp_table>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                endpoint {
+                    remote-endpoint = <&dsi0_in>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                endpoint {
+                    remote-endpoint = <&dsi1_in>;
+                };
+            };
+        };
+    };
+...

-- 
2.40.0

