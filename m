Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB1E67A68B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 00:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF9589343;
	Tue, 24 Jan 2023 23:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3790789343
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 23:00:51 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 f88-20020a9d03e1000000b00684c4041ff1so10158741otf.8
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 15:00:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GI/5UOaSfmciN645orkiQBi7mLRaRF0ZS1ZUuYBdNvc=;
 b=pxCrrRXRfZ4sLFYfXSuKtFylsMNcpOMgQYtnB+ec8deYRjEUPSaJr8pl5yneifIrEq
 JGq3y1rwAvSOQ+jATci+32lnB+6wXiSpJePIDHOIdyRSQLdobAF5vA0kPmLlcmKvecs4
 IFPlAjfRRAZD11begv96s4kBypcqyevgq4UoQ2mhz3hEinI6lHWGtntX6nuITvXvnmCc
 +7pizwGQ/B1glco034plI2ov64DIF6FcLbBqtQDU4NPaiA9oURdNbYmxJdcV5QL2rUGW
 wYC7BycmGQw1Is71BCiS6EOe7JE+Py57xL+rFEEdK7tulZdIv62rrZ0eoh7w3q7m4arO
 1aYA==
X-Gm-Message-State: AFqh2krtjQk823Ql8n0d+2xNBsyytKgWatXXUq2FU6GUBl9uK1aGFfGb
 B+fnTx1hRxprOgZBpEk0Cw==
X-Google-Smtp-Source: AMrXdXtwZAvSnvJGaUSS3u1UoHFrxbCEGZ5ra6dbyH4du4dP2dJIPhqJdNtyQ1xoNiu1fbBJcFGzZA==
X-Received: by 2002:a9d:3c5:0:b0:684:d418:573b with SMTP id
 f63-20020a9d03c5000000b00684d418573bmr14339968otf.29.1674601250284; 
 Tue, 24 Jan 2023 15:00:50 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 f10-20020a9d2c0a000000b0068848d6b231sm322689otb.30.2023.01.24.15.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 15:00:49 -0800 (PST)
Received: (nullmailer pid 371735 invoked by uid 1000);
 Tue, 24 Jan 2023 23:00:48 -0000
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Sebastian Reichel <sre@kernel.org>,
 Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] dt-bindings: Add missing (unevaluated|additional)Properties
 on child node schemas
Date: Tue, 24 Jan 2023 17:00:48 -0600
Message-Id: <20230124230048.371144-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.0
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
Cc: linux-hwmon@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-pm@vger.kernel.org, openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just as unevaluatedProperties or additionalProperties are required at
the top level of schemas, they should (and will) also be required for
child node schemas. That ensures only documented properties are
present.

Add unevaluatedProperties or additionalProperties as appropriate, and
then add any missing properties flagged by the addition.

Signed-off-by: Rob Herring <robh@kernel.org>
---
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Bartosz Golaszewski <brgl@bgdev.pl>
To: Jean Delvare <jdelvare@suse.com>
To: Guenter Roeck <linux@roeck-us.net>
To: Thomas Gleixner <tglx@linutronix.de>
To: Marc Zyngier <maz@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Lee Jones <lee@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Sebastian Reichel <sre@kernel.org>
To: Mark Brown <broonie@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: openbmc@lists.ozlabs.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
Cc: linux-pm@vger.kernel.org
Cc: alsa-devel@alsa-project.org
Cc: linux-spi@vger.kernel.org
Cc: linux-usb@vger.kernel.org
---
 .../devicetree/bindings/arm/arm,vexpress-juno.yaml     |  1 +
 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml |  5 +++--
 .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml         |  4 ++++
 .../bindings/bus/allwinner,sun50i-a64-de2.yaml         |  1 +
 .../bindings/bus/allwinner,sun8i-a23-rsb.yaml          |  1 +
 .../bus/intel,ixp4xx-expansion-bus-controller.yaml     |  6 ++++++
 Documentation/devicetree/bindings/bus/palmbus.yaml     |  1 +
 .../devicetree/bindings/display/msm/qcom,mdss.yaml     |  5 +++++
 Documentation/devicetree/bindings/example-schema.yaml  |  2 ++
 .../devicetree/bindings/gpio/x-powers,axp209-gpio.yaml |  1 +
 .../devicetree/bindings/hwmon/adi,ltc2992.yaml         |  1 +
 .../bindings/interrupt-controller/arm,gic-v3.yaml      |  2 ++
 .../bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml      |  1 +
 .../devicetree/bindings/media/i2c/maxim,max9286.yaml   |  7 +++++++
 .../bindings/memory-controllers/arm,pl35x-smc.yaml     |  1 +
 .../bindings/memory-controllers/exynos-srom.yaml       |  1 +
 .../memory-controllers/nvidia,tegra124-emc.yaml        |  1 +
 .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml |  1 +
 .../devicetree/bindings/mfd/mediatek,mt6370.yaml       |  2 ++
 .../devicetree/bindings/mmc/aspeed,sdhci.yaml          |  1 +
 Documentation/devicetree/bindings/mtd/mtd.yaml         |  1 +
 .../devicetree/bindings/power/supply/ti,lp8727.yaml    |  1 +
 .../devicetree/bindings/soc/imx/fsl,imx93-src.yaml     |  3 ++-
 .../bindings/soc/microchip/atmel,at91rm9200-tcb.yaml   |  1 +
 Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml |  1 +
 .../devicetree/bindings/sound/marvell,mmp-sspa.yaml    |  1 +
 .../devicetree/bindings/sound/qcom,wcd934x.yaml        |  1 +
 .../devicetree/bindings/sound/samsung,odroid.yaml      |  2 ++
 .../devicetree/bindings/soundwire/qcom,soundwire.yaml  |  1 +
 .../bindings/spi/allwinner,sun4i-a10-spi.yaml          |  1 +
 .../bindings/spi/allwinner,sun6i-a31-spi.yaml          |  1 +
 .../devicetree/bindings/spi/spi-controller.yaml        |  1 +
 .../sram/allwinner,sun4i-a10-system-control.yaml       | 10 +++++-----
 Documentation/devicetree/bindings/sram/qcom,ocmem.yaml |  1 +
 .../devicetree/bindings/thermal/thermal-zones.yaml     |  1 +
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml   |  1 +
 36 files changed, 65 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
