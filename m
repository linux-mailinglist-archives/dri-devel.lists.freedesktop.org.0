Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C7E1DB346
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 14:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5455A6E802;
	Wed, 20 May 2020 12:32:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86CB6E7F5;
 Wed, 20 May 2020 12:32:33 +0000 (UTC)
IronPort-SDR: UPbH9jex7+whZFwvVBDUQvvoOTRugrDelhIp40fRsSadv3RO82rsHlSZULK+5dBIKu0L4at0cv
 nknRWUnzI29Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2020 05:32:33 -0700
IronPort-SDR: g8xySWSLZyMB4TCWuiI8XHxq0vRXcqH5dYgUXTY2N6I4W53dva420PHL+xwF1keeuj+99vD0Zx
 xcyjxRqnmI9Q==
X-IronPort-AV: E=Sophos;i="5.73,414,1583222400"; d="scan'208";a="440013413"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.21.116])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2020 05:32:29 -0700
Date: Wed, 20 May 2020 15:32:27 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <20200520123227.GA21104@jlahtine-desk.ger.corp.intel.com>
MIME-Version: 1.0
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

On top of the drm-intel-next PR one fix for TypeC mode resets and
two compile time warning fixes.

CI results for your viewing:

https://intel-gfx-ci.01.org/tree/drm-intel-next-fixes/combined-alt.html

CI_DINF_189 =3D drm-intel-next pull
CI_DINF_190 =3D this pull (3 patches)

There is one regression in drm-intel-next baseline due to a bad
merge: igt@i915_selftest@live@gt_pm fails on TGL. The fix will
be in next weeks PR:

https://patchwork.freedesktop.org/patch/366280/?series=3D77448&rev=3D1

Regards, Joonas

***

drm-intel-next-fixes-2020-05-20:

Fix for TypeC power domain toggling on resets (Cc: stable).
Two compile time warning fixes.

The following changes since commit 230982d8d8df7f9d9aa216840ea2db1df6ad5d37:

  drm/i915: Update DRIVER_DATE to 20200430 (2020-04-30 11:13:21 +0300)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-202=
0-05-20

for you to fetch changes up to d96536f0fe699729a0974eb5b65eb0d87cc747e1:

  drm/i915: Fix AUX power domain toggling across TypeC mode resets (2020-05=
-19 17:54:07 +0300)

----------------------------------------------------------------
Fix for TypeC power domain toggling on resets (Cc: stable).
Two compile time warning fixes.

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/i915: avoid unused scale_user_to_hw() warning

Chris Wilson (40):
      drm/i915/gt: Move the batch buffer pool from the engine to the gt
      drm/i915/pmu: Keep a reference to module while active
      drm/i915/gt: Make timeslicing an explicit engine property
      drm/i915: Implement vm_ops->access for gdb access into mmaps
      drm/i915/gem: Use chained reloc batches
      drm/i915/gem: Use a single chained reloc batches for a single execbuf
      drm/i915/gem: Try an alternate engine for relocations
      drm/i915/gt: Sanitize RPS interrupts upon resume
      drm/i915/gem: Lazily acquire the device wakeref for freeing objects
      drm/i915: Allow some leniency in PCU reads
      drm/i915/gem: Specify address type for chained reloc batches
      drm/i915/gem: Implement legacy MI_STORE_DATA_IMM
      drm/i915/display: Warn if the FBC is still writing to stolen on remov=
