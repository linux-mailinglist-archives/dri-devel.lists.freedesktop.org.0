Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE0026C329
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 15:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C406EA1F;
	Wed, 16 Sep 2020 13:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5A66E9F5;
 Wed, 16 Sep 2020 13:12:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AB2DDAC85;
 Wed, 16 Sep 2020 13:13:13 +0000 (UTC)
Subject: Re: [PATCH 0/3] dma-buf: Flag vmap'ed memory as system or I/O memory
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20200914112521.1327-1-tzimmermann@suse.de>
 <20200916093756.GC438822@phenom.ffwll.local>
 <0378c326-28c6-371e-45d2-8b81ccbda84f@suse.de>
 <20200916122405.GQ438822@phenom.ffwll.local>
 <53743f37-4142-c076-296f-bfcba0840121@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <e5bc20e5-b2ce-27f1-58eb-67512354db7b@suse.de>
Date: Wed, 16 Sep 2020 15:12:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <53743f37-4142-c076-296f-bfcba0840121@amd.com>
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
Cc: airlied@linux.ie, mark.cave-ayland@ilande.co.uk,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 thierry.reding@gmail.com, kraxel@redhat.com, sparclinux@vger.kernel.org,
 sam@ravnborg.org, m.szyprowski@samsung.com, jonathanh@nvidia.com,
 matthew.auld@intel.com, linux+etnaviv@armlinux.org.uk,
 linux-media@vger.kernel.org, pawel@osciak.com, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 thomas.hellstrom@intel.com, rodrigo.vivi@intel.com,
 linux-tegra@vger.kernel.org, mchehab@kernel.org, tfiga@chromium.org,
 kyungmin.park@samsung.com, davem@davemloft.net
Content-Type: multipart/mixed; boundary="===============0677318029=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0677318029==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0g7aTSPvgSEtomdsbihQVgsVseU9ErIOA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0g7aTSPvgSEtomdsbihQVgsVseU9ErIOA
Content-Type: multipart/mixed; boundary="4dKgBnEqtU7ClYPh4sxp2EbLPUNEl4i1i";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@linux.ie, mark.cave-ayland@ilande.co.uk,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 thierry.reding@gmail.com, kraxel@redhat.com, sparclinux@vger.kernel.org,
 sam@ravnborg.org, m.szyprowski@samsung.com, jonathanh@nvidia.com,
 matthew.auld@intel.com, linux+etnaviv@armlinux.org.uk,
 linux-media@vger.kernel.org, pawel@osciak.com,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, thomas.hellstrom@intel.com,
 rodrigo.vivi@intel.com, linux-tegra@vger.kernel.org, mchehab@kernel.org,
 tfiga@chromium.org, kyungmin.park@samsung.com, davem@davemloft.net
Message-ID: <e5bc20e5-b2ce-27f1-58eb-67512354db7b@suse.de>
Subject: Re: [PATCH 0/3] dma-buf: Flag vmap'ed memory as system or I/O memory
References: <20200914112521.1327-1-tzimmermann@suse.de>
 <20200916093756.GC438822@phenom.ffwll.local>
 <0378c326-28c6-371e-45d2-8b81ccbda84f@suse.de>
 <20200916122405.GQ438822@phenom.ffwll.local>
 <53743f37-4142-c076-296f-bfcba0840121@amd.com>
In-Reply-To: <53743f37-4142-c076-296f-bfcba0840121@amd.com>

--4dKgBnEqtU7ClYPh4sxp2EbLPUNEl4i1i
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 16.09.20 um 14:59 schrieb Christian K=C3=B6nig:
> Am 16.09.20 um 14:24 schrieb Daniel Vetter:
>> On Wed, Sep 16, 2020 at 12:48:20PM +0200, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 16.09.20 um 11:37 schrieb Daniel Vetter:
>>>> On Mon, Sep 14, 2020 at 01:25:18PM +0200, Thomas Zimmermann wrote:
>>>>> Dma-buf provides vmap() and vunmap() for retrieving and releasing
>>>>> mappings
>>>>> of dma-buf memory in kernel address space. The functions operate
>>>>> with plain
>>>>> addresses and the assumption is that the memory can be accessed
>>>>> with load
>>>>> and store operations. This is not the case on some architectures
>>>>> (e.g.,
>>>>> sparc64) where I/O memory can only be accessed with dedicated
>>>>> instructions.
>>>>>
>>>>> This patchset introduces struct dma_buf_map, which contains the
>>>>> address of
>>>>> a buffer and a flag that tells whether system- or I/O-memory
>>>>> instructions
>>>>> are required.
>>>>>
>>>>> Some background: updating the DRM framebuffer console on sparc64
>>>>> makes the
>>>>> kernel panic. This is because the framebuffer memory cannot be
>>>>> accessed with
>>>>> system-memory instructions. We currently employ a workaround in DRM=
 to
