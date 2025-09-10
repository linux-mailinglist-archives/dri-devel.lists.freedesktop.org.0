Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2034B514DF
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 13:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F3B10E8D6;
	Wed, 10 Sep 2025 11:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vinarskis.com header.i=@vinarskis.com header.b="eWzpltn8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch
 [185.70.43.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDE510E8D8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 11:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
 s=protonmail; t=1757502484; x=1757761684;
 bh=WVAZkSDamM6pxbj/GVHH3PYvdQm8SxrqzkK9f4jXnr4=;
 h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=eWzpltn87rCiyyQBJUp7vRnPZXNyU3H0OzGMPb6LPJkb61q32Zrteoq/uwCgjzwfa
 uVFd3PYwEuFIIq7atpigf46P8ZL2pTBrlfQvwdcKGL4xYZ8QKm2AV05op6kbqSU7WY
 N+OAWNaPM4rI/6QFVtjhczhUW9L3stNPuBFxhe3gjoJ1Ik5APcaXhQubQ7A4CTbM8W
 BQgdjDmdE+MAbdWIIg3eNOd40fba6CDtAMHZJ1SSH/iALN5t8lLpd/fWy8RUN3kQyH
 vW1qk9FOsHwcVVJzKkzGkMyBI5+CPtdYdu0o08c88q1HQD6BSb6knnqifYiXhFX4HL
 g3/TtFNTlANew==
X-Pm-Submission-Id: 4cMHwc5yG7z2ScCt
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Wed, 10 Sep 2025 13:07:40 +0200
Subject: [PATCH v4 4/4] arm64: dts: qcom: sc8280xp-x13s: enable camera
 privacy indicator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-leds-v4-4-1fc320488233@vinarskis.com>
References: <20250910-leds-v4-0-1fc320488233@vinarskis.com>
In-Reply-To: <20250910-leds-v4-0-1fc320488233@vinarskis.com>
To: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 threeway@gmail.com, Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=MrJ75K5TTGWsUdBgpB6wcSaOrHL0GEx8YvZLO6OHvZk=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBkHY1i7Dd/wNV2TMgp7/s+PfduOR475Z84UuM//ueLxT
 d1eAx/9jlIWBjEuBlkxRZbuP1/TuhbNXctwXeMbzBxWJpAhDFycAjAR5wxGhvPensm6/BOZRP7q
 VEmGWNl0lk05mCiwiCHnGiNjTn+eBCPD7uPXChdOn3RV9nVGJEe93F+JWe/vX1q67/aZa6Zv77V
 GsAEA
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Leverage newly introduced 'leds' and 'led-names' properties to pass
indicator's phandle and function to v4l2 subnode. The latter supports
privacy led since couple of years ago under 'privacy-led' designation.
Unlike initially proposed trigger-source based approach, this solution
cannot be easily bypassed from userspace, thus reducing privacy
concerns.

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 637430719e6d7d3c0eeb4abf2b80eea1f8289530..3b3f7137689a6fa292ffe4fec8c1d1f20ee525bc 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -83,14 +83,11 @@ leds {
 		pinctrl-names = "default";
 		pinctrl-0 = <&cam_indicator_en>;
 
-		led-camera-indicator {
-			label = "white:camera-indicator";
+		privacy_led: privacy-led {
 			function = LED_FUNCTION_INDICATOR;
 			color = <LED_COLOR_ID_WHITE>;
 			gpios = <&tlmm 28 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "none";
 			default-state = "off";
-			/* Reuse as a panic indicator until we get a "camera on" trigger */
 			panic-indicator;
 		};
 	};
@@ -685,6 +682,9 @@ camera@10 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&cam_rgb_default>;
 
+		leds = <&privacy_led>;
+		led-names = "privacy";
+
 		clocks = <&camcc CAMCC_MCLK3_CLK>;
 
 		orientation = <0>;	/* Front facing */

-- 
2.48.1

