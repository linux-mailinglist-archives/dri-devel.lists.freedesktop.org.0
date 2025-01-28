Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E158A211B4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 19:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3E010E6F2;
	Tue, 28 Jan 2025 18:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="by2c/Nhn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566CD10E1F1;
 Tue, 28 Jan 2025 18:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738089415; x=1769625415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N0IDqj4Q3M+8MU+4I67R8TyMY9NQojPNfmju8+r1pC8=;
 b=by2c/NhnKW+dtYqrljhO5KPW9ad18mo+ENzMwkyZwiZ7ugSckqxxMgsp
 YiJe2FsE1parplpoxCizESI4mJnCFtWVwq0xokEIjICPxyCDcjBfUNbLG
 mj5lsDic7Ez2X/AldPGzzvN6riPQJTzyc2B5EQkktdn7zKZSAf6y0vvDG
 9prbJOB0gXIXSY5ywlfNQ6xLs2NV99M+y38mOLorKrOqgDkHCSGtET8At
 ur3Y4uSU4EmqWTHjL+e9XYLPsPLE8BtSFbW7/HpoBaYH4ghyw4e/voug/
 SkVND2Q/mlShMhfa8zRfHp43OWuXtuE9izb9z/044bkeP7LJg92l1Mu9z Q==;
X-CSE-ConnectionGUID: fcX7IlsVTmGervBxcTaSsA==
X-CSE-MsgGUID: ct3JrzYgQOyrjtsM35cn5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38288842"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="38288842"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 10:36:55 -0800
X-CSE-ConnectionGUID: XS1r5YPpR2yqkM/BfdpEAA==
X-CSE-MsgGUID: J3Jf9V5HTIab3o8NNEajng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109735323"
Received: from aalteres-desk1.fm.intel.com ([10.1.39.140])
 by orviesa008.jf.intel.com with ESMTP; 28 Jan 2025 10:36:56 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v6 6/6] drm/xe/guc: Update comments on GuC-Err-Capture flows
Date: Tue, 28 Jan 2025 10:36:52 -0800
Message-Id: <20250128183653.4027915-7-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128183653.4027915-1-alan.previn.teres.alexis@intel.com>
References: <20250128183653.4027915-1-alan.previn.teres.alexis@intel.com>
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

Update the comments on GuC-Err-Capture flows with the
updated function names.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 92ea8cb681bb..72aebe5b22d1 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -905,21 +905,24 @@ guc_capture_init_node(struct xe_guc *guc, struct xe_guc_capture_snapshot *node)
  *                   list. This list is used for matchup and printout by xe_devcoredump_read
  *                   and xe_engine_snapshot_print, (when user invokes the devcoredump sysfs).
  *
- * GUC --> notify context reset:
- * -----------------------------
+ * DRM Scheduler job-timeout OR GuC-notify guc-id reset:
+ * -----------------------------------------------------
  *     --> guc_exec_queue_timedout_job
- *                   L--> xe_devcoredump
+ *               L--> xe_guc_capture_snapshot_store_manual_job (if GuC didn't report an
+ *                    error capture node for this job)
+ *               L--> xe_devcoredump
  *                          L--> devcoredump_snapshot
- *                               --> xe_hw_engine_snapshot_capture
- *                               --> xe_engine_manual_capture(For manual capture)
+ *                               --> xe_engine_snapshot_capture_for_queue
  *
- * User Sysfs / Debugfs
- * --------------------
- *      --> xe_devcoredump_read->
+ * User Devcoredump Sysfs
+ * ----------------------
+ *      --> xe_devcoredump_read-> (user cats devcoredump)
  *             L--> xxx_snapshot_print
  *                    L--> xe_engine_snapshot_print
  *                         Print register lists values saved at
  *                         guc->capture->outlist
+ *      --> xe_devcoredump_free (when user clears the dump)
+ *             L--> xe_devcoredump_snapshot_free --> xe_guc_capture_put_matched_nodes
  *
  */
 
-- 
2.34.1

