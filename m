Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9E04ADF37
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 18:19:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D145610E8F6;
	Tue,  8 Feb 2022 17:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D743810E8FE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 17:19:24 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 860A23FDC7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 17:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644340762;
 bh=H62uakMhiNj8wsN7JyhkhL3hR65WQAa3xO8BWW9DtO8=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=FFDmm+MIwnG6Y2/xCQd2NHe6xJj2kzACeynn4MVTiJKPtFofKa/9Oo94xuavS7qJE
 k05mtlgJ0xvD1YjaxILz7czGe0XQH2PqCiVCcVvmpMYGg7Qf85f3uHmkRvGv60ku48
 P0neQUV6VUhGdCz/Pj5BUIZCN/QRfq8etm9AhhKGZ70E/iiPqZaLDzgxncpJGsjda6
 sOt6TnScxZL8h4COHdh+Utd3PcZ7uTwI+jRot2A5TDqbpfmeioM1QtLHCUB0Fiu+o8
 2zujxkzO7SLVi9rFlRspqCbCjDxEXYKAb46nBBR5ZUge50PM1Ik9pHfr/SZ6GDJhG9
 8+hXcYXBs3Aog==
Received: by mail-ed1-f71.google.com with SMTP id
 ed6-20020a056402294600b004090fd8a936so10068785edb.23
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 09:19:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H62uakMhiNj8wsN7JyhkhL3hR65WQAa3xO8BWW9DtO8=;
 b=a6IrnLQdN1UY0D7wYLd4dMaSlkbykl8g9XwTQJtC8/P9ElT+4qTLDdudFaNJa4v9oH
 M4+UN5sf3n7X8R5kEs1/bOGZ/sOsNMiFK52UShBGusHWJBphiiul7fKnazQ64r2WOUfN
 RDRfRpwGywLeizS/5s8oKhObsg4BPPeUM5mGtcTlXOXicxtjiEG+cWeyJxWWp+TWRBwP
 DQbzf7C0nQtjb81wJNvabxPL0fRxtmkmpH8W0J8re9M3dOoOuDIZ/JCu6clOFfqlcjcr
 jriidEgag69gzDuEPkOf41bmeXetLRp61lPo06bN7xt27mLk1F+Zkr0TSxuTpiN/adev
 4IyQ==
X-Gm-Message-State: AOAM530GTbtsABWk4gqaO6RwAzcgq7aAlZDIqRbypbwxI9stNC6YIvBe
 Cpxs4WGgrxMw1fFS7v1gr/VnCmZtKiMGyIylaPaGyX73nLA243olscF06M1Cu1X6VrGqaCTsc7d
 4Bnef/2dgZh7KJGIgLmtSbt8Mxn+FBZkVQlhVeJeGBrfEPg==
X-Received: by 2002:a17:907:7d8e:: with SMTP id
 oz14mr4703495ejc.230.1644340762014; 
 Tue, 08 Feb 2022 09:19:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw64e71WROn4h7109M/ZIMvunExF5YO7bPY7dTOW0eRqIfnLB4BRRxNfmJ8+pMki5++CxBUkA==
X-Received: by 2002:a17:907:7d8e:: with SMTP id
 oz14mr4703482ejc.230.1644340761740; 
 Tue, 08 Feb 2022 09:19:21 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id r10sm5125550ejy.148.2022.02.08.09.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 09:19:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH 08/10] dt-bindings: display: samsung,
 exynos-hdmi: convert to dtschema
Date: Tue,  8 Feb 2022 18:18:21 +0100
Message-Id: <20220208171823.226211-9-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
References: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
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
Cc: Sylwester Nawrocki <snawrocki@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the Exynos HDMI bindings to DT schema format.

The conversion includes also updates to the bindings, matching the
current DTS and Linux driver:
1. Add required properties: VDD supplies, power-domains.
2. Add optional properties: HDMI-EN supply, ports.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/display/exynos/exynos_hdmi.txt   |  64 -----
 .../display/samsung/samsung,exynos-hdmi.yaml  | 227 ++++++++++++++++++
 2 files changed, 227 insertions(+), 64 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos_hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/samsung/samsung,exynos-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_hdmi.txt b/Documentation/devicetree/bindings/display/exynos/exynos_hdmi.txt
