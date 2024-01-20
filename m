Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C9583367C
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jan 2024 22:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADCF10E37B;
	Sat, 20 Jan 2024 21:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.skole.hr (mx1.hosting.skole.hr [161.53.165.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D4C10E37A
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jan 2024 21:27:31 +0000 (UTC)
Received: from mx1.hosting.skole.hr (localhost.localdomain [127.0.0.1])
 by mx.skole.hr (mx.skole.hr) with ESMTP id E3C86858F0;
 Sat, 20 Jan 2024 22:27:25 +0100 (CET)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date: Sat, 20 Jan 2024 22:26:44 +0100
Subject: [PATCH v3 2/3] dt-bindings: backlight: add Kinetic KTD2801 binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240120-ktd2801-v3-2-fe2cbafffb21@skole.hr>
References: <20240120-ktd2801-v3-0-fe2cbafffb21@skole.hr>
In-Reply-To: <20240120-ktd2801-v3-0-fe2cbafffb21@skole.hr>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1941;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=0YufyoxCcDHdvrCe1DCC6ao7YtZtJoU6/jXb8S7jhuc=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlrDqXqInMjvZktvxohk5B0k55MzTvucMMNR2Lo
 8DWsVo19G6JAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZaw6lwAKCRCaEZ6wQi2W
 4Q0sEACV6w/f0w85VgGM24DwIZSA1u8Hx8P0fyaIcGANDETP17vxlpI59loasLgO+pO3Wv5WjlR
 i5VKT/+9rFHtbJIPtsinVLc73ycxAQcqhAfgMYG8E8jKwA1wo1IUkUt0EHvc0fa9sevmymhGcc+
 uHZn/rQQ/Yn16+HISMpGpNQhFCTzwA6M4rcQ0xTh3407pC7kKeUL0izDiQ+YTfGdq9Ny24NbQla
 0KKdMqDjFjMUEaQBoeCCW0yl9jWTS8fcHt9ch2ttFNO8COX8Pey9SxuwPWgp4aOZSFx4yqv25e0
 j7WjC8g/f05T4b5Km5oxCmxihOV/UDzcwyVHDLkv9RQjPkMtDqbKNvXZTz8BgMt6lnzAp4XKECl
 63IxwLaQuezDaSnWNZu3VfzQQO/rmVitAXYTWx7ccOX3/tZTP69FeLCb5l8jyKIqceiuZd9/9wp
 i8K0tGdnvdZzabs/ghGr2D78JqYxM56B3zLztqfi/NHgkQRdZ07leP9I1dGG2cMaCfddkrFYlZs
 6HYUgFFSix+XgHv4tIiOZ51RAEgRySOFBqEPXYlcJarcofZHQGmQgcwqN+62S7yqajt5emMvW2f
 2GQKmjP4yO1D4P9XDGFhkRGSya46wwC5gFSGdJ0VIon3sKgU6CBftJuoz1E13r6ISyxxDc+v/Xp
 2C/9mBdY451iNwQ==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Karel Balej <balejk@matfyz.cz>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KTD2801 is a LED backlight driver IC found in samsung,coreprimevelte.
The brightness can be set using PWM or the ExpressWire protocol. Add
a DT binding for the KTD2801.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 .../bindings/leds/backlight/kinetic,ktd2801.yaml   | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd2801.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd2801.yaml
new file mode 100644
index 000000000000..b005065e0f48
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd2801.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/kinetic,ktd2801.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kinetic Technologies KTD2801 one-wire backlight
+
+maintainers:
+  - Duje Mihanović <duje.mihanovic@skole.hr>
+
+description: |
+  The Kinetic Technologies KTD2801 is a LED backlight driver controlled
+  by a single GPIO line. The driver can be controlled with a PWM signal
+  or by pulsing the GPIO line to set the backlight level. This is called
+  "ExpressWire".
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    const: kinetic,ktd2801
+
+  ctrl-gpios:
+    maxItems: 1
+
+  default-brightness: true
+  max-brightness: true
+
+required:
+  - compatible
+  - ctrl-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    backlight {
+        compatible = "kinetic,ktd2801";
+        ctrl-gpios = <&gpio 97 GPIO_ACTIVE_HIGH>;
+        max-brightness = <210>;
+        default-brightness = <100>;
+    };

-- 
2.43.0


