Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9BE2D1310
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 15:05:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E24089CAD;
	Mon,  7 Dec 2020 14:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E67E989CAD
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 14:05:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 599BFAC2E;
 Mon,  7 Dec 2020 14:05:20 +0000 (UTC)
Subject: Re: [PATCH v4 3/8] drm/vc4: hdmi: Don't access the connector state in
 reset if kmalloc fails
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>
References: <20201207133948.2109194-1-maxime@cerno.tech>
 <20201207133948.2109194-4-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <2c7cdcfc-7bc0-e941-034f-10b298ca9c14@suse.de>
Date: Mon, 7 Dec 2020 15:05:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201207133948.2109194-4-maxime@cerno.tech>
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
Content-Type: multipart/mixed; boundary="===============0265692309=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0265692309==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FjQhJwyrpKOXIxGu0t1c4cSr2Xhly1RCd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FjQhJwyrpKOXIxGu0t1c4cSr2Xhly1RCd
Content-Type: multipart/mixed; boundary="fIf0OgOcZ01huTWoQQ9Z2HsWV86X6S2fY";
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
Message-ID: <2c7cdcfc-7bc0-e941-034f-10b298ca9c14@suse.de>
Subject: Re: [PATCH v4 3/8] drm/vc4: hdmi: Don't access the connector state in
 reset if kmalloc fails
References: <20201207133948.2109194-1-maxime@cerno.tech>
 <20201207133948.2109194-4-maxime@cerno.tech>
In-Reply-To: <20201207133948.2109194-4-maxime@cerno.tech>

--fIf0OgOcZ01huTWoQQ9Z2HsWV86X6S2fY
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 07.12.20 um 14:39 schrieb Maxime Ripard:
> drm_atomic_helper_connector_reset uses kmalloc which, from an API
> standpoint, can fail, and thus setting connector->state to NULL.
> However, our reset hook then calls drm_atomic_helper_connector_tv_reset=

> that will access connector->state without checking if it's a valid
> pointer or not.
>=20
> Make sure we don't end up accessing a NULL pointer.
>=20
> Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> index 5a608ed1d75e..112c09873eb4 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -171,7 +171,9 @@ static int vc4_hdmi_connector_get_modes(struct drm_=
connector *connector)
>   static void vc4_hdmi_connector_reset(struct drm_connector *connector)=

>   {
>   	drm_atomic_helper_connector_reset(connector);
> -	drm_atomic_helper_connector_tv_reset(connector);
> +
> +	if (connector->state)
> +		drm_atomic_helper_connector_tv_reset(connector);
>   }
>  =20
>   static const struct drm_connector_funcs vc4_hdmi_connector_funcs =3D =
{
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--fIf0OgOcZ01huTWoQQ9Z2HsWV86X6S2fY--

--FjQhJwyrpKOXIxGu0t1c4cSr2Xhly1RCd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/ONp4FAwAAAAAACgkQlh/E3EQov+Cc
BQ/6A9EpfbOs6SugtiBkYhem9kVa9mx1/Xarlrv7ARyfv1VKYKT63SDRDjKOuspoFhGEqaw3QeVQ
t9tgGn/4bLKEeNyri1CKcIv0Zf6q3WBZtvQltAqIobGFqAkkrChJUWseK9ufyFsEOpIZYJo595t6
cHKfoM8reOCpj1lwwOdHnVsUwQ0IpLs2ySax7yA1yO/0JEANtkSVFsxBmGVuoLgrzJPK7jd2kr3t
jSJiVXCCTcf9A4esc6VPYyCXWF/tlhd0uoVgZYWTvUeRyPfwpECF63zFBxE4tUQZMf0IIJ8qzg0E
znJgi/bU9zUslmuAoDDe3E4ABPLiYElfqtwYnGwUjdtZV1LFX52Pv7Z0hakBstgrkUaDt3PqVchx
H4pqH7Dcbc98AvXP+y26L3BmLg5ABUY/ZOhOWFdp8Ta/PYOJRp+ZNpw8tcg/2ZzYPSGOx2+C0Tn7
WV+izF0Agiiah33oyDjtDVRuwvICyYgle9CHppBXRNVa3J3ThuJT6Swb00wTu5A2u9JdmKEzIC1U
Pw3mfQR4bVIo3Xw/2OOcLz+smB2JNEQahleU9qB7/vmc7EarIecT+iVB1F9N/0YNYRxnwZXplHHW
CCM6YvIk/K1/by1r98ORHMLaKm40d6ObrxhBlxc3y78dJNCvxHXZiFZqShKOf58s5ZE55xwMjzfb
R50=
=Z0RS
-----END PGP SIGNATURE-----

--FjQhJwyrpKOXIxGu0t1c4cSr2Xhly1RCd--

--===============0265692309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0265692309==--
