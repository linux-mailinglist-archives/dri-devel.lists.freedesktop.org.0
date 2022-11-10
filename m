Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C15623FCB
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 11:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D435710E6BF;
	Thu, 10 Nov 2022 10:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792CB10E6BE;
 Thu, 10 Nov 2022 10:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668076362; x=1699612362;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uVgiX/zFPDEXZOHQf+9zF3TK1MTRxn2ustH60bej19c=;
 b=G1YHl0nNtyobtSNe06ltzYIaKsrDEoxOzJZGxKBAKr6ink46WwSGMLhw
 nln3uQfUPLeT+Lt3ZMdxfC8saLHCKYRpt79P+PcQC/GA5Nh/QMXngwJXd
 blpeSzUXhm9h0HK8oL0AI8NNdQ7FMGttIg54bGC4HukJK1HC/JrcPAIHD
 w1iCCOePM4O4NlaLnl/YD4qDXmDRe5fNm3tEGsVGqV3fz9SwfXbZ4/3Xh
 oP3JIu8B8Z+VG5SnEa0RXGaKSXg0oBYsOLM6F31D2HbIuYIplS6mszO5y
 YV6Q3DahmYpcrKY7ch1rWaxYFBgU7OK9OoXl5SsxMcsSE7AGbVX2VZT+y A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="294624861"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="294624861"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 02:32:42 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="631610181"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="631610181"
Received: from isarikov-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.44.85])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 02:32:38 -0800
Date: Thu, 10 Nov 2022 11:32:34 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Thomas =?utf-8?B?SGVsbHN0cu+/vW0=?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 0/3] add guard padding around i915_vma
Message-ID: <Y2zTQrScGms4vK9A@ashyti-mobl2.lan>
References: <20221109174058.912720-1-andi.shyti@linux.intel.com>
 <f1f4123c3705c6883acdff4770e404704d54dc6e.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1f4123c3705c6883acdff4770e404704d54dc6e.camel@linux.intel.com>
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
Cc: Andi Shyti <andi@etezian.org>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, shawn.c.lee@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

> This has been on the list before (three times I think) and at that
> point it (the guard pages) was NAK'd by Daniel as yet another
> complication, and a VT-d
> scanout workaround was implemented and pushed using a different
> approach, initially outlined by Daniel.

I reckon that this is an old patch, but I've seen only reviews
and acks. I haven't seen anything against this patch.

So that as far as it concerns me, this patch should be good to
go, unless I missed something or there is any technical concern.

> Patch is 2ef6efa79fecd. Those suspend/resumes should now be fast.

This patch is not actually resolving the boot time delays, that
is the main concern coming from the users, and, just as a
post-mortem review, as Tvrtko has pointed out, this:

  +/* Intel Rapid Start Technology ACPI device name */
  +static const char irst_name[] = "INT3392";

is a bit scary because we are depending very much on the firmware
and whatever happens there is not under our control. It's an
hardcoded string that requires maintenance.

In any case, the two patches are somehow doing different things:
I don't see them conflicting and to me looks like a reasonable
optimization (otherwise I wouldn't have put my signature on it :))

Thanks again a lot for your thoughts and inputs,
Andi

> I then also discussed patch 1 separately with Dave Airlie and Daniel
> and since both me and Dave liked it, Daniel OK'd it, but it never made
> it upstream.
> 
> Just a short heads up on the history.
> 
> /Thomas
> 
> 
> On Wed, 2022-11-09 at 18:40 +0100, Andi Shyti wrote:
> > Hi,
> > 
> > This series adds guards around vma's but setting a pages at the
> > beginning and at the end that work as padding.
> > 
> > The first user of the vma guard are scanout objects which don't
> > need anymore to add scratch to all the unused ggtt's and speeding
> > up up considerably the boot and resume by several hundreds of
> > milliseconds up to over a full second in slower machines.
> > 
> > Andi
> > 
> > Chris Wilson (3):
> >   drm/i915: Wrap all access to i915_vma.node.start|size
> >   drm/i915: Introduce guard pages to i915_vma
> >   drm/i915: Refine VT-d scanout workaround
> > 
> >  drivers/gpu/drm/i915/display/intel_fbdev.c    |  2 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_domain.c    | 13 ++++
> >  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 33 ++++++-----
> >  drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  2 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  2 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_tiling.c    |  4 +-
> >  .../gpu/drm/i915/gem/selftests/huge_pages.c   |  2 +-
> >  .../i915/gem/selftests/i915_gem_client_blt.c  | 23 ++++----
> >  .../drm/i915/gem/selftests/i915_gem_context.c | 15 +++--
> >  .../drm/i915/gem/selftests/i915_gem_mman.c    |  2 +-
> >  .../drm/i915/gem/selftests/igt_gem_utils.c    |  7 ++-
> >  drivers/gpu/drm/i915/gt/gen7_renderclear.c    |  2 +-
> >  drivers/gpu/drm/i915/gt/intel_ggtt.c          | 39 ++++--------
> >  drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  |  3 +-
> >  drivers/gpu/drm/i915/gt/intel_renderstate.c   |  2 +-
> >  .../gpu/drm/i915/gt/intel_ring_submission.c   |  2 +-
> >  drivers/gpu/drm/i915/gt/selftest_engine_cs.c  |  8 +--
> >  drivers/gpu/drm/i915/gt/selftest_execlists.c  | 18 +++---
> >  drivers/gpu/drm/i915/gt/selftest_hangcheck.c  | 15 ++---
> >  drivers/gpu/drm/i915/gt/selftest_lrc.c        | 16 ++---
> >  .../drm/i915/gt/selftest_ring_submission.c    |  2 +-
> >  drivers/gpu/drm/i915/gt/selftest_rps.c        | 12 ++--
> >  .../gpu/drm/i915/gt/selftest_workarounds.c    |  8 +--
> >  drivers/gpu/drm/i915/i915_cmd_parser.c        |  4 +-
> >  drivers/gpu/drm/i915/i915_debugfs.c           |  2 +-
> >  drivers/gpu/drm/i915/i915_gem_gtt.h           |  3 +-
> >  drivers/gpu/drm/i915/i915_perf.c              |  2 +-
> >  drivers/gpu/drm/i915/i915_vma.c               | 59 +++++++++++++----
> > --
> >  drivers/gpu/drm/i915/i915_vma.h               | 52 +++++++++++++++-
> >  drivers/gpu/drm/i915/i915_vma_resource.c      |  4 +-
> >  drivers/gpu/drm/i915/i915_vma_resource.h      | 17 ++++--
> >  drivers/gpu/drm/i915/i915_vma_types.h         |  3 +-
> >  drivers/gpu/drm/i915/selftests/i915_request.c | 20 +++----
> >  drivers/gpu/drm/i915/selftests/igt_spinner.c  |  8 +--
> >  34 files changed, 246 insertions(+), 160 deletions(-)
> > 
