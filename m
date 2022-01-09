Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 736DF488B42
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jan 2022 18:34:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2009D10E842;
	Sun,  9 Jan 2022 17:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C02110E842
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jan 2022 17:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jKkyxnGwzGV4p7nLvEOr9O3+lau8jipB5oVXKa38NbA=; b=phF9f8BGcPP6mOtisSbc9ZjAFe
 zvPOpvGuABroC2TbHvhOsyQRSMdT5unVUNJZSM6Lr1dg7GFM7ANG7PqJlaGcnyJvOOX9JWTDVbPuZ
 wQ5hldoiiCTZ8epcMSxY0XjfwoloyzUO87VZJCVLjEjoeV9Wa3rjTNrw2fzVcmt/CwsXI2c7+0JHO
 rZxW4ipY51ltWVTtl9LQ4cwAywHl6o+xSkb4+SL8PNBNTBJKvcIy3rFTwhHNoIR8Z8MpCmGKnkOwA
 34R48Zf+l+s3o2hWD0nGXUxG/ZgbbBk/70wu5TTJ6TNisdHAhdxY8l7Lfmm7hoW/vImbKa+GedSlc
 xvLg9saw==;
Received: from [165.90.113.117] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1n6c5X-0000JS-6T; Sun, 09 Jan 2022 18:34:39 +0100
Date: Sun, 9 Jan 2022 16:34:27 -0100
From: Melissa Wen <mwen@igalia.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] drm/v3d/v3d_drv: Check for error num after setting mask
Message-ID: <20220109173349.m4aug62q7e232r5r@mail.igalia.com>
References: <20220106025539.2597562-1-jiasheng@iscas.ac.cn>
 <20220106101757.4sd7d3nvoeatjzuq@mail.igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uuxyqiolxrfgc5yh"
Content-Disposition: inline
In-Reply-To: <20220106101757.4sd7d3nvoeatjzuq@mail.igalia.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, emma@anholt.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--uuxyqiolxrfgc5yh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/06, Melissa Wen wrote:
> On 01/06, Jiasheng Jiang wrote:
> > Because of the possible failure of the dma_supported(), the
> > dma_set_mask_and_coherent() may return error num.
> > Therefore, it should be better to check it and return the error if
> > fails.
> >=20
> > Fixes: 334dd38a3878 ("drm/v3d: Set dma_mask as well as coherent_dma_mas=
k")
> > Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> > ---
> >  drivers/gpu/drm/v3d/v3d_drv.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_dr=
v.c
> > index 99e22beea90b..bedd52195723 100644
> > --- a/drivers/gpu/drm/v3d/v3d_drv.c
> > +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> > @@ -232,8 +232,11 @@ static int v3d_platform_drm_probe(struct platform_=
device *pdev)
> >  		return ret;
> > =20
> >  	mmu_debug =3D V3D_READ(V3D_MMU_DEBUG_INFO);
> > -	dma_set_mask_and_coherent(dev,
> > +	ret =3D dma_set_mask_and_coherent(dev,
> >  		DMA_BIT_MASK(30 + V3D_GET_FIELD(mmu_debug, V3D_MMU_PA_WIDTH)));
> > +	if (ret)
> > +		return ret;
> > +
> lgtm, thanks!
>=20
Checkpatch complains when I was about to apply this change.
As the current code already has an alignment issue, here is a good
opportunity to clean it properly. I suggest to create a variable for
the mask to solve this parenthesis alignment issue.

When submitting the next version, add my r-b, please.

Thanks, Melissa

> Reviewed-by: Melissa Wen <mwen@igalia.com>
>=20
> >  	v3d->va_width =3D 30 + V3D_GET_FIELD(mmu_debug, V3D_MMU_VA_WIDTH);
> > =20
> >  	ident1 =3D V3D_READ(V3D_HUB_IDENT1);
> > --=20
> > 2.25.1
> >=20



--uuxyqiolxrfgc5yh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmHbHKMACgkQwqF3j0dL
ehwFiBAAmA1/GCzqdyEEBqEOnkl0yH/Em8Srikam6fyX16m7MxqK8LQ0sIi4P3VY
yggzvKXzwheMFu1H9WOQLsxF3HbSWqPSchrTPuJu3A06nHnt1xPILastDXOMP+1B
9DA89jRhm1QIHfm3JmcJZRl8zyObZYVkTmDERSVJP57NNCAvx8AVFnYMfB7v+g/+
7pr9yzsSNOI9bktcE1p5xzhoBBfporKBaVDTaiThZHbzHUha9u5FDHs6agNCSW1L
2p+SHINf5+pWlaXNywiAohYPhR0NMLMzu4EhxWXjbO7FAJ+lPaxPC50QG9ZhAgtf
BuB2WbjMLEzTIFw//PrNC4KnIuM7QbHnS5QpCnchQpFhHbRjPnuiANcy5FmyZ1Ol
AZVlGI2ZpOtLcQnOLuduRVvylOei7OMSTcE1Bvo/ZT6nquOdvXu6ee/ZgIWqWaXX
sBKLbfvm5iTmuG6YKZuY872IbsEr69Le58tYYWDVuY3/clXKsvu2zfonLa/AOnyc
n13HFeYXBYy5vkW2uv7gsEFD3Arq6lfYviMXNUH3tOncZeEgkPREtLLuRQibsIF0
IEzXpqccrqWbkWzojO+QNjtywdXAiEiVQmq/aS63/gdBzxIc6d6hGASPSmaYOS2/
uTnJzRPRxjiV1CzT5L5dJsKFCDuMYCO5J/HmSELnXlpDY8WnZ2M=
=POyl
-----END PGP SIGNATURE-----

--uuxyqiolxrfgc5yh--
