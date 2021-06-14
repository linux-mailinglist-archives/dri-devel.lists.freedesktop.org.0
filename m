Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 312783A5D38
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 08:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2336489D53;
	Mon, 14 Jun 2021 06:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F86689DB4;
 Mon, 14 Jun 2021 06:47:36 +0000 (UTC)
IronPort-SDR: 2gqv1rMp2qr2CXOZ8RECocnNb42xuwm08mb/Kq1Uc4uMH6xRi2XIaTE0Mr+Cdlv5/Sd5X9oFBZ
 yg57EFP4QXEQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10014"; a="205585054"
X-IronPort-AV: E=Sophos;i="5.83,272,1616482800"; d="scan'208";a="205585054"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2021 23:47:35 -0700
IronPort-SDR: VANaoVw9vsRHWnOOHI6P30cNoqRgsIVvFyiKI8GyKjIDxcBNOJ5c9UC64EK0ZJ7H2Wk9BWYVZ4
 3gl7cUixClCw==
X-IronPort-AV: E=Sophos;i="5.83,272,1616482800"; d="scan'208";a="420689176"
Received: from iaoflynx-mobl3.amr.corp.intel.com (HELO localhost)
 ([10.252.30.21])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2021 23:46:32 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <dbdd436a-523d-f7d2-db2e-15ea45f435ca@suse.de>
References: <eb71ee2d-3413-6ca8-0b7c-a58695f00b77@linux.intel.com>
 <162340805657.68262.6607541005525077753@jlahtine-mobl.ger.corp.intel.com>
 <162340998262.68262.6045527397253780242@jlahtine-mobl.ger.corp.intel.com>
 <dbdd436a-523d-f7d2-db2e-15ea45f435ca@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PULL] topic/i915-ttm
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <162365318254.3468.3267791653088176005@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Mon, 14 Jun 2021 09:46:22 +0300
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

Quoting Thomas Zimmermann (2021-06-13 21:54:03)
> Hi Joonas
>=20
> Am 11.06.21 um 13:13 schrieb Joonas Lahtinen:
> > Quoting Joonas Lahtinen (2021-06-11 13:40:56)
> >> Quoting Maarten Lankhorst (2021-06-11 12:27:15)
> >>> Pull request for drm-misc-next and drm-intel-gt-next.
> >>>
> >>> topic/i915-ttm-2021-06-11:
> >>> drm-misc and drm-intel pull request for topic/i915-ttm:
> >>> - Convert i915 lmem handling to ttm.
> >>> - Add a patch to temporarily add a driver_private member to vma_node.
> >>> - Use this to allow mixed object mmap handling for i915.
> >>> The following changes since commit 1bd8a7dc28c1c410f1ceefae1f2a97c06d=
1a67c2:
> >>>
> >>>    Merge tag 'exynos-drm-next-for-v5.14' of git://git.kernel.org/pub/=
scm/linux/kernel/git/daeinki/drm-exynos into drm-next (2021-06-11 14:19:12 =
+1000)
> >>
> >> This base is not in drm-misc-next or drm-intel-gt-next, so effectively
> >> we would end up pulling 478 extra commits from drm-next as a result. A=
nd
> >> also causing all the warnings for those commits. I don't think we shou=
ld
> >> do that?
> >>
> >> The common ancestor would be ccd1950c2f7e38ae45aeefb99a08b39407cd6c63
> >> "Merge tag 'drm-intel-gt-next-2021-05-28' of git://anongit.freedesktop=
.org/drm/drm-intel into drm-next"
> >> Should we re-do the topic branch based on that?
> >=20
> > This problem seems to come from the fact that only the PR from yesterday
> > that got merged to drm-next had the dependency patches. The previous
> > backmerge of drm-next was requested too early.
> >=20
> > I've solved this with least hassle by backmerging drm-next again and
> > then applying the PR to drm-intel-gt-next.
> >=20
> > I think drm-misc-next should do the same (exact commit was
> > 1bd8a7dc28c1c410f1ceefae1f2a97c06d1a67c2).
>=20
> I did a backmerge from drm-next recently and drm-misc-next can merge the =

