Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFD25A9478
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 12:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AEE10E6C0;
	Thu,  1 Sep 2022 10:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C164D10E6A3
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 10:23:26 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id p16so5709517lfd.6
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Sep 2022 03:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=bv3T8WPYFThl+f9nEQNBZ4CF4xXVMlb0Mv8v7lUGZ9g=;
 b=xmPRWKjiz0waRhbK6pLq57Z6PA0VgBUw8r8Os5JD4kUxPDsFYkFi8FdunEzpp9w0uZ
 9tn6NSstbWsjm95KjpWDhHpn4YD9RNKxfDGm2jSK8ibqAxacH0cYwPvXcuKiBsBjw0pk
 bP1FiphBCN2DBqhV9ioMZmGwpIdFSOt3Cg1WCtMQtzZOBR2wFxs7fBn2KPH/kx50NG4M
 LUCEv8NtuzNMw2fKP9PLn8NH9nphDI++WBYslUfaUSCpJm6SpNcOVWebvxSDUe63UJgL
 QZQ5jiYIsiVfsBs3iU3y0IEcf0HWemtJTmtTvHiLIHG86uALZTMVX3EjK5ebpZNC927T
 jBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bv3T8WPYFThl+f9nEQNBZ4CF4xXVMlb0Mv8v7lUGZ9g=;
 b=48AiZQ1/xYJPC/iMetArkicI8R76n3f50qk+sDOSsKItSXO8uvFUq6+BO++tHvIq6o
 Kec4MqvZw4qhd0u6ubKEKnVoU/aFoaWGil73zy+5s4R3qmyFGDhe0DFjISWXuLuDtEJ1
 QV/G4ppzAMtsQirRYiFO36kZ74uTBHUrP9hAneGxhn0xMRHUwnvVXWTWyJMvFp2WPYOH
 dFydDpIJgzYzNNLK8wOzIpqv873whmKIX2SGQn4ZLug3VsMB45S7Mt2lNF8VMw0VDES1
 Tg3iCqI7QYqJeDzatTSZAl0K4++vtK/BPVRTSmfrv8qM2Tv22lUlZ5OwWUTAOc7nAaDo
 oe3Q==
X-Gm-Message-State: ACgBeo3WFzupPXcWIPe2Q4xl2qvE9KIM2JhwSCAci0SaBu2tbSL/zZtr
 rqVwY5GR6mZIPVAWVRx7BoOurg==
X-Google-Smtp-Source: AA6agR5nxdf5EcsmpllSAXsT4JRuD8m4TR9S7TEUZxY7KzbF0fjuT1NQDEgmBv7mYuI8rcSOi2cJqg==
X-Received: by 2002:a05:6512:1585:b0:494:9fd0:2ca with SMTP id
 bp5-20020a056512158500b004949fd002camr400670lfb.439.1662027806314; 
 Thu, 01 Sep 2022 03:23:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z19-20020a056512371300b004949ea5480fsm123453lfr.97.2022.09.01.03.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 03:23:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v6 12/12] dt-bindings: display/msm: add support for the
 display on SM8250
Date: Thu,  1 Sep 2022 13:23:12 +0300
Message-Id: <20220901102312.2005553-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
SM8250 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dpu-sm8250.yaml      |  96 ++++++++++++++++
 .../bindings/display/msm/mdss-common.yaml     |   4 +-
 .../bindings/display/msm/mdss-sm8250.yaml     | 106 ++++++++++++++++++
 3 files changed, 204 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sm8250.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-sm8250.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sm8250.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sm8250.yaml
new file mode 100644
index 000000000000..9bc2ee4a6589
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sm8250.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dpu-sm8250.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DPU dt properties for SM8250
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+description: |
+  Device tree bindings for the DPU display controller for SM8250 target.
+
+allOf:
+  - $ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sm8250-dpu
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
+    #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sm8250.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-controller@ae01000 {
+      compatible = "qcom,sm8250-dpu";
+      reg = <0x0ae01000 0x8f000>,
+            <0x0aeb0000 0x2008>;
+      reg-names = "mdp", "vbif";
+
+      clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+               <&gcc GCC_DISP_HF_AXI_CLK>,
+               <&dispcc DISP_CC_MDSS_MDP_CLK>,
+               <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+      clock-names = "iface", "bus", "core", "vsync";
+
+      assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+      assigned-clock-rates = <19200000>;
+
+      operating-points-v2 = <&mdp_opp_table>;
+      power-domains = <&rpmhpd SM8250_MMCX>;
+
+      interrupt-parent = <&mdss>;
+      interrupts = <0>;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+          endpoint {
+            remote-endpoint = <&dsi0_in>;
+          };
+        };
+
+        port@1 {
+          reg = <1>;
+          endpoint {
+            remote-endpoint = <&dsi1_in>;
+          };
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index 053c1e889552..a0a54cd63100 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -27,11 +27,11 @@ properties:
 
   clocks:
     minItems: 2
-    maxItems: 3
+    maxItems: 4
 
   clock-names:
     minItems: 2
-    maxItems: 3
+    maxItems: 4
 
   interrupts:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/msm/mdss-sm8250.yaml b/Documentation/devicetree/bindings/display/msm/mdss-sm8250.yaml
new file mode 100644
index 000000000000..d581d10fea2d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/mdss-sm8250.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/mdss-sm8250.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display MDSS dt properties for SM8250 target
+
+maintainers:
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
+
+description: |
+  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
+  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
+  bindings of MDSS are mentioned for SM8250 target.
+
+allOf:
+  - $ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,sm8250-mdss
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
+        const: qcom,sm8250-dpu
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,mdss-dsi-ctrl
+
+  "^dsi-phy@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,dsi-phy-7nm
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sm8250.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-subsystem@ae00000 {
+      compatible = "qcom,sm8250-mdss";
+      reg = <0x0ae00000 0x1000>;
+      reg-names = "mdss";
+
+      interconnects = <&mmss_noc MASTER_MDP_PORT0 &mc_virt SLAVE_EBI_CH0>,
+                      <&mmss_noc MASTER_MDP_PORT1 &mc_virt SLAVE_EBI_CH0>;
+      interconnect-names = "mdp0-mem", "mdp1-mem";
+
+      power-domains = <&dispcc MDSS_GDSC>;
+
+      clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+               <&gcc GCC_DISP_HF_AXI_CLK>,
+               <&gcc GCC_DISP_SF_AXI_CLK>,
+               <&dispcc DISP_CC_MDSS_MDP_CLK>;
+      clock-names = "iface", "bus", "nrt_bus", "core";
+
+      interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-controller;
+      #interrupt-cells = <1>;
+
+      iommus = <&apps_smmu 0x820 0x402>;
+
+      status = "disabled";
+
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+    };
+...
-- 
2.35.1

