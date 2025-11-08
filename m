Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEEEC42368
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 02:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D6410E19E;
	Sat,  8 Nov 2025 01:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="lvINEcdW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 339 seconds by postgrey-1.36 at gabe;
 Sat, 08 Nov 2025 01:10:35 UTC
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492B410E182
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 01:10:35 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20251108010454euoutp0175b1ad0327b65a199402c22c6778bf22~14oXzLP4L2093120931euoutp01U;
 Sat,  8 Nov 2025 01:04:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20251108010454euoutp0175b1ad0327b65a199402c22c6778bf22~14oXzLP4L2093120931euoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1762563894;
 bh=QPKOABNr+nSvn9PQTNle3vFMJNkD4N3hf3pKiqLT21I=;
 h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
 b=lvINEcdWmcVtASBpvsheui6gsQ4SdwlNE9ew62E0uJgp6BdM1gCNhfhgqFt0V/QrD
 vlPs2aZDff0oW71VFOhLHmpM9OKMzBDRk3t2WkiLWP8GlvUGtsBLJNs9ZYbSAvKomJ
 LVO43hWuA3ZKp5r86xmEmyFNXPNO7jyWK+CfsAXQ=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20251108010453eucas1p2403ec0dd2c69ae7f3eabe19cf686f345~14oXAXk2y0323703237eucas1p2Z;
 Sat,  8 Nov 2025 01:04:53 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20251108010451eusmtip2669791b6fd771047c3331027cb747f68~14oVmxMGY2515425154eusmtip2X;
 Sat,  8 Nov 2025 01:04:51 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Sat, 08 Nov 2025 02:04:35 +0100
Subject: [PATCH RFC 01/13] dt-bindings: soc: starfive: Add vout-subsystem IP
 block
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20251108-jh7110-clean-send-v1-1-06bf43bb76b1@samsung.com>
In-Reply-To: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,  Conor Dooley
 <conor@kernel.org>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
 <hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Xingyu
 Wu <xingyu.wu@starfivetech.com>, Vinod Koul <vkoul@kernel.org>,  Kishon
 Vijay Abraham I <kishon@kernel.org>,  Andrzej Hajda
 <andrzej.hajda@intel.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,  Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,  David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Marek Szyprowski
 <m.szyprowski@samsung.com>, Icenowy Zheng <uwu@icenowy.me>,  Maud Spierings
 <maudspierings@gocontroll.com>, Andy Yan <andyshrk@163.com>,  Heiko Stuebner
 <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20251108010453eucas1p2403ec0dd2c69ae7f3eabe19cf686f345
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251108010453eucas1p2403ec0dd2c69ae7f3eabe19cf686f345
X-EPHeader: CA
X-CMS-RootMailID: 20251108010453eucas1p2403ec0dd2c69ae7f3eabe19cf686f345
References: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
 <CGME20251108010453eucas1p2403ec0dd2c69ae7f3eabe19cf686f345@eucas1p2.samsung.com>
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

Add the dt-binding documentation for the StarFive JH7110 Video Output
(VOUT) subsystem.

This node acts as a parent for all devices within the VOUT power domain,
including the DC8200 display controller, the VOUTCRG clock generator,
and the HDMI MFD block. Its driver is responsible for managing the
shared power domain and top-level bus clocks for these children.

It is a bit similar to the display subsystem qcom,sdm845-mdss DT node.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../starfive/starfive,jh7110-vout-subsystem.yaml   | 156 +++++++++++++++++++++
 MAINTAINERS                                        |   5 +
 2 files changed, 161 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-vout-subsystem.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-vout-subsystem.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4ad9423ea139a537b4cfea26b0ed4ed263aa14a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-vout-subsystem.yaml
