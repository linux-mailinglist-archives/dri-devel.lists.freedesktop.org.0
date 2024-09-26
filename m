Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0EC9872CC
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 13:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4563610EAB8;
	Thu, 26 Sep 2024 11:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QUkixut7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1787F10EAB8
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 11:29:49 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53567b4c3f4so942751e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 04:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727350187; x=1727954987; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=boaDu+sIvPRzC9VmvUSv9+Z+sYmRNTEiwnvZOuYQtbo=;
 b=QUkixut7aKrlwaMitjhlOFEuEKeUb6ph2v8PkTbYIVosgfghRVQxlOR8V7TDta1Utr
 wX6Xowfl+eBZIweJL5/oLwPkIBwpLDkiEA+ZQjjHIqsmplCGjG9aROEPoRDBzCwxFhnW
 WeE0NyJtwhCErRICADjro9qGhqPeWn4I3kO7a7n9Iu8Uk1idF/QWAh/JDmkuezxer6SO
 UcWP/eeRdfGFeHzO2JHrwI8sK+pBwEBwntRvLNDcp8Iu8P+7oeXQEcXsxPM3OIerzUmG
 /XgJ2OBf8Qw1OCB1Wu63ffUFFRUtME/xxjorGzYLag/Tg2rDVsBd3bwGk18qPh4q+bT+
 2uLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727350187; x=1727954987;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=boaDu+sIvPRzC9VmvUSv9+Z+sYmRNTEiwnvZOuYQtbo=;
 b=a7wiIHQJkSi4zoXDlSJ40gv2YxLSukQ8BxN9ZOoHVc5eSSmMSKkYmD5pPNDXNqmQz3
 /Zq1fNsudBnY8uX6klHY2N3Y3DOpHI+CG9xTZ9Xg2FnM6Aql6YU1wsCgCDcJ08o+xsfC
 iYqiI4FYZTFuTUvDux1W/WJyMKF2E9gNn4GfhldDO4hfKzxFlDf8y6w18cMTO80Vzeps
 QkrQ7Fvty9HtgP237Ww4MwbVkEPwUaE1V0AHv4ptBQ5+oDMzY56jvmXFX7LhlPxKq0dt
 HAOhkUlKrBrvz+ySJ7wsuDBpb7kIyXHDLOEMNj4BbmQyuzRpp5tO13uD+e/X3GcBJ6AW
 xANQ==
X-Gm-Message-State: AOJu0Yw7zaFnDhF0ryweq9R9NaO7q/zz8OEZZicWm92c8aO9ccdUBXY7
 C8QyrK8kYJSeAA0WqRwIoUP5lK2+lYgDOCzb5077ceeG0jStlmfi
X-Google-Smtp-Source: AGHT+IH7NtcptdudFNHvQHv/I95ecxrJ8vUbqQTeyGxEIpSlBHSoND+sfqjjs4KC5nLsrrREVEy+XA==
X-Received: by 2002:a05:6512:683:b0:52c:de29:9ff with SMTP id
 2adb3069b0e04-538760347eamr4252359e87.2.1727350187073; 
 Thu, 26 Sep 2024 04:29:47 -0700 (PDT)
Received: from [127.0.1.1] (mm-20-1-84-93.mgts.dynamic.pppoe.byfly.by.
 [93.84.1.20]) by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-537a85ee5fbsm786495e87.74.2024.09.26.04.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 04:29:45 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 26 Sep 2024 14:29:26 +0300
Subject: [PATCH v5 1/2] dt-bindings: panel: add Samsung s6e3ha8
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-starqltechn_integration_upstream-v5-1-1cb0e43e623f@gmail.com>
References: <20240926-starqltechn_integration_upstream-v5-0-1cb0e43e623f@gmail.com>
In-Reply-To: <20240926-starqltechn_integration_upstream-v5-0-1cb0e43e623f@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727350181; l=3219;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=Ci6AW2+uGhWivjbsiMWz6624aSP6GwHomOszXTHHdxU=;
 b=e57xduEVaMpMZpUC6BlWAkyQ5zR2rl//2MWRHwIaVC9nEgtxDykPwRHnZCz3Pi0sD9qa7VqX/
 yByoq1hs2VCCbK9NIwx3mn2SxZ+v7pfEsL37iuA6j6OOziYlaw75Tcr
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
 Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml | 75 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                                                          |  5 ++++
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
index 5e467ba71e3b..cc876e3653e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7388,6 +7388,11 @@ S:	Maintained
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

