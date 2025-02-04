Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD11A26D35
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 09:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE5E10E2C5;
	Tue,  4 Feb 2025 08:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LQlUSYyN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C9010E2C5
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 08:23:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 812165C4CDE;
 Tue,  4 Feb 2025 08:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F0AC4CEDF;
 Tue,  4 Feb 2025 08:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738657391;
 bh=qWJgKcGae71GB2ssf2O5YmlsXadCUYdUYbFNqD+Ntgo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LQlUSYyNkqa9eot3QrbmyIvqmK/FpOsP7GttI9wkjzffMyIS8PuWNwEIASSxLo4lj
 Ofz1CvZPkR3cNdQZMLWVAzlPYLy+WC3lN3r3pGP81F5ENT7VWaDfMo1JYFH5dkCD4q
 1Mo7i3wCiwcj+jynEknpmiWduqbL3VATLA4M5HtQKhoe1XfSli+HdwFK/mQQAvde+v
 HZgVty5hZ4rjD3Fds5tzM2PoMte6ZRuFFPIJ2JSJLjcH5GalX1QjHCd0b0ktFqcWA7
 dKIyILIR+aolo9JtCEvZRNAt1RhfJII1hyTjBarSVUGb24PQHCjFDnzGNSWfBLKyyL
 Gz07zLAFkuSxw==
Date: Tue, 4 Feb 2025 09:23:08 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 29/29] drm/bridge: ti-sn65dsi86: Use bridge_state crtc
 pointer
Message-ID: <20250204-vehement-curious-eagle-b87d7e@houat>
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
 <20250115-bridge-connector-v1-29-9a2fecd886a6@kernel.org>
 <cfn3xpwyoo6lbugaxjwxvcq4l7eqbznlgnunxxfg4jnbrwtnpo@wdoizsk6ckvg>
 <20250203-orthodox-watchful-poodle-4018f4@houat>
 <sdyucn42l63puzt43bqgzildszsziceaucyfyjven3h3zy6iyj@pwlk4uhs6w43>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ntwvjcipumgqyvo2"
Content-Disposition: inline
In-Reply-To: <sdyucn42l63puzt43bqgzildszsziceaucyfyjven3h3zy6iyj@pwlk4uhs6w43>
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


--ntwvjcipumgqyvo2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 29/29] drm/bridge: ti-sn65dsi86: Use bridge_state crtc
 pointer
MIME-Version: 1.0

On Mon, Feb 03, 2025 at 07:49:05PM +0200, Dmitry Baryshkov wrote:
> On Mon, Feb 03, 2025 at 11:01:28AM +0100, Maxime Ripard wrote:
> > Hi Dmitry,
> >=20
> > On Thu, Jan 16, 2025 at 03:08:00AM +0200, Dmitry Baryshkov wrote:
> > > On Wed, Jan 15, 2025 at 10:05:36PM +0100, Maxime Ripard wrote:
> > > > The TI sn65dsi86 driver follows the drm_encoder->crtc pointer that =
is
> > > > deprecated and shouldn't be used by atomic drivers.
> > > >=20
> > > > This was due to the fact that we did't have any other alternative to
> > > > retrieve the CRTC pointer. Fortunately, the crtc pointer is now pro=
vided
> > > > in the bridge state, so we can move to atomic callbacks and drop th=
at
> > > > deprecated pointer usage.
> > > >=20
> > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > ---
> > > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 41 ++++++++++++++++++++---=
------------
> > > >  1 file changed, 24 insertions(+), 17 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/dr=
m/bridge/ti-sn65dsi86.c
> > > > index b3d617505dda7d22b38c000fb79de46376adf3f1..c17d9486cf5c36d61eb=
00af2bdf9ba1b6f890ffd 100644
> > > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > @@ -242,15 +242,16 @@ static void ti_sn65dsi86_write_u16(struct ti_=
sn65dsi86 *pdata,
> > > >  	u8 buf[2] =3D { val & 0xff, val >> 8 };
> > > > =20
> > > >  	regmap_bulk_write(pdata->regmap, reg, buf, ARRAY_SIZE(buf));
> > > >  }
> > > > =20
> > > > -static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata)
> > > > +static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata,
> > > > +				     struct drm_bridge_state *bridge_state)
> > > >  {
> > > >  	u32 bit_rate_khz, clk_freq_khz;
> > > >  	struct drm_display_mode *mode =3D
> > > > -		&pdata->bridge.encoder->crtc->state->adjusted_mode;
> > > > +		&bridge_state->crtc->state->adjusted_mode;
> > >=20
> > > At least we should document why is it safe to follow the crtc->state.
> >=20
> > What do you have in mind there? crtc->state is a pointer that is widely
> > used, what is there to document?
>=20
> If I understand correctly, crtc->state is safe to be used during atomic
> callbacks only or if the mutex is being held. However this function is
> also being called from ti_sn65dsi86_enable_comms(), which is in turn is
> used in ti_sn65dsi86_resume(). Is it safe? Why?

It's not safe, and it wasn't before this series. I'll send a patch
trying to fix it. However, I can't test it and fixing individual locking
issues isn't really the point of this series either, so I might as well
drop it.

Maxime

--ntwvjcipumgqyvo2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6HOZgAKCRAnX84Zoj2+
docGAYDFvQf4dmONWW+FGa4qFnMCeEOCquBMjAhsSFHPZjLBB2PynZdPmj39eD1i
KpyVK1wBfR5notRYrzykawEvNQGD9XTA5IugySHNIzFyjDD0HIraU4YnNBmMGTNy
viMS1rQ4cw==
=13r0
-----END PGP SIGNATURE-----

--ntwvjcipumgqyvo2--
