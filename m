Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E61E22785E4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 13:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B916E0AB;
	Fri, 25 Sep 2020 11:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077246EC91;
 Fri, 25 Sep 2020 11:32:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 70A8DAD1B;
 Fri, 25 Sep 2020 11:32:09 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] dma-buf: Add struct dma-buf-map for storing struct
 dma_buf.vaddr_ptr
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 sumit.semwal@linaro.org, afd@ti.com, corbet@lwn.net,
 benjamin.gaignard@linaro.org, lmark@codeaurora.org, labbott@redhat.com,
 Brian.Starkey@arm.com, john.stultz@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, pawel@osciak.com,
 m.szyprowski@samsung.com, kyungmin.park@samsung.com, tfiga@chromium.org,
 mchehab@kernel.org, matthew.auld@intel.com, robin.murphy@arm.com,
 thomas.hellstrom@intel.com, sam@ravnborg.org, kraxel@redhat.com
References: <20200923123205.30671-1-tzimmermann@suse.de>
 <20200923123205.30671-2-tzimmermann@suse.de>
 <fa595f8a-3360-dc9f-2b85-0cdda28da3e5@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <3037ab4c-8f9f-b794-32f6-3c0a3c7c9386@suse.de>
Date: Fri, 25 Sep 2020 13:32:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <fa595f8a-3360-dc9f-2b85-0cdda28da3e5@amd.com>
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
Cc: linux-doc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-tegra@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1825488280=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1825488280==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="49giZWWPeWjVVqaE8hkWJZ8vcyv1KOI11"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--49giZWWPeWjVVqaE8hkWJZ8vcyv1KOI11
Content-Type: multipart/mixed; boundary="a0B5SjwbJ043BiHrfHGQFb73vMfEbDQR3";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 sumit.semwal@linaro.org, afd@ti.com, corbet@lwn.net,
 benjamin.gaignard@linaro.org, lmark@codeaurora.org, labbott@redhat.com,
 Brian.Starkey@arm.com, john.stultz@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, pawel@osciak.com,
 m.szyprowski@samsung.com, kyungmin.park@samsung.com, tfiga@chromium.org,
 mchehab@kernel.org, matthew.auld@intel.com, robin.murphy@arm.com,
 thomas.hellstrom@intel.com, sam@ravnborg.org, kraxel@redhat.com
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 etnaviv@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Message-ID: <3037ab4c-8f9f-b794-32f6-3c0a3c7c9386@suse.de>
Subject: Re: [PATCH v2 1/3] dma-buf: Add struct dma-buf-map for storing struct
 dma_buf.vaddr_ptr
References: <20200923123205.30671-1-tzimmermann@suse.de>
 <20200923123205.30671-2-tzimmermann@suse.de>
 <fa595f8a-3360-dc9f-2b85-0cdda28da3e5@amd.com>
In-Reply-To: <fa595f8a-3360-dc9f-2b85-0cdda28da3e5@amd.com>

--a0B5SjwbJ043BiHrfHGQFb73vMfEbDQR3
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 23.09.20 um 16:27 schrieb Christian K=C3=B6nig:
> Am 23.09.20 um 14:32 schrieb Thomas Zimmermann:
>> The new type struct dma_buf_map represents a mapping of dma-buf memory=

>> into kernel space. It contains a flag, is_iomem, that signals users to=

>> access the mapped memory with I/O operations instead of regular loads
>> and stores.
>>
>> It was assumed that DMA buffer memory can be accessed with regular loa=
d
>> and store operations. Some architectures, such as sparc64, require the=

>> use of I/O operations to access dma-map buffers that are located in I/=
O
>> memory. Providing struct dma_buf_map allows drivers to implement this.=

>> This was specifically a problem when refreshing the graphics framebuff=
er
>> on such systems. [1]
>>
>> As the first step, struct dma_buf stores an instance of struct
>> dma_buf_map
>> internally. Afterwards, dma-buf's vmap and vunmap interfaces are be
>> converted. Finally, affected drivers can be fixed.
>>
>> [1]
>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flo=
re.kernel.org%2Fdri-devel%2F20200725191012.GA434957%40ravnborg.org%2F&amp=
;data=3D02%7C01%7Cchristian.koenig%40amd.com%7C54486b9682654f3950b808d85f=
bcb1d3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637364611338153209&am=
p;sdata=3D%2BZm7t8OcgkIxnY%2FdZSLhSbKC7t1y4VW5lINFKwCQv3A%3D&amp;reserved=
=3D0
>>
>=20
> Only two nit picks below, apart from that Reviewed-by: Christian K=C3=B6=
nig
> <christian.koenig@amd.com>
>=20
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
>> ---
>> =C2=A0 Documentation/driver-api/dma-buf.rst |=C2=A0 3 +
>> =C2=A0 drivers/dma-buf/dma-buf.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 ++---
>> =C2=A0 include/linux/dma-buf-map.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 87 ++++++++++++++++++++++++++++
>> =C2=A0 include/linux/dma-buf.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +-
>> =C2=A0 4 files changed, 99 insertions(+), 8 deletions(-)
>> =C2=A0 create mode 100644 include/linux/dma-buf-map.h
>>
>> diff --git a/Documentation/driver-api/dma-buf.rst
>> b/Documentation/driver-api/dma-buf.rst
>> index 13ea0cc0a3fa..3244c600a9a1 100644
>> --- a/Documentation/driver-api/dma-buf.rst
>> +++ b/Documentation/driver-api/dma-buf.rst
>> @@ -115,6 +115,9 @@ Kernel Functions and Structures Reference
>> =C2=A0 .. kernel-doc:: include/linux/dma-buf.h
>> =C2=A0=C2=A0=C2=A0=C2=A0 :internal:
>> =C2=A0 +.. kernel-doc:: include/linux/dma-buf-map.h
>> +=C2=A0=C2=A0 :internal:
>> +
>> =C2=A0 Reservation Objects
>> =C2=A0 -------------------
>> =C2=A0 diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-bu=
f.c
>> index 58564d82a3a2..5e849ca241a0 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -1207,12 +1207,12 @@ void *dma_buf_vmap(struct dma_buf *dmabuf)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_lock(&dmabuf->lock);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (dmabuf->vmapping_counter) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dmabuf->vmappin=
g_counter++;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON(!dmabuf->vmap_ptr);=

