Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5969FB103F6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 10:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 745BE10E8F3;
	Thu, 24 Jul 2025 08:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lUB6PfHl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BDD10E8E2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 08:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1753346444;
 bh=gK1J/nmFCA5iQ9wSL8DiDVmGg7vxkIBM8ZUzDwIVnuc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lUB6PfHldk1/DqKfzI6izO+niovtYwIkMrvgcmL1OQwo6Tm09al+7ptOWNzR79Av8
 Jnelok5aFfAfnGxE3nJMexloNhycRwsPCeXNcVLo0/lNKs1R3R9vvbrVkZK8lCaurF
 ATEs2O4H3KD8kaFftSzEVKYvXIix3mnqQL0Y+3MI1qpgR6F1LogcB5uuLpCYo/PYlL
 4vMZ8i8aJqQVCwEnXAauhI/H7XWBdnVsRk/iCMzfQEeqUgXFJsIzaqvHKvdD4LDrlO
 GxRvOwR2QK7oBibfE2eUAJ1IoZ+fBv5qGBCvU+PcmPiTTpTav8IG67ZMKtM/nr1OAr
 FRHFFDMLhwi3Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 723B117E11FE;
 Thu, 24 Jul 2025 10:40:42 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org,
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com,
 mchehab@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, chunfeng.yun@mediatek.com,
 vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org,
 linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 andersson@kernel.org, mathieu.poirier@linaro.org,
 daniel.lezcano@linaro.org, tglx@linutronix.de, atenart@kernel.org,
 jitao.shi@mediatek.com, ck.hu@mediatek.com, houlong.wei@mediatek.com,
 kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com,
 tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com,
 shane.chien@mediatek.com, olivia.wen@mediatek.com, granquet@baylibre.com,
 eugen.hristev@linaro.org, arnd@arndb.de, sam.shih@mediatek.com,
 jieyy.yang@mediatek.com, frank-w@public-files.de, mwalle@kernel.org,
 fparent@baylibre.com, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: [PATCH 30/38] arm64: dts: mediatek: pumpkin-common: Fix pinctrl node
 names
Date: Thu, 24 Jul 2025 10:39:06 +0200
Message-ID: <20250724083914.61351-31-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the pinctrl node names to adhere to the bindings, as the main
pin node is supposed to be named like "uart0-pins" and the pinmux
node named like "pins-bus".

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/pumpkin-common.dtsi      | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index a356db5fcc5f..805fb82138a8 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -198,8 +198,8 @@ &usb_phy {
 };
 
 &pio {
-	gpio_keys_default: gpiodefault {
-		pins_cmd_dat {
+	gpio_keys_default: gpio-keys-pins {
+		pins-cmd-dat {
 			pinmux = <MT8516_PIN_42_KPCOL0__FUNC_GPIO42>,
 				 <MT8516_PIN_43_KPCOL1__FUNC_GPIO43>;
 			bias-pull-up;
@@ -207,7 +207,7 @@ pins_cmd_dat {
 		};
 	};
 
-	i2c0_pins_a: i2c0 {
+	i2c0_pins_a: i2c0-pins {
 		pins1 {
 			pinmux = <MT8516_PIN_58_SDA0__FUNC_SDA0_0>,
 				 <MT8516_PIN_59_SCL0__FUNC_SCL0_0>;
@@ -215,7 +215,7 @@ pins1 {
 		};
 	};
 
-	i2c2_pins_a: i2c2 {
+	i2c2_pins_a: i2c2-pins {
 		pins1 {
 			pinmux = <MT8516_PIN_60_SDA2__FUNC_SDA2_0>,
 				 <MT8516_PIN_61_SCL2__FUNC_SCL2_0>;
@@ -223,21 +223,21 @@ pins1 {
 		};
 	};
 
-	tca6416_pins: pinmux_tca6416_pins {
-		gpio_mux_rst_n_pin {
+	tca6416_pins: tca6416-pins {
+		pins-mux-rstn {
 			pinmux = <MT8516_PIN_65_UTXD1__FUNC_GPIO65>;
 			output-high;
 		};
 
-		gpio_mux_int_n_pin {
+		pins-mux-intn {
 			pinmux = <MT8516_PIN_64_URXD1__FUNC_GPIO64>;
 			input-enable;
 			bias-pull-up;
 		};
 	};
 
-	ethernet_pins_default: ethernet {
-		pins_ethernet {
+	ethernet_pins_default: ethernet-pins {
+		pins-eth {
 			pinmux = <MT8516_PIN_0_EINT0__FUNC_EXT_TXD0>,
 				 <MT8516_PIN_1_EINT1__FUNC_EXT_TXD1>,
 				 <MT8516_PIN_5_EINT5__FUNC_EXT_RXER>,
-- 
2.50.1

