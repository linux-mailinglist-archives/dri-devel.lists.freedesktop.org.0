Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E80E960580
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 11:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B76C310E2C5;
	Tue, 27 Aug 2024 09:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TIKnEEzt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2568010E2C4;
 Tue, 27 Aug 2024 09:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724750758; x=1756286758;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=B4dA+/5fkc9q2zK29QK5Hkx1aQOvzqEjEkOR5JHxeSs=;
 b=TIKnEEztywS0ssRy+bwRb4Wyj3AOmfFBfrHMJnuP53Zhkas8aYOr/Ktz
 UXWkBX94e+VH5PyRjh8Cp5tY3eDctmPECvHAmJxaOillnqBgFP2Nh3Kj0
 zqyCo+vzl1WtmpVOD5sp+hwEXMLsBftGGMa3vRUjvKa6PFhKGpnEZ+EdE
 mxTeacZVe1of6eEsowY4t5Mn1OAcsrmiAAzS7ulS7atMDhEkm5j8S/31Z
 95oRIRBMwiY6UxNl7yHtM+Vf6dWg8zzuCnrTg1d0lK4Re5GgsSYlwfE73
 1e+JCL8rPvt79YvrOfRt3hn4yU4/xgr8xhb8OskPYeq8C8C9D1QSM+iFS Q==;
X-CSE-ConnectionGUID: OFIZOPwWSEWCCSK2hfqNSg==
X-CSE-MsgGUID: Yv/GO8yzT1OY5x6nlhDdcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="34369297"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="34369297"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 02:25:58 -0700
X-CSE-ConnectionGUID: S1aKBeZySFKuIw/tj6zIOQ==
X-CSE-MsgGUID: 4ygJC75lRvC4+YCZ+coyDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="63120656"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.243])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 02:25:55 -0700
Date: Tue, 27 Aug 2024 11:25:49 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH v3 00/15] CCS static load balance
Message-ID: <Zs2bnfyTuSJpHxRd@ashyti-mobl2.lan>
References: <20240823130855.72436-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823130855.72436-1-andi.shyti@linux.intel.com>
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

Hi Chris,

just a kind ping: any chance you can take a look at this? I would
really appreciate.

Thanks,
Andi