al
      drm/i915/selftests: Repeat the rps clock frequency measurement
      drm/i915/gt: Small tidy of gen8+ breadcrumb emission
      drm/i915/execlists: Record the active CCID from before reset
      drm/i915/gt: Stop holding onto the pinned_default_state
      drm/i915: Propagate error from completed fences
      drm/i915: Mark concurrent submissions with a weak-dependency
      drm/i915: Remove wait priority boosting
      drm/i915: Ignore submit-fences on the same timeline
      drm/i915: Pull waiting on an external dma-fence into its routine
      drm/i915/gt: Improve precision on defer_request assert
      drm/i915: Prevent using semaphores to chain up to external fences
      drm/i915: Replace the hardcoded I915_FENCE_TIMEOUT
      drm/i915/gt: Mark up the racy read of execlists->context_tag
      drm/i915: Tidy awaiting on dma-fences
      drm/i915: Emit await(batch) before MI_BB_START
      drm/i915/selftests: Always flush before unpining after writing
      drm/i915/gt: Restore Cherryview back to full-ppgtt
      drm/i915: Handle idling during i915_gem_evict_something busy loops
      drm/i915/gt: Reset execlists registers before HWSP
      drm/i915/gt: Suspend tasklets before resume sanitization
      drm/i915/gem: Remove redundant exec_fence
      drm/i915: Mark the addition of the initial-breadcrumb in the request
      drm/i915: Drop I915_RESET_TIMEOUT and friends
      drm/i915: Drop no-semaphore boosting
      drm/i915: Show per-engine default property values in sysfs
      drm/i915/selftests: Always call the provided engine->emit_init_breadc=
rumb
      drm/i915/gt: Transfer old virtual breadcrumbs to irq_worker

Gustavo A. R. Silva (1):
      drm/i915: Replace zero-length array with flexible-array

Gwan-gyeong Mun (14):
      video/hdmi: Add Unpack only function for DRM infoframe
      drm/i915/dp: Read out DP SDPs
      drm: Add logging function for DP VSC SDP
      drm/i915: Include HDMI DRM infoframe in the crtc state dump
      drm/i915: Include DP HDR Metadata Infoframe SDP in the crtc state dump
      drm/i915: Include DP VSC SDP in the crtc state dump
      drm/i915: Program DP SDPs with computed configs
      drm/i915: Add state readout for DP HDR Metadata Infoframe SDP
      drm/i915: Add state readout for DP VSC SDP
      drm/i915: Fix enabled infoframe states of lspcon
      drm/i915: Program DP SDPs on pipe updates
      drm/i915: Stop sending DP SDPs on ddi disable
      drm/i915/dp: Add compute routine for DP PSR VSC SDP
      drm/i915/psr: Use new DP VSC SDP compute routine on PSR

Imre Deak (2):
      drm/i915/tgl+: Fix interrupt handling for DP AUX transactions
      drm/i915: Fix AUX power domain toggling across TypeC mode resets

Joonas Lahtinen (3):
      Merge tag 'gvt-next-2020-05-12' of https://github.com/intel/gvt-linux=
 into drm-intel-next-queued
      drm/i915: Document locking guidelines
      drm/i915: Update DRIVER_DATE to 20200515

Lionel Landwerlin (1):
      drm/i915: Peel dma-fence-chains for await

Matt Roper (1):
      drm/i915/icp: Add Wa_14010685332

Mika Kuoppala (7):
      Revert "drm/i915/tgl: Include ro parts of l3 to invalidate"
      drm/i915/gen12: Fix HDC pipeline flush
      drm/i915/gen12: Flush L3
      drm/i915/gen12: Invalidate aux table entries forcibly
      drm/i915/gen12: Add aux table invalidate for all engines
      drm/i915: Make intel_timeline_init static
      drm/i915/gt: Force pte cacheline to main memory

Nathan Chancellor (2):
      drm/i915: Remove duplicate inline specifier on write_pte
      drm/i915: Mark check_shadow_context_ppgtt as maybe unused

Pascal Terjan (1):
      drm/i915: Remove unused HAS_FWTABLE macro

Stanislav Lisovskiy (10):
      drm/i915: Use bw state for per crtc SAGV evaluation
      drm/i915: Track active_pipes in bw_state
      drm/i915: Rename bw_state to new_bw_state
      drm/i915: Added required new PCode commands
      drm/i915: Introduce skl_plane_wm_level accessor.
      drm/i915: Extract skl SAGV checking
      drm/i915: Make active_pipes check skl specific
      drm/i915: Add TGL+ SAGV support
      drm/i915: Restrict qgv points which don't have enough bandwidth.
      drm/i915: Enable SAGV support for Gen12

Sultan Alsawaf (1):
      drm/i915: Don't enable WaIncreaseLatencyIPCEnabled when IPC is disabl=
