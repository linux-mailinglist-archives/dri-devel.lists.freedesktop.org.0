Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AC2855EBF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 11:07:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6B310E2FA;
	Thu, 15 Feb 2024 10:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fFUr2Clt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8489610E055;
 Thu, 15 Feb 2024 10:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707991615; x=1739527615;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=CW9pPXVDJQvIPYtn5PdKUZ8LPZWXwe6GSl76Esrm9PU=;
 b=fFUr2Clt3YAoUcEqdX7T3mwT2inQOqClDvPt5zAldJmg4zdQixs5wYfo
 uvuTdYZWeeCPicGh5Z9PQ7WAjB2vqcqJVyBSBtk7XwkSychVJkw4P2wRA
 3ujtgV+dY7ais6g24trXYrTzbXh6fVLS2Be2h+2+smAHZpWXReoB0eXKg
 tw0OKfYCatoHMoFWKHIlSl0YC847Ybt/fYC0WNce58Dl4ZnXJtZqBU4B9
 8Xukct2cMNVJf8GkWlec9WOKfG9FT7RSHpv6eA12ywTji0HReoeynYXWx
 wo+wAC48PWPD4myu3NQSRQZmdKtu2wcGD17Uwi42swPXk+TeFXATmJCeW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="12700280"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="12700280"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:06:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="3831849"
Received: from dvigder-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.213.231.37])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:06:50 -0800
Date: Thu, 15 Feb 2024 10:06:48 +0000
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-gt-next
Message-ID: <Zc3iIVsiAwo+bu10@tursulin-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi Dave, Daniel,

First pull request for 6.9 with probably one more coming in one to two
weeks.

Nothing to interesting in this one, mostly a sprinkle of small fixes in
GuC, HuC, Perf/OA, a tiny bit of prep work for future platforms and some
code cleanups.

One new uapi in the form of a GuC submission version query which Mesa
wants for implementing Vulkan async compute queues.

Regards,

Tvrtko

drm-intel-gt-next-2024-02-15:
UAPI Changes:

- Add GuC submission interface version query (Tvrtko Ursulin)

Driver Changes:

Fixes/improvements/new stuff:

- Atomically invalidate userptr on mmu-notifier (Jonathan Cavitt)
- Update handling of MMIO triggered reports (Umesh Nerlige Ramappa)
- Don't make assumptions about intel_wakeref_t type (Jani Nikula)
- Add workaround 14019877138 [xelpg] (Tejas Upadhyay)
- Allow for very slow HuC loading [huc] (John Harrison)
- Flush context destruction worker at suspend [guc] (Alan Previn)
- Close deregister-context race against CT-loss [guc] (Alan Previn)
- Avoid circular locking issue on busyness flush [guc] (John Harrison)
- Use rc6.supported flag from intel_gt for rc6_enable sysfs (Juan Escamilla)
- Reflect the true and current status of rc6_enable (Juan Escamilla)
- Wake GT before sending H2G message [mtl] (Vinay Belgaumkar)
- Restart the heartbeat timer when forcing a pulse (John Harrison)

Future platform enablement:

- Extend driver code of Xe_LPG to Xe_LPG+ [xelpg] (Harish Chegondi)
- Extend some workarounds/tuning to gfx version 12.74 [xelpg] (Matt Roper)

Miscellaneous:

