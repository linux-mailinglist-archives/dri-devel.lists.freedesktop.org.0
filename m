Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC83A4457C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 17:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759DB10E73D;
	Tue, 25 Feb 2025 16:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Yh785hMB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B2C10E73D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 16:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1740499700;
 bh=WsW4sJ9uxm43lHLyN92viVq/iZ4gai0sRD6kALPbI0c=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Yh785hMBVWmCAIp2fhXzzdcEBabNhdBwxrjQbwrsCQbwOKUPzH0OCNPnIJOppSKve
 bqqd4T5l8fnGjPKHyxBi31VRqBc9Zkd+FdRpez1Lfq+Q5oQ3+jTHwWUW6PtdOE89AL
 HaTf/UzR/r066m2xeqDmfkdiS7FMti80u7Nfj8SofiFiTTwrzLwL8tVw0rrUuOUgOd
 v0pocbUrPiNOZotuYLCsVcfL4WXhtOILMhYY5qHTZcf8uFjALmkKQ/c/0RWLo7jLQ5
 LWYMahf02my5t0dyk1KSMe2+/4XDO8u0dCwJo2/an72E5QkT/wEFoWh4z+jzePIYwD
 YYG4bhUS2fijQ==
Received: from jupiter.universe (dyndsl-091-248-213-055.ewe-ip-backbone.de
 [91.248.213.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: sre)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DB35817E09B8;
 Tue, 25 Feb 2025 17:08:20 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
 id 850A6480037; Tue, 25 Feb 2025 17:08:20 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 25 Feb 2025 17:07:59 +0100
Subject: [PATCH v3 1/2] dt-bindings: display: panel: Add Raydium RM67200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-raydium-rm67200-v3-1-d9e1010dd8ab@kernel.org>
References: <20250225-raydium-rm67200-v3-0-d9e1010dd8ab@kernel.org>
In-Reply-To: <20250225-raydium-rm67200-v3-0-d9e1010dd8ab@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Andy Yan <andyshrk@163.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2453; i=sre@kernel.org;
 h=from:subject:message-id; bh=WsW4sJ9uxm43lHLyN92viVq/iZ4gai0sRD6kALPbI0c=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGe96vSWT6nNH0xaepL9MStCfAqXvMxKy47M2
 ZyuLJNwu/ExpIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJnver0AAoJENju1/PI
 O/qazngP/jevRZ8b1xOfaKeVAdSMJRokkZAkX2JmyRTaIB+auN08BSq7GQVGeuOr5wKuCHip3qI
 xzTjHRGaKJlWdHbJI8dTiQ3XD8gVQ4Mcd+GrQ+SiQkayzSKzmFQnB56k/K6Itvfeb8gnH6IhLtT
 v5amySFcxZ3953GWQ7YFnT4Ukcg7KKiXprg708BsTsnyzp5PFNpsJDIQ3ZnYh3o5THIMwcdt9RY
 bKU/huB+swMTpr0Mev+6pHeyLh2qjwmNzPV3tMv14cypbnHJE4U6lmoH7gcLNyoqk10dSzLxr59
 KoQyGuPtOG1oLbhfHWjlHvq1fgVn7EAwzjetzvEaXRUMR/75+QlFIhpnWr0H0AtKCM8I2J+i4Cp
 e+nkfwzzYkk4d4V8WMGLWLOwkCbL+v7WWRwgnDg3222YtcXJGDTrfoccjDmHlIz0gd3Q6kTFIW/
 BY/BJeec/ceouSR8Mj7f3CpeXr2+eOJ5YTRTc7U0aHROEXV6kb1z2DBZRvjmFhK1eqDiFuefDAU
 7fHjISPSC0ykhfd+SgHwk5++FZoe99uSc7oOVfhf5DYeug7BxumiNWtN5TJO0YVRwhf44cdKqRa
 1/2ItWrYKb2Lysu64QfF5+A+/6qIU6veQewPHUYscOo+b6jZJ9vRZ2+r5hm99vAczOCyPJbbYuT
 CjamL7MczhORJS6wHwdoy9g==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
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

The Rockchip W552793DBA-V10 display/touchscreen board contains a
Wanchanglong W552793BAA panel, which in turn is using a Raydium
RM67200 MIPI-DSI controller. Add a DT binding for the DSI panel.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/display/panel/raydium,rm67200.yaml    | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..54c9c0ef45ecc730c722fb152390db4e6c45aab9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/raydium,rm67200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raydium RM67200 based MIPI-DSI panels
+
+maintainers:
+  - Sebastian Reichel <sebastian.reichel@collabora.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - wanchanglong,w552793baa
+      - const: raydium,rm67200
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: 2.8V Logic voltage
+
+  iovcc-supply:
+    description: 1.8V IO voltage
+
+  vsp-supply:
+    description: positive 5.5V voltage
+
+  vsn-supply:
+    description: negative 5.5V voltage
+
+  backlight: true
+  port: true
+  reset-gpios: true
+
+required:
+  - compatible
+  - port
+  - reg
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "wanchanglong,w552793baa", "raydium,rm67200";
+            reg = <0>;
+
+            vdd-supply = <&regulator1>;
+            iovcc-supply = <&regulator2>;
+            vsp-supply = <&regulator3>;
+            vsn-supply = <&regulator4>;
+            reset-gpios = <&gpiobank 42 GPIO_ACTIVE_LOW>;
+
+            port {
+                panel0_in: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+...

-- 
2.47.2

