Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B24034A6FF
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 13:20:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496516E1B8;
	Fri, 26 Mar 2021 12:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43C46E1B8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 12:20:02 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id j9so3716158wrx.12
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 05:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Cg+L3wPpp5OHDURFXSz4FjhlOlxdha9TlBU9uEJUR4=;
 b=fZcIez8MREWxgCyQtvWwdjIm5euQ6o9gQ7FC4HVKcxBiDvM4xrDGie8N5Tpla/qM3c
 5hnQYd//BT7uZvNHcEfadAGGPxvjnEFJl2W/3H00wr0sceJObt1bJdDyouIXr4P3jwql
 1FN3lMz4Uq95K42L3nSGN7luoeoXpxMhnZolZwlbqhOlJXO019DaFSb108qq4I1zxPuj
 GbC4O3VYYX4qLzWTGulUJgpEAgW8VENzc3tWe7ZsPs77POJtUw5HI1BTtB/R46VVcmTG
 WvegsDw08sCzgSkLEm48dtyQ9uqm7YVMRTVRiBZexlEjkhP6tY7UnzP6ckfJtf8QR371
 f4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Cg+L3wPpp5OHDURFXSz4FjhlOlxdha9TlBU9uEJUR4=;
 b=ZA0KFdfnSXzK1LIQif3zMTGsVuj/uRS/Mgsg6hMVoPxHZqdG3NoiihCjXDGDPLJgTh
 8poSnKw6ORoXkQM6c4BcZO5pkbX3Xkr0mGOK7m2jMKy80hFOLgnrYmpGXqmjS1+OPtMF
 RZJItJNdqjiWlULJ1HjRqBUB6DDNLrUqy000Pinqao3lW4E5f/mTlyNF7VqhQvCw1nuL
 K4Lo/I2ycFtGQbDiqvkJ90s5xszxwUfFx3ijm2XAZrrfDBWR42uvSCS7wTYtwQcfsicU
 9spaRd7SA9VEwVmIgoWj1il6gzoKJ1xatLBb5tyQ0QIyF2lgsyJ/Fd2eW8ZyC1/0MTNy
 Q5Tg==
X-Gm-Message-State: AOAM531Ac+lpL7KKWvzPgp16cAUawo3Fni2taW0Lu+ZBsCg14wpzBGfs
 +sR3g9VZUmAjvkwAn/c1dHc=
X-Google-Smtp-Source: ABdhPJwvjOLfOd3vNQBZGosStChbrabc4TRZuIZHHAGv1XyNK8GxNktfT3id8xevNJ705wUXBVgTgQ==
X-Received: by 2002:adf:e482:: with SMTP id i2mr14079742wrm.392.1616761201544; 
 Fri, 26 Mar 2021 05:20:01 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb0008bd2700f1419764c24345e5.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:f141:9764:c243:45e5])
 by smtp.gmail.com with ESMTPSA id l6sm11150102wrt.56.2021.03.26.05.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 05:20:01 -0700 (PDT)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH v9 1/2] dt-bindings: display: bridge: Add documentation for
 LT8912B
Date: Fri, 26 Mar 2021 13:19:54 +0100
Message-Id: <20210326121955.1266230-2-adrien.grassein@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326121955.1266230-1-adrien.grassein@gmail.com>
References: <20210326121955.1266230-1-adrien.grassein@gmail.com>
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
index 67b104202602..0dd60d51c001 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10548,6 +10548,11 @@ S:	Maintained
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
