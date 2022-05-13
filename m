Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA947527873
	for <lists+dri-devel@lfdr.de>; Sun, 15 May 2022 17:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3849E112404;
	Sun, 15 May 2022 15:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B00B10E5A2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 07:13:01 +0000 (UTC)
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
 by twspam01.aspeedtech.com with ESMTP id 24D6iv4q026840
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 14:44:57 +0800 (GMT-8)
 (envelope-from neal_liu@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 24D6iAZK026760;
 Fri, 13 May 2022 14:44:12 +0800 (GMT-8)
 (envelope-from neal_liu@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 13 May
 2022 14:57:33 +0800
From: Neal Liu <neal_liu@aspeedtech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@aj.id.au>, Felipe Balbi <balbi@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "Li
 Yang" <leoyang.li@nxp.com>
Subject: [PATCH 3/3] dt-bindings: usb: add documentation for aspeed udc
Date: Fri, 13 May 2022 14:57:28 +0800
Message-ID: <20220513065728.857722-4-neal_liu@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220513065728.857722-1-neal_liu@aspeedtech.com>
References: <20220513065728.857722-1-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 24D6iAZK026760
X-Mailman-Approved-At: Sun, 15 May 2022 15:27:26 +0000
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 BMC-SW@aspeedtech.com, Neal Liu <neal_liu@aspeedtech.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add device tree binding documentation for the Aspeed USB2.0 Device
Controller.

Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
---
 .../devicetree/bindings/usb/aspeed,udc.yaml   | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/aspeed,udc.yaml

diff --git a/Documentation/devicetree/bindings/usb/aspeed,udc.yaml b/Documentation/devicetree/bindings/usb/aspeed,udc.yaml
new file mode 100644
index 000000000000..d1d2f77d1c54
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/aspeed,udc.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2020 Facebook Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/aspeed,udc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED USB 2.0 Device Controller
+
+maintainers:
+  - Neal Liu <neal_liu@aspeedtech.com>
+
+description: |+
+  The ASPEED USB 2.0 Device Controller implements 1 control endpoint and
+  4 generic endpoints for AST260x.
+
+  Supports independent DMA channel for each generic endpoint.
+  Supports 32/256 stages descriptor mode for all generic endpoints.
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2600-udc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/aspeed-clock.h>
+    udc: udc@1e6a2000 {
+            compatible = "aspeed,ast2600-udc";
+            reg = <0x1e6a2000 0x300>;
+            interrupts = <9>;
+            clocks = <&syscon ASPEED_CLK_GATE_USBPORT2CLK>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&pinctrl_usb2bd_default>;
+    };
-- 
2.25.1

