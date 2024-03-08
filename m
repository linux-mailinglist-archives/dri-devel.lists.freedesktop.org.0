Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B936876268
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 11:48:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E41310F967;
	Fri,  8 Mar 2024 10:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R4IwoUao";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E8610F967
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 10:48:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7DB57CE022B;
 Fri,  8 Mar 2024 10:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35ED0C433F1;
 Fri,  8 Mar 2024 10:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709894890;
 bh=Oh9+83stTEAWMxwiZmN2wXsRzxzcIcyaMy4cNtT2Vm8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R4IwoUaoLjXJA6CTTrAUzh3glAZf2bLgRzsNjadq5egUbe/oPJfLUvSw4aDjzcOf1
 T/BYyopXyLoJJ9YgO1cOizZIQEvvJkCesQCowbsIh2/xm1/+Uiv6hVZlo4PH1kv7KP
 39TzmqqlkZ74cVfA/WF/xVWlpKCsEA6G39JW5DC5hAEh9u+vfhRFAS6zeM1iRIZRZI
 uNKl9faqpCsGunQY1rItPtmXX+rkJ0ZfwC+nWq3WVp99OV+8Qu51vAIA3hbWdTMsdC
 ConXosMVMCxWdA1EB89rFIFskhlsJ+rEl9Vkwp+79S9DR4kHdm6UIWOZK8tXznxYwn
 wd6iKGVE2nMhQ==
Date: Fri, 8 Mar 2024 11:48:07 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?B?SsOpcsOpbWll?= Dautheribes <jeremie.dautheribes@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yen-Mei Goh <yen-mei.goh@keysight.com>
Subject: Re: [PATCH v2 3/3] drm/panel: simple: add CMT430B19N00 LCD panel
 support
Message-ID: <20240308-shiny-meaty-duck-446e8d@houat>
References: <20240304160454.96977-1-jeremie.dautheribes@bootlin.com>
 <20240304160454.96977-4-jeremie.dautheribes@bootlin.com>
 <20240304-inquisitive-kickass-pronghorn-c641ff@houat>
 <ee36a60d-5b65-4eb8-ac41-e4b6be1cf81f@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vglunjsivqojxdbh"
Content-Disposition: inline
In-Reply-To: <ee36a60d-5b65-4eb8-ac41-e4b6be1cf81f@bootlin.com>
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


--vglunjsivqojxdbh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2024 at 10:46:55AM +0100, J=E9r=E9mie Dautheribes wrote:
> Hi Maxime,
>=20
> On 04/03/2024 17:25, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Mon, Mar 04, 2024 at 05:04:54PM +0100, J=E9r=E9mie Dautheribes wrote:
> > > Add support for Crystal Clear Technology CMT430B19N00 4.3" 480x272
> > > TFT-LCD panel.
> > >=20
> > > Signed-off-by: J=E9r=E9mie Dautheribes <jeremie.dautheribes@bootlin.c=
om>
> > > ---
> > >   drivers/gpu/drm/panel/panel-simple.c | 29 +++++++++++++++++++++++++=
+++
> > >   1 file changed, 29 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/p=
anel/panel-simple.c
> > > index 20e3df1c59d4..b940220f56e2 100644
> > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > @@ -1457,6 +1457,32 @@ static const struct panel_desc boe_hv070wsa =
=3D {
> > >   	.connector_type =3D DRM_MODE_CONNECTOR_LVDS,
> > >   };
> > > +static const struct drm_display_mode cct_cmt430b19n00_mode =3D {
> > > +	.clock =3D 9000,
> > > +	.hdisplay =3D 480,
> > > +	.hsync_start =3D 480 + 43,
> > > +	.hsync_end =3D 480 + 43 + 8,
> > > +	.htotal =3D 480 + 43 + 8 + 4,
> > > +	.vdisplay =3D 272,
> > > +	.vsync_start =3D 272 + 12,
> > > +	.vsync_end =3D 272 + 12 + 8,
> > > +	.vtotal =3D 272 + 12 + 8 + 4,
> > > +	.flags =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> > > +};
> >=20
> > Your pixel clock doesn't really match the rest of the timings:
> >=20
> > (480 + 43 + 8 + 4) * (272 + 12 + 8 + 4) * 60 =3D 9501600
> >=20
> > So a ~6% deviation.
> >=20
> > What does the datasheet say?
>=20
> Indeed it does not exactly match but the datasheet indicates that the
> typical clock frequency is 9MHz and when this frequency is used, the
> typical values of the other parameters are those we have defined in
> the drm_display_mode structure.

It seems weird to me that all the typical timings end up in a
non-typical configuration, but I've seen my fair share of weird
datasheet, so.. yeah.

I guess the best thing to do if you have access to the min/typ/max
timings is to actually use the display_timings structure here and define
all of them.

It at least gives us the opportunity to fix it later on.

> I don't see any information about the accepted deviation either.

It's not only about the panel itself. 6% gives your roughly 56fps when
you meant 60. This can then trip up some applications too. Like if
you're playing a 60fps application, it will either play too fast or
you'll get stutter, depending on how the video playback has been
implemented exactly.

Maxime

--vglunjsivqojxdbh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZers5wAKCRDj7w1vZxhR
xRi0APwMTxCozvo10NB+M+y2Z3QMtuMjP1GtOoTo/nC52Lx3AgD/dLgDGRrAJ+ex
3iIbCnd/WsMDVaQyTwOqnJ8OeOQ5ygc=
=2WQs
-----END PGP SIGNATURE-----

--vglunjsivqojxdbh--
