Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D20322701
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 09:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F2089F45;
	Tue, 23 Feb 2021 08:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71AB89E0D;
 Tue, 23 Feb 2021 08:19:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 32422AC6E;
 Tue, 23 Feb 2021 08:19:33 +0000 (UTC)
Subject: Re: [PATCH v2 0/3] drm/prime: Only call dma_map_sgtable() for devices
 with DMA support
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210222124328.27340-1-tzimmermann@suse.de>
 <b190801b-b8be-c9df-f203-3e42eb97cea4@amd.com>
 <238ce852-730b-e31c-a6fe-a9ecaca497e3@suse.de>
 <CAKMK7uE4QxaiGCAX6pYq=dCg5zzs9Jg9iRSjq893OmAZk=OrpA@mail.gmail.com>
 <4246f9d2-2ce8-151a-fd92-8cf10510adec@suse.de>
 <YDPdKoTewh6HMhVM@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <9c92c303-5ce9-e09b-60c2-bc7cf8ec6146@suse.de>
Date: Tue, 23 Feb 2021 09:19:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YDPdKoTewh6HMhVM@phenom.ffwll.local>
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
 Dave Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>
Content-Type: multipart/mixed; boundary="===============0935301458=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0935301458==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Aka95Yog5J18D5w9fRfNvSgzDFyLE9Yvu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Aka95Yog5J18D5w9fRfNvSgzDFyLE9Yvu
Content-Type: multipart/mixed; boundary="0u0KLXX9po0CNh551RVjBycX4dbOk98KB";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: lima@lists.freedesktop.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Dave Airlie <airlied@linux.ie>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, Alan Stern <stern@rowland.harvard.edu>,
 Qiang Yu <yuq825@gmail.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Message-ID: <9c92c303-5ce9-e09b-60c2-bc7cf8ec6146@suse.de>
Subject: Re: [PATCH v2 0/3] drm/prime: Only call dma_map_sgtable() for devices
 with DMA support
References: <20210222124328.27340-1-tzimmermann@suse.de>
 <b190801b-b8be-c9df-f203-3e42eb97cea4@amd.com>
 <238ce852-730b-e31c-a6fe-a9ecaca497e3@suse.de>
 <CAKMK7uE4QxaiGCAX6pYq=dCg5zzs9Jg9iRSjq893OmAZk=OrpA@mail.gmail.com>
 <4246f9d2-2ce8-151a-fd92-8cf10510adec@suse.de>
 <YDPdKoTewh6HMhVM@phenom.ffwll.local>
In-Reply-To: <YDPdKoTewh6HMhVM@phenom.ffwll.local>

--0u0KLXX9po0CNh551RVjBycX4dbOk98KB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 22.02.21 um 17:34 schrieb Daniel Vetter:
> On Mon, Feb 22, 2021 at 05:25:46PM +0100, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 22.02.21 um 17:10 schrieb Daniel Vetter:
>>> On Mon, Feb 22, 2021 at 2:24 PM Thomas Zimmermann <tzimmermann@suse.d=
e> wrote:
>>>>
>>>> Hi
>>>>
>>>> Am 22.02.21 um 14:09 schrieb Christian K=C3=B6nig:
>>>>>
>>>>>
>>>>> Am 22.02.21 um 13:43 schrieb Thomas Zimmermann:
>>>>>> USB-based drivers cannot use DMA, so the importing of dma-buf atta=
chments
>>>>>> currently fails for udl and gm12u320. This breaks joining/mirrorin=
g of
>>>>>> displays.
>>>>>>
>>>>>> The fix is now a little series. To solve the issue on the importer=

