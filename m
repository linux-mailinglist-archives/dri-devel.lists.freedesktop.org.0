Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F58382964D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 10:27:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1ED010E191;
	Wed, 10 Jan 2024 09:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6775110E17B;
 Wed, 10 Jan 2024 09:27:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B00BF615BA;
 Wed, 10 Jan 2024 09:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09FA2C433F1;
 Wed, 10 Jan 2024 09:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704878837;
 bh=nzNAaOqvaUL57D/V9epEYzVxZ7pYbWWXoeDDRRHs+/k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=juD6hpZRALBSBgsoKCWJmV0pVswWCkfgSB5gygZYm22wB6tFLF/GCnNhGjsnwkKdp
 pNVg/8oaNf172cQ4jZnmULRpAwB7yY7SpHQdeDgLRyfukjUp4YImdJiVITXeSb5RBj
 lv6R8hPinxo9nMfphpcDsx9UccrLhocX9H1bpJzIuJFkMlz6oFuIwq1yEtfkZR0kMa
 ksEy5xxZwq+mQg2B81zeC1VjRfTbPR0EMe2jyTC+HK4+ajT4zdWXPfZlkeH1+8y5Os
 lgYbczWKk3EemUbeDmQxeMvWKGlmxqP7evxQ16nsZ3xVSDEfzuzwu0sIVAtE6d5fTf
 T8fnq7PmuqINw==
Date: Wed, 10 Jan 2024 10:27:14 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Andri Yngvason <andri@yngvason.is>
Subject: Re: [PATCH 5/7] drm/uAPI: Add "preferred color format" drm property
 as setting for userspace
Message-ID: <qdwv7sagqs5nmmsy5lko5hypldanfodafyzamrs3loj3n7jzlr@n5bacxkknkj4>
References: <20240109181104.1670304-1-andri@yngvason.is>
 <20240109181104.1670304-6-andri@yngvason.is>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="f6j2j4rphibvcs2b"
Content-Disposition: inline
In-Reply-To: <20240109181104.1670304-6-andri@yngvason.is>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Werner Sembach <wse@tuxedocomputers.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--f6j2j4rphibvcs2b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jan 09, 2024 at 06:11:02PM +0000, Andri Yngvason wrote:
> From: Werner Sembach <wse@tuxedocomputers.com>
>=20
> Add a new general drm property "preferred color format" which can be used
> by userspace to tell the graphic drivers to which color format to use.
>=20
> Possible options are:
>     - auto (default/current behaviour)
>     - rgb
>     - ycbcr444
>     - ycbcr422 (not supported by both amdgpu and i915)
>     - ycbcr420
>=20
> In theory the auto option should choose the best available option for the
> current setup, but because of bad internal conversion some monitors look
> better with rgb and some with ycbcr444.

I looked at the patch and I couldn't find what is supposed to happen if
you set it to something else than auto, and the driver can't match that.
Are we supposed to fallback to the "auto" behaviour, or are we suppose
to reject the mode entirely?

The combination with the active output format property suggests the
former, but we should document it explicitly.

