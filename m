Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3394E967F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 14:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5220A10E643;
	Mon, 28 Mar 2022 12:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4052A10E643
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 12:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lrVzwikDhjBGNRcFFbTyAqjkMTBLzQaJc2hHSS4wEmg=; b=U0YKf/ro6hqqx+3l1XJttwBDKF
 vDjhJY0n6WPbgPtJ2ll6rW9EDBb+yeccBWQHCrDhNQ+Y9UJYYush8ulru/PCk7WvEw/EG3sW8bAy0
 9tydBfVnc2Bpr07gk5Q274j/FBrwmc7wDIBX6KrC4MCW4W1mHw8XivgcAA8l9tBq0U3UTdBcJCKvc
 u7Zlwm0FvMYk4K5vW0oMQ9O80CVtt2uAQc198QUVuU+QyAeX11FoBVg2z1smHSKGbuQjTMRC/T0+x
 9JyHZFfQYdPY8IOPwgtrxslAmvSxLfurPf+geAgzW167ILRFvlI7OsSSIFE6M9uKWsQMzdx1NqnyN
 tEZnkMiw==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nYoRU-0005HJ-4I; Mon, 28 Mar 2022 14:25:52 +0200
Date: Mon, 28 Mar 2022 11:25:36 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH] drm/v3d: Use kvcalloc
Message-ID: <20220328122536.cobmqclwtl2ca6k4@mail.igalia.com>
References: <20220312152656.51625-1-harshit.m.mogalapalli@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qeqcrncyu2fdobow"
Content-Disposition: inline
In-Reply-To: <20220312152656.51625-1-harshit.m.mogalapalli@oracle.com>
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
 dan.carpenter@oracle.com, linux-kernel@vger.kernel.org,
 Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qeqcrncyu2fdobow
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 03/12, Harshit Mogalapalli wrote:
> kvcalloc is same as kvmalloc_array + __GFP_ZERO.
>=20
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
>  drivers/gpu/drm/v3d/v3d_gem.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index c7ed2e1cbab6..f7d37228461e 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -308,9 +308,8 @@ v3d_lookup_bos(struct drm_device *dev,
>  		return -EINVAL;
>  	}
> =20
> -	job->bo =3D kvmalloc_array(job->bo_count,
> -				 sizeof(struct drm_gem_cma_object *),
> -				 GFP_KERNEL | __GFP_ZERO);
> +	job->bo =3D kvcalloc(job->bo_count, sizeof(struct drm_gem_cma_object *),
> +			   GFP_KERNEL);

Hi Harshit,

This change seems valid to me, but I believe, in this point, v3d should
move to use the DRM function `drm_gem_objects_lookup()`, and then your
change goes there, since drm_get_objects_lookup() has the same issue
you're pointing. What do you think?

I already sent a patchset to replace steps in v3d_lookup_bos() by
drm_gem_objects_lookup(), as I mentioned. The patchset is here:
https://patchwork.freedesktop.org/series/101610/
Willing to review it? ^

Thanks,

Melissa

>  	if (!job->bo) {
>  		DRM_DEBUG("Failed to allocate validated BO pointers\n");
>  		return -ENOMEM;
> --=20
> 2.31.1
>=20

--qeqcrncyu2fdobow
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmJBqTsACgkQwqF3j0dL
ehxezg//bh3x6Kkk5aU9Y0GowW2fk6Lfo/opQx/a9VPa/sCZ9ft0ctam7yGZUz4G
6YvPDT9kPaZJ/4B2+U1MCECuEEciDoelttwXGls3AdRpk7UIZcWsnsHQZeo5tdPe
gNDZHg7h+TiMNxmdPHItJRuNn4XSe36yTjNfHRUTyx67UhHvmcX8sO12DjQ1u+IL
kKpODRaacDQvLc+hiizZl2Y8e7AP8/rDKH2Ydc8XrknlTt4q+IZLRSwljlhk1QhX
Nfwvv4qTD2kMAQPPcRi64sqzEddFk+YJousPmxdIk2fQ0D8+ljEmf/jvxPnUikgj
34moPZD5r0XJtij/uwTnEwljzAqCOv0XZrorQvVw6WHoi+XvEt7gfvYl7aOPAHZ/
Q23CsRsXGE6yLttjbM45p87PZAtV48cSUGssufkzMJBqlj5aQKsyrBHDxIZF9cYH
sRluiDWo18J7TwqKMo9v3sjkYncQgmt4sUrmL2CTkILdim52LnkHflI+balnVg4S
OQKfafzJ/C9I/nhM/4hcnMeAcw0O+oTxuFKbA80hDUviUXie++SmZ++T1nN8KnAk
2AedlB8lfMD/PK3mV0HtKvgSPyoQ2pyV9EYZNSzndJefNvRtt+jD2jxOFI1C4+dg
mJDxWaTRl23qEr8hA0vM1FD8iogjM/HD5cN2eJbdSwbnO7C1gm4=
=LPIG
-----END PGP SIGNATURE-----

--qeqcrncyu2fdobow--
