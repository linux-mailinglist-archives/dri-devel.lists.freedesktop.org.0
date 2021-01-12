Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6A72F2E30
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 12:42:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E1389690;
	Tue, 12 Jan 2021 11:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C3789690
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 11:42:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6C265AFA8;
 Tue, 12 Jan 2021 11:42:17 +0000 (UTC)
Subject: Re: [PATCH 01/15] drm/arc: Switch to devm_drm_dev_alloc
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <06a84729-c3e0-ed1a-807c-6629ed8cf2f9@suse.de>
Date: Tue, 12 Jan 2021 12:42:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
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
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Sam Ravnborg <sam@ravnborg.org>,
 tiantao6@hisilicon.com, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============2082521869=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2082521869==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="YkNmq97WnvxmrB7qlIIFQ5y96A5EsSrWm"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--YkNmq97WnvxmrB7qlIIFQ5y96A5EsSrWm
Content-Type: multipart/mixed; boundary="YlP4RsHaiHmzdO3OoRK3ix9ETnWlObzGp";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 Daniel Vetter <daniel.vetter@intel.com>, tiantao6@hisilicon.com,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Message-ID: <06a84729-c3e0-ed1a-807c-6629ed8cf2f9@suse.de>
Subject: Re: [PATCH 01/15] drm/arc: Switch to devm_drm_dev_alloc
References: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>

--YlP4RsHaiHmzdO3OoRK3ix9ETnWlObzGp
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 12.01.21 um 09:43 schrieb Daniel Vetter:
> - Need to embedded the drm_device, but for now we keep the usual
>    pointer chasing.
> - No more devm_kzalloc, which fixes a lifetime issues on driver
>    remove.
> - No more drm_dev_put, that's done by devm_ now.
>=20
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>

For the whole patchset:

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

There's a comment on patch 7.

Best regards
Thomas

