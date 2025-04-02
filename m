Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7442A788CE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 09:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF4710E6C7;
	Wed,  2 Apr 2025 07:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ixbdvtbd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6D110E082
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 06:12:43 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-30bfd4d4c63so59952381fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 23:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743574361; x=1744179161; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LqLYe1FqZ+fWkZUMEsoaaGbBxE6T5DwROgxnXgSu3vs=;
 b=ixbdvtbd+qnf2CCoRFfyjh/pama11H9tMT994dRVOGbvMmjUwqE0tfRFxUsj3meI9M
 BUVvw9NSA2nKvylpcy/P8suUPXPnjyaOlnqoLVbioMS3m5Rvqe60QIyhrKEo5rgnUbNc
 K5jZI+xpXQRio5Fqi1JXBQ/FGGA2RAtH7qC2KUedVzw4l96DvxqyNIU3/7ZQqWAaRIt2
 MnrM+/blU4WqyhL1SrJYifJVAVp3MWhvVBkPxYItJaED4PjrFcFX9ImAmomGVUyW7t50
 /8Cn4MlPMImehgOsCtoBoGBlaWK6DQWfjiyTHD++J/pu1p+STWwcRn8MkFred9vuooN5
 dBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743574361; x=1744179161;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LqLYe1FqZ+fWkZUMEsoaaGbBxE6T5DwROgxnXgSu3vs=;
 b=ouDSRqIHNnv9o/S79wmA20gcGwBWlZfO+lSP8yjzTtg2Sw00M9Og88cQgTrax1urI6
 tIxB6Kgyufqj4dB5i5McUaLYlosSRD2U9+IIQYKZt7AHUgiLUkAQqu5zC8tMq4gn3EYx
 QDF/vNvUoxGSp+NGTmRZ9SAkdj+ywXL8ackDPWMgVXRLXfGgl68H8dNn2H4+NvU6A0T3
 hPrusySmk2MhYv/0rTEML2mW72vg+NElU7rNbVUVJitP/Ffc60G7SzgmNaMC3eagfq6X
 26d51tDkNYN+Ub5q/16T2u4Ep2InHh/+LMHWjZJp8cO/HLeiJY+wSakTTjY0p/hGDrQQ
 NTaw==
X-Gm-Message-State: AOJu0YzCstntVnvs6eiWKKYF96aGy6Nr92byZZgPwYsH1rsXcYd3ivEV
 gn3TKFu/APE8clMif68RvvBn31THYbOjNllwokEyPiJibPxYrtu6
X-Gm-Gg: ASbGncvvudEQbxZ1Y9xFSFk5guKE+llhI+wsMOlTq9a06kwaG44bnjQ0c/rgrDQdJmW
 //MnjeiQjWMw6+h0/bt8yZ9HT3QgD5n5RgVMhYqmmA1i03uKqGn4gsqFKI4zH9RizHZvSmSwX0T
 HNQe2DhfkttTEcksHg8WUHCZzdlGWGvJoRQhTzhaRKY7SfZDl5DcSEWJciaZ6cw44qfqco65IPN
 0PFJUkbClsTreGBkEdxOcs+yMoR+gD3XyjBNnG+xJx5Nshe/hDbnHZ0vAO9j1N7sM6+cu5fqGB7
 /tkirt5FgxBH1BcQo3uIxMQwKtveRo+3XbvhG4aIWtT4Q1Ej5Ruvuc/RAdacv9tcrEGUjL8BO5K
 pi+EPlAS69Xxf
X-Google-Smtp-Source: AGHT+IEOlVRNPfK6XvZfZI9GoCa8bFyIWYRL1kIm15RePsFCTW23VErkrA/u4u5KJPijLSBDY2ITUQ==
X-Received: by 2002:a05:651c:312c:b0:30c:50fd:9afe with SMTP id
 38308e7fff4ca-30eecd2b14amr21036011fa.9.1743574361185; 
 Tue, 01 Apr 2025 23:12:41 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30dd2aa9118sm19336801fa.14.2025.04.01.23.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 23:12:40 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 02 Apr 2025 08:12:10 +0200
