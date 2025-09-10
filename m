Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C07DDB51658
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 14:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B07E10E8FD;
	Wed, 10 Sep 2025 12:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vinarskis.com header.i=@vinarskis.com header.b="bSKT7Xkb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch
 [185.70.43.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDB410E8F9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 12:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
 s=protonmail; t=1757505684; x=1757764884;
 bh=wSUr6lywRkV7++24dHfSjXCXpOsK5ZNcHOfkHUT/O9o=;
 h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=bSKT7XkbjnG588aNLU0ZpsIHA9HWKIjf0qk652mIBZXUh59banWFiTvS0BeJUaBXi
 bCVJhegfgovBjo5JMgVcctgIvygwb2ZqCN5b2tHBEBfjUQBTYAfTflNEqHYNnMRMWD
 low5lxjjhDWrQ0jUEB+t65a3U/NkuIYaTCQvZuuaBl2O9bkdRodgWulxxs65qabXns
 BerWIeWUemum+zAzW1dzHpxV+7MCvWdWV7RPOSvMOeYzjryNjmoRw9S8lApzwo+G9E
 OuD28y0uNNX1m7EGBZM49hgBRG2BmTM645a/ecb1LiGDYqYv6gX4XSwlqm50Q/ihu9
 00G0Dik9XN4kA==
X-Pm-Submission-Id: 4cMK6B60Jqz2ScCx
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Wed, 10 Sep 2025 14:01:08 +0200
Subject: [PATCH v5 1/4] dt-bindings: leds: add generic LED consumer
 documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-leds-v5-1-bb90a0f897d5@vinarskis.com>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
In-Reply-To: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
To: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 threeway@gmail.com, Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Aleksandrs Vinarskis <alex@vinarskis.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2711; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=pD1AEKQjXf0zbSv1Q0FNq2EZxbMFJQOJHE/lVcm7Tpc=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBkHM/rdFadwPqyT5p1mcf3nhNX/F+9JNXp3q07TSurTF
 q1jT86v7yhlYRDjYpAVU2Tp/vM1rWvR3LUM1zW+wcxhZQIZwsDFKQATybBkZJjEKibkun9X9SuD
 t3udNsxgSXqQ+L7jgtVjLrmQxDeZPQ0M/zTFVu3V/XRyq3td4tqtIjXpE80q87l3qWxi60uPNt0
 3nREA
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815
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

Introduce common generic led consumer binding, where consumer defines
led(s) by phandle, as opposed to trigger-source binding where the
trigger source is defined in led itself.

Add already used in some schemas 'leds' parameter which expects
phandle-array. Additionally, introduce 'led-names' which could be used
by consumers to map LED devices to their respective functions.

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
 .../devicetree/bindings/leds/leds-consumer.yaml    | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-consumer.yaml b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fe6a0faa1d3b8ff55e05dfdc7697ed2246f0cede
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-consumer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common leds consumer
+
+maintainers:
+  - Aleksandrs Vinarskis <alex@vinarskis.com>
+
+description:
+  Some LED defined in DT are required by other DT consumers, for example
+  v4l2 subnode may require privacy or flash LED. Unlike trigger-source
+  approach which is typically used as 'soft' binding, referencing LED
+  devices by phandle makes things simpler when 'hard' binding is desired.
+
+  Document LED properties that its consumers may define.
+
+select: true
+
+properties:
+  leds:
+    oneOf:
+      - type: object
+      - $ref: /schemas/types.yaml#/definitions/phandle-array
+        description:
+          A list of LED device(s) required by a particular consumer.
+        items:
+          maxItems: 1
+
+  led-names:
+    description:
+      A list of device name(s). Used to map LED devices to their respective
+      functions, when consumer requires more than one LED.
+
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    leds {
+        compatible = "gpio-leds";
+
+        privacy_led: privacy-led {
+            color = <LED_COLOR_ID_RED>;
+            default-state = "off";
+            function = LED_FUNCTION_INDICATOR;
+            gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
+        };
+    };
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      v4l2_node: camera@36 {
+        reg = <0x36>;
+
+        leds = <&privacy_led>;
+        led-names = "privacy";
+      };
+    };
+
+...

-- 
2.48.1

