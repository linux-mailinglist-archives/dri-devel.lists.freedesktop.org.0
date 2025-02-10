Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD11A2FE78
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 00:33:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2311F10E40A;
	Mon, 10 Feb 2025 23:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OOJDQIxT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3BA10E405;
 Mon, 10 Feb 2025 23:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739230431; x=1770766431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dULkmK9A7vz8oAHhmoIdbTnHbo1ijMt8GLN3xdAQtjQ=;
 b=OOJDQIxTZDcRPeMdygg/AloAImfFoPXgISzIvbEbq6laxa2sQq2d2YQt
 91RY8du1Etur+ILa2WHtWdirgDL709mocq0hNxJbP3cXVB/GxEOZihQXH
 dx0b705kTgKInUVOABtUe/k9w+0TujT31qCIHzX3c4Rcv80pgq0bIJOg+
 /wosgKrB8GNhsLUv+WcGI82a4Q5b3Q3TRpxhZAFGEds5YxcNRQYZLfqIb
 BTZ85l9G0U6ss9TsT/o0Isr9xsJKIXf0Vcic31wniluttVnyjIuxTnKvr
 1H9Sx3uR/TIyyrkdAQPg2gY0x13Z14aC2LyfPHcP133ooXO0L4aseQ2qy Q==;
X-CSE-ConnectionGUID: xo1rMd0hSI20/kMU+TPUhg==
X-CSE-MsgGUID: 3SLiaXTAQziDBiFKezuvzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39853930"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="39853930"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 15:33:51 -0800
X-CSE-ConnectionGUID: XIa+egl+RWmzUgBoEcbOUw==
X-CSE-MsgGUID: SE7RqGnHQTyrXC6+t/s7hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117252453"
Received: from aalteres-desk1.fm.intel.com ([10.1.39.140])
 by orviesa003.jf.intel.com with ESMTP; 10 Feb 2025 15:32:57 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v7 6/6] drm/xe/guc: Update comments on GuC-Err-Capture flows
Date: Mon, 10 Feb 2025 15:32:54 -0800
Message-Id: <20250210233254.419587-7-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210233254.419587-1-alan.previn.teres.alexis@intel.com>
References: <20250210233254.419587-1-alan.previn.teres.alexis@intel.com>
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
index 746d3b21b18b..15f9b08ff7bb 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -905,22 +905,25 @@ guc_capture_init_node(struct xe_guc *guc, struct xe_guc_capture_snapshot *node)
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
  *                    L--> xe_hw_engine_print --> xe_hw_engine_snapshot_print
  *                          L--> xe_guc_capture_snapshot_print
  *                               Print register lists values saved in matching
  *                               node from guc->capture->outlist
+ *      --> xe_devcoredump_free (when user clears the dump)
+ *             L--> xe_devcoredump_snapshot_free --> xe_guc_capture_put_matched_nodes
  *
  */
 
-- 
2.34.1

