Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 373977DB84F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 11:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD00010E298;
	Mon, 30 Oct 2023 10:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EAE010E294
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 10:36:49 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9cf83c044b7so578074566b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 03:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698662208; x=1699267008; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/2OV3dFd3+7TorEvOU5N+P3IiIqu2Ym8tmt4xBT5dwY=;
 b=Vv0XMQCHkbgX+yL0KC0QWBsPnGKUEfr/4Y7ld6/qULpBaiDG7G0nJtu1R53KpP8FGj
 y39VgyRrKJQmqobgrRqenLdpTRxE+XKZ13DRxSad/aSlseun4XetqDfvhlpR5W26Hn6B
 z/eaT5BK/PW9kbacMA3UVAr0PQe4TCSqvOdBXjfOU7ntyzrwV2vnttuaF+TyLUEa4a3V
 rAOLJDQqSNPWZfxKAZcy8uOzXgehv7S/URehnsdOuFUJfI+BKbtzuigk+SQu+4XQBGXd
 8sn9lUaNO5ySXh/PQ/wvPDIjQREYO+VPmJPTjXsuaIJ4XvtGLlfGx2ousNVW3Q9xlzgB
 EVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698662208; x=1699267008;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/2OV3dFd3+7TorEvOU5N+P3IiIqu2Ym8tmt4xBT5dwY=;
 b=JYT+wkiKxLC+ITVbTIedgrCYu5huj3mAouhORedn3GkEKzdF/WQyLlhGGsOzjX45tQ
 LQhJ8qv2BExG8eIsgUkaDL7ljO2J82QERa4lgvE89/JcZWaPEeOecd46E04l2gtDX0Q4
 4UoEpJ2wBsIQlnUfl9gWlwE12UpWPRYY9ACdFR+9mW3dCf/3OVLxGe5qSLkBOuhH+bo3
 IsfWdvDtbyZYaf8j6ikE6x9WI5zxxVcDZD3qts0kd9YQ7EciJQSbGJki0kq5AumtOogP
 D/JZDX+hmo8uFCCe8aoeok21KV65AiKQ2j0009tvOYE8EJPaaGyVjABJcWDf++DxTaHo
 +jwQ==
X-Gm-Message-State: AOJu0YyMqWP5j/0j2gH0F5lehmsQpebb43yTQx4cvj99dDzva0d9ik6h
 yN0+1QHhfMEIRGMimvK53f3h+Q==
X-Google-Smtp-Source: AGHT+IGbohuifZxdIHZS+7iC4Bec7pebMWnxwr7udyRgN8X7IGEmpTDbsahkbZNb0WTqQevDmu6Isg==
X-Received: by 2002:a17:907:6d05:b0:9ad:a59f:331a with SMTP id
 sa5-20020a1709076d0500b009ada59f331amr8837169ejc.57.1698662207859; 
 Mon, 30 Oct 2023 03:36:47 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a05600c458500b004060f0a0fd5sm8783209wmo.13.2023.10.30.03.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 03:36:47 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 30 Oct 2023 11:36:26 +0100
Subject: [PATCH v2 4/8] dt-bindings: display: msm: document the SM8650
 Mobile Display Subsystem
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231030-topic-sm8650-upstream-mdss-v2-4-43f1887c82b8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10135;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=5QSy/+cFPldX20Hrn2ch7mP7dFh0iNCAZ6kGBnX0PQ8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlP4c3jUDCuFVkbHOzdoHwJnB0gpTES2lOSXojetFp
 Wo6wNBWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZT+HNwAKCRB33NvayMhJ0Qp2D/
 95tw4hcXAiNG3UuGhGR1y5plDzvFgMZ71RfW0A40SSN3qtzUpWtEtXAQmMdYk7rS8Wy3CVKHgjRc9M
 2sFi3fbLdgqN8eT2TYNS0iKSNmKu00v8g+wgF2EvyoU6fMwC5wOi5x0mHwC3wPO56yqIpDAhI7xiA+
 RDdE0WkbCPka9pmODQwOzPNILkiNTyuvsiMRenY7qbzVgg42CpFp5h93ry07p9pragA3eZv0CxDDrC
 HvEOzEdFnwN8KVuTuidRc08SiQHHNNIckDKjr1GpmrmwWpMJVfYfaMmH3orbXHI/3Q05OYpn2SNru/
 S/4piyyL+XtlTEp/LU5LD2i6MWcD6bE+jNUZriwJmilisMY4E1XKj3AJWSQN4mL0wtYUG3F3GjD6un
 O267U/ftRy103QNU4+GdVPXYwcBS2f5kBRzWre9Tte/sHZIKPkeQjy5HtLEqp6Iv3dKO8DBKjgRFHg
 CbcH0af0nd5G9xGQqQgxzjEtBFZeYfg+Lo2Oo9aYPQbaC36VCY1t+KeaHV1c5nsqkN8zYrBIJivCN3
 WOrTbKrNDXXSoCHVwO5Rb5AQlGDOXEmzbnLidNa83N+S6CHI+D1WN4Iwnnpc9X18S5ssDinnl5cZuL
 6ME7Zgl0zw0HXtSZT+gMqbloFL0vPblBdLlYtP2mzKivdjviEmPzIMcxFF4w==
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

Document the Mobile Display Subsystem (MDSS) on the SM8650 Platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/display/msm/qcom,sm8650-mdss.yaml     | 322 +++++++++++++++++++++
 1 file changed, 322 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
