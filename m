Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C12B1A814DF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 20:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9944010E71B;
	Tue,  8 Apr 2025 18:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VjCD8Fa0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B32910E2D5;
 Tue,  8 Apr 2025 18:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744137769; x=1775673769;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Gk2fzlQjUCLt/ACS0iGbHiEoJLXRFDn3gd/CajWFMrU=;
 b=VjCD8Fa0q0AkmAYAovpyJYKPnGMNQZZjXUPuMyfKRswhm4zwlHTwuGdb
 /DGkAQ90vLRgebWCjX5wr6X5Xm4DxWI8Rrpb5mEZX0vFBuCsZCVstX+ix
 oDdS1q1BTpegp+VkIIJIuLZA7wfkV7s+MBlQj3kKAGZ35Os/u0PyeTHfB
 3En4ANe0aRjR3z4MYV3wJv9OngoBHsV7NdEdmdPNTc4goudu78CA06LFM
 vLFT06UMMmCKtuk6y34a7Tm3ckIy7OvIG+OJDNHiydLnjsYp1Pg4vsgPM
 Alci5EAVPa0n9UyL/TtW7/zjJQu/ZtFjar3njedpTn7UvAS3lLYJLOXDB A==;
X-CSE-ConnectionGUID: q4hDUFdXRj+Y3UsZ6MDQSg==
X-CSE-MsgGUID: 1Pv0dyBPQ/K9mbxsZcv+dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49385086"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="49385086"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 11:42:43 -0700
X-CSE-ConnectionGUID: iCCNA21DQBKQORjCd8kn8A==
X-CSE-MsgGUID: bvmlVMOTTxaX/KP11+a2QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="133219858"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.137])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 11:42:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 0/4] kbuild: resurrect generic header check facility
In-Reply-To: <20250408160127.GD1778492@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250402124656.629226-1-jani.nikula@intel.com>
 <CAK7LNAS6o_66bUB6-qj6NnaTRNKvu5ycxOP+kGfizYVBNjZAyw@mail.gmail.com>
 <878qoczbhn.fsf@intel.com> <20250407171209.GJ1557073@nvidia.com>
 <871pu3ys4x.fsf@intel.com> <20250408160127.GD1778492@nvidia.com>
Date: Tue, 08 Apr 2025 21:42:36 +0300
Message-ID: <87friixzoj.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 08 Apr 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
> On Tue, Apr 08, 2025 at 11:27:58AM +0300, Jani Nikula wrote:
>> On Mon, 07 Apr 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
>> > On Mon, Apr 07, 2025 at 10:17:40AM +0300, Jani Nikula wrote:
>> >
>> >> Even with Jason's idea [1], you *still* have to start small and opt-in
>> >> (i.e. the patch series at hand). You can't just start off by testing
>> >> every header in one go, because it's a flag day switch. 
>> >
>> > You'd add something like 'make header_check' that does not run
>> > automatically. Making it run automatically after everything is fixed
>> > to keep it fixed would be the flag day change. It is how we have
>> > managed to introduce other warning levels in the past.
>> 
>> That approach does not help *me* or drm, i915 and xe in the least. They
>> are already fixed, and we want a way to keep them fixed. This is how all
>> of this got started.
>
> I imagine you'd include a way to have the 'make header_check' run on
> some subset of files only, then use that in your CI for the interm.
>
>> Your goal may be to make everything self-contained, but AFAICS there is
>> no agreement on that goal. As long as there's no buy-in to this, it's
>> not possible fix everything, it's an unreachable goal.
>
> I didn't see that. I saw technical problems with the implementation
> that was presented. I'd be shocked if there was broad opposition to
> adding missing includes and forward declaration to most headers. It is
> a pretty basic C thing. :\

Unless I'm mistaken, both Linus and Masahiro have said they disagree
with headers having to be self-contained as a general rule, regardless
of the issues with kconfig and the build artifacts.

We actually had header checks back in 2019 but it was reverted basically
without discussion with commit fcbb8461fd23 ("kbuild: remove header
compile test"). Sure, there were issues, but still removed without an
attempt to address the issues. Since then it's been skunkworks in
i915. There's a reason this has felt like an uphill battle, and why I'm
reluctant to putting effort into much more than small incremental steps
at a time.

> Until someone sends a series trying to add missing includes and
> forward declarations we can't really know..
>
>> Arguably the situation is similar to W=1 builds. We can't run W=1 in our
>> CI, because of failures outside of the drivers we maintain. 
>
> You can run W=1 using a subdirectory build just for your drivers.

I don't think there's a way to build the entire kernel while limiting
W=1 warnings to a subdirectory, is there? Mixing W=1 and regular builds
causes everything to be rebuilt due to dependencies. It's not only for
CI, it's also for developers.

>> Even if I put in the effort to generalize this the way you prefer, I
>> guess a few kernel releases from now, it still would not do what we have
>> already in place in i915 and xe. And, no offense, but I think your
>> proposal is technically vague to start with. I really don't know where
>> the goal posts are.
>
> Well, I spent a little bit and wrote a mock up and did some looking at
> how much work is here. Focusing on allnoconfig as a starting point,
> 293 out of 1858 headers failed to build, and with some fiddling I got
> it down to 150, a couple of hours would get patches made for the vast
> majority of it.
>
> https://github.com/jgunthorpe/linux/commits/hdrcheck/
>
> I don't see the same dire view as you do, it seems reasonable and doable.

Thanks for the proof-of-concept. It's just that I don't see how that
could be bolted to kbuild, with dependency tracking. I don't want to
have to rebuild the world every time something changes.

Say, I'm refactoring stuff, and I want to ensure headers are okay every
step of the way. git rebase -i origin -x 'make header_check'. How do you
only check the headers whose dependencies were changed since the
previous commit? That requires looking at the .cmd again.


BR,
Jani.


-- 
Jani Nikula, Intel
