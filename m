Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B279E5F345F
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 19:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9B010E434;
	Mon,  3 Oct 2022 17:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BADC10E422;
 Mon,  3 Oct 2022 17:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664817727; x=1696353727;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HwgIHCNLONeefB3omLt3STfKfoh5e+OYGFbRe0CGMM8=;
 b=j1ReRPLseq1nAtIkAHxccRUBIDM+yHrPy0ae6IgKg/3UK0jdUAMpJaWm
 ZIAt5EgG46m/xvHxtDk4AikCUtwl7fGo9EENpToSBS3i2u0auX7OnzipK
 E2SAhYD2QBmAie/eAV2nozNLMg1BOvoAnLH67T7ZaHAJgloTUGvv+Kczo
 aNklCvMa2fFavM3cZL5RXyw2XscZHhwaW/6idFRKgQqbYgtR/YNSKVu1j
 Cy2GmWlDN0NXls5HAg5xXlvdklWb0AqgEv1DotSkWugWlnTJQj8c1UBdu
 50GgtbxAxCs3lp4gWN/H5pqSINFigbzrXtQPFE0Kray1lfBGv5zgHwZBn Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="301422490"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; d="scan'208";a="301422490"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 10:22:06 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="623615325"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; d="scan'208";a="623615325"
Received: from ashyti-mobl2.igk.intel.com (HELO intel.com) ([172.28.182.81])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 10:22:04 -0700
Date: Mon, 3 Oct 2022 19:22:02 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915: Use GEN12 RPSTAT register
Message-ID: <YzsaOsrB/+nXROl5@ashyti-mobl2.lan>
References: <20220927113529.3646989-1-badal.nilawar@intel.com>
 <20220927113529.3646989-2-badal.nilawar@intel.com>
 <87wn9o5ky7.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wn9o5ky7.wl-ashutosh.dixit@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 donhiatt@gmail.com, Badal Nilawar <badal.nilawar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 27, 2022 at 06:47:28PM -0700, Dixit, Ashutosh wrote:
> On Tue, 27 Sep 2022 04:35:29 -0700, Badal Nilawar wrote:
> >
> > From: Don Hiatt <don.hiatt@intel.com>
> >
> > On GEN12 and above use GEN12_RPSTAT register to get Current
> > Actual Graphics Frequency of GT
> 
> I think even for the purposes of reviewing this it would be good to mention
> in the commit message that:
> 
> a. GEN12_RPSTAT register doesn't require a forcewake to be read (it doesn't
>    belong to a forcewake domain)
> b. Will result in a 0 frequency if the GT is in RC6

perhaps also in a comment... (continue)

> 
> Thanks.
> --
> Ashutosh
> 
> > v2:
> >   - Fixed review comments(Ashutosh)
> >   - Added function intel_rps_read_rpstat_fw to read RPSTAT without
> >     forcewake, required especially for GEN6_RPSTAT1 (Ashutosh, Tvrtko)
> >
> > Cc: Don Hiatt <donhiatt@gmail.com>
> > Cc: Andi Shyti <andi.shyti@intel.com>
> > Signed-off-by: Don Hiatt <don.hiatt@intel.com>
> > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c |  2 +-
> >  drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  4 +++
> >  drivers/gpu/drm/i915/gt/intel_rps.c           | 32 +++++++++++++++++--
> >  drivers/gpu/drm/i915/gt/intel_rps.h           |  2 ++
> >  drivers/gpu/drm/i915/i915_pmu.c               |  3 +-
> >  5 files changed, 38 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> > index 10f680dbd7b6..b9b47052b26d 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> > @@ -380,7 +380,7 @@ void intel_gt_pm_frequency_dump(struct intel_gt *gt, struct drm_printer *p)
> >		rpinclimit = intel_uncore_read(uncore, GEN6_RP_UP_THRESHOLD);
> >		rpdeclimit = intel_uncore_read(uncore, GEN6_RP_DOWN_THRESHOLD);
> >
> > -		rpstat = intel_uncore_read(uncore, GEN6_RPSTAT1);
> > +		rpstat = intel_rps_read_rpstat(rps);
> >		rpcurupei = intel_uncore_read(uncore, GEN6_RP_CUR_UP_EI) & GEN6_CURICONT_MASK;
> >		rpcurup = intel_uncore_read(uncore, GEN6_RP_CUR_UP) & GEN6_CURBSYTAVG_MASK;
> >		rpprevup = intel_uncore_read(uncore, GEN6_RP_PREV_UP) & GEN6_CURBSYTAVG_MASK;
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > index 7f79bbf97828..1f1e90acc1ab 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > @@ -1519,6 +1519,10 @@
> >  #define VLV_RENDER_C0_COUNT			_MMIO(0x138118)
> >  #define VLV_MEDIA_C0_COUNT			_MMIO(0x13811c)
> >
> > +#define GEN12_RPSTAT1				_MMIO(0x1381b4)
> > +#define   GEN12_CAGF_SHIFT			11
> > +#define   GEN12_CAGF_MASK			REG_GENMASK(19, 11)
> > +
> >  #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
> >  #define   GEN11_CSME				(31)
> >  #define   GEN11_GUNIT				(28)
> > diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> > index 17b40b625e31..5a15a630b1c6 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> > @@ -2068,12 +2068,40 @@ void intel_rps_sanitize(struct intel_rps *rps)
> >		rps_disable_interrupts(rps);
> >  }

