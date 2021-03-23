Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 209B1346757
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 19:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259526E924;
	Tue, 23 Mar 2021 18:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A966E90F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 18:14:31 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 z6-20020a1c4c060000b029010f13694ba2so11359918wmf.5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 11:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZurC22z1J1Ck8IMbpKH5VToEe3ZGD8vbEOndO4vYk/M=;
 b=L1uQZdT2nxXw6hA2r1eVYObHVqQ+CLtezPNGjCYU1cxWF+5mYLk7UBe0xMW9HUZwsK
 oPERvbShcRlcjtxeOsHRTlmR7DTI7E1Y/b2qupRIaZCVk8hTMwUguX1kYzSzuR9kzRyf
 GXMgLTlSpvw0nDJDLe6W+ouO/NCLmoLHNX7jX+SuP5kgrxuM7dPtWi1iAB7uwiveIoip
 kwJZyN8Z9oXyqdYRN37yg47PoFK50741VqiAreJvTqGEJBROPkJoUxZ2UFuUNK6u2LW9
 XNY1ODm2+QFP/gL9Zk/L3Lz/DQZkJ6iFUUXv2hsxqbg4KhNAjqEMwfLk5XqjqmmtVGkL
 eSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZurC22z1J1Ck8IMbpKH5VToEe3ZGD8vbEOndO4vYk/M=;
 b=AhdMQiKhkFudvrBB8Gfth9HwxoeTDTbm3736RJIJKj7iENiArMl6kDPZwJi0BvMVBg
 O988MzZP1Xsy4WF+TbNbELblCQphJu5BunzyEpYwgrcxfs3KDWpbVNTEy/dU9njtTBdg
 9mqgjEC6cgPZhqYm5I6KXLh7xyqXXuSOnCBBicGwchDF6Ox62xKGg8RNVgEo6X367axn
 WW84Xd6aNlr4FsmGz/1Pi5fcszJ52A2/RP92whn26/zRavZ5lmXs4xMfBKQnG00P834X
 sYJXl/egKSIMwnaAxONlEpKZZnSLY+YH/l0yXdZ/6QUXodol3xxypOD/MvMcjgTn2Kle
 V36g==
X-Gm-Message-State: AOAM533fCCdkHwRpJIm+mE46IyPEF0zZ5q5r4gbp/WZaZ9IY0pwJHPEz
 Z3EEyeBnPXwTgZpNtZZaywQ=
X-Google-Smtp-Source: ABdhPJwcVZw5OZy1TmDPh5C68tqaqZmMqSdoghYIyXbzNsLYuyrYPpnrb/6vWEGeoKunLrWeC/hm/w==
X-Received: by 2002:a1c:c206:: with SMTP id s6mr4495682wmf.77.1616523270258;
 Tue, 23 Mar 2021 11:14:30 -0700 (PDT)
Received: from adgra-XPS-15-9570.home
 (2a01cb0008bd2700f54ecdc9d152bb4f.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:f54e:cdc9:d152:bb4f])
 by smtp.gmail.com with ESMTPSA id 21sm3484734wme.6.2021.03.23.11.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 11:14:29 -0700 (PDT)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH v8 1/2] dt-bindings: display: bridge: Add documentation for
 LT8912B
Date: Tue, 23 Mar 2021 19:14:22 +0100
Message-Id: <20210323181423.657926-2-adrien.grassein@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210323181423.657926-1-adrien.grassein@gmail.com>
References: <20210323181423.657926-1-adrien.grassein@gmail.com>
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
index 8c44fd8fd85d..d9a125e5d295 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10526,6 +10526,11 @@ S:	Maintained
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
