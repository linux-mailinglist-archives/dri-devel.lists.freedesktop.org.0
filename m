Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 089942C53C1
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 13:14:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0317D6E8F5;
	Thu, 26 Nov 2020 12:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71598953E;
 Thu, 26 Nov 2020 12:14:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6B26FAEFF;
 Thu, 26 Nov 2020 12:14:17 +0000 (UTC)
Subject: Re: [PATCH 4/7] drm/radeon: Pin buffers while they are vmap'ed
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <d1508c4f-df3e-fa3c-3071-d8a58295e674@suse.de>
 <cbfa3e8d-81a3-5620-d4fc-72188cfb42ee@amd.com>
 <6d2ee787-0bf5-de1d-73af-7c87bad63cda@suse.de>
 <2431a0e1-7159-b3e7-e1ca-3e7f55c38d8a@amd.com>
 <b356ee3d-64bd-30c9-23f6-dea3a1b87bea@suse.de>
 <20201124140937.GK401619@phenom.ffwll.local>
 <278a4498-bdde-402a-1cea-668e9683f7eb@suse.de>
 <2f8a252a-5413-4b75-a367-f6233121e36e@amd.com>
 <20201125103645.GU401619@phenom.ffwll.local>
 <fd9dff4a-ec16-46d8-d892-b06dad5c11d3@suse.de>
 <20201125163251.GY401619@phenom.ffwll.local>
 <75385451-7969-e199-1a8e-f29fd08d5043@suse.de>
 <CAKMK7uGfaHdTOEBPmeNiFWz2GVb4C+-cYO7SkJsyQCsa-sCZ5Q@mail.gmail.com>
 <1cad6728-ca8b-80c6-55a8-b75d4c7a8a60@suse.de>
 <4dd0d521-908c-db23-d8b2-6d3a80a2bff3@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <16453932-6a1d-0f93-f887-c96f4688b7bb@suse.de>
Date: Thu, 26 Nov 2020 13:14:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <4dd0d521-908c-db23-d8b2-6d3a80a2bff3@amd.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1643133231=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1643133231==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0veoJkCdH8plYpbzsqrkKXVraxGhOkWe3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0veoJkCdH8plYpbzsqrkKXVraxGhOkWe3
Content-Type: multipart/mixed; boundary="HoCEwnGj0ccMp7N64HezlEJQC4U3oAPTn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <16453932-6a1d-0f93-f887-c96f4688b7bb@suse.de>
Subject: Re: [PATCH 4/7] drm/radeon: Pin buffers while they are vmap'ed
References: <d1508c4f-df3e-fa3c-3071-d8a58295e674@suse.de>
 <cbfa3e8d-81a3-5620-d4fc-72188cfb42ee@amd.com>
 <6d2ee787-0bf5-de1d-73af-7c87bad63cda@suse.de>
 <2431a0e1-7159-b3e7-e1ca-3e7f55c38d8a@amd.com>
 <b356ee3d-64bd-30c9-23f6-dea3a1b87bea@suse.de>
 <20201124140937.GK401619@phenom.ffwll.local>
 <278a4498-bdde-402a-1cea-668e9683f7eb@suse.de>
 <2f8a252a-5413-4b75-a367-f6233121e36e@amd.com>
 <20201125103645.GU401619@phenom.ffwll.local>
 <fd9dff4a-ec16-46d8-d892-b06dad5c11d3@suse.de>
 <20201125163251.GY401619@phenom.ffwll.local>
 <75385451-7969-e199-1a8e-f29fd08d5043@suse.de>
 <CAKMK7uGfaHdTOEBPmeNiFWz2GVb4C+-cYO7SkJsyQCsa-sCZ5Q@mail.gmail.com>
 <1cad6728-ca8b-80c6-55a8-b75d4c7a8a60@suse.de>
 <4dd0d521-908c-db23-d8b2-6d3a80a2bff3@amd.com>
In-Reply-To: <4dd0d521-908c-db23-d8b2-6d3a80a2bff3@amd.com>

--HoCEwnGj0ccMp7N64HezlEJQC4U3oAPTn
Content-Type: multipart/mixed;
 boundary="------------BB5B9C1B2CC702341C3FF45D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------BB5B9C1B2CC702341C3FF45D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi

Am 26.11.20 um 13:08 schrieb Christian K=C3=B6nig:
>> [...]
>> Yeah, I remember a bug report about frequent page-table modifications =

>> wrt to vram helpers. So we implemented the lazy unmapping / vmap=20
>> caching, as suggested by Christian back them. My guess is that=20
>> anything TTM-based can use a similar pattern. Christian probably knows=
=20
>> the corner cases.
>=20
> My memory is failing me, what corner case are you talking about?

Haha! :D What I meant was that if there were corner cases, you'd know=20
about them. From your comment, I guess there are none.

Best regards
Thomas

>=20
> Christian.
>=20
>>
>> CMA seems obviously working correctly already.
>>
>> For SHMEM, I'd have to figure out the reference counting of the pages =

>> involved. My guess is that the vunmap in drm_gem_shmem_vunmap() could =

>> be moved into the free callback, plus a few other modifications.
>>
>> Best regards
>> Thomas
>>
>>>
>>> But if you're willing to do all that conversion of callers, then of
>>> course I'm not stopping you. Not at all, it's great to see that kind
>>> of maze untangled.
>>> -Daniel
>>>
>>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>>
>>>>> That should give us at least some way forward to gradually conver=20
>>>>> all the
>>>>> drivers and helpers over to dma_resv locking.
>>>>> -Daniel
>>>>>
>>>>>> The pin count is currently maintained by the vmap implementation=20
>>>>>> in vram
>>>>>> helpers. Calling vmap is an implicit pin; calling vunmap is an=20
>>>>>> implicit
>>>>>> unpin. This prevents eviction in the damage worker. But now I was =

>>>>>> told than
>>>>>> pinning is only for BOs that are controlled by userspace and=20
>>>>>> internal users
>>>>>> should acquire the resv lock. So vram helpers have to be fixed,=20
>>>>>> actually.
>>>>>>
>>>>>> In vram helpers, unmapping does not mean eviction. The unmap=20
>>>>>> operation only
>>>>>> marks the BO as unmappable. The real unmap happens when the=20
>>>>>> eviction takes
>>>>>> place. This avoids many modifications to the page tables. IOW an=20
>>>>>> unpinned,
>>>>>> unmapped BO will remain in VRAM until the memory is actually neede=
d.
>>>>>>
>>>>>> Best regards
>>>>>> Thomas
>>>>>>
>>>>>>>
>>>>>>> So I'm still not seeing how this can go boom.
>>>>>>>
>>>>>>> Now long term it'd be nice to cut everything over to dma_resv=20
>>>>>>> locking, but
>>>>>>> the issue there is that beyond ttm, none of the helpers (and few =

>>>>>>> of the
>>>>>>> drivers) use dma_resv. So this is a fairly big uphill battle. Qui=
ck
>>>>>>> interim fix seems like the right solution to me.
>>>>>>> -Daniel
>>>>>>>
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Best regards
>>>>>>>>> Thomas
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>> There's no recursion taking place, so I guess the reservation=

>>>>>>>>>>> lock could be
>>>>>>>>>>> acquired/release in drm_client_buffer_vmap/vunmap(), or a
>>>>>>>>>>> separate pair of
>>>>>>>>>>> DRM client functions could do the locking.
>>>>>>>>>>
>>>>>>>>>> Given how this "do the right locking" is a can of worms (and I=
=20
>>>>>>>>>> think
>>>>>>>>>> it's
>>>>>>>>>> worse than what you dug out already) I think the=20
>>>>>>>>>> fb_helper.lock hack is
>>>>>>>>>> perfectly good enough.
>>>>>>>>>>
>>>>>>>>>> I'm also somewhat worried that starting to use dma_resv lock=20
>>>>>>>>>> in generic
>>>>>>>>>> code, while many helpers/drivers still have their hand-rolled =

>>>>>>>>>> locking,
>>>>>>>>>> will make conversion over to dma_resv needlessly more=20
>>>>>>>>>> complicated.
>>>>>>>>>> -Daniel
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Best regards
>>>>>>>>>>> Thomas
>>>>>>>>>>>
>>>>>>>>>>> [1]=20
>>>>>>>>>>> https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm=
/drm_fb_helper.c?id=3Dac60f3f3090115d21f028bffa2dcfb67f695c4f2#n394=20
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> Please note that the reservation lock you need to take here =

