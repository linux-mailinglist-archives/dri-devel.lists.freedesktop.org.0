Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E325001AF
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 00:20:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F315110F155;
	Wed, 13 Apr 2022 22:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5403710F155
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 22:19:54 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id A2E4E5C034D;
 Wed, 13 Apr 2022 18:19:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 13 Apr 2022 18:19:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1649888393; x=
 1649974793; bh=hsDsSOvCiPnQ5iI1qwr559UylC5AhqoZAQgmwuaC8k8=; b=k
 Xb3zpUzSFboY38A9QsINY8zApMK7WgMQOw4Ng9USwQlBfyE0MVR1tylfrDy1I+qT
 g6Ae3V2zcIx2tvVyWavFpOefn02gLujLxskrpAgB2ouD6bVYY/TyCEtU75OJgzuQ
 CtDJ1zFxURn+0MoLRdIN9C5oEb8rS2PPEtEpqdLe9pzkjMDfbS3gbsHqCpwyVtr3
 wkSz6DEc0SZGuSDZdhgr84lkYnQBSwUn0BiU2neopyrN2eKfYhL7P8/EGsNz5vgo
 g3LS5Q5MwFtxZK393zFQkVhuycwBfDKjq6aUHmXoKC26Z9uZCOxMyUUcQG0H4Pir
 6UwhlIZrILTqi9yBgtJzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1649888393; x=1649974793; bh=hsDsSOvCiPnQ5
 iI1qwr559UylC5AhqoZAQgmwuaC8k8=; b=n79GBWEz27CFo3CUyVTIM2mlJvVB4
 GWqkXbvRylHmhP1oBQmf9fho/teYBHdDOG4ciwUJa76OD4mn4/2Vhv88prKdzsW0
 zJZZJ90LMSOxjMeMr3hYVNwNmiyuzpPExJw5afj7suKgWw1VCOJyy/makbfugb+K
 At/hXMNATMZE+gAq/ptOXpa5IUQeFYzeaphTCFZw6othu5L1LkG/H4rnOPr816Lq
 +BWxhlisnGN2dshkh4kdJYtxilmZRcY4DX37I3Jn2eIzIVZ1xcauxjM8hy8VMMca
 mSptsN/8SF34KnI+sG6ZJsOzf3i1xJmQ9kB6W3R0ecCzGd4JlhpKzLmhg==
X-ME-Sender: <xms:iUxXYgSbu83lW-FusmWhDNn1xp4p3JJL4SMK3lYZlvQC7VtBNTKfQQ>
 <xme:iUxXYty0zM1tfOCIY0Dx0V9K30inxIO9vvPdHjWC3XXK90PkznD-4cFmFBMq0Tqg7
 gmdymYHbIedqknF3g>
X-ME-Received: <xmr:iUxXYt0B1wQVfsntMAb2AoiKqdRfoDQTv16_LRggZCoMxh6uA63f8KtSakvfFewAM1o5ZjZ89td24YB5jowZTKUaIjNK8yHpJzhn2smqRiNOAvW5Va9qRFte94GjPmKjbA0jew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudelvddguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepfedvffetgeduiedtfffgleelvdfhheekkeduffetuddvgeeffedu
 fefhgeehueejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:iUxXYkDF191GxSw6_CviUvn75FZDJqFmn1I70ugGY9FnrvQx_qJbvg>
 <xmx:iUxXYphAWuNOnJL-oPswsx6CO0P-zhyCyG1WGz_lE-8DtOWJdz7Dzw>
 <xmx:iUxXYgqtfMBa34tVIA184caUhC4WeVe81paCYPoFaQ8rfllnQT8aEA>
 <xmx:iUxXYtRCub4d5reKlxmAsasjqljRGRzUuc1UmKA3p15Lc-E7Q376bg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Apr 2022 18:19:52 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 16/16] [DO NOT MERGE] arm64: dts: rockchip: pinenote:
 Enable EBC display pipeline
