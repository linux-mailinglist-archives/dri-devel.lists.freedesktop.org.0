Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDD435973D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 10:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC196EB90;
	Fri,  9 Apr 2021 08:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346526EB90
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 08:10:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A4B38AF2F;
 Fri,  9 Apr 2021 08:10:54 +0000 (UTC)
Subject: Re: [PATCH 05/18] drm/vc4: crtc: Skip the TXP
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-6-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <8398d74b-a97c-a14b-5d07-163a1a596eb4@suse.de>
Date: Fri, 9 Apr 2021 10:10:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210317154352.732095-6-maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: multipart/mixed; boundary="===============0453966161=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0453966161==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IdhpvPOQfQR9rU3sodSmaNBgx37kwDj1d"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IdhpvPOQfQR9rU3sodSmaNBgx37kwDj1d
Content-Type: multipart/mixed; boundary="606arO3ARwC75zCzvXZcSMXMwhWzegWvQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Message-ID: <8398d74b-a97c-a14b-5d07-163a1a596eb4@suse.de>
Subject: Re: [PATCH 05/18] drm/vc4: crtc: Skip the TXP
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-6-maxime@cerno.tech>
In-Reply-To: <20210317154352.732095-6-maxime@cerno.tech>

--606arO3ARwC75zCzvXZcSMXMwhWzegWvQ
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 17.03.21 um 16:43 schrieb Maxime Ripard:
> The vc4_set_crtc_possible_masks is meant to run over all the encoders
> and then set their possible_crtcs mask to their associated pixelvalve.
>=20
> However, since the commit 39fcb2808376 ("drm/vc4: txp: Turn the TXP int=
o
> a CRTC of its own"), the TXP has been turned to a CRTC and encoder of
> its own, and while it does indeed register an encoder, it no longer has=

> an associated pixelvalve. The code will thus run over the TXP encoder
> and set a bogus possible_crtcs mask, overriding the one set in the TXP
> bind function.
>=20
> In order to fix this, let's skip any virtual encoder.
>=20
> Fixes: 39fcb2808376 ("drm/vc4: txp: Turn the TXP into a CRTC of its own=
")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

dim fixes 39fcb2808376
Fixes: 39fcb2808376 ("drm/vc4: txp: Turn the TXP into a CRTC of its own")=

Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Eric Anholt <eric@anholt.net>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: <stable@vger.kernel.org> # v5.9+

At least the CC: stable line should be there.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/vc4/vc4_crtc.c | 3 +++
>   1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_c=
rtc.c
> index 269390bc586e..f1f2e8cbce79 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -1018,6 +1018,9 @@ static void vc4_set_crtc_possible_masks(struct dr=
m_device *drm,
>   		struct vc4_encoder *vc4_encoder;
>   		int i;
>  =20
> +		if (encoder->encoder_type =3D=3D DRM_MODE_ENCODER_VIRTUAL)
> +			continue;
> +
>   		vc4_encoder =3D to_vc4_encoder(encoder);
>   		for (i =3D 0; i < ARRAY_SIZE(pv_data->encoder_types); i++) {
>   			if (vc4_encoder->type =3D=3D encoder_types[i]) {
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--606arO3ARwC75zCzvXZcSMXMwhWzegWvQ--

--IdhpvPOQfQR9rU3sodSmaNBgx37kwDj1d
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBwDA0FAwAAAAAACgkQlh/E3EQov+Dc
ew//WprANTYpx2Kq/8zx+MIuxrA0fIfjQPFR+IY+tsPA/u7+/2QMyS49DJN5m4dvx+b6EKb3FlGB
eeu1xYYNCsFHl5OvUjs6mhEN6hmSZwmnEuZ41uxQKALrjtcteuV5m2RztlzmpGjtmZYES8GmOnEn
+E4u65XgS6Z1HU5zuAG38DLFSgynbrvsRB6LRj18EBDVHbiqIcVbsWq90771s/ZwJ69l/fspYseS
no1ieoXNxqp7GYT0zR7N6z6I7/sihcGXVYBSlhwOAMc0bIeTXuLM7KbI2TVTYJh6vCXqjYRwp4fL
Uq6LksMrtOSJgD1iGAZ4/sc0rT6sVn0tdheFE/UFP+QJnOMFwGvu1n7hWVHVLnIW9bcpx/YwMKEr
9tjotN5Y6fULq0ahGPLSl6vx2sEFv6c1q8heck3kgBoi2EpFVRzv9Q0rtaLVsPaU7g9QXvTz06fs
hlYqbRRySBBVHNUSJtMU7YDJAxg0WHgG5xaPBIDtoNKjNfwSMNUkGKS7hRgDSSstL6FqRLCNxCgQ
HhSPmUtIm9HHkdzp9KDH/I6mX7js4ELLocAtUboimrVuFr85NLcA4VuJC9jWHthzbxNMY7eLnkYf
Y31y0FhWeqqAbXCTgZMk9EOKfZn89ZYYfTCwQEQcnLuH6G3bHKueeRptj0ACCCcqXP8p+jgsN4NI
HSg=
=ah5C
-----END PGP SIGNATURE-----

--IdhpvPOQfQR9rU3sodSmaNBgx37kwDj1d--

--===============0453966161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0453966161==--