- Reconcile Excess struct member kernel-doc warnings (Randy Dunlap)
- Change wa and EU_PERF_CNTL registers to MCR type [guc] (Shuicheng Lin)
- Add flex arrays to struct i915_syncmap (Erick Archer)
- Increasing the sleep time for live_rc6_manual [selftests] (Anirban Sk)
The following changes since commit 31accc37eaee98a90b25809ed58c6ee4956ab642:

  drm/i915: Use kmap_local_page() in gem/i915_gem_execbuffer.c (2023-12-15 09:34:31 +0000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2024-02-15

for you to fetch changes up to eb927f01dfb6309c8a184593c2c0618c4000c481:

  drm/i915/gt: Restart the heartbeat timer when forcing a pulse (2024-02-14 17:17:35 -0800)

----------------------------------------------------------------
UAPI Changes:

- Add GuC submission interface version query (Tvrtko Ursulin)

Driver Changes:

Fixes/improvements/new stuff:

- Atomically invalidate userptr on mmu-notifier (Jonathan Cavitt)
- Update handling of MMIO triggered reports (Umesh Nerlige Ramappa)
- Don't make assumptions about intel_wakeref_t type (Jani Nikula)
- Add workaround 14019877138 [xelpg] (Tejas Upadhyay)
- Allow for very slow HuC loading [huc] (John Harrison)
- Flush context destruction worker at suspend [guc] (Alan Previn)
- Close deregister-context race against CT-loss [guc] (Alan Previn)
- Avoid circular locking issue on busyness flush [guc] (John Harrison)
- Use rc6.supported flag from intel_gt for rc6_enable sysfs (Juan Escamilla)
- Reflect the true and current status of rc6_enable (Juan Escamilla)
- Wake GT before sending H2G message [mtl] (Vinay Belgaumkar)
- Restart the heartbeat timer when forcing a pulse (John Harrison)

Future platform enablement:

- Extend driver code of Xe_LPG to Xe_LPG+ [xelpg] (Harish Chegondi)
- Extend some workarounds/tuning to gfx version 12.74 [xelpg] (Matt Roper)

Miscellaneous:

- Reconcile Excess struct member kernel-doc warnings (Randy Dunlap)
- Change wa and EU_PERF_CNTL registers to MCR type [guc] (Shuicheng Lin)
- Add flex arrays to struct i915_syncmap (Erick Archer)
- Increasing the sleep time for live_rc6_manual [selftests] (Anirban Sk)

----------------------------------------------------------------
Alan Previn (2):
      drm/i915/guc: Flush context destruction worker at suspend
      drm/i915/guc: Close deregister-context race against CT-loss

Anirban Sk (1):
      drm/i915/selftests: Increasing the sleep time for live_rc6_manual

Erick Archer (1):
      drm/i915: Add flex arrays to struct i915_syncmap

Harish Chegondi (1):
      drm/i915/xelpg: Extend driver code of Xe_LPG to Xe_LPG+

Jani Nikula (1):
      drm/i915: don't make assumptions about intel_wakeref_t type

John Harrison (3):
      drm/i915/huc: Allow for very slow HuC loading
      drm/i915/guc: Avoid circular locking issue on busyness flush
      drm/i915/gt: Restart the heartbeat timer when forcing a pulse

Jonathan Cavitt (1):
      drm/i915/gem: Atomically invalidate userptr on mmu-notifier

Juan Escamilla (2):
      drm/i915/gt: Use rc6.supported flag from intel_gt for rc6_enable sysfs
      drm/i915/gt: Reflect the true and current status of rc6_enable

Matt Roper (1):
      drm/i915/xelpg: Extend some workarounds/tuning to gfx version 12.74

Randy Dunlap (4):
      drm/i915/gem: reconcile Excess struct member kernel-doc warnings
      drm/i915/gt: reconcile Excess struct member kernel-doc warnings
      drm/i915/guc: reconcile Excess struct member kernel-doc warnings
      drm/i915/perf: reconcile Excess struct member kernel-doc warnings

Shuicheng Lin (1):
      drm/i915/guc: Change wa and EU_PERF_CNTL registers to MCR type

Tejas Upadhyay (1):
      drm/i915/xelpg: Add workaround 14019877138

Tvrtko Ursulin (1):
      drm/i915: Add GuC submission interface version query

Umesh Nerlige Ramappa (1):
      drm/i915/perf: Update handling of MMIO triggered reports

Vinay Belgaumkar (1):
      drm/i915/mtl: Wake GT before sending H2G message

 drivers/gpu/drm/i915/display/intel_display_power.c |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h  |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |   8 --
 drivers/gpu/drm/i915/gem/i915_gem_pm.c             |  10 ++
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |  42 -------
 drivers/gpu/drm/i915/gem/i915_gem_userptr.h        |  14 ---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |   4 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |   3 +-
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c   |   3 +
 drivers/gpu/drm/i915/gt/intel_gsc.h                |   7 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c        |  18 +--
 drivers/gpu/drm/i915/gt/intel_mocs.c               |   2 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |   2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |  27 +++--
 drivers/gpu/drm/i915/gt/selftest_rc6.c             |   4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |  75 ++++++------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |  21 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |  10 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  | 126 ++++++++++++++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h  |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |  64 ++++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |   4 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |   2 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   8 --
 drivers/gpu/drm/i915/i915_gem.c                    |   5 -
 drivers/gpu/drm/i915/i915_perf.c                   |  41 ++++++-
 drivers/gpu/drm/i915/i915_perf_types.h             |   9 +-
 drivers/gpu/drm/i915/i915_query.c                  |  33 ++++++
 drivers/gpu/drm/i915/i915_syncmap.c                |  19 ++--
 drivers/gpu/drm/i915/intel_uncore.c                |   5 +-
 include/uapi/drm/i915_drm.h                        |  12 ++
 31 files changed, 392 insertions(+), 196 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/gem/i915_gem_userptr.h
