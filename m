Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A59951D4D99
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 14:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5907B6EC89;
	Fri, 15 May 2020 12:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73BB6EC89
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 12:24:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 21197B12D;
 Fri, 15 May 2020 12:24:39 +0000 (UTC)
Subject: Re: [PATCH v2 11/38] drm/gem: add _locked suffix to drm_object_put
To: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
 <20200515095118.2743122-12-emil.l.velikov@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <e1853951-9179-89b1-2edd-fad2488db38f@suse.de>
Date: Fri, 15 May 2020 14:24:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200515095118.2743122-12-emil.l.velikov@gmail.com>
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
Cc: linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1451127701=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1451127701==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JAtGb8RBTqHrj6lLDdec8A1DvWXqb3nx9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JAtGb8RBTqHrj6lLDdec8A1DvWXqb3nx9
Content-Type: multipart/mixed; boundary="ORO6v91dQ17jS7kgcmZyndEKFqLgvzxfU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org
Message-ID: <e1853951-9179-89b1-2edd-fad2488db38f@suse.de>
Subject: Re: [PATCH v2 11/38] drm/gem: add _locked suffix to drm_object_put
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
 <20200515095118.2743122-12-emil.l.velikov@gmail.com>
In-Reply-To: <20200515095118.2743122-12-emil.l.velikov@gmail.com>

--ORO6v91dQ17jS7kgcmZyndEKFqLgvzxfU
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Emil

