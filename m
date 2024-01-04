Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F05824120
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 12:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F45710E44A;
	Thu,  4 Jan 2024 11:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F98710E44A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 11:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704369459; x=1735905459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SuN0icnohpA/uKCrS6iWCRGLd9747S3CILtMFWsG664=;
 b=UhvoolddMXeW2W/CEWyUmdlyStA16vvMT4ShAEIFN4ghfOhT2YDCD51y
 Ns3WhsMtsjXjDUUyG7Ygq6XAZ8ZtYr9Nfr14fRJn0AmAo2py4iBfNAHNI
 EWW43lwFF1o4EHcwgG4wiksyTSY7zGsV2oYa2YYnjGZT6QKyrQdGY7C0Q
 sh07MaUr8B067rOruk0QhrJLpgIN5KgJ9jevGcD9+mwO0uu9iXze+jPlH
 cGyfalwRq4Ya4P0qfS9O7WIMSuUiCezuQnnsBh/ldekn7dechlrmuy/bi
 FvKN+MNB3nOY6skqj3riEL6f1YCgSgi/B7TYGhhxQB3H+xRZuZCw2YADL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="4584186"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="4584186"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 03:57:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="899275796"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; d="scan'208";a="899275796"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 03:57:37 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/16] accel/ivpu: Remove deprecated
 DRM_IVPU_PARAM_CONTEXT_PRIORITY
Date: Thu,  4 Jan 2024 12:57:08 +0100
Message-ID: <20240104115713.8657-12-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240104115713.8657-1-jacek.lawrynowicz@linux.intel.com>
References: <20240104115713.8657-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: quic_jhugo@quicinc.com,
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
 include/uapi/drm/ivpu_accel.h | 21 ++++++++++++++++++++-
 4 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 0c3180411b0e..c3f9a0f62c9d 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -176,9 +176,6 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
 	case DRM_IVPU_PARAM_CONTEXT_BASE_ADDRESS:
 		args->value = vdev->hw->ranges.user.start;
 		break;
-	case DRM_IVPU_PARAM_CONTEXT_PRIORITY:
-		args->value = file_priv->priority;
-		break;
 	case DRM_IVPU_PARAM_CONTEXT_ID:
 		args->value = file_priv->ctx.id;
 		break;
@@ -218,17 +215,10 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
 
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
@@ -257,7 +247,6 @@ static int ivpu_open(struct drm_device *dev, struct drm_file *file)
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
index de1944e42c65..cc9a0504ee2f 100644
--- a/include/uapi/drm/ivpu_accel.h
+++ b/include/uapi/drm/ivpu_accel.h
@@ -13,7 +13,7 @@ extern "C" {
 #endif
 
 #define DRM_IVPU_DRIVER_MAJOR 1
-#define DRM_IVPU_DRIVER_MINOR 0
+#define DRM_IVPU_DRIVER_MINOR 1
 
 #define DRM_IVPU_GET_PARAM		  0x00
 #define DRM_IVPU_SET_PARAM		  0x01
@@ -64,11 +64,18 @@ extern "C" {
 
 #define DRM_IVPU_PLATFORM_TYPE_SILICON	    0
 
+/* Deprecated - to be removed */
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
@@ -286,6 +293,18 @@ struct drm_ivpu_submit {
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

