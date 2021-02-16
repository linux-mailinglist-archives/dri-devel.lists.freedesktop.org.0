Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F1631CAEE
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 14:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4676E953;
	Tue, 16 Feb 2021 13:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0CA6E951;
 Tue, 16 Feb 2021 13:14:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6918BACBF;
 Tue, 16 Feb 2021 13:14:44 +0000 (UTC)
Subject: Re: [PATCH 05/10] drm/qxl: rename qxl_bo_kmap -> qxl_bo_kmap_locked
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20210216113716.716996-1-kraxel@redhat.com>
 <20210216113716.716996-6-kraxel@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <5d06c09b-4105-042a-6e99-5f4c336734ff@suse.de>
Date: Tue, 16 Feb 2021 14:14:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216113716.716996-6-kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>
Content-Type: multipart/mixed; boundary="===============2060293356=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2060293356==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pH0yIM6TjFZLy5QdVUEFrSjitz0Yb5fOh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pH0yIM6TjFZLy5QdVUEFrSjitz0Yb5fOh
Content-Type: multipart/mixed; boundary="Wi6PCQKuYc5wDIn0KDcx92LtiTjq4ZOWh";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, open list
 <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Message-ID: <5d06c09b-4105-042a-6e99-5f4c336734ff@suse.de>
Subject: Re: [PATCH 05/10] drm/qxl: rename qxl_bo_kmap -> qxl_bo_kmap_locked
References: <20210216113716.716996-1-kraxel@redhat.com>
 <20210216113716.716996-6-kraxel@redhat.com>
In-Reply-To: <20210216113716.716996-6-kraxel@redhat.com>

--Wi6PCQKuYc5wDIn0KDcx92LtiTjq4ZOWh
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 16.02.21 um 12:37 schrieb Gerd Hoffmann:
> Make clear that these functions should be called with reserved
> bo's only.  No functional change.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   drivers/gpu/drm/qxl/qxl_object.h  |  4 ++--
>   drivers/gpu/drm/qxl/qxl_display.c | 14 +++++++-------
>   drivers/gpu/drm/qxl/qxl_draw.c    |  8 ++++----
>   drivers/gpu/drm/qxl/qxl_image.c   |  2 +-
>   drivers/gpu/drm/qxl/qxl_object.c  |  8 ++++----
>   drivers/gpu/drm/qxl/qxl_prime.c   |  4 ++--
>   6 files changed, 20 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/qxl/qxl_object.h b/drivers/gpu/drm/qxl/qxl=
_object.h
> index dc1659e717f1..5bd33650183f 100644
> --- a/drivers/gpu/drm/qxl/qxl_object.h
> +++ b/drivers/gpu/drm/qxl/qxl_object.h
> @@ -64,8 +64,8 @@ extern int qxl_bo_create(struct qxl_device *qdev,
>   			 u32 priority,
>   			 struct qxl_surface *surf,
>   			 struct qxl_bo **bo_ptr);
> -extern int qxl_bo_kmap(struct qxl_bo *bo, struct dma_buf_map *map);
> -extern void qxl_bo_kunmap(struct qxl_bo *bo);
> +extern int qxl_bo_kmap_locked(struct qxl_bo *bo, struct dma_buf_map *m=
ap);
> +extern void qxl_bo_kunmap_locked(struct qxl_bo *bo);

Nowadaways kmap/kunmap is a misnomer. Since you're renaming; maybe=20
rename them to vmap/vunmap.

Best regards
Thomas

>   void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev, struct qxl_bo =
*bo, int page_offset);
>   void qxl_bo_kunmap_atomic_page(struct qxl_device *qdev, struct qxl_bo=
 *bo, void *map);
