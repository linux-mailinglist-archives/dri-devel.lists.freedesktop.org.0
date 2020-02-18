Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E15E1162E85
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 19:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141D76EA69;
	Tue, 18 Feb 2020 18:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496ED6EA67;
 Tue, 18 Feb 2020 18:28:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8A9A3AD82;
 Tue, 18 Feb 2020 18:28:35 +0000 (UTC)
Subject: Re: [PATCH 8/8] drm/ttm: do not keep GPU dependent addresses
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Nirmoy <nirmodas@amd.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20200217150427.49994-1-nirmoy.das@amd.com>
 <20200217150427.49994-9-nirmoy.das@amd.com>
 <c3a20c1b-0520-1995-7445-9e3f3ea77394@suse.de>
 <9db59846-90b4-2b9a-8200-69297112693a@amd.com>
 <edc985f1-8856-4d1a-8960-efe4d21b960d@amd.com>
 <5b8db944-5a55-8161-6ab6-98490cfb0562@suse.de>
 <f8534965-ea14-bbac-bd34-06b951766a7c@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <48a5e3e2-cb9d-8328-1529-3558601ba860@suse.de>
Date: Tue, 18 Feb 2020 19:28:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f8534965-ea14-bbac-bd34-06b951766a7c@amd.com>
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 nouveau@lists.freedesktop.org, alexander.deucher@amd.com, sean@poorly.run,
 kraxel@redhat.com
Content-Type: multipart/mixed; boundary="===============0708699225=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0708699225==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5odbZ9nBjSpbEGJk3Eu9ZnKJP14fWy4mO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5odbZ9nBjSpbEGJk3Eu9ZnKJP14fWy4mO
Content-Type: multipart/mixed; boundary="2QTwX1RqQT5bd67J6YiyKh3dVgnvqnLoS";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Nirmoy <nirmodas@amd.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 nouveau@lists.freedesktop.org, alexander.deucher@amd.com, sean@poorly.run,
 kraxel@redhat.com
Message-ID: <48a5e3e2-cb9d-8328-1529-3558601ba860@suse.de>
Subject: Re: [PATCH 8/8] drm/ttm: do not keep GPU dependent addresses
References: <20200217150427.49994-1-nirmoy.das@amd.com>
 <20200217150427.49994-9-nirmoy.das@amd.com>
 <c3a20c1b-0520-1995-7445-9e3f3ea77394@suse.de>
 <9db59846-90b4-2b9a-8200-69297112693a@amd.com>
 <edc985f1-8856-4d1a-8960-efe4d21b960d@amd.com>
 <5b8db944-5a55-8161-6ab6-98490cfb0562@suse.de>
 <f8534965-ea14-bbac-bd34-06b951766a7c@amd.com>
In-Reply-To: <f8534965-ea14-bbac-bd34-06b951766a7c@amd.com>

--2QTwX1RqQT5bd67J6YiyKh3dVgnvqnLoS
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 18.02.20 um 19:23 schrieb Christian K=C3=B6nig:
> Am 18.02.20 um 19:16 schrieb Thomas Zimmermann:
>> Hi
>>
>> Am 18.02.20 um 18:13 schrieb Nirmoy:
>>> On 2/18/20 1:44 PM, Christian K=C3=B6nig wrote:
>>>> Am 18.02.20 um 13:40 schrieb Thomas Zimmermann:
>>>>> Hi
>>>>>
>>>>> Am 17.02.20 um 16:04 schrieb Nirmoy Das:
>>>>>> GPU address handling is device specific and should be handle by it=
s
>>>>>> device
>>>>>> driver.
>>>>>>
>>>>>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
>>>>>> ---
>>>>>> =C2=A0=C2=A0 drivers/gpu/drm/ttm/ttm_bo.c=C2=A0=C2=A0=C2=A0 | 7 --=
-----
>>>>>> =C2=A0=C2=A0 include/drm/ttm/ttm_bo_api.h=C2=A0=C2=A0=C2=A0 | 2 --=

>>>>>> =C2=A0=C2=A0 include/drm/ttm/ttm_bo_driver.h | 1 -
>>>>>> =C2=A0=C2=A0 3 files changed, 10 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>> index 151edfd8de77..d5885cd609a3 100644
>>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>> @@ -85,7 +85,6 @@ static void ttm_mem_type_debug(struct
>>>>>> ttm_bo_device *bdev, struct drm_printer *p
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=
=A0 has_type: %d\n", man->has_type);
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=
=A0 use_type: %d\n", man->use_type);
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=
=A0 flags: 0x%08X\n", man->flags);
>>>>>> -=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=A0 gpu_offset: =
0x%08llX\n", man->gpu_offset);
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=
=A0 size: %llu\n", man->size);
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=
=A0 available_caching: 0x%08X\n",
>>>>>> man->available_caching);
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=
=A0 default_caching: 0x%08X\n",
>>>>>> man->default_caching);
>>>>>> @@ -345,12 +344,6 @@ static int ttm_bo_handle_move_mem(struct
>>>>>> ttm_buffer_object *bo,
>>>>>> =C2=A0=C2=A0 moved:
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo->evicted =3D false;
>>>>>> =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 if (bo->mem.mm_node)
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo->offset =3D (bo->me=
m.start << PAGE_SHIFT) +
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 bdev->man[bo->mem.mem_type].gpu_offset;
>>>>>> -=C2=A0=C2=A0=C2=A0 else
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo->offset =3D 0;
>>>>>> -
>>>>> After moving this into users, the else branch has been lost. Is
>>>>> 'bo->mem.mm_node' always true?
>>>> At least for the amdgpu and radeon use cases, yes.
>>>>
>>>> But that is a rather good question I mean for it is illegal to get t=
he
>>>> GPU BO address if it is inaccessible (e.g. in the system domain).
>>>>
>>>> Could be that some driver relied on the behavior to get 0 for the
>>>> system domain here.
>>> I wonder how to verify that ?
>>>
>>> If I understand correctly:
>>>
>>> 1 qxl uses bo->offset only in qxl_bo_physical_address() which is not =
in
>>> system domain.
>>>
>>> 2 unfortunately I can't say the same for bochs but it works with this=

>>> patch series so I think bochs is fine as well.
>>>
>>> 3 vmwgfx uses bo->offset only when bo->mem.mem_type =3D=3D TTM_PL_VRA=
M so
>>> vmwgfx should be fine.
>>>
>>> 4 amdgpu and radeon runs with 'bo->mem.mm_node' always true
>>>
>>> I am not sure about=C2=A0 nouveau as bo->offset is being used in many=
 places.
>>>
>>> I could probably mirror the removed logic to nouveau as
>> I suggest to introduce a ttm helper that contains the original branchi=
ng
>> and use it everywhere. Something like
>>
>> =C2=A0=C2=A0 s64 ttm_bo_offset(struct ttm_buffer_object *bo)
>> =C2=A0=C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (WARN_ON_ONCE(!bo->mem.mm_node))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return bo->mem.start << PAGE_SHIFT;
>> =C2=A0=C2=A0 }
>>
>> Could be static inline. The warning should point to broken drivers. Th=
is
>> also gets rid of the ugly shift in the drivers.
>=20
> Big NAK on this. That is exactly what we should NOT do.
>=20
> See the shift belongs into the driver, because it is driver dependent i=
f
> we work with page or byte offsets.
>=20
> For amdgpu we for example want to work with byte offsets and TTM should=

