Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2544F7D0DCF
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 12:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97F810E5AF;
	Fri, 20 Oct 2023 10:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87F610E5A8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 10:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697798719; x=1729334719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sPq64ldthO4v3qmglpxkCNx3w8htJvO641ErkZYNWaI=;
 b=PFnPI4sBwqL8TkNYxx1J8T5XIDXsgMTLXR7ZzJpatzM3VCrUdTaYCGDT
 gVAidLPv373iVpF10ZFp69N0bkEqx2+Y5nnu4W9AuyfYeoNzHALD3HCx9
 cpeGiPR4nJu5+ZPF+LYdBONyVGtat3QWYfn3PXO5iyuwa8WENpkFR2068
 YJdccuKm6mdSbSBjY3t3xcjgCFSPLWhmAnY0IH85l1IWqgmgJu1ntJf6G
 4ya9VjmimaUQZB6HD0CgSUAK4uDdGplh9BA/Yl+3YGoevOxv9tMuTtIHH
 6rLnG/X6gXw5+SKjqYS8sObpMmA4tiQ794F3IeFKy0fEXcXTvR7aCylw1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="386287536"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="386287536"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 03:45:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="1004572646"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="1004572646"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 03:45:17 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6] accel/ivpu: Print IPC type string instead of number
Date: Fri, 20 Oct 2023 12:44:59 +0200
Message-Id: <20231020104501.697763-5-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020104501.697763-1-stanislaw.gruszka@linux.intel.com>
References: <20231020104501.697763-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Maciej Falkowski <maciej.falkowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>

Introduce ivpu_jsm_msg_type_to_str() helper to print type of IPC
message. This will make reading logs and debugging IPC issues easier.

Co-developed-by: Maciej Falkowski <maciej.falkowski@intel.com>
Signed-off-by: Maciej Falkowski <maciej.falkowski@intel.com>
Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_ipc.c     |  9 +++--
 drivers/accel/ivpu/ivpu_jsm_msg.c | 64 +++++++++++++++++++++++++++++++
 drivers/accel/ivpu/ivpu_jsm_msg.h |  2 +
 3 files changed, 71 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index f0137536d7c6..6e213a5afb8c 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -45,8 +45,9 @@ static void ivpu_jsm_msg_dump(struct ivpu_device *vdev, char *c,
 	u32 *payload = (u32 *)&jsm_msg->payload;
 
 	ivpu_dbg(vdev, JSM,
-		 "%s: vpu:0x%08x (type:0x%x, status:0x%x, id: 0x%x, result: 0x%x, payload:0x%x 0x%x 0x%x 0x%x 0x%x)\n",
-		 c, vpu_addr, jsm_msg->type, jsm_msg->status, jsm_msg->request_id, jsm_msg->result,
+		 "%s: vpu:0x%08x (type:%s, status:0x%x, id: 0x%x, result: 0x%x, payload:0x%x 0x%x 0x%x 0x%x 0x%x)\n",
+		 c, vpu_addr, ivpu_jsm_msg_type_to_str(jsm_msg->type),
+		 jsm_msg->status, jsm_msg->request_id, jsm_msg->result,
 		 payload[0], payload[1], payload[2], payload[3], payload[4]);
 }
 
