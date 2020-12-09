Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B689E2D3ED1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 10:32:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556F96E133;
	Wed,  9 Dec 2020 09:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512B56E133
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 09:32:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7BB1DAC94;
 Wed,  9 Dec 2020 09:32:37 +0000 (UTC)
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20201203140259.26580-1-tzimmermann@suse.de>
 <20201203140259.26580-8-tzimmermann@suse.de>
 <20201203152601.GB401619@phenom.ffwll.local>
 <ee2abd93-0dfe-53a3-0038-5edc58c3ec92@suse.de>
 <20201203204129.GC401619@phenom.ffwll.local>
 <a253129d-c0e3-c864-fa0c-111338d25e25@suse.de>
 <4fc93de9-cd26-58b0-d398-ac97577ffa92@amd.com>
 <20201209001321.GF401619@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 7/7] dma-buf: Write down some rules for vmap usage
Message-ID: <8ef5d69a-b5b3-31d0-b011-8860b60f35eb@suse.de>
Date: Wed, 9 Dec 2020 10:32:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201209001321.GF401619@phenom.ffwll.local>
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
Cc: linaro-mm-sig@lists.linaro.org, hdegoede@redhat.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@redhat.com
Content-Type: multipart/mixed; boundary="===============1581344504=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1581344504==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bKxtXe23WBn7W6bDLD0sAcr6ipZTz5iZk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bKxtXe23WBn7W6bDLD0sAcr6ipZTz5iZk
Content-Type: multipart/mixed; boundary="La2DN66lFLV4lealZBpFx55x3kQJCiryS";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 hdegoede@redhat.com, airlied@redhat.com, linux-media@vger.kernel.org
Message-ID: <8ef5d69a-b5b3-31d0-b011-8860b60f35eb@suse.de>
Subject: Re: [PATCH v2 7/7] dma-buf: Write down some rules for vmap usage
References: <20201203140259.26580-1-tzimmermann@suse.de>
 <20201203140259.26580-8-tzimmermann@suse.de>
 <20201203152601.GB401619@phenom.ffwll.local>
 <ee2abd93-0dfe-53a3-0038-5edc58c3ec92@suse.de>
 <20201203204129.GC401619@phenom.ffwll.local>
 <a253129d-c0e3-c864-fa0c-111338d25e25@suse.de>
 <4fc93de9-cd26-58b0-d398-ac97577ffa92@amd.com>
 <20201209001321.GF401619@phenom.ffwll.local>
In-Reply-To: <20201209001321.GF401619@phenom.ffwll.local>

--La2DN66lFLV4lealZBpFx55x3kQJCiryS
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 09.12.20 um 01:13 schrieb Daniel Vetter:
> On Fri, Dec 04, 2020 at 09:47:08AM +0100, Christian K=C3=B6nig wrote:
>> Am 04.12.20 um 09:32 schrieb Thomas Zimmermann:
>>> Hi
>>>
>>> Am 03.12.20 um 21:41 schrieb Daniel Vetter:
>>>> On Thu, Dec 03, 2020 at 07:59:04PM +0100, Thomas Zimmermann wrote:
>>>>> Hi
>>>>>
>>>>> Am 03.12.20 um 16:26 schrieb Daniel Vetter:
>>>>>> On Thu, Dec 03, 2020 at 03:02:59PM +0100, Thomas Zimmermann wrote:=

>>>>>>> Dma-buf's vmap and vunmap callbacks are undocumented and various
>>>>>>> exporters currently have slightly different semantics for them. A=
dd
>>>>>>> documentation on how to implement and use these interfaces correc=
tly.
>>>>>>>
>>>>>>> v2:
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0* document vmap semantics in struct dma_=
buf_ops
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0* add TODO item for reviewing and maybe =
fixing dma-buf exporters
>>>>>>>
>>>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>
>>>>>> I still don't think this works, we're breaking dma_buf_vmap
>>>>>> for everyone
>>>>>> else here.
>>>>>
>>>>> I removed the text on the importer. These notes for callers in
>>>>> the docs are
>>>>> more or less a consequence of the exporter semantics.
>>>>
>>>> Callers are importers, so I'm not seeing how that fixes anything.
>>>>
>>>>> I thought we at least agreed on the exporter semantics in the
>>>>> other thread,
>>>>> didn't we?
>>>>>
>>>>> What I'm trying to do is to write dome some rules for exporters,
>>>>> even if not
>>>>> all exporters follow them.
>>>>
>>>> This is a standard interface, everyone needs to follow the same
>>>> rules. And
>>>> if they change, we need to make sure nothing breaks and we're not
>>>> creating
>>>> issues.
>>>>
>>>> In the past the rule was the dma_buf_vmap was allowed to take the
>>>> dma_resv_lock, and that the buffer should be pinned. Now some ttm
>>>> drivers
>>>> didn't ever bother with the pinning, and mostly got away with that
>>>> because
>>>> drm_prime helpers do the pinning by default at attach time, and most=

