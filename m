Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9C1BA694E
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 08:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E056210E1D8;
	Sun, 28 Sep 2025 06:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kYn05Z6D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7CB10E16F
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 06:41:35 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5688ac2f39dso4214240e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 23:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759041694; x=1759646494; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6FnFEZ5LGZZEO2hmpfl9TQ5ygFYB1UXSn1kYbGCnXkg=;
 b=kYn05Z6DIszeGmbd5uiOyw14yvROyJ+V2YvkjZ1grKrtiZ73UfKc0buquIc5JU5u98
 tMFVFo78ilU/S/QMKfUp5ZwFHnLTFCsPVcs4rIx9DL3TQKcicTmpmCefUQjHB11FyQP1
 W3moyslAPOrS5KvMnNThK1WNmVgvJe6Z9tCWONzy81v5Yy6V35HKTixWFd3XDwK+ahy4
 0kQHeaIOSSyoLk7Tk68XbF838hJhhVKathf2KDz1IRw3mh808cNqdVUlPkbEYXSEalv1
 myVIJFPFCt/a79khHM8NBPY9TdZtkeZuZpL0dzY8vLNdF1KS5ZFFdXpWptdgJHDze70i
 HmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759041694; x=1759646494;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6FnFEZ5LGZZEO2hmpfl9TQ5ygFYB1UXSn1kYbGCnXkg=;
 b=SyZ4oZk1wPQco2OzKu+R334pA3MFg4qWtA3+RRG/Va7tWY1L1Opd1i/zyyKSStB//H
 Dbexp5JROlowyQp2L+Cn7T4TBxAdHGMx/MMMVlQ3rbP9BVIbzbn7AQz4X2/YxTDCFsIz
 96N6IT9vWclX24ep9MgXKKeoSi0FA5hI5/Vv8MlEVXLfkQbm7hp7YW+V8Iys6hWjCqP2
 giBZicwet7Yu8mdXI0b1DGEcFi8gWusicq6rJ6h1uFmsAoUovpEdgY1qqddc5HpLILTf
 PfCJD4M4Hg6oBkkaXuqf0iFYu2l7oeHX7JaUnjLe/r4DysN9CtTpu/+9WSoBsnyU2JG9
 JXTw==
X-Gm-Message-State: AOJu0YwezUuFhjXDInpNpPa1Sm9q7UrzO0iLBz8pUS/+MshTjoKVmUd1
 o5GLXvBSiY2WbHIHV1EI4s5CW1PQpRZsPQA4TD2WwM1fPWPAvlLOJcBg
X-Gm-Gg: ASbGnctECFE06WCCFn/aW2JRD66ba4//+wXVTbPYr+2ec7pqhT0Tus4/e0+okgWzYVB
 ftcCMBqWtL7/m1WAzIsFwF01lk1XYj3z8F/SNw+KaBAhy4Gi7OQS7oOftTTzVKvKPPLb8m9xKkV
 rADYh3zVVZpTSLOvEp/53E3yWrsJshHDAAS1XzbGOpFoNzeOedmn8VKEC057Bpu0HdQr72eYTl7
 gomlkMM+OIFq5gVT5uYWsu8ORQAwwCm7Sch1f9mvfNfDpg37DsbFUhCk3uTARKnn+y1EMdDesYx
 KvwlElz0OSlk+UxobtSkTAMcCVWFHSWk63g8oG6hsqYU7Awa9pKd6WufcaQZiAdaJsgDIXI4Uxh
 iVaWtmZv1Cym6cw==
X-Google-Smtp-Source: AGHT+IH8xZzvLuvaCAObWM3V1fA70/Df62/NH3/n/3QYa3d0xT8JD5kels0Lf74NDzkm29Ip6iNCZQ==
X-Received: by 2002:a05:6512:2c07:b0:57f:42c8:409 with SMTP id
 2adb3069b0e04-582d2b4a26dmr3042147e87.39.1759041693640; 
 Sat, 27 Sep 2025 23:41:33 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58600043386sm973735e87.86.2025.09.27.23.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Sep 2025 23:41:33 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: display: panel: document Sharp
 LQ079L1SX01 panel
Date: Sun, 28 Sep 2025 09:41:05 +0300
Message-ID: <20250928064106.46756-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250928064106.46756-1-clamor95@gmail.com>
References: <20250928064106.46756-1-clamor95@gmail.com>
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
index 000000000000..1a52527eb614
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,lq079l1sx01.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sharp,lq079l1sx01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp Microelectronics 7.9" QXGA TFT LCD panel
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

