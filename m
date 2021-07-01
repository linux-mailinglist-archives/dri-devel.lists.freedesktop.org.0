Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7950A3B8F3A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 10:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3976E9B6;
	Thu,  1 Jul 2021 08:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2FA6E96D;
 Thu,  1 Jul 2021 08:58:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10031"; a="272352991"
X-IronPort-AV: E=Sophos;i="5.83,313,1616482800"; d="scan'208";a="272352991"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 01:58:02 -0700
X-IronPort-AV: E=Sophos;i="5.83,313,1616482800"; d="scan'208";a="447810806"
Received: from vgoluben-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.43.77])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 01:57:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PULL] drm-intel-next-fixes
In-Reply-To: <YNzAViVC1l4hE/uG@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <YNtsfguvCRSROBUZ@intel.com> <87zgv7r7kg.fsf@intel.com>
 <YNzAViVC1l4hE/uG@intel.com>
Date: Thu, 01 Jul 2021 11:57:53 +0300
Message-ID: <87k0maqulq.fsf@intel.com>
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
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Jun 2021, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Wed, Jun 30, 2021 at 01:05:35PM +0300, Jani Nikula wrote:
>> On Tue, 29 Jun 2021, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>> > Hi Dave and Daniel,
>> >
>> > Here goes drm-intel-next-fixes-2021-06-29:
>> >
>> > The biggest fix is the restoration of mmap ioctl for gen12 integrated =
parts
>> > which lack was breaking ADL-P with media stack.
>> > Besides that a small selftest fix and a theoretical overflow on
>> > i915->pipe_to_crtc_mapping.
>>=20
>> My last fixes pull for v5.13 fell between the cracks [1]. There was one
>> stable worthy fix, but since it was still in drm-intel-fixes when you
>> ran dim cherry-pick-next-fixes, it was skipped for drm-intel-next-fixes.
>>=20
>> I've now dropped the commit and pushed v5.13 to drm-intel-fixes, as
>> we're past that point. Subsequent dim cherry-pick-next-fixes should pick
>> it up now.
>
> it didn't, probably because the Fixes hash not being part of the drm-next=
 yet?!

Odd, should be.

> I can cherry-pick that directly. Please let me know the commit id.

c88e2647c5bb ("drm/i915/display: Do not zero past infoframes.vsc")

Thanks,
Jani.


>
> Thanks,
> Rodrigo.
>
>>=20
>> Please do another next fixes pull request with that. (It's okay to pull
>> this one already though, doesn't make a difference.)
>>=20
>>=20
>> BR,
>> Jani.
>>=20
>>=20
>> [1] https://lore.kernel.org/r/87czsbu15r.fsf@intel.com
>>=20
>>=20
>>=20
>> >
>> > Thanks,
>> > Rodrigo.
>> >
>> > The following changes since commit 1bd8a7dc28c1c410f1ceefae1f2a97c06d1=
a67c2:
>> >
>> >   Merge tag 'exynos-drm-next-for-v5.14' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/daeinki/drm-exynos into drm-next (2021-06-11 14:19:12 +1=
000)
>> >
>> > are available in the Git repository at:
>> >
>> >   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixe=
s-2021-06-29
>> >
>> > for you to fetch changes up to c90c4c6574f3feaf2203b5671db1907a1e15c65=
3:
>> >
>> >   drm/i915: Reinstate the mmap ioctl for some platforms (2021-06-28 07=
:43:56 -0400)
>> >
>> > ----------------------------------------------------------------
>> > The biggest fix is the restoration of mmap ioctl for gen12 integrated =
parts
>> > which lack was breaking ADL-P with media stack.
>> > Besides that a small selftest fix and a theoretical overflow on
>> > i915->pipe_to_crtc_mapping.
>> >
>> > ----------------------------------------------------------------
>> > Chris Wilson (1):
>> >       drm/i915/selftests: Reorder tasklet_disable vs local_bh_disable
>> >
>> > Jani Nikula (1):
>> >       drm/i915/dsc: abstract helpers to get bigjoiner primary/secondar=
y crtc
>> >
>> > Thomas Hellstr=C3=B6m (1):
>> >       drm/i915: Reinstate the mmap ioctl for some platforms
>> >
>> >  drivers/gpu/drm/i915/display/intel_display.c       |  7 ++-
>> >  drivers/gpu/drm/i915/display/intel_display_types.h |  8 ++++
>> >  drivers/gpu/drm/i915/display/intel_vdsc.c          | 40 +++++++++++--=
---
>> >  drivers/gpu/drm/i915/display/intel_vdsc.h          |  1 +
>> >  drivers/gpu/drm/i915/gem/i915_gem_mman.c           |  7 +--
>> >  drivers/gpu/drm/i915/gt/selftest_execlists.c       | 55 +++++++++++++=
---------
>> >  6 files changed, 76 insertions(+), 42 deletions(-)
>>=20
>> --=20
>> Jani Nikula, Intel Open Source Graphics Center

--=20
Jani Nikula, Intel Open Source Graphics Center
