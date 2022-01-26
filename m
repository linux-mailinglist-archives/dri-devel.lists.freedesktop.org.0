Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3A649C105
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 03:05:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9FD10E4F8;
	Wed, 26 Jan 2022 02:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D9810E4F8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 02:05:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3AE1FB81074;
 Wed, 26 Jan 2022 02:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B36EC340E0;
 Wed, 26 Jan 2022 02:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643162717;
 bh=28X471NiDJaECdr5wTzYsnFBYJKVo+PiuhvmsJECRWQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jypO54+IpKyCMCwWDyO3PZtrlhlMf+fIq7E+DmjTNUhIRX1FitcUtgX/HWd75sgr1
 grPzUkdPOx6w8qmwG63cEAm/8RKcarNs1DXGLXvDdsm4H/TVNy+3fEoq+Ht4K0h1fz
 G9p5qTERrohatUmENe4IwnHELGWBERAAuLD5N1daJMAmeulJQ+qS9ztzAkUUTQeMF3
 0xr1p4oB5eCO+0/WSXPlG+9ZsyOb+NJh74kPNQ3E8guJ6jd1jq7C4f0iB51JRH+hfW
 5S7KeL1BVwDJP3soU6+CT6gxEVwShKu5hHuVtX0+TRzGuOrTWkrZdxyr5LkorgGNbW
 9kv6vfHYZE+0w==
Date: Wed, 26 Jan 2022 10:05:08 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v1 4/4] ARM: dts: imx6dl: plym2m, prtvt7, victgo:  make
 use of new resistive-adc-touch driver
Message-ID: <20220126020507.GA4686@dragon>
References: <20211122124310.2796505-1-o.rempel@pengutronix.de>
 <20211122124310.2796505-4-o.rempel@pengutronix.de>
 <20211206010627.GK4216@dragon>
 <20220105110434.GG303@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220105110434.GG303@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robin van der Gracht <robin@protonic.nl>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, David Jander <david@protonic.nl>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 05, 2022 at 12:04:34PM +0100, Oleksij Rempel wrote:
> Hi Shawn,
> 
> sorry for the delay, I just came back to work.
> 
> On Mon, Dec 06, 2021 at 09:06:28AM +0800, Shawn Guo wrote:
> > On Mon, Nov 22, 2021 at 01:43:10PM +0100, Oleksij Rempel wrote:
> > > The tsc2046 is an ADC used as touchscreen controller. To share as mach
> > > code as possible, we should use it as actual ADC + virtual tochscreen
> > > controller.
> > > With this patch we make use of the new kernel IIO and HID infrastructure.
> > > 
> > > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > 
> > One space is enough in subject "victgo:  make".
> 
> done.
> 
> > > ---
> > >  arch/arm/boot/dts/imx6dl-plym2m.dts | 55 ++++++++++++++++++++---------
> > >  arch/arm/boot/dts/imx6dl-prtvt7.dts | 53 ++++++++++++++++++++-------
> > >  arch/arm/boot/dts/imx6dl-victgo.dts | 55 +++++++++++++++++++++--------
> > >  3 files changed, 120 insertions(+), 43 deletions(-)
> > > 
> > > diff --git a/arch/arm/boot/dts/imx6dl-plym2m.dts b/arch/arm/boot/dts/imx6dl-plym2m.dts
> > > index 60fe5f14666e..e2afedae85cb 100644
> > > --- a/arch/arm/boot/dts/imx6dl-plym2m.dts
> > > +++ b/arch/arm/boot/dts/imx6dl-plym2m.dts
> > > @@ -101,6 +101,17 @@ reg_12v0: regulator-12v0 {
> > >  		regulator-min-microvolt = <12000000>;
> > >  		regulator-max-microvolt = <12000000>;
> > >  	};
> > > +
> > > +	touchscreen {
> > > +		compatible = "resistive-adc-touch";
> > > +		io-channels = <&adc 1>, <&adc 3>, <&adc 4>, <&adc 5>;
> > > +		io-channel-names = "y", "z1", "z2", "x";
> > > +		touchscreen-min-pressure = <64687>;
> > > +		touchscreen-inverted-x;
> > > +		touchscreen-inverted-y;
> > > +		touchscreen-x-plate-ohms = <300>;
> > > +		touchscreen-y-plate-ohms = <800>;
> > > +	};
> > >  };
> > >  
> > >  &can1 {
> > > @@ -129,26 +140,38 @@ &ecspi2 {
> > >  	pinctrl-0 = <&pinctrl_ecspi2>;
> > >  	status = "okay";
> > >  
> > > -	touchscreen@0 {
> > > -		compatible = "ti,tsc2046";
> > > +	adc: adc@0 {
> > 
> > Isn't label name "adc" too generic?
> 
> I do not have strong opinion about this. Currently we have no
> restrictions for the node names:
> Documentation/devicetree/bindings/iio/adc/ti,tsc2046.yaml
> Documentation/devicetree/bindings/iio/adc/adc.yaml
> 
> I can name it touchscreen-adc@0 or something like this. What are your
> preferences?

I wasn't talking about node name but label.

Shawn
