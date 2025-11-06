Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC36C3982B
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 09:07:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E08A10E0CE;
	Thu,  6 Nov 2025 08:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="E/FEzFWi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362CC10E0CE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 08:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762416416;
 bh=tr1G+VWRYuBC5IjdwOnr+XRWUFsTJ465yqlfIiaMkHU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E/FEzFWigsAhM1YScuJit2Id1ewY9ZI5kQiwDnNMp0YZ/x7FCl/KQrtLAPUOFC1pU
 soedzZc3bB0Vr6CEfqCGoqJeuV1fhg/3GoSzcsSPImXJHa10q+OA3YPICBI8yW/S4P
 e3iTPie4ae4CXzjvARmcNTow9GmCEVf3QNHdSkJisaj3gAoFGGzSpQSSRmroFJ8iUF
 FrXGGMIryqM/ITPwBB5CHNMlIpWSXE7bom8e2RaUX835FQsnn32zdyBicuoUKoRxQz
 zERFnjx5KTzGoVQIelWusiSnIceGkgriHHoq+945dcoL+cdp9Ze5K3GX+GbugEWhnj
 feKeeQ7CkbTZQ==
Received: from xpredator (unknown
 [IPv6:2a02:2f08:e41c:5800:e88e:21ff:fe65:be18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5093117E0E63;
 Thu,  6 Nov 2025 09:06:56 +0100 (CET)
Date: Thu, 6 Nov 2025 10:06:55 +0200
From: Marius Vlad <marius.vlad@collabora.com>
To: Sasha McIntosh <sashamcintosh@google.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 trivial@kernel.org
Subject: Re: [PATCH] drm: Add "min bpc" connector property
Message-ID: <aQxXH7pfXDE0IB2s@xpredator>
References: <20251031204534.659180-1-sashamcintosh@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="l0vKe+PdZ5D1ZPAp"
Content-Disposition: inline
In-Reply-To: <20251031204534.659180-1-sashamcintosh@google.com>
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


--l0vKe+PdZ5D1ZPAp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,
On Fri, Oct 31, 2025 at 04:45:34PM -0400, Sasha McIntosh wrote:
> [Why]
> When playing HDR or WCG content, bandwidth constraints may force the
> driver to downgrade to 6bpc, resulting in visual artifacts like banding.
Bit confused by this. How exactly would they reach 6bpc? The lower limit
seems to be 8 [1].
>=20
> Userspace should be able to configure a minimum allowed bpc.
>=20
> [How]
> Introduce the "min bpc" connector property so the user can limit the
> minimum bpc. Mirror the "mac bpc" implementation.

[1] https://elixir.bootlin.com/linux/v6.18-rc4/source/drivers/gpu/drm/displ=
ay/drm_hdmi_state_helper.c#L620
>=20
> Signed-off-by: Sasha McIntosh <sashamcintosh@google.com>
> ---
>  drivers/gpu/drm/drm_atomic.c        | 12 +++++++++
>  drivers/gpu/drm/drm_atomic_helper.c |  4 +++
>  drivers/gpu/drm/drm_atomic_uapi.c   |  4 +++
>  drivers/gpu/drm/drm_connector.c     | 41 +++++++++++++++++++++++++++++
>  include/drm/drm_connector.h         | 20 ++++++++++++++
>  5 files changed, 81 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index be2cb6e43cb0..f85ad9c55e69 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -468,6 +468,17 @@ static int drm_atomic_connector_check(struct drm_con=
nector *connector,
>  	state->max_bpc =3D info->bpc ? info->bpc : 8;
>  	if (connector->max_bpc_property)
>  		state->max_bpc =3D min(state->max_bpc, state->max_requested_bpc);
> +	if (connector->min_bpc_property)
> +		state->min_bpc =3D state->min_requested_bpc;
> +	if (connector->max_bpc_property && connector->min_bpc_property &&
> +	    state->max_requested_bpc < state->min_requested_bpc) {
> +		drm_dbg_atomic(connector->dev,
> +			       "[CONNECTOR:%d:%s] max bpc %d < min bpc %d\n",
> +			       connector->base.id, connector->name,
> +			       state->max_requested_bpc,
> +			       state->min_requested_bpc);
> +		return -EINVAL;
> +	}
> =20
>  	if ((connector->connector_type !=3D DRM_MODE_CONNECTOR_WRITEBACK) || !w=
riteback_job)
>  		return 0;
> @@ -1195,6 +1206,7 @@ static void drm_atomic_connector_print_state(struct=
 drm_printer *p,
>  	drm_printf(p, "\tinterlace_allowed=3D%d\n", connector->interlace_allowe=
d);
>  	drm_printf(p, "\tycbcr_420_allowed=3D%d\n", connector->ycbcr_420_allowe=
d);
>  	drm_printf(p, "\tmax_requested_bpc=3D%d\n", state->max_requested_bpc);
> +	drm_printf(p, "\tmin_requested_bpc=3D%d\n", state->min_requested_bpc);
>  	drm_printf(p, "\tcolorspace=3D%s\n", drm_get_colorspace_name(state->col=
orspace));
> =20
>  	if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA ||
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c
> index 5a473a274ff0..75659d46c6fe 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -736,6 +736,10 @@ drm_atomic_helper_check_modeset(struct drm_device *d=
ev,
>  			if (old_connector_state->max_requested_bpc !=3D
>  			    new_connector_state->max_requested_bpc)
>  				new_crtc_state->connectors_changed =3D true;
> +
> +			if (old_connector_state->min_requested_bpc !=3D
> +			    new_connector_state->min_requested_bpc)
> +				new_crtc_state->connectors_changed =3D true;
>  		}
> =20
>  		if (funcs->atomic_check)
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index 85dbdaa4a2e2..f99649f9c51f 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -776,6 +776,8 @@ static int drm_atomic_connector_set_property(struct d=
rm_connector *connector,
>  						   fence_ptr);
>  	} else if (property =3D=3D connector->max_bpc_property) {
>  		state->max_requested_bpc =3D val;
> +	} else if (property =3D=3D connector->min_bpc_property) {
> +		state->min_requested_bpc =3D val;
>  	} else if (property =3D=3D connector->privacy_screen_sw_state_property)=
 {
>  		state->privacy_screen_sw_state =3D val;
>  	} else if (property =3D=3D connector->broadcast_rgb_property) {
> @@ -861,6 +863,8 @@ drm_atomic_connector_get_property(struct drm_connecto=
r *connector,
>  		*val =3D 0;
>  	} else if (property =3D=3D connector->max_bpc_property) {
>  		*val =3D state->max_requested_bpc;
> +	} else if (property =3D=3D connector->min_bpc_property) {
> +		*val =3D state->min_requested_bpc;
>  	} else if (property =3D=3D connector->privacy_screen_sw_state_property)=
 {
>  		*val =3D state->privacy_screen_sw_state;
>  	} else if (property =3D=3D connector->broadcast_rgb_property) {
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 272d6254ea47..2d9cfd4f5118 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1699,6 +1699,13 @@ EXPORT_SYMBOL(drm_hdmi_connector_get_output_format=
_name);
>   *	drm_connector_attach_max_bpc_property() to create and attach the
>   *	property to the connector during initialization.
>   *
> + * min bpc:
> + *	This range property is used by userspace to set a lower bound for the=
 bit
> + *	depth. When used the driver would set the bpc in accordance with the
> + *	valid range supported by the hardware and sink. Drivers to use the fu=
nction
> + *	drm_connector_attach_min_bpc_property() to create and attach the
> + *	property to the connector during initialization.
> + *
>   * Connectors also have one standardized atomic property:
>   *
>   * CRTC_ID:
> @@ -2845,6 +2852,40 @@ int drm_connector_attach_max_bpc_property(struct d=
rm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_connector_attach_max_bpc_property);
> =20
> +/**
> + * drm_connector_attach_min_bpc_property - attach "min bpc" property
> + * @connector: connector to attach min bpc property on.
> + * @min: The minimum bit depth supported by the connector.
> + * @max: The maximum bit depth supported by the connector.
> + *
> + * This is used to add support for limiting the bit depth on a connector.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_connector_attach_min_bpc_property(struct drm_connector *connecto=
r,
> +					  int min, int max)
> +{
> +	struct drm_device *dev =3D connector->dev;
> +	struct drm_property *prop;
> +
> +	prop =3D connector->min_bpc_property;
> +	if (!prop) {
> +		prop =3D drm_property_create_range(dev, 0, "min bpc", min, max);
> +		if (!prop)
> +			return -ENOMEM;
> +
> +		connector->min_bpc_property =3D prop;
> +	}
> +
> +	drm_object_attach_property(&connector->base, prop, min);
> +	connector->state->min_requested_bpc =3D min;
> +	connector->state->min_bpc =3D min;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_attach_min_bpc_property);
> +
>  /**
>   * drm_connector_attach_hdr_output_metadata_property - attach "HDR_OUTPU=
T_METADA" property
>   * @connector: connector to attach the property on.
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 8f34f4b8183d..7581f965b015 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1126,12 +1126,24 @@ struct drm_connector_state {
>  	 */
>  	u8 max_requested_bpc;
> =20
> +	/**
> +	 * @min_requested_bpc: Connector property to limit the minimum bit
> +	 * depth of the pixels.
> +	 */
> +	u8 min_requested_bpc;
> +
>  	/**
>  	 * @max_bpc: Connector max_bpc based on the requested max_bpc property
>  	 * and the connector bpc limitations obtained from edid.
>  	 */
>  	u8 max_bpc;
> =20
> +	/**
> +	 * @min_bpc: Connector min_bpc based on the requested min_bpc property
> +	 * and the connector bpc limitations obtained from edid.
> +	 */
> +	u8 min_bpc;
> +
>  	/**
>  	 * @privacy_screen_sw_state: See :ref:`Standard Connector
>  	 * Properties<standard_connector_properties>`
> @@ -2079,6 +2091,12 @@ struct drm_connector {
>  	 */
>  	struct drm_property *max_bpc_property;
> =20
> +	/**
> +	 * @min_bpc_property: Default connector property for the min bpc to be
> +	 * driven out of the connector.
> +	 */
> +	struct drm_property *min_bpc_property;
> +
>  	/** @privacy_screen: drm_privacy_screen for this connector, or NULL. */
>  	struct drm_privacy_screen *privacy_screen;
> =20
> @@ -2482,6 +2500,8 @@ int drm_connector_set_orientation_from_panel(
>  	struct drm_panel *panel);
>  int drm_connector_attach_max_bpc_property(struct drm_connector *connecto=
r,
>  					  int min, int max);
> +int drm_connector_attach_min_bpc_property(struct drm_connector *connecto=
r,
> +					  int min, int max);
>  void drm_connector_create_privacy_screen_properties(struct drm_connector=
 *conn);
>  void drm_connector_attach_privacy_screen_properties(struct drm_connector=
 *conn);
>  void drm_connector_attach_privacy_screen_provider(
>=20
> base-commit: 098456f3141bf9e0c0d8973695ca38a03465ccd6
> --=20
> 2.51.1.851.g4ebd6896fd-goog
>=20

--l0vKe+PdZ5D1ZPAp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAmkMVxwACgkQ9jQS5glH
1u+Vcw//Wjz1OmsjjmF/4WwgqKP8NuVKBjuhgIIZ3xdQ995pGB/6zhbNCMXHrzQN
nsOx/UMe8gk4/L0cpT/CeKz9Dxg87HJIXEb5OcjQPLmHMY5FS20BJnAnHHMUQ9Nm
SBEupafh+ACY7hRmdQcaFb0fBNhH6CegRQAnszOJkhw4HQ5Evv14/Ae9wRB/RhYO
sHmNtI2Wyv3+Kh6zI7gXrsMFqqDOpzxRS7toluJANRNrIG6UgvLdsc4sD5rU40Wl
9exy6vEFLpe4MkbxWOjYRonvLJ0yuy5MWnCEZUqaRsQmVnpFrs8fIGJMoBaESHIu
LhQJuJ+6lSB8NqdJVnOeppnVBf41RyEttehB1VOXqZONqFZuBnx3FpDV8Z0rZ+0S
mdJKuyJEj4WjXVgn6Xh5EHEifebWdif7hXq0Ukh2ti5RxkkY2YrC3zJknByXMoLE
XJwU/4sMlFxrCYfLDaZLid3kkeaAmJ7tWTk8REBmLl2Dv9PBk4R5M+Zih4ZtU52I
ofPf9dr1YBX04yebT0VQ9MNN4W8E8JboDXtVYUha3kGvclNCdmr7LWpqvmlgUXRw
5dDzcH62nTItmbdIVZ1oMUbCPHNRt77uG8cXAY5Bx+THy5wi5awPzJBmSz8PIQDj
p7RiSjDmHs7ymiP7J0jICYCwn5v9YW6Wt706bZQvyjqSiXaWjkA=
=4DrU
-----END PGP SIGNATURE-----

--l0vKe+PdZ5D1ZPAp--
