Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3BB2CA14A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 12:30:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADCB89C6B;
	Tue,  1 Dec 2020 11:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AEBB89C6B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 11:30:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 08081AC65;
 Tue,  1 Dec 2020 11:30:04 +0000 (UTC)
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
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/8] drm/gem: Write down some rules for vmap usage
Message-ID: <0e31f447-4195-77fe-a68d-97b96f46f327@suse.de>
Date: Tue, 1 Dec 2020 12:30:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <a8e15d38-2b92-a278-2ad9-e44c368c6a15@amd.com>
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
Content-Type: multipart/mixed; boundary="===============0651264260=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0651264260==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vNOeDkc2IqAt3DMpRFwBED3JRlMY31Zs2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vNOeDkc2IqAt3DMpRFwBED3JRlMY31Zs2
Content-Type: multipart/mixed; boundary="4JUs1dSXOxVgMUg0V3fZCyudrbHs9g93o";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>
Message-ID: <0e31f447-4195-77fe-a68d-97b96f46f327@suse.de>
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
In-Reply-To: <a8e15d38-2b92-a278-2ad9-e44c368c6a15@amd.com>

--4JUs1dSXOxVgMUg0V3fZCyudrbHs9g93o
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 01.12.20 um 11:34 schrieb Christian K=C3=B6nig:
>> [...]
>> In patch 6 of this series, there's ast cursor code that acquires two=20
>> BO's reservation locks and vmaps them afterwards. That's probably how =

>> you intend to use dma_buf_vmap_local.
>>
>> However, I think it's more logically to have a vmap callback that only=
=20
>> does the actual vmap. This is all that exporters would have to impleme=
nt.
>>
>> And with that, build one helper that pins before vmap and one helper=20
>> that gets the resv lock.
>=20
> I don't think that this is will work nor is it a good approach.
>=20
> See the ast cursor handling for example. You need to acquire two BOs=20
> here, not just one. And this can't be done cleanly with a single vmap c=
all.

That seems to be a misunderstanding.

I don't mentioned it explicitly, but there's of course another helper=20
that only vmaps and nothing else. This would be useful for cases like=20
the cursor code. So there would be:

  dma_buf_vmap() - pin + vmap
  dma_buf_vmap_local() - lock + vmap
  dma_buf_vmap_locked() - only vmap; caller has set up the BOs

I did some conversion of drivers that use vram and shmem. They=20
occasionally update a buffer (ast cursors) or flush a BO from system=20
memory to HW (udl, cirrus, mgag200). In terms of these 3 interfaces: I=20
never needed dma_buf_vmap() because pinning was never really required=20
here. Almost all of the cases were handled by dma_buf_vmap_local(). And=20
the ast cursor code uses the equivalent of dma_buf_vmap_locked().

The driver exporting the buffer would only have to implement vmap() and=20
  pin() interfaces. Each does only its one thing and would assume that=20
the caller holds the lock.

Best regards
Thomas

>=20
> Regards,
> Christian.
>=20
>>
>> I know that it might require some work on exporting drivers. But with =

>> your proposal, we probably need another dma-buf callback just for=20
>> vmap_local. (?) That seems even less appealing to me.
>>
>> Best regards
>> Thomas
>>
>>>
>>> Trying to shovel both semantics into one interface, depending upon
>>> which implementation we have backing the buffer, doesn't work indeed.=

>>>
>>> Also on the pin topic, I think neither interface should require
>>> callers to explicitly pin anything. For existing users it should
>>> happen automatically behind the scenes imo, that's what they're
>>> expecting.
>>> -Daniel
>>>
>>>
>>>>> I think we could use what we've done for dynamic dma-buf attachment=

