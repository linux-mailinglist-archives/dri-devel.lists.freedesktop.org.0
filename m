Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96773B53218
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 14:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB0410EAFC;
	Thu, 11 Sep 2025 12:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sAhNiSvI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80BD10EAFC
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 12:29:17 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3e751508f21so508239f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 05:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757593756; x=1758198556; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8qXNWsTn6pGiq8BJScd1/HARksGvcPmKxTdiNE9akK8=;
 b=sAhNiSvI6G3SDn2chWL4vQII8S2AAjHCeytb3HXGIzFhPhd/+nDBKk/um6SjTHSc+u
 1ITMZHUYx8dwPAthu7hCHXEu3hgL1xwhmE9/zZhzpO7z9PV/wsUreYrU4AxuN8MJRQtU
 yLnCTnK2941xEvK/jldTpdORFvv3YBFJhGvLzWrnKUy3epsaKBYjZ0SbTUViVI2X13Ze
 xjryuS24ZUOEic9U6NF7cKWII60vipZwSF0HazyAIJB8RbfRhHq+XT8gXvKP46fTemYP
 D8R/g0wZRO14npNBsDUa/VgmM67Sf2g6XgSY8RUq0J+i8+/KnsqL+xptSZecIaBHSlb+
 4elQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757593756; x=1758198556;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8qXNWsTn6pGiq8BJScd1/HARksGvcPmKxTdiNE9akK8=;
 b=sJfnebA02VLr2PErrqQ9sj/VuLAKPpPdY6pqL0JA2a2u3j4+s70PDwqvc0g348VKwC
 ADjCUxfQwkY2fAnDzLVCf/cXvlCk2FQfksYpMy6CUmtcYLr0IhCEyBF8Ogi3TVYx6qO6
 DCGeivDowv2UX8ymvLmjLwdZ5vHKCo69yYva7JZ/bmsY5ID+f5W7cikafS9V2w2sJMXK
 Uwes45mPadDOIBY8Hx5Z3lmn8uob/1dlk7u7F9JxRMa6pDYPds+MK61Wr5vcfymucjh1
 eLD9XfilHAzo8hiUKgYXHtzFeoGXiPSZ9bYiwbH78QW7D60zBULQ3VAWla5uYuI+12Xl
 WfIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWOH0bApE0p7Xhot/coMfuoPZ/FNqnXgdhXp1wCDqyeIkyLHXYQ4LTtZToagxRs/7QmbCkudGrjjw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbqBwfgS3s3G/L29aYBTObMBQvRxZPlInbA2Nc8StGLh5wv4vR
 Ln3afuTPsE5PoSykK/KVGOyyQ6gWD9rqsdH6Os7QXqmKlfqP1sXQNFRzfwOyjsnkeOE=
X-Gm-Gg: ASbGncsujZ/q5/VV0Z8oa/MekDSDb723WCpyg6wFa1ohAmWKruyIvYcA9rsVnPp/A+a
 fGkJjEuE4wsOrEVsQwtOscgHSfNDps31+TVU6dt4FYEXIHj+gPTu00jz+SrYxmkXWIVyG7VNldS
 KWAhfBA1DHfSid3J0kCGsanSKBsWpKwhJTeaoxUtFMixcqafkxcMiOD/uBoZUPIlIu+tMPWB8iU
 sEemQabdGBlSwiJUmtCpw8bYCmsqi25+zxKX6VOZQbjK8LyXpuLQe86ann2Ppu2+7pFAVxSNvm1
 zFlQUsTp59ofbg5dx+rUDLGig6LPRPsV0CYcJOcremSxxkNNxjPH2Qqf7QqUfzur941E/OeA3KK
 aQ9eA0N8Ernhaii2jJpwnpjybbX0DKHPMsw==
X-Google-Smtp-Source: AGHT+IFbRJdAPS/wgqpCqpc+UQ+Ip7/jcNqIuW6+lVnwTnZgnY+WGsy8+/r8FbKw7owELtSpZymyZA==
X-Received: by 2002:a05:6000:200c:b0:3e2:2dd3:f9d6 with SMTP id
 ffacd0b85a97d-3e64ca780d5mr15562177f8f.55.1757593756354; 
 Thu, 11 Sep 2025 05:29:16 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.194]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607cd424sm2230444f8f.36.2025.09.11.05.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 05:29:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 11 Sep 2025 15:28:48 +0300
