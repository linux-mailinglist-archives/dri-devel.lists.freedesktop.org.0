Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E854BA620
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 17:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1754510EB16;
	Thu, 17 Feb 2022 16:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BEB410EAE5;
 Thu, 17 Feb 2022 16:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645115870; x=1676651870;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6Xy61DIHX0kxct2ivOPeTDsfFzfXldUx8w9E3e+98OM=;
 b=Ly7nYTE9P6kT8dXrGRBEI7pCZ/pqnwihPB9QMjQM+nQG7xHoJYHC9TLa
 npbgqpKdsBvhgw+MsOo0vU0ZMF2R0qGhkaE/AWikCfsgZJJMNwuqMuuYX
 B2P8wBOvvQ0dvh70g0H6uQfXPDO2VdYrKoMVV6CSkBIna9m6aW9/E8MS9
 //aYlMB/wEat4TieGjUMwsBhRkizXpsolFkdg8CwHb65ixeG+hXYdDOqM
 FBKPJ+d2pahgwnJyFoThOSFCiLS3UFy/8BVz+WrX7fo9LQYZ79Dq2fVSk
 mPvdZtfqlbTt1+A89rCP2yGGYezs22zTvxAH8QVeVrLQW1xLZb1+uJoYy Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="250858248"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="250858248"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 08:37:49 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="589548167"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 08:37:48 -0800
Date: Thu, 17 Feb 2022 08:37:47 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH 1/3] drm/i915/dg2: Enable 5th display
Message-ID: <Yg552yKPy9nhDWIH@mdroper-desk1.amr.corp.intel.com>
References: <20220215055154.15363-1-ramalingam.c@intel.com>
 <20220215055154.15363-2-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220215055154.15363-2-ramalingam.c@intel.com>
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
Cc: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Shankar Uma <uma.shankar@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since it apparently caused some confusion on various websites, maybe we
should change the title of the patch to "Enable 5th port" to make it
more clear that this is only a port, not a pipe.

Also, I believe one last line that we need to add to this patch is an
intel_ddi_init() call for TC1 in the intel_setup_outputs() function.  I
think I previously had that in a separate patch, but it went missing
when we reorganized and refactored some of these patches


Matt

On Tue, Feb 15, 2022 at 11:21:52AM +0530, Ramalingam C wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> DG2 supports a 5th display output which the hardware refers to as "TC1,"
> even though it isn't a Type-C output.  This behaves similarly to the TC1
> on past platforms with just a couple minor differences:
> 
>  * DG2's TC1 bit in SDEISR is at bit 25 rather than 24 as it is on
>    ICP/TGP/ADP.
>  * DG2 doesn't need the hpd inversion setting that we had to use on DG1
> 
> Cc: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_gmbus.c | 16 ++++++++++++++--
>  drivers/gpu/drm/i915/i915_irq.c            |  5 ++++-
>  drivers/gpu/drm/i915/i915_reg.h            |  1 +
>  3 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
> index 6ce8c10fe975..2fad03250661 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -98,11 +98,21 @@ static const struct gmbus_pin gmbus_pins_dg1[] = {
>  	[GMBUS_PIN_4_CNP] = { "dpd", GPIOE },
>  };
>  
> +static const struct gmbus_pin gmbus_pins_dg2[] = {
> +	[GMBUS_PIN_1_BXT] = { "dpa", GPIOB },
> +	[GMBUS_PIN_2_BXT] = { "dpb", GPIOC },
> +	[GMBUS_PIN_3_BXT] = { "dpc", GPIOD },
> +	[GMBUS_PIN_4_CNP] = { "dpd", GPIOE },
> +	[GMBUS_PIN_9_TC1_ICP] = { "tc1", GPIOJ },
> +};
> +
>  /* pin is expected to be valid */
>  static const struct gmbus_pin *get_gmbus_pin(struct drm_i915_private *dev_priv,
>  					     unsigned int pin)
>  {
> -	if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
> +	if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG2)
> +		return &gmbus_pins_dg2[pin];
> +	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
>  		return &gmbus_pins_dg1[pin];
>  	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
>  		return &gmbus_pins_icp[pin];
> @@ -123,7 +133,9 @@ bool intel_gmbus_is_valid_pin(struct drm_i915_private *dev_priv,
>  {
>  	unsigned int size;
>  
> -	if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
> +	if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG2)
> +		size = ARRAY_SIZE(gmbus_pins_dg2);
> +	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
>  		size = ARRAY_SIZE(gmbus_pins_dg1);
>  	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
>  		size = ARRAY_SIZE(gmbus_pins_icp);
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index fdd568ba4a16..4d81063b128c 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -179,6 +179,7 @@ static const u32 hpd_sde_dg1[HPD_NUM_PINS] = {
>  	[HPD_PORT_B] = SDE_DDI_HOTPLUG_ICP(HPD_PORT_B),
>  	[HPD_PORT_C] = SDE_DDI_HOTPLUG_ICP(HPD_PORT_C),
>  	[HPD_PORT_D] = SDE_DDI_HOTPLUG_ICP(HPD_PORT_D),
> +	[HPD_PORT_TC1] = SDE_TC_HOTPLUG_DG2(HPD_PORT_TC1),
>  };
>  
>  static void intel_hpd_init_pins(struct drm_i915_private *dev_priv)
> @@ -4424,7 +4425,9 @@ void intel_irq_init(struct drm_i915_private *dev_priv)
>  		if (I915_HAS_HOTPLUG(dev_priv))
>  			dev_priv->hotplug_funcs = &i915_hpd_funcs;
>  	} else {
> -		if (HAS_PCH_DG1(dev_priv))
> +		if (HAS_PCH_DG2(dev_priv))
> +			dev_priv->hotplug_funcs = &icp_hpd_funcs;
> +		else if (HAS_PCH_DG1(dev_priv))
>  			dev_priv->hotplug_funcs = &dg1_hpd_funcs;
>  		else if (DISPLAY_VER(dev_priv) >= 11)
>  			dev_priv->hotplug_funcs = &gen11_hpd_funcs;
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 4ea1713e6b60..4d12abb2d7ff 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -6182,6 +6182,7 @@
>  /* south display engine interrupt: ICP/TGP */
>  #define SDE_GMBUS_ICP			(1 << 23)
>  #define SDE_TC_HOTPLUG_ICP(hpd_pin)	REG_BIT(24 + _HPD_PIN_TC(hpd_pin))
> +#define SDE_TC_HOTPLUG_DG2(hpd_pin)	REG_BIT(25 + _HPD_PIN_TC(hpd_pin)) /* sigh */
>  #define SDE_DDI_HOTPLUG_ICP(hpd_pin)	REG_BIT(16 + _HPD_PIN_DDI(hpd_pin))
>  #define SDE_DDI_HOTPLUG_MASK_ICP	(SDE_DDI_HOTPLUG_ICP(HPD_PORT_D) | \
>  					 SDE_DDI_HOTPLUG_ICP(HPD_PORT_C) | \
> -- 
> 2.20.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
