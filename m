Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8302CA2BB
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 13:33:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D33E6E519;
	Tue,  1 Dec 2020 12:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920436E554
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 12:33:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2F095AC75;
 Tue,  1 Dec 2020 12:33:39 +0000 (UTC)
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
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/8] drm/gem: Write down some rules for vmap usage
Message-ID: <7211f3d5-8298-6df3-05b5-c56b5e89f162@suse.de>
Date: Tue, 1 Dec 2020 13:33:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <aa3c4ad6-f99e-de48-e797-0748c9706e9e@amd.com>
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
Content-Type: multipart/mixed; boundary="===============1915657097=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1915657097==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Po5HPdGxxQFl3HSWANaKpBIhomWCRibyK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Po5HPdGxxQFl3HSWANaKpBIhomWCRibyK
Content-Type: multipart/mixed; boundary="DnaxYoi3DxIWrKXX2tivzicZvGCqL2nN6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>
Message-ID: <7211f3d5-8298-6df3-05b5-c56b5e89f162@suse.de>
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
In-Reply-To: <aa3c4ad6-f99e-de48-e797-0748c9706e9e@amd.com>

--DnaxYoi3DxIWrKXX2tivzicZvGCqL2nN6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 01.12.20 um 13:14 schrieb Christian K=C3=B6nig:
> Am 01.12.20 um 12:30 schrieb Thomas Zimmermann:
>> Hi
>>
>> Am 01.12.20 um 11:34 schrieb Christian K=C3=B6nig:
>>>> [...]
>>>> In patch 6 of this series, there's ast cursor code that acquires two=
=20
>>>> BO's reservation locks and vmaps them afterwards. That's probably=20
>>>> how you intend to use dma_buf_vmap_local.
>>>>
>>>> However, I think it's more logically to have a vmap callback that=20
>>>> only does the actual vmap. This is all that exporters would have to =

>>>> implement.
>>>>
>>>> And with that, build one helper that pins before vmap and one helper=
=20
>>>> that gets the resv lock.
>>>
>>> I don't think that this is will work nor is it a good approach.
>>>
>>> See the ast cursor handling for example. You need to acquire two BOs =

>>> here, not just one. And this can't be done cleanly with a single vmap=
=20
>>> call.
>>
>> That seems to be a misunderstanding.
>>
>> I don't mentioned it explicitly, but there's of course another helper =

>> that only vmaps and nothing else. This would be useful for cases like =

>> the cursor code. So there would be:
>>
>> =C2=A0dma_buf_vmap() - pin + vmap
>> =C2=A0dma_buf_vmap_local() - lock + vmap
>> =C2=A0dma_buf_vmap_locked() - only vmap; caller has set up the BOs
>=20
> Well that zoo of helpers will certainly get a NAK from my side.
>=20
> See interfaces like this should implement simple functions and not hide=
=20
> what's actually needs to be done inside the drivers using this interfac=
e.

If 9 of 10 invocations use the same pattern, why not put that pattern in =

a helper? I see nothing wrong with that.

>=20
> What we could do is to add a pin count to the DMA-buf and then do=20
> WARN_ON(dma_buf->pin_count || dma_resv_lock_help(dma_buf->resv)) in the=
=20
> vmap/vunmap calls.

Most of the vmap code is either CMA or SHMEM GEM stuff. They don't need=20
to pin. It's just baggage to them. The TTM stuff that does need pinning=20
is the minority.

>=20
>>
>> I did some conversion of drivers that use vram and shmem. They=20
>> occasionally update a buffer (ast cursors) or flush a BO from system=20
>> memory to HW (udl, cirrus, mgag200). In terms of these 3 interfaces: I=
=20
>> never needed dma_buf_vmap() because pinning was never really required =

>> here. Almost all of the cases were handled by dma_buf_vmap_local().=20
>> And the ast cursor code uses the equivalent of dma_buf_vmap_locked().
>=20
> Yeah, that is kind of expected. I was already wondering as well why we =

