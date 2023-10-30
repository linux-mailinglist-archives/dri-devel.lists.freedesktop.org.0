Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 499B67DB85A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 11:37:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E9310E2AA;
	Mon, 30 Oct 2023 10:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6148610E293
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 10:36:48 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-507a0907896so6132928e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 03:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698662206; x=1699267006; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Wf35menyqr8aV3TpKLI5N9BqVbClrvYhoeEs/60fXVg=;
 b=ckv1la3A6QDTPtPrRtDAsb9S2wjSTnsiWA/WTfM5/al9K+ka0/Z3t3UZBDOBK6k0ea
 RHGVp+kU4htfkyUymng9yc44ehr0y/AuiGoJdaUzC4YwqwsEPn4TnkHQGIB2tmXbJ4ZH
 MIexNACgL8Vk+gly5HkXM/xGbZrr0r55ZMy5dM1dpQBczx1R6jItiuawjo93YrunAOBO
 Aeb3fmsc6mawJ2crAWeYhzj5+9wXr1gZKdMGdxtrNtY1FWgiBQoKVsr296j6iO8GKRoT
 /Lw2411aI7kKHAcTZN27M/i9X4fs/fLmostSQdzRTex9dixgU8kA6FTlMeA4p8Wye9M0
 nF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698662206; x=1699267006;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wf35menyqr8aV3TpKLI5N9BqVbClrvYhoeEs/60fXVg=;
 b=Gfb8cy4OZzdytIZhHViC+3ouAT/Y+HScs+Z6YzVCDy6SFlXQYQOiuMBR6K0whJng3F
 jK4SLcKudo840D4Ow70o4wROxATSViARUuIIj8woj7eFDfPOAV9kZ6A+ARc6sbQS8tyD
 ovXvsUMqsBRUmuvEnY6tvefYEdcyYVfbDtlosA4NppXBvwI6JRIt4+GNdVutFwAIF311
 09/k4oDhK+V20hmfpRGsuXQkTKAsO42ykw1kRL+j4JNBJTfFvDg60uLLDep5zgR8G03t
 Hd8ik+ZnYiHzKm2kRJ4UuA6479YkQ05YqsfhH0aaf/+gR/oxKrxp56IqCmdrY8jwxLCW
 a1bA==
X-Gm-Message-State: AOJu0YzWZFnLSx1xb3NlrgZqMTmbeHJEqUTDQIxwLs4r0Vq/nR85Yoh5
 ZAZZxCHKBurGnxmX0MBuaUm8nQ==
X-Google-Smtp-Source: AGHT+IFz6Ft90TRonvQtv8uTyisQIWRdtlOcAPkw4W4JfYAch/zI2oxf2/JzXKAbRL9M0Cns+/3X5g==
X-Received: by 2002:a2e:b617:0:b0:2c5:f54:2477 with SMTP id
 r23-20020a2eb617000000b002c50f542477mr6260498ljn.40.1698662206636; 
 Mon, 30 Oct 2023 03:36:46 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a05600c458500b004060f0a0fd5sm8783209wmo.13.2023.10.30.03.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 03:36:46 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 30 Oct 2023 11:36:25 +0100
Subject: [PATCH v2 3/8] dt-bindings: display: msm: document the SM8650 DPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231030-topic-sm8650-upstream-mdss-v2-3-43f1887c82b8@linaro.org>
References: <20231030-topic-sm8650-upstream-mdss-v2-0-43f1887c82b8@linaro.org>
In-Reply-To: <20231030-topic-sm8650-upstream-mdss-v2-0-43f1887c82b8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3954;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=x4ucVNCXjv/ys2+lExZHj2JGfBeSHaxw/qEVsQolx7Q=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlP4c39C3XCIWkeUOAFhgJ5Bd6MROfRA/Dx6BZ6h92
 8CnHhu2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZT+HNwAKCRB33NvayMhJ0bmrEA
 DOUjSLVs9t8C4eF3W2kRW53G+zLQ/j0SSMY9YQqi7bm/akTFYsIjUGxCU8FsbDQsXJzqBxBWJBz+19
 GCZiDfRpRhx/ezfmHHsUL/HbV5rGP/kA1ZY0Az4LIZN88jQKbGDbgcTwdHFXxyW2oQ07cQoTNZCcwF
 /qfL/Nv3vnYY9YN4jW0yozmo+nmCPdCUT++mh+B1zM+lvelDLo/5Eg8AIdEcnnSdDlmpkztKkHsb5O
 HwvUCW8ErRbBncAw2bkvpyOYH1reOhZxUh3T+W9KDXKCgzChadSj2cib7nClGRzW6n/LtWS8/TNOOq
 kMZhVDduca+iUZHDJVE9SpkIXfNW0vYBfuhay4rjeH6MqbfFX7JNBUXICyXAZLLdbzvJA/nFTXDcqd
 jm2jyROXDhzOura1PA3wj/OxYd+XaQxn0dhyPglf0v9tJCo0vJkJb2Rx0IseeO+N/5mjscBDWZPsp7
 57kG4aCduZYlqR7rMISKEKdPQ4BGvkUSkDyXqCk5WYa8AQ/U5pRreZAYFITLuwrGarGmu6xVpCtwSC
 Rw66VkD8kdauPPkldjRUETaY84hoHHSIQUlNMbFIg+WnBfhYaMlah53DSu0P68PJGS8rJze0Lu9DyM
 k/ZCRkQJKOkzNqDfnmxfTbVtXl/l9U/gfKKhD9mZOaANI/idUuHqZxgQp6zg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the DPU Display Controller on the SM8650 Platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      | 127 +++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
new file mode 100644
index 000000000000..a01d15a03317
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8650 Display DPU
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sm8650-dpu
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
+      - description: Display hf axi
+      - description: Display MDSS ahb
+      - description: Display lut
+      - description: Display core
+      - description: Display vsync
+
+  clock-names:
+    items:
+      - const: nrt_bus
+      - const: iface
+      - const: lut
+      - const: core
+      - const: vsync
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    display-controller@ae01000 {
+        compatible = "qcom,sm8650-dpu";
+        reg = <0x0ae01000 0x8f000>,
+              <0x0aeb0000 0x2008>;
+        reg-names = "mdp", "vbif";
+
+        clocks = <&gcc_axi_clk>,
+                 <&dispcc_ahb_clk>,
+                 <&dispcc_mdp_lut_clk>,
+                 <&dispcc_mdp_clk>,
+                 <&dispcc_vsync_clk>;
+        clock-names = "nrt_bus",
+                      "iface",
+                      "lut",
+                      "core",
+                      "vsync";
+
+        assigned-clocks = <&dispcc_vsync_clk>;
+        assigned-clock-rates = <19200000>;
+
+        operating-points-v2 = <&mdp_opp_table>;
+        power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+        interrupt-parent = <&mdss>;
+        interrupts = <0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dpu_intf1_out: endpoint {
+                    remote-endpoint = <&dsi0_in>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                dpu_intf2_out: endpoint {
+                    remote-endpoint = <&dsi1_in>;
+                };
+            };
+        };
+
+        mdp_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-325000000 {
+                opp-hz = /bits/ 64 <325000000>;
+                required-opps = <&rpmhpd_opp_svs>;
+            };
+
+            opp-375000000 {
+                opp-hz = /bits/ 64 <375000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-514000000 {
+                opp-hz = /bits/ 64 <514000000>;
+                required-opps = <&rpmhpd_opp_nom>;
+            };
+        };
+    };
+...

-- 
2.34.1

