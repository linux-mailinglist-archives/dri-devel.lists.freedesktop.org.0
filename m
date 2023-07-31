Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A68769A69
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 17:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6B110E2B1;
	Mon, 31 Jul 2023 15:09:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5345810E2B0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 15:09:02 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fbc59de009so42876615e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 08:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690816141; x=1691420941; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8Ye7/VW9cCinL56beHP9cBXIlGvn2H6A5gltzFR9xZA=;
 b=UTwJuQjCsxinJ9YydC3PfQWT7kew5BqP8cn0L94OxwdKmSQQjYuLCxn137omnQy6je
 2HfCWJWLc5em8da/g2kBohfFQ9P1wY/5aCvgPfE5JE7sNLiphv83Ikl1EeUS4CVsPQEh
 9kqciFnUZFdYgkQLeUCS4UFvDiMKv7PORD1HPnNLak4PdbvoGMyH0eJOxFEl6ea9TQad
 jccgwJRojly9nSFYK/0hKHrstuFnOO39A/BnuMpOlghnor3DBovWgyR5S4kYU76LwzkX
 3ogUh9ty0qmEayV1HyB+gdKcdqikU/ZNw61RcONbuLuL7vPiC4D1OO24YpQVBqr51L3d
 UhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690816141; x=1691420941;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Ye7/VW9cCinL56beHP9cBXIlGvn2H6A5gltzFR9xZA=;
 b=kHcx2NMED/GySU3ZSgLtKZKcoEKQJoWDndzZ1ZR4sS7QpVjVfbaxTF/kCUVczGIXE4
 N1mHKf/BBSKP62N9fo0YOBOP0jb1anvPecVojtI53+TWxEtYd0i94VwuTfG1Dyqd9Xo0
 Pib9XeVjLXfxoU5lHE3GPHrmwWZyE5BAekUrJD3kUm8T1KRX/HM4JlD86ncpNX6rO0a/
 x9FqDTU/kO5KxR9Es5w76fb4k8S5Zes0jKLDQvDlclFztZWpTdc6i4eMmxcN7NxIfPHx
 u4SBLCH/yDTGQpsBF2IVzuLEzhZ1mFLxOVLZyTMeTNRIPQRArDX0EN1O8vIbAVO9Zsi4
 Fr6g==
X-Gm-Message-State: ABy/qLZymXxzqPtxQqfDVY4wNzC7FyQg65mHsK01SHKs+GDcSGfbZv/m
 wluX6sB2omtvnKT1SSg+1Xd00g==
X-Google-Smtp-Source: APBJJlGpeXSCcQGjwMQcI9jxu4o0MCXuS5Schjt7Dig/+fsQVc0M1Xo/s0DE8qiaA6D+PRW8Q+aqPw==
X-Received: by 2002:a7b:c3d9:0:b0:3f8:b6c:84aa with SMTP id
 t25-20020a7bc3d9000000b003f80b6c84aamr173872wmj.24.1690816140551; 
 Mon, 31 Jul 2023 08:09:00 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 u22-20020a05600c211600b003fbcdba1a63sm11728791wml.12.2023.07.31.08.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 08:08:59 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 31 Jul 2023 17:08:56 +0200
Subject: [PATCH v4 1/3] dt-bindings: display: panel: add startek
 kd070fhfid015 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230711-startek_display-v4-1-fb1d53bfdef6@baylibre.com>
References: <20230711-startek_display-v4-0-fb1d53bfdef6@baylibre.com>
In-Reply-To: <20230711-startek_display-v4-0-fb1d53bfdef6@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2211; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=602in0caqHCjA6zQgFgfTHmUoHJFTSnnwXSt1PAlxS0=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkx86J9NgOyQYITUTgThD2N4LtHtlxw5gStHVLSk0S
 /z4CKQOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZMfOiQAKCRArRkmdfjHURYlAD/
 wPOvvEo1m12pew9Qx6nKAld5fcIERELEF3GGLovy8TnEImFN+h9AjPzcMZUTyZOS5wB5On/fDq4XJP
 kCkeaIu3x+hqKQ2uUKmhEyBjY28mv4+XNqJkEKSkLeN52SRFgrcGl9/EFC1G+PgaD2x7qvYPBN3unW
 RUmWwVSUjfeuWA67M2xQ8uFqLZrV7rJPqayXpmJmzJjoCdR9Nzz4CSYcS1VTe2RsF8V16NS/iCAg8k
 iaXG+QVtMehjYAc5fwZfLbmMagk6Ke0ZqqhEDYa82ep9C/rGWmojda7rtiWk0iKl5OIVKuHUH8W1Fe
 Lq19iLgFDVkKJajKQwCxnjLiWIymcE90+BqewWUxtZukTJdNJcBg9Rev+r1QQOeCM/ANY2CteIM2g/
 KClqVhOF7LBJ8i5SFJh07dvntRnwmtHUaRKSaRcJwMF/HyZDCB0KqOVOl6GZ/wRVdad+nDspOM6LA/
 q6pwCd2Wu7SlKNB26O2ieNsrFo9e1Kr59jYVxrUFJCTESpKtJ5Wv6VzbmAegRq2MhRcNdUWjocnklO
 JaZMvQYlC3QOrj54tniVtAilM9Qir1QzIUZ/+QCdlsRW5oyL+Ikbf9uarAJ5FeIzJTg3iw1s7q5xVX
 GwaW9RL46gIkMNfZrZ5vojF0wwWfwKVvqidRrrx7kUD4se9xUtfk90TAA14w==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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
Cc: devicetree@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Startek KD070FHFID015 is a 7-inch TFT LCD display with a resolution
of 1024 x 600 pixels.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../display/panel/startek,kd070fhfid015.yaml       | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
new file mode 100644
index 000000000000..d817f998cddc
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/startek,kd070fhfid015.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Startek Electronic Technology Co. kd070fhfid015 7 inch TFT LCD panel
+
+maintainers:
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: startek,kd070fhfid015
+
+  enable-gpios: true
+
+  iovcc-supply:
+    description: Reference to the regulator powering the panel IO pins.
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  reset-gpios: true
+
+  port: true
+
+  power-supply: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - enable-gpios
+  - iovcc-supply
+  - reg
+  - reset-gpios
+  - port
+  - power-supply
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "startek,kd070fhfid015";
+            reg = <0>;
+            enable-gpios = <&pio 67 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&pio 20 GPIO_ACTIVE_HIGH>;
+            iovcc-supply = <&mt6357_vsim1_reg>;
+            power-supply = <&vsys_lcm_reg>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.25.1

