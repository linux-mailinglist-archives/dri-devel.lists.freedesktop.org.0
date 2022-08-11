Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5255E58F68D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 05:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817709BA07;
	Thu, 11 Aug 2022 03:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448979799B
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 03:58:47 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id w197so7035232oie.5
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 20:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=W/Ddv3FILaw5kcUD3MzHcpXXotpPc2TE/jad5ETUSuM=;
 b=cUwl8twTqYs/ew9sdT3ULDGEmiDGjv97A+o5Dp3uk3glhVxXP5H7+tiQJel2pQbBzY
 +eIHdQUDm/Fk01osvE2rIePFAwIVLN6NQENxUMm1P410V7p6/MIQb0X1cOC8x2nfGkX1
 u5ouO+IccIFz/MfaE1gZTp2ly1+oMAiRCZVLWdjQa4J7gxrCBLwpeCtd96jqtz2yc6Yt
 A2J3vg/WlVtcvF9Bg8bwvaAEw4y+JJE+k8CFX91QuqzGlRz+LZh/5ovk1U0lS5uryQBf
 yvt2XVgmcV7367e14/bcpm7J+Uw70eFaTq8YI995sPZhq8D7C1dHu8hXmqhly3Mv19y1
 4AeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=W/Ddv3FILaw5kcUD3MzHcpXXotpPc2TE/jad5ETUSuM=;
 b=dCQZtJ5xSIE4Frh1//GIoOYf6Cl9XktnSd2znCYL3GuqeoiXSp19OaKMxNZ2iyxiCw
 5feKWbAVUJc6hItpICFORn4qz3CkraezIjWTqNayUbGmTMbOm/MqVw4vSLBJRtH3pp4B
 yv9/UKrxlidsYYoi4ErklPwlF0rjuWuYo2KMX8xf/wOm0MVxKdkHW0oJ03Gjy/l9TvH9
 p7Bs3VXLeaZAMPKpVwpH7bXMzyyljfQG+xBP+DbZMgNCW+dyvwCaj1pHo9gPNv7UFuaw
 mQuoScIT7TCBGK9YViVCJApGM4SAITPsw7+QFfrmzRzDjRKVHnLG+1b0CXx+1YTc6ZlN
 y62w==
X-Gm-Message-State: ACgBeo2hULyc3MXNYjELoe9cx2losEsmTXVIXFblxrWHK9kqE2fELBXM
 72Mt4O0zjJrBXe+LedN2zTKW/Q==
X-Google-Smtp-Source: AA6agR4Bivj+6SyN7gYcv9JGlrUXaDqXqgBvYMIom0ezxOmJPpuIcHoZGl3zZJaCiacFxTRvdVAV/w==
X-Received: by 2002:a05:6808:30a8:b0:343:538c:33ef with SMTP id
 bl40-20020a05680830a800b00343538c33efmr228693oib.91.1660190326462; 
 Wed, 10 Aug 2022 20:58:46 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 w22-20020a056808141600b00338869042fdsm891443oiv.32.2022.08.10.20.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 20:58:45 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 1/3] dt-bindings: display/msm: Add binding for SC8280XP MDSS
Date: Wed, 10 Aug 2022 21:01:19 -0700
Message-Id: <20220811040121.3775613-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811040121.3775613-1-bjorn.andersson@linaro.org>
References: <20220811040121.3775613-1-bjorn.andersson@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add binding for the display subsystem and display processing unit in the
Qualcomm SC8280XP platform.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../bindings/display/msm/dpu-sc8280xp.yaml    | 284 ++++++++++++++++++
 1 file changed, 284 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc8280xp.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc8280xp.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc8280xp.yaml
