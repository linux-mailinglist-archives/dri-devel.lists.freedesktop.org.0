Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA8DBA014D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 16:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1006710E95A;
	Thu, 25 Sep 2025 14:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z5pDEoPi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A72D010E95A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 14:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758812001; x=1790348001;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=er96Ja9LWIGEbz9Sqk9DoRnt4YtpB8FUgJybTHwRw9c=;
 b=Z5pDEoPiZABQMf5RD8XKBHgq3/v7xN5u8R+AoLfyxLLCJhRwN4JwWyPB
 9Ces8TLMYQqTa/pKJhsWL6eksmw0dojOMYPPNXlvLxllOxTijbozLhvD6
 DioiSgEfqfb66hJA3mBQ65Zue/MUh0TCataFpjVnsgqRfvTpzYmiplrLb
 xXd0p6NCWiQc82Sx9cGDC6scbvgL9xrvu+0P1nTU/5WydJQrtg3j8hlXp
 DcZqLVbb5f+VnsxoVV2DYedOlnazXgy8IIcfj1/EwcmXV9msXLWTyUbGl
 NyBkXyTvi2WWxf5Vulce2/Kv8Q5dQILousMDZ7bSGoAPyNyBwy5WKcnGJ g==;
X-CSE-ConnectionGUID: BQbzo68PRYWO7EZsUj1YLQ==
X-CSE-MsgGUID: 2XbB/LiZQLeL7p2HAGaKUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61241191"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="61241191"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 07:53:20 -0700
X-CSE-ConnectionGUID: cWQUyLZNQ3qWOrWLR2n8pQ==
X-CSE-MsgGUID: sN8KKWx6Rjegs7pPuEMgDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="176639798"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 07:53:18 -0700
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 karol.wachowski@linux.intel.com, lizhi.hou@amd.com,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Fix doc description of job structure
Date: Thu, 25 Sep 2025 16:51:31 +0200
Message-ID: <20250925145131.1446323-1-maciej.falkowski@linux.intel.com>
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

From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>

Fix doc description of job structure as it is
improperly formatted. Align order of job structure's
fields according to the documentation.

Fixes: 0bf37f45d5c4 ("accel/ivpu: Add support for user-managed preemption buffer")
Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_job.h | 44 +++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_job.h b/drivers/accel/ivpu/ivpu_job.h
index 6c8b9c739b51..d2fc4c151614 100644
--- a/drivers/accel/ivpu/ivpu_job.h
+++ b/drivers/accel/ivpu/ivpu_job.h
@@ -15,12 +15,17 @@ struct ivpu_device;
 struct ivpu_file_priv;
 
 /**
- * struct ivpu_cmdq - Object representing device queue used to send jobs.
- * @jobq:	   Pointer to job queue memory shared with the device
- * @mem:           Memory allocated for the job queue, shared with device
- * @entry_count    Number of job entries in the queue
- * @db_id:	   Doorbell assigned to this job queue
- * @db_registered: True if doorbell is registered in device
+ * struct ivpu_cmdq - Represents a command queue for submitting jobs to the VPU.
+ * Tracks queue memory, preemption buffers, and metadata for job management.
+ * @jobq:                Pointer to job queue memory shared with the device
+ * @primary_preempt_buf: Primary preemption buffer for this queue (optional)
+ * @secondary_preempt_buf: Secondary preemption buffer for this queue (optional)
+ * @mem:                 Memory allocated for the job queue, shared with device
+ * @entry_count:         Number of job entries in the queue
+ * @id:                  Unique command queue ID
+ * @db_id:               Doorbell ID assigned to this job queue
+ * @priority:            Priority level of the command queue
+ * @is_legacy:           True if this is a legacy command queue
  */
 struct ivpu_cmdq {
 	struct vpu_job_queue *jobq;
@@ -35,16 +40,21 @@ struct ivpu_cmdq {
 };
 
 /**
- * struct ivpu_job - KMD object that represents batchbuffer / DMA buffer.
- * Each batch / DMA buffer is a job to be submitted and executed by the VPU FW.
- * This is a unit of execution, and be tracked by the job_id for
- * any status reporting from VPU FW through IPC JOB RET/DONE message.
- * @file_priv:		  The client that submitted this job
- * @job_id:		  Job ID for KMD tracking and job status reporting from VPU FW
- * @status:		  Status of the Job from IPC JOB RET/DONE message
- * @batch_buffer:	  CPU vaddr points to the batch buffer memory allocated for the job
- * @submit_status_offset: Offset within batch buffer where job completion handler
-			  will update the job status
+ * struct ivpu_job - Representing a batch or DMA buffer submitted to the VPU.
+ * Each job is a unit of execution, tracked by job_id for status reporting from VPU FW.
+ * The structure holds all resources and metadata needed for job submission, execution,
+ * and completion handling.
+ * @vdev:                Pointer to the VPU device
+ * @file_priv:           The client context that submitted this job
+ * @done_fence:          Fence signaled when job completes
+ * @cmd_buf_vpu_addr:    VPU address of the command buffer for this job
+ * @cmdq_id:             Command queue ID used for submission
+ * @job_id:              Unique job ID for tracking and status reporting
+ * @engine_idx:          Engine index for job execution
+ * @primary_preempt_buf: Primary preemption buffer for job
+ * @secondary_preempt_buf: Secondary preemption buffer for job (optional)
+ * @bo_count:            Number of buffer objects associated with this job
+ * @bos:                 Array of buffer objects used by the job (batch buffer is at index 0)
  */
 struct ivpu_job {
 	struct ivpu_device *vdev;
@@ -54,9 +64,9 @@ struct ivpu_job {
 	u32 cmdq_id;
 	u32 job_id;
 	u32 engine_idx;
-	size_t bo_count;
 	struct ivpu_bo *primary_preempt_buf;
 	struct ivpu_bo *secondary_preempt_buf;
+	size_t bo_count;
 	struct ivpu_bo *bos[] __counted_by(bo_count);
 };
 
-- 
2.43.0

