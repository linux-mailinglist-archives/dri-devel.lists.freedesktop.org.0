Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AB139D634
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 09:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D2E6E4B3;
	Mon,  7 Jun 2021 07:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123DD6E4B3;
 Mon,  7 Jun 2021 07:40:42 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6B764580834;
 Mon,  7 Jun 2021 03:40:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 07 Jun 2021 03:40:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=nq7E0TCtn3bqp2hAkNThKCjEhjj
 Q30HBjKbfLIDNz5Q=; b=N/ZMqksN9XtxE/zJBMhC868H5VHJCkn7LmMr7eq/too
 7YeVQXt7Sj6RYkCXVZEQmQ+PHp8vohwiZFne4Oa43g7mxWREK+3nFfL0SnHJ5O9l
 J3ebdpU/jIzTET+t6g6gIE2Z6FgysWb2R8OaRly8s3JdUOBqupfgFjflsDTZQua4
 5Y1KZjn81/Rudk4sP76huOdp/fprF36mB4jUwGOPF0qehioDUHyYmhPiflvJfbME
 /gr45G3tZXBgTtZjajE1EuBKzjfOMsnfneBstMDb0cWtp7KcpzC+TZkhHaRgie++
 8su2NmckIhH9ROJ/U6kvRg+fDVGQGNTbA36QG3sLQZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=nq7E0T
 Ctn3bqp2hAkNThKCjEhjjQ30HBjKbfLIDNz5Q=; b=A5eVwM3/pJF3UwKbBWJngX
 uJbXb7+LWwiBgcpfBHvD5c6Vgs7R3N9ExoVud1JlS9oh2lMw0svAXfXqhxjtNaFz
 Km2A4cdfeZZvoVyACo9GpY3lXs7jSyCPbEs4hUv4nVB0Q0aR+cWAc4+zwYk5HeQj
 OF8tEw4WsllUT40R4KCkzWcEzXaWNvjtnp17ib8R0Va/Gdpe9Ju13L4Qj6ksFuZd
 wApHljX+ID3LXqLa6munYuj8YdJb7zypXZmykfijHI5dk+VeXxhD4HGVOSd3IbRH
 dPCoYCGMM0KjpVoX8h/4viT2nyRImpySoqiYqqGUp2RmepGOFtcVv2B8UdAXAGRw
 ==
X-ME-Sender: <xms:d829YBymgtLXAL7zDrNKq18v27CKcD83QgboMqrvm3Dr8ThFEOn34g>
 <xme:d829YBT-o7Q-KInpV-NISiudGEr-49TLRFKK54U5UDFlOwWPOCd0k-4LjT78gxmFv
 FLNHdpFnu2Avk7HX9A>
X-ME-Received: <xmr:d829YLV-6cnlIfc_qvqYkMYG48Edyqqa_kWzDnJHgAUxs5GxNu7ju-E_FAs0gppgm8uXh3EnvxCFgHOwV0LRTOF95k26MxWlN0Gb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtiedguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleff
 gfejvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:d829YDj9AMoTlsTXrX4mEaFT9pm33fKEufhEtZuTXhCNjXNqmfgfiQ>
 <xmx:d829YDDlzyF-N8z0-v6VS7SO3yoTeO24z_8LVE2ssi4FWrPleqqzYg>
 <xmx:d829YMJRlJZ3Y1f-hj9UbQad9alHi42v7QAPTgxvAG24Z4moTS6GmA>
 <xmx:ec29YLbAYjQfUquabT22JxVb-WZU7-TI6Pg6pVqEWsGUnmNuDSxk6Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jun 2021 03:40:38 -0400 (EDT)
Date: Mon, 7 Jun 2021 09:40:37 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH 2/4] drm/uAPI: Add "active bpc" as feedback channel for
 "max bpc" drm property
Message-ID: <20210607074037.oxm7qbhcx7gsg6yd@gilmour>
References: <20210604171723.10276-1-wse@tuxedocomputers.com>
 <20210604171723.10276-3-wse@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="p3wy26msisgyobg2"
