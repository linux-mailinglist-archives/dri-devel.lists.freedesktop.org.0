Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EB83CF0F3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 02:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4596E17D;
	Tue, 20 Jul 2021 00:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2076.outbound.protection.outlook.com [40.107.212.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2486E12E;
 Tue, 20 Jul 2021 00:49:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQ2QDUENmB5RvjjpmroxyMcgCBh1p6+iNFR2uM+JrIOuz3QhNuWACLpYWd8d6UpUna5GBbq0jZGTU+qTMl3AxXDJa9Ljp3ZGmejjHu+5+d5PKlfBgmywmdOya4/v6BCZGS4ChKRIAKxw7adsP2Qx1J0oADGz54HR51U0GterhA9glitY4dduYGda/73sFAI6PhSHCMST95ch4j1An1J1qU2cB0GAb0h/BYyYN6JzfwlTakDqleeN5FKBdzAzCGNzkncSV2G6mXjkA7SpB/ca2IxXJzO/jCMsU2jMGEOXvTc5aLWUNF8ghi0NUjhelIr+yJLlSDHIiUc14ETYSTFycg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCZTlvZMUiUmJezqNbKRPnsNk2nPmOKu6f6364HQTos=;
 b=a3nVm+hHBxGg3Ddm/cZae50xwYajc90W/QeugjaNncjpkTG3xCM1OVSG4WpvgsUU5V2kdo4Vlqb6GNzsyFSG22Ri5T7sz0aLt6KCX3X/X4CVwU+rGylEl7uFNp3Etxb5Ze0KgG4mcNZPQnQ2I79jpLPA5v2p2DDC/tYBjFjhNETc/DwnmrHU9VkajS7g29y6ByO0DfKEemh54uLoaSZSpoQB9YFsGc93v8p8IBf5VGgfXlPJzKLzji6oNCzN0vs883pWoTlM04R5atgPlfnnr6AGjpNJCTOB+cKfokblbT59F4OjkrSInfAhDA3WCrzTJzKobAuCs7qozLbD+PeOHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCZTlvZMUiUmJezqNbKRPnsNk2nPmOKu6f6364HQTos=;
 b=tPa68R/gC3L+vhQX+gioet+YaybXsyrXOFnfaNhKF17LXjG5lQKbNT1v2YxZwdqo9b+88kt53DtaSeWUPxBrjIGtTD3f3F4ZVxk3hn3ezEix941Sux4Siga1ATH0GVbjmYFjhYpizQc96waJh9jS6NslPT8EFRf/L5WwnX1a6Lk=
Received: from BN9PR03CA0973.namprd03.prod.outlook.com (2603:10b6:408:109::18)
 by BN6PR1201MB2531.namprd12.prod.outlook.com (2603:10b6:404:b2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 00:49:29 +0000
Received: from BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::d8) by BN9PR03CA0973.outlook.office365.com
 (2603:10b6:408:109::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Tue, 20 Jul 2021 00:49:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT019.mail.protection.outlook.com (10.13.176.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 00:49:29 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 19 Jul
 2021 19:49:28 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 <roman.li@amd.com>, <sunpeng.li@amd.com>
Subject: [PATCH v3 1/4] drm/amd/display: Introduce FPU directory inside DC
Date: Mon, 19 Jul 2021 20:49:11 -0400
Message-ID: <20210720004914.3060879-2-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720004914.3060879-1-Rodrigo.Siqueira@amd.com>
References: <20210720004914.3060879-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c764ed37-04b5-4dbc-d715-08d94b183b23
X-MS-TrafficTypeDiagnostic: BN6PR1201MB2531:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB2531F7B8D44452718B86021498E29@BN6PR1201MB2531.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aaMiDUNjm47SqoEssmQeeY3NWavGDqjP48sYYYMRHPLhVAcy1n3war6TFKDW+QCHFDhbbgKjPEm/GyMTtAWstMlC+A5HyGtNtVhhlSGaFJ1yfTmasvBq7CMR4ITIW5FN45Ng7dnjLQq6JqmIsVD0vQ6CHy6KceP4yFbBp4PRyMuYJNY7t6EcyHo8mMHhgw8+ZIwpXm4N0PdeLTyxcwhOe1FXp3kS7yfjHxWVPsLJLUvzlymn0UJMyFYEE+twSj2atLjaBf+p70gGHy+XTnwc8a0fB464o7Ty1CUZhUE2SDB59k8NY4sTi4hUtsgPeV02wxhuVU/OoITNu7VeZLzQ3kQlnsBBfsGII1bIJKDCx+6GbIbB32SdOimxmnquuId6CNF5E9ltbfEDTPVsX2wOkro26qLiTMU7KGRqa+qe20kTKuDuSU0i364mS1YBSFdhhnoyQI4tBd8MZXTgDyXqVTzfNoHDHLY78ETHqcre3evSrjhUEcQdBsxh0IzeQhLM+C7Dn5405lCuWPZLEHzXSVwSGz8mkcNdkEolUDDnIdsRBcf3ufb+gUkUQx9OVrJQHFGiyLzWxoQ8mfNq8VE/Q/U7lSUVzY6V7n250BfzYV4XKd0eqV8fgXT+hCcIe1na0+GYAkC+Le8F8d4KFX3VWslBowPN/fYQuv7F8bb0hdVIGludiEsXmc4pf0dFaUQ+5Z64rn1XQZcrBOZu4SCmPOajcfXQXISTPJ8c7kcroF8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(36860700001)(36756003)(30864003)(2616005)(1076003)(4326008)(186003)(66574015)(26005)(16526019)(83380400001)(336012)(54906003)(70586007)(5660300002)(70206006)(426003)(316002)(508600001)(356005)(8676002)(47076005)(110136005)(86362001)(6666004)(81166007)(82310400003)(6636002)(2906002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 00:49:29.2609 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c764ed37-04b5-4dbc-d715-08d94b183b23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2531
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
Cc: kernel test robot <lkp@intel.com>, Anson Jacob <Anson.Jacob@amd.com>,
 dri-devel@lists.freedesktop.org, Hersen Wu <hersenxs.wu@amd.com>,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The display core files rely on FPU, which requires to be compiled with
special flags. Ideally, we don't want these FPU operations spread around
the DC code; nevertheless, it happens in the current source. This commit
introduces a new directory named fpu_operations that intends to
centralize all files that require the FPU compilation flag. As part of
this new component, this patch also moves one of the functions
(dcn20_populate_dml_writeback_from_context) that require FPU access to a
single shared file. Notice that this is the first part of the work, and
it does not fix the FPU issue yet; we still need other patches for
achieving the complete FPU isolation.

Changes since V2:
- Christian: Remove unnecessary wrapper.
- lkp: Add missing prototype.
- Only compile the FPU operations if the DCN option is enabled.

Change since V1:
- Update documentation and rebase.

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Anson Jacob <Anson.Jacob@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Hersen Wu <hersenxs.wu@amd.com>
Cc: Aric Cyr <aric.cyr@amd.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 drivers/gpu/drm/amd/display/dc/Makefile       |  1 +
 .../drm/amd/display/dc/dcn20/dcn20_resource.c | 39 +--------
 .../drm/amd/display/dc/dcn20/dcn20_resource.h |  2 -
 .../drm/amd/display/dc/dcn21/dcn21_resource.c |  2 +
 .../amd/display/dc/fpu_operations/Makefile    | 58 +++++++++++++
 .../drm/amd/display/dc/fpu_operations/dcn2x.c | 84 +++++++++++++++++++
 .../drm/amd/display/dc/fpu_operations/dcn2x.h | 33 ++++++++
 7 files changed, 180 insertions(+), 39 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/fpu_operations/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.h

diff --git a/drivers/gpu/drm/amd/display/dc/Makefile b/drivers/gpu/drm/amd/display/dc/Makefile
index 943fcb164876..0de4baefa91e 100644
--- a/drivers/gpu/drm/amd/display/dc/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/Makefile
@@ -35,6 +35,7 @@ DC_LIBS += dcn301
 DC_LIBS += dcn302
 DC_LIBS += dcn303
 DC_LIBS += dcn31
+DC_LIBS += fpu_operations
 endif
 
 DC_LIBS += dce120
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index 1b05a37b674d..f99b09643a52 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -35,6 +35,8 @@
 #include "include/irq_service_interface.h"
 #include "dcn20/dcn20_resource.h"
 
+#include "fpu_operations/dcn2x.h"
+
 #include "dcn10/dcn10_hubp.h"
 #include "dcn10/dcn10_ipp.h"
 #include "dcn20_hubbub.h"
@@ -1974,43 +1976,6 @@ void dcn20_split_stream_for_mpc(
 	ASSERT(primary_pipe->plane_state);
 }
 
-void dcn20_populate_dml_writeback_from_context(
-		struct dc *dc, struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes)
-{
-	int pipe_cnt, i;
-
-	for (i = 0, pipe_cnt = 0; i < dc->res_pool->pipe_count; i++) {
-		struct dc_writeback_info *wb_info = &res_ctx->pipe_ctx[i].stream->writeback_info[0];
-
-		if (!res_ctx->pipe_ctx[i].stream)
-			continue;
-
-		/* Set writeback information */
-		pipes[pipe_cnt].dout.wb_enable = (wb_info->wb_enabled == true) ? 1 : 0;
-		pipes[pipe_cnt].dout.num_active_wb++;
-		pipes[pipe_cnt].dout.wb.wb_src_height = wb_info->dwb_params.cnv_params.crop_height;
-		pipes[pipe_cnt].dout.wb.wb_src_width = wb_info->dwb_params.cnv_params.crop_width;
-		pipes[pipe_cnt].dout.wb.wb_dst_width = wb_info->dwb_params.dest_width;
-		pipes[pipe_cnt].dout.wb.wb_dst_height = wb_info->dwb_params.dest_height;
-		pipes[pipe_cnt].dout.wb.wb_htaps_luma = 1;
-		pipes[pipe_cnt].dout.wb.wb_vtaps_luma = 1;
-		pipes[pipe_cnt].dout.wb.wb_htaps_chroma = wb_info->dwb_params.scaler_taps.h_taps_c;
-		pipes[pipe_cnt].dout.wb.wb_vtaps_chroma = wb_info->dwb_params.scaler_taps.v_taps_c;
-		pipes[pipe_cnt].dout.wb.wb_hratio = 1.0;
-		pipes[pipe_cnt].dout.wb.wb_vratio = 1.0;
-		if (wb_info->dwb_params.out_format == dwb_scaler_mode_yuv420) {
-			if (wb_info->dwb_params.output_depth == DWB_OUTPUT_PIXEL_DEPTH_8BPC)
-				pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_420_8;
-			else
-				pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_420_10;
-		} else
-			pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_444_32;
-
-		pipe_cnt++;
-	}
-
-}
-
 int dcn20_populate_dml_pipes_from_context(
 		struct dc *dc,
 		struct dc_state *context,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
index c8f3127bbcdf..6ec8ff45f0f7 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
@@ -58,8 +58,6 @@ struct pipe_ctx *dcn20_acquire_idle_pipe_for_layer(
 		struct dc_state *state,
 		const struct resource_pool *pool,
 		struct dc_stream_state *stream);
-void dcn20_populate_dml_writeback_from_context(
-		struct dc *dc, struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes);
 
 struct stream_encoder *dcn20_stream_encoder_create(
 	enum engine_id eng_id,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
index f3d98e3ba624..85385144e2c5 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
@@ -35,6 +35,8 @@
 #include "include/irq_service_interface.h"
 #include "dcn20/dcn20_resource.h"
 
+#include "fpu_operations/dcn2x.h"
+
 #include "clk_mgr.h"
 #include "dcn10/dcn10_hubp.h"
 #include "dcn10/dcn10_ipp.h"
diff --git a/drivers/gpu/drm/amd/display/dc/fpu_operations/Makefile b/drivers/gpu/drm/amd/display/dc/fpu_operations/Makefile
new file mode 100644
index 000000000000..7f6f90c3f267
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/fpu_operations/Makefile
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: MIT
+#
+# Copyright 2021 Advanced Micro Devices, Inc.
+#
+# Permission is hereby granted, free of charge, to any person obtaining a
+# copy of this software and associated documentation files (the "Software"),
+# to deal in the Software without restriction, including without limitation
+# the rights to use, copy, modify, merge, publish, distribute, sublicense,
+# and/or sell copies of the Software, and to permit persons to whom the
+# Software is furnished to do so, subject to the following conditions:
+#
+# The above copyright notice and this permission notice shall be included in
+# all copies or substantial portions of the Software.
+#
+# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+# THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+# OTHER DEALINGS IN THE SOFTWARE.
+#
+#
+# Makefile for fpu operations component.
+#
+
+FPU_OPERATIONS = dcn2x.o
+
+ifdef CONFIG_X86
+fpu_ccflags := -mhard-float -msse
+endif
+
+ifdef CONFIG_PPC64
+fpu_ccflags := -mhard-float -maltivec
+endif
+
+ifdef CONFIG_CC_IS_GCC
+ifeq ($(call cc-ifversion, -lt, 0701, y), y)
+IS_OLD_GCC = 1
+endif
+endif
+
+ifdef CONFIG_X86
+ifdef IS_OLD_GCC
+# Stack alignment mismatch, proceed with caution.
+# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
+# (8B stack alignment).
+fpu_ccflags := -mpreferred-stack-boundary=4
+else
+fpu_ccflags :=  -msse2
+endif
+endif
+
+CFLAGS_$(AMDDALPATH)/dc/fpu_operations/dcn2x.o += $(fpu_ccflags)
+
+AMD_DAL_FPU_OPERATIONS = $(addprefix $(AMDDALPATH)/dc/fpu_operations/,$(FPU_OPERATIONS))
+
+AMD_DISPLAY_FILES += $(AMD_DAL_FPU_OPERATIONS)
diff --git a/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
new file mode 100644
index 000000000000..95a0b89302a9
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
@@ -0,0 +1,84 @@
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
+#include "resource.h"
+
+#include "fpu_operations/dcn2x.h"
+
+/**
+ * DOC: DCN2x FPU manipulation Overview
+ *
+ * The DCN architecture relies on FPU operations, which require special
+ * compilation flags and the use of kernel_fpu_begin/end functions; ideally, we
+ * want to avoid spreading FPU access across multiple files. With this idea in
+ * mind, this file aims to centralize all DCN20 and DCN2.1 (DCN2x) functions
+ * that require FPU access in a single place. Code in this file follows the
+ * following code pattern:
+ *
+ * 1. Functions that use FPU operations should be isolated in static functions.
+ * 2. The FPU functions should have the noinline attribute to ensure anything
+ *    that deals with FP register is contained within this call.
+ * 3. All function that needs to be accessed outside this file requires a
+ *    public interface that not uses any FPU reference.
+ */
+
+void dcn20_populate_dml_writeback_from_context(struct dc *dc,
+					       struct resource_context *res_ctx,
+					       display_e2e_pipe_params_st *pipes)
+{
+	int pipe_cnt, i;
+
+	for (i = 0, pipe_cnt = 0; i < dc->res_pool->pipe_count; i++) {
+		struct dc_writeback_info *wb_info = &res_ctx->pipe_ctx[i].stream->writeback_info[0];
+
+		if (!res_ctx->pipe_ctx[i].stream)
+			continue;
+
+		/* Set writeback information */
+		pipes[pipe_cnt].dout.wb_enable = (wb_info->wb_enabled == true) ? 1 : 0;
+		pipes[pipe_cnt].dout.num_active_wb++;
+		pipes[pipe_cnt].dout.wb.wb_src_height = wb_info->dwb_params.cnv_params.crop_height;
+		pipes[pipe_cnt].dout.wb.wb_src_width = wb_info->dwb_params.cnv_params.crop_width;
+		pipes[pipe_cnt].dout.wb.wb_dst_width = wb_info->dwb_params.dest_width;
+		pipes[pipe_cnt].dout.wb.wb_dst_height = wb_info->dwb_params.dest_height;
+		pipes[pipe_cnt].dout.wb.wb_htaps_luma = 1;
+		pipes[pipe_cnt].dout.wb.wb_vtaps_luma = 1;
+		pipes[pipe_cnt].dout.wb.wb_htaps_chroma = wb_info->dwb_params.scaler_taps.h_taps_c;
+		pipes[pipe_cnt].dout.wb.wb_vtaps_chroma = wb_info->dwb_params.scaler_taps.v_taps_c;
+		pipes[pipe_cnt].dout.wb.wb_hratio = 1.0;
+		pipes[pipe_cnt].dout.wb.wb_vratio = 1.0;
+		if (wb_info->dwb_params.out_format == dwb_scaler_mode_yuv420) {
+			if (wb_info->dwb_params.output_depth == DWB_OUTPUT_PIXEL_DEPTH_8BPC)
+				pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_420_8;
+			else
+				pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_420_10;
+		} else {
+			pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_444_32;
+		}
+
+		pipe_cnt++;
+	}
+}
diff --git a/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.h b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.h
new file mode 100644
index 000000000000..c060f909164b
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.h
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
+#ifndef __DCN2X_H__
+#define __DCN2X_H__
+
+void dcn20_populate_dml_writeback_from_context(struct dc *dc,
+	struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes);
+
+#endif /* __DCN2X_H__ */
-- 
2.25.1

