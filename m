Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E41A52C9F21
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 11:27:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0E96E52C;
	Tue,  1 Dec 2020 10:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B806E4F8
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 10:27:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C4CE0AC65;
 Tue,  1 Dec 2020 10:27:47 +0000 (UTC)
To: Daniel Vetter <daniel@ffwll.ch>
References: <20201130120433.7205-1-tzimmermann@suse.de>
 <20201130120433.7205-2-tzimmermann@suse.de>
 <20201130153048.GS401619@phenom.ffwll.local>
 <092068b8-1f3d-4fc8-48fb-cc5dc33ae7c5@amd.com>
 <0237fafc-f57e-b60b-f92c-0b0a79e9448e@suse.de>
 <CAKMK7uG186rtmopf9h-ZrR+D1r7c2-5nrxg86dZxwmnLN1QGZg@mail.gmail.com>
 <d50074f7-145d-2af5-e8cd-08b57e204ede@suse.de>
 <CAKMK7uHe+Or2mnbESXoTm=yTFxyWK01DjHLdnxzGkK=PYb4_9g@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/8] drm/gem: Write down some rules for vmap usage
Message-ID: <56f730f5-eda1-3d87-0d35-63faf91c79e5@suse.de>
Date: Tue, 1 Dec 2020 11:27:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHe+Or2mnbESXoTm=yTFxyWK01DjHLdnxzGkK=PYb4_9g@mail.gmail.com>
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
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>
Content-Type: multipart/mixed; boundary="===============1903532504=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1903532504==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="iqZlTvXYs3C0v5aTGciQsFLM3ZkfjRY3B"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iqZlTvXYs3C0v5aTGciQsFLM3ZkfjRY3B
Content-Type: multipart/mixed; boundary="CQ7APtYnJwGZC6GFOl1agimt7GcQKVuCU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>
Message-ID: <56f730f5-eda1-3d87-0d35-63faf91c79e5@suse.de>
Subject: Re: [PATCH 1/8] drm/gem: Write down some rules for vmap usage
References: <20201130120433.7205-1-tzimmermann@suse.de>
 <20201130120433.7205-2-tzimmermann@suse.de>
 <20201130153048.GS401619@phenom.ffwll.local>
 <092068b8-1f3d-4fc8-48fb-cc5dc33ae7c5@amd.com>
 <0237fafc-f57e-b60b-f92c-0b0a79e9448e@suse.de>
 <CAKMK7uG186rtmopf9h-ZrR+D1r7c2-5nrxg86dZxwmnLN1QGZg@mail.gmail.com>
 <d50074f7-145d-2af5-e8cd-08b57e204ede@suse.de>
 <CAKMK7uHe+Or2mnbESXoTm=yTFxyWK01DjHLdnxzGkK=PYb4_9g@mail.gmail.com>
In-Reply-To: <CAKMK7uHe+Or2mnbESXoTm=yTFxyWK01DjHLdnxzGkK=PYb4_9g@mail.gmail.com>

--CQ7APtYnJwGZC6GFOl1agimt7GcQKVuCU
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 01.12.20 um 11:00 schrieb Daniel Vetter:
> On Tue, Dec 1, 2020 at 10:40 AM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
>>
>> Hi
>>
>> Am 01.12.20 um 10:10 schrieb Daniel Vetter:
>>> On Tue, Dec 1, 2020 at 9:32 AM Thomas Zimmermann <tzimmermann@suse.de=
> wrote:
>>>>
>>>> Hi
>>>>
>>>> Am 30.11.20 um 16:33 schrieb Christian K=C3=B6nig:
>>>>> Am 30.11.20 um 16:30 schrieb Daniel Vetter:
>>>>>> On Mon, Nov 30, 2020 at 01:04:26PM +0100, Thomas Zimmermann wrote:=

