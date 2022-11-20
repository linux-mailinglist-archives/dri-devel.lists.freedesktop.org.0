Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DB36314DD
	for <lists+dri-devel@lfdr.de>; Sun, 20 Nov 2022 16:26:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDAD10E111;
	Sun, 20 Nov 2022 15:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940CF10E111;
 Sun, 20 Nov 2022 13:41:34 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id g7so15273402lfv.5;
 Sun, 20 Nov 2022 05:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OzXsdaV0yYJVFnC6vIcaEdH5pReQJDZIYDtzxhECLeE=;
 b=EsrKw0s8kHaofIOPAZdTCaLSaKJ/mI4pti1Ux2Md77oOtgCF1ZsJznBr0zp/5gdzGF
 5+ouPvdG3XHRwFnIjrYAhs2Jnfx30eNrcMqOwONbuXbblc0Yg4aFKARzr+C9yiyg2AUa
 JeSeSuQprF2O702mgO7/gy9SUjuh28hJZCvZ3MRW74B6YU+NhKIp8ikPInxEn8jqRjM5
 qvtY49m6j8Si9GmE8XygsgDpZXz/F+cC1KCzHTxkA9AncTQ9eivTf4qjwOBPOn0qw8Po
 umkqA3qdX3XBtE6AjFUsK6YzS8KDMpKteLc3nffhNEdR7/S0OsLK7Oh1qQ9WVkZADxp6
 yCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OzXsdaV0yYJVFnC6vIcaEdH5pReQJDZIYDtzxhECLeE=;
 b=MlfD2w72+rE/yDCbDiiB72aZWaa3qxrq+AN7tvVFqKORH9H7cQ08+HPtVbuctNfAh1
 BYs/z5lysntNJsKioHKgvcp+/l2CwP1HDllRiqIM6VQ5W0CSSKgmGhRCd0E1Hdl8Ae9F
 Uhhzpq1K3jBU+7uf8+e8291DJ0cI0JrV+uIrJ3ruTlT+EQTthycsjbb9ejp7U2i71PlQ
 xF8cCxkHl9XR51h0kGqzmCyJxJOLIi3wriU0segHxGooXw45oQ+WqTdhIhmTgxrJtHmA
 rQUn5GJB3f1ysjHSbD4XRnxUOXh2Vl/V9+Ds4WoNECLo5pWTrRIdXta56GaKY2/vlibg
 dOZQ==
X-Gm-Message-State: ANoB5pnUDwgO/11WXxM1FveHuvwOkyle1U9snQw1IIsSKjfXnlzMKC3/
 QHi7Qrg1LiEmbZHzt8K1FNw=
X-Google-Smtp-Source: AA0mqf6P1BRlyCMGmPQYsJfme/eu9V+8/VJk40CIKRcbjerLaPjcSisS9zzcuo3hAz6dD700Q/PI7g==
X-Received: by 2002:a05:6512:3b88:b0:4a3:9533:f4c9 with SMTP id
 g8-20020a0565123b8800b004a39533f4c9mr5141368lfv.615.1668951692715; 
 Sun, 20 Nov 2022 05:41:32 -0800 (PST)
Received: from localhost.localdomain (cds73.neoplus.adsl.tpnet.pl.
 [83.30.168.73]) by smtp.gmail.com with ESMTPSA id
 m3-20020a056512114300b004afac783b5esm1536287lfg.238.2022.11.20.05.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 05:41:32 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH 1/2] dt-bindings: display/msm: add support for the display
Date: Sun, 20 Nov 2022 14:37:36 +0100
Message-Id: <20221120133744.24808-2-a39.skl@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221120133744.24808-1-a39.skl@gmail.com>
References: <20221120133744.24808-1-a39.skl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 20 Nov 2022 15:26:22 +0000
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
Cc: Jason Wang <wangborong@cdjrlc.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Adam Skladowski <a_skl39@protonmail.com>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Loic Poulain <loic.poulain@linaro.org>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
SM6115 platform.
Configuration for DSI/PHY is shared with QCM2290 so compatibles are reused.
Lack of dsi phy supply in example is intended
due to fact on qcm2290, sm6115 and sm6125
this phy is supplied via power domain, not regulator.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 .../bindings/display/msm/qcom,sm6115-dpu.yaml |  87 ++++++++
 .../display/msm/qcom,sm6115-mdss.yaml         | 187 ++++++++++++++++++
 2 files changed, 274 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