>   extern struct qxl_bo *qxl_bo_ref(struct qxl_bo *bo);
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qx=
l_display.c
> index a1b5cc5918bc..8672385a1caf 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -600,7 +600,7 @@ static void qxl_cursor_atomic_update(struct drm_pla=
ne *plane,
>   		user_bo =3D gem_to_qxl_bo(obj);
>  =20
>   		/* pinning is done in the prepare/cleanup framevbuffer */
> -		ret =3D qxl_bo_kmap(user_bo, &user_map);
> +		ret =3D qxl_bo_kmap_locked(user_bo, &user_map);
>   		if (ret)
>   			goto out_free_release;
>   		user_ptr =3D user_map.vaddr; /* TODO: Use mapping abstraction prope=
rly */
> @@ -619,7 +619,7 @@ static void qxl_cursor_atomic_update(struct drm_pla=
ne *plane,
>   		if (ret)
>   			goto out_unpin;
>  =20
> -		ret =3D qxl_bo_kmap(cursor_bo, &cursor_map);
> +		ret =3D qxl_bo_kmap_locked(cursor_bo, &cursor_map);
>   		if (ret)
>   			goto out_backoff;
>   		if (cursor_map.is_iomem) /* TODO: Use mapping abstraction properly =
*/
> @@ -638,8 +638,8 @@ static void qxl_cursor_atomic_update(struct drm_pla=
ne *plane,
>   		cursor->chunk.prev_chunk =3D 0;
>   		cursor->chunk.data_size =3D size;
>   		memcpy(cursor->chunk.data, user_ptr, size);
> -		qxl_bo_kunmap(cursor_bo);
> -		qxl_bo_kunmap(user_bo);
> +		qxl_bo_kunmap_locked(cursor_bo);
> +		qxl_bo_kunmap_locked(user_bo);
>  =20
>   		cmd =3D (struct qxl_cursor_cmd *) qxl_release_map(qdev, release);
>   		cmd->u.set.visible =3D 1;
> @@ -681,7 +681,7 @@ static void qxl_cursor_atomic_update(struct drm_pla=
ne *plane,
>   out_free_bo:
>   	qxl_bo_unref(&cursor_bo);
>   out_kunmap:
> -	qxl_bo_kunmap(user_bo);
> +	qxl_bo_kunmap_locked(user_bo);
>   out_free_release:
>   	qxl_release_free(qdev, release);
>   	return;
> @@ -1163,7 +1163,7 @@ int qxl_create_monitors_object(struct qxl_device =
*qdev)
>   	if (ret)
>   		return ret;
>  =20
> -	qxl_bo_kmap(qdev->monitors_config_bo, &map);
> +	qxl_bo_kmap_locked(qdev->monitors_config_bo, &map);
>  =20
>   	qdev->monitors_config =3D qdev->monitors_config_bo->kptr;
>   	qdev->ram_header->monitors_config =3D
> @@ -1189,7 +1189,7 @@ int qxl_destroy_monitors_object(struct qxl_device=
 *qdev)
>   	qdev->monitors_config =3D NULL;
>   	qdev->ram_header->monitors_config =3D 0;
>  =20
> -	qxl_bo_kunmap(qdev->monitors_config_bo);
> +	qxl_bo_kunmap_locked(qdev->monitors_config_bo);
>   	ret =3D qxl_bo_unpin(qdev->monitors_config_bo);
>   	if (ret)
>   		return ret;
> diff --git a/drivers/gpu/drm/qxl/qxl_draw.c b/drivers/gpu/drm/qxl/qxl_d=
raw.c
> index 7b7acb910780..294542d49015 100644
> --- a/drivers/gpu/drm/qxl/qxl_draw.c
> +++ b/drivers/gpu/drm/qxl/qxl_draw.c
> @@ -48,7 +48,7 @@ static struct qxl_rect *drawable_set_clipping(struct =
qxl_device *qdev,
>   	struct qxl_clip_rects *dev_clips;
>   	int ret;
>  =20
> -	ret =3D qxl_bo_kmap(clips_bo, &map);
> +	ret =3D qxl_bo_kmap_locked(clips_bo, &map);
>   	if (ret)
>   		return NULL;
>   	dev_clips =3D map.vaddr; /* TODO: Use mapping abstraction properly *=
/
> @@ -202,7 +202,7 @@ void qxl_draw_dirty_fb(struct qxl_device *qdev,
>   	if (ret)
>   		goto out_release_backoff;
>  =20
> -	ret =3D qxl_bo_kmap(bo, &surface_map);
> +	ret =3D qxl_bo_kmap_locked(bo, &surface_map);
>   	if (ret)
>   		goto out_release_backoff;
>   	surface_base =3D surface_map.vaddr; /* TODO: Use mapping abstraction=
 properly */
> @@ -210,7 +210,7 @@ void qxl_draw_dirty_fb(struct qxl_device *qdev,
>   	ret =3D qxl_image_init(qdev, release, dimage, surface_base,
>   			     left - dumb_shadow_offset,
>   			     top, width, height, depth, stride);
> -	qxl_bo_kunmap(bo);
> +	qxl_bo_kunmap_locked(bo);
>   	if (ret)
>   		goto out_release_backoff;
>  =20
> @@ -247,7 +247,7 @@ void qxl_draw_dirty_fb(struct qxl_device *qdev,
>   		rects[i].top    =3D clips_ptr->y1;
>   		rects[i].bottom =3D clips_ptr->y2;
>   	}
> -	qxl_bo_kunmap(clips_bo);
> +	qxl_bo_kunmap_locked(clips_bo);
>  =20
>   	qxl_release_fence_buffer_objects(release);
>   	qxl_push_command_ring_release(qdev, release, QXL_CMD_DRAW, false);
> diff --git a/drivers/gpu/drm/qxl/qxl_image.c b/drivers/gpu/drm/qxl/qxl_=
image.c
> index 60ab7151b84d..d4db21ca1d5d 100644
> --- a/drivers/gpu/drm/qxl/qxl_image.c
> +++ b/drivers/gpu/drm/qxl/qxl_image.c
> @@ -186,7 +186,7 @@ qxl_image_init_helper(struct qxl_device *qdev,
>   			}
>   		}
>   	}
> -	qxl_bo_kunmap(chunk_bo);
> +	qxl_bo_kunmap_locked(chunk_bo);
>  =20
>   	image_bo =3D dimage->bo;
>   	ptr =3D qxl_bo_kmap_atomic_page(qdev, image_bo, 0);
> diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl=
_object.c
> index 7eada4ad217b..b56d4dfc28cb 100644
> --- a/drivers/gpu/drm/qxl/qxl_object.c
> +++ b/drivers/gpu/drm/qxl/qxl_object.c
> @@ -155,7 +155,7 @@ int qxl_bo_create(struct qxl_device *qdev, unsigned=
 long size,
>   	return 0;
>   }
>  =20
> -int qxl_bo_kmap(struct qxl_bo *bo, struct dma_buf_map *map)
> +int qxl_bo_kmap_locked(struct qxl_bo *bo, struct dma_buf_map *map)
>   {
>   	int r;
>  =20
> @@ -203,7 +203,7 @@ void *qxl_bo_kmap_atomic_page(struct qxl_device *qd=
ev,
>   		return rptr;
>   	}
>  =20
> -	ret =3D qxl_bo_kmap(bo, &bo_map);
> +	ret =3D qxl_bo_kmap_locked(bo, &bo_map);
>   	if (ret)
>   		return NULL;
>   	rptr =3D bo_map.vaddr; /* TODO: Use mapping abstraction properly */
> @@ -212,7 +212,7 @@ void *qxl_bo_kmap_atomic_page(struct qxl_device *qd=
ev,
>   	return rptr;
>   }
>  =20
> -void qxl_bo_kunmap(struct qxl_bo *bo)
> +void qxl_bo_kunmap_locked(struct qxl_bo *bo)
>   {
>   	if (bo->kptr =3D=3D NULL)
>   		return;
> @@ -233,7 +233,7 @@ void qxl_bo_kunmap_atomic_page(struct qxl_device *q=
dev,
>   	io_mapping_unmap_atomic(pmap);
>   	return;
>    fallback:
> -	qxl_bo_kunmap(bo);
> +	qxl_bo_kunmap_locked(bo);
>   }
>  =20
>   void qxl_bo_unref(struct qxl_bo **bo)
> diff --git a/drivers/gpu/drm/qxl/qxl_prime.c b/drivers/gpu/drm/qxl/qxl_=
prime.c
> index 4aa949799446..dc295b2e2b52 100644
> --- a/drivers/gpu/drm/qxl/qxl_prime.c
> +++ b/drivers/gpu/drm/qxl/qxl_prime.c
> @@ -59,7 +59,7 @@ int qxl_gem_prime_vmap(struct drm_gem_object *obj, st=
ruct dma_buf_map *map)
>   	struct qxl_bo *bo =3D gem_to_qxl_bo(obj);
>   	int ret;
>  =20
> -	ret =3D qxl_bo_kmap(bo, map);
> +	ret =3D qxl_bo_kmap_locked(bo, map);
>   	if (ret < 0)
>   		return ret;
>  =20
> @@ -71,7 +71,7 @@ void qxl_gem_prime_vunmap(struct drm_gem_object *obj,=

>   {
>   	struct qxl_bo *bo =3D gem_to_qxl_bo(obj);
>  =20
> -	qxl_bo_kunmap(bo);
> +	qxl_bo_kunmap_locked(bo);
>   }
>  =20
>   int qxl_gem_prime_mmap(struct drm_gem_object *obj,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Wi6PCQKuYc5wDIn0KDcx92LtiTjq4ZOWh--

--pH0yIM6TjFZLy5QdVUEFrSjitz0Yb5fOh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmArxUIFAwAAAAAACgkQlh/E3EQov+Ce
XxAAogyWe3PiFZVF9fkjXHRv5HpgFM59T6Tu5xbbFVWbpMMeLw9cWfJFJ7lco239pet3GPJ5vol3
z3x9Myq3/rJ6mwE9PhVfb7jIUj70MkB1cGZZUeLrZugT5Cw/Yjavykij9yPHXdCq4rbHdDPC24/K
5orKU481SVPtYMb3kjhUFIydDTnju/Pft8PO/+cEcU2/l2TCZX6flV8ZGsgYTrUKVjWvOAUcA5DG
QC9jdgPOy0GiYsUTV6HTYu8j/RZkMFnILcochYE3beDF3D06X8ulwdqRfLIoRwSjotNMHxGFHqsN
Rnk/Sab4IOFLV9OWPR8WsIXWUNFO2zuCO+BVS1DUbe3jqVZ+aKsIgCryJb0ybt0M76F1RAhcLy7l
V5OAkpj3FS+cwY5mHXiKBjQ5+uVPMAdTpE4DAsC+eO50t4NWdrGnH1McXC0GiDZiIsmcpBBUJQaU
oCphSKClzv+9MmwEr2CkfQ2gIRG24hC4ey8Jr7uxTV9ksYD1ElpskoaU8M0kAiWZdlClUU9RtVaj
PfrnTM2xIThISAKJSAsOwCGzCTTSO9E0Vc29iDTjDKM9NXKimEXnsLJSaRUqI6OuExk6JXPw/tea
cYj8dmUdHZg4AsfZ8iBHLhfFpe5ktrzhHxjeliXRLvp+2KaPjdC/GHDcAE7s4oR7xb4Ynod76ODu
LLg=
=gpHg
-----END PGP SIGNATURE-----

--pH0yIM6TjFZLy5QdVUEFrSjitz0Yb5fOh--

--===============2060293356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2060293356==--
