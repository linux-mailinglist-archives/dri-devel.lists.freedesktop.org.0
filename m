Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF861D9087
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 09:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9916E50D;
	Tue, 19 May 2020 07:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C4D89F2D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 11:09:53 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id q9so4874626pjm.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 04:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=eu8Y+3kRQM/USnH5yzkkCNIQbKXjIgArtceSXqO2K04=;
 b=SYCy2JXfMKollyID3Ho5YgxpSh0LrBqOCbp1W+NTv8ArKSBhVfYnQQb5iD59P6vNKf
 bydaSGrCkSIlhCtG4x087JQUpKyomjDGQsbkpt0QSZ55xcfyAdHNQWceSUghV7umH8ZF
 HICfOfpfRpe3el3WU62lDKmnXkRVAHxvEZAvv7ITQraEgZxhcAtAaA4bQrtYRWMLDNLA
 aGoZ/PsT9bWgY97v+7hzdu8CgXroeqSNVd1AqcuRXc/AIW834eIp55svDvNoaHfMnac5
 0kCEu2FPZ1ZSQAFyUlRgvUgnAyWrPGGoEIjihvBARV62OLS+Q6pyz5q+W/gKlz2zN02l
 dQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=eu8Y+3kRQM/USnH5yzkkCNIQbKXjIgArtceSXqO2K04=;
 b=DI7stm2gVdOT+G9dZnT6goGWDN9c9+eWyLe2OrilXSjEjcRu5N1ka2PA4SsqDZekb1
 Aoaehu78nhp3sr2UxC60VzQAmzNWTeYTOcKb+YfOaUZ+5sOiHwL9L7xWdwX7Opo+GOK8
 tc3N699DxDc4phLLxvuLnVCvClB3pFNDks5Br7zfCp+UQHkL+9gq9zqWgNqJg4LCiE/z
 vTnAKZIlzw+UkPs1fJV3m1jJqd+hpbN62JNwrYGA8yaVwVlYTNyjTm+eoKyjiJiZgVjl
 hzDcXRqr0dKdBvyduUpzS1F4WbsMSpcMsRUjQ2OerZ80HSIB0nBRXEcW3zPRfD+PCG/b
 pCxg==
X-Gm-Message-State: AOAM531i9xlVat5YcURaJ40MMouNIEYfXNWDhqZwkxzS8ZbBFVqety1B
 xAhMbhOW3DcArAZMwn98zlA=
X-Google-Smtp-Source: ABdhPJxZv32MXI2NS/zMY/o4Uo1RotZrCRnG98wKQmtgtBkpDu5mj+G3hzWv/6hhWrtYNHG+vIHrag==
X-Received: by 2002:a17:90a:8c01:: with SMTP id
 a1mr8944191pjo.127.1589800193350; 
 Mon, 18 May 2020 04:09:53 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id a15sm8290630pju.3.2020.05.18.04.09.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 04:09:53 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 broonie@kernel.org, devicetree@vger.kernel.org, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v4 4/8] ARM: dts: stm32: Add pin map for ltdc on
 stm32f429-disco board
Date: Mon, 18 May 2020 19:09:21 +0800
Message-Id: <1589800165-3271-5-git-send-email-dillon.minfei@gmail.com>
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

This patch adds the pin configuration for ltdc controller
on stm32f429-disco board.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 50 ++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
index 54c1b27..0eb107f 100644
--- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
@@ -316,6 +316,56 @@
 				};
 			};
 
+			ltdc_pins_f429_disco: ltdc-1 {
+				pins {
+					pinmux = <STM32_PINMUX('C', 6,  AF14)>,
+						/* LCD_HSYNC */
+						 <STM32_PINMUX('A', 4,  AF14)>,
+						 /* LCD_VSYNC */
+						 <STM32_PINMUX('G', 7,  AF14)>,
+						 /* LCD_CLK */
+						 <STM32_PINMUX('C', 10, AF14)>,
+						 /* LCD_R2 */
+						 <STM32_PINMUX('B', 0,  AF9)>,
+						 /* LCD_R3 */
+						 <STM32_PINMUX('A', 11, AF14)>,
+						 /* LCD_R4 */
+						 <STM32_PINMUX('A', 12, AF14)>,
+						 /* LCD_R5 */
+						 <STM32_PINMUX('B', 1,  AF9)>,
+						 /* LCD_R6*/
+						 <STM32_PINMUX('G', 6,  AF14)>,
+						 /* LCD_R7 */
+						 <STM32_PINMUX('A', 6,  AF14)>,
+						 /* LCD_G2 */
+						 <STM32_PINMUX('G', 10, AF9)>,
+						 /* LCD_G3 */
+						 <STM32_PINMUX('B', 10, AF14)>,
+						 /* LCD_G4 */
+						 <STM32_PINMUX('D', 6,  AF14)>,
+						 /* LCD_B2 */
+						 <STM32_PINMUX('G', 11, AF14)>,
+						 /* LCD_B3*/
+						 <STM32_PINMUX('B', 11, AF14)>,
+						 /* LCD_G5 */
+						 <STM32_PINMUX('C', 7,  AF14)>,
+						 /* LCD_G6 */
+						 <STM32_PINMUX('D', 3,  AF14)>,
+						 /* LCD_G7 */
+						 <STM32_PINMUX('G', 12, AF9)>,
+						 /* LCD_B4 */
+						 <STM32_PINMUX('A', 3,  AF14)>,
+						 /* LCD_B5 */
+						 <STM32_PINMUX('B', 8,  AF14)>,
+						 /* LCD_B6 */
+						 <STM32_PINMUX('B', 9,  AF14)>,
+						 /* LCD_B7 */
+						 <STM32_PINMUX('F', 10, AF14)>;
+						 /* LCD_DE */
+					slew-rate = <2>;
+				};
+			};
+
 			spi5_pins: spi5-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('F', 7, AF5)>,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
