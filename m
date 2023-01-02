Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E84BA65B352
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 15:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD9E10E34A;
	Mon,  2 Jan 2023 14:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C57810E349;
 Mon,  2 Jan 2023 14:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672669678; x=1704205678;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=m2XtFGgQcnvEbqfEX2AJFgubdYVpm7owXNhKI2flAJQ=;
 b=cAgZXcm5V5+7zTxGkprDgl4bzNhk5YMwtEvInNd5xoFQwHS45/taMoHi
 VRSW+5KjljzoQ1/2hOnstftzl6sglIJoy1uR4CAicNV47bm6jVzdCH+QR
 BlRJA3Xg0jjCpgWv0e4I1qcQFd3bcn6wpGDJjZ9ecKaxT4y8vb9+ZrodD
 fTliN+A6BxkRkaus2PhRrld3UyA4plt/L0hoRHZc4xMqL48QSKnrOfkcg
 3ru8I8wV/1SX1+fgxl/e8O8bj2J8xWmfazDcDcgayK3Gs4SooZgZ/qq3H
 a9RRQChmfVpapO9hnLDp+MTHDkcw79I30FgO/Gs/d6GPCS0W6esRBFsuW g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="301179228"
X-IronPort-AV: E=Sophos;i="5.96,294,1665471600"; d="scan'208";a="301179228"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2023 06:27:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="654504251"
X-IronPort-AV: E=Sophos;i="5.96,294,1665471600"; d="scan'208";a="654504251"
Received: from bhomann-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.48.10])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2023 06:27:54 -0800
Date: Mon, 2 Jan 2023 15:27:51 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Use "%zu" to format size_t
Message-ID: <Y7LpskDkbpuybI17@ashyti-mobl2.lan>
References: <20221230183500.20553-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221230183500.20553-1-nirmoy.das@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, andrzej.hajda@intel.com, rodrigo.vivi@intel.com,
 mchehab@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 30, 2022 at 07:35:00PM +0100, Nirmoy Das wrote:
> Switch to %zu for printing size_t which will
> fix compilation warning for 32-bit build.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> index e767791e40e0..114443096841 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -238,7 +238,7 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
>  			goto rebuild_st;
>  		} else {
>  			dev_warn(i915->drm.dev,
> -				 "Failed to DMA remap %lu pages\n",
> +				 "Failed to DMA remap %zu pages\n",
>  				 obj->base.size >> PAGE_SHIFT);
>  			goto err_pages;
>  		}
> -- 
> 2.38.0
