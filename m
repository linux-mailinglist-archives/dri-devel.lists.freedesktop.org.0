Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEAB8BFE93
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 15:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129AB112932;
	Wed,  8 May 2024 13:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NylB3ghj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8511128E3
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 13:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715174472; x=1746710472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sKgW/wQo7nTh1/xSL3mXgVkk7GWmAx5TMwJJ5QHlnLA=;
 b=NylB3ghjUDUfmFQ5S+AoiFOhCPgRbvmJ//n1zpPQKM5k0Y2h5z5LBwPr
 voYZuqXGKiAu7Tv3lo4HRz5CQqPnyAvwDmJUY2GOgDQ3715THjysgVKMa
 rxJ7z7VYHgau+OmA9FXNFXjHSWYcps4bGW/xFv+CDJPjuvf6je/6MZ8u2
 dke8Oyuu5hIRUUvm2iIm9ICajuZ84khh/8nC07ahZs9MvzeT/hEt1n3kS
 F13+9mqqZqCUkXHImo4hPvORyfzo9jP4SPpQj4uKk0fM7V0nZfvfEDQpd
 cZX2fdf/iimBkv085rY1I+Hm1OPJ2mNOjvKMU8fb1SW/qbnsN4vnFqQoz g==;
X-CSE-ConnectionGUID: TX3uuezHRGiiRUCwGBqKrg==
X-CSE-MsgGUID: diaVagUhSYSQ46Iw+7JV9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="33540025"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33540025"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:21:12 -0700
X-CSE-ConnectionGUID: YezIRwXrTTCLq4RFaj2PDw==
X-CSE-MsgGUID: GWgy6rx3TGSt79aqZWz6mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="29289333"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:21:11 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 01/12] accel/ivpu: Update VPU FW API headers
Date: Wed,  8 May 2024 15:20:58 +0200
Message-ID: <20240508132106.2387464-2-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240508132106.2387464-1-jacek.lawrynowicz@linux.intel.com>
References: <20240508132106.2387464-1-jacek.lawrynowicz@linux.intel.com>
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

