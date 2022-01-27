Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 568DC49DB78
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 08:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0822E10E5F6;
	Thu, 27 Jan 2022 07:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2424710E5F5;
 Thu, 27 Jan 2022 07:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643268471; x=1674804471;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=48KY+JH0Ds+OtCfo/uNHU5EJ9RilGyVqQiz50n7G0R8=;
 b=oEgrFHak6T7YpKJmwefyFhTSqaQLkv1qi36XrL309Tlz4Ue7yzdG+xg3
 OR3H1L3BtqIem/LFDnd/QfyhmkVp02+VcBQ9hNTaoI3VsYGMeu4qYPEcx
 06D6NU4CrUi1Xbt9HrkV5qPO6JzX3QEQWq1vqn6oLmCIIVsMqCIGoG/xw
 DLrnf6eiPHDZt0hyO2DkqEGjCSZ2ILR9/xoJCt6NZkZtGwXYRV8AFOa4e
 j9ZR+2qwTnogyiPA+4xTftAJM8wefdDmZUzQIFF7emdMBxWrorg2eLoPc
 avcqr5N3iNu6K1FemdxR4nRn6y+bOnB+j8/51CPuHq44WAt4GsUQNUyzk A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="333128990"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="333128990"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 23:26:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="533020091"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.147])
 by fmsmga007.fm.intel.com with SMTP; 26 Jan 2022 23:26:35 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 27 Jan 2022 09:26:34 +0200
Date: Thu, 27 Jan 2022 09:26:34 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 1/8] drm/dp: add drm_dp_128b132b_read_aux_rd_interval()
Message-ID: <YfJJKmKH64MKrg7C@intel.com>
References: <cover.1643130139.git.jani.nikula@intel.com>
 <46401f9df30907ba851b68d7772740d64fc6ee83.1643130139.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46401f9df30907ba851b68d7772740d64fc6ee83.1643130139.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
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
Cc: intel-gfx@lists.freedesktop.org, uma.shankar@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 25, 2022 at 07:03:39PM +0200, Jani Nikula wrote:
> The DP 2.0 errata changes DP_128B132B_TRAINING_AUX_RD_INTERVAL (DPCD
> 0x2216) completely. Add a new function to read that. Follow-up will need
> to clean up existing functions.
> 
> v2: fix reversed interpretation of bit 7 meaning (Uma)
> 
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/dp/drm_dp.c    | 20 ++++++++++++++++++++
>  include/drm/dp/drm_dp_helper.h |  3 +++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/dp/drm_dp.c b/drivers/gpu/drm/dp/drm_dp.c
> index 6d43325acca5..52c6da510142 100644
> --- a/drivers/gpu/drm/dp/drm_dp.c
> +++ b/drivers/gpu/drm/dp/drm_dp.c
> @@ -281,6 +281,26 @@ int drm_dp_read_channel_eq_delay(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIV
>  }
>  EXPORT_SYMBOL(drm_dp_read_channel_eq_delay);
>  
> +/* Per DP 2.0 Errata */
> +int drm_dp_128b132b_read_aux_rd_interval(struct drm_dp_aux *aux)
> +{
> +	int unit;
> +	u8 val;
> +
> +	if (drm_dp_dpcd_readb(aux, DP_128B132B_TRAINING_AUX_RD_INTERVAL, &val) != 1) {
> +		drm_err(aux->drm_dev, "%s: failed rd interval read\n",
> +			aux->name);
> +		/* default to max */
> +		val = DP_128B132B_TRAINING_AUX_RD_INTERVAL_MASK;
> +	}
> +
> +	unit = (val & DP_128B132B_TRAINING_AUX_RD_INTERVAL_1MS_UNIT) ? 1 : 2;
> +	val &= DP_128B132B_TRAINING_AUX_RD_INTERVAL_MASK;
> +
> +	return (val + 1) * unit * 1000;
> +}
> +EXPORT_SYMBOL(drm_dp_128b132b_read_aux_rd_interval);
> +
>  void drm_dp_link_train_clock_recovery_delay(const struct drm_dp_aux *aux,
>  					    const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  {
> diff --git a/include/drm/dp/drm_dp_helper.h b/include/drm/dp/drm_dp_helper.h
> index 98d020835b49..aa73dfc817ff 100644
> --- a/include/drm/dp/drm_dp_helper.h
> +++ b/include/drm/dp/drm_dp_helper.h
> @@ -1112,6 +1112,7 @@ struct drm_panel;
>  # define DP_UHBR13_5                           (1 << 2)
>  
>  #define DP_128B132B_TRAINING_AUX_RD_INTERVAL                    0x2216 /* 2.0 */
> +# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_1MS_UNIT          (1 << 7)
>  # define DP_128B132B_TRAINING_AUX_RD_INTERVAL_MASK              0x7f
>  # define DP_128B132B_TRAINING_AUX_RD_INTERVAL_400_US            0x00
>  # define DP_128B132B_TRAINING_AUX_RD_INTERVAL_4_MS              0x01
> @@ -1549,6 +1550,8 @@ void drm_dp_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
>  void drm_dp_lttpr_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
>  					      const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
>  
> +int drm_dp_128b132b_read_aux_rd_interval(struct drm_dp_aux *aux);
> +
>  u8 drm_dp_link_rate_to_bw_code(int link_rate);
>  int drm_dp_bw_code_to_link_rate(u8 link_bw);
>  
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
