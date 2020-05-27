Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ABB1E5957
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4816E44D;
	Thu, 28 May 2020 07:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F70898CA
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 07:27:56 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id s10so11386758pgm.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 00:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Onz0m4658GcwNr7+Ki8b+efZhD5UwVfFPAClpApbxu0=;
 b=qzfCjtCaNGhfLciJD54Qh0tr4HfhlWRrFOV4JqFKlMpPdMNiyfoPVd6vh8IKAjR6+w
 C3AxBzG4tFG5AdOMu96Ur6YY/V4j6KirRzrwgdy+q8SsNNRhQfzTBZoCGK0nKcuEH6jf
 Y/1G+YUZWV57/XbaDHtNSoP/ya1KgxF23wSVZw1hqxBtOWbPFu+RM6v7DXRgrfPD1r8W
 egyo5asIcWN8twWGCbqUEZlLLLsGpR65xSoNRDxh/XVqIUb9qytoVqhE11VAR5QECjzV
 gXBuGjBHyEzOYijY7L1lKKXkAOwdAVLV4/NtmD2MMusXDm23palSzGptNSoAQQiEXOQE
 VrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Onz0m4658GcwNr7+Ki8b+efZhD5UwVfFPAClpApbxu0=;
 b=NjN9F8jmlLFKwLNzXDfS6/Wo0gPnfSA1iZmTRHmdDo1XmFUUHYaJrRrECh3Y/8n+xO
 lLFOQoWcELKhJGenb1yIuVF6fKAZi/YATkUQGk92basKreMdy47qi2mI0x7MX4bPr35O
 7AzCnnOzlRJnbNUirsCJ50MNVsDJH5AmTNtEtLhlSOWWuupCZMP9MWYzrRX8sjN9SA6w
 XfWKH2lLaZNB6RiHLsL/C8gfze4tPN8EaVRaoREG7a17c4c18TTNOobUBE6N9dhhvfG1
 sSfd6M1AenwCIrf4T1N3ZOIexsXpRMmFZA/nmeKRkxUlI4Rd3kTlBUAoDS0xJ3GnXQT2
 kZ1w==
X-Gm-Message-State: AOAM531sgs0F7yT00Trs2YLa5SVd9UdCEAgsP/5gbhNpi3b1aAStjPKe
 4kPMm+nrfHyxqiXbQLd6hgk=
X-Google-Smtp-Source: ABdhPJxrq6LGGhU2T5g5A4vxN18i9oicAGxndDihLIS9MQThMQYthUtoVFwyJepniaGtO+w8ZQMX1g==
X-Received: by 2002:a63:dc44:: with SMTP id f4mr2832593pgj.442.1590564476259; 
 Wed, 27 May 2020 00:27:56 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.44])
 by smtp.gmail.com with ESMTPSA id q201sm1371842pfq.40.2020.05.27.00.27.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 May 2020 00:27:55 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch, mturquette@baylibre.com,
 sboyd@kernel.org, andy.shevchenko@gmail.com, noralf@tronnes.org,
 linus.walleij@linaro.org, broonie@kernel.org
Subject: [PATCH v6 3/9] ARM: dts: stm32: enable ltdc binding with ili9341,
 gyro l3gd20 on stm32429-disco board
Date: Wed, 27 May 2020 15:27:27 +0800
Message-Id: <1590564453-24499-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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
Cc: devicetree@vger.kernel.org, dillonhua@gmail.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: dillon min <dillon.minfei@gmail.com>

Enable the ltdc & ili9341, gyro l3gd20 on stm32429-disco board.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f429-disco.dts | 48 +++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
index 30c0f6717871..365d16fd3934 100644
--- a/arch/arm/boot/dts/stm32f429-disco.dts
+++ b/arch/arm/boot/dts/stm32f429-disco.dts
@@ -49,6 +49,8 @@
 #include "stm32f429.dtsi"
 #include "stm32f429-pinctrl.dtsi"
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "STMicroelectronics STM32F429i-DISCO board";
@@ -127,3 +129,49 @@
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&ltdc {
+	status = "okay";
+	pinctrl-0 = <&ltdc_pins_f429_disco>;
+	pinctrl-names = "default";
+
+	port {
+		ltdc_out_rgb: endpoint {
+			remote-endpoint = <&panel_in_rgb>;
+		};
+	};
+};
+
+&spi5 {
+	status = "okay";
+	pinctrl-0 = <&spi5_pins>;
+	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	cs-gpios = <&gpioc 1 GPIO_ACTIVE_LOW>, <&gpioc 2 GPIO_ACTIVE_LOW>;
+
+	l3gd20: l3gd20@0 {
+		compatible = "st,l3gd20-gyro";
+		spi-max-frequency = <10000000>;
+		st,drdy-int-pin = <2>;
+		interrupt-parent = <&gpioa>;
+		interrupts = <1 IRQ_TYPE_EDGE_RISING>,
+				<2 IRQ_TYPE_EDGE_RISING>;
+		reg = <0>;
+		status = "okay";
+	};
+
+	display: display@1{
+		/* Connect panel-ilitek-9341 to ltdc */
+		compatible = "st,sf-tc240t-9370-t";
+		reg = <1>;
+		spi-3wire;
+		spi-max-frequency = <10000000>;
+		dc-gpios = <&gpiod 13 0>;
+		port {
+			panel_in_rgb: endpoint {
+			remote-endpoint = <&ltdc_out_rgb>;
+			};
+		};
+	};
+};
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
