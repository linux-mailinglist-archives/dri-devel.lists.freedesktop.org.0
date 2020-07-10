Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D9121E952
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BBC6E931;
	Tue, 14 Jul 2020 07:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC836EC4C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 13:41:45 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id u5so2554719pfn.7
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 06:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ox6v3/6m/JURuE++39qFM5i01Mp73X4OGqXZFITJfc8=;
 b=NimQwGDCTI5TJYA0xP7+EQoTKsK4g0Uxntam9o5wrvluk6ZkTeD3nrDalXMVZIg0Kt
 BEpLzAgIUEhpXrGMcDScdUfwztxui3TfHrGpeZBQHaLoQWit9U0+N8Mbj81/zebX77wO
 BGCyFUnRDJWAEc9NztYR0JzGsrpS3f2S+0Gn85DZLTGQ2vT2tK1iTT2H+X0jOQrVjeX+
 ++iBYoJKtyFbljGp6aihKOXLupv0jOJ2vcWOwcW6YdEZSV0Cp1hJ6nZbOWokxK8W/96b
 RK0Vx54xCht6/ta+nynKTPCIDo3J5aTxrX0RGNb2sgQKtnA7rh9P0c6yW8hIpPy2Ahd0
 90Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ox6v3/6m/JURuE++39qFM5i01Mp73X4OGqXZFITJfc8=;
 b=HVzasuRp6aZd3/9xs5dhIopwBOMLGODLEd/HCWKRGU7jgZur7YhlfnL6NSY+KvkSrr
 4hFrgVNycEwvCWu7G15+gtggaUe0y6x/50VX8aQssxlO5om31vWZhL6yoYd2mcaz6RjA
 lkZ+IMgc4QZ8zTldguE71+Z/ZuQHCz/FHholM/w8sYyROuNjIbnmD16leAeFjS7gXURw
 ivpODK/5Rds+qTt+nlSf4/AYKRUSPmbyDUhEzqlFl6ntCXD+Q1gH6nhB4F3I9mBPkl39
 wCP/T5BSiTqQ6yMVC7Y4EE+mfAHZt2pWfjKLwPo3Dxjkx00L+yDmvRcJ8c2q9asHtYLv
 E2pA==
X-Gm-Message-State: AOAM53186EAySLJxRdFc18tPyz6XK11Gz+EF9cHsVUQWUffYclnig8+r
 4l8ZxE9Lzos9ZI3lB1swTQ4=
X-Google-Smtp-Source: ABdhPJxTki9x8QqD3a8zSWl1MuapthA8yxzqAQ1e3GWqJZ4DjGL/AOjPOG9WO53fYEO/Dkx3Wdd2iA==
X-Received: by 2002:a65:4786:: with SMTP id e6mr42595261pgs.258.1594388505147; 
 Fri, 10 Jul 2020 06:41:45 -0700 (PDT)
Received: from localhost.localdomain ([122.172.62.13])
 by smtp.gmail.com with ESMTPSA id j13sm5756863pjz.8.2020.07.10.06.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 06:41:44 -0700 (PDT)
From: Vinay Simha BN <simhavcs@gmail.com>
To: 
Subject: [PATCH v8 1/2] dt-binding: Add DSI/LVDS TC358775 bridge bindings
Date: Fri, 10 Jul 2020 19:11:27 +0530
Message-Id: <1594388491-15129-1-git-send-email-simhavcs@gmail.com>
X-Mailer: git-send-email 2.1.2
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
 Rob Herring <robh+dt@kernel.org>, Vinay Simha BN <simhavcs@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- license modified to (GPL-2.0-only OR BSD-2-Clause)
- single-link and dual-link lvds description and
  examples are added
- proper indentation
- VESA/JEIDA formats picked from panel-lvds dts
- dsi data-lanes property removed, it will be picked
  from dsi0 ports
- dual-link lvds port added and implemented
- converted from .txt to .yaml

Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Rob Herring <robh@kernel.org>
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

v6:
* No changes, revision version mentioned to inline with
  driver file

v7:
* change log added
  Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

v8:
* Reviewed-by: Rob Herring <robh@kernel.org>
* change log modified in reverse chronological order
---
 .../bindings/display/bridge/toshiba,tc358775.yaml  | 215 +++++++++++++++++++++
 1 file changed, 215 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
new file mode 100644
index 0000000..31f085d
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
2.1.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
