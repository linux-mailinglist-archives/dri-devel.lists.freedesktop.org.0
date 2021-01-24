Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8671D3022EA
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 09:45:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FBD89BBD;
	Mon, 25 Jan 2021 08:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BEA089D7B
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jan 2021 15:08:47 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id y187so8553079wmd.3
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jan 2021 07:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ag6006OGpj/LnO01jq+OCQKPnWe8b0yCa7D0tLaFvmM=;
 b=TOCbp+BDx6RM11NVVijlGdB35BiNyQxSxKuDKWkhO4WEpH3e+pxel1Z0G43APR36c5
 FXI5cWN/NA2C6IVh7v2ZvfVhmZ61uRMyH/GfACuVvHYezD7CyyDQ+AygdmyFCY97VKHj
 C6obY5CUJ+TcZzpJq1LqpBFr+CdWSj9KdVZ7id2Jp7tiTghHREuuAARBrjIl2S2nJoWn
 GI0OVLsAl2+9mIQoBy2VmJawA/EDIZ3+mZzbYWvVMQAvGKkxglRhJyC85WFtkmI7zqdm
 qu/rx45j3AHNxRBb16aZsTLfQIaET4uwba7iqFTsrT5OUVT+pk2MGkWg6Lx1Z+M/xyos
 7p1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ag6006OGpj/LnO01jq+OCQKPnWe8b0yCa7D0tLaFvmM=;
 b=qYutMTAY1SqJ1ZlFPlOq4bYMbrw4iwAYbYheWGJqsOeBJ92xXGKEVTy1YFEGShBLOm
 MSKS5VbaKR/gFuU1vhyy46KJXtl8tnQfjIH1KEKIHpt/7UHzkpN9OvQzokNtHAfU+2Zl
 r+RNq3HszyUrcZ3jIrc1jEpHd3a/qwBbDkOQzBzNGo8WxmcjJN15j2wv6atdjeBfA5Cj
 tLgf5FVrFLEPtSTR6gfRqW78hGhgZFx5oe03bVmHQxsNmZFLWY4gAPX7W5fA0CS4m/s+
 jpn9x/myjJxdF5tt3BeF8+frdagMeULVvV5ACsObpWurxtb5EL00zrAtxmxGfIniVwS2
 fuOA==
X-Gm-Message-State: AOAM530atHhEyuvE4OBuGEiYqGxbzmX/UemK+CE2S4/y4BaHFnNLz+93
 HPaCs3IX0ByjRgR7XhYN+9g=
X-Google-Smtp-Source: ABdhPJzfpNHEnuZxE5BgO0IyKRgf4NPq8SLJLxIo76XFtcaIsh3V8uoLikb9aNFH7f9QrXt1pMxxzQ==
X-Received: by 2002:a1c:8095:: with SMTP id b143mr478249wmd.71.1611500926117; 
 Sun, 24 Jan 2021 07:08:46 -0800 (PST)
Received: from adgra-XPS-15-9570.home
 (2a01cb0008bd2700e58e9e649f9020b2.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:e58e:9e64:9f90:20b2])
 by smtp.gmail.com with ESMTPSA id m18sm244608wrx.17.2021.01.24.07.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 07:08:45 -0800 (PST)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH 1/2] dt-bindings: display: bridge: Add documentation for LT8912
Date: Sun, 24 Jan 2021 16:08:33 +0100
Message-Id: <20210124150835.1522899-2-adrien.grassein@gmail.com>
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
