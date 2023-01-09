Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4ED6622C6
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 11:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D554910E3C0;
	Mon,  9 Jan 2023 10:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85D310E3B9
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 10:15:23 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id ay40so5886464wmb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 02:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ED7fYuzAB7f5fc2VJPjwBawtAk4y6MtSvcIIzbfF72M=;
 b=kPYXWX+xudX2E0Xv91YZXlYwgltLNyURmxLuYkmocyIaB1+Soqs/XCTHQTaobDacfw
 G2E8xXtvVTMkm3191d74/rrY5HARVJvByfxmmXBA6PNojywxasa2JDDB0+xVelXgrxpf
 4Wstr8pbT9M5zZTfEl3RaCG/VdvFoPTYzTCk7DJotNzJ1hZu5Wo+CccEz4wgMOEFgemn
 2WVqWus2QBhPFBQq92lEMTMhmzajCZ1OSnGVpAOZp6n+X/D3IZD40g7tVqamreDaYeSB
 SWAOURhwqVt5HQ7vZ5/BQSm+G+EUDh3MalBFAKOgK9BMoMbtC3JQJpFXWlIqB5UqlT2U
 utKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ED7fYuzAB7f5fc2VJPjwBawtAk4y6MtSvcIIzbfF72M=;
 b=P9LcQJfWoA5WEvd3IUssk6sBv9RoAUw4e9OtVHog9K8JU03bxQJ4PeVD2r4g2I5/6L
 Z3g7sWXnYGse1dMn9EUdd2P9ZXyMcI88Xf5Tm7N02pyBob/B0xDl7BVZwlM0dD/QRlQq
 wk/uKn1XVZZv8ea4CIQKVE0Apz2m+zQVJ8I1ZgTIAf/YWrrsz+QZeEUvTJedDcVaPQ3v
 jh703JdcUV3tuJzKIlsW38ST0n4CHSq7gJAY6bh3O5HlceL1XFKeaEaxn87qOlY7L7Ps
 JThLUWrcIvvttZqRDoXbOcEeNTHv+jjdfdp7KbTZ6PqeBVK5pHVdUsTe9Qm1Yn08CjvE
 /pJQ==
X-Gm-Message-State: AFqh2kq9Q37tterV0bnV4VkRqyqIYzZa2koRfeFpbjdjoWnONFOmaoGL
 H8x+fOsE9xMU9D5aS7trWNLdWg==
X-Google-Smtp-Source: AMrXdXsR8ooi+sQn7m8YAPss+LI9GO3rYcVfny7y77mEFwYiQZIUflbvZwITRfndQkLICMPntESAtQ==
X-Received: by 2002:a05:600c:4f83:b0:3d2:3f55:f73f with SMTP id
 n3-20020a05600c4f8300b003d23f55f73fmr46215333wmq.8.1673259322217; 
 Mon, 09 Jan 2023 02:15:22 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c2caa00b003cfd58409desm15815376wmc.13.2023.01.09.02.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 02:15:21 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 09 Jan 2023 11:15:18 +0100
Subject: [PATCH v3 2/7] dt-bindings: display/msm: document DPU on SM8550
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-topic-sm8550-upstream-mdss-dsi-v3-2-660c3bcb127f@linaro.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.11.1
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

Document the DPU hardware found on the Qualcomm SM8550 platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/display/msm/qcom,sm8550-dpu.yaml      | 134 +++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml
new file mode 100644
index 000000000000..c3d5a98fe3c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm8550-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8550 Display DPU
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sm8550-dpu
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
+      - description: Display AHB
+      - description: Display hf axi
+      - description: Display MDSS ahb
+      - description: Display lut
+      - description: Display core
+      - description: Display vsync
+
+  clock-names:
+    items:
+      - const: bus
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
+    #include <dt-bindings/clock/qcom,sm8550-dispcc.h>
+    #include <dt-bindings/clock/qcom,sm8550-gcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sm8550.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-controller@ae01000 {
+        compatible = "qcom,sm8550-dpu";
+        reg = <0x0ae01000 0x8f000>,
+              <0x0aeb0000 0x2008>;
+        reg-names = "mdp", "vbif";
+
+        clocks = <&gcc GCC_DISP_AHB_CLK>,
+                <&gcc GCC_DISP_HF_AXI_CLK>,
+                <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+                <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+        clock-names = "bus",
+                      "nrt_bus",
+                      "iface",
+                      "lut",
+                      "core",
+                      "vsync";
+
+        assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+        assigned-clock-rates = <19200000>;
+
+        operating-points-v2 = <&mdp_opp_table>;
+        power-domains = <&rpmhpd SM8550_MMCX>;
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