>>>> users
>>>> do call dma_buf_attach.
>>>>
>>>> But if you look through dma-buf docs nothing ever said you have to d=
o a
>>>> dummy attachment before you call dma_buf_vmap, that's just slightly
>>>> crappy
>>>> implementations that didn't blow up yet.
>>>
>>> I had a patch for adding pin to radeon's implementation of vmap. [1]
>>> Christian told me to not do this; instead just get the lock in the fb=
dev
>>> code. His advise almost seems the opposite of what you're telling me
>>> here.
>>
>> I think what Daniel suggests here is that we need to smoothly transiti=
on the
>> code from making assumptions to having a straight interface where impo=
rters
>> explicitly say when stuff is locked and when stuff is pinned.
>>
>> I've started this with the attach interface by adding a new dynamic ap=
proach
>> to that, but you probably need to carry on here with that for vmap as =
well.
>>
>> When that is done we can migrate every exporter over to the new dynami=
c
>> approach.
>>
>>>
>>> For the GEM VRAM helpers, that implicit pin in vmap gave me headaches=
=2E
>>> Because scanouts can only be done from VRAM, which is badly suited fo=
r
>>> exporting. So I ended up with an implicit pin that pins the buffer to=

>>> whatever domain it currently is. I got away with it because GEM VRAM =
BOs
>>> are not sharable among devices; fbdev is the only user of that
>>> functionality and only pins for short periods of time.
>>>
>>> I suspect that fixing TTM-based drivers by adding an implicit pin wou=
ld
>>> result in a similar situation. Whatever domain it ends up pinning, so=
me
>>> functionality might not be compatible with that.
>>
>> Correct, exactly that's the problem.
>>
>>>
>>>>
>>>>> Given the circumstances, we should leave out this patch from the
>>>>> patchset.
>>>>
>>>> So the defacto rules are already a big mess, but that's not a good
>>>> excuse
>>>> to make it worse.
>>>>
>>>> What I had in mind is that we split dma_buf_vmap up into two variant=
s:
>>>>
>>>> - The current one, which should guarantee that the buffer is pinned.=

>>>>  =C2=A0=C2=A0 Because that's what all current callers wanted, before=
 the fbdev code
>>>>  =C2=A0=C2=A0 started allowing non-pinned buffers.
>>>
>>> Can we add an explicit pin operation to dma_buf_vmap() to enforce the=

>>> semantics?
>>
>> At least I would be fine with that. For now amdgpu is the only exporte=
r who
>> implements the explicit pin/unpin semantics anyway.
>=20
> Yup, I think that makes sense (if it works). Maybe we could use somethi=
ng
> like:
>=20
> a) dma_buf pin exists, driver is dynamic. This means dma_buf_vmap needs=
 to
> first pin, then call ->vmap. dma_buf_vmap_local otoh can directly call
> ->vmap since the exporter relies on either a pin or dma_resv_lock.
>=20
> b) dma_buf pin not implement, driver is a legacy pile. dma_buf_vmap wil=
l
> pin (somewhere at least, or rely on some implicit pin), dma_buf_vmap_lo=
cal
> doesn't work and should fail.

I think I read in the dma-buf documentation that pin is supposed to put=20
the BO in a domain that is suitable for scanout. Now I don't really=20
trust this to work. Amdgpu, radeon and nouveau put it into the GTT=20
region. Qxl appears to put it wherever it is.

>=20
> I think for less transition work fbdev helpers could first try
> dma_resv_lock + dma_buf_vmap_local, if that fails, drop the dma_resv_lo=
ck
> and do the pinning dma_buf_vmap. That way we don't have to convert shme=
m
> helpers over to dma_resv locking, which should help.

I have meanwhile made a patchset that updates helpers for cma, shmem and =

vram with vmap_local; and converts fbdev emulation as well. It needs a=20
bit more testing before being posted.

Best regards
Thomas

