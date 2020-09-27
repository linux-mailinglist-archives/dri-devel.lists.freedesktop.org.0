Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 025F327A25B
	for <lists+dri-devel@lfdr.de>; Sun, 27 Sep 2020 20:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40FAB89F2E;
	Sun, 27 Sep 2020 18:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6D989F2E;
 Sun, 27 Sep 2020 18:36:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5DB8BAD1A;
 Sun, 27 Sep 2020 18:36:12 +0000 (UTC)
Subject: Re: [PATCH v3 0/4] dma-buf: Flag vmap'ed memory as system or I/O
 memory
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200925115601.23955-1-tzimmermann@suse.de>
 <20200926071334.GA42915@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <8761e0dd-569e-0ea0-7bc5-25e4f7cb67cc@suse.de>
Date: Sun, 27 Sep 2020 20:36:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200926071334.GA42915@ravnborg.org>
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
Cc: linux-doc@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, kraxel@redhat.com,
 afd@ti.com, m.szyprowski@samsung.com, arnd@arndb.de, corbet@lwn.net,
 jonathanh@nvidia.com, matthew.auld@intel.com, linux+etnaviv@armlinux.org.uk,
 labbott@redhat.com, linux-media@vger.kernel.org, pawel@osciak.com,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, thomas.hellstrom@intel.com,
 rodrigo.vivi@intel.com, linux-tegra@vger.kernel.org, mchehab@kernel.org,
 gregkh@linuxfoundation.org, lmark@codeaurora.org, tfiga@chromium.org,
 kyungmin.park@samsung.com, robin.murphy@arm.com, christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============1544319056=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1544319056==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="hhzdij9h3h5l7FmCv0soJzCgJCNlXGmQ7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hhzdij9h3h5l7FmCv0soJzCgJCNlXGmQ7
Content-Type: multipart/mixed; boundary="JSVXy7fTE5UylfGVVSA7JgWciPcmDmtcJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: christian.koenig@amd.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 kraxel@redhat.com, tfiga@chromium.org, m.szyprowski@samsung.com,
 arnd@arndb.de, corbet@lwn.net, linux-doc@vger.kernel.org,
 jonathanh@nvidia.com, matthew.auld@intel.com, linux+etnaviv@armlinux.org.uk,
 labbott@redhat.com, linux-media@vger.kernel.org, pawel@osciak.com,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, thomas.hellstrom@intel.com,
 rodrigo.vivi@intel.com, linux-tegra@vger.kernel.org, mchehab@kernel.org,
 gregkh@linuxfoundation.org, lmark@codeaurora.org, afd@ti.com,
 kyungmin.park@samsung.com, robin.murphy@arm.com
Message-ID: <8761e0dd-569e-0ea0-7bc5-25e4f7cb67cc@suse.de>
Subject: Re: [PATCH v3 0/4] dma-buf: Flag vmap'ed memory as system or I/O
 memory
References: <20200925115601.23955-1-tzimmermann@suse.de>
 <20200926071334.GA42915@ravnborg.org>
In-Reply-To: <20200926071334.GA42915@ravnborg.org>

--JSVXy7fTE5UylfGVVSA7JgWciPcmDmtcJ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

Am 26.09.20 um 09:13 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> Sorry for chiming in late here, have been offline for a while.
>=20
> On Fri, Sep 25, 2020 at 01:55:57PM +0200, Thomas Zimmermann wrote:
>> Dma-buf provides vmap() and vunmap() for retriving and releasing mappi=
ngs
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
>=20
> The whole idea with a struct that can represent both a pointer to syste=
m
> memory and io memory is very nice.
> dma-buf is one user of this but we may/will see other users. So the
> naming seems of as this should be a concept independent of dma-buf.
>=20
> And then the struct definition and all the helpers should be moved away=

> from dma-buf.
>=20
> Maybe something like this:
>=20
> struct simap {
>        union {
>                void __iomem *vaddr_iomem;
>                void *vaddr;
>        };
>        bool is_iomem;
> };
>=20
> Where simap is a shorthand for system_iomem_map
> And it could al be stuffed into a include/linux/simap.h file.
>=20
> Not totally sold on the simap name - but wanted to come up with
> something.

Yes. Others, myself included, have suggested to use a name that does not
imply a connection to the dma-buf framework, but no one has come up with
 a good name.

I strongly dislike simap, as it's entirely non-obvious what it does.
dma-buf-map is not actually wrong. The structures represents the mapping
of a dma-able buffer in most cases.

