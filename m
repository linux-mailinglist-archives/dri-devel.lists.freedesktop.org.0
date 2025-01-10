Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAC7A08ADE
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 10:04:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C90E10F027;
	Fri, 10 Jan 2025 09:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LUxHz7Zf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D045B10F023;
 Fri, 10 Jan 2025 09:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736499838; x=1768035838;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=4WYZ9N2+NxQnrjbkYZOubi/OBNQlJ5O1QldfPYRCgw4=;
 b=LUxHz7Zfd0j+0kDnHC4N63fO/FI+F2IFNKRj6FdkRfMRMxepR2c0/f2M
 gMIov1aw+m6hnaUGxU1jdostkECw9nBsNrukorbgn1/dZVoVN5R4IjAg5
 m1CHlgJ3SP8A7gsL+BmvF0fz/TRdmV6+LtyVS7ZjsjzI+3NFJSm8Hp7MU
 +JOSharpNvK90iJdSz9iyWwQgvJe3Fbh96J1bdAeuINzWalrv9DEilOWs
 e2cM2OXhgglGmkXe05G5Nh+rTep/+f9fRvvvFdsPbWQFzjU+Fsq0wECDF
 1rqlDao9xfsYti+9PRfbqwlbMI2egSXYZWtx3wke6vnkSCEva42e40PAD g==;
X-CSE-ConnectionGUID: Kzceoq0zT02Gl0sI5esxXg==
X-CSE-MsgGUID: C+il+FxSQO20XHqDabYrPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47452819"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="47452819"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 01:03:57 -0800
X-CSE-ConnectionGUID: rK7DwVgFQNqoosL6K2c9/A==
X-CSE-MsgGUID: 7KGeqZ4CS6uUNPt/k8ouJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="104559077"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.103])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 01:03:53 -0800
Date: Fri, 10 Jan 2025 11:03:50 +0200
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
Message-ID: <Z4DidoEACFu7D6iG@jlahtine-mobl.ger.corp.intel.com>
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

Here goes the post-Holidays drm-intel-gt-next PR towards kernel 6.14 as
promised.

There is an engine reset improvement for Haswell (Gen7.5) and older platforms
and the rest is smaller fixes and dead code removal.

Regards, Joonas

***

drm-intel-gt-next-2025-01-10:

Driver Changes:

- More robust engine resets on Haswell and older (Nitin)

- Dead code removal (David)
- Selftest, logging and tracing improvements (Sk, Nitin, Sebastian,
  Apoorva)

The following changes since commit f373ebec18a75d671908e81ed9925aebf279ec2f:

  drm/i915/guc: Update guc_err message to show outstanding g2h responses (2024-12-17 11:38:50 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-gt-next-2025-01-10

for you to fetch changes up to 6f0572fa8fd6758f7a0ed2e96b429cb5b4323e12:

  drm/i915/gt: Prefer IS_ENABLED() instead of defined() on config option (2025-01-09 13:43:16 +0100)

----------------------------------------------------------------
Driver Changes:

- More robust engine resets on Haswell and older (Nitin)

- Dead code removal (David)
- Selftest, logging and tracing improvements (Sk, Nitin, Sebastian,
  Apoorva)

----------------------------------------------------------------
Apoorva Singh (1):
      drm/i915/gt: Prevent uninitialized pointer reads

Dr. David Alan Gilbert (3):
      drm/i915: Remove deadcode
      drm/i915: Remove unused intel_huc_suspend
      drm/i915: Remove unused intel_ring_cacheline_align

Nitin Gote (3):
      drm/i915/gt: Increase a time to retry RING_HEAD reset
      drm/i915/gt: Use ENGINE_TRACE for tracing.
      drm/i915/gt: Prefer IS_ENABLED() instead of defined() on config option

Sebastian Brzezinka (1):
      drm/i915/gt: Log reason for setting TAINT_WARN at reset

Sk Anirban (1):
      drm/i915/selftests: Implement frequency logging for energy reading validation

 drivers/gpu/drm/i915/gem/i915_gem_lmem.c        | 23 -------------------
 drivers/gpu/drm/i915/gem/i915_gem_lmem.h        |  2 --
 drivers/gpu/drm/i915/gt/intel_reset.c           |  6 ++++-
 drivers/gpu/drm/i915/gt/intel_ring.c            | 24 --------------------
 drivers/gpu/drm/i915/gt/intel_ring.h            |  1 -
 drivers/gpu/drm/i915/gt/intel_ring_submission.c | 30 +++++++++++++++----------
 drivers/gpu/drm/i915/gt/selftest_migrate.c      |  2 +-
 drivers/gpu/drm/i915/gt/selftest_rc6.c          | 17 +++++++++++---
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c      |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c          | 13 -----------
 drivers/gpu/drm/i915/gt/uc/intel_huc.h          |  1 -
 drivers/gpu/drm/i915/i915_active.c              | 18 ---------------
 drivers/gpu/drm/i915/i915_active.h              |  1 -
 13 files changed, 39 insertions(+), 101 deletions(-)
