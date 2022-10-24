Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB1360B216
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 18:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CD910E4A9;
	Mon, 24 Oct 2022 16:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785CF10E486
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 16:42:37 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id r14so17728006lfm.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 09:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GV5dxA1+GZPu4gSUFYFoCs29DjvJayc5KvtKoh12SMc=;
 b=dMGof3PEpPYVtBTMuAv6mpSFfBK65IlSile6EqzZD5O9dk2/kT+BagMI6554sfzZam
 ddGNkg+ZQwK++KFbl3zvh0EspTG09BAGIK+NP85oh7RmUkvbjevQKTLHMia8RN+hn5C3
 xUrR03Rx2kOgwor/OR3DX+zpVO4atSO5pxgqbXWUV8jlASKcEculEHvL4GSXJYx+CTIu
 cj6Au3R9pa15WbdF8cPSgYw5WUqDmsXg4MQuV24+YFnsZdoOv52yDu0z34K8nIRt5FN+
 S0ZXmJpdFoFRl04GeHxpbKblnqdCW2U+fh5Gx0K5uTsP/LTANRPMfEp278TT0Y1J3E0O
 SIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GV5dxA1+GZPu4gSUFYFoCs29DjvJayc5KvtKoh12SMc=;
 b=mvQD4pXeVFse9h5RPUQ6yhL1Wo5EuSATnJv0Rj0Isr/dZ5xI9OF9yTcc8JOWvA3fqF
 1p14eaZa7bQf5eU2DGB2JsgufAiiI0mTEWuI/xQXbxbcwfDKJOx73CaAzkXWtvoiwfqW
 LYpycyU8svl0LDcB7q3I8+un98w9WP4Q+QzlModp5hQnM+t6Vl7Vydm5hE3VbmK/iMUe
 bnMdoPXXI2RdDfx+kljA23xShIM3wRvR5vzfGD/nJ52NtCSAD7O2DCcoKI0X+kYq62zQ
 6T5TUSVY1Sp3R/ouZLBi4kdylkecaG0ndOvGcwVtOo6IzhGRW9vRuM3oQH585E8xcGn5
 UfJg==
X-Gm-Message-State: ACrzQf0KSdCcS1vR8Yvdfq1cRX4eKkw/WXiLTvwTFGXmZVrjDswP6bkH
 xlQ2AM6s5w/XycRmSg0N8iJogQ==
X-Google-Smtp-Source: AMsMyM6EAD2PBE0A4kQipVJt4c0sK70nF/IsABwaaGdixBoLpjUkwlZmcVvL5Su/3euxMwDKbjhndg==
X-Received: by 2002:ac2:55b6:0:b0:4a4:6ec2:2a0e with SMTP id
 y22-20020ac255b6000000b004a46ec22a0emr13710913lfg.161.1666629755692; 
 Mon, 24 Oct 2022 09:42:35 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 k14-20020ac2456e000000b004948378080csm4593978lfm.290.2022.10.24.09.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 09:42:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v9 11/12] dt-bindings: display/msm: add missing device nodes
 to mdss-* schemas
Date: Mon, 24 Oct 2022 19:42:24 +0300
Message-Id: <20221024164225.3236654-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
References: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add missing device nodes (DSI, PHYs, DP/eDP) to the existing MDSS
schemas.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../display/msm/qcom,msm8998-mdss.yaml        | 153 +++++++++
 .../display/msm/qcom,qcm2290-mdss.yaml        |  81 +++++
 .../display/msm/qcom,sc7180-mdss.yaml         | 179 +++++++++++
 .../display/msm/qcom,sc7280-mdss.yaml         | 292 ++++++++++++++++++
 .../display/msm/qcom,sdm845-mdss.yaml         | 153 +++++++++
 5 files changed, 858 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
index 192a832ef808..cf52ff77a41a 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
@@ -43,11 +43,24 @@ patternProperties:
       compatible:
         const: qcom,msm8998-dpu
 
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
+        const: qcom,dsi-phy-10nm-8998
+
 unevaluatedProperties: false
 
 examples:
   - |
     #include <dt-bindings/clock/qcom,mmcc-msm8998.h>
+    #include <dt-bindings/clock/qcom,rpmcc.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/power/qcom-rpmpd.h>
 
