Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A313D6B4C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 02:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA8B72DEB;
	Tue, 27 Jul 2021 00:53:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D85C6E926;
 Tue, 27 Jul 2021 00:53:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ghXMyG2896RKJ5JTOl1gbrGUguisTEOLQ+Euf2OVjZe48S6L3ogH8S/gcXhDNlMLHtL2+rluqD7w1m24NIfz7f/7vI85e/J5Zhn9J6VpWkQlgZU/mQu0o8hHyV+NyuZry5YgJ89/HsplXn6oEQtSoU1QT339/dpx+1j7JrD9rz2hliuForJ7VROFXxPgI6VDkBNOzhxRH6gCaPXOVtLY1tKXHNi5KFXHamyJAhrEA2excxmlwbO0QKi0xqlTY3ybGVV7DNonNhKT5dbMyXmQabM6lx3tn7SE/OTdV+r2dvwjvAXJP/4iIqLANgEwpeGicGjPCpofVrzPiNXEMsHHwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnZX5HVbOcPplIr+TZjMHBLjVEEBPmSwZ3rZMKzT6L8=;
 b=JyguR/x9W7KYZmvfxxc7jOH6TdJoq8VuGneyZzk2wLJDFVQs+c3ZYZyDgAIhG2lNhPETyUTNjf21jXnwdwx22F61q+NPxUqHixPJUFdQW483okX8UC3Y671qaHEVNv/ATLYr5NNH+RStPnh1+RQ/dTztuZiRaSaj/ZPLN6uzZWUUC8V9TD/q08vQkCumEtQUnxpcwX8Qpsm5dDL01np7+AGNyrypsS2XSg8o3DhkN4a2sExw6f5T5wrXj7y8VZ3MFlLnSWu/I8GXxrGM894B0mS1+cvJYUP6bDJbcooeTJAV+lQGexPvNwleudPeYvdB3GoSLR8Gvp46HI+gBBGUVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnZX5HVbOcPplIr+TZjMHBLjVEEBPmSwZ3rZMKzT6L8=;
 b=x7ggBOxEhowOl7Olx0HyL0UhwI4JuTUVPtE7IuEzbviv5omdiFCee3dv61YRUQs1vuwTYbdeeawoZ5rZgYzQZGXhQE0atS3tITp36217Yr6Wl2yMReMuwRmzL8W+FI2TcnhDZyxOlkeWaFqCOw27kusJNgtIs1gkT/NhYxAsZHU=