... here!

> > +u32 intel_rps_read_rpstat_fw(struct intel_rps *rps)
> > +{
> > +	struct drm_i915_private *i915 = rps_to_i915(rps);
> > +	i915_reg_t rpstat;
> > +
> > +	if (GRAPHICS_VER(i915) >= 12)
> > +		rpstat = GEN12_RPSTAT1;
> > +	else
> > +		rpstat = GEN6_RPSTAT1;
> > +
> > +	return intel_uncore_read_fw(rps_to_gt(rps)->uncore, rpstat);
> > +}
> > +
> > +u32 intel_rps_read_rpstat(struct intel_rps *rps)
> > +{
> > +	struct drm_i915_private *i915 = rps_to_i915(rps);
> > +	i915_reg_t rpstat;
> > +
> > +	if (GRAPHICS_VER(i915) >= 12)
> > +		rpstat = GEN12_RPSTAT1;
> > +	else
> > +		rpstat = GEN6_RPSTAT1;
> > +
> > +	return intel_uncore_read(rps_to_gt(rps)->uncore, rpstat);
> > +}

perhaps this can be simplified a bit more to avoid some code
duplication, but I'm not going to push on this.

I see that CI got stuck somewhere, but the failure doesn't seem
to be related to this patch.

Otherwise it all looks good, with the improved git comment as
Ashutosh asked and the comment above:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi

> >  u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat)
> >  {
> >	struct drm_i915_private *i915 = rps_to_i915(rps);
> >	u32 cagf;
> >
> > -	if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
> > +	if (GRAPHICS_VER(i915) >= 12)
> > +		cagf = (rpstat & GEN12_CAGF_MASK) >> GEN12_CAGF_SHIFT;
> > +	else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
> >		cagf = (rpstat >> 8) & 0xff;
> >	else if (GRAPHICS_VER(i915) >= 9)
> >		cagf = (rpstat & GEN9_CAGF_MASK) >> GEN9_CAGF_SHIFT;
> > @@ -2099,7 +2127,7 @@ static u32 read_cagf(struct intel_rps *rps)
> >		freq = vlv_punit_read(i915, PUNIT_REG_GPU_FREQ_STS);
> >		vlv_punit_put(i915);
> >	} else if (GRAPHICS_VER(i915) >= 6) {
> > -		freq = intel_uncore_read(uncore, GEN6_RPSTAT1);
> > +		freq = intel_rps_read_rpstat(rps);
> >	} else {
> >		freq = intel_uncore_read(uncore, MEMSTAT_ILK);
> >	}
> > diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
> > index 4509dfdc52e0..76c8404d8416 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_rps.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_rps.h
> > @@ -47,6 +47,8 @@ u32 intel_rps_get_rp1_frequency(struct intel_rps *rps);
> >  u32 intel_rps_get_rpn_frequency(struct intel_rps *rps);
> >  u32 intel_rps_read_punit_req(struct intel_rps *rps);
> >  u32 intel_rps_read_punit_req_frequency(struct intel_rps *rps);
> > +u32 intel_rps_read_rpstat(struct intel_rps *rps);
> > +u32 intel_rps_read_rpstat_fw(struct intel_rps *rps);
> >  void gen6_rps_get_freq_caps(struct intel_rps *rps, struct intel_rps_freq_caps *caps);
> >  void intel_rps_raise_unslice(struct intel_rps *rps);
> >  void intel_rps_lower_unslice(struct intel_rps *rps);
> > diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> > index 958b37123bf1..67140a87182f 100644
> > --- a/drivers/gpu/drm/i915/i915_pmu.c
> > +++ b/drivers/gpu/drm/i915/i915_pmu.c
> > @@ -371,7 +371,6 @@ static void
> >  frequency_sample(struct intel_gt *gt, unsigned int period_ns)
> >  {
> >	struct drm_i915_private *i915 = gt->i915;
> > -	struct intel_uncore *uncore = gt->uncore;
> >	struct i915_pmu *pmu = &i915->pmu;
> >	struct intel_rps *rps = &gt->rps;
> >
> > @@ -394,7 +393,7 @@ frequency_sample(struct intel_gt *gt, unsigned int period_ns)
> >		 * case we assume the system is running at the intended
> >		 * frequency. Fortunately, the read should rarely fail!
> >		 */
> > -		val = intel_uncore_read_fw(uncore, GEN6_RPSTAT1);
> > +		val = intel_rps_read_rpstat_fw(rps);
> >		if (val)
> >			val = intel_rps_get_cagf(rps, val);
> >		else
> > --
> > 2.25.1
> >
