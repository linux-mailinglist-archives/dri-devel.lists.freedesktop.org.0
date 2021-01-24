Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E60113022F2
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 09:45:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B4089FE3;
	Mon, 25 Jan 2021 08:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B10689D7B
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jan 2021 15:08:48 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id e15so8558236wme.0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jan 2021 07:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ag6006OGpj/LnO01jq+OCQKPnWe8b0yCa7D0tLaFvmM=;
 b=bPwf4qkir49pVBSitB1Do8De4PPdvI6685ybt24v+l9t1TtNQfcEsur0Je7nsRbi0N
 ILXUQ3ulIGpUzLhgKy+WPEFxCwLT1b6v4C8+l1/VXFl0IqYsJdIHammgIPqadmYW9NtO
 HivSY1nzRSUp7N0BcM8VfZ8eg5dmexoVdKQKWJQmQlBpBIcivKzh42OS0QnUxrX/Vegs
 ey6kH0lP32cZNTosC0JaosIuX7CuaddjOd0C+Cf3cgx4Ve+2WkL9N0GyNMXGq0/Z4o7G
 Glr3CLkxnMFeexWx9pqZ0REXGXhnqQIPOWvLHzrzu2yFUYA2vnPuiX5MHNENvyXvPGI1
 ngCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ag6006OGpj/LnO01jq+OCQKPnWe8b0yCa7D0tLaFvmM=;
 b=TDsp835Buunua9XWXZ07DcRCGtQD4UhD7F/1KIwUQWO5+bCvAdoJTy2Aspp1aiKUmT
 epxpmMJ49BMNazyxUuG+3lb5UZVyw8+XdXuyGscd/WnTp99YbTOH5//rTMgiBHfb7dwE
 fCJfbD/iOv7RHwOvkSpZHSEUUcEj4PmUfa3w5fiRaEzGw5P9ox53Gw8Z6CRyc3nzfU8x
 gqq5u8tlPzn+WHrL7IosnkeVw8nlTqVqOKr7Xl5GmJ1vPvYzWKdkbsGcj4F1p9y027i9
 GSqNwQjTRsh1l8y2RfK+qwRJQQ2/Ni6Cr8cdGcwRM8mUIWRsiRcHOgsWFnNdxt4XyUMa
 AfCA==
X-Gm-Message-State: AOAM532QO+O34gME1LZ0GgAkxlcfeQAR8x1UzR3qs3mtVZ6rXU4b09Pb
 TBX5aPcYCZc7oOIWqBOU3Ek=
X-Google-Smtp-Source: ABdhPJzayFhOgFZntgiAOE/EY618MX5PY+t/LDNbQv/eVErJ+86mON1JNnZWa3lXxDa4I2nqJiaAeg==
X-Received: by 2002:a1c:2501:: with SMTP id l1mr12006281wml.41.1611500926916; 
 Sun, 24 Jan 2021 07:08:46 -0800 (PST)
Received: from adgra-XPS-15-9570.home
 (2a01cb0008bd2700e58e9e649f9020b2.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:e58e:9e64:9f90:20b2])
 by smtp.gmail.com with ESMTPSA id m18sm244608wrx.17.2021.01.24.07.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 07:08:46 -0800 (PST)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH 1/2] dt-bindings: display: bridge: Add documentation for LT8912
Date: Sun, 24 Jan 2021 16:08:34 +0100
Message-Id: <20210124150835.1522899-3-adrien.grassein@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210124150835.1522899-1-adrien.grassein@gmail.com>
References: <20210124150835.1522899-1-adrien.grassein@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 25 Jan 2021 08:45:26 +0000
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
 narmstrong@baylibre.com, airlied@linux.ie, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 Adrien Grassein <adrien.grassein@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lontium LT8912 is a DSI to HDMI bridge.

Signed-off-by: Adrien Grassein <adrien.grassein@gmail.com>
---
 .../display/bridge/lontium,lt8912.yaml        | 92 +++++++++++++++++++
 MAINTAINERS                                   |  5 +
 2 files changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt8912.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt8912.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912.yaml
new file mode 100644
index 000000000000..ed1a6ddaab2f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/lontium,lt8912.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lontium LT8912 MIPI to HDMI Bridge
+
+maintainers:
+  - Adrien Grassein <adrien.grassein@gmail.com>
+
+description: |
+  The LT8912 is a bridge device which convert DSI to HDMI
+
+properties:
+  compatible:
+    enum:
+      - lontium,lt8912
+
+  reg:
+    maxItems: 1
+
+  ddc-i2c-bus:
+    maxItems: 1
+    description: i2c bus used to read EDID of the connected display.
+
+  dsi-lanes:
+    maxItems: 1
+    description: dsi lanes count interconnected with lt8912.
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
+          Primary MIPI port-1 for MIPI input
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - ddc-i2c-bus
+  - dsi-lanes
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
+        compatible = "lontium,lt8912";
+        reg = <0x48>;
+        reset-gpios = <&max7323 0 GPIO_ACTIVE_LOW>;
+        dsi-lanes = <4>;
+        ddc-i2c-bus = <&ddc_i2c_bus>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            hdmi_out_in: endpoint {
+              remote-endpoint = <&mipi_dsi_out>;
+            };
+          };
+        };
+      };
+    };
+
+    ddc_i2c_bus: i2c5 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 5aa18cbfb883..01e7e356bfac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10472,6 +10472,11 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
 F:	drivers/hid/hid-lg-g15.c
 
+LONTIUM LT8912 MIPI TO HDMI BRIDGE
+M:	Adrien Grassein <adrien.grassein@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/bridge/lontium,lt8912.yaml
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
