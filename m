Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B482B3904D2
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 17:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F336EA4D;
	Tue, 25 May 2021 15:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127836EA4D;
 Tue, 25 May 2021 15:14:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621955659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ir5mkSh6XTcErXW1I46HFWuuaCcxFHU8niazQ25nW+Q=;
 b=lCZLX1GQ9qdEdWI1qL8vqi2m5LhzALSEoXnAe0FB/0fbsw5aAoDtPt/jNQ56JJnk/2ea/T
 K8a5GkM9CL4H96mIgkTqNgqTsmhPRRl7p8/fPbfLWfKNlOWZL5oJfIK66AksjqfcVftLss
 m9+SFRSPyIeaPHgDxmrd7Ir+SEROi9Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621955659;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ir5mkSh6XTcErXW1I46HFWuuaCcxFHU8niazQ25nW+Q=;
 b=oorRNvd646FjdHUuTTyHWVjs6s3OI0Ppcj5qqDFicfs4p5qDxCs5d65kPDii2xFeG2UZFA
 XkY3XlLPmj8ScVAg==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 95B8DAEEE;
 Tue, 25 May 2021 15:14:19 +0000 (UTC)
Subject: Re: [PATCH v4 0/7] drm: Clean up mmap for TTM-based GEM drivers
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 Felix.Kuehling@amd.com, nirmoy.das@amd.com
References: <20210525151055.8174-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <475e98b8-21c8-51a5-980a-f4b27254e7a9@suse.de>
Date: Tue, 25 May 2021 17:14:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210525151055.8174-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="PlQniPuL3OfWhnNlqROBsH6Sa1DtDOpqv"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PlQniPuL3OfWhnNlqROBsH6Sa1DtDOpqv
Content-Type: multipart/mixed; boundary="bn4X14K0VDyLncXtVGEhqHpXBKTaaw0xx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 Felix.Kuehling@amd.com, nirmoy.das@amd.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Message-ID: <475e98b8-21c8-51a5-980a-f4b27254e7a9@suse.de>
Subject: Re: [PATCH v4 0/7] drm: Clean up mmap for TTM-based GEM drivers
References: <20210525151055.8174-1-tzimmermann@suse.de>
In-Reply-To: <20210525151055.8174-1-tzimmermann@suse.de>

--bn4X14K0VDyLncXtVGEhqHpXBKTaaw0xx
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Something I forgot to add is that patches 1 to 4 already have a

   Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>



Am 25.05.21 um 17:10 schrieb Thomas Zimmermann:
> Implement mmap via struct drm_gem_object_functions.mmap in amdgpu,
> radeon and nouveau. This allows for using common DRM helpers for
> the mmap-related callbacks in struct file_operations and struct
> drm_driver. The drivers have their own vm_ops, which are now set
> automatically by the DRM core functions. The code in each driver's
> verify_access becomes part of the driver's new mmap implementation.
>=20
> With the GEM drivers converted, vmwgfx is the only user of
> ttm_bo_mmap() and related infrastructure. So move everything into
> vmwgfx and delete the rsp code from TTM.
>=20
> This touches several drivers. Preferably everything would be merged
> at once via drm-misc-next.
>=20
> v4:
> 	* rebase on top of amdgpu hot-unplug changes
> v3:
> 	* tidy up the new mmap functions in amdgpu and radeon (Christian)
> v2:
> 	* removal of amdgpu fbdev mmap already merged (Christian)
> 	* rebase on top of amdgpu fixes [1] (Felix)
> 	* replace pr_err() with drm_err() in vmwgfx patch (Zack)
> 	* several typos
>=20
> [1] https://patchwork.freedesktop.org/series/88822/
>=20
> Thomas Zimmermann (7):
>    drm/ttm: Don't override vm_ops callbacks, if set
>    drm/amdgpu: Implement mmap as GEM object function
>    drm/radeon: Implement mmap as GEM object function
>    drm/nouveau: Implement mmap as GEM object function
>    drm/vmwgfx: Inline ttm_bo_mmap() into vmwgfx driver
>    drm/vmwgfx: Inline vmw_verify_access()
>    drm/ttm: Remove ttm_bo_mmap() and friends
>=20
>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 46 -------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h |  2 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     |  4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     | 55 +++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 75 --------------------=
-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  1 -
>   drivers/gpu/drm/nouveau/nouveau_bo.c        | 10 ---
>   drivers/gpu/drm/nouveau/nouveau_drm.c       |  3 +-
>   drivers/gpu/drm/nouveau/nouveau_gem.c       | 36 ++++++++++
>   drivers/gpu/drm/nouveau/nouveau_ttm.c       | 49 --------------
>   drivers/gpu/drm/nouveau/nouveau_ttm.h       |  1 -
>   drivers/gpu/drm/radeon/radeon_drv.c         |  3 +-
>   drivers/gpu/drm/radeon/radeon_gem.c         | 49 ++++++++++++++
>   drivers/gpu/drm/radeon/radeon_ttm.c         | 65 ------------------
>   drivers/gpu/drm/radeon/radeon_ttm.h         |  1 -
>   drivers/gpu/drm/ttm/ttm_bo_vm.c             | 60 ++---------------
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c  |  9 ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c    | 53 ++++++++++++++-
>   include/drm/ttm/ttm_bo_api.h                | 13 ----
>   include/drm/ttm/ttm_device.h                | 15 -----
>   20 files changed, 202 insertions(+), 348 deletions(-)
>=20
>=20
> base-commit: 28dddc0c90bc6464be4c5e3224a293c022564a4e
> prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> --
> 2.31.1
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--bn4X14K0VDyLncXtVGEhqHpXBKTaaw0xx--

--PlQniPuL3OfWhnNlqROBsH6Sa1DtDOpqv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCtFEoFAwAAAAAACgkQlh/E3EQov+DU
9g//Td1NvBjslabX3uN37X5CIvorOMYdjf4PGIcWjQDvNZRBnngb6laMmeilAsEPONYekoYFQEo4
Ujjpp+A2LlM1AE2eDAgCuh4jNyS7KPFe/TsRqs1OIRo8oiaJmFWAQc5G42VvD+Co2sfFVt3hvyGj
aej6flxSnqsR9i592FwCojVXx0+bgj90qpU3+IDdMLWiicQRJ9pqkrAaOE7ywq2+PwrIIjuZy2Se
0nV64IBWmT8Tw1OCXCeabIffL1t4+2eIN1wZnTMm6EcGag/254OMMPd1zTAmaRgZ1SbeE/enIuyp
ORp7XZqmu8sft2LvI8nuj76+tXHuZ1rdbn5MsFDPliTRNlPdgVjUD+vGXSj9nh78VjuSMy6GqQ/Q
exGbPyh1Jhr/Sg8dlAJr8XWfpnWgeQ5IoGYQnlJBBORJGGa0t9MFyr/CQ/Uo4d1CClQREnzYJuim
UK+YtIoENq41J1LcECCqXXKyV0QuUw0Ne4zPkFBRweW6SyCDT70Wi3jq4J8IHwVZH8TVXvEUA8Ds
65GIJq+7wG686Q3iq31I5A0lpfMqJFy5sToXwYAjryDjBwoZep3RM/1WryUxc7x8c9xSi+QYJbeA
jIjQYiIBFAZDvY3YchnssccExXkn95ygZd5tl0+017jRlkCtU5otYJvTrt7d62HDKCB82JAiEXCX
BAY=
=7ypI
-----END PGP SIGNATURE-----

--PlQniPuL3OfWhnNlqROBsH6Sa1DtDOpqv--
