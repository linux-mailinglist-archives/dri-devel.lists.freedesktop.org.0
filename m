Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D3BABB2E0
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 03:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F1810E1C5;
	Mon, 19 May 2025 01:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="Cu7w6eEL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815C410E1C5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 01:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1747618169;
 bh=whewIUEcEwGlPeup0WNp16DySNOzBd3hFitsiugqEFs=;
 h=From:To:Subject:Date:Message-Id;
 b=Cu7w6eELYHHNqKwaQDJxRVPcssi0KNjgEvHvchK8qWnEfvZ7VwuYA4SLfyQPr6uAX
 7t7w2L4QwKf4dsryWvl18/Iry0A8DTljNzQ9Cx0ZY6Rtf855DypbCh1saW0LLLc1oC
 r6Ons/Ersg4bVQUTVK4mazioAwvk7UBmb6J3uTe8=
X-QQ-mid: zesmtpgz7t1747618034t12c12d6d
X-QQ-Originating-IP: aIhq4+nN4m30l1xRrtCIQngtpDXatCxQn7fmSQ4izEE=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 19 May 2025 09:27:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15678558785414033546
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] dt-bindings: display: rockchip: Convert
 cdn-dp-rockchip.txt to yaml
Date: Mon, 19 May 2025 09:26:32 +0800
Message-Id: <20250519012632.94-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519012632.94-1-kernel@airkyi.com>
References: <20250519012632.94-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NY6OurWw+pG/TGDLtuPl4DPP6ccBt5misze7DqSCVmXi8WZ06J56hoJj
 zHc8Fjg4AG39klDObpubRYl07WpX3PasoMQegLifpzCXJMcxJPIZikMy2f/bobD5VAvqLqW
 oJfpp67vgb4XxaZu131HwxRvsNET8LO3siAFhjBnKiCMs+oJ3+dES8DJfSO3aTgtEMTNCUb
 cj5Kgs5wAR23MUZfbyXLMWyhg7554P3W1fcVXHJz1m79H0i9YJ7GaC9fM6LWgUrpsCTLlUU
 tM0kLJKaPmbriVzAbM4jizRCKiYfz8G56Vj6JA9FY6Dr+dWdGrz2PM4p5Kaw0TyfBNnPghW
 ZvQ2kUvbPo0P0zJvWF0mSmJFY3GJYfQXJIhx3i9Lq4Tk/7pHp0DsyC43j4E4Vt3wCk/tOuH
 IbwlRElJCVYdxEJMD63b27pWu6fHfob/4w69ExjfU0qVazLCo4bBeeWkh8UPGwcAK5uOiZx
 2/F+egR83bjEjal99YpQ+qZHm3Ub+6+8ZnHDPQD70R/odfclNlmLSwcokwbs6geFwvwHdFJ
 xeuu0zJicFIahSXppFQLdPlgEFrwQPR8c/j1Q3uRu0sqceSQQsAj4jFYw/dLsB6jUpbt93w
 N6FQM3vhzR5coTANh16BIeaOup97n/gXO3Pkw4Q4IpJQs46ijB65UGGQbEC8E3WhflEaTYB
 nvUCzM3iYqp0LYn1cXgOArFrThbFzmEP+3c+8slpx+1rHIFAgSJ/YfdsZK4bHcK2qqstGQP
 +RUJTCQl0u8JNHgUVppSd4JrrNCybDk8Qe4f5peG9RuC9zdgDfeZ/gQk+EsQbmyHsPdbQDe
 5u7W+osPszsOZRSuiufsz1B11TXxHlOreBzYAfxK2HzqqriVJnp6rU1L8geScOLfPknlvw7
 RXUpu70aVUnYiMcwwuBuhotWHoycazWSiK9eYVsrj10B3mCQ17joXlqpfioF04oA7bK4wHb
 /Qyq73Fg60uiZZadfDMzCzEiN2AE4ild0Rxo2nbNmsYN59sZj5JzDQQULitg8qRM3EpwWYG
 6m554RqWKPE6+BmWkZOhZplXipg4PSeNiiI/Z9YaJJwYUdO1uBB50k7VMfIH0=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Convert cdn-dp-rockchip.txt to yaml.

Add port@1 which represents the CDN DP output to keep the same style
as the other display interfaces.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

Changes in v4:
- Add commit about port@1 node

Changes in v3:
- Add more description about phy/extcon
- Fix some coding style

Changes in v2:
- Rename binding file name to match compatible
- Add more description about grf/phy/extcon
- Fix coding style

 .../display/rockchip/cdn-dp-rockchip.txt      |  74 --------
 .../rockchip/rockchip,rk3399-cdn-dp.yaml      | 165 ++++++++++++++++++
 2 files changed, 165 insertions(+), 74 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml

diff --git a/Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
deleted file mode 100644
index 8df7d2e393d6..000000000000
--- a/Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
+++ /dev/null
@@ -1,74 +0,0 @@
-Rockchip RK3399 specific extensions to the cdn Display Port
-================================
-
-Required properties:
-- compatible: must be "rockchip,rk3399-cdn-dp"
-
-- reg: physical base address of the controller and length
-
-- clocks: from common clock binding: handle to dp clock.
-
-- clock-names: from common clock binding:
-	       Required elements: "core-clk" "pclk" "spdif" "grf"
-
-- resets : a list of phandle + reset specifier pairs
-- reset-names : string of reset names
-		Required elements: "apb", "core", "dptx", "spdif"
-- power-domains : power-domain property defined with a phandle
-		  to respective power domain.
-- assigned-clocks: main clock, should be <&cru SCLK_DP_CORE>
-- assigned-clock-rates : the DP core clk frequency, shall be: 100000000
-
-- rockchip,grf: this soc should set GRF regs, so need get grf here.
-
-- ports: contain a port nodes with endpoint definitions as defined in
-	 Documentation/devicetree/bindings/media/video-interfaces.txt.
-	 contained 2 endpoints, connecting to the output of vop.
-
-- phys: from general PHY binding: the phandle for the PHY device.
-
-- extcon: extcon specifier for the Power Delivery
-
-- #sound-dai-cells = it must be 1 if your system is using 2 DAIs: I2S, SPDIF
-
--------------------------------------------------------------------------------
-
-Example:
-	cdn_dp: dp@fec00000 {
-		compatible = "rockchip,rk3399-cdn-dp";
-		reg = <0x0 0xfec00000 0x0 0x100000>;
-		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru SCLK_DP_CORE>, <&cru PCLK_DP_CTRL>,
-			 <&cru SCLK_SPDIF_REC_DPTX>, <&cru PCLK_VIO_GRF>;
-		clock-names = "core-clk", "pclk", "spdif", "grf";
-		assigned-clocks = <&cru SCLK_DP_CORE>;
-		assigned-clock-rates = <100000000>;
-		power-domains = <&power RK3399_PD_HDCP>;
-		phys = <&tcphy0_dp>, <&tcphy1_dp>;
-		resets = <&cru SRST_DPTX_SPDIF_REC>;
-		reset-names = "spdif";
-		extcon = <&fusb0>, <&fusb1>;
-		rockchip,grf = <&grf>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		#sound-dai-cells = <1>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			dp_in: port {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				dp_in_vopb: endpoint@0 {
-					reg = <0>;
-					remote-endpoint = <&vopb_out_dp>;
-				};
-
-				dp_in_vopl: endpoint@1 {
-					reg = <1>;
-					remote-endpoint = <&vopl_out_dp>;
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml
new file mode 100644
index 000000000000..7c2225204de2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml
@@ -0,0 +1,165 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK3399 specific extensions to the CDN Display Port
+
+maintainers:
+  - Andy Yan <andy.yan@rock-chip.com>
+  - Heiko Stuebner <heiko@sntech.de>
+  - Sandy Huang <hjc@rock-chips.com>
+
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: rockchip,rk3399-cdn-dp
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: DP core work clock
+      - description: APB clock
+      - description: SPDIF interface clock
+      - description: GRF clock
+
+  clock-names:
+    items:
+      - const: core-clk
+      - const: pclk
+      - const: spdif
+      - const: grf
+
+  extcon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      maxItems: 1
+    maxItems: 2
+    description:
+      List of phandle to the extcon device providing the cable state for the DP PHY.
+
+  interrupts:
+    maxItems: 1
+
+  phys:
+    items:
+      maxItems: 1
+    maxItems: 2
+    description: |
+      List of phandle to the PHY device for DP output.
+      RK3399 have two DP-TPYEC PHY, specifying one PHY which want to use,
+      or specify two PHYs here to let the driver determine which PHY to use.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input of the CDN DP
+        properties:
+          endpoint@0:
+            description: Connection to the VOPB
+          endpoint@1:
+            description: Connection to the VOPL
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output of the CDN DP
+
+    required:
+      - port@0
+      - port@1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 4
+
+  reset-names:
+    items:
+      - const: spdif
+      - const: dptx
+      - const: apb
+      - const: core
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to GRF register to control HPD.
+
+  "#sound-dai-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - phys
+  - ports
+  - resets
+  - reset-names
+  - rockchip,grf
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3399-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3399-power.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dp@fec00000 {
+            compatible = "rockchip,rk3399-cdn-dp";
+            reg = <0x0 0xfec00000 0x0 0x100000>;
+            assigned-clocks = <&cru SCLK_DP_CORE>;
+            assigned-clock-rates = <100000000>;
+            interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cru SCLK_DP_CORE>, <&cru PCLK_DP_CTRL>, <&cru SCLK_SPDIF_REC_DPTX>,
+                    <&cru PCLK_VIO_GRF>;
+            clock-names = "core-clk", "pclk", "spdif", "grf";
+            power-domains = <&power RK3399_PD_HDCP>;
+            phys = <&tcphy0_dp>, <&tcphy1_dp>;
+            resets = <&cru SRST_DPTX_SPDIF_REC>, <&cru SRST_P_UPHY0_DPTX>,
+                    <&cru SRST_P_UPHY0_APB>, <&cru SRST_DP_CORE>;
+            reset-names = "spdif", "dptx", "apb", "core";
+            rockchip,grf = <&grf>;
+            #sound-dai-cells = <1>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                dp_in: port@0 {
+                    reg = <0>;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    dp_in_vopb: endpoint@0 {
+                        reg = <0>;
+                        remote-endpoint = <&vopb_out_dp>;
+                    };
+
+                    dp_in_vopl: endpoint@1 {
+                        reg = <1>;
+                        remote-endpoint = <&vopl_out_dp>;
+                    };
+                };
+
+                dp_out: port@1 {
+                    reg = <1>;
+                };
+            };
+        };
+    };
--
2.49.0

