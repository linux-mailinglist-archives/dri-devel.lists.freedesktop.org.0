Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECC42CA31D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 13:52:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6B56E529;
	Tue,  1 Dec 2020 12:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B5356E526
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 12:51:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A163AACC1;
 Tue,  1 Dec 2020 12:51:53 +0000 (UTC)
Subject: Re: [PATCH 1/8] drm/gem: Write down some rules for vmap usage
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20201130120433.7205-1-tzimmermann@suse.de>
 <20201130120433.7205-2-tzimmermann@suse.de>
 <20201130153048.GS401619@phenom.ffwll.local>
 <092068b8-1f3d-4fc8-48fb-cc5dc33ae7c5@amd.com>
 <0237fafc-f57e-b60b-f92c-0b0a79e9448e@suse.de>
 <CAKMK7uG186rtmopf9h-ZrR+D1r7c2-5nrxg86dZxwmnLN1QGZg@mail.gmail.com>
 <d50074f7-145d-2af5-e8cd-08b57e204ede@suse.de>
 <CAKMK7uHe+Or2mnbESXoTm=yTFxyWK01DjHLdnxzGkK=PYb4_9g@mail.gmail.com>
 <56f730f5-eda1-3d87-0d35-63faf91c79e5@suse.de>
 <a8e15d38-2b92-a278-2ad9-e44c368c6a15@amd.com>
 <0e31f447-4195-77fe-a68d-97b96f46f327@suse.de>
 <aa3c4ad6-f99e-de48-e797-0748c9706e9e@amd.com>
 <7211f3d5-8298-6df3-05b5-c56b5e89f162@suse.de>
 <870cfd16-02a8-8a6d-8b7f-8ee4b57ef222@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <974e9258-d50c-c6ef-73e8-e5a762a58aa7@suse.de>
Date: Tue, 1 Dec 2020 13:51:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <870cfd16-02a8-8a6d-8b7f-8ee4b57ef222@amd.com>
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
Cc: Dave Airlie <airlied@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>
Content-Type: multipart/mixed; boundary="===============1480510364=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1480510364==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ip9Ini8cBSmNV79vDPXN8wCABxTKlmlib"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ip9Ini8cBSmNV79vDPXN8wCABxTKlmlib
Content-Type: multipart/mixed; boundary="lf4QTAtVN8AbUhCBThT3dpXsCDkacj7Mf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>
Message-ID: <974e9258-d50c-c6ef-73e8-e5a762a58aa7@suse.de>
Subject: Re: [PATCH 1/8] drm/gem: Write down some rules for vmap usage
References: <20201130120433.7205-1-tzimmermann@suse.de>
 <20201130120433.7205-2-tzimmermann@suse.de>
 <20201130153048.GS401619@phenom.ffwll.local>
 <092068b8-1f3d-4fc8-48fb-cc5dc33ae7c5@amd.com>
 <0237fafc-f57e-b60b-f92c-0b0a79e9448e@suse.de>
 <CAKMK7uG186rtmopf9h-ZrR+D1r7c2-5nrxg86dZxwmnLN1QGZg@mail.gmail.com>
 <d50074f7-145d-2af5-e8cd-08b57e204ede@suse.de>
 <CAKMK7uHe+Or2mnbESXoTm=yTFxyWK01DjHLdnxzGkK=PYb4_9g@mail.gmail.com>
 <56f730f5-eda1-3d87-0d35-63faf91c79e5@suse.de>
 <a8e15d38-2b92-a278-2ad9-e44c368c6a15@amd.com>
 <0e31f447-4195-77fe-a68d-97b96f46f327@suse.de>
 <aa3c4ad6-f99e-de48-e797-0748c9706e9e@amd.com>
 <7211f3d5-8298-6df3-05b5-c56b5e89f162@suse.de>
 <870cfd16-02a8-8a6d-8b7f-8ee4b57ef222@amd.com>
In-Reply-To: <870cfd16-02a8-8a6d-8b7f-8ee4b57ef222@amd.com>

--lf4QTAtVN8AbUhCBThT3dpXsCDkacj7Mf
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 01.12.20 um 13:38 schrieb Christian K=C3=B6nig:
> Am 01.12.20 um 13:33 schrieb Thomas Zimmermann:
>> Hi
>>
>> Am 01.12.20 um 13:14 schrieb Christian K=C3=B6nig:
>>> Am 01.12.20 um 12:30 schrieb Thomas Zimmermann:
>>>> Hi
>>>>
>>>> Am 01.12.20 um 11:34 schrieb Christian K=C3=B6nig:
>>>>>> [...]
>>>>>> In patch 6 of this series, there's ast cursor code that acquires=20
>>>>>> two BO's reservation locks and vmaps them afterwards. That's=20
>>>>>> probably how you intend to use dma_buf_vmap_local.
>>>>>>
>>>>>> However, I think it's more logically to have a vmap callback that =

