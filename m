Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C368C376263
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 10:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F756EDEB;
	Fri,  7 May 2021 08:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465286EDEA;
 Fri,  7 May 2021 08:49:33 +0000 (UTC)
IronPort-SDR: GACUjahMa1FHb89oBD8zewhsUAwR7spZo6xayG59gRRXjb5m6rol8b0mRAZKco6ul31CkXPY3H
 2THnVpHRbq7w==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="198767028"
X-IronPort-AV: E=Sophos;i="5.82,280,1613462400"; d="scan'208";a="198767028"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2021 01:49:31 -0700
IronPort-SDR: YrHIC+GDXF8wiSWGl9HzmgYvmEsOk+Qagn2L6OdBdb6TGeJU17Yz5XL4hgK4jAJD6N/fWem4bJ
 IYa/ebjAjuIw==
X-IronPort-AV: E=Sophos;i="5.82,280,1613462400"; d="scan'208";a="465319513"
Received: from ddselkir-mobl2.amr.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.244.245])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2021 01:49:30 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [CI] drm/i915: Drop duplicate WaDisable4x2SubspanOptimization:hsw
Date: Fri,  7 May 2021 09:49:26 +0100
Message-Id: <20210507084926.2423003-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Same workaround was listed two times - once under the Gen7 block and once
under the Haswell section.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 5a03a76bb9e2..62cb9ee5bfc3 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1859,9 +1859,6 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 			      CACHE_MODE_0_GEN7,
 			      /* enable HiZ Raw Stall Optimization */
 			      HIZ_RAW_STALL_OPT_DISABLE);
-
-		/* WaDisable4x2SubspanOptimization:hsw */
-		wa_masked_en(wal, CACHE_MODE_1, PIXEL_SUBSPAN_COLLECT_OPT_DISABLE);
 	}
 
 	if (IS_VALLEYVIEW(i915)) {
-- 
2.30.2

