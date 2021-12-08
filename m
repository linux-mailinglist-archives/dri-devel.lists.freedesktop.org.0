Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A262446D3AE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 13:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA2E6ECBF;
	Wed,  8 Dec 2021 12:51:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D02887AE;
 Wed,  8 Dec 2021 12:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id AFDB03F3E7;
 Wed,  8 Dec 2021 13:51:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.464
X-Spam-Level: 
X-Spam-Status: No, score=-3.464 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.365,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1XM67Kfjza96; Wed,  8 Dec 2021 13:50:59 +0100 (CET)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 4BE423F2B8;
 Wed,  8 Dec 2021 13:50:58 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="Wc74eNX6";
 dkim-atps=neutral
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 82C60362AD5;
 Wed,  8 Dec 2021 13:50:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1638967858; bh=TdmHOQF50F7nBfLBNFF57BASEH+bOvok2dEKB8Ytn4w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Wc74eNX67H9DJFjOtMBmobIVS7xv4snuF4zEQPLw3YQxONRy5/SEoxgciaSf5RxTt
 1o/nbB/ljDfkdW/lS8+eeZPQGHysVQp8kW+Zq1deo4N4b79orT5daL13DxcqXwoDjE
 mzscPWajdzfDucKk07ZyQ9uplvo+AkG6VV16aijY=
Message-ID: <145cce88-e82e-5b2a-cf18-1609f5874498@shipmail.org>
Date: Wed, 8 Dec 2021 13:50:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [PATCH 2/4] drm/i915/xehpsdv: set min page-size to 64K
Content-Language: en-US
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20211207165156.31244-1-ramalingam.c@intel.com>
 <20211207165156.31244-3-ramalingam.c@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20211207165156.31244-3-ramalingam.c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>, Andi <andi.shyti@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Chris_intel_ID <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/7/21 17:51, Ramalingam C wrote:
> From: Matthew Auld <matthew.auld@intel.com>
>
> LMEM should be allocated at 64K granularity, since 4K page support will
> eventually be dropped for LMEM when using the PPGTT.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Reviewed-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/i915/gem/i915_gem_stolen.c  | 6 +++++-
>   drivers/gpu/drm/i915/gt/intel_region_lmem.c | 5 ++++-
>   2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index bce03d74a0b4..ba90ab47d838 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -780,6 +780,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>   	struct intel_uncore *uncore = &i915->uncore;
>   	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
>   	struct intel_memory_region *mem;
> +	resource_size_t min_page_size;
>   	resource_size_t io_start;
>   	resource_size_t lmem_size;
>   	u64 lmem_base;
> @@ -791,8 +792,11 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>   	lmem_size = pci_resource_len(pdev, 2) - lmem_base;
>   	io_start = pci_resource_start(pdev, 2) + lmem_base;
>   
> +	min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
> +						I915_GTT_PAGE_SIZE_4K;
> +
>   	mem = intel_memory_region_create(i915, lmem_base, lmem_size,
> -					 I915_GTT_PAGE_SIZE_4K, io_start,
> +					 min_page_size, io_start,
>   					 type, instance,
>   					 &i915_region_stolen_lmem_ops);
>   	if (IS_ERR(mem))
> diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> index 9ea49e0a27c0..fde2dcb59809 100644
> --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> @@ -197,6 +197,7 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
>   	struct intel_uncore *uncore = gt->uncore;
>   	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
>   	struct intel_memory_region *mem;
> +	resource_size_t min_page_size;
>   	resource_size_t io_start;
>   	resource_size_t lmem_size;
>   	int err;
> @@ -211,10 +212,12 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
>   	if (GEM_WARN_ON(lmem_size > pci_resource_len(pdev, 2)))
>   		return ERR_PTR(-ENODEV);
>   
> +	min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
> +						I915_GTT_PAGE_SIZE_4K;
>   	mem = intel_memory_region_create(i915,
>   					 0,
>   					 lmem_size,
> -					 I915_GTT_PAGE_SIZE_4K,
> +					 min_page_size,
>   					 io_start,
>   					 INTEL_MEMORY_LOCAL,
>   					 0,
