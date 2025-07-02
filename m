Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3405AF13FC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 13:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0520E10E6F0;
	Wed,  2 Jul 2025 11:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mF+Mxsfn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B887D10E6F0
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 11:36:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8B4615C6C22;
 Wed,  2 Jul 2025 11:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E239DC4CEED;
 Wed,  2 Jul 2025 11:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751456216;
 bh=AR2YdjUQDruKw3xwEOLHDbUEwgTRlLLrLUuQcRkPcwk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mF+MxsfngCXb328CwhUUDfE58INzeO/02EHWhYdfq92zRhxhdu9m3eJy38g/Z2+my
 PEo2RicQ5A29nvdeyqkEhYXmYPboIIoBnvwoyjTo33CStZrq6JwcxbeXINWGNT7z3f
 V0h82qzbUvYiU0/w0GdHs6pl8GqKnD7kpM5FIhdB/O3UqCLfHOsR83L6FB+gFjKTY0
 VvjpbF/cL+u6rtx027/kfZy2nlIfRBljuP/L2/yJYG1Tzj1L1m4ah1WTAD5SV3yc9C
 atIKqU3Z259Hwdsi1bfTag54achQvlF3vPxb6tcJRRGnxMXaQac8Pe1qjRKwYG5wv2
 f6PbOLbcQg9gQ==
Date: Wed, 2 Jul 2025 13:36:53 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-gpio@vger.kernel.org, 
 Yong Deng <yong.deng@magewell.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.xyz>, 
 Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 5/5] drm/sun4i: Run the mixer clock at 297 MHz on V3s
Message-ID: <20250702-psychedelic-stalwart-jerboa-a626eb@houat>
References: <20250701201124.812882-1-paulk@sys-base.io>
 <20250701201124.812882-6-paulk@sys-base.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="v4szwvinjjahevo3"
Content-Disposition: inline
In-Reply-To: <20250701201124.812882-6-paulk@sys-base.io>
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


--v4szwvinjjahevo3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/5] drm/sun4i: Run the mixer clock at 297 MHz on V3s
MIME-Version: 1.0

On Tue, Jul 01, 2025 at 10:11:24PM +0200, Paul Kocialkowski wrote:
> The DE mixer clock is currently set to run at 150 MHz, while the
> Allwinner BSP configures it at 300 MHz and other platforms typically
> run at 297 MHz.
>=20
> 150 MHz appears to be enough given the restricted graphics capabilities
> of the SoC (with a work area of only 1024x1024). However it typically
> causes the DE clock to be parented to the periph0 pll instead of the
> video PLL.
>=20
> While this should generally not be a concern, it appears (based on
> experimentation) that both the DE and TCON clocks need to be parented
> to the same PLL for these units to work. While we cannot represent this
> constraint in the clock driver, it appears that the TCON clock will
> often get parented to the video pll (typically running at 297 MHz for
> the CSI units needs), for instance when driving displays with a 33 MHz
> pixel clock (33 being a natural divider of 297).
>=20
> Running the DE clock at 297 MHz will typically result in parenting to
> the video pll instead of the periph0 pll, thus making the display
> output functional.
>=20
> This is all a bit fragile but it solves the issue with displays running
> at 33 Mhz and brings V3s to use the same frequency as other platforms,
> making support more unified.

It's beyond fragile, and doesn't have anything to do with the DRM driver.

You should set up the clock tree properly in the clock driver, and then
add NO_REPARENT to the DE clock to make sure it stays that way.

And then, you can change the clock rate if you want to, but at least you
don't set a rate and hope that the side effects work your way, and won't
happen again.

Maxime

--v4szwvinjjahevo3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaGUZ0QAKCRAnX84Zoj2+
dkUOAX9QETvGjudIqLH1LHrODK1oz9R7fTZgMW27nwd0xCKcdeLTvQKST2uEzWle
vJapl8MBfAx2o6ST5tt4OTYqAlQbnHgSbySZjkHgRUqtZhP/pvQc99/anfjE9qN1
3VMToXuhRg==
=p0B2
-----END PGP SIGNATURE-----

--v4szwvinjjahevo3--
