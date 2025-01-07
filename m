Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8842A04028
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 14:00:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A1C10E6CE;
	Tue,  7 Jan 2025 13:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eXbx+N8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C114B10E484
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 12:59:59 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4361e82e3c3so24478295e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 04:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736254738; x=1736859538; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MIQgDyolyyEF2RYqaUTLM9wd3yrl7f54SGKDucOxT8E=;
 b=eXbx+N8PVZUTcs6jVsMo97T8pdoZmFUCDIPK3ZOlVzSsygngLMNJc8YEfKiLSitsLN
 ipKnEoC0vqH3WKv8i7EfMPyYI9tpQf9ePhWjmhg9X4JpTQX8akF0jzvNPmDPF/YtYJYw
 TZkNzKhR1teesq6B+uU1ej06PF2TwmkZ2BJqjM8uQ2jgAHMGgBCTC4Q5cB5kPRUvjcw/
 ToW22pVP63TmJkKTtje7g4IPUNaa9T9eQgLHcOxBgE41hswPUh4ucYyjn26E+ymSb8vs
 p0jwlzaXvrgZ9pgnBAHn4CI+qKxcSJmvbmvWOTmGWdwOMSNhRPemVnVg3kCsDvle14ng
 NHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736254738; x=1736859538;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MIQgDyolyyEF2RYqaUTLM9wd3yrl7f54SGKDucOxT8E=;
 b=oD5hsrxQU9UipJFlrcp4ZkgZqaDV5jLVmSjkzhpiVqASPy7YKOQkQYZiTNO9RGgEOi
 EqT7HCj1Pukk50UZJHWKqTXx47uDnFGTJ8lnsnO1w8S0OK2qW34hAUNC5x+8dBeCDttY
 TlTLjOl6493YHUAP1T5vRCIt215QYol/ARyBYLvWagYHw+ZUlHjs1zJG4GcCuNPEoM3M
 HPBFtIPSnN7tg9+o0+LiDdeXwNGvR47NkdI8zwkyoBn8AsUmsvAHdo0xrrRAGt+fMu/M
 AxughM30n9mWTrdhWkCtXCtwSYTfIDXH5pfJbJ+7DIRyMh7H+D97izisURZAdQW8Rj3Q
 caww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKnAzpw+D5ix0IDcFgVINa5Y5r6Wa08d3ZsiQAbw+UUvPLMUQHWUsV+nH7bVG2q+WztEtEei2g4p8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyo5xr/gZwVA8M2guHyHd1FUlTLnofiWJ6XXIxbUfrvsNCCJttd
 z7tueHZINnm9Vwr9bmqtBXsolQ8ExEjlg9O3ru2GOeLfCCLZssFhBjSlsiUPvi8=
X-Gm-Gg: ASbGncuS6xX58KwNd2CBDG797/GCJo4WJuxJ/Q2+m+vp9baUEo89UmyBkBvEK/Z4IkJ
 +7kPehx8uPhC1U+/ke5+uvKXvtGxwNeDT2PwXz93t1GO81M/hXfZFpmJ9/7dmfT5jBLZxrdDhME
 I3+5Nwik1rRhpDZLcfIrgyePfIEuUOWYNlRZipiErKiLQRO0G244wRYuan3XdqmmmIUltYAy3U3
 FJ6i1RwxKtIDLBaT84hts4khKbDY2y7+M138lqPfp9M/YhRL72iDsZc7u4wd69jpy9woV8=
X-Google-Smtp-Source: AGHT+IGUxTrFiynZcJ7PKYvA2ewoIaeJqQdhSUuPmtxdnYouQbsNLkGxBQpyygP2M7ClyclJsRc3Bg==
X-Received: by 2002:a05:600c:1d1d:b0:436:1b94:2deb with SMTP id
 5b1f17b1804b1-43668b5e015mr197739035e9.5.1736254738129; 
 Tue, 07 Jan 2025 04:58:58 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c84840asm50277479f8f.61.2025.01.07.04.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 04:58:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Mahadevan <quic_mahap@quicinc.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: display: Correct indentation and style in DTS
 example
