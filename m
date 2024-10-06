Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0C599205A
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2024 20:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3776810E1E1;
	Sun,  6 Oct 2024 18:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IxGAkcqq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F113410E1E1
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2024 18:21:09 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a9950d27234so61717266b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2024 11:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728238868; x=1728843668; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pPRpID3jJTn8I9V4JMm2nGYUdsIJs/RBQaF/mHpfi60=;
 b=IxGAkcqqhT71gDNBPjY1VDXDm1PaXbU9s2gR2Pl+fZdQF38/VyBODY02Vqt7FxDfic
 duYRBFXqqM2xrarTdtw5hDveMsM4+g4ZaUhA9CyOt+Di6HBsPMffPU40f7ixjXkYtaxM
 GaBEPwwxpZC/3XYA5aJjT1IGc8DT3hcSNz6pqPHWE2hTk8DjYoey1J0o/hBuobpzw+K9
 EROTlFyBTNaDkZYasRGRlx7kO3PjStPiBnYLZ8YqoCOsy0so4Wm/kvE9UYtgRzQnoF50
 y8W5zed+pF6eKO32Aey6wcPSGausz/JPA6R5UwLhS+y4PL0xgawEzMnGNltjG6zNU/bA
 dDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728238868; x=1728843668;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pPRpID3jJTn8I9V4JMm2nGYUdsIJs/RBQaF/mHpfi60=;
 b=wJG58y645FHGcidyAPL4hYlWxwIAbAumLrafF3bnz17I9n88okzgnlENDtJmsMSqZJ
 gwFDdwQCLmaKwDqAF4nKseslnn2mtW78WMKpVQIegYVjjbeljmG/C570Zvvsjod54UJi
 MH6Yf5T9z1aOW/6WN9ToVVm3I5irWoZ6eDi/g67bgZqnPSjhXUSI2VEYNIETnd6eReYZ
 afH5BJIke7QfS2PvrwhVkROy4uClFgDqagNu5pOFCY9Cmz30vY7gmk0RSxSGYOrYuRbS
 gpgEcq8VrX+AEmcTDD5MNgbXw5ARMPLpNj2Sau5TxDVWm5AyQ58oOpY/7vC4TF9EWGH4
 bwEQ==
X-Gm-Message-State: AOJu0YyxaoMH/Y5MGUEpfDBWzUHA1wcbhr2qGkuGpSGT37w9QQa2xt5g
 +Y7fA5rLGFrnib4g6tvirpyvDgrB/qoIZFC9ACcktWtOVQo1z3NorIKztg==
X-Google-Smtp-Source: AGHT+IFOHRPEKGnvsianiFg7jfjUZULY7YP0g7z3ruYzApoi4SvQKdz26dfQx6TN0xPpQmoA+kqVvg==
X-Received: by 2002:a17:907:318d:b0:a90:41a9:7c3e with SMTP id
 a640c23a62f3a-a991c0af160mr1021261466b.65.1728238868235; 
 Sun, 06 Oct 2024 11:21:08 -0700 (PDT)
Received: from [127.0.1.1] ([109.126.148.51])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a992e5ba407sm294080866b.14.2024.10.06.11.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2024 11:21:07 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Sun, 06 Oct 2024 21:18:20 +0300
Subject: [PATCH v6 2/3] dt-bindings: panel: add Samsung s6e3ha8
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241006-starqltechn_integration_upstream-v6-2-8336b9cd6c34@gmail.com>
References: <20241006-starqltechn_integration_upstream-v6-0-8336b9cd6c34@gmail.com>
In-Reply-To: <20241006-starqltechn_integration_upstream-v6-0-8336b9cd6c34@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728238859; l=3291;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=8Nxq3DBjGh+N1qOzmBsPWjVg42NnuOUFW+T5n27Uk9Q=;
 b=R6Zs8DhfXfdOjTS2h+QKaWLtF1i9j/+htA5ELIFVjxPZTzQx8ysSqYGSfUdRu29Ej0vifHija
 2G8c/bDMeVXBapyw/fUW/7ltKBZLEiAS3p8ipe43bNmKCAwM79jGKVv
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=
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

Add binding for the Samsung s6e3ha8 panel found in the Samsung S9.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes for v5:
- fix required properties order
- fix example indentation

Changes in v4:
- change dts example intendation from tabs
 to spaces
- remove reset-gpios description
---
 Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml | 75 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                                                          |  5 +++++
 2 files changed, 80 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
new file mode 100644
index 000000000000..05a78429aaea
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6e3ha8.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung s6e3ha8 AMOLED DSI panel
+
+description: The s6e3ha8 is a 1440x2960 DPI display panel from Samsung Mobile
+  Displays (SMD).
+
+maintainers:
+  - Dzmitry Sankouski <dsankouski@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6e3ha8
+
+  reg:
+    maxItems: 1
+
+  reset-gpios: true
+
+  port: true
+
+  vdd3-supply:
+    description: VDD regulator
+
+  vci-supply:
+    description: VCI regulator
+
+  vddr-supply:
+    description: VDDR regulator
+
+required:
+  - compatible
+  - reset-gpios
+  - vdd3-supply
+  - vci-supply
+  - vddr-supply
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
+            compatible = "samsung,s6e3ha8";
+            reg = <0>;
+            vci-supply = <&s2dos05_ldo4>;
+            vddr-supply = <&s2dos05_buck1>;
+            vdd3-supply = <&s2dos05_ldo1>;
+            te-gpios = <&tlmm 10 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+            pinctrl-0 = <&sde_dsi_active &sde_te_active_sleep>;
+            pinctrl-1 = <&sde_dsi_suspend &sde_te_active_sleep>;
+            pinctrl-names = "default", "sleep";
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 84086d47db69..ccc3cf5114c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7389,6 +7389,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
 
+DRM DRIVER FOR SAMSUNG S6E3HA8 PANELS
+M:	Dzmitry Sankouski <dsankouski@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
+
 DRM DRIVER FOR SITRONIX ST7586 PANELS
 M:	David Lechner <david@lechnology.com>
 S:	Maintained

-- 
2.39.2

