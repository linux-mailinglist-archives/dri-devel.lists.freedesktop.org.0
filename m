Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9C39862F0
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 17:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D47C10EA38;
	Wed, 25 Sep 2024 15:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PWQHgAkB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E7910EA32;
 Wed, 25 Sep 2024 15:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727277487; x=1758813487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uYV4+Jhf1hiPbDVkTckIO8W7+LBp457f88GWxpnsCyE=;
 b=PWQHgAkBxS4Fihzt2iR/wBYcb9jfqNNc4UgNv7olItSZgLhxBEEAYczi
 Cc+4o8VoGI5n8DpqO/9QjoklcKXtI49FF4NtWU52rJUrGp8BIDNvw5Yxk
 w/XnXB6nFygURSp5nRX5WHzrV0Z+BHnQU5ShtkH/FrjVRgBtYxVWbuO1C
 ksMI3o7Ijju0thF7qb3bWNNiPunwduzZxxARoyU0CgBpnDngsO2Jy8yXr
 l1A4ZO8tV5llycvJ4LTcph4WP8UdGp2qJ+Qv9RDamjEUgCjUoYe0HOJuT
 UN7zsx4SBlRqg5ePIYYp6M73Wv6ozOBbyxaDE1MJohit3Yt+uM9obtSA2 A==;
X-CSE-ConnectionGUID: rz80Y/h6T3OQdDMlAMbxDQ==
X-CSE-MsgGUID: YU+2IaNjQBiJyQYVK6mQwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="48866842"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="48866842"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 08:17:49 -0700
X-CSE-ConnectionGUID: 7t9FvIO2RQexyTEjzp7T7Q==
X-CSE-MsgGUID: eB1hP6phQSynag6kA2T6MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="76612931"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa003.jf.intel.com with ESMTP; 25 Sep 2024 08:17:47 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH 1/7] drm/i915/histogram: Define registers for histogram
Date: Wed, 25 Sep 2024 20:37:48 +0530
Message-Id: <20240925150754.1876893-2-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240925150754.1876893-1-arun.r.murthy@intel.com>
References: <20240925150754.1876893-1-arun.r.murthy@intel.com>
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

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 .../drm/i915/display/intel_histogram_reg.h    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/display/intel_histogram_reg.h

diff --git a/drivers/gpu/drm/i915/display/intel_histogram_reg.h b/drivers/gpu/drm/i915/display/intel_histogram_reg.h
new file mode 100644
index 000000000000..ed8f22aa8e75
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_histogram_reg.h
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef __INTEL_HISTOGRAM_REG_H__
+#define __INTEL_HISTOGRAM_REG_H__
+
+#include <linux/types.h>
+
+/* GLOBAL_HIST related registers */
+#define _DPST_CTL_A					0x490C0
+#define _DPST_CTL_B					0x491C0
+#define DPST_CTL(pipe)					_MMIO_PIPE(pipe, _DPST_CTL_A, _DPST_CTL_B)
+#define DPST_CTL_IE_HIST_EN				REG_BIT(31)
+#define DPST_CTL_RESTORE				REG_BIT(28)
+#define DPST_CTL_IE_MODI_TABLE_EN			REG_BIT(27)
+#define DPST_CTL_HIST_MODE				REG_BIT(24)
+#define DPST_CTL_ENHANCEMENT_MODE_MASK			REG_GENMASK(14, 13)
+#define DPST_CTL_EN_MULTIPLICATIVE			REG_FIELD_PREP(DPST_CTL_ENHANCEMENT_MODE_MASK, 2)
+#define DPST_CTL_IE_TABLE_VALUE_FORMAT			REG_BIT(15)
+#define DPST_CTL_BIN_REG_FUNC_SEL			REG_BIT(11)
+#define DPST_CTL_BIN_REG_FUNC_TC			REG_FIELD_PREP(DPST_CTL_BIN_REG_FUNC_SEL, 0)
+#define DPST_CTL_BIN_REG_FUNC_IE			REG_FIELD_PREP(DPST_CTL_BIN_REG_FUNC_SEL, 1)
+#define DPST_CTL_BIN_REG_MASK				REG_GENMASK(6, 0)
+#define DPST_CTL_BIN_REG_CLEAR				REG_FIELD_PREP(DPST_CTL_BIN_REG_MASK, 0)
+#define DPST_CTL_IE_TABLE_VALUE_FORMAT_2INT_8FRAC	REG_FIELD_PREP(DPST_CTL_IE_TABLE_VALUE_FORMAT, 1)
+#define DPST_CTL_IE_TABLE_VALUE_FORMAT_1INT_9FRAC	REG_FIELD_PREP(DPST_CTL_IE_TABLE_VALUE_FORMAT, 0)
+#define DPST_CTL_HIST_MODE_YUV				REG_FIELD_PREP(DPST_CTL_HIST_MODE, 0)
+#define DPST_CTL_HIST_MODE_HSV				REG_FIELD_PREP(DPST_CTL_HIST_MODE, 1)
+
+#define _DPST_GUARD_A					0x490C8
+#define _DPST_GUARD_B					0x491C8
+#define DPST_GUARD(pipe)				_MMIO_PIPE(pipe, _DPST_GUARD_A, _DPST_GUARD_B)
+#define DPST_GUARD_HIST_INT_EN				REG_BIT(31)
+#define DPST_GUARD_HIST_EVENT_STATUS			REG_BIT(30)
+#define DPST_GUARD_INTERRUPT_DELAY_MASK			REG_GENMASK(29, 22)
+#define DPST_GUARD_INTERRUPT_DELAY(val)			REG_FIELD_PREP(DPST_GUARD_INTERRUPT_DELAY_MASK, val)
+#define DPST_GUARD_THRESHOLD_GB_MASK			REG_GENMASK(21, 0)
+#define DPST_GUARD_THRESHOLD_GB(val)			REG_FIELD_PREP(DPST_GUARD_THRESHOLD_GB_MASK, val)
+
+#define _DPST_BIN_A					0x490C4
+#define _DPST_BIN_B					0x491C4
+#define DPST_BIN(pipe)					_MMIO_PIPE(pipe, _DPST_BIN_A, _DPST_BIN_B)
+#define DPST_BIN_DATA_MASK				REG_GENMASK(23, 0)
+#define DPST_BIN_BUSY					REG_BIT(31)
+
+#define INTEL_HISTOGRAM_PIPEA			0x90000000
+#define INTEL_HISTOGRAM_PIPEB			0x90000002
+#define INTEL_HISTOGRAM_EVENT(pipe)		PIPE(pipe, \
+						     INTEL_HISTOGRAM_PIPEA, \
+						     INTEL_HISTOGRAM_PIPEB)
+
+#endif /* __INTEL_HISTOGRAM_REG_H__ */
-- 
2.25.1

