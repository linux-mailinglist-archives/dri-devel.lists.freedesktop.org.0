Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6326C82DC45
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 16:25:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7964E10E311;
	Mon, 15 Jan 2024 15:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6F510E311
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 15:25:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9C7A560C78;
 Mon, 15 Jan 2024 15:25:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB19C433C7;
 Mon, 15 Jan 2024 15:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705332344;
 bh=F+KShPyxC2iWhYtXbRbIEplYrB9q6J1tUU6JHTlPDX8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=euQlCMkLJcL2D4vkC4R75T4/MgQt/FWOdjmTNjrXW4LWTF5fO3uKIJgoyQbjAjJw8
 yOw0BRyBdyTB8uEyoeBz2SwjbRkeJkkXg0NVYq9Be0KYlNPjNIawRM0z0JgQ1/8OG4
 dt9O64QiNHoyhyJbInor9qAWkq/0P+1Ifvd1qPNdA+K+fGD27Gm/yh5J7pBalsPt7e
 5rYpN3eiJcY86z1aWyN+75ZKXeahea2OgZcr/YVbZbadEbA3aKzjteTvvAbXlD7rS4
 j6HRMuiNpSOYk42xBoikwMHecf3dD9SVE+ChIiIChjfpD3XLERLKr19YPRz6djluow
 P/19UNpHxSYRA==
Date: Mon, 15 Jan 2024 16:25:41 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: Re: [PATCH v5 08/44] drm/connector: hdmi: Add Broadcast RGB
 property
Message-ID: <jpcov2bvhpabws36ueywr4xjfnbmwjsd42b4tpcicyi66qkjs2@3xn5mdl4zyus>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-8-6538e19d634d@kernel.org>
 <20240115143308.GA159345@toolbox>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yd3mop6hvuqz5nhz"
