Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDF4C4236B
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 02:10:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E8910E13C;
	Sat,  8 Nov 2025 01:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="lENSass5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC05310E13C
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 01:10:36 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20251108010500euoutp01a973ae23f5cd27d5167c12e9740fff38~14oeE8aa02093120931euoutp01W;
 Sat,  8 Nov 2025 01:05:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20251108010500euoutp01a973ae23f5cd27d5167c12e9740fff38~14oeE8aa02093120931euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1762563900;
 bh=O0aQzr2Rf+6/6Xb2BJI25VkFJ8v5nNZKxfiP4m792ec=;
 h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
 b=lENSass5qcJlgAaesztjZJ8fne//YFrbG4Mz+hateJTLjAUI73hLjR6VpiCyI52VG
 2NRBRaCudhgr8jVK/3ctHgplDZ/jycT0TC67qrdONhN1urW5n+Zq9fJ+d3kn7+DLyr
 BGMcRyTwb1ZKlYn2dM0HetXMw514Oe9gJarqk8qE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20251108010500eucas1p1c8b73311765e359bea891ec783237910~14odWgpxh2750227502eucas1p12;
 Sat,  8 Nov 2025 01:05:00 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20251108010458eusmtip2e955a85f1244318229a3855f31124197~14obgPqD62515425154eusmtip2Z;
 Sat,  8 Nov 2025 01:04:58 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Sat, 08 Nov 2025 02:04:39 +0100
Subject: [PATCH RFC 05/13] dt-bindings: mfd: Add starfive,jh7110-hdmi-mfd
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20251108-jh7110-clean-send-v1-5-06bf43bb76b1@samsung.com>
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
X-CMS-MailID: 20251108010500eucas1p1c8b73311765e359bea891ec783237910
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251108010500eucas1p1c8b73311765e359bea891ec783237910
X-EPHeader: CA
X-CMS-RootMailID: 20251108010500eucas1p1c8b73311765e359bea891ec783237910
References: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
 <CGME20251108010500eucas1p1c8b73311765e359bea891ec783237910@eucas1p1.samsung.com>
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

Add the dt-binding for the StarFive JH7110 HDMI MFD (Multi-Function
Device).

The JH7110 HDMI IP is a monolithic block containing both the digital
controller and analog PHY in a single register space. This binding
defines the MFD parent device, which holds the shared register map and
populates its two children: the PHY and the controller. This is
necessary to resolve a circular clock dependency between the HDMI block
and the VOUT clock generator.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../bindings/mfd/starfive,jh7110-hdmi-mfd.yaml     | 93 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 94 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-mfd.yaml b/Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-mfd.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..2cbfb2b975083240575a0567b06e6cafd542cf9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-mfd.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/starfive,jh7110-hdmi-mfd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 HDMI MFD (Controller+PHY)
+
+maintainers:
+  - Michal Wilczynski <m.wilczynski@samsung.com>
+
+description:
+  The StarFive JH7110 HDMI block is a monolithic IP containing both
+  the digital controller logic and the analog PHY logic in a single
+  register space.
+
+properties:
+  compatible:
+    const: starfive,jh7110-hdmi-mfd
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+patternProperties:
+  "^phy(@[0-9a-f]+)?$":
+    $ref: ../phy/starfive,jh7110-inno-hdmi-phy.yaml#
+  "^controller(@[0-9a-f]+)?$":
+    $ref: ../display/bridge/starfive,jh7110-inno-hdmi-controller.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/starfive,jh7110-crg.h>
+    #include <dt-bindings/reset/starfive,jh7110-crg.h>
+
+    soc {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        hdmi_mfd: hdmi@29590000 {
+            compatible = "starfive,jh7110-hdmi-mfd";
+            reg = <0x29590000 0x4000>;
+
+            hdmi_phy: phy {
+                compatible = "starfive,jh7110-inno-hdmi-phy";
+                clocks = <&xin24m>;
+                clock-names = "refoclk";
+                #clock-cells = <0>;
+                clock-output-names = "hdmi_pclk";
+                #phy-cells = <0>;
+            };
+
+            hdmi_controller: controller {
+                compatible = "starfive,jh7110-inno-hdmi-controller";
+                interrupts = <99>;
+                clocks = <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
+                        <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
+                        <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>,
+                        <&hdmi_phy>;
+                clock-names = "sys", "mclk", "bclk", "pclk";
+                resets = <&voutcrg JH7110_VOUTRST_HDMI_TX_HDMI>;
+                reset-names = "hdmi_tx";
+                phys = <&hdmi_phy>;
+                phy-names = "hdmi-phy";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        hdmi_in: endpoint {
+                            remote-endpoint = <&dpu_out_dpi0>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                        hdmi_out: endpoint {
+                            remote-endpoint = <&hdmi_con_in>;
+                        };
+                    };
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 66fab45bbee8c1a5f73d09bb470d28029b8c6139..052876c6538f980f75ff64e78b6ebea460307904 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24048,6 +24048,7 @@ STARFIVE JH7110 DISPLAY SUBSYSTEM
 M:	Michal Wilczynski <m.wilczynski@samsung.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/bridge/starfive,jh7110-inno-hdmi-controller.yaml
+F:	Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-mfd.yaml
 F:	Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml
 F:	Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-vout-subsystem.yaml
 

-- 
2.34.1

