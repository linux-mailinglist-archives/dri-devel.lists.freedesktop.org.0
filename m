Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C0F268590
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73DB6E20E;
	Mon, 14 Sep 2020 07:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23BE86E20E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 07:14:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4D2EDAC6E;
 Mon, 14 Sep 2020 07:15:11 +0000 (UTC)
Subject: Re: [PATCH] drm/vboxvideo: Use drm_gem_vram_vmap() interfaces
To: Hans de Goede <hdegoede@redhat.com>, daniel@ffwll.ch, airlied@linux.ie,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20200911075922.19317-1-tzimmermann@suse.de>
 <df0975cb-9ed2-0cde-e499-d1b63e2c9faa@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <3777f4c9-009e-1984-ce0f-d823e5e9f26f@suse.de>
Date: Mon, 14 Sep 2020 09:14:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <df0975cb-9ed2-0cde-e499-d1b63e2c9faa@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1251308640=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1251308640==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CDai7lBncYQBzXPTCqeljzrCH0kP1Ixhn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CDai7lBncYQBzXPTCqeljzrCH0kP1Ixhn
Content-Type: multipart/mixed; boundary="RZiyQVQOShZxdqn7iIhmM0a0DYRhR12K5";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hans de Goede <hdegoede@redhat.com>, daniel@ffwll.ch, airlied@linux.ie,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <3777f4c9-009e-1984-ce0f-d823e5e9f26f@suse.de>
Subject: Re: [PATCH] drm/vboxvideo: Use drm_gem_vram_vmap() interfaces
References: <20200911075922.19317-1-tzimmermann@suse.de>
 <df0975cb-9ed2-0cde-e499-d1b63e2c9faa@redhat.com>
In-Reply-To: <df0975cb-9ed2-0cde-e499-d1b63e2c9faa@redhat.com>

--RZiyQVQOShZxdqn7iIhmM0a0DYRhR12K5
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 11.09.20 um 16:07 schrieb Hans de Goede:
> Hi,
>=20
> On 9/11/20 9:59 AM, Thomas Zimmermann wrote:
>> VRAM helpers support ref counting for pin and vmap operations, no need=

>> to avoid these operations, by employing the internal kmap interface. J=
ust
>> use drm_gem_vram_vmap() and let it handle the details.
>>
>> Also unexport the kmap interfaces from VRAM helpers. Vboxvideo was the=

>> last user of these internal functions.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> Nice cleanup.
>=20
> I've given this a test-run in an actual VirtualBox vm, focussing on
> cursor sprite changes and I don't see any regressions, so:
>=20
> Tested-by: Hans de Goede <hdegoede@redhat.com>
>=20
> Thomas, I assume that you will push this upstream yourself?

It's merged now. Thanks for testing the change.

Best regards
Thomas

>=20
> Regards,
>=20
> Hans
>=20
>=20
>> ---
>> =C2=A0 drivers/gpu/drm/drm_gem_vram_helper.c | 56 +-------------------=
-------
>> =C2=A0 drivers/gpu/drm/vboxvideo/vbox_mode.c | 10 +++--
>> =C2=A0 include/drm/drm_gem_vram_helper.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 3 --
>> =C2=A0 3 files changed, 8 insertions(+), 61 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c
>> b/drivers/gpu/drm/drm_gem_vram_helper.c
>> index 07447abb4134..0e3cdc40379c 100644
>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>> @@ -97,8 +97,8 @@ static const struct drm_gem_object_funcs
>> drm_gem_vram_object_funcs;
>> =C2=A0=C2=A0 * hardware's draing engine.
>> =C2=A0=C2=A0 *
>> =C2=A0=C2=A0 * To access a buffer object's memory from the DRM driver,=
 call
>> - * drm_gem_vram_kmap(). It (optionally) maps the buffer into kernel
>> address
>> - * space and returns the memory address. Use drm_gem_vram_kunmap() to=

>> + * drm_gem_vram_vmap(). It maps the buffer into kernel address
>> + * space and returns the memory address. Use drm_gem_vram_vunmap() to=

