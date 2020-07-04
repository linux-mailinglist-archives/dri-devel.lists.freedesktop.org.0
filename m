Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C96215304
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240AC6E222;
	Mon,  6 Jul 2020 07:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FFF06E0DE
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 09:25:29 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id 72so2898020ple.0
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 02:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=vPne7NFgJs6b8kzaJCb+n8aPS6rGBj37y5JN0ANKMsQ=;
 b=d20+gBfF/A2+zaOZAnEAHqHn11JPIhWf78A/02VJ8cAhi52B1MDoOmBVUoCkwbAQIt
 WL7EeHG4TQi5Jb8TEVtw2KUl8GvB5ofPW61yYWmJDXn/6237obVR4INx3TW5CXby8jxN
 6kmCsnlCGfHqg1hZCPIFkwu82iQnhL1rb+g/opBQjwMnmU3iTRussoVfA8z2yN7YUTkh
 ALxOp4p31NYJP0brJ83SJZcJhhotFuyHYfiYJXjLgL2MP41pctr+EGO+xF3izIFx+Rrl
 8dLVY2NNrqvCOppXnEYyHBOLpAc9qZXAZBb6mVlh9ZWzRpfrrExtPbv5xJm4N7QnmzTL
 Rtgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=vPne7NFgJs6b8kzaJCb+n8aPS6rGBj37y5JN0ANKMsQ=;
 b=Hiac53LtPGGQG0qbmlGGVMhv0Tq3BiRG0/8V6TJ6vb5M0J9jtzc5O6pTo3zgKI7ZWX
 GN3rxPRtGO+NHiNAMaWplixNxUxV/tHTQyJb6O1ez6Imq1Q+XmqKGSZgQ+Pfi/U92mIh
 GX3rbt3rdDV1e6fh+6UUF5XnhcPaEFdfLaovNbiDZL02lNZRyQXtIufYFtcL48lfVHUr
 Ha1R7gvPiC7PFW+aTcqmC+STDESGaoL1qDbyUm2T//muveDwDcRSj9Uc2EOXWOg8WOb8
 k9d6xQfNKniv3G55t0CaSbXyV8AQuHILJV9Td0okPmyrayOvHiJyykKCvk3vq1iA6PvR
 Pymw==
X-Gm-Message-State: AOAM5326W551EyEKLI6M9i3KDG9MJFWhxzrCFUxXHg6BUlySlpDBl8xW
 KVE9wHgJ3u/cHt3ISRPB5a8=
X-Google-Smtp-Source: ABdhPJztMwPJkf9gYnz5ynp9kd3hUkhpOC+Xkb747Q5eUfV87Ty5lmw+6nwRtRxCyBdj/iFeYUMDQA==
X-Received: by 2002:a17:902:b40f:: with SMTP id
 x15mr31793800plr.164.1593854728531; 
 Sat, 04 Jul 2020 02:25:28 -0700 (PDT)
Received: from localhost.localdomain ([122.172.219.189])
 by smtp.gmail.com with ESMTPSA id s22sm13650917pfm.164.2020.07.04.02.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 02:25:28 -0700 (PDT)
From: Vinay Simha BN <simhavcs@gmail.com>
To: 
Subject: [PATCH v7 1/2] dt-binding: Add DSI/LVDS TC358775 bridge bindings
Date: Sat,  4 Jul 2020 14:54:39 +0530
Message-Id: <20200704092511.20856-1-simhavcs@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:18 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Vinay Simha BN <simhavcs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- converted from .txt to .yaml
- dual-link lvds port added and implemented
- dsi data-lanes property removed, it will be picked
  from dsi0 ports
- VESA/JEIDA formats picked from panel-lvds dts
- proper indentation
- single-link and dual-link lvds description and
  examples are added
- license modified to (GPL-2.0-only OR BSD-2-Clause)

Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>

---
v1:
 Initial version wast .txt file

v2:
 From txt to yaml file format

v3:
* Andrzej Hajda review comments incorporated
  dual port lvds implemented

* Laurent Pinchart review comments incorporated
  dsi lanes property removed and it is dynamically
  picked from the dsi ports
  VESA/JEIDA format picked from panel-lvds dts

v4:
* Sam Ravnborg review comments incorporated
  }' is indented properly in examples data-lanes
  description for single-link and dual-link lvds

v5:
* Sam Ravnborg review comments incorporated
  license modified to (GPL-2.0-only OR BSD-2-Clause)
  changelog added
