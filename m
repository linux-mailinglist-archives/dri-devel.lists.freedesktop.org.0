Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CBC1298F4
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 17:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DAF36E0BE;
	Mon, 23 Dec 2019 16:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48756E0BE;
 Mon, 23 Dec 2019 16:55:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Dec 2019 08:55:34 -0800
X-IronPort-AV: E=Sophos;i="5.69,348,1571727600"; d="scan'208";a="211611474"
Received: from ggranovs-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.51.22])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Dec 2019 08:55:30 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Mon, 23 Dec 2019 18:55:35 +0200
Message-ID: <87r20vdlrs.fsf@intel.com>
MIME-Version: 1.0
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
Cc: , dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

drm-intel-fixes-2019-12-23:
i915 power and frontbuffer tracking fixes

No test results on this yet, but I'll let you know later in the week if
there are any issues in
https://intel-gfx-ci.01.org/tree/drm-intel-fixes/index.html


BR,
Jani.

The following changes since commit 46cf053efec6a3a5f343fead837777efe8252a46:

  Linux 5.5-rc3 (2019-12-22 17:02:23 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2019-12-23

for you to fetch changes up to e85ade1f50aae464ce196672faa7a099fd1721ed:

  drm/i915: Hold reference to intel_frontbuffer as we track activity (2019-12-23 14:27:23 +0200)

----------------------------------------------------------------
i915 power and frontbuffer tracking fixes

----------------------------------------------------------------
Chris Wilson (2):
      drm/i915/gt: Ratelimit display power w/a
      drm/i915: Hold reference to intel_frontbuffer as we track activity

Tvrtko Ursulin (1):
      drm/i915/pmu: Ensure monotonic rc6

 drivers/gpu/drm/i915/display/intel_display.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c | 16 ++----
 drivers/gpu/drm/i915/display/intel_frontbuffer.h | 34 ++++++++++-
 drivers/gpu/drm/i915/display/intel_overlay.c     | 17 ++++--
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c      |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c       |  4 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c       | 26 ++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_object.h       | 23 +++++++-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c            |  3 +-
 drivers/gpu/drm/i915/i915_gem.c                  | 10 ++--
 drivers/gpu/drm/i915/i915_pmu.c                  | 73 +++++++-----------------
 drivers/gpu/drm/i915/i915_pmu.h                  |  2 +-
 drivers/gpu/drm/i915/i915_vma.c                  | 10 +++-
 14 files changed, 139 insertions(+), 86 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