Subject: [PATCH 1/3] dt-bindings: st7571-i2c: Add Sitronix ST7571 panel
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-st7571-v1-1-351d6b9eeb4a@gmail.com>
References: <20250402-st7571-v1-0-351d6b9eeb4a@gmail.com>
In-Reply-To: <20250402-st7571-v1-0-351d6b9eeb4a@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2472;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=qYfHo2KQHvNKc0ra0XY4yHSyf5lMppizDiG5nIkJLrQ=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn7NVH8bUZmUp+sDXnx+1m2Gbpsf0NJOj4/LoGp
 SQm5Bf40QiJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ+zVRwAKCRCIgE5vWV1S
 MnfYD/9J49Orcaqbp7AXaRVq0lPTsokYkxYNLdJ/05TEhccGTRtZpDcgy3CtoMDFudImM9/+c6V
 8p7q5yQLaoq4WVfes6wtYlrfZ/13wdGlTkfh5zxuaAvdYdL5zs3MJ2ustdg0j+HF65lWmoPrgET
 VMBbhQEUOIwZ+5+h3tLZDgNbPs+lB2FbRnCDxHK0AtB3sg53EHQjMXBZgF2fn9Rggilcuno4WPW
 XvFrs51gq4gNMqkp3yn9txSMAuIlOjuev/fmFiQRNV514VRqz7VbT5ni3TLed3D+fw8npOYOLqj
 +vIXk1+a8ZuzS5LOzf20+Swrc2Kj9yrGVhW+7oyfCWBbdQ14QPIQrfrtHhmdMFPUvxQFmR87Eyl
 H/DXyvKKCSM3SlcWJBjzuYyOT+CdfALX64N0CdTnPKQBt8Yx9VNFyQ+y6UEEG6fODQqSaZXrSWx
 HlKVwEQFerc7JFyr4zA6N2PL0e87FrY4RW6pSzwTqIVaT5RqSmIX2qJaXShR8uaA5c0RDbhMsNI
 ncYga/CEXV9k3LJCxl/jMkE1Ga/SK7FsAd9YnkVLqe000He1Qa40E2qBhnvcvCmYAmyL+Mr7OwG
 zdKjqVZ1FzEux9Jlj+iXO8sPOeLc6NPu9SGdPpBnN2QO9SZcJEeFqno3nTin/N5JA9osXUjmXsw
 GeAf8A21a35u8mA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-Mailman-Approved-At: Wed, 02 Apr 2025 07:23:36 +0000
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

Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
The controller has a SPI, I2C and 8bit parallel interface, this is for
the I2C interface only.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 .../bindings/display/sitronix,st7571-i2c.yaml      | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7571-i2c.yaml b/Documentation/devicetree/bindings/display/sitronix,st7571-i2c.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..6e5e0994a98db646a37bb17c4289332546c9266e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sitronix,st7571-i2c.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sitronix,st7571-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sitronix ST7571 Display Panels
+
+maintainers:
+  - Marcus Folkesson <marcus.folkesson@gmail.com>
+
+properties:
+  compatible:
+    const: sitronix,st7571-i2c
+
+  reg:
+    description: I2C address of the LCD controller
+    maxItems: 1
+
+  sitronix,panel-width-mm:
+    description: physical panel width [mm]
+
+  sitronix,panel-height-mm:
+    description: physical panel height [mm]
+
+  sitronix,panel-nlines:
+    description: Number of lines in the panel
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 128
+    default: 128
+
+  sitronix,panel-start-line:
+    description: Start line of the panel
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 127
+    default: 0
+
+  reset-gpios:
+    description: GPIO connected to the RST_N signal.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - sitronix,panel-width-mm
+  - sitronix,panel-height-mm
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@3f {
+          compatible = "sitronix,st7571-i2c";
+          reg = <0x3f>;
+
+          reset-gpios = <&gpio0 3 GPIO_ACTIVE_HIGH>;
+          sitronix,panel-width-mm = <37>;
+          sitronix,panel-height-mm = <27>;
+          sitronix,panel-nlines = <96>;
+          sitronix,panel-start-line = <0>;
+        };
+    };

-- 
2.48.1