>>>>>>>>>>>> is part of
>>>>>>>>>>>> the GEM object.
>>>>>>>>>>>>
>>>>>>>>>>>> Usually we design things in the way that the code needs to=20
>>>>>>>>>>>> take a lock
>>>>>>>>>>>> which protects an object, then do some operations with the=20
>>>>>>>>>>>> object and
>>>>>>>>>>>> then release the lock again.
>>>>>>>>>>>>
>>>>>>>>>>>> Having in the lock inside the operation can be done as well,=
=20
>>>>>>>>>>>> but
>>>>>>>>>>>> returning with it is kind of unusual design.
>>>>>>>>>>>>
>>>>>>>>>>>>> Sorry for the noob questions. I'm still trying to=20
>>>>>>>>>>>>> understand the
>>>>>>>>>>>>> implications of acquiring these locks.
>>>>>>>>>>>>
>>>>>>>>>>>> Well this is the reservation lock of the GEM object we are
>>>>>>>>>>>> talking about
>>>>>>>>>>>> here. We need to take that for a couple of different=20
>>>>>>>>>>>> operations,
>>>>>>>>>>>> vmap/vunmap doesn't sound like a special case to me.
>>>>>>>>>>>>
>>>>>>>>>>>> Regards,
>>>>>>>>>>>> Christian.
>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Best regards
>>>>>>>>>>>>> Thomas
>>>>>>>>>>>>
>>>>>>>>>>>> _______________________________________________
>>>>>>>>>>>> dri-devel mailing list
>>>>>>>>>>>> dri-devel@lists.freedesktop.org
>>>>>>>>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>>>>>>>>
>>>>>>>>>>> --=20
>>>>>>>>>>> Thomas Zimmermann
>>>>>>>>>>> Graphics Driver Developer
>>>>>>>>>>> SUSE Software Solutions Germany GmbH
>>>>>>>>>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>>>>>>>>>>> (HRB 36809, AG N=C3=BCrnberg)
>>>>>>>>>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>
>>>>>> --=20
>>>>>> Thomas Zimmermann
>>>>>> Graphics Driver Developer
>>>>>> SUSE Software Solutions Germany GmbH
>>>>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>>>>>> (HRB 36809, AG N=C3=BCrnberg)
>>>>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>
>>>> --=20
>>>> Thomas Zimmermann
>>>> Graphics Driver Developer
>>>> SUSE Software Solutions Germany GmbH
>>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>>>> (HRB 36809, AG N=C3=BCrnberg)
>>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>>
>>>
>>>
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

--------------BB5B9C1B2CC702341C3FF45D
Content-Type: application/pgp-keys;
 name="OpenPGP_0x680DC11D530B7A23.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0x680DC11D530B7A23.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdgX=
