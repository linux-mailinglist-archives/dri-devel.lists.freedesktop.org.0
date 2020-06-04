Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 519FD1EE74A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 17:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBBF6E40C;
	Thu,  4 Jun 2020 15:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3926E408;
 Thu,  4 Jun 2020 15:05:00 +0000 (UTC)
IronPort-SDR: gnuHFKrppXHR8HMqIg4++XeYyajJ0t9ZtE2nGYz/PGq9Nqvs63No7c4ywWxxzvKtO0RfgMxWzi
 VsH9eKB47kbg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 08:05:00 -0700
IronPort-SDR: I2GPwZlAUsqtrYaJqkvJzmQpne+r8VywMusIPn/dSuQFEDNRVq0uuLEXFcqmVlISoaj4kBRALq
 rWAGqJJXmgmw==
X-IronPort-AV: E=Sophos;i="5.73,472,1583222400"; d="scan'208";a="445533270"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.251.89.218])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 08:04:56 -0700
Date: Thu, 4 Jun 2020 18:04:54 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <20200604150454.GA59322@jlahtine-desk.ger.corp.intel.com>
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

Fixes use-after free on display global state tracking.

Then the removal of write bits from sysfs files
where changed value is not reflected anywhere.

Two scheduler fixes with deps that are Cc: stable.

Includes the GVT pull which has two build warning fixes
at this time.

CI_DINF_194 at https://intel-gfx-ci.01.org/tree/drm-intel-next-fixes/combin=
ed-alt.html?

Regards, Joonas

***

drm-intel-next-fixes-2020-06-04:

- Includes gvt-next-fixes-2020-05-28
- Use after free fix for display global state.
- Whitelisting context-local timestamp on Gen9
  and two scheduler fixes with deps (Cc: stable)
- Removal of write flag from sysfs files where
  ineffective

The following changes since commit d96536f0fe699729a0974eb5b65eb0d87cc747e1:

  drm/i915: Fix AUX power domain toggling across TypeC mode resets (2020-05=
-19 17:54:07 +0300)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-202=
0-06-04

for you to fetch changes up to f8665d797b1ce9bd81f7ed7744ef3a18d6b186ea:

  Merge tag 'gvt-next-fixes-2020-05-28' of https://github.com/intel/gvt-lin=
ux into drm-intel-next-fixes (2020-06-02 16:45:06 +0300)

----------------------------------------------------------------
- Includes gvt-next-fixes-2020-05-28
- Use after free fix for display global state.
- Whitelisting context-local timestamp on Gen9
  and two scheduler fixes with deps (Cc: stable)
- Removal of write flag from sysfs files where
  ineffective

----------------------------------------------------------------
Aishwarya Ramakrishnan (1):
      drm/i915/gvt: Use ARRAY_SIZE for vgpu_types

Chris Wilson (9):
      drm/i915: Don't set queue-priority hint when supressing the reschedule
      drm/i915/gt: Remove errant assertion in __intel_context_do_pin
      drm/i915: Disable semaphore inter-engine sync without timeslicing
      drm/i915: Avoid using rq->engine after free during i915_fence_release
      drm/i915/gem: Avoid iterating an empty list
      drm/i915: Reorder await_execution before await_request
      drm/i915/gt: Do not schedule normal requests immediately along virtual
      drm/i915: Check for awaits on still currently executing requests
      drm/i915: Whitelist context-local timestamp in the gen9 cmdparser

Jani Nikula (2):
      drm/i915/params: don't expose inject_probe_failure in debugfs
      drm/i915/params: fix i915.fake_lmem_start module param sysfs permissi=
ons

Joonas Lahtinen (1):
      Merge tag 'gvt-next-fixes-2020-05-28' of https://github.com/intel/gvt=
-linux into drm-intel-next-fixes

Nathan Chancellor (1):
      drm/i915: Mark check_shadow_context_ppgtt as maybe unused

Ville Syrj=E4l=E4 (1):
      drm/i915: Fix global state use-after-frees with a refcount

 drivers/gpu/drm/i915/display/intel_global_state.c |  45 ++-
 drivers/gpu/drm/i915/display/intel_global_state.h |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c       |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c         |  15 +-
 drivers/gpu/drm/i915/gt/intel_context.c           |   2 -
 drivers/gpu/drm/i915/gvt/vgpu.c                   |   2 +-
 drivers/gpu/drm/i915/i915_cmd_parser.c            |   4 +
 drivers/gpu/drm/i915/i915_params.c                |   2 +-
 drivers/gpu/drm/i915/i915_params.h                |   2 +-
 drivers/gpu/drm/i915/i915_request.c               | 359 ++++++++++++++----=
----
 drivers/gpu/drm/i915/i915_scheduler.c             |  16 +-
 11 files changed, 295 insertions(+), 159 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