@@ -111,5 +124,145 @@ examples:
                 };
             };
         };
+
+        dsi@c994000 {
+            compatible = "qcom,mdss-dsi-ctrl";
+            reg = <0x0c994000 0x400>;
+            reg-names = "dsi_ctrl";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <4>;
+
+            clocks = <&mmcc MDSS_BYTE0_CLK>,
+                     <&mmcc MDSS_BYTE0_INTF_CLK>,
+                     <&mmcc MDSS_PCLK0_CLK>,
+                     <&mmcc MDSS_ESC0_CLK>,
+                     <&mmcc MDSS_AHB_CLK>,
+                     <&mmcc MDSS_AXI_CLK>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus";
+            assigned-clocks = <&mmcc BYTE0_CLK_SRC>, <&mmcc PCLK0_CLK_SRC>;
+            assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
+            operating-points-v2 = <&dsi_opp_table>;
+            power-domains = <&rpmpd MSM8998_VDDCX>;
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
+        dsi0_phy: phy@c994400 {
+            compatible = "qcom,dsi-phy-10nm-8998";
+            reg = <0x0c994400 0x200>,
+                  <0x0c994600 0x280>,
+                  <0x0c994a00 0x1e0>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            clocks = <&mmcc MDSS_AHB_CLK>,
+                     <&rpmcc RPM_SMD_XO_CLK_SRC>;
+            clock-names = "iface", "ref";
+
+            vdds-supply = <&pm8998_l1>;
+        };
+
+        dsi@c996000 {
+            compatible = "qcom,mdss-dsi-ctrl";
+            reg = <0x0c996000 0x400>;
+            reg-names = "dsi_ctrl";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <5>;
+
+            clocks = <&mmcc MDSS_BYTE1_CLK>,
+                     <&mmcc MDSS_BYTE1_INTF_CLK>,
+                     <&mmcc MDSS_PCLK1_CLK>,
+                     <&mmcc MDSS_ESC1_CLK>,
+                     <&mmcc MDSS_AHB_CLK>,
+                     <&mmcc MDSS_AXI_CLK>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus";
+            assigned-clocks = <&mmcc BYTE1_CLK_SRC>, <&mmcc PCLK1_CLK_SRC>;
+            assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
+            operating-points-v2 = <&dsi_opp_table>;
+            power-domains = <&rpmpd MSM8998_VDDCX>;
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
+        dsi1_phy: phy@c996400 {
+            compatible = "qcom,dsi-phy-10nm-8998";
+            reg = <0x0c996400 0x200>,
+                  <0x0c996600 0x280>,
+                  <0x0c996a00 0x10e>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            clocks = <&mmcc MDSS_AHB_CLK>,
+                     <&rpmcc RPM_SMD_XO_CLK_SRC>;
+            clock-names = "iface", "ref";
+
+            vdds-supply = <&pm8998_l1>;
+        };
     };
 ...
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index 419989d6279e..d6f043a4b08d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -49,12 +49,25 @@ patternProperties:
       compatible:
         const: qcom,qcm2290-dpu
 
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
 unevaluatedProperties: false
 
 examples:
   - |
     #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
     #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/clock/qcom,rpmcc.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interconnect/qcom,qcm2290.h>
     #include <dt-bindings/power/qcom-rpmpd.h>
@@ -113,5 +126,73 @@ examples:
                 };
             };
         };
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
+            power-domains = <&rpmpd QCM2290_VDDCX>;
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
+            vcca-supply = <&vreg_dsi_phy>;
+        };
     };
 ...
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
index 103cfd60c61b..13e396d61a51 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
@@ -49,12 +49,31 @@ patternProperties:
       compatible:
         const: qcom,sc7180-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sc7180-dp
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
+        const: qcom,dsi-phy-10nm
+
 unevaluatedProperties: false
 
 examples:
   - |
     #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
     #include <dt-bindings/clock/qcom,gcc-sc7180.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interconnect/qcom,sdm845.h>
     #include <dt-bindings/power/qcom-rpmpd.h>