new file mode 100644
index 000000000000..6c25943e639c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc8280xp.yaml
@@ -0,0 +1,284 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dpu-sc8280xp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Processing Unit for SC8280XP
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description:
+  Device tree bindings for MSM Mobile Display Subsystem (MDSS) that encapsulates
+  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
+  bindings of MDSS and DPU are mentioned for SC8280XP.
+
+properties:
+  compatible:
+    const: qcom,sc8280xp-mdss
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    const: mdss
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Display AHB clock from gcc
+      - description: Display AHB clock from dispcc
+      - description: Display core clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: ahb
+      - const: core
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#address-cells": true
+
+  "#size-cells": true
+
+  "#interrupt-cells":
+    const: 1
+
+  iommus:
+    items:
+      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
+
+  ranges: true
+
+  interconnects:
+    minItems: 2
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: mdp0-mem
+      - const: mdp1-mem
+
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    description: Node containing the properties of DPU.
+
+    properties:
+      compatible:
+        const: qcom,sc8280xp-dpu
+
+      reg:
+        items:
+          - description: Address offset and size for mdp register set
+          - description: Address offset and size for vbif register set
+
+      reg-names:
+        items:
+          - const: mdp
+          - const: vbif
+
+      clocks:
+        items:
+          - description: Display hf axi clock
+          - description: Display sf axi clock
+          - description: Display ahb clock
+          - description: Display lut clock
+          - description: Display core clock
+          - description: Display vsync clock
+
+      clock-names:
+        items:
+          - const: bus
+          - const: nrt_bus
+          - const: iface
+          - const: lut
+          - const: core
+          - const: vsync
+
+      interrupts:
+        maxItems: 1
+
+      power-domains:
+        maxItems: 1
+
+      operating-points-v2: true
+
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+        description: |
+          Contains the list of output ports from DPU device. These ports
+          connect to interfaces that are external to the DPU hardware,
+          such as DSI, DP etc. Each output port contains an endpoint that
+          describes how it is connected to an external interface.
+
+        patternProperties:
+          '^port@[0-8]$':
+            $ref: /schemas/graph.yaml#/properties/port
+            description: DPU interfaces
+
+    required:
+      - compatible
+      - reg
+      - reg-names
+      - clocks
+      - interrupts
+      - power-domains
+      - operating-points-v2
+      - ports
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - power-domains
+  - clocks
+  - interrupts
+  - interrupt-controller
+  - iommus
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sc8280xp.h>
+    #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sc8280xp.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-subsystem@ae00000 {
+      compatible = "qcom,sc8280xp-mdss";
+      reg = <0x0ae00000 0x1000>;
+      reg-names = "mdss";
+
+      power-domains = <&dispcc0 MDSS_GDSC>;
+
+      clocks = <&gcc GCC_DISP_AHB_CLK>,
+               <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
+               <&dispcc0 DISP_CC_MDSS_MDP_CLK>;
+      clock-names = "iface",
+                    "ahb",
+                    "core";
+
+      assigned-clocks = <&dispcc0 DISP_CC_MDSS_MDP_CLK>;
+      assigned-clock-rates = <460000000>;
+
+      resets = <&dispcc0 DISP_CC_MDSS_CORE_BCR>;
+
+      interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-controller;
+      #interrupt-cells = <1>;
+
+      interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>,
+                      <&mmss_noc MASTER_MDP1 0 &mc_virt SLAVE_EBI1 0>;
+      interconnect-names = "mdp0-mem", "mdp1-mem";
+
+      iommus = <&apps_smmu 0x1000 0x402>;
+
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      display-controller@ae01000 {
+        compatible = "qcom,sc8280xp-dpu";
+        reg = <0x0ae01000 0x8f000>,
+              <0x0aeb0000 0x2008>;
+        reg-names = "mdp", "vbif";
+
+        clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&gcc GCC_DISP_SF_AXI_CLK>,
+                 <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
+                 <&dispcc0 DISP_CC_MDSS_MDP_LUT_CLK>,
+                 <&dispcc0 DISP_CC_MDSS_MDP_CLK>,
+                 <&dispcc0 DISP_CC_MDSS_VSYNC_CLK>;
+        clock-names = "bus",
+                      "nrt_bus",
+                      "iface",
+                      "lut",
+                      "core",
+                      "vsync";
+
+        assigned-clocks = <&dispcc0 DISP_CC_MDSS_MDP_CLK>,
+                          <&dispcc0 DISP_CC_MDSS_VSYNC_CLK>;
+        assigned-clock-rates = <460000000>,
+                               <19200000>;
+
+        operating-points-v2 = <&mdss0_mdp_opp_table>;
+        power-domains = <&rpmhpd SC8280XP_MMCX>;
+
+        interrupt-parent = <&mdss0>;
+        interrupts = <0>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+              endpoint {
+                remote-endpoint = <&mdss0_dp0_in>;
+              };
+          };
+
+          port@4 {
+            reg = <4>;
+            endpoint {
+              remote-endpoint = <&mdss0_dp1_in>;
+            };
+          };
+
+          port@5 {
+            reg = <5>;
+              endpoint {
+                remote-endpoint = <&mdss0_dp3_in>;
+              };
+          };
+
+          port@6 {
+            reg = <6>;
+              endpoint {
+                remote-endpoint = <&mdss0_dp2_in>;
+              };
+          };
+        };
+
+        mdss0_mdp_opp_table: opp-table {
+          compatible = "operating-points-v2";
+
+          opp-200000000 {
+            opp-hz = /bits/ 64 <200000000>;
+            required-opps = <&rpmhpd_opp_low_svs>;
+          };
+
+          opp-300000000 {
+            opp-hz = /bits/ 64 <300000000>;
+            required-opps = <&rpmhpd_opp_svs>;
+          };
+
+          opp-345000000 {
+            opp-hz = /bits/ 64 <345000000>;
+            required-opps = <&rpmhpd_opp_svs_l1>;
+          };
+
+          opp-460000000 {
+            opp-hz = /bits/ 64 <460000000>;
+            required-opps = <&rpmhpd_opp_nom>;
+          };
+        };
+      };
+    };
+...
+
-- 
2.35.1

