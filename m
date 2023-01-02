Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A47F65B025
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 11:57:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F22D10E302;
	Mon,  2 Jan 2023 10:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF65710E302
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 10:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1672657066; bh=F4SkNUKtXmiMKcbm5JjpkGe1luxSiwhxxZE9A69pJoQ=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=t3Gf17cNfS97ha3LFp5M06o5kw9u6PX4x3stnGo1CUvJAdNqxmXcnyjcI3Wg19En1
 e0HZPRGHjG+pd5NWMDj7TuyAgXfpQpKvc+jNNZhox38nBMbbSOS5zCSwZMii5slNhQ
 JPV0KP8jgpKaGjz/aBAeO5OPqzeb0BKBDBRYtbnc=
Date: Mon, 2 Jan 2023 11:57:46 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: rk3399-pinephone-pro: Add internal
 display support
Message-ID: <20230102105746.5abnjzwf365c6hy2@core>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org,
 Kamil =?utf-8?Q?Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Martijn Braam <martijn@brixit.nl>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Mader <robert.mader@posteo.de>,
 Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Peter Robinson <pbrobinson@gmail.com>,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 dri-devel@lists.freedesktop.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>,
 Neal Gompa <ngompa13@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Caleb Connolly <kc@postmarketos.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20221230113155.3430142-1-javierm@redhat.com>
 <20221230113155.3430142-5-javierm@redhat.com>
 <20221230153745.tfs6n4zy4xfwugbw@core>
 <e21b5c12-0cc0-5ec0-b2c6-9dde633d5e10@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e21b5c12-0cc0-5ec0-b2c6-9dde633d5e10@redhat.com>
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Robert Mader <robert.mader@posteo.de>, devicetree@vger.kernel.org,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 Neal Gompa <ngompa13@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Martijn Braam <martijn@brixit.nl>, Caleb Connolly <kc@postmarketos.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Robinson <pbrobinson@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kamil =?utf-8?Q?Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 linux-rockchip@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Javier,

On Sat, Dec 31, 2022 at 04:29:49PM +0100, Javier Martinez Canillas wrote:
> Hello Ondřej,
> 
> Thanks a lot for your feedback.
> 
> On 12/30/22 16:37, Ondřej Jirman wrote:
> 
> [...]
> 
> >>  &i2c0 {
> >>  	clock-frequency = <400000>;
> >>  	i2c-scl-rising-time-ns = <168>;
> >> @@ -214,6 +251,9 @@ vcc3v0_touch: LDO_REG2 {
> >>  				regulator-name = "vcc3v0_touch";
> >>  				regulator-min-microvolt = <3000000>;
> >>  				regulator-max-microvolt = <3000000>;
> >> +				regulator-state-mem {
> >> +					regulator-off-in-suspend;
> >> +				};
> > 
> > You're instructing RK818 to shut down the regulator for touch controller during
> > suspend, but I think Goodix driver expects touch controller to be kept powered on
> > during suspend. Am I missing something?
> > 
> > https://elixir.bootlin.com/linux/latest/source/drivers/input/touchscreen/goodix.c#L1405
> >
> 
> You tell me, it is your patch :) I just cherry-picked this from your tree:

I have other patches to goodix driver that do power off the touch sensor chip
during sleep, so that it doesn't consume excessinve amounts of power when
the phone is suspended. Mainline doesn't. You have to adapt this to mainline,
because you're not upstreaming the required Goodix patches, for regulator-off-in-suspend
to not break things.

> https://github.com/megous/linux/commit/11f8da60d6a5
> 
> But if that is not correct, then I can drop the regulator-off-in-suspend.
>  
> [...]
> 
> >> +
> >> +	touchscreen@14 {
> >> +		compatible = "goodix,gt917s";
> > 
> > This is not the correct compatible. Pinephone Pro uses Goodix GT1158:
> > 
> > Goodix-TS 3-0014: ID 1158, version: 0100
> > Goodix-TS 3-0014: Direct firmware load for goodix_1158_cfg.bin failed with error -2
> > 
> >
> 
> Same thing. I wasn't aware of this since your patch was using this compatible
> string. If "goodix,gt1158" is the correct compatible string, then I agree we
> should have that instead even when the firmware is missing. Because the DT is
> supposed to describe the hardware. The FW issue can be tackled as a follow-up.
> 
> [...] 

Yes, compatible string is sort of irrelevant, because the driver does runtime
auto-detection based on chip ID. I didn't bother with superficial issues in the
original code from Martijn/Kamil. Now that you're mainlining the code, this
should be sorted out, though.

There's no FW issue, I was just using the log to show you the actual chip ID the
driver detects.

(You should probably put my SoB after Kamil/Martijn, since I took the
maintenance/development of the driver after they wrote the base support
initially in secret. I'm not the original author of the code.)

> >> +
> >> +&vopb {
> >> +	status = "okay";
> >> +	assigned-clocks = <&cru DCLK_VOP0_DIV>, <&cru DCLK_VOP0>,
> >> +			  <&cru ACLK_VOP0>, <&cru HCLK_VOP0>;
> >> +	assigned-clock-rates = <0>, <0>, <400000000>, <100000000>;
> >> +	assigned-clock-parents = <&cru PLL_CPLL>, <&cru DCLK_VOP0_FRAC>;
> >> +};
> > 
> > So here you're putting a fractional clock into path between CPLL -> VOP0_DIV
> > -> DCLK_VOP0_FRAC -> DCLK_VOP0.
> > 
> > Fractional clocks require 20x difference between input and output rates, and
> > CPLL is 800Mhz IIRC, while you require 74.25MHz DCLK, so this will not work
> > correctly.
> > 
> > Even if this somehow works by fractional clock being bypassed, I did not design
> > the panel mode to be used with CPLL's 800 MHz, but with GPLL frequecy of 594 MHz.
> > 
> > GPLL 594/74.25 = 8  (integral divider without the need for fractional clock)
> > CPLL 800/74.25 = ~10.77441077441077441077
> > 
> > If you really want to use fractional clock, you'd need to parent it to VPLL
> > and set VPLL really high, like close to 2GHz.
> >
> 
> Thanks for the explanation. Then I just need to squash on top of this, the
> following patch. Is that correct?
> 
> https://github.com/megous/linux/commit/f19ce7bb7d72

Yes, and test the driver more thoroughly:

- look at clk_summary to verify clock rate the kernel thinks it's using
- test refresh rate, somehow, to again verify the actual clock rate (kernel can
  lie in debugfs)
- test power cycling the panel (eg. via system suspend/resume or other means)

thank you and kind regards,
	o.

> -- 
> Best regards,
> 
> Javier Martinez Canillas
> Core Platforms
> Red Hat
> 