Date: Wed, 13 Apr 2022 17:19:16 -0500
Message-Id: <20220413221916.50995-17-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220413221916.50995-1-samuel@sholland.org>
References: <20220413221916.50995-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ond=C5=99ej=20Jirman?= <x@xff.cz>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Samuel Holland <samuel@sholland.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Andreas Kemnade <andreas@kemnade.info>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Liang Chen <cl@rock-chips.com>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peter Geis <pgwipeout@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The PineNote contains an eInk ED103TC2 panel connected to the EBC,
powered by a TI TPS651851 PMIC.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 .../boot/dts/rockchip/rk3566-pinenote.dtsi    | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
index fea748adfa90..4a53931c3f92 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
@@ -72,6 +72,16 @@ led-0 {
 		};
 	};
 
+	panel {
+		compatible = "eink,ed103tc2";
+
+		port {
+			panel_in_ebc: endpoint {
+				remote-endpoint = <&ebc_out_panel>;
+			};
+		};
+	};
+
 	sdio_pwrseq: sdio-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		clocks = <&rk817 1>;
@@ -213,6 +223,20 @@ &cpu3 {
 	cpu-supply = <&vdd_cpu>;
 };
 
+&ebc {
+	io-channels = <&ebc_pmic 0>;
+	panel-supply = <&v3p3>;
+	vcom-supply = <&vcom>;
+	vdrive-supply = <&vdrive>;
+	status = "okay";
+
+	port {
+		ebc_out_panel: endpoint {
+			remote-endpoint = <&panel_in_ebc>;
+		};
+	};
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -466,6 +490,47 @@ led@1 {
 			default-brightness = <0>;
 		};
 	};
+
+	/* TODO: write binding */
+	ebc_pmic: pmic@68 {
+		compatible = "ti,tps65185";
+		reg = <0x68>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <RK_PA6 IRQ_TYPE_LEVEL_LOW>;
+		#io-channel-cells = <1>;
+		pinctrl-0 = <&ebc_pmic_pins>;
+		pinctrl-names = "default";
+		powerup-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
+		pwr_good-gpios = <&gpio3 RK_PA7 GPIO_ACTIVE_HIGH>;
+		vcom_ctrl-gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vcc_bat>;
+		vin3p3-supply = <&vcc_3v3>;
+		wakeup-gpios = <&gpio3 RK_PA5 GPIO_ACTIVE_HIGH>;
+		ti,up-sequence = <1>, <0>, <2>, <3>;
+		ti,up-delay-ms = <3>, <3>, <3>, <3>;
+		ti,down-sequence = <2>, <3>, <1>, <0>;
+		ti,down-delay-ms = <3>, <6>, <6>, <6>;
+
+		regulators {
+			v3p3: v3p3 {
+				regulator-name = "v3p3";
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			vcom: vcom {
+				regulator-name = "vcom";
+				/* voltage range is board-specific */
+			};
+
+			vdrive: vdrive {
+				regulator-name = "vdrive";
+				regulator-min-microvolt = <15000000>;
+				regulator-max-microvolt = <15000000>;
+			};
+		};
+	};
 };
 
 &i2s1_8ch {
@@ -508,6 +573,21 @@ bt_wake_h: bt-wake-h {
 		};
 	};
 
+	ebc-pmic {
+		ebc_pmic_pins: ebc-pmic-pins {
+			rockchip,pins = /* wakeup */
+					<3 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>,
+					/* int */
+					<3 RK_PA6 RK_FUNC_GPIO &pcfg_pull_up>,
+					/* pwr_good */
+					<3 RK_PA7 RK_FUNC_GPIO &pcfg_pull_none>,
+					/* pwrup */
+					<3 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>,
+					/* vcom_ctrl */
+					<4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	led {
 		led_pin: led-pin {
 			rockchip,pins = <3 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
-- 
2.35.1

