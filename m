Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D314475CB8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 17:06:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B1710E609;
	Wed, 15 Dec 2021 16:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F4710E609;
 Wed, 15 Dec 2021 16:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639584401; x=1671120401;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=W54hTN2mly0nwR3o6HlPrA1e+g/Y/HuMMTx8dSSZOwk=;
 b=gYdOH/rY03lLwWvsuj3XrRTTj1wAj2J1FC4dqTnSn3Y+vqRaGR9R7T3R
 VZSpJueOco3Ow80d4V0RnNTbXOaDv4DOOimctkGkKpeGXu4jCUxMfGSLA
 OEdKXPOz1NZL8Y41aUgrVLLZSOBKEk/xSPd/1TJfQ4mmpQ7MzGbXlM9aZ
 qzX3yjv8T4XbtK7bt0oNycW6QqGs3BOpqYfzxLCu8CHlX9wFK0TKXfWNm
 8J1ghO/sKuEet1g+QPVvK2V5/C4DCejpNoQWddqo7lrt2cq5p79KJPFUq
 R9cXbEmS8b7anEc+1IAFAirYdgRDya7Zm1n8F9ZzcGcyV3vvKAxvzc2pG A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="226540944"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="226540944"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 08:06:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="661967155"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga001.fm.intel.com with ESMTP; 15 Dec 2021 08:06:39 -0800
Received: from [10.252.36.229] (harrasse-mobl.ger.corp.intel.com
 [10.252.36.229])
 by linux.intel.com (Postfix) with ESMTP id 668E0580C24;
 Wed, 15 Dec 2021 08:06:38 -0800 (PST)
Message-ID: <3dfd15a5-baa0-9673-60fb-8999f5c9b9e9@intel.com>
Date: Wed, 15 Dec 2021 18:06:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [Intel-gfx] [PATCH v4 12/16] uapi/drm/dg2: Introduce format
 modifier for DG2 clear color
Content-Language: en-US
To: Ramalingam C <ramalingam.c@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
References: <20211209154533.4084-1-ramalingam.c@intel.com>
 <20211209154533.4084-13-ramalingam.c@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20211209154533.4084-13-ramalingam.c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Nanley Chery <nanley.g.chery@intel.com>, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/12/2021 17:45, Ramalingam C wrote:
> From: Mika Kahola <mika.kahola@intel.com>
>
> DG2 clear color render compression uses Tile4 layout. Therefore, we need
> to define a new format modifier for uAPI to support clear color rendering.
>
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_fb.c            | 8 ++++++++
>   drivers/gpu/drm/i915/display/skl_universal_plane.c | 9 ++++++++-
>   include/uapi/drm/drm_fourcc.h                      | 8 ++++++++
>   3 files changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> index e15216f1cb82..f10e77cb5b4a 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -144,6 +144,12 @@ static const struct intel_modifier_desc intel_modifiers[] = {
>   		.modifier = I915_FORMAT_MOD_4_TILED_DG2_MC_CCS,
>   		.display_ver = { 13, 14 },
>   		.plane_caps = INTEL_PLANE_CAP_TILING_4 | INTEL_PLANE_CAP_CCS_MC,
> +	}, {
> +		.modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC,
> +		.display_ver = { 13, 14 },
> +		.plane_caps = INTEL_PLANE_CAP_TILING_4 | INTEL_PLANE_CAP_CCS_RC_CC,
> +
> +		.ccs.cc_planes = BIT(1),
>   	}, {
>   		.modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS,
>   		.display_ver = { 13, 14 },
> @@ -559,6 +565,7 @@ intel_tile_width_bytes(const struct drm_framebuffer *fb, int color_plane)
>   		else
>   			return 512;
>   	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
> +	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
>   	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
>   	case I915_FORMAT_MOD_4_TILED:
>   		/*
> @@ -763,6 +770,7 @@ unsigned int intel_surf_alignment(const struct drm_framebuffer *fb,
>   	case I915_FORMAT_MOD_Yf_TILED:
>   		return 1 * 1024 * 1024;
>   	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
> +	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
>   	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
>   		return 16 * 1024;
>   	default:
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index d80424194c75..9a89df9c0243 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -772,6 +772,8 @@ static u32 skl_plane_ctl_tiling(u64 fb_modifier)
>   		return PLANE_CTL_TILED_4 |
>   			PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE |
>   			PLANE_CTL_CLEAR_COLOR_DISABLE;
> +	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
> +		return PLANE_CTL_TILED_4 | PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
>   	case I915_FORMAT_MOD_Y_TILED_CCS:
>   	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
>   		return PLANE_CTL_TILED_Y | PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
> @@ -2337,10 +2339,15 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
>   		break;
>   	case PLANE_CTL_TILED_YF: /* aka PLANE_CTL_TILED_4 on XE_LPD+ */
>   		if (HAS_4TILE(dev_priv)) {
> -			if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
> +			u32 rc_mask = PLANE_CTL_RENDER_DECOMPRESSION_ENABLE |
> +				      PLANE_CTL_CLEAR_COLOR_DISABLE;
> +
> +			if ((val & rc_mask) == rc_mask)
>   				fb->modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS;
>   			else if (val & PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE)
>   				fb->modifier = I915_FORMAT_MOD_4_TILED_DG2_MC_CCS;
> +			else if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
> +				fb->modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC;
>   			else
>   				fb->modifier = I915_FORMAT_MOD_4_TILED;
>   		} else {
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 51fdda26844a..b155f69f2344 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -598,6 +598,14 @@ extern "C" {
>    */
>   #define I915_FORMAT_MOD_4_TILED_DG2_MC_CCS fourcc_mod_code(INTEL, 11)
>   

My colleague Nanley (Cc) had some requests for clarifications on this 
new modifier.

In particular in which plane is the clear color located.


I guess it wouldn't hurt to also state for each of the new modifiers 
defined in this series, how many planes and what data they contain.

Thanks,

-Lionel


> +/*
> + * Intel color control surfaces (CCS) for DG2 clear color render compression.
> + *
> + * DG2 uses a unified compression format for clear color render compression.
> + * The general layout is a tiled layout using 4Kb tiles i.e. Tile4 layout.
> + */
> +#define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC fourcc_mod_code(INTEL, 12)
> +
>   /*
>    * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
>    *