>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ptr =3D dmabuf->vmap_ptr;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON(dma_buf_map_is_null=
(&dmabuf->vmap_ptr));
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ptr =3D dmabuf->vmap_ptr.v=
addr;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out_unlock=
;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 BUG_ON(dmabuf->vmap_ptr);
>> +=C2=A0=C2=A0=C2=A0 BUG_ON(dma_buf_map_is_set(&dmabuf->vmap_ptr));
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ptr =3D dmabuf->ops->vmap(dmabuf=
);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (WARN_ON_ONCE(IS_ERR(ptr)))
>> @@ -1220,7 +1220,7 @@ void *dma_buf_vmap(struct dma_buf *dmabuf)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!ptr)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out_unlock=
;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 dmabuf->vmap_ptr =3D ptr;
>> +=C2=A0=C2=A0=C2=A0 dmabuf->vmap_ptr.vaddr =3D ptr;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dmabuf->vmapping_counter =3D 1;
>> =C2=A0 =C2=A0 out_unlock:
>> @@ -1239,15 +1239,15 @@ void dma_buf_vunmap(struct dma_buf *dmabuf,
>> void *vaddr)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (WARN_ON(!dmabuf))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 BUG_ON(!dmabuf->vmap_ptr);
>> +=C2=A0=C2=A0=C2=A0 BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON(dmabuf->vmapping_counter =3D=3D =
0);
>> -=C2=A0=C2=A0=C2=A0 BUG_ON(dmabuf->vmap_ptr !=3D vaddr);
>> +=C2=A0=C2=A0=C2=A0 BUG_ON(!dma_buf_map_is_vaddr(&dmabuf->vmap_ptr, va=
ddr));
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_lock(&dmabuf->lock);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (--dmabuf->vmapping_counter =3D=3D 0=
) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (dmabuf->ops=
->vunmap)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 dmabuf->ops->vunmap(dmabuf, vaddr);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dmabuf->vmap_ptr =3D NULL;=

>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_buf_map_clear(&dmabuf-=
>vmap_ptr);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&dmabuf->lock);
>> =C2=A0 }
>> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h=

>> new file mode 100644
>> index 000000000000..d4b1bb3cc4b0
>> --- /dev/null
>> +++ b/include/linux/dma-buf-map.h
>> @@ -0,0 +1,87 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Pointer to dma-buf-mapped memory, plus helpers.
>> + */
>> +
>> +#ifndef __DMA_BUF_MAP_H__
>> +#define __DMA_BUF_MAP_H__
>> +
>> +#include <linux/io.h>
>> +
>> +/**
>> + * struct dma_buf_map - Pointer to vmap'ed dma-buf memory.
>> + * @vaddr_iomem:=C2=A0=C2=A0=C2=A0 The buffer's address if in I/O mem=
ory
>> + * @vaddr:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The buffer's add=
ress if in system memory
>> + * @is_iomem:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 True if the d=
ma-buf memory is located in I/O
>> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
memory, or false otherwise.
>> + *
>> + * Calling dma-buf's vmap operation returns a pointer to the buffer.
>> + * Depending on the location of the buffer, users may have to access =
it
>> + * with I/O operations or memory load/store operations. struct
>> dma_buf_map
>> + * stores the buffer address and a flag that signals the required
>> access.
>> + */
>> +struct dma_buf_map {
>> +=C2=A0=C2=A0=C2=A0 union {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void __iomem *vaddr_iomem;=

>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *vaddr;
>> +=C2=A0=C2=A0=C2=A0 };
>> +=C2=A0=C2=A0=C2=A0 bool is_iomem;
>> +};
>> +
>> +/* API transition helper */
>> +static inline bool dma_buf_map_is_vaddr(const struct dma_buf_map
>> *map, const void *vaddr)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return !map->is_iomem && (map->vaddr =3D=3D vaddr)=
;
>> +}
>> +
>> +/**
>> + * dma_buf_map_is_null - Tests for a dma-buf mapping to be NULL
>> + * @map:=C2=A0=C2=A0=C2=A0 The dma-buf mapping structure
>> + *
>> + * Depending on the state of struct dma_buf_map.is_iomem, tests if th=
e
>> + * mapping is NULL.
>> + *
>> + * Returns:
>> + * True if the mapping is NULL, or false otherwise.
>> + */
>> +static inline bool dma_buf_map_is_null(const struct dma_buf_map *map)=

