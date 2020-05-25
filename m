Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DF91E07E6
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE59989C94;
	Mon, 25 May 2020 07:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F9289C52
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 03:45:59 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id q9so7983838pjm.2
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 20:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=GfRuA4swEZrmalrNdqlTpHmV2cl0sSIm4Vls/KHgpHc=;
 b=b/s8P7WPUDewoqGZVXz5SBp8jQzfaawmkcFAeBHofbTFHfPjKTMllWSLGQ75XgH0w6
 U14KzKR3jeOQrIv6TmlitrHNXfMqesnU3Jsga5vkHwEXNO++5eM+ue6eCOO+Ce5PZg9N
 O+q0ajIM61pqMEeEqNfkTcQru0EaCWKO4PY1ZxHnodokXQC2Qa4+fPP2cZeDC9NYKyGx
 nwuJ5x2jmSq/ayXeZkDJt6ktT6xx0vxvrpImk7JDIq2k2yN4n1Pn65NhX6FoIWK4p7Ng
 A1kaiwWlu/NqHeLb0e6hTbNBDMs3VL95Fpge5YCi/M4Kgg+kRoMMmQx/NdjqqrnC47TN
 B4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=GfRuA4swEZrmalrNdqlTpHmV2cl0sSIm4Vls/KHgpHc=;
 b=XIPxKCRcHaSG975CT2IZXYU08d1i61rKsIUFM0oR6LoHB0EEW6NfVSj7+yh5nn4SAk
 cStUxMFkUGKwf5jNcInZu95F1xEt4iRx8A0gxdDMV8GR/+LGzjWw02cww6XZ5j1INKcd
 Atz3zLt0a9u/KYZC0XgmA/1YEJnS7/wHhLE5YRLfYr1HDyiV8ZuH+NIcZajCkVdQE8gB
 JHG/+LPwXRHf//qoEc2GVDEShSaDKnO2gbS+0ijawpxO2o89FMPxdxCIelOzNh/Ey6y3
 ccDhvLegS8m/TN492vMUK+82qst3QaCMLlXaj16kqL6KlLWUvjnmJ8Y8cyFUkUtsabi6
 wO5w==
X-Gm-Message-State: AOAM5318IJI6b6hlxaix+KipmVIZarQGLJU7yxK9DmwbOc3HqJvOmykc
 HvnJTGMZQaa2K4uewFUKOCs=
X-Google-Smtp-Source: ABdhPJxii5WiWaGwqt4iLc/zkIDoBNCEavl9Xso9CCancCAU55WqainDQzxqHBdPlE2arZkpe3Qoug==
X-Received: by 2002:a17:90b:8d1:: with SMTP id
 ds17mr17745374pjb.76.1590378359552; 
 Sun, 24 May 2020 20:45:59 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.44])
 by smtp.gmail.com with ESMTPSA id i98sm12152831pje.37.2020.05.24.20.45.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 May 2020 20:45:59 -0700 (PDT)
From: dillon.minfei@gmail.com
To: linus.walleij@linaro.org,
	broonie@kernel.org
Subject: [PATCH v5 2/8] ARM: dts: stm32: Add pin map for ltdc & spi5 on
 stm32f429-disco board
Date: Mon, 25 May 2020 11:45:42 +0800
Message-Id: <1590378348-8115-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
References: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
X-Mailman-Approved-At: Mon, 25 May 2020 07:21:04 +0000
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
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: dillon min <dillon.minfei@gmail.com>

This patch adds the pin configuration for ltdc and spi5 controller
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