>>>>> address this specific problem. [1]
>>>>>
>>>>> To resolve the problem, we'd like to address it at the most common
>>>>> point,
>>>>> which is the dma-buf framework. The dma-buf mapping ideally knows
>>>>> if I/O
>>>>> instructions are required and exports this information to it's
>>>>> users. The
>>>>> new structure struct dma_buf_map stores the buffer address and a
>>>>> flag that
>>>>> signals I/O memory. Affected users of the buffer (e.g., drivers,
>>>>> frameworks)
>>>>> can then access the memory accordingly.
>>>>>
>>>>> This patchset only introduces struct dma_buf_map, and updates
>>>>> struct dma_buf
>>>>> and it's interfaces. Further patches can update dma-buf users. For
>>>>> example,
>>>>> there's a prototype patchset for DRM that fixes the framebuffer
>>>>> problem. [2]
>>>>>
>>>>> Further work: TTM, one of DRM's memory managers, already exports an=

>>>>> is_iomem flag of its own. It could later be switched over to
>>>>> exporting struct
>>>>> dma_buf_map, thus simplifying some code. Several DRM drivers expect=

>>>>> their
>>>>> fbdev console to operate on I/O memory. These could possibly be
>>>>> switched over
>>>>> to the generic fbdev emulation, as soon as the generic code uses
>>>>> struct
>>>>> dma_buf_map.
>>>>>
>>>>> [1]
>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flore.kernel.org%2Fdri-devel%2F20200725191012.GA434957%40ravnborg.org%2F&=
amp;data=3D02%7C01%7Cchristian.koenig%40amd.com%7C04e3cc3e03ae40f1fa0f08d=
85a3b6a68%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637358558524732385=
&amp;sdata=3DwTmFuB95GhKUU%2F2Q91V0%2BtzAu4%2BEe3VBUcriBy3jx2g%3D&amp;res=
erved=3D0
>>>>>
>>>>> [2]
>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flore.kernel.org%2Fdri-devel%2F20200806085239.4606-1-tzimmermann%40suse.d=
e%2F&amp;data=3D02%7C01%7Cchristian.koenig%40amd.com%7C04e3cc3e03ae40f1fa=
0f08d85a3b6a68%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6373585585247=
32385&amp;sdata=3DL4rBHmegO63b%2FiTQdTyH158KNxAZwSuJCQOaFszo5L0%3D&amp;re=
served=3D0
>>>>>
>>>> lgtm, imo ready to convert the follow-up patches over to this. But I=

>>>> think
>>>> would be good to get at least some ack from the ttm side for the
>>>> overall
>>>> plan.
>>> Yup, it would be nice if TTM could had out these types automatically.=

>>> Then all TTM-based drivers would automatically support it.
>>>
>>>> Also, I think we should put all the various helpers (writel/readl,
>>>> memset,
>>>> memcpy, whatever else) into the dma-buf-map.h helper, so that most c=
ode
>>>> using this can just treat it as an abstract pointer type and never l=
ook
>>>> underneath it.
>>> We have some framebuffer helpers that rely on pointer arithmetic, so
>>> we'd need that too. No big deal wrt code, but I was worried about the=

>>> overhead. If a loop goes over framebuffer memory, there's an if/else
>>> branch for each access to the memory buffer.
>> If we make all the helpers static inline, then the compiler should be
>> able
>> to see that dma_buf_map.is_iomem is always the same, and produced real=
ly
>> optimized code for it by pulling that check out from all the loops.
>>
>> So should only result in somewhat verbose code of having to call
>> dma_buf_map pointer arthimetic helpers, but not in bad generated code.=

>> Still worth double-checking I think, since e.g. on x86 the generated c=
ode
>> should be the same for both cases (but maybe the compiler doesn't see
>> through the inline asm to realize that, so we might end up with 2
>> copies).
>=20
> Can we have that even independent of DMA-buf? We have essentially the
> same problem in TTM and the code around that is a complete mess if you
> ask me.

