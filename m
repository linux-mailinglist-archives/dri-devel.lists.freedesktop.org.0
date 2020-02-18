Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A13D3162E2A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 19:16:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03606E379;
	Tue, 18 Feb 2020 18:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C725D6E379;
 Tue, 18 Feb 2020 18:16:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CC288AD41;
 Tue, 18 Feb 2020 18:16:21 +0000 (UTC)
Subject: Re: [PATCH 8/8] drm/ttm: do not keep GPU dependent addresses
To: Nirmoy <nirmodas@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20200217150427.49994-1-nirmoy.das@amd.com>
 <20200217150427.49994-9-nirmoy.das@amd.com>
 <c3a20c1b-0520-1995-7445-9e3f3ea77394@suse.de>
 <9db59846-90b4-2b9a-8200-69297112693a@amd.com>
 <edc985f1-8856-4d1a-8960-efe4d21b960d@amd.com>
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
Message-ID: <5b8db944-5a55-8161-6ab6-98490cfb0562@suse.de>
Date: Tue, 18 Feb 2020 19:16:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <edc985f1-8856-4d1a-8960-efe4d21b960d@amd.com>
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
Content-Type: multipart/mixed; boundary="===============0827404907=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0827404907==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2FpYNFovlXIxQgABC0dwSvgcJqNG8hZKH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2FpYNFovlXIxQgABC0dwSvgcJqNG8hZKH
Content-Type: multipart/mixed; boundary="8kFX9osUBXFmJcRTklmEoYxEWgDw3kiMW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Nirmoy <nirmodas@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 nouveau@lists.freedesktop.org, alexander.deucher@amd.com, sean@poorly.run,
 kraxel@redhat.com
Message-ID: <5b8db944-5a55-8161-6ab6-98490cfb0562@suse.de>
Subject: Re: [PATCH 8/8] drm/ttm: do not keep GPU dependent addresses
References: <20200217150427.49994-1-nirmoy.das@amd.com>
 <20200217150427.49994-9-nirmoy.das@amd.com>
 <c3a20c1b-0520-1995-7445-9e3f3ea77394@suse.de>
 <9db59846-90b4-2b9a-8200-69297112693a@amd.com>
 <edc985f1-8856-4d1a-8960-efe4d21b960d@amd.com>
In-Reply-To: <edc985f1-8856-4d1a-8960-efe4d21b960d@amd.com>

