Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5868B458975
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 07:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496F489DA5;
	Mon, 22 Nov 2021 06:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3BC89DA2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 06:53:42 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id h63so14449512pgc.12
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Nov 2021 22:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6ZYBayqIBeNPyf7qiUQrCfEnJGA1MHxlxCodqslkh4s=;
 b=PaV53uN3Bh2l/u1ajsS+dqhp1L3F1BbzF1ZBQQxycWhCRwyhKvB2H88V9WiywrrVLt
 NjufX/Ygm6PBYGPd1QpJVMqz1tHTxwHgVvLffP5TiSdvHG9Ft5HQm1fEB4SiDydBp3Gr
 2MKJYVlk0klZeV3jyDqnJ5ig7P8ZU4J+DTqbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ZYBayqIBeNPyf7qiUQrCfEnJGA1MHxlxCodqslkh4s=;
 b=AE2aGVa7xM6zsgqHKHJ17OQCuxq5gvYWq8vi97yy0rfYUl10MnHLqPkwV6UqrISaj/
 ObI6FSzl9CFBA042S99H01YxzV5xQgn7bPZ9gqixTO5l356PeK/cKMsVpMQ14fkZfnWk
 tuJUenP841rgEoyvXiwvTBHYJqrEFU8Swh1mXI7a4+KnTnVsy2aHDnVWMj4VbXTe/0Ec
 EKQ/I326ZjL4WOop+NBPOEXHc26xnvMo42HP2ZG+KIO0vJq+UK4mEWYHVTS9VJ6eQm8W
 0bkIq0zT33m8dua0nEzXteizlGKpFtVzLecIVt9Yw9FueNKB8Aa1a2+4G4Cw0GDBcM5p
 BkxQ==
X-Gm-Message-State: AOAM53121Y8xREt0Hoor1LEYuO8aENhkyTiLAzuclipU9OU0GxM6/oFG
 ETPzZkmLwqQ+0TBzPqfZNYFHjw==
X-Google-Smtp-Source: ABdhPJxcXZIakoyYSn6+C8N1lINsE7W9IwpLczZBdTvnpe8G7x0c90nNZ5KsWUmK1csdTVT1THCOWA==
X-Received: by 2002:a63:8a41:: with SMTP id y62mr31942595pgd.48.1637564022162; 
 Sun, 21 Nov 2021 22:53:42 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:eed6:c913:819a:3850])
 by smtp.gmail.com with ESMTPSA id a8sm7935904pfv.176.2021.11.21.22.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 22:53:41 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [DO NOT MERGE] [PATCH v5 5/7] ARM: dts: sun8i: bananapi-m2m: Enable
 S070WV20-CT16 Panel
Date: Mon, 22 Nov 2021 12:22:21 +0530
Message-Id: <20211122065223.88059-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122065223.88059-1-jagan@amarulasolutions.com>
References: <20211122065223.88059-1-jagan@amarulasolutions.com>
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

This patch add support for Bananapi S070WV20-CT16 panel to
BPI-M2M board.

This specific DSI Bananapi S070WV20-CT16 panel driver is not
available in upstream, added for testing purpose.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts | 40 ++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts b/arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts
index bf5b5e2f6168..b215c32996a3 100644
--- a/arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts
+++ b/arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts
@@ -44,6 +44,7 @@
 #include "sun8i-a33.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pwm/pwm.h>
 
 / {
 	model = "BananaPi M2 Magic";
@@ -61,6 +62,14 @@ chosen {
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
 
@@ -122,6 +131,27 @@ &dai {
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
@@ -157,6 +187,12 @@ &ohci0 {
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
 
@@ -269,6 +305,10 @@ &sound {
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