>>>>>> side (i.e., the affected USB-based driver), patch 1 introduces a n=
ew
>>>>>> PRIME callback, struct drm_driver.gem_prime_create_object, which c=
reates
>>>>>> an object and gives more control to the importing driver. Specific=
ally,
>>>>>> udl and gm12u320 can now avoid the creation of a scatter/gather ta=
ble
>>>>>> for the imported pages. Patch 1 is self-contained in the sense tha=
t it
>>>>>> can be backported into older kernels.
>>>>>
>>>>> Mhm, that sounds like a little overkill to me.
>>>>>
>>>>> Drivers can already import the DMA-bufs all by them selves without =
the
>>>>> help of the DRM functions. See amdgpu for an example.
>>>>>
>>>>> Daniel also already noted to me that he sees the DRM helper as a bi=
t
>>>>> questionable middle layer.
>>>>
>>>> And this bug proves that it is. :)
>>>
>>> The trouble here is actually gem_bo->import_attach, which isn't reall=
y
>>> part of the questionable midlayer, but fairly mandatory (only
>>> exception is vmwgfx because not using gem) caching to make sure we
>>> don't end up with duped imports and fun stuff like that.
>>>
>>> And dma_buf_attach now implicitly creates the sg table already, so
>>> we're already in game over land. I think we'd need to make
>>> import_attach a union with import_buf or something like that, so that=

>>> you can do attachment-less importing.
>>
>> Creating the sg table is not the problem; mapping it is. So dma_buf_at=
tach
>> shouldn't be a problem.
>=20
> dma_buf_attach will create a cached sg-mapping for you if the exporter =
is
> dynamic. Currently that's only the case for amdgpu, I guess you didn't
> test with that.
>=20
> So yeah dma_buf_attach is a problem already. And if we can't attach, th=
e
> entire obj->import_attach logic in drm_prime.c falls over, and we get a=
ll
> kinds of fun with double import and re-export.

OK, I give up. I'll send out the patch with the usb controller later toda=
y.

Best regards
Thomas

>=20
>>>>> Have you thought about doing that instead?
>>>>
>>>> There appears to be some useful code in drm_gem_prime_import_dev(). =
But
>>>> if the general sentiment goes towards removing
>>>> gem_prime_import_sg_table, we can work towards that as well.
>>>
>>> I still think this part is a bit a silly midlayer for no good reason,=

>>> but I think that's orthogonal to the issue at hand here.
>>>
>>> I'd suggest we first try to paper over the issue by using
>>> prime_import_dev with the host controller (which hopefully is
>>> dma-capable for most systems). And then, at leisure, try to untangle
>>> the obj->import_attach issue.
>>
>> I really don't want to do this. My time is also limited, and I''ll spe=
nd
>> time papering over the thing. And then more time for the real fix. I'd=

>> rather pull drm_gem_prime_import_dev() in to USB drivers and avoid the=

>> dma_buf_map().
>=20
> Yeah I understand, it's just (as usual :-/) more complex than it seems =
=2E..
> -Daniel
>=20
>>
>> Best regard
>> Thomas
>>
>>> -Daniel
>>>
>>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>>
>>>>> Christian.
>>>>>
>>>>>>
>>>>>> Patches 2 and 3 update SHMEM and CMA helpers to use the new callba=
ck.
>>>>>> Effectively this moves the sg table setup from the PRIME helpers i=
nto
>>>>>> the memory managers. SHMEM now supports devices without DMA suppor=
t,
>>>>>> so custom code can be removed from udl and g12u320.
>>>>>>
>>>>>> Tested by joining/mirroring displays of udl and radeon under Gnome=
/X11.
>>>>>>
>>>>>> v2:
>>>>>>       * move fix to importer side (Christian, Daniel)
>>>>>>       * update SHMEM and CMA helpers for new PRIME callbacks
>>>>>>
>>>>>> Thomas Zimmermann (3):
>>>>>>      drm: Support importing dmabufs into drivers without DMA
>>>>>>      drm/shmem-helper: Implement struct drm_driver.gem_prime_creat=
e_object
>>>>>>      drm/cma-helper: Implement struct drm_driver.gem_prime_create_=
object
>>>>>>
>>>>>>     drivers/gpu/drm/drm_gem_cma_helper.c    | 62 ++++++++++++++---=
--------
>>>>>>     drivers/gpu/drm/drm_gem_shmem_helper.c  | 38 ++++++++++-----
>>>>>>     drivers/gpu/drm/drm_prime.c             | 43 +++++++++++------=

