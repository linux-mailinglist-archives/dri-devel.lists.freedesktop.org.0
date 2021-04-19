Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA2F363C42
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 09:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1413189F45;
	Mon, 19 Apr 2021 07:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BCE89F45
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 07:12:26 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r7so20776527wrm.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 00:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CVHcO7akxBa72/X7FrsMB/fvKb0p1e2KUjNMQdLiNAc=;
 b=ZMzkwdXp/CzrI7tBL9v1ONStdrw1ViW4X//V00qNjTFeskT1zQy3AwkbZEHmm/PdsB
 4+55Tyu31p5Z3gFfbQV956zejngtCVRWrr4aUhSsUxAjr3EknGaeVosXEn6x1iiq6Q57
 /V6MIariYSuYikcTfBqn8v9ML+Df7SOl5oNNqWa4QkyTPJB8WG3r8Xwgz7L+nu86QDV9
 VkWSEs8ODal2PNVVvTG1YQhbw0iUOjIqobtR0Yagf4kKna98wgyU29KRKhkApGc/piZA
 BQJ4O/9wO+ulPBp2CuMU9gTeOunsNeXJQgGo/k4qd1EH00FGBdKKwphMNd1cUWMhdcek
 RIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CVHcO7akxBa72/X7FrsMB/fvKb0p1e2KUjNMQdLiNAc=;
 b=SecAJbKVjtrk3dWh+DbxUGFww3LvUQ2Qkq+hncTBAxA0K5wI/gPOnKeGLszhaqLJVC
 yyph6EfUga+uZ0GIwvdk1QPkf4RcgC9khDcLCzzt+TMicJB2zC3XALCD+EoifjEfco9n
 gn5gyUuof5sDQ60yMy6EqqRXNB85VggD/cSVX2Euz/S6ihNrnThCM3I9aKJ6DSIdOAib
 c45ChxhWpkew18Tf2M7y8MJIL83WBZFiL5Mm0ZgvXsZL9kbsubj+FIoM5YQmh6OvWRes
 MGdBAnaFsR1IDgp0knERsIeYs0PQyrsIrxg3TXwq9dPP3LJDKbDqckUdOzi5PZsIfAtQ
 YSwA==
X-Gm-Message-State: AOAM531C1BGAyEPluYFAeGSjgde3Hz6lnGV5/fGFhKcfD7/Omz3jA0OU
 a6kC7yrOZ6+SMnd4c2RE0VUqWg==
X-Google-Smtp-Source: ABdhPJxczwmslePqXk+KftKBflLc3iAlG17HunPpf12xQ4UKo4Ipg4xfRyX1Z6kJq4DFZhMSpxzwhQ==
X-Received: by 2002:adf:ecc8:: with SMTP id s8mr12462248wro.169.1618816344715; 
 Mon, 19 Apr 2021 00:12:24 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:2e82:31e6:67f1:4f33])
 by smtp.gmail.com with ESMTPSA id
 i9sm10447922wmg.2.2021.04.19.00.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 00:12:24 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 paul@crapouillou.net, robert.foss@linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: display: bridge: add it66121 bindings
Date: Mon, 19 Apr 2021 09:12:21 +0200
Message-Id: <20210419071223.2673533-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419071223.2673533-1-narmstrong@baylibre.com>
References: <20210419071223.2673533-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=A37XVUhvAjeOHadMAQvzsTXvq4/Mx+3fpb+QMgZO0wk=;
 m=hE6W1GKMCnDe7Xl9Y2XkaKJE8GpE3GDH9eFQ15OmrR0=;
 p=eWsF/9X6dJ2dGxyfExV9lgaFxqhX7MsrvS3ZLcdKl2U=;
 g=b0191a1ee2971a02d75b9362a1e39795593059ab
