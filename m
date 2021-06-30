Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 901A93B808A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 12:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B7036E97D;
	Wed, 30 Jun 2021 10:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3196C6E97D;
 Wed, 30 Jun 2021 10:05:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10030"; a="208271095"
X-IronPort-AV: E=Sophos;i="5.83,311,1616482800"; d="scan'208";a="208271095"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2021 03:05:43 -0700
X-IronPort-AV: E=Sophos;i="5.83,311,1616482800"; d="scan'208";a="457157823"
Received: from teutenbb-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.61.253])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2021 03:05:38 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PULL] drm-intel-next-fixes
In-Reply-To: <YNtsfguvCRSROBUZ@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <YNtsfguvCRSROBUZ@intel.com>
Date: Wed, 30 Jun 2021 13:05:35 +0300
Message-ID: <87zgv7r7kg.fsf@intel.com>
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
Cc: dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Jun 2021, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> Hi Dave and Daniel,
>
> Here goes drm-intel-next-fixes-2021-06-29:
>
> The biggest fix is the restoration of mmap ioctl for gen12 integrated par=
ts
> which lack was breaking ADL-P with media stack.
> Besides that a small selftest fix and a theoretical overflow on
> i915->pipe_to_crtc_mapping.

My last fixes pull for v5.13 fell between the cracks [1]. There was one
stable worthy fix, but since it was still in drm-intel-fixes when you
ran dim cherry-pick-next-fixes, it was skipped for drm-intel-next-fixes.

I've now dropped the commit and pushed v5.13 to drm-intel-fixes, as
we're past that point. Subsequent dim cherry-pick-next-fixes should pick
it up now.

Please do another next fixes pull request with that. (It's okay to pull
this one already though, doesn't make a difference.)


BR,
Jani.


[1] https://lore.kernel.org/r/87czsbu15r.fsf@intel.com



>
> Thanks,
> Rodrigo.
>
> The following changes since commit 1bd8a7dc28c1c410f1ceefae1f2a97c06d1a67=
c2:
>
>   Merge tag 'exynos-drm-next-for-v5.14' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/daeinki/drm-exynos into drm-next (2021-06-11 14:19:12 +1000)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2=
021-06-29
>
> for you to fetch changes up to c90c4c6574f3feaf2203b5671db1907a1e15c653:
>
>   drm/i915: Reinstate the mmap ioctl for some platforms (2021-06-28 07:43=
:56 -0400)
>
> ----------------------------------------------------------------
> The biggest fix is the restoration of mmap ioctl for gen12 integrated par=
ts
> which lack was breaking ADL-P with media stack.
> Besides that a small selftest fix and a theoretical overflow on
> i915->pipe_to_crtc_mapping.
>
> ----------------------------------------------------------------
> Chris Wilson (1):
>       drm/i915/selftests: Reorder tasklet_disable vs local_bh_disable
>
> Jani Nikula (1):
>       drm/i915/dsc: abstract helpers to get bigjoiner primary/secondary c=
rtc
>
> Thomas Hellstr=C3=B6m (1):
>       drm/i915: Reinstate the mmap ioctl for some platforms
>
>  drivers/gpu/drm/i915/display/intel_display.c       |  7 ++-
>  drivers/gpu/drm/i915/display/intel_display_types.h |  8 ++++
>  drivers/gpu/drm/i915/display/intel_vdsc.c          | 40 +++++++++++-----
>  drivers/gpu/drm/i915/display/intel_vdsc.h          |  1 +
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c           |  7 +--
>  drivers/gpu/drm/i915/gt/selftest_execlists.c       | 55 +++++++++++++---=
------
>  6 files changed, 76 insertions(+), 42 deletions(-)

--=20
Jani Nikula, Intel Open Source Graphics Center
