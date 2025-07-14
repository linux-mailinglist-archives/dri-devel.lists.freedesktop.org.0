Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC922B037EC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 09:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71BC10E405;
	Mon, 14 Jul 2025 07:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JDxYLDLo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE2B10E1D6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 03:00:10 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-74924255af4so3158807b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 20:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752462010; x=1753066810; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fVDZwMbI3MaZsqcDOMuRideVCsmXg1PFZTHplOr/W9w=;
 b=JDxYLDLoU2d660IfsMvxs+N08FpGPqkoxxPJ+KFVHQYauWSQVL5it2chwTmhiWh4VJ
 q/I7yuR3CTI1jiaou/QL8Iyzt4hWZJXyVuNwXgbSUAMZi+ujh5eEwL4yp6gJNqTtRbf5
 p+lSEXKzgez0U3piwdG5rfhRx6/fX5slVzTeIvu/uTZD01vCBCpTEtAjBOnhKvCrYr7W
 0QqTQ2izVrs1w47QoinwSrv8w7SbjOpPf+/Y1lGxfexE0R00BsYnBPX76RHftmpJSNbW
 hbt+VA8ilJsKaxwbqVXBR5Eina5QK49NPJJQq9f8/zTpVSkQ/n3obYh6MGcrTpDMgvbr
 a74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752462010; x=1753066810;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fVDZwMbI3MaZsqcDOMuRideVCsmXg1PFZTHplOr/W9w=;
 b=q2wMrs8XGZViCkNI88I7WcUMr/zs2BmWYP7o4tOey81qfVKYvT2vG3j7DjR4kZL/c7
 pD4w1Ka+skiRayIu783Q5t6d7EHbTM/FFyhthCqaOg0wLutJRvcYwNGPQbp0htSk1+2j
 2Gu4pKp3u1XIsQoXU9gw90VRdKnhSeOFzVEKcKiCX3G/zHimnfq5mOEDL78HdiTpTL/i
 MgePY47WXTEFy/9khSqTXsGXbLhMYOTgxDxF3mTN1HPXxzHob3HY5njT4NwILpmIWEr4
 Ip02xZSXCGxXWYIePHDYsB6GH664HWC7gXmekFvOceFmBAp+/K/X8p6Xb2at3rwY7cUm
 F5Lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXh1fyUf7kmzJn6qaUo0n6gE07kZ62Qu1k6ln9yD9+wPb1Za/+/AsixkwVnj7agutf/gpDM2WlsGzc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuVWcZpCPeWoughn+yH7Vy2hCw0v6EXYXylv2smqXyKtLoyVJI
 2Ng5cvn0x+nFRrhuNkgaG7rlWBbX04f5CTeINjIEyaeOQ/BR/VYb0e+n6v3MWcLS
X-Gm-Gg: ASbGncv4JYAval341YKhZ35+sFR4pUcFaYwyS/Md4xvRyUFcc1B+KBY+Khkilce7FuO
 +P52YLHR1AAfYK3mjioGtbK8IOQb5gzgsjkx57gZMSMtL7mJpai8SlguhMG+X+hhZpLvC6mWUAd
 +itfx6+k8e7y2+uzWvp5AUF/bCNqu2Ke1xsXwNQjxNG0VPVIhtQ6lr5pZ4ybU8KtiD2ixNlRCAm
 4S7M95+wwl96H3nJw2KKJuy9m1sHUcJD8GtSRLLDVTMGkZ+9mfBfzwA7Ol+3eK61pkw+TJ5R9Nt
 ynkPqu8Eri/Nuguc3UIy3Jdh14cZtmMP40/9o3rAps2Zw50rNHZfNZr1NBNehqxzDEfzT/vt+zY
 YwSddw6m4GNeALAPoO6U2mBQ8qvMC4cvoj2CNj+WUZb5+OYjfm9s=
X-Google-Smtp-Source: AGHT+IEDWy/nL9ZFpPp/YZcABCz9sEOblud/9MGZab8eFY7pNur4XOUyYl3wfL5rwPVWTbt8UwN85w==
X-Received: by 2002:a05:6a20:d50a:b0:220:1af3:d98f with SMTP id
 adf61e73a8af0-23137e8e31emr17008690637.26.1752462009819; 
 Sun, 13 Jul 2025 20:00:09 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f4af33sm9034577b3a.122.2025.07.13.20.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jul 2025 20:00:09 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Mon, 14 Jul 2025 10:59:40 +0800
Subject: [PATCH v2 2/3] dt-bindings: display: Add Mayqueen Pixpaper e-ink panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-drm-v2-2-5d1a2e12796c@gmail.com>
References: <20250714-drm-v2-0-5d1a2e12796c@gmail.com>
In-Reply-To: <20250714-drm-v2-0-5d1a2e12796c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Wig Cheng <onlywig@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752462000; l=2111;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=e/Pd6vA+VmaF2zukYk9DBDpw0E2bjx0yWVQX/BqXoL4=;
 b=vl6UO4L2OtbB4leUxXYIMhNLmHTUQnSI6TBUze0Iux6My824R550/+iRDMA69xb3GaVPw+W5A
 U8Un+Cor5MAAkiif7mr0JLL1q6XsrJ4Uo96C7kXzHMPx2M/AhShHwau
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=
X-Mailman-Approved-At: Mon, 14 Jul 2025 07:28:12 +0000
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

The binding is for the Mayqueen Pixpaper e-ink display panel,
controlled via an SPI interface.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
 .../bindings/display/mayqueen,pixpaper.yaml        | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml b/Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..cd27f8ba5ae1d94660818525b5fa71db98c8acb7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mayqueen,pixpaper.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mayqueen Pixpaper e-ink display panel
+
+maintainers:
+  - LiangCheng Wang <zaq14760@gmail.com>
+
+description:
+  The Pixpaper is an e-ink display panel controlled via an SPI interface.
+  The panel has a resolution of 122x250 pixels and requires GPIO pins for
+  reset, busy, and data/command control.
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: mayqueen,pixpaper
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 1000000
+    default: 1000000
+
+  reset-gpios:
+    maxItems: 1
+
+  busy-gpios:
+    maxItems: 1
+
+  dc-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - busy-gpios
+  - dc-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        display@0 {
+            compatible = "mayqueen,pixpaper";
+            reg = <0>;
+            spi-max-frequency = <1000000>;
+            reset-gpios = <&gpio1 17 GPIO_ACTIVE_HIGH>;
+            busy-gpios = <&gpio1 18 GPIO_ACTIVE_HIGH>;
+            dc-gpios = <&gpio1 19 GPIO_ACTIVE_HIGH>;
+        };
+    };

-- 
2.34.1

