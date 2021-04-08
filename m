Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7DF3581F7
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 13:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4696EAA7;
	Thu,  8 Apr 2021 11:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524746EAA3;
 Thu,  8 Apr 2021 11:34:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CF712B229;
 Thu,  8 Apr 2021 11:34:04 +0000 (UTC)
Subject: Re: [PATCH 0/4] drm: Generic dumb_map_offset for TTM-based drivers
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210406082942.24049-1-tzimmermann@suse.de>
 <YG7mHvmhPZIPA37B@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <52dd3e3f-a893-3d90-e642-df01a033490a@suse.de>
Date: Thu, 8 Apr 2021 13:34:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YG7mHvmhPZIPA37B@phenom.ffwll.local>
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
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 kraxel@redhat.com, spice-devel@lists.freedesktop.org, bskeggs@redhat.com
Content-Type: multipart/mixed; boundary="===============1553166146=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1553166146==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wtPaAHNX0gkUUytT5iAsY74CPhbxKSfTl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wtPaAHNX0gkUUytT5iAsY74CPhbxKSfTl
Content-Type: multipart/mixed; boundary="qHPZSfiFLTcaOfLLakODrcFJUrLuyNz8z";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 kraxel@redhat.com, spice-devel@lists.freedesktop.org, bskeggs@redhat.com
Message-ID: <52dd3e3f-a893-3d90-e642-df01a033490a@suse.de>
Subject: Re: [PATCH 0/4] drm: Generic dumb_map_offset for TTM-based drivers
References: <20210406082942.24049-1-tzimmermann@suse.de>
 <YG7mHvmhPZIPA37B@phenom.ffwll.local>
In-Reply-To: <YG7mHvmhPZIPA37B@phenom.ffwll.local>

--qHPZSfiFLTcaOfLLakODrcFJUrLuyNz8z
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.04.21 um 13:16 schrieb Daniel Vetter:
> On Tue, Apr 06, 2021 at 10:29:38AM +0200, Thomas Zimmermann wrote:
>> The implementation of drm_driver.dumb_map_offset is the same for sever=
al
>> TTM-based drivers. Provide a common function in GEM-TTM helpers.
>=20
> Out of curiosity, why does this not fit for radeon/amdgpu?

These drivers perform additional permission checks in their implementatio=
ns.

But those checks are also part of the actual mmap code. I want to=20
propose a patch to use the generic drm_gem_ttm_map_offset in=20
amdgpu/radeon, and then rely on mmap to fail if necessary. It might=20
result in a longer discussion, so that's for another patchset.

Best regards
Thomas

> -Daniel
>=20
>>
>> Thomas Zimmermann (4):
>>    drm/gem-ttm-helper: Provide helper for struct
>>      drm_driver.dumb_map_offset
>>    drm/vram-helper: Use drm_gem_ttm_dumb_map_offset()
>>    drm/nouveau: Use drm_gem_ttm_dumb_map_offset()
>>    drm/qxl: Use drm_gem_ttm_dumb_map_offset()
>>
>>   drivers/gpu/drm/drm_gem_ttm_helper.c      | 33 ++++++++++++++++
>>   drivers/gpu/drm/drm_gem_vram_helper.c     | 48 ---------------------=
--
>>   drivers/gpu/drm/nouveau/nouveau_display.c | 18 ---------
>>   drivers/gpu/drm/nouveau/nouveau_display.h |  2 -
>>   drivers/gpu/drm/nouveau/nouveau_drm.c     |  3 +-
>>   drivers/gpu/drm/qxl/qxl_drv.c             |  3 +-
>>   drivers/gpu/drm/qxl/qxl_drv.h             |  3 --
>>   drivers/gpu/drm/qxl/qxl_dumb.c            | 17 --------
>>   drivers/gpu/drm/qxl/qxl_ioctl.c           |  4 +-
>>   drivers/gpu/drm/qxl/qxl_object.h          |  5 ---
>>   include/drm/drm_gem_ttm_helper.h          |  5 ++-
>>   include/drm/drm_gem_vram_helper.h         |  7 +---
>>   12 files changed, 45 insertions(+), 103 deletions(-)
>>
>> --
>> 2.30.2
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--qHPZSfiFLTcaOfLLakODrcFJUrLuyNz8z--

--wtPaAHNX0gkUUytT5iAsY74CPhbxKSfTl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBu6iwFAwAAAAAACgkQlh/E3EQov+Bo
xA/+N/inEFG7DAxEuVBieUUeYry0VZLHkDhsuHDNCkbAxyPqlhO/SSDCCESlPAsm7FgzLYuklbhm
aB7wxekjdILBNWFLV0l6ymkF7lzTxdEZi2pi/Or8iJxEhOohWNyahKXsLfzgfqeN7sqjHNi/5h3B
HZnfLn24dQmOs767YvshMRDMkP7t4jIp5UM2XCHs/sDlOC6fevqOJCgVSZ65gj/WvvpfopbsLKnT
xibHhMyRlFxYwuAvamzcP6j364nN5yaVWDYBX2XYrTGCRV8BcN5IIvhq3464xOfwyFLUp/TSynL1
tm+AoFDJEJJBkDUjeBsqryu3ZcL+7fWaiYDY5vMTXb7nO/wh7mChfatnTiw2XlKHJ40ERuPRJ7iW
hQ+FyJdpx9HSTjLqgvJxROnmOa2zix+eO4ORtnqrDMCUpmDaeHkuRGadwcZR73/pA53hBiEKjvan
4XbhDa+njjUEtLLkAoFl0NaAfd+ezN2xFwv4iYA0NnGxDvzStWjOWxZphqunDTMMufu3p1e1/IZE
1E+4p9s8GSXsp0tPH+pGns5tt2HKBzaLuS+Cbbwu4nJLNuLTn8PKGhvFvjR82Fi6jUBzrV5Gs3yx
PlFhk+sWo1qm0yJWjSvW/civrO64AdAl8jGcMcPU6dLY92TfFksZwkXeq7SL7+FSKolX4GK93lBi
aBE=
=bGEM
-----END PGP SIGNATURE-----

--wtPaAHNX0gkUUytT5iAsY74CPhbxKSfTl--

--===============1553166146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1553166146==--