---
 .../display/bridge/toshiba,tc358775.yaml      | 215 ++++++++++++++++++
 1 file changed, 215 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
new file mode 100644
index 000000000000..31f085d8ab13
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
@@ -0,0 +1,215 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/toshiba,tc358775.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC358775 DSI to LVDS bridge bindings
+
+maintainers:
+ - Vinay Simha BN <simhavcs@gmail.com>
+
+description: |
+ This binding supports DSI to LVDS bridge TC358775
+
+ MIPI DSI-RX Data 4-lane, CLK 1-lane with data rates up to 800 Mbps/lane.
+ Video frame size:
+ Up to 1600x1200 24-bit/pixel resolution for single-link LVDS display panel
+ limited by 135 MHz LVDS speed
+ Up to WUXGA (1920x1200 24-bit pixels) resolution for dual-link LVDS display
+ panel, limited by 270 MHz LVDS speed.
+
+properties:
+  compatible:
+    const: toshiba,tc358775
+
+  reg:
+    maxItems: 1
+    description: i2c address of the bridge, 0x0f
+
+  vdd-supply:
+    maxItems: 1
+    description:  1.2V LVDS Power Supply
+
+  vddio-supply:
+    maxItems: 1
+    description: 1.8V IO Power Supply
+
+  stby-gpios:
+    maxItems: 1
+    description: Standby pin, Low active
+
+  reset-gpios:
+    maxItems: 1
+    description: Hardware reset, Low active
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
+      port@2:
+        type: object
+        description: |
+          Video port for Dual link LVDS output (panel or connector).
+
+    required:
+      - port@0
+      - port@1
+
+required:
+ - compatible
+ - reg
+ - vdd-supply
+ - vddio-supply
+ - stby-gpios
+ - reset-gpios
+ - ports
+
+examples:
+ - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    /* For single-link LVDS display panel */
+
+    i2c@78b8000 {
+        /* On High speed expansion */
+        label = "HS-I2C2";
+        reg = <0x078b8000 0x500>;
+        clock-frequency = <400000>; /* fastmode operation */
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        tc_bridge: bridge@f {
+            compatible = "toshiba,tc358775";
+            reg = <0x0f>;
+
+            vdd-supply = <&pm8916_l2>;
+            vddio-supply = <&pm8916_l6>;
+
+            stby-gpios = <&msmgpio 99 GPIO_ACTIVE_LOW>;
+            reset-gpios = <&msmgpio 72 GPIO_ACTIVE_LOW>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    d2l_in_test: endpoint {
+                        remote-endpoint = <&dsi0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    lvds_out: endpoint {
+                        remote-endpoint = <&panel_in>;
+                    };
+                };
+            };
+        };
+    };
+
+    dsi@1a98000 {
+        reg = <0x1a98000 0x25c>;
+        reg-names = "dsi_ctrl";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@1 {
+                reg = <1>;
+                dsi0_out: endpoint {
+                    remote-endpoint = <&d2l_in_test>;
+                    data-lanes = <0 1 2 3>;
+                };
+             };
+         };
+     };
+
+ - |
+    /* For dual-link LVDS display panel */
+
+    i2c@78b8000 {
+        /* On High speed expansion */
+        label = "HS-I2C2";
+        reg = <0x078b8000 0x500>;
+        clock-frequency = <400000>; /* fastmode operation */
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        tc_bridge_dual: bridge@f {
+            compatible = "toshiba,tc358775";
+            reg = <0x0f>;
+
+            vdd-supply = <&pm8916_l2>;
+            vddio-supply = <&pm8916_l6>;
+
+            stby-gpios = <&msmgpio 99 GPIO_ACTIVE_LOW>;
+            reset-gpios = <&msmgpio 72 GPIO_ACTIVE_LOW>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    d2l_in_dual: endpoint {
+                        remote-endpoint = <&dsi0_out_dual>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    lvds0_out: endpoint {
+                        remote-endpoint = <&panel_in0>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+                    lvds1_out: endpoint {
+                        remote-endpoint = <&panel_in1>;
+                    };
+                };
+            };
+        };
+    };
+
+    dsi@1a98000 {
+        reg = <0x1a98000 0x25c>;
+        reg-names = "dsi_ctrl";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@1 {
+                reg = <1>;
+                dsi0_out_dual: endpoint {
+                    remote-endpoint = <&d2l_in_dual>;
+                    data-lanes = <0 1 2 3>;
+                };
+             };
+         };
+     };
+...
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
