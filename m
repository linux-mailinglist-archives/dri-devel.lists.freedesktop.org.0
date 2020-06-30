Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8639520FD56
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 22:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849EB6E1A2;
	Tue, 30 Jun 2020 20:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16ECB6E1A5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 20:02:20 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id o3so1527378ilo.12
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 13:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZkIYc/eqbgOWONYFCr/80s2mn+xe0bQWV+Ub3u8lp/o=;
 b=ooNiVLVPOp74ajUI+PnvXQazMP57B+jtzBvTK9Qxe2V8ogNZSfFsoSo2f0UuUaGJNR
 qgx8XEak0CfJo7RtK9tRsZoS5DF5zqwBfa7MaGt+jX69DF49tLpDQrO4/S6JGYf80cER
 8SlontR9QyJ4n3ANRjNq1zXqPbbyyhAwBMDr0eBeXk2mFe2jsyDSbmGFFfBMEa1nxGQh
 6uA+315Azr7RuPf0BMk/xQfHGdEH9tHNV6yT1f22ftIDZqSrlweDThMsP2ngojBTDH+q
 gIbrU7+mseMK0SB4bqRMCDbsx8mBQOm8WsO1hvRzqapIh8NxbXdOXSFX5H3qTaCXtJP9
 64Mg==
X-Gm-Message-State: AOAM530XmiXi1qb8Ex/yikndVlxO12y8ekONRHJqbSI0zWpdaZ0tCZyi
 1ajdNl7/ctoP+11973kk9CnXKz3Y/g==
X-Google-Smtp-Source: ABdhPJwqMH0XEJnv3BLQxqOL4D9OfmvZEmQ5ykiPH70KphbcBA4OOf/35gKmJJsgXajf4VzB8oqq7Q==
X-Received: by 2002:a92:a1cf:: with SMTP id b76mr4141625ill.128.1593547338345; 
 Tue, 30 Jun 2020 13:02:18 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.255])
 by smtp.googlemail.com with ESMTPSA id u11sm1903512iob.43.2020.06.30.13.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 13:02:17 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] dt-bindings: display: Convert connectors to DT schema
Date: Tue, 30 Jun 2020 14:02:16 -0600
Message-Id: <20200630200216.1172566-1-robh@kernel.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the analog TV, DVI, HDMI, and VGA connector bindings to DT schema
format.

Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
- Make Laurent maintainer
- Add missing port and compatible required
- Drop copy-n-paste 'type' from dvi-connector
- Use 4 space indent on examples
---
 .../display/connector/analog-tv-connector.txt | 31 --------
 .../connector/analog-tv-connector.yaml        | 52 ++++++++++++++
 .../display/connector/dvi-connector.txt       | 36 ----------
 .../display/connector/dvi-connector.yaml      | 70 +++++++++++++++++++
 .../display/connector/hdmi-connector.txt      | 31 --------
 .../display/connector/hdmi-connector.yaml     | 64 +++++++++++++++++
 .../display/connector/vga-connector.txt       | 36 ----------
 .../display/connector/vga-connector.yaml      | 46 ++++++++++++
 8 files changed, 232 insertions(+), 134 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
 create mode 100644 Documentation/devicetree/bindings/display/connector/analog-tv-connector.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/connector/dvi-connector.txt
 create mode 100644 Documentation/devicetree/bindings/display/connector/dvi-connector.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/connector/hdmi-connector.txt
 create mode 100644 Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/connector/vga-connector.txt
 create mode 100644 Documentation/devicetree/bindings/display/connector/vga-connector.yaml

