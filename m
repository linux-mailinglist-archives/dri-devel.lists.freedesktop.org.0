Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D93A8A7D556
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 09:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B3D10E331;
	Mon,  7 Apr 2025 07:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Alnv8xh8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531B810E32E;
 Mon,  7 Apr 2025 07:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744010267; x=1775546267;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=XA8lnQcE0ouvfuzyiI1j3jvd3iAkaYmuoqLOg4BNbYU=;
 b=Alnv8xh8www5imZ7/JBw9D323x4MvRuSbEm5IxLkkHmzX6QUZsvIsXJV
 REy2nBwtDuHkQmXR1nScdsLtUheJOohYS0hCPGY3qtyQUvix4t6QAMYEg
 nzIJOdkySbPb6o274ydKYp5FQsd0/JeQj3Z86GhsifM44XXkP8eh6ORLS
 tcpQ6/iisEYdSTLg3hhfPOM5og8ioRRs89Q0Z6wDjB76SD8a8Qs9P42PK
 MnBrLTXRSIVWxKsLGI3D8YlpDwZS0dR0ao8B32jOSQ+NKV1uA7vYuqlRb
 ssfuQGMWogVGdVgWezI5zzjxuuWFutzp+Xpp5rMPkUz2JQsQ8VNYH1BQt g==;
X-CSE-ConnectionGUID: 7IbVYoxHR5K4vApAXksm7Q==
X-CSE-MsgGUID: 7pkumStCS9qdDTRSMJZlZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="48093714"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="48093714"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 00:17:47 -0700
X-CSE-ConnectionGUID: ba+i4eG2SK2sumghvQt8Xw==
X-CSE-MsgGUID: Ij/6vasiTuWTBDiU4lA9XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="127846702"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.51])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 00:17:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 0/4] kbuild: resurrect generic header check facility
In-Reply-To: <CAK7LNAS6o_66bUB6-qj6NnaTRNKvu5ycxOP+kGfizYVBNjZAyw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250402124656.629226-1-jani.nikula@intel.com>
 <CAK7LNAS6o_66bUB6-qj6NnaTRNKvu5ycxOP+kGfizYVBNjZAyw@mail.gmail.com>
Date: Mon, 07 Apr 2025 10:17:40 +0300
Message-ID: <878qoczbhn.fsf@intel.com>
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

On Fri, 04 Apr 2025, Masahiro Yamada <masahiroy@kernel.org> wrote:
> On Wed, Apr 2, 2025 at 9:47=E2=80=AFPM Jani Nikula <jani.nikula@intel.com=
> wrote:
>>
>> Another go at hiding the turds.
>>
>> In v1 [1] I hid the build artifacts under .hdrtest subdirectories, one i=
n each
>> $(obj) directory, but the feedback from Linus [2] was to have one top le=
vel
>> directory for this.
>>
>> This is not possible without turning the whole thing back into a generic=
 header
>> check facility. Personally, I think this is a good thing. Just look at p=
atches
>> 2-4, it's great.
>>
>> The main reason we've been doing this in the subsystem/driver level at a=
ll is
>> the opposition from the kbuild maintainer. We'd very much like for Masah=
iro to
>> support us in our efforts, but without that support, we're limited to ha=
cking in
>> the subsystem/driver Makefiles.
>>
>> BR,
>> Jani.
>>
>>
>> [1] https://lore.kernel.org/r/20250401121830.21696-1-jani.nikula@intel.c=
om
>>
>> [2] https://lore.kernel.org/r/CAHk-=3DwiP0ea7xq2P3ryYs6xGWoqTw1E4jha67Zb=
JkaFrjqUdkQ@mail.gmail.com
>>
>>
>> Cc: Linus Torvalds <torvalds@linux-foundation.org>
>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>
>
> NACK.
>
> This does not solve any real issue, except making Linus happy
> - Sure, he is happy as long as he no longer has to see the turds.
>
> This patch merely hides the turds by moving all the
> header-test build artifacts under the .header-check/
> and introducing CONFIG_HEADER_CHECK_DISABLE.
> Yes, Linus advised us to hide all the turds because he cares
> about the TAB-completion.
>
> But to me, from the Kbuild perspective, this is not a solution at all.
> What is worse, Jani is pushing his workaround into the common
> Kbuild Makefiles, which I maintain, and he is even make this
> broken feature widely accessible.
>
> I agree with Jason.
> His idea sounds better, although I do not have enough time
> for investigating it further or implementing it now.
>
>
> At least, this patchset is not something we should rush into.

I expect much better rationale for NAKs than this.

The shortcoming in this series is that it offloads the decision *which*
header files to check to the subsystems and drivers that actually opt-in
to having the header files to be checked. Because you have to opt-in
anyway, because not everyone wants this.

This makes concrete forward progress, and enables subsystems (like drm)
and drivers (like i915 and xe) have their headers checked the way they
want. It converts the local hacks into a generic solution. And does not
block future improvements.

Even with Jason's idea [1], you *still* have to start small and opt-in
(i.e. the patch series at hand). You can't just start off by testing
every header in one go, because it's a flag day switch. There'll be so
many warnings that it's useless. This series only spotted one omission
of header guards, because we've gradually cleaned stuff up. Oh, and
there's the small detail that the idea is not backed up by any code or
testing.

I fully expect sharp and concrete technical review, but handwavy "does
not solve any real issue", "workaround", and "broken feature" comments
don't help anyone.

With this type of antagonistic rather than encouraging attitude towards
contributions, there's just no way I can justify to myself (or my
employer) spending more time on what looks like a wild goose chase. I
have zero confidence that no matter what I do I'd get approval from you.

And this is the primary reason subsystems and drivers hack up stuff in
their little corners of the kernel instead of sticking their necks out
and trying to generalize anything.

BR,
Jani.


[1] https://lore.kernel.org/r/20250401191455.GC325917@nvidia.com


>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Simona Vetter <simona.vetter@ffwll.ch>
>> Cc: linux-kbuild@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: intel-xe@lists.freedesktop.org
>> Cc: intel-gfx@lists.freedesktop.org
>>
>>
>> Jani Nikula (4):
>>   kbuild: add generic header check facility
>>   drm: switch to generic header check facility
>>   drm/i915: switch to generic header check facility
>>   drm/xe: switch to generic header check facility
>>
>>  drivers/gpu/drm/Kconfig           |  2 +-
>>  drivers/gpu/drm/Makefile          | 15 +--------------
>>  drivers/gpu/drm/i915/Makefile     | 14 ++------------
>>  drivers/gpu/drm/xe/Makefile       | 10 ++--------
>>  drivers/gpu/drm/xe/xe_pcode_api.h |  4 ++++
>>  include/drm/Makefile              | 15 +--------------
>>  init/Kconfig                      | 25 +++++++++++++++++++++++++
>>  scripts/Makefile.build            | 13 +++++++++++++
>>  scripts/Makefile.lib              |  7 +++++++
>>  9 files changed, 56 insertions(+), 49 deletions(-)
>>
>> --
>> 2.39.5
>>

--=20
Jani Nikula, Intel
