Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDCC359729
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 10:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D6D6EB8F;
	Fri,  9 Apr 2021 08:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF776EB8F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 08:07:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6F662B32B;
 Fri,  9 Apr 2021 08:07:39 +0000 (UTC)
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
Message-ID: <c81ce6e5-d2e8-f120-056e-c928705ac8bb@suse.de>
Date: Fri, 9 Apr 2021 10:07:38 +0200
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
Content-Type: multipart/mixed; boundary="===============0839796197=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0839796197==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3zwr9sDWwsl2AyXy1aJVpaULcEuyJ2PmV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3zwr9sDWwsl2AyXy1aJVpaULcEuyJ2PmV
Content-Type: multipart/mixed; boundary="EZJvgtz899zwQm7vOiWI05Ljz47tz7d3z";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 linux-rpi-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org
Message-ID: <c81ce6e5-d2e8-f120-056e-c928705ac8bb@suse.de>
Subject: Re: [PATCH 04/18] drm/vc4: txp: Properly set the possible_crtcs mask
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-5-maxime@cerno.tech>
In-Reply-To: <20210317154352.732095-5-maxime@cerno.tech>

--EZJvgtz899zwQm7vOiWI05Ljz47tz7d3z
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 17.03.21 um 16:43 schrieb Maxime Ripard:
> The current code does a binary or on the possible_crtcs variable of the=


s/binary or/binary OR/

I had to read this twice to get it. Otherwise

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> TXP encoder, while we want to set it to that value instead.
>=20
> Fixes: 39fcb2808376 ("drm/vc4: txp: Turn the TXP into a CRTC of its own=
")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
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


--EZJvgtz899zwQm7vOiWI05Ljz47tz7d3z--

--3zwr9sDWwsl2AyXy1aJVpaULcEuyJ2PmV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBwC0oFAwAAAAAACgkQlh/E3EQov+Bn
Pg//cUpdrTVIOAXnW6U9vzjkcSf9CHZTL+RjHZGiPZfSBCHc7vvZSqJDe8N3cRI85THwfvLtzmr8
c+i3vELt0r2mLBfvfsxUMgqC6EirfKCYMRmHq/17PHqnFX9B7v1V4Rmr2YgIeyT2zZksCNd5SP6D
54VFFZbX9qe/jC9GVPEwj3JuiVUxc5uqM4mZtknu/8cvWDjRXkgp8V+Jkqdn3OsBi5bQWWJG+KTT
Od22pKEqSeKd3q7DEwsxemx3l5WpB7jh5Ju4Dtfcp4fxyPOULxye+7GThTpZcpbDqnV1r6nAKoYq
OiRHz8/IsvBGAvOsTNqNU+U0PJpZ5y/iIcrb9zGtJnn6NCZmWD1+txtYWNGFK8ZAg4c4Mmzq3UYB
OyfSJ0sABonNyTdFYXurTncY3IxSdElkG7bzHuMVPwdYGznJbb+toWTnmDvA80oeGvi/k4Px3eNp
gkOSohT0+ZEXWjXqLwOvCJXmgSa2+7mQK1jydu7egHbq24JqBG+SIElfbDrs6cWcZdosKG+ubgBn
a/TmVcwSqCvc+l5UlV0w+lu2OOJsIHzcIYAk9sMZFR26TIn9110zfdAcvZYMoStkKzETvuvnJKb9
1Z+CnC0hkDKFRGRBBLn6DfdFfJ7YZAQ1qvgD9rbZO/zkyJedKSfQl0+EUh4TNSwQrS/LdvrJ2fPl
Kl8=
=fx6H
-----END PGP SIGNATURE-----

--3zwr9sDWwsl2AyXy1aJVpaULcEuyJ2PmV--

--===============0839796197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0839796197==--