>>>>>>> Mapping a GEM object's buffer into kernel address space prevents =
the
>>>>>>> buffer from being evicted from VRAM, which in turn may result in
>>>>>>> out-of-memory errors. It's therefore required to only vmap GEM BO=
s for
>>>>>>> short periods of time; unless the GEM implementation provides add=
itional
>>>>>>> guarantees.
>>>>>>>
>>>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/drm_prime.c |  6 ++++++
>>>>>>>     include/drm/drm_gem.h       | 16 ++++++++++++++++
>>>>>>>     2 files changed, 22 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_pr=
ime.c
>>>>>>> index 7db55fce35d8..9c9ece9833e0 100644
>>>>>>> --- a/drivers/gpu/drm/drm_prime.c
>>>>>>> +++ b/drivers/gpu/drm/drm_prime.c
>>>>>>> @@ -669,6 +669,12 @@ EXPORT_SYMBOL(drm_gem_unmap_dma_buf);
>>>>>>>      * callback. Calls into &drm_gem_object_funcs.vmap for device=

>>>>>>> specific handling.
>>>>>>>      * The kernel virtual address is returned in map.
>>>>>>>      *
>>>>>>> + * To prevent the GEM object from being relocated, callers must =
hold
>>>>>>> the GEM
>>>>>>> + * object's reservation lock from when calling this function unt=
il
>>>>>>> releasing the
>>>>>>> + * mapping. Holding onto a mapping and the associated reservatio=
n
>>>>>>> lock for an
>>>>>>> + * unbound time may result in out-of-memory errors. Calls to
>>>>>>> drm_gem_dmabuf_vmap()
>>>>>>> + * should therefore be accompanied by a call to
>>>>>>> drm_gem_dmabuf_vunmap().
>>>>>>> + *
>>>>>>>      * Returns 0 on success or a negative errno code otherwise.
>>>>>> This is a dma-buf hook, which means just documenting the rules you=
'd like
>>>>>> to have here isn't enough. We need to roll this out at the dma-buf=
 level,
>>>>>> and enforce it.
>>>>>>
>>>>>> Enforce it =3D assert_lock_held
>>>>>>
>>>>>> Roll out =3D review everyone. Because this goes through dma-buf it=
'll come
>>>>>> back through shmem helpers (and other helpers and other subsystems=
) back
>>>>>> to any driver using vmap for gpu buffers. This includes the media
>>>>>> subsystem, and the media subsystem definitely doesn't cope with ju=
st
>>>>>> temporarily mapping buffers. So there we need to pin them, which I=
 think
>>>>>> means we'll need 2 version of dma_buf_vmap - one that's temporary =
and
>>>>>> requires we hold dma_resv lock, the other requires that the buffer=
 is
>>>>>> pinned.
>>>>>
>>>>> OR start to proper use the dma_buf_pin/dma_buf_unpin functions whic=
h I
>>>>> added to cover this use case as well.
>>>>
>>>> While I generally agree, here are some thoughts:
>>>>
>>>> I found all generic pin functions useless, because they don't allow =
for
>>>> specifying where to pin. With fbdev emulation, this means that conso=
le
>>>> buffers might never make it to VRAM for scanout. If anything, the po=
licy
>>>> should be that pin always pins in HW-accessible memory.
>>>>
>>>> Pin has quite a bit of overhead (more locking, buffer movement), so =
it
>>>> should be the second choice after regular vmap. To make both work
>>>> together, pin probably relies on holding the reservation lock intern=
ally.
>>>>
>>>> Therefore I think we still would want some additional helpers, such =
as:
>>>>
>>>>      pin_unlocked(), which acquires the resv lock, calls regular pin=
 and
>>>> then drops the resv lock. Same for unpin_unlocked()
>>>>
>>>>      vmap_pinned(), which enforces that the buffer has been pinned a=
nd
>>>> then calls regalar vmap. Same for vunmap_pinned()
>>>>
>>>> A typical pattern with these functions would look like this.
>>>>
>>>>           drm_gem_object bo;
>>>>           dma_buf_map map;
>>>>
>>>>           init() {
>>>>                   pin_unlocked(bo);
>>>>                   vmap_pinned(bo, map);
>>>>           }
>>>>
>>>>           worker() {
>>>>                   begin_cpu_access()
>>>>                   // access bo via map
>>>>                   end_cpu_access()
>>>>           }
>>>>
>>>>           fini() {
>>>>                   vunmap_pinned(bo, map);
>>>>                   unpin_unlocked(bo);
>>>>           }
>>>>
>>>>           init()
>>>>           while (...) {
>>>>                   worker()
>>>>           }
>>>>           fini()
>>>>
>>>> Is that reasonable for media drivers?
>>>
>>> So media drivers go through dma-buf, which means we always pin into
>>> system memory. Which I guess for vram-only display drivers makes no
>>> sense and should be rejected, but we still need somewhat consistent
>>> rules.
>>>
>>> The other thing is that if you do a dma_buf_attach without dynamic
>>> mode, dma-buf will pin things for you already. So in many cases it
>>
>> Do you have a pointer to code that illustrates this well?
>>
>>> could be that we don't need a separate pin (but since the pin is in
>>> the exporter, not dma-buf layer, we can't check for that). I'm also
>>> not seeing why existing users need to split up their dma_buf_vmap int=
o
>>> a pin + vmap, they don't need them separately.
>>
>> It's two different operations, with pin having some possible overhead
>> and failure conditions. And during the last discussion, pin was say to=