X-Patch-Sig: m=pgp; i=narmstrong@baylibre.com; s=0xA4CFF8AE;
 b=iQIzBAABCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAmB9LUEACgkQd9zb2sjISdGQ+w/+PKr
 bmPInssnRpLnrUXH34tL/DOBc1ijeBguSraXABsWzrn1WtmxnEN26WsStOUHD0h+s0pEEVz6UjWde
 zMbs1WWTa0tAPRY/pVAtMwnIvVA0jf1hvIHx+jY8A8he6oMzhhBIqEnF+13yZw9xlcJZdP0dgRw1N
 4U6sJwqpxuk+vaOXrRexMshwNNBKBsX7xhj+8cIDuOGHkQr7xK84i+pfPAyGdAX+onwbhJuUEp4ct
 tx0oA6qIousQTQTIiV0CdJAsXHOG4tQrRBCrI8vTUfMzPQuDqNbfu6FZilPW9BySsGtXe9Jh75p+J
 5dwobwC2XumiiV//ecuN4+TTHStKMHNb0WiD4/jhiGxtCVHuX4QgJ1h6wrkYf2+3Huq4uR6Fd2EHs
 Oc91zTlc4JQgWzNWeTUDwaIaduWdtoQ49QFH0blNMEz/5EK5tqwNYhxuqp7+uR/h3Y2BIcQWXz1Y8
 i/u2O3D++aPFK7JGQdWwwHxYXwcOmTCypVdGyvDsNIlaq/FgRV+iB9TwYJxNE6kZ+dOP/KCwfTsEA
 V5DQYpDnggXd7ys3KMff8FXz6qG7/btmLbNK2/AARUOa6TEYxgONq0MhOhvEtsue5ExtaWLLIPLbs
 WRiQw4UAqMcQXm1VYYS0rFouyfLWLf2OYOg4P+wgnQPWRcgFJcE7eeRpff/tmB68=
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
Cc: jernej.skrabec@siol.net, Neil Armstrong <narmstrong@baylibre.com>,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Phong LE <ple@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Phong LE <ple@baylibre.com>

Add the ITE bridge HDMI it66121 bindings.

Signed-off-by: Phong LE <ple@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../bindings/display/bridge/ite,it66121.yaml  | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
new file mode 100644
index 000000000000..6ec1d5fbb8bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ite,it66121.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ITE it66121 HDMI bridge Device Tree Bindings
+
+maintainers:
+  - Phong LE <ple@baylibre.com>
+  - Neil Armstrong <narmstrong@baylibre.com>
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
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to active low reset
+
+  vrf12-supply:
+    description: Regulator for 1.2V analog core power.
+
+  vcn33-supply:
+    description: Regulator for 3.3V digital core power.
+
+  vcn18-supply:
+    description: Regulator for 1.8V IO core power.
+
+  interrupts:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: DPI input port.
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+            properties:
+              bus-width:
+                description:
+                  Endpoint bus width.
+                enum:
+                  - 12  # 12 data lines connected and dual-edge mode
+                  - 24  # 24 data lines connected and single-edge mode
+                default: 24
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: HDMI Connector port.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vrf12-supply
+  - vcn33-supply
+  - vcn18-supply
+  - interrupts
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        it66121hdmitx: hdmitx@4c {
+            compatible = "ite,it66121";
+            pinctrl-names = "default";
+            pinctrl-0 = <&ite_pins_default>;
+            vcn33-supply = <&mt6358_vcn33_wifi_reg>;
+            vcn18-supply = <&mt6358_vcn18_reg>;
+            vrf12-supply = <&mt6358_vrf12_reg>;
+            reset-gpios = <&pio 160 GPIO_ACTIVE_LOW>;
+            interrupt-parent = <&pio>;
+            interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+            reg = <0x4c>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    it66121_in: endpoint {
+                        bus-width = <12>;
+                        remote-endpoint = <&display_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    hdmi_conn_out: endpoint {
+                        remote-endpoint = <&hdmi_conn_in>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
