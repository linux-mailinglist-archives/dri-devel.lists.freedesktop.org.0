Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6FFB8A587
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 17:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CBC10EA30;
	Fri, 19 Sep 2025 15:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V9ZqkV6J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E1310EA30
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 15:39:11 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-57b35e176dbso45100e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 08:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758296349; x=1758901149; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=awn/8X3LVfxIDjt817H/4r9cyEH+Oe+JPiZdfgLM5TU=;
 b=V9ZqkV6JyOPPif1KfdVsO7GmGOJ1c+d+2rhdMvVpK+iJYxWLl2W4iWN/+S08TWwjTI
 tBkkc4Kl3gZ0ja5izFKERzeCoDrqEyvN7G1zZ28QZAJDuci199KK5KW8i/S8SBiSFKhe
 Tij/Q4gxiLMvMi/1MC3hXuQRXPhjYTWmkHeoFkn9byhI6lRL4lwl1GjnKv2X12EI5R09
 qQTtnu3aACcYn0wRcKY2Oyo5Y3Pk8RDyn8UgdXzK/fm90yVEVJiE5cx8Iov+JQ8ADfI9
 /uq3rI9OiSDiRF+rFOBDLfqkPvLzaZJuZypNRTvmoQCI7jSCPaPVFz7SZxoONvj+vF2N
 3jOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758296349; x=1758901149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=awn/8X3LVfxIDjt817H/4r9cyEH+Oe+JPiZdfgLM5TU=;
 b=pK2YnkCKUEsvqsOIwTa+gLkK6EvUlIFYv1SOPKbrULv1pM0px0UefmWavZZCqUhyTT
 9ChKHgvzksR7GN3g9I5tYEtemCtih0DaUbrYKDd6ZLu2nCaHqwfH9gpfNvQXAENJv87U
 SlPKqToBN69THS7x7Jgb6QbzoBBK72Jmj116Cxh6AjJtN4P4Y6dE6GAHdO1sst6oFl95
 BrYdSaDqNRJRi26PERYCSmGFEVHe+4WIUKHA97/cUAPLyE/Lh8yeuchfyop72iefY6bg
 /4jnEibDlThe0Q9/RcNHy8Tf+vAoB0LWRGSn3otk5lYcCZG10P7JUOYrVn3WSSqV7XtO
 CJBg==
X-Gm-Message-State: AOJu0YyIWfR0m6ivHZnH5dBwytNTvc1Zvx8BGfPGmFTjIIeULEE/i6/d
 naXM4y9vM9rBbSmxNE5hrE1poJSpZw7GjcaH0/HF6RtJ42zdqrjUCaFR
X-Gm-Gg: ASbGncveHLfMFweEkIxEAouRIVrN+y1tyi2mniKDa2TsDcGmeuGdrfi3/DiZBM4suKY
 S+jBRn+rm/bMjGB7PMf/j//xC+JkuSyRbIddRwh5c0DtgbJXJaz45x23Z35Su9b6GAOfdliTXq7
 btrniOzyXeOZRKmZEHYMOn64wAMRmBrLJxEqA+kjYQS7tK+Yw9fSsIQwv8wFPTZlpcLcHPy7eTS
 gHxYkxiYy6ZSp00LwLQHtUpdX+wlf5sBDZONkwN7iLaPLhJ0TE9mCaw8MLxZn217185wMTR6FFG
 MfEY2BUshzCqoi2wJQNYMjXcKm87alL61l7Odu9pcUCF0OdlITFAP4JDyTdY/KNbabYRaCnXDRn
 u1JhEgTXAsPgQGA==
X-Google-Smtp-Source: AGHT+IH8Sej1anu8ff21sWNo9vQs6p9Oxp87PrlzDoeciz0OvJm22lDYOfahd8YyFL6OT7sgWgEjTQ==
X-Received: by 2002:a19:6b09:0:b0:55f:439a:dafc with SMTP id
 2adb3069b0e04-579e1f4136emr878221e87.27.1758296349419; 
 Fri, 19 Sep 2025 08:39:09 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-578a5f44771sm1485769e87.20.2025.09.19.08.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 08:39:08 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: display: panel: document Sharp
 LQ079L1SX01 panel
Date: Fri, 19 Sep 2025 18:38:38 +0300
Message-ID: <20250919153839.236241-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250919153839.236241-1-clamor95@gmail.com>
References: <20250919153839.236241-1-clamor95@gmail.com>
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

Document Sharp LQ079L1SX01 panel found in Xiaomi Mi Pad.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../display/panel/sharp,lq079l1sx01.yaml      | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq079l1sx01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq079l1sx01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,lq079l1sx01.yaml
new file mode 100644
index 000000000000..08a35ebbbb3c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,lq079l1sx01.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sharp,lq079l1sx01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp Microelectronics 7.9" WQXGA TFT LCD panel
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description: >
+  This panel requires a dual-channel DSI host to operate and it supports
+  only left-right split mode, where each channel drives the left or right
+  half of the screen and only video mode.
+
+  Each of the DSI channels controls a separate DSI peripheral.
+  The peripheral driven by the first link (DSI-LINK1), left one, is
+  considered the primary peripheral and controls the device.
+
+allOf:
+  - $ref: panel-common-dual.yaml#
+
+properties:
+  compatible:
+    const: sharp,lq079l1sx01
+
+  reg:
+    maxItems: 1
+
+  avdd-supply:
+    description: regulator that supplies the analog voltage
+
+  vddio-supply:
+    description: regulator that supplies the I/O voltage
+
+  vsp-supply:
+    description: positive boost supply regulator
+
+  vsn-supply:
+    description: negative boost supply regulator
+
+  reset-gpios:
+    maxItems: 1
+
+  backlight: true
+  ports: true
+
+required:
+  - compatible
+  - reg
+  - avdd-supply
+  - vddio-supply
+  - ports
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
+        panel@0 {
+            compatible = "sharp,lq079l1sx01";
+            reg = <0>;
+
+            reset-gpios = <&gpio 59 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&avdd_lcd>;
+            vddio-supply = <&vdd_lcd_io>;
+            vsp-supply = <&vsp_5v5_lcd>;
+            vsn-supply = <&vsn_5v5_lcd>;
+
+            backlight = <&backlight>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    panel_in0: endpoint {
+                        remote-endpoint = <&dsi0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    panel_in1: endpoint {
+                        remote-endpoint = <&dsi1_out>;
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.48.1

