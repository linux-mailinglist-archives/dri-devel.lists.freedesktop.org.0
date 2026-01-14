Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4ADD20357
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 17:29:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CD510E65F;
	Wed, 14 Jan 2026 16:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oK8kMI3f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5604F10E659
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 16:29:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0F19D438E3;
 Wed, 14 Jan 2026 16:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF3DEC19422;
 Wed, 14 Jan 2026 16:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768408190;
 bh=I8+1WljunbvUFxqo0uuMi1ljN83aDJ7digha0oFhW3g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oK8kMI3fsbLCJ/RO7O6RmMGSUrb/KnoHVeDxCL6SU1hSw0dCGz5jpy8TeYhMWijFy
 4Y6l18gHBFG01liU5Xd+7/x+lZ3tnTslJAn6x+tKCdm6wwrlDsh3Js9D11r9dUQUQ1
 P1rmPWzPGFverhc/RQcT1t9ZTITamH1PIldcqXQfo2/+dubDFbFW3yKSCHjWgQnyns
 WjDrp/vHQi6HX0si/ACs6w/Qkc68jUC2mryk4JkZYnH1hpGw4hotvd3LrKaBHD1aBV
 nwKWnjBSc/zXqvv7fcVjp0htConpPi10Cu6PnhI2/UT0myjPLMDmSr89eYSeRe5wPz
 3m9l/mvN//0oA==
Date: Wed, 14 Jan 2026 16:29:44 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Daniel Thompson <daniel@riscstar.com>, Lee Jones <lee@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/4] backlight: add max25014atg backlight
Message-ID: <aWfEd0hldSrwrh9-@aspen.lan>
References: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
 <20251201-max25014-v6-2-88e3ac8112ff@gocontroll.com>
 <aTG0EK_zuSB-U_bb@aspen.lan>
 <8a9a59b8-d5c0-46b3-8f86-a4cd910b7af3@gocontroll.com>
 <aTaqCxsGj_waN92Y@aspen.lan>
 <fc5aad54-08fe-453e-a3cf-621414c8a060@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc5aad54-08fe-453e-a3cf-621414c8a060@gocontroll.com>
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

On Fri, Jan 09, 2026 at 09:55:18AM +0100, Maud Spierings wrote:
> Do you have any comments about:
>
> > +static void max25014_remove(struct i2c_client *cl)
> > +{
> > +	struct max25014 *maxim = i2c_get_clientdata(cl);
> > +
> > +	maxim->bl->props.brightness = 0;
> > +	max25014_update_status(maxim->bl);
> > +	gpiod_set_value_cansleep(maxim->enable, 0);
> > +	regulator_disable(maxim->vin);
> > +}
>
> I'm feeling like the setting of the brightness + update status maybe should
> be a call to backlight_device_set_brightness() or maybe it shouldn't really
> be there at all?

Using backlight_device_set_brightness() makes sense (although there is
still a window where userspace could come back in and turn the backlight
on again). And, if both the GPIO and regulator were optional then it is
sensible to set the brightness to zero before removing the driver.


Daniel.
