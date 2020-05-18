Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C07631D908F
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 09:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CCC36E52E;
	Tue, 19 May 2020 07:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628EF89EB8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 11:09:43 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id t7so4105302plr.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 04:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ywJR2u0sxzCry1AhZGxYacIrf0h0wV/3/P70ewifITY=;
 b=lsv+ci5O3BF5pp/Fzm/71bOqUhzwDhdV6mf6dmUZaX8uo7eiJj/O+bcYSv7PKy+8ty
 F6Jd/TsIHQfj5p/2VSeALGViY//PoM9iSxbRxo/QhYUCAkBuvp+pZVb3S8A6h56MIJma
 Rw7hOJo1IldF2kRvbRkdap29xtOomIqWhbV6Bk+reqa3cq6T2Xwzee2Z0+JMiiEvlSUb
 zAey2q/StEBydV5XSapPsH+hiTMxklq/qW7VLynMmIya4v1AcpH5tRzILJLSkUgNyBnu
 UHB9dw9Q7plOKVWzHLip2o679jj2TVpXaij9RfG76b9aKjARBZkn2+ZM2oQKU4HFn0tr
 M5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ywJR2u0sxzCry1AhZGxYacIrf0h0wV/3/P70ewifITY=;
 b=hxTya/1qCB371S/LSB/reTjECn54uJlwCKYA0N6Xb+5sHs9TY2gMMlxjBjd1HU00Fv
 FLTwuyAP7CC0Ggn+K4Fr28O9HeyzWJGWhEwGpkXSAJ+ayRxJhkLTrT9jicUWpQ4GzUCy
 cI0aabuKQwut07VMhu2WUUJwAZhdFXpUCw0KAaJHVtJ74IKuSIBxH59LoUaqmLmoTIVr
 szi7MEWK+/KSm0xR3WPv9k3vEw+xXiYghZnA8p4FTRjTD5TIYHm4KVzTzpmAJA8MP8gS
 1ArIqi/D6s9sr/t8uA23udXyUJ/OYCbWE+9p9bqsXtAPkK+MTGCv4GMEHvnGyhJiLDkJ
 Yu/w==
X-Gm-Message-State: AOAM5303qqynn6kc/YHY2AvSK4AFdUawNjrGyvkCy6CN9167+vjtKY9S
 5oG+7+NapBewy/gitUT/0eM=
X-Google-Smtp-Source: ABdhPJwCSYCh/1rzKVFG/X/BBP7KphC+GH9RMiQtvUBzCQoZyfTGn1DBeXe1tcs+tZRW+3x1Osg33w==
X-Received: by 2002:a17:902:a513:: with SMTP id
 s19mr16338427plq.84.1589800183045; 
 Mon, 18 May 2020 04:09:43 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id a15sm8290630pju.3.2020.05.18.04.09.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 04:09:42 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 broonie@kernel.org, devicetree@vger.kernel.org, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v4 2/8] ARM: dts: stm32: enable l3gd20 on stm32429-disco board
Date: Mon, 18 May 2020 19:09:19 +0800
Message-Id: <1589800165-3271-3-git-send-email-dillon.minfei@gmail.com>
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

L3gd20, st mems motion sensor, 3-axis digital output gyroscope,
connect to stm32f429 via spi5

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
index 392fa14..54c1b27 100644
--- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
@@ -316,6 +316,23 @@
 				};
 			};
 
+			spi5_pins: spi5-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('F', 7, AF5)>,
+						/* SPI5_CLK */
+						 <STM32_PINMUX('F', 9, AF5)>;
+						/* SPI5_MOSI */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('F', 8, AF5)>;
+						/* SPI5_MISO */
+					bias-disable;
+				};
+			};
+
 			dcmi_pins: dcmi-0 {
 				pins {
 					pinmux = <STM32_PINMUX('A', 4, AF13)>, /* DCMI_HSYNC */
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