new file mode 100644
index 000000000000..5638c1ea692e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
@@ -0,0 +1,322 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8650 Display MDSS
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description:
+  SM8650 MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
+  DPU display controller, DSI and DP interfaces etc.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sm8650-mdss
+
+  clocks:
+    items:
+      - description: Display AHB
+      - description: Display hf AXI
+      - description: Display core
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    maxItems: 2
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sm8650-dpu
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        items:
+          - const: qcom,sm8650-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sm8650-dsi-phy-4nm
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    display-subsystem@ae00000 {
+        compatible = "qcom,sm8650-mdss";
+        reg = <0x0ae00000 0x1000>;
+        reg-names = "mdss";
+
+        resets = <&dispcc_core_bcr>;
+
+        power-domains = <&dispcc_gdsc>;
+
+        clocks = <&gcc_ahb_clk>,
+                 <&gcc_axi_clk>,
+                 <&dispcc_mdp_clk>;
+        clock-names = "bus", "nrt_bus", "core";
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        iommus = <&apps_smmu 0x1c00 0x2>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        display-controller@ae01000 {
+            compatible = "qcom,sm8650-dpu";
+            reg = <0x0ae01000 0x8f000>,
+                  <0x0aeb0000 0x2008>;
+            reg-names = "mdp", "vbif";
+
+            clocks = <&gcc_axi_clk>,
+                     <&dispcc_ahb_clk>,
+                     <&dispcc_mdp_lut_clk>,
+                     <&dispcc_mdp_clk>,
+                     <&dispcc_mdp_vsync_clk>;
+            clock-names = "nrt_bus",
+                          "iface",
+                          "lut",
+                          "core",
+                          "vsync";
+
+            assigned-clocks = <&dispcc_mdp_vsync_clk>;
+            assigned-clock-rates = <19200000>;
+
+            operating-points-v2 = <&mdp_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            interrupt-parent = <&mdss>;
+            interrupts = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&dsi0_in>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    dpu_intf2_out: endpoint {
+                        remote-endpoint = <&dsi1_in>;
+                    };
+                };
+            };
+
+            mdp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-200000000 {
+                    opp-hz = /bits/ 64 <200000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-325000000 {
+                    opp-hz = /bits/ 64 <325000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-375000000 {
+                    opp-hz = /bits/ 64 <375000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-514000000 {
+                    opp-hz = /bits/ 64 <514000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+            };
+        };
+
+        dsi@ae94000 {
+            compatible = "qcom,sm8650-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+            reg = <0x0ae94000 0x400>;
+            reg-names = "dsi_ctrl";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <4>;
+
+            clocks = <&dispc_byte_clk>,
+                     <&dispcc_intf_clk>,
+                     <&dispcc_pclk>,
+                     <&dispcc_esc_clk>,
+                     <&dispcc_ahb_clk>,
+                     <&gcc_bus_clk>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus";
+
+            assigned-clocks = <&dispcc_byte_clk>,
+                              <&dispcc_pclk>;
+            assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
+            operating-points-v2 = <&dsi_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            phys = <&dsi0_phy>;
+            phy-names = "dsi";
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    dsi0_in: endpoint {
+                        remote-endpoint = <&dpu_intf1_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    dsi0_out: endpoint {
+                    };
+                };
+            };
+
+            dsi_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-187500000 {
+                    opp-hz = /bits/ 64 <187500000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-300000000 {
+                    opp-hz = /bits/ 64 <300000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-358000000 {
+                    opp-hz = /bits/ 64 <358000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+            };
+        };
+
+        dsi0_phy: phy@ae94400 {
+            compatible = "qcom,sm8650-dsi-phy-4nm";
+            reg = <0x0ae95000 0x200>,
+                  <0x0ae95200 0x280>,
+                  <0x0ae95500 0x400>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            clocks = <&dispcc_iface_clk>,
+                     <&rpmhcc_ref_clk>;
+            clock-names = "iface", "ref";
+        };
+
+        dsi@ae96000 {
+            compatible = "qcom,sm8650-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+            reg = <0x0ae96000 0x400>;
+            reg-names = "dsi_ctrl";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <5>;
+
+            clocks = <&dispc_byte_clk>,
+                     <&dispcc_intf_clk>,
+                     <&dispcc_pclk>,
+                     <&dispcc_esc_clk>,
+                     <&dispcc_ahb_clk>,
+                     <&gcc_bus_clk>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus";
+
+            assigned-clocks = <&dispcc_byte_clk>,
+                              <&dispcc_pclk>;
+            assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
+            operating-points-v2 = <&dsi_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            phys = <&dsi1_phy>;
+            phy-names = "dsi";
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    dsi1_in: endpoint {
+                        remote-endpoint = <&dpu_intf2_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    dsi1_out: endpoint {
+                    };
+                };
+            };
+        };
+
+        dsi1_phy: phy@ae96400 {
+            compatible = "qcom,sm8650-dsi-phy-4nm";
+            reg = <0x0ae97000 0x200>,
+                  <0x0ae97200 0x280>,
+                  <0x0ae97500 0x400>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            clocks = <&dispcc_iface_clk>,
+                     <&rpmhcc_ref_clk>;
+            clock-names = "iface", "ref";
+        };
+    };
+...

-- 
2.34.1

