Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A323A40FE
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 13:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA3E6E02D;
	Fri, 11 Jun 2021 11:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349966E02D;
 Fri, 11 Jun 2021 11:13:10 +0000 (UTC)
IronPort-SDR: 4Q97dvMxe4D9JGLlrcEF9wk4PJvbG9YiJz1JR44yxuUQyBaSrmQHZK/QdCdqXJBC+zwV9gYFPa
 WmJDHlSO8ZmQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="202479652"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="202479652"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 04:13:09 -0700
IronPort-SDR: 903p1BPHrU/axw+WZ1VNhCHoQChyje1D51V5OGbvDcUGeZJ1ToZDiVgHZDbnTzvmSlVV2jSHUw
 IvRx0Qz9j6BA==
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="449079686"
Received: from moconno1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.12.31])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 04:13:05 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <162340805657.68262.6607541005525077753@jlahtine-mobl.ger.corp.intel.com>
References: <eb71ee2d-3413-6ca8-0b7c-a58695f00b77@linux.intel.com>
 <162340805657.68262.6607541005525077753@jlahtine-mobl.ger.corp.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PULL] topic/i915-ttm
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <162340998262.68262.6045527397253780242@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Fri, 11 Jun 2021 14:13:02 +0300
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, dim-tools@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Joonas Lahtinen (2021-06-11 13:40:56)
> Quoting Maarten Lankhorst (2021-06-11 12:27:15)
> > Pull request for drm-misc-next and drm-intel-gt-next.
> >=20
> > topic/i915-ttm-2021-06-11:
> > drm-misc and drm-intel pull request for topic/i915-ttm:
> > - Convert i915 lmem handling to ttm.
> > - Add a patch to temporarily add a driver_private member to vma_node.
> > - Use this to allow mixed object mmap handling for i915.
> > The following changes since commit 1bd8a7dc28c1c410f1ceefae1f2a97c06d1a=
67c2:
> >=20
> >   Merge tag 'exynos-drm-next-for-v5.14' of git://git.kernel.org/pub/scm=
/linux/kernel/git/daeinki/drm-exynos into drm-next (2021-06-11 14:19:12 +10=
00)
>=20
> This base is not in drm-misc-next or drm-intel-gt-next, so effectively
> we would end up pulling 478 extra commits from drm-next as a result. And
> also causing all the warnings for those commits. I don't think we should
> do that?
>=20
> The common ancestor would be ccd1950c2f7e38ae45aeefb99a08b39407cd6c63
> "Merge tag 'drm-intel-gt-next-2021-05-28' of git://anongit.freedesktop.or=
g/drm/drm-intel into drm-next"
> Should we re-do the topic branch based on that?

This problem seems to come from the fact that only the PR from yesterday
that got merged to drm-next had the dependency patches. The previous
backmerge of drm-next was requested too early.

I've solved this with least hassle by backmerging drm-next again and
then applying the PR to drm-intel-gt-next.

I think drm-misc-next should do the same (exact commit was
1bd8a7dc28c1c410f1ceefae1f2a97c06d1a67c2).

Regards, Joonas

> However the DIM docs[1] indeed do say: "For topic branches shared within
> the gpu/drm subsystem, base it on the latest drm-next branch." I think
> the docs don't take into account the current period where drm-next is
> being actively updated as we speak.
>=20
> Should we update the docs to use 'git merge-base' or something else?
>=20
> Regards, Joonas
>=20
> [1]: https://drm.pages.freedesktop.org/maintainer-tools/dim.html#cross-su=
bsystem-topic-branches
>=20
> >=20
> > are available in the Git repository at:
> >=20
> >   git://anongit.freedesktop.org/drm/drm-misc tags/topic/i915-ttm-2021-0=
6-11
> >=20
> > for you to fetch changes up to cf3e3e86d77970211e0983130e896ae242601003:
> >=20
> >   drm/i915: Use ttm mmap handling for ttm bo's. (2021-06-11 10:53:25 +0=
200)
> >=20
> > ----------------------------------------------------------------
> > drm-misc and drm-intel pull request for topic/i915-ttm:
> > - Convert i915 lmem handling to ttm.
> > - Add a patch to temporarily add a driver_private member to vma_node.
> > - Use this to allow mixed object mmap handling for i915.
> >=20
> > ----------------------------------------------------------------
> > Maarten Lankhorst (2):
> >       drm/vma: Add a driver_private member to vma_node.
> >       drm/i915: Use ttm mmap handling for ttm bo's.
> >=20
> > Thomas Hellstr=C3=B6m (2):
> >       drm/i915/ttm: Introduce a TTM i915 gem object backend
> >       drm/i915/lmem: Verify checks for lmem residency
> >=20
> >  drivers/gpu/drm/drm_gem.c                          |   9 -
> >  drivers/gpu/drm/i915/Makefile                      |   1 +
> >  drivers/gpu/drm/i915/display/intel_display.c       |   2 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_create.c         |   9 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_lmem.c           | 126 ++--
> >  drivers/gpu/drm/i915/gem/i915_gem_lmem.h           |   5 -
> >  drivers/gpu/drm/i915/gem/i915_gem_mman.c           |  83 ++-
> >  drivers/gpu/drm/i915/gem/i915_gem_object.c         | 143 +++--
> >  drivers/gpu/drm/i915/gem/i915_gem_object.h         |  19 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |  30 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_pages.c          |   3 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_region.c         |   6 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_ttm.c            | 647 +++++++++++++=
++++++++
> >  drivers/gpu/drm/i915/gem/i915_gem_ttm.h            |  48 ++
> >  drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |  90 +--
> >  drivers/gpu/drm/i915/gt/intel_region_lmem.c        |   3 +-
> >  drivers/gpu/drm/i915/i915_gem.c                    |   5 +-
> >  drivers/gpu/drm/i915/intel_memory_region.c         |   1 -
> >  drivers/gpu/drm/i915/intel_memory_region.h         |   1 -
> >  drivers/gpu/drm/i915/intel_region_ttm.c            |   8 +-
> >  drivers/gpu/drm/i915/intel_region_ttm.h            |  11 +-
> >  drivers/gpu/drm/i915/selftests/igt_mmap.c          |  25 +-
> >  drivers/gpu/drm/i915/selftests/igt_mmap.h          |  12 +-
> >  include/drm/drm_vma_manager.h                      |   2 +-
> >  24 files changed, 1039 insertions(+), 250 deletions(-)
> >  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> >  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm.h
