Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C13D582DA6F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 14:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3FD010E2E6;
	Mon, 15 Jan 2024 13:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC8E10E2E1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 13:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705326295; x=1736862295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mAzPyVcjhTN6zd05t12r1l6VJCBOZFE/egBqVZISE10=;
 b=XWNTRB88CDQsue7PNv+/LRIWD/JBslbECNeQGAxgGujNeglO5KvZ0sIZ
 YDkvTWPhlkqdlqH44nDOuqCoeALMkZ+f9TLD7IQ/kXo7Th4iQgAWRo5X9
 qcyhCAfaR9fz7NGVjFLV5TIB7xy+xLHGu3jLu8dQ2LQlrUhb1a2BKaDDx
 DOmJkHbZHbDZ79Bva1qaXJ+SqDraHZGPZ8YmTM3eY2dqoVWz6hczszZD1
 dGZepfWvz0RzBvHPEjnrmxHG9KUXiBiaSE57AU2eJ2AumW1M2BbB3LpDY
 yhkeVCUHLTAcULQfCdNzmhSurqNd3PI/vmW97sZwcZmDlgJ1kr1/hkXm2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="403378781"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; d="scan'208";a="403378781"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 05:44:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; d="scan'208";a="25472239"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 05:44:51 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 9/9] accel/ivpu: Deprecate DRM_IVPU_PARAM_CONTEXT_PRIORITY
 param
Date: Mon, 15 Jan 2024 14:44:34 +0100
Message-ID: <20240115134434.493839-10-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115134434.493839-1-jacek.lawrynowicz@linux.intel.com>
References: <20240115134434.493839-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, "Wachowski,
 Karol" <karol.wachowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Wachowski, Karol" <karol.wachowski@intel.com>

DRM_IVPU_PARAM_CONTEXT_PRIORITY has been deprecated because it
has been replaced with DRM_IVPU_JOB_PRIORITY levels set with
submit IOCTL and was unused anyway.

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 11 -----------
 drivers/accel/ivpu/ivpu_drv.h |  1 -
 drivers/accel/ivpu/ivpu_job.c |  3 +++
 include/uapi/drm/ivpu_accel.h | 25 ++++++++++++++++++++-----
 4 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index ec66c2c39877..546c0899bb9e 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -177,9 +177,6 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
 	case DRM_IVPU_PARAM_CONTEXT_BASE_ADDRESS:
 		args->value = vdev->hw->ranges.user.start;
 		break;
-	case DRM_IVPU_PARAM_CONTEXT_PRIORITY:
-		args->value = file_priv->priority;
-		break;
 	case DRM_IVPU_PARAM_CONTEXT_ID:
 		args->value = file_priv->ctx.id;
 		break;
