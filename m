Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA7A12E843
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 16:47:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41BD897F6;
	Thu,  2 Jan 2020 15:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F54897F6
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 15:47:06 +0000 (UTC)
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 35EAD2084D;
 Thu,  2 Jan 2020 15:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577980026;
 bh=T8OrAG+EbDBgprNjNPQUw5artBgkO7vYeVQWzwTXJoY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mHJuZfunqyFIUSm59iEc056NpuILkoQ6oFP5/CcZbxEABe9Tdw4bbJCYvITmXyHsw
 bJX8BeH0sfhUJJwGDpFLnr+tY+l5ystDQV6TB3pT2zp9BLkgh8POz+fsfDNMEfa4QM
 uSBNPxcMQXEIcuBWHU0bY5f7VafWFZrL+q5RUiaA=
Date: Thu, 2 Jan 2020 16:47:03 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v3 2/9] drm/sun4i: tcon: Add TCON LCD support for R40
Message-ID: <20200102154703.3prgwcjyo36g5g5u@gilmour.lan>
References: <20191231130528.20669-1-jagan@amarulasolutions.com>
 <20191231130528.20669-3-jagan@amarulasolutions.com>
 <20200102105424.kmte7aooh2gkrcnu@gilmour.lan>
 <CAMty3ZA0e8eJZWvAh0x=KGAZVL3apdao3COvR6j3-ckv0cdvcg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMty3ZA0e8eJZWvAh0x=KGAZVL3apdao3COvR6j3-ckv0cdvcg@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============0952474888=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0952474888==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p6isxbjx5q73zube"
Content-Disposition: inline


--p6isxbjx5q73zube
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 02, 2020 at 09:10:31PM +0530, Jagan Teki wrote:
> On Thu, Jan 2, 2020 at 4:24 PM Maxime Ripard <mripard@kernel.org> wrote:
> >
> > On Tue, Dec 31, 2019 at 06:35:21PM +0530, Jagan Teki wrote:
> > > TCON LCD0, LCD1 in allwinner R40, are used for managing
> > > LCD interfaces like RGB, LVDS and DSI.
> > >
> > > Like TCON TV0, TV1 these LCD0, LCD1 are also managed via
> > > tcon top.
> > >
> > > Add support for it, in tcon driver.
> > >
> > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > ---
> > > Changes for v3:
> > > - none
> > >
> > >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > index fad72799b8df..69611d38c844 100644
> > > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > @@ -1470,6 +1470,13 @@ static const struct sun4i_tcon_quirks sun8i_a83t_tv_quirks = {
> > >       .has_channel_1          = true,
> > >  };
> > >
> > > +static const struct sun4i_tcon_quirks sun8i_r40_lcd_quirks = {
> > > +     .supports_lvds          = true,
> > > +     .has_channel_0          = true,
> > > +     /* TODO Need to support TCON output muxing via GPIO pins */
> > > +     .set_mux                = sun8i_r40_tcon_tv_set_mux,
> >
> > What is this muking about? And why is it a TODO?
>
> Muxing similar like how TCON TOP handle TV0, TV1 I have reused the
> same so-that it would configure de port selection via
> sun8i_tcon_top_de_config
>
> TCON output muxing have gpio with GPIOD and GPIOH bits, which select
> which of LCD or TV TCON outputs to the LCD function pins. I have
> marked these has TODO for further support as mentioned by Chen-Yu in
> v1[1].

It should be in the commit log.

What's the plan to support that when needed? And that means that the
LCD and TV outputs are mutually exclusive? We should at the very least
check that both aren't enabled at the same time.

Maxime

--p6isxbjx5q73zube
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXg4QdwAKCRDj7w1vZxhR
xV8pAQDW62BjjYRqQWaS/MCrLYV0sOBGYFlSj2Kk1hrJLyStbAEAugmjPCknAQNc
AuBKfBeWbLwThyU6B5QE39I7erhWOwQ=
=omNK
-----END PGP SIGNATURE-----

--p6isxbjx5q73zube--

--===============0952474888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0952474888==--
