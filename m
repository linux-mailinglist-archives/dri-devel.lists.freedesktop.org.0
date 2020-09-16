Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A64926C1DD
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 12:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780A1895E1;
	Wed, 16 Sep 2020 10:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751D4895E1;
 Wed, 16 Sep 2020 10:48:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 51681ACB8;
 Wed, 16 Sep 2020 10:48:41 +0000 (UTC)
Subject: Re: [PATCH 0/3] dma-buf: Flag vmap'ed memory as system or I/O memory
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200914112521.1327-1-tzimmermann@suse.de>
 <20200916093756.GC438822@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <0378c326-28c6-371e-45d2-8b81ccbda84f@suse.de>
Date: Wed, 16 Sep 2020 12:48:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200916093756.GC438822@phenom.ffwll.local>
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
Cc: christian.koenig@amd.com, airlied@linux.ie, mark.cave-ayland@ilande.co.uk,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 thierry.reding@gmail.com, kraxel@redhat.com, sparclinux@vger.kernel.org,
 sam@ravnborg.org, m.szyprowski@samsung.com, jonathanh@nvidia.com,
 matthew.auld@intel.com, linux+etnaviv@armlinux.org.uk,
 linux-media@vger.kernel.org, pawel@osciak.com, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 thomas.hellstrom@intel.com, rodrigo.vivi@intel.com,
 linux-tegra@vger.kernel.org, mchehab@kernel.org, tfiga@chromium.org,
 kyungmin.park@samsung.com, davem@davemloft.net
Content-Type: multipart/mixed; boundary="===============1532084113=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1532084113==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nXQByYxsytT3RDWIpPfpjMpdHlcFFxi2X"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nXQByYxsytT3RDWIpPfpjMpdHlcFFxi2X
Content-Type: multipart/mixed; boundary="rFu7oUdlsvVBgdrFy5db9ZOzCXnP1tChn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, airlied@linux.ie,
 sam@ravnborg.org, mark.cave-ayland@ilande.co.uk, kraxel@redhat.com,
 davem@davemloft.net, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, pawel@osciak.com,
 m.szyprowski@samsung.com, kyungmin.park@samsung.com, tfiga@chromium.org,
 mchehab@kernel.org, chris@chris-wilson.co.uk, matthew.auld@intel.com,
 thomas.hellstrom@intel.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 etnaviv@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, sparclinux@vger.kernel.org
Message-ID: <0378c326-28c6-371e-45d2-8b81ccbda84f@suse.de>
Subject: Re: [PATCH 0/3] dma-buf: Flag vmap'ed memory as system or I/O memory
References: <20200914112521.1327-1-tzimmermann@suse.de>
 <20200916093756.GC438822@phenom.ffwll.local>
In-Reply-To: <20200916093756.GC438822@phenom.ffwll.local>

--rFu7oUdlsvVBgdrFy5db9ZOzCXnP1tChn
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 16.09.20 um 11:37 schrieb Daniel Vetter:
> On Mon, Sep 14, 2020 at 01:25:18PM +0200, Thomas Zimmermann wrote:
>> Dma-buf provides vmap() and vunmap() for retrieving and releasing mapp=
ings
>> of dma-buf memory in kernel address space. The functions operate with =
plain
>> addresses and the assumption is that the memory can be accessed with l=
oad
>> and store operations. This is not the case on some architectures (e.g.=
,
>> sparc64) where I/O memory can only be accessed with dedicated instruct=
ions.
>>
>> This patchset introduces struct dma_buf_map, which contains the addres=
s of
>> a buffer and a flag that tells whether system- or I/O-memory instructi=
ons
>> are required.
>>
>> Some background: updating the DRM framebuffer console on sparc64 makes=
 the
>> kernel panic. This is because the framebuffer memory cannot be accesse=
d with
>> system-memory instructions. We currently employ a workaround in DRM to=

>> address this specific problem. [1]
>>
>> To resolve the problem, we'd like to address it at the most common poi=
nt,
>> which is the dma-buf framework. The dma-buf mapping ideally knows if I=
/O
>> instructions are required and exports this information to it's users. =
The
>> new structure struct dma_buf_map stores the buffer address and a flag =
that
>> signals I/O memory. Affected users of the buffer (e.g., drivers, frame=
works)
>> can then access the memory accordingly.
>>
>> This patchset only introduces struct dma_buf_map, and updates struct d=
ma_buf
>> and it's interfaces. Further patches can update dma-buf users. For exa=
mple,
>> there's a prototype patchset for DRM that fixes the framebuffer proble=
m. [2]
>>
>> Further work: TTM, one of DRM's memory managers, already exports an
>> is_iomem flag of its own. It could later be switched over to exporting=
 struct