index eec190a96225..09c319f803ba 100644
--- a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
@@ -144,6 +144,7 @@ patternProperties:
       it is stricter and always has two compatibles.
     type: object
     $ref: '/schemas/simple-bus.yaml'
+    unevaluatedProperties: false
 
     properties:
       compatible:
diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index b369b374fc4a..39e3c248f5b7 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -30,6 +30,7 @@ properties:
 
   clocks:
     type: object
+    additionalProperties: false
 
     properties:
       compatible:
@@ -47,6 +48,7 @@ properties:
 
   reset:
     type: object
+    additionalProperties: false
 
     properties:
       compatible:
@@ -63,6 +65,7 @@ properties:
 
   pwm:
     type: object
+    additionalProperties: false
 
     properties:
       compatible:
@@ -76,8 +79,6 @@ properties:
       - compatible
       - "#pwm-cells"
 
-    additionalProperties: false
-
 required:
   - compatible
   - mboxes
diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
index 4a00593b9f7f..89191cfdf619 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
@@ -234,6 +234,7 @@ properties:
     patternProperties:
       "^[a-z0-9]+$":
         type: object
+        additionalProperties: false
 
         properties:
           clocks:
@@ -252,6 +253,9 @@ properties:
               for controlling a power-gate.
               See ../reset/reset.txt for more details.
 
+          power-domains:
+            maxItems: 1
+
           '#power-domain-cells':
             const: 0
             description: Must be 0.
diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
index 85c4a979aec4..9845a187bdf6 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
@@ -46,6 +46,7 @@ patternProperties:
   # All other properties should be child nodes with unit-address and 'reg'
   "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+$":
     type: object
+    additionalProperties: true
     properties:
       reg:
         maxItems: 1
diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml
index bee5f53f837f..24c939f59091 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml
@@ -45,6 +45,7 @@ properties:
 patternProperties:
   "^.*@[0-9a-fA-F]+$":
     type: object
+    additionalProperties: true
     properties:
       reg:
         maxItems: 1
diff --git a/Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.yaml b/Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.yaml
index 5fb4e7bfa4da..8073988937a8 100644
--- a/Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.yaml
+++ b/Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.yaml
@@ -56,8 +56,11 @@ patternProperties:
     description: Devices attached to chip selects are represented as
       subnodes.
     type: object
+    additionalProperties: true
 
     properties:
+      reg: true
+
       intel,ixp4xx-eb-t1:
         description: Address timing, extend address phase with n cycles.
         $ref: /schemas/types.yaml#/definitions/uint32
@@ -120,6 +123,9 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/uint32
         enum: [0, 1]
 
