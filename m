Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1523550BC
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 12:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CAD26E81A;
	Tue,  6 Apr 2021 10:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD076E81A;
 Tue,  6 Apr 2021 10:21:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CF55EB12E;
 Tue,  6 Apr 2021 10:21:43 +0000 (UTC)
Subject: Re: [PATCH 2/8] drm/amdgpu: Remove unused function
 amdgpu_bo_fbdev_mmap()
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 bskeggs@redhat.com, ray.huang@amd.com, linux-graphics-maintainer@vmware.com,
 sroland@vmware.com, zackr@vmware.com, shashank.sharma@amd.com,
 sam@ravnborg.org, emil.velikov@collabora.com, Felix.Kuehling@amd.com,
 nirmoy.das@amd.com
References: <20210406090903.7019-1-tzimmermann@suse.de>
 <20210406090903.7019-3-tzimmermann@suse.de>
 <7b5a0a55-f845-6d05-3e08-d95d4bffa6d9@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <e3aa7f6f-6c57-711a-dbb1-af9738b94cac@suse.de>
Date: Tue, 6 Apr 2021 12:21:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7b5a0a55-f845-6d05-3e08-d95d4bffa6d9@amd.com>
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
Content-Type: multipart/mixed; boundary="===============1477517003=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1477517003==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dLsv5vYfFYkpgqcZzyz4SeoxG3RkjxFwH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dLsv5vYfFYkpgqcZzyz4SeoxG3RkjxFwH
Content-Type: multipart/mixed; boundary="llP7fafkjakITHKuFxBrL8mCH9kzWbcEf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 bskeggs@redhat.com, ray.huang@amd.com, linux-graphics-maintainer@vmware.com,
 sroland@vmware.com, zackr@vmware.com, shashank.sharma@amd.com,
 sam@ravnborg.org, emil.velikov@collabora.com, Felix.Kuehling@amd.com,
 nirmoy.das@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Message-ID: <e3aa7f6f-6c57-711a-dbb1-af9738b94cac@suse.de>
Subject: Re: [PATCH 2/8] drm/amdgpu: Remove unused function
 amdgpu_bo_fbdev_mmap()
References: <20210406090903.7019-1-tzimmermann@suse.de>
 <20210406090903.7019-3-tzimmermann@suse.de>
 <7b5a0a55-f845-6d05-3e08-d95d4bffa6d9@amd.com>
In-Reply-To: <7b5a0a55-f845-6d05-3e08-d95d4bffa6d9@amd.com>

--llP7fafkjakITHKuFxBrL8mCH9kzWbcEf
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 06.04.21 um 11:43 schrieb Christian K=C3=B6nig:
> Am 06.04.21 um 11:08 schrieb Thomas Zimmermann:
>> Remove an unused function. Mapping the fbdev framebuffer is apparently=

>> not supported.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>=20
> Should I just upstream this through our internal branches?

I guess you can pick up this patch into your branches if that's easier=20
for you. For the other patches, I'd like to merge them via drm-misc-next.=


Best regards
Thomas

>=20
> Thanks,
> Christian.
>=20
>> ---
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 19 ---------------=
----
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |=C2=A0 2 --
>> =C2=A0 2 files changed, 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c=20
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index b99e9d8736c2..cfc89164dee8 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -1092,25 +1092,6 @@ void amdgpu_bo_fini(struct amdgpu_device *adev)=

>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 }
>> -/**
>> - * amdgpu_bo_fbdev_mmap - mmap fbdev memory
>> - * @bo: &amdgpu_bo buffer object
>> - * @vma: vma as input from the fbdev mmap method
>> - *
>> - * Calls ttm_fbdev_mmap() to mmap fbdev memory if it is backed by a b=
o.
>> - *
>> - * Returns:
>> - * 0 for success or a negative error code on failure.
>> - */
>> -int amdgpu_bo_fbdev_mmap(struct amdgpu_bo *bo,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vm_area_struct *vma)
>> -{
>> -=C2=A0=C2=A0=C2=A0 if (vma->vm_pgoff !=3D 0)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EACCES;
>> -
>> -=C2=A0=C2=A0=C2=A0 return ttm_bo_mmap_obj(vma, &bo->tbo);
>> -}
>> -
>> =C2=A0 /**
>> =C2=A0=C2=A0 * amdgpu_bo_set_tiling_flags - set tiling flags
>> =C2=A0=C2=A0 * @bo: &amdgpu_bo buffer object
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h=20
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>> index 54ceb065e546..46e94d413c5c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>> @@ -268,8 +268,6 @@ void amdgpu_bo_unpin(struct amdgpu_bo *bo);
>> =C2=A0 int amdgpu_bo_evict_vram(struct amdgpu_device *adev);
>> =C2=A0 int amdgpu_bo_init(struct amdgpu_device *adev);
>> =C2=A0 void amdgpu_bo_fini(struct amdgpu_device *adev);
>> -int amdgpu_bo_fbdev_mmap(struct amdgpu_bo *bo,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 struct vm_area_struct *vma);
>> =C2=A0 int amdgpu_bo_set_tiling_flags(struct amdgpu_bo *bo, u64 tiling=
_flags);
>> =C2=A0 void amdgpu_bo_get_tiling_flags(struct amdgpu_bo *bo, u64=20
>> *tiling_flags);
>> =C2=A0 int amdgpu_bo_set_metadata (struct amdgpu_bo *bo, void *metadat=
a,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--llP7fafkjakITHKuFxBrL8mCH9kzWbcEf--

--dLsv5vYfFYkpgqcZzyz4SeoxG3RkjxFwH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBsNjUFAwAAAAAACgkQlh/E3EQov+Cq
tRAAlQMKhqFIYIpTFI+DAtldNsgXbp9dCXrpKv+4E5XfuCsDE3z6b7NjflJLMuxgEUYsGVKK0xmt
u7jpHjz3yRg17whqRPtq2PWxu/4YVKl7qZxaEeMrX9FgCCd2BWUg2Wk6X2zwsDg3HBW/SFfq0zdq
v9vtMZxt3V6Y6VxH4OwPxK1T59tsJgrPbPjguF2i3WSaH6LgDYQb6k9CZ5UtjU4jQNBfo1rZ58bZ
yl0F4rk+eJgzKFRDWOjkEay0PTpepOi1pAoQ/ntx7TwNXt8hYFYHMy+7ahuPf5sxjDICjt9QvjWy
5vriKuIed0Z0kQNPyGrJcg58XxMmfhYivw3Q+NFswoPwKcUILs6bTJ2PIrjecK7Z2tHGuvEfir1w
bU+0y80GL8398JP/BNuZ9hu4s0YMB2H4x8QN9QqKZQzhAdz7gL7Lk6VpPY8X3Qh/hsd5EM4DeIY6
BdMrXCT1FMZonFq7ecAQ8Hurtgi62wUwxDB/LDoJMzgwXKwENJnfLWSDYWXe8zzt8itrTePhTN/p
erbTUA42ZxDoUmmSQBcxLQUafuhQXcM8yGUPtohTRWTvp0dw32ZQh7ijukAE41/U+YdjLI6zPgxG
QIn+fcbFGegaQ0yhYE26BBH4I+TqAfpTjEo7ldS1+K0/ObfXTrs2tUl7y10qmskTqhq8uibgZAYu
8dU=
=JTdr
-----END PGP SIGNATURE-----

--dLsv5vYfFYkpgqcZzyz4SeoxG3RkjxFwH--

--===============1477517003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1477517003==--