@@ -121,5 +140,165 @@ examples:
                 };
             };
         };
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
+            assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+            assigned-clock-parents = <&dsi_phy 0>, <&dsi_phy 1>;
+
+            operating-points-v2 = <&dsi_opp_table>;
+            power-domains = <&rpmhpd SC7180_CX>;
+
+            phys = <&dsi_phy>;
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
+        dsi_phy: phy@ae94400 {
+            compatible = "qcom,dsi-phy-10nm";
+            reg = <0x0ae94400 0x200>,
+                  <0x0ae94600 0x280>,
+                  <0x0ae94a00 0x1e0>;
+            reg-names = "dsi_phy",
+                    "dsi_phy_lane",
+                    "dsi_pll";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&rpmhcc RPMH_CXO_CLK>;
+            clock-names = "iface", "ref";
+            vdds-supply = <&vreg_dsi_phy>;
+        };
+
+        displayport-controller@ae90000 {
+            compatible = "qcom,sc7180-dp";
+
+            reg = <0xae90000 0x200>,
+                  <0xae90200 0x200>,
+                  <0xae90400 0xc00>,
+                  <0xae91000 0x400>,
+                  <0xae91400 0x400>;
+
+            interrupt-parent = <&mdss>;
+            interrupts = <12>;
+
+            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
+                     <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
+                     <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
+                     <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
+            clock-names = "core_iface", "core_aux", "ctrl_link",
+                          "ctrl_link_iface", "stream_pixel";
+            assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
+                              <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+            assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
+            phys = <&dp_phy>;
+            phy-names = "dp";
+
+            operating-points-v2 = <&dp_opp_table>;
+            power-domains = <&rpmhpd SC7180_CX>;
+
+            #sound-dai-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    dp_in: endpoint {
+                        remote-endpoint = <&dpu_intf0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    dp_out: endpoint { };
+                };
+            };
+
+            dp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-160000000 {
+                    opp-hz = /bits/ 64 <160000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-270000000 {
+                    opp-hz = /bits/ 64 <270000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-540000000 {
+                    opp-hz = /bits/ 64 <540000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-810000000 {
+                    opp-hz = /bits/ 64 <810000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+            };
+        };
     };
 ...
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
index d4ac2d5d13fb..a3de1744ba11 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
@@ -48,12 +48,39 @@ patternProperties:
       compatible:
         const: qcom,sc7280-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sc7280-dp
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,mdss-dsi-ctrl
+
+  "^edp@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sc7280-edp
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - qcom,sc7280-dsi-phy-7nm
+          - qcom,sc7280-edp-phy
+
 unevaluatedProperties: false
 
 examples:
   - |
     #include <dt-bindings/clock/qcom,dispcc-sc7280.h>
     #include <dt-bindings/clock/qcom,gcc-sc7280.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interconnect/qcom,sc7280.h>
     #include <dt-bindings/power/qcom-rpmpd.h>
@@ -124,6 +151,271 @@ examples:
                         remote-endpoint = <&edp_in>;
                     };
                 };