@@ -219,17 +216,10 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
 
 static int ivpu_set_param_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 {
-	struct ivpu_file_priv *file_priv = file->driver_priv;
 	struct drm_ivpu_param *args = data;
 	int ret = 0;
 
 	switch (args->param) {
-	case DRM_IVPU_PARAM_CONTEXT_PRIORITY:
-		if (args->value <= DRM_IVPU_CONTEXT_PRIORITY_REALTIME)
-			file_priv->priority = args->value;
-		else
-			ret = -EINVAL;
-		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -258,7 +248,6 @@ static int ivpu_open(struct drm_device *dev, struct drm_file *file)
 	}
 
 	file_priv->vdev = vdev;
-	file_priv->priority = DRM_IVPU_CONTEXT_PRIORITY_NORMAL;
 	kref_init(&file_priv->ref);
 	mutex_init(&file_priv->lock);
 
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 9b6e336626e3..7a6bc1918780 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -146,7 +146,6 @@ struct ivpu_file_priv {
 	struct mutex lock; /* Protects cmdq */
 	struct ivpu_cmdq *cmdq[IVPU_NUM_ENGINES];
 	struct ivpu_mmu_context ctx;
-	u32 priority;
 	bool has_mmu_faults;
 };
 
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 7206cf9cdb4a..82e40bb4803c 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -488,6 +488,9 @@ int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (params->engine > DRM_IVPU_ENGINE_COPY)
 		return -EINVAL;
 
+	if (params->priority > DRM_IVPU_JOB_PRIORITY_REALTIME)
+		return -EINVAL;
+
 	if (params->buffer_count == 0 || params->buffer_count > JOB_MAX_BUFFER_COUNT)
 		return -EINVAL;
 
diff --git a/include/uapi/drm/ivpu_accel.h b/include/uapi/drm/ivpu_accel.h
index de1944e42c65..63c49318a863 100644
--- a/include/uapi/drm/ivpu_accel.h
+++ b/include/uapi/drm/ivpu_accel.h
@@ -53,7 +53,7 @@ extern "C" {
 #define DRM_IVPU_PARAM_CORE_CLOCK_RATE	    3
 #define DRM_IVPU_PARAM_NUM_CONTEXTS	    4
 #define DRM_IVPU_PARAM_CONTEXT_BASE_ADDRESS 5
-#define DRM_IVPU_PARAM_CONTEXT_PRIORITY	    6
+#define DRM_IVPU_PARAM_CONTEXT_PRIORITY	    6 /* Deprecated */
 #define DRM_IVPU_PARAM_CONTEXT_ID	    7
 #define DRM_IVPU_PARAM_FW_API_VERSION	    8
 #define DRM_IVPU_PARAM_ENGINE_HEARTBEAT	    9
@@ -64,11 +64,18 @@ extern "C" {
 
 #define DRM_IVPU_PLATFORM_TYPE_SILICON	    0
 
+/* Deprecated, use DRM_IVPU_JOB_PRIORITY */
 #define DRM_IVPU_CONTEXT_PRIORITY_IDLE	    0
 #define DRM_IVPU_CONTEXT_PRIORITY_NORMAL    1
 #define DRM_IVPU_CONTEXT_PRIORITY_FOCUS	    2
 #define DRM_IVPU_CONTEXT_PRIORITY_REALTIME  3
 
+#define DRM_IVPU_JOB_PRIORITY_DEFAULT  0
+#define DRM_IVPU_JOB_PRIORITY_IDLE     1
+#define DRM_IVPU_JOB_PRIORITY_NORMAL   2
+#define DRM_IVPU_JOB_PRIORITY_FOCUS    3
+#define DRM_IVPU_JOB_PRIORITY_REALTIME 4
+
 /**
  * DRM_IVPU_CAP_METRIC_STREAMER
  *
@@ -112,10 +119,6 @@ struct drm_ivpu_param {
 	 * %DRM_IVPU_PARAM_CONTEXT_BASE_ADDRESS:
 	 * Lowest VPU virtual address available in the current context (read-only)
 	 *
-	 * %DRM_IVPU_PARAM_CONTEXT_PRIORITY:
-	 * Value of current context scheduling priority (read-write).
-	 * See DRM_IVPU_CONTEXT_PRIORITY_* for possible values.
-	 *
 	 * %DRM_IVPU_PARAM_CONTEXT_ID:
 	 * Current context ID, always greater than 0 (read-only)
 	 *
@@ -286,6 +289,18 @@ struct drm_ivpu_submit {
 	 * to be executed. The offset has to be 8-byte aligned.
 	 */
 	__u32 commands_offset;
+
+	/**
+	 * @priority:
+	 *
+	 * Priority to be set for related job command queue, can be one of the following:
+	 * %DRM_IVPU_JOB_PRIORITY_DEFAULT
+	 * %DRM_IVPU_JOB_PRIORITY_IDLE
+	 * %DRM_IVPU_JOB_PRIORITY_NORMAL
+	 * %DRM_IVPU_JOB_PRIORITY_FOCUS
+	 * %DRM_IVPU_JOB_PRIORITY_REALTIME
+	 */
+	__u32 priority;
 };
 
 /* drm_ivpu_bo_wait job status codes */
-- 
2.43.0

