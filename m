Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9673A6505D8
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 01:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A08410E1C5;
	Mon, 19 Dec 2022 00:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4506F10E1C5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 00:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fVnyyBD7kx0Gx0PlYopsq5AR/KWJf1gV7ckpQE7AXHs=; b=akcQGxbop4xCXRDwR72jcyrOrX
 Wv+SkSMFqZJwnhyHF/fa7KNjc99xiyPI4Cu8ByvzF7sBAqTtwelWjnIOMqn0QyZ8uB6OFA190ZGlX
 7l2NYaYky2GKujiS0TLrFdxCrCI5TFQJQetr2/T3JVHHgsoi92MwAEhCaBxbq878Yw2aY9pQyi3T1
 GXyPrrwaQt4o4nOP6q6lbajjgEQ10eIPa8AOwYFoBbckJL02RROQz6JiemS+vX9bGlVQqNxkqeha4
 wtcq+Xp3spgMZX0+DpvCJHrbcU+FrH9S2PbtPGVfYvGbde2XjvmU/qNuiwivF5jAW/RTZhh1PC+kU
 7O55PQVA==;
Received: from [41.74.137.107] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1p73oF-005tgA-S8; Mon, 19 Dec 2022 01:15:11 +0100
Date: Sun, 18 Dec 2022 23:14:59 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v2 2/2] drm/v3d: replace obj lookup steps with
 drm_gem_objects_lookup
Message-ID: <20221219001459.dcjvn35xei6qmep3@mail.igalia.com>
References: <20221205135538.3545051-1-mwen@igalia.com>
 <20221205135538.3545051-3-mwen@igalia.com>
 <66a7178e-5af2-2aab-dc3f-3c1a4ef991dd@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="liu2hk6vtght2cxq"
Content-Disposition: inline
In-Reply-To: <66a7178e-5af2-2aab-dc3f-3c1a4ef991dd@igalia.com>
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
Cc: emma@anholt.net, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--liu2hk6vtght2cxq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 12/05, Ma=EDra Canal wrote:
> On 12/5/22 10:55, Melissa Wen wrote:
> > As v3d_lookup_bos() performs the same steps as drm_gem_objects_lookup(),
> > replace the explicit code in v3d to simply use the DRM function.
> >=20
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
>=20
> Reviewed-by: Ma=EDra Canal <mcanal@igalia.com>

Applied this series to drm-misc-next.

Thanks,

Melissa

>=20
> Best Regards,
> - Ma=EDra Canal
>=20
> > ---
> >  drivers/gpu/drm/v3d/v3d_gem.c | 49 +++--------------------------------
> >  1 file changed, 3 insertions(+), 46 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_ge=
m.c
> > index 31a37572c11d..6e152ef26358 100644
> > --- a/drivers/gpu/drm/v3d/v3d_gem.c
> > +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> > @@ -299,10 +299,6 @@ v3d_lookup_bos(struct drm_device *dev,
> >  	       u64 bo_handles,
> >  	       u32 bo_count)
> >  {
> > -	u32 *handles;
> > -	int ret =3D 0;
> > -	int i;
> > -
> >  	job->bo_count =3D bo_count;
> > =20
> >  	if (!job->bo_count) {
> > @@ -313,48 +309,9 @@ v3d_lookup_bos(struct drm_device *dev,
> >  		return -EINVAL;
> >  	}
> > =20
> > -	job->bo =3D kvmalloc_array(job->bo_count,
> > -				 sizeof(struct drm_gem_dma_object *),
> > -				 GFP_KERNEL | __GFP_ZERO);
> > -	if (!job->bo) {
> > -		DRM_DEBUG("Failed to allocate validated BO pointers\n");
> > -		return -ENOMEM;
> > -	}
> > -
> > -	handles =3D kvmalloc_array(job->bo_count, sizeof(u32), GFP_KERNEL);
> > -	if (!handles) {
> > -		ret =3D -ENOMEM;
> > -		DRM_DEBUG("Failed to allocate incoming GEM handles\n");
> > -		goto fail;
> > -	}
> > -
> > -	if (copy_from_user(handles,
> > -			   (void __user *)(uintptr_t)bo_handles,
> > -			   job->bo_count * sizeof(u32))) {
> > -		ret =3D -EFAULT;
> > -		DRM_DEBUG("Failed to copy in GEM handles\n");
> > -		goto fail;
> > -	}
> > -
> > -	spin_lock(&file_priv->table_lock);
> > -	for (i =3D 0; i < job->bo_count; i++) {
> > -		struct drm_gem_object *bo =3D idr_find(&file_priv->object_idr,
> > -						     handles[i]);
> > -		if (!bo) {
> > -			DRM_DEBUG("Failed to look up GEM BO %d: %d\n",
> > -				  i, handles[i]);
> > -			ret =3D -ENOENT;
> > -			spin_unlock(&file_priv->table_lock);
> > -			goto fail;
> > -		}
> > -		drm_gem_object_get(bo);
> > -		job->bo[i] =3D bo;
> > -	}
> > -	spin_unlock(&file_priv->table_lock);
> > -
> > -fail:
> > -	kvfree(handles);
> > -	return ret;
> > +	return drm_gem_objects_lookup(file_priv,
> > +				      (void __user *)(uintptr_t)bo_handles,
> > +				      job->bo_count, &job->bo);
> >  }
> > =20
> >  static void

--liu2hk6vtght2cxq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmOfrPYACgkQwqF3j0dL
ehxE7w/+NQiNuy5iBh9dTDO9ndipHbsDHfGm+dYsbFmHQwrXt1OdhJJJQRX/CQMG
N7Y2UNzsCHPD4yob2EJ2A5O6FfRSuJfUB1TDnS2yKtd0c+8h7AZ7JmE3ZSNY4B1q
6DGRFQSLNPm+QLMplNePSIZlYylbOFBL6pNg0SGlx+RySiOY62mN1ULsGppoajFv
6PGcLU0e0QANMmWUCr/AqDSYbg9qJS4kclLrkt+Hrv9M8QnqIIaXYb2rTyP98LYX
Ywm4qzjr4YRtvhh/gGMGUxx2Y3aDdNaoQ4SU2Sp7l8F83Jm3Neml6T7Gr2HwB4R9
iiz8co76iI3WreWcZkW1ELaigxlIjSLtLwD4fsH4GBdJQzHs7WU2JSOBLYQDtnqx
NvGG6oiaT7XKhHMmeuywT/idnNVmg6ZXaKX1G6GuRB9Qo6jO/q+L3VJM1Zgj+c9p
nqlX/xUDjVipeRqF6EWNUQe+e+u/cEtLEwZsXfldVKjD21OYa7kWfH4t0kxmQ0wa
LJulPhuSb1kxtCYTK8FW5IZ9010JChaByFXB8D6kzXzmsRXfFbnlZKA5QZwlpkd/
tKkXL8eaej8qM/1WKVp54trF5aLHNerexaO0caMfciYZ1yC20XRfGy4BRf88KSd/
DvbAb1umF+WsUIQGXs+0yYAOub8saGVXsBF7QJOgOYV4XX1g8aA=
=T89u
-----END PGP SIGNATURE-----

--liu2hk6vtght2cxq--