>> dma_buf_map, thus simplifying some code. Several DRM drivers expect th=
eir
>> fbdev console to operate on I/O memory. These could possibly be switch=
ed over
>> to the generic fbdev emulation, as soon as the generic code uses struc=
t
>> dma_buf_map.
>>
>> [1] https://lore.kernel.org/dri-devel/20200725191012.GA434957@ravnborg=
=2Eorg/
>> [2] https://lore.kernel.org/dri-devel/20200806085239.4606-1-tzimmerman=
n@suse.de/
>=20
> lgtm, imo ready to convert the follow-up patches over to this. But I th=
ink
> would be good to get at least some ack from the ttm side for the overal=
l
> plan.

Yup, it would be nice if TTM could had out these types automatically.
Then all TTM-based drivers would automatically support it.

>=20
> Also, I think we should put all the various helpers (writel/readl, mems=
et,
> memcpy, whatever else) into the dma-buf-map.h helper, so that most code=

> using this can just treat it as an abstract pointer type and never look=

> underneath it.

We have some framebuffer helpers that rely on pointer arithmetic, so
we'd need that too. No big deal wrt code, but I was worried about the
overhead. If a loop goes over framebuffer memory, there's an if/else
branch for each access to the memory buffer.

Best regards
Thomas

> -Daniel
>=20
>>
>> Thomas Zimmermann (3):
>>   dma-buf: Add struct dma-buf-map for storing struct dma_buf.vaddr_ptr=

>>   dma-buf: Use struct dma_buf_map in dma_buf_vmap() interfaces
>>   dma-buf: Use struct dma_buf_map in dma_buf_vunmap() interfaces
>>
>>  Documentation/driver-api/dma-buf.rst          |   3 +
>>  drivers/dma-buf/dma-buf.c                     |  40 +++---
>>  drivers/gpu/drm/drm_gem_cma_helper.c          |  16 ++-
>>  drivers/gpu/drm/drm_gem_shmem_helper.c        |  17 ++-
>>  drivers/gpu/drm/drm_prime.c                   |  14 +-
>>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  13 +-
>>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  13 +-
>>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  18 ++-
>>  drivers/gpu/drm/tegra/gem.c                   |  23 ++--
>>  .../common/videobuf2/videobuf2-dma-contig.c   |  17 ++-
>>  .../media/common/videobuf2/videobuf2-dma-sg.c |  19 ++-
>>  .../common/videobuf2/videobuf2-vmalloc.c      |  21 ++-
>>  include/drm/drm_prime.h                       |   5 +-
>>  include/linux/dma-buf-map.h                   | 126 +++++++++++++++++=
+
>>  include/linux/dma-buf.h                       |  11 +-
>>  15 files changed, 274 insertions(+), 82 deletions(-)
>>  create mode 100644 include/linux/dma-buf-map.h
>>
>> --
>> 2.28.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--rFu7oUdlsvVBgdrFy5db9ZOzCXnP1tChn--

--nXQByYxsytT3RDWIpPfpjMpdHlcFFxi2X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9h7XQUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiO/9wf/YTfsgACOA4S0NTMPaK76RpqD2Mv7
pLgoUTnS7ZL4trmmywOzMJc43P+y+N5PhsrLr+sBZEQINyKFnhKNscimba1v+PGq
TtdYT7hrWHK6ibqSV7syhQSpfU9KBsklVz53e8IRYdh2tlZb283wTpJTVVCSFki8
3AWp/1MaHIeYyw3zVIb8IeOFX38n+inYRjkZJT2HkJpJcnN/kF8H4+jbvSohKb3M
KiSfa6veeJy5GghcGPnWMUlyEHBHTNzwYvaAN1OBwQ6FYlUGwRJxBK/bnad/nQoB
KTBcINOvBktCbw0KZBzO76jd0nnrBtS55CruHNRwnP3jAlmkXADHvBbvOg==
=kvDb
-----END PGP SIGNATURE-----

--nXQByYxsytT3RDWIpPfpjMpdHlcFFxi2X--

--===============1532084113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1532084113==--