I already put this into dma-buf because it's at the intersection of all
the affected modules. For non-dma-buf pointers (say in framebuffer
damage handling), the idea is to initialize struct dma_buf_map by hand
and use this.

Where would you want to put it?

Best regards
Thomas

>=20
> Christian.
>=20
>> -Daniel
>>
>>
>>> Best regards
>>> Thomas
>>>
>>>> -Daniel
>>>>
>>>>> Thomas Zimmermann (3):
>>>>> =C2=A0=C2=A0 dma-buf: Add struct dma-buf-map for storing struct
>>>>> dma_buf.vaddr_ptr
>>>>> =C2=A0=C2=A0 dma-buf: Use struct dma_buf_map in dma_buf_vmap() inte=
rfaces
>>>>> =C2=A0=C2=A0 dma-buf: Use struct dma_buf_map in dma_buf_vunmap() in=
terfaces
>>>>>
>>>>> =C2=A0 Documentation/driver-api/dma-buf.rst=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
>>>>> =C2=A0 drivers/dma-buf/dma-buf.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 40 +++---
>>>>> =C2=A0 drivers/gpu/drm/drm_gem_cma_helper.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16 ++-
>>>>> =C2=A0 drivers/gpu/drm/drm_gem_shmem_helper.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 17 ++-
>>>>> =C2=A0 drivers/gpu/drm/drm_prime.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 14 +-
>>>>> =C2=A0 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c=C2=A0=C2=A0 |=C2=
=A0 13 +-
>>>>> =C2=A0 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c=C2=A0=C2=A0=C2=A0=
 |=C2=A0 13 +-
>>>>> =C2=A0 .../drm/i915/gem/selftests/i915_gem_dmabuf.c=C2=A0 |=C2=A0 1=
8 ++-
>>>>> =C2=A0 drivers/gpu/drm/tegra/gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 23 ++--
>>>>> =C2=A0 .../common/videobuf2/videobuf2-dma-contig.c=C2=A0=C2=A0 |=C2=
=A0 17 ++-
>>>>> =C2=A0 .../media/common/videobuf2/videobuf2-dma-sg.c |=C2=A0 19 ++-=

>>>>> =C2=A0 .../common/videobuf2/videobuf2-vmalloc.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 21 ++-
>>>>> =C2=A0 include/drm/drm_prime.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
>>>>> =C2=A0 include/linux/dma-buf-map.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 126
>>>>> ++++++++++++++++++
>>>>> =C2=A0 include/linux/dma-buf.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 11 +-
>>>>> =C2=A0 15 files changed, 274 insertions(+), 82 deletions(-)
>>>>> =C2=A0 create mode 100644 include/linux/dma-buf-map.h
>>>>>
>>>>> --=20
>>>>> 2.28.0
>>>>>
>>> --=C2=A0
>>> Thomas Zimmermann
>>> Graphics Driver Developer
>>> SUSE Software Solutions Germany GmbH
>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>>> (HRB 36809, AG N=C3=BCrnberg)
>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>>
>>
>>
>>
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


--4dKgBnEqtU7ClYPh4sxp2EbLPUNEl4i1i--

--0g7aTSPvgSEtomdsbihQVgsVseU9ErIOA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9iD1YUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPqdAf/SAg5vR+VFpziVn7zNPHLhG1cH/8g
0fJB6+sQmlXaZ0yOCGkAhFTiau5wI1x4qwUzU1FTvmWXbYfEjj+i9D02OK4PV0rI
mKYUY+HDsTwugi1rnu3aBIfTyLd4YaWJfruXiZQ5GWn38rOQ17a2xb4xr7+ZCBqd
cs+jX+Vy2s3H163IH3b3fBgSbo9PCQXEZZTgD1QH2sbzmJpiH7MBMvqM0gJXS/wQ
a1b8bGftkjhX1OE0I664OJplM2VOFn8UCZ9Tw0oeXk8pUWWtZN7T6U6pKe4esAo9
yZ6/ezT5ex0FsFFonJJ2afOXQIJk7NiaXzeOg8HKj53cO4Df6G2fZVcWoQ==
=Q1x6
-----END PGP SIGNATURE-----

--0g7aTSPvgSEtomdsbihQVgsVseU9ErIOA--

--===============0677318029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0677318029==--
