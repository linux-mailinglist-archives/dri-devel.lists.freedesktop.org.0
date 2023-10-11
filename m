Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4812E7C4CFB
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 10:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E05010E541;
	Wed, 11 Oct 2023 08:24:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A125C10E58F;
 Wed, 11 Oct 2023 08:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697012640; x=1728548640;
 h=date:from:to:cc:subject:message-id:mime-version: in-reply-to;
 bh=aPxuHluJUNtOt+9wCSNAgj3FfZ/T+MYXCRG1WJm8JwA=;
 b=dqwjEpoRWDkAUX4ALOU2xhekRGnZ3qwX4Mu/fvrkk+8k/0rdLNCf2dBa
 QVoip8PJZPeobIlnEV0nC6MAoGnb4KlTjxaI2gNf+05XWuQwhmXbrEzEY
 Mfi9DTjwd4qbCY2hhJD1rBQeuyAWVlF1B/pkz6wPeD9UUM1Vn500DBryQ
 2twXomhp7FbyHuDJllK4s9ZP8Of8p/B4rCIklnG/fpVDrX332zJfC6IYy
 lVVmfvqi5wyjlxL7+hN9Y1Ohw0tJTjLZ4cIv2aVZKna4+qIPvtXl7fugN
 MK7Zpme2ZfQTt8Z5sFKsOUPwnVflpQ2Z7f8enjNeQU7nZxT87uLEXuzAo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="387450890"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="387450890"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 01:23:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="870056529"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="870056529"
Received: from lyemeeki-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.214.156.206])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 01:23:51 -0700
Date: Wed, 11 Oct 2023 10:23:46 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Lee, Shawn C" <shawn.c.lee@intel.com>
Subject: Re: drm/i915/mtl: Remove the 'force_probe' requirement for Meteor Lake
Message-ID: <ZSZbkgTonPtWXDRl@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231008164824.919262-1-andi.shyti@linux.intel.com>
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
Cc: Aditya Chauhan <aditya.chauhan@intel.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Shawn,

On Wed, Oct 11, 2023 at 10:03:08AM +0200, Lee, Shawn C wrote:
> > From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> > 
> > Meteor Lake has demonstrated consistent stability for some time.
> > All user-space API modifications tide to its core platform
> > functions are operational.
> > 
> > The necessary firmware components are set up and comprehensive
> > testing has been condused over a period.
> > 
> > Given the recent faborable CI results, as well, we believe it's
> > time to eliminate the 'force_probe' prerequisite and activate the
> > platform by default.
> > 
> > Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> > Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > ---
> > Hello,
> > 
> > This patch eliminates the 'force probe' for the MTL platforms. Over the recent
> > weeks, MTL has demonstrated stability, consistently passing BAT tests with
> > success rates ranging from 98% to 100%.
> > 
> > There's a single issue hindering us from achieving a 100% BAT test coverage.
> > Fortunately, we've identified the issue, and the proposed solution can be found
> > here[*]. The CI results are encouraging.
> > 
> > Once all reviews are addressed, we plan to submit this series with the "Fixes:"
> > tag.
> > 
> > Thank you and best regards,
> > Andi and Radhakrishna
> > 
> > [*] https://patchwork.freedesktop.org/series/124744/
> > 
> >  drivers/gpu/drm/i915/i915_pci.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> > index df7c261410f7..fe748906c06f 100644
> > --- a/drivers/gpu/drm/i915/i915_pci.c
> > +++ b/drivers/gpu/drm/i915/i915_pci.c
> > @@ -836,7 +836,6 @@  static const struct intel_device_info mtl_info = {
> >  	.has_pxp = 1,
> >  	.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
> >  	.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
> > -	.require_force_probe = 1,
> >  	MTL_CACHELEVEL,
> >  };
> >  
> 
> Test on my MTL device and it works properly.
> 
> Acked-by: Lee Shawn C <shawn.c.lee@intel.com>
> Tested-by: Lee Shawn C <shawn.c.lee@intel.com>

Thanks a lot for your ack!

In your original mail[*] the "Reply-To" and the "In-Reply-To"
fields were swapped. I fixed it and added the correct Cc chain.

Thanks,
Andi

[*] https://lore.kernel.org/intel-gfx/BYAPR11MB27101EF88CCBDBA430108CD5A3CCA@BYAPR11MB2710.namprd11.prod.outlook.com/
