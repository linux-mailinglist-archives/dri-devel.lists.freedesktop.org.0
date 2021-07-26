Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 973D23D575A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 12:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6764C6F5D5;
	Mon, 26 Jul 2021 10:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B63E6F5D5;
 Mon, 26 Jul 2021 10:23:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="191793662"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="191793662"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 03:23:03 -0700
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="417012663"
Received: from dechasso-mobl3.amr.corp.intel.com (HELO intel.com)
 ([10.212.115.115])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 03:23:01 -0700
Date: Mon, 26 Jul 2021 06:22:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 24/30] drm/i915: rename CNL references in intel_dram.c
Message-ID: <YP6NA8YnP3eMEMXm@intel.com>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
 <20210724001114.249295-25-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210724001114.249295-25-lucas.demarchi@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Jose Souza <jose.souza@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 05:11:08PM -0700, Lucas De Marchi wrote:
> With the removal of CNL, let's consider ICL as the first platform using
> those constants.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_reg.h   | 24 +++++++++++------------
>  drivers/gpu/drm/i915/intel_dram.c | 32 +++++++++++++++----------------
>  2 files changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index f032a4c8b26d..8782d1723254 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -11082,18 +11082,18 @@ enum skl_power_gate {
>  #define  SKL_DRAM_RANK_1			(0x0 << 10)
>  #define  SKL_DRAM_RANK_2			(0x1 << 10)
>  #define  SKL_DRAM_RANK_MASK			(0x1 << 10)
> -#define  CNL_DRAM_SIZE_MASK			0x7F
> -#define  CNL_DRAM_WIDTH_MASK			(0x3 << 7)
> -#define  CNL_DRAM_WIDTH_SHIFT			7
> -#define  CNL_DRAM_WIDTH_X8			(0x0 << 7)
> -#define  CNL_DRAM_WIDTH_X16			(0x1 << 7)
> -#define  CNL_DRAM_WIDTH_X32			(0x2 << 7)
> -#define  CNL_DRAM_RANK_MASK			(0x3 << 9)
> -#define  CNL_DRAM_RANK_SHIFT			9
> -#define  CNL_DRAM_RANK_1			(0x0 << 9)
> -#define  CNL_DRAM_RANK_2			(0x1 << 9)
> -#define  CNL_DRAM_RANK_3			(0x2 << 9)
> -#define  CNL_DRAM_RANK_4			(0x3 << 9)
> +#define  ICL_DRAM_SIZE_MASK			0x7F
> +#define  ICL_DRAM_WIDTH_MASK			(0x3 << 7)
> +#define  ICL_DRAM_WIDTH_SHIFT			7
> +#define  ICL_DRAM_WIDTH_X8			(0x0 << 7)
> +#define  ICL_DRAM_WIDTH_X16			(0x1 << 7)
> +#define  ICL_DRAM_WIDTH_X32			(0x2 << 7)
> +#define  ICL_DRAM_RANK_MASK			(0x3 << 9)
> +#define  ICL_DRAM_RANK_SHIFT			9
> +#define  ICL_DRAM_RANK_1			(0x0 << 9)
> +#define  ICL_DRAM_RANK_2			(0x1 << 9)
> +#define  ICL_DRAM_RANK_3			(0x2 << 9)
> +#define  ICL_DRAM_RANK_4			(0x3 << 9)
>  
>  #define SA_PERF_STATUS_0_0_0_MCHBAR_PC		_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5918)
>  #define  DG1_QCLK_RATIO_MASK			REG_GENMASK(9, 2)
> diff --git a/drivers/gpu/drm/i915/intel_dram.c b/drivers/gpu/drm/i915/intel_dram.c
> index 9675bb94b70b..34d6cf440352 100644
> --- a/drivers/gpu/drm/i915/intel_dram.c
> +++ b/drivers/gpu/drm/i915/intel_dram.c
> @@ -77,21 +77,21 @@ static int skl_get_dimm_ranks(u16 val)
>  }
>  
>  /* Returns total Gb for the whole DIMM */
> -static int cnl_get_dimm_size(u16 val)
> +static int icl_get_dimm_size(u16 val)
>  {
> -	return (val & CNL_DRAM_SIZE_MASK) * 8 / 2;
> +	return (val & ICL_DRAM_SIZE_MASK) * 8 / 2;
>  }
>  
> -static int cnl_get_dimm_width(u16 val)
> +static int icl_get_dimm_width(u16 val)
>  {
> -	if (cnl_get_dimm_size(val) == 0)
> +	if (icl_get_dimm_size(val) == 0)
>  		return 0;
>  
> -	switch (val & CNL_DRAM_WIDTH_MASK) {
> -	case CNL_DRAM_WIDTH_X8:
> -	case CNL_DRAM_WIDTH_X16:
> -	case CNL_DRAM_WIDTH_X32:
> -		val = (val & CNL_DRAM_WIDTH_MASK) >> CNL_DRAM_WIDTH_SHIFT;
> +	switch (val & ICL_DRAM_WIDTH_MASK) {
> +	case ICL_DRAM_WIDTH_X8:
> +	case ICL_DRAM_WIDTH_X16:
> +	case ICL_DRAM_WIDTH_X32:
> +		val = (val & ICL_DRAM_WIDTH_MASK) >> ICL_DRAM_WIDTH_SHIFT;
>  		return 8 << val;
>  	default:
>  		MISSING_CASE(val);
> @@ -99,12 +99,12 @@ static int cnl_get_dimm_width(u16 val)
>  	}
>  }
>  
> -static int cnl_get_dimm_ranks(u16 val)
> +static int icl_get_dimm_ranks(u16 val)
>  {
> -	if (cnl_get_dimm_size(val) == 0)
> +	if (icl_get_dimm_size(val) == 0)
>  		return 0;
>  
> -	val = (val & CNL_DRAM_RANK_MASK) >> CNL_DRAM_RANK_SHIFT;
> +	val = (val & ICL_DRAM_RANK_MASK) >> ICL_DRAM_RANK_SHIFT;
>  
>  	return val + 1;
>  }
> @@ -121,10 +121,10 @@ skl_dram_get_dimm_info(struct drm_i915_private *i915,
>  		       struct dram_dimm_info *dimm,
>  		       int channel, char dimm_name, u16 val)
>  {
> -	if (GRAPHICS_VER(i915) >= 10) {
> -		dimm->size = cnl_get_dimm_size(val);
> -		dimm->width = cnl_get_dimm_width(val);
> -		dimm->ranks = cnl_get_dimm_ranks(val);
> +	if (GRAPHICS_VER(i915) >= 11) {
> +		dimm->size = icl_get_dimm_size(val);
> +		dimm->width = icl_get_dimm_width(val);
> +		dimm->ranks = icl_get_dimm_ranks(val);
>  	} else {
>  		dimm->size = skl_get_dimm_size(val);
>  		dimm->width = skl_get_dimm_width(val);
> -- 
> 2.31.1
> 