Subject: [PATCH 1/6] dt-bindings: display: msm: Document the Glymur Mobile
 Display SubSystem
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-glymur-display-v1-1-d391a343292e@linaro.org>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
In-Reply-To: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=8503; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=wjeR4yq0rhKQpcfdhgi+hZ70VI9DiH//JiCjDiten+A=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBowsCQHXQ724a0d4Btt1zmSgs72TkhcLSYRl7jk
 MpX2hXnn0eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaMLAkAAKCRAbX0TJAJUV
 VkZZD/9J49iATZvVATcaKJ0QIU8bURQVym1+gPk8smJYOwclSdkbCIYl8Fed0GJifp5FUWo9Qsd
 N0MIqD5d3uBuCPmPYLeBg4rSj/zXrUxQi5M5NZInqC/DND8ce5LLNh5BGohCDNDgagK6cgA1iVQ
 +ihu+d+mQkGtn7qG+jumoUvfHVv1rjjWSQrthBltb2qzwEJ/0F/NIHkLt9DLmPMoV3G3Hpy7CcG
 HxLutqlTrGliR0hU17Sfuk7m0ojwRb1DNmRysnvMMZZGavDqaJdx1TvhkU3M32BvMJ20YtDcdbG
 WcDe/waLdkCVXBUyyJK7IDw56Bu5sb8yCjStfInQgHT2Al1Ji8F2vagLY0XWMFzkCCJDm7nbyOJ
 hPkrtLB0C1BoUzsA3DTTIvm+atv7j1sEehpgdEDrbhLDP+/azBGRUT573wXGuyJjMTk55n9AY11
 vxqaK+MiOzoznZ9si5ymhD1aiozpgPY3tVR0U65oi94OSGfIK9jVIsgoshl15ddFXLXhOUaH0aQ
 o0rTKNp71N12lyEbFMp1uCr5b/Gil+sCp+BfwUjFc7OwKzSP7Qz/aanJ4035g8aqf35nqd8Q8YD
 GpA+QD3dalvEOxJcH8E7SfIeXyUAlObVLtphWjPgEOFaL0TzY5UafkAsVGwRI0EI/Y+WkHzDd0m
 m0/srMNT2NZ20Wg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

Add MDSS/MDP display subsystem for Qualcomm Glymur SoC, which is
is 2 minor version increase compared to SM8750.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../bindings/display/msm/qcom,glymur-mdss.yaml     | 260 +++++++++++++++++++++
 1 file changed, 260 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..00b8f6a75b0259ddc407ba8c11777d1a9cf45029
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.yaml
@@ -0,0 +1,260 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,glymur-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Glymur Display MDSS
+
+maintainers:
+  - Abel Vesa <abel.vesa@linaro.org>
+
+description:
+  Glymur MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
+  DPU display controller, DP interfaces, etc.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,glymur-mdss
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
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
+
+  interconnect-names:
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,glymur-dpu
+
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,glymur-dp
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,glymur-dp-phy
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/phy/phy-qcom-qmp.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    display-subsystem@ae00000 {
+        compatible = "qcom,glymur-mdss";
+        reg = <0x0ae00000 0x1000>;
+        reg-names = "mdss";
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&dispcc_ahb_clk>,
+                 <&gcc_disp_hf_axi_clk>,
+                 <&dispcc_mdp_clk>;
+        clock-names = "bus", "nrt_bus", "core";
+
+
+        interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                        <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                         &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+        interconnect-names = "mdp0-mem",
+                             "cpu-cfg";
+
+        resets = <&disp_cc_mdss_core_bcr>;
+
+        power-domains = <&mdss_gdsc>;
+
+        iommus = <&apps_smmu 0x1c00 0x2>;
+
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        display-controller@ae01000 {
+            compatible = "qcom,glymur-dpu";
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
+        displayport-controller@ae90000 {
+            compatible = "qcom,glymur-dp";
+            reg = <0 0xae90000 0 0x200>,
+                  <0 0xae90200 0 0x200>,
+                  <0 0xae90400 0 0x600>,
+                  <0 0xae91000 0 0x400>,
+                  <0 0xae91400 0 0x400>;
+
+            interrupt-parent = <&mdss>;
+            interrupts = <12>;
+
+            clocks = <&dispcc_mdss_ahb_clk>,
+               <&dispcc_dptx0_aux_clk>,
+               <&dispcc_dptx0_link_clk>,
+               <&dispcc_dptx0_link_intf_clk>,
+               <&dispcc_dptx0_pixel0_clk>;
+            clock-names = "core_iface", "core_aux",
+                    "ctrl_link",
+                    "ctrl_link_iface",
+                    "stream_pixel";
+
+            assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
+                  <&dispcc_mdss_dptx0_pixel0_clk_src>;
+            assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+                  <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+            operating-points-v2 = <&mdss_dp0_opp_table>;
+
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            phys = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_PHY>;
+            phy-names = "dp";
+
+            #sound-dai-cells = <0>;
+
+            ports {
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              port@0 {
+                  reg = <0>;
+
+                  mdss_dp0_in: endpoint {
+                    remote-endpoint = <&mdss_intf0_out>;
+                  };
+              };
+
+              port@1 {
+                  reg = <1>;
+
+                  mdss_dp0_out: endpoint {
+                  };
+              };
+            };
+
+            mdss_dp0_opp_table: opp-table {
+              compatible = "operating-points-v2";
+
+              opp-160000000 {
+                 opp-hz = /bits/ 64 <160000000>;
+                 required-opps = <&rpmhpd_opp_low_svs>;
+              };
+
+              opp-270000000 {
+                 opp-hz = /bits/ 64 <270000000>;
+                 required-opps = <&rpmhpd_opp_svs>;
+              };
+
+              opp-540000000 {
+                 opp-hz = /bits/ 64 <540000000>;
+                 required-opps = <&rpmhpd_opp_svs_l1>;
+              };
+
+              opp-810000000 {
+                 opp-hz = /bits/ 64 <810000000>;
+                 required-opps = <&rpmhpd_opp_nom>;
+              };
+            };
+        };
+    };

-- 
2.45.2

