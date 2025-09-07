Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8EFB4850B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 09:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185E210E1DA;
	Mon,  8 Sep 2025 07:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vinarskis.com header.i=@vinarskis.com header.b="GIB2EsRh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-244104.protonmail.ch (mail-244104.protonmail.ch
 [109.224.244.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C29810E249
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Sep 2025 23:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
 s=protonmail; t=1757287098; x=1757546298;
 bh=G5wfHuR5Ni6mkr7vlY10NwZv17+YPvp6/bhVfUx8fmY=;
 h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=GIB2EsRhlV8vmBMmFPTgDyzXJbBmWgiPqKkJXpGu6c2W2aqs54JFTXmbFTT4W5b/3
 tkSCZEKRzYq/EP0dLimaJfO8HD0/KSm4Z1cSO7ljimL9mj/gMG3zWPBHJKpnWMcNsM
 x9lsW5HZfejdjJrwR4V10n2U5H1fKr8e7JIRSFimCJseh139SivutqbYhmEhBOWstk
 nNZn6t+TDa2eg3NNQ0DCnHcz2ejeg/5nDQ9iypsunewbJZNtuPvcngpq7VL3hlguhe
 Pzj/SY5Rgx5p6nl1CrK03+Ci/2A3Pb6Kz9h+2Phi5VGeYV7PIY3O/3PojxLoenG3Rd
 zApXiK3v5AlMA==
X-Pm-Submission-Id: 4cKmGc3phGz1DF4K
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Mon, 08 Sep 2025 01:18:03 +0200
Subject: [PATCH v3 1/4] dt-bindings: leds: add generic LED consumer
 documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-leds-v3-1-5944dc400668@vinarskis.com>
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
In-Reply-To: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
To: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3355; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=lA2QBNyFzlfroElsH/5o9X8nJsuBowAAhH88dd9l8Ps=;
 b=kA0DAAoW7a5xog9QAxAByyZiAGi+ErWiECneuhqcwXxifTl533t9DXrlE55CDJVNQEWQfuBsg
 4h1BAAWCgAdFiEEi/z1Zoqina0A1yj27a5xog9QAxAFAmi+ErUACgkQ7a5xog9QAxBMvAD9EL04
 Gi4Gqq+jcFyXgmAD3rA80birf0Z3KNzNtbN5gZ0BAN4D1Whrd466mj1N+Gxvs94p42Vh0hPg7ps
 escQgk+IP
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815
X-Mailman-Approved-At: Mon, 08 Sep 2025 07:25:13 +0000
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
 .../devicetree/bindings/leds/leds-consumer.yaml    | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-consumer.yaml b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d50a3850f6336e9e3a52eb1374e36ea50de27f47
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
@@ -0,0 +1,89 @@
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
+      camera@36 {
+        compatible = "ovti,ov02c10";
+        reg = <0x36>;
+
+        reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&cam_rgb_default>;
+
+        leds = <&privacy_led>;
+        led-names = "privacy-led";
+
+        clocks = <&ov02e10_clk>;
+
+        assigned-clocks = <&ov02e10_clk>;
+        assigned-clock-rates = <19200000>;
+
+        avdd-supply = <&vreg_l7b_2p8>;
+        dvdd-supply = <&vreg_l7b_2p8>;
+        dovdd-supply = <&vreg_cam_1p8>;
+
+        port {
+          ov02e10_ep: endpoint {
+            data-lanes = <1 2>;
+            link-frequencies = /bits/ 64 <400000000>;
+            remote-endpoint = <&csiphy4_ep>;
+          };
+        };
+      };
+    };
+
+...

-- 
2.48.1