new file mode 100644
index 000000000000..cc77675ec4f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm6115-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DPU dt properties for SM6115 target
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,sm6115-dpu
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
+      - description: Display AXI clock from gcc
+      - description: Display AHB clock from dispcc
+      - description: Display core clock from dispcc
+      - description: Display lut clock from dispcc
+      - description: Display rotator clock from dispcc
+      - description: Display vsync clock from dispcc
+
+  clock-names:
+    items:
+      - const: bus
+      - const: iface
+      - const: core
+      - const: lut
+      - const: rot
+      - const: vsync
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sm6115-dispcc.h>
+    #include <dt-bindings/clock/qcom,gcc-sm6115.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-controller@5e01000 {
+        compatible = "qcom,sm6115-dpu";
+        reg = <0x05e01000 0x8f000>,
+              <0x05eb0000 0x2008>;
+        reg-names = "mdp", "vbif";
+
+        clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+                 <&dispcc DISP_CC_MDSS_ROT_CLK>,
+                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+        clock-names = "bus", "iface", "core", "lut", "rot", "vsync";
+
+        operating-points-v2 = <&mdp_opp_table>;
+        power-domains = <&rpmpd SM6115_VDDCX>;
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
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
new file mode 100644
index 000000000000..af721aa05b22
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
@@ -0,0 +1,187 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm6115-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM6115 Display MDSS
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+description:
+  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
+  sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
+  are mentioned for SM6115 target.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,sm6115-mdss
+
+  clocks:
+    items:
+      - description: Display AHB clock from gcc
+      - description: Display AXI clock
+      - description: Display core clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: core
+
+  iommus:
+    maxItems: 2
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sm6115-dpu
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,dsi-ctrl-6g-qcm2290
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,dsi-phy-14nm-2290
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sm6115-dispcc.h>
+    #include <dt-bindings/clock/qcom,gcc-sm6115.h>
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    mdss@5e00000 {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        compatible = "qcom,sm6115-mdss";
+        reg = <0x05e00000 0x1000>;
+        reg-names = "mdss";
+        power-domains = <&dispcc MDSS_GDSC>;
+        clocks = <&gcc GCC_DISP_AHB_CLK>,
+                 <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+        clock-names = "iface", "bus", "core";
+
+        interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        iommus = <&apps_smmu 0x420 0x2>,
+                 <&apps_smmu 0x421 0x0>;
+        ranges;
+
+        display-controller@5e01000 {
+            compatible = "qcom,sm6115-dpu";
+            reg = <0x05e01000 0x8f000>,
+                  <0x05eb0000 0x2008>;
+            reg-names = "mdp", "vbif";
+
+            clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                     <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+                     <&dispcc DISP_CC_MDSS_ROT_CLK>,
+                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+            clock-names = "bus", "iface", "core", "lut", "rot", "vsync";
+
+            operating-points-v2 = <&mdp_opp_table>;
+            power-domains = <&rpmpd SM6115_VDDCX>;
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
+        };
+
+        dsi@5e94000 {
+            compatible = "qcom,dsi-ctrl-6g-qcm2290";
+            reg = <0x05e94000 0x400>;
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
+            assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+            assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
+            operating-points-v2 = <&dsi_opp_table>;
+            power-domains = <&rpmpd SM6115_VDDCX>;
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
+        };
+
+        dsi0_phy: phy@5e94400 {
+            compatible = "qcom,dsi-phy-14nm-2290";
+            reg = <0x05e94400 0x100>,
+                  <0x05e94500 0x300>,
+                  <0x05e94800 0x188>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
+            clock-names = "iface", "ref";
+        };
+    };
+...
-- 
2.25.1