>> be for userspace-managed buffers. Kernel code should hold the
>> reservation lock.
>>
>> For my POV, the current interfaces have no clear policy or semantics.
>> Looking through the different GEM implementations, each one seems to
>> have its own interpretation.
>=20
> Yup, that's the problem really. In the past we've had vmap exclusively
> for permanently pinned access, with no locking requirements. Now we're
> trying to make this more dynamic, but in a somewhat ad-hoc fashion
> (generic fbdev emulation charged ahead with making the fbdev
> framebuffer evictable), and now it breaks at every seam. Adding more
> ad-hoc semantics on top doesn't seem like a good idea.
>=20
> That's why I think we should have 2 different interfaces:
> - dma_buf_vmap, the one we currently have. Permanently pins the
> buffer, mapping survives, no locking required.
> - dma_buf_vmap_local, the new interface, the one that generic fbdev
> should have used (but oh well mistakes happen), requires
> dma_resv_lock, the mapping is only local to the caller

In patch 6 of this series, there's ast cursor code that acquires two=20
BO's reservation locks and vmaps them afterwards. That's probably how=20
you intend to use dma_buf_vmap_local.

However, I think it's more logically to have a vmap callback that only=20
does the actual vmap. This is all that exporters would have to implement.=


And with that, build one helper that pins before vmap and one helper=20
that gets the resv lock.

I know that it might require some work on exporting drivers. But with=20
your proposal, we probably need another dma-buf callback just for=20
vmap_local. (?) That seems even less appealing to me.

Best regards
Thomas

>=20
> Trying to shovel both semantics into one interface, depending upon
> which implementation we have backing the buffer, doesn't work indeed.
>=20
> Also on the pin topic, I think neither interface should require
> callers to explicitly pin anything. For existing users it should
> happen automatically behind the scenes imo, that's what they're
> expecting.
> -Daniel
>=20
>=20
>>> I think we could use what we've done for dynamic dma-buf attachment
>>> (which also change locking rules) and just have new functions for the=

