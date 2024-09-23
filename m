Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E2B97E617
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 08:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A1C10E387;
	Mon, 23 Sep 2024 06:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mEiZNK9l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D865210E387;
 Mon, 23 Sep 2024 06:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727073495; x=1758609495;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=adkwsWEFcrcrhBa6//oKeGXzJBAGOjoocn+XTlCL0qs=;
 b=mEiZNK9lzeJv19r0KYrzHcoU+vqtKK4GAL6P1+BZzsc2YfF1uheFdMwp
 GDwbqHfJIJdru94uljINK0Z40d31thDaQM3kWFOeaIoZXTuGiaHcFlu/+
 6YoqchovZqjO7keNUlp9HXgJp0eT9AYc94IyhRKVah59FszGCac75Kqkt
 kdo5z735RZAEutTzt17iTI3ixMFppyGVFFnTANMlhkhOSD7uLe1HVJWdr
 LpleF1nbPJ8C1AygTDcGyLOBFWullHNxaanMpdXcyPz3FfV0L35AjTdAQ
 e3oN9mQVO7ehAwl5YxYYTAc17P8MUtjMs1p6GrmoUeuFlPztdacePPQ+s A==;
X-CSE-ConnectionGUID: NZTkA2mPQV2kZ4yM1/0hcg==
X-CSE-MsgGUID: cw5qs47NSCqyuZ1FJ7ACxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="29793285"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="29793285"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2024 23:38:15 -0700
X-CSE-ConnectionGUID: Ci5p0AlmR9KtN2G+m8XrqQ==
X-CSE-MsgGUID: DGqgHnh+SPeowsoxjCJocQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="75525517"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2024 23:38:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean
 Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/hdmi: drop pll_cmp_to_fdata from hdmi_phy_8998
In-Reply-To: <20240922-msm-drop-unused-func-v1-1-c5dc083415b8@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240922-msm-drop-unused-func-v1-1-c5dc083415b8@linaro.org>
Date: Mon, 23 Sep 2024 09:38:05 +0300
Message-ID: <874j6698oi.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 22 Sep 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> The pll_cmp_to_fdata() was never used by the working code. Drop it to
> prevent warnings with W=1 and clang.
>
> Reported-by: Jani Nikula <jani.nikula@intel.com>
> Closes: https://lore.kernel.org/dri-devel/3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
> index 0e3a2b16a2ce..e6ffaf92d26d 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
> @@ -153,15 +153,6 @@ static inline u32 pll_get_pll_cmp(u64 fdata, unsigned long ref_clk)
>  	return dividend - 1;
>  }
>  
> -static inline u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
> -{
> -	u64 fdata = ((u64)pll_cmp) * ref_clk * 10;
> -
> -	do_div(fdata, HDMI_PLL_CMP_CNT);
> -
> -	return fdata;
> -}
> -
>  #define HDMI_REF_CLOCK_HZ ((u64)19200000)
>  #define HDMI_MHZ_TO_HZ ((u64)1000000)
>  static int pll_get_post_div(struct hdmi_8998_post_divider *pd, u64 bclk)
>
> ---
> base-commit: 32ffa5373540a8d1c06619f52d019c6cdc948bb4
> change-id: 20240922-msm-drop-unused-func-b9e76ad8e0ea
>
> Best regards,

-- 
Jani Nikula, Intel
