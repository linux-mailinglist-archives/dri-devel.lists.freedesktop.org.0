Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 825AEAC97FD
	for <lists+dri-devel@lfdr.de>; Sat, 31 May 2025 01:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B4110E8BE;
	Fri, 30 May 2025 23:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="imJVSmNh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B34E10E8AE
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 23:06:06 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-2da73155e91so1023237fac.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 16:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748646362; x=1749251162;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lu3lG7YwnE3Dy5Hk9HzoUTq4JNREs+Ad6+efkztPKBw=;
 b=imJVSmNhpeHQm2cFqMEWrFrB9X9ODp21d9G0OLWAr67JVe6+mjL9q/i6Fvt7sRmraA
 wOwbPXxhvLid2jCkpL2YaTnrIMtIuYxyCVlzwBrXPyPGLLRPYxex1b1/tqcEKUvimBId
 81wsx//9NERY+3M77+FI5F+dmfUdZOrvJ8rsgtBdlrP97629wrayQS1ROsylgrP8YY0X
 aj/wZCI5uqRWdZ84Vk1ec7cuTB9H4xceQlF3wMQhS8kTtc6UvJvM2YiwzhsjARqvFPo1
 GOoUiqhiHjK7ZzoxSuaATX0V3cxcTtw/gHbmsMKeRL483tO2Jh1PBBE+3ilnHOdnEKLK
 528g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748646362; x=1749251162;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lu3lG7YwnE3Dy5Hk9HzoUTq4JNREs+Ad6+efkztPKBw=;
 b=YlOi+ZFnFt6xl5kI2KlbkVAExVPsyRhlr0HuIj7vWDR+s26KFst8+yJISFOaA0liiv
 13FeoNpSzZxMWhV1/5J60Ubf58SysI2UDm5HGnuOAcRLd3VxAs1ieRsjVsaEggQgtEt4
 BFKrsLAYSxj/OL4m1Z+sAoHUhBBOyPh4d9SRei3XQYEbfBaiwm0GWLhTqCX7CS1X8rn3
 ERdnuwIM+uWKynxHGG+cRh3E6iyxlhm47ZMVSXfcx/jZb9weHEWL6Yi/F7JZyH9IrW2U
 ch6fE25gi1Y1KBvhmnNqqSC0sF37qKXsDuRKd85ysa/f6QKX9WZ2hYXfO1UrcMjbT5Er
 hjUQ==
X-Gm-Message-State: AOJu0YwPuEExgt2IargioItdCd+fOPQ2vMDtG87B+LWUr0qz+A9OfDfs
 lJgbFcmV+G+ChmEBf0k17aE0S04boO/pXnLa/kPujpLlQi+v0HU85fDeQ2D22Hy/BhI=
X-Gm-Gg: ASbGnctB3gdIj7PEqpJCbE/bujeEA5/ELdjfyvtlpGi73Zwr+jdcCyTN3my9O/Fy4mY
 SfdmFT+wkB7hJFyZ2DsPlJglBvMYFEeFFxKJ0/OiqzFXTPQD8hEzDows9VLsqApXgct2M27SeUO
 oCz+6br8QAeuDxPRd3I7JskuaXFB0fWsGTN27aeO393JAVpqBA68wraLTvyumQ2tH53CoielK+E
 Zhim5Iyl5CXtGPOTvwZ41l4tHD7Zs6/JoDm/VKD7b4c1VzpoxMptY50K9q0XsWVhfYbOufPwb9X
 lFTXYaYYxRwDUsd3Y50Lf36ZysUG6I7emYC8Q8Mm1gkWf+4Z2uUu6uBcMQ==
X-Google-Smtp-Source: AGHT+IGIfCYtq5fK/ESbkdB6n1mCNo1Fi5i3xpYNU/514FpGxlSOur50JOAQ5a1k03Rg97LdT5qmVg==
X-Received: by 2002:a05:6870:6129:b0:2c2:27c8:5865 with SMTP id
 586e51a60fabf-2e92a1704dbmr2163763fac.9.1748646362032; 
 Fri, 30 May 2025 16:06:02 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4b52:4054:714f:5bf2])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2e906c13c13sm844388fac.45.2025.05.30.16.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 16:06:00 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 30 May 2025 18:05:42 -0500
Subject: [PATCH] dt-bindings: display: convert sitronix,st7586 to YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-devicetree-convert-sitronix-st7586-to-yaml-v1-1-c132b512ec57@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAMY5OmgC/x2N0QrCMAwAf2Xk2UDt6Bz+ivjQtakGtJUkjMnYv
 1t8PDjudlASJoXrsIPQysqtdjifBkjPWB+EnDuDdz64MDrMXUpkQoSp1ZXEUNmkVd5Q7RLmCa3
 hN75fmJeQZ79MYykRevAjVHj7z2734/gBmil6kHwAAAA=
