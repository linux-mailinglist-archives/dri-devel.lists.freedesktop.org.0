Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3698406AB
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 14:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB41610F72E;
	Mon, 29 Jan 2024 13:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1513710F72B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 13:20:11 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a358ec50b7cso202605466b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 05:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706534349; x=1707139149; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=l/n0pLt0vces2tTuUUWLXoG//HgBuOzntBxfu0L+6g8=;
 b=RFHQjr9Yb+3hIhviqgcLQN20q4+GbbUN07BPzfBHDATD7YCHDmiYeocUu6TzrYf+QJ
 3akoXQkLB2hTNLFWxiKzKfrwpW2reIyrHmMsiRSqjQOkwWKM9lWEMCn/kfMfGgAuUKJY
 y+gz5lZgIKZvbNiOlIkH4R6JQoVx12ZiP7fx1hDiwn9i4LCt+y+zT2nFmlUBNXRDNvto
 Je2UTNmhiNYzLFeR9MX0RgvcipgnoTf8IMRuLPQl9SYsX+vWgdhXRqyTjZZOUazmQO6j
 0z0tFpl11GyBGdpOyIqqAxRSx5rMT5NoM4gNqh0Xm5cUFAbnJkTGuubsMEsn8fLdnVgj
 CSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706534349; x=1707139149;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l/n0pLt0vces2tTuUUWLXoG//HgBuOzntBxfu0L+6g8=;
 b=vq/O0CoIBH/FYbuExEWM1BbL+Gg3M1ATUYSN41oW5f85jE9SjNplHTOyaJqFHF2YIG
 9gcoj/RtG2N9bxUmSuZY45d8nYBhteYuRL3GtGScTbO/C7M6ncqQd/3BOHaJYpyOhCNF
 8Sit61MU5XYfJyFpUUw2IwO/BmvErWR+bS1ouFdIGo/i7uedkcUOFkdK3tLged5KTBru
 Im0kmwiRqAN6lCbiZnXiAddd6TUmb+qGvZnifxYQSSrYOlcbIyo7VTeGXwNOHUdIxdHZ
 4COnI0kEfhtXgvnuZZB+Qwu5J/YhD4gejaDONARGjNQBxBBRmV0bdkujEWWJEDwJTaaf
 yPlw==
X-Gm-Message-State: AOJu0Yx2kX0QDzQExbGKWWuenSEx5ITri1ll+ZnkWK7li+EMAYxFT8y2
 TnUN33LeVFWDlDNmrQJFxKOTbG2h9XWMmFhjhD2bc5C3eD8fhTuB0wO97GpB81s=
X-Google-Smtp-Source: AGHT+IGQjYEDurZIJYcn/CmN4h83k7vAEz5RPdYh5gLbgj+3Ql604ZBByq+94bPWPyclsMK0GK0ouw==
X-Received: by 2002:a17:906:d92:b0:a30:d35f:d3a5 with SMTP id
 m18-20020a1709060d9200b00a30d35fd3a5mr6254077eji.21.1706534349537; 
 Mon, 29 Jan 2024 05:19:09 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25]) by smtp.gmail.com with ESMTPSA id
 q15-20020a17090622cf00b00a359afad88dsm1591658eja.10.2024.01.29.05.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 05:19:09 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 29 Jan 2024 15:18:54 +0200