Received: from DM5PR11CA0006.namprd11.prod.outlook.com (2603:10b6:3:115::16)
 by MWHPR12MB1517.namprd12.prod.outlook.com (2603:10b6:301:10::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Tue, 27 Jul
 2021 00:53:05 +0000
Received: from DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:115:cafe::5) by DM5PR11CA0006.outlook.office365.com
 (2603:10b6:3:115::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend
 Transport; Tue, 27 Jul 2021 00:53:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT028.mail.protection.outlook.com (10.13.173.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Tue, 27 Jul 2021 00:53:05 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 26 Jul
 2021 19:53:04 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <sunpeng.li@amd.com>, <roman.li@amd.com>
Subject: [PATCH v4 2/4] drm/amd/display: Add control mechanism for FPU
Date: Mon, 26 Jul 2021 20:52:46 -0400
Message-ID: <20210727005248.1827411-3-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727005248.1827411-1-Rodrigo.Siqueira@amd.com>
References: <20210727005248.1827411-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79865420-2a4a-4ad1-d35f-08d95098e51a
X-MS-TrafficTypeDiagnostic: MWHPR12MB1517:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1517BB0055F10B922D94997898E99@MWHPR12MB1517.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:348;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /iuLcRzcdb0qKCCJa47ZCEbJH0sxxa8JBVbb0zJTM1XdHJcZJsWloaf3D2+GkX9spVOF/zknNled6LAhIi7tX0ADOUzMKYRLe4136lcHa+3uzKzMFGsyrWGflogS21L66ltPZHZEQcuE8CHHynOZe4zHlPppdoGFKlrqd1ZD8yzhSpajs4iZBRDkZYlFBf5hSGjzqEyFgme1EloI1PKNWXYWm5aBc8A950Y0/6n5rA8sC+4gGK1vYr4A0vDEg+rlPkoULHX93F1daZVFr+p90cNTga0p5aPDiZr+vvqUTMJ+R8DJmp0pMJ+OP8ud9dKnzFcjuOuCMNRtOb8QdoUh9EUpKgAcLXrCx46uu/5/qKHztwj5XAglVJTFRBt/lEjFY7d0q5c3iwF6Sl2CGikqV2JjX+79MKThE6/swY/A2J40bKdjih+JBz8eGUT+QJcSQWNLjjTBhRCoaWWyPIi46qxJudVbLXKXM6Qb7une6FJr0zMdwkEYlnlYkSc9l6vsKwBIovBrLKggU5gYRqSk85LuIHkSkdQdorGnnq/vWnhcoLUFXeJY1+w+Qyh7NibvSKTN72zROaIwZspynG+Jb1+cSrqSNEtlK9TKWxXEB5A1xqAQnGIs9ru9nxGEhKwJ3DbhDKGZ719Tvr/y+FCoTy5Ic7p/vYmJ+7W7P5Auueib3f71stShO2yBYD1st+prCtxDPcLVLJnhMQCO6w4ismQXu/BnjwMmKqlNmExTkhg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(16526019)(6636002)(8936002)(81166007)(356005)(2616005)(186003)(508600001)(4326008)(2906002)(70586007)(70206006)(336012)(36860700001)(66574015)(316002)(26005)(8676002)(5660300002)(82310400003)(6666004)(54906003)(86362001)(110136005)(47076005)(1076003)(426003)(83380400001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 00:53:05.6998 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79865420-2a4a-4ad1-d35f-08d95098e51a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1517
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
Cc: Peter Zijlstra <peterz@infradead.org>, Qingqing
 Zhuo <qingqing.zhuo@amd.com>, Anson Jacob <Anson.Jacob@amd.com>,
 Dmytro Laktyushkin <dmytro.laktyushkin@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Jun Lei <jun.lei@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DC invokes DC_FPU_START/END in multiple parts of the code; this can
create a situation where we invoke this FPU operation in a nested way or
exit too early. For avoiding this situation, this commit adds a
mechanism where dc_fpu_begin/end manages the access to
kernel_fpu_begin/end.

Change since V3:
- Christian: Move PPC64 code to dc_fpu_begin/end.

Change since V2:
- Christian: Do not use this_cpu_* between get/put_cpu_ptr().

Change since V1:
- Use a better variable names
- Use get_cpu_ptr and put_cpu_ptr to better balance preemption enable
and disable

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Anson Jacob <Anson.Jacob@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Hersen Wu <hersenxs.wu@amd.com>
Cc: Aric Cyr <aric.cyr@amd.com>
Cc: Jun Lei <jun.lei@amd.com>
Cc: Dmytro Laktyushkin <dmytro.laktyushkin@amd.com>
Cc: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |  4 +
 .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 21 ++++
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 96 +++++++++++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.h    | 33 +++++++
 drivers/gpu/drm/amd/display/dc/dc_trace.h     |  3 +
 drivers/gpu/drm/amd/display/dc/os_types.h     | 35 +------
 6 files changed, 160 insertions(+), 32 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
index 91fb72c96545..718e123a3230 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
@@ -27,6 +27,10 @@
 
 AMDGPUDM = amdgpu_dm.o amdgpu_dm_irq.o amdgpu_dm_mst_types.o amdgpu_dm_color.o
 
+ifdef CONFIG_DRM_AMD_DC_DCN
+AMDGPUDM += dc_fpu.o
+endif
+
 ifneq ($(CONFIG_DRM_AMD_DC),)
 AMDGPUDM += amdgpu_dm_services.o amdgpu_dm_helpers.o amdgpu_dm_pp_smu.o amdgpu_dm_psr.o
 endif
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
index 46a33f64cf8e..230bb12c405e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
@@ -637,6 +637,27 @@ TRACE_EVENT(amdgpu_refresh_rate_track,
 		  __entry->refresh_rate_ns)
 );
 
+TRACE_EVENT(dcn_fpu,
+	    TP_PROTO(bool begin, const char *function, const int line),
+	    TP_ARGS(begin, function, line),
+
+	    TP_STRUCT__entry(
+			     __field(bool, begin)
+			     __field(const char *, function)
+			     __field(int, line)
+	    ),
+	    TP_fast_assign(
+			   __entry->begin = begin;
+			   __entry->function = function;
+			   __entry->line = line;
+	    ),
+	    TP_printk("%s()+%d: %s",
+		      __entry->function,
+		      __entry->line,
+		      __entry->begin ? "begin" : "end"
+	    )
+);
+
 #endif /* _AMDGPU_DM_TRACE_H_ */
 
 #undef TRACE_INCLUDE_PATH
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
new file mode 100644
index 000000000000..d4ab27bf8d04
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include "dc_trace.h"
+
+#if defined(CONFIG_X86)
+#include <asm/fpu/api.h>
+#elif defined(CONFIG_PPC64)
+#include <asm/switch_to.h>
+#include <asm/cputable.h>
+#endif
+
+/**
+ * dc_fpu_begin - Enables FPU protection
+ * @function_name: A string containing the function name for debug purposes
+ *   (usually __func__)
+ *
+ * @line: A line number where DC_FP_START was invoked for debug purpose
+ *   (usually __LINE__)
+ *
+ * This function is responsible for managing the use of kernel_fpu_begin() with
+ * the advantage of providing an event trace for debugging.
+ *
+ * Note: Do not call this function directly; always use DC_FP_START().
+ */
+void dc_fpu_begin(const char *function_name, const int line)
+{
+	TRACE_DCN_FPU(true, function_name, line);
+
+#if defined(CONFIG_X86)
+	kernel_fpu_begin();
+#elif defined(CONFIG_PPC64)
+	if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
+		preempt_disable();
+		enable_kernel_vsx();
+	} else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) {
+		preempt_disable();
+		enable_kernel_altivec();
+	} else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) {
+		preempt_disable();
+		enable_kernel_fp();
+	}
+#endif
+}
+
+/**
+ * dc_fpu_end - Disable FPU protection
+ * @function_name: A string containing the function name for debug purposes
+ * @line: A-line number where DC_FP_END was invoked for debug purpose
+ *
+ * This function is responsible for managing the use of kernel_fpu_end() with
+ * the advantage of providing an event trace for debugging.
+ *
+ * Note: Do not call this function directly; always use DC_FP_END().
+ */
+void dc_fpu_end(const char *function_name, const int line)
+{
+	TRACE_DCN_FPU(false, function_name, line);
+#if defined(CONFIG_X86)
+	kernel_fpu_end();
+#elif defined(CONFIG_PPC64)
+	if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
+		disable_kernel_vsx();
+		preempt_enable();
+	} else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) {
+		disable_kernel_altivec();
+		preempt_enable();
+	} else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) {
+		disable_kernel_fp();
+		preempt_enable();
+	}
+#endif
+}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
new file mode 100644
index 000000000000..fb54983c5c60
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DC_FPU_H__
+#define __DC_FPU_H__
+
+void dc_fpu_begin(const char *function_name, const int line);
+void dc_fpu_end(const char *function_name, const int line);
+
+#endif /* __DC_FPU_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dc_trace.h b/drivers/gpu/drm/amd/display/dc/dc_trace.h
index d2615357269b..d598ba697e45 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_trace.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_trace.h
@@ -37,3 +37,6 @@
 
 #define TRACE_DCN_CLOCK_STATE(dcn_clocks) \
 	trace_amdgpu_dm_dc_clocks_state(dcn_clocks)
