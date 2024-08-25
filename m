Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA2995E47A
	for <lists+dri-devel@lfdr.de>; Sun, 25 Aug 2024 18:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D2010E069;
	Sun, 25 Aug 2024 16:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 734 seconds by postgrey-1.36 at gabe;
 Sun, 25 Aug 2024 14:37:38 UTC
Received: from mail-m104.netease.com (mail-m104.netease.com [154.81.10.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6EE410E02C
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2024 14:37:38 +0000 (UTC)
Received: from amadeus-Vostro-3710.lan (unknown [58.61.141.165])
 by smtp.qiye.163.com (Hmail) with ESMTPA id 9084A7E0183;
 Sun, 25 Aug 2024 22:25:12 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: detlev.casanova@collabora.com
Cc: airlied@gmail.com, alchark@gmail.com, amadeus@jmu.edu.cn,
 andi.shyti@kernel.org, andyshrk@163.com, broonie@kernel.org,
 cl@rock-chips.com, conor+dt@kernel.org, daniel@ffwll.ch,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dsimic@manjaro.org, efectn@protonmail.com, finley.xiao@rock-chips.com,
 gregkh@linuxfoundation.org, heiko@sntech.de, honyuenkwun@gmail.com,
 jagan@edgeble.ai, jamie@jamieiles.com, jic23@kernel.org,
 jirislaby@kernel.org, jonas@kwiboo.se, jszhang@kernel.org,
 kernel@collabora.com, krzk+dt@kernel.org, lars@metafoo.de, lee@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux@roeck-us.net,
 maarten.lankhorst@linux.intel.com, macromorgan@hotmail.com, megi@xff.cz,
 michael.riesch@wolfvision.net, mripard@kernel.org, robh@kernel.org,
 tim@feathertop.org, tzimmermann@suse.de, ulf.hansson@linaro.org,
 wim@linux-watchdog.org
Subject: Re: [PATCH v2 12/12] arm64: dts: rockchip: Add rk3576-armsom-sige5
 board
Date: Sun, 25 Aug 2024 22:25:09 +0800
Message-Id: <20240825142509.201943-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <4367745.ejJDZkT8p0@trenzalore>
References: <4367745.ejJDZkT8p0@trenzalore>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGE5NVk1LGUwaSkMYSEweGVYeHw5VEwETFhoSFy
 QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0pVSk1OWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NNVUpLS1VLWQ
 Y+
X-HM-Tid: 0a9189ed442703a2kunm9084a7e0183
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6M006Nio5SzI0GhkuCj5PLjo1
 QhVPCzNVSlVKTElPTkJOQkpPSUhOVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWU5D
 VU1KVUpPSlVKTU5ZV1kIAVlBT09MSjcG
X-Mailman-Approved-At: Sun, 25 Aug 2024 16:57:40 +0000
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

Hi,

> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> ...
> +	leds: leds {
> +		compatible = "gpio-leds";

Maybe there should be a blank line.

> +		work_led: work-led {
> +			gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};

Is the color missing?

> ...
> +	vcc_3v3_rtc_s5: regulator-vcc-3v3-rtc-s5 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_3v3_rtc_s5";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vcc_5v0_sys>;
> +	};

Missing blank line.

> +	vcc_1v8_s0: regulator-vcc-1v8-s0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_1v8_s0";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vcc_1v8_s3>;
> +	};
> ...
> +&gmac0 {
> +	phy-mode = "rgmii-rxid";

Can we use "rgmii-id" and remove tx_delay here?

> ...
> +&sdmmc {
> +	bus-width = <4>;
> +	cap-mmc-highspeed;
> +	cap-sd-highspeed;
> +	disable-wp;
> +	max-frequency = <200000000>;
> +	no-sdio;
> +	no-mmc;
> +	non-removable;
> +	sd-uhs-sdr104;
> +        vmmc-supply = <&vcc_3v3_s3>;

Indentation error.

> +	vqmmc-supply = <&vccio_sd_s0>;
> +	status = "okay";
> +};
> ...

Thanks,
Chukun

-- 
2.25.1

