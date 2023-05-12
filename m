Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1212E700512
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 12:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D01D10E67A;
	Fri, 12 May 2023 10:17:35 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7018E10E66E;
 Fri, 12 May 2023 10:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683886652; x=1715422652;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3/95fRj2EkkxaM7Yveha+KQ0wprsHNG0Enylo82W5Tc=;
 b=m9/Htw82NoXxoRb9D7ezW13YRiZPFzrH/YvhcZgMjy2myAt5p8nkC1GS
 laredrj/ETnpyYl4LhCi4QBB5eirGCDsrXH6lQZfGVz+wmat75tGP8g1e
 jVCW5EyzLge2YENAFvGkznjEDmzo7AlinNGe2vngF/2DvcNEgU/FL1G4J
 mM1ekovyOZm3k0OaKz6Hjdmh7o4HJzZQZNh6AfbAy27zRVHCEAnjkXisG
 PJHyqB9RNSdtm/4mFoRu7OfqKZWg4DG9OIgA6DzTaVqrQ5L95WhlAsqxp
 kAnPB2IGLlFbKaBRLKjk+0tuHWFp0QMWsiYou4scsjagBSdEQFCW5z/ys g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="437090240"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="437090240"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 03:17:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="677616353"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="677616353"
Received: from mmilbred-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.219.202])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 03:17:28 -0700
Date: Fri, 12 May 2023 12:17:24 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John.C.Harrison@intel.com
Subject: Re: [Intel-gfx] [PATCH] drm/i1915/guc: Fix probe injection CI
 failures after recent change
Message-ID: <ZF4SNE/XNXi75W5d@ashyti-mobl2.lan>
References: <20230510205556.312999-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510205556.312999-1-John.C.Harrison@Intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Intel-GFX@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, DRI-Devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

On Wed, May 10, 2023 at 01:55:56PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> A recent change bumped a 'notice' message up to 'error' level for
> debug builds to help trap incorrect configurations in CI systems.
> Unfortunaetly, tha error condition in question is triggered by the

/tha/the/

> error injection probe test. So change the message again to be 'probe
> error' level instead.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Fixes: 760133d42f0a ("drm/i915/uc: Make unexpected firmware versions an error in debug builds")
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 4ec7df9ed5ff3..e467d9af61876 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -18,7 +18,7 @@
>  #include "i915_reg.h"
>  
>  #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
> -#define UNEXPECTED	gt_err
> +#define UNEXPECTED	gt_probe_error
>  #else
>  #define UNEXPECTED	gt_notice
>  #endif
> -- 
> 2.39.1
