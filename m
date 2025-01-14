Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0104BA102EB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 10:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2CE10E12B;
	Tue, 14 Jan 2025 09:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bla/8NyJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B1010E103
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 09:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736846553; x=1768382553;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=jM3aQF/V7ROCNUJbA5YlAjn0Z2uHE1HMCotaEhPYWv0=;
 b=bla/8NyJRTFOcwgahkzXUyh4tzWoKosWcq/ntuJKQahC9ypLBQ+n5CHI
 /wtK3xeufZt66G48kI3jAfy4OLCVPkI2ZT0dMVp2F5H2ozME5Qya/CjR1
 17wuQx3/zUQwTsQu+0mczNdWrocWiETxp167KkR6rsjQKban51vAuGXio
 2tp0WV87GTkwcQeoPxB3oE0EzfG32tSvvBsaAziHQE8ZSydjtiL7LYlq+
 CYvYUuTJAoUKDU56iF2Y+r/lnqXRDLcrdMx466Xzl5UJIdd22CSu0oRQZ
 fVKVQyRdwXfKHhmvNel/HW3aJKEgbSpqNDyspN2BFvG7KtbkE6XLy22Lv w==;
X-CSE-ConnectionGUID: AA+uUSPLQOa8rDgUA0/6Fg==
X-CSE-MsgGUID: 77hgab3rT/Wswtu+0pyO2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="54549943"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; d="scan'208";a="54549943"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 01:22:33 -0800
X-CSE-ConnectionGUID: MrWU+AF7TKim4rsN3zqS+w==
X-CSE-MsgGUID: 2cql6zWLQI6Ut3NSf2PJ+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; d="scan'208";a="109738408"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.230])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 01:22:30 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 stable@vger.kernel.org, ashutosh.dixit@intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: AAARRRGGGHHH!!!! (was Re: [PATCH 6.12.y] xe/oa: Fix query mode
 of operation for OAR/OAC)
In-Reply-To: <CAPM=9txHupDKRShZLe8FA2kJwov-ScDASqJouUdxbMZ3X=U1-Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <2025010650-tuesday-motivate-5cbb@gregkh>
 <20250110205341.199539-1-umesh.nerlige.ramappa@intel.com>
 <2025011215-agreeing-bonfire-97ae@gregkh>
 <CAPM=9txHupDKRShZLe8FA2kJwov-ScDASqJouUdxbMZ3X=U1-Q@mail.gmail.com>
Date: Tue, 14 Jan 2025 11:22:26 +0200
Message-ID: <871px5iwbx.fsf@intel.com>
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

On Tue, 14 Jan 2025, Dave Airlie <airlied@gmail.com> wrote:
> On Sun, 12 Jan 2025 at 22:19, Greg KH <gregkh@linuxfoundation.org> wrote:
>>
>> On Fri, Jan 10, 2025 at 12:53:41PM -0800, Umesh Nerlige Ramappa wrote:
>> > commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f16 upstream
>>
>> <snip>
>>
>> > Fixes: 8135f1c09dd2 ("drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA =
stream close")
>> > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > Reviewed-by: Matthew Brost <matthew.brost@intel.com> # commit 1
>> > Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> > Cc: stable@vger.kernel.org # 6.12+
>> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> > Link: https://patchwork.freedesktop.org/patch/msgid/20241220171919.571=
528-2-umesh.nerlige.ramappa@intel.com
>> > (cherry picked from commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f16)
>> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>>
>> Oh I see what you all did here.
>>
>> I give up.  You all need to stop it with the duplicated git commit ids
>> all over the place.  It's a major pain and hassle all the time and is
>> something that NO OTHER subsystem does.
>
> Let me try and work out what you think is the problem with this
> particular commit as I read your email and I don't get it.
>
> This commit is in drm-next as  55039832f98c7e05f1cf9e0d8c12b2490abd0f16
> and says Fixes: 8135f1c09dd2 ("drm/xe/oa: Don't reset
> OAC_CONTEXT_ENABLE on OA stream close)
>
> It was pulled into drm-fixes a second time as a cherry-pick from next
> as f0ed39830e6064d62f9c5393505677a26569bb56
> (cherry picked from commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f16)
>
> Now the commit it Fixes: 8135f1c09dd2 is also at
> 0c8650b09a365f4a31fca1d1d1e9d99c56071128
>
> Now the above thing you wrote is your cherry-picked commit for stable?
> since I don't see
> (cherry picked from commit f0ed39830e6064d62f9c5393505677a26569bb56)
> in my tree anywhere.

The automatic cherry-pick for 6.12 stable failed, and Umesh provided the
manually cherry-picked patch for it, apparently using -x in the process,
adding the second cherry-pick annotation. The duplicate annotation
hasn't been merged to any tree, it's not part of the process, it's just
what happened with this manual stable backport. I think it would be wise
to ignore that part of the whole discussion. It's really not that
relevant.

BR,
Jani.


>
> So this patch comes into stable previously as
> f0ed39830e6064d62f9c5393505677a26569bb56 ? and then when it comes in
> as 55039832f98c7e05f1cf9e0d8c12b2490abd0f16 you didn't notice you
> already had it, (there is where I think the extra step of searching in
> git history for the patch (this seems easily automatable) should come
> in.
>
> Or is the concern with the Fixes: line referencing the wrong thing?
>
> Dave.
>>
>> Yes, I know that DRM is special and unique and running at a zillion
>> times faster with more maintainers than any other subsystem and really,
>> it's bigger than the rest of the kernel combined, but hey, we ALL are a
>> common project here.  If each different subsystem decided to have their
>> own crazy workflows like this, we'd be in a world of hurt.  Right now
>> it's just you all that is causing this world of hurt, no one else, so
>> I'll complain to you.
>>
>> We have commits that end up looking like they go back in time that are
>> backported to stable releases BEFORE they end up in Linus's tree and
>> future releases.  This causes major havoc and I get complaints from
>> external people when they see this as obviously, it makes no sense at
>> all.
>>
>> And it easily breaks tools that tries to track where backports went and
>> if they are needed elsewhere, which ends up missing things because of
>> this crazy workflow.  So in the end, it's really only hurting YOUR
>> subsystem because of this.
>>
>> And yes, there is a simple way to fix this, DO NOT TAG COMMITS THAT ARE
>> DUPLICATES AS FOR STABLE.  Don't know why you all don't do that, would
>> save a world of hurt.
>>
>> I'm tired of it, please, just stop.  I am _this_ close to just ignoring
>> ALL DRM patches for stable trees...
>>
>> greg k-h

--=20
Jani Nikula, Intel
