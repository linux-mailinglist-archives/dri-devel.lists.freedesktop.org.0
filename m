Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 875354862CB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 11:18:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 255A410F234;
	Thu,  6 Jan 2022 10:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E9A10F234
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 10:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7i7XAAK0gPmIhkmXE6jFLxZui1WnKsNUo3yJxvi12Ak=; b=U+iLCtc6Zt2m5oe2Mw7NQALOuE
 Py9O3jKTTutdlCmdlvF04Xe29A22A6ubl9YEsXpL+mVb+ERNRfzSct5FM4FUc1MeXteZtfDYU7CMb
 nsHtoCjj8Zo0AATNMB/vjq5LkfGZump7PCrgqROVqMDjHK8ORutU+qt2EJk0jzRGJUPB/LDPDv4j1
 cNiLryTz7nmCNMYPm48DFYQyuORjwzqcRXOfauED+kyIAUcUAf0wPdnwXzQBmg12s9UU/Sc3ckrmt
 4Pk+vLJxsJy8drQlyNP2+Zr1iP/0Ff9cjWg7ETB+K749WfymgRd7hcdfhMT6yfFWp6DIw9aJ/j0xx
 W7AFykvw==;
Received: from [165.90.113.117] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1n5PqY-0004Rq-LM; Thu, 06 Jan 2022 11:18:14 +0100
Date: Thu, 6 Jan 2022 09:17:57 -0100
From: Melissa Wen <mwen@igalia.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] drm/v3d/v3d_drv: Check for error num after setting mask
Message-ID: <20220106101757.4sd7d3nvoeatjzuq@mail.igalia.com>
References: <20220106025539.2597562-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="s3thnckzmlsys6w7"
Content-Disposition: inline
In-Reply-To: <20220106025539.2597562-1-jiasheng@iscas.ac.cn>
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
Cc: emma@anholt.net, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--s3thnckzmlsys6w7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/06, Jiasheng Jiang wrote:
> Because of the possible failure of the dma_supported(), the
> dma_set_mask_and_coherent() may return error num.
> Therefore, it should be better to check it and return the error if
> fails.
>=20
> Fixes: 334dd38a3878 ("drm/v3d: Set dma_mask as well as coherent_dma_mask")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>  drivers/gpu/drm/v3d/v3d_drv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index 99e22beea90b..bedd52195723 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -232,8 +232,11 @@ static int v3d_platform_drm_probe(struct platform_de=
vice *pdev)
>  		return ret;
> =20
>  	mmu_debug =3D V3D_READ(V3D_MMU_DEBUG_INFO);
> -	dma_set_mask_and_coherent(dev,
> +	ret =3D dma_set_mask_and_coherent(dev,
>  		DMA_BIT_MASK(30 + V3D_GET_FIELD(mmu_debug, V3D_MMU_PA_WIDTH)));
> +	if (ret)
> +		return ret;
> +
lgtm, thanks!

Reviewed-by: Melissa Wen <mwen@igalia.com>

>  	v3d->va_width =3D 30 + V3D_GET_FIELD(mmu_debug, V3D_MMU_VA_WIDTH);
> =20
>  	ident1 =3D V3D_READ(V3D_HUB_IDENT1);
> --=20
> 2.25.1
>=20

--s3thnckzmlsys6w7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmHWwdAACgkQwqF3j0dL
ehy2gw//ZJ0z5G9jOTYd6pvNxGfdywfficIfI1XLM+vWjR0di6fVZZOA9o3C4Npn
TosqzsaxxSvRcXbEnmdrpx8/MdlID3/EAGWYtRgC9Du14CPi2nygQXHCsgBHaZhZ
vkpTr7s/+V9BNeHaNz3owp+x4HxWCDNugTHxDYb+c4o1xe3mfISwl6b5gp2UlEd8
2ihBGAzd2k1k2j4X+qcH+icMqfY9wVdNvvdxARxYgoRhawKFGzwRM/B9NPlOAl3m
smMZZP7xEdmzAm+56zMU0EOkeDHyzrXRdXhSAIuSbn8OvB2fm5PNcIJbrzZfSO+p
eQjpV7Bha7sSpAHJItdbd/HfODhj6TFr6+m0JbvMfLLF1oFIL+bTeLeSYaMoa/Ak
fzAYK3qE7DsKtcSZIO3ukvpQP87CUZEW+06exs3iOUiGY543shXrRADQwzvt5n6D
rYgm4r6cA5Y+I9s4fFJzrilIkwh3wjsT2t5bXix+Wu9rbR86Su9Qh789dECYe1YN
BzqxoatFOoDbGLD+yVUAeG2mDfQgAXGTUNLwssBTNKzlsrHiUuhtGoG08/u6tal2
mGNeVYElJk8Bql+13B/Gvch5tNmtgVafIZ2WXuXk5cFjo9+OYcXlx4I3d2itXq8Z
2zMaLmWLq3gTteGu/e5pQLOxUu0B3Zfh5mlLqPV1zEXSXNguJz4=
=tP5D
-----END PGP SIGNATURE-----

--s3thnckzmlsys6w7--
