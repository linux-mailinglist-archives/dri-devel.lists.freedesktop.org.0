Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12925559BB8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 16:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E267A10E65C;
	Fri, 24 Jun 2022 14:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F081410EACE
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 14:35:53 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4A7C120002;
 Fri, 24 Jun 2022 14:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1656081352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z/XGzdtFqcVGB8e2YIX6omwGWK/S08DpKJpbNqUDcSE=;
 b=oieKVySo+sXGflMfukphC5meksFzkcoxcCg02IWYya5zyd/f0S4Usb8zkYwGr7rm6JdrFC
 vyyLSKtZuEuWjXhUGMKNBmul8KodDjqTLW3NvI/U2874+2Mq6nvRKOTJvE3I9c37M+JhdK
 vh+FDeqsdq6F1J/eDWBugMuH/x8mT9SeIviWKF/G/ugZbnGfcL+oXc8PPBp2BVOZ26kTVg
 bU8bPNDn1M3NVD3as3V5+60E7VBlMwZBs8eVayHCeMMx/Sz6omPGCTApidz0c4xT4VZCxe
 yZKL1ifCuUDQsLuZ2rYyHEVrl052J89MHKHyYsedoWXmzfG3hOx9y2YaGeKcag==
Date: Fri, 24 Jun 2022 16:35:51 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm: logicvc: fix error code in logicvc_layer_init()
Message-ID: <YrXLx8AXRObZEbVi@aptenodytes>
References: <Yqh6VdNiDvJYMOQ+@kili>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9rmVoEPHcjZhZxQy"
Content-Disposition: inline
In-Reply-To: <Yqh6VdNiDvJYMOQ+@kili>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--9rmVoEPHcjZhZxQy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue 14 Jun 22, 15:08, Dan Carpenter wrote:
> Return -EINVAL if logicvc_layer_formats_lookup() fails.  Don't return
> success.
>=20
> Fixes: efeeaefe9be5 ("drm: Add support for the LogiCVC display controller=
")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the fix!

Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Paul

> ---
>  drivers/gpu/drm/logicvc/logicvc_layer.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/lo=
gicvc/logicvc_layer.c
> index bae1c7f99569..9c94b67afbed 100644
> --- a/drivers/gpu/drm/logicvc/logicvc_layer.c
> +++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
> @@ -489,6 +489,7 @@ static int logicvc_layer_init(struct logicvc_drm *log=
icvc,
>  	if (!formats) {
>  		drm_err(drm_dev, "Failed to lookup formats for layer #%d\n",
>  			index);
> +		ret =3D -EINVAL;
>  		goto error;
>  	}
> =20
> --=20
> 2.35.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--9rmVoEPHcjZhZxQy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmK1y8cACgkQ3cLmz3+f
v9Hc+Af/T9/8gpMFxU6r6DJMRLFfZzthyHv1domnxFjanb7l02hKHLHGfQlLumy4
ho9uZ0vjKUTHqM1XmQk7gH968MRWCAxJu+085dSlcnruMfwKb1VH4T/6IQVLp6jx
Sa1aNuJ5BbJTGfD36fDDd6SxnBQ4meJ6HnEgwV7ObfCoeTbVoIePttk8G9u6zKvS
o1je62yimInw6xi2wMjxKh848pa2wyOUhDKIwu95TMG2kSucJ+KfJ5o2EdLmBIX9
So7VeHnXiqE65uDyBMhN7XhKCqANSYBdybuYp2jD/Fi7V1zVf9mSbaEEa9/V99hl
tzd+yGe0c1uII7wVYXMgwR5LwyhQjQ==
=EFB/
-----END PGP SIGNATURE-----

--9rmVoEPHcjZhZxQy--
