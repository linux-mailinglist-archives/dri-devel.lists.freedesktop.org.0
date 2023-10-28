Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BC77DA7EC
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 18:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FBA10E151;
	Sat, 28 Oct 2023 16:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EAF10E15A
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Oct 2023 16:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698508820; x=1730044820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F3owLFfn66VaEtADQ/epo8xrqMtz1LdC4cMon2f/Gtc=;
 b=EC8D/LDenh+rfLmTw+Up9bUqJmW9SaFkx9hv+u31Waa/J1hcIIMtIftw
 LCZQUeuj8BW9sHUX+EzFlYt93bLRYgcBiAO/yxuO3bSUZJFu3g5kThRJf
 wQ8w7L3EVjlU/nkKJGEdgleQ5/10q/5uNwUv529kd4uvFnaWqvsGkYxZD
 5zJAS3VZvuumJx1SrAuxZkrP+6F2tktk/It8lSJ0//z4x+az8PABcavXq
 qbqUIbdVPDaLO/p6TgDllEtndbxOpgZW32sk/EaGAa58u/A+TcTh1Y1lN
 +URQFLhq3aIXN//STJOZ/TQ5d8Lxd4iVzb1B1c/46T6djFJ7HMRp2NZ7b Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="452152709"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; d="scan'208";a="452152709"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 09:00:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="763516441"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; d="scan'208";a="763516441"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 09:00:06 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 8/8] accel/ivpu: Rename VPU to NPU in product strings
Date: Sat, 28 Oct 2023 17:59:36 +0200
Message-Id: <20231028155936.1183342-9-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231028155936.1183342-1-stanislaw.gruszka@linux.intel.com>
References: <20231028155936.1183342-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

VPU was rebranded as NPU (Neural Processing Unit) so user facing
strings have to be updated but the code remains as is and the module
is still called intel_vpu.ko.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/Kconfig    | 9 +++++----
 drivers/accel/ivpu/ivpu_drv.h | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/accel/ivpu/Kconfig b/drivers/accel/ivpu/Kconfig
index 1a4c4ed9d113..82749e0da524 100644
--- a/drivers/accel/ivpu/Kconfig
+++ b/drivers/accel/ivpu/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 config DRM_ACCEL_IVPU
-	tristate "Intel VPU for Meteor Lake and newer"
+	tristate "Intel NPU (Neural Processing Unit)"
 	depends on DRM_ACCEL
 	depends on X86_64 && !UML
 	depends on PCI && PCI_MSI
@@ -9,8 +9,9 @@ config DRM_ACCEL_IVPU
 	select SHMEM
 	select GENERIC_ALLOCATOR
 	help
-	  Choose this option if you have a system that has an 14th generation Intel CPU
-	  or newer. VPU stands for Versatile Processing Unit and it's a CPU-integrated
-	  inference accelerator for Computer Vision and Deep Learning applications.
+	  Choose this option if you have a system with an 14th generation
+	  Intel CPU (Meteor Lake) or newer. Intel NPU (formerly called Intel VPU)
+	  is a CPU-integrated inference accelerator for Computer Vision
+	  and Deep Learning applications.
 
 	  If "M" is selected, the module will be called intel_vpu.
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 1b482d1d66d9..79b193ffbc26 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -19,7 +19,7 @@
 #include "ivpu_mmu_context.h"
 
 #define DRIVER_NAME "intel_vpu"
-#define DRIVER_DESC "Driver for Intel Versatile Processing Unit (VPU)"
+#define DRIVER_DESC "Driver for Intel NPU (Neural Processing Unit)"
 #define DRIVER_DATE "20230117"
 
 #define PCI_DEVICE_ID_MTL   0x7d1d
-- 
2.25.1

