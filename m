Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EA853308F
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 20:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AC310F29C;
	Tue, 24 May 2022 18:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26D710F29C;
 Tue, 24 May 2022 18:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653417518; x=1684953518;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vqXoGohFa7As1pgA+255AsLu16rf4AhZI8o0H4uEeFE=;
 b=lQvIdH9Erv5EwSzgrxT/8++WeH6U3xBDG85s0S0PUS/CORh0u51fA0Ch
 ljDOe67XUQq3YqcShD7JsQ/k9ssQwjTmEklXFzbiS1nDEbhb0S0pLBt0M
 cJqHa1r/94zYhR0/H25LGRL7v5HBOQT5uOdL79DiZ7kbFRLLnQSB1xWlu
 q5n1PDEvxWcWD6Mb+vNinZUbpYuN86jTWTGTjXRs52F0sHNF2HQVxXyxX
 Q5BKYssyPS2yWyfAxOGKUn+E5dObHAoIGzP1dd4LLIiuiMD6JQXBShiLs
 908ra5gcqwceTozk1ddV5ulS3cJ5NgP4uxjR6U7zDXCtMr7dglWnM6cza Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10357"; a="254122975"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="254122975"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 11:38:38 -0700
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="717287855"
Received: from iucastil-mobl1.amr.corp.intel.com (HELO msatwood-mobl)
 ([10.212.91.173])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 11:38:38 -0700
Date: Tue, 24 May 2022 11:38:36 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v3 4/5] drm/i915/pvc: Add new BCS engines to
 GuC engine list
Message-ID: <Yo0mLBty61cGRaNv@msatwood-mobl>
References: <20220511060228.1179450-1-matthew.d.roper@intel.com>
 <20220511060228.1179450-5-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220511060228.1179450-5-matthew.d.roper@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 10, 2022 at 11:02:27PM -0700, Matt Roper wrote:
> Intialize ADS system info to reflect the availablity of new BCS engines
> 
> Original-author: CQ Tang
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 2 +-
>  drivers/gpu/drm/i915/i915_drv.h            | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 3eabf4cf8eec..bb197610fd5b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -457,7 +457,7 @@ static void fill_engine_enable_masks(struct intel_gt *gt,
>  {
>  	info_map_write(info_map, engine_enabled_masks[GUC_RENDER_CLASS], RCS_MASK(gt));
>  	info_map_write(info_map, engine_enabled_masks[GUC_COMPUTE_CLASS], CCS_MASK(gt));
> -	info_map_write(info_map, engine_enabled_masks[GUC_BLITTER_CLASS], 1);
> +	info_map_write(info_map, engine_enabled_masks[GUC_BLITTER_CLASS], BCS_MASK(gt));
>  	info_map_write(info_map, engine_enabled_masks[GUC_VIDEO_CLASS], VDBOX_MASK(gt));
>  	info_map_write(info_map, engine_enabled_masks[GUC_VIDEOENHANCE_CLASS], VEBOX_MASK(gt));
>  }
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 54e9c2a5493d..4b147fd90ec4 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1223,6 +1223,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  })
>  #define RCS_MASK(gt) \
>  	ENGINE_INSTANCES_MASK(gt, RCS0, I915_MAX_RCS)
> +#define BCS_MASK(gt) \
> +	ENGINE_INSTANCES_MASK(gt, BCS0, I915_MAX_BCS)
>  #define VDBOX_MASK(gt) \
>  	ENGINE_INSTANCES_MASK(gt, VCS0, I915_MAX_VCS)
>  #define VEBOX_MASK(gt) \
> -- 
> 2.35.1
> 
