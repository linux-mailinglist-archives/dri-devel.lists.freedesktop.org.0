Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E3D20AD47
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 09:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924DC6E436;
	Fri, 26 Jun 2020 07:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674F06EC2B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 00:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1593132964; bh=KRfWCMHYqiubRZHMWvAgA8TVb0j4Ixsfwj+pdX6IJzI=;
 h=From:To:Cc:Subject:Date:References:From;
 b=TRRw9lBEckkGVBb6TM7xSIl7LPIHjW7yC6wsQ1l325PT1m8GoC44MLFoJuqsmiSFY
 VWe0+hhTEd/dtfrYCgukMGx6rDoqJsmUgXL4OtzbbUvYRwjUoxVLtHeYJHY+po9nc0
 LtcyMJVfVuO9qCUmXVNsZF4d/ikAesVOZIAmvEL0=
From: Ondrej Jirman <megous@megous.com>
To: linux-sunxi@googlegroups.com, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v5 02/13] dt-bindings: panel: Convert rocktech,
 jh057n00900 to yaml
Date: Fri, 26 Jun 2020 02:55:50 +0200
Message-Id: <20200626005601.241022-3-megous@megous.com>
In-Reply-To: <20200626005601.241022-1-megous@megous.com>
References: <20200626005601.241022-1-megous@megous.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 26 Jun 2020 07:36:15 +0000
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
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Bhushan Shah <bshah@kde.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luca Weiss <luca@z3ntu.xyz>, Martijn Braam <martijn@brixit.nl>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert Rocktech MIPI DSI panel driver from txt to yaml bindings.

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 .../display/panel/rocktech,jh057n00900.txt    | 23 -------
 .../display/panel/rocktech,jh057n00900.yaml   | 66 +++++++++++++++++++
 2 files changed, 66 insertions(+), 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt
deleted file mode 100644
index a372c5d84695..000000000000
--- a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-Rocktech jh057n00900 5.5" 720x1440 TFT LCD panel
-
-Required properties:
-- compatible: should be "rocktech,jh057n00900"
-- reg: DSI virtual channel of the peripheral
-- reset-gpios: panel reset gpio
-- backlight: phandle of the backlight device attached to the panel
-- vcc-supply: phandle of the regulator that provides the vcc supply voltage.
-- iovcc-supply: phandle of the regulator that provides the iovcc supply
-  voltage.
-
-Example:
-
-	&mipi_dsi {
-		panel@0 {
-			compatible = "rocktech,jh057n00900";
-			reg = <0>;
-			backlight = <&backlight>;
-			reset-gpios = <&gpio3 13 GPIO_ACTIVE_LOW>;
-			vcc-supply = <&reg_2v8_p>;
-			iovcc-supply = <&reg_1v8_p>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
new file mode 100644
index 000000000000..f97c48550741
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/rocktech,jh057n00900.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rocktech JH057N00900 5.5" 720x1440 TFT LCD panel
+
+maintainers:
+  - Ondrej Jirman <megi@xff.cz>
+
+description: |
+             Rocktech JH057N00900 is a 720x1440 TFT LCD panel
+             connected using a MIPI-DSI video interface.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: rocktech,jh057n00900
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  vcc-supply:
+    description: Panel power supply
+
+  vccio-supply:
+    description: I/O voltage supply
+
+  reset-gpios:
+    description: GPIO used for the reset pin
+    maxItems: 1
+
+  backlight:
+    description: Backlight used by the panel
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+required:
+  - compatible
+  - reg
+  - vcc-supply
+  - vccio-supply
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      panel@0 {
+	compatible = "rocktech,jh057n00900";
+	reg = <0>;
+	vcc-supply = <&reg_2v8_p>;
+	iovcc-supply = <&reg_1v8_p>;
+	reset-gpios = <&gpio3 13 GPIO_ACTIVE_LOW>;
+	backlight = <&backlight>;
+      };
+    };
+...
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
