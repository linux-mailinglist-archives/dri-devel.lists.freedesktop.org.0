Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5777E709D39
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 19:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF9210E5E1;
	Fri, 19 May 2023 17:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F125410E5C2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 17:04:41 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso3867645e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 10:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684515880; x=1687107880;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yjN/ffCdIbWuCww9f1G8lkgk4FzsnyMHqREJyrkcTto=;
 b=KoYvEi6Uul05bf2KvMOgZNpoWvkAe6/aiKndEYfU7JfTkMz5xnqi029Og7MWbL7TZT
 TLprUNgGF/heeMXSgBJJKv4BWT+s+TTH5R+3gvECdNpqoQperOLbtEhE/U1/D0NdB9FS
 Y7KPiNo6IrOoW5PkKyh8mNEWkZQoCZzx7ziSOkfP6pcwOSTU34XfOuHxg13d8YGkujc+
 NI10JXznkM6E5oOLOPhF/TVA7q2p6hxjEQOE5C6ipO+JIv30DNbOjSuOapXCQ1swVVx6
 WO7pCvGm4ZUaD5XUOG/ImgkwZTL5tF8xfOx6n89QZtvuy6hecghVGFNPhhe3ZXxktr1K
 ERzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684515880; x=1687107880;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yjN/ffCdIbWuCww9f1G8lkgk4FzsnyMHqREJyrkcTto=;
 b=jYJWKBMIFs6U8NYsj4fS47Wqq0EygUQfcDMZBTSdHIwIpuuIJSL6fAVExy5MK8TATF
 BYE3bWIlZZaoiRigbMipV1YmP/HrpBg/x26yMpedahY53UbRWgU+9IhGxuCg8EIBZsuA
 WULyYWhtpXBuD/MBchoTV7y29OEf4/b6KSMuQT6N308UUJ6fEB/Cw6a+oEJjJM3RpqKp
 IrxXS7PjwjAQ9E6iz/qlxyz1DfB1Ty/T7n2LznoiHphg1UqNwo44yTVI2aT6GeAD1J1P
 2d0W71QwczX9Dq48GZC9yOvXpT8JhOwPyMpiUcDDLUgbbKxo3o1CJtDIvavRc8VmwLiM
 CLsg==
X-Gm-Message-State: AC+VfDyHMlLAVNuLavB1SC4zJIjynNZNDoaE6GAZQGG0t4htq5Ei253E
 Xm0wwX2obe5eWo+ZD+L2nrOgwQ==
X-Google-Smtp-Source: ACHHUZ52vB/BXHHNJ3kXIEMhdoSlPdWn5w12SAY0Cz4n+quXz0bcxIKwkpll9yumhsNWxApkqe37FA==
X-Received: by 2002:a19:7501:0:b0:4f2:5d61:a04d with SMTP id
 y1-20020a197501000000b004f25d61a04dmr900486lfe.63.1684515879681; 
 Fri, 19 May 2023 10:04:39 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a19f806000000b004f38260f196sm654478lff.218.2023.05.19.10.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 10:04:39 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 19 May 2023 19:04:25 +0200
Subject: [PATCH v4 04/12] dt-bindings: display/msm: Add SM6350 MDSS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v4-4-68e7e25d70e1@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684515870; l=7064;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ElBdVsUKD81P73zo0Ep2jls76a+QZxDiuf7z0YpIh/0=;
 b=Z5v/60ydPUbcxgp1s5N9vJmCEkeeMe8MaTpOWdFvh7gJlF8Gkg4IMvvSN2sYIPbvQjAAgOuxz
 1e8zr98M/u0COlFAJIT4GNx9d9Lda1v1OVSwYNWjYK//waL6nopZNle
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

Document the SM6350 MDSS.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/display/msm/qcom,sm6350-mdss.yaml     | 214 +++++++++++++++++++++
 1 file changed, 214 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
new file mode 100644
index 000000000000..6674040d2172
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
@@ -0,0 +1,214 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm6350-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM6350 Display MDSS
+
+maintainers:
+  - Krishna Manikandan <quic_mkrishn@quicinc.com>
+
+description:
+  SM6350 MSM Mobile Display Subsystem (MDSS), which encapsulates sub-blocks
+  like DPU display controller, DSI and DP interfaces etc.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,sm6350-mdss
+
+  clocks:
+    items:
+      - description: Display AHB clock from gcc
+      - description: Display AXI clock from gcc
+      - description: Display core clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
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
+        const: qcom,sm6350-dpu
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        items:
+          - const: qcom,sm6350-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,dsi-phy-10nm
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sm6350.h>
+    #include <dt-bindings/clock/qcom,gcc-sm6350.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-subsystem@ae00000 {
+        compatible = "qcom,sm6350-mdss";
+        reg = <0x0ae00000 0x1000>;
+        reg-names = "mdss";
+
+        power-domains = <&dispcc MDSS_GDSC>;
+
+        clocks = <&gcc GCC_DISP_AHB_CLK>,
+                 <&gcc GCC_DISP_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+        clock-names = "iface", "bus", "core";
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        iommus = <&apps_smmu 0x800 0x2>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        display-controller@ae01000 {
+            compatible = "qcom,sm6350-dpu";
+            reg = <0x0ae01000 0x8f000>,
+                  <0x0aeb0000 0x2008>;
+            reg-names = "mdp", "vbif";
+
+            clocks = <&gcc GCC_DISP_AXI_CLK>,
+              <&dispcc DISP_CC_MDSS_AHB_CLK>,
+              <&dispcc DISP_CC_MDSS_ROT_CLK>,
+              <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+              <&dispcc DISP_CC_MDSS_MDP_CLK>,
+              <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+            clock-names = "bus", "iface", "rot", "lut", "core",
+                    "vsync";
+
+            assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                              <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
+                              <&dispcc DISP_CC_MDSS_ROT_CLK>,
+                              <&dispcc DISP_CC_MDSS_AHB_CLK>;
+            assigned-clock-rates = <300000000>,
+                                   <19200000>,
+                                   <19200000>,
+                                   <19200000>;
+
+            interrupt-parent = <&mdss>;
+            interrupts = <0>;
+            operating-points-v2 = <&mdp_opp_table>;
+            power-domains = <&rpmhpd SM6350_CX>;
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
+        };
+
+        dsi@ae94000 {
+            compatible = "qcom,sm6350-dsi-ctrl", "qcom,mdss-dsi-ctrl";
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
+                     <&gcc GCC_DISP_AXI_CLK>;
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
+            power-domains = <&rpmhpd SM6350_MX>;
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
+        };
+
+        dsi0_phy: phy@ae94400 {
+            compatible = "qcom,dsi-phy-10nm";
+            reg = <0x0ae94400 0x200>,
+                  <0x0ae94600 0x280>,
+                  <0x0ae94a00 0x1e0>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>, <&rpmhcc RPMH_CXO_CLK>;
+            clock-names = "iface", "ref";
+        };
+    };
+...

-- 
2.40.1