+    required:
+      - reg
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/bus/palmbus.yaml b/Documentation/devicetree/bindings/bus/palmbus.yaml
index 30fa6526cfc2..c36c1e92a573 100644
--- a/Documentation/devicetree/bindings/bus/palmbus.yaml
+++ b/Documentation/devicetree/bindings/bus/palmbus.yaml
@@ -36,6 +36,7 @@ patternProperties:
   # All other properties should be child nodes with unit-address and 'reg'
   "@[0-9a-f]+$":
     type: object
+    additionalProperties: true
     properties:
       reg:
         maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index ba0460268731..14380596027b 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -86,18 +86,21 @@ required:
 patternProperties:
   "^mdp@[1-9a-f][0-9a-f]*$":
     type: object
+    additionalProperties: true
     properties:
       compatible:
         const: qcom,mdp5
 
   "^dsi@[1-9a-f][0-9a-f]*$":
     type: object
+    additionalProperties: true
     properties:
       compatible:
         const: qcom,mdss-dsi-ctrl
 
   "^phy@[1-9a-f][0-9a-f]*$":
     type: object
+    additionalProperties: true
     properties:
       compatible:
         enum:
@@ -110,6 +113,7 @@ patternProperties:
 
   "^hdmi-phy@[1-9a-f][0-9a-f]*$":
     type: object
+    additionalProperties: true
     properties:
       compatible:
         enum:
@@ -121,6 +125,7 @@ patternProperties:
 
   "^hdmi-tx@[1-9a-f][0-9a-f]*$":
     type: object
+    additionalProperties: true
     properties:
       compatible:
         enum:
diff --git a/Documentation/devicetree/bindings/example-schema.yaml b/Documentation/devicetree/bindings/example-schema.yaml
index dfcf4c27d44a..f4eec4c42fb3 100644
--- a/Documentation/devicetree/bindings/example-schema.yaml
+++ b/Documentation/devicetree/bindings/example-schema.yaml
@@ -176,6 +176,8 @@ properties:
     description: Child nodes are just another property from a json-schema
       perspective.
     type: object  # DT nodes are json objects
+    # Child nodes also need additionalProperties or unevaluatedProperties
+    additionalProperties: false
     properties:
       vendor,a-child-node-property:
         description: Child node properties have all the same schema
diff --git a/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml b/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
index 7f26f6b1eea1..31906c253940 100644
--- a/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
@@ -35,6 +35,7 @@ properties:
 patternProperties:
   "^.*-pins?$":
     $ref: /schemas/pinctrl/pinmux-node.yaml#
+    additionalProperties: false
 
     properties:
       pins:
diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc2992.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc2992.yaml
index 64a8fcb7bc46..14142b59ee9c 100644
--- a/Documentation/devicetree/bindings/hwmon/adi,ltc2992.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adi,ltc2992.yaml
@@ -32,6 +32,7 @@ properties:
 patternProperties:
   "^channel@([0-1])$":
     type: object
+    additionalProperties: false
     description: |
       Represents the two supplies to be monitored.
 
diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
index 9f7d3e11aacb..2e72d0acc13d 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
@@ -133,12 +133,14 @@ properties:
 
   ppi-partitions:
     type: object
+    additionalProperties: false
     description:
       PPI affinity can be expressed as a single "ppi-partitions" node,
       containing a set of sub-nodes.
     patternProperties:
       "^interrupt-partition-[0-9]+$":
         type: object
+        additionalProperties: false
         properties:
           affinity:
             $ref: /schemas/types.yaml#/definitions/phandle-array
diff --git a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml
index 2193141dd7fd..d546b9e0744d 100644
--- a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml
@@ -72,6 +72,7 @@ patternProperties:
   '^mailbox@[0-9a-f]+$':
     description: Internal ipi mailbox node
     type: object  # DT nodes are json objects
+    additionalProperties: false
     properties:
       xlnx,ipi-id:
         description:
diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index 90315e217003..13681748559e 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -141,6 +141,7 @@ properties:
     patternProperties:
       "^i2c@[0-3]$":
         type: object
+        additionalProperties: false
         description: |
           Child node of the i2c bus multiplexer which represents a GMSL link.
           Each serializer device on the GMSL link remote end is represented with
@@ -152,6 +153,12 @@ properties:
             description: The index of the GMSL channel.
             maxItems: 1
 
+          '#address-cells':
+            const: 1
+
+          '#size-cells':
+            const: 0
+
         patternProperties:
           "^camera@[a-f0-9]+$":
             type: object
