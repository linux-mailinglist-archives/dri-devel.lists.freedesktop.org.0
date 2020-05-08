Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 598E11CA680
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 10:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E046EAB6;
	Fri,  8 May 2020 08:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59166E1E0
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 04:13:29 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 145so258567pfw.13
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 21:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FwcBHEkgpi816HDa38k8dH6l9iAu/nO4Zhpk53Krt/4=;
 b=HcozJuektBhBGZGzSb6NtiZUXW+vXKMz+tmI9HpmNvc6WneM4GYTXNr8Z9jNyMKaqU
 dBp5dsPXy/FmQHQQa7/6hcGuKWjHXY+cS+0YcnQzvypM5GvJJ53YaxVfhPYQDZ0wMFTi
 K5G1Klp0fpWZmr5uy/5ziRvjbmpIEEzRldIjRVMrHGjbvCQ2SWIz3Lfe6jpPKyScPOEI
 n/F+Bh6qLaN4YVt1Btx61eEJlmLn3xN2UnNrjpiNOZ75aWOdPboleRsRNObFS4D4ejpx
 EWXHrFGCsgQdna0sMAdu06UzueA+PnpdEz/A9tNfKOFLDL9Y5Ea3RWq9nhabQeiz5Y6H
 MtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FwcBHEkgpi816HDa38k8dH6l9iAu/nO4Zhpk53Krt/4=;
 b=PC694KMWJfRRTSmzL+Sa86oedni84P/xyomeEva5Gob1BS8pgpXC6sxOW6V/V9pSZo
 ZsM/3dIjt3kVXqc8q+zhn5+7O8C2Q7BteGblk5yKLwxxu1Biy46HREqQIxmh/VN72MED
 pWHglDqsDR4riGM8NTikLV4JSzUARTrr65qdQ0IOx1qP7LF18iM2xmERiiH82TZ9EJIR
 Y+gd+gBDDiNxiylDKxJxYL9nw5+/RxxDrXqe9zOgVvJ3+Em4NBITB4VkwiiCkY7yUgQw
 Pbk3bSS2KI6P0H/hMCS9kllTrV2TuJ16Vo/5Vjj+gI2A8+FG31GLdO0n3rToB8Qhp1JI
 Zagw==
X-Gm-Message-State: AGi0PuYuS79pVUNmq2ILLYYDOkE/GWclQZDFjyMSe6e+/UCjEXHRUHnF
 T4J7toSJfEj50uund4gzUkc=
X-Google-Smtp-Source: APiQypLfzmDOwklw5AJIU1r5uLkQQrj0GcfwrLA3v2Q59+LXy/BZRcluqTxvpGbaYdlSHWH1dJyzWA==
X-Received: by 2002:a62:f941:: with SMTP id g1mr763602pfm.118.1588911209459;
 Thu, 07 May 2020 21:13:29 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id h12sm314868pfq.176.2020.05.07.21.13.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 21:13:29 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v2 2/5] ARM: dts: stm32: enable ltdc binding with ili9341 on
 stm32429-disco board
Date: Fri,  8 May 2020 12:13:11 +0800
Message-Id: <1588911194-12433-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588911194-12433-1-git-send-email-dillon.minfei@gmail.com>
References: <1588911194-12433-1-git-send-email-dillon.minfei@gmail.com>
X-Mailman-Approved-At: Fri, 08 May 2020 08:47:23 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
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
 arch/arm/boot/dts/stm32f429-disco.dts | 40 +++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
index 30c0f67..2d9637a 100644
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
@@ -127,3 +129,41 @@
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
+	cs-gpios = <&gpioc 2 GPIO_ACTIVE_LOW>;
+	dmas = <&dma2 3 2 0x400 0x0>,
+	       <&dma2 4 2 0x400 0x0>;
+	dma-names = "rx", "tx";
+	display: display@0{
+		/* Connect panel-ilitek-9341 to ltdc */
+		compatible = "stm32f429,ltdc-panel", "ilitek,ili9341";
+		reg = <0>;
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
+
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
