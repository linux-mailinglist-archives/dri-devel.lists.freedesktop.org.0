Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD2D90DD42
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA71810E798;
	Tue, 18 Jun 2024 20:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VNYoApD8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0535110E0C3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 13:59:58 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-57c6011d75dso6699196a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 06:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718719196; x=1719323996; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZQdkm8+F4B6bFBNQodaWJBcqC8R3HTo/EbqUkgw994Y=;
 b=VNYoApD8luD1k+2OCW/ZhiueGjlilFXfn3GbXH7DIyjT8wFSCUnuFPaaWUvyWkHdn6
 Z5LcfrVD8BwtPKYuHlBk1S/Q89a+CkLo/7cH8XJxT2IyIfDllwW+Ygq1WR2SYpa7bAhj
 FchDf/loNYKjOFD9RNRiRIK0uObbzBtBrChMeia/9eA3NHLU3gwHDyB3ULpAxV6x07P5
 QJDMifD6ts4+rWL4D2hpFl1q0PMVN9+xwyf9lISVQZsx1JVClGadqI8ncfCtblfIYIX3
 RX196dwh902hDmsQsxn+xDzaYaYkDCOo9NzAJU8wt68vsBZJFtr3A4+nn5K4mPvcsaCz
 ndhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718719196; x=1719323996;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZQdkm8+F4B6bFBNQodaWJBcqC8R3HTo/EbqUkgw994Y=;
 b=RoMpkMVf6np/P4GyA/r4+1RNVL+pGYW6mP1S1/tKxwQfK4kSvKBKMd81I4oF4hEgA+
 y3D/vy4IeOy6OVvNjlJ0SPvAQjEQgQ2w9SpImEWK3Ewc2pWVEej2RwRntp5SiwmYGqHZ
 aO/ldQHNT9EK7NhypyXPHzP+stWagUiUYKziERe6IjEzY8mwsJnDx6F+bWoYBH5XOA55
 zDsyXsuXbY57/ywgQ5KsdfYEk7tLOf6Ln9xzThBH6yIyTTv6XZMznebrUPVZmd7Olyqs
 BHwiWDajEiLyp4+vLrdqtrOIgt0r7qC77sTbFalkmWiS+4yJ712XmfZla7dhlFz1SnOk
 vLFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw+XQHlhHM2XRCen2/gwLN1TgRD+0WGUgU7Euz+egZeAr2DBq5fzzzhVmU7tWbOHA/TD7aTwnzIWQVMeID650FN21NByIq15C5cV+EebOj
X-Gm-Message-State: AOJu0YyPS/Bh8vnosuRl+OyOXluXLVPZB2oN3/p4abMHYUp/ykx1tuZF
 +4RMZYGR4+Bjw/Qc5msN7apAwDrlSSTDVoWXQATsuxWCw3/HmvteUt9z+mWr
X-Google-Smtp-Source: AGHT+IF6kH0YtvSPT4MaBaZOV0LLPUManxnMgMPB/xjZSsumWnmHYW99B3fvD3yZot9inNzwJ3g4tA==
X-Received: by 2002:a05:6402:28cc:b0:57c:d237:4fd with SMTP id
 4fb4d7f45d1cf-57cd237059bmr6070351a12.4.1718719195988; 
 Tue, 18 Jun 2024 06:59:55 -0700 (PDT)
Received: from [127.0.1.1] (mm-167-232-122-178.mgts.dynamic.pppoe.byfly.by.
 [178.122.232.167]) by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da156sm7731278a12.22.2024.06.18.06.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 06:59:55 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 18 Jun 2024 16:59:38 +0300