Content-Disposition: inline
In-Reply-To: <20210604171723.10276-3-wse@tuxedocomputers.com>
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
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org, sunpeng.li@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 airlied@linux.ie, amd-gfx@lists.freedesktop.org, rodrigo.vivi@intel.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--p3wy26msisgyobg2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 04, 2021 at 07:17:21PM +0200, Werner Sembach wrote:
> Add a new general drm property "active bpc" which can be used by graphic =
drivers
> to report the applied bit depth per pixel back to userspace.

Just a heads up, we'll need an open source project that has accepted it
before merging it.

See https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#open-source-us=
erspace-requirements

> While "max bpc" can be used to change the color depth, there was no way t=
o check
> which one actually got used. While in theory the driver chooses the best/=
highest
> color depth within the max bpc setting a user might not be fully aware wh=
at his
> hardware is or isn't capable off. This is meant as a quick way to double =
check
> the setup.
>=20
> In the future, automatic color calibration for screens might also depend =
on this
> information available.
>=20
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c |  2 ++
>  drivers/gpu/drm/drm_connector.c   | 40 +++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h       | 15 ++++++++++++
>  3 files changed, 57 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index 268bb69c2e2f..7ae4e40936b5 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -873,6 +873,8 @@ drm_atomic_connector_get_property(struct drm_connecto=
r *connector,
>  		*val =3D 0;
>  	} else if (property =3D=3D connector->max_bpc_property) {
>  		*val =3D state->max_requested_bpc;
> +	} else if (property =3D=3D connector->active_bpc_property) {
> +		*val =3D state->active_bpc;
>  	} else if (connector->funcs->atomic_get_property) {
>  		return connector->funcs->atomic_get_property(connector,
>  				state, property, val);
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 7631f76e7f34..5f42a5be5822 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1195,6 +1195,13 @@ static const struct drm_prop_enum_list dp_colorspa=
ces[] =3D {
>   *	drm_connector_attach_max_bpc_property() to create and attach the
>   *	property to the connector during initialization.
>   *
> + * active bpc:
> + *	This read-only range property is used by userspace check the bit depth
> + *	actually applied by the GPU driver after evaluation all hardware

                                ^ display

Depending on the system, the display component might have a GPU attached
or not, and the GPU might have a display component or not.

> + *	capabilities and max bpc. Drivers to use the function
> + *	drm_connector_attach_active_bpc_property() to create and attach the
> + *	property to the connector during initialization.
> + *
>   * Connectors also have one standardized atomic property:
>   *
>   * CRTC_ID:
> @@ -2150,6 +2157,39 @@ int drm_connector_attach_max_bpc_property(struct d=
rm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_connector_attach_max_bpc_property);
> =20
> +/**
> + * drm_connector_attach_active_bpc_property - attach "active bpc" proper=
ty
> + * @connector: connector to attach active bpc property on.
> + * @min: The minimum bit depth supported by the connector.
> + * @max: The maximum bit depth supported by the connector.
> + *
> + * This is used to check the applied bit depth on a connector.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_connector_attach_active_bpc_property(struct drm_connector *conne=
ctor,
> +					  int min, int max)
> +{
> +	struct drm_device *dev =3D connector->dev;
> +	struct drm_property *prop;
> +
> +	prop =3D connector->active_bpc_property;
> +	if (!prop) {
> +		prop =3D drm_property_create_range(dev, 0, "active bpc", min, max);
> +		if (!prop)
> +			return -ENOMEM;
> +
> +		connector->active_bpc_property =3D prop;
> +	}
> +
> +	drm_object_attach_property(&connector->base, prop, 0);
> +	connector->state->active_bpc =3D 0;

I guess we want to default to 8?

Maxime

--p3wy26msisgyobg2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYL3NdQAKCRDj7w1vZxhR
xW9iAQCqBVy+34/6/7fZGJk9fSwKmxPEOrt3Z64pKzVhYa+2XQEAxB7WeGQsnb8V
xKwe4pgJJQ+NMocJbxmxYRV5QZGhYAQ=
=O0Ys
-----END PGP SIGNATURE-----

--p3wy26msisgyobg2--
