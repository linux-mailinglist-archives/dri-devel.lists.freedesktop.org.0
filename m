Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE9E831E8D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 18:40:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4926410E864;
	Thu, 18 Jan 2024 17:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 409 seconds by postgrey-1.36 at gabe;
 Thu, 18 Jan 2024 17:40:15 UTC
Received: from mx.skole.hr (mx1.hosting.skole.hr [161.53.165.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454FF10E864
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 17:40:15 +0000 (UTC)
Received: from mx1.hosting.skole.hr (localhost.localdomain [127.0.0.1])
 by mx.skole.hr (mx.skole.hr) with ESMTP id 27BD883BA7;
 Thu, 18 Jan 2024 18:33:25 +0100 (CET)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date: Thu, 18 Jan 2024 18:32:38 +0100
Subject: [PATCH v2 1/2] dt-bindings: backlight: add Kinetic KTD2801 binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240118-ktd2801-v2-1-425cf32e0769@skole.hr>
References: <20240118-ktd2801-v2-0-425cf32e0769@skole.hr>
In-Reply-To: <20240118-ktd2801-v2-0-425cf32e0769@skole.hr>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1776;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=iNn7xg36o4SOnQIC660Uj6QfFESJksQoGp7is54EjGU=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlqWDB1JxAMfpI+JslgU8OnmNzd2BuzUDgLgTbn
 RxOcz/B/oWJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZalgwQAKCRCaEZ6wQi2W
 4ZDiD/0fXVj/3tE/NZpBl4xZ0KueJ6+p03t2s+FLZUBCEYfa+wm5lvHCMBy8vDgihzdgDNDdvf8
 F8I+XU+ON5hZiwwKQIXI74g6VOBtJstetpkIdsgEvWpiwaNovurv5MzKG2t89CkpqGHfujP2eB5
 +OiIlpn588ZcR8LZK847TUxTrbq7dAAn8DAV3O+DPMVwAPXeuqb2BSl3mboP9+bsunUbHjruq7g
 f58ifQKxj60bjPsaDXv7lGTghHYDUWCklxKYyEBvhN70qadYI2hRxQeCMzTE0gcjd3a9h3xfikF
 g8+facKX3Bx+7040X/RCeWVMwHSAJlLcM0kbn2aiWlQR4m9D9/O1Za1GA8cWF4ORo/FiQMe7bs9
 8t8kY/BTrsaeG+H2wh7zY4RL4FzFL+0m6oJVHVfQ0Si83EllIEi2QMwJo88ptiZUTVMDRZWTaUG
 j4+q4eYgtQjPBZOxP4z9YsugXvpGuqnHEozzlxdcWit4tIQWtPFC9vapA4dYIACyD2stW7+VRVo
 iLgRHBMBt1srw+ZlUvaIpfFoIJMiwS4OMKAsyfWfQmHFMsAzqZnfyjqEMSgm2PfNheFconwUlwp
 Ontkyi+TbITqvXD7TGuBNwaIqsRHoHRtUHyUIWZH61sM7iyojaZEIiylYho1yJ0WJPCWIQ1VF9c
 WGO0cWm0VIOY5Sg==
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 Karel Balej <balejk@matfyz.cz>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the dt binding for the Kinetic KTD2801 backlight driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


