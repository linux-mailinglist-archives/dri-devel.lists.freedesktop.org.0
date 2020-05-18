Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD481D9083
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 09:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CEC6E161;
	Tue, 19 May 2020 07:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084CE6E0A0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 11:10:04 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id n15so1558519pfd.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 04:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=I1T/MSXgatC2plQLGmWEDShQlFTEnK6nXGcY9iM2hHM=;
 b=iLYajPKb4u2/NWaM0uZuIIE0Zgslm6lKb1y7vbs2KEVZmA5magKDWvcJaUjMVGG+Hq
 HtA7x5myFIX4Z4h80DOZFCe/VoYeirGoypijZ4/g7WZ7lvx1ubsUYNofLiJhE1wIPAhS
 3vih8uOhCFix1mDfEuK9yq+iHbVagLjCIBoienMxcwEIl1Lc8SaBOHhbQCmo6UYA0X2K
 nPPIsaiO4+H/UuvWhNm1AEtIIELfckw275sb9XmSEP5HNnY39X5zXHA34nbxGxOeIH5p
 97482nu6JWh6jXjVTCm8W087b5N2UPqd28djYacnRa8xQf8+F9jwruj10kyiX0vGDrp9
 ucag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=I1T/MSXgatC2plQLGmWEDShQlFTEnK6nXGcY9iM2hHM=;
 b=DiDOOThykpnhn68V3GL8dl9ZKfuUxW38REblug53mrlGQ/pjM/fuwswY8eOx+cPliR
 6OvJCFs82S/gEoKAqW6tzHeHxXBe7UUKO1cDHQMW1MEl97nzxzNTGsNxHm6DpydVr+Dw
 V8/7K7lCcyNDx1790Uu6eO+xJR2G6al0AL9KE6kR6HCMxqU0MXKXELOanGeJSEkEdKKB
 LTIU2171iJIvXUXDchNqac1tHGZ0YY5pUgNKWA+hn7joYqRjWtbkvQ5ERIKjm9edaum9
 cCPtFKtXjjywfW6e5nd6f5BGALh1bmCR50tvx3HzZ+O5ZZGvQ2rqmaGRSGQwB++OCafK
 g99w==
X-Gm-Message-State: AOAM531XaA1p+cEUrbjvBGzI6pK1mnQiIKzUTJIUYk8aOdNhtREFTrXH
 9tkRvT+XoF3Q5InTvW4y3sk=
X-Google-Smtp-Source: ABdhPJzTp8verXSiF/j8yXN0XwsCs3i8VyAOtQYBHq+u7MVM7vRjm0APUV2Qcp5rZcERI/eLfvhwIg==
X-Received: by 2002:a63:5f41:: with SMTP id t62mr14754996pgb.252.1589800203620; 
 Mon, 18 May 2020 04:10:03 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id a15sm8290630pju.3.2020.05.18.04.09.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 04:10:03 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 broonie@kernel.org, devicetree@vger.kernel.org, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v4 6/8] ARM: dts: stm32: enable ltdc binding with ili9341 on
 stm32429-disco board
Date: Mon, 18 May 2020 19:09:23 +0800
Message-Id: <1589800165-3271-7-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
References: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
X-Mailman-Approved-At: Tue, 19 May 2020 07:00:27 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-spi@vger.kernel.org,
 dillon min <dillon.minfei@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: dillon min <dillon.minfei@gmail.com>

Enable the ltdc & ili9341 on stm32429-disco board.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f429-disco.dts | 48 +++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
index 30c0f67..365d16f 100644
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
