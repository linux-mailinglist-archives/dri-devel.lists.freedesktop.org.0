Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFDA375F9E
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 07:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F1A6E1D2;
	Fri,  7 May 2021 05:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CDA6E1D2
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 05:05:19 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lesfi-0003g4-Cs; Fri, 07 May 2021 07:05:06 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lesff-0007eK-8B; Fri, 07 May 2021 07:05:03 +0200
Date: Fri, 7 May 2021 07:05:03 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] video: fbdev: imxfb: Fix an error message
Message-ID: <20210507050503.iwrcis2xzhjjthmp@pengutronix.de>
References: <d7b25026f82659da3c6f7159eea480faa9d738be.1620327302.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fchy7hv2sjxcax73"
Content-Disposition: inline
In-Reply-To: <d7b25026f82659da3c6f7159eea480faa9d738be.1620327302.git.christophe.jaillet@wanadoo.fr>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-fbdev@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel-janitors@vger.kernel.org, krzysztof.h1@poczta.fm,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 j.beisert@pengutronix.de, linux-imx@nxp.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fchy7hv2sjxcax73
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Christophe,

On Thu, May 06, 2021 at 08:57:05PM +0200, Christophe JAILLET wrote:
> 'ret' is known to be 0 here.
> No error code is available, so just remove it from the error message.
>=20
> Fixes: 72330b0eeefc ("i.MX Framebuffer: Use readl/writel instead of direc=
t pointer deref")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/video/fbdev/imxfb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
> index 7f8debd2da06..ad598257ab38 100644
> --- a/drivers/video/fbdev/imxfb.c
> +++ b/drivers/video/fbdev/imxfb.c
> @@ -992,7 +992,7 @@ static int imxfb_probe(struct platform_device *pdev)
>  	info->screen_buffer =3D dma_alloc_wc(&pdev->dev, fbi->map_size,
>  					   &fbi->map_dma, GFP_KERNEL);
>  	if (!info->screen_buffer) {
> -		dev_err(&pdev->dev, "Failed to allocate video RAM: %d\n", ret);
> +		dev_err(&pdev->dev, "Failed to allocate video RAM\n");
>  		ret =3D -ENOMEM;
>  		goto failed_map;
>  	}

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Are you using this driver, or did you find that problem using some
static checker?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--fchy7hv2sjxcax73
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmCUynsACgkQwfwUeK3K
7Akw+QgAibPO6IbkA1icCBx3pbmkEnH1NGD7B1YrSwgKWeQlnCqqfv67hRrjvs1u
s2PTr3bd7cE3G7YnWnWWLEC9/7xew8nNKv89KFGSQa1pzRFBc/FGpaeTMDvkO8PK
miGiZbBAl240AtvS87ODzAIDqB2vQkJ6UzinynVbHTN4j+1FKjwnmag05qugFDvx
nYGaNPop0x4BzwcBVVKGTwCnHjmoWdz+HGw+udY9AnO/N5A+Ms6WGsx2yf6d1Z4f
9i9UwA7LoOM/i8+bEwtgZRnn7CXBhYWPFhNMtU+nKAqeGryeAr4UsO/8Y/O9kN/5
F+yqk+jOjwAAnNq5cNzXm6wxrxN88Q==
=KRUx
-----END PGP SIGNATURE-----

--fchy7hv2sjxcax73--
