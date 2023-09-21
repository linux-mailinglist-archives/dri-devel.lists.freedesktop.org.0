Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC30E7A9236
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 09:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A21010E583;
	Thu, 21 Sep 2023 07:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E8A10E578;
 Thu, 21 Sep 2023 07:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695282109; x=1726818109;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Ed37zQnCWfoO/kSpTGBM5N+1IkbHVN/2Y1U3XhPBJzM=;
 b=EvWnh9Ui4gBTqlvZsn3JljxBvxhd7Ip4f928kIO/47VZhdKPu/+uJd7e
 l9v8kp6e8kxw2XBO/9tDdea20kf6d4NSwPeSqYjmcRmzSt+jfNZOCdGIg
 F7ALcsFiYQA7FS4lNeb4OV6RoJhFTegKZ/MuOpuxFFLAMAQaBVYV3lfxK
 RoPIxrqJRb28C3DfhatTdMFRng2dAMf/qUPI0xtZRAWaW+4BJjV4r2PAr
 6OWjItAICxWUlslYRwxE8bHnTXTMw03kwUUeJ6GmkXS0u8mQw3PI5jCte
 SYJwTU5AIuvMfnKAQFoSYSl5+MjcnRPIUDFwxAF8Tm3ydwyMYbgiJm7ox g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="444550899"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; d="scan'208";a="444550899"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 00:41:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="746977944"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; d="scan'208";a="746977944"
Received: from idubinov-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.52.72])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 00:41:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/8] drm/display/dp: Add helper function to get DSC bpp
 prescision
In-Reply-To: <20230913060606.1105349-2-mitulkumar.ajitkumar.golani@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230913060606.1105349-1-mitulkumar.ajitkumar.golani@intel.com>
 <20230913060606.1105349-2-mitulkumar.ajitkumar.golani@intel.com>
Date: Thu, 21 Sep 2023 10:41:43 +0300
Message-ID: <875y44q8g8.fsf@intel.com>
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
Cc: suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 swati2.sharma@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Sep 2023, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com> wrote:
> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>
> Add helper to get the DSC bits_per_pixel precision for the DP sink.
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Maarten, Maxime, Thomas, ack for merging this via drm-intel please?

BR,
Jani.

> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 27 +++++++++++++++++++++++++
>  include/drm/display/drm_dp_helper.h     |  1 +
>  2 files changed, 28 insertions(+)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 8a1b64c57dfd..5c23d5b8fc50 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2323,6 +2323,33 @@ int drm_dp_read_desc(struct drm_dp_aux *aux, struct drm_dp_desc *desc,
>  }
>  EXPORT_SYMBOL(drm_dp_read_desc);
>  
> +/**
> + * drm_dp_dsc_sink_bpp_incr() - Get bits per pixel increment
> + * @dsc_dpcd: DSC capabilities from DPCD
> + *
> + * Returns the bpp precision supported by the DP sink.
> + */
> +u8 drm_dp_dsc_sink_bpp_incr(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
> +{
> +	u8 bpp_increment_dpcd = dsc_dpcd[DP_DSC_BITS_PER_PIXEL_INC - DP_DSC_SUPPORT];
> +
> +	switch (bpp_increment_dpcd) {
> +	case DP_DSC_BITS_PER_PIXEL_1_16:
> +		return 16;
> +	case DP_DSC_BITS_PER_PIXEL_1_8:
> +		return 8;
> +	case DP_DSC_BITS_PER_PIXEL_1_4:
> +		return 4;
> +	case DP_DSC_BITS_PER_PIXEL_1_2:
> +		return 2;
> +	case DP_DSC_BITS_PER_PIXEL_1_1:
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_dp_dsc_sink_bpp_incr);
> +
>  /**
>   * drm_dp_dsc_sink_max_slice_count() - Get the max slice count
>   * supported by the DSC sink.
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 3369104e2d25..6968d4d87931 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -164,6 +164,7 @@ drm_dp_is_branch(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  }
>  
>  /* DP/eDP DSC support */
> +u8 drm_dp_dsc_sink_bpp_incr(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE]);
>  u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
>  				   bool is_edp);
>  u8 drm_dp_dsc_sink_line_buf_depth(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE]);

-- 
Jani Nikula, Intel
