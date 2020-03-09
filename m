Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E721817DA64
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 09:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEE66E314;
	Mon,  9 Mar 2020 08:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 610 seconds by postgrey-1.36 at gabe;
 Mon, 09 Mar 2020 06:41:53 UTC
Received: from ironport.ite.com.tw
 (HC210-202-87-179.vdslpro.static.apol.com.tw [210.202.87.179])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9E40B89DC0
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 06:41:53 +0000 (UTC)
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 09 Mar 2020 14:32:18 +0800
Received: from CSBMAIL1.internal.ite.com.tw (csbmail1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 0296WEba084518;
 Mon, 9 Mar 2020 14:32:14 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from allen-VirtualBox.internal.ite.com.tw (192.168.70.14) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1713.5; Mon, 9 Mar 2020 14:32:13 +0800
From: allen <allen.chen@ite.com.tw>
To: 
Subject: [PATCH v7 2/3] dt-bindings: Add binding for IT6505.
Date: Mon, 9 Mar 2020 14:26:48 +0800
Message-ID: <1583735298-19266-3-git-send-email-allen.chen@ite.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1583735298-19266-1-git-send-email-allen.chen@ite.com.tw>
References: <1583735298-19266-1-git-send-email-allen.chen@ite.com.tw>
MIME-Version: 1.0
X-Originating-IP: [192.168.70.14]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP: F351ED894EE5A692B64384CA44EDD5D7EA126AF933AE369DAD1C86F7341D30412000:8
X-MAIL: mse.ite.com.tw 0296WEba084518
X-Mailman-Approved-At: Mon, 09 Mar 2020 08:13:37 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 David Airlie <airlied@linux.ie>, Allen Chen <allen.chen@ite.com.tw>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a DT binding documentation for IT6505.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
---
 .../bindings/display/bridge/ite,it6505.yaml        | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
new file mode 100644
index 00000000..e9f6b58
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ITE it6505 Device Tree Bindings
+
+maintainers:
+  - Allen Chen <allen.chen@ite.com.tw>
+
+description: |
+  The IT6505 is a high-performance DisplayPort 1.1a transmitter,
+  fully compliant with DisplayPort 1.1a, HDCP 1.3 specifications.
+  The IT6505 supports color depth of up to 36 bits (12 bits/color)
+  and ensures robust transmission of high-quality uncompressed video
+  content, along with uncompressed and compressed digital audio content.
+
+  Aside from the various video output formats supported, the IT6505
+  also encodes and transmits up to 8 channels of I2S digital audio,
+  with sampling rate up to 192kHz and sample size up to 24 bits.
+  In addition, an S/PDIF input port takes in compressed audio of up to
+  192kHz frame rate.
+
+  Each IT6505 chip comes preprogrammed with an unique HDCP key,
+  in compliance with the HDCP 1.3 standard so as to provide secure
+  transmission of high-definition content. Users of the IT6505 need not
+  purchase any HDCP keys or ROMs.
+
+properties:
+  compatible:
+    const: ite,it6505
+
+  reg:
+    maxItems: 1
+    description: i2c address of the bridge
+
+  ovdd-supply:
+    maxItems: 1
+    description: I/O voltage
+
+  pwr18-supply:
+    maxItems: 1
+    description: core voltage
+
+  interrupts:
+    maxItems: 1
+    description: interrupt specifier of INT pin
+
+  reset-gpios:
+    maxItems: 1
+    description: gpio specifier of RESET pin
+
+  extcon:
+    maxItems: 1
+    description: extcon specifier for the Power Delivery
+
+  port:
+    type: object
+    description: A port node pointing to DPI host port node
+
+required:
+  - compatible
+  - reg
+  - ovdd-supply
+  - pwr18-supply
+  - interrupts
+  - reset-gpios
+  - extcon
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c3 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dp-bridge@5c {
+            compatible = "ite,it6505";
+            interrupts = <152 IRQ_TYPE_EDGE_FALLING 152 0>;
+            reg = <0x5c>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&it6505_pins>;
+            ovdd-supply = <&mt6358_vsim1_reg>;
+            pwr18-supply = <&it6505_pp18_reg>;
+            reset-gpios = <&pio 179 1>;
+            extcon = <&usbc_extcon>;
+
+            port {
+                it6505_in: endpoint {
+                    remote-endpoint = <&dpi_out>;
+                };
+            };
+        };
+    };
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
