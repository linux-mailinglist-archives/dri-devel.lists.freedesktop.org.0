Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9331E5970
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34EB6E46F;
	Thu, 28 May 2020 07:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D696E33E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:49:27 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id BD340581FF8;
 Wed, 27 May 2020 11:49:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:49:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=MU7eZVtnDwybr
 +mHo1iyU4jXWJ/3SJl/BtiKpmw68Lk=; b=EE/c7zDHdHbAwJhRUOCHpCKU2+DK/
 BSkkEOZNMggY8T+mYE4d5+cIimjEOhtrXZ9CUS3PUZC7MAejqPcwl4mpa6ghq6X9
 OjLd2IogFa2aLMD/SgIE+oeJLh6kpgt38UgFwZaKQaUq/V3JcGKNJck8KyiMS9ql
 +qd2a5SekYo66altUDyKh6KX1i+C8gl29lJVNDIy+yphfda7dq6gCzanXQXAIw6k
 NVURl1B5a37TrYDujBmsjWNPdptLtUCF/sSOdy75079Zk6pXSZrZ0HYK7j6xBnNB
 MHvJ9KJJERwUHKOe6RIIRIC32H44wNr63Q5WaaZHneNRTKQeu5kd76zpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=MU7eZVtnDwybr+mHo1iyU4jXWJ/3SJl/BtiKpmw68Lk=; b=W4raxyAC
 LReBJcTWUMpoD/HWWsvJT7zhWaNB3yQgZSk+thuFpbLKXMUrLihiretPZtmXn/sW
 KMj2uM8zTr7mA8nkblqv1NCCKaf9YCHZ/rp2l80Q42JBTwzfstBnelf533dkkxeJ
 9svxdGqAXsji6fd9SMt8RNNQMNN6rOvxuRQFv/ESnf/Pz91kQodncKjasnMwy0Zg
 RDypO9XtglOzcOcRJZERQbQY4YFmJ15+EvjHxW6inFb06booKJp92pVSxOY+3lTr
 s9m6raqDqhOLkkM+hVMG1ca9KyCq8DHT0hklY5XUCmuu7E2uI9qeZSe2eLpDxoNF
 TISJa9B+60jkrA==
X-ME-Sender: <xms:BozOXoZ6aCXer017wVFrrSAo_TEtSeC6su9rz4tAGJH9eu6hu5yJ2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekkeekleelvdehgeehieejtefhgfdtveetudegffeikedvuddvudekjeet
 veefnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghdpghhithhhuhgsrdgtoh
 hmpdhfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeltddrkeelrdeikedrjeeinecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimh
 gvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:BozOXjarDjvlCd-JDf2qd-VL5rh_pDkrl-uVYshE07efLhG-r1a1bw>
 <xmx:BozOXi_COfTNDhQRdzd17S4Ki8xItQzmNZJiLNiniYqNL32FzmIC9g>
 <xmx:BozOXipUReu7kIVLmPZToRG-c63EGPDZ6Z8l_H4KWndHjRaK164yxw>
 <xmx:BozOXm3TX0cogN5Jp4BTUpS69JffuLUX11qfMcu5YX1xbNXZyFkFBA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3A8213280060;
 Wed, 27 May 2020 11:49:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 006/105] dt-bindings: display: Convert VC4 bindings to
 schemas
Date: Wed, 27 May 2020 17:47:36 +0200
Message-Id: <2dc6384c945c7d35ab4f75464d3a77046dc125b3.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The BCM283x SoCs have a display pipeline composed of several controllers
with device tree bindings that are supported by Linux.

Now that we have the DT validation in place, let's split into separate
files and convert the device tree bindings for those controllers to
schemas.

This is just a 1:1 conversion though, and some bindings were incomplete so
it results in example validation warnings that are going to be addressed in
the following patches.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt              | 174 +------------------------------------------------------------------------
 Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml         |  66 +++++++++++++++++++++++++++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml        |  73 ++++++++++++++++++++++++++++++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml        |  75 +++++++++++++++++++++++++++++++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml         |  37 +++++++++++++++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml |  40 +++++++++++++++++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml         |  37 +++++++++++++++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml         |  42 +++++++++++++++++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml         |  34 ++++++++++++++-
 Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml         |  44 ++++++++++++++++++-
 MAINTAINERS                                                             |   2 +-
 11 files changed, 449 insertions(+), 175 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt b/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
