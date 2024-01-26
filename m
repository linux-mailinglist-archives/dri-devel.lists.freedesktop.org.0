Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7116183E363
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 21:31:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADD810FE5D;
	Fri, 26 Jan 2024 20:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mecka.net (mecka.net [159.69.159.214])
 by gabe.freedesktop.org (Postfix) with ESMTP id 93D1F10FE5B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 20:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mecka.net; s=2016.11;
 t=1706301020; bh=bS0tHXldnDP7fP1hTCX/Dobr7gSKMxZIXrqw5AcghSc=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=cC5EMOIy3hGOaPaCp40VoGhD5wRmepADo9Sbans8FHbyxXIaD3Q5dVXYhZfj9eJl/
 AIoAKjkp9uMqM78/RAeaUZsBJVFREknowDoPzrSCT7/1UB/WmIsOD/QXgxt8cWmWw2
 Eji+gCm8xZ9MGRSItCu24/ELJUT1shgjLwMGC257hAEA88z2h/NK+DwykNNaPhw+YB
 f/U5TY4llR8Q0kNJoTVmZ2x8aFzQJ6McVmc8R+BRyy3ppEKx4ESSQ1GZyg0zoTwh9l
 ZOkeJ8i02kjKcxbBUs/WZMFjA1wADIp/3dmurR5t37ZzVmzeM9aa5ggKUsvSY6Sesf
 fJnapb/MbfYGw==
Received: from mecka.net (unknown [185.147.11.134])
 by mecka.net (Postfix) with ESMTPSA id B135B3B4E7E;
 Fri, 26 Jan 2024 21:30:19 +0100 (CET)
Date: Fri, 26 Jan 2024 21:30:18 +0100
From: Manuel Traut <manut@mecka.net>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Mark Yao <markyao0591@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Segfault <awarnecke002@hotmail.com>,
 Arnaud Ferraris <aferraris@debian.org>,
 Danct12 <danct12@riseup.net>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 4/4] arm64: dts: rockchip: Add devicetree for Pine64
 PineTab2
Message-ID: <ZbQWWp3nmorbEVFl@mecka.net>
References: <20240102-pinetab2-v3-0-cb1aa69f8c30@mecka.net>
 <20240102-pinetab2-v3-4-cb1aa69f8c30@mecka.net>
 <vj3elmkt6czisvwqouv2hhvut2va5jw6bbj5kjyxawvrnrdfwm@tlpo3dp3qcyb>
 <ZZgqF5hLO8UThPep@mecka.net>
 <elumjkchw5m6rcb73l4ouemjgk7nsgkeu576ybbkc5nbvcpiyi@txkepy7wqops>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <elumjkchw5m6rcb73l4ouemjgk7nsgkeu576ybbkc5nbvcpiyi@txkepy7wqops>
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

Hello Ondřej,

On Fri, Jan 05, 2024 at 05:48:46PM +0100, Ondřej Jirman wrote:
> On Fri, Jan 05, 2024 at 05:11:03PM +0100, Manuel Traut wrote:
> > On Wed, Jan 03, 2024 at 10:42:54AM +0100, Ondřej Jirman wrote:
> > > Hello Manuel,
> > > 
> > > a few more things I noticed:
> > > 
> > > On Tue, Jan 02, 2024 at 05:15:47PM +0100, Manuel Traut wrote:
> > > > From: Alexander Warnecke <awarnecke002@hotmail.com>
> > > > 
> > > > +	leds {
> > > > +		compatible = "gpio-leds";
> > > > +
> > > > +		pinctrl-names = "default";
> > > > +		pinctrl-0 = <&flash_led_en_h>;
> > > > +
> > > > +		led-0 {
> > > > +			gpios = <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
> > > > +			color = <LED_COLOR_ID_WHITE>;
> > > > +			function = LED_FUNCTION_FLASH;
> > > > +		};
> > > 
> > > This LED is supplied by VCC5V_MIDU, so maybe this should be a regulator-led
> > > supplied by gpio (FLASH_LED_EN_H) controlled regulator-fixed named f_led which
> > > is in turn supplied by VCC5V_MIDU.
> > > 
> > > https://megous.com/dl/tmp/9bf0d85d78946b5e.png
> > 
> > regulator-leds are controlled by turning on or off the regulator. However
> > VCC5V_MIDU is also used by other devices (USB, HDMI, ..) so I guess this is
> > not what we want. I would keep it as is.
> 
> It's used by the LED. gpio-leds will not ensure it's on when you enable the LED.
> 
> In practice this may only come up if someone tries to save power by unloading
> dwc3 USB driver, when using PT2 outside of the keyboard case. Otherwise
> VCC5V_MIDU will be enabled by DWC3 driver's use of PHY API.
> 
> In any case, I'm not saying you should use VCC5V_MIDU directly in regulator-led,
> but as a vin-supply to a new regulator-fixed node (which would be describing
> this "fixed voltage regulator" https://megous.com/dl/tmp/cc65ec81ab9af163.png ).

Sorry for the late response, I was busy with other things in the last weeks.

I changed it to be a regulator led and will post a v4 soon.