@@ -0,0 +1,156 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-vout-subsystem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 VOUT (Video Output) Subsystem
+
+maintainers:
+  - Michal Wilczynski <m.wilczynski@samsung.com>
+
+description:
+  The JH7110 video output subsystem is an IP block that contains
+  the display controller (DC8200), HDMI controller/PHY, and VOUT
+  clock generator (VOUTCRG).
+
+properties:
+  compatible:
+    const: starfive,jh7110-vout-subsystem
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  ranges: true
+
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+patternProperties:
+  "^display@[0-9a-f]+$":
+    type: object
+    description: Verisilicon DC8200 Display Controller node.
+
+  "^hdmi@[0-9a-f]+$":
+    type: object
+    description: StarFive HDMI MFD (PHY + Controller) node.
+
+  "^clock-controller@[0-9a-f]+$":
+    type: object
+    description: StarFive VOUT Clock Generator (VOUTCRG) node.
+
+  "^syscon@[0-9a-f]+$":
+    type: object
+    description: StarFive VOUT Syscon node.
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - clocks
+  - resets
+  - ranges
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/starfive,jh7110-crg.h>
+    #include <dt-bindings/power/starfive,jh7110-pmu.h>
+    #include <dt-bindings/reset/starfive,jh7110-crg.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        vout_subsystem: display-subsystem@29400000 {
+            compatible = "starfive,jh7110-vout-subsystem";
+            reg = <0x0 0x29400000 0x0 0x200000>;
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
+            power-domains = <&pwrc JH7110_PD_VOUT>;
+            clocks = <&syscrg JH7110_SYSCLK_NOC_BUS_DISP_AXI>;
+            resets = <&syscrg JH7110_SYSRST_NOC_BUS_DISP_AXI>;
+
+            dc8200: display@29400000 {
+                compatible = "verisilicon,dc";
+                reg = <0x0 0x29400000 0x0 0x2800>;
+                interrupts = <95>;
+                clocks = <&voutcrg JH7110_VOUTCLK_DC8200_CORE>,
+                         <&voutcrg JH7110_VOUTCLK_DC8200_AXI>,
+                         <&voutcrg JH7110_VOUTCLK_DC8200_AHB>,
+                         <&voutcrg JH7110_VOUTCLK_DC8200_PIX0>,
+                         <&voutcrg JH7110_VOUTCLK_DC8200_PIX1>;
+                clock-names = "core", "axi", "ahb", "pix0", "pix1";
+                resets = <&voutcrg JH7110_VOUTRST_DC8200_AXI>,
+                         <&voutcrg JH7110_VOUTRST_DC8200_AHB>,
+                         <&voutcrg JH7110_VOUTRST_DC8200_CORE>;
+                reset-names = "axi", "ahb", "core";
+            };
+
+            hdmi_mfd: hdmi@29590000 {
+                compatible = "starfive,jh7110-hdmi-mfd";
+                reg = <0x0 0x29590000 0x0 0x4000>;
+                interrupts = <99>;
+
+                hdmi_phy: phy {
+                    compatible = "starfive,jh7110-inno-hdmi-phy";
+                    clocks = <&xin24m>;
+                    clock-names = "refoclk";
+                    #clock-cells = <0>;
+                    clock-output-names = "hdmi_pclk";
+                    #phy-cells = <0>;
+                };
+
+                hdmi_controller: controller {
+                    compatible = "starfive,jh7110-inno-hdmi-controller";
+                    interrupts = <99>;
+                    clocks = <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
+                             <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
+                             <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>,
+                             <&hdmi_phy>;
+                    clock-names = "sys", "mclk", "bclk", "pclk";
+                    resets = <&voutcrg JH7110_VOUTRST_HDMI_TX_HDMI>;
+                    reset-names = "hdmi_tx";
+                    phys = <&hdmi_phy>;
+                    phy-names = "hdmi-phy";
+                };
+            };
+
+            voutcrg: clock-controller@295c0000 {
+                compatible = "starfive,jh7110-voutcrg";
+                reg = <0x0 0x295c0000 0x0 0x10000>;
+                clocks = <&syscrg JH7110_SYSCLK_VOUT_SRC>,
+                         <&syscrg JH7110_SYSCLK_VOUT_TOP_AHB>,
+                         <&syscrg JH7110_SYSCLK_VOUT_TOP_AXI>,
+                         <&syscrg JH7110_SYSCLK_VOUT_TOP_HDMITX0_MCLK>,
+                         <&syscrg JH7110_SYSCLK_I2STX0_BCLK>,
+                         <&hdmi_phy>;
+                clock-names = "vout_src", "vout_top_ahb",
+                              "vout_top_axi", "vout_top_hdmitx0_mclk",
+                              "i2stx0_bclk", "hdmitx0_pixelclk";
+                resets = <&syscrg JH7110_SYSRST_VOUT_TOP_SRC>;
+                reset-names = "vout_top";
+                #clock-cells = <1>;
+                #reset-cells = <1>;
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 348caaaa929a519bc0ec5c0c7b587468ef7532d5..99434e54dc39494153677a6ca359d70f2ba2ddb3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24044,6 +24044,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
 
+STARFIVE JH7110 DISPLAY SUBSYSTEM
+M:	Michal Wilczynski <m.wilczynski@samsung.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-vout-subsystem.yaml
+
 STARFIVE JH7110 DPHY RX DRIVER
 M:	Jack Zhu <jack.zhu@starfivetech.com>
 M:	Changhuang Liang <changhuang.liang@starfivetech.com>

-- 
2.34.1

