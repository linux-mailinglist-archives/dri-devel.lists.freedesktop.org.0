Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A37EA24FB1
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 20:10:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C6210E29A;
	Sun,  2 Feb 2025 19:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="c+qb8vey";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86CD510E2A3
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2025 19:09:58 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 874F6252F3;
 Sun,  2 Feb 2025 20:09:56 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_1vjShqi42H; Sun,  2 Feb 2025 20:09:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1738523392; bh=AzkouwOYhe5WXjLjfJu6jXSPjDiiTNXRARPXpdw0PEY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=c+qb8veyMgMFyetAbWddB6yHxCe1Zb/piNvjd3URx+Yzvhji77lVKgmMzO9JJ7N8i
 9nWc3G/a71yXXbSdzimojqPpWnVa2OZBwZgUfczlP8gV30zhvOgajcgE7QaOFir3FN
 lcu5Ud+hzhiAP3R5q9kjeCY7MHD2lRseRIC2f1IlhtV2g2fFqvo54UjVS6bZpe+yHJ
 /JHFZ7116/8c0q9tSKgDwjcGYFk2V0SMRDTXuml0OBmj6zSPK6L+/LAisPTHrTginh
 p7CgdO1tJQhp82PVvJwFYcH7Tj3yey/LrG5d3oLL1v46CyJDxdWhsy/FhxThoIUjg6
 Nrzzvz6Ih/6uQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andi Shyti <andi.shyti@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Vivek Gautam <gautam.vivek@samsung.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-hardening@vger.kernel.org,
 Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 03/33] dt-bindings: clock: document exynos7870 clock driver
 CMU bindings
Date: Mon,  3 Feb 2025 00:39:24 +0530
Message-ID: <20250202190924.15036-1-kauschluss@disroot.org>
In-Reply-To: <20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org>
References: <20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org>
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

Provide dt-schema documentation for Exynos7870 SoC clock controller.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../clock/samsung,exynos7870-clock.yaml       | 246 ++++++++++++++++++
 1 file changed, 246 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos7870-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos7870-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos7870-clock.yaml
new file mode 100644
index 000000000000..697e03ca191d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos7870-clock.yaml
@@ -0,0 +1,246 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/samsung,exynos7870-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos7870 SoC clock controller
+
+maintainers:
+  - Chanwoo Choi <cw00.choi@samsung.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+  - Tomasz Figa <tomasz.figa@gmail.com>
+
+description: |
+  Exynos7870 clock controller is comprised of several CMU units, generating
+  clocks for different domains. Those CMU units are modeled as separate device
+  tree nodes, and might depend on each other. The root clock in that root tree
+  is an external clock: OSCCLK (26 MHz). This external clock must be defined
+  as a fixed-rate clock in dts.
+
+  Each clock is assigned an identifier and client nodes can use this identifier
+  to specify the clock which they consume. All clocks available for usage
+  in clock consumer nodes are defined as preprocessor macros in
+  'dt-bindings/clock/exynos7870.h' header.
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos7870-cmu-mif
+      - samsung,exynos7870-cmu-dispaud
+      - samsung,exynos7870-cmu-fsys
+      - samsung,exynos7870-cmu-g3d
+      - samsung,exynos7870-cmu-isp
+      - samsung,exynos7870-cmu-mfcmscl
+      - samsung,exynos7870-cmu-peri
+
+  clocks:
+    minItems: 1
+    maxItems: 10
+
+  clock-names:
+    minItems: 1
+    maxItems: 10
+
+  "#clock-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-cmu-mif
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+
+        clock-names:
+          items:
+            - const: oscclk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-cmu-dispaud
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_DISPAUD bus clock (from CMU_MIF)
+            - description: DECON external clock (from CMU_MIF)
+            - description: DECON vertical clock (from CMU_MIF)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: gout_mif_cmu_dispaud_bus
+            - const: gout_mif_cmu_dispaud_decon_eclk
+            - const: gout_mif_cmu_dispaud_decon_vclk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-cmu-fsys
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_FSYS bus clock (from CMU_MIF)
+            - description: USB20DRD clock (from CMU_MIF)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: gout_mif_cmu_fsys_bus
+            - const: gout_mif_cmu_fsys_usb20drd_refclk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-cmu-g3d
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: G3D switch clock (from CMU_MIF)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: gout_mif_cmu_g3d_switch
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-cmu-isp
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: ISP camera clock (from CMU_MIF)
+            - description: ISP clock (from CMU_MIF)
+            - description: ISP VRA clock (from CMU_MIF)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: gout_mif_cmu_isp_cam
+            - const: gout_mif_cmu_isp_isp
+            - const: gout_mif_cmu_isp_vra
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-cmu-mfcmscl
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: MSCL clock (from CMU_MIF)
+            - description: MFC clock (from CMU_MIF)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: gout_mif_cmu_mfcmscl_mfc
+            - const: gout_mif_cmu_mfcmscl_mscl
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-cmu-peri
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_PERI bus clock (from CMU_MIF)
+            - description: SPI0 clock (from CMU_MIF)
+            - description: SPI1 clock (from CMU_MIF)
+            - description: SPI2 clock (from CMU_MIF)
+            - description: SPI3 clock (from CMU_MIF)
+            - description: SPI4 clock (from CMU_MIF)
+            - description: UART0 clock (from CMU_MIF)
+            - description: UART1 clock (from CMU_MIF)
+            - description: UART2 clock (from CMU_MIF)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: gout_mif_cmu_peri_bus
+            - const: gout_mif_cmu_peri_spi0
+            - const: gout_mif_cmu_peri_spi1
+            - const: gout_mif_cmu_peri_spi2
+            - const: gout_mif_cmu_peri_spi3
+            - const: gout_mif_cmu_peri_spi4
+            - const: gout_mif_cmu_peri_uart0
+            - const: gout_mif_cmu_peri_uart1
+            - const: gout_mif_cmu_peri_uart2
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - clock-names
+  - reg
+
+additionalProperties: false
+
+examples:
+  # Clock controller node for CMU_PERI
+  - |
+    #include <dt-bindings/clock/exynos7870.h>
+
+    cmu_peri: clock-controller@101F0000 {
+      compatible = "samsung,exynos7870-cmu-peri";
+      reg = <0x101f0000 0x1000>;
+      #clock-cells = <1>;
+
+      clock-names = "oscclk",
+                    "gout_mif_cmu_peri_bus",
+                    "gout_mif_cmu_peri_spi0",
+                    "gout_mif_cmu_peri_spi1",
+                    "gout_mif_cmu_peri_spi2",
+                    "gout_mif_cmu_peri_spi3",
+                    "gout_mif_cmu_peri_spi4",
+                    "gout_mif_cmu_peri_uart0",
+                    "gout_mif_cmu_peri_uart1",
+                    "gout_mif_cmu_peri_uart2";
+      clocks = <&oscclk>,
+               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_BUS>,
+               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI0>,
+               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI1>,
+               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI2>,
+               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI3>,
+               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI4>,
+               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART0>,
+               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART1>,
+               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART2>;
+    };
+
+...
-- 
2.48.1