deleted file mode 100644
index 58b12e25bbb1..000000000000
--- a/Documentation/devicetree/bindings/display/exynos/exynos_hdmi.txt
+++ /dev/null
@@ -1,64 +0,0 @@
-Device-Tree bindings for drm hdmi driver
-
-Required properties:
-- compatible: value should be one among the following:
-	1) "samsung,exynos4210-hdmi"
-	2) "samsung,exynos4212-hdmi"
-	3) "samsung,exynos5420-hdmi"
-	4) "samsung,exynos5433-hdmi"
-- reg: physical base address of the hdmi and length of memory mapped
-	region.
-- interrupts: interrupt number to the cpu.
-- hpd-gpios: following information about the hotplug gpio pin.
-	a) phandle of the gpio controller node.
-	b) pin number within the gpio controller.
-	c) optional flags and pull up/down.
-- ddc: phandle to the hdmi ddc node
-- phy: phandle to the hdmi phy node
-- samsung,syscon-phandle: phandle for system controller node for PMU.
-- #sound-dai-cells: should be 0.
-
-Required properties for Exynos 4210, 4212, 5420 and 5433:
-- clocks: list of clock IDs from SoC clock driver.
-	a) hdmi: Gate of HDMI IP bus clock.
-	b) sclk_hdmi: Gate of HDMI special clock.
-	c) sclk_pixel: Pixel special clock, one of the two possible inputs of
-		HDMI clock mux.
-	d) sclk_hdmiphy: HDMI PHY clock output, one of two possible inputs of
-		HDMI clock mux.
-	e) mout_hdmi: It is required by the driver to switch between the 2
-		parents i.e. sclk_pixel and sclk_hdmiphy. If hdmiphy is stable
-		after configuration, parent is set to sclk_hdmiphy else
-		sclk_pixel.
-- clock-names: aliases as per driver requirements for above clock IDs:
-	"hdmi", "sclk_hdmi", "sclk_pixel", "sclk_hdmiphy" and "mout_hdmi".
-
-Required properties for Exynos 5433:
-- clocks: list of clock specifiers according to common clock bindings.
-	a) hdmi_pclk: Gate of HDMI IP APB bus.
-	b) hdmi_i_pclk: Gate of HDMI-PHY IP APB bus.
-	d) i_tmds_clk: Gate of HDMI TMDS clock.
-	e) i_pixel_clk: Gate of HDMI pixel clock.
-	f) i_spdif_clk: Gate of HDMI SPDIF clock.
-	g) oscclk: Oscillator clock, used as parent of following *_user clocks
-		in case HDMI-PHY is not operational.
-	h) tmds_clko: TMDS clock generated by HDMI-PHY.
-	i) tmds_clko_user: MUX used to switch between oscclk and tmds_clko,
-		respectively if HDMI-PHY is off and operational.
-	j) pixel_clko: Pixel clock generated by HDMI-PHY.
-	k) pixel_clko_user: MUX used to switch between oscclk and pixel_clko,
-		respectively if HDMI-PHY is off and operational.
-- clock-names: aliases for above clock specfiers.
-- samsung,sysreg: handle to syscon used to control the system registers.
-
-Example:
-
-	hdmi {
-		compatible = "samsung,exynos4212-hdmi";
-		reg = <0x14530000 0x100000>;
-		interrupts = <0 95 0>;
-		hpd-gpios = <&gpx3 7 1>;
-		ddc = <&hdmi_ddc_node>;
-		phy = <&hdmi_phy_node>;
-		samsung,syscon-phandle = <&pmu_system_controller>;
-	};
diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exynos-hdmi.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,exynos-hdmi.yaml
new file mode 100644
index 000000000000..cb8e735ce3bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos-hdmi.yaml
@@ -0,0 +1,227 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/samsung/samsung,exynos-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos SoC HDMI
+
+maintainers:
+  - Inki Dae <inki.dae@samsung.com>
+  - Joonyoung Shim <jy0922.shim@samsung.com>
+  - Seung-Woo Kim <sw0312.kim@samsung.com>
+  - Kyungmin Park <kyungmin.park@samsung.com>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos4210-hdmi
+      - samsung,exynos4212-hdmi
+      - samsung,exynos5420-hdmi
+      - samsung,exynos5433-hdmi
+
+  clocks:
+    minItems: 5
+    maxItems: 10
+
+  clock-names:
+    minItems: 5
+    maxItems: 10
+
+  ddc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the HDMI DDC node.
+
+  hdmi-en-supply:
+    description:
+      Provides voltage source for DCC lines available on HDMI connector. When
+      there is no power provided for DDC epprom, some TV-sets do not pulls up
+      HPD (hot plug detect) line, what causes HDMI block to stay turned off.
+      When provided, the regulator allows TV-set correctly signal HPD event.
+
+  hpd-gpios:
+    maxItems: 1
+    description:
+      A GPIO line connected to HPD
+
+  interrupts:
+    maxItems: 1
+
+  phy:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the HDMI PHY node.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Contains a port which is connected to mic node.
+
+  power-domains:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  samsung,syscon-phandle:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the PMU system controller node.
+
+  samsung,sysreg-phandle:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to DISP system controller interface.
+
+  '#sound-dai-cells':
+    const: 0
+
+  vdd-supply:
+    description:
+      VDD 1.0V HDMI TX.
+
+  vdd_osc-supply:
+    description:
+      VDD 1.8V HDMI OSC.
+
+  vdd_pll-supply:
+    description:
+      VDD 1.0V HDMI PLL.
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - ddc
+  - hpd-gpios
+  - interrupts
+  - phy
+  - reg
+  - samsung,syscon-phandle
+  - '#sound-dai-cells'
+  - vdd-supply
+  - vdd_osc-supply
+  - vdd_pll-supply
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos5433-hdmi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Gate of HDMI IP APB bus.
+            - description: Gate of HDMI-PHY IP APB bus.
+            - description: Gate of HDMI TMDS clock.
+            - description: Gate of HDMI pixel clock.
+            - description: TMDS clock generated by HDMI-PHY.
+            - description: MUX used to switch between oscclk and tmds_clko,
+                respectively if HDMI-PHY is off and operational.
+            - description: Pixel clock generated by HDMI-PHY.
+            - description: MUX used to switch between oscclk and pixel_clko,
+                respectively if HDMI-PHY is off and operational.
+            - description: Oscillator clock, used as parent of following *_user
+                clocks in case HDMI-PHY is not operational.
+            - description: Gate of HDMI SPDIF clock.
+        clock-names:
+          items:
+            - const: hdmi_pclk
+            - const: hdmi_i_pclk
+            - const: i_tmds_clk
+            - const: i_pixel_clk
+            - const: tmds_clko
+            - const: tmds_clko_user
+            - const: pixel_clko
+            - const: pixel_clko_user
+            - const: oscclk
+            - const: i_spdif_clk
+      required:
+        - samsung,sysreg-phandle
+    else:
+      properties:
+        clocks:
+          items:
+            - description: Gate of HDMI IP bus clock.
+            - description: Gate of HDMI special clock.
+            - description: Pixel special clock, one of the two possible inputs
+                of HDMI clock mux.
+            - description: HDMI PHY clock output, one of two possible inputs of
+                HDMI clock mux.
+            - description: It is required by the driver to switch between the 2
+                parents i.e. sclk_pixel and sclk_hdmiphy. If hdmiphy is stable
+                after configuration, parent is set to sclk_hdmiphy else
+                sclk_pixel.
+        clock-names:
+          items:
+            - const: hdmi
+            - const: sclk_hdmi
+            - const: sclk_pixel
+            - const: sclk_hdmiphy
+            - const: mout_hdmi
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos5433.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    hdmi@13970000 {
+        compatible = "samsung,exynos5433-hdmi";
+        reg = <0x13970000 0x70000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cmu_disp CLK_PCLK_HDMI>,
+                 <&cmu_disp CLK_PCLK_HDMIPHY>,
+                 <&cmu_disp CLK_PHYCLK_HDMIPHY_TMDS_CLKO>,
+                 <&cmu_disp CLK_PHYCLK_HDMI_PIXEL>,
+                 <&cmu_disp CLK_PHYCLK_HDMIPHY_TMDS_CLKO_PHY>,
+                 <&cmu_disp CLK_MOUT_PHYCLK_HDMIPHY_TMDS_CLKO_USER>,
+                 <&cmu_disp CLK_PHYCLK_HDMIPHY_PIXEL_CLKO_PHY>,
+                 <&cmu_disp CLK_MOUT_PHYCLK_HDMIPHY_PIXEL_CLKO_USER>,
+                 <&xxti>,
+                 <&cmu_disp CLK_SCLK_HDMI_SPDIF>;
+        clock-names = "hdmi_pclk",
+                      "hdmi_i_pclk",
+                      "i_tmds_clk",
+                      "i_pixel_clk",
+                      "tmds_clko",
+                      "tmds_clko_user",
+                      "pixel_clko",
+                      "pixel_clko_user",
+                      "oscclk",
+                      "i_spdif_clk";
+        phy = <&hdmiphy>;
+        ddc = <&hsi2c_11>;
+        samsung,syscon-phandle = <&pmu_system_controller>;
+        samsung,sysreg-phandle = <&syscon_disp>;
+        #sound-dai-cells = <0>;
+
+        hpd-gpios = <&gpa3 0 GPIO_ACTIVE_HIGH>;
+        vdd-supply = <&ldo6_reg>;
+        vdd_osc-supply = <&ldo7_reg>;
+        vdd_pll-supply = <&ldo6_reg>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                hdmi_to_tv: endpoint {
+                    remote-endpoint = <&tv_to_hdmi>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                hdmi_to_mhl: endpoint {
+                    remote-endpoint = <&mhl_to_hdmi>;
+                };
+            };
+        };
+    };
-- 
2.32.0

