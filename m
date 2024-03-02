Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 659CB86F471
	for <lists+dri-devel@lfdr.de>; Sun,  3 Mar 2024 11:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD37610F972;
	Sun,  3 Mar 2024 10:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paroga.com header.i=@paroga.com header.b="KKsmLH+h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=paroga.com header.i=@paroga.com header.b="KKsmLH+h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx104.easyname.com (mx104.easyname.com [77.244.243.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9060510EA3D
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Mar 2024 21:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=paroga.com; 
 s=easyname;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xW0+iejT2yalW3I7uR9ol2fUym281bnWm2BFQ5PTo00=; b=KKsmLH+hrJ/dLyuvRglF437rQp
 UTuhYPTJmBawJs914abLazYsGvwKPMF1Em12A7ITFtEZzARda/lhMSVxv8eqj+92idr5sTwNhTut5
 CqUrWR7XZQzcnXWU7zuu+rn3W3IgyusTy/koN+8FaoAkNd/N2l51JEYhtaMqVV2ZgaM0hVOztd7x2
 KbN6+2cPwhoFB6iZ6b/pE465GaPpcw/dYQsnqICcVBQjiJxQmUwZdIsnWOuK6S4ygS22nQB2IzGZq
 ZL8c4H3gSqHQwBPxTkT1xZmLuG3fO2i/koYUcwOGQEa6zPDhC/QT/RJO3eVwZ8NoliAKJcOgvIXar
 wDtmQX6w==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=paroga.com; 
 s=easyname;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xW0+iejT2yalW3I7uR9ol2fUym281bnWm2BFQ5PTo00=; b=KKsmLH+hrJ/dLyuvRglF437rQp
 UTuhYPTJmBawJs914abLazYsGvwKPMF1Em12A7ITFtEZzARda/lhMSVxv8eqj+92idr5sTwNhTut5
 CqUrWR7XZQzcnXWU7zuu+rn3W3IgyusTy/koN+8FaoAkNd/N2l51JEYhtaMqVV2ZgaM0hVOztd7x2
 KbN6+2cPwhoFB6iZ6b/pE465GaPpcw/dYQsnqICcVBQjiJxQmUwZdIsnWOuK6S4ygS22nQB2IzGZq
 ZL8c4H3gSqHQwBPxTkT1xZmLuG3fO2i/koYUcwOGQEa6zPDhC/QT/RJO3eVwZ8NoliAKJcOgvIXar
 wDtmQX6w==;
Received: from 84-115-228-205.cable.dynamic.surfer.at ([84.115.228.205]
 helo=localhost.localdomain)
 by mx.easyname.com with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <paroga@paroga.com>)
 id 1rgWue-0005aa-Du; Sat, 02 Mar 2024 21:29:00 +0000
From: Patrick Gansterer <paroga@paroga.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Patrick Gansterer <paroga@paroga.com>
Subject: [PATCH 1/2] dt-bindings: backlight: Add Texas Instruments LM3509
 bindings
Date: Sat,  2 Mar 2024 22:27:56 +0100
Message-ID: <20240302212757.1871164-1-paroga@paroga.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Easy-Autoreply: EN
X-Mailman-Approved-At: Sun, 03 Mar 2024 10:45:57 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Device Tree bindings for Texas Instruments LM3509 - a
High Efficiency Boost for White LED's and/or OLED Displays

Signed-off-by: Patrick Gansterer <paroga@paroga.com>
---
 .../bindings/leds/backlight/ti,lm3509.yaml    | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lm3509.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,lm3509.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,lm3509.yaml
new file mode 100644
index 000000000000..8fbb83934e30
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/ti,lm3509.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/ti,lm3509.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI LM3509 High Efficiency Boost for White LED's and/or OLED Displays
+
+maintainers:
+  - Patrick Gansterer <paroga@paroga.com>
+
+description: |
+  The LM3509 current mode boost converter offers two separate outputs.
+  https://www.ti.com/product/LM3509
+
+properties:
+  compatible:
+    const: ti,lm3509
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  default-brightness:
+    minimum: 0
+    maximum: 15
+
+  max-brightness:
+    minimum: 0
+    maximum: 15
+
+  ti,brightness-rate-of-change-us:
+    description: Brightness Rate of Change in microseconds.
+    enum: [51, 13000, 26000, 52000]
+
+  ti,oled-mode:
+    description: Enable OLED mode.
+    type: boolean
+
+  ti,unison-mode:
+    description: |
+      Enable unison mode. If disabled, then it will provide two
+      independent controllable LED currents for BMAIN and BSUB.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        backlight@36 {
+            compatible = "ti,lm3509";
+            reg = <0x36>;
+
+            reset-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>;
+
+            ti,unison-mode;
+        };
+    };
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        backlight@36 {
+            compatible = "ti,lm3509";
+            reg = <0x36>;
+
+            ti,brightness-rate-of-change-us = <52000>;
+        };
+    };
-- 
2.44.0

