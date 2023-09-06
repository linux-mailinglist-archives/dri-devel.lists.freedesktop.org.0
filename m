Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 213F1793824
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 11:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520D810E192;
	Wed,  6 Sep 2023 09:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48AB410E192;
 Wed,  6 Sep 2023 09:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693992340; x=1725528340;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HuzTWU4TjFaD1+WvsaPWQM0dzZen5pURK3RvGKWgYgg=;
 b=Kv9lvqTlHA0anLjXkYKdvah4qqcnS+rsX8bgVH65uB/WLnlxuj+4qgcZ
 FRvOGYBSHxb1JSz/81S0kDFFwOZJF8VM3NmUj5hFccTr1oEE5uM5IGHQA
 LBBr6DWBzsfkpROB/rSFH/6O5lgyPzYdGHhvVyEwJPzTN8DIp2LvvakTI
 fzPvsCwo767IxU5VmpBZi1lYvZA22lb1M74Zf2OIJC8c4o6MN+O64RQq6
 NU0iBHmhhDo/XtW9CfNZCZ/l1IZsPTcRQvJFJgu0GZ8ASKqDEMCQcSTBi
 y9IsgG93mNsjOg6uOsK7qMF5xFNSGLhN4NXfQi7X9lfLMMRPo3nf4rbT7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="440991107"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="440991107"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 02:25:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="811583642"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="811583642"
Received: from kmiranda-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.216.135])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 02:25:37 -0700
Date: Wed, 6 Sep 2023 11:25:35 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Drop force_probe requirement
Message-ID: <ZPhFj0H8OYtp1CGh@ashyti-mobl2.lan>
References: <20230905193624.525020-1-radhakrishna.sripada@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905193624.525020-1-radhakrishna.sripada@intel.com>
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
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Radhakrishna,

On Tue, Sep 05, 2023 at 12:36:24PM -0700, Radhakrishna Sripada wrote:
> Meteorlake has been very usable for a while now, all of uapi changes
> related to fundamental platform usage have been finalized and all
> required firmware blobs are available. Recent CI results have also
> been healthy, so we're ready to drop the force_probe requirement and
> enable the platform by default.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

Please keep me in the loop as well... It's been a year I've been
working for this patch to work :)

> ---
>  drivers/gpu/drm/i915/i915_pci.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index df7c261410f7..fe748906c06f 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -836,7 +836,6 @@ static const struct intel_device_info mtl_info = {
>  	.has_pxp = 1,
>  	.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
>  	.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
> -	.require_force_probe = 1,

What's the thinking behind this patch? Are you trying to
understand how CI behaves?

Andi

>  	MTL_CACHELEVEL,
>  };
>  
> -- 
> 2.34.1
