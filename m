Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DF76E9A3D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 19:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4515D10ECBC;
	Thu, 20 Apr 2023 17:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4DA10E0B1;
 Thu, 20 Apr 2023 17:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682010263; x=1713546263;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4tC/Lui02+riydxNBUhr7qhFfFibnZCxIXte3ml9RFw=;
 b=M9awsUpRwiialru6POfDF59iBlaZBJQdooMKMuEHX817gC5+39A/nmX2
 wSWAR+lMBtK3Bsckqns90XBzeJ4VDT2Z7lxoC0FKZeZ9CYWH5HYa0dv3b
 h6yBwQ3y4BB2hckHdFCQ6diBiMDgBuv0anhFCxzIO2cXkWMmsX5pYWU0W
 go+1Vi4ntqChEHxF/oMUzQqhemkr3ELFl2rDauxHHyhH9DO9SEZkvWr9Q
 Vq3lSpePdZzT7ZdMLnu2oPO5yxb1acLHTlvkV8i0KPR/tQpI4AhtXwXUr
 Sh7eYYTBixm4hoor6CRf+HbZPrTFK2WvruwOR6dTWhuz9vdk0AEl9guJ6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="411043056"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="411043056"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 09:29:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="938130858"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="938130858"
Received: from nmoazzen-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.251.214.86])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 09:29:26 -0700
Date: Thu, 20 Apr 2023 18:29:19 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Yang, Fei" <fei.yang@intel.com>
Subject: Re: [Intel-gfx] [PATCH 8/8] drm/i915: Allow user to set cache at BO
 creation
Message-ID: <ZEFoXzlw4XTN+q0z@ashyti-mobl2.lan>
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-9-fei.yang@intel.com>
 <ZEEkV3XOdmtYWnMv@ashyti-mobl2.lan>
 <471addf7-1670-32cd-9d2e-3f94d6825eab@linux.intel.com>
 <BYAPR11MB2567A1A450448AE17B38ED1C9A639@BYAPR11MB2567.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR11MB2567A1A450448AE17B38ED1C9A639@BYAPR11MB2567.namprd11.prod.outlook.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fei,

> >>> To comply with the design that buffer objects shall have immutable
> >>> cache setting through out their life cycle, {set, get}_caching ioctl's
> >>> are no longer supported from MTL onward. With that change caching
> >>> policy can only be set at object creation time. The current code
> >>> applies a default (platform dependent) cache setting for all objects.
> >>> However this is not optimal for performance tuning. The patch extends
> >>> the existing gem_create uAPI to let user set PAT index for the object
> >>> at creation time.
> >>> The new extension is platform independent, so UMD's can switch to using
> >>> this extension for older platforms as well, while {set, get}_caching are
> >>> still supported on these legacy paltforms for compatibility reason.
> >>>
> >>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> >>> Cc: Matt Roper <matthew.d.roper@intel.com>
> >>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> >>> Signed-off-by: Fei Yang <fei.yang@intel.com>
> >>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> >>
> >> because this is an API change, we need some more information
> >> here.
> >>
> >> First of all you need to CC the userspace guys that have been
> >> working on top of your series and get their ack's.
> >
> > Yes, and a link to a Mesa merge request which uses the uapi should be
> > included.
> 
> Working with Mesa team on this, stay tuned.
> 
> > IGTs should be ready to before we can merge. I glanced over igt-dev but
> > did not spot anything.
> 
> There is a IGT patch posted to gfx-internal-devel, titled "test/gem_create:
> exercise gem_create_ext_set_pat"

Any chance to have it ported upstream? It's OK even if it's not
merged (at least on my side) but some public interface testing is
needed.

If you do post it upstream you could add in the cover letter:

Test-with: <mail-id>

where the mail-id is referred to the upstream patch of the test.

Andi
