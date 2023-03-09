Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 236A66B309F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 23:31:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485C510E0D5;
	Thu,  9 Mar 2023 22:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B91A10E0D5;
 Thu,  9 Mar 2023 22:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678401056; x=1709937056;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7sPJXHAnMu/5gjdGOeP3npU39GN5Bd2sYWRVLOM+CKw=;
 b=jw/10Z18Ran5bmi1aZ0dEb0xuEeQeH3bWcsbDweLJhXjJ7NaNtZ71p9k
 7gYMpdaiRIOXpXiiR/uXlg/LW4up5cGuWBuittN/6CK36BlIQ0pKZE+yt
 ksfR0C5HtVBmszeJuzlpbgyPvE2T8nROYt/tVbRPll1dTVOFvfY05S2p3
 83LaoT/SiBIz/C6jcUoompP3vlOgvSQlXilzPo/zTw+FBRUqsVrc6mtjJ
 mvTtRWL/lyTaIh/lQkI1D2c2UEQjr0nhWzvuXyoBx1Veevg3m1KL5i0gD
 gjVobpGu67faOA/0iHgSFwtrEOqqW72sMKz08N/q77xUgxmQQgAWhxUAq w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="338140733"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="338140733"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 14:30:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="851693972"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="851693972"
Received: from pmezinca-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.251.219.71])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 14:30:52 -0800
Date: Thu, 9 Mar 2023 23:30:49 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/i915/mtl: Disable stolen memory backed FB for A0
Message-ID: <ZApeGQfZ9SupVrsv@ashyti-mobl2.lan>
References: <20230309164905.828-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309164905.828-1-nirmoy.das@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

On Thu, Mar 09, 2023 at 05:49:05PM +0100, Nirmoy Das wrote:
> Stolen memory is not usable for MTL A0 stepping beyond
> certain access size and we have no control over userspace
> access size of /dev/fb which can be backed by stolen memory.
> So disable stolen memory backed fb by setting i915->dsm.usable_size
> to zero.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> 

Can you please remove this blank line from the tag space?

> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index d8e06e783e30..56ccfcbdbce1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -535,6 +535,16 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
>  	/* Basic memrange allocator for stolen space. */
>  	drm_mm_init(&i915->mm.stolen, 0, i915->dsm.usable_size);
>  
> +	/*
> +	 * Access to stolen lmem beyond certain size for MTL A0 stepping
> +	 * would crash the machine. Disable stolen lmem for userspace access
> +	 * by setting usable_size to zero.
> +	 * hsdes: 22016134735

Please, remove this reference, as well.

With the above:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

> +	 */
> +	if (IS_MTL_GRAPHICS_STEP(i915, M, STEP_A0, STEP_B0) ||
> +	    IS_MTL_GRAPHICS_STEP(i915, P, STEP_A0, STEP_B0))
> +		i915->dsm.usable_size = 0;
> +
>  	return 0;
>  }
>  
> -- 
> 2.39.0
