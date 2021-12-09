Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 497AC46F7B3
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 00:51:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DB589017;
	Thu,  9 Dec 2021 23:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C5C10E13C;
 Thu,  9 Dec 2021 23:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639093888; x=1670629888;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=q4QD2sJ5ElCgIZvDDZR2sym93qZgf4MsWlfJ6eo4BPE=;
 b=OYWXz3HnKlW9KVHbZ1NJQkZ85Q5Hya3lZx/6uTR472bnzW7mHKgQvZ00
 pz/gRtGcfbQhZS8Oliiam2Y6jf57o+Blmwa/bUmQVrOtOZx7EGzNmKvr3
 D8qWdV4D9bdcBBaA1fDf+1bqNPsbRBgccG4ZxPK7RpuhsXRBIX36nu3aa
 l/4zYx31E+B78m5YRPcMf4uv41nEqIXmgHYJuRpIwOb046+YUj4RVyQx2
 MfXgE59jFSyZOwqWCiggxJhr3Zwuxj52yRs2lFaUa0UodI7N3ybAey8cP
 MxnjDUZRb9ijpw/aneaKvemaLWGbf4DkwB+uSp7VUtCqwh73IuQHw3PVN A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="262339687"
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="262339687"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 15:51:28 -0800
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="462332371"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 15:51:27 -0800
Date: Thu, 9 Dec 2021 15:51:26 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v6 06/11] drm/i915/gvt: Use to_gt() helper
Message-ID: <20211209235126.GT2219399@mdroper-desk1.amr.corp.intel.com>
References: <20211209132512.47241-1-andi.shyti@linux.intel.com>
 <20211209132512.47241-7-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211209132512.47241-7-andi.shyti@linux.intel.com>
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 09, 2021 at 03:25:07PM +0200, Andi Shyti wrote:
> From: Michał Winiarski <michal.winiarski@intel.com>
> 
> Use to_gt() helper consistently throughout the codebase.
> Pure mechanical s/i915->gt/to_gt(i915). No functional changes.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gvt/gvt.c       | 2 +-
>  drivers/gpu/drm/i915/gvt/scheduler.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
> index cbac409f6c8a..f0b69e4dcb52 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.c
> +++ b/drivers/gpu/drm/i915/gvt/gvt.c
> @@ -205,7 +205,7 @@ int intel_gvt_init_device(struct drm_i915_private *i915)
>  	spin_lock_init(&gvt->scheduler.mmio_context_lock);
>  	mutex_init(&gvt->lock);
>  	mutex_init(&gvt->sched_lock);
> -	gvt->gt = &i915->gt;
> +	gvt->gt = to_gt(i915);
>  	i915->gvt = gvt;
>  
>  	init_device_info(gvt);
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
> index 6c804102528b..42a0c9ae0a73 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -1386,7 +1386,7 @@ int intel_vgpu_setup_submission(struct intel_vgpu *vgpu)
>  	enum intel_engine_id i;
>  	int ret;
>  
> -	ppgtt = i915_ppgtt_create(&i915->gt, I915_BO_ALLOC_PM_EARLY);
> +	ppgtt = i915_ppgtt_create(to_gt(i915), I915_BO_ALLOC_PM_EARLY);
>  	if (IS_ERR(ppgtt))
>  		return PTR_ERR(ppgtt);
>  
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
