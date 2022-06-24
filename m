Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79855559CE9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 17:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C0B410E1B2;
	Fri, 24 Jun 2022 15:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F9310E1B2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 15:00:57 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 074A720000F;
 Fri, 24 Jun 2022 15:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1656082855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2qXzzJoUbs4d2QN18DeeUOD79uKu2pCH/VKOYe0ryJU=;
 b=AdugIn5IrOuegRe1MgJXvlpSkfmQeoFzYPsWm/Es3Pas0v/xU3CPJ6FNRpYajhiCbnbNrc
 jBAYXShmAT94eI3n0JnS9nUCidQbFzj9MpmasgvEoZENyVkJmdP/Ruqwf9BYzy2A3TWAzc
 c8gEzP6wGu9vTzov5/vxd3R0yf6l6eYNUdvI2iB9eX4ehz3JI87eSavJY/I+Kta1n6yisO
 Y1/jovWvDOJuGY1lpPVBZkaAni/6rOUpknlQiTBEfZNI+fjmVM+Xnp9E/29TsPRdRaUxli
 aQGB5L5HL5HCH58CziTaZ63MeTIaekGkqX9g4pJvjJ0LqZBi0Og8sm/ugpD58A==
Date: Fri, 24 Jun 2022 17:00:54 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Subject: Re: [PATCH -next] drm: Remove unnecessary print function dev_err()
Message-ID: <YrXRplhnlUZ2KV3V@aptenodytes>
References: <20220613012658.85814-1-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="veaIlB3NsqQJBjp+"
Content-Disposition: inline
In-Reply-To: <20220613012658.85814-1-yang.lee@linux.alibaba.com>
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
Cc: airlied@linux.ie, Abaci Robot <abaci@linux.alibaba.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--veaIlB3NsqQJBjp+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Yang,

On Mon 13 Jun 22, 09:26, Yang Li wrote:
> The print function dev_err() is redundant because platform_get_irq()
> already prints an error.
>=20
> Eliminate the follow coccicheck warning:
> ./drivers/gpu/drm/logicvc/logicvc_drm.c:352:2-9: line 352 is redundant
> because platform_get_irq() already prints an error
>=20
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Thanks for the patch!

Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Paul

> ---
>  drivers/gpu/drm/logicvc/logicvc_drm.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logi=
cvc/logicvc_drm.c
> index df1805cf0f95..437b3011ae1e 100644
> --- a/drivers/gpu/drm/logicvc/logicvc_drm.c
> +++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
> @@ -349,7 +349,6 @@ static int logicvc_drm_probe(struct platform_device *=
pdev)
> =20
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq < 0) {
> -		dev_err(dev, "Failed to get IRQ\n");
>  		ret =3D -ENODEV;
>  		goto error_reserved_mem;
>  	}
> --=20
> 2.20.1.7.g153144c
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--veaIlB3NsqQJBjp+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmK10aYACgkQ3cLmz3+f
v9EGeQf/Q01Lx/F9D+C2pQeGKz3ffuzTDhSn3Tm7+EUUsYblieed+d8NDOXdDSWF
dkkdvlubJP2VOLFRioFp6JbCmPW5ul7CdTE8sYtefj8Kdt/ghau8j5KI6kN4CM+L
SvCfuS8dc7Av3mfSWW/7vURJO3oLs1MnAEKZAdK+yYhBRoih8200mo8AC0leuVz/
5f/zmyQ5C2COwQ/vkG8YMoGpDJIk65jvxlBqbRv80bfLCoNY4gLEG4m/3TpSZNk9
FtXolEz03RckdXsuT3tqXUmHQ7WTWgjfk7v+xuKJ83nj10Xgw9ImGoyVjBVkef3O
lyYYhtTL4IkrQ86COfhQijTeByJe3A==
=7pE3
-----END PGP SIGNATURE-----

--veaIlB3NsqQJBjp+--
