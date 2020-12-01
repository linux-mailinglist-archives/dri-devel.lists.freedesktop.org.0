Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDF02CA32D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 13:54:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC42F6E519;
	Tue,  1 Dec 2020 12:54:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE886E519
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 12:54:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A02C5ACC1;
 Tue,  1 Dec 2020 12:53:58 +0000 (UTC)
Subject: Re: [PATCH 1/8] drm/gem: Write down some rules for vmap usage
From: Thomas Zimmermann <tzimmermann@suse.de>
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
 <974e9258-d50c-c6ef-73e8-e5a762a58aa7@suse.de>
Message-ID: <49c3560d-08f4-f49d-a55b-18ea87b2c2ad@suse.de>
Date: Tue, 1 Dec 2020 13:53:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <974e9258-d50c-c6ef-73e8-e5a762a58aa7@suse.de>
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
Content-Type: multipart/mixed; boundary="===============0772505557=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0772505557==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7G6Hm7V7yLK8FK12MmeuLH7tKCjM9JEOM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7G6Hm7V7yLK8FK12MmeuLH7tKCjM9JEOM
Content-Type: multipart/mixed; boundary="EUem3EXcvIMt1ljf2t3esh1YTe4Xo3ucH";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>
Message-ID: <49c3560d-08f4-f49d-a55b-18ea87b2c2ad@suse.de>
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
 <974e9258-d50c-c6ef-73e8-e5a762a58aa7@suse.de>
In-Reply-To: <974e9258-d50c-c6ef-73e8-e5a762a58aa7@suse.de>

--EUem3EXcvIMt1ljf2t3esh1YTe4Xo3ucH
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 01.12.20 um 13:51 schrieb Thomas Zimmermann:
> Hi
>=20
> Am 01.12.20 um 13:38 schrieb Christian K=C3=B6nig:
>> Am 01.12.20 um 13:33 schrieb Thomas Zimmermann:
>>> Hi
>>>
>>> Am 01.12.20 um 13:14 schrieb Christian K=C3=B6nig:
>>>> Am 01.12.20 um 12:30 schrieb Thomas Zimmermann:
>>>>> Hi
>>>>>
>>>>> Am 01.12.20 um 11:34 schrieb Christian K=C3=B6nig:
>>>>>>> [...]
>>>>>>> In patch 6 of this series, there's ast cursor code that acquires =

>>>>>>> two BO's reservation locks and vmaps them afterwards. That's=20
>>>>>>> probably how you intend to use dma_buf_vmap_local.
>>>>>>>
>>>>>>> However, I think it's more logically to have a vmap callback that=
=20
>>>>>>> only does the actual vmap. This is all that exporters would have =

>>>>>>> to implement.
>>>>>>>
>>>>>>> And with that, build one helper that pins before vmap and one=20
>>>>>>> helper that gets the resv lock.
>>>>>>
>>>>>> I don't think that this is will work nor is it a good approach.
>>>>>>
>>>>>> See the ast cursor handling for example. You need to acquire two=20
>>>>>> BOs here, not just one. And this can't be done cleanly with a=20
>>>>>> single vmap call.
>>>>>
>>>>> That seems to be a misunderstanding.
>>>>>
>>>>> I don't mentioned it explicitly, but there's of course another=20
>>>>> helper that only vmaps and nothing else. This would be useful for=20
>>>>> cases like the cursor code. So there would be:
>>>>>
>>>>> =C2=A0dma_buf_vmap() - pin + vmap
>>>>> =C2=A0dma_buf_vmap_local() - lock + vmap
>>>>> =C2=A0dma_buf_vmap_locked() - only vmap; caller has set up the BOs
>>>>
>>>> Well that zoo of helpers will certainly get a NAK from my side.
>>>>
>>>> See interfaces like this should implement simple functions and not=20
>>>> hide what's actually needs to be done inside the drivers using this =

>>>> interface.
>>>
>>> If 9 of 10 invocations use the same pattern, why not put that pattern=
=20
>>> in a helper? I see nothing wrong with that.
>>
>> Because it hides the locking semantics inside the helper. See when you=
=20
>> have the lock/unlock inside the driver it is obvious that you need to =

