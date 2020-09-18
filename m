Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ACA2702F3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 19:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB49B6ED3F;
	Fri, 18 Sep 2020 17:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6642B6ED3E;
 Fri, 18 Sep 2020 17:10:08 +0000 (UTC)
IronPort-SDR: 5cq5OSJ+obZnS7ydEhr24UzxlffEgd6fR3TWs77H/vgNyZloTxk9+7LnwjDVWhRX8bJXcpk0ay
 vdoOp1bZP2sw==
X-IronPort-AV: E=McAfee;i="6000,8403,9748"; a="159304759"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="159304759"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 10:10:07 -0700
IronPort-SDR: X4IJnje9UOuVdYFlyQvVeSXhRm8LtSeWqPHBeMArsSthArjyp9URw9o7JnoxpLIO7XIIbYsjqC
 c9W+Mj6ClBJg==
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="508943785"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.201])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 10:10:07 -0700
Date: Fri, 18 Sep 2020 13:12:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [Intel-gfx] [PATCH 0/4] managed drm_device, absolute final
 leftover bits
Message-ID: <20200918171221.GB716636@intel.com>
References: <20200918132505.2316382-1-daniel.vetter@ffwll.ch>
 <CADnq5_NW_k6szxmLxvf+tca4-D7oUfkLg1W-P0Q8AjVPBK_=iQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_NW_k6szxmLxvf+tca4-D7oUfkLg1W-P0Q8AjVPBK_=iQ@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 18, 2020 at 11:03:12AM -0400, Alex Deucher wrote:
> On Fri, Sep 18, 2020 at 9:25 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > Hi all,
> >
> > These are the leftovers of the leftovers of my initial drmm series to
> > manage drm_device.
> >
> > Changes:
> > - bugfixed i915 selftests
> > - patch from Luben to finalize the admgpu conversion
> >
> > Alex & i915 maintainers, pls ack for merging this all through
> > drm-misc-next since otherwise the final patch (and the resulting confusion
> > with outdated docs) is held up another round.
> 
> Acked-by: Alex Deucher <alexander.deucher@amd.com>


Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> >
> > Cheers, Daniel
> >
> > Daniel Vetter (3):
> >   drm/i915/selftest: Create mock_destroy_device
> >   drm/i915/selftests: align more to real device lifetimes
> >   drm/dev: Remove drm_dev_init
> >
> > Luben Tuikov (1):
> >   drm/amdgpu: Convert to using devm_drm_dev_alloc() (v2)
> >
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 16 ++----
> >  drivers/gpu/drm/drm_drv.c                     | 41 ++--------------
> >  drivers/gpu/drm/drm_internal.h                |  1 +
> >  drivers/gpu/drm/drm_managed.c                 | 13 -----
> >  .../gpu/drm/i915/gem/selftests/huge_pages.c   |  2 +-
> >  .../drm/i915/gem/selftests/i915_gem_context.c |  2 +-
> >  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  2 +-
> >  .../drm/i915/gem/selftests/i915_gem_object.c  |  2 +-
> >  .../drm/i915/gem/selftests/i915_gem_phys.c    |  2 +-
> >  drivers/gpu/drm/i915/gt/selftest_timeline.c   |  2 +-
> >  .../gpu/drm/i915/selftests/i915_gem_evict.c   |  2 +-
> >  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  2 +-
> >  drivers/gpu/drm/i915/selftests/i915_request.c |  2 +-
> >  drivers/gpu/drm/i915/selftests/i915_vma.c     |  2 +-
> >  .../drm/i915/selftests/intel_memory_region.c  |  2 +-
> >  .../gpu/drm/i915/selftests/mock_gem_device.c  | 49 ++++++++++++-------
> >  .../gpu/drm/i915/selftests/mock_gem_device.h  |  2 +
> >  include/drm/drm_drv.h                         |  4 --
> >  18 files changed, 51 insertions(+), 97 deletions(-)
> >
> > --
> > 2.28.0
> >
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
