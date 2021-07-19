Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CD93CCFF9
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 11:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16A389FD4;
	Mon, 19 Jul 2021 09:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CB489FD4;
 Mon, 19 Jul 2021 09:06:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="209117168"
X-IronPort-AV: E=Sophos;i="5.84,251,1620716400"; d="scan'208";a="209117168"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 02:06:05 -0700
X-IronPort-AV: E=Sophos;i="5.84,251,1620716400"; d="scan'208";a="631841379"
Received: from mtlovett-mobl.ger.corp.intel.com (HELO [10.213.196.244])
 ([10.213.196.244])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 02:06:04 -0700
Subject: Re: [Intel-gfx] [PATCH 00/51] GuC submission support
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210716201724.54804-1-matthew.brost@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <2f8b02d6-4079-a013-53de-d0f87122bc9a@linux.intel.com>
Date: Mon, 19 Jul 2021 10:06:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716201724.54804-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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


On 16/07/2021 21:16, Matthew Brost wrote:
> As discussed in [1], [2] we are enabling GuC submission support in the
> i915. This is a subset of the patches in step 5 described in [1],
> basically it is absolute to enable CI with GuC submission on gen11+
> platforms.
> 
> This series itself will likely be broken down into smaller patch sets to
> merge. Likely into CTBs changes, basic submission, virtual engines, and
> resets.
> 
> A following series will address the missing patches remaining from [1].
> 
> Locally tested on TGL machine and basic tests seem to be passing.
> 
> v2: Address all review comments in [3], include several more patches to
> make CI [4] happy.

What about:

ae1a6469-e8de-0745-1bb9-2054dd43dc74@linux.intel.com
e5d96ebb-f168-c1af-22c8-0b066388e70d@linux.intel.com

?

Regards,

