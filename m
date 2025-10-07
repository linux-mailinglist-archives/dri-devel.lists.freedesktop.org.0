Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E477BC0A6C
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 10:35:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80ACC10E5B5;
	Tue,  7 Oct 2025 08:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BrVbkjb9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D134E10E5B5
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 08:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759826099; x=1791362099;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bREkhAnGByedxbySfq4SC26nEialZQeOBQ82YiGZIDc=;
 b=BrVbkjb9WIrBWw7wDINHEG/WCgydgYXmi6GBRCK2fTvCxIa81AbwgMV9
 IPKRp8h2wnpSphg2OsoYkjaSH8xJ+SAqPnX+Y+oR6f+vjHY2wH+94pK0e
 5RNvAOXqo2w+X5swcMAied6iQL95HTpC8wI3HL05lLtqZeIp+lu8XbAXn
 lax8vmWQ+qV7hZ+qnGQIcw0JCF9hOPkNEoKn+ohRGEH8OPu/DNB0fY1z5
 IXhZmY5bot7M+HKFvH1piCbeD36puzu0lzMaKItZfn7XH+y1bh4ZCsf0v
 Zvf8oXFJ56cziJO7fPKODvXXNz8Iq0Tz+KIxDWtAwqspZg58WHXK69SOu Q==;
X-CSE-ConnectionGUID: MGnW2HRAQv+NrECHNrLhPw==
X-CSE-MsgGUID: PC14EuJNQiiGWg9FBMFA4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="62167610"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="62167610"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 01:34:59 -0700
X-CSE-ConnectionGUID: Ku/jQw59QaumXMzklzcH7w==
X-CSE-MsgGUID: 2SquobbNR4GYM0dX2iPT2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="211062161"
Received: from pl-npu-pc-kwachow.igk.intel.com ([10.91.220.239])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 01:34:56 -0700
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Update JSM API header to 3.33.0
Date: Tue,  7 Oct 2025 10:34:51 +0200
Message-ID: <20251007083451.2816990-1-karol.wachowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>

New API header includes additional status codes and range definitions
for error handling and improved API documentation.

Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
---
 drivers/accel/ivpu/vpu_jsm_api.h | 150 ++++++++++++++++++++-----------
 1 file changed, 96 insertions(+), 54 deletions(-)

diff --git a/drivers/accel/ivpu/vpu_jsm_api.h b/drivers/accel/ivpu/vpu_jsm_api.h
index de1b37ea1251..bca6a44dc041 100644
--- a/drivers/accel/ivpu/vpu_jsm_api.h
+++ b/drivers/accel/ivpu/vpu_jsm_api.h
@@ -23,12 +23,12 @@
 /*
  * Minor version changes when API backward compatibility is preserved.
  */
-#define VPU_JSM_API_VER_MINOR 32
+#define VPU_JSM_API_VER_MINOR 33
 
 /*
  * API header changed (field names, documentation, formatting) but API itself has not been changed
  */
-#define VPU_JSM_API_VER_PATCH 5
+#define VPU_JSM_API_VER_PATCH 0
 
 /*
  * Index in the API version table
@@ -76,8 +76,11 @@
 #define VPU_JSM_STATUS_PREEMPTED_MID_INFERENCE		 0xDU
 /* Job status returned when the job was preempted mid-command */
 #define VPU_JSM_STATUS_PREEMPTED_MID_COMMAND		 0xDU
+/* Range of status codes that require engine reset */
+#define VPU_JSM_STATUS_ENGINE_RESET_REQUIRED_MIN	 0xEU
 #define VPU_JSM_STATUS_MVNCI_CONTEXT_VIOLATION_HW	 0xEU
 #define VPU_JSM_STATUS_MVNCI_PREEMPTION_TIMED_OUT	 0xFU
+#define VPU_JSM_STATUS_ENGINE_RESET_REQUIRED_MAX	 0x1FU
 
 /*
  * Host <-> VPU IPC channels.
@@ -404,8 +407,8 @@ struct vpu_hws_native_fence_log_header {
 			/** Index of the first free entry in buffer. */
 			u32 first_free_entry_idx;
 			/**
-			 * Incremented each time NPU wraps around
-			 * the buffer to write next entry.
+			 * Incremented whenever the NPU wraps around the buffer and writes
+			 * to the first entry again.
 			 */
 			u32 wraparound_count;
 		};
