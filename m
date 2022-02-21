Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6908F4BD8BA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 10:54:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32EBB10E2D3;
	Mon, 21 Feb 2022 09:54:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1C2112CCF
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 09:53:44 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1nM5Nb-0007AW-9u; Mon, 21 Feb 2022 10:53:15 +0100
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ore@pengutronix.de>)
 id 1nM5NZ-00FUea-LD; Mon, 21 Feb 2022 10:53:13 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 4/8] ARM: dts: imx6qdl-vicut1: update gpio-line-names for
 some GPIOs
Date: Mon, 21 Feb 2022 10:53:08 +0100
Message-Id: <20220221095312.3692669-4-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220221095312.3692669-1-o.rempel@pengutronix.de>
References: <20220221095312.3692669-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org, Robin van der Gracht <robin@protonic.nl>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Oleksij Rempel <o.rempel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Jander <david@protonic.nl>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Jander <david@protonic.nl>

countedX lines have different board names (YACO_x). And REV_ and BOARD_ pins
have multiple functions. So, use names exposed to the OS.

Signed-off-by: David Jander <david@protonic.nl>
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 arch/arm/boot/dts/imx6qdl-vicut1.dtsi | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-vicut1.dtsi b/arch/arm/boot/dts/imx6qdl-vicut1.dtsi
index 2f6b263eea66..ec39008c0950 100644
--- a/arch/arm/boot/dts/imx6qdl-vicut1.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-vicut1.dtsi
@@ -277,9 +277,9 @@ &gpio1 {
 
 &gpio2 {
 	gpio-line-names =
-		"count0", "count1", "count2", "", "", "", "", "",
-		"REV_ID0", "REV_ID1", "REV_ID2", "REV_ID3", "REV_ID4",
-			"BOARD_ID0", "BOARD_ID1", "BOARD_ID2",
+		"YACO_WHEEL", "YACO_RADAR", "YACO_PTO", "", "", "", "", "",
+		"", "LED_PWM", "", "", "",
+			"", "", "",
 		"", "", "", "", "", "", "", "ON_SWITCH",
 		"POWER_LED", "", "ECSPI2_SS0", "", "", "", "", "";
 };
@@ -298,8 +298,10 @@ &gpio4 {
 		"", "", "", "", "", "", "UART4_TXD", "UART4_RXD",
 		"UART5_TXD", "UART5_RXD", "CAN1_TX", "CAN1_RX", "CAN1_SR",
 			"CAN2_SR", "CAN2_TX", "CAN2_RX",
-		"LED_DI0_DEBUG_0", "LED_DI0_DEBUG_1", "", "", "", "", "", "",
-		"", "", "", "", "BL_EN", "BL_PWM", "", "";
+		"LED_DI0_DEBUG_0", "LED_DI0_DEBUG_1", "", "", "", "ON1_CTRL",
+			"ON2_CTRL", "HITCH_IN_OUT",
+		"LIGHT_ON", "", "", "CONTACT_IN", "BL_EN", "BL_PWM", "",
+			"ISB_LED";
 };
 
 &gpio5 {
-- 
2.30.2

