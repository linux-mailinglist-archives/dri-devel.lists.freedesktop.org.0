Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1A690DD53
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE84A10E7AD;
	Tue, 18 Jun 2024 20:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lShd6aWD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DDE10E66E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 14:00:09 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-57c75464e77so6758009a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718719207; x=1719324007; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=evq88jlvU8RulgmUy64jbhNijl81dqHkwYkJ8InB99k=;
 b=lShd6aWDE3Rslyz6Jl1ot1WCM/OeoP07aQYw8d24I1lSPh4yJV2LsAB9LyC8ZTO7Cg
 3VgGBmut1jnNKZnas9+4X7awp72eDFnsP6r7L0oO0K61Dv3CjOag9pJcY0Kd18HRjSPt
 2hBg0W4N2Geb6+u371nnphG7qZRYmpaL34phomgh6roeCHdHRqDfpZe7EKUDVvz3Haj0
 RdOZAldiqH151wPeygCG+iOC5KTBfflRUleMPlt3s5lDIR8YB+DaWNe2vMVWiPrKwy/E
 xHpCfHNZdUG5BqsOo57QCitUnx6n9Y7HfyGplMLSC+hZokFmf+7kZDJ04d3rb/wh1pVO
 5HAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718719207; x=1719324007;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=evq88jlvU8RulgmUy64jbhNijl81dqHkwYkJ8InB99k=;
 b=b6ZFXVhl1sUPAnroxPN66VJTMvCpE5Pp2Of7zv5pnD03Gq/C6OCQ1sgvL4UGrE7LSZ
 n/IgmIRYThs8CDQNeCPYX4YmyBzMVRI662lnFtzWQ37aLfRYdI5Yx2dBoYreSIKOE4Ra
 kIZ/p5i4RcEmCE7oHTlNaSV6yQvS+hP/00GZdnMHzR6oX3sRZhMll+r5FrYOGpx2p/Q4
 p2SI2k2W2QNn621OwqXd05cgbLhoJvMKLHaYneiUaY4aYmzEE+CvVkFS5Mgo0CH85NeT
 2Tm7hSIb3p7t8YPnOSQEVJIi5oO166NP4QCJ9rLV+t49sVFnntgZ808+SJWHPOw73dBR
 AYVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVktC3s/mVVyLaKsJtaz8DWV83pEiJmXVT4Kda7zb5H9HtZdEHBnv9ac3I61WnMo/JoHMFZW7gu6Tok1o97J7rMGUZ4ztQKZe95kO5OnomE
X-Gm-Message-State: AOJu0Yz6IHIB0brO3ogdpcUM2RTwSWgr1avPgjymaZluXKhWGMyDA/wF
 CnxPE3qlYAsz7X+aGQ7QH91XiFvbff5vpug7BU96mP+GRCSd6XYpbyQ9m8+y
X-Google-Smtp-Source: AGHT+IFilio5qKRl+cSnK8IQn5IAVmutaHGtgF17QZrcOlUnZe/40B0j5GGoC7IbWTgHhNsL8k7V6w==
X-Received: by 2002:a50:c19a:0:b0:57c:5f8a:26f8 with SMTP id
 4fb4d7f45d1cf-57cbd6c6de0mr9000377a12.27.1718719207284; 
 Tue, 18 Jun 2024 07:00:07 -0700 (PDT)
Received: from [127.0.1.1] (mm-167-232-122-178.mgts.dynamic.pppoe.byfly.by.
 [178.122.232.167]) by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da156sm7731278a12.22.2024.06.18.07.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 07:00:07 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 18 Jun 2024 16:59:43 +0300
Subject: [PATCH v3 09/23] dt-bindings: mfd: add samsung,s2dos05
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-starqltechn_integration_upstream-v3-9-e3f6662017ac@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718719184; l=3596;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=GeSjdBMrPx5/NgT7rDPKCihsvNHSXF0w4Z/AktYQJMg=;
 b=SVRUeOlS2AnrVfvyQsE3+BYBfIEGACx1n7IrRdkctMOEdEgjj8rJD4eKceXUvtg1WRJSqgDNd
 jDU4o7csfmMCaF/woZolPqcOjzIaWS6mIu9Mc9Zuqq3a6UrHbBnN4LU
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=6pMMVVDDReSiRgPCbMOUauN5nS3ty4Sf5b7a2gi4x0M=
X-Mailman-Approved-At: Tue, 18 Jun 2024 20:22:03 +0000
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

add samsung,s2dos05 core MFD module binding

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 .../devicetree/bindings/mfd/samsung,s2dos05.yaml   | 89 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 90 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2dos05.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2dos05.yaml
new file mode 100644
index 000000000000..f2ef5171cc40
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2dos05.yaml
@@ -0,0 +1,89 @@
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
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The S2DOS05 is a companion power management IC for the panel and touchscreen
+  in smart phones. Provides voltage and current regulators and adc for power/current
+  measurements.
+
+properties:
+  compatible:
+    const: samsung,s2dos05-pmic
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    $ref: /schemas/regulator/samsung,s2dos05.yaml
+    description: List of regulators and its properties
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
+      	compatible = "samsung,s2dos05";
+      	reg = <0x60>;
+
+      	regulators {
+      		s2dos05_ldo1: s2dos05-ldo1 {
+      			regulator-name = "s2dos05-ldo1";
+      			regulator-min-microvolt = <1500000>;
+      			regulator-max-microvolt = <2000000>;
+      			regulator-active-discharge = <0x1>;
+      		};
+
+      		s2dos05_ldo2: s2dos05-ldo2 {
+      			regulator-name = "s2dos05-ldo2";
+      			regulator-min-microvolt = <1800000>;
+      			regulator-max-microvolt = <1800000>;
+      			regulator-active-discharge = <0x1>;
+      			regulator-boot-on;
+      		};
+
+      		s2dos05_ldo3: s2dos05-ldo3 {
+      			regulator-name = "s2dos05-ldo3";
+      			regulator-min-microvolt = <3000000>;
+      			regulator-max-microvolt = <3000000>;
+      			regulator-active-discharge = <0x1>;
+      			regulator-boot-on;
+      		};
+
+      		s2dos05_ldo4: s2dos05-ldo4 {
+      			regulator-name = "s2dos05-ldo4";
+      			regulator-min-microvolt = <2700000>;
+      			regulator-max-microvolt = <3775000>;
+      			regulator-active-discharge = <0x1>;
+      		};
+
+      		s2dos05_buck1: s2dos05-buck1 {
+      			regulator-name = "s2dos05-buck1";
+      			regulator-min-microvolt = <850000>;
+      			regulator-max-microvolt = <2100000>;
+      			regulator-active-discharge = <0x1>;
+      		};
+      	};
+      };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index f008429033c9..3ab41e53c9fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19897,6 +19897,7 @@ L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 B:	mailto:linux-samsung-soc@vger.kernel.org
 F:	Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
+F:	Documentation/devicetree/bindings/mfd/samsung,s2dos*.yaml
 F:	Documentation/devicetree/bindings/mfd/samsung,s2m*.yaml
 F:	Documentation/devicetree/bindings/mfd/samsung,s5m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.yaml

-- 
2.39.2