Subject: [PATCH v3 04/23] dt-bindings: mfd: add maxim,max77705
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-starqltechn_integration_upstream-v3-4-e3f6662017ac@gmail.com>
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, phone-devel@vger.kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718719184; l=3812;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=MaUBYzY2WY/OtOBoG9JKcNCjTiDo6fotvBHEhgKFVL8=;
 b=kBr0hfj63DNZCcoJMRp3NdqL4vLs5OVhqtP9nRhL8IZsExqfYiNg80mksKZ6ciNZZYi+7gDBQ
 aTZ8nXPx505AJOdyQUWKd9jlnAdtRzTSiAiIVOCd6RVGxncdwXI0/M5
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=6pMMVVDDReSiRgPCbMOUauN5nS3ty4Sf5b7a2gi4x0M=
X-Mailman-Approved-At: Tue, 18 Jun 2024 20:22:02 +0000
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

maxim,max77705 is MAX77705 pmic binding part

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 .../devicetree/bindings/mfd/maxim,max77705.yaml    | 112 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 113 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77705.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77705.yaml
new file mode 100644
index 000000000000..b54408e3d792
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/maxim,max77705.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/maxim,max77705.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX77705 Companion Power Management IC and USB Type-C interface IC
+
+maintainers:
+  - Dzmitry Sankouski <dsankouski@gmail.com>
+
+description: |
+  This is a part of device tree bindings for Maxim MAX77705 multi functional device.
+
+  The Maxim MAX77705 is a Companion Power Management and Type-C interface IC which
+  includes charger, fuelgauge, LED, haptic motor driver and Type-C management IC.
+
+properties:
+  compatible:
+    const: maxim,max77705
+
+  reg:
+    description:
+      I2C device address.
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    description:
+      MAX77705 shared irq.
+    items:
+      - const: max77705_irq
+
+  charger:
+    $ref: /schemas/power/supply/maxim,max77705-charger.yaml
+
+  fuelgauge:
+    $ref: /schemas/power/supply/maxim,max77705-fg.yaml
+
+  haptic:
+    $ref: /schemas/input/maxim,max77705.yaml
+
+  leds:
+    $ref: /schemas/leds/maxim,max77705.yaml
+
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/leds/common.h>
+
+    i2c14 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+    	pmic@66 {
+    		compatible = "maxim,max77705";
+    		reg = <0x66>;
+    		interrupt-parent = <&pm8998_gpios>;
+    		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+    		interrupt-names = "max77705_irq";
+    		pinctrl-0 = <&chg_int_default>;
+    		pinctrl-names = "default";
+
+    		leds {
+    			compatible = "maxim,max77705-led";
+    			#address-cells = <1>;
+    			#size-cells = <0>;
+
+    			led@1 {
+    				reg = <1>;
+    				label = "red:usr1";
+    			};
+
+    			led@2 {
+    				reg = <2>;
+    				label = "green:usr2";
+    			};
+
+    			led@3 {
+    				reg = <3>;
+    				label = "blue:usr3";
+    			};
+    		};
+
+    		max77705_charger: charger {
+    			compatible = "maxim,max77705-charger";
+    			monitored-battery = <&battery>;
+    		};
+
+    		fuelgauge {
+    			compatible = "maxim,max77705-fg";
+    			monitored-battery = <&battery>;
+    			power-supplies = <&max77705_charger>;
+    			rsense = <5>;
+    		};
+
+
+    		haptic {
+    			compatible = "maxim,max77705-haptic";
+    			haptic-supply = <&vib_regulator>;
+    			pwms = <&vib_pwm 0 50000>;
+    		};
+    	};
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index fddbd50f7685..f008429033c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13682,6 +13682,7 @@ B:	mailto:linux-samsung-soc@vger.kernel.org
 F:	Documentation/devicetree/bindings/*/maxim,max14577.yaml
 F:	Documentation/devicetree/bindings/*/maxim,max77686.yaml
 F:	Documentation/devicetree/bindings/*/maxim,max77693.yaml
+F:	Documentation/devicetree/bindings/*/maxim,max77705*.yaml
 F:	Documentation/devicetree/bindings/*/maxim,max77843.yaml
 F:	Documentation/devicetree/bindings/clock/maxim,max77686.txt
 F:	drivers/*/*max77843.c

-- 
2.39.2