On Fri, Aug 23, 2024 at 03:08:40PM +0200, Andi Shyti wrote:
> Hi,
> 
> This patch series introduces static load balancing for GPUs with
> multiple compute engines. It's a lengthy series, and some
> challenging aspects still need to be resolved.
> 
> I have tried to split the work as much as possible to facilitate
> the review process.
> 
> To summarize, in patches 1 to 14, no functional changes occur
> except for the addition of the num_cslices interface. The
> significant changes happen in patch 15, which is the core part of
> the CCS mode setting, utilizing the groundwork laid in the
> earlier patches.
> 
> In this updated approach, the focus is now on managing the UABI
> engine list, which controls the engines exposed to userspace.
> Instead of manipulating phuscal engines and their memory, we now
> handle engine exposure through this list.
> 
> I would greatly appreciate further input from all reviewers who
> have already assisted with the previous work.
> 
> IGT tests have also been developed, but I haven't sent them yet.
> 
> Thank you Chris for the offline reviews.
> 
> Thanks,
> Andi
> 
> Changelog:
> ==========
> PATCHv2 -> PATCHv3
> ------------------
>  - Fix a NULL pointer dereference during module unload.
>    In i915_gem_driver_remove() I was accessing the gt after the
>    gt was removed. Use the dev_priv, instead (obviously!).
>  - Fix a lockdep issue: Some of the uabi_engines_mutex unlocks
>    were not correctly placed in the exit paths.
>  - Fix a checkpatch error for spaces after and before parenthesis
>    in the for_each_enabled_engine() definition.
> 
> PATCHv1 -> PATCHv2
> ------------------
>  - Use uabi_mutex to protect the uabi_engines, not the engine
>    itself. Rename it to uabi_engines_mutex.
>  - Use kobject_add/kobject_del for adding and removing
>    interfaces, this way we don't need to destroy and recreate the
>    engines, anymore. Refactor intel_engine_add_single_sysfs() to
>    reflect this scenario.
>  - After adding engines to the rb_tree check that they have been
>    added correctly.
>  - Fix rb_find_add() compare function to take into accoung also
>    the class, not just the instance.
> 
> RFCv2 -> PATCHv1
> ----------------
>  - Removed gt->ccs.mutex
>  - Rename m -> width, ccs_id -> engine in
>    intel_gt_apply_ccs_mode().
>  - In the CCS register value calculation
>    (intel_gt_apply_ccs_mode()) the engine (ccs_id) needs to move
>    along the ccs_mask (set by the user) instead of the
>    cslice_mask.
>  - Add GEM_BUG_ON after calculating the new ccs_mask
>    (update_ccs_mask()) to make sure all angines have been
>    evaluated (i.e. ccs_mask must be '0' at the end of the
>    algorithm).
>  - move wakeref lock before evaluating intel_gt_pm_is_awake() and
>    fix exit path accordingly.
>  - Use a more compact form in intel_gt_sysfs_ccs_init() and
>    add_uabi_ccs_engines() when evaluating sysfs_create_file(): no
>    need to store the return value to the err variable which is
>    unused. Get rid of err.
>  - Print a warnging instead of a debug message if we fail to
>    create the sysfs files.
>  - If engine files creation fails in
>    intel_engine_add_single_sysfs(), print a warning, not an
>    error.
>  - Rename gt->ccs.ccs_mask to gt->ccs.id_mask and add a comment
>    to explain its purpose.
>  - During uabi engine creation, in
>    intel_engines_driver_register(), the uabi_ccs_instance is
>    redundant because the ccs_instances is already tracked in
>    engine->uabi_instance.
>  - Mark add_uabi_ccs_engines() and remove_uabi_ccs_engines() as
>    __maybe_unused not to break bisectability. They wouldn't
>    compile in their own commit. They will be used in the next
>    patch and the __maybe_unused is removed.
>  - Update engine's workaround every time a new mode is set in
>    update_ccs_mask().
>  - Mark engines as valid or invalid using their status as
>    rb_node. Invalid engines are marked as invalid using
>    RB_CLEAR_NODE(). Execbufs will check for their validity when
>    selecting the engine to be combined to a context.
>  - Create for_each_enabled_engine() which skips the non valid
>    engines and use it in selftests.
> 
> RFCv1 -> RFCv2
> --------------
> Compared to the first version I've taken a completely different
> approach to adding and removing engines. in v1 physical engines
> were directly added and removed, along with the memory allocated
> to them, each time the user changed the CCS mode (from the
> previous cover letter).
> 
> Andi Shyti (15):
>   drm/i915/gt: Avoid using masked workaround for CCS_MODE setting
>   drm/i915/gt: Move the CCS mode variable to a global position
>   drm/i915/gt: Allow the creation of multi-mode CCS masks
>   drm/i915/gt: Refactor uabi engine class/instance list creation
>   drm/i915/gem: Mark and verify UABI engine validity
>   drm/i915/gt: Introduce for_each_enabled_engine() and apply it in
>     selftests
>   drm/i915/gt: Manage CCS engine creation within UABI exposure
>   drm/i915/gt: Remove cslices mask value from the CCS structure
>   drm/i915/gt: Expose the number of total CCS slices
>   drm/i915/gt: Store engine-related sysfs kobjects
>   drm/i915/gt: Store active CCS mask
>   drm/i915: Protect access to the UABI engines list with a mutex
>   drm/i915/gt: Isolate single sysfs engine file creation
>   drm/i915/gt: Implement creation and removal routines for CCS engines
>   drm/i915/gt: Allow the user to change the CCS mode through sysfs
> 
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   |   3 +
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  28 +-
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  23 --
>  drivers/gpu/drm/i915/gt/intel_engine_types.h  |   2 +
>  drivers/gpu/drm/i915/gt/intel_engine_user.c   |  62 ++-
>  drivers/gpu/drm/i915/gt/intel_gt.c            |   3 +
>  drivers/gpu/drm/i915/gt/intel_gt.h            |  12 +
>  drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c   | 353 +++++++++++++++++-
>  drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h   |   5 +-
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs.c      |   2 +
>  drivers/gpu/drm/i915/gt/intel_gt_types.h      |  19 +-
>  drivers/gpu/drm/i915/gt/intel_workarounds.c   |   8 +-
>  drivers/gpu/drm/i915/gt/selftest_context.c    |   6 +-
>  drivers/gpu/drm/i915/gt/selftest_engine_cs.c  |   4 +-
>  .../drm/i915/gt/selftest_engine_heartbeat.c   |   6 +-
>  drivers/gpu/drm/i915/gt/selftest_engine_pm.c  |   6 +-
>  drivers/gpu/drm/i915/gt/selftest_execlists.c  |  52 +--
>  drivers/gpu/drm/i915/gt/selftest_gt_pm.c      |   2 +-
>  drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  22 +-
>  drivers/gpu/drm/i915/gt/selftest_lrc.c        |  18 +-
>  drivers/gpu/drm/i915/gt/selftest_mocs.c       |   6 +-
>  drivers/gpu/drm/i915/gt/selftest_rc6.c        |   4 +-
>  drivers/gpu/drm/i915/gt/selftest_reset.c      |   8 +-
>  .../drm/i915/gt/selftest_ring_submission.c    |   2 +-
>  drivers/gpu/drm/i915/gt/selftest_rps.c        |  14 +-
>  drivers/gpu/drm/i915/gt/selftest_timeline.c   |  14 +-
>  drivers/gpu/drm/i915/gt/selftest_tlb.c        |   2 +-
>  .../gpu/drm/i915/gt/selftest_workarounds.c    |  14 +-
>  drivers/gpu/drm/i915/gt/sysfs_engines.c       |  79 ++--
>  drivers/gpu/drm/i915/gt/sysfs_engines.h       |   2 +
>  drivers/gpu/drm/i915/i915_cmd_parser.c        |   2 +
>  drivers/gpu/drm/i915/i915_debugfs.c           |   4 +
>  drivers/gpu/drm/i915/i915_drv.h               |   5 +
>  drivers/gpu/drm/i915/i915_gem.c               |   4 +
>  drivers/gpu/drm/i915/i915_perf.c              |   8 +-
>  drivers/gpu/drm/i915/i915_pmu.c               |  11 +-
>  drivers/gpu/drm/i915/i915_query.c             |  21 +-
>  37 files changed, 643 insertions(+), 193 deletions(-)
> 
> -- 
> 2.45.2
