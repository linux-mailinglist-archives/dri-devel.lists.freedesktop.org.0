Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92209A72E69
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 12:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B3110E0E1;
	Thu, 27 Mar 2025 11:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hbm4H2LK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4FCF10E031;
 Thu, 27 Mar 2025 11:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743073540; x=1774609540;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cM5umJHRd2oQhLm2MKzIt8XqtEeKsBlo+aE8AkGekJ4=;
 b=Hbm4H2LKixDcvO7cP1kj2b0yCbLuFi0Wom7ZdwOWS56Lg2CXzcbvk9DB
 uLmWA9nd69fCsEqlWP+p8GLyGcW0tEuBIoPTQcZpLeyFq3hONBCBsxjPL
 CeW9bFq2z/CrP/fMUCgwsdaZiJ4OnxgBaZjk10UbswfYJ+79TvpZypbPa
 +ciXyb8wcxSCeRjNE298FqbJ6PCSm+rjDntJQFN7dRFWxhJVmAZXmQs92
 qu9PPSAFYiyLhL2+xvLbCEhW5Wd0dgRbEgjs7HdMwO/zmtcfiLcT14d7k
 MggJRwgOK+MAG+L6gG2LjJOKlFdkUNv1Y5hQKUDUCW4xa+rhvzF/QvhIQ A==;
X-CSE-ConnectionGUID: p6tcmp9tQmSP1bv0M086fQ==
X-CSE-MsgGUID: ygeWq73TQPaoV82/hSIM/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="69760580"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="69760580"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 04:05:40 -0700
X-CSE-ConnectionGUID: nDOZNRrLTw2DpV00eyRs3Q==
X-CSE-MsgGUID: C8VW7jklQIS+r0mnFfdU3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="156039618"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.3])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 04:05:38 -0700
Date: Thu, 27 Mar 2025 12:05:34 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Arshad Mehmood <arshad.mehmood@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v2 1/6] drm/i915: Add the FIRST_CCS() helper
Message-ID: <Z-Uw_r1Z-T8y3r43@ashyti-mobl2.lan>
References: <20250326234005.1574688-1-andi.shyti@linux.intel.com>
 <20250326234005.1574688-2-andi.shyti@linux.intel.com>
 <87ldsq69g5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ldsq69g5.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 27, 2025 at 12:42:50PM +0200, Jani Nikula wrote:
> On Thu, 27 Mar 2025, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> > From: Andi Shyti <andi.shyti@intel.com>
> >
> > Some GPUs, like DG2, can host more than one CCS engine. Some
> > workarounds or enablements need to happen only once for all the
> > engines in the GT—for example, on the engine with the lowest
> > instance.
> >
> > The FIRST_CCS() helper first checks if the engine is a Compute
> > engine, and then whether it's the one with the lowest instance.
> >
> > Signed-off-by: Andi Shyti <andi.shyti@intel.com>
> > ---
> >  drivers/gpu/drm/i915/i915_drv.h | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> > index 54538b6f85df..5cb501393c4b 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > @@ -619,6 +619,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
> >  #define CCS_MASK(gt) \
> >  	ENGINE_INSTANCES_MASK(gt, CCS0, I915_MAX_CCS)
> >  
> > +#define FIRST_CCS(e__) \
> > +	(CCS_MASK(e__->gt) && (__ffs(CCS_MASK(e__->gt)) == e__->instance))
> > +
> 
> Could I persuade you to find a more specific header file for this, along
> with the CCS_MASK etc.?

yes, sure, I think this should go inside the gt/ (I don't also
like the name FIRST_CCS but could not come out with anything
better).

All the engine related defines should go inside the gt/, I will
take care of it, but that's argument for another patch.

Thanks, Jani,
Andi
