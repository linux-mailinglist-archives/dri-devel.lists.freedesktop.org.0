Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1125ED20227
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 17:16:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6502910E610;
	Wed, 14 Jan 2026 16:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="FivxjXjl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBFB110E60B
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 16:16:46 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b870732cce2so1503666b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 08:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1768407405; x=1769012205;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HmBTNol25uWSbstgc/N/yY8zm994n6PPZLmjRz9SloM=;
 b=FivxjXjlnhEgUykJTFNX1F+3OEEGtmJ8qdyrg3KCwYJq8VeoBLzO/ADfzvK8y96pK1
 ciyfMMonr1wl7saqWTE5W0fS0yLlTonY8EfUQ0+Jj7TQaI/ooX+rGiiN+p8ztjIn9VvA
 KhzrEUiHEXQ4CKVJulKXyZ7Jsf+M7ZALtecTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768407405; x=1769012205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HmBTNol25uWSbstgc/N/yY8zm994n6PPZLmjRz9SloM=;
 b=OlDUMXvwe446tL4UHS2bYUXA9hlgyPEoVoYkpT3IgpFD4ojYxnuMnVn6wq592+4ODl
 sq2mBjWy2DMcLr4aA4SMJ+VbsWUPRfPtsusPREhrZwXqkmRj0Gg0CBS4bWHn9TmVPnkD
 QfDUagiab/u8oHsixIwGdRSoHCpVccupkmQVZZ0ywm1/zxuB6hFPlqxg6LLq1VsgeBH7
 Hgsl75U4VLzHteSMFnBqJ80cWZeyTQhrBqSaayd/EeMF7E8vh6LoPIiQD4llpodrbXoh
 ZU0jg3OZQWSs6wsN4PmoKHxdafP4wgNjz+5IqaKWnXN0O7JCRpDg8vGNhmjtZ1NJlNQd
 i+SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRRA0gf5VghSp9clSb2OiD0jA5D/OvUrNcwQerWEs6xu4p393vaiwZMi3rUJO0Y8swY8D5i3px7CY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yws0qUoep6yfaO+Cww0iQQBVW3Pe67Yi6mLf/0qPZ0ZVXjklnTL
 fP3d0StWMv4xx72IQYFeQZlVQoK7GlpueNDH5302HDwe51BR/oDn8ZcGPDFdMu2ppns=
X-Gm-Gg: AY/fxX4wyVA33gSAi8s26j0jfzVW6HBm8c88P9NNlQaD1PUcXgSwVdRkQy2BZJ4pi8G
 q1DyUluAYVzdiSefMZV7sbHyHPAi+EKALZf4lVtQQra6dq+ha3ZNPU27cn+GOiQr9XxNBPUP895
 +zWxsAUEMRmUAC2qX8Wx4UflxtXGdWT9vEf9UHNdRU8ptr3SlcP4bHDLsgec1RPFnQyD58qA2uk
 znWzaJfDydj+PaJAvB0Vi2lFrgdaBKYuEZpFPlnN243beRRm9KGxIqoXLcevNiPeBBFBzNj0aO2
 lFbXfbkdZ0chrZQvP7Njfuy1oiCq6pUEIvUZppt5D01V6fMJPXWWOW0Mlf7uhusn1ZtO0Rnqggw
 fetHKi6a9bBm34hrQ+C+/y3wHWu9Zo5XLGYEXIny0+7/jn5UZahf/hAiPSxnq27JZpSlPuc/Czg
 vClgYuR8QcpEslADeH3jEn56FemyozdxtkksLNeU0pUtlOFCtxGnwKe4ZTaRYKKjkMZEPmWPhja
 S2kWn86TmugeHU7MwWj9lIDWcru0mLwYcdJ6ikWiGGiUuMZrqsAB+uTv+x7Pa1vPlgv1A==
X-Received: by 2002:a17:907:72d1:b0:b6d:73f8:3168 with SMTP id
 a640c23a62f3a-b8760fcbe55mr263759866b.3.1768407405292; 
 Wed, 14 Jan 2026 08:16:45 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (93-47-52-235.ip111.fastwebnet.it. [93.47.52.235])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b876dd0e9ffsm152281566b.37.2026.01.14.08.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 08:16:44 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/4] dt-bindings: ili9806e: add Rocktech RK050HR345-CT106A
 display
Date: Wed, 14 Jan 2026 17:16:18 +0100
Message-ID: <20260114161636.1076706-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114161636.1076706-1-dario.binacchi@amarulasolutions.com>
References: <20260114161636.1076706-1-dario.binacchi@amarulasolutions.com>
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

Document the Rocktech 5" 480x854 panel based on the Ilitek ILI9806E
controller.

This panel uses SPI for control and an RGB interface for display
data, so adjust the binding requirements accordingly.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Restore vdd-supply as required for both DSI and SPI types
- Dop useless settings in case of rocktech,rk050hr345-ct106a

 .../display/panel/ilitek,ili9806e.yaml        | 38 ++++++++++++++++++-
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
index f80307579485..2080d9e0ffac 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/display/panel/ilitek,ili9806e.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Ilitek ILI9806E based MIPI-DSI panels
+title: Ilitek ILI9806E based panels
 
 maintainers:
   - Michael Walle <mwalle@kernel.org>
@@ -18,6 +18,7 @@ properties:
       - enum:
           - densitron,dmt028vghmcmi-1d
           - ortustech,com35h3p70ulc
+          - rocktech,rk050hr345-ct106a
       - const: ilitek,ili9806e
 
   reg:
@@ -30,11 +31,24 @@ required:
   - compatible
   - reg
   - vdd-supply
-  - vccio-supply
   - reset-gpios
   - backlight
   - port
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - rocktech,rk050hr345-ct106a
+then:
+  $ref: /schemas/spi/spi-peripheral-props.yaml#
+  required:
+    - spi-max-frequency
+else:
+  required:
+    - vccio-supply
+
 unevaluatedProperties: false
 
 examples:
@@ -60,5 +74,25 @@ examples:
             };
         };
     };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
 
+        panel@0 {
+            compatible = "rocktech,rk050hr345-ct106a", "ilitek,ili9806e";
+            reg = <0>;
+            vdd-supply = <&reg_vdd_panel>;
+            spi-max-frequency = <10000000>;
+            reset-gpios = <&gpiob 6 GPIO_ACTIVE_LOW>;
+            backlight = <&backlight>;
+            port {
+                panel_in_rgb: endpoint {
+                    remote-endpoint = <&ltdc_out_rgb>;
+                };
+            };
+        };
+    };
 ...
-- 
2.43.0

