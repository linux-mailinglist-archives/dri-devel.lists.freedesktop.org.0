Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E3147F955
	for <lists+dri-devel@lfdr.de>; Sun, 26 Dec 2021 23:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C243F10F5CA;
	Sun, 26 Dec 2021 22:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2069.outbound.protection.outlook.com [40.107.95.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F3510F5CA;
 Sun, 26 Dec 2021 22:25:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwIVFAdpeEL3U+HDzb+LixLqxPLUQQKXvGdPiychd7tGRkXvpk88niWg3lI6PANPT7whFTfeJBsAjcxBKGoOrHm0fjpO1LHBztXRtFRlxqJA71h43tEepXvDJ3tQ9VKe2OHHC8tlaY8PyOBGHgAh7pLGJ1IGE6hB/EdyVQ8C6IWZBqjS7vfj5G7Jj4B9V4J3qaqgZRIg3gqbAGUB3f7y4JmVRTU3uyS2juYsRz9PpPv+Pa04Yjhi1rcwIPqSoOZo9buCurEVc5UTgGIEdSQjkXfdwQitr/f8c6AaVIBSdquqgx02bSSBUEjC+ACwRFBrMTIVBc/iSspcvGvzYcExpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kIgAxTsZOmMt/R5KguyZmOmobVdLpO5qp1KF1znmrk=;
 b=Jc4LUuoZU5bziIfSomC0ANeAhqDdzg77aAG496KYjLx8jaO5+8oSt0ZnHT7gTQ/Q6N80JG/wo45UFywDbrk2LU1kEVJciU2nuIdx2dNqCck8pcvQ59A98kJV2nY4nDlS7AI8JbTlGHUyaNvslOKPyDpK8dLNypcVMPmD9ZlH1ib2ZoBAwFYK+FK01bSnTGZfP5xEM5H1mmgBL1AqHsvab1L3mCxWJ7A2Qa8pwnwrp8aBSXUyrurIqciCvZLFab8e9Q6jLHRS04+2YrS5XYUuURSIAuamvf7fLB25e1XWA+pEO3Nknizz/P7Gb9oGUtDdmfUYuGNDa6TjTmuoLXUCjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kIgAxTsZOmMt/R5KguyZmOmobVdLpO5qp1KF1znmrk=;
 b=eK0Khe7K0G7m0E81KJPtovVe3SUXr72iJvuDYvieo+KjXp8J00EanAg3v+3qXkHQTde0hXuRj3jQPhD3Q44rj3IPrzK+q562h3wdZm1NjcV+3250lkSQAVKI9Fvejq89+kSKrugsT0FxRHR9v295bevCANSCoBC9ogn3abMea44=
Received: from DS7PR06CA0049.namprd06.prod.outlook.com (2603:10b6:8:54::35) by
 DM5PR12MB2392.namprd12.prod.outlook.com (2603:10b6:4:b1::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.21; Sun, 26 Dec 2021 22:25:17 +0000
Received: from DM6NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::59) by DS7PR06CA0049.outlook.office365.com
 (2603:10b6:8:54::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16 via Frontend
 Transport; Sun, 26 Dec 2021 22:25:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT022.mail.protection.outlook.com (10.13.172.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Sun, 26 Dec 2021 22:25:16 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Sun, 26 Dec
 2021 16:25:13 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 5/6] drm/amdgpu: move vram inline functions into a header
Date: Mon, 27 Dec 2021 03:54:24 +0530
Message-ID: <20211226222425.544863-5-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211226222425.544863-1-Arunpravin.PaneerSelvam@amd.com>
References: <20211226222425.544863-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd97427c-8bb8-411e-cd3c-08d9c8be97ea
X-MS-TrafficTypeDiagnostic: DM5PR12MB2392:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB2392834B7C70FE092559A731E4419@DM5PR12MB2392.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rTKaMbCv/c+iGOIN4OFh5N0wvVof+CRwmXRFT9/9V6PVNpSgPguVAV2lz9RXIwOeQnpbLX1NtfFUZmjRsf408+znjEIWd0QlWke4WbDkX3dHHOH/qzn0bdvLaGhLLaIdbWn5Zv2S2lJxcw/E8saPYIgL9Bk5D6KRJvVFFI44zEi+4DBLmBFRMy6Ora7ldstpGKkXKMibct/wH/edzH+03WN2D8i8mvDYG3DD4Gt1vIlmNMeQZl+2FTu+HHFT7JZ6CkoQG1APwgVnXESEwhDhfdzATbHWQ6S2iq1fCKr7+XVRf/V+YQEamfenLzxin9pKQQxXNF5MI3oRrMH4dVRnYlq2P+7FlQhrEHNOmIxdhlcKvzP/3rU285z3D+1dFygaUzkDvjq7KtdITMRC9C+39kNss9r0o+6QVM2yXZ0b58w20d5KdzG2DyO1YuW4hLg7uxKEJp+UUHzWNknz5JIWoof7mqt7UAcyHerZUcSEtqqj+PW6atqh/p4YtA0AtHPhl+hS9FgjnMxsfQ3XkjAXAVzFOHwH2dLs/e19Sv6c5AGlHBjjj9PdoLWXEVTGVNqHkCGXkljZP+tSdQN1u7yn3ELotjjjHycNcjPWQ8lP4+yLu0OCXv8fXrk4xquo477+DDwrzqi+7UV2zQhnX90Xv2BnPmUok4EE8UNoscuS/E44MUR+DV5Az3Ruph/OlY7hHr9zxehqQczpBVsNXW5vlfNH/YPqf8wV/UruHwtVBVDekPdPHXZrHKI4FL3k6CKkHdBPavh+On3m6D9SWz49yVymXTbGwvn7m483Nkuk8OQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700002)(2906002)(6666004)(426003)(36756003)(4326008)(26005)(508600001)(8936002)(110136005)(81166007)(1076003)(54906003)(47076005)(316002)(356005)(83380400001)(336012)(40460700001)(70206006)(70586007)(86362001)(16526019)(186003)(5660300002)(2616005)(36860700001)(8676002)(82310400004)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2021 22:25:16.6631 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd97427c-8bb8-411e-cd3c-08d9c8be97ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2392
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

