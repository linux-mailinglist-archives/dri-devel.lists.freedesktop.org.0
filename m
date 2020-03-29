Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B6C197511
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3899E89F41;
	Mon, 30 Mar 2020 07:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p03-ob.smtp.rzone.de (mo6-p03-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5303::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC8E6E172
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 17:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585503371;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=BIWDKG1mYSIz0Apm2jymGI47SC/hzgbLR6hEwrecsPs=;
 b=BSg+2TcKNtEt+p3kzGAHXbOQN32jYj9Wu3OX/nMTmaBUNvX623VqWttnS6uUBl69Cb
 3FKFvaANz3C+wr5mh10g8CqeNQu1f6W7/wDvwNhAoVf5PNNlxeK1fPJ11tyWPSFGwh3J
 /F6SHxksJB+MFheAwv6gYhWF6TXFtKEmVsbt51BFuWyX6yofPs1+MXsroqj6EnVQjptL
 ZiT/Tcchpjie8RxivPZs7HWYzMW2vA/GMyOt2JklttYACM/8orCEUC94MiLqhGjgAVaS
 zZldQeAqIECHtFxZNPj4NjLwll1n8lCq+cAoO5gShbFifyKHxZVdDMW+6VpNtkzYuf1l
 z+7A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pDz2rsNxxv"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
 with ESMTPSA id m02241w2THZxBMB
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 29 Mar 2020 19:35:59 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Paul Boddie <paul@boddie.org.uk>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Kees Cook <keescook@chromium.org>
Subject: [RFC v3 4/8] dt-bindings: display: add ingenic-jz4780-hdmi DT Schema
Date: Sun, 29 Mar 2020 19:35:50 +0200
Message-Id: <a1a5075ae6c970e97fb74c8dd5c626c35421cd4d.1585503354.git.hns@goldelico.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585503354.git.hns@goldelico.com>
References: <cover.1585503354.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-gpio@vger.kernel.org, mips-creator-ci20-dev@googlegroups.com,
 letux-kernel@openphoenux.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
Based on .txt binding from Zubair Lutfullah Kakakhel

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
---
 .../bindings/display/ingenic-jz4780-hdmi.yaml | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
new file mode 100644
index 000000000000..a545ff8704eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ingenic-jz4780-hdmi.yaml#
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
+  - $ref: panel/panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: ingenic,jz4780-hdmi
+
+  reg:
+    maxItems: 1
+    description: the address & size of the LCD controller registers
+
+  reg-io-width:
+    const: 4
+
+  interrupts:
+    maxItems: 1
+    description: Specifies the interrupt provided by parent
+
+  clocks:
+    maxItems: 2
+    description: Clock specifiers for isrf and iahb clocks
+
+  clock-names:
+    items:
+      - const: isfr
+      - const: iahb
+
+  ddc-i2c-bus: true
+  ports: true
+
+required:
+    - compatible
+    - clocks
+    - clock-names
+    - ports
+    - reg-io-width
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/jz4780-cgu.h>
+
+    hdmi: hdmi@10180000 {
+        compatible = "ingenic,jz4780-hdmi";
+        reg = <0x10180000 0x8000>;
+        reg-io-width = <4>;
+        ddc-i2c-bus = <&i2c4>;
+        interrupt-parent = <&intc>;
+        interrupts = <3>;
+        clocks = <&cgu JZ4780_CLK_HDMI>, <&cgu JZ4780_CLK_AHB0>;
+        clock-names = "isfr", "iahb";
+
+        ports {
+            hdmi_in: port {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                hdmi_in_lcd: endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&jz4780_out_hdmi>;
+                };
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
