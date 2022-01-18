Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE6B492409
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 11:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD96112A12;
	Tue, 18 Jan 2022 10:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23BD11217E;
 Tue, 18 Jan 2022 10:46:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QgR+rLKKjWPV4ykuesQdsSHar1huHl1ZTgdX7adpZ4Y2CjNcJPu/VWnkgh1iqP2gkHNcGabiuCA0TxFfIbIEmhl/ERyOvoGcvHFnxGNHX/ywi4yf8QDlgAa8owuDwtjKS6iKvQ8703gIEwJNWDyQ/XaQZo/dTv4fLTgl1eTvIVYT+YYkAPtHNlwmOdMDvshI+HpV4D8GtF2zOF9SMUVVjt4yzepfojUDonkcpgDx2DxJ6rI0Vf+wPTMhLKiIOX1FMCp7MfSbEpU3w4GOJX3E0idHf3yEk0+5RJYd795bS8XhVsK+vNpXKWaOiTnKp2Vyx6GOqfTlbOteEm23QewWsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kIgAxTsZOmMt/R5KguyZmOmobVdLpO5qp1KF1znmrk=;
 b=g9gk+PJOOUCUvF5rbKOYd2jP5bw3fCDRAI8Ogc1Qbe+AVpqE7zKIp5jhbmo4Zv4HZQJ+ArRew87z8G1pMcbrwdYYUjnCXuVD6u97EPkGMrn/f5l6yquMsRee6UZkCdlUf5i4uPOm6lD7MU0UAtfZhSvHZ38GS0XNRTuSrCOF7XZQiHfqZXul3T7xn8/aVG4UA8hncjovzZHVvRZdyPNN4+BgqP3KnCcmP1UthFwnN20Tm6E1RF+zQoRM/DDSXEL9wY655HTq7DgBClGYLiI+oO9fYvX3Lc8VKHQsELbue04r7e4e1VZwsCelxYM4IgNbOAfReRJGGnMlkynzn+XcVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kIgAxTsZOmMt/R5KguyZmOmobVdLpO5qp1KF1znmrk=;
 b=ie+1gplT6tct9SO8BPPEYV4NYDTkmYj8cPTmleYtMBHdZIekRmFpD1lVmtxLFWn6sbNDPkkUau6HfIa5RrznLZjET8ub4qPMqOrU+WkedM0P4RshqwM1QGrgxAxgPW3ZotvGVZwuBjyDr0MwQSL5wd/8tvSlDJrxPww69xmbKT8=
Received: from DS7PR06CA0033.namprd06.prod.outlook.com (2603:10b6:8:54::15) by
 MN2PR12MB4581.namprd12.prod.outlook.com (2603:10b6:208:260::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Tue, 18 Jan
 2022 10:46:07 +0000
Received: from DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::86) by DS7PR06CA0033.outlook.office365.com
 (2603:10b6:8:54::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Tue, 18 Jan 2022 10:46:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT051.mail.protection.outlook.com (10.13.172.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Tue, 18 Jan 2022 10:46:06 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 04:45:58 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v9 5/6] drm/amdgpu: move vram inline functions into a header
Date: Tue, 18 Jan 2022 16:15:03 +0530
Message-ID: <20220118104504.2349-5-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104504.2349-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220118104504.2349-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f0713c8-df43-46f5-facd-08d9da6fbb63
X-MS-TrafficTypeDiagnostic: MN2PR12MB4581:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4581CB76FB42B2F6D3C265ECE4589@MN2PR12MB4581.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Zo+7FRZrjwDz/dIR7hrm/Zjindt7e56dIu3Ef1DJZiU0oxYlQoQ6xux5DwPXGLHMtvSJLBM6/PYCAxeuOJKLKEXAItLtbQYKD/JPgl80aQ51bePxmweEJ2HoDymXr0428QcIfhwBXRpasSwTdvHRIjsqujpSPT/qyn3NAI8Z1a47HeS05xiD6A5wUCIHgTxpYSxQ1eeHZvwXTNhVj85+RAedg4QrhtyOd/AjegcIep9+4W1rh8rytJZrGHpsVgJxolAC9gRmzuir1a5RMZGJlADlMFw9g2nOTUmsJZv1EwNy471zmV3D1YxcdEtrgGbhACB88UAPqBXGANdpIF0vRFGM1Bwy5gaVuDjKTZNK1EgDqPs5QxHwce0sSwtFi7Ee/epYbRK/uOMVUz1iF6J8T2LkqK2Ww+bWzunoZFUncDKC9PHKLfCuxhtYO6DyD2o4qpvzj+XAwzKq2gFw8N9u2L4US5NziGZGUD4ZHkQc5KZ908P/VC3J+DSM1c2ejlFs/ZePG6jrfof7gfDPlFTH1x8h9gJxxLxurPiQt9oPqdMn/voWt147UHXX9b3Q+JkEonFBf0Yn22HI/+1iqcvLpjuyx3mGbCpSZzxPrtgQhYruPQ4Y1tl44LUBw4Bjb1MOyX9DnMSpBGS2Te+C0FC5EpgxGwVtfrGift/+fUHwAAux+rajkEoJ1Gr87DYHaNSJpkjYeocDAEr4+sMoKtvbU0jZ4g7GOHgsaDPc/l7CzQm+XuzF245D144hllYdxFET/AG0caAtwWbW9geoHPjKFYaNLbN+4B1CWBZNHwIlik=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(46966006)(36840700001)(1076003)(70206006)(70586007)(54906003)(36756003)(8936002)(7696005)(5660300002)(356005)(2906002)(6666004)(47076005)(4326008)(186003)(426003)(508600001)(16526019)(26005)(336012)(82310400004)(316002)(83380400001)(8676002)(40460700001)(2616005)(86362001)(81166007)(36860700001)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 10:46:06.8658 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0713c8-df43-46f5-facd-08d9da6fbb63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4581
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

