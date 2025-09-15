Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01151B57695
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 12:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A907310E431;
	Mon, 15 Sep 2025 10:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQKmx30M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC24F10E443
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757932560; x=1789468560;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P+4VfsJqh3/AETCo/jqPF2/OrfZVmNfCtPkNosd5FHI=;
 b=LQKmx30M6t+db+AWU3YirFSbhUUGoNBrmz1EUuXluTJCQclLNHesX5vJ
 sytIqLDrFBDu0e+FEZivmhuYT6VeVfgSRyb5BII3NgaY5vx+qm/bkfneJ
 aEx7SBSpJvfWyWND2foIaJgFLKV9VsizZhaPZKysX7qQcmtU+sQQwWCAo
 wdmexKVNR4RjpyY/JNGYfpY8kOFvulVaXhpKTJEHuSbkhYwAKstP3OEEa
 TnQt3ZSYYug4asFSLXFnhlFS6nSu4p1x5OJM7+xlOT5VRDxxNS/mVBM6Q
 ATHcDoOQ4NajOo7KdhDBr37XGmJY6MvVp0mNuDZnD8FZw1NX2rvZMnpUw Q==;
X-CSE-ConnectionGUID: 3cdTA1n6Sh+S8RqzsT5nuw==
X-CSE-MsgGUID: Il7CLHjQQz6rJYGIXT1kRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="60249648"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="60249648"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 03:36:00 -0700
X-CSE-ConnectionGUID: T+ItmvuyRw+4ItMtUg6vDA==
X-CSE-MsgGUID: 5N8n8HAdR7+kg3u9sRL74w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="179823938"
Received: from pl-npu-pc-kwachow.igk.intel.com ([10.91.220.239])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 03:35:57 -0700
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Remove unused firmware boot parameters
Date: Mon, 15 Sep 2025 12:35:53 +0200
Message-ID: <20250915103553.830151-1-karol.wachowski@linux.intel.com>
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

From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>

Remove references to firmware boot parameters that were never used
by any production version of device firmware.

Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_fw.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 6e0941d324a8..32f513499829 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -518,11 +518,6 @@ static void ivpu_fw_boot_params_print(struct ivpu_device *vdev, struct vpu_boot_
 	ivpu_dbg(vdev, FW_BOOT, "boot_params.cache_defaults[VPU_BOOT_L2_CACHE_CFG_NN].cfg = 0x%x\n",
 		 boot_params->cache_defaults[VPU_BOOT_L2_CACHE_CFG_NN].cfg);
 
-	ivpu_dbg(vdev, FW_BOOT, "boot_params.global_memory_allocator_base = 0x%llx\n",
-		 boot_params->global_memory_allocator_base);
-	ivpu_dbg(vdev, FW_BOOT, "boot_params.global_memory_allocator_size = 0x%x\n",
-		 boot_params->global_memory_allocator_size);
-
 	ivpu_dbg(vdev, FW_BOOT, "boot_params.shave_nn_fw_base = 0x%llx\n",
 		 boot_params->shave_nn_fw_base);
 
@@ -530,10 +525,6 @@ static void ivpu_fw_boot_params_print(struct ivpu_device *vdev, struct vpu_boot_
 		 boot_params->watchdog_irq_mss);
 	ivpu_dbg(vdev, FW_BOOT, "boot_params.watchdog_irq_nce = 0x%x\n",
 		 boot_params->watchdog_irq_nce);
-	ivpu_dbg(vdev, FW_BOOT, "boot_params.host_to_vpu_irq = 0x%x\n",
-		 boot_params->host_to_vpu_irq);
-	ivpu_dbg(vdev, FW_BOOT, "boot_params.job_done_irq = 0x%x\n",
-		 boot_params->job_done_irq);
 
 	ivpu_dbg(vdev, FW_BOOT, "boot_params.host_version_id = 0x%x\n",
 		 boot_params->host_version_id);
-- 
2.43.0

