Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6100D39CF4
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 04:31:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B77510E33F;
	Mon, 19 Jan 2026 03:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RKRhvtfB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20B410E33E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 03:30:57 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-8c5386f1c9fso617865685a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 19:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768793457; x=1769398257; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=meO53koivOwOs9Bd8q7AbA+V+PS952tTGxoKR0dH/Dg=;
 b=RKRhvtfBpoEmEeHndZbh/ocrw7hs62i4J+r/4wyqnQLvd+LB2lyr/5V6x3/SUeXM7Q
 cDqYMppNWSEEkqEI9+5INVFkiXrUSpodzK4/elBNgjeNXmt8WWGlNbwXEWRAl5I4yp19
 TVaVi8AQ/7/25XnTGeHJMZelt2ktsKLUsySUStXxjVZlfEH+oV6amspklLYrPDILkzME
 /PaRM10G7lmL0Pizq6RFXmyVssx/Hr1FIA8/Wkyaf9qTwCjAgBExnT8vw+KvjgaKp46+
 3WR+9toUt/dm8seJzPwmnpU3RiHcTnJOOa4v9EXasNlEfuI4hx4MyfC+z2nsNHoty8QF
 I2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768793457; x=1769398257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=meO53koivOwOs9Bd8q7AbA+V+PS952tTGxoKR0dH/Dg=;
 b=jmE1Y9XcjgpgNzgmYtNf0IceqJsIkjjaJLLfz2BQNhle81O9FG46yoH8C4DqB2a4Q2
 hT8DQa3xe27QbqEN3ohQxlcwIf4St9Gcm5QrzOa+NoepFReOxBTsNeg+Or+iIpmqv0zM
 lPcw3a5cfuu/AJnSpcGO4IsKo2+LuqQxT1IYQXmTqRm7ztcwL9NLsG6z6OAOwI3HDZre
 dbM22D+u62ux/4IJkEkHjDAWQJgaxJSIaYaZDks8WeuwFWIQyIo70+vsSwIHbxURRAGI
 MfCvXe9P8+t3T4uHvCogPoEJZN0Cj3Bnb61Cg28AmF7Q0Dn0rs63OyURKRobjzKX8wFE
 WD4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUii2sEkYsOGEoj8GSuR7V2uOEINugPAjBqnwy0CbIM9tOTxCabRz7j/P5hp98nusEDs7II3rt2Rg8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybsQorH7HSuCOPMMjzsDuIbffHuBNSc1ozu4IJXVGezv1vMZNK
 9rL9oE78tTdPshDKyOC5bWfrLWJc50y2vX2Wg3eRnhIilG7gdQPAubm4
X-Gm-Gg: AY/fxX51yMwTqzEAdrId2Txzb6AdV/7WXur3uoDSCoBaHiioazNcuI1BeS0o5kUY3KD
 nCNgvop55GPaQQKHXdO9JwPfHqnbX9HIPhZyjj4TnzGrHs3Ohg2NWxuE6wBDxcqQx2xUne6EL0X
 yisYk3mKgtshix6VxBrdSnPTlzyRQQvSwXD4sLoNDm37Ban4ZKPfuohc+m00Eltk3LrTdCRDCgk
 aoWZShMFwP/xJphmBT6RP2KuWKWS9m6kxHokDvBaxDrdam7zR89qox72UnDuZPG6Tj9I+qr6UEV
 A8l+1PDu5EuZncp1CLkrtGadpf3cWN7Yj+7plngbjmnfNi0hw0TRsEHEZDFGknanHs8Ff8/tMMT
 4IsBhVztAF3dav2OzRBgaHAR6OA0WhlSHRFe4QkJvFoNuSupC391LITI1yBJ0FPN4bkyHGHWvzM
 eKyzCiGMRnEcTrXSXIiR2rZZsPiYlJo0xm8ff9PBtWB/8kq0uFLgVIri7DfDOplJzwfFE=
X-Received: by 2002:a05:620a:6910:b0:8b2:ea5a:4146 with SMTP id
 af79cd13be357-8c6a6979f69mr1231120785a.89.1768793456999; 
 Sun, 18 Jan 2026 19:30:56 -0800 (PST)
