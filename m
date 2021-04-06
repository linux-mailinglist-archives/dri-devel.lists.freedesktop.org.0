Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 982A4355447
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 14:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8E26E424;
	Tue,  6 Apr 2021 12:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78BD6E131;
 Tue,  6 Apr 2021 12:52:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 053CEB0B8;
 Tue,  6 Apr 2021 12:52:27 +0000 (UTC)
Subject: Re: [PATCH 3/8] drm/amdgpu: Implement mmap as GEM object function
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 bskeggs@redhat.com, ray.huang@amd.com, linux-graphics-maintainer@vmware.com,
 sroland@vmware.com, zackr@vmware.com, shashank.sharma@amd.com,
 sam@ravnborg.org, emil.velikov@collabora.com, Felix.Kuehling@amd.com,
 nirmoy.das@amd.com
References: <20210406090903.7019-1-tzimmermann@suse.de>
 <20210406090903.7019-4-tzimmermann@suse.de>
 <6b261dab-4a4d-f0c6-95c0-f720c7df12c1@amd.com>
 <b76d1922-c9a5-8533-657a-2c1149832347@suse.de>
 <0b11de8e-7524-d548-bcc9-b5597f646911@amd.com>
 <a626f328-b6ad-0ab3-b3be-77e6fcb06699@suse.de>
 <365eb20d-d0f6-baf7-77b2-99179291e52f@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <878b7bd3-ea06-679a-4553-0eb3091b02a3@suse.de>
Date: Tue, 6 Apr 2021 14:52:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <365eb20d-d0f6-baf7-77b2-99179291e52f@amd.com>
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
Cc: nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1252179265=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1252179265==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="aStoPngR31Vuy0RgZMPBYtWXodcmVdbQr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--aStoPngR31Vuy0RgZMPBYtWXodcmVdbQr
Content-Type: multipart/mixed; boundary="B9CASjRAl8NpjkxLZ028DKeB9ByTt6mJL";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 bskeggs@redhat.com, ray.huang@amd.com, linux-graphics-maintainer@vmware.com,
 sroland@vmware.com, zackr@vmware.com, shashank.sharma@amd.com,
 sam@ravnborg.org, emil.velikov@collabora.com, Felix.Kuehling@amd.com,
 nirmoy.das@amd.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Message-ID: <878b7bd3-ea06-679a-4553-0eb3091b02a3@suse.de>
Subject: Re: [PATCH 3/8] drm/amdgpu: Implement mmap as GEM object function
References: <20210406090903.7019-1-tzimmermann@suse.de>
 <20210406090903.7019-4-tzimmermann@suse.de>
 <6b261dab-4a4d-f0c6-95c0-f720c7df12c1@amd.com>
 <b76d1922-c9a5-8533-657a-2c1149832347@suse.de>
 <0b11de8e-7524-d548-bcc9-b5597f646911@amd.com>
 <a626f328-b6ad-0ab3-b3be-77e6fcb06699@suse.de>
 <365eb20d-d0f6-baf7-77b2-99179291e52f@amd.com>
In-Reply-To: <365eb20d-d0f6-baf7-77b2-99179291e52f@amd.com>

--B9CASjRAl8NpjkxLZ028DKeB9ByTt6mJL
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 06.04.21 um 14:42 schrieb Christian K=C3=B6nig:
> Hi Thomas,
>=20
> Am 06.04.21 um 13:55 schrieb Thomas Zimmermann:
>> Hi
>>
>> Am 06.04.21 um 12:56 schrieb Christian K=C3=B6nig:
>>>>
>>>> In the end I went with the semantics I found in amdgpu_mmap() and=20
>>>> handled KFD specially. Let me know if this requires to be changed.
>>>
>>> Well the question is where is the call to=20
>>> drm_vma_node_verify_access() now? Cause that needs to be skipped for =

>>> KFD BOs.
>>
>> I see. It's now drm_vma_node_is_allowed(); called by drm_gem_mmap().=20
>> [1] So drm_gem_mmap() cannot be used by amdgpu.
>>
>> If I understand the code at [2] correctly, KFD objects don't use the=20
>> GEM ioctl interfaces, but they still use the internal GEM object that =