>> be careful not to take locks in different orders.
>>
>>>> What we could do is to add a pin count to the DMA-buf and then do=20
>>>> WARN_ON(dma_buf->pin_count || dma_resv_lock_help(dma_buf->resv)) in =

>>>> the vmap/vunmap calls.
>>>
>>> Most of the vmap code is either CMA or SHMEM GEM stuff. They don't=20
>>> need to pin. It's just baggage to them. The TTM stuff that does need =

>>> pinning is the minority.
>>>
>>>>
>>>>>
>>>>> I did some conversion of drivers that use vram and shmem. They=20
>>>>> occasionally update a buffer (ast cursors) or flush a BO from=20
>>>>> system memory to HW (udl, cirrus, mgag200). In terms of these 3=20
>>>>> interfaces: I never needed dma_buf_vmap() because pinning was never=
=20
>>>>> really required here. Almost all of the cases were handled by=20
>>>>> dma_buf_vmap_local(). And the ast cursor code uses the equivalent=20
>>>>> of dma_buf_vmap_locked().
>>>>
>>>> Yeah, that is kind of expected. I was already wondering as well why =

>>>> we didn't used the reservation lock more extensively.
>>>
>>> As a side note, I found only 6 trivial implementations of vmap=20
>>> outside of drivers/gpu/drm. I cannot find a single implementation of =

>>> pin there. =C2=A0What am I missing?
>>
>> Amdgpu is the only one currently implementing the new interface. So=20
>> far we didn't had the time nor the need to correctly move the locking =

>> into the calling drivers.
>>
>> That's what the whole dynamic DMA-buf patches where all about.
>=20
> Thanks for the pointer.

That was not a snarky comment, although it might sound like one. I found =

the series in my inbox. :)

Best regards
Thomas

>=20
> Best regards
> Thomas
>=20
>>
>> Regards,
>> Christian.
>>
>>>
>>> Best regards
>>> Thomas
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--EUem3EXcvIMt1ljf2t3esh1YTe4Xo3ucH--

--7G6Hm7V7yLK8FK12MmeuLH7tKCjM9JEOM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/GPOUFAwAAAAAACgkQlh/E3EQov+BO
1hAAlQHe0Ap0Jt95WHmNCZ3rIly1znO31FODE5Wcf1/U+3PYgoD1E7w5OSW5AO/rJExatLcCUuZX
OaWSrBC6/Hwew+MDwAa0Fvnhzv/vW7s5GXP/UARWxXD5r9heIEoe/pgcnyLxlX3EjaC4PxJ6CM2Y
9Szor+K6dxEQlI22NMvZJpsA1oZlIRCd+TRGtJVN679n+B5X6uLCa8h7wGjf6F6nvfScqIWdbz4W
pkXOL7RzpudgZJelhLqCvlMO8ldjUO6n1Clr39/+oaj+DMc4VHD1qWzU6qFCx05DIhHwRhA72+f+
KVkQ9KmCTFkRPnRDsQL5izNXa/25K0l4rUWWL9Ep44zOevWro3vmvG751tBE3PJDTrlxuVIrwCCd
kwo8eZSblUT3H94EgZcBuf6uUGa3aFvwIb63Q9XUSjOIMU83GA+yJNBnVJ1IbymtSkLbn9il27BM
594mHikSY3Q62kFNVlwd2czwg88yjc0SYMnfMqlR3nYMVpGr7bFFmRYf2V5obfkqIpnpNt2h7gs1
To8lmANIQJYKB6bEgvOrJdnRh8AXabxvG5Vr1W49mVZxOjILhFTlJzpzUv5sCMjcW3rY3CGQULht
KoA1fl8DBINS6mOuTqE/06pppIIIcsYjktNU952v8YC6LQCamA/Cry3H/OS4JudpCpCBJ8QWPngd
8rw=
=xrFy
-----END PGP SIGNATURE-----

--7G6Hm7V7yLK8FK12MmeuLH7tKCjM9JEOM--

--===============0772505557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0772505557==--
