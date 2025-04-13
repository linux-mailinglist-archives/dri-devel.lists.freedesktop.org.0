Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE86A871D1
	for <lists+dri-devel@lfdr.de>; Sun, 13 Apr 2025 13:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9BD10E095;
	Sun, 13 Apr 2025 11:24:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OUbsakla";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C9010E095
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 11:24:12 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-ac2c663a3daso648043266b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 04:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744543451; x=1745148251; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vjOM95fm1yVEjV9ys9LW6FSvq+ho9hkw/imzPFIIlXA=;
 b=OUbsaklaqKm7tG3VC5B7/BVhOAfsGlpzMIV1Q4Ubzc63h1rVVkx0tiPKeYekwggewn
 ZlqwjntdliCAVDIL5zj3tpbs3YNjjVa2b6Gebs2CeeJEqhJ8yzh7D6bRqYxeCAG9aOhy
 8IsBnOmzVwG8mLkzwCFuL7I4u5h+8Oiy3JebaYbDMpqvLV+hHh6gcfCDvcOU1JtIaoWa
 zJtcPaxiB6FDaYDt9C9LNrWqfh4wRbliQBB8jR7b2AdjE5JlxqWKK01k8i2oKPFs7uA3
 yN3J34KJ9ruecnr0lb+83QN378Qx1efSAj6KvBT5omk8DoxMxsgEnCRW9cHOy7XUiWFq
 qnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744543451; x=1745148251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vjOM95fm1yVEjV9ys9LW6FSvq+ho9hkw/imzPFIIlXA=;
 b=ZQbOantBq5h2DDo1fll8ce2qdREXV4zbg+R1XTiBB8TGB5XGNnt0ApKTH0DtAw9nT9
 /Z8S4HbShcNDzOJQudotL2IKpJDIhWHP8jqkcqFWAdl0w4zgpZTzKY+JvRhudhgDjBhG
 oChajrILGeT1bS7Gu3WrDPcivJbGx2XRm1978T2PCIOCLuG9Uf32Hdocwvt8QGSAzaWj
 33X8iTfvpsu3Bl5k4hdzpLdhj1nczkIFe0+8pnSFEC6IMG27SW8tsDjfxg+OG3S4M1/9
 kxm80EgZAKz/mW/tcrH4qDdUaH8KnZxxJaOVcqVujPo/Go1JlvABFZvysReBR6fp8TMg
 X6Gg==
X-Gm-Message-State: AOJu0YwDVEvitHZAGKey0ts3GvJ5aoaDGEKdSzNOIRW33qmrurumlfC4
 igW8o+wNoOMuQoSpw6HGUF9KUFsc/7KXiTQCOsUmALFpMg+n1GG7
X-Gm-Gg: ASbGncufBqw52zG12SO9V/YRfIdPcUDNiy98xbNRhswJGqKQ17rUU3Atjmo9mfIDekW
 f333tpSr3TxXlXmXpoI5QaCBKEWK1uK8kohM4Bq1yb0tTNMujpQaV+RO/TypS/InStoplJGRwbC
 943QYP2vzouAQpeT1pHRHoS5std3XJRoHPifaG0KXufzSVZm+nKn8cqOv7BjdYSRpr9fnasxdEs
 Eyc2FQwFxLo+sGGz+eTKewNKbjTpZ8IG6FAR865MnXQkOpggNlFqAY19ZWQQL7E/XcEqNeWDMV4
 yUAmPgysw7qQFQsugb1BAkD/KmBfza0zGiR0yI/6pTk=
X-Google-Smtp-Source: AGHT+IF48B0org9fI292KWudE0JfjDywUs60JfFMrUG4ufUZmtoEpqXk6c+34TImFvFKTJJseY6e+A==
X-Received: by 2002:a17:907:3ea7:b0:aca:a1c9:d155 with SMTP id
 a640c23a62f3a-acad3430e5dmr685779766b.11.1744543450945; 
 Sun, 13 Apr 2025 04:24:10 -0700 (PDT)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1cb4110sm733529766b.91.2025.04.13.04.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Apr 2025 04:24:10 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/4] dt-bindings: display: panel: Document Renesas R61307
 based DSI panel
Date: Sun, 13 Apr 2025 14:23:58 +0300
Message-ID: <20250413112401.12543-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250413112401.12543-1-clamor95@gmail.com>
References: <20250413112401.12543-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

R61307 is liquid crystal driver for high-definition amorphous silicon
(a-Si) panels and is ideal for tablets and smartphones.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/panel/renesas,r61307.yaml         | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
new file mode 100644
index 000000000000..a98d2d2e02d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/renesas,r61307.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R61307 based DSI Display Panel
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  The Renesas R61307 is a generic DSI Panel IC used to control LCD panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+        # KOE/HITACHI TX13D100VM0EAA 5.0" XGA TFT LCD panel
+      - hit,tx13d100vm0eaa
+      - koe,tx13d100vm0eaa
+
+  reg:
+    maxItems: 1
+
+  vcc-supply:
+    description: Regulator for main power supply.
+
+  iovcc-supply:
+    description: Regulator for 1.8V IO power supply.
+
+  backlight: true
+
+  renesas,gamma:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      0 - disabled
+      1-3 - gamma setting A presets
+    enum: [0, 1, 2, 3]
+
+  renesas,inversion:
+    type: boolean
+    description: switch between line and column inversion. The line
+      inversion is set by default.
+
+  renesas,contrast:
+    type: boolean
+    description: digital contrast adjustment
+
+  reset-gpios: true
+  port: true
+
+required:
+  - compatible
+  - port
+  - backlight
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@1 {
+            compatible = "koe,tx13d100vm0eaa";
+            reg = <1>;
+
+            reset-gpios = <&gpio 176 GPIO_ACTIVE_LOW>;
+
+            renesas,gamma = <3>;
+            renesas,inversion;
+            renesas,contrast;
+
+            vcc-supply = <&vcc_3v0_lcd>;
+            iovcc-supply = <&iovcc_1v8_lcd>;
+
+            backlight = <&backlight>;
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
2.43.0