diff --git a/Documentation/devicetree/bindings/memory-controllers/arm,pl35x-smc.yaml b/Documentation/devicetree/bindings/memory-controllers/arm,pl35x-smc.yaml
index bd23257fe021..6d3962a17e49 100644
--- a/Documentation/devicetree/bindings/memory-controllers/arm,pl35x-smc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/arm,pl35x-smc.yaml
@@ -73,6 +73,7 @@ properties:
 patternProperties:
   "@[0-7],[a-f0-9]+$":
     type: object
+    additionalProperties: true
     description: |
       The child device node represents the controller connected to the SMC
       bus. The controller can be a NAND controller or a pair of any memory
diff --git a/Documentation/devicetree/bindings/memory-controllers/exynos-srom.yaml b/Documentation/devicetree/bindings/memory-controllers/exynos-srom.yaml
index c6e44f47ce7c..10a2d97e5f8b 100644
--- a/Documentation/devicetree/bindings/memory-controllers/exynos-srom.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/exynos-srom.yaml
@@ -38,6 +38,7 @@ properties:
 patternProperties:
   "^.*@[0-3],[a-f0-9]+$":
     type: object
+    additionalProperties: true
     description:
       The actual device nodes should be added as subnodes to the SROMc node.
       These subnodes, in addition to regular device specification, should
diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
index 9163c3f12a85..f5f03bf36413 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
@@ -50,6 +50,7 @@ properties:
 patternProperties:
   "^emc-timings-[0-9]+$":
     type: object
+    additionalProperties: false
     properties:
       nvidia,ram-code:
         $ref: /schemas/types.yaml#/definitions/uint32
diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
index e76ba767dfd2..14f1833d37c9 100644
--- a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
@@ -47,6 +47,7 @@ properties:
 
 patternProperties:
   "^.*@[0-4],[a-f0-9]+$":
+    additionalProperties: true
     type: object
     $ref: mc-peripheral-props.yaml#
 
diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
index 5644882db2e8..c9574b243046 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
@@ -35,6 +35,7 @@ properties:
 
   adc:
     type: object