X-Change-ID: 20250530-devicetree-convert-sitronix-st7586-to-yaml-db5d82b63ffa
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <david@lechnology.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4106; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=u0HID6qYCpqSqHWioEM+G4moZPLWcoMb4wYUJNV4vEU=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoOjnPJNOumLdu2oWPK7+HGRz/nw/m4yuJZvoPh
 zz8WLXIIZOJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaDo5zwAKCRDCzCAB/wGP
 wIMFB/4xRAdGwwnFCldEWPft/VX5czF06rng9hS/bcgAKoX/DX4N0uECuHJFnaBzDgRWSokoswA
 9mZQNFSqDC+M0UDwrrEZP8HMFfzyhMKW2YRgjH3keUhJo+wbq0eRmDMtWZtxQ/S9PUFXpsvRkZk
 zgBRtdUrKYGg/GLFSaZ/B7p00+Z16XTFvOs70WcJB+ryF894IzjYuUM2EsLy9bJeIjpnQrXVNvJ
 VblpcsXHDKCVGGaeOaF5fhQYUQ7WMdQ3Ks7BG5z1rlbV9swht7F4/d50h+P+7/EoDHbeaLZAapE
 AkYwIUOpaGrWneqUcMbON8nRpK8t6zGm0ifgFY66EKB85r5+
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
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

Convert the sitronix,st7586 binding documentation from .txt to .yaml.

Also added a link to the datasheet while we are touching this.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 .../bindings/display/sitronix,st7586.txt           | 22 --------
 .../bindings/display/sitronix,st7586.yaml          | 61 ++++++++++++++++++++++
 MAINTAINERS                                        |  2 +-
 3 files changed, 62 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7586.txt b/Documentation/devicetree/bindings/display/sitronix,st7586.txt
deleted file mode 100644
index 1d0dad1210d380849370738dbfb6a7b0e07773e8..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/display/sitronix,st7586.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Sitronix ST7586 display panel
-
-Required properties:
-- compatible:	"lego,ev3-lcd".
-- a0-gpios:	The A0 signal (since this binding is for serial mode, this is
-                the pin labeled D1 on the controller, not the pin labeled A0)
-- reset-gpios:	Reset pin
-
-The node for this driver must be a child node of a SPI controller, hence
-all mandatory properties described in ../spi/spi-bus.txt must be specified.
-
-Optional properties:
-- rotation:	panel rotation in degrees counter clockwise (0,90,180,270)
-
-Example:
-	display@0{
-		compatible = "lego,ev3-lcd";
-		reg = <0>;
-		spi-max-frequency = <10000000>;
-		a0-gpios = <&gpio 43 GPIO_ACTIVE_HIGH>;
-		reset-gpios = <&gpio 80 GPIO_ACTIVE_HIGH>;
-	};
diff --git a/Documentation/devicetree/bindings/display/sitronix,st7586.yaml b/Documentation/devicetree/bindings/display/sitronix,st7586.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..566aaf1aeac81657d3a425f1c585894a3a6f82d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sitronix,st7586.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sitronix,st7586.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sitronix ST7586 Display Controller
+
+maintainers:
+  - David Lechner <david@lechnology.com>
+
+description:
+  Sitronix ST7586 is a driver and controller for 4-level gray
+  scale and monochrome dot matrix LCD panels.
+  https://topwaydisplay.com/sites/default/files/2020-04/ST7586S.pdf
+
+$ref: panel/panel-common.yaml#
+
+additionalProperties: false
+
+properties:
+  compatible:
+    const: lego,ev3-lcd
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 50000000
+
+  a0-gpios:
+    description:
+      The A0 signal (for serial mode, this is the pin labeled D1 on the
+      controller, not the pin labeled A0)
+    maxItems: 1
+
+  reset-gpios: true
+  rotation: true
+
+required:
+  - compatible
+  - reg
+  - a0-gpios
+  - reset-gpios
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@0 {
+            compatible = "lego,ev3-lcd";
+            reg = <0>;
+            spi-max-frequency = <10000000>;
+            a0-gpios = <&gpio 43 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio 80 GPIO_ACTIVE_HIGH>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 0d59a5910e632350a4d72a761c6c5ce1d3a1bc34..58e9591f46c7b3f7621c5a4b66f469ae2a9f9cd9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7815,7 +7815,7 @@ DRM DRIVER FOR SITRONIX ST7586 PANELS
 M:	David Lechner <david@lechnology.com>
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-F:	Documentation/devicetree/bindings/display/sitronix,st7586.txt
+F:	Documentation/devicetree/bindings/display/sitronix,st7586.yaml
 F:	drivers/gpu/drm/sitronix/st7586.c
 
 DRM DRIVER FOR SITRONIX ST7571 PANELS

---
base-commit: 2a628f951ed54c30a232230b5b58349d2a8dbb11
change-id: 20250530-devicetree-convert-sitronix-st7586-to-yaml-db5d82b63ffa

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