> Also, because of bad shielded connectors and/or cables, it might be
> preferable to use the less bandwidth heavy ycbcr422 and ycbcr420 formats
> for a signal that is less deceptible to interference.
>=20
> In the future, automatic color calibration for screens might also depend =
on
> this option being available.
>=20
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Andri Yngvason <andri@yngvason.is>
> Tested-by: Andri Yngvason <andri@yngvason.is>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c |  4 +++
>  drivers/gpu/drm/drm_atomic_uapi.c   |  4 +++
>  drivers/gpu/drm/drm_connector.c     | 50 ++++++++++++++++++++++++++++-
>  include/drm/drm_connector.h         | 17 ++++++++++
>  4 files changed, 74 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c
> index 68ffcc0b00dca..745a43d9c5da3 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -707,6 +707,10 @@ drm_atomic_helper_check_modeset(struct drm_device *d=
ev,
>  			if (old_connector_state->max_requested_bpc !=3D
>  			    new_connector_state->max_requested_bpc)
>  				new_crtc_state->connectors_changed =3D true;
> +
> +			if (old_connector_state->preferred_color_format !=3D
> +			    new_connector_state->preferred_color_format)
> +				new_crtc_state->connectors_changed =3D true;
>  		}
> =20
>  		if (funcs->atomic_check)
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index 98d3b10c08ae1..eba5dea1249e5 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -798,6 +798,8 @@ static int drm_atomic_connector_set_property(struct d=
rm_connector *connector,
>  		state->max_requested_bpc =3D val;
>  	} else if (property =3D=3D connector->privacy_screen_sw_state_property)=
 {
>  		state->privacy_screen_sw_state =3D val;
> +	} else if (property =3D=3D connector->preferred_color_format_property) {
> +		state->preferred_color_format =3D val;
>  	} else if (connector->funcs->atomic_set_property) {
>  		return connector->funcs->atomic_set_property(connector,
>  				state, property, val);
> @@ -881,6 +883,8 @@ drm_atomic_connector_get_property(struct drm_connecto=
r *connector,
>  		*val =3D state->max_requested_bpc;
>  	} else if (property =3D=3D connector->privacy_screen_sw_state_property)=
 {
>  		*val =3D state->privacy_screen_sw_state;
> +	} else if (property =3D=3D connector->preferred_color_format_property) {
> +		*val =3D state->preferred_color_format;
>  	} else if (connector->funcs->atomic_get_property) {
>  		return connector->funcs->atomic_get_property(connector,
>  				state, property, val);
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 30d62e505d188..4de48a38792cf 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1061,6 +1061,14 @@ static const struct drm_prop_enum_list drm_dp_subc=
onnector_enum_list[] =3D {
>  	{ DRM_MODE_SUBCONNECTOR_Native,	     "Native"    }, /* DP */
>  };
> =20
> +static const struct drm_prop_enum_list drm_preferred_color_format_enum_l=
ist[] =3D {
> +	{ 0, "auto" },
> +	{ DRM_COLOR_FORMAT_RGB444, "rgb" },
> +	{ DRM_COLOR_FORMAT_YCBCR444, "ycbcr444" },
> +	{ DRM_COLOR_FORMAT_YCBCR422, "ycbcr422" },
> +	{ DRM_COLOR_FORMAT_YCBCR420, "ycbcr420" },
> +};
> +
>  static const struct drm_prop_enum_list drm_active_color_format_enum_list=
[] =3D {
>  	{ 0, "not applicable" },
>  	{ DRM_COLOR_FORMAT_RGB444, "rgb" },
> @@ -1398,11 +1406,20 @@ static const u32 dp_colorspaces =3D
>   *	drm_connector_attach_max_bpc_property() to create and attach the
>   *	property to the connector during initialization.
>   *
> + * preferred color format:
> + *	This property is used by userspace to change the used color format. W=
hen
> + *	used the driver will use the selected format if valid for the hardwar=
e,
> + *	sink, and current resolution and refresh rate combination. Drivers to
> + *	use the function drm_connector_attach_preferred_color_format_property=
()
> + *	to create and attach the property to the connector during
> + *	initialization. Possible values are "auto", "rgb", "ycbcr444",
> + *	"ycbcr422", and "ycbcr420".
> + *
>   * active color format:
>   *	This read-only property tells userspace the color format actually used
>   *	by the hardware display engine "on the cable" on a connector. The cho=
sen
>   *	value depends on hardware capabilities, both display engine and
> - *	connected monitor. Drivers shall use
> + *	connected monitor, and the "preferred color format". Drivers shall use
>   *	drm_connector_attach_active_color_format_property() to install this
>   *	property. Possible values are "not applicable", "rgb", "ycbcr444",
>   *	"ycbcr422", and "ycbcr420".
> @@ -2468,6 +2485,37 @@ int drm_connector_attach_max_bpc_property(struct d=
rm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_connector_attach_max_bpc_property);
> =20
> +/**
> + * drm_connector_attach_preferred_color_format_property - attach "prefer=
red color format" property
> + * @connector: connector to attach preferred color format property on.
> + *
> + * This is used to add support for selecting a color format on a connect=
or.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_connector_attach_preferred_color_format_property(struct drm_conn=
ector *connector)
> +{
> +	struct drm_device *dev =3D connector->dev;
> +	struct drm_property *prop;
> +
> +	if (!connector->preferred_color_format_property) {
> +		prop =3D drm_property_create_enum(dev, 0, "preferred color format",
> +						drm_preferred_color_format_enum_list,
> +						ARRAY_SIZE(drm_preferred_color_format_enum_list));
> +		if (!prop)
> +			return -ENOMEM;
> +
> +		connector->preferred_color_format_property =3D prop;
> +	}
> +
> +	drm_object_attach_property(&connector->base, prop, 0);
> +	connector->state->preferred_color_format =3D 0;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_attach_preferred_color_format_property);
> +
>  /**
>   * drm_connector_attach_active_color_format_property - attach "active co=
lor format" property
>   * @connector: connector to attach active color format property on.
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 9ae73cfdceeb1..d7bc54c8b42cb 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1026,6 +1026,16 @@ struct drm_connector_state {
>  	 */
>  	enum drm_privacy_screen_status privacy_screen_sw_state;
> =20
> +	/**
> +	 * preferred_color_format: Property set by userspace to tell the GPU

That's not the proper doc format, you're missing a @

Maxime

--f6j2j4rphibvcs2b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZZ5i8QAKCRDj7w1vZxhR
xUKrAQC6+1rVAO7umPgfBq9P7nimTGhAG69n4i9MYMS1adFqoAD/T5SQ1Tsm9Ybw
vTELQXqv0M32Kqp1PKhW+w+WiQTzAQw=
=CrvP
-----END PGP SIGNATURE-----

--f6j2j4rphibvcs2b--