> patches in tags/topic/i915-ttm-2021-06-11 without additions.
>=20
> I assume you to updated drm-intel-gt-next without redoing the PR?

Correct.

Regards, Joonas

>=20
> Best regards
> Thomas
>=20
> >=20
> > Regards, Joonas
> >=20
> >> However the DIM docs[1] indeed do say: "For topic branches shared with=
in
> >> the gpu/drm subsystem, base it on the latest drm-next branch." I think
> >> the docs don't take into account the current period where drm-next is
> >> being actively updated as we speak.
> >>
> >> Should we update the docs to use 'git merge-base' or something else?
> >>
> >> Regards, Joonas
> >>
> >> [1]: https://drm.pages.freedesktop.org/maintainer-tools/dim.html#cross=
-subsystem-topic-branches
> >>
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>    git://anongit.freedesktop.org/drm/drm-misc tags/topic/i915-ttm-202=
1-06-11
> >>>
> >>> for you to fetch changes up to cf3e3e86d77970211e0983130e896ae2426010=
03:
> >>>
> >>>    drm/i915: Use ttm mmap handling for ttm bo's. (2021-06-11 10:53:25=
 +0200)
> >>>
> >>> ----------------------------------------------------------------
> >>> drm-misc and drm-intel pull request for topic/i915-ttm:
> >>> - Convert i915 lmem handling to ttm.
> >>> - Add a patch to temporarily add a driver_private member to vma_node.
> >>> - Use this to allow mixed object mmap handling for i915.
> >>>
> >>> ----------------------------------------------------------------
> >>> Maarten Lankhorst (2):
> >>>        drm/vma: Add a driver_private member to vma_node.
> >>>        drm/i915: Use ttm mmap handling for ttm bo's.
> >>>
> >>> Thomas Hellstr=C3=B6m (2):
> >>>        drm/i915/ttm: Introduce a TTM i915 gem object backend
> >>>        drm/i915/lmem: Verify checks for lmem residency
> >>>
> >>>   drivers/gpu/drm/drm_gem.c                          |   9 -
> >>>   drivers/gpu/drm/i915/Makefile                      |   1 +
> >>>   drivers/gpu/drm/i915/display/intel_display.c       |   2 +-
> >>>   drivers/gpu/drm/i915/gem/i915_gem_create.c         |   9 +-
> >>>   drivers/gpu/drm/i915/gem/i915_gem_lmem.c           | 126 ++--
> >>>   drivers/gpu/drm/i915/gem/i915_gem_lmem.h           |   5 -
> >>>   drivers/gpu/drm/i915/gem/i915_gem_mman.c           |  83 ++-
> >>>   drivers/gpu/drm/i915/gem/i915_gem_object.c         | 143 +++--
> >>>   drivers/gpu/drm/i915/gem/i915_gem_object.h         |  19 +-
> >>>   drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |  30 +-
> >>>   drivers/gpu/drm/i915/gem/i915_gem_pages.c          |   3 +-
> >>>   drivers/gpu/drm/i915/gem/i915_gem_region.c         |   6 +-
> >>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c            | 647 ++++++++++=
+++++++++++
> >>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.h            |  48 ++
> >>>   drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |  90 +--
> >>>   drivers/gpu/drm/i915/gt/intel_region_lmem.c        |   3 +-
> >>>   drivers/gpu/drm/i915/i915_gem.c                    |   5 +-
> >>>   drivers/gpu/drm/i915/intel_memory_region.c         |   1 -
> >>>   drivers/gpu/drm/i915/intel_memory_region.h         |   1 -
> >>>   drivers/gpu/drm/i915/intel_region_ttm.c            |   8 +-
> >>>   drivers/gpu/drm/i915/intel_region_ttm.h            |  11 +-
> >>>   drivers/gpu/drm/i915/selftests/igt_mmap.c          |  25 +-
> >>>   drivers/gpu/drm/i915/selftests/igt_mmap.h          |  12 +-
> >>>   include/drm/drm_vma_manager.h                      |   2 +-
> >>>   24 files changed, 1039 insertions(+), 250 deletions(-)
> >>>   create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> >>>   create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm.h
>=20
> --=20
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>=20
