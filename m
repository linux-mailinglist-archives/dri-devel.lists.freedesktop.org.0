Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6824F7027CA
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 11:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F37410E188;
	Mon, 15 May 2023 09:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8144010E188;
 Mon, 15 May 2023 09:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684141494; x=1715677494;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7KSgSl7VvqM4uEuMQ+UuwxKFoLryKVBWpDtLSR4ejjE=;
 b=kGUlWi8U3XrCgHkBt2HUVzUMIuIxVlPNFGWtPmwoXDQ+L1PeQZ5qpBCx
 BJC688fGa80DMQuObWF+zUaGsh6K7TRpEXV5LEABlE2Vmr6pw/IscC1he
 DXUHLySep0uIDhv/DWmWZdGAz5Lc/MerNqtP4k9IAYtDh17FcL1mfTdgp
 BWwd9pGkHPm3heRktkjNDnHAIke+XRkFIF0VxgdplHvqbf1aqMithNqCy
 0YRDAhUXuzUHErkfJqJ7FfRasbnUltmXBqNMAAUkvbTBv+PHDfbGKZtRd
 KCkh8kJxulbdm4CzjgrKh6kRmN9iUJJwcK6lGt0VL6ashjrNd7qcLWTeN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="335690072"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="335690072"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 02:04:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="1030826541"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="1030826541"
Received: from lveltman-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.42.56])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 02:04:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/fourcc: define Intel Meteorlake related ccs
 modifiers
In-Reply-To: <20230514184240.6184-1-juhapekka.heikkila@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230514184240.6184-1-juhapekka.heikkila@gmail.com>
Date: Mon, 15 May 2023 12:04:48 +0300
Message-ID: <875y8uj77z.fsf@intel.com>
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
Cc: Matt Atwood <matthew.s.atwood@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 14 May 2023, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com> wrote:
> Add Tile4 type ccs modifiers with aux buffer needed for MTL
>
> Bspec: 49251, 49252, 49253
> Cc: dri-devel@lists.freedesktop.org
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>

Thanks for the patches and review. Pushed via drm-intel-next with
Thomas' IRC ack.


BR,
Jani.


> ---
>  include/uapi/drm/drm_fourcc.h | 43 +++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index de703c6be969..8db7fd3f743e 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -657,6 +657,49 @@ extern "C" {
>   */
>  #define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC fourcc_mod_code(INTEL, 12)
>  
> +/*
> + * Intel Color Control Surfaces (CCS) for display ver. 14 render compression.
> + *
> + * The main surface is tile4 and at plane index 0, the CCS is linear and
> + * at index 1. A 64B CCS cache line corresponds to an area of 4x1 tiles in
> + * main surface. In other words, 4 bits in CCS map to a main surface cache
> + * line pair. The main surface pitch is required to be a multiple of four
> + * tile4 widths.
> + */
> +#define I915_FORMAT_MOD_4_TILED_MTL_RC_CCS fourcc_mod_code(INTEL, 13)
> +
> +/*
> + * Intel Color Control Surfaces (CCS) for display ver. 14 media compression
> + *
> + * The main surface is tile4 and at plane index 0, the CCS is linear and
> + * at index 1. A 64B CCS cache line corresponds to an area of 4x1 tiles in
> + * main surface. In other words, 4 bits in CCS map to a main surface cache
> + * line pair. The main surface pitch is required to be a multiple of four
> + * tile4 widths. For semi-planar formats like NV12, CCS planes follow the
> + * Y and UV planes i.e., planes 0 and 1 are used for Y and UV surfaces,
> + * planes 2 and 3 for the respective CCS.
> + */
> +#define I915_FORMAT_MOD_4_TILED_MTL_MC_CCS fourcc_mod_code(INTEL, 14)
> +
> +/*
> + * Intel Color Control Surface with Clear Color (CCS) for display ver. 14 render
> + * compression.
> + *
> + * The main surface is tile4 and is at plane index 0 whereas CCS is linear
> + * and at index 1. The clear color is stored at index 2, and the pitch should
> + * be ignored. The clear color structure is 256 bits. The first 128 bits
> + * represents Raw Clear Color Red, Green, Blue and Alpha color each represented
> + * by 32 bits. The raw clear color is consumed by the 3d engine and generates
> + * the converted clear color of size 64 bits. The first 32 bits store the Lower
> + * Converted Clear Color value and the next 32 bits store the Higher Converted
> + * Clear Color value when applicable. The Converted Clear Color values are
> + * consumed by the DE. The last 64 bits are used to store Color Discard Enable
> + * and Depth Clear Value Valid which are ignored by the DE. A CCS cache line
> + * corresponds to an area of 4x1 tiles in the main surface. The main surface
> + * pitch is required to be a multiple of 4 tile widths.
> + */
> +#define I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC fourcc_mod_code(INTEL, 15)
> +
>  /*
>   * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
>   *

-- 
Jani Nikula, Intel Open Source Graphics Center
