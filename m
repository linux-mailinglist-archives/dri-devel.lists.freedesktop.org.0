Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D3F3183F9
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 04:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E0F6EDDE;
	Thu, 11 Feb 2021 03:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F546EDDD;
 Thu, 11 Feb 2021 03:30:16 +0000 (UTC)
IronPort-SDR: 7TTNFDtvBxc6l1Jf7HGf4+O9CammiaQPU9NnNbKysHv76+Aehenuib5dnRfpwezpke//y9+Uxu
 p/1sptp0Y8Jw==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="243676699"
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="243676699"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 19:30:15 -0800
IronPort-SDR: 1EwnGt/b8p4IoblknDgapz3hDLweTqv2QFuRsoGHgoXH+J2/gBFi1FH/uLk0JmvVVsImymaVIQ
 LKhCKwTy5W2w==
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="586827240"
Received: from rontiver-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.212.99.95])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 19:30:14 -0800
Date: Wed, 10 Feb 2021 22:30:13 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [Intel-gfx] [PATCH v5 2/4] drm/i915/gen9_bc: Introduce TGP PCH
 DDC pin mappings
Message-ID: <20210211033013.GE82362@intel.com>
References: <20210209212832.1401815-1-lyude@redhat.com>
 <20210209212832.1401815-3-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210209212832.1401815-3-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Yijun Shen <Yijun.Shen@dell.com>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 09, 2021 at 04:28:29PM -0500, Lyude Paul wrote:
> With the introduction of gen9_bc, where Intel combines Cometlake CPUs with
> a Tigerpoint PCH, we'll need to introduce new DDC pin mappings for this
> platform in order to make all of the display connectors work. So, let's do
> that.
> 
> Changes since v4:
> * Split this into it's own patch - vsyrjala
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> [originally from Tejas's work]
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_bios.c |  9 +++++++++
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 20 ++++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
> index 7118530a1c38..1289f9d437e4 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -1638,6 +1638,12 @@ static const u8 adls_ddc_pin_map[] = {
>  	[ADLS_DDC_BUS_PORT_TC4] = GMBUS_PIN_12_TC4_ICP,
>  };
>  
> +static const u8 gen9bc_tgp_ddc_pin_map[] = {
> +	[DDC_BUS_DDI_B] = GMBUS_PIN_2_BXT,
> +	[DDC_BUS_DDI_C] = GMBUS_PIN_9_TC1_ICP,
> +	[DDC_BUS_DDI_D] = GMBUS_PIN_10_TC2_ICP,
> +};
> +
>  static u8 map_ddc_pin(struct drm_i915_private *dev_priv, u8 vbt_pin)
>  {
>  	const u8 *ddc_pin_map;
> @@ -1651,6 +1657,9 @@ static u8 map_ddc_pin(struct drm_i915_private *dev_priv, u8 vbt_pin)
>  	} else if (IS_ROCKETLAKE(dev_priv) && INTEL_PCH_TYPE(dev_priv) == PCH_TGP) {
>  		ddc_pin_map = rkl_pch_tgp_ddc_pin_map;
>  		n_entries = ARRAY_SIZE(rkl_pch_tgp_ddc_pin_map);
> +	} else if (HAS_PCH_TGP(dev_priv) && IS_GEN9_BC(dev_priv)) {
> +		ddc_pin_map = gen9bc_tgp_ddc_pin_map;
> +		n_entries = ARRAY_SIZE(gen9bc_tgp_ddc_pin_map);
>  	} else if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP) {
>  		ddc_pin_map = icp_ddc_pin_map;
>  		n_entries = ARRAY_SIZE(icp_ddc_pin_map);
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index dad54e116bc4..49528d07c7f3 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -3138,6 +3138,24 @@ static u8 rkl_port_to_ddc_pin(struct drm_i915_private *dev_priv, enum port port)
>  	return GMBUS_PIN_1_BXT + phy;
>  }
>  
> +static u8 gen9bc_port_to_ddc_pin(struct drm_i915_private *i915, enum port port)
> +{
> +	enum phy phy = intel_port_to_phy(i915, port);
> +
> +	drm_WARN_ON(&i915->drm, port == PORT_A);
> +
> +	/*
> +	 * Pin mapping for GEN9 BC depends on which PCH is present.  With TGP,
> +	 * final two outputs use type-c pins, even though they're actually
> +	 * combo outputs.  With CMP, the traditional DDI A-D pins are used for
> +	 * all outputs.
> +	 */
> +	if (INTEL_PCH_TYPE(i915) >= PCH_TGP && phy >= PHY_C)
> +		return GMBUS_PIN_9_TC1_ICP + phy - PHY_C;
> +
> +	return GMBUS_PIN_1_BXT + phy;
> +}
> +
>  static u8 dg1_port_to_ddc_pin(struct drm_i915_private *dev_priv, enum port port)
>  {
>  	return intel_port_to_phy(dev_priv, port) + 1;
> @@ -3202,6 +3220,8 @@ static u8 intel_hdmi_ddc_pin(struct intel_encoder *encoder)
>  		ddc_pin = dg1_port_to_ddc_pin(dev_priv, port);
>  	else if (IS_ROCKETLAKE(dev_priv))
>  		ddc_pin = rkl_port_to_ddc_pin(dev_priv, port);
> +	else if (IS_GEN9_BC(dev_priv) && HAS_PCH_TGP(dev_priv))
> +		ddc_pin = gen9bc_port_to_ddc_pin(dev_priv, port);

what about also calling this function gen9bc_tgp_ ?

but up to you...
this version is much better without the if gen9 inside a "tgp" func...
thanks

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  	else if (HAS_PCH_MCC(dev_priv))
>  		ddc_pin = mcc_port_to_ddc_pin(dev_priv, port);
>  	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
> -- 
> 2.29.2
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
