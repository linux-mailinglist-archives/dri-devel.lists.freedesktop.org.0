Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F26737312
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 19:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C77110E30A;
	Tue, 20 Jun 2023 17:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5576710E309;
 Tue, 20 Jun 2023 17:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687282877; x=1718818877;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YU32wILb4tnhc0im+7dQGm/pq5C2AUFMvZXmoqqj258=;
 b=X6RqOLNLt1eKuIx8ceRXb+zXgpBIe+MwoxKN4iD/t1LreXrJal208UHY
 R4CrzDf/R2Pj4v8YHAkOFRv/x4u2Ea1tEO9pkQSSUUAL07QtotaSkrn47
 P4+89axzw2zFhiKE8PlJeRdTjTG9khfRFE67P9sO5Hce2v4wXY1HnInRo
 Q7oPL1mcU2LXSecE41U7AuamJ0Pf8fYd9V5bEm1jmAb3UAo8DtfuYDJn0
 KqnkVOC9WB93CVns/T8T0sX0cxaVstkvvqIoYR8F55q6fegtMQCEkAq3K
 f5aINdfs/1p2X3lvcHss0nUeUBBcYEqFGmznTDGd+x4+DmRMV0yaj1w4/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="357427865"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; d="scan'208";a="357427865"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 10:41:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="691531828"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; d="scan'208";a="691531828"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga006.jf.intel.com with ESMTP; 20 Jun 2023 10:41:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qBfLq-005JYh-1p; Tue, 20 Jun 2023 20:41:10 +0300
Date: Tue, 20 Jun 2023 20:41:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-xe] [PATCH 2/3] linux/bits.h: Add fixed-width GENMASK and
 BIT macros
Message-ID: <ZJHkthMktY83pwvy@smile.fi.intel.com>
References: <20230509051403.2748545-1-lucas.demarchi@intel.com>
 <20230509051403.2748545-3-lucas.demarchi@intel.com>
 <ZF4fi5B7PPlgZBOI@smile.fi.intel.com> <87pm75kd0h.fsf@intel.com>
 <ZF4j0NPoBGMBT8CO@smile.fi.intel.com> <87mt29kc34.fsf@intel.com>
 <ZIs0CC2J7nu0LHEK@smile.fi.intel.com> <875y7igph5.fsf@intel.com>
 <ZJG91zMQW3Rnvdbe@smile.fi.intel.com>
 <amgwl5mthhqgvgkqnor6tjfcr3x3pgwvpqin5efwwjfpdhvvpa@vhzhiq5mzsdg>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amgwl5mthhqgvgkqnor6tjfcr3x3pgwvpqin5efwwjfpdhvvpa@vhzhiq5mzsdg>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: intel-gfx@lists.freedesktop.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas Gleixner <tglx@linutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 20, 2023 at 10:25:21AM -0700, Lucas De Marchi wrote:
> On Tue, Jun 20, 2023 at 05:55:19PM +0300, Andy Shevchenko wrote:
> > On Tue, Jun 20, 2023 at 05:47:34PM +0300, Jani Nikula wrote:
> > > On Thu, 15 Jun 2023, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Fri, May 12, 2023 at 02:45:19PM +0300, Jani Nikula wrote:
> > > >> On Fri, 12 May 2023, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > > >> > On Fri, May 12, 2023 at 02:25:18PM +0300, Jani Nikula wrote:
> > > >> >> On Fri, 12 May 2023, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > > >> >> > On Mon, May 08, 2023 at 10:14:02PM -0700, Lucas De Marchi wrote:
> > > >> >> >> Add GENMASK_U32(), GENMASK_U16() and GENMASK_U8()  macros to create
> > > >> >> >> masks for fixed-width types and also the corresponding BIT_U32(),
> > > >> >> >> BIT_U16() and BIT_U8().

