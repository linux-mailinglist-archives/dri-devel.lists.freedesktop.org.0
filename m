Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C854BA769
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 18:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1D710E7B2;
	Thu, 17 Feb 2022 17:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C0010E7AB;
 Thu, 17 Feb 2022 17:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645120023; x=1676656023;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=b1mLi31nMgxId7cfIIby3A7d+AK32DQyhAurT0C4ewQ=;
 b=SjU9Hj0QCSDLSReHibRQf2rS6whv4lKN15iUCC2ZJgA+pxFL68SNyXpD
 l9UR9YPO1VvbuxWrf52uEPuw4zTKe5j1vUBrvaLVqs85mJzNswwb1RyRu
 NrG/Rvf1dS9XutWwpHzTQ2Y+0ddp/Fosfc00mWc3V9ewE2KTZoxKG1fO8
 5INwljGseYvQdyUBov950VcObp55l4JuxMWBynT6n37UlHt72ey+DY/qM
 l+Dp3jk0I/2L2UST3YHrMYJHBf0cFYkzlp/itxuwzisT5QfjF+4l2JFiI
 otRE/0XoXHI0WvV5Bm/8kT04VobT/cClJbvbO0rGgCTGLPzAU//Igx0Ae Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="314197944"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="314197944"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 09:46:42 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="541279020"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.203.144.108])
 by fmsmga007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2022 09:46:39 -0800
Date: Thu, 17 Feb 2022 23:16:54 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/3] drm/i915/dg2: Enable 5th display
Message-ID: <20220217174654.GB11187@intel.com>
References: <20220215055154.15363-1-ramalingam.c@intel.com>
 <20220215055154.15363-2-ramalingam.c@intel.com>
 <Yg552yKPy9nhDWIH@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yg552yKPy9nhDWIH@mdroper-desk1.amr.corp.intel.com>
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
Cc: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Shankar Uma <uma.shankar@intel.com>,
 =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-02-17 at 08:37:47 -0800, Matt Roper wrote:
> Since it apparently caused some confusion on various websites, maybe we
> should change the title of the patch to "Enable 5th port" to make it
> more clear that this is only a port, not a pipe.
Ok sure.

> 
> Also, I believe one last line that we need to add to this patch is an
> intel_ddi_init() call for TC1 in the intel_setup_outputs() function.  I
> think I previously had that in a separate patch, but it went missing
> when we reorganized and refactored some of these patches

like 

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 59961621fe4a..18531ffd4789 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8760,6 +8760,7 @@ static void intel_setup_outputs(struct drm_i915_private *dev_priv)
                intel_ddi_init(dev_priv, PORT_B);
                intel_ddi_init(dev_priv, PORT_C);
                intel_ddi_init(dev_priv, PORT_D_XELPD);
