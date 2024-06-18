Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7441A90DD5E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CEDB10E7BB;
	Tue, 18 Jun 2024 20:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gc2pI1ud";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D006C10E0C3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 13:59:55 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a6f1f33486eso336534166b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 06:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718719194; x=1719323994; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hjTOnao2jgs0TbPexQcL6nA3LicQJeUCbeGc7Ge6OXc=;
 b=Gc2pI1ud3JY75zcSXuZM5e8VFGmIVF1Fig96WT0LiioiM3govOilTm2w0S/eW/k/sQ
 R7qpVU6DZm/b7pMQOHGubSa2Nx2BtEEoIWFeWfGnhrEWFQyhbc6gys76q8FdranrLPB1
 RGoVo0FZ97fTROkB7xvGRaHnzF/Hd23LUGiPujBmDE93MWm0d4Ok4ywM5Zx1yXBnG/DC
 mVrZaC3L7650S9Vv19cTw/4ovKTfBvbAwmG9LvdvCerKtFwDjFdIiPvzdsDzUFzpZBSE
 eNiI5AS+8MjFC6yh2cm55lcl3TcJK15pEkrDu/lbH66TiinwlvO5+rodCy19b+ASulNu
 ds8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718719194; x=1719323994;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hjTOnao2jgs0TbPexQcL6nA3LicQJeUCbeGc7Ge6OXc=;
 b=Sv7QKPVecLT48912qU2e87VqIXc/eGxpMAEIt4cMKs1T6jBriuVDXdV1sEBlscUsAy
 KMfvptoBDQs43e7eeqvHyn07FOgfGWdRrKiX3jH70qTtebgHI6UhDVzcfGZJXZZk2899
 +vSisFQ22OGcPV61hFQCr0Jlo12Vt9SVHQ0dhQRt+sjdMacyaIgwqnnJS8McpiKUNQhT
 7UR+3Jwc2R7n3YaemLppxqlrZM0XMgiLk9eNlam4Y5mIvoD4BzfvYssfLY+YqV5Hvvsw
 B0D4l9+mNwa1gIE8cCjI1v6gDkwAhA2GBcl21EJoOZ9tc8C7JWNfl0XC/SozFRZNfjZa
 rBUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSOBTKEbeGGH8lTAl3hkc8x/s/uPd/c60mbrymAlxHaFu+kOMrp3pmWUUPKa/2ALoXS8G2iWIcKhMQjhpNnLuuWkIEEbdAmq7K4ZlZX6GT
X-Gm-Message-State: AOJu0YzPS5ro8e7ejCb3fVFitJCiztz2ao7uNtcpLfe82N94xBjaqoLJ
 4jxLbTcM8adKC5LdqLzDFPGhU4T4lLwtUe4f66vNZ6z68Ks+WZC52pS+kgMh
X-Google-Smtp-Source: AGHT+IFEcN8FjKFZhcaPR3K37rXFvtBAVhD0dgg++WL+CT9QX+9G7TKsgbcNessmzcPjrqqULcHuug==
X-Received: by 2002:a50:96cf:0:b0:57c:6861:d731 with SMTP id
 4fb4d7f45d1cf-57cbd6c7457mr9478897a12.28.1718719193759; 
 Tue, 18 Jun 2024 06:59:53 -0700 (PDT)
Received: from [127.0.1.1] (mm-167-232-122-178.mgts.dynamic.pppoe.byfly.by.
 [178.122.232.167]) by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da156sm7731278a12.22.2024.06.18.06.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 06:59:53 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 18 Jun 2024 16:59:37 +0300
Subject: [PATCH v3 03/23] dt-bindings: panel: add Samsung s6e3ha8
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-starqltechn_integration_upstream-v3-3-e3f6662017ac@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718719184; l=2883;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=u/o9BG9AqKYLWAUPHxzLUOD2JYdWbpPwReHpmt6QtHE=;
 b=g50eS59XNhy8Hz/rQYUxaUeykF5WKEEvQYvtP+VPrwrvnuKg4KD3zx6UKrGwX1D8tekXKo86t
 ocpTGcK5tVDAVNDxhWjwlgaYobX1nnwFwmG4bfa4toG4sAnckh+ziPk
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

Add binding for the Samsung s6e3ha8 panel found in the Samsung S9.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 .../bindings/display/panel/samsung,s6e3ha8.yaml    | 76 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
new file mode 100644
index 000000000000..9d7d747264dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6e3ha8.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung s6e3ha8 AMOLED DSI panel
+
+description: The s6e3ha8 is a 1440x2960 DPI display panel from Samsung Mobile
+  Displays (SMD).
+
+maintainers:
+  - Dzmitry Sankouski <dsankouski@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6e3ha8
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    description: reset gpio
+
+  port: true
+
+  vdd3-supply:
+    description: VDD regulator
+
+  vci-supply:
+    description: VCI regulator
+
+  vddr-supply:
+    description: VDDR regulator
+
+required:
+  - compatible
+  - reset-gpios
+  - vdd3-supply
+  - vddr-supply
+  - vci-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      panel@0 {
+      	compatible = "samsung,s6e3ha8";
+      	reg = <0>;
+      	vci-supply = <&s2dos05_ldo4>;
+      	vddr-supply = <&s2dos05_buck1>;
+      	vdd3-supply = <&s2dos05_ldo1>;
+      	te-gpios = <&tlmm 10 GPIO_ACTIVE_HIGH>;
+      	reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+      	pinctrl-0 = <&sde_dsi_active &sde_te_active_sleep>;
+      	pinctrl-1 = <&sde_dsi_suspend &sde_te_active_sleep>;
+      	pinctrl-names = "default", "sleep";
+
+      	port {
+      		panel_in: endpoint {
+      			remote-endpoint = <&mdss_dsi0_out>;
+      		};
+      	};
+      };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index a2f416e4a7c6..fddbd50f7685 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7150,6 +7150,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
 
+DRM DRIVER FOR SAMSUNG S6E3HA8 PANELS
+M:	Dzmitry Sankouski <dsankouski@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
+
 DRM DRIVER FOR SITRONIX ST7586 PANELS
 M:	David Lechner <david@lechnology.com>
 S:	Maintained

-- 
2.39.2

