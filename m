Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4348F219DA6
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 12:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33C06E0EE;
	Thu,  9 Jul 2020 10:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA9E6E0EE;
 Thu,  9 Jul 2020 10:22:39 +0000 (UTC)
IronPort-SDR: geK/lhSlSkqZoNNGiRmRkVUE6tQGjetJ2AwUqmmR3R0fUR7wPPhzTZ4FnBGiWok+7gLLBNpuax
 NkjqLNIL11pw==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="212886846"
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="212886846"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 03:22:38 -0700
IronPort-SDR: J48x0LA7P0MPLaMTk9HmRqE8y5TCVNmCEyC769WTDFIiL6O+hUVaYCso05p4id0GKTXeToj5Wz
 aXmd7H3qS+mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="314918250"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by orsmga008.jf.intel.com with ESMTP; 09 Jul 2020 03:22:35 -0700
Date: Thu, 9 Jul 2020 15:46:26 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v7 10/17] drm/i915: Support DP MST in enc_to_dig_port()
 function
Message-ID: <20200709101626.GC13481@intel.com>
References: <20200623155907.22961-1-sean@poorly.run>
 <20200623155907.22961-11-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200623155907.22961-11-sean@poorly.run>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 juston.li@intel.com, rodrigo.vivi@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-06-23 at 11:59:00 -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Although DP_MST fake encoders are not subclassed from digital ports,
> they are associated with them. Support these encoders.
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>

> Link: https://patchwork.freedesktop.org/patch/msgid/20191203173638.94919-9-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20191212190230.188505-10-sean@poorly.run #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20200117193103.156821-10-sean@poorly.run #v3
> Link: https://patchwork.freedesktop.org/patch/msgid/20200218220242.107265-10-sean@poorly.run #v4
> Link: https://patchwork.freedesktop.org/patch/msgid/20200305201236.152307-10-sean@poorly.run #v5
> Link: https://patchwork.freedesktop.org/patch/msgid/20200429195502.39919-10-sean@poorly.run #v6
> 
> Changes in v2:
> -None
> Changes in v3:
> -None
> Changes in v4:
> -None
> Changes in v5:
> -None
> Changes in v6:
> -None
> Changes in v7:
> -None
> ---
>  .../drm/i915/display/intel_display_types.h    | 21 ++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 1503403a808b..811085ef3fba 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1525,6 +1525,18 @@ static inline bool intel_encoder_is_dig_port(struct intel_encoder *encoder)
>  	}
>  }
>  
> +static inline bool intel_encoder_is_mst(struct intel_encoder *encoder)
> +{
> +	return encoder->type == INTEL_OUTPUT_DP_MST;
> +}
> +
> +static inline struct intel_dp_mst_encoder *
> +enc_to_mst(struct intel_encoder *encoder)
> +{
> +	return container_of(&encoder->base, struct intel_dp_mst_encoder,
> +			    base.base);
> +}
> +
>  static inline struct intel_digital_port *
>  enc_to_dig_port(struct intel_encoder *encoder)
>  {
> @@ -1533,6 +1545,8 @@ enc_to_dig_port(struct intel_encoder *encoder)
>  	if (intel_encoder_is_dig_port(intel_encoder))
>  		return container_of(&encoder->base, struct intel_digital_port,
>  				    base.base);
> +	else if (intel_encoder_is_mst(intel_encoder))
> +		return enc_to_mst(encoder)->primary;
>  	else
>  		return NULL;
>  }
> @@ -1543,13 +1557,6 @@ intel_attached_dig_port(struct intel_connector *connector)
>  	return enc_to_dig_port(intel_attached_encoder(connector));
>  }
>  
> -static inline struct intel_dp_mst_encoder *
> -enc_to_mst(struct intel_encoder *encoder)
> -{
> -	return container_of(&encoder->base, struct intel_dp_mst_encoder,
> -			    base.base);
> -}
> -
>  static inline struct intel_dp *enc_to_intel_dp(struct intel_encoder *encoder)
>  {
>  	return &enc_to_dig_port(encoder)->dp;
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
