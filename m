Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D7E1CA678
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 10:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AC86EAA6;
	Fri,  8 May 2020 08:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754676E1D2
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 04:13:25 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id q24so3655159pjd.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 21:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bqTEGNao+ElhEnj/Er0d6hjqKNpR+gP54ehE1oHzSA8=;
 b=i/wVvqB3+fPstJONzideNUUichY4wXWAHwVT5OQLoilFMuWRm7HLeiVWnJD9vk5L2g
 h4DjyEQWGBpKydXHU4jH84MwcoftntpYGKLRk7FeRa2HlSbTL7k/dCDmlTDLUYqrNv9x
 8fKBPKdrsl1AgvxHR+2tsJI+a/Zn7fS8yL5vBco3g5r5hy68/ez54uQXLk02BYhzNwxe
 XJ+57zEcPIeXSYqew1WXPstiL7P9xONrnXfrZHUpHcQij+nSG/2LQe6RMHTZuIk8W8nF
 yhNLkDSAxYl9+2wxiG6WmvwyvgnWi2SVjnvkJjV/gyXpEB8cfuMG6whNJnyE3S73SEiI
 5r5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bqTEGNao+ElhEnj/Er0d6hjqKNpR+gP54ehE1oHzSA8=;
 b=ZTyPnBXWKC9hfM9jg8vYLe0DgZiO62Ma3EvlFZxDhTJ/gSkub/LVCMve6y4brudRBs
 p0d+J/Y3y7knCjwIxqEFYx8hENtIsbm8Sd5oSDgugr/WLdU5xV9AbD51VI8hC1IhIbcK
 TbdDq0k3IDNXQz27JPM8IYbGhYT7YyOdDkExoTEeu903qA8MyMWB+VsuZVsa512newrg
 5A85Sq7Qxx6BH3eNupJvXrVLVe0oq2K4MRngbHhyHnI5+ZDyxyZdqtLxPupt8aELFPwI
 bhoDMLwlHRWutHIeJRSDJqZ8CoQGHDLuY8cfBFEp1pQp+oegKQfZmhe1Sss7JwLPghI/
 ESIA==
X-Gm-Message-State: AGi0PuZ2u9f0bevJrdyBWwo2v5EBTtWpI029ZgRM/zeMYyYRlhEN2Oaq
 1eu8zKHXZV/S7wtuM0i+6P7wlMb9NP0=
X-Google-Smtp-Source: APiQypKaHw2KbN8J8RS60qHgSElYdfw03GNwICgDqOrarpdg12Wuj8BCSk6lbVC3eFPsDQVLZweYLQ==
X-Received: by 2002:a17:90a:fd89:: with SMTP id
 cx9mr3869773pjb.64.1588911205126; 
 Thu, 07 May 2020 21:13:25 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id h12sm314868pfq.176.2020.05.07.21.13.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 21:13:24 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v2 1/5] ARM: dts: stm32: Add pin map for ltdc,
 spi5 on stm32f429-disco board
Date: Fri,  8 May 2020 12:13:10 +0800
Message-Id: <1588911194-12433-2-git-send-email-dillon.minfei@gmail.com>
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

This patch adds the pin configuration for ltdc, spi5 controller
on stm32f429-disco board.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 67 ++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
index 392fa14..0eb107f 100644
--- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
@@ -316,6 +316,73 @@
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
