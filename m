Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E962D1317
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 15:07:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0298F6E851;
	Mon,  7 Dec 2020 14:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDFC6E84C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 14:07:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 075D2ABE9;
 Mon,  7 Dec 2020 14:07:44 +0000 (UTC)
Subject: Re: [PATCH v4 4/8] drm/vc4: hdmi: Create a custom connector state
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>
References: <20201207133948.2109194-1-maxime@cerno.tech>
 <20201207133948.2109194-5-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <44d7142b-37f0-39f0-4e4e-a0934eb71dc9@suse.de>
Date: Mon, 7 Dec 2020 15:07:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201207133948.2109194-5-maxime@cerno.tech>
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
Cc: linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: multipart/mixed; boundary="===============2102773846=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2102773846==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="doIXx6N55a2SIUCHJdCqev5tZ1pWclCYl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--doIXx6N55a2SIUCHJdCqev5tZ1pWclCYl
Content-Type: multipart/mixed; boundary="S7hDljSzjcxVdU8J3bz2IzoBdWvYe7ob2";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>
Cc: bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Message-ID: <44d7142b-37f0-39f0-4e4e-a0934eb71dc9@suse.de>
Subject: Re: [PATCH v4 4/8] drm/vc4: hdmi: Create a custom connector state
References: <20201207133948.2109194-1-maxime@cerno.tech>
 <20201207133948.2109194-5-maxime@cerno.tech>
In-Reply-To: <20201207133948.2109194-5-maxime@cerno.tech>

--S7hDljSzjcxVdU8J3bz2IzoBdWvYe7ob2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 07.12.20 um 14:39 schrieb Maxime Ripard:
> When run with a higher bpc than 8, the clock of the HDMI controller nee=
ds
> to be adjusted. Let's create a connector state that will be used at
> atomic_check and atomic_enable to compute and store the clock rate
> associated to the state.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 27 +++++++++++++++++++++++++--
>   drivers/gpu/drm/vc4/vc4_hdmi.h | 10 ++++++++++
>   2 files changed, 35 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> index 112c09873eb4..862c93708e9a 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -170,18 +170,41 @@ static int vc4_hdmi_connector_get_modes(struct dr=
m_connector *connector)
>  =20
>   static void vc4_hdmi_connector_reset(struct drm_connector *connector)=

>   {
> -	drm_atomic_helper_connector_reset(connector);
> +	struct vc4_hdmi_connector_state *conn_state =3D kzalloc(sizeof(*conn_=
state), GFP_KERNEL);
> +
> +	if (connector->state)
> +		__drm_atomic_helper_connector_destroy_state(connector->state);
> +
> +	kfree(connector->state);
> +
> +	__drm_atomic_helper_connector_reset(connector, &conn_state->base);
>  =20
>   	if (connector->state)
>   		drm_atomic_helper_connector_tv_reset(connector);
>   }
>  =20
> +static struct drm_connector_state *
> +vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
> +{
> +	struct drm_connector_state *conn_state =3D connector->state;
> +	struct vc4_hdmi_connector_state *vc4_state =3D conn_state_to_vc4_hdmi=
_conn_state(conn_state);
> +	struct vc4_hdmi_connector_state *new_state;
> +
> +	new_state =3D kzalloc(sizeof(*new_state), GFP_KERNEL);
> +	if (!new_state)
> +		return NULL;
> +
> +	__drm_atomic_helper_connector_duplicate_state(connector, &new_state->=
base);
> +
> +	return &new_state->base;
> +}
> +
>   static const struct drm_connector_funcs vc4_hdmi_connector_funcs =3D =
{
>   	.detect =3D vc4_hdmi_connector_detect,
>   	.fill_modes =3D drm_helper_probe_single_connector_modes,
>   	.destroy =3D vc4_hdmi_connector_destroy,
>   	.reset =3D vc4_hdmi_connector_reset,
> -	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_sta=
te,
> +	.atomic_duplicate_state =3D vc4_hdmi_connector_duplicate_state,
>   	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,=

>   };
>  =20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_h=
dmi.h
> index 0526a9cf608a..2cf5362052e2 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -180,6 +180,16 @@ encoder_to_vc4_hdmi(struct drm_encoder *encoder)
>   	return container_of(_encoder, struct vc4_hdmi, encoder);
>   }
>  =20
> +struct vc4_hdmi_connector_state {
> +	struct drm_connector_state	base;
> +};
> +
> +static inline struct vc4_hdmi_connector_state *
> +conn_state_to_vc4_hdmi_conn_state(struct drm_connector_state *conn_sta=
te)
> +{
> +	return container_of(conn_state, struct vc4_hdmi_connector_state, base=
);
> +}
> +
>   void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
>   		       struct drm_display_mode *mode);
>   void vc4_hdmi_phy_disable(struct vc4_hdmi *vc4_hdmi);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--S7hDljSzjcxVdU8J3bz2IzoBdWvYe7ob2--

--doIXx6N55a2SIUCHJdCqev5tZ1pWclCYl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/ONy4FAwAAAAAACgkQlh/E3EQov+DI
rA//d9SUoFa/wVAk2m4muvVfjeLZnUx8qOxnnaEDcSq1Lt6K9x89eBIYb1Khm3zhDcvPNyxx68AM
GrOt2HpQ3Rb05Aa9NnLtKEq4AdDhaGckqCNXzbD3ufZbYAwQiHOGlBm1BnZF1SgZ/Sv86id/EmOX
xiPa1h2cvQuQWD9P7L2AOT1f1w9brT+lg2z2Grhuw2ZagOIMj0nMXrlypA9WW2F6MxrkzLqJKpZ7
zxLR3HHL0fKORY/WiiQ/3nlM2bmtphOPZGkCXes7XfqsPjrkIB7iwlO0GejY1kbtkbnq2rLMQaoc
LzshhpIZinz19DwPHZJMdU5ePmyz6MVkPQRvf2SwR5iey+4Epwd/hskxuFbOEExflDfVMp/UB8+z
I5V0Bkq6F4GI5su7N9WHbYw60v+vIU0CL9uEVUiIuAplBNNqFYsulP7W6vbZA7PP3QA9HzQf7Kvm
yUcAFl15/H2sF1bI9lJkSqXqwa3YJpiLjP9LAptLGSL+XFqT2i8zFJ82ATTKGPhqkeqcrvVsCS0w
V7f0Y6zR/JH+8ROnerixefwaO+zycYD6ysTYYI3FZYmh1r7W76G7ctXzqkDjbu4EM1TpSgk/jwqR
RayMOjXTXs+rvUL+wejpPyl39oAwX2eEb2NpLqZGYFsnvAz46hhHp+6b8UXWAbynKe6gT++n9bs+
MaI=
=9uOJ
-----END PGP SIGNATURE-----

--doIXx6N55a2SIUCHJdCqev5tZ1pWclCYl--

--===============2102773846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2102773846==--
