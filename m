Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA4E903B71
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 14:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDB810E5FB;
	Tue, 11 Jun 2024 12:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k7iwrNad";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4532710E5F9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 12:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718107502; x=1749643502;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hjCLEBuuucJc81BqaCx64Z3+lVxi1lOCXZFIfCu8tnw=;
 b=k7iwrNadRHpyMcYoPn6yP3iKwQwbXfGpjyhFkKpzNnHBb/gSIM9Ivzhg
 xCl4q/SKXhYdJG2oOncQEU+LxyXNA7hWteP3ZZORT4y0lhEMM7yAOeK0Q
 zklU7gyL7WgPyl3PoVWI5kEtNyR1Wz7Wwlz2nqP4oKlRtjojw/Mk8NNl9
 5N1SVZnS4hWp6y26/BUNT7xZ/qUq8ZjrNA26yiF3fzVcsA+dKjcQBK3s4
 Qts8tKqM6oPxFga9FsYO8WP83ilac4AiljVfXDigu4R/MlaG3aigtImTM
 hhwcioXSaV+gG5NC3hrhndfEGMHCfdgM9Ld4YuWo+xNEDuB6OtTxmQgr3 A==;
X-CSE-ConnectionGUID: QxCZBDF/RreJn+x1YLzpug==
X-CSE-MsgGUID: xhZvjb+9QTuqQ2nRUKp9Cg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="32296110"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="32296110"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:05:02 -0700
X-CSE-ConnectionGUID: +rMPVfkeR3KyWB0lV5QC0Q==
X-CSE-MsgGUID: DxKRwT/pT6a3YCcRLxRbfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39877237"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:05:00 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 15/15] accel/ivpu: Remove unused ivpu_rpm_get_if_active()
Date: Tue, 11 Jun 2024 14:04:32 +0200
Message-ID: <20240611120433.1012423-16-jacek.lawrynowicz@linux.intel.com>
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

This is now dead code and has to be removed.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_pm.c | 10 ----------
 drivers/accel/ivpu/ivpu_pm.h |  1 -
 2 files changed, 11 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index e7aed16b1a36..59d3170f5e35 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -300,16 +300,6 @@ int ivpu_rpm_get(struct ivpu_device *vdev)
 	return ret;
 }
 
-int ivpu_rpm_get_if_active(struct ivpu_device *vdev)
-{
-	int ret;
-
-	ret = pm_runtime_get_if_in_use(vdev->drm.dev);
-	drm_WARN_ON(&vdev->drm, ret < 0);
-
-	return ret;
-}
-
 void ivpu_rpm_put(struct ivpu_device *vdev)
 {
 	pm_runtime_mark_last_busy(vdev->drm.dev);
diff --git a/drivers/accel/ivpu/ivpu_pm.h b/drivers/accel/ivpu/ivpu_pm.h
index c08a3ddf09c1..b70efe6c36e4 100644
--- a/drivers/accel/ivpu/ivpu_pm.h
+++ b/drivers/accel/ivpu/ivpu_pm.h
@@ -36,7 +36,6 @@ void ivpu_pm_reset_prepare_cb(struct pci_dev *pdev);
 void ivpu_pm_reset_done_cb(struct pci_dev *pdev);
 
 int __must_check ivpu_rpm_get(struct ivpu_device *vdev);
-int __must_check ivpu_rpm_get_if_active(struct ivpu_device *vdev);
 void ivpu_rpm_put(struct ivpu_device *vdev);
 
 void ivpu_pm_trigger_recovery(struct ivpu_device *vdev, const char *reason);
-- 
2.45.1

