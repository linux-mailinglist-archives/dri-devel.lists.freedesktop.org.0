Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5469F6222
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 10:48:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE6D10EB43;
	Wed, 18 Dec 2024 09:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ut0uabf3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF6810EB4B;
 Wed, 18 Dec 2024 09:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734515324; x=1766051324;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=s4ocDH7UmrOpvtqpngizXg9vgWT/WeFW9fcb+JcuNrA=;
 b=Ut0uabf3HvR/+IQDzTNs8ZCvAOpEwNBjbepPezXdi8B9VNEAIAwt7PVn
 X4UmMDt8moZNCcj4fDR1O6rLtmrCfzm9EXLP+kyyLdUldfFlBQSL40ZBa
 ehexKXX/mADH9p8S78+tm1VTmETuIngxMfvxPMZUl8wnt7CtH37o03jNB
 IRfaeEgEJ8KdQMETO+MKOr765w+pmFEEzQNeMtd+ngHiUBClZzlSuAulq
 pF9YzV420NgQio71SNM9GOTFJWXgiNnMFVyvFIRIwHUnuyliSwilHyWDa
 sYzWRyCTxRcsauBowWF7k5Qsz1ApPxcAVK63bjSCL4PSHWvMvZi9hxFun Q==;
X-CSE-ConnectionGUID: QdS0fit6TBC7oDhSSc+uMg==
X-CSE-MsgGUID: O5DPLLgcStCbJOcHOQO0mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="34863611"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="34863611"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 01:48:43 -0800
X-CSE-ConnectionGUID: geOzY59jQGaw66s7WtDnmw==
X-CSE-MsgGUID: 4DuAxdA6TM+7wIJIyfqaEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="102646360"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.42])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 01:48:39 -0800
Date: Wed, 18 Dec 2024 11:48:36 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-gt-next
Message-ID: <Z2KadNXgumx1aQMP@jlahtine-mobl.ger.corp.intel.com>
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

Hi Dave & Sima,

Here goes the pre-holidays drm-intel-gt-next PR towards 6.14 as promised.

As the main improvement there is engine busyness accuracy improvements
for GuC submission platforms and fixup for BO mapping corner cases.

The rest is smaller refactoring and improvements.

Happy Holidays!

Regards, Joonas

***

drm-intel-gt-next-2024-12-18:

Driver Changes:

- More accurate engine busyness metrics with GuC submission (Umesh)
- Ensure BO segment offset never exceeds allowed max (Krzysztof)
- Flush GuC CT receive tasklet during reset preparation (Zhanjun)

- Code cleanups and refactoring (David, Lucas)
- Debugging improvements (Jesus)
- Selftest improvements (Sk)

The following changes since commit 6ef0e3ef2662db71d363af77ce31fa940bb7d525:

  drm/i915/gt: Retry RING_HEAD reset until it get sticks (2024-10-22 11:35:07 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-gt-next-2024-12-18

for you to fetch changes up to f373ebec18a75d671908e81ed9925aebf279ec2f:

  drm/i915/guc: Update guc_err message to show outstanding g2h responses (2024-12-17 11:38:50 -0800)

----------------------------------------------------------------
Driver Changes:

- More accurate engine busyness metrics with GuC submission (Umesh)
- Ensure partial BO segment offset never exceeds allowed max (Krzysztof)
- Flush GuC CT receive tasklet during reset preparation (Zhanjun)

- Code cleanups and refactoring (David, Lucas)
- Debugging improvements (Jesus)
- Selftest improvements (Sk)

----------------------------------------------------------------
Dr. David Alan Gilbert (1):
      drm/i915/gt: Remove unused execlists_unwind_incomplete_requests

Jesus Narvaez (1):
      drm/i915/guc: Update guc_err message to show outstanding g2h responses

Krzysztof Karas (1):
      drm/i915: ensure segment offset never exceeds allowed max

Lucas De Marchi (4):
      drm/i915/pmu: Rename cpuhp_slot to cpuhp_state
      drm/i915/pmu: Stop setting event_init to NULL
      drm/i915/pmu: Replace closed with registered
      drm/i915/pmu: Remove pointless synchronize_rcu() call

Sk Anirban (1):
      drm/i915/selftests: Add delay to stabilize frequency in live_rps_power

Umesh Nerlige Ramappa (3):
      i915/guc: Reset engine utilization buffer before registration
      i915/guc: Ensure busyness counter increases motonically
      i915/guc: Accumulate active runtime on gt reset

Zhanjun Dong (1):
      drm/i915/guc: Flush ct receive tasklet during reset preparation

 drivers/gpu/drm/i915/gt/intel_engine.h             |  3 --
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |  5 ++
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |  9 ----
 drivers/gpu/drm/i915/gt/selftest_rps.c             |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  | 53 ++++++++++++++++++++--
 drivers/gpu/drm/i915/i915_mm.c                     |  4 +-
 drivers/gpu/drm/i915/i915_pmu.c                    | 50 ++++++++------------
 drivers/gpu/drm/i915/i915_pmu.h                    |  4 +-
 8 files changed, 79 insertions(+), 50 deletions(-)
