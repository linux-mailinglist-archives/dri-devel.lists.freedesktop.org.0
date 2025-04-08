Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A32A80186
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 13:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0E410E081;
	Tue,  8 Apr 2025 11:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d1jMISR8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9CA910E081
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 11:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744112446; x=1775648446;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CtfEMaZKBfA8p5yQV0hEDwuZ+N/fYv3mbVeybMnraGI=;
 b=d1jMISR8TH8Z4WL9v4YO6Bb2xPZb1A6f1zAJDtSAULiFdMoZUrOChhnE
 MUu4ejb9QZZB9cvvowyVPyyrWfn6uTJSzraeKK9DMbp4oE+ZyJV4orEwG
 IdsuI/yZWwqqbU8em7FvWnf6t4rK3x9etKP8mcXzpjICpAsTgI0j8E4Hr
 ZVDc22nlZhvqs3DO7v1y7Di6xzB/SSbiYRs4S0aN91hncP1J49n9znt06
 SuJ3bA3mG+SKXgYM7ru9ehToVkr5UQs4pcmfAmA4caetN9ehtsDLJYJlL
 oyTcm4fNFG+eI9iEPi3O/iJpvDIQtRqPCBWYmYb/B/5b1VgDuSOaaqcmb w==;
X-CSE-ConnectionGUID: W6TLFbWNR72AzJj8ANugiA==
X-CSE-MsgGUID: /B300nllTD6RyFQ3IDBAbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56204128"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="56204128"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 04:40:35 -0700
X-CSE-ConnectionGUID: XShiG/oJTBSJ6RHTISNCPQ==
X-CSE-MsgGUID: wZy1YHx9SWWgFPj5bDgt+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="133116013"
Received: from jlawryno-mobl2.clients.intel.com (HELO [10.217.160.151])
 ([10.217.160.151])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 04:40:33 -0700
Message-ID: <af131cf1-5b0f-4499-8fef-f2071d2b90a2@linux.intel.com>
Date: Tue, 8 Apr 2025 13:40:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Test for imported buffers with
 drm_gem_is_imported()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maciej.falkowski@linux.intel.com, ogabbay@kernel.org
Cc: dri-devel@lists.freedesktop.org
References: <20250408113247.418007-1-tzimmermann@suse.de>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250408113247.418007-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 4/8/2025 1:31 PM, Thomas Zimmermann wrote:
> Instead of testing import_attach for imported GEM buffers, invoke
> drm_gem_is_imported() to do the test. The helper tests the dma_buf
> itself while import_attach is just an artifact of the import. Prepares
> to make import_attach optional.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/accel/ivpu/ivpu_gem.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
> index 212d21ad2bbd0..e0d242d9f3e50 100644
> --- a/drivers/accel/ivpu/ivpu_gem.c
> +++ b/drivers/accel/ivpu/ivpu_gem.c
> @@ -30,7 +30,7 @@ static inline void ivpu_dbg_bo(struct ivpu_device *vdev, struct ivpu_bo *bo, con
>  		 "%6s: bo %8p vpu_addr %9llx size %8zu ctx %d has_pages %d dma_mapped %d mmu_mapped %d wc %d imported %d\n",
>  		 action, bo, bo->vpu_addr, ivpu_bo_size(bo), bo->ctx ? bo->ctx->id : 0,
>  		 (bool)bo->base.pages, (bool)bo->base.sgt, bo->mmu_mapped, bo->base.map_wc,
> -		 (bool)bo->base.base.import_attach);
> +		 (bool)drm_gem_is_imported(&bo->base.base));
>  }
>  
>  /*
> @@ -122,7 +122,7 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
>  		bo->ctx = NULL;
>  	}
>  
> -	if (bo->base.base.import_attach)
> +	if (drm_gem_is_imported(&bo->base.base))
>  		return;
>  
>  	dma_resv_lock(bo->base.base.resv, NULL);
> @@ -461,7 +461,7 @@ static void ivpu_bo_print_info(struct ivpu_bo *bo, struct drm_printer *p)
>  	if (bo->mmu_mapped)
>  		drm_printf(p, " mmu_mapped");
>  
> -	if (bo->base.base.import_attach)
> +	if (drm_gem_is_imported(&bo->base.base))
>  		drm_printf(p, " imported");
>  
>  	drm_printf(p, "\n");

