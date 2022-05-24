Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9979533093
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 20:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3AED10FB11;
	Tue, 24 May 2022 18:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD3C10FB11;
 Tue, 24 May 2022 18:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653417586; x=1684953586;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=z4+AU+AgAsq56H58s1nMlrd/+Owomy2rFeH/iCl1uSM=;
 b=P+ok4TeOtUW//X+pzg2nn47UEummB+ZtbqfonWTfi5QsqE9Yp+uWuesE
 jioW3G5qyqvddK0Ch7uMwI6KETVaOxSbgHFODrEd7/A1WU+dh34om9U1X
 vq4TPHcJo8DkQ/qZEwZc4GEYrkYuCINntW2ZnS7QghHlmTPwZcfiiNyqs
 S6UVCR5sBTKotLzQ5pUOn28v3sRFsoUy/dZn7ejEd4rBbQW6BIgbY2tEA
 JaBFGLoPIM4WBkBIwjWYpDFztzB0q8mv1Hy5fBiKAnoNsqq9lxaoNTdXm
 bSnsWjk7h8znK1bl4gxza40TD9C93T+OfYZul1C6EKgXCjcHvtN59CnWk g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10357"; a="253498494"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="253498494"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 11:39:45 -0700
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="717288027"
Received: from iucastil-mobl1.amr.corp.intel.com (HELO msatwood-mobl)
 ([10.212.91.173])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 11:39:45 -0700
Date: Tue, 24 May 2022 11:39:43 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v3 5/5] drm/i915/guc: XEHPSDV and PVC do not
 use HuC
Message-ID: <Yo0mb/49YpOgamRa@msatwood-mobl>
References: <20220511060228.1179450-1-matthew.d.roper@intel.com>
 <20220511060228.1179450-6-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220511060228.1179450-6-matthew.d.roper@intel.com>
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

On Tue, May 10, 2022 at 11:02:28PM -0700, Matt Roper wrote:
> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> Disable HuC loading since it is not used on these platforms.
> 
> Cc: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index ecf149c5fdb0..55e1eb8f3612 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -45,6 +45,10 @@ static void uc_expand_default_options(struct intel_uc *uc)
>  
>  	/* Default: enable HuC authentication and GuC submission */
>  	i915->params.enable_guc = ENABLE_GUC_LOAD_HUC | ENABLE_GUC_SUBMISSION;
> +
> +	/* XEHPSDV and PVC do not use HuC */
> +	if (IS_XEHPSDV(i915) || IS_PONTEVECCHIO(i915))
> +		i915->params.enable_guc &= ~ENABLE_GUC_LOAD_HUC;
>  }
>  
>  /* Reset GuC providing us with fresh state for both GuC and HuC.
> -- 
> 2.35.1
> 
