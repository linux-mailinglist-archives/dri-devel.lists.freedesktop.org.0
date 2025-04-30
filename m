Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1D7AA54D8
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 21:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B0F10E337;
	Wed, 30 Apr 2025 19:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="uadEoE1N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76B410E33B
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 19:42:23 +0000 (UTC)
Received: from [192.168.78.162] (254C22F1.nat.pool.telekom.hu [37.76.34.241])
 by mail.mainlining.org (Postfix) with ESMTPSA id 04485BBEE6;
 Wed, 30 Apr 2025 19:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1746042137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p7iTFH8wryWVIV4vQps86xm7Px3sNvpwYf6RR1kDxKU=;
 b=uadEoE1NvtB5XJQmfXHxnSzIHcgW7KTTO1BCuDf865txnLiRQ5y27kgxbI9lPf53jkdQ2W
 iB/iIf7FMKRk8wWE9FY52U3oDdrftHt+kygbG5uwpOMHMdJZwxJ0qVfQj4845CzWh8aWSe
 GblzDBR8S/zphHwtUyzCsNAEre4VwA7RRS08Q2/Z+oNWZn4znzVYFztgMeyeUlFXtl258D
 P72JLVqYmIDsaOfihkT2H9Urr/p92Uu9tLU0aoYoEK1dD2+WPpjzg2jFRZxWCb5iqFiUY7
 aeILlHyCMg04VGnh++zD3QEiCmyUeYwARw4PIzB6Sx1O8t7PLvc1MWsNjcba1g==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Date: Wed, 30 Apr 2025 21:42:12 +0200
Subject: [PATCH v3 1/2] dt-bindings: display: panel: Add BOE TD4320
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250430-lavender-panel-v3-1-7625e62d62b2@mainlining.org>
References: <20250430-lavender-panel-v3-0-7625e62d62b2@mainlining.org>
In-Reply-To: <20250430-lavender-panel-v3-0-7625e62d62b2@mainlining.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746042135; l=2081;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=zXjb07RtDedq+fgNr9ddFpdm9YayjmMfLiEq/OVt7PY=;
 b=bRVdgXLOiduGCafBtwOtZ9vnb7OhX2iKR7mG7CiNP/nuz0Y+m+lQVDlWjfawN7q5Egun//aRU
 Vp+0p9jt9mfB2Bcu2WVumgCyJ3xFaOymtrmMUX++2soYxBwf2LxaQmU
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
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

Document BOE TD4320 6.3" 2340x1080 panel
found in Xiaomi Redmi Note 7 smartphone.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 .../bindings/display/panel/boe,td4320.yaml         | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,td4320.yaml b/Documentation/devicetree/bindings/display/panel/boe,td4320.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c6bff0ece360e6436a04f7d4740f43f45b887fc8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/boe,td4320.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/boe,td4320.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BOE TD4320 MIPI-DSI panels
+
+maintainers:
+  - Barnabas Czeman <barnabas.czeman@mainlining.org>
+
+description:
+  BOE TD4320 6.3" 1080x2340 panel found in Xiaomi Redmi Note 7 smartphone.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: boe,td4320
+
+  reg:
+    maxItems: 1
+
+  iovcc-supply:
+    description: I/O voltage rail
+
+  vsn-supply:
+    description: Negative source voltage rail
+
+  vsp-supply:
+    description: Positive source voltage rail
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "boe,td4320";
+            reg = <0>;
+            backlight = <&backlight>;
+            reset-gpios = <&tlmm 45 GPIO_ACTIVE_LOW>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.49.0

