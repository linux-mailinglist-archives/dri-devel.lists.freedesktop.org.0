Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE555A4F2A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 16:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9908510F2DE;
	Mon, 29 Aug 2022 14:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389C810F2DD;
 Mon, 29 Aug 2022 14:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661783244; x=1693319244;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=NUz1jJcbJ1/Hsp5cNd+z53+9gjXd6c9c4lg/Ll6+Nvk=;
 b=iE7CeRf6AeHJd1oqplNsJ0ZVLazYs+AOGNrgJIRSrDbFvvqsk+AgZwWL
 0mesXHv9KW/R6Fa4Jv6OJGafXrQkCtX7OJ2WkB0FckYxSTMLnRHhifum0
 SkBpFcvMWuc3wxV91b5B7Q7I5sNGu4kfJAssvdoq5MkXNsc9Zz/teXrYT
 8Ov5aDadZJxq8MgK1xc5yT0jLJzBNCryLkmXFN6/iLT+at7CoaT2DFNPg
 4dWvYlSo1ETc8s+FsNtftPqK6S5OOesbagwLBllJB0Bq6Kvh4/y5at/Ic
 artKj1hdFylPZYZUfDpSk/nTmwWKGB1ySx806W0QerrGjg2uRiNlsSbJt g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="381206043"
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="381206043"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 07:17:25 -0700
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="679637633"
Received: from idecesar-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.53.198])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 07:17:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jilin Yuan <yuanjilin@cdjrlc.com>, airlied@linux.ie, daniel@ffwll.ch
Subject: Re: [PATCH] drm/i915: fix repeated words in comments
In-Reply-To: <20220823123044.24593-1-yuanjilin@cdjrlc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220823123044.24593-1-yuanjilin@cdjrlc.com>
Date: Mon, 29 Aug 2022 17:17:16 +0300
Message-ID: <87v8qbdthv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: intel-gfx@lists.freedesktop.org, Jilin Yuan <yuanjilin@cdjrlc.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 Aug 2022, Jilin Yuan <yuanjilin@cdjrlc.com> wrote:
>  Delete the redundant word 'other'.
>  Delete the redundant word 'the'.
>  Delete the redundant word 'will'.
>
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>

Doesn't apply because some of the hunks were already fixed by other
commits.

BR,
Jani.


> ---
>  drivers/gpu/drm/i915/i915_gem_evict.c | 2 +-
>  drivers/gpu/drm/i915/i915_irq.c       | 4 ++--
>  drivers/gpu/drm/i915/i915_memcpy.h    | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
> index f025ee4fa526..028e509e1628 100644
> --- a/drivers/gpu/drm/i915/i915_gem_evict.c
> +++ b/drivers/gpu/drm/i915/i915_gem_evict.c
> @@ -256,7 +256,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
>  	goto search_again;
>  
>  found:
> -	/* drm_mm doesn't allow any other other operations while
> +	/* drm_mm doesn't allow any other operations while
>  	 * scanning, therefore store to-be-evicted objects on a
>  	 * temporary list and take a reference for all before
>  	 * calling unbind (which may remove the active reference
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index 73cebc6aa650..1e4a705bc5cc 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -65,7 +65,7 @@
>  
>  /*
>   * Interrupt statistic for PMU. Increments the counter only if the
> - * interrupt originated from the the GPU so interrupts from a device which
> + * interrupt originated from the GPU so interrupts from a device which
>   * shares the interrupt line are not accounted.
>   */
>  static inline void pmu_irq_stats(struct drm_i915_private *i915,
> @@ -2175,7 +2175,7 @@ static irqreturn_t ilk_irq_handler(int irq, void *arg)
>  	raw_reg_write(regs, DEIER, de_ier & ~DE_MASTER_IRQ_CONTROL);
>  
>  	/* Disable south interrupts. We'll only write to SDEIIR once, so further
> -	 * interrupts will will be stored on its back queue, and then we'll be
> +	 * interrupts will be stored on its back queue, and then we'll be
>  	 * able to process them after we restore SDEIER (as soon as we restore
>  	 * it, we'll get an interrupt if SDEIIR still has something to process
>  	 * due to its back queue). */
> diff --git a/drivers/gpu/drm/i915/i915_memcpy.h b/drivers/gpu/drm/i915/i915_memcpy.h
> index 3df063a3293b..126dfb4352f0 100644
> --- a/drivers/gpu/drm/i915/i915_memcpy.h
> +++ b/drivers/gpu/drm/i915/i915_memcpy.h
> @@ -18,7 +18,7 @@ void i915_unaligned_memcpy_from_wc(void *dst, const void *src, unsigned long len
>  /* The movntdqa instructions used for memcpy-from-wc require 16-byte alignment,
>   * as well as SSE4.1 support. i915_memcpy_from_wc() will report if it cannot
>   * perform the operation. To check beforehand, pass in the parameters to
> - * to i915_can_memcpy_from_wc() - since we only care about the low 4 bits,
> + * i915_can_memcpy_from_wc() - since we only care about the low 4 bits,
>   * you only need to pass in the minor offsets, page-aligned pointers are
>   * always valid.
>   *

-- 
Jani Nikula, Intel Open Source Graphics Center
