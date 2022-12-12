Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2E3649B30
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 10:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB3210E180;
	Mon, 12 Dec 2022 09:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A5F10E180
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 09:33:21 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id g14so7893566ljh.10
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 01:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bZHkYi77hxjoZDsrKmhq/+OuCV8fZzrsDPTht6P0G/0=;
 b=ojMMLM6XgX2zIkMJXDvdW75Q1TPJfGLCCd92nk+MTfgVbs8bkl9YvPrhlDWAM1eYoB
 ik8XiEwX9nvFESCCLFUqYhEgu+XAif2OekUYQt7wlb5I88txktiL4tT8TUpAoVyQggB6
 wvDvrrzj7FnsVY+2IwD5X9TtMuwlSIEXJ7zqPAyDdGZttSYrt5t7RkuUEokPRxiGlRsu
 CCrsc5SwK02pEbj33kBCHt7O8tP8Jj32jiQsvNgfuDEgJEsWxChIXyS7yfRLxSXTucJK
 HYvK9gNMSyGy3O0xroRjcAnGDFdDqv3XD6ULSng4eRS50EYXqQ4odUKpq8U4gsfGCsLP
 GUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bZHkYi77hxjoZDsrKmhq/+OuCV8fZzrsDPTht6P0G/0=;
 b=R2u0wAv5n0FqXLHg1V6hu32QgAqwAlKrzN3U+bdl52StVixQS2Zri7tt/Sktxv28ny
 ayaKkTWmwi8ZdHTU+ivpQ6axIITXKUMond8T8tW3VRZTvJEz73D6TJUbN/PVGaLCzH9y
 fzgRaTrULnvQKuPFFCfTzfd/RFCJXL4EpVqMZzZuaNvNdHMeumGTQkYCYNuuHEh/ZDfo
 AIG9VqNNY1SABYMP/q7kb1Du5A1yBVjuSqGnP+aISxFxHswF7mi5pFZi2eMiJxIKLd+W
 swkhsbozPFlUbJfxcv8VPyMviXbHuUXe5NauE/8AIqWX8p2dNgluWAlXr8XYOKae0mQt
 6k1w==
X-Gm-Message-State: ANoB5pkJE8klVWXwqN2WQqTSTCMTv4h3N5ewGqEYIL7Hac4AQypLxWXg
 P2ngG9DS6O9TwIeVGmpGDEItYA==
X-Google-Smtp-Source: AA0mqf6ECMNMrl2/XUIKQOuvGffNVIzy4PXBCIiLXEW+xJtPgSeF8Fy3+8b+vnb6GCELFfy+j+TwSg==
X-Received: by 2002:a2e:b5cd:0:b0:27a:874:cd2d with SMTP id
 g13-20020a2eb5cd000000b0027a0874cd2dmr3756474ljn.9.1670837600091; 
 Mon, 12 Dec 2022 01:33:20 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl.
 [83.9.1.44]) by smtp.gmail.com with ESMTPSA id
 y2-20020a05651c106200b002770fb5722fsm1155081ljm.123.2022.12.12.01.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 01:33:19 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 1/3] dt-bindings: display/msm: Add SM8150 MDSS & DPU
Date: Mon, 12 Dec 2022 10:33:12 +0100
Message-Id: <20221212093315.11390-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.38.1
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for the display hardware on SM8150.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/display/msm/qcom,sm8150-dpu.yaml |  92 +++++
 .../display/msm/qcom,sm8150-mdss.yaml         | 330 ++++++++++++++++++
 2 files changed, 422 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml
new file mode 100644
index 000000000000..2b3f3fe9bdf7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm8150-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8150 Display DPU
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sm8150-dpu
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
+      - description: Display ahb clock
+      - description: Display hf axi clock
+      - description: Display core clock
+      - description: Display vsync clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: core
+      - const: vsync
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sm8150.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8150.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sm8150.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-controller@ae01000 {
+        compatible = "qcom,sm8150-dpu";
+        reg = <0x0ae01000 0x8f000>,
+              <0x0aeb0000 0x2008>;
+        reg-names = "mdp", "vbif";
+
+        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+        clock-names = "iface", "bus", "core", "vsync";
+
+        assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+        assigned-clock-rates = <19200000>;
+
+        operating-points-v2 = <&mdp_opp_table>;
+        power-domains = <&rpmhpd SM8150_MMCX>;
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
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
new file mode 100644
index 000000000000..55b41e4573dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
@@ -0,0 +1,330 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm8150-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8150 Display MDSS
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+description:
+  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
+  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
+  bindings of MDSS are mentioned for SM8150 target.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,sm8150-mdss
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
+        const: qcom,sm8150-dpu
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
+        const: qcom,dsi-phy-7nm
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sm8150.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8150.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sm8150.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-subsystem@ae00000 {
+        compatible = "qcom,sm8150-mdss";
+        reg = <0x0ae00000 0x1000>;
+        reg-names = "mdss";
+
+        interconnects = <&mmss_noc MASTER_MDP_PORT0 &mc_virt SLAVE_EBI_CH0>,
+                        <&mmss_noc MASTER_MDP_PORT1 &mc_virt SLAVE_EBI_CH0>;
+        interconnect-names = "mdp0-mem", "mdp1-mem";
+
+        power-domains = <&dispcc MDSS_GDSC>;
+
+        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&gcc GCC_DISP_SF_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+        clock-names = "iface", "bus", "nrt_bus", "core";
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        iommus = <&apps_smmu 0x800 0x420>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        display-controller@ae01000 {
+            compatible = "qcom,sm8150-dpu";
+            reg = <0x0ae01000 0x8f000>,
+                  <0x0aeb0000 0x2008>;
+            reg-names = "mdp", "vbif";
+
+            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&gcc GCC_DISP_HF_AXI_CLK>,
+                     <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+            clock-names = "iface", "bus", "core", "vsync";
+
+            assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+            assigned-clock-rates = <19200000>;
+
+            operating-points-v2 = <&mdp_opp_table>;
+            power-domains = <&rpmhpd SM8150_MMCX>;
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
+                opp-171428571 {
+                    opp-hz = /bits/ 64 <171428571>;
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
+        dsi@ae94000 {
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
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus";
+
+            assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+                              <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+            assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
+            operating-points-v2 = <&dsi_opp_table>;
+            power-domains = <&rpmhpd SM8150_MMCX>;
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
+            compatible = "qcom,dsi-phy-7nm";
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
+            vdds-supply = <&vreg_dsi_phy>;
+        };
+
+        dsi@ae96000 {
+            compatible = "qcom,mdss-dsi-ctrl";
+            reg = <0x0ae96000 0x400>;
+            reg-names = "dsi_ctrl";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <5>;
+
+            clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
+                     <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
+                     <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
+                     <&dispcc DISP_CC_MDSS_ESC1_CLK>,
+                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&gcc GCC_DISP_HF_AXI_CLK>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus";
+
+            assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
+                              <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+            assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
+            operating-points-v2 = <&dsi_opp_table>;
+            power-domains = <&rpmhpd SM8150_MMCX>;
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
+            compatible = "qcom,dsi-phy-7nm";
+            reg = <0x0ae96400 0x200>,
+                  <0x0ae96600 0x280>,
+                  <0x0ae96900 0x260>;
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
+            vdds-supply = <&vreg_dsi_phy>;
+        };
+    };
+...
-- 
2.38.1