>=20
> With this approach users do not have to pull in dma-buf to use it and
> users will not confuse that this is only for dma-buf usage.

There's no need to enable dma-buf. It's all in the header file without
dependencies on dma-buf. It's really just the name.

But there's something else to take into account. The whole issue here is
that the buffer is disconnected from its originating driver, so we don't
know which kind of memory ops we have to use. Thinking about it, I
realized that no one else seemed to have this problem until now.
Otherwise there would be a solution already. So maybe the dma-buf
framework *is* the native use case for this data structure.

Anyway, if a better name than dma-buf-map comes in, I'm willing to
rename the thing. Otherwise I intend to merge the patchset by the end of
the week.

Best regards
Thomas

>=20
> I am sorry for being late with the feedback.
>=20
> 	Sam
>=20
>=20
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
>> v3:
>> 	* update fastrpc driver (kernel test robot)
>> 	* expand documentation (Daniel)
>> 	* move documentation into separate patch
>> v2:
>> 	* always clear map parameter in dma_buf_vmap() (Daniel)
>> 	* include dma-buf-heaps and i915 selftests (kernel test robot)
>> 	* initialize cma_obj before using it in drm_gem_cma_free_object()
>> 	  (kernel test robot)
>>
>> [1] https://lore.kernel.org/dri-devel/20200725191012.GA434957@ravnborg=
=2Eorg/
>> [2] https://lore.kernel.org/dri-devel/20200806085239.4606-1-tzimmerman=
n@suse.de/
>>
>> Thomas Zimmermann (4):
>>   dma-buf: Add struct dma-buf-map for storing struct dma_buf.vaddr_ptr=

>>   dma-buf: Use struct dma_buf_map in dma_buf_vmap() interfaces
>>   dma-buf: Use struct dma_buf_map in dma_buf_vunmap() interfaces
>>   dma-buf: Document struct dma_buf_map
>>
>>  Documentation/driver-api/dma-buf.rst          |   9 +
>>  drivers/dma-buf/dma-buf.c                     |  42 ++--
>>  drivers/dma-buf/heaps/heap-helpers.c          |  10 +-
>>  drivers/gpu/drm/drm_gem_cma_helper.c          |  20 +-
>>  drivers/gpu/drm/drm_gem_shmem_helper.c        |  17 +-
>>  drivers/gpu/drm/drm_prime.c                   |  15 +-
>>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  13 +-
>>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  13 +-
>>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  18 +-
>>  .../gpu/drm/i915/gem/selftests/mock_dmabuf.c  |  14 +-
>>  drivers/gpu/drm/tegra/gem.c                   |  23 ++-
>>  .../common/videobuf2/videobuf2-dma-contig.c   |  17 +-
>>  .../media/common/videobuf2/videobuf2-dma-sg.c |  19 +-
>>  .../common/videobuf2/videobuf2-vmalloc.c      |  21 +-
>>  drivers/misc/fastrpc.c                        |   6 +-
>>  include/drm/drm_prime.h                       |   5 +-
>>  include/linux/dma-buf-map.h                   | 193 +++++++++++++++++=
+
>>  include/linux/dma-buf.h                       |  11 +-
>>  18 files changed, 372 insertions(+), 94 deletions(-)
>>  create mode 100644 include/linux/dma-buf-map.h
>>
>> --
>> 2.28.0
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


--JSVXy7fTE5UylfGVVSA7JgWciPcmDmtcJ--

--hhzdij9h3h5l7FmCv0soJzCgJCNlXGmQ7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9w25oUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiOPvQf9H3xIxlKoNjkmNDMgSLtVcoOhqWxL
rCrmmDXAtxJJ16fx4daY/2Vk8Zxc5B4msQ/Y9JC4uzMT16ZaeOpLcjqS6d4QSNk4
4tRmIwMcB9Ok6DmxoInzpOxgbvmZ3m2zNBQGOjEwvVXVfBpBeLE0RvoZ3xOsRS2x
JyHO66Xj7RV5cZXrgWaj2ZRoalKpzJh6wa/3w73ZfELwBLg85eibKenYGwc5fSl5
asogcXmB5kKBfuLgQojKfNXqCRUAICy21AFAFQ9fwrscGAs3XaRN7J25DP7lBwwp
/508HXeAuIgJ9ANkdk7kHeJ5S5oKFG8CNAYYsbFvZsgTmUm+uLtnEDh8rQ==
=Vk2o
-----END PGP SIGNATURE-----

--hhzdij9h3h5l7FmCv0soJzCgJCNlXGmQ7--

--===============1544319056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1544319056==--
