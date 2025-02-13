Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD41A34EAF
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 20:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BFCE10EB94;
	Thu, 13 Feb 2025 19:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VBEBgSHL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE9310EB8C;
 Thu, 13 Feb 2025 19:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739476301; x=1771012301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j1b48mZQZrOwtZCbIamUNkWKk66t9YWs8MImyttoz7Q=;
 b=VBEBgSHLTHWnIFhGyhIsYusa5JCftLhQugWKb1L+qLIMvCp20JMw+oCa
 rtuYVIGeBM2aDloQru2v/OfAptkqXpPmFV9T7xgg12Aknl3MAkL5RKkqb
 7m/6FAhqjF3NQ6DvqTmSKhzzt5FsVgOZkcaefzX+0WgeV08zz467vjmgA
 0S89xRruLusnGeEgOpU+YoGLiMhp35uN2LO/vp9+h/W47Beq9AyD3SGiz
 vU7gzi/HCYMmyGZkhmNuyvUsRO9tt/9ggGmWs5qD7tTltq23y1H+SufHJ
 s3fLEFugWDzlBb14XuvaUpnSfNJKQyCPF5C1s3kWfm8XRsZNc58UezvBI A==;
X-CSE-ConnectionGUID: 9s2tiR08RvyaKzcd1vuGCg==
X-CSE-MsgGUID: jJpRqJYyQw21hpNNH6AECw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40354751"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40354751"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 11:51:41 -0800
X-CSE-ConnectionGUID: NpLOmgLFQ2WfUKscLqEkfw==
X-CSE-MsgGUID: BbkqywndR9yDcbfkWmF7cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117372227"
Received: from aalteres-desk1.fm.intel.com ([10.1.39.140])
 by fmviesa003.fm.intel.com with ESMTP; 13 Feb 2025 11:51:41 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v8 6/6] drm/xe/guc: Update comments on GuC-Err-Capture flows
Date: Thu, 13 Feb 2025 11:51:39 -0800
Message-Id: <20250213195139.3396082-7-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213195139.3396082-1-alan.previn.teres.alexis@intel.com>
References: <20250213195139.3396082-1-alan.previn.teres.alexis@intel.com>
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
Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.c | 42 ++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 4ab71dfa7a20..0996b32fcee7 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -905,22 +905,38 @@ guc_capture_init_node(struct xe_guc *guc, struct xe_guc_capture_snapshot *node)
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
- *             L--> xxx_snapshot_print
- *                    L--> xe_hw_engine_print --> xe_hw_engine_snapshot_print
- *                          L--> xe_guc_capture_snapshot_print
- *                               Print register lists values saved in matching
- *                               node from guc->capture->outlist
+ * (Printing) User Devcoredump Sysfs
+ * ---------------------------------
+ *      --> xe_devcoredump_read-> (user cats devcoredump)
+ *              L--> xe_devcoredump_deferred_snap_work -> xe_devcoredump_deferred_snap_work
+ *                   L --> __xe_devcoredump_read -> xe_hw_engine_snapshot_print
+ *                         L--> xe_hw_engine_print -> xe_guc_capture_snapshot_print:
+ *                              Prints register list values saved in the matching node that
+ *                              was previously stored in guc->capture->outlist. However if
+ *                              devcoredump was triggered in response to a gt_reset, then it's
+ *                              possible job queues maybe lost or unavailable at the time of
+ *                              printing and a jobless capture would be taken.
+ *
+ *      --> xe_devcoredump_free (when user clears the dump)
+ *             L--> xe_devcoredump_snapshot_free --> xe_hw_engine_snapshot_free ->
+ *                  L--> xe_guc_capture_put_matched_nodes -> xe_guc_capture_put_matched_nodes
+ *
+ * (Printing) User Engine Dump via Debugfs
+ * ---------------------------------------
+ *      --> xe_gt_debugfs_simple_show -> hw_engines -> xe_hw_engine_print
+ *             L--> hw_engine_snapshot_capture -> xe_guc_capture_snapshot_manual_hwe
+ *             L--> xe_guc_capture_snapshot_print (no valid queue provided)
+ *                  (unlike sysfs path above, fallback to jobless immediate dump)
+ *             L--> xe_hw_engine_snapshot_free -> xe_guc_capture_put_matched_nodes
  *
  */
 
-- 
2.34.1

