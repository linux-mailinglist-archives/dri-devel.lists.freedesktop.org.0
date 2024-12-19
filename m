Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B449F7ADA
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 13:02:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7699910E491;
	Thu, 19 Dec 2024 12:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VTXlrd9m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D336710E491;
 Thu, 19 Dec 2024 12:01:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 38E345C60F2;
 Thu, 19 Dec 2024 12:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9884AC4CECE;
 Thu, 19 Dec 2024 12:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734609718;
 bh=mmSG5jmvIG2IQz8h4oPfiL+yfIQ6E1uV4JAbWmJ+e1A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VTXlrd9mX2AtoGsMuWQEnYN+Leb0Ph2/db+NrKfLeO70FAXMd7qSLKGyn8zdIpWlI
 cMF5nLg3ZEiMJZqoxU1oHiyyF6hO7cYPniY4EAN9pDP+57OBp/874axiYg4NHkULDN
 ptYPqQ6Jk4GYS/dpgJdM/8hwlEbZHE+GABY6vSGzsBo4PQtoSd8LWF94CJl+7ORetY
 P2nLCIxXSVOhV3/dp83pMQJYZ03jEpdYxxgb2mcdhYXBVJS0lpZsLaXtjF0t+Jmdi8
 oo8w1Ndg+xfSYueLd+CZI248gXOnzlmmw7oOHU44V4aElZPrmZF8QBHzjrI8ywYV+Y
 T3U6iuq8pu0rg==
Date: Thu, 19 Dec 2024 13:01:55 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>, linux-kernel@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tejun Heo <tj@kernel.org>, 
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org, 
 linux-mm@kvack.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 5/7] drm/amdgpu: Add cgroups implementation
Message-ID: <20241219-bright-oarfish-of-vitality-a8efba@houat>
References: <20241204134410.1161769-1-dev@lankhorst.se>
 <20241204134410.1161769-6-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ggsfrfgw7sj3junq"
Content-Disposition: inline
In-Reply-To: <20241204134410.1161769-6-dev@lankhorst.se>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ggsfrfgw7sj3junq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 5/7] drm/amdgpu: Add cgroups implementation
MIME-Version: 1.0

Hi Alex, Christian, Xinhui,

We forgot to Cc you on that series, sorry. Could you have a look at the fol=
lowing patch?

Thanks!
Maxime

On Wed, Dec 04, 2024 at 02:44:05PM +0100, Maarten Lankhorst wrote:
> Similar to xe, enable some simple management of VRAM only.
>=20
> Co-developed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_vram_mgr.c
> index 7d26a962f811c..f1703a746cadd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -24,6 +24,7 @@
> =20
>  #include <linux/dma-mapping.h>
>  #include <drm/ttm/ttm_range_manager.h>
> +#include <drm/drm_drv.h>
> =20
>  #include "amdgpu.h"
>  #include "amdgpu_vm.h"
> @@ -908,6 +909,9 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
>  	struct ttm_resource_manager *man =3D &mgr->manager;
>  	int err;
> =20
> +	man->cg =3D drmm_cgroup_register_region(adev_to_drm(adev), "vram", adev=
->gmc.real_vram_size);
> +	if (IS_ERR(man->cg))
> +		return PTR_ERR(man->cg);
>  	ttm_resource_manager_init(man, &adev->mman.bdev,
>  				  adev->gmc.real_vram_size);
> =20
> --=20
> 2.43.0
>=20

--ggsfrfgw7sj3junq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2QLLgAKCRAnX84Zoj2+
drsmAYDbmxPhzez3f9e9kFd347WH3ntcM31sY9m9CBi5u9GgRqZ4KPX7cVSDDNzI
2hYAxVgBgP4Y/7904CdByUIhUSux6420o/rh0nJMdvs2pNkYOdk+GWJ+Cl1zPHfA
FOcqatwDfg==
=eaig
-----END PGP SIGNATURE-----

--ggsfrfgw7sj3junq--
