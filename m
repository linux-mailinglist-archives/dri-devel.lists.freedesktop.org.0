Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA5246F7F3
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 01:20:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF6410E196;
	Fri, 10 Dec 2021 00:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6297810E187;
 Fri, 10 Dec 2021 00:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639095600; x=1670631600;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tiPHoX7oEEIL3MOaBgOLw0OGEUW3E3+UYLE+oeyKLkE=;
 b=gwhQVSTEkc0epOBS90z0FpDapmSieCmeyxWWsMAEEw7SipmrJoDp6v5X
 qkPQUmRieqIJrFH4CEOk6SXrMQWXiFs+ivv08ZUJrH0qG8mxHQyf6CCOH
 uMmRRzNxXPqG47MPrr3Xtc/ND8H2LqD9YCYqHkKg2Ss8UwnuN5fa1yp+n
 V1nIOcpx2LPTTOqy6SERckt/1UCXteICYgVvnOpaLPcwkHsgHRV49wrCB
 c+gTEvAjwb6zbt5uhFGkDmAuPmF2v/tsdCeg+mXhBQDbPfnOgSu1aKQ4V
 CRjEhlx4Z+2lMxhwJNFxVJ6C0jmiDH/J5nqqVYlFX/vxgOpJpCSBgHduT A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="225104508"
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="225104508"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 16:19:59 -0800
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="503705229"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 16:19:59 -0800
Date: Thu, 9 Dec 2021 16:19:58 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v6 11/11] drm/i915: Rename i915->gt to i915->gt0
Message-ID: <20211210001958.GY2219399@mdroper-desk1.amr.corp.intel.com>
References: <20211209132512.47241-1-andi.shyti@linux.intel.com>
 <20211209132512.47241-12-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211209132512.47241-12-andi.shyti@linux.intel.com>
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

On Thu, Dec 09, 2021 at 03:25:12PM +0200, Andi Shyti wrote:
> In preparation of the multitile support, highlight the root GT by
> calling it gt0 inside the drm i915 private data.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

If you decide to not drop i915->ggtt completely in the previous patch,
we might want to make a simimlar naming change to that field as well.


Matt

> ---
>  drivers/gpu/drm/i915/i915_drv.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 96e3553838ef..a4084f209097 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1008,7 +1008,7 @@ struct drm_i915_private {
>  	struct i915_perf perf;
>  
>  	/* Abstract the submission mechanism (legacy ringbuffer or execlists) away */
> -	struct intel_gt gt;
> +	struct intel_gt gt0;
>  
>  	struct {
>  		struct i915_gem_contexts {
> @@ -1082,7 +1082,7 @@ static inline struct drm_i915_private *pdev_to_i915(struct pci_dev *pdev)
>  
>  static inline struct intel_gt *to_gt(struct drm_i915_private *i915)
>  {
> -	return &i915->gt;
> +	return &i915->gt0;
>  }
>  
>  /* Simple iterator over all initialised engines */
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
