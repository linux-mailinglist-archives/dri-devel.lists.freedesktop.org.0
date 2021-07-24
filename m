Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF19C3D448A
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 05:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB666F550;
	Sat, 24 Jul 2021 03:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEC26F550
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 03:44:19 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 ds11-20020a17090b08cbb0290172f971883bso11717059pjb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 20:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HIJcQQZ2vH+eFbl0b4W6tu/X9LzbnNwvqBiC4k0Fytc=;
 b=Rhy1OnFnUKa0pETJY0jQAisJa+DRiS52JW6k5vDI0UHWc2fPfyzOTD5AZaL23+kZ7l
 nZRoRZwbXBq0iY5q7NOk4qyYUZHzANGHCEy/YxrctYMraVJzF6hNyct4BBReHmBCzj96
 JoFXdR2IUCX8Qa0Emoosr2/rm80dI/SToFipvIsyiT68ySw13iUzCBNl6t96LMHCanDs
 Zl9DeeL6TtPQz0mDnvirfacYwXpPU8QBPQWF1kzQCeRKjeC6Y5U+T473nRgihVWgs2C/
 c6pYXIOARyeGdZz7ARm9pVbfxQ4qBCkLJvFZGZfipBPMdJ8V81mtyp9WvSmV7MKg4NjF
 V8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HIJcQQZ2vH+eFbl0b4W6tu/X9LzbnNwvqBiC4k0Fytc=;
 b=DVosxQlPjteVwBmI80VEGv9ENiWd6xsHNV4rjz6Ca/oFcWL5nSRTZPKCxeRHrNZvq9
 hHfvW56ijHfWe/zvVLYRF7r80llck+JkLxfHQV95RlamwhBoAPrEs56BhxD0xPEYDU6H
 mrDOpy+jhINpO7zXiRPQkOODUfj5ax3jXdzp4vgjvzdllRGrKNFtEA0+9PgHIT0VwSM/
 ODgTjHig1mw0SylPshAYfR/UfVKbO6D3ELbCbgs/IVdLt+x0cjOxpn/JDELrmMavvUFz
 D2ijzZ+Z7qvmrb2K4eKVQvd8yJ7wSrSTaXR0YSkV61BgKfinDQMTIinWDl4g0SCqPDy6
 pnEw==
X-Gm-Message-State: AOAM533fB39ZWG3+Rham50pFB7QG+LK+ZhYC2U0AQQChKdS6vHiS/FZe
 Bo7XtbtAwSdduvCH/KvQ+TM=
X-Google-Smtp-Source: ABdhPJwlcOi0gv6VYmZqlsNpfU5gc7Otmsc5iwXbyyruTBTQ2bV1i83B8XYAsTNAxQnl3V6V9WZxBA==
X-Received: by 2002:a63:fe51:: with SMTP id x17mr7735764pgj.58.1627098258760; 
 Fri, 23 Jul 2021 20:44:18 -0700 (PDT)
Received: from localhost.localdomain ([23.228.102.68])
 by smtp.gmail.com with ESMTPSA id c17sm35118733pfv.68.2021.07.23.20.44.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Jul 2021 20:44:18 -0700 (PDT)
From: dillon.minfei@gmail.com
To: laurent.pinchart@ideasonboard.com, thierry.reding@gmail.com,
 sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 linus.walleij@linaro.org, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com, noralf@tronnes.org
Subject: [PATCH v4 1/3] dt-bindings: display: panel: Add ilitek ili9341 panel
 bindings
Date: Sat, 24 Jul 2021 11:44:01 +0800
Message-Id: <1627098243-2742-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1627098243-2742-1-git-send-email-dillon.minfei@gmail.com>
References: <1627098243-2742-1-git-send-email-dillon.minfei@gmail.com>
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dillon Min <dillon.minfei@gmail.com>

Add documentation for "ilitek,ili9341" panel.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/lkml/1626853288-31223-2-git-send-email-dillon.minfei@gmail.com/
---
v4: no change.

 .../bindings/display/panel/ilitek,ili9341.yaml     | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
new file mode 100644
index 000000000000..2ed010f91e2d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ilitek,ili9341.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek-9341 Display Panel
+
+maintainers:
+  - Dillon Min <dillon.minfei@gmail.com>
+
+description: |
+  Ilitek ILI9341 TFT panel driver with SPI control bus
+  This is a driver for 320x240 TFT panels, accepting a rgb input
+  streams with 16 bits or 18 bits.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          # ili9341 240*320 Color on stm32f429-disco board
+        - st,sf-tc240t-9370-t
+      - const: ilitek,ili9341
+
+  reg: true
+
+  dc-gpios:
+    maxItems: 1
+    description: Display data/command selection (D/CX) of this DBI panel
+
+  spi-3wire: true
+
+  spi-max-frequency:
+    const: 10000000
+
+  port: true
+
+  vci-supply:
+    description: Analog voltage supply (2.5 .. 3.3V)
+
+  vddi-supply:
+    description: Voltage supply for interface logic (1.65 .. 3.3 V)
+
+  vddi-led-supply:
+    description: Voltage supply for the LED driver (1.65 .. 3.3 V)
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - dc-gpios
+  - port
+
+examples:
+  - |+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel: display@0 {
+                 compatible = "st,sf-tc240t-9370-t",
+                              "ilitek,ili9341";
+                 reg = <0>;
+                 spi-3wire;
+                 spi-max-frequency = <10000000>;
+                 dc-gpios = <&gpiod 13 0>;
+                 port {
+                         panel_in: endpoint {
+                           remote-endpoint = <&display_out>;
+                      };
+                 };
+             };
+        };
+...
+
-- 
1.9.1

