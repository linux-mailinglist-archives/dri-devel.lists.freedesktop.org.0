Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB23AABF6D
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 11:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D93110E5FE;
	Tue,  6 May 2025 09:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QFu2AcyZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EE210E5FE
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 09:27:32 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5f3f04b5dbcso8236257a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 02:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746523649; x=1747128449; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lGu7LhU0yuQjvrQRuLffc4jYy8h9uFV4UIKwGLQkBLc=;
 b=QFu2AcyZayObgx2a/l4LTg7WITIfZYHgoRM/PchsqMVpfBZHS92wp2IRRUXgF2EfvG
 ngihXRTfoaAHsoGP7jw/qYUq5i/2SNubVh3o8uKDh/fJ89903leFs3OxpiksZrzsM8iN
 BkRzY2c+jbnk4UBgSYHH1Z9XAWpbYB4ILdH8mDwRkqPk+ajg1jDNYXv0sHuGpCdDbClY
 IugbBTTrf8EMwa6I0zLqw2tBmx/g5X1ft4Rgmi0qNUUxavURiIl8apoulbi2gic6S6fM
 ToL0wIohHr3C1lRnPJwumGiZEe1wLyxvgKVzrW9hHryQ5BJu3mLOW3Jm1uK5CqRVssw9
 h1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746523649; x=1747128449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lGu7LhU0yuQjvrQRuLffc4jYy8h9uFV4UIKwGLQkBLc=;
 b=fGKswevqwiTcaK/032x4Xkq8kB0DwNli0V419fqL6crJuGXeGxhOCp577gvUYXSr1t
 JR/65yGhKaoZU0sLm3t65l0P7zzx5xOULc+ylNLPdqwo/83BfEO6tYuXAq24Stnqm77T
 m/8KBhNim+nT1RyyicY/UXAivn4YJn/ucknX63a22N7xayh0Od9VZfSK/GatJ8pFlT6X
 tCMGaWNLXp1NWlySpNW+0xV6ohTp8+YkYtFt1qsgXSpmZWHExKFFnOhLaZXA+oN6jzkY
 yN+4OQO6/Wnq+oHV2k3mcUHELB3mrmS89tsVDqZZdsaTf4ynD2O6IvyuZxPa4NaYZnsr
 mYuA==
X-Gm-Message-State: AOJu0Yx3o9hsI8b0ESGZuKo0mi/qhnq2AEo8+SJEUmspFGF6NadD9HBK
 NOWhBbTaOjEiAJ1gzN7FPXnpSFUY162qnULsTXwTB7AueCRNmFyV
X-Gm-Gg: ASbGnctPzEuxbKV7fGBFuGjZmjkqQ6jMe/e6A+UWtojUiYI/KSR65L/rOegyxFHUV50
 opwnWxklNoePmjwRzFkt2IORBUBlkG910FDfgrCvChUMQoaVFh7Yo9JxRX6UZPrwcs6lQxodllP
 Be9/wJqYY1ggLaL/ebcOGaALVDWkx9FhkbfOTdUq1kcGjI4kWWRhPRMmH7nzAH0ODM8s02Dl7IH
 oWnD8nWl71rl33hAmImj9znd0ZOWyWZbWy6BPFZV3iVMggkFjRgOIwa172Bu20SYNfDnSdLajRH
 sJxuWPaSo9Y1HghTgLGuMFjNs88piOtM
X-Google-Smtp-Source: AGHT+IGhIlN7H6wg1elqqV9jwrYvYXb1edROSQNCTGiGLRJV0RIHV1Wsa8r1kfwlEzYBRxgYX34WYw==
X-Received: by 2002:a05:6402:4408:b0:5fb:3a35:b92d with SMTP id
 4fb4d7f45d1cf-5fb700a3992mr1831361a12.20.1746523649051; 
 Tue, 06 May 2025 02:27:29 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fa77756206sm7349523a12.3.2025.05.06.02.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 02:27:28 -0700 (PDT)
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
Subject: [PATCH v3 1/4] dt-bindings: display: panel: Document Renesas R61307
 based DSI panel
Date: Tue,  6 May 2025 12:27:15 +0300
Message-ID: <20250506092718.106088-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250506092718.106088-1-clamor95@gmail.com>
References: <20250506092718.106088-1-clamor95@gmail.com>
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
 .../display/panel/renesas,r61307.yaml         | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
new file mode 100644
index 000000000000..90cce221c0d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
@@ -0,0 +1,94 @@
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
+    items:
+      - enum:
+            # KOE/HITACHI TX13D100VM0EAA 5.0" XGA TFT LCD panel
+          - hit,tx13d100vm0eaa
+          - koe,tx13d100vm0eaa
+      - const: renesas,r61307
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
+  renesas,column-inversion:
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
+            compatible = "koe,tx13d100vm0eaa", "renesas,r61307";
+            reg = <1>;
+
+            reset-gpios = <&gpio 176 GPIO_ACTIVE_LOW>;
+
+            renesas,gamma = <3>;
+            renesas,column-inversion;
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
+...
-- 
2.48.1

