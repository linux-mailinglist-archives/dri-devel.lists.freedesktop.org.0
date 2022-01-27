Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCC849E448
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 15:11:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417A810EF68;
	Thu, 27 Jan 2022 14:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B55B10EF48;
 Thu, 27 Jan 2022 14:11:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRS/JJvnzmmLixIgNS6Bxo/wapS2kwsvu6KLgnkuVCTwssEOIbIeqOf/fE8Y4wesluW/pbFuxkj1E3cfx9vHirp5bV3ca4MD/QQb5koYxwpyu/iPdJ0G4qoarjZpiTSn2f4UH/WaHoNfV4EYBGb22VfnYofdOQhbsNg0B4tPujxtBrr2DBOOFguxH9MoExSgB9jBSN+S+XnN4yIBcpkj8wWRYZolCe7lc6UiwNq/QP/B1p8iY+t0c/x9z6mElYeMz+JBXDwQqOB1+nnnxv7mlmpoWasaSCLPMEMGrY8bQqQbj01k4n3sujP1m+e2InIvElmkOMB3a5vm2OZARuYkFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kIgAxTsZOmMt/R5KguyZmOmobVdLpO5qp1KF1znmrk=;
 b=f2dBPitnXGYaIXXkcdUttqcuhtuZkMqz5EjqOqATu7YYZGm6yWOrDjanpMZxB3Zv3bRCF6OLmOQvmNQs2lRv/ySvy1ZYFsL/HKyf40vTV+fxruatuixl3eqbbZiXSzgD86sYWlwrdPbvfrJ6XIt8R8QzauNJu92BY1grKPGRvpZno3V4bQFlBlhpxtsiNRHGl/+Xdgs16yATzO5X8uLSRRCCFBpih9TEofOO7RcdbW8Yc8B2OaLfyG4SQjV4/AxXj0rpuzMsyt/1zKgFsUraHXX4ZMAB/5CPvlLLyZqUZlgh9gGzm9n3SsVkUUs+HXw17ORn2q/lZ6AMkngyBAabbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kIgAxTsZOmMt/R5KguyZmOmobVdLpO5qp1KF1znmrk=;
 b=Q3KUMYWCZcL0M9q+EE9gyRh/xPVKhmc9ytdjODfHF74j091a9dBTdV9GxxI1bYxFb6qj4hPVnqLAYnnc9Djp3RQTh/6mmT+g3NiXvQNV8ZXmsNwRTY8iRMFxWPj3TprPWKPjyK/9CYivriiDKkn4OZbAza0QS76OsBll9ovYLnE=
Received: from BN8PR15CA0046.namprd15.prod.outlook.com (2603:10b6:408:80::23)
 by SA1PR12MB5639.namprd12.prod.outlook.com (2603:10b6:806:22a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 14:11:38 +0000
Received: from BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:80:cafe::fd) by BN8PR15CA0046.outlook.office365.com
 (2603:10b6:408:80::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 14:11:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT040.mail.protection.outlook.com (10.13.177.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 14:11:38 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 27 Jan
 2022 08:11:34 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v11 4/5] drm/amdgpu: move vram inline functions into a header
Date: Thu, 27 Jan 2022 19:41:06 +0530
Message-ID: <20220127141107.173692-4-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127141107.173692-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220127141107.173692-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81cac118-be08-42fe-af24-08d9e19eef1b
X-MS-TrafficTypeDiagnostic: SA1PR12MB5639:EE_
X-Microsoft-Antispam-PRVS: <SA1PR12MB56394C04A8177CE26A2A47B1E4219@SA1PR12MB5639.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7WdFjdWmwhyocc/cb2/C2gmhxu6IHxS+nwJgTwFIE51FG7VemzeufG3iMLvOhtyn7aa9ffANKVDXlJNySReSKc1oVqxYsRyMsphLJFKgusMj7HVf4uGWYT4NEqwhcyQGVuEA7f+oNb+qS+PtkQ3STXmzfYPa92CrvEKkT3qJDISBOqtzkiyz8XLnGuuwP4X8aY5d2SX54zl9fg5q9rGipu6pX3kC7Mj+eWtpvmbo25VujEt+MxzTIAjiDYwsevzB+MnX6BCJd8dLT+inFpUw/Cbrncri2sOss3uF2Hg7VRm8h+dJ1lV0KTFFlVbAet4QLrSWsBEBzZugCKGOzlQ3ksSclqyNb8+BILwvLKkVKABK/96W20NbN32Bmx2fa9v6BmaK9hfXpd5qqiD29139czlQN3df5JBkNMisnn73n3B4oSAGU3NiGPOpvOhbF2x/2Iq0TmUIK1Qy7Ipd4GYyP6rCDwFhPFBqu75GEkvodehho5KEoN46qpWgv5yU9U7qVU5bQY8WIczE1xx+iHS2cBleRqyyawhoMHxwzewIOg5TbfqDYqZdL00DYaPbC0MNHpDF0sfpB/F1zBED8BQOr3Aih/Rc5rWv35Km+CWMZ8Hnu2vhUzkR/RSFTBKmhRlmcJyJ8WC0uuAXQEAnxyhNOg3T54EaU/cS17TLEcoDuPitWjNoSFddcUnAQhwiT5OAWC7EE9MMcUxIhr6BertcgQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(336012)(426003)(356005)(36860700001)(40460700003)(36756003)(81166007)(5660300002)(47076005)(508600001)(2906002)(16526019)(86362001)(316002)(54906003)(110136005)(70586007)(83380400001)(70206006)(4326008)(82310400004)(8676002)(6666004)(8936002)(2616005)(186003)(26005)(1076003)(7696005)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 14:11:38.1662 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81cac118-be08-42fe-af24-08d9e19eef1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5639
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