>> =C2=A0=C2=A0 * release the mapping.
>> =C2=A0=C2=A0 */
>> =C2=A0 @@ -436,39 +436,6 @@ static void *drm_gem_vram_kmap_locked(stru=
ct
>> drm_gem_vram_object *gbo,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return kmap->virtual;
>> =C2=A0 }
>> =C2=A0 -/**
>> - * drm_gem_vram_kmap() - Maps a GEM VRAM object into kernel address
>> space
>> - * @gbo:=C2=A0=C2=A0=C2=A0 the GEM VRAM object
>> - * @map:=C2=A0=C2=A0=C2=A0 establish a mapping if necessary
>> - * @is_iomem:=C2=A0=C2=A0=C2=A0 returns true if the mapped memory is =
I/O memory, or
>> false \
>> -=C2=A0=C2=A0=C2=A0 otherwise; can be NULL
>> - *
>> - * This function maps the buffer object into the kernel's address spa=
ce
>> - * or returns the current mapping. If the parameter map is false, the=

>> - * function only queries the current mapping, but does not establish =
a
>> - * new one.
>> - *
>> - * Returns:
>> - * The buffers virtual address if mapped, or
>> - * NULL if not mapped, or
>> - * an ERR_PTR()-encoded error code otherwise.
>> - */
>> -void *drm_gem_vram_kmap(struct drm_gem_vram_object *gbo, bool map,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo=
ol *is_iomem)
>> -{
>> -=C2=A0=C2=A0=C2=A0 int ret;
>> -=C2=A0=C2=A0=C2=A0 void *virtual;
>> -
>> -=C2=A0=C2=A0=C2=A0 ret =3D ttm_bo_reserve(&gbo->bo, true, false, NULL=
);
>> -=C2=A0=C2=A0=C2=A0 if (ret)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ERR_PTR(ret);
>> -=C2=A0=C2=A0=C2=A0 virtual =3D drm_gem_vram_kmap_locked(gbo, map, is_=
iomem);
>> -=C2=A0=C2=A0=C2=A0 ttm_bo_unreserve(&gbo->bo);
>> -
>> -=C2=A0=C2=A0=C2=A0 return virtual;
>> -}
>> -EXPORT_SYMBOL(drm_gem_vram_kmap);
>> -
>> =C2=A0 static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_obje=
ct *gbo)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (WARN_ON_ONCE(!gbo->kmap_use_count))=

