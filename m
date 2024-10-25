Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4429AF983
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 08:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC05E10E9F5;
	Fri, 25 Oct 2024 06:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J45KmdDq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED7E10E9F3;
 Fri, 25 Oct 2024 06:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729836233; x=1761372233;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=AkVVkARjSxdSmyHPmy1ajU4UyyQGT4kUuLCo9GdsoJs=;
 b=J45KmdDqSLuksA2LQPDWBIZSf1t/pgK6PLpGnrDu/T2W9l5HFeEFbj4x
 l7cKtVYXtl0o2EimtfNuZPDc+gNA7FfWmVcPrHgksZiJ1RzsGtujte+wd
 56WywbRuj/QFr2Dcp3Y9nKLGZQZynYcYNPfrnSRMsxismuEtYdtLJsz3J
 n7ot7eFaHofv9+fY9VR4mSG7PALCJQnC2uumQOo1TMW3Hh0byvPylFccc
 /PtwSPwYwdy0K3ip8wulH1HgHNlmx1wT9XrUICAGmVSM8W7jH2sd7HR6U
 E7wH6yG1DbepYuR7sxZcDCPkpVSp0zImszVs2s1XYS1HZvVDEh2YKV8ZP w==;
X-CSE-ConnectionGUID: 3X0a9kQyROWXgrrHixVYzA==
X-CSE-MsgGUID: lvZBaJkuScu6Xeyb9WH1/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29435683"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29435683"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 23:03:53 -0700
X-CSE-ConnectionGUID: X1+pzynwSKK0C/rlDR5g+g==
X-CSE-MsgGUID: NPcwojJ/RNmkf13XrLOeBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="80922126"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 24 Oct 2024 23:03:49 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 25 Oct 2024 09:03:49 +0300
Date: Fri, 25 Oct 2024 09:03:49 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/display: plane property for async supported
 modifiers
Message-ID: <Zxs0xT1tp9ToPDoo@intel.com>
References: <20241016053626.2850384-1-arun.r.murthy@intel.com>
 <Zw-_6yuy139Zmir3@intel.com> <Zw_FgeZFATAk-aMf@intel.com>
 <Zw_HHn42gYFvjWmP@intel.com>
 <IA0PR11MB73076CAE9CF2258CF83F8F49BA472@IA0PR11MB7307.namprd11.prod.outlook.com>
 <IA0PR11MB7307CD2E8E7D15D982662127BA4F2@IA0PR11MB7307.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <IA0PR11MB7307CD2E8E7D15D982662127BA4F2@IA0PR11MB7307.namprd11.prod.outlook.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 25, 2024 at 04:28:18AM +0000, Murthy, Arun R wrote:
> > > Subject: Re: [PATCH] drm/i915/display: plane property for async
> > > supported modifiers
> > >
> > > On Wed, Oct 16, 2024 at 04:54:09PM +0300, Ville Syrjälä wrote:
> > > > On Wed, Oct 16, 2024 at 04:30:19PM +0300, Ville Syrjälä wrote:
> > > > > On Wed, Oct 16, 2024 at 11:06:26AM +0530, Arun R Murthy wrote:
> > > > > > Create a i915 private plane property for sharing the async
> > > > > > supported modifiers to the user.
> > > > > > UMD related discussion requesting the same
> > > > > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29618#
> > > > > > no
> > > > > > te_2487123
> > > > > >
> > > > > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > > > > ---
> > > > > >  .../gpu/drm/i915/display/intel_atomic_plane.c |  6 +++
> > > > > >  .../drm/i915/display/intel_display_types.h    |  4 ++
> > > > > >  .../drm/i915/display/skl_universal_plane.c    | 49
> > ++++++++++++++++++-
> > > > >
> > > > > This whole thing belongs in the drm core.
> > > >
> > > > And I don't even see an actual implementation of anything here.
> > > > Why did you even post this when it doesn't do anything?
> > > >
> > > > Anyways, thinking about how we might actually implement this, we can
> > > > probably leverage
> > > > https://patchwork.freedesktop.org/patch/619047/?series=139807&rev=3
> > >
> > > Although we should probably pass the format to that as well...
> > >
> > The blob points to the struct with elements, modifier and formats.
> > The main intention of this patch to get the i915 plane private property.
> > The reason for not having this as drm property is we are the only user for this
> > and no other vendor has this restriction.
> > 
> 
> Any comments on this?

Seeinag as the patch does nothing so there is nothing to 
comment beyond what I already said.

-- 
Ville Syrjälä
Intel