>> +{
>> +=C2=A0=C2=A0=C2=A0 if (map->is_iomem)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return map->vaddr_iomem =3D=
=3D NULL;
>> +=C2=A0=C2=A0=C2=A0 return map->vaddr =3D=3D NULL;
>=20
> This looks like overkill since both pointers are part of the same union=
=2E
>=20
> I suggest to test only one and add a comment.

I've been trying to separate I/O and system memory as much as possible.
I'd rather leave it as it is.

Best regards
Thomas

>=20
>> +}
>> +
>> +/**
>> + * dma_buf_map_is_set - Tests is the dma-buf mapping has been set
>> + * @map:=C2=A0=C2=A0=C2=A0 The dma-buf mapping structure
>> + *
>> + * Depending on the state of struct dma_buf_map.is_iomem, tests if th=
e
>> + * mapping has been set.
>> + *
>> + * Returns:
>> + * True if the mapping is been set, or false otherwise.
>> + */
>> +static inline bool dma_buf_map_is_set(const struct dma_buf_map *map)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return !dma_buf_map_is_null(map);
>> +}
>> +
>> +/**
>> + * dma_buf_map_clear - Clears a dma-buf mapping structure
>> + * @map:=C2=A0=C2=A0=C2=A0 The dma-buf mapping structure
>> + *
>> + * Clears all fields to zero; including struct dma_buf_map.is_iomem. =
So
>> + * mapping structures that were set to point to I/O memory are reset =
for
>> + * system memory. Pointers are cleared to NULL. This is the default.
>> + */
>> +static inline void dma_buf_map_clear(struct dma_buf_map *map)
>> +{
>> +=C2=A0=C2=A0=C2=A0 if (map->is_iomem) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 map->vaddr_iomem =3D NULL;=

>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 map->is_iomem =3D false;
>> +=C2=A0=C2=A0=C2=A0 } else {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 map->vaddr =3D NULL;
>> +=C2=A0=C2=A0=C2=A0 }
>=20
> Maybe just use memset() on the structure.
>=20
> Christian.
>=20
>> +}
>> +
>> +#endif /* __DMA_BUF_MAP_H__ */
>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>> index 957b398d30e5..fcc2ddfb6d18 100644
>> --- a/include/linux/dma-buf.h
>> +++ b/include/linux/dma-buf.h
>> @@ -13,6 +13,7 @@
>> =C2=A0 #ifndef __DMA_BUF_H__
>> =C2=A0 #define __DMA_BUF_H__
>> =C2=A0 +#include <linux/dma-buf-map.h>
>> =C2=A0 #include <linux/file.h>
>> =C2=A0 #include <linux/err.h>
>> =C2=A0 #include <linux/scatterlist.h>
>> @@ -309,7 +310,7 @@ struct dma_buf {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct dma_buf_ops *ops;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mutex lock;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned vmapping_counter;
>> -=C2=A0=C2=A0=C2=A0 void *vmap_ptr;
>> +=C2=A0=C2=A0=C2=A0 struct dma_buf_map vmap_ptr;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *exp_name;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *name;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spinlock_t name_lock;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--a0B5SjwbJ043BiHrfHGQFb73vMfEbDQR3--

--49giZWWPeWjVVqaE8hkWJZ8vcyv1KOI11
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9t1TUUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiMsXAf/Rp7g/ueCyrDxiqYgnjHhJodeYxjU
ITNTefS6a2Pp2f4c2nPOpQrsLZAQI88rALoDareFIFLDt+5hLYXBlr9ZP8PhpU/z
L6SIxyUIFJ0d7doD9OIUPmedRXHkvOshGXnQ1RpNQYA07Aw1QrQeKBdt/nJY6IiJ
4sKVQznERwRv1a3FaUer40F22SuuAbWrH1MQ+TYjbW2nlJx5b4YTQkyOdCdpD8az
Vh/OF7XKAVPYndTILizxt9Wym1E5FRsdPrmsb9+T4SoUZqjvpbvih26gS5A2NmbY
GJJ4Lp5Huc8h/5ZtRHwLECD+RzwXESpcAJAgGfRkInpx9bAaB3BAA3sDSw==
=PsUA
-----END PGP SIGNATURE-----

--49giZWWPeWjVVqaE8hkWJZ8vcyv1KOI11--

--===============1825488280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1825488280==--
