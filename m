Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA7C7278C1
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 09:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4224D10E225;
	Thu,  8 Jun 2023 07:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17B510E225
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 07:28:00 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 9C208C9F2C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 07:15:40 +0000 (UTC)
X-GND-Sasl: paul.kocialkowski@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686208533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e1SM5qbVIiWN2i+E93Rs6pUO8P+WpXB4KlSYCZZICVY=;
 b=hiFnkWcMBREhi4rzWYlIx8VS0ZhTqTon6B+Noi/zM+uHZ7cDtj+O0K8AB3JJxvJ26Z8uTN
 4bcU8LgJzSgZAHWIsqODXe1na5oEEf2lOepgpbgZM0m8LbAKvkqcGmuVAJ94gQVLVXSFbG
 59/Th9CIbh3F+9NzfeNCKlk5tdqReXe/7eUlWG5iXeKlkB0Zq4fKoW9Su14syXMFdeH4cf
 bswq4vk8zlPJlw4kFmPx9VO2DmF5giUm4eJGRnhfqbtcjDn0B59PD9lo31iQJoEuD0x0ti
 ULo1/S2WZY6ruuYKJqHXuZlxjE2Q+bqkRC8uJK02tbhVFXMt7p0FSeGIQzcu8g==
X-GND-Sasl: paul.kocialkowski@bootlin.com
X-GND-Sasl: paul.kocialkowski@bootlin.com
X-GND-Sasl: paul.kocialkowski@bootlin.com
X-GND-Sasl: paul.kocialkowski@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 17678240013;
 Thu,  8 Jun 2023 07:15:30 +0000 (UTC)
Date: Thu, 8 Jun 2023 09:15:29 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH v2] drm/logicvc: Kconfig: select REGMAP and REGMAP_MMIO
Message-ID: <ZIGAEZTJvq1GqFVD@aptenodytes>
References: <20230608024207.581401-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ukkutT5+Jm73cGF3"
Content-Disposition: inline
In-Reply-To: <20230608024207.581401-1-suijingfeng@loongson.cn>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ukkutT5+Jm73cGF3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 08 Jun 23, 10:42, Sui Jingfeng wrote:
> drm/logicvc driver is depend on REGMAP and REGMAP_MMIO, should select this
> two kconfig option, otherwise the driver failed to compile on platform
> without REGMAP_MMIO selected:
>=20
> ERROR: modpost: "__devm_regmap_init_mmio_clk" [drivers/gpu/drm/logicvc/lo=
gicvc-drm.ko] undefined!
> make[1]: *** [scripts/Makefile.modpost:136: Module.symvers] Error 1
> make: *** [Makefile:1978: modpost] Error 2
>=20
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>

Thanks for the fix, looks good to me!

Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> ---
>  drivers/gpu/drm/logicvc/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/logicvc/Kconfig b/drivers/gpu/drm/logicvc/Kc=
onfig
> index fa7a88368809..1df22a852a23 100644
> --- a/drivers/gpu/drm/logicvc/Kconfig
> +++ b/drivers/gpu/drm/logicvc/Kconfig
> @@ -5,5 +5,7 @@ config DRM_LOGICVC
>  	select DRM_KMS_HELPER
>  	select DRM_KMS_DMA_HELPER
>  	select DRM_GEM_DMA_HELPER
> +	select REGMAP
> +	select REGMAP_MMIO
>  	help
>  	  DRM display driver for the logiCVC programmable logic block from Xylon
> --=20
> 2.25.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--ukkutT5+Jm73cGF3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmSBgBEACgkQ3cLmz3+f
v9F1bwf9H0Dd8yQTcM8xZG7Jj89ztiiVUgzIOqIcgvhUGaWzdPj0sNgMZ6tF9Od3
w9YuXfJ/wsR5SqUKo04fPM7hOSX7wrelEUewmv1ZHPtoChGRNFhJ2Bi/KaIaUHNM
jODo6rf7qbDHqTdleg5SJxTAnqSLZQhG20a1sw70pFJTsX6F6bAnG1AaXItSBcAr
2RL43t13UY2MVb4ntFb0YtKho0hPtfsFBLzZsjZfHC4Gv0ZO24eE0TaWWcrQFY7s
n+nYJ+U/ja6/UByiM60gH33zB6OLXfkI8B0TssJ7iVZnqTqsgyLS2rIgA6Nz+9Vt
QYre3y/v+7t4W/GKGMqg5g18vy3akQ==
=M1u4
-----END PGP SIGNATURE-----

--ukkutT5+Jm73cGF3--