>>> new way (i.e. short term vmap protected by dma_resv lock. Maybe call
>>> these dma_buf_vmap_local, in the spirit of the new kmap_local which
>>> are currently under discussion. I think _local suffix is better, for
>>> otherwise people might do something silly like
>>>
>>>       dma_resv_lock();
>>>       dma_buf_vmap_locked();
>>>       dma_resv_unlock();
>>>
>>>       /* actual access maybe even in some other thread */
>>>
>>>      dma_buf_resv_lock();
>>>      dma_buf_vunmap_unlocked();
>>>      dma_resv_unlock();
>>>
>>> _local suffix is better at telling that the resulting pointer has ver=
y
>>> limited use (essentially just local to the calling context, if you
>>> don't change any locking or anything).
>>
>> _local sounds good.
>>
>> Best regards
>> Thomas
>>
>>>
>>> I think encouraging importers to call dma_buf_pin/unpin isn't a good
>>> idea. Yes dynamic ones need it, but maybe we should check for that
>>> somehow in the exporterd interface (atm only amdgpu is using it).
>>> -Daniel
>>>
>>>
>>>
>>>
>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>
>>>>>
>>>>> Cheers,
>>>>> Christian.
>>>>>
>>>>>>
>>>>>> That's what I meant with that this approach here is very sprawling=
 :-/
>>>>>> -Daniel
>>>>>>
>>>>>>>      */
>>>>>>>     int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_b=
uf_map
>>>>>>> *map)
>>>>>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>>>>>>> index 5e6daa1c982f..7c34cd5ec261 100644
>>>>>>> --- a/include/drm/drm_gem.h
>>>>>>> +++ b/include/drm/drm_gem.h
>>>>>>> @@ -137,7 +137,21 @@ struct drm_gem_object_funcs {
>>>>>>>          * Returns a virtual address for the buffer. Used by the
>>>>>>>          * drm_gem_dmabuf_vmap() helper.
>>>>>>>          *
>>>>>>> +     * Notes to implementors:
>>>>>>> +     *
>>>>>>> +     * - Implementations must expect pairs of @vmap and @vunmap =
to be
>>>>>>> +     *   called frequently and should optimize for this case.
>>>>>>> +     *
>>>>>>> +     * - Implemenations may expect the caller to hold the GEM ob=
ject's
>>>>>>> +     *   reservation lock to protect against concurrent calls an=
d
>>>>>>> relocation
>>>>>>> +     *   of the GEM object.
>>>>>>> +     *
>>>>>>> +     * - Implementations may provide additional guarantees (e.g.=
,
>>>>>>> working
>>>>>>> +     *   without holding the reservation lock).
>>>>>>> +     *
>>>>>>>          * This callback is optional.
>>>>>>> +     *
>>>>>>> +     * See also drm_gem_dmabuf_vmap()
>>>>>>>          */
>>>>>>>         int (*vmap)(struct drm_gem_object *obj, struct dma_buf_ma=
p *map);
>>>>>>> @@ -148,6 +162,8 @@ struct drm_gem_object_funcs {
>>>>>>>          * drm_gem_dmabuf_vunmap() helper.
>>>>>>>          *
>>>>>>>          * This callback is optional.
>>>>>>> +     *
>>>>>>> +     * See also @vmap.
>>>>>>>          */
>>>>>>>         void (*vunmap)(struct drm_gem_object *obj, struct dma_buf=
_map
>>>>>>> *map);
>>>>>>> --
>>>>>>> 2.29.2
>>>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> dri-devel mailing list
>>>>> dri-devel@lists.freedesktop.org
>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
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


--CQ7APtYnJwGZC6GFOl1agimt7GcQKVuCU--

--iqZlTvXYs3C0v5aTGciQsFLM3ZkfjRY3B
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/GGqIFAwAAAAAACgkQlh/E3EQov+B9
EA/8C8G0RlKno9kdrzUEG+D00BfVWEyD6GGFbeCQ+0XwnBIbP9sToCyg9g0ZaU9vcZNuiRG2FNHM
kYa2DVAp8rk3yMRxsYl8Ye7w741oCb2Bc8rmYe6Et9H5x3TEL+ykDEw+k452iLrUG/1OvKdzNXGO
GPv9GIrFwkaV4jYj8Xtg/IdoulZVbUV8axLr4jaFBucyxsTi/DHu18ojUIkVaHIGmlWsvzpCQGhy
qYEzw3EFsIgCfk3Uqagm2WhjamJVCMRlKoWzzEMxePPs6sAYaRgSpJEnr9AkDqzWJ2ennYr/kuOd
Oo7671fl0n+lCk3k84G/YFIjZ1LpE3ZypnQQwqOVCqgqmFzXHiM5jY+vUqYBgw0V8cTSO7+GwlpF
FUNcC8lp79TZFl/dX8t93VjZbY3r8Fgc32jXbWSRy40X+BQOHF1DCOZ4owxMcoFTrbbHUwWrn0El
Vbs0ChWxy6cvLk11uu6+mOSUSAg2+UPihI0T3o9325QQOtsgEC/JyDcqsOGo2R3ogwn6E9yv7joH
DHiI4yfh4bu+4quNihLSDEnn7w/DB4qUYaQagBAT4+ovDbcuFIwgGHB7i7Z3m8IiejD3k+/mVR40
LtYUYI8lUl35vIb/TE6vpRRpESphn5Km4HBPZcUbMnNc9jKUB6epWkE+AMRfN59a3jH8JX9VX20h
hdE=
=PYSS
-----END PGP SIGNATURE-----

--iqZlTvXYs3C0v5aTGciQsFLM3ZkfjRY3B--

--===============1903532504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1903532504==--
