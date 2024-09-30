Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8747398AD5F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF13510E579;
	Mon, 30 Sep 2024 19:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Txi3NlFB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D2E10E2FB
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726010; x=1759262010;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X4SDlgESd5s3Lh7XcSsSn5DU+ayR6FtQmUbKQTsv6TE=;
 b=Txi3NlFB8IVNXwzH+ztl48gF2emsY9oWPFO/NP4dC3cat3FFW0aRwEeI
 1crMTWCJ16if4wT0PtcQDLhV4bH1D9bTsAxY5FSU8LmX6TSFFluCL2nQQ
 cfgsmi0/s/FZte5EigUNpt9YzxzXOZeH3eCEfXg48wbgQfHCwzwl3Htk+
 EklhOWteOGWJSOduBbz7vBdLvntMhDcEmH6NsO5FHangR24Hi1bsInSaE
 8dzTY3gS0FYTFHnAF2p6mGiiW7ugHecdaVGFfwgv1lCw7U+rLNBNDj9ew
 ATwkG1AOIEzGaE0SY95Fdzc+PzdHl/5ym2QbtHdN769vp4M6Af0GFhLLL Q==;
X-CSE-ConnectionGUID: sagtxqRySy2qw7bdWqyE0Q==
X-CSE-MsgGUID: Vtiw9lIpQVCU7UrBzLqx0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962288"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962288"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:29 -0700
X-CSE-ConnectionGUID: aM8sHGfRQQWexWrGMR32PA==
X-CSE-MsgGUID: CJvtpARKTq2J1Br42Ev/Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73369981"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:28 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH v2 02/31] accel/ivpu: Rename ivpu_log_level to fw_log_level
Date: Mon, 30 Sep 2024 21:52:53 +0200
Message-ID: <20240930195322.461209-3-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
References: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
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

Rename module param ivpu_log_level to fw_log_level, so it is clear
what log level is actually changed.

Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_fw.c     |  4 ++--
 drivers/accel/ivpu/ivpu_fw_log.c | 12 ++++++------
 drivers/accel/ivpu/ivpu_fw_log.h |  6 +++---
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index de3d661163756..7beb95e8ef718 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -204,7 +204,7 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
 	fw->cold_boot_entry_point = fw_hdr->entry_point;
 	fw->entry_point = fw->cold_boot_entry_point;
 
-	fw->trace_level = min_t(u32, ivpu_log_level, IVPU_FW_LOG_FATAL);
+	fw->trace_level = min_t(u32, ivpu_fw_log_level, IVPU_FW_LOG_FATAL);
 	fw->trace_destination_mask = VPU_TRACE_DESTINATION_VERBOSE_TRACING;
 	fw->trace_hw_component_mask = -1;
 
@@ -307,7 +307,7 @@ static int ivpu_fw_mem_init(struct ivpu_device *vdev)
 		goto err_free_fw_mem;
 	}
 
-	if (ivpu_log_level <= IVPU_FW_LOG_INFO)
+	if (ivpu_fw_log_level <= IVPU_FW_LOG_INFO)
 		log_verb_size = IVPU_FW_VERBOSE_BUFFER_LARGE_SIZE;
 	else
 		log_verb_size = IVPU_FW_VERBOSE_BUFFER_SMALL_SIZE;
diff --git a/drivers/accel/ivpu/ivpu_fw_log.c b/drivers/accel/ivpu/ivpu_fw_log.c
index ef0adb5e0fbeb..2f2d3242f21be 100644
--- a/drivers/accel/ivpu/ivpu_fw_log.c
+++ b/drivers/accel/ivpu/ivpu_fw_log.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2020-2023 Intel Corporation
+ * Copyright (C) 2020-2024 Intel Corporation
  */
 
 #include <linux/ctype.h>
@@ -15,12 +15,12 @@
 #include "ivpu_fw_log.h"
 #include "ivpu_gem.h"
 
-#define IVPU_FW_LOG_LINE_LENGTH	  256
+#define IVPU_FW_LOG_LINE_LENGTH	256
 
-unsigned int ivpu_log_level = IVPU_FW_LOG_ERROR;
-module_param(ivpu_log_level, uint, 0444);
-MODULE_PARM_DESC(ivpu_log_level,
-		 "NPU firmware default trace level: debug=" __stringify(IVPU_FW_LOG_DEBUG)
+unsigned int ivpu_fw_log_level = IVPU_FW_LOG_ERROR;
+module_param_named(fw_log_level, ivpu_fw_log_level, uint, 0444);
+MODULE_PARM_DESC(fw_log_level,
+		 "NPU firmware default log level: debug=" __stringify(IVPU_FW_LOG_DEBUG)
 		 " info=" __stringify(IVPU_FW_LOG_INFO)
 		 " warn=" __stringify(IVPU_FW_LOG_WARN)
 		 " error=" __stringify(IVPU_FW_LOG_ERROR)
diff --git a/drivers/accel/ivpu/ivpu_fw_log.h b/drivers/accel/ivpu/ivpu_fw_log.h
index 0b2573f6f3151..ccef4298e45b5 100644
--- a/drivers/accel/ivpu/ivpu_fw_log.h
+++ b/drivers/accel/ivpu/ivpu_fw_log.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) 2020-2023 Intel Corporation
+ * Copyright (C) 2020-2024 Intel Corporation
  */
 
 #ifndef __IVPU_FW_LOG_H__
@@ -19,12 +19,12 @@
 #define IVPU_FW_LOG_ERROR   4
 #define IVPU_FW_LOG_FATAL   5
 
-extern unsigned int ivpu_log_level;
-
 #define IVPU_FW_VERBOSE_BUFFER_SMALL_SIZE	SZ_1M
 #define IVPU_FW_VERBOSE_BUFFER_LARGE_SIZE	SZ_8M
 #define IVPU_FW_CRITICAL_BUFFER_SIZE		SZ_512K
 
+extern unsigned int ivpu_fw_log_level;
+
 void ivpu_fw_log_print(struct ivpu_device *vdev, bool only_new_msgs, struct drm_printer *p);
 void ivpu_fw_log_clear(struct ivpu_device *vdev);
 
-- 
2.45.1

