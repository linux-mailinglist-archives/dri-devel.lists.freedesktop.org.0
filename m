Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFC141CBBE
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 20:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9342189F99;
	Wed, 29 Sep 2021 18:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4790C89E7C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 18:21:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="247540935"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="247540935"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 11:21:48 -0700
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="457137080"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 11:21:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: gfx-internal-devel@eclists.intel.com
Cc: Daniel Vetter <daniel.vetter@intel.com>, dri-devel@lists.freedesktop.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Rename IS_ACTIVE() and move to kconfig.h
Date: Wed, 29 Sep 2021 11:16:29 -0700
Message-Id: <20210929181632.1489847-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.33.0
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

As we try to reduce our i915-only helpers, let's try to improve
IS_ACTIVE() logic and move to kconfig.h.

I'm not 100% happy with the name, but it's the best I could come up
with, hopefully a little better than trying to add IS_ACTIVE() to be
used broadly.

Lucas De Marchi (3):
  drm/i915: rename IS_ACTIVE
  drm/i915/utils: do not depend on config being defined
  Move IS_CONFIG_NONZERO() to kconfig.h

 drivers/gpu/drm/i915/gem/i915_gem_context.c      |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c         |  2 +-
 drivers/gpu/drm/i915/gt/intel_engine.h           |  4 ++--
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c |  2 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h     |  2 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c |  2 +-
 .../gpu/drm/i915/gt/selftest_engine_heartbeat.c  |  4 ++--
 drivers/gpu/drm/i915/gt/selftest_execlists.c     | 14 +++++++-------
 drivers/gpu/drm/i915/i915_config.c               |  2 +-
 drivers/gpu/drm/i915/i915_request.c              |  2 +-
 drivers/gpu/drm/i915/i915_utils.h                | 13 -------------
 include/linux/kconfig.h                          | 16 ++++++++++++++--
 12 files changed, 32 insertions(+), 33 deletions(-)

-- 
2.33.0

