Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 700CA46FFAA
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 12:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A67610E354;
	Fri, 10 Dec 2021 11:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD98D10E354
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 11:17:44 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id m24so6045797pls.10
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 03:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0NNSlBkMytmlUqdX2xwQU1vlLDJZ1w1h/BzLFbdr4yY=;
 b=RqnPQEYavJNPeWxOrBLnyw0D3NtNdnT0SH5VJa58LzdHAfh0382UeHnRRq/6cFZ4NO
 u7dN1MLadLcWpg8UUFfF6NZXi9w8gJoALaumO/1tJjOIAw655giypkgddgi4vMbHwBqp
 wMqfRhjFxlJgndUhPKZ9LpYFUx8jcIvjIH7yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0NNSlBkMytmlUqdX2xwQU1vlLDJZ1w1h/BzLFbdr4yY=;
 b=i0CphbC2qTHFP6SfFNd9YnRyw0BqnWOnOOViqR2OHvER84Vxdmsz97i2gsvMGPLP4i
 89tSKfREPbMTiaWL/1+tLXFFoqtov3bXxe1hfiYb0EPNXeWdvA3Tkynjvcl85OQu+neE
 W+f2ahMRBwVaaYh4mmVB2++eEz/RHI/kSa3MDuRhSGM2H1osx/DKDNg/XGlmIc1zxht0
 zu/RwAu6c2MpWUFiHS5OE8g/WDP29xaHjJs30OhIf3Oz4tAHF0zX5nS36l0idZfE7tNK
 R8Jud14oveCBpghc2Irz8ZtH0bzN/2vQtgESjjM10FvsFehERtxp8b9DelYcKQpUss2x
 6QBA==
X-Gm-Message-State: AOAM531oll1lx5Te2toxMeIZLWWkJ2imwFRle+rNpq/nGLJnIXB1HloU
 ThRZjCrFEaMtzTSYrEXpgjuCgg==
X-Google-Smtp-Source: ABdhPJy/bmsOZ/tu5QGGP0pWpCMvmCixy399EDtTxuOo97cSowv1bB9e6RCMQlDQr9ybsnIaZ8geQw==
X-Received: by 2002:a17:902:f092:b0:141:ccb6:897 with SMTP id
 p18-20020a170902f09200b00141ccb60897mr75163980pla.89.1639135064477; 
 Fri, 10 Dec 2021 03:17:44 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:c40f:36d4:b45d:731])
 by smtp.gmail.com with ESMTPSA id
 qe12sm13125607pjb.29.2021.12.10.03.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 03:17:44 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [DO NOT MERGE] [PATCH v6 4/6] ARM: dts: sun8i: bananapi-m2m: Enable
 iS070WV20-CT16 DSI Panel
Date: Fri, 10 Dec 2021 16:47:09 +0530
Message-Id: <20211210111711.2072660-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210111711.2072660-1-jagan@amarulasolutions.com>
References: <20211210111711.2072660-1-jagan@amarulasolutions.com>
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
Cc: linux-sunxi@googlegroups.com, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Bananapi S070WV20-CT16 is a pure RGB output panel with ICN6211
DSI/RGB convertor bridge.

Enable support for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../boot/dts/sun8i-r16-bananapi-m2m-panel.dts | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r16-bananapi-m2m-panel.dts b/arch/arm/boot/dts/sun8i-r16-bananapi-m2m-panel.dts
index bf5b5e2f6168..04392358b492 100644
--- a/arch/arm/boot/dts/sun8i-r16-bananapi-m2m-panel.dts
+++ b/arch/arm/boot/dts/sun8i-r16-bananapi-m2m-panel.dts
@@ -44,6 +44,7 @@
 #include "sun8i-a33.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pwm/pwm.h>
 
 / {
 	model = "BananaPi M2 Magic";
@@ -55,12 +56,21 @@ aliases {
 		i2c2 = &i2c2;
 		serial0 = &uart0;
 		serial1 = &uart1;
+		mmc0 = &mmc0;
 	};
 
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm 0 50000 PWM_POLARITY_INVERTED>;
+		brightness-levels = <1 2 4 8 16 32 64 128 255>;
+		default-brightness-level = <8>;
+		enable-gpios = <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* LCD-BL-EN: PL4 */
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -122,6 +132,27 @@ &dai {
 	status = "okay";
 };
 
+&de {
+	status = "okay";
+};
+
+&dphy {
+	status = "okay";
+};
+
+&dsi {
+	vcc-dsi-supply = <&reg_dcdc1>;		/* VCC-DSI */
+	status = "okay";
+
+	panel@0 {
+		compatible = "bananapi,s070wv20-ct16-icn6211";
+		reg = <0>;
+		reset-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* LCD-RST: PL5 */
+		enable-gpios = <&pio 1 7 GPIO_ACTIVE_HIGH>; /* LCD-PWR-EN: PB7 */
+		backlight = <&backlight>;
+	};
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -157,6 +188,12 @@ &ohci0 {
 	status = "okay";
 };
 
+&pwm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm0_pin>;
+	status = "okay";
+};
+
 &r_rsb {
 	status = "okay";
 
@@ -269,6 +306,10 @@ &sound {
 	status = "okay";
 };
 
+&tcon0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
2.25.1

