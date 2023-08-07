Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D73CF772369
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 14:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F67510E076;
	Mon,  7 Aug 2023 12:07:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909C310E081;
 Mon,  7 Aug 2023 12:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691410022; x=1722946022;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RcMEhXQ/HmbNkuAed7SJg2Y2J9QAR+kr0mptxAhr7l0=;
 b=V1ModR702igIuCOBofg2eTmz4n/9em1oO4xdYEChQ+bEEmraIniY1PzM
 uAtpnZBSP6rTPwpMRnWHQQFzH0P2MfQgKKCMMkD51RW3Rhyima+2oDLXw
 uqmFwLHeDfspBbBR+n/6P8e4XXDw561ek0z7Tq4a6/yodbimemi33sBxT
 zie0LRPilCwZrwPQAwuvsxzxBqiZ1WWUJtdmt6QVsjSIB0TTbHkbl0rQT
 JFPK7oc1Kd+oAK3B/R6PZsB18O66AnxX5LxEzo+OuuKZRhh/wjy/hsK4O
 18JUU/yA/pjlvMPNqCxQku7b7OeCDD/LZvRCE+7iY5zYQURZ4b8aVGLg2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="436857030"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; d="scan'208";a="436857030"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 05:07:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="707847351"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; d="scan'208";a="707847351"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 05:06:59 -0700
Date: Mon, 7 Aug 2023 15:06:51 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 13/20] drm/i915/dp: Rename helper to get DSC max pipe_bpp
Message-ID: <ZNDeW8cOBPPFTrIn@intel.com>
References: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
 <20230728041150.2524032-14-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728041150.2524032-14-ankit.k.nautiyal@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, anusha.srivatsa@intel.com,
 dri-devel@lists.freedesktop.org, navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 28, 2023 at 09:41:43AM +0530, Ankit Nautiyal wrote:
> The helper intel_dp_dsc_compute_bpp gives the maximum
> pipe bpp that is allowed with DSC.
> 
> Rename the this to reflect that it returns max pipe bpp supported
> with DSC.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c     | 8 ++++----
>  drivers/gpu/drm/i915/display/intel_dp.h     | 2 +-
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index c1eb0d1e229e..6228cfc44055 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1183,7 +1183,7 @@ intel_dp_mode_valid(struct drm_connector *_connector,
>  		 * TBD pass the connector BPC,
>  		 * for now U8_MAX so that max BPC on that platform would be picked
>  		 */
> -		pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, U8_MAX);
> +		pipe_bpp = intel_dp_dsc_compute_max_bpp(intel_dp, U8_MAX);
>  
>  		/*
>  		 * Output bpp is stored in 6.4 format so right shift by 4 to get the
> @@ -1543,7 +1543,7 @@ u8 intel_dp_dsc_max_src_input_bpc(struct drm_i915_private *i915)
>  	return 0;
>  }
>  
> -int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 max_req_bpc)
> +int intel_dp_dsc_compute_max_bpp(struct intel_dp *intel_dp, u8 max_req_bpc)
>  {
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  	int i, num_bpc;
> @@ -1734,8 +1734,8 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
>  				 "Cannot force DSC BPC:%d, due to DSC BPC limits\n",
>  				 intel_dp->force_dsc_bpc);
>  
> -			pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp,
> -							    conn_state->max_requested_bpc);
> +			pipe_bpp = intel_dp_dsc_compute_max_bpp(intel_dp,
> +								conn_state->max_requested_bpc);
>  
>  			if (!is_dsc_pipe_bpp_sufficient(dev_priv, pipe_bpp)) {
>  				drm_dbg_kms(&dev_priv->drm,
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
> index 6fd423463f5c..788a577ebe16 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -106,7 +106,7 @@ void intel_read_dp_sdp(struct intel_encoder *encoder,
>  		       struct intel_crtc_state *crtc_state,
>  		       unsigned int type);
>  bool intel_digital_port_connected(struct intel_encoder *encoder);
> -int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 dsc_max_bpc);
> +int intel_dp_dsc_compute_max_bpp(struct intel_dp *intel_dp, u8 dsc_max_bpc);
>  u16 intel_dp_dsc_get_max_compressed_bpp(struct drm_i915_private *i915,
>  					u32 link_clock, u32 lane_count,
>  					u32 mode_clock, u32 mode_hdisplay,
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 4895d6242915..3eb085fbc7c8 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -971,7 +971,7 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
>  		 * TBD pass the connector BPC,
>  		 * for now U8_MAX so that max BPC on that platform would be picked
>  		 */
> -		int pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, U8_MAX);
> +		int pipe_bpp = intel_dp_dsc_compute_max_bpp(intel_dp, U8_MAX);
>  
>  		if (drm_dp_sink_supports_fec(intel_dp->fec_capable)) {
>  			dsc_max_compressed_bpp =
> -- 
> 2.40.1
> 
