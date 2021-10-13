Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFF442C193
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 15:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC1A6EA4D;
	Wed, 13 Oct 2021 13:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65DA36E861;
 Wed, 13 Oct 2021 13:39:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qz/8r8UUXKeFfkq4uujrR1/xJizo9Ru4zlDG5nZRiGMuPDTUV0n9nTCpdghcVL3Ah/G20WncxA0XZmAxiblljqN/dtZpxDqxB60oAk7mS2O2reDLWANAMoxh8iudUphmdsVTcTa8yH3JqYwQ1WmT1NNVvU1irYSQyC0j09fTKN0dlfVFFGZcaqsXNuwCvUBzqbOGcWmk0bipCwr2ssrKcUYqNMCcrw3R6nmlUCdQk5up8Mnzxhejk64VI8iNyXZsd7YDXPtW82Y5Dn9cQtihV7swLQTphAQHx1NZe4NrbwdnDAntSgd8ANrfADPrhEo89qX7q/N2kvJ8BLZDDjRheQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/bXC7Ju/eejN5OPQAJhpb1Y2cvllZ4q6iNZMQw1dWc=;
 b=BVpZK4UdmMbjndJbHd0E/DCA3CQM7Vb4vLFYzmhRN6W3JPr2GgIMpggOejhfUHZnn+0FhxO1wk9WbX3jcgEmOrZaSn0HKF4nSz7rfZk3lqcHih+zh68qMSm0Dplfj9fpNRf1+MRJZTYn99AIonY+EBeqESyZcgLRbjOMSuEj5G774F38MopPu3nraScBaqUYJH4IEyV2T4rjbuDGRSnP1YD3taXN6kA/2m4YFIGwpYh9mS0obkF2mDx2MQ0ZaN0Xbk/alRRMhpHtv6/Nkqw9g6tNUnoQyKjYARXDPUs2IngiIcZFsnoiUulHcvoI3M6NsXtsNDrqghljJzLwNPu+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/bXC7Ju/eejN5OPQAJhpb1Y2cvllZ4q6iNZMQw1dWc=;
 b=05vNzIj/M5RlaEvC91tgmYkMptmlt4o5RWLxqFLHk4W7rz9/sSgWPlSCozm0AOJRC/KTKAtjlLkot40JdNGu5Z6MQDq2ZulMY+JIMi8lNqFts6PfnAbsTB8y43GPGk0pm1WUFFcHdUVMkE0fh+72tiD98XKb0Sl3k7HYPdVoefc=
Received: from BN9PR03CA0321.namprd03.prod.outlook.com (2603:10b6:408:112::26)
 by CH2PR12MB3845.namprd12.prod.outlook.com (2603:10b6:610:29::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Wed, 13 Oct
 2021 13:39:06 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:112:cafe::52) by BN9PR03CA0321.outlook.office365.com
 (2603:10b6:408:112::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Wed, 13 Oct 2021 13:39:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Wed, 13 Oct 2021 13:39:06 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Wed, 13 Oct
 2021 08:39:04 -0500
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>, Arunpravin
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 2/3] drm/amdgpu:move vram manager defines into a header file
Date: Wed, 13 Oct 2021 19:08:37 +0530
Message-ID: <20211013133837.143101-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ad8e696-94a8-4fa7-276a-08d98e4ed406
X-MS-TrafficTypeDiagnostic: CH2PR12MB3845:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3845034AB85518D347F5C8C3E4B79@CH2PR12MB3845.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U+aw/pQ0XjBMuJZWAtoeutN/VHL9jthkfi3uvIEpmGjrRoPRXV9oZte/I0Qqs1T06c94K4sLmlCOL7rq15J6A934aMoFt9ESdyleeP1QlFM3EsjrP0ryLRHiufpTe2wwnf7V9lRrhJ7zIB6JHqvx42efmHa3cfYaMPNmZZ5t32zI1bQtmzpucskuOr8mOZ9ba31r9joYRMHTq3oqCAR5FCwV9/SJ8KgRhWeMdcrGMC/yGsGz/m6ekpJwkflOMWBNYFV8w1cyTPP5Yf9ClE2HOYpHLSmNa/tZt3VncULEj0QGA8TIr6Vfd3wnCrkCnn8t8HNTz6quxwiPES5BGeuj+IItjYZIuJibWmqcJFA21jWTjSH/v6soqtizt0XvJAQTHjEDx0MPN4Sn094a2v+oV1NykfyEEprSJIV00hjsKFEB3Zj75Tv6JeH7LBIrKSrphoCK6r2n74fIDY1WYBszxQxV7z6fxytL/4wgGj6zIs+oKKrTXAGikBkKaR3/uERfzCj1r153+ZsIgr3ni8YNHf6DCnzTFK/QjpUL7lKFIztX/ZFjlfyUvVqWJbW2lNupazW4bnJ0L6PlzI5NZMYmo9eoLdeltw6akNWebpBWpGxnesRNyl21RkcxIfDEATvhEpyVkTkL5rpB88reEmU8Z/TmKxvNmKSQopLENkQS1ShiNL8PhLIRDflTbwQdpQLtLigkrHHYDYdgwSHW+aL0grck3Av0Eu3D5O+KdFRvxps=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(2616005)(1076003)(36860700001)(81166007)(2906002)(450100002)(336012)(83380400001)(5660300002)(508600001)(86362001)(47076005)(6666004)(426003)(36756003)(4326008)(16526019)(110136005)(54906003)(8936002)(26005)(186003)(70206006)(70586007)(356005)(8676002)(7696005)(316002)(82310400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 13:39:06.4302 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad8e696-94a8-4fa7-276a-08d98e4ed406
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3845
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

Move vram related defines and inline functions into
a separate header file

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h | 72 ++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h

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

