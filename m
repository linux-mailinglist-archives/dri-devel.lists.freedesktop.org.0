Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8AAC23FF4
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 10:05:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4531510EADA;
	Fri, 31 Oct 2025 09:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XQlv3M31";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8802B10EAD7
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 09:05:39 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-429b85c3880so1828407f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 02:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761901538; x=1762506338; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=18hreP4xxLaFHfo0ItO/fnmo3JBInKcj9IQEHPw+gD0=;
 b=XQlv3M31Q2rj0vv072xH86eOIdYgAFnRnp3ODcbR3/yjGIcjkNoNIpMkMSCqnge+Ox
 LlB4Ar7GAK1NR0X90Rhm6evfk0L2Z+0tngirv+dvvHAXcbYz2LHo8Gyu1kplBU4pPOKE
 lNxwj5WiQk0fCkF5rmKLY244x9gk2RYfyVVT1A5+ZwOhnn+dKsymT8I6rHutC/TKFHd8
 i9p1yZ+qf9YtqPWULN2UsqFroW9GAC+bCtMXAwF1XWVenS3UCZZixjHZ4QPEc4Y83MVk
 VRCZIc188Q5R6WKArtnIzfSRGvQXxaMdlMUV04kUGYap5wTcPRTFugkyttHcNGqNF+5f
 HeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761901538; x=1762506338;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=18hreP4xxLaFHfo0ItO/fnmo3JBInKcj9IQEHPw+gD0=;
 b=WK6b9Sbxny1MOmUt/weHSEsuRojy9AHgxyStwXZqqX4OnPeT3dfp1sY1alAvtaDiLQ
 ITdeuANJJk1xK1rFp2sV+THkgqHfmM8SLbpt5D2sJyG0P4Kx3mD3ry6OnJUQRgYEt0Dq
 hbSposlxYfKqdvonkamey9f7r7wmv20W2JKTp7t0khL/pYqC474KhXjES+hzsZOD3j+a
 /LoTsIksDdsgb4IEglhB9vCL5jIXKOWpDPkJiXv9S8OTgkX8zFjaKhmjg1P2m1IwJa98
 JVwtySQmlcV/qcGMG5iMGOZd+63Q06+csdFGmu39mlSGvuzL94EBcWkxSwSTJLWljkRb
 6GeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxc3F+p2qVBtZP9FEO0M1B+zjTr7O8H9L0bF2JNF/zdYNnBNGAB0py9olNkxAg0Rvl3+l00qyujIg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8xewzd784gXpZoRLO4OInJQxorvTbRros9NC/LAhQvxy4MNk1
 xXEX+1M5vk9Tw8hVhnn8spEeY1j9M7YhX7r7UYTU7J1rDqVwfrX4QbEO
X-Gm-Gg: ASbGnctPZiO+OyO6EIG9s2TOj3OoxYdYop/0v1rCmhMtPnY//k028WCYzUHTdj50Qgt
 TaJKGeN5Hgag1FQ+98aZWKcCM44qcd1cZcRT++BtskhYmu1+8/4ZDt/wbvppnrrLFJt/Ps5iWEQ
 csAz4rnt0X8+nk3uB5RXMKP23Q5e83xmAhNxzQUBarf6QO47BXXblFFCJ7w+71YTDlA9ySDKyYG
 8wEoRfRxUR6OQ6kMd7EM988nPU7P6sYJlnE3JxKLrok0uNdhZCl7Jcer2yiEnLtkqgGvxe80x+v
 9H4EOZBmbrYCWBiNiXwx+LRO3UK/BxsXZ4Vy+ToHvaH5MM2njgtvhymqti0h7noTDVbtHNKbwP6
 huCPFmT3L24FQ0EwMypt3qlG910LRCqccojW478zVl1gto69+HG7MpOIIZMP5o/W98vvoPJpFQL
 l0uBpS+taKgeuArqs4VEMArs2gQMMq6igw8PIGKE5vVA==
X-Google-Smtp-Source: AGHT+IHNoK3cnUIF6KdTyd7IGy8y4YEq1qFpnGQ1VkRb4cjN2zo87WIQY2U8y6o5zmD6jrgtQ6cpUg==
X-Received: by 2002:a5d:64e9:0:b0:426:ff7c:86e4 with SMTP id
 ffacd0b85a97d-429bd683568mr2152208f8f.19.1761901537817; 
 Fri, 31 Oct 2025 02:05:37 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([5.225.139.156])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477289adaf8sm93454475e9.7.2025.10.31.02.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 02:05:37 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 31 Oct 2025 10:05:17 +0100
Subject: [PATCH v4 1/3] dt-bindings: display: sitronix,st7920: Add DT
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-st7920-v4-1-35291f8076b2@gmail.com>
References: <20251031-st7920-v4-0-35291f8076b2@gmail.com>
In-Reply-To: <20251031-st7920-v4-0-35291f8076b2@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
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

Add binding for Sitronix ST7920 display.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 .../bindings/display/sitronix,st7920.yaml          | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7920.yaml b/Documentation/devicetree/bindings/display/sitronix,st7920.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c4f006fc41e1f472939725bd82b86a649f9b3f56
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sitronix,st7920.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sitronix,st7920.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sitronix ST7920 LCD Display Controllers
+
+maintainers:
+  - Iker Pedrosa <ikerpedrosam@gmail.com>
+
+description:
+  The Sitronix ST7920 is a controller for monochrome dot-matrix graphical LCDs,
+  most commonly used for 128x64 pixel displays.
+
+properties:
+  compatible:
+    const: sitronix,st7920
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: Regulator that provides 5V Vdd power supply
+
+  reset-gpios:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 600000
+
+required:
+  - compatible
+  - reg
+  - spi-max-frequency
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
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
+            compatible = "sitronix,st7920";
+            reg = <0>;
+            vdd-supply = <&reg_5v>;
+            reset-gpios = <&gpio 25 GPIO_ACTIVE_LOW>;
+            spi-max-frequency = <600000>;
+            spi-cs-high;
+        };
+    };

-- 
2.51.0

