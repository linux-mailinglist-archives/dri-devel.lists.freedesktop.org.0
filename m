Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D6B3D6B4D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 02:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC946F44F;
	Tue, 27 Jul 2021 00:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623E86EB88;
 Tue, 27 Jul 2021 00:53:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZdGGOb9nrtbUTc9bYAvUoSDv4bRXRufn2FZRaITD2pIVWeSuGWel3ucy093LuTMV108nlhQEZeSzcuN1eUK+opqSM2Lr6LwfhV8vIhOlE8P+WKyKxl1bZ9iUCGdrbNg9KgwSEXLklS8SXkq8tSKMT3hl69HwdXWX3LnGPBt+724cCd6TuOUgaWclYk05UcW0a2OdMUmWMIFDH7uXr2Y1hwkWjL0VTiXAfG5VClZAdUdrCzmUEJCXt3a3AajLaLZRec0ipCY79e1R5rdqfySAlWQwdfoNfTMBRX9ghSYe9nqMn6g/QW3BGXWixd8Zw/dS4+FrQ6rAio5A/JsbBSNVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9MOcE0oPE/ddmSzhfroN+3RIIDUD0x7k3brGA/WKJI=;
 b=mIidHwV0M2P1sN5YYwD6d4ysE7x4cRyt9KJA8Y0W7b1E8Y8BlMclF3BIuk28kf9LZLIK2gBIZXKkNqX4Uu5xzZEOYztJO6hDSA74gMLpLb36/uk0zD32BbT6CXoAGuHdsalQ9nCJH7PmlAYbYWPINAxAXen2E3vsRqEEhCY+MxINzMvFQ+0s4ywMRvuyi7EIspE0gK1Lv8i2/uYX2/f25D1eYXEy3YSyB2tObwUM138wCFV84pciEQVj4d6iyLA7RZXyRPOzduU0pXy+n7oyo9QQABqcXXQF34T9BQEVO5x4jkGMXJJYDG55AI05pL5E4sbHps6UpD6+odpczwzs0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9MOcE0oPE/ddmSzhfroN+3RIIDUD0x7k3brGA/WKJI=;
 b=nZdEhy6sEF6LAIznIh86U08X+AQce0hsgB1ZILY2h3qEuC4z/JI28PQjjpirPE+kd3HVG7W60eAanC2EmRMvEntTe7sjW3YYP0a44Zl+FtDyUpcFz6L+NrIo6ePfk34tRqK0LJpxila0ls6zBkT9zg53+fgSz4Kp25IFi5YkFRU=
