Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BDFA46246
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 15:19:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7B510E939;
	Wed, 26 Feb 2025 14:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rvSnPX9b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203C310E921
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 14:19:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 819B75C485E;
 Wed, 26 Feb 2025 14:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B451BC4CEED;
 Wed, 26 Feb 2025 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740579558;
 bh=osfiWDazaUUhIdjl88Wsp3F8y+CDBUMkVLAgYN+JnH8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=rvSnPX9b4IMPt5UqTG/4eLqsYj0/DwHMOjH/wsWG1mkivnH11hP3vfIYRmbBmOQsv
 tzc8GaFi47nXAyQpnqx6aAoPF/83mj8EbSb4en4kQqCXwgFKeyP794jjKWKh3z+ZtA
 erhKBs84jLaPk5oC8WyyfyeJ9oPRc7s/7GrtBGhamZfV9sSGmLFIe0k9AbT09dkgEP
 PTZ738Zh9a1uuFYuygsZVN4c5fgpkvK8cdzwvG6mAODGmhlP95s61WOeu5Yhm4euoB
 WzwrRbVcv/VZlk6cNLjaKMEtIon54RdGeyaHtCD2CyvdIbtBgKJOsr+B9kewD0ABlO
 xiHvI9C4Rg4KA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id A4A15C021B8;
 Wed, 26 Feb 2025 14:19:18 +0000 (UTC)
From: Maud Spierings via B4 Relay
 <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Wed, 26 Feb 2025 15:19:14 +0100
Subject: [PATCH v2 03/12] dt-bindings: connector: Add the GOcontroll
 Moduline module slot bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-initial_display-v2-3-23fafa130817@gocontroll.com>
References: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com>
In-Reply-To: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740579556; l=5048;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=pJTRryEUH61y/AD454hzp/uuXsK9vkVHu0FC9+9tIo4=;
 b=5Vy65hAOZ6+zDffYGJ4I89iOR6gkn9v6VIpxtfvaD3g4iEr4vK6fOm3hDLEHBc73H+EZYNOzC
 B4UQQjssmy/DnyeOH0kqf0Lwj/p2P6Svkw30uRwwBAvZPQG4emMmWoa
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
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
Reply-To: maudspierings@gocontroll.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maud Spierings <maudspierings@gocontroll.com>

Add the bindings that describe a GOcontroll Moduline module slot. This
slot provides all the interfaces to interface with a Moduline compatible
IO module. The actual module is not reasonable to describe as it can be
swapped at will, with this connector the driver will be able to probe
for a module on boot.

The connector consists of 2 parts, one part for interfacing with the SoC
and main board, the other part has 13 IO channels for the module to
interact with the outside world. The functions of these IO channels are
determined by the type of module in the slot. The IO on the SoC side is
as follows:

 - a 3v3 supply, this tends to be the logic level of the module and its
   microcontroller
 - a 5v0 supply, this can be used to power low power peripherals on the
   module
 - a 6v-8v supply, this can be used for high power peripherals on the
   module
 - a 6v-30v supply, this tends to be a dirty supply that comes from the
   controller supply after some circuit protection, or is the same as
   the 6v-8v supply.
 - an SPI bus which carries the communication between the SoC and the
   microcontroller on the module.
 - an I2C bus shared between the SoC and all module slots which can
   carry direct module-to-module communication.
 - a reset line
 - an interrupt line that indicates a clear to transmit signal
 - a sync line shared between the SoC and all module slots which could
   be used to synchronize modules for time sensitive IO spread across
   modules.
 - a SMBus alert line that is shared between the modules but is not
   connected to the SoC so that is ignored.

A slot-number property is used to identify the physical location of a
module slot. Without it, it would be impossible to identify which module
to control if there are multiple of one type, to address the desired IO.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 .../connector/gocontroll,moduline-module-slot.yaml | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/gocontroll,moduline-module-slot.yaml b/Documentation/devicetree/bindings/connector/gocontroll,moduline-module-slot.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a16ae2762d160180d5b163e20f5294235e65053b
--- /dev/null
+++ b/Documentation/devicetree/bindings/connector/gocontroll,moduline-module-slot.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/connector/gocontroll,moduline-module-slot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GOcontroll Moduline Module slot
+
+maintainers:
+  - Maud Spierings <maudspierings@gocontroll.com>
+
+description:
+  The GOcontroll Moduline module slot represents a connector that fullfills the
+  Moduline slot specification, and can thus house any IO module that is also
+  built to this spec.
+
+properties:
+  compatible:
+    const: gocontroll,moduline-module-slot
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: indicates readiness, high means busy.
+    maxItems: 1
+  reset-gpios:
+    description: resets the module, active low.
+    maxItems: 1
+  sync-gpios:
+    description: sync line between all module slots.
+    maxItems: 1
+
+  vdd-supply:
+    description: low power 3v3 supply generally for the microcontroller.
+  vddp-supply:
+    description: medium power 5v0 supply for on module low power peripherals.
+  vddhpp-supply:
+    description: high power 6v-8v supply for on module high power peripherals.
+  power-supply:
+    description: high power 6v-30v supply for high power module circuits.
+
+  i2c-bus:
+    description: i2c bus shared between module slots and the SoC
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  slot-number:
+    description:
+      The number of the module slot representing the location of on the pcb.
+      This enables access to the modules based on slot location.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  spi-max-frequency: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - interrupts
+  - sync-gpios
+  - i2c-bus
+  - slot-number
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        connector@0 {
+            reg = <0>;
+            compatible = "gocontroll,moduline-module-slot";
+            reset-gpios = <&gpio5 10 GPIO_ACTIVE_LOW>;
+            sync-gpios = <&gpio4 16 GPIO_ACTIVE_HIGH>;
+            interrupt-parent = <&gpio4>;
+            interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
+            vdd-supply = <&reg_3v3_per>;
+            vddp-supply = <&reg_5v0>;
+            vddhpp-supply = <&reg_6v4>;
+            i2c-bus = <&i2c2>;
+            slot-number = <1>;
+        };
+    };

-- 
2.48.1