+               intel_ddi_init(dev_priv, PORT_TC1);
        } else if (IS_ALDERLAKE_P(dev_priv)) {
                intel_ddi_init(dev_priv, PORT_A);
                intel_ddi_init(dev_priv, PORT_B);

Ram
> 
> 
> Matt
> 
> On Tue, Feb 15, 2022 at 11:21:52AM +0530, Ramalingam C wrote:
> > From: Matt Roper <matthew.d.roper@intel.com>
> > 
> > DG2 supports a 5th display output which the hardware refers to as "TC1,"
> > even though it isn't a Type-C output.  This behaves similarly to the TC1
> > on past platforms with just a couple minor differences:
> > 
> >  * DG2's TC1 bit in SDEISR is at bit 25 rather than 24 as it is on
> >    ICP/TGP/ADP.
> >  * DG2 doesn't need the hpd inversion setting that we had to use on DG1
> > 
> > Cc: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: José Roberto de Souza <jose.souza@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_gmbus.c | 16 ++++++++++++++--
> >  drivers/gpu/drm/i915/i915_irq.c            |  5 ++++-
> >  drivers/gpu/drm/i915/i915_reg.h            |  1 +
> >  3 files changed, 19 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
> > index 6ce8c10fe975..2fad03250661 100644
> > --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> > +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> > @@ -98,11 +98,21 @@ static const struct gmbus_pin gmbus_pins_dg1[] = {
> >  	[GMBUS_PIN_4_CNP] = { "dpd", GPIOE },
> >  };
> >  
> > +static const struct gmbus_pin gmbus_pins_dg2[] = {
> > +	[GMBUS_PIN_1_BXT] = { "dpa", GPIOB },
> > +	[GMBUS_PIN_2_BXT] = { "dpb", GPIOC },
> > +	[GMBUS_PIN_3_BXT] = { "dpc", GPIOD },
> > +	[GMBUS_PIN_4_CNP] = { "dpd", GPIOE },
> > +	[GMBUS_PIN_9_TC1_ICP] = { "tc1", GPIOJ },
> > +};
> > +
> >  /* pin is expected to be valid */
> >  static const struct gmbus_pin *get_gmbus_pin(struct drm_i915_private *dev_priv,
> >  					     unsigned int pin)
> >  {
> > -	if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
> > +	if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG2)
> > +		return &gmbus_pins_dg2[pin];
> > +	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
> >  		return &gmbus_pins_dg1[pin];
> >  	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
> >  		return &gmbus_pins_icp[pin];
> > @@ -123,7 +133,9 @@ bool intel_gmbus_is_valid_pin(struct drm_i915_private *dev_priv,
> >  {
> >  	unsigned int size;
> >  
> > -	if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
> > +	if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG2)
> > +		size = ARRAY_SIZE(gmbus_pins_dg2);
> > +	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
> >  		size = ARRAY_SIZE(gmbus_pins_dg1);
> >  	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
> >  		size = ARRAY_SIZE(gmbus_pins_icp);
> > diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> > index fdd568ba4a16..4d81063b128c 100644
> > --- a/drivers/gpu/drm/i915/i915_irq.c
> > +++ b/drivers/gpu/drm/i915/i915_irq.c
> > @@ -179,6 +179,7 @@ static const u32 hpd_sde_dg1[HPD_NUM_PINS] = {
> >  	[HPD_PORT_B] = SDE_DDI_HOTPLUG_ICP(HPD_PORT_B),
> >  	[HPD_PORT_C] = SDE_DDI_HOTPLUG_ICP(HPD_PORT_C),
> >  	[HPD_PORT_D] = SDE_DDI_HOTPLUG_ICP(HPD_PORT_D),
> > +	[HPD_PORT_TC1] = SDE_TC_HOTPLUG_DG2(HPD_PORT_TC1),
> >  };
> >  
> >  static void intel_hpd_init_pins(struct drm_i915_private *dev_priv)
> > @@ -4424,7 +4425,9 @@ void intel_irq_init(struct drm_i915_private *dev_priv)
> >  		if (I915_HAS_HOTPLUG(dev_priv))
> >  			dev_priv->hotplug_funcs = &i915_hpd_funcs;
> >  	} else {
> > -		if (HAS_PCH_DG1(dev_priv))
> > +		if (HAS_PCH_DG2(dev_priv))
> > +			dev_priv->hotplug_funcs = &icp_hpd_funcs;
> > +		else if (HAS_PCH_DG1(dev_priv))
> >  			dev_priv->hotplug_funcs = &dg1_hpd_funcs;
> >  		else if (DISPLAY_VER(dev_priv) >= 11)
> >  			dev_priv->hotplug_funcs = &gen11_hpd_funcs;
> > diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> > index 4ea1713e6b60..4d12abb2d7ff 100644
> > --- a/drivers/gpu/drm/i915/i915_reg.h
> > +++ b/drivers/gpu/drm/i915/i915_reg.h
> > @@ -6182,6 +6182,7 @@
> >  /* south display engine interrupt: ICP/TGP */
> >  #define SDE_GMBUS_ICP			(1 << 23)
> >  #define SDE_TC_HOTPLUG_ICP(hpd_pin)	REG_BIT(24 + _HPD_PIN_TC(hpd_pin))
> > +#define SDE_TC_HOTPLUG_DG2(hpd_pin)	REG_BIT(25 + _HPD_PIN_TC(hpd_pin)) /* sigh */
> >  #define SDE_DDI_HOTPLUG_ICP(hpd_pin)	REG_BIT(16 + _HPD_PIN_DDI(hpd_pin))
> >  #define SDE_DDI_HOTPLUG_MASK_ICP	(SDE_DDI_HOTPLUG_ICP(HPD_PORT_D) | \
> >  					 SDE_DDI_HOTPLUG_ICP(HPD_PORT_C) | \
> > -- 
> > 2.20.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> VTT-OSGC Platform Enablement
> Intel Corporation
> (916) 356-2795
