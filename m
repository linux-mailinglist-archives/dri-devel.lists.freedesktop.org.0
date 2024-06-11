Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F574903B67
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 14:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5365010E5F4;
	Tue, 11 Jun 2024 12:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HRn/GK7U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE71E10E5DF
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 12:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718107491; x=1749643491;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tkNW/2JCBi7oLaY54HG/9B46ZungS914bY0T87019kM=;
 b=HRn/GK7UEWGVYH47L8R75mqJi0u4IHqbWjfs5C5fYrkkTP1+YFIq5Yvq
 YfAW4JgtFUWMcesWHg82VE6Dw20uBr88S34Eu8wws3ThXkIyS/PfY/akL
 IcowgY2YotADDONjAYNCqOwGwOalvJZmLf1MEhLWbvCxfEcxTMUYoSZIp
 f28BIGHaGHduF84Nmsfy9Engz7znAcBb7laRJOZ5iWdEOZxIgQQYnWFbO
 ww/DseTvlJtWSDwYYTFDWA/ZSxpWL8fdnD4Ggqfy1mh2RzXwTZ5x2EP9t
 HfRkcUeHrzRR6U9Mv10PTJj5i3RWdzzod+PwXE5il+Q737LG6HhGik0Tj w==;
X-CSE-ConnectionGUID: ALU24xybRbiwe/mAnMz/pw==
X-CSE-MsgGUID: G9JSSqRYRBGBYC/mHCW7Xw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="32296062"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="32296062"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:04:51 -0700
X-CSE-ConnectionGUID: 6EuhXXNST06osWThUUp+Dw==
X-CSE-MsgGUID: wfy5zZ4DTfevGbVYZVutuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39877095"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:04:49 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 "Wachowski, Karol" <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 08/15] accel/ivpu: Update FW BOOT API headers
Date: Tue, 11 Jun 2024 14:04:25 +0200
Message-ID: <20240611120433.1012423-9-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240611120433.1012423-1-jacek.lawrynowicz@linux.intel.com>
References: <20240611120433.1012423-1-jacek.lawrynowicz@linux.intel.com>
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

From: "Wachowski, Karol" <karol.wachowski@intel.com>

This commit bumps BOOT API version to 3.24

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/vpu_boot_api.h | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/vpu_boot_api.h b/drivers/accel/ivpu/vpu_boot_api.h
index 87cac7bc730a..82954b91b748 100644
--- a/drivers/accel/ivpu/vpu_boot_api.h
+++ b/drivers/accel/ivpu/vpu_boot_api.h
@@ -27,7 +27,7 @@
  * Minor version changes when API backward compatibility is preserved.
  * Resets to 0 if Major version is incremented.
  */
-#define VPU_BOOT_API_VER_MINOR 22
+#define VPU_BOOT_API_VER_MINOR 24
 
 /*
  * API header changed (field names, documentation, formatting) but API itself has not been changed
@@ -80,6 +80,11 @@ struct vpu_firmware_header {
 	u32 preemption_buffer_2_size;
 	/* Space reserved for future preemption-related fields. */
 	u32 preemption_reserved[6];
+	/* FW image read only section start address, 4KB aligned */
+	u64 ro_section_start_address;
+	/* FW image read only section size, 4KB aligned */
+	u32 ro_section_size;
+	u32 reserved;
 };
 
 /*
@@ -333,7 +338,14 @@ struct vpu_boot_params {
 	 * The KMD is required to update this value on every VPU reset.
 	 */
 	u64 system_time_us;
-	u32 pad4[18];
+	u32 pad4[2];
+	/*
+	 * The delta between device monotonic time and the current value of the
+	 * HW timestamp register, in ticks. Written by the firmware during boot.
+	 * Can be used by the KMD to calculate device time.
+	 */
+	u64 device_time_delta_ticks;
+	u32 pad7[14];
 	/* Warm boot information: 0x400 - 0x43F */
 	u32 warm_boot_sections_count;
 	u32 warm_boot_start_address_reference;
-- 
2.45.1

