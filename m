Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E96A347F8E0
	for <lists+dri-devel@lfdr.de>; Sun, 26 Dec 2021 21:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791B010F228;
	Sun, 26 Dec 2021 20:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D01010F224;
 Sun, 26 Dec 2021 20:53:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lO810mobr20uDoVZDePvDuiNBpbGxO21/13YYRyz8tqm/O44q718cuL7SizbridovDJkx8dMtRbWn6+a/lp3VowPKPTByT15VDQJdfLNyHoqB9NiaBMQwTb/mD89Q9vWEnSRZBrHpsGfdasiab+FpH3z+9Wj2mbcJvsM+Kv07zayP18DIRXTSTkCpiAz7NgJZKeaMIG7TbEfdj+QVt/lNevKzLgr8y/CETZyy9XU9mQ8TPbcahLY6LRnnN06+ysireNEaYKgDKfBCSnTqlUJJuQY+HH1iWuHNVxDKkGAWHJC9MOS1t9be6fma8K6mZo5jOTxShG6atdfneqiopOc9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kIgAxTsZOmMt/R5KguyZmOmobVdLpO5qp1KF1znmrk=;
 b=e22CvCrcN2vSfe5s5OGuWBaTdwDDu2QagiuAKeqwBrkOPMEbE30m0vDlZ0uk7rM6h1Ynf/Ty9Lj+uWND3PFaFTyDlYeQPvCPjP7vFUMphdGMtGiOdUmd/y/1GRDCfa5d3r/Hlu7QMLq8Ve5gJiDR7kEu/OKh8FO5EALdtuH14lXpmdsdBv044LY0b5LidejwLmiZBwZ/tABTQwWj1ZnJAbyDQcOG+aupuQdigTL4wXSOEqIzXimEp/8kOMRfMK/TTIvhC8IlqkUKf8alHemsEEsikLqhOE6StZr+xSGv2P1HrM0k8SAzEHFGuix/uLsYPF4fxz69OiBEuZT4ZaiclA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kIgAxTsZOmMt/R5KguyZmOmobVdLpO5qp1KF1znmrk=;
 b=BJzniEI+5SZAfsIIXn2N0tpmNyuEZ1+P/2v9Av0QHDvbI7de8Dwv8+gtewgYbbueuc5wgICynpXTkvyKowxlHT/H2PnAxE8/ac1GvF86RYxB8cAw/QUOai8myiM7csbOKnZEaBu2E+B9IbdViQL2GWq5DyA8RfnE2UX942V3sJg=
Received: from MW3PR06CA0024.namprd06.prod.outlook.com (2603:10b6:303:2a::29)
 by BL0PR12MB4739.namprd12.prod.outlook.com (2603:10b6:208:81::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Sun, 26 Dec
 2021 20:53:31 +0000
Received: from CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::e0) by MW3PR06CA0024.outlook.office365.com
 (2603:10b6:303:2a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18 via Frontend
 Transport; Sun, 26 Dec 2021 20:53:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT030.mail.protection.outlook.com (10.13.174.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Sun, 26 Dec 2021 20:53:31 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Sun, 26 Dec
 2021 14:53:27 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5 5/6] drm/amdgpu: move vram inline functions into a header
Date: Mon, 27 Dec 2021 02:22:34 +0530
Message-ID: <20211226205235.142049-5-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211226205235.142049-1-Arunpravin.PaneerSelvam@amd.com>
References: <20211226205235.142049-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 789c26c6-b1e4-4eee-efe7-08d9c8b1c665
X-MS-TrafficTypeDiagnostic: BL0PR12MB4739:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB4739BE85AA4127C20EF471D2E4419@BL0PR12MB4739.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vwv3MD6BCV+EldPT7FUfYtRFok8t/LMBiz1m54BkcEZN0+vuIAOJddkFP1FoPgrtzMDHp5K70vK8Lbyd1J4KntwYzTMEIAKgqjO+Qm+S9OGXOopPnH+2kXf+jAsHW/RzoMCCk9IVSQYZU3rr64w8ggdVluKsV/RZ2pUnr6+PL2BQYrjkklVaWmJtT5rHAPBxj7m7D1nZ5t95Jkh5crGOzvc0+ZegJdcf0vQjRuN9CK5qeNY+fdgJ9TtxeS3viDY6QFU4bM0OHGT8jY1RhkDsVdSXJAPBREMXZlS9tdaxjt++3vN2iMAWb23BzZDyx+6JbXcNjWyfrzcyZPwvxT9gOfbdTpbDaup3N6JaaF5pej9bbE+d/Aojno1o8U1RoDq5Wjw43xU9nDJoRrqfQW22q1iiwRZKBrLEo85etwsDjb94daWR4HygEODq1SpKeLmJt4F1Kvr7t4kaDSJPSaEX60oPwftHDw7w3xIL+O4Ekhj8O+2uILA610Rqp6IueT11RXBXJ5ZSZtrJGCCcGSK0HVqxxr32UQAZffY+keiLzFxnWSqFvsSvelRs9pP1f8REjs4NyocW4B1lE3GcswPC7ABZ5tIsaIESN+jNph3ZEn0y83YRiUvr9H8WM98tkjPr5NK18TUCija3bfF5JassJkW31dpF6aNoIZ6nzLetcF6t5FLB5bZDmNFHqC8GbMpdycQrmE4tjh7XKwEvayc+q7Z0peeOAdJFMG5dpNcCsm8vpq/FVxS1GA+Xv5wDIT4pms8+fM5c1+jwr8XazBWbfR1htcDlo5D28rtkzEdf7Xw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700002)(46966006)(110136005)(54906003)(4326008)(70206006)(2906002)(70586007)(16526019)(26005)(186003)(82310400004)(1076003)(40460700001)(426003)(83380400001)(81166007)(8676002)(336012)(508600001)(47076005)(36860700001)(36756003)(86362001)(356005)(8936002)(316002)(7696005)(6666004)(2616005)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2021 20:53:31.1253 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 789c26c6-b1e4-4eee-efe7-08d9c8b1c665
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4739
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
Cc: Arunpravin <Arunpravin.PaneerSelvam@amd.com>, matthew.auld@intel.com,
 tzimmermann@suse.de, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move shared vram inline functions and structs
into a header file

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h | 51 ++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
new file mode 100644
index 000000000000..59983464cce5
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: MIT
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
+ */
+
+#ifndef __AMDGPU_VRAM_MGR_H__
+#define __AMDGPU_VRAM_MGR_H__
+
+#include <drm/drm_buddy.h>
+
+struct amdgpu_vram_mgr_node {
+	struct ttm_resource base;
+	struct list_head blocks;
+	unsigned long flags;
+};
+
+static inline u64 amdgpu_node_start(struct drm_buddy_block *block)
+{
+	return drm_buddy_block_offset(block);
+}
+
+static inline u64 amdgpu_node_size(struct drm_buddy_block *block)
+{
+	return PAGE_SIZE << drm_buddy_block_order(block);
+}
+
+static inline struct amdgpu_vram_mgr_node *
+to_amdgpu_vram_mgr_node(struct ttm_resource *res)
+{
+	return container_of(res, struct amdgpu_vram_mgr_node, base);
+}
+
+#endif
-- 
2.25.1