@@ -272,8 +273,8 @@ ivpu_ipc_send_receive_internal(struct ivpu_device *vdev, struct vpu_jsm_msg *req
 
 	ret = ivpu_ipc_receive(vdev, &cons, NULL, resp, timeout_ms);
 	if (ret) {
-		ivpu_warn_ratelimited(vdev, "IPC receive failed: type 0x%x, ret %d\n",
-				      req->type, ret);
+		ivpu_warn_ratelimited(vdev, "IPC receive failed: type %s, ret %d\n",
+				      ivpu_jsm_msg_type_to_str(req->type), ret);
 		goto consumer_del;
 	}
 
diff --git a/drivers/accel/ivpu/ivpu_jsm_msg.c b/drivers/accel/ivpu/ivpu_jsm_msg.c
index 5d37efa8ce31..0c2fe7142024 100644
--- a/drivers/accel/ivpu/ivpu_jsm_msg.c
+++ b/drivers/accel/ivpu/ivpu_jsm_msg.c
@@ -7,6 +7,70 @@
 #include "ivpu_ipc.h"
 #include "ivpu_jsm_msg.h"
 
+const char *ivpu_jsm_msg_type_to_str(enum vpu_ipc_msg_type type)
+{
+	#define IVPU_CASE_TO_STR(x) case x: return #x
+	switch (type) {
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_UNKNOWN);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_ENGINE_RESET);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_ENGINE_PREEMPT);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_REGISTER_DB);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_UNREGISTER_DB);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_QUERY_ENGINE_HB);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_GET_POWER_LEVEL_COUNT);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_GET_POWER_LEVEL);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_SET_POWER_LEVEL);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_METRIC_STREAMER_OPEN);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_METRIC_STREAMER_CLOSE);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_TRACE_SET_CONFIG);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_TRACE_GET_CONFIG);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_TRACE_GET_CAPABILITY);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_TRACE_GET_NAME);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_SSID_RELEASE);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_METRIC_STREAMER_START);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_METRIC_STREAMER_STOP);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_METRIC_STREAMER_UPDATE);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_METRIC_STREAMER_INFO);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_SET_PRIORITY_BAND_SETUP);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_CREATE_CMD_QUEUE);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_DESTROY_CMD_QUEUE);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_SET_CONTEXT_SCHED_PROPERTIES);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_HWS_REGISTER_DB);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_BLOB_DEINIT);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_DYNDBG_CONTROL);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_JOB_DONE);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_ENGINE_RESET_DONE);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_ENGINE_PREEMPT_DONE);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_REGISTER_DB_DONE);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_UNREGISTER_DB_DONE);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_QUERY_ENGINE_HB_DONE);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_GET_POWER_LEVEL_COUNT_DONE);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_GET_POWER_LEVEL_DONE);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_SET_POWER_LEVEL_DONE);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_METRIC_STREAMER_OPEN_DONE);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_METRIC_STREAMER_CLOSE_DONE);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_TRACE_SET_CONFIG_RSP);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_TRACE_GET_CONFIG_RSP);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_TRACE_GET_CAPABILITY_RSP);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_TRACE_GET_NAME_RSP);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_SSID_RELEASE_DONE);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_METRIC_STREAMER_START_DONE);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_METRIC_STREAMER_STOP_DONE);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_METRIC_STREAMER_UPDATE_DONE);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_METRIC_STREAMER_INFO_DONE);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_METRIC_STREAMER_NOTIFICATION);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_SET_PRIORITY_BAND_SETUP_RSP);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_CREATE_CMD_QUEUE_RSP);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_DESTROY_CMD_QUEUE_RSP);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_SET_CONTEXT_SCHED_PROPERTIES_RSP);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_BLOB_DEINIT_DONE);
+	IVPU_CASE_TO_STR(VPU_JSM_MSG_DYNDBG_CONTROL_RSP);
+	}
+	#undef IVPU_CASE_TO_STR
+
+	return "Unknown JSM message type";
+}
+
 int ivpu_jsm_register_db(struct ivpu_device *vdev, u32 ctx_id, u32 db_id,
 			 u64 jobq_base, u32 jobq_size)
 {
diff --git a/drivers/accel/ivpu/ivpu_jsm_msg.h b/drivers/accel/ivpu/ivpu_jsm_msg.h
index ab50d7b017c1..66979a948c7c 100644
--- a/drivers/accel/ivpu/ivpu_jsm_msg.h
+++ b/drivers/accel/ivpu/ivpu_jsm_msg.h
@@ -8,6 +8,8 @@
 
 #include "vpu_jsm_api.h"
 
+const char *ivpu_jsm_msg_type_to_str(enum vpu_ipc_msg_type type);
+
 int ivpu_jsm_register_db(struct ivpu_device *vdev, u32 ctx_id, u32 db_id,
 			 u64 jobq_base, u32 jobq_size);
 int ivpu_jsm_unregister_db(struct ivpu_device *vdev, u32 db_id);
-- 
2.25.1