Content-Disposition: inline
In-Reply-To: <20240115143308.GA159345@toolbox>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Sandy Huang <hjc@rock-chips.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-doc@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, David Airlie <airlied@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yd3mop6hvuqz5nhz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2024 at 03:33:08PM +0100, Sebastian Wick wrote:
> On Thu, Dec 07, 2023 at 04:49:31PM +0100, Maxime Ripard wrote:
> > The i915 driver has a property to force the RGB range of an HDMI output.
> > The vc4 driver then implemented the same property with the same
> > semantics. KWin has support for it, and a PR for mutter is also there to
> > support it.
> >=20
> > Both drivers implementing the same property with the same semantics,
> > plus the userspace having support for it, is proof enough that it's
> > pretty much a de-facto standard now and we can provide helpers for it.
> >=20
> > Let's plumb it into the newly created HDMI connector.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  Documentation/gpu/kms-properties.csv               |   1 -
> >  drivers/gpu/drm/drm_atomic.c                       |   5 +
> >  drivers/gpu/drm/drm_atomic_state_helper.c          |  17 +
> >  drivers/gpu/drm/drm_atomic_uapi.c                  |   4 +
> >  drivers/gpu/drm/drm_connector.c                    |  76 +++++
> >  drivers/gpu/drm/tests/Makefile                     |   1 +
> >  .../gpu/drm/tests/drm_atomic_state_helper_test.c   | 376 +++++++++++++=
++++++++
> >  drivers/gpu/drm/tests/drm_connector_test.c         | 117 ++++++-
> >  drivers/gpu/drm/tests/drm_kunit_edid.h             | 106 ++++++
> >  include/drm/drm_connector.h                        |  36 ++
> >  10 files changed, 737 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/Documentation/gpu/kms-properties.csv b/Documentation/gpu/k=
ms-properties.csv
> > index 0f9590834829..caef14c532d4 100644
> > --- a/Documentation/gpu/kms-properties.csv
> > +++ b/Documentation/gpu/kms-properties.csv
> > @@ -17,7 +17,6 @@ Owner Module/Drivers,Group,Property Name,Type,Propert=
y Values,Object attached,De
> >  ,Virtual GPU,=E2=80=9Csuggested X=E2=80=9D,RANGE,"Min=3D0, Max=3D0xfff=
fffff",Connector,property to suggest an X offset for a connector
> >  ,,=E2=80=9Csuggested Y=E2=80=9D,RANGE,"Min=3D0, Max=3D0xffffffff",Conn=
ector,property to suggest an Y offset for a connector
> >  ,Optional,"""aspect ratio""",ENUM,"{ ""None"", ""4:3"", ""16:9"" }",Co=
nnector,TDB
> > -i915,Generic,"""Broadcast RGB""",ENUM,"{ ""Automatic"", ""Full"", ""Li=
mited 16:235"" }",Connector,"When this property is set to Limited 16:235 an=
d CTM is set, the hardware will be programmed with the result of the multip=
lication of CTM by the limited range matrix to ensure the pixels normally i=
n the range 0..1.0 are remapped to the range 16/255..235/255."
> >  ,,=E2=80=9Caudio=E2=80=9D,ENUM,"{ ""force-dvi"", ""off"", ""auto"", ""=
on"" }",Connector,TBD
> >  ,SDVO-TV,=E2=80=9Cmode=E2=80=9D,ENUM,"{ ""NTSC_M"", ""NTSC_J"", ""NTSC=
_443"", ""PAL_B"" } etc.",Connector,TBD
> >  ,,"""left_margin""",RANGE,"Min=3D0, Max=3D SDVO dependent",Connector,T=
BD
> > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > index c31fc0b48c31..1465a7f09a0b 100644
> > --- a/drivers/gpu/drm/drm_atomic.c
> > +++ b/drivers/gpu/drm/drm_atomic.c
> > @@ -1142,6 +1142,11 @@ static void drm_atomic_connector_print_state(str=
uct drm_printer *p,
> >  	drm_printf(p, "\tmax_requested_bpc=3D%d\n", state->max_requested_bpc);
> >  	drm_printf(p, "\tcolorspace=3D%s\n", drm_get_colorspace_name(state->c=
olorspace));
> > =20
> > +	if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA ||
> > +	    connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIB)
> > +		drm_printf(p, "\tbroadcast_rgb=3D%s\n",
> > +			   drm_hdmi_connector_get_broadcast_rgb_name(state->hdmi.broadcast_=
rgb));
> > +
> >  	if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_WRITEBACK)
> >  		if (state->writeback_job && state->writeback_job->fb)
> >  			drm_printf(p, "\tfb=3D%d\n", state->writeback_job->fb->base.id);
> > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/dr=
m/drm_atomic_state_helper.c
> > index e69c0cc1c6da..10d98620a358 100644
> > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > @@ -583,6 +583,7 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
> >  void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *co=
nnector,
> >  					      struct drm_connector_state *new_state)
> >  {
> > +	new_state->hdmi.broadcast_rgb =3D DRM_HDMI_BROADCAST_RGB_AUTO;
> >  }
> >  EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
> > =20
> > @@ -650,6 +651,22 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_tv_check=
);
> >  int drm_atomic_helper_connector_hdmi_check(struct drm_connector *conne=
ctor,
> >  					   struct drm_atomic_state *state)
> >  {
> > +	struct drm_connector_state *old_state =3D
> > +		drm_atomic_get_old_connector_state(state, connector);
> > +	struct drm_connector_state *new_state =3D
> > +		drm_atomic_get_new_connector_state(state, connector);
> > +
> > +	if (old_state->hdmi.broadcast_rgb !=3D new_state->hdmi.broadcast_rgb)=
 {
> > +		struct drm_crtc *crtc =3D new_state->crtc;
> > +		struct drm_crtc_state *crtc_state;
> > +
> > +		crtc_state =3D drm_atomic_get_crtc_state(state, crtc);
> > +		if (IS_ERR(crtc_state))
> > +			return PTR_ERR(crtc_state);
> > +
> > +		crtc_state->mode_changed =3D true;
> > +	}
> > +
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_at=
omic_uapi.c
> > index aee4a65d4959..3eb4f4bc8b71 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -818,6 +818,8 @@ static int drm_atomic_connector_set_property(struct=
 drm_connector *connector,
> >  		state->max_requested_bpc =3D val;
> >  	} else if (property =3D=3D connector->privacy_screen_sw_state_propert=
y) {
> >  		state->privacy_screen_sw_state =3D val;
> > +	} else if (property =3D=3D connector->broadcast_rgb_property) {
> > +		state->hdmi.broadcast_rgb =3D val;
> >  	} else if (connector->funcs->atomic_set_property) {
> >  		return connector->funcs->atomic_set_property(connector,
> >  				state, property, val);
> > @@ -901,6 +903,8 @@ drm_atomic_connector_get_property(struct drm_connec=
tor *connector,
> >  		*val =3D state->max_requested_bpc;
> >  	} else if (property =3D=3D connector->privacy_screen_sw_state_propert=
y) {
> >  		*val =3D state->privacy_screen_sw_state;
> > +	} else if (property =3D=3D connector->broadcast_rgb_property) {
> > +		*val =3D state->hdmi.broadcast_rgb;
> >  	} else if (connector->funcs->atomic_get_property) {
> >  		return connector->funcs->atomic_get_property(connector,
> >  				state, property, val);
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_conn=
ector.c
> > index d9961cce8245..929b0a911f62 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -1183,6 +1183,29 @@ static const u32 dp_colorspaces =3D
> >  	BIT(DRM_MODE_COLORIMETRY_BT2020_CYCC) |
> >  	BIT(DRM_MODE_COLORIMETRY_BT2020_YCC);
> > =20
> > +static const struct drm_prop_enum_list broadcast_rgb_names[] =3D {
> > +	{ DRM_HDMI_BROADCAST_RGB_AUTO, "Automatic" },
> > +	{ DRM_HDMI_BROADCAST_RGB_FULL, "Full" },
> > +	{ DRM_HDMI_BROADCAST_RGB_LIMITED, "Limited 16:235" },
> > +};
> > +
> > +/*
> > + * drm_hdmi_connector_get_broadcast_rgb_name - Return a string for HDM=
I connector RGB broadcast selection
> > + * @broadcast_rgb: Broadcast RGB selection to compute name of
> > + *
> > + * Returns: the name of the Broadcast RGB selection, or NULL if the ty=
pe
> > + * is not valid.
> > + */
> > +const char *
> > +drm_hdmi_connector_get_broadcast_rgb_name(enum drm_hdmi_broadcast_rgb =
broadcast_rgb)
> > +{
> > +	if (broadcast_rgb > DRM_HDMI_BROADCAST_RGB_LIMITED)
> > +		return NULL;
> > +
> > +	return broadcast_rgb_names[broadcast_rgb].name;
> > +}
> > +EXPORT_SYMBOL(drm_hdmi_connector_get_broadcast_rgb_name);
> > +
> >  /**
> >   * DOC: standard connector properties
> >   *
> > @@ -1655,6 +1678,26 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnect=
or_property);
> >  /**
> >   * DOC: HDMI connector properties
> >   *
> > + * Broadcast RGB
> > + *      Indicates the RGB Quantization Range (Full vs Limited) used.
> > + *      Infoframes will be generated according to that value.
> > + *
> > + *      The value of this property can be one of the following:
> > + *
> > + *      Automatic:
> > + *              RGB Range is selected automatically based on the mode
> > + *              according to the HDMI specifications.
> > + *
> > + *      Full:
> > + *              Full RGB Range is forced.
> > + *
> > + *      Limited 16:235:
> > + *              Limited RGB Range is forced. Unlike the name suggests,
> > + *              this works for any number of bits-per-component.
> > + *
> > + *      Drivers can set up this property by calling
> > + *      drm_connector_attach_broadcast_rgb_property().
> > + *
>=20
> This is a good time to document this in more detail.

I have the feeling that it already is documented in more detail. But
anyway, last time we discussed it the answer was basically to not bother
and just merge the thing. So I'm getting some mixed signals here.

> There might be two different things being affected:
>=20
> 1. The signalling (InfoFrame/SDP/...)
> 2. The color pipeline processing
>=20
> All values of Broadcast RGB always affect the color pipeline processing
> such that a full-range input to the CRTC is converted to either full- or
> limited-range, depending on what the monitor is supposed to accept.
>=20
> When automatic is selected, does that mean that there is no signalling,
> or that the signalling matches what the monitor is supposed to accept
> according to the spec?

The doc states that "Infoframes will be generated according to that
value". Is it ambiguous?

> Also, is this really HDMI specific?

Probably not, but it can easily be expanded to other connector types
when needs be.

> When full or limited is selected and the monitor doesn't support the
> signalling, what happens?

I would expect colors to be off

Maxime

--yd3mop6hvuqz5nhz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZaVOdAAKCRDj7w1vZxhR
xVZ6AQCBIsao3/wYmeGvcP81lWBqUDOqug3y4nijDxhLDsn2gQEAjbAujKqIXO3q
T2U8XyzbANX2DfajXGwDY+9QrqnI/QY=
=i+f4
-----END PGP SIGNATURE-----

--yd3mop6hvuqz5nhz--
