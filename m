Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 683BA38CD05
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 20:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E92E6E83D;
	Fri, 21 May 2021 18:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D6BE6E838;
 Fri, 21 May 2021 18:14:29 +0000 (UTC)
IronPort-SDR: cn/hF8+SeDXwrcLDvDJeaUgkWhupgjXIS6No/6bPtcvdItlBtRRtXvCPvondpEcWtqP5pNgszp
 vzVKBu///O6w==
X-IronPort-AV: E=McAfee;i="6200,9189,9991"; a="188938001"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="188938001"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 11:14:25 -0700
IronPort-SDR: t/SbJDufNNudhei6hPPrvB7IL/z0tEfKjYiQ5OdGDF6LCjFo6j27iHiRxMtABrysJ6d1papAEB
 MJLJDQ7rkeNw==
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="468587230"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 11:14:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/3] Clean a few backend interfaces in the i915
Date: Fri, 21 May 2021 11:32:12 -0700
Message-Id: <20210521183215.65451-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

As discussed in [1] start merging some support patches as a precursor to
GuC submission the i915. This is step #1 mentioned in [1].

[1] https://patchwork.freedesktop.org/series/89844/

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Chris Wilson (3):
  drm/i915/gt: Move engine setup out of set_default_submission
  drm/i915/gt: Move submission_method into intel_gt
  drm/i915/gt: Move CS interrupt handler to the backend

 drivers/gpu/drm/i915/gt/intel_engine.h        |  8 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 19 +++-
 drivers/gpu/drm/i915/gt/intel_engine_types.h  | 14 +--
 .../drm/i915/gt/intel_execlists_submission.c  | 95 +++++++++++++------
 .../drm/i915/gt/intel_execlists_submission.h  |  3 -
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        | 82 +++++-----------
 drivers/gpu/drm/i915/gt/intel_gt_irq.h        | 23 +++++
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |  7 ++
 drivers/gpu/drm/i915/gt/intel_reset.c         |  7 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   | 12 ++-
 drivers/gpu/drm/i915/gt/intel_rps.c           |  2 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |  2 +-
 .../drm/i915/gt/selftest_ring_submission.c    |  2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 64 ++++++-------
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  1 -
 drivers/gpu/drm/i915/i915_irq.c               | 10 +-
 drivers/gpu/drm/i915/i915_perf.c              | 10 +-
 17 files changed, 199 insertions(+), 162 deletions(-)

-- 
2.28.0

