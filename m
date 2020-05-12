Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB02A1CEDD1
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 09:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5132A6E874;
	Tue, 12 May 2020 07:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDFE6E041
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 07:04:02 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id f6so5744756pgm.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 00:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KnWhTxSokldqb010DnL4ORytzuGapXn7Hq520J7Za+c=;
 b=IjYwOS6yRJWzajwfxnyfRcGRgJufp90e2oizEGjmBih5am4Peqs//yI9PBpIboOzU2
 CZO7EDNpWbHzsF18edURJPTllwO9BZ79aBFYNtwcsZc6DFIZn8+alqC2s201mzhMJIkp
 3TcZmcgqnP3O5Sm7JeURdw7TyVUFJLRHTd4KqVs/bfP71TM6mTago+ifRJxbMabCZ5RU
 J7Rr93CevBl/XszLMpKAZXHFq488StrTbq+2a4M6QafQj1cDTCotx7X+cLzxoodu9eff
 fQnABVAI8DBaYWFsxbNkWlX8fqB/s7u68B+d7DEwdHDMFVEM8vQPZzyRaKh7wm1EUakk
 jn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KnWhTxSokldqb010DnL4ORytzuGapXn7Hq520J7Za+c=;
 b=GV4gRyVWwrXoD9fm24nbSEm47qWapJyeiBdS6XN4S+os4lAi2j2nBDEiKj2R9DiQQg
 Wi1dLP7PDygSG0rmY6HaaojR9ObeRqtNcz7IqU5FH+Ooc+QnZVLLaWPpiWud926QYB5j
 l1V3aKNWXEW2L827+rpq6f9lAnwojHlKxYNjq35qpASoDeuo1ykJGc40Ndmlq+PYtvFc
 qo0ngQpqlFXWzA7ttq2MTjlvXQDZp4FwvQ7P3s2JIqYGwGrRez0rrGZWwpBVvI1/fCjE
 yoqIAZ1S4p/j40NrVoTAeuHA6WLsYq/7+wbh3ICJzkIwu/cLdu1NRcmGn9fl0tiglKbp
 YXzQ==
X-Gm-Message-State: AGi0PuYFIWins4VXT+tvUwckNj4EE51fkTHgd3JNJjD/1HqfYAAC3znI
 P+SdvTFcyKO/9HeFqL+Pq+4=
X-Google-Smtp-Source: APiQypJgzsQrvrMxxxS1gIKRvHu2KK37xvZy80d20Mc2DmCk4cb+KwcWxqzPiseDTD0DXbnIzfEGlQ==
X-Received: by 2002:a63:9801:: with SMTP id q1mr19050050pgd.447.1589267041774; 
 Tue, 12 May 2020 00:04:01 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id 62sm11016369pfu.181.2020.05.12.00.03.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 May 2020 00:04:01 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v3 3/5] ARM: dts: stm32: enable ltdc binding with ili9341 on
 stm32429-disco board
Date: Tue, 12 May 2020 15:03:35 +0800
Message-Id: <1589267017-17294-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
References: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
X-Mailman-Approved-At: Tue, 12 May 2020 07:09:30 +0000
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
 dillon.minfei@gmail.com, linux-clk@vger.kernel.org,
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

Changes:

V3:
    change dts binding compatible to "st,sf-tc240t-9370-t"

V2:
    none

v1:
    none

arch/arm/boot/dts/stm32f429-disco.dts | 39 +++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
index 30c0f67..4475e40 100644
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
@@ -127,3 +129,40 @@
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
+		/* Connect panel-ilitek-9341 to stm32 via ltdc*/
+		compatible = "st,sf-tc240t-9370-t";
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
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
