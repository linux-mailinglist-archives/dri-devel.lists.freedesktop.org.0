Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8524B1FEA
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 09:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B9010EA18;
	Fri, 11 Feb 2022 08:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FBF10EA16;
 Fri, 11 Feb 2022 08:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644566863; x=1676102863;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Srp7HAYJtchk4thV95lqhhPKh0wGJmFEIVFNgY5zKzI=;
 b=R5qPvFFyvEdOrpQCgE1sMJgtKgqii0gsy1eJOHcTubdTQU3z5Z+8tOtV
 YLYp6KHEjj7/MyetViWpnvpKmCM3SB5Ltv1GAQh0N3V8ITa+zSHNYt9ei
 x3MEQA2yo2dU/OAdgFyyfSKH9zwUsnL8TpaM2oY0tUN0rhvFV3Z7z2Tsm
 okUakHHhxqV7jqoFQUKtiy+NEf+k0BpSPN9rr/dxC3CWpnXMc/cCHcViK
 I8M8nWcuIwvPUoUsEZzsoROPZKjHpOzYosWw1wGLrtl8/kRFFIlzt1geO
 kl0rwhcCMAcm9eVkBptZjI0aDLdO4iHMCpLTCnsndaKVGhEFe5ooGYMFy g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="310421460"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="310421460"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 00:07:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="537577306"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by fmsmga007.fm.intel.com with SMTP; 11 Feb 2022 00:07:39 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 11 Feb 2022 10:07:39 +0200
Date: Fri, 11 Feb 2022 10:07:39 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH] drm/i915/dg2: Don't try to process TBT interrupts
Message-ID: <YgYZSxOZPg9TIQi9@intel.com>
References: <20220211054903.24671-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220211054903.24671-1-ramalingam.c@intel.com>
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
Cc: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 11, 2022 at 11:19:03AM +0530, Ramalingam C wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> DG2 is the first platform, that supports TC but not TBT.
> interrupt code is updated to avoid trying to process
> TBT-specific bits and registers.

Is that a real concern?

> 
> Cc: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_drv.h          |  1 +
>  drivers/gpu/drm/i915/i915_irq.c          | 12 ++++++++----
>  drivers/gpu/drm/i915/i915_pci.c          |  1 +
>  drivers/gpu/drm/i915/intel_device_info.h |  1 +
>  4 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 5b6fd792a8d7..b9294ff5a1e6 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1433,6 +1433,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  #define HAS_PSR(dev_priv)		 (INTEL_INFO(dev_priv)->display.has_psr)
>  #define HAS_PSR_HW_TRACKING(dev_priv) \
>  	(INTEL_INFO(dev_priv)->display.has_psr_hw_tracking)
> +#define HAS_TC_WITHOUT_TBT(dev_priv)	 (INTEL_INFO(dev_priv)->display.has_tc_without_tbt)
>  #define HAS_PSR2_SEL_FETCH(dev_priv)	 (DISPLAY_VER(dev_priv) >= 12)
>  #define HAS_TRANSCODER(dev_priv, trans)	 ((INTEL_INFO(dev_priv)->display.cpu_transcoder_mask & BIT(trans)) != 0)
>  
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index fdd568ba4a16..72b9888b2acf 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -2245,7 +2245,8 @@ static void gen11_hpd_irq_handler(struct drm_i915_private *dev_priv, u32 iir)
>  {
>  	u32 pin_mask = 0, long_mask = 0;
>  	u32 trigger_tc = iir & GEN11_DE_TC_HOTPLUG_MASK;
> -	u32 trigger_tbt = iir & GEN11_DE_TBT_HOTPLUG_MASK;
> +	u32 trigger_tbt = HAS_TC_WITHOUT_TBT(dev_priv) ? 0 :
> +		iir & GEN11_DE_TBT_HOTPLUG_MASK;
>  
>  	if (trigger_tc) {
>  		u32 dig_hotplug_reg;
> @@ -3468,7 +3469,8 @@ static void gen11_hpd_irq_setup(struct drm_i915_private *dev_priv)
>  	intel_uncore_posting_read(&dev_priv->uncore, GEN11_DE_HPD_IMR);

Just above here is where the problem happens because it will
unmask all the TBT irqs. I'm thinking we might want to
split hpd_gen11[] into tc vs. tbt variants and introduce
i915->hotplug.hpd_tbt[].

>  
>  	gen11_tc_hpd_detection_setup(dev_priv);
> -	gen11_tbt_hpd_detection_setup(dev_priv);
> +	if (!HAS_TC_WITHOUT_TBT(dev_priv))
> +		gen11_tbt_hpd_detection_setup(dev_priv);

Does the GEN11_TBT_HOTPLUG_CTL register still exist though? 
If yes, then we probably want to keep initializing it, just
making sure to turn off the relevant bits.

>  
>  	if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
>  		icp_hpd_irq_setup(dev_priv);
> @@ -3828,8 +3830,10 @@ static void gen8_de_irq_postinstall(struct drm_i915_private *dev_priv)
>  
>  	if (DISPLAY_VER(dev_priv) >= 11) {
>  		u32 de_hpd_masked = 0;
> -		u32 de_hpd_enables = GEN11_DE_TC_HOTPLUG_MASK |
> -				     GEN11_DE_TBT_HOTPLUG_MASK;
> +		u32 de_hpd_enables = GEN11_DE_TC_HOTPLUG_MASK;
> +
> +		if (!HAS_TC_WITHOUT_TBT(dev_priv))
> +			de_hpd_enables |= GEN11_DE_TBT_HOTPLUG_MASK;
>  
>  		GEN3_IRQ_INIT(uncore, GEN11_DE_HPD_, ~de_hpd_masked,
>  			      de_hpd_enables);

This code seems fine as is. It just sets all the enable bits
but leaves everything masked. Exactly as everything else is
handled (minus the odd SDEIER expection).

> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 467252f885c2..1ad5593e925f 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1046,6 +1046,7 @@ static const struct intel_device_info dg2_info = {
>  	.graphics.rel = 55,
>  	.media.rel = 55,
>  	PLATFORM(INTEL_DG2),
> +	.display.has_tc_without_tbt = 1,
>  	.has_guc_deprivilege = 1,
>  	.has_64k_pages = 1,
>  	.platform_engine_mask =
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> index 27dcfe6f2429..4d8cfd41aa31 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -171,6 +171,7 @@ enum intel_ppgtt_type {
>  	func(has_overlay); \
>  	func(has_psr); \
>  	func(has_psr_hw_tracking); \
> +	func(has_tc_without_tbt); \
>  	func(overlay_needs_physical); \
>  	func(supports_tv);
>  
> -- 
> 2.20.1

-- 
Ville Syrjälä
Intel
