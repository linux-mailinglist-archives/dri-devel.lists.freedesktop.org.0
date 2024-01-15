Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F3482DC53
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 16:30:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F4A10E320;
	Mon, 15 Jan 2024 15:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2CA10E320
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 15:30:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8265460C7A;
 Mon, 15 Jan 2024 15:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3DE1C433C7;
 Mon, 15 Jan 2024 15:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705332603;
 bh=i+sAHaV32j73dmSDaQjMq2fN84j/W7BDfu4abhHoLbk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sUtZFwP01BkBBU0Ca9vIuI9QMS/5i1oK1OOnh7h+jlN2UJ9Ela1VNwJUGvZRFar+0
 QmjUGv+4rJ5Ky5xARxZU9KcKe7y4xwngcvnX15RhfCxtMd3glJjPEIJXQq2Q5bNcGF
 TM3BFn4GdJ6OJJ48zZgplCln0DD/y8bRiTgVMP1uhBWcBbRrmSzQlG949j+DRRA1Ui
 5c6xWkWGJ/fUuRPecxx47WKwqFMbAY/7Ceu60WLh1o+/iyNVj9Q2fOinnlR+o7hQjy
 G3OJERz6abgtNEsGX/4JH/yQiV1mfpt/U4yZ63uiM8JY/OywW+jaMSE4K5/jIW51hA
 GcH6qVdU7q0CA==
Date: Mon, 15 Jan 2024 16:30:00 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: Re: [PATCH v5 08/44] drm/connector: hdmi: Add Broadcast RGB
 property
Message-ID: <igshliibofml3bkkchamqo7xyrnzrf6efkfuok5lprcfg5h3ug@phfvvy6fra35>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-8-6538e19d634d@kernel.org>
 <20240115143308.GA159345@toolbox> <20240115143720.GA160656@toolbox>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lgtwqetat5bqpk6j"
Content-Disposition: inline
In-Reply-To: <20240115143720.GA160656@toolbox>
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


--lgtwqetat5bqpk6j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2024 at 03:37:20PM +0100, Sebastian Wick wrote:
> On Mon, Jan 15, 2024 at 03:33:08PM +0100, Sebastian Wick wrote:
> > On Thu, Dec 07, 2023 at 04:49:31PM +0100, Maxime Ripard wrote:
> > > The i915 driver has a property to force the RGB range of an HDMI outp=
ut.
> > > The vc4 driver then implemented the same property with the same
> > > semantics. KWin has support for it, and a PR for mutter is also there=
 to
> > > support it.
> > >=20
> > > Both drivers implementing the same property with the same semantics,
> > > plus the userspace having support for it, is proof enough that it's
> > > pretty much a de-facto standard now and we can provide helpers for it.
> > >=20
> > > Let's plumb it into the newly created HDMI connector.
> > >=20
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  Documentation/gpu/kms-properties.csv               |   1 -
> > >  drivers/gpu/drm/drm_atomic.c                       |   5 +
> > >  drivers/gpu/drm/drm_atomic_state_helper.c          |  17 +
> > >  drivers/gpu/drm/drm_atomic_uapi.c                  |   4 +
> > >  drivers/gpu/drm/drm_connector.c                    |  76 +++++
> > >  drivers/gpu/drm/tests/Makefile                     |   1 +
> > >  .../gpu/drm/tests/drm_atomic_state_helper_test.c   | 376 +++++++++++=
++++++++++
> > >  drivers/gpu/drm/tests/drm_connector_test.c         | 117 ++++++-
> > >  drivers/gpu/drm/tests/drm_kunit_edid.h             | 106 ++++++
> > >  include/drm/drm_connector.h                        |  36 ++
> > >  10 files changed, 737 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/Documentation/gpu/kms-properties.csv b/Documentation/gpu=
/kms-properties.csv
> > > index 0f9590834829..caef14c532d4 100644
> > > --- a/Documentation/gpu/kms-properties.csv
> > > +++ b/Documentation/gpu/kms-properties.csv
> > > @@ -17,7 +17,6 @@ Owner Module/Drivers,Group,Property Name,Type,Prope=
rty Values,Object attached,De
> > >  ,Virtual GPU,=E2=80=9Csuggested X=E2=80=9D,RANGE,"Min=3D0, Max=3D0xf=
fffffff",Connector,property to suggest an X offset for a connector
> > >  ,,=E2=80=9Csuggested Y=E2=80=9D,RANGE,"Min=3D0, Max=3D0xffffffff",Co=
nnector,property to suggest an Y offset for a connector
> > >  ,Optional,"""aspect ratio""",ENUM,"{ ""None"", ""4:3"", ""16:9"" }",=
Connector,TDB
> > > -i915,Generic,"""Broadcast RGB""",ENUM,"{ ""Automatic"", ""Full"", ""=
Limited 16:235"" }",Connector,"When this property is set to Limited 16:235 =
and CTM is set, the hardware will be programmed with the result of the mult=
iplication of CTM by the limited range matrix to ensure the pixels normally=
 in the range 0..1.0 are remapped to the range 16/255..235/255."