>> @@ -484,22 +451,6 @@ static void drm_gem_vram_kunmap_locked(struct
>> drm_gem_vram_object *gbo)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0 }
>> =C2=A0 -/**
>> - * drm_gem_vram_kunmap() - Unmaps a GEM VRAM object
>> - * @gbo:=C2=A0=C2=A0=C2=A0 the GEM VRAM object
>> - */
>> -void drm_gem_vram_kunmap(struct drm_gem_vram_object *gbo)
>> -{
>> -=C2=A0=C2=A0=C2=A0 int ret;
>> -
>> -=C2=A0=C2=A0=C2=A0 ret =3D ttm_bo_reserve(&gbo->bo, false, false, NUL=
L);
>> -=C2=A0=C2=A0=C2=A0 if (WARN_ONCE(ret, "ttm_bo_reserve_failed(): ret=3D=
%d\n", ret))
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> -=C2=A0=C2=A0=C2=A0 drm_gem_vram_kunmap_locked(gbo);
>> -=C2=A0=C2=A0=C2=A0 ttm_bo_unreserve(&gbo->bo);
>> -}
>> -EXPORT_SYMBOL(drm_gem_vram_kunmap);
>> -
>> =C2=A0 /**
>> =C2=A0=C2=A0 * drm_gem_vram_vmap() - Pins and maps a GEM VRAM object i=
nto kernel
>> address
>> =C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 space
>> @@ -511,9 +462,6 @@ EXPORT_SYMBOL(drm_gem_vram_kunmap);
>> =C2=A0=C2=A0 * permanently. Call drm_gem_vram_vunmap() with the return=
ed address to
>> =C2=A0=C2=A0 * unmap and unpin the GEM VRAM object.
>> =C2=A0=C2=A0 *
>> - * If you have special requirements for the pinning or mapping
>> operations,
>> - * call drm_gem_vram_pin() and drm_gem_vram_kmap() directly.
>> - *
>> =C2=A0=C2=A0 * Returns:
>> =C2=A0=C2=A0 * The buffer's virtual address on success, or
>> =C2=A0=C2=A0 * an ERR_PTR()-encoded error code otherwise.
>> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c
>> b/drivers/gpu/drm/vboxvideo/vbox_mode.c
>> index d9a5af62af89..4fcc0a542b8a 100644
>> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
>> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
>> @@ -397,11 +397,13 @@ static void vbox_cursor_atomic_update(struct
>> drm_plane *plane,
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vbox_crtc->cursor_enabled =3D tr=
ue;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 /* pinning is done in prepare/cleanup frame=
buffer */
>> -=C2=A0=C2=A0=C2=A0 src =3D drm_gem_vram_kmap(gbo, true, NULL);
>> +=C2=A0=C2=A0=C2=A0 src =3D drm_gem_vram_vmap(gbo);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(src)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * BUG: we should hav=
e pinned the BO in prepare_fb().
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&v=
box->hw_mutex);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_WARN("Could not kmap c=
ursor bo, skipping update\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_WARN("Could not map cu=
rsor bo, skipping update\n");
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 @@ -414,7 +416,7 @@ static void vbox_cursor_atomic_update(struc=
t
>> drm_plane *plane,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data_size =3D width * height * 4 + mask=
_size;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 copy_cursor_image(src, vbox->cur=
sor_data, width, height,
>> mask_size);
>> -=C2=A0=C2=A0=C2=A0 drm_gem_vram_kunmap(gbo);
>> +=C2=A0=C2=A0=C2=A0 drm_gem_vram_vunmap(gbo, src);
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags =3D VBOX_MOUSE_POINTER_VIS=
IBLE | VBOX_MOUSE_POINTER_SHAPE |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VBOX_MOUSE_POIN=
TER_ALPHA;
>> diff --git a/include/drm/drm_gem_vram_helper.h
>> b/include/drm/drm_gem_vram_helper.h
>> index 035332f3723f..b34f1da89cc7 100644
>> --- a/include/drm/drm_gem_vram_helper.h
>> +++ b/include/drm/drm_gem_vram_helper.h
>> @@ -101,9 +101,6 @@ u64 drm_gem_vram_mmap_offset(struct
>> drm_gem_vram_object *gbo);
>> =C2=A0 s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo);
>> =C2=A0 int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned =
long
>> pl_flag);
>> =C2=A0 int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo);
>> -void *drm_gem_vram_kmap(struct drm_gem_vram_object *gbo, bool map,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo=
ol *is_iomem);
>> -void drm_gem_vram_kunmap(struct drm_gem_vram_object *gbo);
>> =C2=A0 void *drm_gem_vram_vmap(struct drm_gem_vram_object *gbo);
>> =C2=A0 void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, void =
*vaddr);
>> =C2=A0
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--RZiyQVQOShZxdqn7iIhmM0a0DYRhR12K5--

--CDai7lBncYQBzXPTCqeljzrCH0kP1Ixhn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9fGGwUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiOQ2wgAqxIVshr6/n8gqLwmhqnYU3elJoH4
PC6q0OxtbUr8wZpIW7b9cZTHMNs1ybLm2I0OPgy402o8K4APkaaDSsFt0d+yXMaV
PkEvZxxfkAkJ1VDZXAZufX6qxshEHWoIXou75Tcl8Uto6Fih4qiqc1aBklSNb0GR
hzoK29j5N5qutCAdKlvEvcYUW8fklGR8ja1GP3+wBOYGSwGmq1d8WkiyakkJKNoN
nq4G3QdRQEWVUXWL9JiByN1srPp8+EfhxieTQxGbFzMEXM3wNKe5ASmvE70baen2
i0c+rLleAm3l3GAQsYkYUdZ+XRY2vAz6I2uh6dRKEJEfQYBXN6VUzZ1hhg==
=pyRQ
-----END PGP SIGNATURE-----

--CDai7lBncYQBzXPTCqeljzrCH0kP1Ixhn--

--===============1251308640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1251308640==--
