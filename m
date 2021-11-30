Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FF1462F02
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 09:55:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A876EDD5;
	Tue, 30 Nov 2021 08:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA5E6F8F1;
 Tue, 30 Nov 2021 08:55:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="233674559"
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; d="scan'208";a="233674559"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 00:55:01 -0800
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; d="scan'208";a="477046471"
Received: from sghadai-mobl.amr.corp.intel.com (HELO [10.213.181.11])
 ([10.213.181.11])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 00:55:00 -0800
Message-ID: <f1202314-f42d-e37a-49a7-16148f5018be@linux.intel.com>
Date: Tue, 30 Nov 2021 08:54:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [Intel-gfx] [PATCH v2 00/16] drm/i915: Remove short term pins
 from execbuf.
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

On 29/11/2021 13:47, Maarten Lankhorst wrote:
> New version of the series, with feedback from previous series added.

If there was a cover letter sent for this work in the past could you 
please keep attaching it? Or if there wasn't, could you please write one?

I am worried about two things. First is that we need to have a high 
level overview of the rules/design changes documented so third party 
people have any hope of getting code right after this lands. (Where we 
are, where we are going, how we will get there, how far did we get and 
when we will get to the end.)

Second is that when parts of the series land piecemeal (Which they have 
in this right, right?), it gets very hard to write up a maintainer level 
changelog.

But in any case, even on the mundane process level, we need to have 
cover letters for any non trivial work was the conclusion since some 
time ago.

Regards,

Tvrtko

> First 11 patches are clean, some small fixes might required still for all to pass.
> 
> Maarten Lankhorst (16):
>    drm/i915: Remove unused bits of i915_vma/active api
>    drm/i915: Change shrink ordering to use locking around unbinding.
>    drm/i915: Remove pages_mutex and intel_gtt->vma_ops.set/clear_pages
>      members, v2.
>    drm/i915: Take object lock in i915_ggtt_pin if ww is not set
>    drm/i915: Force ww lock for i915_gem_object_ggtt_pin_ww
>    drm/i915: Ensure gem_contexts selftests work with unbind changes.
>    drm/i915: Take trylock during eviction, v2.
>    drm/i915: Pass trylock context to callers
>    drm/i915: Ensure i915_vma tests do not get -ENOSPC with the locking
>      changes.
>    drm/i915: Make i915_gem_evict_vm work correctly for already locked
>      objects
>    drm/i915: Call i915_gem_evict_vm in vm_fault_gtt to prevent new ENOSPC
>      errors
>    drm/i915: Add i915_vma_unbind_unlocked, and take obj lock for
>      i915_vma_unbind
>    drm/i915: Require object lock when freeing pages during destruction
>    drm/i915: Remove assert_object_held_shared
>    drm/i915: Remove support for unlocked i915_vma unbind
>    drm/i915: Remove short-term pins from execbuf, v5.
> 
>   drivers/gpu/drm/i915/display/intel_dpt.c      |   2 -
>   drivers/gpu/drm/i915/display/intel_fb_pin.c   |   2 +-
>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 250 ++++----
>   drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  18 +-
>   drivers/gpu/drm/i915/gem/i915_gem_object.c    |   9 +-
>   drivers/gpu/drm/i915/gem/i915_gem_object.h    |  22 +-
>   drivers/gpu/drm/i915/gem/i915_gem_pages.c     |  12 +-
>   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  44 +-
>   drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |   2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |   2 +-
>   .../gpu/drm/i915/gem/selftests/huge_pages.c   |   2 +-
>   .../i915/gem/selftests/i915_gem_client_blt.c  |   2 +-
>   .../drm/i915/gem/selftests/i915_gem_context.c |  54 +-
>   .../drm/i915/gem/selftests/i915_gem_mman.c    |   6 +
>   drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |  15 -
>   drivers/gpu/drm/i915/gt/intel_engine_pm.c     |   2 +-
>   drivers/gpu/drm/i915/gt/intel_ggtt.c          | 450 ++------------
>   drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  |   1 -
>   drivers/gpu/drm/i915/gt/intel_gtt.c           |  13 -
>   drivers/gpu/drm/i915/gt/intel_gtt.h           |   7 -
>   drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  12 -
>   drivers/gpu/drm/i915/gt/mock_engine.c         |   2 +-
>   drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |   2 +-
>   drivers/gpu/drm/i915/gt/selftest_migrate.c    |   2 +-
>   drivers/gpu/drm/i915/gvt/aperture_gm.c        |   2 +-
>   drivers/gpu/drm/i915/i915_active.c            |  28 +-
>   drivers/gpu/drm/i915/i915_active.h            |  17 +-
>   drivers/gpu/drm/i915/i915_drv.h               |  12 +-
>   drivers/gpu/drm/i915/i915_gem.c               |  28 +-
>   drivers/gpu/drm/i915/i915_gem_evict.c         |  64 +-
>   drivers/gpu/drm/i915/i915_gem_gtt.c           |   8 +-
>   drivers/gpu/drm/i915/i915_gem_gtt.h           |   4 +
>   drivers/gpu/drm/i915/i915_vgpu.c              |   2 +-
>   drivers/gpu/drm/i915/i915_vma.c               | 580 +++++++++++++++---
>   drivers/gpu/drm/i915/i915_vma.h               |   6 +-
>   drivers/gpu/drm/i915/i915_vma_types.h         |   1 -
>   .../gpu/drm/i915/selftests/i915_gem_evict.c   |  27 +-
>   drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  48 +-
>   drivers/gpu/drm/i915/selftests/i915_vma.c     |  19 +-
>   drivers/gpu/drm/i915/selftests/mock_gtt.c     |   4 -
>   40 files changed, 942 insertions(+), 841 deletions(-)
> 