Subject: [PATCH 1/5] dt-bindings: display/msm: document MDSS on X1E80100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240129-x1e80100-display-v1-1-0d9eb8254df0@linaro.org>
References: <20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org>
In-Reply-To: <20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=8078; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=I5PGhsrEZKj3ZMDpnONsJnotEiBo2BLGM1Eha6wla9A=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlt6XE6aWFknD1XKeICqeAKXYuCJif4uMi7ZK37
 KzU50TGXXOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbelxAAKCRAbX0TJAJUV
 VjIHD/93fJcp068eeFWAI0TFwOqYqfRAej176O7iaRKv7tieDoB9yrbFvvZLyFSeF0FT8LktV1o
 kp7cJdXMPZXzd1W0I0Maj8gzW8fdtLYOGxFNUorv0ynYeLbDkIzL3W7GQTUntEDPzBf9G1iin0r
 pO8RhpmtIWl8f+8CsReX4/xa58wh0vMh8Iz2ptTP3Fk/327mzU7fpXE7kwk+0bFNWUDqkQyxCy6
 VGVKBZ+axKFfKiR1bAxc75Z3Gtpyn+Is7cjVoSIo0WUQr4y0+QAmtoOhi37CAF6EHBMfjMF9LnI
 g3/ryT+oRv8Ea7cH+Le3RTMOkp495RUaqMDtIJ650dIhL5nUFJwCeXq6NtEL/D7WNrZSKtHd/d/
 YahIjrJIQxVOVNfUPjuKDvSKAvMNgbsIojyC+tpkkkRhDB1IuO64yWjyE7FF5lQVhc6H0mf1YQr
 ZU4zyk3/2APgZjXJ97eUFI28sfqLyfg0Q9kysc6VzJ+35+KBLmgvdRYx1KdYm+Ow39zFVrXve8M
 zbJ5Ywb7JKj4Ic+fDgdQwBEHA12kJUr3vuFWm/8llO87cIrNrWR23f7xotNuGCTVLSpWwlksn6c
 HtaofPfGbbdL6y1abVeqK8D5IHJCm6OBlL4BAkaser2ide5vQS6j6i8jDncRKmHpWGhN2RE7qV4
 mB5kbBY3gimEsdQ==
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abel Vesa <abel.vesa@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the MDSS hardware found on the Qualcomm X1E80100 platform.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 249 +++++++++++++++++++++
 1 file changed, 249 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
new file mode 100644
index 000000000000..eaa91f7d61ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
@@ -0,0 +1,249 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,x1e80100-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm X1E80100 Display MDSS
+
+maintainers:
+  - Abel Vesa <abel.vesa@linaro.org>
+
+description:
+  X1E80100 MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
+  DPU display controller, DP interfaces, etc.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,x1e80100-mdss
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
+    maxItems: 3
+
+  interconnect-names:
+    maxItems: 3
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,x1e80100-dpu
+
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,x1e80100-dp
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,x1e80100-dp-phy
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
+        compatible = "qcom,x1e80100-mdss";
+        reg = <0x0ae00000 0x1000>;
+        reg-names = "mdss";
+
+        interconnects = <&mmss_noc MASTER_MDP 0 &gem_noc SLAVE_LLCC 0>,
+                        <&mc_virt MASTER_LLCC 0 &mc_virt SLAVE_EBI1 0>;
+                        <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_DISPLAY_CFG 0>;
+        interconnect-names = "mdp0-mem", "mdp1-mem", "cpu-cfg";
+
+        resets = <&dispcc_core_bcr>;
+
+        power-domains = <&dispcc_gdsc>;
+
+        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&gcc GCC_DISP_AHB_CLK>,
+                 <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+        clock-names = "iface", "bus", "nrt_bus", "core";
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
+            compatible = "qcom,x1e80100-dpu";
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
+            compatible = "qcom,x1e80100-dp";
+            reg = <0 0xae90000 0 0x200>,
+                  <0 0xae90200 0 0x200>,
+                  <0 0xae90400 0 0x600>,
+                  <0 0xae91000 0 0x400>,
+                  <0 0xae91400 0 0x400>;
+
+            interrupt-parent = <&mdss>;
+            interrupts = <12>;
+
+            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+               <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
+               <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
+               <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+               <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+            clock-names = "core_iface", "core_aux",
+                    "ctrl_link",
+                    "ctrl_link_iface",
+                    "stream_pixel";
+
+            assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+                  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
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
+            status = "disabled";
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
+...

-- 
2.34.1

