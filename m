Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D127C5085
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 12:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4877610E682;
	Wed, 11 Oct 2023 10:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F1F010E687
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 10:47:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8692FF80A;
 Wed, 11 Oct 2023 10:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1697021265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3qt0Iwz0wApopLK8eSk42w8JbYkkMjIfQ/k9jDHK89E=;
 b=pXj8npAUzYi/bD5fcei+eSp780xUpiuhTQBJX7eKOE0XlGzqTO3m2Yet+9PNXmE1Fx5oDL
 6TZB7Gsa6gAUz0RmVRiQzwD0nT4+2MxIXl2+qaHhXIt+DsIP5UCcFccjsRtrTemgxJgH9d
 5/5Yp3RUWesgxXrxnVKW7jH78N5AOBkYlr29Uhydxy74L6IpnXywOnXfdh5pASZX/tZgj5
 n72E9KlLF6TZRd+IBK1vGDpIMkxUbbVXckIPNzSxPy+PxITBvWVuybYuKhp5TDKLvauJnH
 qqxZOF8+s6pR6mQpqBmBnWuAIR7yxYakxi0+BNbhG5komJ+YMmt2gCxCW6j11g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 11 Oct 2023 12:47:38 +0200
Subject: [PATCH] dt-bindings: display: remove backlight node from panel
 examples
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231011-dt-panel-example-no-backlight-v1-1-b81618d32752@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAEl9JmUC/x3MQQqDMBAF0KvIrDuQWGhtr1K6mCRfHZrGkIgI4
 t0bunybd1BFUVR6dgcVbFp1SQ320pGfJU1gDc3Um/5qjRk4rJwlITJ2+eYITgs78Z+o07yyH4P
 ADTfrHndqRy4Ydf//r/d5/gApQfZMbwAAAA==
To: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 David Lechner <david@lechnology.com>, Daniel Mack <daniel@zonque.org>
X-Mailer: b4 0.12.3
X-GND-Sasl: luca.ceresoli@bootlin.com
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
 dri-devel@lists.freedesktop.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The examples for these panel drivers have a backlight node in addition to
the actual panel node. However the exact backlight is outside the scope of
this binding and should be dropped from the example.

Link: https://lore.kernel.org/linux-devicetree/20230724143152.GA3430423-robh@kernel.org/
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 Documentation/devicetree/bindings/display/ilitek,ili9486.yaml       | 4 ----
 Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml | 4 ----
 Documentation/devicetree/bindings/display/sitronix,st7735r.yaml     | 5 -----
 3 files changed, 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/ilitek,ili9486.yaml b/Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
index 1f8f2182e2f1..9cc1fd0751cd 100644
--- a/Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
+++ b/Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
@@ -50,10 +50,6 @@ examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
 
-    backlight: backlight {
-            compatible = "gpio-backlight";
-            gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
-    };
     spi {
             #address-cells = <1>;
             #size-cells = <0>;
diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml
index 90e323e19edb..3cabbba86581 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml
@@ -48,10 +48,6 @@ examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
 
-    backlight: backlight {
-            compatible = "gpio-backlight";
-            gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
-    };
     spi {
             #address-cells = <1>;
             #size-cells = <0>;
diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
index 621f27148419..3b0ebc0db8e0 100644
--- a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
+++ b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
@@ -54,11 +54,6 @@ examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
 
-    backlight: backlight {
-            compatible = "gpio-backlight";
-            gpios = <&gpio 44 GPIO_ACTIVE_HIGH>;
-    };
-
     spi {
             #address-cells = <1>;
             #size-cells = <0>;

---
base-commit: 2430fa6470d5e76be39a3e0d6d01474234582f94
change-id: 20231008-dt-panel-example-no-backlight-cfdaeb861b97

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

