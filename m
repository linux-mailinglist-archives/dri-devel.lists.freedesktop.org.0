Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C45ABCD701
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 16:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D0B10EC14;
	Fri, 10 Oct 2025 14:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eZvgFRnd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF36D10EC1B;
 Fri, 10 Oct 2025 14:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760105671; x=1791641671;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jRiJX0JMatRA7BUImWYN04sDgEiWcIkDqcKsEXwdEEk=;
 b=eZvgFRnd5TqmPqcuNoE/yEh14uFrXLTqCNAUn3ctll5ws9Hpm5x6ljs+
 bh3Va1Gome8yrlaEebmbkQvHTsIzOgDCwaXiS4khkfsfhJxLzzW0rjqnz
 57KudrknW1p6KIoMyss8BanQ5UwiwQ/cyU4uaojuppJ/jQdd/k7ip6LPc
 S9LzACOBmu3EBLBaidCMRpoxk3MLyhZS7hUPbsTsOAKdPtLIQgtvVq7VI
 Ln28bzcYL41VD0zsyFP/erVmTGu+3j095CvJg+ZakElXbJcxWUiJsc3Ik
 Kblrz0jQxJl3xNKDQss1MVZJPXwTltKtLHX49RILrCnCqTyzGNqswFGZ7 w==;
X-CSE-ConnectionGUID: iU3FLOw1SB+6PlLUIOwTJQ==
X-CSE-MsgGUID: 9JTHMCHDSfOQMqmZzJOZww==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="73765850"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="73765850"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 07:14:31 -0700
X-CSE-ConnectionGUID: YxSJZNYrTmC5GWtrnTbBKw==
X-CSE-MsgGUID: EVLY1midQa6GjeDgwuwOgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="180102482"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.154])
 ([10.245.245.154])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 07:14:28 -0700
Message-ID: <f32a164197b7d25dff42432007b9926ec5575e2f.camel@linux.intel.com>
Subject: Re: [PATCH v3 5/5] drm/amdgpu: Configure max beneficial TTM pool
 allocation order
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Matthew Brost
 <matthew.brost@intel.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, Thadeu Lima de Souza
 Cascardo <cascardo@igalia.com>
Date: Fri, 10 Oct 2025 16:14:26 +0200
In-Reply-To: <01bacdec-f1bd-4ddc-a537-6a091c1a1eb8@igalia.com>
References: <20251008115314.55438-1-tvrtko.ursulin@igalia.com>
 <20251008115314.55438-6-tvrtko.ursulin@igalia.com>
 <aObxU8vEbEQEf7QO@lstrano-desk.jf.intel.com>
 <01bacdec-f1bd-4ddc-a537-6a091c1a1eb8@igalia.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
MIME-Version: 1.0
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

On Thu, 2025-10-09 at 09:58 +0100, Tvrtko Ursulin wrote:
>=20
> On 09/10/2025 00:18, Matthew Brost wrote:
> > On Wed, Oct 08, 2025 at 12:53:14PM +0100, Tvrtko Ursulin wrote:
> > > Let the TTM pool allocator know that we can afford for it to
> > > expend less
> > > effort for satisfying contiguous allocations larger than 2MiB.
> > > The latter
> > > is the maximum relevant PTE entry size and the driver and
> > > hardware are
> > > happy to get larger blocks only opportunistically.
> > >=20
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> >=20
> > +Thomas - Seems like we'd want to do this in Xe too?

Yeah, Indeed.

While IIRC we can actually set up 1GiB PTEs, I'm not aware of any huge
benefits from using that compared to 2MiB ones. We certainly want the
allocator to try pretty hard for 2MiB ones, though.

Thanks,
Thomas


> >=20
> > > ---
> > > =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 5 +++--
> > > =C2=A0 1 file changed, 3 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > > index 948c6d0a422b..723b885210a7 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > > @@ -1837,7 +1837,7 @@ static int amdgpu_ttm_pools_init(struct
> > > amdgpu_device *adev)
> > > =C2=A0=C2=A0	for (i =3D 0; i < adev->gmc.num_mem_partitions; i++) {
> > > =C2=A0=C2=A0		ttm_pool_init(&adev->mman.ttm_pools[i], adev-
> > > >dev,
> > > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adev-
> > > >gmc.mem_partitions[i].numa.node,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0);
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > TTM_POOL_BENEFICIAL_ORDER(get_order(2 * SZ_1M)));
> >=20
> > SZ_2M btw.
>=20
> I thought I grepped exactly to see if that existed but apparently I
> did=20
> not, thanks!
>=20
> Regards,
>=20
> Tvrtko
>=20
> >=20
> > Matt
> >=20
> > > =C2=A0=C2=A0	}
> > > =C2=A0=C2=A0	return 0;
> > > =C2=A0 }
> > > @@ -1931,7 +1931,8 @@ int amdgpu_ttm_init(struct amdgpu_device
> > > *adev)
> > > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adev_to_drm(adev)=
->anon_inode-
> > > >i_mapping,
> > > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adev_to_drm(adev)=
-
> > > >vma_offset_manager,
> > > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (adev->need_swiot=
lb ?
> > > TTM_POOL_USE_DMA_ALLOC : 0) |
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (dma_addressing_limited(adev=
-
> > > >dev) ? TTM_POOL_USE_DMA32 : 0));
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (dma_addressing_limited(adev=
-
> > > >dev) ? TTM_POOL_USE_DMA32 : 0) |
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > TTM_POOL_BENEFICIAL_ORDER(get_order(2 * SZ_1M)));
> > > =C2=A0=C2=A0	if (r) {
> > > =C2=A0=C2=A0		dev_err(adev->dev,
> > > =C2=A0=C2=A0			"failed initializing buffer object
> > > driver(%d).\n", r);
> > > --=20
> > > 2.48.0
> > >=20
>=20

