Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6323082589C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 17:48:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC1C10E646;
	Fri,  5 Jan 2024 16:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7A010E646
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 16:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1704473327; bh=oo3jPHfQQbPi8LrBuaocSKYLMQM9huUgqwSe+AhwAGw=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=xao9KpgyLXysZVA2SJl1CSqyJpVmtX3oToZY/o8VzAujGyow+xSdbf7we5Oag7Kz3
 XqCmirM6wZT8YSmi2PxcGhQW1L5xIlCaCdq0UJznaGi+2WPXdfbK1YJVbveBfye3i/
 bgU9I8m3boxWeyjxhlO95oRZEc5KjA/FIv5hzQhI=
Date: Fri, 5 Jan 2024 17:48:46 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Manuel Traut <manut@mecka.net>
Subject: Re: [PATCH v3 4/4] arm64: dts: rockchip: Add devicetree for Pine64
 PineTab2
Message-ID: <elumjkchw5m6rcb73l4ouemjgk7nsgkeu576ybbkc5nbvcpiyi@txkepy7wqops>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
 Manuel Traut <manut@mecka.net>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>, 
 Mark Yao <markyao0591@gmail.com>, Diederik de Haas <didi.debian@cknow.org>, 
 Segfault <awarnecke002@hotmail.com>, Arnaud Ferraris <aferraris@debian.org>, 
 Danct12 <danct12@riseup.net>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20240102-pinetab2-v3-0-cb1aa69f8c30@mecka.net>
 <20240102-pinetab2-v3-4-cb1aa69f8c30@mecka.net>
 <vj3elmkt6czisvwqouv2hhvut2va5jw6bbj5kjyxawvrnrdfwm@tlpo3dp3qcyb>
 <ZZgqF5hLO8UThPep@mecka.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZZgqF5hLO8UThPep@mecka.net>
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
Cc: Diederik de Haas <didi.debian@cknow.org>, Danct12 <danct12@riseup.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-rockchip@lists.infradead.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Yao <markyao0591@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Segfault <awarnecke002@hotmail.com>, Sandy Huang <hjc@rock-chips.com>,
 Arnaud Ferraris <aferraris@debian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 05, 2024 at 05:11:03PM +0100, Manuel Traut wrote:
> On Wed, Jan 03, 2024 at 10:42:54AM +0100, Ondřej Jirman wrote:
> > Hello Manuel,
> > 
> > a few more things I noticed:
> > 
> > On Tue, Jan 02, 2024 at 05:15:47PM +0100, Manuel Traut wrote:
> > > From: Alexander Warnecke <awarnecke002@hotmail.com>
> > > 
> > > +	leds {
> > > +		compatible = "gpio-leds";
> > > +
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&flash_led_en_h>;
> > > +
> > > +		led-0 {
> > > +			gpios = <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
> > > +			color = <LED_COLOR_ID_WHITE>;
> > > +			function = LED_FUNCTION_FLASH;
> > > +		};
> > 
> > This LED is supplied by VCC5V_MIDU, so maybe this should be a regulator-led
> > supplied by gpio (FLASH_LED_EN_H) controlled regulator-fixed named f_led which
> > is in turn supplied by VCC5V_MIDU.
> > 
> > https://megous.com/dl/tmp/9bf0d85d78946b5e.png
> 
> regulator-leds are controlled by turning on or off the regulator. However
> VCC5V_MIDU is also used by other devices (USB, HDMI, ..) so I guess this is
> not what we want. I would keep it as is.

It's used by the LED. gpio-leds will not ensure it's on when you enable the LED.

In practice this may only come up if someone tries to save power by unloading
dwc3 USB driver, when using PT2 outside of the keyboard case. Otherwise
VCC5V_MIDU will be enabled by DWC3 driver's use of PHY API.

In any case, I'm not saying you should use VCC5V_MIDU directly in regulator-led,
but as a vin-supply to a new regulator-fixed node (which would be describing
this "fixed voltage regulator" https://megous.com/dl/tmp/cc65ec81ab9af163.png ).

> > > +	};
> > > +
> > > [...]
> > >
> > > +
> > > +	speaker_amp: speaker-amplifier {
> > > +		compatible = "simple-audio-amplifier";
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&spk_ctl>;
> > > +		enable-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_HIGH>;
> > > +		sound-name-prefix = "Speaker Amplifier";
> > > +		VCC-supply = <&vcc_bat>;
> > > +	};
> > > +
> > > +	vcc_3v3: vcc-3v3 {
> > > +		compatible = "regulator-fixed";
> > > +		regulator-name = "vcc_3v3";
> > > +		regulator-always-on;
> > > +		regulator-boot-on;
> > > +		regulator-min-microvolt = <3300000>;
> > > +		regulator-max-microvolt = <3300000>;
> > > +		vin-supply = <&vcc3v3_sys>;
> > > +	};
> > > +
> > > +	vcc3v3_minipcie: vcc3v3-minipcie {
> > > +		compatible = "regulator-fixed";
> > > +		enable-active-high;
> > > +		gpio = <&gpio4 RK_PC3 GPIO_ACTIVE_HIGH>;
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&pcie_pwren_h>;
> > > +		regulator-name = "vcc3v3_minipcie";
> > > +		regulator-min-microvolt = <3300000>;
> > > +		regulator-max-microvolt = <3300000>;
> > > +		vin-supply = <&vcc_sys>;
> > 
> > This regulator is supplied by vcc_bat: https://megous.com/dl/tmp/4ec71a4a2aea9498.png
> 
> correct, I will update this in v4.
> 
> > > +	};
> > > +
> > > +	vcc3v3_sd: vcc3v3-sd {
> > > +		compatible = "regulator-fixed";
> > > +		gpio = <&gpio0 RK_PA5 GPIO_ACTIVE_HIGH>;
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&sdmmc_pwren_l>;
> > > +		regulator-name = "vcc3v3_sd";
> > > +		regulator-min-microvolt = <3300000>;
> > > +		regulator-max-microvolt = <3300000>;
> > > +		vin-supply = <&vcc3v3_sys>;
> > > +	};
> > > +
> > > +	vcc5v0_usb_host0: vcc5v0-usb-host0 {
> > > +		compatible = "regulator-fixed";
> > > +		enable-active-high;
> > > +		gpio = <&gpio4 RK_PC4 GPIO_ACTIVE_HIGH>;
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&usb_host_pwren1_h>;
> > > +		regulator-name = "vcc5v0_usb_host0";
> > > +		regulator-min-microvolt = <5000000>;
> > > +		regulator-max-microvolt = <5000000>;
> > > +		vin-supply = <&vcc5v_midu>;
> > > +	};
> > > +
> > > +	vcc5v0_usb_host2: vcc5v0-usb-host2 {
> > > +		compatible = "regulator-fixed";
> > > +		enable-active-high;
> > > +		gpio = <&gpio4 RK_PC5 GPIO_ACTIVE_HIGH>;
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&usb_host_pwren2_h>;
> > > +		regulator-name = "vcc5v0_usb_host2";
> > > +		regulator-min-microvolt = <5000000>;
> > > +		regulator-max-microvolt = <5000000>;
> > > +		vin-supply = <&vcc5v_midu>;
> > > +	};
> > > +
> > > +	vcc_bat: vcc-bat {
> > > +		compatible = "regulator-fixed";
> > > +		regulator-name = "vcc_bat";
> > > +		regulator-always-on;
> > > +		regulator-boot-on;
> > > +	};
> > > +
> > > +	vcc_sys: vcc-sys {
> > > +		compatible = "regulator-fixed";
> > > +		regulator-name = "vcc_sys";
> > > +		regulator-always-on;
> > > +		regulator-boot-on;
> > > +		vin-supply = <&vcc_bat>;
> > > +	};
> > > +
> > > +	vdd1v2_dvp: vdd1v2-dvp {
> > > +		compatible = "regulator-fixed";
> > > +		regulator-name = "vdd1v2_dvp";
> > > +		regulator-min-microvolt = <1200000>;
> > > +		regulator-max-microvolt = <1200000>;
> > > +		vin-supply = <&vcc_3v3>;
> > > +		/*enable-supply = <&vcc2v8_dvp>;*/
> > > +	};
> > 
> > There's no vdd1v2_dvp in the schematic on the camera sensor connector, or elsewhere:
> >
> >   https://megous.com/dl/tmp/fd95f003d8f3fbfb.png
> 
> It is on page 5 in the power diagram on the right top.

That (Power diagram overview) is irrelevant part of the schematic. Can be and
often is wrong. You need to use actual detailed parts of the schematic, which
is what is actually used to route the PCB traces.

kind regards,
	o.

> > So I guess, you can drop this, entirely. Maybe it's VDD1V5_DVP but I don't think
> > it needs to be described in DT, since it's pretty local to this camera sensor,
> > and nothing else uses it.
> > 
> >   https://megous.com/dl/tmp/7fc384e196c5428f.png
> 
> dvdd-supply is a required property of the ov5648 camera, so I would tend to keep
> this. But us vcc_sys for vin-supply instead of vcc_3v3.
> 
> Regards
> Manuel