>=20
> And ttm drivers would do the new clean interface, so at least everyone
> using dma_resv today is all fine. Intel's conversion to dma_resv lock i=
s
> in-flight, but that needs a conversion to the dynamic interface anyway,=

> the current code splats. And dynamic brings means explicit pin/unpin
> callbacks, so should be good too.
> -Daniel
>=20
>>
>> Regards,
>> Christian.
>>
>>>
>>> Best regards
>>> Thomas
>>>
>>> [1] https://patchwork.freedesktop.org/patch/400054/?series=3D83765&re=
v=3D1
>>>
>>>>
>>>> - The new one, which allows vmapping with just dma_resv locked, and
>>>> should
>>>>  =C2=A0=C2=A0 have some caching in exporters.
>>>>
>>>> Breaking code and then adding todos about that is kinda not so cool
>>>> approach here imo.
>>>>
>>>> Also I guess ttm_bo_vmap should have a check that either the buffer =
is
>>>> pinned, or dma_resv_lock is held.
>>>>
>>>> Cheers, Daniel
>>>>
>>>>
>>>>
>>>>>
>>>>> Best regards
>>>>> Thomas
>>>>>
>>>>>>
>>>>>>> ---
>>>>>>>  =C2=A0=C2=A0 Documentation/gpu/todo.rst | 15 +++++++++++++
>>>>>>>  =C2=A0=C2=A0 include/drm/drm_gem.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 4 ++++
>>>>>>>  =C2=A0=C2=A0 include/linux/dma-buf.h=C2=A0=C2=A0=C2=A0 | 45
>>>>>>> ++++++++++++++++++++++++++++++++++++++
>>>>>>>  =C2=A0=C2=A0 3 files changed, 64 insertions(+)
>>>>>>>
>>>>>>> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.=
rst
>>>>>>> index 009d8e6c7e3c..32bb797a84fc 100644
>>>>>>> --- a/Documentation/gpu/todo.rst
>>>>>>> +++ b/Documentation/gpu/todo.rst
>>>>>>> @@ -505,6 +505,21 @@ Contact: Thomas Zimmermann
>>>>>>> <tzimmermann@suse.de>, Christian K=C3=B6nig, Daniel Vette
>>>>>>>  =C2=A0=C2=A0 Level: Intermediate
>>>>>>> +Enforce rules for dma-buf vmap and pin ops
>>>>>>> +------------------------------------------
>>>>>>> +
>>>>>>> +Exporter implementations of vmap and pin in struct
>>>>>>> dma_buf_ops (and consequently
>>>>>>> +struct drm_gem_object_funcs) use a variety of locking
>>>>>>> semantics. Some rely on
>>>>>>> +the caller holding the dma-buf's reservation lock, some
>>>>>>> do their own locking,
>>>>>>> +some don't require any locking. VRAM helpers even used
>>>>>>> to pin as part of vmap.
>>>>>>> +
>>>>>>> +We need to review each exporter and enforce the documented rules=
=2E
>>>>>>> +
>>>>>>> +Contact: Christian K=C3=B6nig, Daniel Vetter, Thomas
>>>>>>> Zimmermann <tzimmermann@suse.de>
>>>>>>> +
>>>>>>> +Level: Advanced
>>>>>>> +
>>>>>>> +
>>>>>>>  =C2=A0=C2=A0 Core refactorings
>>>>>>>  =C2=A0=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=

