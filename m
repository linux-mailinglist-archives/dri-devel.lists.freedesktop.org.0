Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9BB1CA422
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 08:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F546E12E;
	Fri,  8 May 2020 06:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81EC6E12E
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 06:38:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3442FAD80;
 Fri,  8 May 2020 06:38:09 +0000 (UTC)
Subject: Re: [PATCH 36/36] drm/gem: remove _unlocked suffix in
 drm_object_put_unlocked
To: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-37-emil.l.velikov@gmail.com>
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
Message-ID: <ef11e4c8-b74d-92bd-1dca-b492cbc777ca@suse.de>
Date: Fri, 8 May 2020 08:38:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200507150822.114464-37-emil.l.velikov@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>
Content-Type: multipart/mixed; boundary="===============0429793823=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0429793823==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="mQ8ZVPOCONz42OJzdPgdOiuWdaCFXRYQD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mQ8ZVPOCONz42OJzdPgdOiuWdaCFXRYQD
Content-Type: multipart/mixed; boundary="ldETaXNgvkqg1n7vgxpD3QcWoWqpLWEhy";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>
Message-ID: <ef11e4c8-b74d-92bd-1dca-b492cbc777ca@suse.de>
Subject: Re: [PATCH 36/36] drm/gem: remove _unlocked suffix in
 drm_object_put_unlocked
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-37-emil.l.velikov@gmail.com>
In-Reply-To: <20200507150822.114464-37-emil.l.velikov@gmail.com>

--ldETaXNgvkqg1n7vgxpD3QcWoWqpLWEhy
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Emil,

one suggestion for this patch: it seems preferable to merge this patch
with patch 11, so that the whole gem core gets converted at once.
Afterwards all those other patches convert the drivers. Finally, patch
36 would only remove the define of drm_gem_object_put_unlocked().

Best regards
Thomas

Am 07.05.20 um 17:08 schrieb Emil Velikov:
> From: Emil Velikov <emil.velikov@collabora.com>
>=20
> Spelling out _unlocked for each and every driver is a annoying.
> Especially if we consider how many drivers, do not know (or need to)
> about the horror stories involving struct_mutex.
>=20
> Just drop the suffix. It makes the API cleaner.
>=20
> Done via the following script:
>=20
> __from=3Ddrm_gem_object_put_unlocked
> __to=3Ddrm_gem_object_put
> for __file in $(git grep --name-only $__from); do
>   sed -i  "s/$__from/$__to/g" $__file;
> done
>=20
> With this patch, the _unlocked define is no longer needed - remove it.
>=20
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
>  Documentation/gpu/drm-mm.rst                 |  2 +-
>  drivers/gpu/drm/drm_client.c                 |  2 +-
>  drivers/gpu/drm/drm_gem.c                    | 26 ++++++++++----------=

>  drivers/gpu/drm/drm_gem_cma_helper.c         |  8 +++---
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c |  6 ++---
>  drivers/gpu/drm/drm_gem_shmem_helper.c       |  4 +--
>  drivers/gpu/drm/drm_gem_ttm_helper.c         |  2 +-
>  drivers/gpu/drm/drm_gem_vram_helper.c        | 10 ++++----
>  drivers/gpu/drm/drm_prime.c                  |  6 ++---
>  include/drm/drm_gem.h                        |  4 +--
>  10 files changed, 34 insertions(+), 36 deletions(-)
>=20
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rs=
t
> index 5ba2ead8f317..8c8540ee859c 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -178,7 +178,7 @@ GEM Objects Lifetime
>  --------------------
> =20
>  All GEM objects are reference-counted by the GEM core. References can =
be
> -acquired and release by calling drm_gem_object_get() and drm_gem_objec=
t_put_unlocked()
> +acquired and release by calling drm_gem_object_get() and drm_gem_objec=
t_put()
>  respectively.
> =20
>  When the last reference to a GEM object is released the GEM core calls=

> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.=
c
> index 8cb93f5209a4..536a22747b51 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -237,7 +237,7 @@ static void drm_client_buffer_delete(struct drm_cli=
ent_buffer *buffer)
>  	drm_gem_vunmap(buffer->gem, buffer->vaddr);
> =20
>  	if (buffer->gem)
> -		drm_gem_object_put_unlocked(buffer->gem);
> +		drm_gem_object_put(buffer->gem);
> =20
>  	if (buffer->handle)
>  		drm_mode_destroy_dumb(dev, buffer->handle, buffer->client->file);
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index f21327ebc562..ae02b3842c90 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -235,7 +235,7 @@ drm_gem_object_handle_put_unlocked(struct drm_gem_o=
bject *obj)
>  	mutex_unlock(&dev->object_name_lock);
> =20
>  	if (final)
> -		drm_gem_object_put_unlocked(obj);
> +		drm_gem_object_put(obj);
>  }
> =20
>  /*
> @@ -331,7 +331,7 @@ int drm_gem_dumb_map_offset(struct drm_file *file, =
struct drm_device *dev,
> =20
>  	*offset =3D drm_vma_node_offset_addr(&obj->vma_node);
>  out:
> -	drm_gem_object_put_unlocked(obj);
> +	drm_gem_object_put(obj);
> =20
>  	return ret;
>  }
> @@ -690,7 +690,7 @@ static int objects_lookup(struct drm_file *filp, u3=
2 *handle, int count,
>   * Returns:
>   *
>   * @objs filled in with GEM object pointers. Returned GEM objects need=
 to be
> - * released with drm_gem_object_put_unlocked(). -ENOENT is returned on=
 a lookup
> + * released with drm_gem_object_put(). -ENOENT is returned on a lookup=

>   * failure. 0 is returned on success.
>   *
>   */
> @@ -785,7 +785,7 @@ long drm_gem_dma_resv_wait(struct drm_file *filep, =
u32 handle,
>  	else if (ret > 0)
>  		ret =3D 0;
> =20
> -	drm_gem_object_put_unlocked(obj);
> +	drm_gem_object_put(obj);
> =20
>  	return ret;
>  }
> @@ -860,7 +860,7 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *d=
ata,
> =20
>  err:
>  	mutex_unlock(&dev->object_name_lock);
> -	drm_gem_object_put_unlocked(obj);
> +	drm_gem_object_put(obj);
>  	return ret;
>  }
> =20
> @@ -898,7 +898,7 @@ drm_gem_open_ioctl(struct drm_device *dev, void *da=
ta,
> =20
>  	/* drm_gem_handle_create_tail unlocks dev->object_name_lock. */
>  	ret =3D drm_gem_handle_create_tail(file_priv, obj, &handle);
> -	drm_gem_object_put_unlocked(obj);
> +	drm_gem_object_put(obj);
>  	if (ret)
>  		return ret;
> =20
> @@ -991,7 +991,7 @@ EXPORT_SYMBOL(drm_gem_object_free);
>   * driver doesn't use &drm_device.struct_mutex for anything.
>   *
>   * For drivers not encumbered with legacy locking use
> - * drm_gem_object_put_unlocked() instead.
> + * drm_gem_object_put() instead.
>   */
>  void
>  drm_gem_object_put_locked(struct drm_gem_object *obj)
> @@ -1030,7 +1030,7 @@ void drm_gem_vm_close(struct vm_area_struct *vma)=

>  {
>  	struct drm_gem_object *obj =3D vma->vm_private_data;
> =20
> -	drm_gem_object_put_unlocked(obj);
> +	drm_gem_object_put(obj);
>  }
>  EXPORT_SYMBOL(drm_gem_vm_close);
> =20
> @@ -1079,7 +1079,7 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, =
unsigned long obj_size,
>  	if (obj->funcs && obj->funcs->mmap) {
>  		ret =3D obj->funcs->mmap(obj, vma);
>  		if (ret) {
> -			drm_gem_object_put_unlocked(obj);
> +			drm_gem_object_put(obj);
>  			return ret;
>  		}
>  		WARN_ON(!(vma->vm_flags & VM_DONTEXPAND));
> @@ -1089,7 +1089,7 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, =
unsigned long obj_size,
>  		else if (dev->driver->gem_vm_ops)
>  			vma->vm_ops =3D dev->driver->gem_vm_ops;
>  		else {
> -			drm_gem_object_put_unlocked(obj);
> +			drm_gem_object_put(obj);
>  			return -EINVAL;
>  		}
> =20
> @@ -1155,13 +1155,13 @@ int drm_gem_mmap(struct file *filp, struct vm_a=
rea_struct *vma)
>  		return -EINVAL;
> =20
>  	if (!drm_vma_node_is_allowed(node, priv)) {
> -		drm_gem_object_put_unlocked(obj);
> +		drm_gem_object_put(obj);
>  		return -EACCES;
>  	}
> =20
>  	if (node->readonly) {
>  		if (vma->vm_flags & VM_WRITE) {
> -			drm_gem_object_put_unlocked(obj);
> +			drm_gem_object_put(obj);
>  			return -EINVAL;
>  		}
> =20
> @@ -1171,7 +1171,7 @@ int drm_gem_mmap(struct file *filp, struct vm_are=
a_struct *vma)
>  	ret =3D drm_gem_mmap_obj(obj, drm_vma_node_size(node) << PAGE_SHIFT,
>  			       vma);
> =20
> -	drm_gem_object_put_unlocked(obj);
> +	drm_gem_object_put(obj);
> =20
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm=
_gem_cma_helper.c
> index 12e98fb28229..b3db3ca7bd7a 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -114,7 +114,7 @@ struct drm_gem_cma_object *drm_gem_cma_create(struc=
t drm_device *drm,
>  	return cma_obj;
> =20
>  error:
> -	drm_gem_object_put_unlocked(&cma_obj->base);
> +	drm_gem_object_put(&cma_obj->base);
>  	return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_cma_create);
> @@ -156,7 +156,7 @@ drm_gem_cma_create_with_handle(struct drm_file *fil=
e_priv,
>  	 */
>  	ret =3D drm_gem_handle_create(file_priv, gem_obj, handle);
>  	/* drop reference from allocate - handle holds it now. */
> -	drm_gem_object_put_unlocked(gem_obj);
> +	drm_gem_object_put(gem_obj);
>  	if (ret)
>  		return ERR_PTR(ret);
> =20
> @@ -380,13 +380,13 @@ unsigned long drm_gem_cma_get_unmapped_area(struc=
t file *filp,
>  		return -EINVAL;
> =20
>  	if (!drm_vma_node_is_allowed(node, priv)) {
> -		drm_gem_object_put_unlocked(obj);
> +		drm_gem_object_put(obj);
>  		return -EACCES;
>  	}
> =20
>  	cma_obj =3D to_drm_gem_cma_obj(obj);
> =20
> -	drm_gem_object_put_unlocked(obj);
> +	drm_gem_object_put(obj);
> =20
>  	return cma_obj->vaddr ? (unsigned long)cma_obj->vaddr : -EINVAL;
>  }
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu=
/drm/drm_gem_framebuffer_helper.c
> index ccc2c71fa491..109d11fb4cd4 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -95,7 +95,7 @@ void drm_gem_fb_destroy(struct drm_framebuffer *fb)
>  	int i;
> =20
>  	for (i =3D 0; i < 4; i++)
> -		drm_gem_object_put_unlocked(fb->obj[i]);
> +		drm_gem_object_put(fb->obj[i]);
> =20
>  	drm_framebuffer_cleanup(fb);
>  	kfree(fb);
> @@ -175,7 +175,7 @@ int drm_gem_fb_init_with_funcs(struct drm_device *d=
ev,
>  			 + mode_cmd->offsets[i];
> =20
>  		if (objs[i]->size < min_size) {
> -			drm_gem_object_put_unlocked(objs[i]);
> +			drm_gem_object_put(objs[i]);
>  			ret =3D -EINVAL;
>  			goto err_gem_object_put;
>  		}
> @@ -189,7 +189,7 @@ int drm_gem_fb_init_with_funcs(struct drm_device *d=
ev,
> =20
>  err_gem_object_put:
>  	for (i--; i >=3D 0; i--)
> -		drm_gem_object_put_unlocked(objs[i]);
> +		drm_gem_object_put(objs[i]);
> =20
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/d=
rm_gem_shmem_helper.c
> index df31e5782eed..339eee79ea52 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -360,7 +360,7 @@ drm_gem_shmem_create_with_handle(struct drm_file *f=
ile_priv,
>  	 */
>  	ret =3D drm_gem_handle_create(file_priv, &shmem->base, handle);
>  	/* drop reference from allocate - handle holds it now. */
> -	drm_gem_object_put_unlocked(&shmem->base);
> +	drm_gem_object_put(&shmem->base);
>  	if (ret)
>  		return ERR_PTR(ret);
> =20
> @@ -684,7 +684,7 @@ drm_gem_shmem_prime_import_sg_table(struct drm_devi=
ce *dev,
>  err_free_array:
>  	kvfree(shmem->pages);
>  err_free_gem:
> -	drm_gem_object_put_unlocked(&shmem->base);
> +	drm_gem_object_put(&shmem->base);
> =20
>  	return ERR_PTR(ret);
>  }
> diff --git a/drivers/gpu/drm/drm_gem_ttm_helper.c b/drivers/gpu/drm/drm=
_gem_ttm_helper.c
> index 605a8a3da7f9..892b2288a104 100644
> --- a/drivers/gpu/drm/drm_gem_ttm_helper.c
> +++ b/drivers/gpu/drm/drm_gem_ttm_helper.c
> @@ -74,7 +74,7 @@ int drm_gem_ttm_mmap(struct drm_gem_object *gem,
>  	 * ttm has its own object refcounting, so drop gem reference
>  	 * to avoid double accounting counting.
>  	 */
> -	drm_gem_object_put_unlocked(gem);
> +	drm_gem_object_put(gem);
> =20
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> index 8b2d5c945c95..0023ce1d2cf7 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -618,9 +618,9 @@ int drm_gem_vram_fill_create_dumb(struct drm_file *=
file,
> =20
>  	ret =3D drm_gem_handle_create(file, &gbo->bo.base, &handle);
>  	if (ret)
> -		goto err_drm_gem_object_put_unlocked;
> +		goto err_drm_gem_object_put;
> =20
> -	drm_gem_object_put_unlocked(&gbo->bo.base);
> +	drm_gem_object_put(&gbo->bo.base);
> =20
>  	args->pitch =3D pitch;
>  	args->size =3D size;
> @@ -628,8 +628,8 @@ int drm_gem_vram_fill_create_dumb(struct drm_file *=
file,
> =20
>  	return 0;
> =20
> -err_drm_gem_object_put_unlocked:
> -	drm_gem_object_put_unlocked(&gbo->bo.base);
> +err_drm_gem_object_put:
> +	drm_gem_object_put(&gbo->bo.base);
>  	return ret;
>  }
>  EXPORT_SYMBOL(drm_gem_vram_fill_create_dumb);
> @@ -737,7 +737,7 @@ int drm_gem_vram_driver_dumb_mmap_offset(struct drm=
_file *file,
>  	gbo =3D drm_gem_vram_of_gem(gem);
>  	*offset =3D drm_gem_vram_mmap_offset(gbo);
> =20
> -	drm_gem_object_put_unlocked(gem);
> +	drm_gem_object_put(gem);
> =20
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 282774e469ac..bbfc713bfdc3 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -270,7 +270,7 @@ void drm_gem_dmabuf_release(struct dma_buf *dma_buf=
)
>  	struct drm_device *dev =3D obj->dev;
> =20
>  	/* drop the reference on the export fd holds */
> -	drm_gem_object_put_unlocked(obj);
> +	drm_gem_object_put(obj);
> =20
>  	drm_dev_put(dev);
>  }
> @@ -329,7 +329,7 @@ int drm_gem_prime_fd_to_handle(struct drm_device *d=
ev,
> =20
>  	/* _handle_create_tail unconditionally unlocks dev->object_name_lock.=
 */
>  	ret =3D drm_gem_handle_create_tail(file_priv, obj, handle);
> -	drm_gem_object_put_unlocked(obj);
> +	drm_gem_object_put(obj);
>  	if (ret)
>  		goto out_put;
> =20
> @@ -500,7 +500,7 @@ int drm_gem_prime_handle_to_fd(struct drm_device *d=
ev,
>  fail_put_dmabuf:
>  	dma_buf_put(dmabuf);
>  out:
> -	drm_gem_object_put_unlocked(obj);
> +	drm_gem_object_put(obj);
>  out_unlock:
>  	mutex_unlock(&file_priv->prime.lock);
> =20
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 70c0059ee72b..eeb6f2cd5d24 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -188,7 +188,7 @@ struct drm_gem_object {
>  	 * Reference count of this object
>  	 *
>  	 * Please use drm_gem_object_get() to acquire and drm_gem_object_put_=
locked()
> -	 * or drm_gem_object_put_unlocked() to release a reference to a GEM
> +	 * or drm_gem_object_put() to release a reference to a GEM
>  	 * buffer object.
>  	 */
>  	struct kref refcount;
> @@ -376,8 +376,6 @@ drm_gem_object_put(struct drm_gem_object *obj)
>  	kref_put(&obj->refcount, drm_gem_object_free);
>  }
> =20
> -#define drm_gem_object_put_unlocked drm_gem_object_put
> -
>  void drm_gem_object_put_locked(struct drm_gem_object *obj);
> =20
>  int drm_gem_handle_create(struct drm_file *file_priv,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--ldETaXNgvkqg1n7vgxpD3QcWoWqpLWEhy--

--mQ8ZVPOCONz42OJzdPgdOiuWdaCFXRYQD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl60/koACgkQaA3BHVML
eiPx1Af/YGzQaFZmN5qHJSFYHXU8YHpS3yPThTO2LFTn/QQwj574b1UtZP9LhmC7
Wxitv4JRvNC2sVx2hlrpdCRLowHYlmwf1FfIXQ8Ucho5UmBTdUTBaTGmLt2Jn/JY
C3UMD3AawEwPbD5vFlVDwUx2aJY2MJEhByjVL0yip5n/dGjEKTWWTFRM2W46bD9S
0+SEkGRPygsZjWb/D73i2XWIl9SbnsDNSmQHyuFoxI44sNjWt2V3ub4JsxOgUbBi
N5iz8teryoVDyMP2jyEHDk7NpxlYXkS+gz1cYK4pV1KggUaT+v0uaka5rtcmuvVz
ughn4odZqoAQVqq7/gaaMcUSo7H53Q==
=0COv
-----END PGP SIGNATURE-----

--mQ8ZVPOCONz42OJzdPgdOiuWdaCFXRYQD--

--===============0429793823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0429793823==--
