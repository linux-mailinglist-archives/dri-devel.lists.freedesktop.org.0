Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3912C321CCF
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 17:25:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C21C6E56D;
	Mon, 22 Feb 2021 16:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15206E56D;
 Mon, 22 Feb 2021 16:25:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 68E2FAC69;
 Mon, 22 Feb 2021 16:25:48 +0000 (UTC)
Subject: Re: [PATCH v2 0/3] drm/prime: Only call dma_map_sgtable() for devices
 with DMA support
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210222124328.27340-1-tzimmermann@suse.de>
 <b190801b-b8be-c9df-f203-3e42eb97cea4@amd.com>
 <238ce852-730b-e31c-a6fe-a9ecaca497e3@suse.de>
 <CAKMK7uE4QxaiGCAX6pYq=dCg5zzs9Jg9iRSjq893OmAZk=OrpA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <4246f9d2-2ce8-151a-fd92-8cf10510adec@suse.de>
Date: Mon, 22 Feb 2021 17:25:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uE4QxaiGCAX6pYq=dCg5zzs9Jg9iRSjq893OmAZk=OrpA@mail.gmail.com>
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
Cc: lima@lists.freedesktop.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Dave Airlie <airlied@linux.ie>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Alan Stern <stern@rowland.harvard.edu>, Qiang Yu <yuq825@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============2069975004=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2069975004==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="d3xLVkw5KzUTX9YHLlu4kLTcdL7CB8o1V"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--d3xLVkw5KzUTX9YHLlu4kLTcdL7CB8o1V
Content-Type: multipart/mixed; boundary="0L9l0vBWnjaMMbEwreRN07Gzry4S2knFx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: lima@lists.freedesktop.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Dave Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, Alan Stern <stern@rowland.harvard.edu>,
 Qiang Yu <yuq825@gmail.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Message-ID: <4246f9d2-2ce8-151a-fd92-8cf10510adec@suse.de>
Subject: Re: [PATCH v2 0/3] drm/prime: Only call dma_map_sgtable() for devices
 with DMA support
References: <20210222124328.27340-1-tzimmermann@suse.de>
 <b190801b-b8be-c9df-f203-3e42eb97cea4@amd.com>
 <238ce852-730b-e31c-a6fe-a9ecaca497e3@suse.de>
 <CAKMK7uE4QxaiGCAX6pYq=dCg5zzs9Jg9iRSjq893OmAZk=OrpA@mail.gmail.com>
In-Reply-To: <CAKMK7uE4QxaiGCAX6pYq=dCg5zzs9Jg9iRSjq893OmAZk=OrpA@mail.gmail.com>

--0L9l0vBWnjaMMbEwreRN07Gzry4S2knFx
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 22.02.21 um 17:10 schrieb Daniel Vetter:
> On Mon, Feb 22, 2021 at 2:24 PM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
>>
>> Hi
>>
>> Am 22.02.21 um 14:09 schrieb Christian K=C3=B6nig:
>>>
>>>
>>> Am 22.02.21 um 13:43 schrieb Thomas Zimmermann:
>>>> USB-based drivers cannot use DMA, so the importing of dma-buf attach=
ments
>>>> currently fails for udl and gm12u320. This breaks joining/mirroring =
of
>>>> displays.
>>>>
>>>> The fix is now a little series. To solve the issue on the importer
>>>> side (i.e., the affected USB-based driver), patch 1 introduces a new=

>>>> PRIME callback, struct drm_driver.gem_prime_create_object, which cre=
ates
>>>> an object and gives more control to the importing driver. Specifical=
ly,
>>>> udl and gm12u320 can now avoid the creation of a scatter/gather tabl=
e
>>>> for the imported pages. Patch 1 is self-contained in the sense that =
it
>>>> can be backported into older kernels.
>>>
>>> Mhm, that sounds like a little overkill to me.
>>>
>>> Drivers can already import the DMA-bufs all by them selves without th=
e
>>> help of the DRM functions. See amdgpu for an example.
>>>
>>> Daniel also already noted to me that he sees the DRM helper as a bit
>>> questionable middle layer.
>>
>> And this bug proves that it is. :)
>=20
> The trouble here is actually gem_bo->import_attach, which isn't really
> part of the questionable midlayer, but fairly mandatory (only
> exception is vmwgfx because not using gem) caching to make sure we
> don't end up with duped imports and fun stuff like that.
>=20
> And dma_buf_attach now implicitly creates the sg table already, so
> we're already in game over land. I think we'd need to make
> import_attach a union with import_buf or something like that, so that
> you can do attachment-less importing.

Creating the sg table is not the problem; mapping it is. So=20
dma_buf_attach shouldn't be a problem.

>=20
>>> Have you thought about doing that instead?
>>
>> There appears to be some useful code in drm_gem_prime_import_dev(). Bu=
t
>> if the general sentiment goes towards removing
>> gem_prime_import_sg_table, we can work towards that as well.
>=20
> I still think this part is a bit a silly midlayer for no good reason,
> but I think that's orthogonal to the issue at hand here.
>=20
> I'd suggest we first try to paper over the issue by using
> prime_import_dev with the host controller (which hopefully is
> dma-capable for most systems). And then, at leisure, try to untangle
> the obj->import_attach issue.

