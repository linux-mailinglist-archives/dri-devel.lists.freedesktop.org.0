Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F38F92F291C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 08:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFB489503;
	Tue, 12 Jan 2021 07:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1468289238
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 07:45:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 50CA2AC95;
 Tue, 12 Jan 2021 07:45:02 +0000 (UTC)
Subject: Re: [PATCH v4 01/13] dma-buf: Add vmap_local and vnumap_local
 operations
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "airlied@redhat.com" <airlied@redhat.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "sean@poorly.run" <sean@poorly.run>, "eric@anholt.net" <eric@anholt.net>,
 "sam@ravnborg.org" <sam@ravnborg.org>
References: <20210108094340.15290-1-tzimmermann@suse.de>
 <20210108094340.15290-2-tzimmermann@suse.de>
 <39d9d40bf6284ef29c777776f9f2b5a3@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <65f6679c-dc53-e902-bcd1-a960caef756b@suse.de>
Date: Tue, 12 Jan 2021 08:45:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <39d9d40bf6284ef29c777776f9f2b5a3@intel.com>
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
Cc: "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1538275829=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1538275829==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6WKlEn2ogx340hDjGhFgfNOvKVdRpjgVa"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6WKlEn2ogx340hDjGhFgfNOvKVdRpjgVa
Content-Type: multipart/mixed; boundary="usVErwPLg02GQl5mnHWNZvhlyTGeK9IqA";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "airlied@redhat.com" <airlied@redhat.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "sean@poorly.run" <sean@poorly.run>, "eric@anholt.net" <eric@anholt.net>,
 "sam@ravnborg.org" <sam@ravnborg.org>
Cc: "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Message-ID: <65f6679c-dc53-e902-bcd1-a960caef756b@suse.de>
Subject: Re: [PATCH v4 01/13] dma-buf: Add vmap_local and vnumap_local
 operations
References: <20210108094340.15290-1-tzimmermann@suse.de>
 <20210108094340.15290-2-tzimmermann@suse.de>
 <39d9d40bf6284ef29c777776f9f2b5a3@intel.com>
In-Reply-To: <39d9d40bf6284ef29c777776f9f2b5a3@intel.com>

--usVErwPLg02GQl5mnHWNZvhlyTGeK9IqA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.01.21 um 17:12 schrieb Ruhl, Michael J:
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of=

