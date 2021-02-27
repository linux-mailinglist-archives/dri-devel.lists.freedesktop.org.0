Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B565326DC0
	for <lists+dri-devel@lfdr.de>; Sat, 27 Feb 2021 17:12:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7884F6E0C6;
	Sat, 27 Feb 2021 16:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA4E6E0A1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Feb 2021 16:12:35 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id n4so8924535wmq.3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Feb 2021 08:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3zBUcE8OjRKKFCJPCaa9dvaEFr+ZbWy6syWrW42zrkM=;
 b=M5cpSdVzI2ms5szSIOmR2LVks3ZFLE67qPHIEvokX8N/+arOiECJVH7ps2gjzlZ4at
 W6eHECa8/UIdf9Co6IVpsaG4AsUFBo4yYdC8rvnG9DeTnygDUzo5doB8oUxCiCiKz8Wh
 8VMjWSPIATN6/Ik91WB3H6n4cnhjnbl3OOEkyXgOrV8yuoiyWIvUb3cCxg0Kh4OQvIIy
 Eil5yn/5+oVlSeVITJrcrEGRwCxCwU91PTNvbF9ZCUR4kgsYigJSjW0wLvZjJsSAVsUU
 vMQxRFdhdpzQHpp+KC7AYZeVYtmAXk5VqC2EW0Rw5ZIN1I99Gn5fuJLv8pC1ebfDUa8r
 KDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3zBUcE8OjRKKFCJPCaa9dvaEFr+ZbWy6syWrW42zrkM=;
 b=TCRj4eZSTnOnLVDdPx5NkDaNDS9njk9mnMIvIDRfHHEmgqjo/qJU1mNrvCbhKXIu17
 JahYCeqJYgPTj+rKFNwOHjqoYkBY601/kGi81I96kWRcXncthOADA7LTJ+Ghe1c4KYHy
 j2nkLwc6bAUSeOxJ1xS4GxrU6HcOLHiLovK0ycTTDwBWMmn9yMZmZVHWHAXrgBmleOnI
 Z+9KC5BotNk3y3vglFSyTvR3bfSAu5GnjffUAGU4pfH1VGD22tQbKS30lzRx05pPEN1M
 +dkoBK6u1H4hD6ek17upD88kzGcOtJlAt4clFCrHTRpOaSKjGmhWjaC1y50ASnhnRG/J
 AvDg==
X-Gm-Message-State: AOAM533gSr8OGFiDmZ69GYvq5cFdvaGZa4sNek1nI5x1K5zmT5R7/h/O
 rUbfQzyUcgmGBe5Ti4BIxWg=
X-Google-Smtp-Source: ABdhPJzlS31zgpMMMIewRLpvxiM7pRHD56eq6D+Skd2WJiHZPBIO7PMzHnmsfVlSvR93cfkKT6qG9g==
X-Received: by 2002:a1c:e388:: with SMTP id a130mr8000154wmh.187.1614442353854; 
 Sat, 27 Feb 2021 08:12:33 -0800 (PST)
Received: from adgra-XPS-15-9570.home
 (2a01cb0008bd2700289c166d32b9da85.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:289c:166d:32b9:da85])
 by smtp.gmail.com with ESMTPSA id b15sm18390027wmd.41.2021.02.27.08.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Feb 2021 08:12:33 -0800 (PST)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH v5 1/2] dt-bindings: display: bridge: Add documentation for
 LT8912B
Date: Sat, 27 Feb 2021 17:12:27 +0100
Message-Id: <20210227161228.1632521-2-adrien.grassein@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210227161228.1632521-1-adrien.grassein@gmail.com>
References: <20210227161228.1632521-1-adrien.grassein@gmail.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 a.hajda@samsung.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 Adrien Grassein <adrien.grassein@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lontium LT8912B is a DSI to HDMI bridge.

Signed-off-by: Adrien Grassein <adrien.grassein@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../display/bridge/lontium,lt8912b.yaml       | 102 ++++++++++++++++++
 MAINTAINERS                                   |   5 +
 2 files changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
new file mode 100644
index 000000000000..735d0233a7d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/lontium,lt8912b.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lontium LT8912B MIPI to HDMI Bridge
+
+maintainers:
+  - Adrien Grassein <adrien.grassein@gmail.com>
+
+description: |
+  The LT8912B is a bridge device which convert DSI to HDMI
+
+properties:
+  compatible:
+    enum:
+      - lontium,lt8912b
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to active high RESET pin.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Primary MIPI port for MIPI input
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes: true
+
+            required:
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: |
+          HDMI port, should be connected to a node compatible with the
+          hdmi-connector binding.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c4 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      hdmi-bridge@48 {
+        compatible = "lontium,lt8912b";
+        reg = <0x48>;
+        reset-gpios = <&max7323 0 GPIO_ACTIVE_LOW>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            hdmi_out_in: endpoint {
+              data-lanes = <0 1 2 3>;
+              remote-endpoint = <&mipi_dsi_out>;
+            };
+          };
+
+          port@1 {
+              reg = <1>;
+
+              endpoint {
+                  remote-endpoint = <&hdmi_in>;
+              };
+          };
+        };
+      };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 16ada1a4b751..6366b8eac3f6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10460,6 +10460,11 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
 F:	drivers/hid/hid-lg-g15.c
 
+LONTIUM LT8912B MIPI TO HDMI BRIDGE
+M:	Adrien Grassein <adrien.grassein@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
+
 LSILOGIC MPT FUSION DRIVERS (FC/SAS/SPI)
 M:	Sathya Prakash <sathya.prakash@broadcom.com>
 M:	Sreekanth Reddy <sreekanth.reddy@broadcom.com>
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
