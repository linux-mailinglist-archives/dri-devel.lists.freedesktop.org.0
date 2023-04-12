Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A90B86DF377
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 13:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C547B10E7B0;
	Wed, 12 Apr 2023 11:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4495310E78D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 11:28:23 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CB19C66032EB;
 Wed, 12 Apr 2023 12:28:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681298902;
 bh=xUQYw0z/3eD48tbUC6FkC0FmT/7tvqDbRz8S5+ghVDQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UiDRoD/awykx1G8oFAEFQ1z3rHmX6u5CgvPp9Ttb5eVfOz2rGgXgHCyHyJPDPppAB
 Z9BZ+0ieRQczDcAEh7xhreHlVE8xq8tUQ4rmfBrKhruvRyXpIgMNJ2/wveG2HfzXv3
 xmfXU/jdBAoaLjMqDdLEIwx2mljisr8xT2QkGN0XiNE1WcR2ttFQ0rTbn7/POWQGaU
 1Q3uno27kmTpcLMA6VWSEq1yaZ00V/A2W297bWYJ4jTAZ9o4avL5bthLXTgWaNWw5h
 t7neth4CgeLeEKOGT8X/PRCvHjidg16w9ZBqySIAADjhpwuYEW6O8dtUvZYzbpznPA
 bJySENdAEub7g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Subject: [PATCH 26/27] arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch
 BMA255 Accelerometer
Date: Wed, 12 Apr 2023 13:27:38 +0200
Message-Id: <20230412112739.160376-27-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, kishon@kernel.org,
 phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, xinlei.lee@mediatek.com,
 houlong.wei@mediatek.com, chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the BMA255 Accelerometer on I2C3 and its pin definitions.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt6795-sony-xperia-m5.dts   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index 155a573eac4c..0b0519f6b2f1 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -68,6 +68,13 @@ &i2c1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c1_pins>;
 	status = "okay";
+
+	accelerometer@10 {
+		compatible = "bosch,bma255";
+		reg = <0x10>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&accel_pins>;
+	};
 };
 
 &i2c2 {
@@ -247,6 +254,14 @@ pins-irq {
 		};
 	};
 
+	accel_pins: accelerometer-pins {
+		pins-irq {
+			pinmux = <PINMUX_GPIO12__FUNC_GPIO12>;
+			bias-pull-up;
+			input-enable;
+		};
+	};
+
 	i2c0_pins: i2c0-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO45__FUNC_SDA0>,
-- 
2.40.0

