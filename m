Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A21B44DBB17
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 00:32:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BAB110E66F;
	Wed, 16 Mar 2022 23:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B038410E66F;
 Wed, 16 Mar 2022 23:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647473523; x=1679009523;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9pEfiKjwIwh4XLr0UL5Wth5EnFBTorl7UAAHUrzo4j8=;
 b=I1Ef8aOD2TAa4aIgxio/ZId/HDVryv9SvHbjTGx2ftQB1SOx3MW2N+3A
 WgAUf9Ifewfi+YpE2CgoxRc5nhalkReX81Il4kwGVx87Gb+FxLlmTz5kq
 7xR5IUjypmfMIr1ZXLOPksfq9cvGzQz9fowroFyoV9zc2FjQw5sZqhImt
 Z6svvSKvZoGlmLMJ3MKR+urekyhlfMg6R3zCLkQvKO96yV00f5pcC+D+7
 +f4nKuaQqGXkuiHIR9g57tBFnEi+L3M0lWE9ubC9z+d4B2bstfCaX7oqy
 WJvFTxB4+25i/CxvPzXyIzvWZx1SGzvksXswGkgQ/EYxWHXXD1h0swLFD g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="237343409"
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; d="scan'208";a="237343409"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 16:32:01 -0700
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; d="scan'208";a="613816768"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 16:32:01 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 3/3] REVIEW: Full tree diff against origin/internal
Date: Wed, 16 Mar 2022 16:31:48 -0700
Message-Id: <20220316233148.434177-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316233148.434177-1-lucas.demarchi@intel.com>
References: <20220316233148.434177-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/x-patch; charset=UTF-8
X-Git-Pile: INTEL_DII
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Auto-generated diff between origin/internal..internal
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index bbaf1caca607f..ddbde96311eb1 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1028,17 +1028,17 @@ static void populate_logical_ids(struct intel_gt *gt, u8 *logical_ids,
 static void setup_logical_ids(struct intel_gt *gt, u8 *logical_ids, u8 class)
 {
 	/*
-	 * As of right now, only a few platforms' video decode boxes have
-	 * non-standard logical mappings, hence the specical cases. These
-	 * mappings are defined in bspec 48028, 48075 and are needed to use the
-	 * split-frame feature.
+	 * Logical to physical mapping is needed for proper support
+	 * to split-frame feature.
 	 */
 	if (HAS_SLIM_VDBOX(gt->i915) && class == VIDEO_DECODE_CLASS) {
 		static const u8 map[] = { 0, 2, 1 };
 
 		populate_logical_ids(gt, logical_ids, class,
 				     map, ARRAY_SIZE(map));
-	} else if (IS_XEHPSDV(gt->i915) && class == VIDEO_DECODE_CLASS) {
+
+	} else if (MEDIA_VER_FULL(gt->i915) >= IP_VER(12, 50) &&
+	    class == VIDEO_DECODE_CLASS) {
 		static const u8 map[] = { 0, 2, 4, 6, 1, 3, 5, 7 };
 
 		populate_logical_ids(gt, logical_ids, class,
--
git-pile 0.99-dev

