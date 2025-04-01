Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A65ADA77B12
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 14:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E900010E59B;
	Tue,  1 Apr 2025 12:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IvjwSH6M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED25910E5A6
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 12:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743510867; x=1775046867;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=WpDvcGC95FdqXMwYCtR6rzRwchjYHGN+FRT/YTcwsfM=;
 b=IvjwSH6MMyUlepRORupTZbnxqW4CH+xpuWU8DfvRsPcPG5Prp1dmtmL1
 XxwLcVA6poKVzFGQeJHm14t8DKVdaPKmy+R9EMt947e2uxy5aBVdHTvqu
 JAJNxEwK2pAP+tlsG8SZ3M8mFTkd8myu3PO9yf0vy6gIn7Wt3BtqQlgA6
 NtdVUUu9QZMeTyP+Qw046Zys20MC/YMlPZ/ByfRG5h2EL7fNnDEXz4B4x
 55GjpGssOswqFRDtRTVRlGsQaltUFPuKnEzjeAlUF9JAdAgskL/AIedUE
 2bJpDTJxBhi+p5yE4+p0/li1487mUaFG2F68p0Juuc7mQJja1HVp+ZUdQ A==;
X-CSE-ConnectionGUID: AvBXPK8cQs+2VXE9EyuRBA==
X-CSE-MsgGUID: 5fpteAHyStSH0Qs2hv4kHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="55468742"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="55468742"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 05:34:25 -0700
X-CSE-ConnectionGUID: Xk03fOLUR8mypOoBYImmPA==
X-CSE-MsgGUID: 6u7+0urFQVeqnH8RBPzTvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="131509185"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.7])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 05:34:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Airlie <airlied@gmail.com>, simona.vetter@ffwll.ch, dri-devel
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [git pull] drm for 6.15-rc1
In-Reply-To: <CAHk-=wjMrqzuUmH-mFbR_46EWEFS=bB=J7h9ABMVy56Vi81PKQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
 <CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com>
 <87h6394i87.fsf@intel.com>
 <CAHk-=wjMrqzuUmH-mFbR_46EWEFS=bB=J7h9ABMVy56Vi81PKQ@mail.gmail.com>
Date: Tue, 01 Apr 2025 15:34:20 +0300
Message-ID: <87r02c2h83.fsf@intel.com>
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

On Mon, 31 Mar 2025, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> On Mon, 31 Mar 2025 at 03:17, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>
>> I suggest a Kconfig knob to truly make this opt-in, only for developers
>> who actually want it.
>
> So honestly, the thing I *really* hated was the horrendous naming.
>
> I live in auto-complete. I basically never type out file-names, and I
> replace keyboards every once in a while because my TAB key has worn
> down (not really, but you get the idea).
>
> And *if* this feature is useful - and while I disagree about the whole
> "header files have to be self-sufficient" as a general rule, I can see
> it being useful for uapi headers - then dammit, the file naming needs
> to *DIE*. It needs to be taken out behind the shed and shot in the
> head, because it messes with TAB-completion.
>
> Having "this has been checked" turds that live in the same name-space
> as real files is wrong.
>
> In the kernel, we often hide them explicitly (ie using the dot prefix
> to make them hide, but also to make them not mess with auto-complete).
> That's an option. But some people hate the hiding, and if that's an
> issue, just put it all in a different subdirectory entirely.
>
> Yes, I realize that you guys may live in the whole "different
> subdirectory entirely" world of doing the whole build in a separate
> build directory, and might say "why are you working in the same tree
> as the generated files in the first place if auto-complete is so
> important to you".
>
> And to that I say "because I equally often look at the generated
> files". When they make *sense* to look at, not when they are
> auto-generated makefile checking crap.
>
> So please. This feature needs to be done completely differently.

I've polished, or, more accurately, hidden the disgusting turds [1]. I
hope this is an acceptable approach.

I've never claimed this feature is universally useful, certainly not for
all of include/linux, but I think it has been more helpful than not in
i915 and xe drivers. And now hopefully drm more widely. I wish kbuild
had support for it in a way that drivers could opt-in *if* they wanted
it, but without copy-pasting the boilerplate.


BR,
Jani.


[1] https://lore.kernel.org/r/20250401121830.21696-1-jani.nikula@intel.com


-- 
Jani Nikula, Intel