diff --git a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
deleted file mode 100644
index 883bcb2604c7..000000000000
--- a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-Analog TV Connector
-===================
-
-Required properties:
-- compatible: "composite-video-connector" or "svideo-connector"
-
-Optional properties:
-- label: a symbolic name for the connector
-- sdtv-standards: limit the supported TV standards on a connector to the given
-                  ones. If not specified all TV standards are allowed.
-                  Possible TV standards are defined in
-                  include/dt-bindings/display/sdtv-standards.h.
-
-Required nodes:
-- Video port for TV input
-
-Example
--------
-#include <dt-bindings/display/sdtv-standards.h>
-
-tv: connector {
-	compatible = "composite-video-connector";
-	label = "tv";
-	sdtv-standards = <(SDTV_STD_PAL | SDTV_STD_NTSC)>;
-
-	port {
-		tv_connector_in: endpoint {
-			remote-endpoint = <&venc_out>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.yaml b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.yaml
new file mode 100644
index 000000000000..eebe88fed999
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/connector/analog-tv-connector.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog TV Connector
+
+maintainers:
+  - Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
+
+properties:
+  compatible:
+    enum:
+      - composite-video-connector
+      - svideo-connector
+
+  label: true
+
+  sdtv-standards:
+    description:
+      Limit the supported TV standards on a connector to the given ones. If
+      not specified all TV standards are allowed. Possible TV standards are
+      defined in include/dt-bindings/display/sdtv-standards.h.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  port:
+    description: Connection to controller providing analog TV signals
+
+required:
+  - compatible
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/display/sdtv-standards.h>
+
+    connector {
+        compatible = "composite-video-connector";
+        label = "tv";
+        sdtv-standards = <(SDTV_STD_PAL | SDTV_STD_NTSC)>;
+
+        port {
+            tv_connector_in: endpoint {
+                remote-endpoint = <&venc_out>;
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/connector/dvi-connector.txt b/Documentation/devicetree/bindings/display/connector/dvi-connector.txt
deleted file mode 100644
index 207e42e9eba0..000000000000
--- a/Documentation/devicetree/bindings/display/connector/dvi-connector.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-DVI Connector
-==============
-
-Required properties:
-- compatible: "dvi-connector"
-
-Optional properties:
-- label: a symbolic name for the connector
-- ddc-i2c-bus: phandle to the i2c bus that is connected to DVI DDC
-- analog: the connector has DVI analog pins
-- digital: the connector has DVI digital pins
-- dual-link: the connector has pins for DVI dual-link
-- hpd-gpios: HPD GPIO number
-
-Required nodes:
-- Video port for DVI input
-
-Note: One (or both) of 'analog' or 'digital' must be set.
-
-Example
--------
-
-dvi0: connector@0 {
-	compatible = "dvi-connector";
-	label = "dvi";
-
-	digital;
-
-	ddc-i2c-bus = <&i2c3>;
-
-	port {
-		dvi_connector_in: endpoint {
-			remote-endpoint = <&tfp410_out>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/connector/dvi-connector.yaml b/Documentation/devicetree/bindings/display/connector/dvi-connector.yaml
new file mode 100644
index 000000000000..71cb9220fa59
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/connector/dvi-connector.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/connector/dvi-connector.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DVI Connector
+
+maintainers:
+  - Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
+
+properties:
+  compatible:
+    const: dvi-connector
+
+  label: true
+
+  hpd-gpios:
+    description: A GPIO line connected to HPD
+    maxItems: 1
+
+  ddc-i2c-bus:
+    description: phandle link to the I2C controller used for DDC EDID probing
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  analog:
+    type: boolean
+    description: the connector has DVI analog pins
+
+  digital:
+    type: boolean
+    description: the connector has DVI digital pins
+
+  dual-link:
+    type: boolean
+    description: the connector has pins for DVI dual-link
+
+  port:
+    description: Connection to controller providing DVI signals
+
+required:
+  - compatible
+  - port
+
+anyOf:
+  - required:
+      - analog
+  - required:
+      - digital
+
+additionalProperties: false
+
+examples:
+  - |
+    connector {
+        compatible = "dvi-connector";
+        label = "dvi";
+
+        digital;
+
+        ddc-i2c-bus = <&i2c3>;
+
+        port {
+            dvi_connector_in: endpoint {
+                remote-endpoint = <&tfp410_out>;
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/connector/hdmi-connector.txt b/Documentation/devicetree/bindings/display/connector/hdmi-connector.txt
deleted file mode 100644
index aeb07c4bd703..000000000000
--- a/Documentation/devicetree/bindings/display/connector/hdmi-connector.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-HDMI Connector
-==============
-
-Required properties:
-- compatible: "hdmi-connector"
-- type: the HDMI connector type: "a", "b", "c", "d" or "e"
-
-Optional properties:
-- label: a symbolic name for the connector
-- hpd-gpios: HPD GPIO number
-- ddc-i2c-bus: phandle link to the I2C controller used for DDC EDID probing
-- ddc-en-gpios: signal to enable DDC bus
-
-Required nodes:
-- Video port for HDMI input
-
-Example
--------
-
-hdmi0: connector@1 {
-	compatible = "hdmi-connector";
-	label = "hdmi";
-
-	type = "a";
-
-	port {
-		hdmi_connector_in: endpoint {
-			remote-endpoint = <&tpd12s015_out>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml b/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml
new file mode 100644
index 000000000000..14d7128af592
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/connector/hdmi-connector.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HDMI Connector
+
+maintainers:
+  - Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
+
+properties:
+  compatible:
+    const: hdmi-connector
+
+  type:
+    description: The HDMI connector type
+    enum:
+      - a   # Standard full size
+      - b   # Never deployed?
+      - c   # Mini
+      - d   # Micro
+      - e   # automotive
+
+  label: true
+
+  hpd-gpios:
+    description: A GPIO line connected to HPD
+    maxItems: 1
+
+  ddc-i2c-bus:
+    description: phandle link to the I2C controller used for DDC EDID probing
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  ddc-en-gpios:
+    description: GPIO signal to enable DDC bus
+    maxItems: 1
+
+  port:
+    description: Connection to controller providing HDMI signals
+
+required:
+  - compatible
+  - port
+  - type
+
+additionalProperties: false
+
+examples:
+  - |
+    connector {
+        compatible = "hdmi-connector";
+        label = "hdmi";
+
+        type = "a";
+
+        port {
+            hdmi_connector_in: endpoint {
+                remote-endpoint = <&tpd12s015_out>;
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/connector/vga-connector.txt b/Documentation/devicetree/bindings/display/connector/vga-connector.txt
deleted file mode 100644
index c727f298e7ad..000000000000
--- a/Documentation/devicetree/bindings/display/connector/vga-connector.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-VGA Connector
-=============
-
-Required properties:
-
-- compatible: "vga-connector"
-
-Optional properties:
-
-- label: a symbolic name for the connector corresponding to a hardware label
-- ddc-i2c-bus: phandle to the I2C bus that is connected to VGA DDC
-
-Required nodes:
-
-The VGA connector internal connections are modeled using the OF graph bindings
-specified in Documentation/devicetree/bindings/graph.txt.
-
-The VGA connector has a single port that must be connected to a video source
-port.
-
-
-Example
--------
-
-vga0: connector@0 {
-	compatible = "vga-connector";
-	label = "vga";
-
-	ddc-i2c-bus = <&i2c3>;
-
-	port {
-		vga_connector_in: endpoint {
-			remote-endpoint = <&adv7123_out>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/connector/vga-connector.yaml b/Documentation/devicetree/bindings/display/connector/vga-connector.yaml
new file mode 100644
index 000000000000..5782c4bb3252
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/connector/vga-connector.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/connector/vga-connector.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VGA Connector
+
+maintainers:
+  - Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
+
+properties:
+  compatible:
+    const: vga-connector
+
+  label: true
+
+  ddc-i2c-bus:
+    description: phandle link to the I2C controller used for DDC EDID probing
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  port:
+    description: Connection to controller providing VGA signals
+
+required:
+  - compatible
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    connector {
+        compatible = "vga-connector";
+        label = "vga";
+
+        ddc-i2c-bus = <&i2c3>;
+
+        port {
+            vga_connector_in: endpoint {
+                remote-endpoint = <&adv7123_out>;
+            };
+        };
+    };
+
+...
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
