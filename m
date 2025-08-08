Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CC6B1E6FA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 13:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB6510E4DD;
	Fri,  8 Aug 2025 11:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZI4pyfGU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9C210E4DD
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 11:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754651419; x=1786187419;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zgByCYinVVvDNkloXZ5xXepoav6mkRxe89m6yS+Dszk=;
 b=ZI4pyfGUJo91oPWDAV9KfNJUrTixCqOA0eDqK3OVdoKt3UPjcbpJAIUr
 +Qk0rigKDcesB4kwDCR+xVe1c01nb84ZoU1Auy12KhfSKs5YAcU1bZUtE
 jQ4abOYP3YGGdGliYh+3t/87VFpuZhzNjAVgtKlOCiSd4TWOjJ+nxhl3h
 Llkn83G2bMZBWOXdlX0vvKWP+cwt4CpYzqPV1Klk7/g2kmv1TgyBcw+5g
 9JcLaFsWFTOuLag3z2dnO2LL/uumGHmKdgIoxTw0CxSzxO4CkImKNoaoI
 yc+UDi3gRYDbpxX4QxdQNdNbhQ6Via/S4nlwqQcGgu6EUbsSh2Scm7AL1 Q==;
X-CSE-ConnectionGUID: pftM+czsQrWn3f4OJSrVmg==
X-CSE-MsgGUID: e0lqLRhJSo2JimGcVV/cjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56713581"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="56713581"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 04:10:18 -0700
X-CSE-ConnectionGUID: u9ASkXY2R9yoUNHgg6+m7Q==
X-CSE-MsgGUID: 1zqmzPRUTsG210S6N4/FKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="170556634"
Received: from unknown (HELO jlawryno.igk.intel.com) ([10.91.220.59])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 04:10:16 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH] accel/ivpu: Make function parameter names consistent
Date: Fri,  8 Aug 2025 13:10:14 +0200
Message-ID: <20250808111014.328607-1-jacek.lawrynowicz@linux.intel.com>
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

Make ivpu_hw_btrs_dct_set_status() and ivpu_fw_boot_params_setup()
declaration and definition parameter names consistent.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_fw.h      | 2 +-
 drivers/accel/ivpu/ivpu_hw_btrs.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_fw.h b/drivers/accel/ivpu/ivpu_fw.h
index 9a3935be1c057..7081913fb0dde 100644
--- a/drivers/accel/ivpu/ivpu_fw.h
+++ b/drivers/accel/ivpu/ivpu_fw.h
@@ -45,7 +45,7 @@ struct ivpu_fw_info {
 int ivpu_fw_init(struct ivpu_device *vdev);
 void ivpu_fw_fini(struct ivpu_device *vdev);
 void ivpu_fw_load(struct ivpu_device *vdev);
-void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params *bp);
+void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params *boot_params);
 
 static inline bool ivpu_fw_is_cold_boot(struct ivpu_device *vdev)
 {
diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.h b/drivers/accel/ivpu/ivpu_hw_btrs.h
index d2d82651976d1..032c384ac3d4d 100644
--- a/drivers/accel/ivpu/ivpu_hw_btrs.h
+++ b/drivers/accel/ivpu/ivpu_hw_btrs.h
@@ -36,7 +36,7 @@ u32 ivpu_hw_btrs_dpu_freq_get(struct ivpu_device *vdev);
 bool ivpu_hw_btrs_irq_handler_mtl(struct ivpu_device *vdev, int irq);
 bool ivpu_hw_btrs_irq_handler_lnl(struct ivpu_device *vdev, int irq);
 int ivpu_hw_btrs_dct_get_request(struct ivpu_device *vdev, bool *enable);
-void ivpu_hw_btrs_dct_set_status(struct ivpu_device *vdev, bool enable, u32 dct_percent);
+void ivpu_hw_btrs_dct_set_status(struct ivpu_device *vdev, bool enable, u32 active_percent);
 u32 ivpu_hw_btrs_telemetry_offset_get(struct ivpu_device *vdev);
 u32 ivpu_hw_btrs_telemetry_size_get(struct ivpu_device *vdev);
 u32 ivpu_hw_btrs_telemetry_enable_get(struct ivpu_device *vdev);
-- 
2.45.1

