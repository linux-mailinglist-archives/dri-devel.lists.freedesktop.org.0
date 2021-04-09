Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9D9359751
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 10:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F44B6EBA0;
	Fri,  9 Apr 2021 08:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2B66EBA6
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 08:11:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8FDD1B2EE;
 Fri,  9 Apr 2021 08:11:08 +0000 (UTC)
Subject: Re: [PATCH 04/18] drm/vc4: txp: Properly set the possible_crtcs mask
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-5-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <627b8c9e-8035-2f44-7c30-f2442b519588@suse.de>
Date: Fri, 9 Apr 2021 10:11:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210317154352.732095-5-maxime@cerno.tech>
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
Content-Type: multipart/mixed; boundary="===============0286818664=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0286818664==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="br7oyBrYeG0DeKL30WBEe2dQZoIgWEIdF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--br7oyBrYeG0DeKL30WBEe2dQZoIgWEIdF
Content-Type: multipart/mixed; boundary="67t6WmbipRqTJ2gzXtYG86Xilc89a781e";
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
Message-ID: <627b8c9e-8035-2f44-7c30-f2442b519588@suse.de>
Subject: Re: [PATCH 04/18] drm/vc4: txp: Properly set the possible_crtcs mask
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-5-maxime@cerno.tech>
In-Reply-To: <20210317154352.732095-5-maxime@cerno.tech>

--67t6WmbipRqTJ2gzXtYG86Xilc89a781e
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 17.03.21 um 16:43 schrieb Maxime Ripard:
> The current code does a binary or on the possible_crtcs variable of the=

> TXP encoder, while we want to set it to that value instead.
>=20
> Fixes: 39fcb2808376 ("drm/vc4: txp: Turn the TXP into a CRTC of its own=
")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Cc: <stable@vger.kernel.org> # v5.9+

> ---
>   drivers/gpu/drm/vc4/vc4_txp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_tx=
p.c
> index c0122d83b651..2fc7f4b5fa09 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -507,7 +507,7 @@ static int vc4_txp_bind(struct device *dev, struct =
device *master, void *data)
>   		return ret;
>  =20
>   	encoder =3D &txp->connector.encoder;
> -	encoder->possible_crtcs |=3D drm_crtc_mask(crtc);
> +	encoder->possible_crtcs =3D drm_crtc_mask(crtc);
>  =20
>   	ret =3D devm_request_irq(dev, irq, vc4_txp_interrupt, 0,
>   			       dev_name(dev), txp);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--67t6WmbipRqTJ2gzXtYG86Xilc89a781e--

--br7oyBrYeG0DeKL30WBEe2dQZoIgWEIdF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBwDBsFAwAAAAAACgkQlh/E3EQov+DN
MA/+M+k3u/sfIwM8MTH0f+qC1OSgju9v7XC5bNwsgego4lNG+17DgVe1k5Vu9GFvNqRq05/GO9/D
fY3hqeY6if2aMwqSK935P9LFxO7E+rc4tpQYRIQJVhim33ZCGjiSAzNPDMIoLDUMF1geuaiy7wSL
y8upIZYuoyYsZR1CK9Fzt4rSmVQ+eyqmGtAnJgdKtPjP+N+/2aZJSDLxodvDgllbcHXAaLWf25xj
sZsexYx2rFoYVZ13DC0mOLABunskZzzAwB+V77zbNyypgEAoW4vlgV84CafC/Eu/vxkc54jX4i2n
W5kB50HZRMJIPZhuIBOq2jjEaBEKSzvCzOPGi7xbZ8UmLcOCuUJhv7VypksqVTslkjOULvGL9u+S
FFjt1HzxhD07m+8m2PaVRahXT3AUZ1RN4mtDWf40A+a4+1NdMonZuQ+kvnH8CE6NObkfLQvfL+Rn
3iPueHOzFWK2iC0Zmm5q9tzZw6jvsbvSmXAtz75B4igdNeCXcx/zFJNCCUJyMwCXsZVeUWHuHHcQ
R4ekxYyZSnjA0VqZmhWGuW6U2m97rl0ugkUXJYPMatKDBH9boWaRUhxBJgvW3LZtc+HbUgQ/V/TU
d9p/a06sVT5U4yDlYk0cAr1INJ032Wx7FTDAKliGWURxOC7f66JVLSL/7fJLSW344z+UsW3ZwGa8
FNI=
=gYDe
-----END PGP SIGNATURE-----

--br7oyBrYeG0DeKL30WBEe2dQZoIgWEIdF--

--===============0286818664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0286818664==--
