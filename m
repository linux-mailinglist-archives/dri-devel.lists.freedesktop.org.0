Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4F3978366
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 17:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8318410ED25;
	Fri, 13 Sep 2024 15:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AWZnHRQp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB8910ED25
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 15:08:27 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2f762de00e5so27767871fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726240105; x=1726844905; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+edNV2wnMqv6Fg14CUmntzU2d84+FrbyEUaBI7DKpMo=;
 b=AWZnHRQp8THr/9H0RoZuTpcWjcZLFUJepkZMCOZf84riuYnOu7y8te7JFsJDbYjge0
 mMj7SbtLXCTH6gUt08ZGg3hbQz7TbwgW1zn7TcnKyucKvNf01iPGe001O+9Qlv89iyVo
 YU4EHQB+HcdaNBCWjCEE7J/RN2mtVee9mZ8u2kRWV9p/oipXLoT+FHrgPszI7/J5t0Tn
 EQZUgt2ZldFLUf79FeMoNKp496deNlIVaRtRQ4jiiI7DaZ2uZJLjodfiJ4ldupNECYLp
 kG2J6/XeCj3RWuwWspaj0y0NQSGWzUYDEj6IplNuZpcxrWYBTMLSAulM0UIdAL0813eD
 uLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726240105; x=1726844905;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+edNV2wnMqv6Fg14CUmntzU2d84+FrbyEUaBI7DKpMo=;
 b=DBkkZdo7TvaikzFAn5wjr4mZdQ88xB4RTPUht4IU78bUy9wfNdJbX/GiSFy0kvVviv
 yBQd4Y6EdewCj9cskyOB6ZKjU1UiO5iVeMkN3rDDhEPQ1t6he84Y12RiP5hKDAPLYiVd
 z+Ekjd8wrvDhQ73RF/bBSwq1Bk+F13rOD1g9wYI+298t4rGIToBkXYmaOraOh/OICCXs
 lhoNRg3TQ+QS6MDjwgA8L17YiTIayUUquR2phcdEIGga9uXNX53V2XXdGn5jjAyj930q
 hYeOR78ygbOBizNZhSng5Gv5qLGpYtcVWb7GFaQlHO1aqRDSeMnwj/R6XNwlv4s3FKiv
 KQVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLo6PUo22SyH0nailNGFdcKu6QyO/uuHdt/l/w97SZ8rWoZKHXJo9SZw4DNKRH267rdxjklab1SVs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRol/DZQ4LXW2Y1qKeVZSg+N/X1NHZW/mT2IIIo5OdWw9zdrKA
 HzCAgA4u1u5nainszozuqfzZGpkA+xCit950B2p1V1qSCdMiAuwh
X-Google-Smtp-Source: AGHT+IHJOpfVbc6BYoC9nxodPjUjSuvVPJgxKnP5qJAz/k4ls2c3ki4U+1IXN1TI74WxFMntTOIIqg==
X-Received: by 2002:a05:651c:199e:b0:2ef:20ae:d113 with SMTP id
 38308e7fff4ca-2f787f576a1mr45655381fa.40.1726240105287; 
 Fri, 13 Sep 2024 08:08:25 -0700 (PDT)
Received: from [127.0.1.1] ([178.127.153.210])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd523b4sm7774318a12.51.2024.09.13.08.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 08:08:25 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 13 Sep 2024 18:07:49 +0300
Subject: [PATCH v4 06/27] dt-bindings: mfd: add samsung,s2dos05
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240913-starqltechn_integration_upstream-v4-6-2d2efd5c5877@gmail.com>
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
In-Reply-To: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
 Simona Vetter <simona@ffwll.ch>, cros-qcom-dts-watchers@chromium.org, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726240085; l=4210;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=o6dr1Wo9Wqt+cqjXIx9vp714Hl+GKINdhrfYqTXSHMA=;
 b=ESIv0Ef7vJug1EWhzW4zYha8Jn3CIRqEafH3ehASUYvcOs4iTAniGnkuPXv4sfkLu+26qeFO9
 Gf09Xk2+ldLCch9wTgtTHevbF4LCFvNWhakoDZ1ika/3N66fQKyru5F
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=6pMMVVDDReSiRgPCbMOUauN5nS3ty4Sf5b7a2gi4x0M=
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

Add samsung,s2dos05 MFD module binding.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
Changes in v4:
- split long(>80) lines
- fix indentation
- merge with regulators binding
- drop pmic suffix
- drop unused labels in example
- correct description
---
 .../devicetree/bindings/mfd/samsung,s2dos05.yaml   | 99 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2dos05.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2dos05.yaml
new file mode 100644
index 000000000000..534434002045
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2dos05.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/samsung,s2dos05.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2DOS05 Power Management IC
+
+maintainers:
+  - Dzmitry Sankouski <dsankouski@gmail.com>
+
+description:
+  This is a device tree bindings for S2DOS family of Power Management IC (PMIC).
+
+  The S2DOS05 is a companion power management IC for the panel and touchscreen
+  in smart phones. Provides voltage regulators and
+  ADC for power/current measurements.
+
+  Regulator section has 4 LDO and 1 BUCK regulators and also
+  provides ELVDD, ELVSS, AVDD lines.
+
+properties:
+  compatible:
+    const: samsung,s2dos05
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    patternProperties:
+      "^buck1|ldo[1-4]$":
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+        required:
+          - regulator-name
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      pmic@60 {
+        compatible = "samsung,s2dos05";
+        reg = <0x60>;
+
+            regulators {
+                ldo1 {
+                    regulator-name = "s2dos05-ldo1";
+                    regulator-min-microvolt = <1500000>;
+                    regulator-max-microvolt = <2000000>;
+                    regulator-active-discharge = <0x1>;
+                };
+
+                ldo2 {
+                    regulator-name = "s2dos05-ldo2";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                    regulator-active-discharge = <0x1>;
+                    regulator-boot-on;
+                };
+
+                ldo3 {
+                    regulator-name = "s2dos05-ldo3";
+                    regulator-min-microvolt = <3000000>;
+                    regulator-max-microvolt = <3000000>;
+                    regulator-active-discharge = <0x1>;
+                    regulator-boot-on;
+                };
+
+                ldo4 {
+                    regulator-name = "s2dos05-ldo4";
+                    regulator-min-microvolt = <2700000>;
+                    regulator-max-microvolt = <3775000>;
+                    regulator-active-discharge = <0x1>;
+                };
+
+                buck1 {
+                    regulator-name = "s2dos05-buck1";
+                    regulator-min-microvolt = <850000>;
+                    regulator-max-microvolt = <2100000>;
+                    regulator-active-discharge = <0x1>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 59d027591e34..92135252264a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20465,6 +20465,7 @@ L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 B:	mailto:linux-samsung-soc@vger.kernel.org
 F:	Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
+F:	Documentation/devicetree/bindings/mfd/samsung,s2dos*.yaml
 F:	Documentation/devicetree/bindings/mfd/samsung,s2m*.yaml
 F:	Documentation/devicetree/bindings/mfd/samsung,s5m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.yaml

-- 
2.39.2

