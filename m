Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC8856095A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 20:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5B410E2A2;
	Wed, 29 Jun 2022 18:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DCA810E2A2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 18:44:39 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d17so18141591wrc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 11:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pXoQXaJVOBcKlATEFLMjlObz89E2TzcKnRwvkevhS5E=;
 b=TiMYrDEEt89rfAhGSFc1B5YD3QZqhuKNQ4xkwTWbfZevazAu2mhWMcaTHlUtEcCYNZ
 PZRE+oCT7U1sfBKQyVcQtfW6MZHEx0/00YN7x9xtHXEvM66WuXzC3JHAuIaJACEF+8Lm
 Hi+2bqPC3qtad3Acb6APfQDnOpnq/J2finDaPIEGzIFWNzts89ClnAGqPbeivMqinot9
 sYWU92G+3pHd8cF5N/57yPUnJQSiQXdwpp5FBZasFli56ZAAGmS3Wy0xq4xlBe5AAQvX
 DpaLUbu+pp302S7qix947oJA4JAylye0BCc7vc9b73mEghugzKgH8kClzyL2HlRKy3yR
 KjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pXoQXaJVOBcKlATEFLMjlObz89E2TzcKnRwvkevhS5E=;
 b=f6Ol1a6/uoFfAjjK8FX/VYdXN7pAKmt+tvfv9i4ThNjw59UUwk7btxZxb8y0wpQkAi
 JFGCV6u4cbidl+mKg/oUSOsDQc1o78D3jX+X9mzafSRJo3sMMOenx7T7OaZyhrkraucM
 xhoQVPuW6kAlowHwfgtW+U8Z4wO6prE++JykEcJUS7yrhbCQuSXwZrN9C3wyl52zl3CA
 V2JhG/tdeogacywMAq9fjaRgDfYPvVgY1MtMMBk2PO86WzkqBxqY3mSkOfjpnKPhkY2t
 2OEOb/PpcPn2fPpaS2Mgnzm9WrCtLkdhHbvDjO8ZXj3K7txB8KD8SFfxMQBOngSs6dal
 odqQ==
X-Gm-Message-State: AJIora/EHMiqZP9tp37kgKKiA+kGhgP4cr25CcLsA3cMEFR4+TbdIaSN
 DHaE+2O9QrLKhNc593fi3QY+sg==
X-Google-Smtp-Source: AGRyM1vxQHSJHGoQ6vCc8iCXWBFLLrjeWelTxc3fxvXsEsQpUDS+RGNItkpvnJxJOyD3/PmICtlZFw==
X-Received: by 2002:a5d:49cf:0:b0:21b:818a:a09b with SMTP id
 t15-20020a5d49cf000000b0021b818aa09bmr4543186wrs.676.1656528277831; 
 Wed, 29 Jun 2022 11:44:37 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 u23-20020a7bcb17000000b0039aef592ca0sm3834371wmj.35.2022.06.29.11.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 11:44:37 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3 01/15] dt-bindings: display: convert ilitek,
 ili9341.txt to dt-schema
Date: Wed, 29 Jun 2022 19:43:30 +0100
Message-Id: <20220629184343.3438856-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629184343.3438856-1-mail@conchuod.ie>
References: <20220629184343.3438856-1-mail@conchuod.ie>
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
Cc: linux-riscv@lists.infradead.org, Niklas Cassel <niklas.cassel@wdc.com>,
 alsa-devel@alsa-project.org, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Jose Abreu <joabreu@synopsys.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, dmaengine@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Conor Dooley <conor.dooley@microchip.com>

A dt-schema binding for the Ilitek ili9341 was created as
panel/ilitek,ili9341.yaml but the txt binding was ignored in the
process. Move the remaining items in the txt binding to the yaml one &
delete it.

The example in the txt binding has a spi-max-frequency which disagrees
with the yaml replacement (and its own documentation) so change that to
conform with the binding. There are no users in tree of the Adafruit
yx240qv29 to check against.

Link: https://cdn-learn.adafruit.com/assets/assets/000/046/879/original/SPEC-YX240QV29-T_Rev.A__1_.pdf
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/display/ilitek,ili9341.txt       | 27 -----------
 .../display/panel/ilitek,ili9341.yaml         | 48 +++++++++++++------
 2 files changed, 34 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9341.txt

diff --git a/Documentation/devicetree/bindings/display/ilitek,ili9341.txt b/Documentation/devicetree/bindings/display/ilitek,ili9341.txt
deleted file mode 100644
index 169b32e4ee4e..000000000000
--- a/Documentation/devicetree/bindings/display/ilitek,ili9341.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-Ilitek ILI9341 display panels
-
-This binding is for display panels using an Ilitek ILI9341 controller in SPI
-mode.
-
-Required properties:
-- compatible:	"adafruit,yx240qv29", "ilitek,ili9341"
-- dc-gpios:	D/C pin
-- reset-gpios:	Reset pin
-
-The node for this driver must be a child node of a SPI controller, hence
-all mandatory properties described in ../spi/spi-bus.txt must be specified.
-
-Optional properties:
-- rotation:	panel rotation in degrees counter clockwise (0,90,180,270)
-- backlight:	phandle of the backlight device attached to the panel
-
-Example:
-	display@0{
-		compatible = "adafruit,yx240qv29", "ilitek,ili9341";
-		reg = <0>;
-		spi-max-frequency = <32000000>;
-		dc-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
-		reset-gpios = <&gpio0 8 GPIO_ACTIVE_HIGH>;
-		rotation = <270>;
-		backlight = <&backlight>;
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
index 6058948a9764..c5571391ca28 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
@@ -21,6 +21,7 @@ properties:
   compatible:
     items:
       - enum:
+          - adafruit,yx240qv29
           # ili9341 240*320 Color on stm32f429-disco board
           - st,sf-tc240t-9370-t
       - const: ilitek,ili9341
@@ -47,31 +48,50 @@ properties:
   vddi-led-supply:
     description: Voltage supply for the LED driver (1.65 .. 3.3 V)
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - compatible
   - reg
   - dc-gpios
-  - port
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - st,sf-tc240t-9370-t
+then:
+  required:
+    - port
 
 examples:
   - |+
+    #include <dt-bindings/gpio/gpio.h>
     spi {
         #address-cells = <1>;
         #size-cells = <0>;
         panel: display@0 {
-                 compatible = "st,sf-tc240t-9370-t",
-                              "ilitek,ili9341";
-                 reg = <0>;
-                 spi-3wire;
-                 spi-max-frequency = <10000000>;
-                 dc-gpios = <&gpiod 13 0>;
-                 port {
-                         panel_in: endpoint {
-                           remote-endpoint = <&display_out>;
-                      };
-                 };
-             };
+            compatible = "st,sf-tc240t-9370-t",
+                         "ilitek,ili9341";
+            reg = <0>;
+            spi-3wire;
+            spi-max-frequency = <10000000>;
+            dc-gpios = <&gpiod 13 0>;
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&display_out>;
+                };
+            };
+        };
+        display@1{
+            compatible = "adafruit,yx240qv29", "ilitek,ili9341";
+            reg = <1>;
+            spi-max-frequency = <10000000>;
+            dc-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio0 8 GPIO_ACTIVE_HIGH>;
+            rotation = <270>;
+            backlight = <&backlight>;
         };
+    };
 ...
-- 
2.36.1