> ---
>   drivers/gpu/drm/arc/arcpgu.h     |  1 +
>   drivers/gpu/drm/arc/arcpgu_drv.c | 33 +++++++++++++------------------=
-
>   2 files changed, 14 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/arc/arcpgu.h b/drivers/gpu/drm/arc/arcpgu.=
h
> index 6aac44b953ad..cd9e932f501e 100644
> --- a/drivers/gpu/drm/arc/arcpgu.h
> +++ b/drivers/gpu/drm/arc/arcpgu.h
> @@ -9,6 +9,7 @@
>   #define _ARCPGU_H_
>  =20
>   struct arcpgu_drm_private {
> +	struct drm_device	drm;
>   	void __iomem		*regs;
>   	struct clk		*clk;
>   	struct drm_framebuffer	*fb;
> diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arc=
pgu_drv.c
> index f164818ec477..68eb4a31c54b 100644
> --- a/drivers/gpu/drm/arc/arcpgu_drv.c
> +++ b/drivers/gpu/drm/arc/arcpgu_drv.c
> @@ -42,18 +42,14 @@ static void arcpgu_setup_mode_config(struct drm_dev=
ice *drm)
>  =20
>   DEFINE_DRM_GEM_CMA_FOPS(arcpgu_drm_ops);
>  =20
> -static int arcpgu_load(struct drm_device *drm)
> +static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
>   {
> -	struct platform_device *pdev =3D to_platform_device(drm->dev);
> -	struct arcpgu_drm_private *arcpgu;
> +	struct platform_device *pdev =3D to_platform_device(arcpgu->drm.dev);=

>   	struct device_node *encoder_node =3D NULL, *endpoint_node =3D NULL;
> +	struct drm_device *drm =3D &arcpgu->drm;
>   	struct resource *res;
>   	int ret;
>  =20
> -	arcpgu =3D devm_kzalloc(&pdev->dev, sizeof(*arcpgu), GFP_KERNEL);
> -	if (arcpgu =3D=3D NULL)
> -		return -ENOMEM;
> -
>   	drm->dev_private =3D arcpgu;
>  =20
>   	arcpgu->clk =3D devm_clk_get(drm->dev, "pxlclk");
> @@ -162,30 +158,28 @@ static struct drm_driver arcpgu_drm_driver =3D {
>  =20
>   static int arcpgu_probe(struct platform_device *pdev)
>   {
> -	struct drm_device *drm;
> +	struct arcpgu_drm_private *arcpgu;
>   	int ret;
>  =20
> -	drm =3D drm_dev_alloc(&arcpgu_drm_driver, &pdev->dev);
> -	if (IS_ERR(drm))
> -		return PTR_ERR(drm);
> +	arcpgu =3D devm_drm_dev_alloc(&pdev->dev, &arcpgu_drm_driver,
> +				    struct arcpgu_drm_private, drm);
> +	if (IS_ERR(arcpgu))
> +		return PTR_ERR(arcpgu);
>  =20
> -	ret =3D arcpgu_load(drm);
> +	ret =3D arcpgu_load(arcpgu);
>   	if (ret)
> -		goto err_unref;
> +		return ret;
>  =20
> -	ret =3D drm_dev_register(drm, 0);
> +	ret =3D drm_dev_register(&arcpgu->drm, 0);
>   	if (ret)
>   		goto err_unload;
>  =20
> -	drm_fbdev_generic_setup(drm, 16);
> +	drm_fbdev_generic_setup(&arcpgu->drm, 16);
>  =20
>   	return 0;
>  =20
>   err_unload:
> -	arcpgu_unload(drm);
> -
> -err_unref:
> -	drm_dev_put(drm);
> +	arcpgu_unload(&arcpgu->drm);
>  =20
>   	return ret;
>   }
> @@ -196,7 +190,6 @@ static int arcpgu_remove(struct platform_device *pd=
ev)
>  =20
>   	drm_dev_unregister(drm);
>   	arcpgu_unload(drm);
> -	drm_dev_put(drm);
>  =20
>   	return 0;
>   }
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--YlP4RsHaiHmzdO3OoRK3ix9ETnWlObzGp--

--YkNmq97WnvxmrB7qlIIFQ5y96A5EsSrWm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/9ixgFAwAAAAAACgkQlh/E3EQov+C2
Ew/+JL8F0jxot9W5IwgMRiT4mLUpsb9vY+yyNwSisglRO+T/iWAo12bJfUSDoZ2q/jr7edoIe1ZE
TZbNcjHMnm1O1tiWyfBt9HSf2NpYZr3R+pQlPwduRmeaoTvHHNqAYS0oElMivr04rdraJ3/TaUBD
rn2X7yLXcqB7Jfb8u3h/ArHy5K0aJFhq3cqhihsjqXAS3Gq2UvBwpW5ax+3NIY/+e8nVkhbEopnl
MyU0Dr27e3wU3zsFgaoFEImDc7IWRBLEhRsPMDGfaNFURJf5J61gxPzLsG3saC3X8w6RppaWMYTy
h4/9G5CvBBjZezmID1f0If2tFrmQHLSqjckmBOzEvy3eNrD9dP4jngS1yxmsgHKLhzy0woC+/uSC
7BnYuxvzNpjJ/JV1vEdM8BcdxMGB6bJb1JYlTgJoBHhp1TOb+YBfh2F+HFPeN82OzqEFo9EsDDu6
h3kXPUwQWNP0BtzuZeMrIGQpf5wLrEgyyJTjC3zG825Xde18p6iZ9tTfV4siisM8OzLr83++58nF
WTyfCJ34Nm5epz7DjE0qEWHfVmyEbeZglVRP7buCzITqwqY6n75rAa8Uoe1VTyHYxS5Z1obPkIyS
GMo+Ae0SosqUlUIG7cqbxCWVab0uLM+umWQlmowX0iMXNrdtJqt2IKe7M0rjWlUkL3TiQWyUZOR2
BXs=
=N7UY
-----END PGP SIGNATURE-----

--YkNmq97WnvxmrB7qlIIFQ5y96A5EsSrWm--

--===============2082521869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2082521869==--
