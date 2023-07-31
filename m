Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CC2769BFE
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 18:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489A310E2C2;
	Mon, 31 Jul 2023 16:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729DC10E2C0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 16:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690819985; x=1722355985;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GZ8dgv1rraJmfTM9NumLtxy1mJUv1gvmIijoF1Ip9aY=;
 b=IiWncB+oO4NNBOY36DctldAkf+64ABP8ViEuxCNYxHvJwlqeQDTv0bnx
 ObxlxI+dMoFNcs99n1+hR7UblxIOQ61liEmZCj9QK+igjr6n9uDhJwe6R
 eldxUwbE/Pd02+wDg0+WL2RyyzIUmeX0RcgfvVeAcvw24GwIsjsqIQ7RN
 U78SOpOJvs1AYfh3y5iWJmkgsAReazmPAzBx8aRJGW1WkK/pI/gG5GEv0
 YqNBNov37EuTSqrwM0QhTN+VsKmfp+MN45AygvDvw0X5LdB8mSmp6Pm/k
 gb9HCL9Pzq1QQG7ad/REQPIENG1tgg3T7ESY8/Pc94VLzti6LqqI2VgXJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="400007844"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="400007844"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 09:13:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="818396207"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="818396207"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 09:13:03 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] accel/ivpu: Rename sources to use generation based names
Date: Mon, 31 Jul 2023 18:12:53 +0200
Message-Id: <20230731161258.2987564-2-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230731161258.2987564-1-stanislaw.gruszka@linux.intel.com>
References: <20230731161258.2987564-1-stanislaw.gruszka@linux.intel.com>
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
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Given that VPU generation can be used by multiple platforms, driver should
use VPU IP generation in names instead of a platform names.

Change naming for sources files.

Use 37XX format, where:
  3 - major VPU IP generation version
  7 - minor VPU IP generation version
  XX - postfix indicating this is a architecture and not marketing name

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/Makefile                                  | 2 +-
 drivers/accel/ivpu/{ivpu_hw_mtl.c => ivpu_hw_37xx.c}         | 2 +-
 drivers/accel/ivpu/{ivpu_hw_mtl_reg.h => ivpu_hw_37xx_reg.h} | 0
 drivers/accel/ivpu/ivpu_mmu.c                                | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename drivers/accel/ivpu/{ivpu_hw_mtl.c => ivpu_hw_37xx.c} (99%)
 rename drivers/accel/ivpu/{ivpu_hw_mtl_reg.h => ivpu_hw_37xx_reg.h} (100%)

diff --git a/drivers/accel/ivpu/Makefile b/drivers/accel/ivpu/Makefile
index 9858d9fea36e..3179e146e173 100644
--- a/drivers/accel/ivpu/Makefile
+++ b/drivers/accel/ivpu/Makefile
@@ -7,7 +7,7 @@ intel_vpu-y := \
 	ivpu_fw.o \
 	ivpu_fw_log.o \
 	ivpu_gem.o \
-	ivpu_hw_mtl.o \
+	ivpu_hw_37xx.o \
 	ivpu_ipc.o \
 	ivpu_job.o \
 	ivpu_jsm_msg.o \
diff --git a/drivers/accel/ivpu/ivpu_hw_mtl.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
similarity index 99%
rename from drivers/accel/ivpu/ivpu_hw_mtl.c
rename to drivers/accel/ivpu/ivpu_hw_37xx.c
index f1211e74017d..495be81840ac 100644
--- a/drivers/accel/ivpu/ivpu_hw_mtl.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -5,7 +5,7 @@
 
 #include "ivpu_drv.h"
 #include "ivpu_fw.h"
-#include "ivpu_hw_mtl_reg.h"
+#include "ivpu_hw_37xx_reg.h"
 #include "ivpu_hw_reg_io.h"
 #include "ivpu_hw.h"
 #include "ivpu_ipc.h"
diff --git a/drivers/accel/ivpu/ivpu_hw_mtl_reg.h b/drivers/accel/ivpu/ivpu_hw_37xx_reg.h
similarity index 100%
rename from drivers/accel/ivpu/ivpu_hw_mtl_reg.h
rename to drivers/accel/ivpu/ivpu_hw_37xx_reg.h
diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
index 53878e77aad3..b64eb094343b 100644
--- a/drivers/accel/ivpu/ivpu_mmu.c
+++ b/drivers/accel/ivpu/ivpu_mmu.c
@@ -7,7 +7,7 @@
 #include <linux/highmem.h>
 
 #include "ivpu_drv.h"
-#include "ivpu_hw_mtl_reg.h"
+#include "ivpu_hw_37xx_reg.h"
 #include "ivpu_hw_reg_io.h"
 #include "ivpu_mmu.h"
 #include "ivpu_mmu_context.h"
-- 
2.25.1

