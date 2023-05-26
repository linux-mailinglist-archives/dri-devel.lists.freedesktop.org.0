Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 642957127CA
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 15:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A63B10E6B4;
	Fri, 26 May 2023 13:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48EE10E1D0;
 Fri, 26 May 2023 13:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685109071; x=1716645071;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NYHHPvuGwTS6sRjBiIefJvhPU7bR4RFR1Z108I+9q1s=;
 b=aMEAFQoWZUdpzkPOjT3yDB8hmoiuj6AA5uoCRTIO84gt2Ecotlj4Ad2l
 9cI+L11yhDay9sMvY6O6ENCEuqlY2bnkMpUECK6guTIpf7eRNpIDjAEgH
 /JGS4oCSz6QNkiyX2DeAEL3yPC3tnhJr+uxqwJoyW3Ga5UEOF8wGrbG3X
 XEh054yQ/8tgQldZrR25ksqyU78XyQjF1mb1V10lrpYg5NoBrr6dCOpHI
 arWJVwkZZQWg8K01h5J/LOCe64I3311kteKHmbQMmt8HXh55QkcPXxJpC
 nPQ08867xMqsVlLq6IHS3HzEsO9OsWE4e/ndLwZZzX3d1E1F4sTfah1H7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="351712983"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="351712983"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 06:51:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="682725655"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="682725655"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga006.jf.intel.com with SMTP; 26 May 2023 06:51:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 26 May 2023 16:51:07 +0300
Date: Fri, 26 May 2023 16:51:07 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 6/7] drm/i915: No 10bit gamma on desktop
 gen3 parts
Message-ID: <ZHC5S2HGOkv0LO1w@intel.com>
References: <20230413164916.4221-1-ville.syrjala@linux.intel.com>
 <20230413164916.4221-7-ville.syrjala@linux.intel.com>
 <DM4PR11MB636079BEDB4092FAC1E8D776F4469@DM4PR11MB6360.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM4PR11MB636079BEDB4092FAC1E8D776F4469@DM4PR11MB6360.namprd11.prod.outlook.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 09:25:46PM +0000, Shankar, Uma wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Ville Syrjala
> > Sent: Thursday, April 13, 2023 10:19 PM
> > To: intel-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Subject: [Intel-gfx] [PATCH v2 6/7] drm/i915: No 10bit gamma on desktop gen3 parts
> > 
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Apparently desktop gen3 parts don't support the 10bit gamma mode at all. Stop
> > claiming otherwise.
> > 
> > As is the case with pipe A on gen3 mobile parts, the PIPECONF gamma mode bit can
> > be set but it has no effect on the output.
> > 
> > PNV seems to be the only slight exception, but generally the desktop PNV variant
> > looks more like a mobile part so this is not entirely surprising.
> 
> Couldn't check the relevant spec to re-confirm, trusting your judgment here.

The spec isn't helpful here actually. Real world testing on every
gen3 platform was needed to be sure how this works.

> Reviewed-by: Uma Shankar <uma.shankar@intel.com>

Thanks.

> 
> > Fixes: 67630bacae23 ("drm/i915: Add 10bit gamma mode for gen2/3")
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/i915_pci.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c index
> > cddb6e197972..305c05c3f93b 100644
> > --- a/drivers/gpu/drm/i915/i915_pci.c
> > +++ b/drivers/gpu/drm/i915/i915_pci.c
> > @@ -250,13 +250,13 @@ static const struct intel_device_info i865g_info = {
> >  	.dma_mask_size = 32, \
> >  	I9XX_PIPE_OFFSETS, \
> >  	I9XX_CURSOR_OFFSETS, \
> > -	I9XX_COLORS, \
> >  	GEN_DEFAULT_PAGE_SIZES, \
> >  	GEN_DEFAULT_REGIONS
> > 
> >  static const struct intel_device_info i915g_info = {
> >  	GEN3_FEATURES,
> >  	PLATFORM(INTEL_I915G),
> > +	I845_COLORS,
> >  	.has_coherent_ggtt = false,
> >  	.display.cursor_needs_physical = 1,
> >  	.display.has_overlay = 1,
> > @@ -268,6 +268,7 @@ static const struct intel_device_info i915g_info = {  static
> > const struct intel_device_info i915gm_info = {
> >  	GEN3_FEATURES,
> >  	PLATFORM(INTEL_I915GM),
> > +	I9XX_COLORS,
> >  	.is_mobile = 1,
> >  	.display.cursor_needs_physical = 1,
> >  	.display.has_overlay = 1,
> > @@ -281,6 +282,7 @@ static const struct intel_device_info i915gm_info = {  static
> > const struct intel_device_info i945g_info = {
> >  	GEN3_FEATURES,
> >  	PLATFORM(INTEL_I945G),
> > +	I845_COLORS,
> >  	.display.has_hotplug = 1,
> >  	.display.cursor_needs_physical = 1,
> >  	.display.has_overlay = 1,
> > @@ -292,6 +294,7 @@ static const struct intel_device_info i945g_info = {  static
> > const struct intel_device_info i945gm_info = {
> >  	GEN3_FEATURES,
> >  	PLATFORM(INTEL_I945GM),
> > +	I9XX_COLORS,
> >  	.is_mobile = 1,
> >  	.display.has_hotplug = 1,
> >  	.display.cursor_needs_physical = 1,
> > @@ -306,6 +309,7 @@ static const struct intel_device_info i945gm_info = {  static
> > const struct intel_device_info g33_info = {
> >  	GEN3_FEATURES,
> >  	PLATFORM(INTEL_G33),
> > +	I845_COLORS,
> >  	.display.has_hotplug = 1,
> >  	.display.has_overlay = 1,
> >  	.dma_mask_size = 36,
> > @@ -314,6 +318,7 @@ static const struct intel_device_info g33_info = {  static
> > const struct intel_device_info pnv_g_info = {
> >  	GEN3_FEATURES,
> >  	PLATFORM(INTEL_PINEVIEW),
> > +	I9XX_COLORS,
> >  	.display.has_hotplug = 1,
> >  	.display.has_overlay = 1,
> >  	.dma_mask_size = 36,
> > @@ -322,6 +327,7 @@ static const struct intel_device_info pnv_g_info = {  static
> > const struct intel_device_info pnv_m_info = {
> >  	GEN3_FEATURES,
> >  	PLATFORM(INTEL_PINEVIEW),
> > +	I9XX_COLORS,
> >  	.is_mobile = 1,
> >  	.display.has_hotplug = 1,
> >  	.display.has_overlay = 1,
> > --
> > 2.39.2
> 

-- 
Ville Syrjälä
Intel