+    additionalProperties: false
     description: |
       Provides 9 channels for system monitoring, including VBUSDIV5 (lower
       accuracy, higher measure range), VBUSDIV2 (higher accuracy, lower
@@ -73,6 +74,7 @@ properties:
 
   regulators:
     type: object
+    additionalProperties: false
     description: |
       List all supported regulators, which support the control for DisplayBias
       voltages and one general purpose LDO which commonly used to drive the
diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
index 987b287f3bff..9fce8cd7b0b6 100644
--- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
@@ -42,6 +42,7 @@ patternProperties:
   "^sdhci@[0-9a-f]+$":
     type: object
     $ref: mmc-controller.yaml
+    unevaluatedProperties: false
 
     properties:
       compatible:
diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index 78da129e9985..da3d488c335f 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -44,6 +44,7 @@ patternProperties:
 
   "^otp(-[0-9]+)?$":
     $ref: ../nvmem/nvmem.yaml#
+    unevaluatedProperties: false
 
     description: |
       An OTP memory region. Some flashes provide a one-time-programmable
diff --git a/Documentation/devicetree/bindings/power/supply/ti,lp8727.yaml b/Documentation/devicetree/bindings/power/supply/ti,lp8727.yaml
index ce6fbdba8f6b..0542d4126cf5 100644
--- a/Documentation/devicetree/bindings/power/supply/ti,lp8727.yaml
+++ b/Documentation/devicetree/bindings/power/supply/ti,lp8727.yaml
@@ -28,6 +28,7 @@ properties:
 patternProperties:
   '^(ac|usb)$':
     type: object
+    additionalProperties: false
     description: USB/AC charging parameters
     properties:
       charger-type:
diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-src.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-src.yaml
index c1cc69b51981..9ce8d8b427fa 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-src.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-src.yaml
@@ -38,8 +38,9 @@ properties:
 
 patternProperties:
   "power-domain@[0-9a-f]+$":
-
     type: object
+    additionalProperties: false
+
     properties:
       compatible:
         items:
diff --git a/Documentation/devicetree/bindings/soc/microchip/atmel,at91rm9200-tcb.yaml b/Documentation/devicetree/bindings/soc/microchip/atmel,at91rm9200-tcb.yaml
index 33748a061898..a46411149571 100644
--- a/Documentation/devicetree/bindings/soc/microchip/atmel,at91rm9200-tcb.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/atmel,at91rm9200-tcb.yaml
@@ -54,6 +54,7 @@ patternProperties:
   "^timer@[0-2]$":
     description: The timer block channels that are used as timers or counters.
     type: object
+    additionalProperties: false
     properties:
       compatible:
         items:
diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
index 847873289f25..7ab96baf2064 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
@@ -130,6 +130,7 @@ patternProperties:
       PRU-ICSS configuration space. CFG sub-module represented as a SysCon.
 
     type: object
+    additionalProperties: false
 
     properties:
       compatible:
diff --git a/Documentation/devicetree/bindings/sound/marvell,mmp-sspa.yaml b/Documentation/devicetree/bindings/sound/marvell,mmp-sspa.yaml
index f302fe89a253..4193d17d1c62 100644
--- a/Documentation/devicetree/bindings/sound/marvell,mmp-sspa.yaml
+++ b/Documentation/devicetree/bindings/sound/marvell,mmp-sspa.yaml
@@ -60,6 +60,7 @@ properties:
     properties:
       endpoint:
         type: object
+        additionalProperties: true
 
         properties:
           dai-format:
diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
index 184e8ccbdd13..19c4deae74b8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
@@ -132,6 +132,7 @@ properties:
 patternProperties:
   "^.*@[0-9a-f]+$":
     type: object
+    additionalProperties: true
     description: |
       WCD934x subnode for each slave devices. Bindings of each subnodes
       depends on the specific driver providing the functionality and
diff --git a/Documentation/devicetree/bindings/sound/samsung,odroid.yaml b/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
index 7b4e08ddef6a..51a101558c7b 100644
--- a/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
@@ -35,12 +35,14 @@ properties:
 
   cpu:
     type: object
+    additionalProperties: false
     properties:
       sound-dai:
         description: phandles to the I2S controllers
 
   codec:
     type: object
+    additionalProperties: false
     properties:
       sound-dai:
         items:
diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index bcbfa71536cd..a191a966cf64 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -200,6 +200,7 @@ properties:
 patternProperties:
   "^.*@[0-9a-f],[0-9a-f]$":
     type: object
+    additionalProperties: true
     description:
       Child nodes for a standalone audio codec or speaker amplifier IC.
       It has RX and TX Soundwire secondary devices.
diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml
index f1176a28fd87..c18eafbfde8c 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml
@@ -51,6 +51,7 @@ properties:
 patternProperties:
   "^.*@[0-9a-f]+":
     type: object
+    additionalProperties: true
     properties:
       reg:
         items:
diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
index 58b7056f4a70..e2187d395bd1 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
@@ -63,6 +63,7 @@ properties:
 patternProperties:
   "^.*@[0-9a-f]+":
     type: object
+    additionalProperties: true
     properties:
       reg:
         items:
diff --git a/Documentation/devicetree/bindings/spi/spi-controller.yaml b/Documentation/devicetree/bindings/spi/spi-controller.yaml
index 5a7c72cadf76..90945f59b7e8 100644
--- a/Documentation/devicetree/bindings/spi/spi-controller.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-controller.yaml
@@ -94,6 +94,7 @@ patternProperties:
   "^.*@[0-9a-f]+$":
     type: object
     $ref: spi-peripheral-props.yaml
+    additionalProperties: true
 
     properties:
       spi-3wire:
diff --git a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
index 98a7dc7f467d..a1c96985951f 100644
--- a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
+++ b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
@@ -57,17 +57,17 @@ properties:
 
 patternProperties:
   "^sram@[a-z0-9]+":
-    type: object
-
-    properties:
-      compatible:
-        const: mmio-sram
+    $ref: /schemas/sram/sram.yaml#
+    unevaluatedProperties: false
 
     patternProperties:
       "^sram-section?@[a-f0-9]+$":
         type: object
+        additionalProperties: false
 
         properties:
+          reg: true
+
           compatible:
             oneOf:
               - const: allwinner,sun4i-a10-sram-a3-a4
diff --git a/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml b/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
index 071f2d676196..4bbf6db0b6bd 100644
--- a/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
@@ -61,6 +61,7 @@ additionalProperties: false
 patternProperties:
   "-sram@[0-9a-f]+$":
     type: object
+    additionalProperties: false
     description: A region of reserved memory.
 
     properties:
diff --git a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
index 8581821fa4e1..4f3acdc4dec0 100644
--- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
+++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
@@ -171,6 +171,7 @@ patternProperties:
 
       cooling-maps:
         type: object
+        additionalProperties: false
         description:
           This node describes the action to be taken when a thermal zone
           crosses one of the temperature thresholds described in the trips
diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index a3f8a3f49852..3cdd40f8acc0 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -118,6 +118,7 @@ properties:
 patternProperties:
   "^usb@[0-9a-f]+$":
     $ref: snps,dwc3.yaml#
+    unevaluatedProperties: false
 
     properties:
       wakeup-source: false
-- 
2.39.0