+
+                port@2 {
+                    reg = <2>;
+                    dpu_intf0_out: endpoint {
+                        remote-endpoint = <&dp_in>;
+                    };
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
+            assigned-clock-parents = <&mdss_dsi_phy 0>, <&mdss_dsi_phy 1>;
+
+            operating-points-v2 = <&dsi_opp_table>;
+            power-domains = <&rpmhpd SC7280_CX>;
+
+            phys = <&mdss_dsi_phy>;
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
+        mdss_dsi_phy: phy@ae94400 {
+            compatible = "qcom,sc7280-dsi-phy-7nm";
+            reg = <0x0ae94400 0x200>,
+                  <0x0ae94600 0x280>,
+                  <0x0ae94900 0x280>;
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
+            vdds-supply = <&vreg_dsi_supply>;
+        };
+
+        edp@aea0000 {
+            compatible = "qcom,sc7280-edp";
+            pinctrl-names = "default";
+            pinctrl-0 = <&edp_hot_plug_det>;
+
+            reg = <0xaea0000 0x200>,
+                  <0xaea0200 0x200>,
+                  <0xaea0400 0xc00>,
+                  <0xaea1000 0x400>;
+
+            interrupt-parent = <&mdss>;
+            interrupts = <14>;
+
+            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&dispcc DISP_CC_MDSS_EDP_AUX_CLK>,
+                     <&dispcc DISP_CC_MDSS_EDP_LINK_CLK>,
+                     <&dispcc DISP_CC_MDSS_EDP_LINK_INTF_CLK>,
+                     <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK>;
+            clock-names = "core_iface",
+                          "core_aux",
+                          "ctrl_link",
+                          "ctrl_link_iface",
+                          "stream_pixel";
+            assigned-clocks = <&dispcc DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
+                              <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
+            assigned-clock-parents = <&mdss_edp_phy 0>, <&mdss_edp_phy 1>;
+
+            phys = <&mdss_edp_phy>;
+            phy-names = "dp";
+
+            operating-points-v2 = <&edp_opp_table>;
+            power-domains = <&rpmhpd SC7280_CX>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    edp_in: endpoint {
+                        remote-endpoint = <&dpu_intf5_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    mdss_edp_out: endpoint { };
+                };
+            };
+
+            edp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-160000000 {
+                    opp-hz = /bits/ 64 <160000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-270000000 {
+                    opp-hz = /bits/ 64 <270000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-540000000 {
+                    opp-hz = /bits/ 64 <540000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+
+                opp-810000000 {
+                    opp-hz = /bits/ 64 <810000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+            };
+        };
+
+        mdss_edp_phy: phy@aec2a00 {
+            compatible = "qcom,sc7280-edp-phy";
+
+            reg = <0xaec2a00 0x19c>,
+                  <0xaec2200 0xa0>,
+                  <0xaec2600 0xa0>,
+                  <0xaec2000 0x1c0>;
+
+            clocks = <&rpmhcc RPMH_CXO_CLK>,
+                     <&gcc GCC_EDP_CLKREF_EN>;
+            clock-names = "aux",
+                          "cfg_ahb";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+        };
+
+        displayport-controller@ae90000 {
+            compatible = "qcom,sc7280-dp";
+
+            reg = <0xae90000 0x200>,
+                  <0xae90200 0x200>,
+                  <0xae90400 0xc00>,
+                  <0xae91000 0x400>,
+                  <0xae91400 0x400>;
+
+            interrupt-parent = <&mdss>;
+            interrupts = <12>;
+
+            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
+                     <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
+                     <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
+                     <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
+            clock-names = "core_iface",
+                          "core_aux",
+                          "ctrl_link",
+                          "ctrl_link_iface",
+                          "stream_pixel";
+            assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
+                              <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+            assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
+            phys = <&dp_phy>;
+            phy-names = "dp";
+
+            operating-points-v2 = <&dp_opp_table>;
+            power-domains = <&rpmhpd SC7280_CX>;
+
+            #sound-dai-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    dp_in: endpoint {
+                        remote-endpoint = <&dpu_intf0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    dp_out: endpoint { };
+                };
+            };
+
+            dp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-160000000 {
+                    opp-hz = /bits/ 64 <160000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-270000000 {
+                    opp-hz = /bits/ 64 <270000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-540000000 {
+                    opp-hz = /bits/ 64 <540000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-810000000 {
+                    opp-hz = /bits/ 64 <810000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
             };
         };
     };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
index 47fe66f4da54..31ca6f99fc22 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
@@ -47,12 +47,25 @@ patternProperties:
       compatible:
         const: qcom,sdm845-dpu
 
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
+        const: qcom,dsi-phy-10nm
+
 unevaluatedProperties: false
 
 examples:
   - |
     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/power/qcom-rpmpd.h>
 
@@ -113,5 +126,145 @@ examples:
                 };
             };
         };
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
+                     <&dispcc DISP_CC_MDSS_AXI_CLK>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus";
+            assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+                              <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+            assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
+            operating-points-v2 = <&dsi_opp_table>;
+            power-domains = <&rpmhpd SDM845_CX>;
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
+                     <&dispcc DISP_CC_MDSS_AXI_CLK>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus";
+            assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
+                              <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+            assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
+            operating-points-v2 = <&dsi_opp_table>;
+            power-domains = <&rpmhpd SDM845_CX>;
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
+            compatible = "qcom,dsi-phy-10nm";
+            reg = <0x0ae96400 0x200>,
+                  <0x0ae96600 0x280>,
+                  <0x0ae96a00 0x10e>;
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
     };
 ...
-- 
2.35.1

