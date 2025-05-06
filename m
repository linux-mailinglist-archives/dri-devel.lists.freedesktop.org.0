Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 539B3AABF0E
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 11:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D9810E07B;
	Tue,  6 May 2025 09:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B8qFU2Rv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56BA10E07B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 09:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746523236; x=1778059236;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QN2bwJgO8y3LLRz8SfXnbJeRv6TrmeqGPsAx9EBkvX0=;
 b=B8qFU2RvRKr4FykaQjw0c8qABnEfr+qjQ2eUwSHQqfb+ZD3ilID4wTJe
 HXm0fLTLuCwbXeKZFlErsND0zSx4BKYpJNRRY88OOWP3en+E5VxQEUpxI
 HzJXUcBKeQl02bQLhpq5s9HRsDsOXVCd4RE4N9bAJyKvYjO5bQFvOxjkL
 mpr9EzcRNObiDpicTods+8UIkCJTbiNeX1N3UaODeKCrMRM5LtlVuKzw/
 Sp7BJM1gCnDF8DzGY86JmLWPYyeIaRBtptlD8IvsA7TLxkb85VgK57BBk
 CvKjjOEgmaU5aeuu4VP2rrWCc4j2n3gP97oDQwVsGAfifaT9v5Tp/6ftP g==;
X-CSE-ConnectionGUID: kbFQ1QtVQZCdx1hUtbshsw==
X-CSE-MsgGUID: D9VETbSdRy2HnWnerzinuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="51997732"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="51997732"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 02:20:35 -0700
X-CSE-ConnectionGUID: OKVqnbqNTJ2Fxe8DCRRobw==
X-CSE-MsgGUID: 2yYWmonuT1C/4tRPAe/CGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="135444988"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 02:20:34 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH] accel/ivpu: Use firmware names from upstream repo
Date: Tue,  6 May 2025 11:20:30 +0200
Message-ID: <20250506092030.280276-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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

Use FW names from linux-firmware repo instead of deprecated ones.

Fixes: c140244f0cfb ("accel/ivpu: Add initial Panther Lake support")
Cc: <stable@vger.kernel.org> # v6.13+
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_fw.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index ccaaf6c100c02..9db741695401e 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -55,18 +55,18 @@ static struct {
 	int gen;
 	const char *name;
 } fw_names[] = {
-	{ IVPU_HW_IP_37XX, "vpu_37xx.bin" },
+	{ IVPU_HW_IP_37XX, "intel/vpu/vpu_37xx_v1.bin" },
 	{ IVPU_HW_IP_37XX, "intel/vpu/vpu_37xx_v0.0.bin" },
-	{ IVPU_HW_IP_40XX, "vpu_40xx.bin" },
+	{ IVPU_HW_IP_40XX, "intel/vpu/vpu_40xx_v1.bin" },
 	{ IVPU_HW_IP_40XX, "intel/vpu/vpu_40xx_v0.0.bin" },
-	{ IVPU_HW_IP_50XX, "vpu_50xx.bin" },
+	{ IVPU_HW_IP_50XX, "intel/vpu/vpu_50xx_v1.bin" },
 	{ IVPU_HW_IP_50XX, "intel/vpu/vpu_50xx_v0.0.bin" },
 };
 
 /* Production fw_names from the table above */
-MODULE_FIRMWARE("intel/vpu/vpu_37xx_v0.0.bin");
-MODULE_FIRMWARE("intel/vpu/vpu_40xx_v0.0.bin");
-MODULE_FIRMWARE("intel/vpu/vpu_50xx_v0.0.bin");
+MODULE_FIRMWARE("intel/vpu/vpu_37xx_v1.bin");
+MODULE_FIRMWARE("intel/vpu/vpu_40xx_v1.bin");
+MODULE_FIRMWARE("intel/vpu/vpu_50xx_v1.bin");
 
 static int ivpu_fw_request(struct ivpu_device *vdev)
 {
-- 
2.45.1