> > > >> >> > Why?
> > > >> >>
> > > >> >> The main reason is that GENMASK() and BIT() size varies for 32/64 bit
> > > >> >> builds.
> > > >> >
> > > >> > When needed GENMASK_ULL() can be used (with respective castings perhaps)
> > > >> > and BIT_ULL(), no?
> > > >>
> > > >> How does that help with making them the same 32-bit size on both 32 and
> > > >> 64 bit builds?
> > > >
> > > > 	u32 x = GENMASK();
> > > > 	u64 y = GENMASK_ULL();
> > > >
> > > > No? Then use in your code either x or y. Note that I assume that the parameters
> > > > to GENMASK*() are built-time constants. Is it the case for you?
> > > 
> > > What's wrong with wanting to define macros with specific size, depending
> > > on e.g. hardware registers instead of build size?
> > 
> > Nothing, but I think the problem is smaller than it's presented.
> 
> not sure about big/small problem you are talking about. It's a problem
> for when the *device* register is a 32b fixed width, which is
> independent from the CPU you are running on. We also have registers that
> are u16 and u64. Having fixed-width GENMASK and BIT helps avoiding
> mistakes like below. Just to use one example, the diff below builds
> fine on my 64b machine, yet it's obviously wrong:
> 
> 	$ git diff 	diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> 	index 0b414eae1683..692a0ad9a768 100644
> 	--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> 	+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> 	@@ -261,8 +261,8 @@ static u32 rw_with_mcr_steering_fw(struct intel_gt *gt,
> 			 * No need to save old steering reg value.
> 			 */
> 			intel_uncore_write_fw(uncore, MTL_MCR_SELECTOR,
> 	-                                     REG_FIELD_PREP(MTL_MCR_GROUPID, group) |
> 	-                                     REG_FIELD_PREP(MTL_MCR_INSTANCEID, instance) |
> 	+                                     FIELD_PREP(MTL_MCR_GROUPID, group) |
> 	+                                     FIELD_PREP(MTL_MCR_INSTANCEID, instance) |
> 					      (rw_flag == FW_REG_READ ? GEN11_MCR_MULTICAST : 0));
> 		} else if (GRAPHICS_VER(uncore->i915) >= 11) {
> 			mcr_mask = GEN11_MCR_SLICE_MASK | GEN11_MCR_SUBSLICE_MASK;
> 	diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> 	index 718cb2c80f79..c42bc2900c6a 100644
> 	--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> 	+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> 	@@ -80,8 +80,8 @@
> 	 #define   GEN11_MCR_SLICE_MASK                 GEN11_MCR_SLICE(0xf)
> 	 #define   GEN11_MCR_SUBSLICE(subslice)         (((subslice) & 0x7) << 24)
> 	 #define   GEN11_MCR_SUBSLICE_MASK              GEN11_MCR_SUBSLICE(0x7)
> 	-#define   MTL_MCR_GROUPID                      REG_GENMASK(11, 8)
> 	-#define   MTL_MCR_INSTANCEID                   REG_GENMASK(3, 0)
> 	+#define   MTL_MCR_GROUPID                      GENMASK(32, 8)
> 	+#define   MTL_MCR_INSTANCEID                   GENMASK(3, 0)
> 	 	 #define IPEIR_I965                             _MMIO(0x2064)
> 	 #define IPEHR_I965                             _MMIO(0x2068)
> 
> If the driver didn't support 32b CPUs, this would even go unnoticed.

So, what does prevent you from using GENMASK_ULL()?

Another point, you may teach GENMASK() to issue a warning if hi and/or lo
bigger than BITS_PER_LONG.

I still don't see the usefulness of that churn.

> Lucas De Marchi
> 
> > And there are already header for bitfields with a lot of helpers
> > for (similar) cases if not yours.
> > 
> > > What would you use for printk format if you wanted to to print
> > > GENMASK()?
> > 
> > %lu, no?

-- 
With Best Regards,
Andy Shevchenko


