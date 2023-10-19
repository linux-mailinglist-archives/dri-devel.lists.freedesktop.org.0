Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AEF7CEFCE
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 08:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690C810E486;
	Thu, 19 Oct 2023 06:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4005810E487
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 06:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697695516; x=1729231516;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=r12w/iZQD0xQM2HaaW2o5VWnh0V6ZsPDNnpZmkxsJWY=;
 b=LZBqPYpr6wZuwnGE2AYFLlMjXH6atHs7c//JIBg2pGfuLzG4T9m6pOE8
 AMAbS1Cl2xKaPgDzvZMoNMU7Wd4jfdLA6yzmZLWVeabShegPg7OB+BWcA
 92pBkv1WC23WSWElQ8xwldzrkaK0hJ4c2pG/0ntrwE3qVR3Pb4nHqX013
 BUXgzNvYkH0YmyZ10+CJzH4AIYKsQ1c5Kva6hi/7vSxMJgSs+fqZpIxoB
 tsl980pcepRt8DiNoYiVpt8pCxeoscK3uyAGvEy+mc1cApXr9TFOHaoLV
 HSIDllzIFXVTLnbarYuFahOcpGdOFbUVCr0+TCwI2TRFTW+cpdDPSmQU0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="472411586"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="472411586"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 23:05:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="756872778"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="756872778"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 23:05:13 -0700
Date: Thu, 19 Oct 2023 08:05:11 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] accel/ivpu: Extend address range for MMU mmap
Message-ID: <20231019060511.GB547256@linux.intel.com>
References: <20231018110113.547208-1-stanislaw.gruszka@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018110113.547208-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 "Wludzik, Jozef" <jozef.wludzik@intel.com>, Wludzik@freedesktop.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 18, 2023 at 01:01:13PM +0200, Stanislaw Gruszka wrote:
> From: "Wludzik, Jozef" <jozef.wludzik@intel.com>
> 
> Allow to use whole address range in MMU context mmap which is up to 48
> bits. Return invalid argument from MMU context mmap in case address is
> not aligned to MMU page size, address is below MMU page size or address
> is greater then 47 bits.
> 
> This fixes problem disallowing to run large models on VPU4
> 
> Signed-off-by: Wludzik, Jozef <jozef.wludzik@intel.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Applied to drm-misc-fixes

Thanks
Stanislaw

> ---
>  drivers/accel/ivpu/ivpu_mmu_context.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
> index 0c8c65351919..c1050a2df954 100644
> --- a/drivers/accel/ivpu/ivpu_mmu_context.c
> +++ b/drivers/accel/ivpu/ivpu_mmu_context.c
> @@ -11,6 +11,7 @@
>  #include "ivpu_mmu.h"
>  #include "ivpu_mmu_context.h"
>  
> +#define IVPU_MMU_VPU_ADDRESS_MASK        GENMASK(47, 12)
>  #define IVPU_MMU_PGD_INDEX_MASK          GENMASK(47, 39)
>  #define IVPU_MMU_PUD_INDEX_MASK          GENMASK(38, 30)
>  #define IVPU_MMU_PMD_INDEX_MASK          GENMASK(29, 21)
> @@ -328,12 +329,8 @@ ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
>  
>  	if (!IS_ALIGNED(vpu_addr, IVPU_MMU_PAGE_SIZE))
>  		return -EINVAL;
> -	/*
> -	 * VPU is only 32 bit, but DMA engine is 38 bit
> -	 * Ranges < 2 GB are reserved for VPU internal registers
> -	 * Limit range to 8 GB
> -	 */
> -	if (vpu_addr < SZ_2G || vpu_addr > SZ_8G)
> +
> +	if (vpu_addr & ~IVPU_MMU_VPU_ADDRESS_MASK)
>  		return -EINVAL;
>  
>  	prot = IVPU_MMU_ENTRY_MAPPED;
> -- 
> 2.25.1
> 
