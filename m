Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D310D3552E5
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 13:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C397E6E828;
	Tue,  6 Apr 2021 11:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C336E3DF;
 Tue,  6 Apr 2021 11:55:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A5920B15F;
 Tue,  6 Apr 2021 11:55:29 +0000 (UTC)
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
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/8] drm/amdgpu: Implement mmap as GEM object function
Message-ID: <a626f328-b6ad-0ab3-b3be-77e6fcb06699@suse.de>
Date: Tue, 6 Apr 2021 13:55:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <0b11de8e-7524-d548-bcc9-b5597f646911@amd.com>
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0928839935=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0928839935==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ea3JpGOv7yupcpUkT45XefTvgGXuwLV4F"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ea3JpGOv7yupcpUkT45XefTvgGXuwLV4F
Content-Type: multipart/mixed; boundary="mymDBI34HjccivplHyCPjeXmquyin567r";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 bskeggs@redhat.com, ray.huang@amd.com, linux-graphics-maintainer@vmware.com,
 sroland@vmware.com, zackr@vmware.com, shashank.sharma@amd.com,
 sam@ravnborg.org, emil.velikov@collabora.com, Felix.Kuehling@amd.com,
 nirmoy.das@amd.com
Cc: nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Message-ID: <a626f328-b6ad-0ab3-b3be-77e6fcb06699@suse.de>
Subject: Re: [PATCH 3/8] drm/amdgpu: Implement mmap as GEM object function
References: <20210406090903.7019-1-tzimmermann@suse.de>
 <20210406090903.7019-4-tzimmermann@suse.de>
 <6b261dab-4a4d-f0c6-95c0-f720c7df12c1@amd.com>
 <b76d1922-c9a5-8533-657a-2c1149832347@suse.de>
 <0b11de8e-7524-d548-bcc9-b5597f646911@amd.com>
In-Reply-To: <0b11de8e-7524-d548-bcc9-b5597f646911@amd.com>

--mymDBI34HjccivplHyCPjeXmquyin567r
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 06.04.21 um 12:56 schrieb Christian K=C3=B6nig:
>>
>> In the end I went with the semantics I found in amdgpu_mmap() and=20
>> handled KFD specially. Let me know if this requires to be changed.
>=20
> Well the question is where is the call to drm_vma_node_verify_access() =

> now? Cause that needs to be skipped for KFD BOs.

I see. It's now drm_vma_node_is_allowed(); called by drm_gem_mmap(). [1] =

So drm_gem_mmap() cannot be used by amdgpu.

If I understand the code at [2] correctly, KFD objects don't use the GEM =

ioctl interfaces, but they still use the internal GEM object that is=20
part of the TTM BO. In this case, amdgpu could have its own version of=20
drm_gem_mmap(), which calls drm_gem_mmap_obj(), [3] which in turn=20
handles the mmap details via GEM object functions.

drm_gem_prime_mmap() doesn't do any additional verification.

Best regards
Thomas

[1]=20
https://elixir.bootlin.com/linux/v5.11.11/source/drivers/gpu/drm/drm_gem.=
c#L1156
[2]=20
https://elixir.bootlin.com/linux/v5.11.11/source/drivers/gpu/drm/amd/amdg=
pu/amdgpu_amdkfd_gpuvm.c#L1224
[3]=20
https://elixir.bootlin.com/linux/v5.12-rc6/source/drivers/gpu/drm/drm_gem=
=2Ec#L1053


>=20
> Regards,
> Christian.
>=20
>>
>> Best regards
>> Thomas
>>
>>>> -
>>>> =C2=A0 int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src=
_offset,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t dst_offset, uint32_t byte_count,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_resv *resv,
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h=20
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>> index dec0db8b0b13..6e51faad7371 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>> @@ -146,7 +146,6 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 struct dma_resv *resv,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 struct dma_fence **fence);
>>>> -int amdgpu_mmap(struct file *filp, struct vm_area_struct *vma);
>>>> =C2=A0 int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
>>>> =C2=A0 int amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);
>>>> =C2=A0 uint64_t amdgpu_ttm_domain_start(struct amdgpu_device *adev, =

>>>> uint32_t type);
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


--mymDBI34HjccivplHyCPjeXmquyin567r--

--ea3JpGOv7yupcpUkT45XefTvgGXuwLV4F
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBsTDAFAwAAAAAACgkQlh/E3EQov+Bi
+g//WfjTpHdh3hXM/BAYhSPOlg+sPzW02v65R4qFj4gb2ZXKBBBVWFVllOjKHn3wCOMOoqj1GaaP
+D7UMMamLVjaXY0KK/m8KtTAktnecSIpwL54aYHWSFm1cXsBeaVQS+X0OKo1w796Zh+RLTdmJ3y3
/g7i7lJB7aA3PeBo+AwuuheTt1ri3WwpA7MR5UnjcM/Q/C2UMlr9BXhqYNykTI4B6H6+h1xL9/wi
FLKRL4QMtQhRrNvjPVUVnDxrt736Yh1taTG0E3D1iirflHGwPos82ozJdkqw3Np4hO5kD6IeahM/
KTrVD867f582JMob5SWvGpT02+wrNrAgP/CiZj+jvwBj4C8WOWPlJBEJ9xmjw9bshsqhPUNE1rUc
KVDwwr0ThgHuINx/dp2GVHnNzSWsPhfkAJ2icI9M5ajEobV4idNB6+xzHylnIHzcczhPAQOP5+ch
+UNymNRizoxiK45595k3Qnxmt5bpr0owmdWElXVVCiG0o2yOh1H9/FpoKlA8AuS5AvEMbz8nYdJr
DaVmJFo620nRhBBTVTjVxH/8ErvBUyNb51cSy+3VEA0CpF2x91/73ZHl5yG3iHFFXeSRz5qAFtpK
Dvnx87Fhw6stSwz2/Au8yRFS5N4+EDmNNzq+Rtd9J86Z9HD9v6R2Qu0csCCVeENC1zgXSXm31L1B
TvQ=
=O0O2
-----END PGP SIGNATURE-----

--ea3JpGOv7yupcpUkT45XefTvgGXuwLV4F--

--===============0928839935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0928839935==--