>>>>>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>>>>>>> index 5e6daa1c982f..1864c6a721b1 100644
>>>>>>> --- a/include/drm/drm_gem.h
>>>>>>> +++ b/include/drm/drm_gem.h
>>>>>>> @@ -138,6 +138,8 @@ struct drm_gem_object_funcs {
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * drm_gem_dmabuf_vmap=
() helper.
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * This callback is op=
tional.
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * See also struct dma_buf_ops.vmap
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int (*vmap)(struct drm_gem_=
object *obj, struct
>>>>>>> dma_buf_map *map);
>>>>>>> @@ -148,6 +150,8 @@ struct drm_gem_object_funcs {
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * drm_gem_dmabuf_vunm=
ap() helper.
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * This callback is op=
tional.
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * See also struct dma_buf_ops.vunmap
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*vunmap)(struct drm_g=
em_object *obj, struct
>>>>>>> dma_buf_map *map);
>>>>>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>>>>>> index cf72699cb2bc..dc81fdc01dda 100644
>>>>>>> --- a/include/linux/dma-buf.h
>>>>>>> +++ b/include/linux/dma-buf.h
>>>>>>> @@ -267,7 +267,52 @@ struct dma_buf_ops {
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int (*mmap)(struct dma_buf =
*, struct vm_area_struct *vma);
>>>>>>> +=C2=A0=C2=A0=C2=A0 /**
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * @vmap:
>>>>>>
>>>>>> There's already a @vmap and @vunamp kerneldoc at the top comment, =
that
>>>>>> needs to be removed.
>>>>>> -Daniel
>>>>>>
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Returns a virtual address for the buf=
fer.
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Notes to callers:
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * - Callers must hold the struct dma_bu=
f.resv lock
>>>>>>> before calling
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 this interface.
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * - Callers must provide means to preve=
nt the
>>>>>>> mappings from going
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 stale, such as holding th=
e reservation lock or providing a
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 move-notify callback to t=
he exporter.
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Notes to implementors:
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * - Implementations must expect pairs o=
f @vmap and
>>>>>>> @vunmap to be
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 called frequently and sho=
uld optimize for this case.
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * - Implementations should avoid additi=
onal operations, such as
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 pinning.
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * - Implementations may expect the call=
er to hold the dma-buf's
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 reservation lock to prote=
ct against concurrent calls and
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 relocation.
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * - Implementations may provide additio=
nal
>>>>>>> guarantees, such as working
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 without holding the reser=
vation lock.
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * This callback is optional.
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Returns:
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * 0 on success or a negative error code=
 on failure.
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int (*vmap)(struct dma_buf =
*dmabuf, struct dma_buf_map *map);
>>>>>>> +
>>>>>>> +=C2=A0=C2=A0=C2=A0 /**
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * @vunmap:
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Releases the address previously retur=
ned by @vmap.
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * This callback is optional.
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * See also @vmap()
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*vunmap)(struct dma_b=
uf *dmabuf, struct
>>>>>>> dma_buf_map *map);
>>>>>>>  =C2=A0=C2=A0 };
>>>>>>> --=20
>>>>>>> 2.29.2
>>>>>>>
>>>>>>
>>>>>
>>>>> --=20
>>>>> Thomas Zimmermann
>>>>> Graphics Driver Developer
>>>>> SUSE Software Solutions Germany GmbH
>>>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>>>>> (HRB 36809, AG N=C3=BCrnberg)
>>>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>>>>
>>>>
>>>>
>>>>
>>>>
>>>
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--La2DN66lFLV4lealZBpFx55x3kQJCiryS--

--bKxtXe23WBn7W6bDLD0sAcr6ipZTz5iZk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/QmbQFAwAAAAAACgkQlh/E3EQov+Bo
URAAmUc1ARG25ekIz7kVIVmppbSL/mYdv+NPCDgzGresfyNlJm9WUHGpFbCcls9ov67gz2IqpKIR
8IAOaP/51f56FnOAsQyDA+XLbu7C7DK2Varb0q1m58QeFePai0WO2PvQk7ZxDWr6SleHs10YeVKq
8t3MLX2jroJ8Ms3MsEDqJLNEJcA5jU3SlKKgukcDs8dg30XURsagL9oZopUzHQfZ0SKhtQ5210Ld
Ohjz9hGWROxl404vusByLtxxobqeWYvyrb60wwJZBUC1NJO30SZra++LfAwRkCASDdSfmWMli0yd
wCo7FIrV35daCmbefwNJUam4GQ4wtGZ3GDI2oYWU6YY4r1MmueDCqt4SSNXtwO9yUzz+VPgJTUWW
OMCPosyJGuwxuRyw3wFS6hy6SIJ8rD5s9bF9OksVDS+A9hTm05Fq/yLLUpxmC/s6D856b0vYUgHc
id5Y2B4yglH/fpJQYizF5JTTZaoQzRzzBDIZ0oj1pxvbmHmC0sW6btsRvrjIWinL/1y1HNbeRjmz
o91VOyQKU1FWA6RpaSw4qJTqVnTRRBT4SUB1MUl+FtGcQLbheCIE1LPzKiCXO5TR6QYOhVbQOgUi
G2El7mzcwPV+OmF96XQrEqbTJE7WKB0LckUzTYnSBJYMc3n/CQHUMFZdsQ58QwYmemOogzRKumUt
OK0=
=8Xgm
-----END PGP SIGNATURE-----

--bKxtXe23WBn7W6bDLD0sAcr6ipZTz5iZk--

--===============1581344504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1581344504==--