>>>>>> only does the actual vmap. This is all that exporters would have=20
>>>>>> to implement.
>>>>>>
>>>>>> And with that, build one helper that pins before vmap and one=20
>>>>>> helper that gets the resv lock.
>>>>>
>>>>> I don't think that this is will work nor is it a good approach.
>>>>>
>>>>> See the ast cursor handling for example. You need to acquire two=20
>>>>> BOs here, not just one. And this can't be done cleanly with a=20
>>>>> single vmap call.
>>>>
>>>> That seems to be a misunderstanding.
>>>>
>>>> I don't mentioned it explicitly, but there's of course another=20
>>>> helper that only vmaps and nothing else. This would be useful for=20
>>>> cases like the cursor code. So there would be:
>>>>
>>>> =C2=A0dma_buf_vmap() - pin + vmap
>>>> =C2=A0dma_buf_vmap_local() - lock + vmap
>>>> =C2=A0dma_buf_vmap_locked() - only vmap; caller has set up the BOs
>>>
>>> Well that zoo of helpers will certainly get a NAK from my side.
>>>
>>> See interfaces like this should implement simple functions and not=20
>>> hide what's actually needs to be done inside the drivers using this=20
>>> interface.
>>
>> If 9 of 10 invocations use the same pattern, why not put that pattern =

>> in a helper? I see nothing wrong with that.
>=20
> Because it hides the locking semantics inside the helper. See when you =

> have the lock/unlock inside the driver it is obvious that you need to b=
e=20
> careful not to take locks in different orders.
>=20
>>> What we could do is to add a pin count to the DMA-buf and then do=20
>>> WARN_ON(dma_buf->pin_count || dma_resv_lock_help(dma_buf->resv)) in=20
>>> the vmap/vunmap calls.
>>
>> Most of the vmap code is either CMA or SHMEM GEM stuff. They don't=20
>> need to pin. It's just baggage to them. The TTM stuff that does need=20
>> pinning is the minority.
>>
>>>
>>>>
>>>> I did some conversion of drivers that use vram and shmem. They=20
>>>> occasionally update a buffer (ast cursors) or flush a BO from system=
=20
>>>> memory to HW (udl, cirrus, mgag200). In terms of these 3 interfaces:=
=20
>>>> I never needed dma_buf_vmap() because pinning was never really=20
>>>> required here. Almost all of the cases were handled by=20
>>>> dma_buf_vmap_local(). And the ast cursor code uses the equivalent of=
=20
>>>> dma_buf_vmap_locked().
>>>
>>> Yeah, that is kind of expected. I was already wondering as well why=20
>>> we didn't used the reservation lock more extensively.
>>
>> As a side note, I found only 6 trivial implementations of vmap outside=
=20
>> of drivers/gpu/drm. I cannot find a single implementation of pin=20
>> there. =C2=A0What am I missing?
>=20
> Amdgpu is the only one currently implementing the new interface. So far=
=20
> we didn't had the time nor the need to correctly move the locking into =

> the calling drivers.
>=20
> That's what the whole dynamic DMA-buf patches where all about.

Thanks for the pointer.

Best regards
Thomas

>=20
> Regards,
> Christian.
>=20
>>
>> Best regards
>> Thomas
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


--lf4QTAtVN8AbUhCBThT3dpXsCDkacj7Mf--

--ip9Ini8cBSmNV79vDPXN8wCABxTKlmlib
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/GPGgFAwAAAAAACgkQlh/E3EQov+DJ
kBAAlX/wOBCIyxcFRsVe3unmDGz+9rfIawTqXdriY/S47oVTEEF9O6tyfnV1L6bVZRO/tPHhHC6j
wYtzgOugM75BKu79JCMvKKWzjSogE9fQHBCaG9Q/KAIFodZXSP286bX2gqrVStki2ECx7JjVj39S
5YHk2sa7u3Pm066Ed72w/PRXoLkWOMdOV/MX1tLdFyOzbdTnqWN+X9t+njgBPdx7z3QNXBjpSrZt
AI3++Ag8bbtwDCvJIE+xmzs0wuWyQ0k/l+9TK7WKcnVJxGAs9yIkblK13AzgY+E91mqGCJZis2On
lSwqYgQNgTTw5eyLidgm8iJsl0W0gfJF2NaNVaWsCIbTK2wg9RdS3SScpjwZJbDamE2slexPrV8a
LOtEGCnfdpPT4ihMrNKiVDB2FFW9gm1CrefAsttlAf3Ya01pg0Beoejkl1Rf5OFn0mgDiEFuGpSp
ghVWM/P6Waawdd1jIu5B+sIWMJ31n3jyOH2fZPb4Rxq8TZ0W8m75qk3aiKWdb3NGvIkXZbTTyWuF
TzhjBYPCzbWjTCIqzRQpyX3by/T+XzJXPxrECDbVAQ2Qq3U+4mlqHzmiyZVEtvTxPJM6vDse9rwb
M8e1s5Xi+UM/JpDyyvZzs6BZn0vL7fONm0LA70OwcvELtYhqTuXjQL0C1bda2FADC5KbOON1jR4k
iCs=
=6D5q
-----END PGP SIGNATURE-----

--ip9Ini8cBSmNV79vDPXN8wCABxTKlmlib--

--===============1480510364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1480510364==--