Received: from DM5PR07CA0156.namprd07.prod.outlook.com (2603:10b6:3:ee::22) by
 BN6PR1201MB0179.namprd12.prod.outlook.com (2603:10b6:405:59::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Tue, 27 Jul
 2021 00:53:07 +0000
Received: from DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ee:cafe::db) by DM5PR07CA0156.outlook.office365.com
 (2603:10b6:3:ee::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend
 Transport; Tue, 27 Jul 2021 00:53:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT068.mail.protection.outlook.com (10.13.173.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Tue, 27 Jul 2021 00:53:07 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 26 Jul
 2021 19:53:06 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <sunpeng.li@amd.com>, <roman.li@amd.com>
Subject: [PATCH v4 4/4] drm/amd/display: Add DC_FP helper to check FPU state
Date: Mon, 26 Jul 2021 20:52:48 -0400
Message-ID: <20210727005248.1827411-5-Rodrigo.Siqueira@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 08d5c469-2841-4c23-ba65-08d95098e64a
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0179:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB017916EBE980DF5AB90F695598E99@BN6PR1201MB0179.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CJdJ7KaF5NQjaRxIQWnOiDiA7ah3qTDIx/hPS9LmEbHh6ZzWo3Bd9e8sKCvkik/k2pBvTHK+vQDT0JJUyEHLpYLDTZVb/Ra8yMe3H0szQVDD1FUQ1ytpjdDw8k/r41BPJWHQD3dssDFYZBCsSK/sO19nv9QWTRA9VN9ilooN9XhU4zZCkfQYG3EdHmkLmfVWS4kas1ubYv3x1UxCGj7EMrPudSdhOOXDxs0r5aeWdqCsWX35GqtrJXAADqVliyj1DnIX+6XLnDxxr8Wu/popIfRsqRreDBXqP2WJ5TqUrBFyJfRTuBG6z6SPsIULpVlev9a2d0Ov9fPEan3qfsFtS1A3kA6qJwfv3dcB0vZkzSXRhLfIB1xgUprVKPIg2MSM7jM1Lfs/LIePSoxMG6yrCl/7UOLkNFzsBUlSEHK1LbSKKaX8oUryR+YZcR+gneZtBqzC+echEJOc3P/miH5SChe9ELZb6Fr2QCNqAE6bJSsI/2oe/MudBvaOysCzA3JZO7ArEoU7aiJZF2qEuD9v2cHhOOoe33BoSBN+UboP/D4k7obT50fGTfISo+xzEmB2t2OFwv3+Ao4cpTmwjTwW3GVk5a/nFLyW7YOPkIReMrhNPfVqYGa/Lq2HuUD9aC0z83ZpW233szGWl6ebSDnuOzpwx8DFc/zJ380eRP+w4l9mMOevIs0qkmhqHHYFhU1ZTuIbET6In1EV4NuUgKjKPlVeuCgJ765Xrbh/zp4GMXU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(396003)(376002)(36840700001)(46966006)(5660300002)(82740400003)(336012)(82310400003)(2906002)(83380400001)(16526019)(26005)(316002)(66574015)(356005)(36756003)(47076005)(186003)(81166007)(54906003)(6666004)(70206006)(478600001)(86362001)(8676002)(8936002)(2616005)(4326008)(6636002)(110136005)(1076003)(70586007)(36860700001)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 00:53:07.7574 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d5c469-2841-4c23-ba65-08d95098e64a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0179
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
Cc: kernel test robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Anson Jacob <Anson.Jacob@amd.com>,
 Dmytro Laktyushkin <dmytro.laktyushkin@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Jun Lei <jun.lei@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To fully isolate FPU operations in a single place, we must avoid
situations where compilers spill FP values to registers due to FP enable
in a specific C file. Note that even if we isolate all FPU functions in
a single file and call its interface from other files, the compiler
might enable the use of FPU before we call DC_FP_START. Nevertheless, it
is the programmer's responsibility to invoke DC_FP_START/END in the
correct place. To highlight situations where developers forgot to use
the FP protection before calling the DC FPU interface functions, we
introduce a helper that checks if the function is invoked under FP
protection. If not, it will trigger a kernel warning.

Changes cince V3:
- Rebase

Changes cince V2 (Christian):
- Do not use this_cpu_* between get/put_cpu_ptr().
- In the kernel documentation, better describe restrictions.
- Make dc_assert_fp_enabled trigger the ASSERT message.

Changes since V1:
- Remove fp_enable variables
- Rename dc_is_fp_enabled to dc_assert_fp_enabled
- Replace wrong variable type

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Anson Jacob <Anson.Jacob@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Hersen Wu <hersenxs.wu@amd.com>
Cc: Aric Cyr <aric.cyr@amd.com>
Cc: Jun Lei <jun.lei@amd.com>
Cc: Dmytro Laktyushkin <dmytro.laktyushkin@amd.com>
Cc: Qingqing Zhuo <qingqing.zhuo@amd.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 19 +++++++++++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.h    |  1 +
 .../drm/amd/display/dc/dcn20/dcn20_resource.c |  2 ++
 .../gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.c  | 18 ++++++++++++++++++
 4 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
index 33807d746e76..c9f47d167472 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
@@ -46,6 +46,25 @@
 
 static DEFINE_PER_CPU(int, fpu_recursion_depth);
 
+/**
+ * dc_assert_fp_enabled - Check if FPU protection is enabled
+ *
+ * This function tells if the code is already under FPU protection or not. A
+ * function that works as an API for a set of FPU operations can use this
+ * function for checking if the caller invoked it after DC_FP_START(). For
+ * example, take a look at dcn2x.c file.
+ */
+inline void dc_assert_fp_enabled(void)
+{
+	int *pcpu, depth = 0;
+
+	pcpu = get_cpu_ptr(&fpu_recursion_depth);
+	depth = *pcpu;
+	put_cpu_ptr(&fpu_recursion_depth);
+
+	ASSERT(depth > 1);
+}
+
 /**
  * dc_fpu_begin - Enables FPU protection
  * @function_name: A string containing the function name for debug purposes
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
index fb54983c5c60..b8275b397920 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
@@ -27,6 +27,7 @@
 #ifndef __DC_FPU_H__
 #define __DC_FPU_H__
 
+void dc_assert_fp_enabled(void);
 void dc_fpu_begin(const char *function_name, const int line);
 void dc_fpu_end(const char *function_name, const int line);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index 988d7c02199c..e3e01b17c164 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -2357,7 +2357,9 @@ int dcn20_populate_dml_pipes_from_context(
 	}
 
 	/* populate writeback information */
+	DC_FP_START();
 	dc->res_pool->funcs->populate_dml_writeback_from_context(dc, res_ctx, pipes);
+	DC_FP_END();
 
 	return pipe_cnt;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.c b/drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.c
index 8f0f6220327d..c58522436291 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.c
@@ -43,6 +43,22 @@
  *    that deals with FP register is contained within this call.
  * 3. All function that needs to be accessed outside this file requires a
  *    public interface that not uses any FPU reference.
+ * 4. Developers **must not** use DC_FP_START/END in this file, but they need
+ *    to ensure that the caller invokes it before access any function available
+ *    in this file. For this reason, public functions in this file must invoke
+ *    dc_assert_fp_enabled();
+ *
+ * Let's expand a little bit more the idea in the code pattern. To fully
+ * isolate FPU operations in a single place, we must avoid situations where
+ * compilers spill FP values to registers due to FP enable in a specific C
+ * file. Note that even if we isolate all FPU functions in a single file and
+ * call its interface from other files, the compiler might enable the use of
+ * FPU before we call DC_FP_START. Nevertheless, it is the programmer's
+ * responsibility to invoke DC_FP_START/END in the correct place. To highlight
+ * situations where developers forgot to use the FP protection before calling
+ * the DC FPU interface functions, we introduce a helper that checks if the
+ * function is invoked under FP protection. If not, it will trigger a kernel
+ * warning.
  */
 
 void dcn20_populate_dml_writeback_from_context(struct dc *dc,
@@ -51,6 +67,8 @@ void dcn20_populate_dml_writeback_from_context(struct dc *dc,
 {
 	int pipe_cnt, i;
 
+	dc_assert_fp_enabled();
+
 	for (i = 0, pipe_cnt = 0; i < dc->res_pool->pipe_count; i++) {
 		struct dc_writeback_info *wb_info = &res_ctx->pipe_ctx[i].stream->writeback_info[0];
 
-- 
2.25.1

