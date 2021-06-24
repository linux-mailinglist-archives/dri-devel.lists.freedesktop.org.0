Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A521E3B33EA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 18:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A413C6EC55;
	Thu, 24 Jun 2021 16:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F476EC55;
 Thu, 24 Jun 2021 16:26:23 +0000 (UTC)
IronPort-SDR: d4YMvyzIAysH2pq/EVn0CvPojvKWSgI6Rf86bhTFMp0g7YYCxGsndfAIW6zHDl5E4wD1mvS1Z6
 XKK4zAIU0alw==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="229095199"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="229095199"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 09:26:23 -0700
IronPort-SDR: CcsA7FExuNS1VqI9AplbWCX8w7fylypfw5SUodO4G/TR+3c7cBg0/cNsotvTO4Uwgo5BxLy+Bd
 1EBYsdKuBcNQ==
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="557387159"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 09:26:23 -0700
Date: Thu, 24 Jun 2021 09:19:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 40/47] drm/i915/guc: Enable GuC engine reset
Message-ID: <20210624161941.GA6863@sdutt-i7>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-41-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624070516.21893-41-matthew.brost@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Thu, Jun 24, 2021 at 12:05:09AM -0700, Matthew Brost wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Clear the 'disable resets' flag to allow GuC to reset hung contexts
> (detected via pre-emption timeout).
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 9fd3c911f5fb..d3e86ab7508f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -81,8 +81,7 @@ static void guc_policies_init(struct guc_policies *policies)
>  {
>  	policies->dpc_promote_time = GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US;
>  	policies->max_num_work_items = GLOBAL_POLICY_MAX_NUM_WI;
> -	/* Disable automatic resets as not yet supported. */
> -	policies->global_flags = GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> +	policies->global_flags = 0;
>  	policies->is_valid = 1;
>  }
>  
> -- 
> 2.28.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