Date: Tue,  7 Jan 2025 13:58:51 +0100
Message-ID: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
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

DTS example in the bindings should be indented with 2- or 4-spaces and
aligned with opening '- |', so correct any differences like 3-spaces or
mixtures 2- and 4-spaces in one binding.

No functional changes here, but saves some comments during reviews of
new patches built on existing code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../display/amlogic,meson-dw-hdmi.yaml        |  8 +-
 .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 28 +++---
 .../display/bridge/samsung,mipi-dsim.yaml     | 66 ++++++-------
 .../display/mediatek/mediatek,aal.yaml        | 46 ++++-----
 .../display/msm/dsi-controller-main.yaml      | 98 +++++++++----------
 .../bindings/display/msm/dsi-phy-10nm.yaml    | 40 ++++----
 .../bindings/display/msm/dsi-phy-14nm.yaml    | 34 +++----
 .../bindings/display/msm/dsi-phy-20nm.yaml    | 36 +++----
 .../bindings/display/msm/dsi-phy-28nm.yaml    | 34 +++----
 .../bindings/display/msm/dsi-phy-7nm.yaml     | 34 +++----
 .../display/msm/qcom,sa8775p-mdss.yaml        |  7 +-
 .../bindings/display/renesas,cmm.yaml         | 12 +--
 12 files changed, 221 insertions(+), 222 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
