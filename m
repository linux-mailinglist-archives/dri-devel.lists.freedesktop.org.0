Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FF0531D8B
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 23:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D8F112281;
	Mon, 23 May 2022 21:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F35A112281;
 Mon, 23 May 2022 21:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653340592; x=1684876592;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Wdlu5qAck4K8hVuNjoIxo+xDWRf/YlAeklV60KNVFGU=;
 b=bj6q13pMD0nuFDNZSsVPhuiMm4wt4CxGrQ9hRSlZ8Cts5uEVdYb29L60
 H3AyDoJwTNjdYWUHlYnza2IzXy9WbKOyPf407FFgYEjxPKNKvsUoecmS4
 IxLepQ6qzVEIIxHHLlmeLQu7BXsBdPXG/qHBdSdANQT5iXEFU6mGcBzZp
 /mKS7D3eN/4NlNH40GyNbxWQJpo0zZ5YrvfaiUvHWorVh5gVzRLdGedtK
 njKf1LpQxIx2GhiSO8ojdAB41D2huET6/593jc4UKAZxFYDlkADRKxyOg
 PyG1G3YlFHd0qU4OqRs5bmNeHEOU0jnrbCl3pgLvVcxoRpqnzr8mhJJHB A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="273353241"
X-IronPort-AV: E=Sophos;i="5.91,247,1647327600"; d="scan'208";a="273353241"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 14:16:15 -0700
X-IronPort-AV: E=Sophos;i="5.91,247,1647327600"; d="scan'208";a="744934688"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 14:16:15 -0700
Date: Mon, 23 May 2022 14:16:13 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH] drm/i915/hwconfig: Report no hwconfig support on ADL-N
Message-ID: <Yov5nSWY/uksVjp1@mdroper-desk1.amr.corp.intel.com>
References: <20220523075116.207677-1-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220523075116.207677-1-balasubramani.vivekanandan@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, John.C.Harrison@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 23, 2022 at 01:21:16PM +0530, Balasubramani Vivekanandan wrote:
> ADL-N being a subplatform of ADL-P, it lacks support for hwconfig
> table. Explicit check added to skip ADL-N.
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> index 79c66b6b51a3..5aaa3948de74 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> @@ -94,7 +94,7 @@ static int guc_hwconfig_fill_buffer(struct intel_guc *guc, struct intel_hwconfig
>  
>  static bool has_table(struct drm_i915_private *i915)
>  {
> -	if (IS_ALDERLAKE_P(i915))
> +	if (IS_ALDERLAKE_P(i915) && !IS_ADLP_N(i915))
>  		return true;
>  	if (IS_DG2(i915))
>  		return true;
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
