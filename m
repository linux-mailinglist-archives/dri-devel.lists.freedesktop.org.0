Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3743D09DF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 09:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BCF96E874;
	Wed, 21 Jul 2021 07:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0336E874
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 07:41:39 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 o3-20020a17090a6783b0290173ce472b8aso3502535pjj.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 00:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=n6ei/14DVfwbmyUg2CaUeORvt7ARyvKM0pVLkX4lBpQ=;
 b=dh8NNOGfvF4zrfy/ykeWjlLud5qJzKqOnfZOMsJp9rSFYQlln9F4uXJr0+E4N7xXJJ
 vbH0VPWIX7ubrcelc7b4dCNVSFtO2m8SJHFLkLJW1/eYs5GD9iE7OxInaQVmz1xmUygH
 ZVv5N203A/MZkzz2Lx/LrZBQjnyYSe7hum5KG+t4NCAPDn5oJ8jtI1zANR+pRMa3EbEm
 eewpWGg5ZfvEMmkOn6zoxrGSKNOCNCwzM6pjXYlX1NBFr9x/AetKJbivzFe11OefpGeR
 zlulxJUMKmMv6tf7QngOmKdSOMzQ7usC+rMCRx+2wwHeiTsBeMeSXOGxDVK4C3BjYzap
 dQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=n6ei/14DVfwbmyUg2CaUeORvt7ARyvKM0pVLkX4lBpQ=;
 b=prHrQ0AkfFzaPejNO47KgEZvKMNaiEuZm4AkZMy6rHJcUDnqI4OarmqkCuwujVTD+2
 V5dH6w9rGqEm2YshYM2jIdzOoS2Kdp6tdFqHIUf9QcjMRcQvbP9KTLS0cGSqqm79eXHx
 k18dJ7bji5vPUNbPli7LhGR2qFUf1QQQPbI9BltXhZzwbgKKJuTsSvx/xaz/euAOjqnQ
 DvRWflpQzgnaePp2g/T+5n8hYCPvFtpyTvYJ62R1QQtBxXV+JP/AhZoEn51ywh+Hd9Uq
 l7kx8HBIpKd+0UkYjWNNzx9ADhMgkxVczsDK4mZE3aDOq5NoawHNH6bgMLcBeWe9ua3U
 ZNTw==
X-Gm-Message-State: AOAM5303r7JnBHN3cq1Tbib9A7T5ehmo+Vo/bwhPzKvtz8G6zvx0g4LB
 VwJNA/TXk+ywL8ygCEwyaPQ=
X-Google-Smtp-Source: ABdhPJxsZm8Qd4VqoHrvx4ByRo/6aWAjSbf8dp+znoR9PjhsDNuBu6wI/rzIMOmgA8f3cZ7A9s2Uew==
X-Received: by 2002:a17:902:c105:b029:12a:5a94:6c3a with SMTP id
 5-20020a170902c105b029012a5a946c3amr26833710pli.14.1626853299153; 
 Wed, 21 Jul 2021 00:41:39 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id i8sm4841867pjh.36.2021.07.21.00.41.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Jul 2021 00:41:38 -0700 (PDT)
From: dillon.minfei@gmail.com
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, linus.walleij@linaro.org,
 alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com
Subject: [PATCH v2 1/3] dt-bindings: display: panel: Add ilitek ili9341 panel
 bindings
Date: Wed, 21 Jul 2021 15:41:26 +0800
Message-Id: <1626853288-31223-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626853288-31223-1-git-send-email-dillon.minfei@gmail.com>
References: <1626853288-31223-1-git-send-email-dillon.minfei@gmail.com>
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
Cc: devicetree@vger.kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 noralf@tronnes.org, Dillon Min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dillon Min <dillon.minfei@gmail.com>

Add documentation for "ilitek,ili9341" panel.

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
changes in v2:
- add {vci, vddi, vddi-led}-supply bulk regulator according to linus
  suggestion, thanks.
- add DBI panel in D/CX description.

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
2.7.4

