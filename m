Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FB862971C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 12:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D47410E3A9;
	Tue, 15 Nov 2022 11:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4298310E3A9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 11:17:45 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id i10so26545609ejg.6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 03:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FkSozsWp9c5t2iKAtING9xKC9KYbh2luRizH7RgckuQ=;
 b=mKf7Kx2D80U1xIKxkMX+ucwIBp9D7wxbgmCj3avk2OyM+5D+Pqqgw+OmPHWacX0joI
 Dub4Xm7heIpwg4X72v8RrgmaAhbH3wsmkchqYxrLE32YfC+Ihb0Pc9UbqFAx/jKIxi6V
 oHRHQZFW+/udCRRHdoH7r4uagVM4DbrCzjhgr51jPGzMxXHxkDQHEt8xjKQQu8hiqeKc
 6jeKLlGMAxaC5uxzOXSoBxAyMGjg/i+tY1FrGX0fqxm6IQSKi+29EcC2Rn/2wOH7CC6v
 Sh7QsPQ2kP2imxqvLM36PrLE5f1162csWxuus8YnFRHF9ZnyVVDHya7thr9HoAkq1ZFz
 H2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FkSozsWp9c5t2iKAtING9xKC9KYbh2luRizH7RgckuQ=;
 b=1R2rhi/iejbbHAsyrxyjtt317yHAtJ1pe2D0in7GRwtVv1E/hUGtg6m2kNFQ48d/aU
 xZu19cNVesQCVOCGn11aUuWZa9o+qY7x4fmz5cB4Sv3cZ0/q4/X/KOPyvJW6ftkN9h8G
 FXQPr7R4FKDLeJq9sh4ovuixQD1dzQMZWSEMiBKzyAfU1QGNRv6JRPV1XSjzX+PDgPRo
 E32RpN0/R2+/YEb22eAlL2S873I6fq4gZcLfvR9ZwlkpuP31B6Q4ggli1ASdf/DUYtg6
 RNVJkAhntNSVdSe2F6kr770eAsqKy/WRVkFXHexRpjMDzxyCfsF5RKf4w93uDinauiIf
 Mq+g==
X-Gm-Message-State: ANoB5pniq4V0PPfjMHVDNQ+HvtjF88bCBigRbcVMg7um04cF3oxM3MZG
 wEmD96+WUsQeZCtpFsCvF1tGeA==
X-Google-Smtp-Source: AA0mqf6x3/TE8cmj4xoUYjBVoLu4h1HygCrfYTp86X0ITj+92lmPTZEqQSc30odyZIXIDeA2b4GL4w==
X-Received: by 2002:a17:906:71c8:b0:7ae:71d4:37b with SMTP id
 i8-20020a17090671c800b007ae71d4037bmr13197455ejk.237.1668511063769; 
 Tue, 15 Nov 2022 03:17:43 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 eg25-20020a056402289900b00457b5ba968csm5973519edb.27.2022.11.15.03.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 03:17:43 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, bjorn.andersson@linaro.org,
 konrad.dybcio@somainline.org, quic_kalyant@quicinc.com,
 swboyd@chromium.org, robert.foss@linaro.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 vkoul@kernel.org, quic_vpolimer@quicinc.com, dianders@chromium.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 vinod.koul@linaro.org, quic_jesszhan@quicinc.com, andersson@kernel.org
Subject: [PATCH v2 02/12] dt-bindings: display: msm: Add qcom,
 sm8350-mdss binding
Date: Tue, 15 Nov 2022 12:17:11 +0100
Message-Id: <20221115111721.891404-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115111721.891404-1-robert.foss@linaro.org>
References: <20221115111721.891404-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mobile Display Subsystem (MDSS) encapsulates sub-blocks
like DPU display controller, DSI etc. Add YAML schema for MDSS device
tree bindings

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 .../display/msm/qcom,sm8350-mdss.yaml         | 240 ++++++++++++++++++
 1 file changed, 240 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
new file mode 100644
index 000000000000..9a0694853576
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
@@ -0,0 +1,240 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8350 Display MDSS
+
+maintainers:
+  - Robert Foss <robert.foss@linaro.org>
+
+description:
+  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
+  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
+  bindings of MDSS are mentioned for SM8350 target.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,sm8350-mdss
+
+  clocks:
+    items:
+      - description: Display AHB clock from gcc
+      - description: Display hf axi clock
+      - description: Display sf axi clock
+      - description: Display core clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: nrt_bus
+      - const: core
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
+        const: qcom,sm8350-dpu
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,mdss-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,dsi-phy-5nm-8350
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sm8350.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8350.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sm8350.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-subsystem@ae00000 {
+        compatible = "qcom,sm8350-mdss";
+        reg = <0x0ae00000 0x1000>;
+        reg-names = "mdss";
+
+        interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>,
+                        <&mmss_noc MASTER_MDP1 0 &mc_virt SLAVE_EBI1 0>;
+        interconnect-names = "mdp0-mem", "mdp1-mem";
+
+        power-domains = <&dispcc MDSS_GDSC>;
+        resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
+        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&gcc GCC_DISP_SF_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+        clock-names = "iface", "bus", "nrt_bus", "core";
+
+        iommus = <&apps_smmu 0x820 0x402>;
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        display-controller@ae01000 {
+            compatible = "qcom,sm8350-dpu";
+            reg = <0x0ae01000 0x8f000>,
+                  <0x0aeb0000 0x2008>;
+            reg-names = "mdp", "vbif";
+
+            clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                     <&gcc GCC_DISP_SF_AXI_CLK>,
+                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+                     <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+            clock-names = "bus",
+                          "nrt_bus",
+                          "iface",
+                          "lut",
+                          "core",
+                          "vsync";
+
+            assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+            assigned-clock-rates = <19200000>;
+
+            operating-points-v2 = <&mdp_opp_table>;
+            power-domains = <&rpmhpd SM8350_MMCX>;
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
+                opp-300000000 {
+                    opp-hz = /bits/ 64 <300000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-345000000 {
+                    opp-hz = /bits/ 64 <345000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-460000000 {
+                    opp-hz = /bits/ 64 <460000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+            };
+        };
+
+        dsi0: dsi@ae94000 {
+            compatible = "qcom,mdss-dsi-ctrl";
+            reg = <0x0ae94000 0x400>;
+            reg-names = "dsi_ctrl";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <4>;
+
+            clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+                     <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+                     <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+                     <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&gcc GCC_DISP_HF_AXI_CLK>;
+            clock-names = "byte",
+                      "byte_intf",
+                      "pixel",
+                      "core",
+                      "iface",
+                      "bus";
+
+            assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+                          <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+            assigned-clock-parents = <&dsi0_phy 0>,
+                                 <&dsi0_phy 1>;
+
+            operating-points-v2 = <&dsi_opp_table>;
+            power-domains = <&rpmhpd SM8350_MMCX>;
+
+            phys = <&dsi0_phy>;
+            phy-names = "dsi";
+
+            ports {
+             #address-cells = <1>;
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
+        };
+
+        dsi0_phy: phy@ae94400 {
+            compatible = "qcom,dsi-phy-5nm-8350";
+            reg = <0x0ae94400 0x200>,
+                  <0x0ae94600 0x280>,
+                  <0x0ae94900 0x260>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&rpmhcc RPMH_CXO_CLK>;
+            clock-names = "iface", "ref";
+
+            vdds-supply = <&vreg_l5b_0p88>;
+        };
+    };
+...
-- 
2.34.1

