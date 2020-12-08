Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD692D2500
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 08:54:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038326E94C;
	Tue,  8 Dec 2020 07:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045A16E94C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 07:54:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 97AB7AC9A;
 Tue,  8 Dec 2020 07:54:08 +0000 (UTC)
Subject: Re: [PATCH v5 3/9] drm/vc4: hdmi: Take into account the clock
 doubling flag in atomic_check
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20201207155719.17149-1-maxime@cerno.tech>
 <20201207155719.17149-4-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <3142865d-e3c0-686e-5bb0-865d722b770e@suse.de>
Date: Tue, 8 Dec 2020 08:54:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201207155719.17149-4-maxime@cerno.tech>
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
Cc: linux-rpi-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: multipart/mixed; boundary="===============1024176321=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1024176321==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="e2iJc3jLZ3Pvn7SYbmATfcXNjAF26pTtX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--e2iJc3jLZ3Pvn7SYbmATfcXNjAF26pTtX
Content-Type: multipart/mixed; boundary="YZPhFobXpsc2amL0yTpwq2G1083ckYe6Z";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Message-ID: <3142865d-e3c0-686e-5bb0-865d722b770e@suse.de>
Subject: Re: [PATCH v5 3/9] drm/vc4: hdmi: Take into account the clock
 doubling flag in atomic_check
References: <20201207155719.17149-1-maxime@cerno.tech>
 <20201207155719.17149-4-maxime@cerno.tech>
In-Reply-To: <20201207155719.17149-4-maxime@cerno.tech>

--YZPhFobXpsc2amL0yTpwq2G1083ckYe6Z
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 07.12.20 um 16:57 schrieb Maxime Ripard:
> Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 63495f6b4aed ("drm/vc4: hdmi: Make sure our clock rate is within=
 limits")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 3 +++
>   1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> index 5a608ed1d75e..a88aa20beeb6 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -796,6 +796,9 @@ static int vc4_hdmi_encoder_atomic_check(struct drm=
_encoder *encoder,
>   		pixel_rate =3D mode->clock * 1000;
>   	}
>  =20
> +	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> +		pixel_rate =3D pixel_rate * 2;
> +
>   	if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
>   		return -EINVAL;
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--YZPhFobXpsc2amL0yTpwq2G1083ckYe6Z--

--e2iJc3jLZ3Pvn7SYbmATfcXNjAF26pTtX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/PMR8FAwAAAAAACgkQlh/E3EQov+Ao
VxAAvMZkXw4wiqgYEOqFTHz5HdQmbhBRoAXPWdxoVorJ9ilXYae8vTQ6sX8xJvHuxNXJv7I0P+zi
bmcCyy3olQQ5byPOjZHDI3JJw2rs8xm4eLyYSaFpfG6sbnFvDI6wUv7Stc/XXS/+Uo3Y/Bkd9kfg
LRFaYOavS48jgVF9VJyB3gyK8xLvMz/9zMQ7X/V3usix2BJw64H5upksJf4KNir+XeaUr52215tA
xlrGjDMxIdibzhHiJPf6FTL02TkP64oF6x93PlXhXA9j61ROaFt2c99r0s8rY18PG4w3pr6VFoA7
lLHGjx4cwM1l7R7xogYyjEkGjGZKqjbgO5dHyPM5Y4d5HeDWQgS54VU9O7CHRAgGnFSVfcyx2hTS
JsCvKMpHjlgyznGJDs4LXow4AKfz5WTbAdmZAp+QcGQH5hnC/iXcK5EhxK7cXdW+IOAtGC4PhJQv
TeRX27uqe5SX+WnLWTLn1oObKg0HGyG8cz1s5pDe6OnU4ZQE+pVqUaLNnejrhZfB1ua6ZbgLG9fi
1l1ugtFKwbHRcsy1DvzJc21142rbFZjdNkIH0pU0TTwAL5Xu5GwmG+o01v4aNohUHBW+nBuDz7Yy
pxi0T9IAJzeJ3rvUwo/BmttcOQ5WJH4kleHS4tZGlOjRDmFbWVB9pen6do604oBduMhnr9u2KNvJ
aEY=
=8zSR
-----END PGP SIGNATURE-----

--e2iJc3jLZ3Pvn7SYbmATfcXNjAF26pTtX--

--===============1024176321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1024176321==--