>> is part of the TTM BO. In this case, amdgpu could have its own version=
=20
>> of drm_gem_mmap(), which calls drm_gem_mmap_obj(), [3] which in turn=20
>> handles the mmap details via GEM object functions.
>=20
> Correct, well we could cleanup the KFD to use the GEM functions as well=
=2E

The KFD code already calls amdgpu_gem_object_create(). It should have=20
the object-functions pointer set for use with mmap. Not sure what the=20
use of drm_vma_node_is_allowed() would involve.

Best regards
Thomas

>=20
> Felix what exactly was your objections to using this?
>=20
> Regards,
> Christian.
>=20
>>
>> drm_gem_prime_mmap() doesn't do any additional verification.
>>
>> Best regards
>> Thomas
>>
>> [1]=20
>> https://elixir.bootlin.com/linux/v5.11.11/source/drivers/gpu/drm/drm_g=
em.c#L1156=20
>>
>> [2]=20
>> https://elixir.bootlin.com/linux/v5.11.11/source/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_amdkfd_gpuvm.c#L1224=20
>>
>> [3]=20
>> https://elixir.bootlin.com/linux/v5.12-rc6/source/drivers/gpu/drm/drm_=
gem.c#L1053=20
>>
>>
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>>> -
>>>>>> =C2=A0 int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t=20
>>>>>> src_offset,
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t dst_offset, uint32_t byte_count,
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_resv *resv,
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h=20
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>>>> index dec0db8b0b13..6e51faad7371 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>>>> @@ -146,7 +146,6 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 struct dma_resv *resv,
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 struct dma_fence **fence);
>>>>>> -int amdgpu_mmap(struct file *filp, struct vm_area_struct *vma);
>>>>>> =C2=A0 int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
>>>>>> =C2=A0 int amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);=

>>>>>> =C2=A0 uint64_t amdgpu_ttm_domain_start(struct amdgpu_device *adev=
,=20
>>>>>> uint32_t type);
>>>>>
>>>>> _______________________________________________
>>>>> dri-devel mailing list
>>>>> dri-devel@lists.freedesktop.org
>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
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


--B9CASjRAl8NpjkxLZ028DKeB9ByTt6mJL--

--aStoPngR31Vuy0RgZMPBYtWXodcmVdbQr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBsWYkFAwAAAAAACgkQlh/E3EQov+Du
gBAAmxG2ku+KDm4VAs9YkWpXPTDDdnOJ3GmONlYr/Cep+8ISwqTdOk7MRdHMCuvVsmMglOkHeC3T
vPFWf5naFLOmDVWaIbD5cAsVF+Vy0vss3ABSVaoUAsQ1c79J43BERbySJjvMb6mq5ggwiI76iFZ8
D5lOLXSMMBRUm94tLsPuwn1J5dQbg9dxhnNnUtfk73qHBEcXAtzzo9GTfEXANRNRC8T7puWEAkU6
qxk6orN2fX8TLdvZp9TBLtmmjgtxb+k0aKt+aJSHz4X1/Ftc/4w1g3BcQ+cPWUgiX8RDtr7FU3uA
OZO5oz5O/pENNojfQN4a31gPL3+gCXtPqNsOI/dhdhZzmV6qlXJ1czGI/ahdvTBJ2Nprjt9vE2+s
oPuY/a+JEmJl6x8EpfihYNQjwHFAjl4XASFAe0dnq+IHhNinFLSyQBWdIK9oDyAPRIKdLltbEbks
hu7IWR+tuyVAFSJ6gkapYiPAxicnwoTKAL7/9APsCfPkQJSCVjQit3wAr4gNHBy2EgJbhBk6FmLU
RbfuEz0kxiiRz4i0A5Vz7DzYgcNbrPbX/i/DqmTB1BhRtAsXVHHMeRrYbhHUprbopsDav1aswe+q
LZrJh4SNRTVRD/hr25AX+rZ72QywGsaSz9kIzC3ZZ0Jt1ozGMqyk+Mw0Ydw69UFhhxgCzXMydir/
btk=
=CxBN
-----END PGP SIGNATURE-----

--aStoPngR31Vuy0RgZMPBYtWXodcmVdbQr--

--===============1252179265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1252179265==--
