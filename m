Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BC317F19D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 09:19:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 589026E81D;
	Tue, 10 Mar 2020 08:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A306E484
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 15:37:04 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z15so11805203wrl.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 08:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ocG6zPRQYNwCXlJ7RbhAtutb/yhKkjjblU5eUFjRhZo=;
 b=YvbxzOBb6sutSusHp/5ZTutKfCdwTphBBiqrr5zu/6InxASvvH/cTNr3yhBqsr3n7f
 1VWZBYPT8LHsrZ8mdsQpsfG0K/aEOu56zFeKJrTgljXPbDoa/HVxCFATarHr7DvQkQTd
 ocqxPWhdzskbt4/1oY0HJXxwXxviK2HtkqM43XTj1C3b7v7lmiVJ+/Ue4xMRKCFRAQDq
 CJRAcH4TvWzt2ztmaWMo40XBShyVZdkJh2ZDqolODqx+UG30Jgjd5SHEkrvtuFbPWqeV
 tL9exhRzhKgt3Kx2jP8IMDFqHVA6OBfBvmbqJ3oTDbuN2L+m9AAgrQ8XAZdtQLvBAWyd
 hkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ocG6zPRQYNwCXlJ7RbhAtutb/yhKkjjblU5eUFjRhZo=;
 b=OHsqQ4mErXimdTpREua64fS09HmHskOCMiseWioRd0UfDKZ+kiUHBK08ZuWqMveojf
 aQOPPWk/ZKAxzFvY/SUUy/UfWQYWgvTlpnbHOkY+a6nBuW8JvFtIbHjo6zHY+0jfTSyU
 TdiTRvlqe6DUApAT2buLH+njKXNkm2IcacMo0oE15i4oXtiXUWKMTV1xlNv0L+S8Jw2T
 AhBFnzFWDy49TeaZJPUYrSTrkv3gPmEJLBSNZD0dWHSl+w2igFoeNg2YjSN92untqMs+
 rtFzqiMY6LkAuFVW6ZIwfi7LGOI7+wYEU/LLlDTiKiHGj52+ddY8e0so9vRUeK6Nh8mB
 6WRg==
X-Gm-Message-State: ANhLgQ2afhEo6h71PvEGbeCF5HToP/uRkL+1XPFzvUjMke1niM7CRgDt
 6znou+POVN5gS3QpjRepfHSyfQ==
X-Google-Smtp-Source: ADFU+vv79+VIBwAkcUOpUZI0X6WKqKLh4fUWWg8+e+2XJ3gRw+Kk489e+Ks4NC9Dmx8+qKX+K0cUzQ==
X-Received: by 2002:adf:df0f:: with SMTP id y15mr3632400wrl.420.1583768223202; 
 Mon, 09 Mar 2020 08:37:03 -0700 (PDT)
Received: from localhost.localdomain (232.240.140.77.rev.sfr.net.
 [77.140.240.232])
 by smtp.gmail.com with ESMTPSA id h17sm63426792wro.52.2020.03.09.08.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 08:37:02 -0700 (PDT)
From: Phong LE <ple@baylibre.com>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, a.hajda@samsung.com, narmstrong@baylibre.com
Subject: [PATCH 2/3] dt-bindings: display: bridge: add it66121 bindings
Date: Mon,  9 Mar 2020 16:36:53 +0100
Message-Id: <20200309153654.11481-3-ple@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200309153654.11481-1-ple@baylibre.com>
References: <20200309153654.11481-1-ple@baylibre.com>
X-Mailman-Approved-At: Tue, 10 Mar 2020 08:19:05 +0000
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
 dri-devel@lists.freedesktop.org, stephan@gerhold.net, jonas@kwiboo.se,
 heiko.stuebner@theobroma-systems.com, broonie@kernel.org,
 Laurent.pinchart@ideasonboard.com, sam@ravnborg.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the ITE bridge HDMI it66121 bindings.

Signed-off-by: Phong LE <ple@baylibre.com>
---
 .../bindings/display/bridge/ite,it66121.yaml  | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
new file mode 100644
index 000000000000..f546c0b5a465
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ite,it66121.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ITE it66121 HDMI bridge Device Tree Bindings
+
+maintainers:
+  - Phong LE <ple@baylibre.com>
+
+description: |
+  The IT66121 is a high-performance and low-power single channel HDMI
+  transmitter, fully compliant with HDMI 1.3a, HDCP 1.2 and backward compatible
+  to DVI 1.0 specifications.
+
+properties:
+  compatible:
+    const: ite,it66121
+
+  reg:
+    maxItems: 1
+    description: base I2C address of the device
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to active low reset
+
+  vrf12-supply:
+    maxItems: 1
+    description: Regulator for 1.2V analog core power.
+
+  vcn33-supply:
+    maxItems: 1
+    description: Regulator for 3.3V digital core power.
+
+  vcn18-supply:
+    maxItems: 1
+    description: Regulator for 1.8V IO core power.
+
+  interrupts:
+    maxItems: 1
+
+  pclk-dual-edge:
+    maxItems: 1
+    description: enable pclk dual edge mode.
+
+  port:
+    type: object
+
+    properties:
+      endpoint:
+        type: object
+        description: |
+          Input endpoints of the bridge.
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vrf12-supply
+  - vcn33-supply
+  - vcn18-supply
+  - interrupts
+  - port
+
+examples:
+  - |
+    i2c6 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      it66121hdmitx: it66121hdmitx@4c {
+        compatible = "ite,it66121";
+        pinctrl-names = "default";
+        pinctrl-0 = <&ite_pins_default>;
+        vcn33-supply = <&mt6358_vcn33_wifi_reg>;
+        vcn18-supply = <&mt6358_vcn18_reg>;
+        vrf12-supply = <&mt6358_vrf12_reg>;
+        reset-gpios = <&pio 160 1 /* GPIO_ACTIVE_LOW */>;
+        interrupt-parent = <&pio>;
+        interrupts = <4 8 /* IRQ_TYPE_LEVEL_LOW */>;
+        reg = <0x4c>;
+        pclk-dual-edge;
+
+        port {
+          it66121_in: endpoint {
+            remote-endpoint = <&display_out>;
+          };
+        };
+      };
+    };
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
