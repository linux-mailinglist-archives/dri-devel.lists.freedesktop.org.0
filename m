Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCA6559CA6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 16:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D474F10E9F2;
	Fri, 24 Jun 2022 14:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6F610E9F2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 14:47:46 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 49D69FF804;
 Fri, 24 Jun 2022 14:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1656082064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/5lwqCmDfgarZpH/+DYuV1w1W6dB+x06YFC1AxqeVeQ=;
 b=ImWs1iP8fokVxeUbt87bRF+OpaoNKFG4ZCK343vscEwvalHP0g+xEN51LoEhVAZ1PTSFvO
 VQdbjHIXr4M98i9fhYcm18+jJrK1a9u6zcguc82LsgnF6udGbo846xG1Rr1vRuqt4/O1ID
 U3hKwYisqZBvXktP4Ke+CoorBdJWLtfE3ZOZMsoBxR3GspQwcWjTBbomyBiOak8ZTKFg50
 G2FoZP3xuqVYC6EydseE6elbSZDzS4wj79gSto5V3JwGB1xMVUeaS5vKalp5wqqfe68ye9
 19qXIDdilD21diuZFQhc8pO+N6FiVvMpAGk3lyLGGLiQxouDDA64I0kf+va60w==
Date: Fri, 24 Jun 2022 16:47:43 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH -next] drm/logicvc: Fix error return code in
 logicvc_layer_init()
Message-ID: <YrXOjxxhRbC/cgCA@aptenodytes>
References: <20220623140507.626062-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HhRDR0/yj0N7IbgY"
Content-Disposition: inline
In-Reply-To: <20220623140507.626062-1-yangyingliang@huawei.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--HhRDR0/yj0N7IbgY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Yang,

On Thu 23 Jun 22, 22:05, Yang Yingliang wrote:
> Fix error return code when logicvc_layer_formats_lookup() fails.
>=20
> Fixes: efeeaefe9be5 ("drm: Add support for the LogiCVC display controller=
")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Good catch! Yet Dan submitted a similar fix earlier, which is already
on its way to the tree.

Thanks!

Paul

> ---
>  drivers/gpu/drm/logicvc/logicvc_layer.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/lo=
gicvc/logicvc_layer.c
> index fbebe966f93a..54b5931d879f 100644
> --- a/drivers/gpu/drm/logicvc/logicvc_layer.c
> +++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
> @@ -489,6 +489,7 @@ static int logicvc_layer_init(struct logicvc_drm *log=
icvc,
> =20
>  	formats =3D logicvc_layer_formats_lookup(layer);
>  	if (!formats) {
> +		ret =3D -EINVAL;
>  		drm_err(drm_dev, "Failed to lookup formats for layer #%d\n",
>  			index);
>  		goto error;
> --=20
> 2.25.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--HhRDR0/yj0N7IbgY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmK1zo8ACgkQ3cLmz3+f
v9Hauwf/Sr5lfkjLYZPyt+DqT+dWh/4eDCQP939k7QgLZ1fRsHbgu8HE3n48p6qy
yhYLpb4/hhL7F3W7dtYEPgbM9OmDts34GycSqQFjnkH18BhMbKTV9p+ZnVeFtALb
CzYGK6gkBekzIlqmyOeOF9MdigEQJMA57WvbdTHvUCZWGaQX+HGqFbm8hRUX60To
+uK0ByhM94zYW3/m9R6dzf8ysr4kCJIr33VhH7hf6/ORk3Rr9H2+z86C/4V6/NIs
zzCzlUHem9ff5UoqghlCqm/543eHSFO5LsRQ0UA86OW/kbmYL1QLYHT4KC60OPZb
9eriFOQwlKbTSnU81IxK5tkZ6LUnZA==
=J0ua
-----END PGP SIGNATURE-----

--HhRDR0/yj0N7IbgY--
