Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EEA95F9C3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 21:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93EFC10E183;
	Mon, 26 Aug 2024 19:38:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="ca0roMD4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542D210E183
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 19:38:40 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724701104; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Y8CvhF/MJMpIU8xUcXwDaR/0I/ZSweEEmXPq80aazFOnaFJYtKwl4bAoircq8YmuV6hXbjY/LG7ggwynibvQhGHfnA3ZxeJcjwFUFCvznyYbFk7aW61rIiOqUerkxcHHMLSrs42ET9t8PNTNaKsv5xPHKyWqwnZ6a6qTKIkYIe0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724701104;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=o/g/+7cY7f/H3JMgXb+3Ce2wa+YsyQzpWO4kehk64OE=; 
 b=MUqYc1cFentcZXmMJg9AdlCdo8ojnSpq+vXAcb2Dy54wHiwWIOuJtTW6vVH4gpcV7uwcxMqELFKzkobFHCCb5EQOSXAiE16kMmMVa2SpQ7ZwzZfhgDdL75k4Q6T+BeMWw6EJYM/LEBPkdYRHZYc9FRT7i9Z7tpBAymCig84p9kg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
 dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724701104; 
 s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=o/g/+7cY7f/H3JMgXb+3Ce2wa+YsyQzpWO4kehk64OE=;
 b=ca0roMD4CCh2C6YxOlrU6DoQDhY/6r1S4aQEcvOV4tFUBCMSGleXec7uvWP4kkRv
 3tCHEJS1EM6ENk3vDrDuiM8rdiwTt9v6/9xC9v7IICGYmXiIINAfTSOzJBk3Dql+Dvd
 Cuvg2in63RexEjBhe2pp9MOB8TUQpI9kWJ45Y4VQ=
Received: by mx.zohomail.com with SMTPS id 1724701102774210.66353128633466;
 Mon, 26 Aug 2024 12:38:22 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
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
Date: Mon, 26 Aug 2024 15:38:18 -0400
Message-ID: <2622447.Lt9SDvczpP@bootstrap>
In-Reply-To: <20240825142509.201943-1-amadeus@jmu.edu.cn>
References: <4367745.ejJDZkT8p0@trenzalore>
 <20240825142509.201943-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
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

Hi Chukun,

On Sunday, 25 August 2024 10:25:09 EDT Chukun Pan wrote:
> Hi,
> 
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > ...
> > +	leds: leds {
> > +		compatible = "gpio-leds";
> 
> Maybe there should be a blank line.
> 
> > +		work_led: work-led {
> > +			gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger = "heartbeat";
> > +		};
> > +	};
> 
> Is the color missing?

Actually, after rechecking, this is wrong. There are 2 LEDs on &gpio4:
 - PB2: Green
 - PB1: Red

I can set the green one as heartbeat and the red one as default-on.

> > ...
> > +	vcc_3v3_rtc_s5: regulator-vcc-3v3-rtc-s5 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "vcc_3v3_rtc_s5";
> > +		regulator-boot-on;
> > +		regulator-always-on;
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		vin-supply = <&vcc_5v0_sys>;
> > +	};
> 
> Missing blank line.
> 
> > +	vcc_1v8_s0: regulator-vcc-1v8-s0 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "vcc_1v8_s0";
> > +		regulator-boot-on;
> > +		regulator-always-on;
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <1800000>;
> > +		vin-supply = <&vcc_1v8_s3>;
> > +	};
> > ...
> > +&gmac0 {
> > +	phy-mode = "rgmii-rxid";
> 
> Can we use "rgmii-id" and remove tx_delay here?

Indeed, that's better.

> > ...
> > +&sdmmc {
> > +	bus-width = <4>;
> > +	cap-mmc-highspeed;
> > +	cap-sd-highspeed;
> > +	disable-wp;
> > +	max-frequency = <200000000>;
> > +	no-sdio;
> > +	no-mmc;
> > +	non-removable;
> > +	sd-uhs-sdr104;
> > +        vmmc-supply = <&vcc_3v3_s3>;
> 
> Indentation error.
> 
> > +	vqmmc-supply = <&vccio_sd_s0>;
> > +	status = "okay";
> > +};
> > ...
> 
> Thanks,
> Chukun




