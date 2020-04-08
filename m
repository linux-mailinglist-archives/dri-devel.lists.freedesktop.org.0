Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 734D51A29EA
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7093D6EAE3;
	Wed,  8 Apr 2020 19:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F836EAE4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:52:12 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id g27so8958920ljn.10
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 12:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iLwmLLXxp+3at3NXYeHsZbtqN22J5m0j84C8EY0Tpvw=;
 b=SEaJe1JCrR9zDU7Y5BWPoYjiMOXkt9vafq1EBfXteVwRxHKgifJ+HakQtmQ/Si6ZY7
 ekAXqqx2IVDfAjaBmxvkCPvuAqtzgdErjtQB7J7hgbY75nP31S7zcT3qGiTt0AuV0yze
 6cuRxXpdCcqE4HwfRIRCM5idnU8NyCzQbxH9psr4tPYShikjPWDpdfOBHL4iG5Z0jJOS
 TlYbyoyyNqUr4TW4LEZVR4edb5QkIZpEt/at7qqV7SD8w68yiON56vJhuZkv2ROWHTej
 oxFIW8okNZ8L9gx2P5aApRjDThaYbWsUgt9Bxj578teWqu/Dg7qr1pC/lsT23sqTolKV
 TsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iLwmLLXxp+3at3NXYeHsZbtqN22J5m0j84C8EY0Tpvw=;
 b=hyhh8RzDJWb5V6NsvV/buLcPnYJrNlhklB1jEXUkyqdnTGn9eFI2z6LxfNL45bEfg5
 NlI3DnF1HwPorTtimTiZjNwmoxI+10YkysTV4mqiMNK3w4WaU2EQ014bHzLIby3RA/c1
 YlV01AeO8SIleUp/J1DWTepz2k4FsNzDbvjvoxWyFPkTpucFpaKvmchWKglzOZKRlSGb
 ZgSJtmP4sJNOKQScQIEQs8ixDZlGATDqXlnIq90+KEsX6Lkn+BJIrSJzoDXGrK9q4NEm
 enIpw0592OD4uy+chvU31z2sL2yfOEMTsR99En8sfUCgbudIZr6jbpssI7Gvx7pgVEjE
 N9Ng==
X-Gm-Message-State: AGi0PuYkb8u6+bqqNOYrmtH7TCT0jkgF9ongQB720mMDd0s+o+JxYyDC
 KpljBDOYPdeAy2KpXt6t4qKL81/mszk=
X-Google-Smtp-Source: APiQypJux+tS4zCz4JUzc/4t/XTEpugkfLJZ0kNiGF6FynCxhE+ZODVIFmH2shE8oLIJFFG/2qxtIQ==
X-Received: by 2002:a2e:9a89:: with SMTP id p9mr6062408lji.222.1586375530300; 
 Wed, 08 Apr 2020 12:52:10 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i20sm3961304lfe.15.2020.04.08.12.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 12:52:09 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 27/36] dt-bindings: display: convert sitronix,
 st7789v to DT Schema
Date: Wed,  8 Apr 2020 21:51:00 +0200
Message-Id: <20200408195109.32692-28-sam@ravnborg.org>
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

v2:
    - dropped use of spi-slave.yaml (Maxime)
    - added unevaluatedProperties (Maxime)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/sitronix,st7789v.txt        | 37 -----------
 .../display/panel/sitronix,st7789v.yaml       | 63 +++++++++++++++++++
 2 files changed, 63 insertions(+), 37 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sitronix,st7789v.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.txt b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.txt
deleted file mode 100644
index c6995dde641b..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-Sitronix ST7789V RGB panel with SPI control bus
-
-Required properties:
-  - compatible: "sitronix,st7789v"
-  - reg: Chip select of the panel on the SPI bus
-  - reset-gpios: a GPIO phandle for the reset pin
-  - power-supply: phandle of the regulator that provides the supply voltage
-
-Optional properties:
-  - backlight: phandle to the backlight used
-
-The generic bindings for the SPI slaves documented in [1] also applies
-
-The device node can contain one 'port' child node with one child
-'endpoint' node, according to the bindings defined in [2]. This
-node should describe panel's video bus.
-
-[1]: Documentation/devicetree/bindings/spi/spi-bus.txt
-[2]: Documentation/devicetree/bindings/graph.txt
-
-Example:
-
-panel@0 {
-	compatible = "sitronix,st7789v";
-	reg = <0>;
-	reset-gpios = <&pio 6 11 GPIO_ACTIVE_LOW>;
-	backlight = <&pwm_bl>;
-	spi-max-frequency = <100000>;
-	spi-cpol;
-	spi-cpha;
-
-	port {
-		panel_input: endpoint {
-			remote-endpoint = <&tcon0_out_panel>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
new file mode 100644
index 000000000000..fa46d151e7b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sitronix,st7789v.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sitronix ST7789V RGB panel with SPI control bus
+
+description: |
+  The panel must obey the rules for a SPI slave device as specified in
+  spi/spi-controller.yaml
+
+maintainers:
+  - Maxime Ripard <mripard@kernel.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sitronix,st7789v
+
+  reg: true
+  reset-gpios: true
+  power-supply: true
+  backlight: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - power-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "sitronix,st7789v";
+            reg = <0>;
+            reset-gpios = <&pio 6 11 GPIO_ACTIVE_LOW>;
+            backlight = <&pwm_bl>;
+            power-supply = <&power>;
+            spi-max-frequency = <100000>;
+            spi-cpol;
+            spi-cpha;
+
+            port {
+                panel_input: endpoint {
+                    remote-endpoint = <&tcon0_out_panel>;
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
