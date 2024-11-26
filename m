Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA7C9D9369
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 09:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C44C010E404;
	Tue, 26 Nov 2024 08:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nSGeqoOn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AAB910E18C
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 08:38:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 78EFEA41ABD;
 Tue, 26 Nov 2024 08:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1860C4CED2;
 Tue, 26 Nov 2024 08:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732610338;
 bh=np3gVh2vdVMzwJbdelK/6cS6+cbSugtEMQAtU2/XSG0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nSGeqoOn1S3dD4mvA4bOozPQKUShhg1mWWMrX9sdkefP4KreZ5C12Lvw13dCIlF8o
 dBax9EngjiuB2f3zEbgw3yXwgrIPUef8ZT1q0Un11iqeJx3tcTJtqEURMF15ZZNqUP
 CWmTLCHLhGw5sJVGMd4MjASQsdDnT6i1Kj3qRj0ehClBz0uRhDRmZZbriJjx9ul450
 YVp5bDU5Y2piARlIPhRDCulRvmgGCPLExHoKIUfWzkoK4lVFRBNsJTf9OmHlKCTUVz
 XTM+V5WBnj0mx8jrGJkSazCeedawve01dDdUTxnkdM2zemIF222ICHxzmoeNZ85EjD
 cUg84GF5JgSKg==
Date: Tue, 26 Nov 2024 09:38:55 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
Message-ID: <20241126-refreshing-slick-pig-baebab@houat>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
 <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
 <bfuj6w6hsbfpdw24th6dl3ugvj45op6jb45gx5ab5pulud7hiz@o2zbn45z3lt4>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="lhbvkcbp3c3gosel"
Content-Disposition: inline
In-Reply-To: <bfuj6w6hsbfpdw24th6dl3ugvj45op6jb45gx5ab5pulud7hiz@o2zbn45z3lt4>
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


--lhbvkcbp3c3gosel
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
MIME-Version: 1.0

Hi,

On Tue, Nov 26, 2024 at 08:36:00AM +0100, Sean Nyekjaer wrote:
> On Mon, Nov 25, 2024 at 05:00:56PM +0100, Maxime Ripard wrote:
> > On Mon, Nov 25, 2024 at 02:49:26PM +0100, Sean Nyekjaer wrote:
> > > Check if the required pixel clock is in within .5% range of the
> > > desired pixel clock.
> > > This will match the requirement for HDMI where a .5% tolerance is all=
owed.
> > >=20
> > > Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> > > ---
> > >  drivers/gpu/drm/drm_modes.c | 34 ++++++++++++++++++++++++++++++++++
> > >  include/drm/drm_modes.h     |  2 ++
> > >  2 files changed, 36 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> > > index 6ba167a3346134072d100af0adbbe9b49e970769..4068b904759bf80502efd=
e6e4d977b297f5d5359 100644
> > > --- a/drivers/gpu/drm/drm_modes.c
> > > +++ b/drivers/gpu/drm/drm_modes.c
> > > @@ -1623,6 +1623,40 @@ bool drm_mode_equal_no_clocks_no_stereo(const =
struct drm_display_mode *mode1,
> > >  }
> > >  EXPORT_SYMBOL(drm_mode_equal_no_clocks_no_stereo);
> > > =20
> > > +/**
> > > + * drm_mode_validate_mode
> > > + * @mode: mode to check
> > > + * @rounded_rate: output pixel clock
> > > + *
> > > + * VESA DMT defines a tolerance of 0.5% on the pixel clock, while the
> > > + * CVT spec reuses that tolerance in its examples, so it looks to be=
 a
> > > + * good default tolerance for the EDID-based modes. Define it to 5 p=
er
> > > + * mille to avoid floating point operations.
> > > + *
> > > + * Returns:
> > > + * The mode status
> > > + */
> > > +enum drm_mode_status drm_mode_validate_mode(const struct drm_display=
_mode *mode,
> > > +					    unsigned long long rounded_rate)
> > > +{
> > > +	enum drm_mode_status status;
> > > +	unsigned long long rate =3D mode->clock * 1000;
> > > +	unsigned long long lowest, highest;
> > > +
> > > +	lowest =3D rate * (1000 - 5);
> > > +	do_div(lowest, 1000);
> > > +	if (rounded_rate < lowest)
> > > +		return MODE_CLOCK_LOW;
> > > +
> > > +	highest =3D rate * (1000 + 5);
> > > +	do_div(highest, 1000);
> > > +	if (rounded_rate > highest)
> > > +		return MODE_CLOCK_HIGH;
> > > +
> > > +	return MODE_OK;
> > > +}
> > > +EXPORT_SYMBOL(drm_mode_validate_mode);
> >=20
> > Thanks a lot for doing that!
> >=20
> > I wonder about the naming though (and prototype). I doesn't really
> > validates a mode, but rather makes sure that a given rate is a good
> > approximation of a pixel clock. So maybe something like
> > drm_mode_check_pixel_clock?
>=20
> Naming is hard :) I will use drm_mode_check_pixel_clock() for V2.
>=20
> Would it make sense to have the pixel clock requirement as a input
> parameter? For HDMI it is 0.5%

This code was only used for panels so far. It reuses the same tolerance
than HDMI because we couldn't come up with anything better, but it
should totally apply to other things.

> and in my case the LVDS panel 10%.

10% is a lot, and I'm not sure we'll want that. The framerate being
anywhere between 54 and 66 fps will trip a lot of applications too.

Why do you need such a big tolerance?

Maxime

--lhbvkcbp3c3gosel
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0WJGgAKCRAnX84Zoj2+
dgyFAYDpVbD0+B1OXcBahhvUgiMgYgY8W64szTv09wv/4HohtzWS1pIp3K2R38QQ
wOL5h3QBf0hLFnVFqmeGdio6nM2Us2phuUAbokXf6Z7YXiUN8CVJPQw1vBRsPHG9
zYgs3yNCQA==
=bqF0
-----END PGP SIGNATURE-----

--lhbvkcbp3c3gosel--