> not make any assumption about what bo->mem.start actually contains.

OK. What about something like ttm_bo_pg_offset()? Same code without the
shift. Would also make it clear that it's a page offset.

Best regards
Thomas

>=20
> Regards,
> Christian.
>=20
>>
>> Best regards
>> Thomas
>>
>>
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
>>> b/drivers/gpu/drm/nouveau/nouveau_bo.c
>>> index f8015e0318d7..5a6a2af91318 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>>> @@ -1317,6 +1317,10 @@ nouveau_bo_move_ntfy(struct ttm_buffer_object
>>> *bo, bool evict,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_for_each_entry(vma, &nvbo->vma_list, hea=
d) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 nouveau_vma_map(vma, mem);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if (bo->mem.mm_node)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvbo->off=
set =3D (new_reg->start << PAGE_SHIFT);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 else
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvbo->off=
set =3D 0;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_for_each_entry(vma, &nvbo->vma_list, hea=
d) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 WARN_ON(ttm_bo_wait(bo, false, false));
>>>
>>> Regards,
>>>
>>> Nirmoy
>>>
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Best regards
>>>>> Thomas
>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx->bytes_moved +=3D bo->num=
_pages << PAGE_SHIFT;
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>> =C2=A0=C2=A0 diff --git a/include/drm/ttm/ttm_bo_api.h
>>>>>> b/include/drm/ttm/ttm_bo_api.h
>>>>>> index b9bc1b00142e..d6f39ee5bf5d 100644
>>>>>> --- a/include/drm/ttm/ttm_bo_api.h
>>>>>> +++ b/include/drm/ttm/ttm_bo_api.h
>>>>>> @@ -213,8 +213,6 @@ struct ttm_buffer_object {
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * either of these locks=
 held.
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>> =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 uint64_t offset; /* GPU address s=
pace is independent of CPU
>>>>>> word size */
>>>>>> -
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct sg_table *sg;
>>>>>> =C2=A0=C2=A0 };
>>>>>> =C2=A0=C2=A0 diff --git a/include/drm/ttm/ttm_bo_driver.h
>>>>>> b/include/drm/ttm/ttm_bo_driver.h
>>>>>> index c9e0fd09f4b2..c8ce6c181abe 100644
>>>>>> --- a/include/drm/ttm/ttm_bo_driver.h
>>>>>> +++ b/include/drm/ttm/ttm_bo_driver.h
>>>>>> @@ -177,7 +177,6 @@ struct ttm_mem_type_manager {
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool has_type;
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool use_type;
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t flags;
>>>>>> -=C2=A0=C2=A0=C2=A0 uint64_t gpu_offset; /* GPU address space is i=
ndependent of CPU
>>>>>> word size */
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t size;
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t available_caching;
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t default_caching;
>>>>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
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


--2QTwX1RqQT5bd67J6YiyKh3dVgnvqnLoS--

--5odbZ9nBjSpbEGJk3Eu9ZnKJP14fWy4mO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5MLMcACgkQaA3BHVML
eiNMyAf8CRXNe9aql1MAVwCdSaR9/4hR9LapRxTs2j/wUe55kLexyQ+0cL+yy+uI
hEb8040nUSfLMezCn37xkbRqSsyS8dFmUSg2yJ/o9/1Tk6BZAUwelAFjGWEb+ttv
yowsCV4C7e6jd9Eo8+UepmXP15TGEUFhJ3vrLfIfi2tRbivcVu6BD0tie5WBJOzB
/Ty0eRtvDADEQbXJ9lzU+M0I6M3FVj90WYE/dSc5JvanqjCAbJ6kymmqJ/g8qQZ1
U+f5SM5UTKVDByGqTittRs4iw2Jq9dT5Mb8wNQpJHTL53sxURAiWsFOYmGmSkK12
oTPO51lCj/wzY1gRDkxbB0c9RzzgtQ==
=nFJ7
-----END PGP SIGNATURE-----

--5odbZ9nBjSpbEGJk3Eu9ZnKJP14fWy4mO--

--===============0708699225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0708699225==--
