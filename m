Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D39E984021
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F5C10E64B;
	Tue, 24 Sep 2024 08:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HU/nR2Oa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3D510E643
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727165890; x=1758701890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=93WDY6j0CdkXwnXWU2rMXPSD+Cp21Un3y6w1vUknrB0=;
 b=HU/nR2OalQw0ste1oULc9grFSD4z+84/GISy5nYURJdGyamu2fFoWkka
 5XJNmVQvRcsRwdt77m+Ao7i/PVj7HpTCGNTZIRhh7Nilu7XpJSkpgABQ+
 yIUco5DwOyqkLNMMiypzBk0IkDwkam4GZ0Qj/AeCatmwpaI08oA4Wojj4
 MEhOSULmydFBhTSxJjXrVdVMnBK3ZvFeMbvfbxUFINYq7gtgKIF43yOSd
 Q6bFLXakDmYoi1C2BGIQfBnA9oVExYZWtYb13i7koJS/XN+cXU4j0Wuck
 EqSYg0g4G2yrJjgXLTlTT+QFt1pCCfceWbdlNCyAxP1BUdzXrtZteOPzk A==;
X-CSE-ConnectionGUID: PoiQC7bNSWi0jPfjXNaoEw==
X-CSE-MsgGUID: DxZeQ/Z+Qiu4y8upCSrwAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37506881"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="37506881"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:10 -0700
X-CSE-ConnectionGUID: IaNqFjdASHSZj4bkm/rLxw==
X-CSE-MsgGUID: Ywol1cYfQIy9f8UhfKliRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102170571"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:07 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH 02/29] accel/ivpu: Rename ivpu_log_level to fw_log_level
Date: Tue, 24 Sep 2024 10:17:27 +0200
Message-ID: <20240924081754.209728-3-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
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

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_fw.c     |  4 ++--
 drivers/accel/ivpu/ivpu_fw_log.c | 12 ++++++------
 drivers/accel/ivpu/ivpu_fw_log.h |  6 +++---
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index ede6165e09d90..00e27e2c14779 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -208,7 +208,7 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
 	fw->cold_boot_entry_point = fw_hdr->entry_point;
 	fw->entry_point = fw->cold_boot_entry_point;
 
-	fw->trace_level = min_t(u32, ivpu_log_level, IVPU_FW_LOG_FATAL);
+	fw->trace_level = min_t(u32, ivpu_fw_log_level, IVPU_FW_LOG_FATAL);
 	fw->trace_destination_mask = VPU_TRACE_DESTINATION_VERBOSE_TRACING;
 	fw->trace_hw_component_mask = -1;
 
@@ -311,7 +311,7 @@ static int ivpu_fw_mem_init(struct ivpu_device *vdev)
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