@@ -454,10 +457,17 @@ struct vpu_hws_native_fence_log_buffer {
  * Host <-> VPU IPC messages types.
  */
 enum vpu_ipc_msg_type {
+	/** Unsupported command */
 	VPU_JSM_MSG_UNKNOWN = 0xFFFFFFFF,
 
-	/* IPC Host -> Device, Async commands */
+	/** IPC Host -> Device, base id for async commands */
 	VPU_JSM_MSG_ASYNC_CMD = 0x1100,
+	/**
+	 * Reset engine. The NPU cancels all the jobs currently executing on the target
+	 * engine making the engine become idle and then does a HW reset, before returning
+	 * to the host.
+	 * @see struct vpu_ipc_msg_payload_engine_reset
+	 */
 	VPU_JSM_MSG_ENGINE_RESET = VPU_JSM_MSG_ASYNC_CMD,
 	/**
 	 * Preempt engine. The NPU stops (preempts) all the jobs currently
@@ -467,6 +477,7 @@ enum vpu_ipc_msg_type {
 	 * the target engine, but it stops processing them (until the queue doorbell
 	 * is rung again); the host is responsible to reset the job queue, either
 	 * after preemption or when resubmitting jobs to the queue.
+	 * @see vpu_ipc_msg_payload_engine_preempt
 	 */
 	VPU_JSM_MSG_ENGINE_PREEMPT = 0x1101,
 	/**
@@ -583,23 +594,32 @@ enum vpu_ipc_msg_type {
 	 * @see vpu_ipc_msg_payload_hws_resume_engine
 	 */
 	VPU_JSM_MSG_HWS_ENGINE_RESUME = 0x111b,
-	/* Control command: Enable survivability/DCT mode */
+	/**
+	 * Control command: Enable survivability/DCT mode
+	 * @see vpu_ipc_msg_payload_pwr_dct_control
+	 */
 	VPU_JSM_MSG_DCT_ENABLE = 0x111c,
-	/* Control command: Disable survivability/DCT mode */
+	/**
+	 * Control command: Disable survivability/DCT mode
+	 * This command has no payload
+	 */
 	VPU_JSM_MSG_DCT_DISABLE = 0x111d,
 	/**
 	 * Dump VPU state. To be used for debug purposes only.
-	 * NOTE: Please introduce new ASYNC commands before this one. *
+	 * This command has no payload.
+	 * NOTE: Please introduce new ASYNC commands before this one.
 	 */
 	VPU_JSM_MSG_STATE_DUMP = 0x11FF,
 
-	/* IPC Host -> Device, General commands */
+	/** IPC Host -> Device, base id for general commands */
 	VPU_JSM_MSG_GENERAL_CMD = 0x1200,
+	/** Unsupported command */
 	VPU_JSM_MSG_BLOB_DEINIT_DEPRECATED = VPU_JSM_MSG_GENERAL_CMD,
 	/**
 	 * Control dyndbg behavior by executing a dyndbg command; equivalent to
 	 * Linux command:
 	 * @verbatim echo '<dyndbg_cmd>' > <debugfs>/dynamic_debug/control @endverbatim
+	 * @see vpu_ipc_msg_payload_dyndbg_control
 	 */
 	VPU_JSM_MSG_DYNDBG_CONTROL = 0x1201,
 	/**
@@ -607,7 +627,10 @@ enum vpu_ipc_msg_type {
 	 */
 	VPU_JSM_MSG_PWR_D0I3_ENTER = 0x1202,
 
-	/* IPC Device -> Host, Job completion */
+	/**
+	 * IPC Device -> Host, Job completion
+	 * @see struct vpu_ipc_msg_payload_job_done
+	 */
 	VPU_JSM_MSG_JOB_DONE = 0x2100,
 	/**
 	 * IPC Device -> Host, Fence signalled
@@ -622,6 +645,10 @@ enum vpu_ipc_msg_type {
 	 * @see vpu_ipc_msg_payload_engine_reset_done
 	 */
 	VPU_JSM_MSG_ENGINE_RESET_DONE = VPU_JSM_MSG_ASYNC_CMD_DONE,
+	/**
+	 * Preempt complete message
+	 * @see vpu_ipc_msg_payload_engine_preempt_done
+	 */
 	VPU_JSM_MSG_ENGINE_PREEMPT_DONE = 0x2201,
 	VPU_JSM_MSG_REGISTER_DB_DONE = 0x2202,
 	VPU_JSM_MSG_UNREGISTER_DB_DONE = 0x2203,
@@ -729,13 +756,20 @@ enum vpu_ipc_msg_type {
 	 * @see vpu_ipc_msg_payload_hws_resume_engine
 	 */
 	VPU_JSM_MSG_HWS_RESUME_ENGINE_DONE = 0x221c,
-	/* Response to control command: Enable survivability/DCT mode */
+	/**
+	 * Response to control command: Enable survivability/DCT mode
+	 * This command has no payload
+	 */
 	VPU_JSM_MSG_DCT_ENABLE_DONE = 0x221d,
-	/* Response to control command: Disable survivability/DCT mode */
+	/**
+	 * Response to control command: Disable survivability/DCT mode
+	 * This command has no payload
+	 */
 	VPU_JSM_MSG_DCT_DISABLE_DONE = 0x221e,
 	/**
 	 * Response to state dump control command.
-	 * NOTE: Please introduce new ASYNC responses before this one. *
+	 * This command has no payload.
+	 * NOTE: Please introduce new ASYNC responses before this one.
 	 */
 	VPU_JSM_MSG_STATE_DUMP_RSP = 0x22FF,
 
@@ -753,20 +787,25 @@ enum vpu_ipc_msg_type {
 
 enum vpu_ipc_msg_status { VPU_JSM_MSG_FREE, VPU_JSM_MSG_ALLOCATED };
 
-/*
- * Host <-> LRT IPC message payload definitions
+/**
+ * Engine reset request payload
+ * @see VPU_JSM_MSG_ENGINE_RESET
  */
 struct vpu_ipc_msg_payload_engine_reset {
-	/* Engine to be reset. */
+	/** Engine to be reset. */
 	u32 engine_idx;
-	/* Reserved */
+	/** Reserved */
 	u32 reserved_0;
 };
 
+/**
+ * Engine preemption request struct
+ * @see VPU_JSM_MSG_ENGINE_PREEMPT
+ */
 struct vpu_ipc_msg_payload_engine_preempt {
-	/* Engine to be preempted. */
+	/** Engine to be preempted. */
 	u32 engine_idx;
-	/* ID of the preemption request. */
+	/** ID of the preemption request. */
 	u32 preempt_id;
 };
 
@@ -935,20 +974,24 @@ struct vpu_jsm_metric_streamer_update {
 	u64 next_buffer_size;
 };
 
+/**
+ * Device -> host job completion message.
+ * @see VPU_JSM_MSG_JOB_DONE
+ */
 struct vpu_ipc_msg_payload_job_done {
-	/* Engine to which the job was submitted. */
+	/** Engine to which the job was submitted. */
 	u32 engine_idx;
-	/* Index of the doorbell to which the job was submitted */
+	/** Index of the doorbell to which the job was submitted */
 	u32 db_idx;
-	/* ID of the completed job */
+	/** ID of the completed job */
 	u32 job_id;
-	/* Status of the completed job */
+	/** Status of the completed job */
 	u32 job_status;
-	/* Host SSID */
+	/** Host SSID */
 	u32 host_ssid;
-	/* Zero Padding */
+	/** Zero Padding */
 	u32 reserved_0;
-	/* Command queue id */
+	/** Command queue id */
 	u64 cmdq_id;
 };
 
@@ -997,10 +1040,14 @@ struct vpu_ipc_msg_payload_engine_reset_done {
 		impacted_contexts[VPU_MAX_ENGINE_RESET_IMPACTED_CONTEXTS];
 };
 
+/**
+ * Preemption response struct
+ * @see VPU_JSM_MSG_ENGINE_PREEMPT_DONE
+ */
 struct vpu_ipc_msg_payload_engine_preempt_done {
-	/* Engine preempted. */
+	/** Engine preempted. */
 	u32 engine_idx;
-	/* ID of the preemption request. */
+	/** ID of the preemption request. */
 	u32 preempt_id;
 };
 
@@ -1552,29 +1599,24 @@ struct vpu_jsm_metric_counter_descriptor {
 };
 
 /**
- * Payload for VPU_JSM_MSG_DYNDBG_CONTROL requests.
+ * Payload for @ref VPU_JSM_MSG_DYNDBG_CONTROL requests.
  *
- * VPU_JSM_MSG_DYNDBG_CONTROL are used to control the VPU FW Dynamic Debug
- * feature, which allows developers to selectively enable / disable MVLOG_DEBUG
- * messages. This is equivalent to the Dynamic Debug functionality provided by
- * Linux
- * (https://www.kernel.org/doc/html/latest/admin-guide/dynamic-debug-howto.html)
- * The host can control Dynamic Debug behavior by sending dyndbg commands, which
- * have the same syntax as Linux
- * dyndbg commands.
+ * VPU_JSM_MSG_DYNDBG_CONTROL requests are used to control the VPU FW dynamic debug
+ * feature, which allows developers to selectively enable/disable code to obtain
+ * additional FW information. This is equivalent to the dynamic debug functionality
+ * provided by Linux. The host can control dynamic debug behavior by sending dyndbg
+ * commands, using the same syntax as for Linux dynamic debug commands.
  *
- * NOTE: in order for MVLOG_DEBUG messages to be actually printed, the host
- * still has to set the logging level to MVLOG_DEBUG, using the
- * VPU_JSM_MSG_TRACE_SET_CONFIG command.
+ * @see https://www.kernel.org/doc/html/latest/admin-guide/dynamic-debug-howto.html.
  *
- * The host can see the current dynamic debug configuration by executing a
- * special 'show' command. The dyndbg configuration will be printed to the
- * configured logging destination using MVLOG_INFO logging level.
+ * NOTE:
+ * As the dynamic debug feature uses MVLOG messages to provide information, the host
+ * must first set the logging level to MVLOG_DEBUG, using the @ref VPU_JSM_MSG_TRACE_SET_CONFIG
+ * command.
  */
 struct vpu_ipc_msg_payload_dyndbg_control {
 	/**
-	 * Dyndbg command (same format as Linux dyndbg); must be a NULL-terminated
-	 * string.
+	 * Dyndbg command to be executed.
 	 */
 	char dyndbg_cmd[VPU_DYNDBG_CMD_MAX_LEN];
 };
@@ -1595,7 +1637,7 @@ struct vpu_ipc_msg_payload_pwr_d0i3_enter {
 };
 
 /**
- * Payload for VPU_JSM_MSG_DCT_ENABLE message.
+ * Payload for @ref VPU_JSM_MSG_DCT_ENABLE message.
  *
  * Default values for DCT active/inactive times are 5.3ms and 30ms respectively,
  * corresponding to a 85% duty cycle. This payload allows the host to tune these
@@ -1652,28 +1694,28 @@ union vpu_ipc_msg_payload {
 	struct vpu_ipc_msg_payload_pwr_dct_control pwr_dct_control;
 };
 
-/*
- * Host <-> LRT IPC message base structure.
+/**
+ * Host <-> NPU IPC message base structure.
  *
  * NOTE: All instances of this object must be aligned on a 64B boundary
  * to allow proper handling of VPU cache operations.
  */
 struct vpu_jsm_msg {
-	/* Reserved */
+	/** Reserved */
 	u64 reserved_0;
-	/* Message type, see vpu_ipc_msg_type enum. */
+	/** Message type, see @ref vpu_ipc_msg_type. */
 	u32 type;
-	/* Buffer status, see vpu_ipc_msg_status enum. */
+	/** Buffer status, see @ref vpu_ipc_msg_status. */
 	u32 status;
-	/*
+	/**
 	 * Request ID, provided by the host in a request message and passed
 	 * back by VPU in the response message.
 	 */
 	u32 request_id;
-	/* Request return code set by the VPU, see VPU_JSM_STATUS_* defines. */
+	/** Request return code set by the VPU, see VPU_JSM_STATUS_* defines. */
 	u32 result;
 	u64 reserved_1;
-	/* Message payload depending on message type, see vpu_ipc_msg_payload union. */
+	/** Message payload depending on message type, see vpu_ipc_msg_payload union. */
 	union vpu_ipc_msg_payload payload;
 };
 
-- 
2.43.0

