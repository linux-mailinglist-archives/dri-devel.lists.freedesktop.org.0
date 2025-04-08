Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20180A7F7D1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 10:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911DB10E60B;
	Tue,  8 Apr 2025 08:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y058KRFk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324A910E609;
 Tue,  8 Apr 2025 08:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744100887; x=1775636887;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=5nkU3pywDyYpm6B8QE8CDHNm5Jg/YRm60RtxsBZZNSY=;
 b=Y058KRFk8hOwB9yZI97YzWZkaE8/l62Y5wSc9x/2415BY1WH5x+sFetT
 1i1AJDpIazokkaYFTwYv/gifcIS2bEp/Ox5+sr3okyxnm5pjhBZo74U3/
 4BAErl/bQEDLpyb++RAVblxw5ywnICo8ARoonQu7i/pmcl7PhxTrB3XHa
 +6I+mNqQW+A2v950gZFvBIGvUT7bd/appcmWL/MGoeIEH8fY4hmcBzQ68
 T3mROt7AH0oQIw7xJsA4jrKeGb7le1QLQXdDUwBWKORGkL6VNPZi8YLZg
 492lC4sfRnnE9MeF+vAjruVAjdyrefyzEYwV2V2p1tYmeuzxUcdayXp3v A==;
X-CSE-ConnectionGUID: fi8rLrUxSNCHQ7jP0eqUSw==
X-CSE-MsgGUID: J7tD4R9fQLmddu97OqC+QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56886010"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="56886010"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 01:28:05 -0700
X-CSE-ConnectionGUID: x4G6H6sxTuWnpeVE/j3SIA==
X-CSE-MsgGUID: NQh7EQA9Q5aZcEeLBdZO1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="133066492"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.137])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 01:28:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 0/4] kbuild: resurrect generic header check facility
In-Reply-To: <20250407171209.GJ1557073@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250402124656.629226-1-jani.nikula@intel.com>
 <CAK7LNAS6o_66bUB6-qj6NnaTRNKvu5ycxOP+kGfizYVBNjZAyw@mail.gmail.com>
 <878qoczbhn.fsf@intel.com> <20250407171209.GJ1557073@nvidia.com>
Date: Tue, 08 Apr 2025 11:27:58 +0300
Message-ID: <871pu3ys4x.fsf@intel.com>
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

On Mon, 07 Apr 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
> On Mon, Apr 07, 2025 at 10:17:40AM +0300, Jani Nikula wrote:
>
>> Even with Jason's idea [1], you *still* have to start small and opt-in
>> (i.e. the patch series at hand). You can't just start off by testing
>> every header in one go, because it's a flag day switch. 
>
> You'd add something like 'make header_check' that does not run
> automatically. Making it run automatically after everything is fixed
> to keep it fixed would be the flag day change. It is how we have
> managed to introduce other warning levels in the past.

That approach does not help *me* or drm, i915 and xe in the least. They
are already fixed, and we want a way to keep them fixed. This is how all
of this got started.

Your goal may be to make everything self-contained, but AFAICS there is
no agreement on that goal. As long as there's no buy-in to this, it's
not possible fix everything, it's an unreachable goal.

Arguably the situation is similar to W=1 builds. We can't run W=1 in our
CI, because of failures outside of the drivers we maintain. Thus we add
most W=1 checks manually in our Makefiles, and keep our drivers warning
free. This is what we want for headers too. But the key difference is
that there *is* general consensus that W=1 fixes should be merged.

Perhaps inadvertently, you're making it harder for the people who are on
board with your goal to do their part of the job in their corner of the
kernel.

> If you added the infrastructure there is a whole list of people on
> kernel-janitors that would probably help with the trivial cleanups to
> make it run clean.
>
>> With this type of antagonistic rather than encouraging attitude towards
>> contributions, there's just no way I can justify to myself (or my
>> employer) spending more time on what looks like a wild goose chase. I
>> have zero confidence that no matter what I do I'd get approval from you.
>
> I think you've been given a clear direction on what would be accepted
> and have the option to persue it. Claiming that is "antagonistic"
> seems unnecessary.

I have to disagree on both of those points.

>> And this is the primary reason subsystems and drivers hack up stuff in
>> their little corners of the kernel instead of sticking their necks out
>> and trying to generalize anything.
>
> Seems to me like this is the usual case of generalizing being actually
> hard, you almost always have to actually do more work to succeed.

I think you and me both share the idea that most headers should be
self-contained. Neither Linus nor Masahiro seem to think that is
generally true. I've provided a way to opt-in for the checks. Linus
seems to find the approach acceptable. You and Masahiro don't.

I think I'm at an impasse.

Even if I put in the effort to generalize this the way you prefer, I
guess a few kernel releases from now, it still would not do what we have
already in place in i915 and xe. And, no offense, but I think your
proposal is technically vague to start with. I really don't know where
the goal posts are.


BR,
Jani.


-- 
Jani Nikula, Intel
