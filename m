Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7419D947D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 10:30:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822DE10E7F9;
	Tue, 26 Nov 2024 09:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WQdq2LZE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E3310E7F5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 09:30:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6D80E5C5D16;
 Tue, 26 Nov 2024 09:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D0A3C4CECF;
 Tue, 26 Nov 2024 09:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732613410;
 bh=9Ay6+imSrXagOd8Xd0hPE8chBJ5GelgKMPvVGoiR2e8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WQdq2LZE9YTWOxAyv7FnmGEL6ltFHnouW2WMUelybvVewvAWZm15QH/lf4XnmpQIj
 rlQos5T4MqJKm0b4DQ+XG/dwzrlSHYISKPwh1eT8EYKMDTbHpep6jNgk2xbMKdFDiJ
 hn4GR7SeIgMtyW1i5NZi60c+PAJdj3CDW3nvknu4LQcgmMSBr9kw1YUcB0r0hL6u0b
 AfWWeTAU1kj3t137X4AI3F7clejrXfnU7TD+LNP9Sb/TNVQXlciE6FtXt9h8HzQmly
 XJFQtHV2onhmWl+5d/rCLPRImcGfpHpSC1OHCVSX9Yh2hwq7dtq9rUmpxlO9EKusN2
 dq3Ud11z9oHyg==
Date: Tue, 26 Nov 2024 10:30:07 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Sean Nyekjaer <sean@geanix.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
Message-ID: <20241126-silver-skylark-of-expertise-bba576@houat>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
 <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
 <bfuj6w6hsbfpdw24th6dl3ugvj45op6jb45gx5ab5pulud7hiz@o2zbn45z3lt4>
 <725aafb8-abfa-40c0-967a-62122206f736@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ivjgiyez6uyhrxcb"
Content-Disposition: inline
In-Reply-To: <725aafb8-abfa-40c0-967a-62122206f736@foss.st.com>
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


--ivjgiyez6uyhrxcb
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
MIME-Version: 1.0

On Tue, Nov 26, 2024 at 09:47:17AM +0100, Raphael Gallais-Pou wrote:
>=20
> On 11/26/24 08:36, Sean Nyekjaer wrote:
> > Hi Maxime,
> >
> > On Mon, Nov 25, 2024 at 05:00:56PM +0100, Maxime Ripard wrote:
> >> Hi Sean,
> >>
> >> On Mon, Nov 25, 2024 at 02:49:26PM +0100, Sean Nyekjaer wrote:
> >>> Check if the required pixel clock is in within .5% range of the
> >>> desired pixel clock.
> >>> This will match the requirement for HDMI where a .5% tolerance is all=
owed.
> >>>
> >>> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> >>> ---
> >>>  drivers/gpu/drm/drm_modes.c | 34 ++++++++++++++++++++++++++++++++++
> >>>  include/drm/drm_modes.h     |  2 ++
> >>>  2 files changed, 36 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> >>> index 6ba167a3346134072d100af0adbbe9b49e970769..4068b904759bf80502efd=
e6e4d977b297f5d5359 100644
> >>> --- a/drivers/gpu/drm/drm_modes.c
> >>> +++ b/drivers/gpu/drm/drm_modes.c
> >>> @@ -1623,6 +1623,40 @@ bool drm_mode_equal_no_clocks_no_stereo(const =
struct drm_display_mode *mode1,
> >>>  }
> >>>  EXPORT_SYMBOL(drm_mode_equal_no_clocks_no_stereo);
> >>> =20
> >>> +/**
> >>> + * drm_mode_validate_mode
> >>> + * @mode: mode to check
> >>> + * @rounded_rate: output pixel clock
> >>> + *
> >>> + * VESA DMT defines a tolerance of 0.5% on the pixel clock, while the
> >>> + * CVT spec reuses that tolerance in its examples, so it looks to be=
 a
> >>> + * good default tolerance for the EDID-based modes. Define it to 5 p=
er
> >>> + * mille to avoid floating point operations.
> >>> + *
> >>> + * Returns:
> >>> + * The mode status
> >>> + */
> >>> +enum drm_mode_status drm_mode_validate_mode(const struct drm_display=
_mode *mode,
> >>> +					    unsigned long long rounded_rate)
> >>> +{
> >>> +	enum drm_mode_status status;
> >>> +	unsigned long long rate =3D mode->clock * 1000;
> >>> +	unsigned long long lowest, highest;
> >>> +
> >>> +	lowest =3D rate * (1000 - 5);
> >>> +	do_div(lowest, 1000);
> >>> +	if (rounded_rate < lowest)
> >>> +		return MODE_CLOCK_LOW;
> >>> +
> >>> +	highest =3D rate * (1000 + 5);
> >>> +	do_div(highest, 1000);
> >>> +	if (rounded_rate > highest)
> >>> +		return MODE_CLOCK_HIGH;
> >>> +
> >>> +	return MODE_OK;
> >>> +}
> >>> +EXPORT_SYMBOL(drm_mode_validate_mode);
> Hi Sean, Maxime,
> >> Thanks a lot for doing that!
> >>
> >> I wonder about the naming though (and prototype). I doesn't really
> >> validates a mode, but rather makes sure that a given rate is a good
> >> approximation of a pixel clock. So maybe something like
> >> drm_mode_check_pixel_clock?
> > Naming is hard :) I will use drm_mode_check_pixel_clock() for V2.
> >
> > Would it make sense to have the pixel clock requirement as a input
> > parameter? For HDMI it is 0.5% and in my case the LVDS panel 10%.
> >
> > enum drm_mode_status drm_mode_validate_mode(const struct drm_display_mo=
de *mode,
> > 					    unsigned long long rounded_rate, unsigned tolerance)
> > ?
>=20
>=20
> IMO adding the tolerance as input parameter is a good idea.=A0 This
> would useful other than for HDMI pixel clock validation (and LVDS in
> your case).

It depends on the intent. If it's justified, why not. If it's to
workaround another issue, absolutely not. And so, generally speaking, I
don't think it's a good idea.

Maxime

--ivjgiyez6uyhrxcb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0WVGgAKCRAnX84Zoj2+
dt6vAYD/ha6rSzfdB8Hdtt8QyIin6959mZS2o1Kfzj2g79x6jBpKlT0JtMgi//O3
OUV40OgBfROD6tZDvz9F+STrxg9e7rBW0RrVft6ey02AdwVIWtaNpvVoJEMn/cnG
vhycHMk+wA==
=7JWg
-----END PGP SIGNATURE-----

--ivjgiyez6uyhrxcb--