>>>>> (which also change locking rules) and just have new functions for t=
he
>>>>> new way (i.e. short term vmap protected by dma_resv lock. Maybe cal=
l
>>>>> these dma_buf_vmap_local, in the spirit of the new kmap_local which=

>>>>> are currently under discussion. I think _local suffix is better, fo=
r
>>>>> otherwise people might do something silly like
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_resv_lock();
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_buf_vmap_locked();
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_resv_unlock();
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* actual access maybe even in some =
other thread */
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 dma_buf_resv_lock();
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 dma_buf_vunmap_unlocked();
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 dma_resv_unlock();
>>>>>
>>>>> _local suffix is better at telling that the resulting pointer has v=
ery
>>>>> limited use (essentially just local to the calling context, if you
>>>>> don't change any locking or anything).
>>>>
>>>> _local sounds good.
>>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>>
>>>>> I think encouraging importers to call dma_buf_pin/unpin isn't a goo=
d
>>>>> idea. Yes dynamic ones need it, but maybe we should check for that
>>>>> somehow in the exporterd interface (atm only amdgpu is using it).
>>>>> -Daniel
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>> Best regards
>>>>>> Thomas
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> Cheers,
>>>>>>> Christian.
>>>>>>>
>>>>>>>>
>>>>>>>> That's what I meant with that this approach here is very=20
>>>>>>>> sprawling :-/
>>>>>>>> -Daniel
>>>>>>>>
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>>>> =C2=A0=C2=A0=C2=A0 int drm_gem_dmabuf_vmap(struct dma_buf *dma_=
buf, struct=20
>>>>>>>>> dma_buf_map
>>>>>>>>> *map)
>>>>>>>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>>>>>>>>> index 5e6daa1c982f..7c34cd5ec261 100644
>>>>>>>>> --- a/include/drm/drm_gem.h
>>>>>>>>> +++ b/include/drm/drm_gem.h
>>>>>>>>> @@ -137,7 +137,21 @@ struct drm_gem_object_funcs {
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Returns a vi=
rtual address for the buffer. Used by the
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * drm_gem_dmab=
uf_vmap() helper.
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Notes to implementors:
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * - Implementations must expect pairs=
 of @vmap and=20
>>>>>>>>> @vunmap to be
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 called frequently and s=
hould optimize for this case.
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * - Implemenations may expect the cal=
ler to hold the GEM=20
>>>>>>>>> object's
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 reservation lock to pro=
tect against concurrent calls and
>>>>>>>>> relocation
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 of the GEM object.
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * - Implementations may provide addit=
ional guarantees (e.g.,
>>>>>>>>> working
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 without holding the res=
ervation lock).
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * This callbac=
k is optional.
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * See also drm_gem_dmabuf_vmap()
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int (*vmap)(struct d=
rm_gem_object *obj, struct=20
>>>>>>>>> dma_buf_map *map);
>>>>>>>>> @@ -148,6 +162,8 @@ struct drm_gem_object_funcs {
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * drm_gem_dmab=
uf_vunmap() helper.
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * This callbac=
k is optional.
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * See also @vmap.
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*vunmap)(struc=
t drm_gem_object *obj, struct=20
>>>>>>>>> dma_buf_map
>>>>>>>>> *map);
>>>>>>>>> --=20
>>>>>>>>> 2.29.2
>>>>>>>>>
>>>>>>>
>>>>>>> _______________________________________________
>>>>>>> dri-devel mailing list
>>>>>>> dri-devel@lists.freedesktop.org
>>>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
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
>>>> --=20
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


--4JUs1dSXOxVgMUg0V3fZCyudrbHs9g93o--

--vNOeDkc2IqAt3DMpRFwBED3JRlMY31Zs2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/GKToFAwAAAAAACgkQlh/E3EQov+Ac
bBAAmZsBkKMD5+HWkagFHr30FGjXJn32X52o8iHJ/dUw58i/6mEZrHBkgewBlnNYBzdYbSTFRIqs
oKJWkbSin9i1kKAHuB7LIyRTnn0PDKUT4xxYk7cg6eGiWNxudWA+cQw6uvhVsw8TywN095kcsqmE
9SFo1pMDK7eNOczkE/ox/2m0xpVMJ5lDrJOhs+oTnIpAAzg1r8F6pa6f0zCg411ptCsfCHdZrlGJ
Xdo6fgTZ7CBerEpTaQSVcDBjsdIx2MfuAlVg5JXPE1ES9e9F0hJYQWBf1Ep1IeR+rq/j4xP+wilC
FertwWqZrtuNJfo0jRaTXGZwGTSgMxSMElJtO5RpKLpqg0jscP7QJQZfTn/TNyC/wD+zPaeH4AlS
WRqzSiJwaTReShB/bHW7j3yIW/jTip7XmfwfZVZL18XrglDi5XauF+lTM66vP5alHauPMz4owTxU
++g+4x5fIh0Oz92zN7shOs+BRi1VyF5bUas4IcMDPQdhOh50FE7EdJcvb7BQbv7uUXWUh+QaSzKz
4RRj0YXLsqU6Dv1V74ofhRm/g83Xp/A9+MTbE5i4KAm/bC5k0tP0TcP1mAoWcl0hD8NqrED7cv1A
un6KFlh9wttd5LmIDVk0lG9vv6RqsZpjrgefLbStEOU96xVAN1GAOTWI8J/oWXJuOPdIJC31wFsu
15w=
=5hnH
-----END PGP SIGNATURE-----

--vNOeDkc2IqAt3DMpRFwBED3JRlMY31Zs2--

--===============0651264260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0651264260==--
