Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 679B74341D0
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 00:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B046E201;
	Tue, 19 Oct 2021 22:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2040.outbound.protection.outlook.com [40.107.102.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1766E1AA;
 Tue, 19 Oct 2021 22:55:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCp7hemSFnETOlD+jtZUSIyo5g/J9wS3KjNkfxsgs1eV9GB7N3X05lnaU7irCRo+tApfHfkAwskhwP6xj68mSbyxinwV4O/1GGRlw1YrS5cN0pZR3KLtnZXNIHpO83/m59vmgUPHaZvp/w1yqG6+6Yy/+ePcylte1aIr6TQt0aMZBdRYBAwpFkrYzS5evjU1Ac/n9JuHYmFQZRzU6euIu4H6lctS2HDErL8Wvai3IbDTL1eJichDqZ00QwuD5LlLOXNjmCXxXKNCIA1PL8wzEz0Pwqa/FgUZCkQY7Kr6A9UgwjQm1EcI9P0neEwwou0TwrS+G0AZd1tDiW0/skdHYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZ+CyI3y3SClURoNfvSSfgDGivPmeGfCjCpQQqyIqpo=;
 b=a2k9LzNmatjWN2wQda0Fi0w3S+SlvkfuL2fbtMuwSRDvcC/2/XoPN5yO7m8wPRLM3XlAq2M5YizyFUM/oXMvwz4DAWOvQeYxV3ivYcywow+UOJmOIl0ahOc/EbRyDarsaDve3uFZm/MH7vBsQBsUfqnDzEy9rY9Tr40dVOQJDmyy1LsJf2y1ob5Ey4gOIbQ3Ra8dfczPmZWlZ/jgn/F19qqkjGqhj9UhFwWD2VYOhHXMTiBaILjx2XubvaWpTeYT6zE1HROU/gUTiFJcca7cC8AFEK2+D5rFkRavN7Sr4pAcOxYhJ/ELkeM0I2g6oJSVpIE2SZC11dIqNC8wx329HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZ+CyI3y3SClURoNfvSSfgDGivPmeGfCjCpQQqyIqpo=;
 b=CoxSSqQRNXWCage22CrPUyE0oylXTtOU+ztNAYixPokxA5cerW6IqIH+wliZrWNLQvDgvrz7MaT7A8dxcNVNKqK4bPavPkoF/jHnVgDI0TrZFFsTXaWdbXy8I2Y9QZ0yfY6Gbr+qjwdTZt/obUDB6ruHdh+xD2XZwfe9vnpS9/c=
Received: from MW4PR04CA0249.namprd04.prod.outlook.com (2603:10b6:303:88::14)
 by DM6PR12MB3738.namprd12.prod.outlook.com (2603:10b6:5:1c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 22:55:35 +0000
Received: from CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::61) by MW4PR04CA0249.outlook.office365.com
 (2603:10b6:303:88::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18 via Frontend
 Transport; Tue, 19 Oct 2021 22:55:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT009.mail.protection.outlook.com (10.13.175.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 22:55:34 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 17:55:29 -0500
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <daniel@ffwll.ch>, <matthew.auld@intel.com>,
 <alexander.deucher@amd.com>, Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 11/13] drm/amdgpu: move vram defines into a header
Date: Wed, 20 Oct 2021 04:24:07 +0530
Message-ID: <20211019225409.569355-12-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019225409.569355-1-Arunpravin.PaneerSelvam@amd.com>
References: <20211019225409.569355-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd59ef77-8e20-4b6e-ee4d-08d993538f98
X-MS-TrafficTypeDiagnostic: DM6PR12MB3738:
X-Microsoft-Antispam-PRVS: <DM6PR12MB37385203EA4DAD6701E10BF0E4BD9@DM6PR12MB3738.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ub3rBAlRofZKYGpU3bF2afcgsPJ04qfTAxsTGDY7f0xHf0TT2tzfZLNsx8T5VBCsh+lWlnnvbOf95aCTb6nKcNKu6FsaorZM6takkiDKmsWPkwVrZTczH1TEBAxi12x8zpMa5wjXwzgt4YG7lTDxIh8n4M03jQVA9ucupS+1NXgPyDJFDjb8uRofJRauAMsZSvx8qfka9S01/0f4YlcBp0Fk2NJc74mQBFi2HTgnajmh/r22QFciztjfGGgeu/VPm8qLHwjKYtQnWwtpVIfe7x+2TLJKWpIHfG4AdnSZ5gbaCGyiVFzfKGZhBE4S011I72tdP61/Kva926Li8JHR1BOAQu0yLqTkHhdPTbv2WmdvV69KSZcbf2PoLp58fjFOK+YrlfYL4HjUKnKhoIgkzvgDgikU3BZk2TOzixbWKoQYsSUBDCjInzH2UsgFwhokFXBpKMrWkUtbKcfWVtHtE6yzNHfT0tVe8lkWgoNDmr8pc+lwDfJJPfKtfFR2jFBH/wJxLEcgUyXEq+rxC0AV0JYwmji9OF4xCpFXBOvHNYk1wApJpMeNTKrirgfn1x7DX2H1K+EGKBr1WkRU2f/nf8iP6Cux8qST0f9gea9knY4zksgRdaCyaAWAivRL9alChXI/cdmeqT/mBuytKI9OJnuCSemRexQ0Bjgffg84dOFZFipMq5rTZsekaNAB426RyJaV6YQ4beQY1exrMJIw9D/tv0up7bi8ZhEWkgR0E3w=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(356005)(81166007)(6666004)(336012)(8936002)(70206006)(26005)(7696005)(5660300002)(316002)(83380400001)(2616005)(426003)(508600001)(36860700001)(4326008)(70586007)(2906002)(54906003)(16526019)(47076005)(1076003)(8676002)(82310400003)(36756003)(110136005)(186003)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 22:55:34.8577 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd59ef77-8e20-4b6e-ee4d-08d993538f98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3738
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

Move vram defines and inline functions into
a header file

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 18 +----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h | 72 ++++++++++++++++++++
 2 files changed, 73 insertions(+), 17 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 7b2b0980ec41..a9182c59907a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -29,25 +29,9 @@
 #include "amdgpu_vm.h"
 #include "amdgpu_res_cursor.h"
 #include "amdgpu_atomfirmware.h"
+#include "amdgpu_vram_mgr.h"
 #include "atom.h"
 
-struct amdgpu_vram_reservation {
-	struct list_head node;
-	struct drm_mm_node mm_node;
-};
-
-static inline struct amdgpu_vram_mgr *
-to_vram_mgr(struct ttm_resource_manager *man)
-{
-	return container_of(man, struct amdgpu_vram_mgr, manager);
-}
-
-static inline struct amdgpu_device *
-to_amdgpu_device(struct amdgpu_vram_mgr *mgr)
-{
-	return container_of(mgr, struct amdgpu_device, mman.vram_mgr);
-}
-
 /**
  * DOC: mem_info_vram_total
  *
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
new file mode 100644
index 000000000000..fcab6475ccbb
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
@@ -0,0 +1,72 @@
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
+struct amdgpu_vram_reservation {
+	uint64_t start;
+	uint64_t size;
+	uint64_t min_size;
+	unsigned long flags;
+	struct list_head block;
+	struct list_head node;
+};
+
+static inline uint64_t node_start(struct drm_buddy_block *block)
+{
+	return drm_buddy_block_offset(block);
+}
+
+static inline uint64_t node_size(struct drm_buddy_block *block)
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
+static inline struct amdgpu_vram_mgr *
+to_vram_mgr(struct ttm_resource_manager *man)
+{
+	return container_of(man, struct amdgpu_vram_mgr, manager);
+}
+
+static inline struct amdgpu_device *
+to_amdgpu_device(struct amdgpu_vram_mgr *mgr)
+{
+	return container_of(mgr, struct amdgpu_device, mman.vram_mgr);
+}
+
+#endif
-- 
2.25.1

