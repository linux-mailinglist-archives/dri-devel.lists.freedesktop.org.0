Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F72BDE8E6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 14:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B65D10E7B5;
	Wed, 15 Oct 2025 12:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="krH1G6ZH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05CC010E7B5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 12:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760532991; x=1792068991;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=EXCnZjdp0WFMBO5mhFg3iFzstEGAoaA3Q4oFRnS7FS0=;
 b=krH1G6ZH3wWDsdqBaOmtTMKOltNB/R2kLkQyTSy9BCKc5AKvutJrKQFf
 NHBBwht0MXmlowG48rlx7+moQWpRMSPqAQRkuQJb2rOf1XlQyiL0qZFte
 asLJ5+n1S7jIWB9cit19BBlxcgA8sddy+Wqe4cviajOOAWeyFU8SzS77a
 RLXSAbGcjEhzVFBzXVTsqYlig2nVHsCYBH6w2bPy5Ap/yX1esd7+q3KjY
 8xH2ihVBAK5qooWa1WSD4zqaDqPOpf/VOaMHhgKgn79JGaND9mYG3rR0I
 bUshbLTKU2DC3PkzLV3pw/GageyWc6n7sVF1FUU7Cm85ZjkScUceqDamn Q==;
X-CSE-ConnectionGUID: MCN+X8FxSOyl0CqO0BoOWw==
X-CSE-MsgGUID: LefQcr9cQRCN1zLAgWKZuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="88173822"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="88173822"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 05:56:31 -0700
X-CSE-ConnectionGUID: r7gk0TPCTaqNrjasc3gJ5A==
X-CSE-MsgGUID: Y5WPvCnNQBqAfIHTSZY/GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="182955133"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.245.102])
 ([10.245.245.102])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 05:56:30 -0700
Message-ID: <fb07e25b-e965-4103-b5af-8167a15cbd2f@linux.intel.com>
Date: Wed, 15 Oct 2025 14:54:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Allow mixed mappings for userptr
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20251010104149.72783-1-thomas.hellstrom@linux.intel.com>
 <13cf7040ec69f3e5f8ed7df4230a56db93bb6b73.camel@linux.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <13cf7040ec69f3e5f8ed7df4230a56db93bb6b73.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Den 2025-10-14 kl. 13:08, skrev Thomas Hellström:
> + dri-devel.
> 
> From: Matthew Brost <matthew.brost@intel.com>
> 
> Compute kernels often issue memory copies immediately after completion.
> If the memory being copied is an SVM pointer that was faulted into the
> device and then bound via userptr, it is undesirable to move that
> memory. Worse, if userptr is mixed between system and device memory,
> the
> bind operation may be rejected.
> 
> Xe already has the necessary plumbing to support userptr with mixed
> mappings. This update modifies GPUSVM's get_pages to correctly locate
> pages in such mixed mapping scenarios.
> 
> v2:
> - Rebase (Thomas Hellström)
> v3:
> - Remove Fixes tag.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c    | 6 ++++--
>  drivers/gpu/drm/xe/xe_userptr.c | 4 +++-
>  include/drm/drm_gpusvm.h        | 4 ++++
>  3 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c
> b/drivers/gpu/drm/drm_gpusvm.c
> index cb906765897e..73e550c8ff8c 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1363,7 +1363,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm
> *gpusvm,
>  		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i,
> npages);
>  		if (is_device_private_page(page) ||
>  		    is_device_coherent_page(page)) {
> -			if (zdd != page->zone_device_data && i > 0) {
> +			if (!ctx->allow_mixed &&
> +			    zdd != page->zone_device_data && i > 0) {
>  				err = -EOPNOTSUPP;
>  				goto err_unmap;
>  			}
> @@ -1399,7 +1400,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm
> *gpusvm,
>  		} else {
>  			dma_addr_t addr;
>  
> -			if (is_zone_device_page(page) || pagemap) {
> +			if (is_zone_device_page(page) ||
> +			    (pagemap && !ctx->allow_mixed)) {
>  				err = -EOPNOTSUPP;
>  				goto err_unmap;
>  			}
> diff --git a/drivers/gpu/drm/xe/xe_userptr.c
> b/drivers/gpu/drm/xe/xe_userptr.c
> index f16e92cd8090..0d9130b1958a 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.c
> +++ b/drivers/gpu/drm/xe/xe_userptr.c
> @@ -3,6 +3,7 @@
>   * Copyright © 2025 Intel Corporation
>   */
>  
> +#include "xe_svm.h"
>  #include "xe_userptr.h"
>  
>  #include <linux/mm.h>
> @@ -54,7 +55,8 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma
> *uvma)
>  	struct xe_device *xe = vm->xe;
>  	struct drm_gpusvm_ctx ctx = {
>  		.read_only = xe_vma_read_only(vma),
> -		.device_private_page_owner = NULL,
> +		.device_private_page_owner = xe_svm_devm_owner(xe),
> +		.allow_mixed = true,
>  	};
>  
>  	lockdep_assert_held(&vm->lock);
> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> index b92faa9a26b2..632e100e6efb 100644
> --- a/include/drm/drm_gpusvm.h
> +++ b/include/drm/drm_gpusvm.h
> @@ -235,6 +235,9 @@ struct drm_gpusvm {
>   * @read_only: operating on read-only memory
>   * @devmem_possible: possible to use device memory
>   * @devmem_only: use only device memory
> + * @allow_mixed: Allow mixed mappings in get pages. Mixing between
> system and
> + *               single dpagemap is supported, mixing between multiple
> dpagemap
> + *               is unsupported.
>   *
>   * Context that is DRM GPUSVM is operating in (i.e. user arguments).
>   */
> @@ -246,6 +249,7 @@ struct drm_gpusvm_ctx {
>  	unsigned int read_only :1;
>  	unsigned int devmem_possible :1;
>  	unsigned int devmem_only :1;
> +	unsigned int allow_mixed :1;
>  };
>  
>  int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> 
> 