>>>>>>     drivers/gpu/drm/lima/lima_drv.c         |  2 +-
>>>>>>     drivers/gpu/drm/panfrost/panfrost_drv.c |  2 +-
>>>>>>     drivers/gpu/drm/panfrost/panfrost_gem.c |  6 +--
>>>>>>     drivers/gpu/drm/panfrost/panfrost_gem.h |  4 +-
>>>>>>     drivers/gpu/drm/pl111/pl111_drv.c       |  8 ++--
>>>>>>     drivers/gpu/drm/v3d/v3d_bo.c            |  6 +--
>>>>>>     drivers/gpu/drm/v3d/v3d_drv.c           |  2 +-
>>>>>>     drivers/gpu/drm/v3d/v3d_drv.h           |  5 +-
>>>>>>     include/drm/drm_drv.h                   | 12 +++++
>>>>>>     include/drm/drm_gem_cma_helper.h        | 12 ++---
>>>>>>     include/drm/drm_gem_shmem_helper.h      |  6 +--
>>>>>>     14 files changed, 120 insertions(+), 88 deletions(-)
>>>>>>
>>>>>> --
>>>>>> 2.30.1
>>>>>>
>>>>>
>>>>
>>>> --
>>>> Thomas Zimmermann
>>>> Graphics Driver Developer
>>>> SUSE Software Solutions Germany GmbH
>>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>>>> (HRB 36809, AG N=C3=BCrnberg)
>>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>>>
>>>
>>>
>>
>> --=20
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>=20
>=20
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--0u0KLXX9po0CNh551RVjBycX4dbOk98KB--

--Aka95Yog5J18D5w9fRfNvSgzDFyLE9Yvu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmA0upMFAwAAAAAACgkQlh/E3EQov+Dc
Uw/+JBYuHSOqEuGAPqiBqR2YsC5FQwn7hpBgWA9cwpe5rjZNcsI7HXKsVlNbwMJ5CTgVBSOUULu0
HVE6QP14vQ4Favy1uBSI6/ESGjnEyOTLK5rLXKpgFMQbrYiextWP5Uh5YtnM7YhbriJs2SaeO1CZ
DQNktWMvy6w5h5qvR/AP8j3gbhPwD//tTslbiU1xf7R/3km6qmmBrC/KMOw4wy6c3pQG9aFaxIAW
MMLUCpb94w0X55yTp7coSR0g+potf8S+y7YVZnFUwPVLQYKmqKRN0UtxZ6qBBRox9Cunr6lphH8I
r5F/ACsHw7Q+GEEKwLuM9uc5iqSePMFI2nBNNQtn4BA66UljbUTrOFpSNeLZpf7ZkWbJheIsfs7U
Yev0FxUov0j+lZ4FBjlGcMgJ4UUcOmG1Sv16ksFZC3+HKoP6+q0HOH000+nXEP50OOCmhf8MYWMV
fAIMEx05VWi8viil2zCj4A9ygRlEO1qH/wj9r0XLsMNrQGi7yusdrXqdQAkthIejjHgaKxZYB/gq
RUdC1pIB1I8o1xjWD6ayuQn9KU3Rv5sAVI658rPdlxHwi3dbjJjR9qVymPeRfmBMomUftAgH0Q2q
5yyKT+Caj6rKVWkS8xfq4wRefnrCm1tQmOP4shZi0dN1vQCGLKMIcb5G/kg647C3Sv2feU1GH5zd
vSk=
=gXOD
-----END PGP SIGNATURE-----

--Aka95Yog5J18D5w9fRfNvSgzDFyLE9Yvu--

--===============0935301458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0935301458==--
