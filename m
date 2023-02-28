Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 083B76A5D27
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 17:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D16110E4F0;
	Tue, 28 Feb 2023 16:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DB110E4EF;
 Tue, 28 Feb 2023 16:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677601926; x=1709137926;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Qdv8pAE14kFQQKEVrHijoEjmaUNNBEeBac0MtCFNEYI=;
 b=iOZCLMOfMqf18Zwnr3yA+kE33UQ1ygjYuS9zxJsfHg62SGeouGshcmUU
 1I8BENkFaL6fEriewZcKmW+2kt8JgHWSKN/uRpt8UFnE1/b4hQ+abnBKF
 874dNccrNLj6QafzbskNDFgNyEytLY430GNa9BjMu7G31g3rCGVp4PpdJ
 NXy0AISQJHF35FRcVTdvg3x0jIB7Wm5zRUtyVIu52yOxVQwSE6mIis6nx
 ALE5dB5h75PMYvITWvyVQxZUaUKYcR27ezoSvrHNRgR5viTpSkW22RY+5
 JCIuPxsxzmvjoLRq6Obtnnk43MiMVXLdRnF0V2WUjVCmm7aVvuB8+635N A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="336473408"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="336473408"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 08:32:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="674217331"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="674217331"
Received: from barumuga-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.47.26])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 08:32:01 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean
 Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH 07/10] drm/display/dsc: include the rest of pre-SCR
 parameters
In-Reply-To: <20230228113342.2051425-8-dmitry.baryshkov@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230228113342.2051425-1-dmitry.baryshkov@linaro.org>
 <20230228113342.2051425-8-dmitry.baryshkov@linaro.org>
Date: Tue, 28 Feb 2023 18:31:58 +0200
Message-ID: <87pm9tycn5.fsf@intel.com>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Feb 2023, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> DSC model contains pre-SCR RC parameters for other bpp/bpc combinations,
> include them here for completeness.

Need to run now, note to self:

Does i915 use the arrays to limit the bpp/bpc combos supported by
hardware? Do we need to add separate limiting in i915.

BR,
Jani.



>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_dsc_helper.c | 72 ++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>
> diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
> index 51794b40526a..1612536014ea 100644
> --- a/drivers/gpu/drm/display/drm_dsc_helper.c
> +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
> @@ -327,6 +327,16 @@ struct rc_parameters_data {
>  #define DSC_BPP(bpp)	((bpp) << 4)
>  
>  static const struct rc_parameters_data rc_parameters_pre_scr[] = {
> +{ DSC_BPP(6), 8,
> +	/* 6BPP/8BPC */
> +	{ 683, 15, 6144, 3, 13, 11, 11, {
> +		{ 0, 2, 0 }, { 1, 4, -2 }, { 3, 6, -2 }, { 4, 6, -4 },
> +		{ 5, 7, -6 }, { 5, 7, -6 }, { 6, 7, -6 }, { 6, 8, -8 },
> +		{ 7, 9, -8 }, { 8, 10, -10 }, { 9, 11, -10 }, { 10, 12, -12 },
> +		{ 10, 13, -12 }, { 12, 14, -12 }, { 15, 15, -12 }
> +		}
> +	}
> +},
>  { DSC_BPP(8), 8,
>  	/* 8BPP/8BPC */
>  	{ 512, 12, 6144, 3, 12, 11, 11, {
> @@ -362,6 +372,37 @@ static const struct rc_parameters_data rc_parameters_pre_scr[] = {
>  		}
>  	}
>  },
> +{ DSC_BPP(10), 8,
> +	/* 10BPP/8BPC */
> +	{ 410, 12, 5632, 3, 12, 11, 11, {
> +		{ 0, 3, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 2, 6, -2 },
> +		{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
> +		{ 3, 9, -8 }, { 3, 9, -10 }, { 5, 10, -10 }, { 5, 11, -10 },
> +		{ 5, 12, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
> +		}
> +	}
> +},
> +{ DSC_BPP(10), 10,
> +	/* 10BPP/10BPC */
> +	{ 410, 12, 5632, 7, 16, 15, 15, {
> +		{ 0, 7, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 6, 10, -2 },
> +		{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
> +		{ 7, 13, -8 }, { 7, 13, -10 }, { 9, 14, -10 }, { 9, 15, -10 },
> +		{ 9, 16, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
> +		}
> +	}
> +},
> +{ DSC_BPP(10), 12,
> +	/* 10BPP/12BPC */
> +	{ 410, 12, 5632, 11, 20, 19, 19, {
> +		{ 0, 11, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 10, 14, -2 },
> +		{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
> +		{ 11, 17, -8 }, { 11, 17, -10 }, { 13, 18, -10 },
> +		{ 13, 19, -10 }, { 13, 20, -12 }, { 15, 21, -12 },
> +		{ 21, 23, -12 }
> +		}
> +	}
> +},
>  { DSC_BPP(12), 8,
>  	/* 12BPP/8BPC */
>  	{ 341, 15, 2048, 3, 12, 11, 11, {
> @@ -393,6 +434,37 @@ static const struct rc_parameters_data rc_parameters_pre_scr[] = {
>  		}
>  	}
>  },
> +{ DSC_BPP(15), 8,
> +	/* 15BPP/8BPC */
> +	{ 273, 15, 2048, 3, 12, 11, 11, {
> +		{ 0, 0, 10 }, { 0, 1, 8 }, { 0, 1, 6 }, { 0, 2, 4 },
> +		{ 1, 2, 2 }, { 1, 3, 0 }, { 1, 4, -2 }, { 2, 4, -4 },
> +		{ 3, 4, -6 }, { 3, 5, -8 }, { 4, 6, -10 }, { 5, 7, -10 },
> +		{ 5, 8, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
> +		}
> +	}
> +},
> +{ DSC_BPP(15), 10,
> +	/* 15BPP/10BPC */
> +	{ 273, 15, 2048, 7, 16, 15, 15, {
> +		{ 0, 2, 10 }, { 2, 5, 8 }, { 3, 5, 6 }, { 4, 6, 4 },
> +		{ 5, 6, 2 }, { 5, 7, 0 }, { 5, 8, -2 }, { 6, 8, -4 },
> +		{ 7, 8, -6 }, { 7, 9, -8 }, { 8, 10, -10 }, { 9, 11, -10 },
> +		{ 9, 12, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
> +		}
> +	}
> +},
> +{ DSC_BPP(15), 12,
> +	/* 15BPP/12BPC */
> +	{ 273, 15, 2048, 11, 20, 19, 19, {
> +		{ 0, 4, 10 }, { 2, 7, 8 }, { 4, 9, 6 }, { 6, 11, 4 },
> +		{ 9, 11, 2 }, { 9, 11, 0 }, { 9, 12, -2 }, { 10, 12, -4 },
> +		{ 11, 12, -6 }, { 11, 13, -8 }, { 12, 14, -10 },
> +		{ 13, 15, -10 }, { 13, 16, -12 }, { 15, 21, -12 },
> +		{ 21, 23, -12 }
> +		}
> +	}
> +},
>  { /* sentinel */ }
>  };

-- 
Jani Nikula, Intel Open Source Graphics Center
