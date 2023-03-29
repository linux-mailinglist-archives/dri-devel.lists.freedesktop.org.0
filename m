Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D5A6CD9D5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 15:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E9110E178;
	Wed, 29 Mar 2023 13:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6727A10E178;
 Wed, 29 Mar 2023 13:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680094904; x=1711630904;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=M8LKsGXgrEqKUdUv7wna8yZG8GZaTqDF9eASbo6RR20=;
 b=KABxY8Zz6vZt1+KlMht+x3N03bhi9lM/PetjnvdViivKCktlHowzPTrH
 afGoNt7BpDZe5z4YgBOT6wf5AZnkrhWI17QArjswm59r4/R6UMpwFbTwu
 jw0/9WL2vsArEY13SulW7ELQEzKp22OGp6MAvlp+mYu9wihlcIvCXFSg6
 ED2W8rajGa42K1QgPlm4Qervd79LUd/yXf9jVzJhj/yFVR3iHE84DEMAg
 TlQTv8qPMHIxs7pB+TeDbMO/yxcqad9YUFuVNkBlI1MLIHeZExm8R/pQb
 vy8Mu9qtkpERd8/heBa8TXsblO+cDg0tJFnDvCZ8jlD95LJOZSAxF4oGb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="368638256"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="368638256"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 06:01:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="1014010988"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="1014010988"
Received: from ostermam-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.249.32.144])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 06:01:35 -0700
Date: Wed, 29 Mar 2023 15:01:10 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH v6 0/8] drm/i915: use ref_tracker library for tracking
 wakerefs
Message-ID: <ZCQ2lr6/ITBdBqce@ashyti-mobl2.lan>
References: <20230224-track_gt-v6-0-0dc8601fd02f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224-track_gt-v6-0-0dc8601fd02f@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Eric Dumazet <edumazet@google.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Eric, David (Miller),

Could you please check the ref_tracker portion of this series?

This patch has reached its 6th version, and we need your approval
to proceed.

Thank you,
Andi

On Wed, Mar 29, 2023 at 09:24:12AM +0200, Andrzej Hajda wrote:
> Gently ping for network developers, could you look at ref_tracker patches,
> as the ref_tracker library was developed for network.
> 
> This is revived patchset improving ref_tracker library and converting
> i915 internal tracker to ref_tracker.
> The old thread ended without consensus about small kernel allocations,
> which are performed under spinlock.
> I have tried to solve the problem by splitting the calls, but it results
> in complicated API, so I went back to original solution.
> If there are better solutions I am glad to discuss them.
> Meanwhile I send original patchset with addressed remaining comments.
> 
> To: Jani Nikula <jani.nikula@linux.intel.com>
> To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> To: Rodrigo Vivi <rodrigo.vivi@intel.com>
> To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> To: David Airlie <airlied@gmail.com>
> To: Daniel Vetter <daniel@ffwll.ch>
> Cc: linux-kernel@vger.kernel.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: netdev@vger.kernel.org
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Das, Nirmoy <nirmoy.das@linux.intel.com>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> ---
> Changes in v6:
> - rebased to solve minor conflict and allow CI testing
> - Link to v5: https://lore.kernel.org/r/20230224-track_gt-v5-0-77be86f2c872@intel.com
> 
> Changes in v5 (thx Andi for review):
> - use *_locked convention instead of __*,
> - improved commit messages,
> - re-worked i915 patches, squashed separation and conversion patches,
> - added tags,
> - Link to v4: https://lore.kernel.org/r/20230224-track_gt-v4-0-464e8ab4c9ab@intel.com
> 
> Changes in v4:
> - split "Separate wakeref tracking" to smaller parts
> - fixed typos,
> - Link to v1-v3: https://patchwork.freedesktop.org/series/100327/
> 
> ---
> Andrzej Hajda (7):
>       lib/ref_tracker: add unlocked leak print helper
>       lib/ref_tracker: improve printing stats
>       lib/ref_tracker: add printing to memory buffer
>       lib/ref_tracker: remove warnings in case of allocation failure
>       drm/i915: Correct type of wakeref variable
>       drm/i915: Replace custom intel runtime_pm tracker with ref_tracker library
>       drm/i915: track gt pm wakerefs
> 
> Chris Wilson (1):
>       drm/i915/gt: Hold a wakeref for the active VM
> 
>  drivers/gpu/drm/i915/Kconfig.debug                 |  19 ++
>  drivers/gpu/drm/i915/display/intel_display_power.c |   2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |   7 +-
>  .../drm/i915/gem/selftests/i915_gem_coherency.c    |  10 +-
>  drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |  14 +-
>  drivers/gpu/drm/i915/gt/intel_breadcrumbs.c        |  13 +-
>  drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h  |   3 +-
>  drivers/gpu/drm/i915/gt/intel_context.h            |  15 +-
>  drivers/gpu/drm/i915/gt/intel_context_types.h      |   2 +
>  drivers/gpu/drm/i915/gt/intel_engine_pm.c          |  10 +-
>  drivers/gpu/drm/i915/gt/intel_engine_types.h       |   2 +
>  .../gpu/drm/i915/gt/intel_execlists_submission.c   |   2 +-
>  drivers/gpu/drm/i915/gt/intel_gt_pm.c              |  12 +-
>  drivers/gpu/drm/i915/gt/intel_gt_pm.h              |  38 +++-
>  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |   4 +-
>  drivers/gpu/drm/i915/gt/selftest_engine_cs.c       |  20 +-
>  drivers/gpu/drm/i915/gt/selftest_gt_pm.c           |   5 +-
>  drivers/gpu/drm/i915/gt/selftest_reset.c           |  10 +-
>  drivers/gpu/drm/i915/gt/selftest_rps.c             |  17 +-
>  drivers/gpu/drm/i915/gt/selftest_slpc.c            |   5 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  11 +-
>  drivers/gpu/drm/i915/i915_driver.c                 |   2 +-
>  drivers/gpu/drm/i915/i915_pmu.c                    |  16 +-
>  drivers/gpu/drm/i915/intel_runtime_pm.c            | 221 ++-------------------
>  drivers/gpu/drm/i915/intel_runtime_pm.h            |  11 +-
>  drivers/gpu/drm/i915/intel_wakeref.c               |   7 +-
>  drivers/gpu/drm/i915/intel_wakeref.h               |  99 ++++++++-
>  include/linux/ref_tracker.h                        |  31 ++-
>  lib/ref_tracker.c                                  | 179 ++++++++++++++---
>  29 files changed, 456 insertions(+), 331 deletions(-)
> ---
> base-commit: d4c9fe2c8c9b66c5e5954f6ded7bc934dd6afe3e
> change-id: 20230224-track_gt-1b3da8bdacd7
> 
> Best regards,
> -- 
> Andrzej Hajda <andrzej.hajda@intel.com>
