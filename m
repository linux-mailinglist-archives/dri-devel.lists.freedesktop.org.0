Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B289A782BF
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 21:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7EE10E65E;
	Tue,  1 Apr 2025 19:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CfomBACE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AABD10E65E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 19:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743535702; x=1775071702;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=BoO3X5sv35GYBzLBsKhBYN5I1B1lDr/gYUiTCSctubs=;
 b=CfomBACEqUJNBn6m7mmON8AqwHRUdvhj+ymRcDHVvMDY73VWqG25Z8mn
 jB7r8bTWPxRRz/NwbsdSLXR2nn31sjNv0fHhbwM3BA90dLWnc3wIKMuuS
 JFkQ/9t8G7jd4D3TpqDOnn8/M77a9BiFi0sBSl/7wYMYn59tr/HG1EHIu
 RCwJdFYCGCvF0h+N1qUgRwiU4Gt8huHl7lgM5XZKmCafQXe8r0bFLJ6sI
 ONtX8wLNuiv2vdFSIQvKZJAXxhZeSTX4cj8qR3wAZSZuX15Ylnk1uIcZe
 vCK+Y7o2Q1y5gvgh76R7lmQtzmLQ9rtLpWLECf2sdqNyv4SzdaRdB20ew g==;
X-CSE-ConnectionGUID: 67znQCauQ4e3eTOkC5+r7g==
X-CSE-MsgGUID: sHhjfq59TQu2K68Ncc6Mjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="48746206"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="48746206"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 12:28:22 -0700
X-CSE-ConnectionGUID: 7FkweBzBTBKclc8lK0FguA==
X-CSE-MsgGUID: +7L/gaqXTxah024DgvSOig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="131678505"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.7])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 12:28:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [git pull] drm for 6.15-rc1
In-Reply-To: <CAK7LNAQThGkgtKgquRPv8Ysi_omedRthF1_++apKda-xWeWcbA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
 <CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com>
 <87h6394i87.fsf@intel.com> <Z-p2ii-N2-dd_HJ6@phenom.ffwll.local>
 <20250331133137.GA263675@nvidia.com> <87tt782htn.fsf@intel.com>
 <CAHk-=wiP0ea7xq2P3ryYs6xGWoqTw1E4jha67ZbJkaFrjqUdkQ@mail.gmail.com>
 <CAK7LNAQThGkgtKgquRPv8Ysi_omedRthF1_++apKda-xWeWcbA@mail.gmail.com>
Date: Tue, 01 Apr 2025 22:28:16 +0300
Message-ID: <87a58z3cmn.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 02 Apr 2025, Masahiro Yamada <masahiroy@kernel.org> wrote:
> On Wed, Apr 2, 2025 at 1:12=E2=80=AFAM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> On Tue, 1 Apr 2025 at 05:21, Jani Nikula <jani.nikula@linux.intel.com> w=
rote:
>> >
>> > The header checks have existed for uapi headers before, including the,
>> > uh, turds, but apparently adding them in drm broke the camel's back.
>>
>> The uapi header test things never caused any problems for me [*],
>> because they don't actually pollute the source tree.
>>
>> Why? Because they all end up in that generated 'usr/include/' directory.
>>
>> So when I look at the source files, filename completion is entirely
>> unaffected, and it all works fine.
>>
>> Look, I can complete something like
>>
>>     include/uapi/asm-generic/poll.h
>>
>> perfectly fine, because there is *not* some generated turd that affects =
it all.
>>
>> Because for the uapi files those hdrtest files end up being in
>>
>>     ./usr/include/asm-generic/poll.hdrtest
>>
>> and I never have any reason to really look at that subdirectory at
>> all, since it's all generated.
>>
>> Or put another way - if I _were_ to look at it, it would be exactly
>> because I want to see some generated file, in which case the 'hdrtest'
>> turd would be part of it.
>>
>> (Although I cannot recall that ever having actually happened, to be
>> honest - but looking at various header files is common, and I hit the
>> drm case immediately)
>>
>> Would you mind taking more of that uapi approach than creating that
>> hidden directory specific to the drm tree? Maybe this could *all* be
>> generalized?
>>
>>            Linus
>>
>> [*] I say "never caused any problems for me", but maybe it did way in
>> the past and it was fixed and I just don't recall. I have definitely
>> complained about pathname completion issues to people before.
>
> I know you dislike this, and I NACKed this before (but too late):
> https://lore.kernel.org/dri-devel/CAK7LNATHXwEkjJHP7b-ZmhzLfyyuOdsyimna-=
=3Dr-sJk+DxigrA@mail.gmail.com/
>
> Compile-testing UAPI headers is useful
> (and I believe this is the only case where it is useful)
> because userspace is independent of any CONFIG option,
> and we have no control over the include order in
> userspace programs.
>
> In contrast, kernel-space headers are conditionally parsed,
> depending on CONFIG options.
>
> You dislike this feature for the reason of TAB-completion,
> but I am negative about this feature from another perspective.
>
> We cannot avoid a false-positive:
> https://lore.kernel.org/all/20190718130835.GA28520@lst.de/
>
> It is not <drm/*.h> but <linux/*.h>
> However, it is annoying to make every header self-contained
> "just because we are checking this".

As I explained earlier in the thread, it's not *just* about the headers
being self-contained. It's *also* about checking header guards and
kernel-doc, maybe other things in the future.

If it's possible to do opt-in build checks for this, and catch all of
these pre-merge, why shouldn't we? We can catch a whole class of build
issues and bypass the subsequent fixes with this, and make life easier
for us.

> Actually, it is not a real problem when the relevant
> CONFIG option is disabled.
> I did not interrupt him because he was doing this
> checkunder drivers/gpu/drm/i915/.
> ()
> But, I am opposed to expanding it to more-global include/drm/,
> or any other subsystem.
>
> In my opinion, the right fix is
> "git revert 62ae45687e43"
>
>
> If we continue this, maybe leave a caution
> in capital letters?

Or maybe let the subsystem and driver maintainers decide?

I don't think there's a *single* header under include/drm where them
being self-contained depends on a config option. I'm sure there are
plenty in include/linux, but I wouldn't say they *all* do.

Maybe help and support us in generalizing this in scripts/Makefile.build
to avoid the boilerplate, and make Linus happy, instead of trying to
block us from having nice things? Please?


BR,
Jani.


>
>
> diff --git a/include/Kbuild b/include/Kbuild
> index 5e76a599e2dd..4dff23ae51a4 100644
> --- a/include/Kbuild
> +++ b/include/Kbuild
> @@ -1 +1,3 @@
> +# The drm subsystem is strict about the self-containedness of header fil=
es.
> +# OTHER SUBSYSTEMS SHOULD NOT FOLLOW THIS PRACTICE.
>  obj-$(CONFIG_DRM_HEADER_TEST)  +=3D drm/
>
>
>
> --
> Best Regards
>
> Masahiro Yamada

--=20
Jani Nikula, Intel
