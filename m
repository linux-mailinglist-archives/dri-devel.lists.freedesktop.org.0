Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A2D3BEDC1
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 20:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527D96E1A7;
	Wed,  7 Jul 2021 18:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB276E873;
 Wed,  7 Jul 2021 18:13:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="209316964"
X-IronPort-AV: E=Sophos;i="5.84,221,1620716400"; d="scan'208";a="209316964"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 11:13:46 -0700
X-IronPort-AV: E=Sophos;i="5.84,221,1620716400"; d="scan'208";a="457570317"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 11:13:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/i915: Nuke GEN macros
Date: Wed,  7 Jul 2021 11:13:22 -0700
Message-Id: <20210707181325.2130821-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
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
Cc: Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Finish the conversion to the new VER macros and nuke the old macros so
we don't have more changes sneaking in.

Initially I thought about waiting for a backmerge from drm-next in
drm-intel-next so I could use a topic branch to finish the conversion
and nuke the macro, merging the topic branch in both drm-intel-next and
drm-intel-gt-next. After the backmerge landed, I realized that would not
be possible anymore as we already have changes on top preventing the
merge-base to be used for a topic branch.

Therefore the plan is:
	- Apply patch 1 in drm-intel-gt-next
	- Apply patches 2 and 3 in drm-intel-next

Since patches are tested on drm-tip, CI should flag a build breakage if
someone uses the GEN macros. Another possibility is to simply apply the
3rd patch on both branches, but I don't see a real need for that.

Lucas De Marchi (3):
  drm/i915/gt: finish INTEL_GEN and friends conversion
  drm/i915: finish INTEL_GEN and friends conversion
  gpu/drm/i915: nuke old GEN macros

 .../drm/i915/display/intel_display_debugfs.c  |  3 ++-
 drivers/gpu/drm/i915/gt/intel_migrate.c       | 20 +++++++++----------
 drivers/gpu/drm/i915/i915_debugfs.c           |  2 +-
 drivers/gpu/drm/i915/i915_drv.h               | 15 --------------
 drivers/gpu/drm/i915/intel_uncore.c           |  2 +-
 5 files changed, 14 insertions(+), 28 deletions(-)

-- 
2.31.1