>> Thomas Zimmermann
>> Sent: Friday, January 8, 2021 4:43 AM
>> To: sumit.semwal@linaro.org; christian.koenig@amd.com;
>> airlied@redhat.com; daniel@ffwll.ch; maarten.lankhorst@linux.intel.com=
;
>> mripard@kernel.org; kraxel@redhat.com; hdegoede@redhat.com;
>> sean@poorly.run; eric@anholt.net; sam@ravnborg.org
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>; dri-devel@lists.freedeskto=
p.org;
>> virtualization@lists.linux-foundation.org; linaro-mm-sig@lists.linaro.=
org;
>> Thomas Zimmermann <tzimmermann@suse.de>; linux-
>> media@vger.kernel.org
>> Subject: [PATCH v4 01/13] dma-buf: Add vmap_local and vnumap_local
>> operations
>>
>> The existing dma-buf calls dma_buf_vmap() and dma_buf_vunmap() are
>> allowed to pin the buffer or acquire the buffer's reservation object
>> lock.
>>
>> This is a problem for callers that only require a short-term mapping
>> of the buffer without the pinning, or callers that have special lockin=
g
>> requirements. These may suffer from unnecessary overhead or interfere
>> with regular pin operations.
>>
>> The new interfaces dma_buf_vmap_local(), dma_buf_vunmapo_local(), and
>> their rsp callbacks in struct dma_buf_ops provide an alternative witho=
ut
>> pinning or reservation locking. Callers are responsible for these
>> operations.
>>
>> v4:
>> 	* update documentation (Daniel)
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> ---
>> drivers/dma-buf/dma-buf.c | 81
>> +++++++++++++++++++++++++++++++++++++++
>> include/linux/dma-buf.h   | 34 ++++++++++++++++
>> 2 files changed, 115 insertions(+)
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index b8465243eca2..01f9c74d97fa 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -1295,6 +1295,87 @@ void dma_buf_vunmap(struct dma_buf *dmabuf,
>> struct dma_buf_map *map)
>> }
>> EXPORT_SYMBOL_GPL(dma_buf_vunmap);
>>
>> +/**
>> + * dma_buf_vmap_local - Create virtual mapping for the buffer object =
into
>> kernel
>> + * address space.
>> + * @dmabuf:	[in]	buffer to vmap
>> + * @map:	[out]	returns the vmap pointer
>> + *
>> + * Unlike dma_buf_vmap() this is a short term mapping and will not pi=
n
>> + * the buffer. The struct dma_resv for the @dmabuf must be locked unt=
il
>> + * dma_buf_vunmap_local() is called.
>> + *
>> + * Returns:
>> + * 0 on success, or a negative errno code otherwise.
>> + */
>> +int dma_buf_vmap_local(struct dma_buf *dmabuf, struct dma_buf_map
>> *map)
>> +{
>> +	struct dma_buf_map ptr;
>> +	int ret =3D 0;
>> +
>> +	dma_buf_map_clear(map);
>> +
>> +	if (WARN_ON(!dmabuf))
>> +		return -EINVAL;
>> +
>> +	dma_resv_assert_held(dmabuf->resv);
>> +
>> +	if (!dmabuf->ops->vmap_local)
>> +		return -EINVAL;
>=20
> You are clearing the map, and then doing the above checks.
>=20
> Is it ok to change the map info and then exit on error?

In vmap_local map argument returns the mapping's address. Callers are=20
expected to check the return code. But I would expect a careless caller=20
to not check, or check for map being cleared. Clearing it here first is=20
the save thing to do.

Best regards
Thomas

>=20
> Mike
>=20
>> +	mutex_lock(&dmabuf->lock);
>> +	if (dmabuf->vmapping_counter) {
>> +		dmabuf->vmapping_counter++;
>> +		BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
>> +		*map =3D dmabuf->vmap_ptr;
>> +		goto out_unlock;
>> +	}
>> +
>> +	BUG_ON(dma_buf_map_is_set(&dmabuf->vmap_ptr));
>> +
>> +	ret =3D dmabuf->ops->vmap_local(dmabuf, &ptr);
>> +	if (WARN_ON_ONCE(ret))
>> +		goto out_unlock;
>> +
>> +	dmabuf->vmap_ptr =3D ptr;
>> +	dmabuf->vmapping_counter =3D 1;
>> +
>> +	*map =3D dmabuf->vmap_ptr;
>> +
>> +out_unlock:
>> +	mutex_unlock(&dmabuf->lock);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(dma_buf_vmap_local);
>> +
>> +/**
>> + * dma_buf_vunmap_local - Unmap a vmap obtained by
>> dma_buf_vmap_local.
>> + * @dmabuf:	[in]	buffer to vunmap
>> + * @map:	[in]	vmap pointer to vunmap
>> + *
>> + * Release a mapping established with dma_buf_vmap_local().
>> + */
>> +void dma_buf_vunmap_local(struct dma_buf *dmabuf, struct
>> dma_buf_map *map)
>> +{
>> +	if (WARN_ON(!dmabuf))
>> +		return;
>> +
>> +	dma_resv_assert_held(dmabuf->resv);
>> +
>> +	BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
>> +	BUG_ON(dmabuf->vmapping_counter =3D=3D 0);
>> +	BUG_ON(!dma_buf_map_is_equal(&dmabuf->vmap_ptr, map));
>> +
>> +	mutex_lock(&dmabuf->lock);
>> +	if (--dmabuf->vmapping_counter =3D=3D 0) {
>> +		if (dmabuf->ops->vunmap_local)
>> +			dmabuf->ops->vunmap_local(dmabuf, map);
>> +		dma_buf_map_clear(&dmabuf->vmap_ptr);
>> +	}
>> +	mutex_unlock(&dmabuf->lock);
>> +}
>> +EXPORT_SYMBOL_GPL(dma_buf_vunmap_local);
>> +
>> #ifdef CONFIG_DEBUG_FS
>> static int dma_buf_debug_show(struct seq_file *s, void *unused)
>> {
>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>> index 628681bf6c99..aeed754b5467 100644
>> --- a/include/linux/dma-buf.h
>> +++ b/include/linux/dma-buf.h
>> @@ -264,6 +264,38 @@ struct dma_buf_ops {
>>
>> 	int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
>> 	void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map
>> *map);
>> +
>> +	/**
>> +	 * @vmap_local:
>> +	 *
>> +	 * Creates a virtual mapping for the buffer into kernel address spac=
e.
>> +	 *
>> +	 * This callback establishes short-term mappings for situations wher=
e
>> +	 * callers only use the buffer for a bounded amount of time; such as=

>> +	 * updates to the framebuffer or reading back contained information.=

>> +	 * In contrast to the regular @vmap callback, vmap_local does never
>> pin
>> +	 * the buffer to a specific domain or acquire the buffer's reservati=
on
>> +	 * lock.
>> +	 *
>> +	 * This is called with the &dma_buf.resv object locked. Callers must=

>> hold
>> +	 * the lock until after removing the mapping with @vunmap_local.
>> +	 *
>> +	 * This callback is optional.
>> +	 *
>> +	 * Returns:
>> +	 *
>> +	 * 0 on success or a negative error code on failure.
>> +	 */
>> +	int (*vmap_local)(struct dma_buf *dmabuf, struct dma_buf_map
>> *map);
>> +
>> +	/**
>> +	 * @vunmap_local:
>> +	 *
>> +	 * Removes a virtual mapping that was established by @vmap_local.
>> +	 *
>> +	 * This callback is optional.
>> +	 */
>> +	void (*vunmap_local)(struct dma_buf *dmabuf, struct dma_buf_map
>> *map);
>> };
>>
>> /**
>> @@ -501,4 +533,6 @@ int dma_buf_mmap(struct dma_buf *, struct
>> vm_area_struct *,
>> 		 unsigned long);
>> int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
>> void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map
>> *map);
>> +int dma_buf_vmap_local(struct dma_buf *dmabuf, struct dma_buf_map
>> *map);
>> +void dma_buf_vunmap_local(struct dma_buf *dmabuf, struct
>> dma_buf_map *map);
>> #endif /* __DMA_BUF_H__ */
>> --
>> 2.29.2
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--usVErwPLg02GQl5mnHWNZvhlyTGeK9IqA--

--6WKlEn2ogx340hDjGhFgfNOvKVdRpjgVa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/9U3wFAwAAAAAACgkQlh/E3EQov+DN
qA//arRnPM7UBr2PsEvXdUHdZ1y6EycvzSr+GIFoKVvKY/YxgLaQnEvS2C/jGnHeTU0AA+PANq2E
CUgz2eC/E7p2e1DIFx6qtXjhWEJs+jsDwAFlUhBeSIB9lQIlwWDnv67UkwrHok76iPMO+F5qkzhH
dsZ7THbWb8cIClaQtIhUhZhYSGKZ7545+79Iq1fgo4WpN33zutR/xP8F0zkwXSMhQhlb5WHrK56Z
lqc8OlzwRqqoihElEzBFlw2q//cqgFnhcA3eLyZWapMYS/MkGBjGWFXRZZxlEm0My7vG+f6xUEa/
sj7SwnpyArT0dkxiR/OLwsQ+f4861V0mskoGa6za9WvdE39oDEXUI4z7wuOV2kjjHwbIix5f4YPW
rffx/U4SXIsronOpy7KYYw7oUnapQq+bNcFgeuikkEEdQSOfAeER457g7yxf7ztP4iCUFuH3ACaV
U3DA7cQJMyMuEcDXdv1ZAHP0zO4C7MgEJTaNT0nBE7OqoyrCIwLLgBS3krz8o1OSFVXON6SBbZwT
OYiCLMyIJu/WwvPMrB93Yt4h5YugeqcUPj5Lz/S1MtK2B6GeL/AMUVpP8wveKjHkvfuYmyQg6Z4g
659iSVK0b0n5DOtotcZOGHonBKbDxPNtvHC+bK/TvkO7d/NDR3wKzOTjQWrkAH7DS02Sk7+upUOw
ufI=
=mvIW
-----END PGP SIGNATURE-----

--6WKlEn2ogx340hDjGhFgfNOvKVdRpjgVa--

--===============1538275829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1538275829==--