H47
fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0BeB5B=
bqP
5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4YchdHm3bkPj=
z9E
ErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB9GluwvIhSezPg=
nEm
imZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEBAAHNKFRob21hcyBaa=
W1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwI4EEwEIADgCGwMFCwkIBwIGFQoJCAsCB=
BYC
AwECHgECF4AWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCXvxIWAAKCRBoDcEdUwt6I+aZB/9ih=
Onf
G4Lgf1L87cvoXh95/bnaJ6aQhP6/ZeRleuCXflnyDajlm3c9loQr0r2bQUi7JeYwUKbBab2QS=
GJm
DMRGlLMnmzWB8mHmZ6bHAu+2Sth8SraE42p6BB9d8dlYEID+dl/D/xUBeulfkck5rloGtYqDi=
+1Q
DfkEZJaxVSZ6FFkXuQi/G9qcI4iklN2nv02iQ7mZe8WYAysix6s/6vIobhirEBreclSNxXqis=
p8n
91+v855JC11EgRdUXMRK81IAaCKXP8zLx3ixku7mvP9Om61yerHSbeU2HZbIggZYQlFh6llJm=
zF1
CjCWgPTJyk4t4kMTcNOw5ykD47vU/KW+wl0EEBECAB0WIQQn6OOmnzvP/7ktjmoud6EwEfXTw=
gUC
WzodVwAKCRAud6EwEfXTwidvAKDkOADDHfI0QNXqAZcg6i1kOndAYACeLXHBwpjnumkPSyoab=
IiL
+he8r3zCwHMEEAEIAB0WIQQeXZghmQijlU7YzFiqUDvJrg9HpwUCWznxsQAKCRCqUDvJrg9Hp=
42f
CADIvsZcAd04PDFclRltHr2huy6s7+ZZA6PgYlMblEBh4bJA+dNPBTvzpJ7FJv/bmHOa+phWy=
Urj
EpfFGuOKGuWAfzgVAEu52fMrW3/mm+O26z1AKIu8hiZ/x9OAe4AM71ZO2lZrV1/53ZdzWnRuO=
45N
GQcotU8oeVfT9okAfmozmWMmIMq7Q0K6bV8W3qiD5XfDNxjr2caxc/9WX1bZPUo3n0H23MNaA=
Tpy
Oz732UtDh6sKUAB1RfzBBd/REbjHD7+quwJGAdRScyDRncX1vNb2+wihy0ipA69XY3bkhR5iD=
u5r
A9enuiMe6J1IBMI1PZh+vOufB/M6cd2D9RULIJaJwsBzBBABCAAdFiEEuyNtt7Ge78bIRx1op=
/N8
GYw5MYEFAls6MrsACgkQp/N8GYw5MYEnLQf/dwqlDJVQL2q+i8FFaqTMAm0n9jLRV6pN8JxFH=
j0g
voyWUOnQuNdAFgtKd26ZhN8NkLoSMO8E19eBPfLoBIFK5yNNVmRHAZm07MzGbA0uNWINJhmdR=
bZM
RMh0nneXjcEU/IvUmd8TPFTAd24X2mbzHgcaHMLJSVx1ohd4alRJXHIqDobKmiVwekyPnInJn=
zWw
iuZUkIotTkQple1PT/dF3S+KtPXBL6ldQ4NkAeCjsz4wnzSa9+VKOxEhiHM0PMzXSbkCMP+4m=
Xy9
RMplBw9Dm9hN2PSouBPifIrSodiiSWZYXOEkzLiBAB0frCKR63Dnx9kvjCD9Pz5wLd/70rjqI=
cLA
jgQTAQgAOAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC=
3oj
BQJftODHAAoJEGgNwR1TC3ojZSIIAIV3makffp4P4leU8JSLt0aTNewsOhy7VQzKUtlCw3PKD=
3l/
SuymZhQKgH+n6sijzFauZnZ+x0T+Oy+dDVZb3sNJuuMUDIHw18EO9daZBMcueaS54FGe73lAp=
HUl
7nxyocCxoqIG8+fP+75itV/ls2TSh5rJvjLvHC8J3NqfGlJ/jlSKrQUnzFbXfE5KGWiKNAn+I=
1a2
EE0I7uLpYgkdb8hcjtV9Rxr2ja+GWOaSoqB29P5GUzipkWo4144Q16JBO6QP2R9y/1ZK9VqH2=
5T8
lTKocLAaHCEdpDqY5KI15as9tIxlI1Vh+eqhTh/gwEm1ykO1gmrQ1zvGLDMB1EE6El3NJ1Rob=
21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIbAwULCQgHAgYVC=
gkI
CwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJe/EheAAoJEGgNwR1TC3ojq=
RgI
AIoegtTp1prPzfHgTAuEPd8v58ssHubwi9tg69a8IJ+iMNozhs4iUou84WOLBJNjSieXHZRa8=
fJj
//2/sTuABn38AQ9FcKX9/B49hrdCo6c0WHHKqlPrSTzuXNKYyOdmSFd/pDhBb2Bn5DTxxH5RP=
m/N
U/C9nUlwi7Y+FgBlDNa5h592wmJfv0cJAfvF56C+QL65jHFOFIW9xSaTOAxxMXHGJHXki6Iwa=
aTg
s7QQlKQcd5XvvED1bwLyQ7rq+MEZo5N7IygpQMM3qqGMlCnDdyQ3W95rd0HCWpfa0oVRCOwdu=
SL3
5hG7ONqBpvBj8z5GjSbt4HLJGvpeT0k37qzRExrCXQQQEQIAHRYhBCfo46afO8//uS2Oai53o=
TAR
9dPCBQJbOh1XAAoJEC53oTAR9dPC05AAoIy0HQ2DBDYugQ42P4HfyxfZTIvKAJ0fqNBcBFW9S=
tbR
DEP9cfpNVOv8YMLAcwQQAQgAHRYhBB5dmCGZCKOVTtjMWKpQO8muD0enBQJbOfGzAAoJEKpQO=
8mu
D0enL0wIAM2NTeUDCofBAkbWHGTZopclefbh0xGPYQEfttNyalp0hn1CrVO7OsX5eTjRqgyOa=
1C5
OAsNghCM4PUmrfv5cZ9+sNn9bRM50uVW9IFRlq8wwBY4+7QejJ5gs7DW/0tZIMZ6iTGKK0WEO=
7gd
2K9hXadPBScTdIqXeWH82meiqElnEQL+K9UeGUBrku+1EQIOxwziKwTDlTvhyJ+xmEKj0uWRc=
Ocl
27xLS9XOWPGXcNQBtlZhF8e/E1kFRt5CPP5UBdUCN8qydUadseXivSNDiYob9dyJSFt7G0Bq4=
/ac
Ret5ANtGRWsp8xYJQRossRMWL0w9P8SiIc2IY/JrQrpz29nCwHMEEAEIAB0WIQS7I223sZ7vx=
shH
HWin83wZjDkxgQUCWzoywAAKCRCn83wZjDkxgQaDCACyFuBLQWNvLT8GTDqTf/gETzmtoEM6Y=
r8O
4jbYg05xiFzAqMZctQsm3zHakx2JrimxDvQJRQJQzp5ICJ7J/BOuSL4FE1SPeQIfjm4jyBZGH=
P/W
vgHsT5e3+ZCPePPZO+3irarTKVhaaP70Tpka6EsOCZzO6L8D6tUDkhxMX0ymy7p8w9Yt1eD0o=
Ume
mxrKdS1ulpNJUTBw7gJN8bMowVnycEm6wntxOjrCxuwbkKhFLdn0ejcXQ0UkfbUFKfU64gGBu=
S53
ZlM8XlOhQEIw/FrdXszhR+Tg3Ag130cmJhOrghgOBLzvJfUd6OvDT5VIz0QGbAm8SWlAIIms1=
9Z8
kBsLwsCOBBMBCAA4AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEchf7rIzpz2NEoWjla=
A3B
HVMLeiMFAl+04McACgkQaA3BHVMLeiPHXAf/SEoZa6CKoOAs1ctEP/hN8cEQqbEiuZ+71nm3u=
/BQ
p/CEUvqGq+iVc8kkpClDbPz5fa9mb+yWwufsnXKOs6ygmEoAEOL7dBZZIaRobBEkB09VXIkx8=
lE0
00grBVtToHUGRfZcMoMZ98XhPGU6lJDN200j/2CV46hQDz6PLySecNjOME05mosbYW5N2JwFd=
uXP
Qx++DjWB32QLBhcOcP3WslTy3PKVe/TcTvk0JpPFMz4UFc+awBVhDgZiGGAW3xLZRYyhpoAEs=
N7u
XkV2ct0MRxuZ3y4tTYJobhbZwutRojiPPZduRw9CSpNDcQHruFiSOIQTpnLeCA6K2JAZyqmP/=
8LA
lAQTAQgAPhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKC=
QgL
AgQWAgMBAh4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLC=
dg6
2AmRirxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6=
PXo
clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7m=
neM
C5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6iKupZs=
tMx
stPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8osBv6pnSn7e=
ArO
wE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYbT6XMr=
yR9
hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU63Y0xnQN29=
UGD
bYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWWGKdDegUR5BkDf=
Dg5
O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lvhFXodNFMAgTLJlLuD=
YOG
LK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsAEQEAAcLAfAQYAQgAJhYhB=
HIX
+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkDwmcAAAoJEGgNwR1TC3ojpfcIAInwP5Olc=
EKo
kTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1C=
paD
o4J+0fkrHuyNacnT206CeJV1E7NYntxUn+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4A=
M4G
ZMWX1lg0+eHbd5oL1as28WvvI/uIaMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suS=
KHA
MtbE4jKJ8ZHFOo3GhLgjVrBWHE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8Ct=
irP
dPWu/VXNRYAl/lat7lSI3H26qrHCwHYEGAEIACACGwwWIQRyF/usjOnPY0ShaOVoDcEdUwt6I=
wUC
X7Th+gAKCRBoDcEdUwt6I1UpCAC6QD5CCT0KFET29VVo4d+JdB5YJZmB72bMyVk12MGrx0fPp=
OgW
muh+7n1zULU4UciMSa0C1uq1eZZu044X3xIcVQp9+/nINM2d4+8yLEktK8f2jMIulYRSQOYX5=
909
E7a4oyj+AEgEDvcQ9WZPf+tSVpPDsrLiIezF5JdH8W0SlhPd13kAYSCR0H53PmAS6a3Z8UeOO=
kof
Fp/9g2GvHGr7ln9s6wenGbq7NOPMXtFG0luQDkqOFfTNI82COJ2ak5j8WMl25t9Cr5s9K2FUW=
orW
CeJMmGDIblC76yQzI2Ub2jXudrZCgLzHr3Bnbd/B+CklVwMpaskDluc7z3OP7KvXzsFNBF+04=
RMB
EADSYkyG/50PjD4CAbEnwQYZl61RVMBb3jug1j2dDPmOcQSYbw7pKLLLUoHCwnZXeEhRdiZ5w=
qMo
fW6DNo9irHecDc0815aN5RMxUQIqX7W6L4lI2qdKsaEcMtYQVdxbdf1cjcMGGO6oxlQE0FO3C=
E/8
y4G/kndDT0APK9jb6SatTJyPJxXwNmR+HYrkbWr4RAVM6et0pQmMZ8sak+QEM0kBlKbI0sodQ=
OXs
7Y9acMYJ5F+xfWU9JVAaOs2TOmQavDZMr6MeOpe/UKFjAZvcvv5yF8v7l3U+kWrpj4wc1bbRp=
pDp
5k5RlCckAJ3QBNW6Im/YlgieJCK9ns0So1yVxrmjNZu4Un3UGFnndI+dvp1vahkjTZNRo2FzP=
GUl
k2oF+juZn26c0YAQSv16BPTVkTQGuFfrVF+P76qg5dJvjuBdhmLOhLu1i63nUYMIw7jBf1Qir=
0H6
98oyLfdGYtdHB0MN5IXSVpkgymIHp6b7H36OMeem4onzoeiMUv8IX+fwQMeJ8fBsl+yTtA1J1=
Lon
gjXxBkbvEG2AUjpDv73ZuMcu0WcHc5ajfM4wixTght+OgZ7Md5LtpTbV+qmaGo5nw+KDujdF3=
bNq
RMI7nwnyVvbAi3QZqiw+Tr7EZY8r+77ecNvF0hdbcoUGsSLPvLBSbcHwpYnbn36uehXBaxFws=
bC0
KwARAQABwsKsBBgBCAAgFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl+04RMCGwICQAkQaA3BH=
VML
eiPBdCAEGQEIAB0WIQTGd2b9+m4xR3BgUWiWH8TcRCi/4AUCX7ThEwAKCRCWH8TcRCi/4JMoE=
AC0
B6V5uOWXzAg8e7v3e60R/0exHxFeTgKEvfNSJM204K2/c+mGH4UKh/kdiJoKF/y6Lu80o8ndt=
vyG
mQJ0yhypFyBSDNbgdeOHagIt7VvwXovwknYg+w2NavdhG5envhqX902XQE0mNNH1XizDRZ422=
8wl
V/fixCmAETZu5GKIFSTHOQrlZlwZ/RRRd3IqEb6bmpbPJZbBXOFolASXw3zs41xMar9zjLSY9=
LKp
SrF3Zy5F27QJhLxWsalLjtWcEwkxn5a5/4OAvAoNIn5NMGRoBmEYp3ZCRNbzkGT2gyOxrTcSf=
g7M
eHy//LX+1rpN02erf6HyoY6vLFFQlYZ5cnf97o67g7vz4cMGAbB4zZ/j5h3ggkSbjlsCmqXX4=
x/Z
7bB1078lwQdg9x+zo+0vxzk10TU1FoWsSAiravlw0riSjr+wjXr5IzBeMm0A7K1MZ2lne+mKj=
T72
bz2KE6isyrpIn4xlzLMQuh1OCthrHKb6GiJO4JWg/jWIt3yBov4EdFDXOnJl7Tq2CkpwrDTsH=
Dgi
Sw4xK+mHW3QFztsMQi6p7qaPCUSYAPIY4xzOTqExhMj/3Pgyg6hTvdGIpV9VzfMXIR68Pmw79=
BGZ
tEWaVXS+1ja+6kBOFIQ37sqOBorOGfp6c6Di+IN8mkEHyt9s2Q/YqpPdedm+58tinuaBSBeUk=
mhM
B/9rSzQXr84M1rhAehbaqDE+UYw8sfsQXiJkZYZz9BHp0YfhD9J5iwgGhYj+LU6dW1+eEsgcq=
fMH
Dexdvr9koHXeuMNaXa40++GX9cY9DU8RHbeYxGj35eVY793F4gfAAsD5DCF5pCcd7mhicp5eD=
rIq
258874hM7w1aSwMS+0K+oppSlIfdogKM/l8RA6oDGZySTkwxXQ8RAYb/ddVc5Ua2gzXccODBz=
JuT
a+aY+BxmIdz4oMzaNCiK3gedGKoRjnrGguEO+YL/Ji3NhHOXRKu/QVTFDmgpmA0oQTfY+iaLz=
bFk
keWD97V4vo2flZ8ii37fcKNX4daGGnRRFUh4BrBG
=3DskgE
-----END PGP PUBLIC KEY BLOCK-----