> > >  ,,=E2=80=9Caudio=E2=80=9D,ENUM,"{ ""force-dvi"", ""off"", ""auto"", =
""on"" }",Connector,TBD
> > >  ,SDVO-TV,=E2=80=9Cmode=E2=80=9D,ENUM,"{ ""NTSC_M"", ""NTSC_J"", ""NT=
SC_443"", ""PAL_B"" } etc.",Connector,TBD
> > >  ,,"""left_margin""",RANGE,"Min=3D0, Max=3D SDVO dependent",Connector=
,TBD
> > > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomi=
c.c
> > > index c31fc0b48c31..1465a7f09a0b 100644
> > > --- a/drivers/gpu/drm/drm_atomic.c
> > > +++ b/drivers/gpu/drm/drm_atomic.c
> > > @@ -1142,6 +1142,11 @@ static void drm_atomic_connector_print_state(s=
truct drm_printer *p,
> > >  	drm_printf(p, "\tmax_requested_bpc=3D%d\n", state->max_requested_bp=
c);
> > >  	drm_printf(p, "\tcolorspace=3D%s\n", drm_get_colorspace_name(state-=
>colorspace));
> > > =20
> > > +	if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA ||
> > > +	    connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIB)
> > > +		drm_printf(p, "\tbroadcast_rgb=3D%s\n",
> > > +			   drm_hdmi_connector_get_broadcast_rgb_name(state->hdmi.broadcas=
t_rgb));
> > > +
> > >  	if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_WRITEBACK)
> > >  		if (state->writeback_job && state->writeback_job->fb)
> > >  			drm_printf(p, "\tfb=3D%d\n", state->writeback_job->fb->base.id);
> > > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/=
drm/drm_atomic_state_helper.c
> > > index e69c0cc1c6da..10d98620a358 100644
> > > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > > @@ -583,6 +583,7 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_tv_rese=
t);
> > >  void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *=
connector,
> > >  					      struct drm_connector_state *new_state)
> > >  {
> > > +	new_state->hdmi.broadcast_rgb =3D DRM_HDMI_BROADCAST_RGB_AUTO;
> > >  }
> > >  EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
> > > =20
> > > @@ -650,6 +651,22 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_tv_che=
ck);
> > >  int drm_atomic_helper_connector_hdmi_check(struct drm_connector *con=
nector,
> > >  					   struct drm_atomic_state *state)
> > >  {
> > > +	struct drm_connector_state *old_state =3D
> > > +		drm_atomic_get_old_connector_state(state, connector);
> > > +	struct drm_connector_state *new_state =3D
> > > +		drm_atomic_get_new_connector_state(state, connector);
> > > +
> > > +	if (old_state->hdmi.broadcast_rgb !=3D new_state->hdmi.broadcast_rg=
b) {
> > > +		struct drm_crtc *crtc =3D new_state->crtc;
> > > +		struct drm_crtc_state *crtc_state;
> > > +
> > > +		crtc_state =3D drm_atomic_get_crtc_state(state, crtc);
> > > +		if (IS_ERR(crtc_state))
> > > +			return PTR_ERR(crtc_state);
> > > +
> > > +		crtc_state->mode_changed =3D true;
> > > +	}
> > > +
> > >  	return 0;
> > >  }
> > >  EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
> > > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_=
atomic_uapi.c
> > > index aee4a65d4959..3eb4f4bc8b71 100644
> > > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > > @@ -818,6 +818,8 @@ static int drm_atomic_connector_set_property(stru=
ct drm_connector *connector,
> > >  		state->max_requested_bpc =3D val;
> > >  	} else if (property =3D=3D connector->privacy_screen_sw_state_prope=
rty) {
> > >  		state->privacy_screen_sw_state =3D val;
> > > +	} else if (property =3D=3D connector->broadcast_rgb_property) {
> > > +		state->hdmi.broadcast_rgb =3D val;
> > >  	} else if (connector->funcs->atomic_set_property) {
> > >  		return connector->funcs->atomic_set_property(connector,
> > >  				state, property, val);
> > > @@ -901,6 +903,8 @@ drm_atomic_connector_get_property(struct drm_conn=
ector *connector,
> > >  		*val =3D state->max_requested_bpc;
> > >  	} else if (property =3D=3D connector->privacy_screen_sw_state_prope=
rty) {
> > >  		*val =3D state->privacy_screen_sw_state;
> > > +	} else if (property =3D=3D connector->broadcast_rgb_property) {
> > > +		*val =3D state->hdmi.broadcast_rgb;
> > >  	} else if (connector->funcs->atomic_get_property) {
> > >  		return connector->funcs->atomic_get_property(connector,
> > >  				state, property, val);
> > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_co=
nnector.c
> > > index d9961cce8245..929b0a911f62 100644
> > > --- a/drivers/gpu/drm/drm_connector.c
> > > +++ b/drivers/gpu/drm/drm_connector.c
> > > @@ -1183,6 +1183,29 @@ static const u32 dp_colorspaces =3D
> > >  	BIT(DRM_MODE_COLORIMETRY_BT2020_CYCC) |
> > >  	BIT(DRM_MODE_COLORIMETRY_BT2020_YCC);
> > > =20
> > > +static const struct drm_prop_enum_list broadcast_rgb_names[] =3D {
> > > +	{ DRM_HDMI_BROADCAST_RGB_AUTO, "Automatic" },
> > > +	{ DRM_HDMI_BROADCAST_RGB_FULL, "Full" },
> > > +	{ DRM_HDMI_BROADCAST_RGB_LIMITED, "Limited 16:235" },
> > > +};
> > > +
> > > +/*
> > > + * drm_hdmi_connector_get_broadcast_rgb_name - Return a string for H=
DMI connector RGB broadcast selection
> > > + * @broadcast_rgb: Broadcast RGB selection to compute name of
> > > + *
> > > + * Returns: the name of the Broadcast RGB selection, or NULL if the =
type
> > > + * is not valid.
> > > + */
> > > +const char *
> > > +drm_hdmi_connector_get_broadcast_rgb_name(enum drm_hdmi_broadcast_rg=
b broadcast_rgb)
> > > +{
> > > +	if (broadcast_rgb > DRM_HDMI_BROADCAST_RGB_LIMITED)
> > > +		return NULL;
> > > +
> > > +	return broadcast_rgb_names[broadcast_rgb].name;
> > > +}
> > > +EXPORT_SYMBOL(drm_hdmi_connector_get_broadcast_rgb_name);
> > > +
> > >  /**
> > >   * DOC: standard connector properties
> > >   *
> > > @@ -1655,6 +1678,26 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconne=
ctor_property);
> > >  /**
> > >   * DOC: HDMI connector properties
> > >   *
> > > + * Broadcast RGB
> > > + *      Indicates the RGB Quantization Range (Full vs Limited) used.
> > > + *      Infoframes will be generated according to that value.
> > > + *
> > > + *      The value of this property can be one of the following:
> > > + *
> > > + *      Automatic:
> > > + *              RGB Range is selected automatically based on the mode
> > > + *              according to the HDMI specifications.
> > > + *
> > > + *      Full:
> > > + *              Full RGB Range is forced.
> > > + *
> > > + *      Limited 16:235:
> > > + *              Limited RGB Range is forced. Unlike the name suggest=
s,
> > > + *              this works for any number of bits-per-component.
> > > + *
> > > + *      Drivers can set up this property by calling
> > > + *      drm_connector_attach_broadcast_rgb_property().
> > > + *
> >=20
> > This is a good time to document this in more detail. There might be two
> > different things being affected:
> >=20
> > 1. The signalling (InfoFrame/SDP/...)
> > 2. The color pipeline processing
> >=20
> > All values of Broadcast RGB always affect the color pipeline processing
> > such that a full-range input to the CRTC is converted to either full- or
> > limited-range, depending on what the monitor is supposed to accept.
> >=20
> > When automatic is selected, does that mean that there is no signalling,
> > or that the signalling matches what the monitor is supposed to accept
> > according to the spec? Also, is this really HDMI specific?
> >=20
> > When full or limited is selected and the monitor doesn't support the
> > signalling, what happens?
>=20
> Forgot to mention: user-space still has no control over RGB vs YCbCr on
> the cable, so is this only affecting RGB? If not, how does it affect
> YCbCr?
i915 only supports it for RGB indeed:
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/i915/display=
/intel_hdmi.c#L2150

Maxime

--lgtwqetat5bqpk6j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZaVPeAAKCRDj7w1vZxhR
xUqfAP42KmlQNAjS8Gd15wm3o/xPVLwxKq3Mj9o3uDndMr8fFQEAwaAUHG90t28G
n7PjI68jJ9C8mdG1vseKHs+IcWYeWwU=
=KfLJ
-----END PGP SIGNATURE-----

--lgtwqetat5bqpk6j--
