Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA922FCF16
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 12:22:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDF86E16D;
	Wed, 20 Jan 2021 11:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4C36E16D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 11:22:18 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id m6so14323039pfk.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 03:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/G1XKKzyK0yZAshK+VzVtT1gmvcbma2qBK0WNAjoFJ0=;
 b=f9QxSmeFNcQFQsw7hS5QGeGaJxyqhXGEzo3QbjXqM2wj4ArTB1aEOtGsbeRw0Cfry7
 Z/DoOVbz6XFlRGziXkPIHVr5CDG77H52tQekRcbd3EoBJSieaNdq4sOUvO8lrRzd6C3A
 D3KVS+yS1pwtyYt8XtxYOSAZdhSj7wr23Llrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/G1XKKzyK0yZAshK+VzVtT1gmvcbma2qBK0WNAjoFJ0=;
 b=jJMnkDxwlc2z5X6Ya7aVLpImb8MIfWbI9n5WRvgfSROIg1mZVqOnMmXheyuSKPW6/o
 7r/AcsHYocXmBrs/3fmRewahwTnqZsgzA2mZGQjU7sEUwARU6lKPulqZ/38Y+70fcJ6V
 toXhd19s6uGuMT/NFjPftwIqZXX0wOsQPQKXB89S7mhvkPgqU6bKuxA1GAFJeVNE46ZN
 D+RNYhVFj6Ni6/4SLfiVb4KlGAfHdsfGEgwKqR/6s1134cCuTZSI4MJqZ3JkSJAFrQdN
 nn2zQ96/gN1fd3E6wtzWl+XFreIKiXqFOBPtIJ0+5Qmo/TomYwT687eOUVe5BZIkuwxf
 Vegg==
X-Gm-Message-State: AOAM532huZcaWYWxSlcO1vfox9llsOonsGWJOZ4TJs5BlSRp0uskvhyd
 Dfd9qzBfAyARCpnWdQzp8l/Jnql85wvhrijc
X-Google-Smtp-Source: ABdhPJwEhxynnzNsfdOIosnWD6hJRmKWPIAg2bWTvI3yFlUc2LWW0ORKLS7qvfBc2J2WLYigePeAKg==
X-Received: by 2002:a65:4083:: with SMTP id t3mr8967439pgp.150.1611141737943; 
 Wed, 20 Jan 2021 03:22:17 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([103.105.103.154])
 by smtp.gmail.com with ESMTPSA id gk2sm2248341pjb.6.2021.01.20.03.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 03:22:17 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 1/2] dt-bindings: display: bridge: Add documentation for
 SN65DSI84
Date: Wed, 20 Jan 2021 16:51:57 +0530
Message-Id: <20210120112158.62109-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SN65DSI84 is a Single Channel DSI to Dual-link LVDS bridge from
Texas Instruments.

SN65DSI83, SN65DSI85 are variants of the same family of bridge
controllers.

Right now the bridge driver is supporting a single link, dual-link
support requires to initiate I2C Channel B registers, so dt-bindings
documented with single link LVDS.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../bindings/display/bridge/ti,sn65dsi84.yaml | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi84.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi84.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi84.yaml
new file mode 100644
index 000000000000..891382a76c1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi84.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi84.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI SN65DSI84 MIPI DSI to LVDS bridge bindings
+
+maintainers:
+  - Jagan Teki <jagan@amarulasolutions.com>
+
+description: |
+  The SN65DSI84 DSI to FlatLink bridge features a single channel MIPI D-PHY receiver
+  front-end configuration with 4 lanes per channel operating at 1 Gbps per lanes.
+  The bridge decodes MIPI DSI 18bpp RGB666 and 240bpp RG888 packets and converts
+  the formatted video data stream to a FlatLink compatible LVDS output operating
+  at pixel clocks operating from 25 MHx to 154 MHz, offering a Dual-Link LVDS,
+  Single-Link LVDS interface with four data lanes per link.
+
+  https://www.ti.com/product/SN65DSI84
+
+properties:
+  compatible:
+    const: ti,sn65dsi84
+
+  reg:
+    maxItems: 1
+    description: i2c address of the bridge, 0x2c
+
+  enable-gpios:
+    maxItems: 1
+    description: GPIO specifier for bridge enable pin (active high).
+
+  ports:
+    type: object
+    description:
+      A node containing input and output port nodes with endpoint definitions
+      as documented in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        type: object
+        description: |
+          DSI Input. The remote endpoint phandle should be a
+          reference to a valid mipi_dsi_host device node.
+
+      port@1:
+        type: object
+        description: |
+          Video port for LVDS output (panel or connector).
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+       #address-cells = <1>;
+       #size-cells = <0>;
+
+       ports {
+           #address-cells = <1>;
+           #size-cells = <0>;
+
+           port@0 {
+               reg = <0>;
+               dsi_in: endpoint {
+                   remote-endpoint = <&ltdc_ep0_out>;
+               };
+           };
+
+           port@1 {
+               reg = <1>;
+               dsi_out: endpoint {
+                   remote-endpoint = <&bridge_in>;
+                   data-lanes = <0 1>;
+               };
+           };
+       };
+    };
+
+    i2c6 {
+       #address-cells = <1>;
+       #size-cells = <0>;
+
+       bridge@2c {
+           compatible = "ti,sn65dsi84";
+           reg = <0x2c>;
+           enable-gpios = <&gpiof 15 GPIO_ACTIVE_HIGH>;
+
+           ports {
+               #address-cells = <1>;
+               #size-cells = <0>;
+
+               port@0 {
+                   reg = <0>;
+                   bridge_in: endpoint {
+                        remote-endpoint = <&dsi_out>;
+                   };
+               };
+
+               port@1 {
+                   reg = <1>;
+                   bridge_out: endpoint {
+                        remote-endpoint = <&panel_in_lvds>;
+                   };
+               };
+           };
+       };
+    };
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