deleted file mode 100644
index 26649b4c4dd8..000000000000
--- a/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
+++ /dev/null
@@ -1,174 +0,0 @@
-Broadcom VC4 (VideoCore4) GPU
-
-The VC4 device present on the Raspberry Pi includes a display system
-with HDMI output and the HVS (Hardware Video Scaler) for compositing
-display planes.
-
-Required properties for VC4:
-- compatible:	Should be "brcm,bcm2835-vc4" or "brcm,cygnus-vc4"
-
-Required properties for Pixel Valve:
-- compatible:	Should be one of "brcm,bcm2835-pixelvalve0",
-		  "brcm,bcm2835-pixelvalve1", or "brcm,bcm2835-pixelvalve2"
-- reg:		Physical base address and length of the PV's registers
-- interrupts:	The interrupt number
-		  See bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
-
-Required properties for HVS:
-- compatible:	Should be "brcm,bcm2835-hvs"
-- reg:		Physical base address and length of the HVS's registers
-- interrupts:	The interrupt number
-		  See bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
-
-Required properties for HDMI
-- compatible:	Should be "brcm,bcm2835-hdmi"
-- reg:		Physical base address and length of the two register ranges
-		  ("HDMI" and "HD", in that order)
-- interrupts:	The interrupt numbers
-		  See bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
-- ddc:		phandle of the I2C controller used for DDC EDID probing
-- clocks:	a) hdmi: The HDMI state machine clock
-		b) pixel: The pixel clock.
-
-Optional properties for HDMI:
-- hpd-gpios:	The GPIO pin for HDMI hotplug detect (if it doesn't appear
-		  as an interrupt/status bit in the HDMI controller
-		  itself).  See bindings/pinctrl/brcm,bcm2835-gpio.txt
-- dmas:		Should contain one entry pointing to the DMA channel used to
-		transfer audio data
-- dma-names:	Should contain "audio-rx"
-
-Required properties for DPI:
-- compatible:	Should be "brcm,bcm2835-dpi"
-- reg:		Physical base address and length of the registers
-- clocks:	a) core: The core clock the unit runs on
-		b) pixel: The pixel clock that feeds the pixelvalve
-- port:		Port node with a single endpoint connecting to the panel
-		  device, as defined in [1]
-
-Required properties for VEC:
-- compatible:	Should be "brcm,bcm2835-vec"
-- reg:		Physical base address and length of the registers
-- clocks:	The core clock the unit runs on
-- interrupts:	The interrupt number
-		  See bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
-
-Required properties for V3D:
-- compatible:	Should be "brcm,bcm2835-v3d" or "brcm,cygnus-v3d"
-- reg:		Physical base address and length of the V3D's registers
-- interrupts:	The interrupt number
-		  See bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
-
-Optional properties for V3D:
-- clocks:	The clock the unit runs on
-
-Required properties for DSI:
-- compatible:	Should be "brcm,bcm2835-dsi0" or "brcm,bcm2835-dsi1"
-- reg:		Physical base address and length of the DSI block's registers
-- interrupts:	The interrupt number
-		  See bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
-- clocks:	a) phy: The DSI PLL clock feeding the DSI analog PHY
-		b) escape: The DSI ESC clock from CPRMAN
-		c) pixel: The DSI pixel clock from CPRMAN
-- clock-output-names:
-		The 3 clocks output from the DSI analog PHY: dsi[01]_byte,
-		dsi[01]_ddr2, and dsi[01]_ddr
-
-Required properties for the TXP (writeback) block:
-- compatible:	Should be "brcm,bcm2835-txp"
-- reg:		Physical base address and length of the TXP block's registers
-- interrupts:	The interrupt number
-		  See bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
-
-[1] Documentation/devicetree/bindings/media/video-interfaces.txt
-
-Example:
-pixelvalve@7e807000 {
-	compatible = "brcm,bcm2835-pixelvalve2";
-	reg = <0x7e807000 0x100>;
-	interrupts = <2 10>; /* pixelvalve */
-};
-
-hvs@7e400000 {
-	compatible = "brcm,bcm2835-hvs";
-	reg = <0x7e400000 0x6000>;
-	interrupts = <2 1>;
-};
-
-hdmi: hdmi@7e902000 {
-	compatible = "brcm,bcm2835-hdmi";
-	reg = <0x7e902000 0x600>,
-	      <0x7e808000 0x100>;
-	interrupts = <2 8>, <2 9>;
-	ddc = <&i2c2>;
-	hpd-gpios = <&gpio 46 GPIO_ACTIVE_HIGH>;
-	clocks = <&clocks BCM2835_PLLH_PIX>,
-		 <&clocks BCM2835_CLOCK_HSM>;
-	clock-names = "pixel", "hdmi";
-};
-
-dpi: dpi@7e208000 {
-	compatible = "brcm,bcm2835-dpi";
-	reg = <0x7e208000 0x8c>;
-	clocks = <&clocks BCM2835_CLOCK_VPU>,
-	         <&clocks BCM2835_CLOCK_DPI>;
-	clock-names = "core", "pixel";
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	port {
-		dpi_out: endpoint@0 {
-			remote-endpoint = <&panel_in>;
-		};
-	};
-};
-
-dsi1: dsi@7e700000 {
-	compatible = "brcm,bcm2835-dsi1";
-	reg = <0x7e700000 0x8c>;
-	interrupts = <2 12>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-	#clock-cells = <1>;
-
-	clocks = <&clocks BCM2835_PLLD_DSI1>,
-		 <&clocks BCM2835_CLOCK_DSI1E>,
-		 <&clocks BCM2835_CLOCK_DSI1P>;
-	clock-names = "phy", "escape", "pixel";
-
-	clock-output-names = "dsi1_byte", "dsi1_ddr2", "dsi1_ddr";
-
-	pitouchscreen: panel@0 {
-		compatible = "raspberrypi,touchscreen";
-		reg = <0>;
-
-		<...>
-	};
-};
-
-vec: vec@7e806000 {
-	compatible = "brcm,bcm2835-vec";
-	reg = <0x7e806000 0x1000>;
-	clocks = <&clocks BCM2835_CLOCK_VEC>;
-	interrupts = <2 27>;
-};
-
-v3d: v3d@7ec00000 {
-	compatible = "brcm,bcm2835-v3d";
-	reg = <0x7ec00000 0x1000>;
-	interrupts = <1 10>;
-};
-
-vc4: gpu {
-	compatible = "brcm,bcm2835-vc4";
-};
-
-panel: panel {
-	compatible = "ontat,yx700wv03", "simple-panel";
-
-	port {
-		panel_in: endpoint {
-			remote-endpoint = <&dpi_out>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
new file mode 100644
index 000000000000..288494b70e82
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/brcm,bcm2835-dpi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom VC4 (VideoCore4) DPI Controller
+
+maintainers:
+  - Eric Anholt <eric@anholt.net>
+
+properties:
+  compatible:
+    const: brcm,bcm2835-dpi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The core clock the unit runs on
+      - description: The pixel clock that feeds the pixelvalve
+
+  port:
+    type: object
+    description: >
+      Port node with a single endpoint connecting to the panel, as
+      defined in Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/bcm2835.h>
+
+    panel: panel {
+        compatible = "ontat,yx700wv03", "simple-panel";
+
+        port {
+            panel_in: endpoint {
+                remote-endpoint = <&dpi_out>;
+            };
+        };
+    };
+
+    dpi: dpi@7e208000 {
+        compatible = "brcm,bcm2835-dpi";
+        reg = <0x7e208000 0x8c>;
+        clocks = <&clocks BCM2835_CLOCK_VPU>,
+                 <&clocks BCM2835_CLOCK_DPI>;
+        clock-names = "core", "pixel";
+
+        port {
+            dpi_out: endpoint {
+                remote-endpoint = <&panel_in>;
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml
new file mode 100644
index 000000000000..3887675f844e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/brcm,bcm2835-dsi0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom VC4 (VideoCore4) DSI Controller
+
+maintainers:
+  - Eric Anholt <eric@anholt.net>
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm2835-dsi0
+      - brcm,bcm2835-dsi1
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The DSI PLL clock feeding the DSI analog PHY
+      - description: The DSI ESC clock
+      - description: The DSI pixel clock
+
+  clock-output-names: true
+    # FIXME: The meta-schemas don't seem to allow it for now
+    # items:
+    #   - description: The DSI byte clock for the PHY
+    #   - description: The DSI DDR2 clock
+    #   - description: The DSI DDR clock
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-output-names
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/bcm2835.h>
+
+    dsi1: dsi@7e700000 {
+        compatible = "brcm,bcm2835-dsi1";
+        reg = <0x7e700000 0x8c>;
+        interrupts = <2 12>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #clock-cells = <1>;
+
+        clocks = <&clocks BCM2835_PLLD_DSI1>,
+                 <&clocks BCM2835_CLOCK_DSI1E>,
+                 <&clocks BCM2835_CLOCK_DSI1P>;
+        clock-names = "phy", "escape", "pixel";
+
+        clock-output-names = "dsi1_byte", "dsi1_ddr2", "dsi1_ddr";
+
+        pitouchscreen: panel@0 {
+            compatible = "raspberrypi,touchscreen";
+            reg = <0>;
+
+            /* ... */
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml
new file mode 100644
index 000000000000..834cc5f1c254
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/brcm,bcm2835-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom VC4 (VideoCore4) HDMI Controller
+
+maintainers:
+  - Eric Anholt <eric@anholt.net>
+
+properties:
+  compatible:
+    const: brcm,bcm2835-hdmi
+
+  reg:
+    items:
+      - description: HDMI register range
+      - description: HD register range
+
+  interrupts:
+    minItems: 2
+
+  clocks:
+    items:
+      - description: The HDMI state machine clock
+      - description: The pixel clock
+
+  ddc:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/phandle
+    description: >
+      Phandle of the I2C controller used for DDC EDID probing
+
+  hpd-gpios:
+    description: >
+      The GPIO pin for the HDMI hotplug detect (if it doesn't appear
+      as an interrupt/status bit in the HDMI controller itself)
+
+  dmas:
+    maxItems: 1
+    description: >
+      Should contain one entry pointing to the DMA channel used to
+      transfer audio data.
+
+  dma-names:
+    const: audio-rx
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - ddc
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/bcm2835.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    hdmi: hdmi@7e902000 {
+        compatible = "brcm,bcm2835-hdmi";
+        reg = <0x7e902000 0x600>,
+              <0x7e808000 0x100>;
+        interrupts = <2 8>, <2 9>;
+        ddc = <&i2c2>;
+        hpd-gpios = <&gpio 46 GPIO_ACTIVE_HIGH>;
+        clocks = <&clocks BCM2835_PLLH_PIX>,
+                 <&clocks BCM2835_CLOCK_HSM>;
+        clock-names = "pixel", "hdmi";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
new file mode 100644
index 000000000000..02410f8d6d49
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom VC4 (VideoCore4) Hardware Video Scaler
+
+maintainers:
+  - Eric Anholt <eric@anholt.net>
+
+properties:
+  compatible:
+    const: brcm,bcm2835-hvs
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    hvs@7e400000 {
+        compatible = "brcm,bcm2835-hvs";
+        reg = <0x7e400000 0x6000>;
+        interrupts = <2 1>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml
new file mode 100644
index 000000000000..e60791db1fa1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/brcm,bcm2835-pixelvalve0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom VC4 (VideoCore4) PixelValve
+
+maintainers:
+  - Eric Anholt <eric@anholt.net>
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm2835-pixelvalve0
+      - brcm,bcm2835-pixelvalve1
+      - brcm,bcm2835-pixelvalve2
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    pixelvalve@7e807000 {
+        compatible = "brcm,bcm2835-pixelvalve2";
+        reg = <0x7e807000 0x100>;
+        interrupts = <2 10>; /* pixelvalve */
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml
new file mode 100644
index 000000000000..bb186197e471
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/brcm,bcm2835-txp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom VC4 (VideoCore4) TXP (writeback) Controller
+
+maintainers:
+  - Eric Anholt <eric@anholt.net>
+
+properties:
+  compatible:
+    const: brcm,bcm2835-txp
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    txp: txp@7e004000 {
+        compatible = "brcm,bcm2835-txp";
+        reg = <0x7e004000 0x20>;
+        interrupts = <1 11>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml
new file mode 100644
index 000000000000..8a73780f573d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/brcm,bcm2835-v3d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom VC4 (VideoCore4) V3D GPU
+
+maintainers:
+  - Eric Anholt <eric@anholt.net>
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm2835-v3d
+      - brcm,cygnus-v3d
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    v3d: v3d@7ec00000 {
+        compatible = "brcm,bcm2835-v3d";
+        reg = <0x7ec00000 0x1000>;
+        interrupts = <1 10>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
new file mode 100644
index 000000000000..0dcf0c397375
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/brcm,bcm2835-vc4.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom VC4 (VideoCore4) GPU
+
+maintainers:
+  - Eric Anholt <eric@anholt.net>
+
+description: >
+  The VC4 device present on the Raspberry Pi includes a display system
+  with HDMI output and the HVS (Hardware Video Scaler) for compositing
+  display planes.
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm2835-vc4
+      - brcm,cygnus-vc4
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    vc4: gpu {
+        compatible = "brcm,bcm2835-vc4";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml
new file mode 100644
index 000000000000..d900cc57b4ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/brcm,bcm2835-vec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom VC4 (VideoCore4) VEC
+
+maintainers:
+  - Eric Anholt <eric@anholt.net>
+
+properties:
+  compatible:
+    const: brcm,bcm2835-vec
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/bcm2835.h>
+
+    vec: vec@7e806000 {
+        compatible = "brcm,bcm2835-vec";
+        reg = <0x7e806000 0x1000>;
+        clocks = <&clocks BCM2835_CLOCK_VEC>;
+        interrupts = <2 27>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a003f310574..8d17e2e402fa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5818,7 +5818,7 @@ M:	Eric Anholt <eric@anholt.net>
 S:	Supported
 T:	git git://github.com/anholt/linux
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-F:	Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
+F:	Documentation/devicetree/bindings/display/brcm,bcm2835-*.yaml
 F:	drivers/gpu/drm/vc4/
 F:	include/uapi/drm/vc4_drm.h
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
