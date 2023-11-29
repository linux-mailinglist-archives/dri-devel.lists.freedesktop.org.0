Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7317FE029
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 20:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3889710E371;
	Wed, 29 Nov 2023 19:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 361 seconds by postgrey-1.36 at gabe;
 Wed, 29 Nov 2023 19:13:45 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF4A10E206;
 Wed, 29 Nov 2023 19:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701285225; x=1732821225;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cznXYdFn2yXJndLaqizirOEy5XYkZ5q0aH65FuxxDCM=;
 b=cY1ELDIsRnhlVu9FlJN0o2yqzCdLtAIY4f2y/2OmM+mRIdyzPw5pygQY
 Y0Kvtk00fiwSeuaPodVCHnlHGY2Gzt0MJzj09q/1Lzv4pdBXzyjBWkTI/
 ewMG9IQdp3CECSGhWNqi7KtgpqMN23N1qdnghA2c3wGD7xKBdIJywbbT5
 MIn+dqdOSWQ9/02b7QO1Vf5BY6Wq1sRj9r5daNV3wCYlnXhKx1ZBqsFBz
 artHoMjX/0pQFHPRF6HESu3KAfi4cYgOnXlHkowHWDrGvxFnbHhCwswI2
 npQAhBsHqo4q1jvR2R7bxLva226XuUvCLQJRga6XH0YtCDRF+hkzDQk9T w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="81810"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="81810"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 11:13:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="835121339"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="835121339"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga008.fm.intel.com with ESMTP; 29 Nov 2023 11:13:44 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 1/1] drm/i915/pxp: Add missing tag for Wa_14019159160
Date: Wed, 29 Nov 2023 11:13:43 -0800
Message-Id: <20231129191343.157097-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
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
Cc: John Harrison <john.c.harrison@Intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add missing tag for "Wa_14019159160 - Case 2" (for existing
PXP code that ensures run alone mode bit is set to allow
PxP-decryption.

 v4: - Include IP_VER 12.71. (Matt Roper)
 v3: - Check targeted platforms using IP_VAL. (John Harrison)
 v2: - Fix WA id number (John Harrison).
     - Improve comments and code to be specific
       for the targeted platforms (John Harrison)

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_lrc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 7c367ba8d9dc..d92e39bbb13d 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -863,10 +863,12 @@ static bool ctx_needs_runalone(const struct intel_context *ce)
 	bool ctx_is_protected = false;
 
 	/*
-	 * On MTL and newer platforms, protected contexts require setting
-	 * the LRC run-alone bit or else the encryption will not happen.
+	 * Wa_14019159160 - Case 2.
+	 * On some platforms, protected contexts require setting
+	 * the LRC run-alone bit or else the encryption/decryption will not happen.
+	 * NOTE: Case 2 only applies to PXP use-case of said workaround.
 	 */
-	if (GRAPHICS_VER_FULL(ce->engine->i915) >= IP_VER(12, 70) &&
+	if (IS_GFX_GT_IP_RANGE(ce->engine->gt, IP_VER(12, 70), IP_VER(12, 71)) &&
 	    (ce->engine->class == COMPUTE_CLASS || ce->engine->class == RENDER_CLASS)) {
 		rcu_read_lock();
 		gem_ctx = rcu_dereference(ce->gem_context);

base-commit: 436cb0ff9f20fadc99ec3b70c4d2ac6cb2e4410a
-- 
2.39.0