ed

Swathi Dhanavanthri (1):
      drm/i915/ehl: Restrict w/a 1607087056 for EHL/JSL

Ville Syrj=E4l=E4 (13):
      drm/i915/fbc: Require linear fb stride to be multiple of 512 bytes on=
 gen9/glk
      drm/i915: Remove cnl pre-prod workarounds
      drm/i915: Nuke mode.vrefresh usage
      drm/i915: Rename variables to be consistent with bspec
      drm/i915: Streamline the artihmetic
      drm/i915/mst: Wait for ACT sent before enabling the pipe
      drm/i915: Fix glk watermark calculations
      drm/i915: Turn intel_digital_port_connected() in a vfunc
      drm/i915: Stash hpd status bits under dev_priv
      drm/i915: Use stashed away hpd isr bits in intel_digital_port_connect=
ed()
      drm/i915: Nuke pointless div by 64bit
      drm/i915: Store CS timestamp frequency in Hz
      drm/i915: Extract i915_cs_timestamp_{ns_to_ticks,tick_to_ns}()

Zhenyu Wang (3):
      drm/i915/gvt: move workload destroy out of execlist complete
      drm/i915/gvt: Support PPGTT table load command
      drm/i915/gvt: use context lrc_reg_state for shadow ppgtt override

 Documentation/gpu/i915.rst                         |  46 ++
 drivers/gpu/drm/drm_dp_helper.c                    | 174 ++++++
 drivers/gpu/drm/i915/Kconfig.profile               |  12 +
 drivers/gpu/drm/i915/Makefile                      |   3 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |  77 +--
 drivers/gpu/drm/i915/display/intel_bw.c            | 161 ++++--
 drivers/gpu/drm/i915/display/intel_bw.h            |  18 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |  60 ++-
 drivers/gpu/drm/i915/display/intel_display.c       |  85 ++-
 drivers/gpu/drm/i915/display/intel_display_types.h |   3 +
 drivers/gpu/drm/i915/display/intel_dp.c            | 599 ++++++++---------=