index 84d68b8cfccc..416fe263ac92 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
@@ -148,10 +148,10 @@ examples:
 
         /* TMDS Output */
         hdmi_tx_tmds_port: port@1 {
-             reg = <1>;
+            reg = <1>;
 
-             hdmi_tx_tmds_out: endpoint {
-                 remote-endpoint = <&hdmi_connector_in>;
-             };
+            hdmi_tx_tmds_out: endpoint {
+                remote-endpoint = <&hdmi_connector_in>;
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
index 3791c9f4ebab..05442d437755 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
@@ -82,21 +82,21 @@ examples:
         power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_HDMI_TX>;
         reg-io-width = <1>;
         ports {
-           #address-cells = <1>;
-           #size-cells = <0>;
-           port@0 {
-             reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+                reg = <0>;
 
-             hdmi_tx_from_pvi: endpoint {
-               remote-endpoint = <&pvi_to_hdmi_tx>;
-             };
-          };
+                endpoint {
+                    remote-endpoint = <&pvi_to_hdmi_tx>;
+                };
+            };
 
-          port@1 {
-            reg = <1>;
-              hdmi_tx_out: endpoint {
-                remote-endpoint = <&hdmi0_con>;
-              };
-          };
+            port@1 {
+                reg = <1>;
+                endpoint {
+                    remote-endpoint = <&hdmi0_con>;
+                };
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
index 4ed7a799ba26..62625fc0c44b 100644
--- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
@@ -241,40 +241,40 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     dsi@13900000 {
-       compatible = "samsung,exynos5433-mipi-dsi";
-       reg = <0x13900000 0xC0>;
-       interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
-       phys = <&mipi_phy 1>;
-       phy-names = "dsim";
-       clocks = <&cmu_disp CLK_PCLK_DSIM0>,
-                <&cmu_disp CLK_PHYCLK_MIPIDPHY0_BITCLKDIV8>,
-                <&cmu_disp CLK_PHYCLK_MIPIDPHY0_RXCLKESC0>,
-                <&cmu_disp CLK_SCLK_RGB_VCLK_TO_DSIM0>,
-                <&cmu_disp CLK_SCLK_DSIM0>;
-       clock-names = "bus_clk",
-                     "phyclk_mipidphy0_bitclkdiv8",
-                     "phyclk_mipidphy0_rxclkesc0",
-                     "sclk_rgb_vclk_to_dsim0",
-                     "sclk_mipi";
-       power-domains = <&pd_disp>;
-       vddcore-supply = <&ldo6_reg>;
-       vddio-supply = <&ldo7_reg>;
-       samsung,burst-clock-frequency = <512000000>;
-       samsung,esc-clock-frequency = <16000000>;
-       samsung,pll-clock-frequency = <24000000>;
-       pinctrl-names = "default";
-       pinctrl-0 = <&te_irq>;
+        compatible = "samsung,exynos5433-mipi-dsi";
+        reg = <0x13900000 0xC0>;
+        interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
+        phys = <&mipi_phy 1>;
+        phy-names = "dsim";
+        clocks = <&cmu_disp CLK_PCLK_DSIM0>,
+                 <&cmu_disp CLK_PHYCLK_MIPIDPHY0_BITCLKDIV8>,
+                 <&cmu_disp CLK_PHYCLK_MIPIDPHY0_RXCLKESC0>,
+                 <&cmu_disp CLK_SCLK_RGB_VCLK_TO_DSIM0>,
+                 <&cmu_disp CLK_SCLK_DSIM0>;
+        clock-names = "bus_clk",
+                      "phyclk_mipidphy0_bitclkdiv8",
+                      "phyclk_mipidphy0_rxclkesc0",
+                      "sclk_rgb_vclk_to_dsim0",
+                      "sclk_mipi";
+        power-domains = <&pd_disp>;
+        vddcore-supply = <&ldo6_reg>;
+        vddio-supply = <&ldo7_reg>;
+        samsung,burst-clock-frequency = <512000000>;
+        samsung,esc-clock-frequency = <16000000>;
+        samsung,pll-clock-frequency = <24000000>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&te_irq>;
 
-       ports {
-          #address-cells = <1>;
-          #size-cells = <0>;
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
 
-          port@0 {
-             reg = <0>;
+            port@0 {
+                reg = <0>;
 
-             dsi_to_mic: endpoint {
-                remote-endpoint = <&mic_to_dsi>;
-             };
-          };
-       };
+                dsi_to_mic: endpoint {
+                    remote-endpoint = <&mic_to_dsi>;
+                };
+            };
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index 47ddba5c41af..5d2089dc596e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -104,30 +104,30 @@ examples:
         #size-cells = <2>;
 
         aal@14015000 {
-           compatible = "mediatek,mt8173-disp-aal";
-           reg = <0 0x14015000 0 0x1000>;
-           interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_LOW>;
-           power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-           clocks = <&mmsys CLK_MM_DISP_AAL>;
-           mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
+            compatible = "mediatek,mt8173-disp-aal";
+            reg = <0 0x14015000 0 0x1000>;
+            interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+            clocks = <&mmsys CLK_MM_DISP_AAL>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
 
-           ports {
-               #address-cells = <1>;
-               #size-cells = <0>;
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
 
-               port@0 {
-                   reg = <0>;
-                   aal0_in: endpoint {
-                       remote-endpoint = <&ccorr0_out>;
-                   };
-               };
+                port@0 {
+                    reg = <0>;
+                    endpoint {
+                        remote-endpoint = <&ccorr0_out>;
+                    };
+                };
 
-               port@1 {
-                   reg = <1>;
-                   aal0_out: endpoint {
-                       remote-endpoint = <&gamma0_in>;
-                   };
-               };
-           };
-       };
+                port@1 {
+                    reg = <1>;
+                    endpoint {
+                        remote-endpoint = <&gamma0_in>;
+                    };
+                };
+            };
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index b0fd96b76ed1..2ad549801c2a 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -416,63 +416,63 @@ unevaluatedProperties: false
 
 examples:
   - |
-     #include <dt-bindings/interrupt-controller/arm-gic.h>
-     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
-     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
-     #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
 
-     dsi@ae94000 {
-           compatible = "qcom,sc7180-dsi-ctrl", "qcom,mdss-dsi-ctrl";
-           reg = <0x0ae94000 0x400>;
-           reg-names = "dsi_ctrl";
+    dsi@ae94000 {
+        compatible = "qcom,sc7180-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+        reg = <0x0ae94000 0x400>;
+        reg-names = "dsi_ctrl";
 
-           #address-cells = <1>;
-           #size-cells = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-           interrupt-parent = <&mdss>;
-           interrupts = <4>;
+        interrupt-parent = <&mdss>;
+        interrupts = <4>;
 
-           clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
-                    <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
-                    <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
-                    <&dispcc DISP_CC_MDSS_ESC0_CLK>,
-                    <&dispcc DISP_CC_MDSS_AHB_CLK>,
-                    <&dispcc DISP_CC_MDSS_AXI_CLK>;
-           clock-names = "byte",
-                         "byte_intf",
-                         "pixel",
-                         "core",
-                         "iface",
-                         "bus";
+        clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+                 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+                 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+                 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+                 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&dispcc DISP_CC_MDSS_AXI_CLK>;
+        clock-names = "byte",
+                      "byte_intf",
+                      "pixel",
+                      "core",
+                      "iface",
+                      "bus";
 
-           phys = <&dsi0_phy>;
-           phy-names = "dsi";
+        phys = <&dsi0_phy>;
+        phy-names = "dsi";
 
-           assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
-           assigned-clock-parents = <&dsi_phy 0>, <&dsi_phy 1>;
+        assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+        assigned-clock-parents = <&dsi_phy 0>, <&dsi_phy 1>;
 
-           power-domains = <&rpmhpd SC7180_CX>;
-           operating-points-v2 = <&dsi_opp_table>;
+        power-domains = <&rpmhpd SC7180_CX>;
+        operating-points-v2 = <&dsi_opp_table>;
 
-           ports {
-                  #address-cells = <1>;
-                  #size-cells = <0>;
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
 
-                  port@0 {
-                          reg = <0>;
-                          dsi0_in: endpoint {
-                                   remote-endpoint = <&dpu_intf1_out>;
-                          };
-                  };
+            port@0 {
+                reg = <0>;
+                endpoint {
+                    remote-endpoint = <&dpu_intf1_out>;
+                };
+            };
 
-                  port@1 {
-                          reg = <1>;
-                          dsi0_out: endpoint {
-                                   remote-endpoint = <&sn65dsi86_in>;
-                                   data-lanes = <0 1 2 3>;
-                                   qcom,te-source = "mdp_vsync_e";
-                          };
-                  };
-           };
-     };
+            port@1 {
+                reg = <1>;
+                endpoint {
+                    remote-endpoint = <&sn65dsi86_in>;
+                    data-lanes = <0 1 2 3>;
+                    qcom,te-source = "mdp_vsync_e";
+                };
+            };
+        };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
index 69d13867b7cf..fc9abf090f0d 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
@@ -74,28 +74,28 @@ unevaluatedProperties: false
 
 examples:
   - |
-     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
-     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
 
-     dsi-phy@ae94400 {
-         compatible = "qcom,dsi-phy-10nm";
-         reg = <0x0ae94400 0x200>,
-               <0x0ae94600 0x280>,
-               <0x0ae94a00 0x1e0>;
-         reg-names = "dsi_phy",
-                     "dsi_phy_lane",
-                     "dsi_pll";
+    dsi-phy@ae94400 {
+        compatible = "qcom,dsi-phy-10nm";
+        reg = <0x0ae94400 0x200>,
+              <0x0ae94600 0x280>,
+              <0x0ae94a00 0x1e0>;
+        reg-names = "dsi_phy",
+                    "dsi_phy_lane",
+                    "dsi_pll";
 
-         #clock-cells = <1>;
-         #phy-cells = <0>;
+        #clock-cells = <1>;
+        #phy-cells = <0>;
 
-         vdds-supply = <&vdda_mipi_dsi0_pll>;
-         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-                  <&rpmhcc RPMH_CXO_CLK>;
-         clock-names = "iface", "ref";
+        vdds-supply = <&vdda_mipi_dsi0_pll>;
+        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "iface", "ref";
 
-         qcom,phy-rescode-offset-top = /bits/ 8 <0 0 0 0 0>;
-         qcom,phy-rescode-offset-bot = /bits/ 8 <0 0 0 0 0>;
-         qcom,phy-drive-ldo-level = <400>;
-     };
+        qcom,phy-rescode-offset-top = /bits/ 8 <0 0 0 0 0>;
+        qcom,phy-rescode-offset-bot = /bits/ 8 <0 0 0 0 0>;
+        qcom,phy-drive-ldo-level = <400>;
+    };
 ...
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
index 52bbe132e6da..8fbfa9edb20c 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
@@ -55,24 +55,24 @@ unevaluatedProperties: false
 
 examples:
   - |
-     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
-     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
 
-     dsi-phy@ae94400 {
-         compatible = "qcom,dsi-phy-14nm";
-         reg = <0x0ae94400 0x200>,
-               <0x0ae94600 0x280>,
-               <0x0ae94a00 0x1e0>;
-         reg-names = "dsi_phy",
-                     "dsi_phy_lane",
-                     "dsi_pll";
+    dsi-phy@ae94400 {
+        compatible = "qcom,dsi-phy-14nm";
+        reg = <0x0ae94400 0x200>,
+              <0x0ae94600 0x280>,
+              <0x0ae94a00 0x1e0>;
+        reg-names = "dsi_phy",
+                    "dsi_phy_lane",
+                    "dsi_pll";
 
-         #clock-cells = <1>;
-         #phy-cells = <0>;
+        #clock-cells = <1>;
+        #phy-cells = <0>;
 
-         vcca-supply = <&vcca_reg>;
-         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-                  <&rpmhcc RPMH_CXO_CLK>;
-         clock-names = "iface", "ref";
-     };
+        vcca-supply = <&vcca_reg>;
+        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "iface", "ref";
+    };
 ...
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
index 7e6687cb002b..93570052992a 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
@@ -45,26 +45,26 @@ unevaluatedProperties: false
 
 examples:
   - |
-     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
-     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
 
-     dsi-phy@fd922a00 {
-         compatible = "qcom,dsi-phy-20nm";
-         reg = <0xfd922a00 0xd4>,
-               <0xfd922b00 0x2b0>,
-               <0xfd922d80 0x7b>;
-         reg-names = "dsi_pll",
-                     "dsi_phy",
-                     "dsi_phy_regulator";
+    dsi-phy@fd922a00 {
+        compatible = "qcom,dsi-phy-20nm";
+        reg = <0xfd922a00 0xd4>,
+              <0xfd922b00 0x2b0>,
+              <0xfd922d80 0x7b>;
+        reg-names = "dsi_pll",
+                    "dsi_phy",
+                    "dsi_phy_regulator";
 
-         #clock-cells = <1>;
-         #phy-cells = <0>;
+        #clock-cells = <1>;
+        #phy-cells = <0>;
 
-         vcca-supply = <&vcca_reg>;
-         vddio-supply = <&vddio_reg>;
+        vcca-supply = <&vcca_reg>;
+        vddio-supply = <&vddio_reg>;
 
-         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-                  <&rpmhcc RPMH_CXO_CLK>;
-         clock-names = "iface", "ref";
-     };
+        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "iface", "ref";
+    };
 ...
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
index a55c2445d189..371befa9f9d2 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
@@ -51,25 +51,25 @@ unevaluatedProperties: false
 
 examples:
   - |
-     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
-     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
 
-     dsi-phy@fd922a00 {
-         compatible = "qcom,dsi-phy-28nm-lp";
-         reg = <0xfd922a00 0xd4>,
-               <0xfd922b00 0x2b0>,
-               <0xfd922d80 0x7b>;
-         reg-names = "dsi_pll",
-                     "dsi_phy",
-                     "dsi_phy_regulator";
+    dsi-phy@fd922a00 {
+        compatible = "qcom,dsi-phy-28nm-lp";
+        reg = <0xfd922a00 0xd4>,
+              <0xfd922b00 0x2b0>,
+              <0xfd922d80 0x7b>;
+        reg-names = "dsi_pll",
+                    "dsi_phy",
+                    "dsi_phy_regulator";
 
-         #clock-cells = <1>;
-         #phy-cells = <0>;
+        #clock-cells = <1>;
+        #phy-cells = <0>;
 
-         vddio-supply = <&vddio_reg>;
+        vddio-supply = <&vddio_reg>;
 
-         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-                  <&rpmhcc RPMH_CXO_CLK>;
-         clock-names = "iface", "ref";
-     };
+        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "iface", "ref";
+    };
 ...
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 7e764eac3ef3..321470435e65 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -54,23 +54,23 @@ unevaluatedProperties: false
 
 examples:
   - |
-     #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
-     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
 
-     dsi-phy@ae94400 {
-         compatible = "qcom,dsi-phy-7nm";
-         reg = <0x0ae94400 0x200>,
-               <0x0ae94600 0x280>,
-               <0x0ae94900 0x260>;
-         reg-names = "dsi_phy",
-                     "dsi_phy_lane",
-                     "dsi_pll";
+    dsi-phy@ae94400 {
+        compatible = "qcom,dsi-phy-7nm";
+        reg = <0x0ae94400 0x200>,
+              <0x0ae94600 0x280>,
+              <0x0ae94900 0x260>;
+        reg-names = "dsi_phy",
+                    "dsi_phy_lane",
+                    "dsi_pll";
 
-         #clock-cells = <1>;
-         #phy-cells = <0>;
+        #clock-cells = <1>;
+        #phy-cells = <0>;
 
-         vdds-supply = <&vreg_l5a_0p88>;
-         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-                  <&rpmhcc RPMH_CXO_CLK>;
-         clock-names = "iface", "ref";
-     };
+        vdds-supply = <&vreg_l5a_0p88>;
+        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "iface", "ref";
+    };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index 58f8a01f29c7..e567afb44b3f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -78,7 +78,6 @@ examples:
                              "mdp1-mem",
                              "cpu-cfg";
 
-
         resets = <&dispcc_core_bcr>;
         power-domains = <&dispcc_gdsc>;
 
@@ -129,7 +128,7 @@ examples:
                 port@0 {
                     reg = <0>;
                     dpu_intf0_out: endpoint {
-                         remote-endpoint = <&mdss0_dp0_in>;
+                        remote-endpoint = <&mdss0_dp0_in>;
                     };
                 };
             };
@@ -208,8 +207,8 @@ examples:
                 };
 
                 port@1 {
-                   reg = <1>;
-                   mdss0_dp_out: endpoint { };
+                    reg = <1>;
+                    mdss0_dp_out: endpoint { };
                 };
             };
 
diff --git a/Documentation/devicetree/bindings/display/renesas,cmm.yaml b/Documentation/devicetree/bindings/display/renesas,cmm.yaml
index 561efaaa5a91..fc4933c343cd 100644
--- a/Documentation/devicetree/bindings/display/renesas,cmm.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,cmm.yaml
@@ -58,10 +58,10 @@ examples:
     #include <dt-bindings/power/r8a7796-sysc.h>
 
     cmm0: cmm@fea40000 {
-         compatible = "renesas,r8a7796-cmm",
-                      "renesas,rcar-gen3-cmm";
-         reg = <0xfea40000 0x1000>;
-         power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
-         clocks = <&cpg CPG_MOD 711>;
-         resets = <&cpg 711>;
+        compatible = "renesas,r8a7796-cmm",
+                     "renesas,rcar-gen3-cmm";
+        reg = <0xfea40000 0x1000>;
+        power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+        clocks = <&cpg CPG_MOD 711>;
+        resets = <&cpg 711>;
     };
-- 
2.43.0