> didn't used the reservation lock more extensively.

As a side note, I found only 6 trivial implementations of vmap outside=20
of drivers/gpu/drm. I cannot find a single implementation of pin there.=20
  What am I missing?

Best regards
Thomas

>=20
> Regards,
> Christian.
>=20
>>
>> The driver exporting the buffer would only have to implement vmap()=20
>> and =C2=A0pin() interfaces. Each does only its one thing and would ass=
ume=20
>> that the caller holds the lock.
>>
>> Best regards
>> Thomas
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> I know that it might require some work on exporting drivers. But=20
>>>> with your proposal, we probably need another dma-buf callback just=20
>>>> for vmap_local. (?) That seems even less appealing to me.
>>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>>
>>>>> Trying to shovel both semantics into one interface, depending upon
>>>>> which implementation we have backing the buffer, doesn't work indee=
d.
>>>>>
>>>>> Also on the pin topic, I think neither interface should require
>>>>> callers to explicitly pin anything. For existing users it should
>>>>> happen automatically behind the scenes imo, that's what they're
>>>>> expecting.
>>>>> -Daniel
>>>>>
>>>>>
>>>>>>> I think we could use what we've done for dynamic dma-buf attachme=
nt
>>>>>>> (which also change locking rules) and just have new functions for=
=20
>>>>>>> the
>>>>>>> new way (i.e. short term vmap protected by dma_resv lock. Maybe c=
all
>>>>>>> these dma_buf_vmap_local, in the spirit of the new kmap_local whi=
ch
>>>>>>> are currently under discussion. I think _local suffix is better, =
for
>>>>>>> otherwise people might do something silly like
>>>>>>>
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_resv_lock();
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_buf_vmap_locked();
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_resv_unlock();
>>>>>>>
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* actual access maybe even in som=
e other thread */
>>>>>>>
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 dma_buf_resv_lock();
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 dma_buf_vunmap_unlocked();
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 dma_resv_unlock();
>>>>>>>
>>>>>>> _local suffix is better at telling that the resulting pointer has=
=20
>>>>>>> very
>>>>>>> limited use (essentially just local to the calling context, if yo=
u
>>>>>>> don't change any locking or anything).
>>>>>>
>>>>>> _local sounds good.
>>>>>>
>>>>>> Best regards
>>>>>> Thomas
>>>>>>
>>>>>>>
>>>>>>> I think encouraging importers to call dma_buf_pin/unpin isn't a g=
ood
>>>>>>> idea. Yes dynamic ones need it, but maybe we should check for tha=
t
>>>>>>> somehow in the exporterd interface (atm only amdgpu is using it).=

>>>>>>> -Daniel
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>> Best regards
>>>>>>>> Thomas
>>>>>>>>
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Cheers,
>>>>>>>>> Christian.
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> That's what I meant with that this approach here is very=20
>>>>>>>>>> sprawling :-/
>>>>>>>>>> -Daniel
>>>>>>>>>>
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0 int drm_gem_dmabuf_vmap(struct dma_buf *dm=
a_buf, struct=20
>>>>>>>>>>> dma_buf_map
>>>>>>>>>>> *map)
>>>>>>>>>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>>>>>>>>>>> index 5e6daa1c982f..7c34cd5ec261 100644
>>>>>>>>>>> --- a/include/drm/drm_gem.h
>>>>>>>>>>> +++ b/include/drm/drm_gem.h
>>>>>>>>>>> @@ -137,7 +137,21 @@ struct drm_gem_object_funcs {
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Returns a =
virtual address for the buffer. Used by the
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * drm_gem_dm=
abuf_vmap() helper.
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Notes to implementors:
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * - Implementations must expect pai=
rs of @vmap and=20
>>>>>>>>>>> @vunmap to be
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 called frequently and=
 should optimize for this case.
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * - Implemenations may expect the c=
aller to hold the=20
>>>>>>>>>>> GEM object's
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 reservation lock to p=
rotect against concurrent=20
>>>>>>>>>>> calls and
>>>>>>>>>>> relocation
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 of the GEM object.
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * - Implementations may provide add=
itional guarantees=20
>>>>>>>>>>> (e.g.,
>>>>>>>>>>> working
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 without holding the r=
eservation lock).
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * This callb=
ack is optional.
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * See also drm_gem_dmabuf_vmap()
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int (*vmap)(struct=
 drm_gem_object *obj, struct=20
>>>>>>>>>>> dma_buf_map *map);
>>>>>>>>>>> @@ -148,6 +162,8 @@ struct drm_gem_object_funcs {
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * drm_gem_dm=
abuf_vunmap() helper.
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * This callb=
ack is optional.
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * See also @vmap.
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*vunmap)(str=
uct drm_gem_object *obj, struct=20
>>>>>>>>>>> dma_buf_map
>>>>>>>>>>> *map);
>>>>>>>>>>> --=20
>>>>>>>>>>> 2.29.2
>>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> _______________________________________________
>>>>>>>>> dri-devel mailing list
>>>>>>>>> dri-devel@lists.freedesktop.org
>>>>>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>>>>>
>>>>>>>> --=20
>>>>>>>> Thomas Zimmermann
>>>>>>>> Graphics Driver Developer
>>>>>>>> SUSE Software Solutions Germany GmbH
>>>>>>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>>>>>>>> (HRB 36809, AG N=C3=BCrnberg)
>>>>>>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>
>>>>>> --=20
>>>>>> Thomas Zimmermann
>>>>>> Graphics Driver Developer
>>>>>> SUSE Software Solutions Germany GmbH
>>>>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>>>>>> (HRB 36809, AG N=C3=BCrnberg)
>>>>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>>>>>
>>>>>
>>>>>
>>>>
>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
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


--DnaxYoi3DxIWrKXX2tivzicZvGCqL2nN6--

--Po5HPdGxxQFl3HSWANaKpBIhomWCRibyK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/GOCEFAwAAAAAACgkQlh/E3EQov+A0
IBAAiR22na0KsKEtzpN9fTwVfaOSlDFU4r4PILy44vgG+X4piIJzCAK4GY/styb8Y2fLySD8VQGB
sJSzKQXJSWeLcO0cZ+4Zfjr288Y/TNNzA9NUf7oiL/Eni+mRBZ/BpEbUC5JqnT2+z2MhWCAKuoBH
QPqR0ZjikHsp9oGVy/inQRHa2CWHSzhvNIxXBBiTOWvbK9p0ALUrDi8rWaSy9PWEN+Fsp7yURPwm
YYm7fClZ8iXzvPB+BlZpZlQRICAnPZSdnMVEwODsTViTJV4+FKzmiSquffk53hwTVXxb+PNlvBXf
KYxGmANwhcxd1P4pPORxx1y0jMLtS8TBrhNnL1bbjjzYBXUARZCQRxJp6qHuQT4UfXeP+kcszyBF
1vlzMXmeLl5aYXO8C6UbPoc6G9v/ui2A5fIpq84bBBiQByesATINFKW612i2QfDXOaX3GjaBR8FP
kGc27BsZ+G0OsgeCh+igDjOJ1aPIH3m3s/5xtvYMFYspeQ2juNKj8YTcUvrKKumI6VygO5HTZQMl
qGY5eea8EBne+dO4+t/HN2wd1+pTgM8pDQXkczqlVPE7Z4gh0VEqesW+qjBsQcXC58Nm4mXQpThg
nRS7w+CmVLLuGeuEOZUzbIzyae+BWNsI59mHlnfSbLH/ue/KLPLMuEObDKJTa+kzcHdFmnQaVNXS
iXU=
=UJba
-----END PGP SIGNATURE-----

--Po5HPdGxxQFl3HSWANaKpBIhomWCRibyK--

--===============1915657097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1915657097==--
