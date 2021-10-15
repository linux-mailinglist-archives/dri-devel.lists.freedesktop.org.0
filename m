Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD63D42F428
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 15:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B47E6ED65;
	Fri, 15 Oct 2021 13:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C0588C07
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 13:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=efKAtlmYggIp5/MGcRZxUjTZmUepgUuaKpetxmlwKGs=; 
 b=qAUDLPghuO/I2MfyNv/MxnH6vBHtxy0YDeVCZr6P+ePT9ElYuULZfVWb50jk3MgbRmPXtfhycYTlcZxO+feQmdCYCPZB/Sum2qGrlc2q1fG699Q5avDZFBxBc/OxCybx6Lbka15F1QeqCq9gQHkTwrzs4ziscefRH+1aN570IcxDLtxlYWu5d9Y4yq3e3DdK0I1et6JYqtKyKEKTSHEEOHSdQwj5q/VWsd1W9p6L4gxHGKSdIme5/1uXnzlvYSf95oZnFMgVJR/Gqv7+nOnicaK0Mzt9ynVMNHD7XewS3x2HuxqwYZiLCx83zQyhj9PB1rYJfEicw1nJTBQ9tGzwkg==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mbNYF-0005Nr-SN; Fri, 15 Oct 2021 15:47:12 +0200
Date: Fri, 15 Oct 2021 14:46:59 +0100
From: Melissa Wen <mwen@igalia.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: airlied@linux.ie, daniel@ffwll.ch, emma@anholt.net,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] drm/v3d: nullify pointer se with a NULL
Message-ID: <20211015134631.l76ai6mdxzrflnv6@mail.igalia.com>
References: <1634282081-72255-1-git-send-email-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sy5z73mtirs5p2lh"
Content-Disposition: inline
In-Reply-To: <1634282081-72255-1-git-send-email-yang.lee@linux.alibaba.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--sy5z73mtirs5p2lh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 10/15, Yang Li wrote:
> Currently a plain integer is being used to nullify the pointer
> struct v3d_submit_ext *se. Use NULL instead. Cleans up sparse
> warnings:
> drivers/gpu/drm/v3d/v3d_gem.c:777:53: warning: Using plain integer as
> NULL pointer
> drivers/gpu/drm/v3d/v3d_gem.c:1010:45: warning: Using plain integer as
> NULL pointer
>=20
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/v3d/v3d_gem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index e47ae40..c7ed2e1 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -774,7 +774,7 @@ void v3d_job_put(struct v3d_job *job)
> =20
>  	if (args->flags & DRM_V3D_SUBMIT_CL_FLUSH_CACHE) {
>  		ret =3D v3d_job_init(v3d, file_priv, (void *)&clean_job, sizeof(*clean=
_job),
> -				   v3d_job_free, 0, 0, V3D_CACHE_CLEAN);
> +				   v3d_job_free, 0, NULL, V3D_CACHE_CLEAN);
>  		if (ret)
>  			goto fail;
> =20
> @@ -1007,7 +1007,7 @@ void v3d_job_put(struct v3d_job *job)
>  		goto fail;
> =20
>  	ret =3D v3d_job_init(v3d, file_priv, (void *)&clean_job, sizeof(*clean_=
job),
> -			   v3d_job_free, 0, 0, V3D_CACHE_CLEAN);
> +			   v3d_job_free, 0, NULL, V3D_CACHE_CLEAN);
>  	if (ret)
>  		goto fail;

Thanks,=20

Reviewed-by: Melissa Wen <mwen@igalia.com>

and I'll apply do drm-misc-next.
> =20
> --=20
> 1.8.3.1
>=20

--sy5z73mtirs5p2lh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmFphlMACgkQwqF3j0dL
ehwpLA//ULEGEdPpO2KNeJZPMQ71+SAI2FQnmyKY121P8rjTPstiV+xOaDt2OUPx
CdlXExjTTAn+sZgmjTQ0YPzif29asr53RPSj8A9lun4OEaKxh7aUt9Z2g4eT7mZd
RFUqssYPVa/YcZQLYnEgWXaKHLTITDlku0gtIdpJJ1b6//q/lwq7QbFXHHynmqqI
Fdf0bIcj4Ar6e8en5x1zD/JpTMu6CayyLFbLXcrcoJjLPen7bdHyuidQHs9wG+16
wSGUM+/JoTjFe6/GGqha1EyWqWPALk5n7qpvcZXsEBXdjyS15JAIb34BjbBsCJKQ
/fmDrDX0ZaI17WGbC0WPVdrISSG8awqZZtMfagxPqHs5nGr2fUGCAzd0vbFWVqyw
pAjGa9n4eOczw3fGF/d15ovq7uSf3nIHOR8oAPQ76bvQ9z3PkAiLu7XsM33FVQ0f
J0h9drUBpwm2wkNw7GxAETiQYejH0IFW94gOIlPNMmPHIfNXgU2LWYKn49lqNx91
V720+IDbcSvlDnGGe8sPa8HhzX0e5QuiuVgMWg0ZGeEPv3F3j5w0HOBcNwYdPp6n
+1gTfspWGQgJf2RkJ8PRcv8JphxwLfblqvtbnfrz7GMKV7pN1K+rwWUVDuF2O2Dq
CNruvovZySRN6RTqonspjL04r30LAXKQg/Br0vTCe3teH2pN9ek=
=sQ+y
-----END PGP SIGNATURE-----

--sy5z73mtirs5p2lh--
