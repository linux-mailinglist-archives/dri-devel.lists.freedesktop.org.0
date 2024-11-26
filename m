Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2349D9E40
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 21:12:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E310110E351;
	Tue, 26 Nov 2024 20:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="TIse+J4v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18B010E351
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 20:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wsbRQVBr4grxem+kWM+KVHsuHmj5SUDK1hWsjsF/mJ8=; b=TIse+J4vRQivJ1hdQOGWhEPhAX
 cRuoadoFKqAkzAtKinGHpjplahcMLkmpmUB4Yjx9J/TELptsCS08+tC+FJK7DT95VXXY4JJzye6f7
 XcMUhR6GI9Ryyksuiwp/hacIswg2S2L2B42m+kNlBbkz+R+nAQ+zBxmt5LWEEbSvL9WxSdnUZn8wh
 oLmnqKXHE4QB9RRX3ZE6fIX2o7Bjvteqh8Ud47czPMcVHSR0+ZNJ2OXCajDgXi+SygjwJp50ohdOQ
 GKrrUk4wm/+KcCHoq6hcJfuhdEOZlKLfmd/PQua5OzcPV61SS6VF1wPW9ovLHLEM367gETGdalouE
 5DhsyNXQ==;
Received: from i5e86190f.versanet.de ([94.134.25.15] helo=phil..)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tG1uz-0002yD-Og; Tue, 26 Nov 2024 21:12:17 +0100
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
 quentin.schulz@cherry.de, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v2 2/3] dt-bindings: display: rockchip: Add schema for RK3588
 DW DSI2 controller
Date: Tue, 26 Nov 2024 21:12:12 +0100
Message-ID: <20241126201213.522753-3-heiko@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241126201213.522753-1-heiko@sntech.de>
References: <20241126201213.522753-1-heiko@sntech.de>
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
new Synopsis IP.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 .../rockchip/rockchip,rk3588-mipi-dsi2.yaml   | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml
new file mode 100644
index 000000000000..7c017e927223
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml
@@ -0,0 +1,119 @@
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
+        phys = <&mipidcphy0>;
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

