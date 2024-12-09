Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A88649EA274
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 00:11:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 008E810E57C;
	Mon,  9 Dec 2024 23:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="Qp4CBEdB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE75910E57C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 23:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wsbC4vZxxh3tDQge2UlyThoaCcw7Gz3AJHNnGgei9SU=; b=Qp4CBEdB3voBImj4SORfpxaKfU
 rM3ytjN9L+mZaRCBX8JQq26FeBjjLc9vEaXfP80C91C1ZxZOohzFjn7vz7j7HaZ3aGzDy6CCIRjhL
 YTK4JOzXxGlC3xL8UEbs9Kf+0NhhYhT42Jmgd5LRId1+g80yTMadfxKyfzVZFrmVnuyYKq37SU59p
 WPo3Me/QlEModEc3tO3R+MTOBcGlE5AquhR93DMhrgSlN1zNaY32GCV76FTwZcj15cpzS3Zt8QxNv
 ymbG5X/0vHMR6lsZN9T/wKWbKhd56ETSB7xM0vm3yrk9ncwZtE9xnhDH8+snswO/wt7kmg0Hk6a3p
 +IPW9Y4w==;
Received: from i53875bc4.versanet.de ([83.135.91.196]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tKmtd-0005Ev-Rf; Tue, 10 Dec 2024 00:10:33 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 quentin.schulz@cherry.de, Heiko Stuebner <heiko.stuebner@cherry.de>,
 Dmitry Yashin <dmt.yashin@gmail.com>
Subject: [PATCH v4 2/3] dt-bindings: display: rockchip: Add schema for RK3588
 DW DSI2 controller
Date: Tue, 10 Dec 2024 00:10:20 +0100
Message-ID: <20241209231021.2180582-3-heiko@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241209231021.2180582-1-heiko@sntech.de>
References: <20241209231021.2180582-1-heiko@sntech.de>
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The Display Serial Interface 2 (DSI-2) is part of a group of communication
protocols defined by the MIPI Alliance. The RK3588 implements this
specification in its two MIPI DSI-2 Host Controllers that are based on a
new Synopsys IP.

Tested-by: Dmitry Yashin <dmt.yashin@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 .../rockchip/rockchip,rk3588-mipi-dsi2.yaml   | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml
new file mode 100644
index 000000000000..53384e47b507
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip specific extensions to the Synopsys Designware MIPI DSI2
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk3588-mipi-dsi2
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: sys
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      This SoC uses GRF regs to switch between vopl/vopb.
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: dcphy
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: apb
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input node to receive pixel data.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DSI output node to panel.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - rockchip,grf
+  - phys
+  - phy-names
+  - ports
+  - reg
+
+allOf:
+  - $ref: /schemas/display/dsi-controller.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/phy/phy.h>
+    #include <dt-bindings/power/rk3588-power.h>
+    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      dsi@fde20000 {
+        compatible = "rockchip,rk3588-mipi-dsi2";
+        reg = <0x0 0xfde20000 0x0 0x10000>;
+        interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&cru PCLK_DSIHOST0>, <&cru CLK_DSIHOST0>;
+        clock-names = "pclk", "sys";
+        resets = <&cru SRST_P_DSIHOST0>;
+        reset-names = "apb";
+        power-domains = <&power RK3588_PD_VOP>;
+        phys = <&mipidcphy0 PHY_TYPE_DPHY>;
+        phy-names = "dcphy";
+        rockchip,grf = <&vop_grf>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+          dsi0_in: port@0 {
+            reg = <0>;
+          };
+
+          dsi0_out: port@1 {
+            reg = <1>;
+          };
+        };
+      };
+    };
-- 
2.45.2

