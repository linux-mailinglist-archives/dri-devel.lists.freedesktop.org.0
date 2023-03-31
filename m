Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 380AD6D1C38
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FD010F18B;
	Fri, 31 Mar 2023 09:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A2910F184;
 Fri, 31 Mar 2023 09:26:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5FE7D62658;
 Fri, 31 Mar 2023 09:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4F3C433AC;
 Fri, 31 Mar 2023 09:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680254817;
 bh=DLZvhHUJ/JE8d6JXndY4m3tbaZLUBedML7g5WEPqris=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g0/zehYxxV3SbpzaffON9X72YYC2yukFZ647Xi8QonnyadaEdVwQsjKjWg/DRuybW
 atCIEBbwf0/lwec+xCjnLJQdYPk6aXbDBAW9nypopJNGJi142Wuphh0ddOcQULUJ3V
 YBdXaKN66zNjzxFoxpIl+m9V3ne4zmLMQYq2PKTQQ73hEcS93bTvVE0mYPsxknGTgl
 hMcqQCjcCysAZy0IFdBAgroW7Pgh2ZFksOFqcmWYYnzJXdg/HDRWVMWa5tuK8Y+tR+
 oVhgUBjDDaKXSxYuJ2ApjKNX8P3Tt/wYCjok16hBujvAZopSorVg5GC0HVkxtcE1o+
 s2HG9KGMc+hJg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 15/19] drm/i915/gt/uc/intel_guc_hwconfig: Demote a few
 non-conforming kerneldoc headers
Date: Fri, 31 Mar 2023 10:26:03 +0100
Message-Id: <20230331092607.700644-16-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230331092607.700644-1-lee@kernel.org>
References: <20230331092607.700644-1-lee@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c:112: warning: Function parameter or member 'gt' not described in 'guc_hwconfig_init'
 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c:112: warning: expecting prototype for intel_guc_hwconfig_init(). Prototype was for guc_hwconfig_init() instead
 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c:145: warning: Function parameter or member 'gt' not described in 'intel_gt_init_hwconfig'
 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c:158: warning: Function parameter or member 'gt' not described in 'intel_gt_fini_hwconfig'

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
index 4781fccc2687d..852bea0208ce4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
@@ -102,7 +102,7 @@ static bool has_table(struct drm_i915_private *i915)
 	return false;
 }
 
-/**
+/*
  * intel_guc_hwconfig_init - Initialize the HWConfig
  *
  * Retrieve the HWConfig table from the GuC and save it locally.
@@ -136,7 +136,7 @@ static int guc_hwconfig_init(struct intel_gt *gt)
 	return 0;
 }
 
-/**
+/*
  * intel_gt_init_hwconfig - Initialize the HWConfig if available
  *
  * Retrieve the HWConfig table if available on the current platform.
@@ -149,7 +149,7 @@ int intel_gt_init_hwconfig(struct intel_gt *gt)
 	return guc_hwconfig_init(gt);
 }
 
-/**
+/*
  * intel_gt_fini_hwconfig - Finalize the HWConfig
  *
  * Free up the memory allocation holding the table.
-- 
2.40.0.348.gf938b09366-goog

