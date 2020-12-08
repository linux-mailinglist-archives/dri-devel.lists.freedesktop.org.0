Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C2E2D331C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 21:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B6D6E9BA;
	Tue,  8 Dec 2020 20:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1FD6E9BA;
 Tue,  8 Dec 2020 20:21:48 +0000 (UTC)
IronPort-SDR: HkQRgDd/qwshV8QjO4yOHEPxhOBHNBR+FhNbDvDL4top0gSRaQ9Hm62TAlTvogSzuCA3e/CJSe
 vdsQxsdh3uIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="153203533"
X-IronPort-AV: E=Sophos;i="5.78,403,1599548400"; d="scan'208";a="153203533"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 12:21:47 -0800
IronPort-SDR: tkKZu7JFX0upUa1i6V0QRI/qbe6crXuDVJ9rq5lpKeli6ycNk9UGwQg4Li9mzHc2Tp6RA3uxUA
 ezQmlxL97ZEA==
X-IronPort-AV: E=Sophos;i="5.78,403,1599548400"; d="scan'208";a="332656720"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO labuser-Z97X-UD5H)
 ([10.165.21.211])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 12:21:47 -0800
Date: Tue, 8 Dec 2020 12:24:56 -0800
From: "Navare, Manasi" <manasi.d.navare@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 3/6] drm/i915/dsc: make rc_model_size an encoder defined
 value
Message-ID: <20201208202456.GC474@labuser-Z97X-UD5H>
References: <cover.1607429866.git.jani.nikula@intel.com>
 <6843c4f6958619f7389180aa92fded7b9fdbb4ba.1607429866.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6843c4f6958619f7389180aa92fded7b9fdbb4ba.1607429866.git.jani.nikula@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 08, 2020 at 02:33:52PM +0200, Jani Nikula wrote:
> Move the intialization of the rc_model_size from the common code into
> encoder code, allowing different encoders to specify the size according
> to their needs. Keep using the hard coded value in the encoders for now
> to make this a non-functional change.
> 
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

So still using the hardcoded value since thats in the DSC C model, Looks good to me

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Manasi

> ---
>  drivers/gpu/drm/i915/display/icl_dsi.c    | 3 +++
>  drivers/gpu/drm/i915/display/intel_dp.c   | 8 ++++++++
>  drivers/gpu/drm/i915/display/intel_vdsc.c | 2 --
>  3 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
> index a9439b415603..676e40172fe9 100644
> --- a/drivers/gpu/drm/i915/display/icl_dsi.c
> +++ b/drivers/gpu/drm/i915/display/icl_dsi.c
> @@ -1535,6 +1535,9 @@ static int gen11_dsi_dsc_compute_config(struct intel_encoder *encoder,
>  
>  	vdsc_cfg->convert_rgb = true;
>  
> +	/* FIXME: initialize from VBT */
> +	vdsc_cfg->rc_model_size = DSC_RC_MODEL_SIZE_CONST;
> +
>  	ret = intel_dsc_compute_params(encoder, crtc_state);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index cb5e42c3ecd5..b2bc0c8c39c7 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2289,6 +2289,14 @@ static int intel_dp_dsc_compute_params(struct intel_encoder *encoder,
>  	u8 line_buf_depth;
>  	int ret;
>  
> +	/*
> +	 * RC_MODEL_SIZE is currently a constant across all configurations.
> +	 *
> +	 * FIXME: Look into using sink defined DPCD DP_DSC_RC_BUF_BLK_SIZE and
> +	 * DP_DSC_RC_BUF_SIZE for this.
> +	 */
> +	vdsc_cfg->rc_model_size = DSC_RC_MODEL_SIZE_CONST;
> +
>  	ret = intel_dsc_compute_params(encoder, crtc_state);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
> index 22d08679844f..f58cc5700784 100644
> --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
> +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
> @@ -454,8 +454,6 @@ int intel_dsc_compute_params(struct intel_encoder *encoder,
>  	else if (vdsc_cfg->bits_per_component == 12)
>  		vdsc_cfg->mux_word_size = DSC_MUX_WORD_SIZE_12_BPC;
>  
> -	/* RC_MODEL_SIZE is a constant across all configurations */
> -	vdsc_cfg->rc_model_size = DSC_RC_MODEL_SIZE_CONST;
>  	/* InitialScaleValue is a 6 bit value with 3 fractional bits (U3.3) */
>  	vdsc_cfg->initial_scale_value = (vdsc_cfg->rc_model_size << 3) /
>  		(vdsc_cfg->rc_model_size - vdsc_cfg->initial_offset);
> -- 
> 2.20.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