----
 drivers/gpu/drm/i915/display/intel_dp.h            |  15 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   9 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |  12 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c        |   2 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |  20 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  58 +-
 drivers/gpu/drm/i915/display/intel_psr.h           |   6 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |   7 +-
 drivers/gpu/drm/i915/display/intel_tc.h            |   3 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c        |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_client_blt.c     |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     | 478 ++++++++++------
 drivers/gpu/drm/i915/gem/i915_gem_fence.c          |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |  34 ++
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |   3 -
 drivers/gpu/drm/i915/gem/i915_gem_object_blt.c     |  26 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_blt.h     |   1 -
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |   1 +
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |  31 +-
 .../drm/i915/gem/selftests/i915_gem_coherency.c    |   2 +
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |  49 +-
 .../drm/i915/gem/selftests/i915_gem_execbuffer.c   | 171 ++++++
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 124 +++++
 drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c |  26 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |  15 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c        |  52 +-
 drivers/gpu/drm/i915/gt/intel_engine.h             |  46 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |   6 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |  16 +-
 drivers/gpu/drm/i915/gt/intel_engine_pool.h        |  34 --
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |  36 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h       |   3 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |   3 +
 ...{intel_engine_pool.c =3D> intel_gt_buffer_pool.c} | 114 ++--
 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.h     |  37 ++
 ...e_pool_types.h =3D> intel_gt_buffer_pool_types.h} |  15 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |  10 +-
 drivers/gpu/drm/i915/gt/intel_gt_types.h           |  11 +
 drivers/gpu/drm/i915/gt/intel_lrc.c                | 320 +++++++----
 drivers/gpu/drm/i915/gt/intel_rc6.c                |   8 +-
 drivers/gpu/drm/i915/gt/intel_renderstate.c        |  16 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |   5 +-
 drivers/gpu/drm/i915/gt/intel_rps.h                |   1 +
 drivers/gpu/drm/i915/gt/intel_timeline.c           |   8 +-
 drivers/gpu/drm/i915/gt/intel_timeline.h           |   5 -
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |  28 +-
 drivers/gpu/drm/i915/gt/mock_engine.c              |   2 -
 drivers/gpu/drm/i915/gt/selftest_context.c         |  12 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |  86 ++-
 drivers/gpu/drm/i915/gt/selftest_ring_submission.c |   2 +
 drivers/gpu/drm/i915/gt/selftest_rps.c             |  56 +-
 drivers/gpu/drm/i915/gt/sysfs_engines.c            |  94 ++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |   2 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |  45 ++
 drivers/gpu/drm/i915/gvt/execlist.c                |   2 -
 drivers/gpu/drm/i915/gvt/gtt.c                     |   1 +
 drivers/gpu/drm/i915/gvt/gtt.h                     |   1 +
 drivers/gpu/drm/i915/gvt/handlers.c                |   2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               | 115 +++-
 drivers/gpu/drm/i915/gvt/scheduler.h               |   1 +
 drivers/gpu/drm/i915/i915_config.c                 |  15 +
 drivers/gpu/drm/i915/i915_debugfs.c                |  11 +-
 drivers/gpu/drm/i915/i915_drv.h                    |  37 +-
 drivers/gpu/drm/i915/i915_gem_evict.c              |  26 +-
 drivers/gpu/drm/i915/i915_getparam.c               |   2 +-
 drivers/gpu/drm/i915/i915_gpu_error.h              |   2 +-
 drivers/gpu/drm/i915/i915_irq.c                    | 227 ++++----
 drivers/gpu/drm/i915/i915_pci.c                    |   2 +-
 drivers/gpu/drm/i915/i915_perf.c                   |  12 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |   5 +-
 drivers/gpu/drm/i915/i915_priolist_types.h         |   7 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  13 +
 drivers/gpu/drm/i915/i915_request.c                | 127 +++--
 drivers/gpu/drm/i915/i915_request.h                |  28 +-
 drivers/gpu/drm/i915/i915_scheduler.c              |  29 +-
 drivers/gpu/drm/i915/i915_scheduler.h              |   3 +-
 drivers/gpu/drm/i915/i915_scheduler_types.h        |   3 +-
 drivers/gpu/drm/i915/i915_selftest.h               |   2 +
 drivers/gpu/drm/i915/i915_sw_fence.c               |  10 +-
 drivers/gpu/drm/i915/intel_device_info.c           |  34 +-
 drivers/gpu/drm/i915/intel_device_info.h           |   2 +-
 drivers/gpu/drm/i915/intel_pm.c                    | 328 ++++++++---
 drivers/gpu/drm/i915/intel_pm.h                    |   4 +-
 drivers/gpu/drm/i915/intel_sideband.c              |   4 +-
 drivers/gpu/drm/i915/intel_uncore.c                |   5 -
 drivers/gpu/drm/i915/intel_wopcm.c                 |   3 +-
 .../gpu/drm/i915/selftests/i915_live_selftests.h   |   1 +
 drivers/gpu/drm/i915/selftests/i915_perf.c         |   6 +-
 drivers/gpu/drm/i915/selftests/i915_request.c      |  37 +-
 drivers/gpu/drm/i915/selftests/i915_selftest.c     |  29 +
 drivers/gpu/drm/i915/selftests/igt_spinner.c       |   3 +-
 drivers/video/hdmi.c                               |  65 ++-
 include/drm/drm_dp_helper.h                        |   3 +
 include/linux/hdmi.h                               |   2 +
 106 files changed, 3110 insertions(+), 1517 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gem/selftests/i915_gem_execbuffer.c
 delete mode 100644 drivers/gpu/drm/i915/gt/intel_engine_pool.h
 rename drivers/gpu/drm/i915/gt/{intel_engine_pool.c =3D> intel_gt_buffer_p=
ool.c} (53%)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.h
 rename drivers/gpu/drm/i915/gt/{intel_engine_pool_types.h =3D> intel_gt_bu=
ffer_pool_types.h} (54%)
 create mode 100644 drivers/gpu/drm/i915/i915_config.c
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