Tvrtko

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> [1] https://patchwork.freedesktop.org/series/89844/
> [2] https://patchwork.freedesktop.org/series/91417/
> [3] https://patchwork.freedesktop.org/series/91840/
> [4] https://patchwork.freedesktop.org/series/91885/
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Daniele Ceraolo Spurio (1):
>    drm/i915/guc: Unblock GuC submission on Gen11+
> 
> John Harrison (12):
>    drm/i915: Track 'serial' counts for virtual engines
>    drm/i915/guc: Provide mmio list to be saved/restored on engine reset
>    drm/i915/guc: Don't complain about reset races
>    drm/i915/guc: Enable GuC engine reset
>    drm/i915/guc: Fix for error capture after full GPU reset with GuC
>    drm/i915/guc: Hook GuC scheduling policies up
>    drm/i915/guc: Connect reset modparam updates to GuC policy flags
>    drm/i915/guc: Include scheduling policies in the debugfs state dump
>    drm/i915/guc: Add golden context to GuC ADS
>    drm/i915/selftest: Better error reporting from hangcheck selftest
>    drm/i915/selftest: Fix hangcheck self test for GuC submission
>    drm/i915/selftest: Bump selftest timeouts for hangcheck
> 
> Matthew Brost (36):
>    drm/i915/guc: Add new GuC interface defines and structures
>    drm/i915/guc: Remove GuC stage descriptor, add LRC descriptor
>    drm/i915/guc: Add LRC descriptor context lookup array
>    drm/i915/guc: Implement GuC submission tasklet
>    drm/i915/guc: Add bypass tasklet submission path to GuC
>    drm/i915/guc: Implement GuC context operations for new inteface
>    drm/i915/guc: Insert fence on context when deregistering
>    drm/i915/guc: Defer context unpin until scheduling is disabled
>    drm/i915/guc: Disable engine barriers with GuC during unpin
>    drm/i915/guc: Extend deregistration fence to schedule disable
>    drm/i915: Disable preempt busywait when using GuC scheduling
>    drm/i915/guc: Ensure request ordering via completion fences
>    drm/i915/guc: Disable semaphores when using GuC scheduling
>    drm/i915/guc: Ensure G2H response has space in buffer
>    drm/i915/guc: Update intel_gt_wait_for_idle to work with GuC
>    drm/i915/guc: Update GuC debugfs to support new GuC
>    drm/i915/guc: Add several request trace points
>    drm/i915: Add intel_context tracing
>    drm/i915/guc: GuC virtual engines
>    drm/i915: Hold reference to intel_context over life of i915_request
>    drm/i915/guc: Disable bonding extension with GuC submission
>    drm/i915/guc: Direct all breadcrumbs for a class to single breadcrumbs
>    drm/i915: Add i915_sched_engine destroy vfunc
>    drm/i915: Move active request tracking to a vfunc
>    drm/i915/guc: Reset implementation for new GuC interface
>    drm/i915: Reset GPU immediately if submission is disabled
>    drm/i915/guc: Add disable interrupts to guc sanitize
>    drm/i915/guc: Suspend/resume implementation for new interface
>    drm/i915/guc: Handle context reset notification
>    drm/i915/guc: Handle engine reset failure notification
>    drm/i915/guc: Enable the timer expired interrupt for GuC
>    drm/i915/guc: Capture error state on context reset
>    drm/i915/guc: Implement banned contexts for GuC submission
>    drm/i915/guc: Support request cancellation
>    drm/i915/selftest: Increase some timeouts in live_requests
>    drm/i915/guc: Implement GuC priority management
> 
> Rahul Kumar Singh (2):
>    drm/i915/selftest: Fix workarounds selftest for GuC submission
>    drm/i915/selftest: Fix MOCS selftest for GuC submission
> 
>   drivers/gpu/drm/i915/Makefile                 |    1 +
>   drivers/gpu/drm/i915/gem/i915_gem_context.c   |   21 +-
>   drivers/gpu/drm/i915/gem/i915_gem_context.h   |    1 +
>   drivers/gpu/drm/i915/gem/i915_gem_mman.c      |    3 +-
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c      |    6 +-
>   drivers/gpu/drm/i915/gt/intel_breadcrumbs.c   |   44 +-
>   drivers/gpu/drm/i915/gt/intel_breadcrumbs.h   |   16 +-
>   .../gpu/drm/i915/gt/intel_breadcrumbs_types.h |    7 +
>   drivers/gpu/drm/i915/gt/intel_context.c       |   50 +-
>   drivers/gpu/drm/i915/gt/intel_context.h       |   50 +-
>   drivers/gpu/drm/i915/gt/intel_context_types.h |   63 +-
>   drivers/gpu/drm/i915/gt/intel_engine.h        |   54 +-
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  182 +-
>   .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |   71 +-
>   .../gpu/drm/i915/gt/intel_engine_heartbeat.h  |    4 +
>   drivers/gpu/drm/i915/gt/intel_engine_types.h  |   13 +-
>   drivers/gpu/drm/i915/gt/intel_engine_user.c   |    4 +
>   .../drm/i915/gt/intel_execlists_submission.c  |   95 +-
>   .../drm/i915/gt/intel_execlists_submission.h  |    4 -
>   drivers/gpu/drm/i915/gt/intel_gt.c            |   21 +
>   drivers/gpu/drm/i915/gt/intel_gt.h            |    2 +
>   drivers/gpu/drm/i915/gt/intel_gt_pm.c         |    6 +-
>   drivers/gpu/drm/i915/gt/intel_gt_requests.c   |   21 +-
>   drivers/gpu/drm/i915/gt/intel_gt_requests.h   |    7 +-
>   drivers/gpu/drm/i915/gt/intel_lrc_reg.h       |    1 -
>   drivers/gpu/drm/i915/gt/intel_reset.c         |   50 +-
>   .../gpu/drm/i915/gt/intel_ring_submission.c   |   48 +
>   drivers/gpu/drm/i915/gt/intel_rps.c           |    4 +
>   drivers/gpu/drm/i915/gt/intel_workarounds.c   |   46 +-
>   .../gpu/drm/i915/gt/intel_workarounds_types.h |    1 +
>   drivers/gpu/drm/i915/gt/mock_engine.c         |   40 +-
>   drivers/gpu/drm/i915/gt/selftest_context.c    |   10 +
>   .../drm/i915/gt/selftest_engine_heartbeat.c   |   22 +
>   .../drm/i915/gt/selftest_engine_heartbeat.h   |    2 +
>   drivers/gpu/drm/i915/gt/selftest_execlists.c  |   12 +-
>   drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  314 +-
>   drivers/gpu/drm/i915/gt/selftest_mocs.c       |   50 +-
>   .../gpu/drm/i915/gt/selftest_workarounds.c    |  132 +-
>   .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   15 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   82 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  101 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  461 ++-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h    |    4 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  132 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |   16 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    |   25 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   88 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 2776 +++++++++++++++--
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.h |   18 +-
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  101 +-
>   drivers/gpu/drm/i915/gt/uc/intel_uc.h         |   11 +
>   drivers/gpu/drm/i915/i915_debugfs_params.c    |   31 +
>   drivers/gpu/drm/i915/i915_gem_evict.c         |    1 +
>   drivers/gpu/drm/i915/i915_gpu_error.c         |   25 +-
>   drivers/gpu/drm/i915/i915_reg.h               |    2 +
>   drivers/gpu/drm/i915/i915_request.c           |  174 +-
>   drivers/gpu/drm/i915/i915_request.h           |   29 +
>   drivers/gpu/drm/i915/i915_scheduler.c         |   16 +-
>   drivers/gpu/drm/i915/i915_scheduler.h         |   10 +-
>   drivers/gpu/drm/i915/i915_scheduler_types.h   |   22 +
>   drivers/gpu/drm/i915/i915_trace.h             |  219 +-
>   drivers/gpu/drm/i915/selftests/i915_request.c |    4 +-
>   .../gpu/drm/i915/selftests/igt_flush_test.c   |    2 +-
>   .../gpu/drm/i915/selftests/igt_live_test.c    |    2 +-
>   .../i915/selftests/intel_scheduler_helpers.c  |   89 +
>   .../i915/selftests/intel_scheduler_helpers.h  |   35 +
>   .../gpu/drm/i915/selftests/mock_gem_device.c  |    3 +-
>   include/uapi/drm/i915_drm.h                   |    9 +
>   68 files changed, 5119 insertions(+), 862 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
>   create mode 100644 drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
> 
