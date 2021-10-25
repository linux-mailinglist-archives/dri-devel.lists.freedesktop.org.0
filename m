Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E824396F6
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 15:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF1C89F97;
	Mon, 25 Oct 2021 13:01:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6178489F45;
 Mon, 25 Oct 2021 13:01:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eq0bIJzVaHJ48W4C+BQp8OmrZlXbKRNZ+idmhFso2VCjOjNjccBJMNerofr5cCadg/Fqcf1o8bxqSlslBk7WiWgMd6UFOH8/ISZ5mSriGPwaJh38iWhZuP+R/MaBgyl8DFusxZ9pRBDsTkF7ZRl6hvmeuSOOsBbSCxAe7rdVC2+t2qehWT6uLVPjjtBwCmOZk8zN8cBCDqkKvqAQUaWqSV+AJ5E19EANE5dNwZSlaCLKbT5XWsrT0JdPSHf6L2wX48nJ4TN1ii5/1+M1TGl0WvXOQa0+/Un+F/IVbThvdxFpq3erG1QqsvSMOI/nFqQEiux/NAUMNN9doV/oSHquLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ydxk5aHvIbZQ4hQemAooNnufrtff16ZiF965+fQL+zY=;
 b=kalRroWbFRfyQq7+aAGuHwxXzBVLEBgzJjWrzsAekl4knIUu2otd2Xjs1rsTJw7Zi4LEBQ15IEL4aDH3MkCahCb4ZyRA0pmTT5vEkDLPKvIpAh7YVQzdDKzyznqPzHnfnbT8aQt3J/sywadRbdG2J+ikJP+vFo01paa+CjlrE7BqtL5O6Jp/7zPj3q+z7SOM2E9bXTb7g+qerad99FUZ3JzOIB/YvNw3XG4BCcoFcfpAZHNFBDLoItxkJsGFTuk89M/ebNulQUcsh26QKoI37T1ip0t/KYo9micnqTcqpEDVIy9RU+JfgnIqzxuLaYaE3vU3scQHE0+f+9ritnS8tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ydxk5aHvIbZQ4hQemAooNnufrtff16ZiF965+fQL+zY=;
 b=Xh4vUwyTKdC3yvoQGnlkjLQYOd5EPLKbRSyOIqGcLOfSZ0C2RA4mOIMgoh0ZNwVRsEozdsR3GR2r+sx2sH3Tbo6hEr81vWedfjYM9Ji5l7Ua2rYyCTnr3O6fTjOb+0Tu8fON4ZdtwWPItNmIuSjVnuEFrXqWUgeJVO7OzMN4EhU=
Received: from CO2PR04CA0202.namprd04.prod.outlook.com (2603:10b6:104:5::32)
 by CO6PR12MB5460.namprd12.prod.outlook.com (2603:10b6:5:357::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Mon, 25 Oct
 2021 13:01:11 +0000
Received: from CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:5:cafe::f) by CO2PR04CA0202.outlook.office365.com
 (2603:10b6:104:5::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Mon, 25 Oct 2021 13:01:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT033.mail.protection.outlook.com (10.13.174.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Mon, 25 Oct 2021 13:01:11 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 25 Oct
 2021 08:01:07 -0500
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <daniel@ffwll.ch>, <christian.koenig@amd.com>,
 <alexander.deucher@amd.com>, <matthew.auld@intel.com>, <tzimmermann@suse.de>, 
 <jani.nikula@linux.intel.com>, Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 7/8] drm/amdgpu: move vram inline functions into a header
Date: Mon, 25 Oct 2021 18:30:30 +0530
Message-ID: <20211025130033.1547667-5-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025130033.1547667-1-Arunpravin.PaneerSelvam@amd.com>
References: <20211025130033.1547667-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30e63cff-305b-4e0e-b66b-08d997b7852e
X-MS-TrafficTypeDiagnostic: CO6PR12MB5460:
X-Microsoft-Antispam-PRVS: <CO6PR12MB5460B643D220528D22424447E4839@CO6PR12MB5460.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YH5dPTuI+9UpthtM1Wg6oVM22s3LoJ/l3dNyacGmc/h67lHEkAlr04UhFOam9fwwWlVuqcnJuedEzTQ6r/HcTalj7ThYiJTDlSSBlLrrmAWgVV4IbT+RoSwzZUp4Rfj9GaNgrtZ+l1Vju6LMldLfwxPd5kc5+OhqWzdS83TQWaj8iHiFv+ob43Rxv/GgHTrXcR1t8ZKzwCo2UgH1zmM+ojJV1TIQvRbRsK1zGgonkaUflW+mpeacuc7frBhMbY57cjA5hOkh7z7YJUaW9VLe7SbxI8MwY0WVQxWNxbpMcjp8sO4LDOD+S4FRFLrjx7RogKdUpqwuID16sLV/pKAVBOmHNC3uOw6iSXJkZ6yHnkGVuRuKjo2k0TKZBWKOvlh6bFlXX7St82EI3aawLdzyoNcb7oZvi4p8402aWAytut8WjyLIV6cGN/Jo1vF9Rjrzf6YL+sVF08NnH3cJAtYdIrNrYNd5TAZ9Hb6VvPD2ROkjJft4h7//gYGHCwb5cJNHSxJQXnpvXzUKQSS7vu4blUiKWNOnz5yqJyhn+ok764RpMnoTpu3IV7p4wYEuaBhVqcAScBARTps7Y2ia2pnkBpbXRfjetDCKcLDRU0ahowMDUv3XluKYbCXkXCwUJUncrSkOsZIVyUvKwqRu6xLSeREuJGBi063Ixjho1KbUGwYO5EdzuFjnIq728N4JyO2VdcRQLkpUMVadvm3Gj9MxpwUF/a+MnRAm5t/whgaXac0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(26005)(54906003)(186003)(36756003)(16526019)(86362001)(6666004)(426003)(81166007)(508600001)(336012)(82310400003)(8676002)(36860700001)(1076003)(70586007)(47076005)(83380400001)(5660300002)(8936002)(316002)(356005)(110136005)(2906002)(4326008)(70206006)(7696005)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 13:01:11.7357 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e63cff-305b-4e0e-b66b-08d997b7852e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5460
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

Move shared vram inline functions and structs
into a header file

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h | 51 ++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
new file mode 100644
index 000000000000..32cd6f54b6f3
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
+static inline uint64_t amdgpu_node_start(struct drm_buddy_block *block)
+{
+	return drm_buddy_block_offset(block);
+}
+
+static inline uint64_t amdgpu_node_size(struct drm_buddy_block *block)
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