+
+#define TRACE_DCN_FPU(begin, function, line) \
+	trace_dcn_fpu(begin, function, line)
diff --git a/drivers/gpu/drm/amd/display/dc/os_types.h b/drivers/gpu/drm/amd/display/dc/os_types.h
index 126c2f3a4dd3..f50cae252de4 100644
--- a/drivers/gpu/drm/amd/display/dc/os_types.h
+++ b/drivers/gpu/drm/amd/display/dc/os_types.h
@@ -51,38 +51,9 @@
 #define dm_error(fmt, ...) DRM_ERROR(fmt, ##__VA_ARGS__)
 
 #if defined(CONFIG_DRM_AMD_DC_DCN)
-#if defined(CONFIG_X86)
-#include <asm/fpu/api.h>
-#define DC_FP_START() kernel_fpu_begin()
-#define DC_FP_END() kernel_fpu_end()
-#elif defined(CONFIG_PPC64)
-#include <asm/switch_to.h>
-#include <asm/cputable.h>
-#define DC_FP_START() { \
-	if (cpu_has_feature(CPU_FTR_VSX_COMP)) { \
-		preempt_disable(); \
-		enable_kernel_vsx(); \
-	} else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) { \
-		preempt_disable(); \
-		enable_kernel_altivec(); \
-	} else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) { \
-		preempt_disable(); \
-		enable_kernel_fp(); \
-	} \
-}
-#define DC_FP_END() { \
-	if (cpu_has_feature(CPU_FTR_VSX_COMP)) { \
-		disable_kernel_vsx(); \
-		preempt_enable(); \
-	} else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) { \
-		disable_kernel_altivec(); \
-		preempt_enable(); \
-	} else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) { \
-		disable_kernel_fp(); \
-		preempt_enable(); \
-	} \
-}
-#endif
+#include "amdgpu_dm/dc_fpu.h"
+#define DC_FP_START() dc_fpu_begin(__func__, __LINE__)
+#define DC_FP_END() dc_fpu_end(__func__, __LINE__)
 #endif
 
 /*
-- 
2.25.1

