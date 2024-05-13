Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5988C4060
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 14:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928C810E704;
	Mon, 13 May 2024 12:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J9DGeahn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C6010E700
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 12:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715601877; x=1747137877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TeYAL5gQ4bGqno8KIsZ61dRbJi+m1nb7gWs5w+3oagI=;
 b=J9DGeahn18/iH/9YF8ACJPpbgLvE5KgrfEOS4MGLm6aP2nNS2aQ+NL3p
 oW7FevQyJ1nnDd66XxgTcLA6DqB6dsTWdPVShEvzW1WdUeVvUaVsGuxuy
 6e7slSHKIpNFWQ7M3CDKie6wsZC/Qo5TrTy8/8hJbXxaKvbVdA02thQhF
 gunciucZz6KCGk8uVrRgBWZLz3817rZlMETv5vT300jZ7JjnydApZfSYd
 7m3aw/Vkb4XJzbexgpufVviBlcSjX+ANIJIA5DfDrn1xMlwMopnfY6yXc
 H/N4R+8yFrbldgzKGzw1GQSuhD8HtYswDQNwOWeXvHNuiA+TUxxkzkwxM w==;
X-CSE-ConnectionGUID: 70mEw9Z3TvW8rgXdqgEVQg==
X-CSE-MsgGUID: pevukimxR8WLFY5jjjP0Qg==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22131721"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="22131721"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 05:04:36 -0700
X-CSE-ConnectionGUID: G7OzkNEbR/GwgLGa4bBLGA==
X-CSE-MsgGUID: btpD80PzQSulHGkTtMvKFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30341021"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 05:04:35 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 01/12] accel/ivpu: Update VPU FW API headers
Date: Mon, 13 May 2024 14:04:20 +0200
Message-ID: <20240513120431.3187212-2-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240513120431.3187212-1-jacek.lawrynowicz@linux.intel.com>
References: <20240513120431.3187212-1-jacek.lawrynowicz@linux.intel.com>
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

Update JSM API to 3.16.0.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/ivpu/vpu_jsm_api.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/ivpu/vpu_jsm_api.h b/drivers/accel/ivpu/vpu_jsm_api.h
index e46f3531211a..33f462b1a25d 100644
--- a/drivers/accel/ivpu/vpu_jsm_api.h
+++ b/drivers/accel/ivpu/vpu_jsm_api.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: MIT */
 /*
- * Copyright (c) 2020-2023, Intel Corporation.
+ * Copyright (c) 2020-2024, Intel Corporation.
  */
 
 /**
@@ -22,12 +22,12 @@
 /*
  * Minor version changes when API backward compatibility is preserved.
  */
-#define VPU_JSM_API_VER_MINOR 15
+#define VPU_JSM_API_VER_MINOR 16
 
 /*
  * API header changed (field names, documentation, formatting) but API itself has not been changed
  */
-#define VPU_JSM_API_VER_PATCH 6
+#define VPU_JSM_API_VER_PATCH 0
 
 /*
  * Index in the API version table
@@ -868,6 +868,14 @@ struct vpu_ipc_msg_payload_hws_set_scheduling_log {
 	 * is generated when an event log is written to this index.
 	 */
 	u64 notify_index;
+	/*
+	 * Enable extra events to be output to log for debug of scheduling algorithm.
+	 * Interpreted by VPU as a boolean to enable or disable, expected values are
+	 * 0 and 1.
+	 */
+	u32 enable_extra_events;
+	/* Zero Padding */
+	u32 reserved_0;
 };
 
 /*
-- 
2.43.2