--8kFX9osUBXFmJcRTklmEoYxEWgDw3kiMW
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 18.02.20 um 18:13 schrieb Nirmoy:
>=20
> On 2/18/20 1:44 PM, Christian K=C3=B6nig wrote:
>> Am 18.02.20 um 13:40 schrieb Thomas Zimmermann:
>>> Hi
>>>
>>> Am 17.02.20 um 16:04 schrieb Nirmoy Das:
>>>> GPU address handling is device specific and should be handle by its
>>>> device
>>>> driver.
>>>>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
>>>> ---
>>>> =C2=A0 drivers/gpu/drm/ttm/ttm_bo.c=C2=A0=C2=A0=C2=A0 | 7 -------
>>>> =C2=A0 include/drm/ttm/ttm_bo_api.h=C2=A0=C2=A0=C2=A0 | 2 --
>>>> =C2=A0 include/drm/ttm/ttm_bo_driver.h | 1 -
>>>> =C2=A0 3 files changed, 10 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> index 151edfd8de77..d5885cd609a3 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> @@ -85,7 +85,6 @@ static void ttm_mem_type_debug(struct
>>>> ttm_bo_device *bdev, struct drm_printer *p
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=A0 has=
_type: %d\n", man->has_type);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=A0 use=
_type: %d\n", man->use_type);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=A0 fla=
gs: 0x%08X\n", man->flags);
>>>> -=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=A0 gpu_offset: 0x=
%08llX\n", man->gpu_offset);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=A0 siz=
e: %llu\n", man->size);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=A0 ava=
ilable_caching: 0x%08X\n",
>>>> man->available_caching);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_printf(p, "=C2=A0=C2=A0=C2=A0 def=
ault_caching: 0x%08X\n",
>>>> man->default_caching);
>>>> @@ -345,12 +344,6 @@ static int ttm_bo_handle_move_mem(struct
>>>> ttm_buffer_object *bo,
>>>> =C2=A0 moved:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo->evicted =3D false;
>>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (bo->mem.mm_node)
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo->offset =3D (bo->mem.=
start << PAGE_SHIFT) +
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
bdev->man[bo->mem.mem_type].gpu_offset;
>>>> -=C2=A0=C2=A0=C2=A0 else
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo->offset =3D 0;
>>>> -
>>> After moving this into users, the else branch has been lost. Is
>>> 'bo->mem.mm_node' always true?
>>
>> At least for the amdgpu and radeon use cases, yes.
>>
>> But that is a rather good question I mean for it is illegal to get the=

>> GPU BO address if it is inaccessible (e.g. in the system domain).
>>
>> Could be that some driver relied on the behavior to get 0 for the
>> system domain here.
>=20
> I wonder how to verify that ?
>=20
> If I understand correctly:
>=20
> 1 qxl uses bo->offset only in qxl_bo_physical_address() which is not in=
=C2=A0
> system domain.
>=20
> 2 unfortunately I can't say the same for bochs but it works with this
> patch series so I think bochs is fine as well.
>=20
> 3 vmwgfx uses bo->offset only when bo->mem.mem_type =3D=3D TTM_PL_VRAM =
so
> vmwgfx should be fine.
>=20
> 4 amdgpu and radeon runs with 'bo->mem.mm_node' always true
>=20
> I am not sure about=C2=A0 nouveau as bo->offset is being used in many p=
laces.
>=20
> I could probably mirror the removed logic to nouveau as

I suggest to introduce a ttm helper that contains the original branching
and use it everywhere. Something like

  s64 ttm_bo_offset(struct ttm_buffer_object *bo)
  {
     if (WARN_ON_ONCE(!bo->mem.mm_node))
         return 0;
     return bo->mem.start << PAGE_SHIFT;
  }

Could be static inline. The warning should point to broken drivers. This
also gets rid of the ugly shift in the drivers.

Best regards
Thomas


>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
> b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index f8015e0318d7..5a6a2af91318 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1317,6 +1317,10 @@ nouveau_bo_move_ntfy(struct ttm_buffer_object
> *bo, bool evict,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 list_for_each_entry(vma, &nvbo->vma_list, head) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nouvea=
u_vma_map(vma, mem);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (bo->mem.mm_node)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvbo->offset=
 =3D (new_reg->start << PAGE_SHIFT);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvbo->offset=
 =3D 0;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 list_for_each_entry(vma, &nvbo->vma_list, head) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN_O=
N(ttm_bo_wait(bo, false, false));
>=20
> Regards,
>=20
> Nirmoy
>=20
>=20
>>
>> Regards,
>> Christian.
>>
>>>
>>> Best regards
>>> Thomas
>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx->bytes_moved +=3D bo->num_pages <=
< PAGE_SHIFT;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>> =C2=A0 diff --git a/include/drm/ttm/ttm_bo_api.h
>>>> b/include/drm/ttm/ttm_bo_api.h
>>>> index b9bc1b00142e..d6f39ee5bf5d 100644
>>>> --- a/include/drm/ttm/ttm_bo_api.h
>>>> +++ b/include/drm/ttm/ttm_bo_api.h
>>>> @@ -213,8 +213,6 @@ struct ttm_buffer_object {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * either of these locks held.
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 uint64_t offset; /* GPU address space is =
independent of CPU
>>>> word size */
>>>> -
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct sg_table *sg;
>>>> =C2=A0 };
>>>> =C2=A0 diff --git a/include/drm/ttm/ttm_bo_driver.h
>>>> b/include/drm/ttm/ttm_bo_driver.h
>>>> index c9e0fd09f4b2..c8ce6c181abe 100644
>>>> --- a/include/drm/ttm/ttm_bo_driver.h
>>>> +++ b/include/drm/ttm/ttm_bo_driver.h
>>>> @@ -177,7 +177,6 @@ struct ttm_mem_type_manager {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool has_type;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool use_type;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t flags;
>>>> -=C2=A0=C2=A0=C2=A0 uint64_t gpu_offset; /* GPU address space is ind=
ependent of CPU
>>>> word size */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t size;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t available_caching;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t default_caching;
>>>>
>>
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


--8kFX9osUBXFmJcRTklmEoYxEWgDw3kiMW--

--2FpYNFovlXIxQgABC0dwSvgcJqNG8hZKH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5MKegACgkQaA3BHVML
eiPLmAf/XSJQY4qYaVUbzr30C7lZmwph8iZD5GCExhr5eurd8ybw8/97o+9aiwH0
mdEclOvgJFaTanaObGvcqhi6bry7dA3KtCFKkcgdKUdXd+YLdHnsjAr+IO1opkVI
QrRUHYjKKE64PsYYmGL5OjFVYnXQZoaR++dJ1K9n0Ywyc4uKbAaanlJdCPmtZTSA
sHQdWkmBoMpmUlW+yTE5OWmX6y3Odv7cDYEHI1xD4L9lUvEd/kTWp1w6ZEH0hx3U
vO1Mq7IQ2LuC3ZEpYg0Kn5t4MSdEL6gl60fRs8nrlvinksRG8CJL+B/BdV+jUKm9
vOTorceJITCSTqK5PfepaphzJfwMnQ==
=MYTX
-----END PGP SIGNATURE-----

--2FpYNFovlXIxQgABC0dwSvgcJqNG8hZKH--

--===============0827404907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0827404907==--
