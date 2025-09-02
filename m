Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B42BB47826
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C6B10E423;
	Sat,  6 Sep 2025 22:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IsHy+On2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BBE10E5BC
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 06:53:31 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-24884d9e54bso50039525ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 23:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756796011; x=1757400811; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MU8Gw8tbO6qz4iZSksnsNZa290457GeKEn/IZPBnLlA=;
 b=IsHy+On2fJ5reoNktYeHzYp1B+ZN4JnYKl9y16941V95X7i7Jc8JZ64Ajw9QAHXEDo
 ebrbBPrKfrdGlsCMMbW6EekiXSWJy9pH1k3mJHMt6cCFb72ZKG0GiUFTLiSwmbEbLDPk
 m1WjeDEmx+SHwAotw2VkOnijxTmBYRFz9j4PKtnN6htSf+RaKXyXb/c9VnkPZ/H7Pkvr
 y9+iTDdvU1bMdtRbIlgTDh92GmJEdOfvERWffFeB8lQWPh26gyDRQOfwiEf4Z3BF/nf5
 lmMOP0qdux7Yl4V5N05ci2c07R7f8blfyqgOl3S/NyB1VMQFexf4ybB0Od0UnGZCqgtB
 SU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756796011; x=1757400811;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MU8Gw8tbO6qz4iZSksnsNZa290457GeKEn/IZPBnLlA=;
 b=HUIHXeWzuxE08Jek2M4pww6KlEJKK/dr38autwH04cD9DI8XXG5w72hqKKMnyfcr9s
 Eo3ARyby3UYsuu6Z5u8XWIvLCXzhsFXp7oC/ucgd8yB2j6y18z0tBoB2atMAqnd7xPvz
 bgfWbYohkHYrq1egObQEXtg9ASQI29x4WCplGmZBqpWCuW6rleIfMNn6/N1S/pQZ9ro9
 iBavgRjN37lrMQtDAKOGSQxcIyahemyOYKQe35qW4SddtoDxQk5XGmdo4cShoF5jViqH
 aqO3uBU0qVDiSDfYE/WaTeCAsqFle8jjHgEPk21hUdDqPQyD9LKMkz56YlWFXF/2SBrN
 TH3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9gvY6qwt2ibbZfgYs9OMtL+H/3yVSji1mOp1cujsjcCfFMKXohEuwOUQiKfJ9UzpZJ2iUtV+bPyM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKrtIsWlrFKFlUmr3Ha2dntloi5JjI3DJQKV67YjSgQeK0uRaq
 yRz3CYR5s8hk2Yn18dgCDdhnA5v1/BTv7n6lNZOvshoaWWS+8qHHZNAc
X-Gm-Gg: ASbGncv2+CzBmrNI5x7U6zx0wNLbeoFRSzgcLWXB5dp0m5HRZlKf9zHqcdW0rZ0jqNH
 dk6XK0ZcuhaAuL6xM+b9vgk4TilvTD1QLwqtPNkCUDn0ikIq/SVNeITGclnfR1oju7l0lgnpuUv
 hpJc9iQnxcXqwqV/svJn4UvZ2L0sAXyF0ZXAVHihQrPYKa1SxCXfCLM5v3hhrVs9s0Jd//45Awo
 u1RT1ASL1Hxt9Nh9OW21L4AJ//o8lRq2GoN/Mf+ojGanugcAx1c6K9wBoSj3ji0j6fVUuyYiiP3
 0IHNG2Eik9t0RRn/BRl0CyXU2R8k0kkw4Ne9zl6ZfIUBVNWWcSKwMYtNfz+qXbHdDz/NmnhWpsa
 ByTooGXAgtRPfi1+jC93WV8ZTCB9dlaQF+45wXpqRPuX8SJfbjI3Kih02qFTvlg==
X-Google-Smtp-Source: AGHT+IEnkNRuHNe3v0P3vAgxV79yVwnmXb+O5yf0kLTK/C1JDsKcYGfpwpXbQCLduu6ncmgTmDcnlw==
X-Received: by 2002:a17:903:230c:b0:248:ea98:3d12 with SMTP id
 d9443c01a7336-24944acc7d6mr144066625ad.40.1756796011055; 
 Mon, 01 Sep 2025 23:53:31 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-327e8d3d635sm12312558a91.1.2025.09.01.23.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 23:53:30 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Tue, 02 Sep 2025 14:53:19 +0800
Subject: [PATCH v5 2/3] dt-bindings: display: Add Mayqueen Pixpaper e-ink panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-v5-2-d77c678c4ae3@gmail.com>
References: <20250902-drm-v5-0-d77c678c4ae3@gmail.com>
In-Reply-To: <20250902-drm-v5-0-d77c678c4ae3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Wig Cheng <onlywig@gmail.com>, LiangCheng Wang <zaq14760@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756796000; l=2161;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=P5/2XPz98ClkoAoXRMzbxKUyEvZuY8O/vm7ocp5NTgI=;
 b=VPQSB+Y57f6ux3VjzY/8xlTaqaT7XrDQH8Sjh49++FLcQ1X6oCGUP7kMMDlr9AAnzUpEV9qo/
 pS2DhIRJF32AQAjzUTx4Ijun8MgNE7Sg2SY/8E/w4V8MHGKuuhVWOrc
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:49:11 +0000
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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