--------------BB5B9C1B2CC702341C3FF45D--

--HoCEwnGj0ccMp7N64HezlEJQC4U3oAPTn--

--0veoJkCdH8plYpbzsqrkKXVraxGhOkWe3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl+/nBcFAwAAAAAACgkQlh/E3EQov+Ae
MRAAuUzGCqI7SL2zKXArXCvft9YTGKYD34W+ZU0xv2yiHBmNrUKuJzsqsiGkoAVv9+fF2/UEcE7e
VpJnpNc0qo73RiCLcJUqwUQFjZc1HxwPWgkGTZ4ogCCiEFpfcz0UiNvrUIir6FYK+DlDA+lLmzBb
vAXXJGO6w9Pkq7rVOZv98EMfjZMfKCQfeb/RTxuqEYOld20kGE0hDJ8BWTqlSXOZ4fM0dIwe4HDg
SjvL584z9meXiyjgpIupI6VhdmR7lKelRuM1WozZA+kW0AVm0dv0RxJX90L+A+Ko3lwQp/xYgtpd
mwm14Ye9PCrTliXiR1YMFn2irhoc8y6eXVScg3xVi9EOzirZsKhFp3bSE9rWRI27eqK8pJHKMJ0p
UoHfQ4NBsLgwmR0o0agXkrI/mlL1wG/Rlnju1j/cJtM3nNz+XyC/0Bus+JM6fxY+GbktuuOkQESX
q4FUb5Veec/OIaeKAhDj4w4kG6cP19eIb8MqQ2gGdZ7BeqW+NbsV1IS3h32zzBTTIHaBOhiAOaSK
NKcYYlC6ukY4St5CAyYKktjOtvHjItqFwa1/Pf3HeGWRfmdbPwoIUmDt1SNCDpbVo4Y9XW/cx2Ha
msQDaiJy0ZIBlDvDVacZoyHVHHA0Ekui8jJA18eR+B0mlveqi/73PlFHVi9Kz699hT5AwtORhZKr
TFY=
=s5cK
-----END PGP SIGNATURE-----

--0veoJkCdH8plYpbzsqrkKXVraxGhOkWe3--

--===============1643133231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1643133231==--
