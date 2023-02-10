Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A697692015
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 14:48:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4579E10E27F;
	Fri, 10 Feb 2023 13:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A665210E27F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 13:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RLf/gbHHN/5Wmw/XIqP2hXtY6qQkkTpwIQ+b2qKLzXc=; b=I/D54b1zo+PGf7nmPa3TLSvjw0
 rm+d4kUJawMOOIxTT62OvWMvy1VJhpPzltGOOsXxiH1ei/mYV5yy+TDe858I2kwceF7h7olaqiHDF
 b1S32iA5ecOobMlO8AAmdSQVPKoIizbJVmOE7QHJRIoW94hvQFXNCwsjcUTd6cWm6WqXNByNBi1fs
 548bv3xHhUQvwWXG0WJpKLuyhJQCIwPhs5jsKOpN3urS8u8NkQpAkYp5hMhtM/MAcQwBYTpGf6wcT
 9mA8FJxU/cdKxcZbiKufC9OrkB3uYSUrprTLI7YM5E5SW/ehqrkj44m3CeIzVu3rrL6tk8jFm8+uW
 0M7IK4NA==;
Received: from [38.44.66.31] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pQTlN-00F4ki-Ga; Fri, 10 Feb 2023 14:48:29 +0100
Date: Fri, 10 Feb 2023 12:48:07 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v2 5/5] drm/v3d: Use drm_sched_job_add_syncobj_dependency()
Message-ID: <20230210134807.ctwg5mp6mvvmy7sn@mail.igalia.com>
References: <20230209124447.467867-1-mcanal@igalia.com>
 <20230209124447.467867-6-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ae6lhphohvt4tvak"
Content-Disposition: inline
In-Reply-To: <20230209124447.467867-6-mcanal@igalia.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Qiang Yu <yuq825@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Steven Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ae6lhphohvt4tvak
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 02/09, Ma=EDra Canal wrote:
> As v3d_job_add_deps() performs the same steps as
> drm_sched_job_add_syncobj_dependency(), replace the open-coded
> implementation in v3d in order to simply use the DRM function.
>=20
> Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/v3d/v3d_gem.c | 22 ++++------------------
>  1 file changed, 4 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 5da1806f3969..24cc65ffb4df 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -396,20 +396,6 @@ v3d_wait_bo_ioctl(struct drm_device *dev, void *data,
>  	return ret;
>  }
> =20
> -static int
> -v3d_job_add_deps(struct drm_file *file_priv, struct v3d_job *job,
> -		 u32 in_sync, u32 point)
> -{
> -	struct dma_fence *in_fence =3D NULL;
> -	int ret;
> -
> -	ret =3D drm_syncobj_find_fence(file_priv, in_sync, point, 0, &in_fence);
> -	if (ret =3D=3D -EINVAL)
> -		return ret;
> -
> -	return drm_sched_job_add_dependency(&job->base, in_fence);
> -}
> -
>  static int
>  v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
>  	     void **container, size_t size, void (*free)(struct kref *ref),
> @@ -447,14 +433,14 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *=
file_priv,
>  					DRM_DEBUG("Failed to copy wait dep handle.\n");
>  					goto fail_deps;
>  				}
> -				ret =3D v3d_job_add_deps(file_priv, job, in.handle, 0);
> -				if (ret)
> +				ret =3D drm_sched_job_add_syncobj_dependency(&job->base, file_priv, =
in.handle, 0);
> +				if (ret && ret !=3D -ENOENT)
>  					goto fail_deps;
>  			}
>  		}
>  	} else {
> -		ret =3D v3d_job_add_deps(file_priv, job, in_sync, 0);
> -		if (ret)
> +		ret =3D drm_sched_job_add_syncobj_dependency(&job->base, file_priv, in=
_sync, 0);
> +		if (ret && ret !=3D -ENOENT)
>  			goto fail_deps;
Hi Ma=EDra,

LGTM. Can you add the comment suggested by Christian?

With that, for v3d:

Reviewed-by: Melissa Wen <mwen@igalia.com>

Thanks,

Melissa

>  	}
> =20
> --=20
> 2.39.1
>=20

--ae6lhphohvt4tvak
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmPmSwoACgkQwqF3j0dL
ehz3Ig/+MVCYKlMUj/mzgBjYag1n4ZmtyGyy4Nap8DV9cmdBKusq+OQ9tm3l8MZJ
Pj8FRkfxTJnPYKwdXKgxj8Bc7Bh++pXiBJ3CIHVtZOdjTUZ0IxA+w84lxtywclS3
SKBn3Z6SgVo30qHgrF6pIM2fl5wO6fjY5i7FS5CmhZltADdkAasWuIeNgfHKMHTN
xjGPJQFyz94lGqLcaI9VZSNMOm+P38CalPF50EhttuKzfE5ybsJKd9dwS/8fBx9Y
c2F7GYIdEZSzNfzmb3hW0ngf40s4zf2yz8+x1syRanc1f0Idc/a1K+GoDaSSG9da
WhW04JV3Li01pQ6V79aLzwao5bIv5J2IrljGrw0KHyVhD2stNb8XsvMjF5RLnzuL
gJ6+Dk4OOJ24dGQw5tHDjZk5eOJpLWFVxz0D++2bBsy1Q1jaZV6pCo8Ej8OpU3ww
XkjiDWd0Ujgmb0xO+o4fUvhE6IWGtqu2RkZ6Igk23SfZ6Awhh/HOrFiISdd3lXtr
mrbnb+NBf2zOiHMKjLCsvUzfb/UKALreuflLCRbZCzd/kA7m7AIWUkGI1/OKaEeS
EVt8D8S39S0bxrpZhXy+Ybtc/a1h3c6YUll0KH1wukqn0DuLP8L9Nwu4QB0PMr9e
wn3aVjRJQLyktMfbEBsuQohc1hfQIcs/OVs1/FOAeDOYq7hrGRA=
=P4mI
-----END PGP SIGNATURE-----

--ae6lhphohvt4tvak--
