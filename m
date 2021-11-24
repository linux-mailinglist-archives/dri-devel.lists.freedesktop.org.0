Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7563745CEEB
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 22:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09E46E95C;
	Wed, 24 Nov 2021 21:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de
 [81.169.146.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF536ECE9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 21:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637789358;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=CaK/DHgCjE7tqxBG3dMIhNrm8hb5FjbRiN8SdBS6bsI=;
 b=msdevoLspuG7iyHhL0VQoY19KxapMEjDdYRuQftBp2O9ihj5HEvw83QOALaIOmLISS
 GG9//SbEz60cELPNJPthWrsl0cZPjKEKl0Sh5USxIo0gRMZ/ntDquGZ5B/y6qPtyJjp6
 KUElAbRJmqJAv3cGf3+2kBuatwUOT3UAV+Dvc2nOMuemHGcmocvqt2k0r4HSvhmdDU0S
 FYxTbr7uS913dZJEA83axlCJBn9/V9nnmevF6elGslYDHbxabS1LrdKw07rgg5dG65DU
 azcX/R/04A8K+jP61iMq61MHnf/+Q5hGJpOpoCgIppaZOpvHFIcjTSgoup0zfhIrG1DB
 0/Zg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1KHeBQyh+ITDDRsZQ=="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 47.34.10 DYNA|AUTH)
 with ESMTPSA id e05ed8xAOLTH5At
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 24 Nov 2021 22:29:17 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Paul Boddie <paul@boddie.org.uk>
Subject: [PATCH v9 3/8] dt-bindings: display: Add ingenic,
 jz4780-dw-hdmi DT Schema
Date: Wed, 24 Nov 2021 22:29:09 +0100
Message-Id: <d678e785d95487202ac0660eb66796e9fb5beb50.1637789354.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1637789354.git.hns@goldelico.com>
References: <cover.1637789354.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
Based on .txt binding from Zubair Lutfullah Kakakhel

We also add generic ddc-i2c-bus to synopsys,dw-hdmi.yaml

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
---
 .../display/bridge/ingenic,jz4780-hdmi.yaml   | 76 +++++++++++++++++++
 .../display/bridge/synopsys,dw-hdmi.yaml      |  3 +
 2 files changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
new file mode 100644
index 0000000000000..9ab259ca2d849
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bridge/ingenic,jz4780-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for Ingenic JZ4780 HDMI Transmitter
+
+maintainers:
+  - H. Nikolaus Schaller <hns@goldelico.com>
+
+description: |
+  The HDMI Transmitter in the Ingenic JZ4780 is a Synopsys DesignWare HDMI 1.4
+  TX controller IP with accompanying PHY IP.
+
+allOf:
+  - $ref: bridge/synopsys,dw-hdmi.yaml#
+
+properties:
+  compatible:
+    const: ingenic,jz4780-dw-hdmi
+
+  reg-io-width:
+    const: 4
+
+  clocks:
+    maxItems: 2
+
+  hdmi-5v-supply:
+    description: Optional regulator to provide +5V at the connector
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - ports
+  - reg-io-width
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/ingenic,jz4780-cgu.h>
+
+    hdmi: hdmi@10180000 {
+        compatible = "ingenic,jz4780-dw-hdmi";
+        reg = <0x10180000 0x8000>;
+        reg-io-width = <4>;
+        ddc-i2c-bus = <&i2c4>;
+        interrupt-parent = <&intc>;
+        interrupts = <3>;
+        clocks = <&cgu JZ4780_CLK_AHB0>, <&cgu JZ4780_CLK_HDMI>;
+        clock-names = "iahb", "isfr";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            hdmi_in: port@0 {
+                reg = <0>;
+                dw_hdmi_in: endpoint {
+                    remote-endpoint = <&jz4780_lcd_out>;
+                };
+            };
+            hdmi_out: port@1 {
+                reg = <1>;
+                dw_hdmi_out: endpoint {
+                    remote-endpoint = <&hdmi_con>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
index 9be44a682e67a..9cbeabaee0968 100644
--- a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
@@ -50,6 +50,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  ddc-i2c-bus:
+    description: An I2C interface if the internal DDC I2C driver is not to be used
+
 additionalProperties: true
 
 ...
-- 
2.33.0