Am 15.05.20 um 11:50 schrieb Emil Velikov:
> From: Emil Velikov <emil.velikov@collabora.com>
>=20
> Vast majority of DRM (core and drivers) are struct_mutex free.
>=20
> As such we have only a handful of cases where the locked helper should
> be used. Make that stand out a little bit better.
>=20
> Done via the following script:
>=20
> __from=3Ddrm_gem_object_put
> __to=3Ddrm_gem_object_put_locked
>=20
> for __file in $(git grep --name-only --word-regexp $__from); do
>   sed -i  "s/\<$__from\>/$__to/g" $__file;
> done
>=20
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/drm_gem.c                 | 6 +++---
>  drivers/gpu/drm/msm/adreno/a5xx_debugfs.c | 4 ++--
>  drivers/gpu/drm/msm/msm_drv.c             | 2 +-
>  drivers/gpu/drm/msm/msm_gem.c             | 6 +++---
>  drivers/gpu/drm/msm/msm_gem_submit.c      | 2 +-
>  drivers/gpu/drm/msm/msm_gpu.c             | 2 +-
>  include/drm/drm_gem.h                     | 4 ++--
>  7 files changed, 13 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 599d5ff53b73..f21327ebc562 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -983,7 +983,7 @@ drm_gem_object_free(struct kref *kref)
>  EXPORT_SYMBOL(drm_gem_object_free);
> =20
>  /**
> - * drm_gem_object_put - release a GEM buffer object reference
> + * drm_gem_object_put_locked - release a GEM buffer object reference
>   * @obj: GEM buffer object
>   *
>   * This releases a reference to @obj. Callers must hold the
> @@ -994,7 +994,7 @@ EXPORT_SYMBOL(drm_gem_object_free);
>   * drm_gem_object_put_unlocked() instead.
>   */
>  void
> -drm_gem_object_put(struct drm_gem_object *obj)
> +drm_gem_object_put_locked(struct drm_gem_object *obj)
>  {
>  	if (obj) {
>  		WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
> @@ -1002,7 +1002,7 @@ drm_gem_object_put(struct drm_gem_object *obj)
>  		kref_put(&obj->refcount, drm_gem_object_free);
>  	}
>  }
> -EXPORT_SYMBOL(drm_gem_object_put);
> +EXPORT_SYMBOL(drm_gem_object_put_locked);
> =20
>  /**
>   * drm_gem_vm_open - vma->ops->open implementation for GEM
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c b/drivers/gpu/dr=
m/msm/adreno/a5xx_debugfs.c
> index 8cae2ca4af6b..68eddac7771c 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
> @@ -124,13 +124,13 @@ reset_set(void *data, u64 val)
> =20
>  	if (a5xx_gpu->pm4_bo) {
>  		msm_gem_unpin_iova(a5xx_gpu->pm4_bo, gpu->aspace);
> -		drm_gem_object_put(a5xx_gpu->pm4_bo);
> +		drm_gem_object_put_locked(a5xx_gpu->pm4_bo);
>  		a5xx_gpu->pm4_bo =3D NULL;
>  	}
> =20
>  	if (a5xx_gpu->pfp_bo) {
>  		msm_gem_unpin_iova(a5xx_gpu->pfp_bo, gpu->aspace);
> -		drm_gem_object_put(a5xx_gpu->pfp_bo);
> +		drm_gem_object_put_locked(a5xx_gpu->pfp_bo);
>  		a5xx_gpu->pfp_bo =3D NULL;
>  	}
> =20
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_dr=
v.c
> index 29295dee2a2e..6baed5b43ea3 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -932,7 +932,7 @@ static int msm_ioctl_gem_madvise(struct drm_device =
*dev, void *data,
>  		ret =3D 0;
>  	}
> =20
> -	drm_gem_object_put(obj);
> +	drm_gem_object_put_locked(obj);
> =20
>  unlock:
>  	mutex_unlock(&dev->struct_mutex);
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_ge=
m.c
> index 5a6a79fbc9d6..8696c405f709 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -879,7 +879,7 @@ void msm_gem_describe_objects(struct list_head *lis=
t, struct seq_file *m)
>  }
>  #endif
> =20
> -/* don't call directly!  Use drm_gem_object_put() and friends */
> +/* don't call directly!  Use drm_gem_object_put_locked() and friends *=
/
>  void msm_gem_free_object(struct drm_gem_object *obj)
>  {
>  	struct msm_gem_object *msm_obj =3D to_msm_bo(obj);
> @@ -1183,7 +1183,7 @@ static void *_msm_gem_kernel_new(struct drm_devic=
e *dev, uint32_t size,
>  	return vaddr;
>  err:
>  	if (locked)
> -		drm_gem_object_put(obj);
> +		drm_gem_object_put_locked(obj);
>  	else
>  		drm_gem_object_put_unlocked(obj);
> =20
> @@ -1215,7 +1215,7 @@ void msm_gem_kernel_put(struct drm_gem_object *bo=
,
>  	msm_gem_unpin_iova(bo, aspace);
> =20
>  	if (locked)
> -		drm_gem_object_put(bo);
> +		drm_gem_object_put_locked(bo);
>  	else
>  		drm_gem_object_put_unlocked(bo);
>  }
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm=
/msm_gem_submit.c
> index 385d4965a8d0..8f450a245cfb 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -387,7 +387,7 @@ static void submit_cleanup(struct msm_gem_submit *s=
ubmit)
>  		struct msm_gem_object *msm_obj =3D submit->bos[i].obj;
>  		submit_unlock_unpin_bo(submit, i, false);
>  		list_del_init(&msm_obj->submit_entry);
> -		drm_gem_object_put(&msm_obj->base);
> +		drm_gem_object_put_locked(&msm_obj->base);
>  	}
>  }
> =20
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gp=
u.c
> index 615c5cda5389..86a68f96c48d 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -694,7 +694,7 @@ static void retire_submit(struct msm_gpu *gpu, stru=
ct msm_ringbuffer *ring,
>  		/* move to inactive: */
>  		msm_gem_move_to_inactive(&msm_obj->base);
>  		msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
> -		drm_gem_object_put(&msm_obj->base);
> +		drm_gem_object_put_locked(&msm_obj->base);
>  	}
> =20
>  	pm_runtime_mark_last_busy(&gpu->pdev->dev);
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index c3bdade093ae..a231a2b3f5ac 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -187,7 +187,7 @@ struct drm_gem_object {
>  	 *
>  	 * Reference count of this object
>  	 *
> -	 * Please use drm_gem_object_get() to acquire and drm_gem_object_put(=
)
> +	 * Please use drm_gem_object_get() to acquire and drm_gem_object_put_=
locked()
>  	 * or drm_gem_object_put_unlocked() to release a reference to a GEM

_put_unlocked() is going away. I think you have to update this line in
patch 12. (?)

Best regards
Thomas

>  	 * buffer object.
>  	 */
> @@ -375,7 +375,7 @@ drm_gem_object_put_unlocked(struct drm_gem_object *=
obj)
>  	kref_put(&obj->refcount, drm_gem_object_free);
>  }
> =20
> -void drm_gem_object_put(struct drm_gem_object *obj);
> +void drm_gem_object_put_locked(struct drm_gem_object *obj);
> =20
>  int drm_gem_handle_create(struct drm_file *file_priv,
>  			  struct drm_gem_object *obj,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--ORO6v91dQ17jS7kgcmZyndEKFqLgvzxfU--

--JAtGb8RBTqHrj6lLDdec8A1DvWXqb3nx9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6+igAACgkQaA3BHVML
eiMY+wfyAwyHWFTWHDVaul/1oWzxMz+HSOEUFB1DD6I+cRyBqmgsPWm0D0ex/4ou
Djn1twVLtLaLQAW7ISmhv+LwirtQ7mdPE+fTc+oe+hkHVIEcIqnbDRf9JOW1wgen
E9AxBh2dk/lU/GX/lzveegbT4S0VO37b89g7yecKp7ejMP8+LucAI9BpPudcFxcj
9KiG9go1WdHwyGqtOcKV3291PL0Oj4ORlD7ToRda0ozZo6PGjQcUlmK8U8uk/gMc
mbBXa93DyU/OvLVX+/311e5zEPIUACqAOukXilBUdzj2D8NzNwSUmS26ACexDa51
JuLXbyqCOVgT2HeLD+/8MSA39Et5
=UY0v
-----END PGP SIGNATURE-----

--JAtGb8RBTqHrj6lLDdec8A1DvWXqb3nx9--

--===============1451127701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1451127701==--
