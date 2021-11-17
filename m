Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D25B455594
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 08:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981F66ECAC;
	Thu, 18 Nov 2021 07:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EFD89A6D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:34:42 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1mnM0e-0005tg-F5; Wed, 17 Nov 2021 15:34:00 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1mnM0b-001P6Q-3l; Wed, 17 Nov 2021 15:33:57 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/12] dt-bindings: display: rockchip: Add binding for VOP2
Date: Wed, 17 Nov 2021 15:33:42 +0100
Message-Id: <20211117143347.314294-8-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211117143347.314294-1-s.hauer@pengutronix.de>
References: <20211117143347.314294-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 18 Nov 2021 07:28:27 +0000
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Peter Geis <pgwipeout@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VOP2 is found on newer Rockchip SoCs like the rk3568 or the rk3566.
The binding differs slightly from the existing VOP binding, so add a new
binding file for it.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../display/rockchip/rockchip-vop2.yaml       | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
new file mode 100644
index 0000000000000..d566c423f9d8d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip SoC display controller (VOP2)
+
+description:
+  VOP2 (Video Output Processor v2) is the display controller for the Rockchip
+  series of SoCs which transfers the image data from a video memory
+  buffer to an external LCD interface.
+
+maintainers:
+  - Sandy Huang <hjc@rock-chips.com>
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk3568-vop
+      - rockchip,rk3566-vop
+
+  reg:
+    minItems: 1
+    items:
+      - description:
+          Must contain one entry corresponding to the base address and length
+          of the register space.
+      - description:
+          Can optionally contain a second entry corresponding to
+          the CRTC gamma LUT address.
+
+  interrupts:
+    maxItems: 1
+    description:
+      The VOP interrupt is shared by several interrupt sources, such as
+      frame start (VSYNC), line flag and other status interrupts.
+
+  clocks:
+    items:
+      - description: Clock for ddr buffer transfer.
+      - description: Clock for the ahb bus to R/W the phy regs.
+      - description: Pixel clock for video port 0.
+      - description: Pixel clock for video port 1.
+      - description: Pixel clock for video port 2.
+
+  clock-names:
+    items:
+      - const: aclk_vop
+      - const: hclk_vop
+      - const: dclk_vp0
+      - const: dclk_vp1
+      - const: dclk_vp2
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+
+  assigned-clocks:
+    maxItems: 2
+
+  assigned-clock-rates:
+    maxItems: 2
+
+  iommus:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3568-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3568-power.h>
+    vop: vop@fe040000 {
+      compatible = "rockchip,rk3568-vop";
+      reg = <0x0 0xfe040000 0x0 0x3000>, <0x0 0xfe044000 0x0 0x1000>;
+      interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&cru ACLK_VOP>,
+               <&cru HCLK_VOP>,
+               <&cru DCLK_VOP0>,
+               <&cru DCLK_VOP1>,
+               <&cru DCLK_VOP2>;
+      clock-names = "aclk_vop",
+                    "hclk_vop",
+                    "dclk_vp0",
+                    "dclk_vp1",
+                    "dclk_vp2";
+      power-domains = <&power RK3568_PD_VO>;
+      iommus = <&vop_mmu>;
+      vop_out: port {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        vp0_out_dsi0: endpoint@0 {
+          reg = <0>;
+          remote-endpoint = <&dsi0_in_vp0>;
+        };
+        vp0_out_hdmi: endpoint@1 {
+          reg = <1>;
+          remote-endpoint = <&dsi0_in_vp0>;
+        };
+      };
+    };
-- 
2.30.2