Received: from mighty.localdomain (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c6a71ab20dsm724706885a.5.2026.01.18.19.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 19:30:56 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com,
 rogerq@kernel.org, tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, quic_jesszhan@quicinc.com, bavishimithil@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, thierry.reding@gmail.com
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Subject: [PATCH v4 10/10] ARM: dts: ti: omap: samsung-espresso10: Add initial
 support for Galaxy Tab 2 10.1
Date: Sun, 18 Jan 2026 22:30:35 -0500
Message-ID: <20260119033035.57538-12-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119033035.57538-1-bavishimithil@gmail.com>
References: <20260119033035.57538-1-bavishimithil@gmail.com>
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

Create a device tree for the 10 inch variants (P5100, P5110, P5113)

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 arch/arm/boot/dts/ti/omap/Makefile            |   1 +
 .../dts/ti/omap/omap4-samsung-espresso10.dts  | 104 ++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts

diff --git a/arch/arm/boot/dts/ti/omap/Makefile b/arch/arm/boot/dts/ti/omap/Makefile
index d24f13efd..140ac39b3 100644
--- a/arch/arm/boot/dts/ti/omap/Makefile
+++ b/arch/arm/boot/dts/ti/omap/Makefile
@@ -81,6 +81,7 @@ dtb-$(CONFIG_ARCH_OMAP4) += \
 	omap4-var-dvk-om44.dtb \
 	omap4-var-stk-om44.dtb \
 	omap4-samsung-espresso7.dtb \
+	omap4-samsung-espresso10.dtb \
 	omap4-xyboard-mz609.dtb \
 	omap4-xyboard-mz617.dtb
 dtb-$(CONFIG_SOC_AM33XX) += \
diff --git a/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
new file mode 100644
index 000000000..5c00d67ac
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/dts-v1/;
+
+#include "omap4-samsung-espresso-common.dtsi"
+#include <dt-bindings/power/summit,smb347-charger.h>
+/ {
+	model = "Samsung Galaxy Tab 2 (10 inch)";
+	compatible = "samsung,espresso10", "ti,omap4430", "ti,omap4";
+
+	i2c-gpio5 {
+		smb347: charger@6 {
+			compatible = "summit,smb347";
+			reg = <0x6>; // 0x0C >> 1
+			interrupt-parent = <&gpio2>;
+			interrupts = <0 IRQ_TYPE_EDGE_BOTH>;
+
+			summit,enable-usb-charging;
+			summit,enable-charge-control = <SMB3XX_CHG_ENABLE_SW>;
+			summit,chip-temperature-threshold-celsius = <120>;
+			summit,usb-current-limit-microamp = <1800000>;
+		};
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&backlight_pins>;
+		pwms = <&pwm10 0 1600 0>;
+		power-supply = <&reg_lcd>;
+		enable-gpios = <&gpio3 31 GPIO_ACTIVE_HIGH>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <7>;
+	};
+
+	panel {
+		compatible = "samsung,ltn101al03", "panel-lvds";
+		power-supply = <&reg_lcd>;
+		width-mm = <223>;
+		height-mm = <125>;
+		data-mapping = "vesa-24";
+		backlight = <&backlight>;
+
+		panel-timing {
+			clock-frequency = <69818000>;
+
+			hback-porch = <64>;
+			hactive = <1280>;
+			hfront-porch = <16>;
+			hsync-len = <48>;
+
+			vback-porch = <11>;
+			vactive = <800>;
+			vfront-porch = <16>;
+			vsync-len = <3>;
+
+			hsync-active = <0>;
+			vsync-active = <0>;
+			de-active = <1>;
+			pixelclk-active = <1>;
+		};
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&bridge_out>;
+			};
+		};
+	};
+};
+
+&i2c3 {
+	touchscreen@20 {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x20>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		interrupt-parent = <&gpio2>;
+		interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&touch_pins>;
+
+		//avdd-supply = <&reg_touch_ldo_en>;
+		vdd-supply = <&ldo6>;
+
+		syna,reset-delay-ms = <200>;
+		syna,startup-delay-ms = <200>;
+
+		touchscreen-size-x = <1280>;
+		touchscreen-size-y = <800>;
+
+		rmi4-f01@1 {
+			reg = <0x01>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4-f11@11 {
+			reg = <0x11>;
+			touchscreen-size-x = <1280>;
+			touchscreen-size-y = <800>;
+			syna,sensor-type = <1>;
+		};
+	};
+};
-- 
2.43.0

