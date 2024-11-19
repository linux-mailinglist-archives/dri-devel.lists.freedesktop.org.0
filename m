Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3929D2420
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 11:55:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C765710E610;
	Tue, 19 Nov 2024 10:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PvDcktG/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A16810E17E;
 Tue, 19 Nov 2024 10:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732013700; x=1763549700;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=29C6DaXcFNu3EreP4AT9Iv0aBgHpmAhVPPo4wCgC/1M=;
 b=PvDcktG/aTWqMANad2VHR1W/cnx5yMRCC+F+w9uH/WhTmwWb9zH9APTh
 2UfIA2rUITcJKYcV8Vyi6ZbcCYkTO0ayXRV2a8698pzIIFI/wivcAK1GN
 dW0Kzi/Gxh31C00G52DQdP0Vco8tknm6iibCbcofBWMhLYts9OyQt2iMV
 JTRF54Ygy7sLCV1UqbhQosQYvrBmWberf2X4R7K9y2l1sfaAai3FDRkBP
 3AHj4OIz+zCKKgkQGtQBazO/iNhDtt6C3hFJYqjmN+SDoKfAd78yk4RF1
 nriHavznvEBW9b/6bQI7aq3n8yXJUQbH071kTKzawAHEbZX5/dR6ROE1u g==;
X-CSE-ConnectionGUID: K7dWLJ5vSTGGbFjRucOUdw==
X-CSE-MsgGUID: Nhk4fPfIRfu9a7v+8PrJ+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="43075347"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="43075347"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 02:55:00 -0800
X-CSE-ConnectionGUID: DOwja6mrTGevnLpUuk7tRw==
X-CSE-MsgGUID: 6qbKk/8ORGqLt3eJc9tHhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89937417"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa009.fm.intel.com with ESMTP; 19 Nov 2024 02:54:58 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv2 1/8] drm/i915/histogram: Define registers for histogram
Date: Tue, 19 Nov 2024 16:15:14 +0530
Message-Id: <20241119104521.575377-2-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241119104521.575377-1-arun.r.murthy@intel.com>
References: <20241119104521.575377-1-arun.r.murthy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add the register/bit definitions for global histogram.

v2: Intended the register contents, removed unused regs (Jani)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 .../drm/i915/display/intel_histogram_regs.h   | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/display/intel_histogram_regs.h

diff --git a/drivers/gpu/drm/i915/display/intel_histogram_regs.h b/drivers/gpu/drm/i915/display/intel_histogram_regs.h
new file mode 100644
index 000000000000..1252b4f339a6
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_histogram_regs.h
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef __INTEL_HISTOGRAM_REGS_H__
+#define __INTEL_HISTOGRAM_REGS_H__
+
+#include "intel_display_reg_defs.h"
+
+/* GLOBAL_HIST related registers */
+#define _DPST_CTL_A					0x490C0
+#define _DPST_CTL_B					0x491C0
+#define DPST_CTL(pipe)					_MMIO_PIPE(pipe, _DPST_CTL_A, _DPST_CTL_B)
+#define  DPST_CTL_IE_HIST_EN				REG_BIT(31)
+#define  DPST_CTL_RESTORE				REG_BIT(28)
+#define  DPST_CTL_IE_MODI_TABLE_EN			REG_BIT(27)
+#define  DPST_CTL_HIST_MODE				REG_BIT(24)
+#define  DPST_CTL_ENHANCEMENT_MODE_MASK			REG_GENMASK(14, 13)
+#define  DPST_CTL_EN_MULTIPLICATIVE			REG_FIELD_PREP(DPST_CTL_ENHANCEMENT_MODE_MASK, 2)
+#define  DPST_CTL_IE_TABLE_VALUE_FORMAT			REG_BIT(15)
+#define  DPST_CTL_BIN_REG_FUNC_SEL			REG_BIT(11)
+#define  DPST_CTL_BIN_REG_FUNC_TC			REG_FIELD_PREP(DPST_CTL_BIN_REG_FUNC_SEL, 0)
+#define  DPST_CTL_BIN_REG_FUNC_IE			REG_FIELD_PREP(DPST_CTL_BIN_REG_FUNC_SEL, 1)
+#define  DPST_CTL_BIN_REG_MASK				REG_GENMASK(6, 0)
+#define  DPST_CTL_BIN_REG_CLEAR				REG_FIELD_PREP(DPST_CTL_BIN_REG_MASK, 0)
+#define  DPST_CTL_IE_TABLE_VALUE_FORMAT_2INT_8FRAC	REG_FIELD_PREP(DPST_CTL_IE_TABLE_VALUE_FORMAT, 1)
+#define  DPST_CTL_IE_TABLE_VALUE_FORMAT_1INT_9FRAC	REG_FIELD_PREP(DPST_CTL_IE_TABLE_VALUE_FORMAT, 0)
+#define  DPST_CTL_HIST_MODE_YUV				REG_FIELD_PREP(DPST_CTL_HIST_MODE, 0)
+#define  DPST_CTL_HIST_MODE_HSV				REG_FIELD_PREP(DPST_CTL_HIST_MODE, 1)
+
+#define _DPST_GUARD_A					0x490C8
+#define _DPST_GUARD_B					0x491C8
+#define DPST_GUARD(pipe)				_MMIO_PIPE(pipe, _DPST_GUARD_A, _DPST_GUARD_B)
+#define  DPST_GUARD_HIST_INT_EN				REG_BIT(31)
+#define  DPST_GUARD_HIST_EVENT_STATUS			REG_BIT(30)
+#define  DPST_GUARD_INTERRUPT_DELAY_MASK			REG_GENMASK(29, 22)
+#define  DPST_GUARD_INTERRUPT_DELAY(val)			REG_FIELD_PREP(DPST_GUARD_INTERRUPT_DELAY_MASK, val)
+#define  DPST_GUARD_THRESHOLD_GB_MASK			REG_GENMASK(21, 0)
+#define  DPST_GUARD_THRESHOLD_GB(val)			REG_FIELD_PREP(DPST_GUARD_THRESHOLD_GB_MASK, val)
+
+#define _DPST_BIN_A					0x490C4
+#define _DPST_BIN_B					0x491C4
+#define DPST_BIN(pipe)					_MMIO_PIPE(pipe, _DPST_BIN_A, _DPST_BIN_B)
+#define  DPST_BIN_DATA_MASK				REG_GENMASK(23, 0)
+#define  DPST_BIN_BUSY					REG_BIT(31)
+
+#endif /* __INTEL_HISTOGRAM_REGS_H__ */
-- 
2.25.1