I really don't want to do this. My time is also limited, and I''ll spend =

time papering over the thing. And then more time for the real fix. I'd=20
rather pull drm_gem_prime_import_dev() in to USB drivers and avoid the=20
dma_buf_map().

Best regard
Thomas

> -Daniel
>=20
>>
>> Best regards
>> Thomas
>>
>>>
>>> Christian.
>>>
>>>>
>>>> Patches 2 and 3 update SHMEM and CMA helpers to use the new callback=
=2E
>>>> Effectively this moves the sg table setup from the PRIME helpers int=
o
>>>> the memory managers. SHMEM now supports devices without DMA support,=

>>>> so custom code can be removed from udl and g12u320.
>>>>
>>>> Tested by joining/mirroring displays of udl and radeon under Gnome/X=
11.
>>>>
>>>> v2:
>>>>      * move fix to importer side (Christian, Daniel)
>>>>      * update SHMEM and CMA helpers for new PRIME callbacks
>>>>
>>>> Thomas Zimmermann (3):
>>>>     drm: Support importing dmabufs into drivers without DMA
>>>>     drm/shmem-helper: Implement struct drm_driver.gem_prime_create_o=
bject
>>>>     drm/cma-helper: Implement struct drm_driver.gem_prime_create_obj=
ect
>>>>
>>>>    drivers/gpu/drm/drm_gem_cma_helper.c    | 62 ++++++++++++++------=
-----
>>>>    drivers/gpu/drm/drm_gem_shmem_helper.c  | 38 ++++++++++-----
>>>>    drivers/gpu/drm/drm_prime.c             | 43 +++++++++++------
>>>>    drivers/gpu/drm/lima/lima_drv.c         |  2 +-
>>>>    drivers/gpu/drm/panfrost/panfrost_drv.c |  2 +-
>>>>    drivers/gpu/drm/panfrost/panfrost_gem.c |  6 +--
>>>>    drivers/gpu/drm/panfrost/panfrost_gem.h |  4 +-
>>>>    drivers/gpu/drm/pl111/pl111_drv.c       |  8 ++--
>>>>    drivers/gpu/drm/v3d/v3d_bo.c            |  6 +--
>>>>    drivers/gpu/drm/v3d/v3d_drv.c           |  2 +-
>>>>    drivers/gpu/drm/v3d/v3d_drv.h           |  5 +-
>>>>    include/drm/drm_drv.h                   | 12 +++++
>>>>    include/drm/drm_gem_cma_helper.h        | 12 ++---
>>>>    include/drm/drm_gem_shmem_helper.h      |  6 +--
>>>>    14 files changed, 120 insertions(+), 88 deletions(-)
>>>>
>>>> --
>>>> 2.30.1
>>>>
>>>
>>
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--0L9l0vBWnjaMMbEwreRN07Gzry4S2knFx--

--d3xLVkw5KzUTX9YHLlu4kLTcdL7CB8o1V
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAz2woFAwAAAAAACgkQlh/E3EQov+DL
4Q//YMyMKXRJ62uNhmm25TZ9vhXivz7iMQfcdCfedLKszEr08dduggjMgKDAjRwqdYbQQBrmLwBH
Zc+cpjIzkEtQKm6zqkKTyvqcQYKS4eqjbK9svhk2F8EkrQmR42xhlK3p0z7ULre06b4cvFQ1Gh97
m4JLkeG6fB/RwWfXPm8yHWrzKP25CYlF1n9xjAq+W+JUT/scIhxxGblm2n1zOfau89pxhLFbwoYC
M/tlkZjlg9ZtvN0fy8F8eAhs3yln0diu+/n5G2n0/n4ujVPmWpGrgUt+IgE1i+UYGLkC26zYGMVH
qByXW15+9GdV8yYKezirwyqEktcVpaIJLLPoSqb1hHAUfQiWIjYOtfFIwx+OPRIbyREV5wraom6T
SNB5XlLRAKq1JHyfZFEltv5Konrzq63Ekw+eLWfzGmJ5IoigURowPC3sq3vEL2sw2Y0QYdF3ahod
N3PmuPXiSiczyM3mct80Lsh1ZRvDSrB5E7758asLySnNp9EVEQF/Xedz+O+31zRVPVp3hH4e6nUE
zSscIAyZFyf5Mqf9ZwPkulssfsiOXqEVm4jMvYyKV78L2w9MjzFApQCVivmOEXAG3x/PKRH5TSfh
CJLRsdFW+Nx3BSz72YP0WUrmr20L3oxejcuBaDNVVFKV2/dOuuKBmYv1ITtAJ3YPr04IUK3IMJwC
LoI=
=kWAS
-----END PGP SIGNATURE-----

--d3xLVkw5KzUTX9YHLlu4kLTcdL7CB8o1V--

--===============2069975004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2069975004==--
