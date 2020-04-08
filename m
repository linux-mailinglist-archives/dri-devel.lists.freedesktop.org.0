Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC811A29BA
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C416EACD;
	Wed,  8 Apr 2020 19:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A2D6EACF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:51:50 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id r17so6119616lff.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 12:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jl4TeBXIvj1j2ah0iOCjHDspKfoD1nDXi5RooICvQTA=;
 b=Gq1vBgdQYSvk9vKjKfFdiLSCd7dm1zcewTTIyQUyhI2dqI7eM5GwkvN+VIThT/K8qP
 Z+Fr4DYPKEY7RG6jKuG2w8hQnMifg2cSxUpqrQS+iwF75vu/n1CYCsJL8845YT90A7Vz
 AXAtuMWDotQySz8nFCH98dqvEFExzYdCvo+LohAStvQwjRggt7UQ281cMPjXryHvWoWM
 px68/ngE5Vcgg8L3PnDFSEam2j6sPuGZVFNpd1KpUWCTMPb2wRedTKNxmHhtS9CyYQDP
 bKbUbnauAeBpuHM2HzFCNw+sDFLoxorBpgMj6VekJOA8LFawizp79f1ihTxZd6lrYuG+
 riJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Jl4TeBXIvj1j2ah0iOCjHDspKfoD1nDXi5RooICvQTA=;
 b=JfgZ3M9wJEk6g9eGqV1f0bC/HRAjSHfGYwGJwp6VVAb/HOzS9MnY97DBXlW8zcpq4b
 AxmCFm3LGCJrG2dpkfR8JvXAfrVLGoS80btC18xeTTBgsK8Q9TZRyblzjwOhpLzGKHmr
 SmvJ+Jf2gtzXKjxuwEz/nS5ccjEotymRqTsEoz4c/ubpwKG0f9u7V8ZOiIn5PxHhops5
 9IZ57vElEXsYtEku1kvccdiWwjwsGKeyJC8H+ML4c+ZuKZpuY9NcvXrNS9D25GhXYDzs
 a+Hba3FqPACGEjNwHAyrVk7TUF4mWL6PFXEFOpEOxB8gP9Mqy414IIny2fBNd2cG3ci/
 tMJQ==
X-Gm-Message-State: AGi0PubQQcggzBViIXSwL/3oxwUJ5T3hjuhtJqNNEydlIUmPsafAwpkq
 H7KXflnXTUXIQOFPs9t17Yp/w5+PHmw=
X-Google-Smtp-Source: APiQypKlo8hQRYhuUqCnzBFyKf2PQb31p1f/hKodBpR/4Aafy5fzwJVw3BCXk7Z90RRBDCg2Mo6yDQ==
X-Received: by 2002:a19:4f48:: with SMTP id a8mr5474712lfk.174.1586375508822; 
 Wed, 08 Apr 2020 12:51:48 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i20sm3961304lfe.15.2020.04.08.12.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 12:51:48 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 07/36] dt-bindings: display: convert ilitek,
 ili9322 to DT Schema
Date: Wed,  8 Apr 2020 21:50:40 +0200
Message-Id: <20200408195109.32692-8-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .txt binding explains:

"
    The following optional properties only apply to
    RGB and YUV input modes and
    can be omitted for BT.656 input modes:
"

This constraint is not implmented in the DT Schema.

The original binding from the .txt file referenced
properties that is included in panel-timing.yaml.

The properties in question are:
  - pixelclk-active
  - de-active
  - hsync-active
  - vsync-active

These properties was dropped in the conversion as they are not relevant.

v2:
  - drop properties from panel-timing (Linus)
  - drop use of spi-slave.yaml (Maxime)
  - introduce unevaluatedProperties (Maxime)
  - dropped unused properties (Linus)
  - delete stray spaces

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../bindings/display/panel/ilitek,ili9322.txt | 49 -------------
 .../display/panel/ilitek,ili9322.yaml         | 71 +++++++++++++++++++
 2 files changed, 71 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9322.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.txt b/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.txt
deleted file mode 100644
index 3d5ce6ad6ec7..000000000000
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-Ilitek ILI9322 TFT panel driver with SPI control bus
-
-This is a driver for 320x240 TFT panels, accepting a variety of input
-streams that get adapted and scaled to the panel. The panel output has
-960 TFT source driver pins and 240 TFT gate driver pins, VCOM, VCOML and
-VCOMH outputs.
-
-Required properties:
-  - compatible: "dlink,dir-685-panel", "ilitek,ili9322"
-    (full system-specific compatible is always required to look up configuration)
-  - reg: address of the panel on the SPI bus
-
-Optional properties:
-  - vcc-supply: core voltage supply, see regulator/regulator.txt
-  - iovcc-supply: voltage supply for the interface input/output signals,
-    see regulator/regulator.txt
-  - vci-supply: voltage supply for analog parts, see regulator/regulator.txt
-  - reset-gpios: a GPIO spec for the reset pin, see gpio/gpio.txt
-
-  The following optional properties only apply to RGB and YUV input modes and
-  can be omitted for BT.656 input modes:
-
-  - pixelclk-active: see display/panel/display-timing.txt
-  - de-active: see display/panel/display-timing.txt
-  - hsync-active: see display/panel/display-timing.txt
-  - vsync-active: see display/panel/display-timing.txt
-
-The panel must obey the rules for a SPI slave device as specified in
-spi/spi-bus.txt
-
-The device node can contain one 'port' child node with one child
-'endpoint' node, according to the bindings defined in
-media/video-interfaces.txt. This node should describe panel's video bus.
-
-Example:
-
-panel: display@0 {
-	compatible = "dlink,dir-685-panel", "ilitek,ili9322";
-	reg = <0>;
-	vcc-supply = <&vdisp>;
-	iovcc-supply = <&vdisp>;
-	vci-supply = <&vdisp>;
-
-	port {
-		panel_in: endpoint {
-			remote-endpoint = <&display_out>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml
new file mode 100644
index 000000000000..177d48c5bd97
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ilitek,ili9322.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI9322 TFT panel driver with SPI control bus
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |
+  This is a driver for 320x240 TFT panels, accepting a variety of input
+  streams that get adapted and scaled to the panel. The panel output has
+  960 TFT source driver pins and 240 TFT gate driver pins, VCOM, VCOML and
+  VCOMH outputs.
+
+  The panel must obey the rules for a SPI slave device as specified in
+  spi/spi-controller.yaml
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - dlink,dir-685-panel
+
+      - const: ilitek,ili9322
+
+  reset-gpios: true
+  port: true
+
+  vcc-supply:
+    description: Core voltage supply
+
+  iovcc-supply:
+    description: Voltage supply for the interface input/output signals
+
+  vci-supply:
+    description: Voltage supply for analog parts
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel: display@0 {
+            compatible = "dlink,dir-685-panel", "ilitek,ili9322";
+            reg = <0>;
+            vcc-supply = <&vdisp>;
+            iovcc-supply = <&vdisp>;
+            vci-supply = <&vdisp>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&display_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
