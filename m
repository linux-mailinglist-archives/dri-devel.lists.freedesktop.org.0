Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8DF4341BF
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 00:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA9F6E117;
	Tue, 19 Oct 2021 22:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 926B46E0F6;
 Tue, 19 Oct 2021 22:55:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxfgI07yODex9MAC6jPk13+7bhHIaewD7Xu01Iuvc3gNuYt+X4FTkC0P2JWAu/427Kzn0hXbuTfZBslXlfSglmntoALNzFgud8SZnImM8RXnrd0rCp3ch6IjF8qD8KNsb2A8PTWsy2hR2idLevm3NsuSoVj+F4n3e8amM2SAylF7oJjq8qHUGSzi/+8FvnLL9DRC26rUJ314/yOp02lRsJoekQwqBaIrIvvW1Mi4yUniRPKpSN8Zb1GV6Y1oCoNYuTO1vfdXSPGr/u/i9xCdF+Uv9sB/eaAov4SgJd51/idUurpun9hbYsN6W/7Y+kPY/kYW4Fkc65StsWcQOajNeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PR1hi6cbAgcHWhJM/cwXFQ66oufHsToJdCJ1J7zr14k=;
 b=Zi1WoN/rlGyAj64AOHsZc7CM1LaVhJbHXmUa6DBM0RgVfby71U1tEGyummISoFCbwMJIoWxE/yC0Kf7pQWruqCHMf88QaLncsbJTH+3yb9lfWajH8ce9bouSCBFtVnXHFLFl6lNkkYfzASWxJCGvl02AiYj0Cg/5KtJul1dnKAuTwF72xqwQnDbQ7MyWKpnyxNsKJ1nHxpzSqkWgsLyIi9/O4IUsE2OnnOs2671yaIAsYTwfYdFWQfpL7NQuFOTkg6KxSrS4iQWXAU1bXF1/o48CZcTDKrIyXH69ipzH93OaBHeUk5BscVPkU9ExpgE32KBYSpWw8E9e8dox6y75DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PR1hi6cbAgcHWhJM/cwXFQ66oufHsToJdCJ1J7zr14k=;
 b=LYbhAxng1fgsHvIQ9veHYvWP/xBB/nmsjyYf7etIzPlBbLZfiiK8myP9s+TIA9Vx3JYOR6IQzyhwG2xpziSI8n+hz9z34pOl+ooqtOQPWSzVFp7YQiueFPyu//cPMJ+qEi+Vl1LGuJc/AAhq0h9XPdJX8uZc5ksqc+qdtPGR24o=
Received: from MW3PR06CA0020.namprd06.prod.outlook.com (2603:10b6:303:2a::25)
 by MN2PR12MB3421.namprd12.prod.outlook.com (2603:10b6:208:cd::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 22:55:10 +0000
Received: from CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::b0) by MW3PR06CA0020.outlook.office365.com
 (2603:10b6:303:2a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17 via Frontend
 Transport; Tue, 19 Oct 2021 22:55:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT035.mail.protection.outlook.com (10.13.175.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 22:55:09 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 17:55:06 -0500
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <daniel@ffwll.ch>, <matthew.auld@intel.com>,
 <alexander.deucher@amd.com>, Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 03/13] drm: add Makefile support for drm buddy
Date: Wed, 20 Oct 2021 04:23:59 +0530
Message-ID: <20211019225409.569355-4-Arunpravin.PaneerSelvam@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 41271499-0fb1-41df-dc3a-08d993538087
X-MS-TrafficTypeDiagnostic: MN2PR12MB3421:
X-Microsoft-Antispam-PRVS: <MN2PR12MB342161DEF0B49B44291FB0EFE4BD9@MN2PR12MB3421.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:103;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C5s7H3mXx/2x7O1YWyxZ13i4i8hqXguZBLR+yJR231ufv3M22M2vm7Jq4rSzX1+pVj+0rVy0Qvh/gjob12I8R/M+lCvaZjepyJpMHczOT2miSSgfHx80RMyKxCsK/xg41QATKo7cBe6UIqetnAponM6nn8/02X26L5RcgXVueLoIjnOaQXeXaVpsR5OjsFcxcq1nWBWb5c5L2EkDdgnJakNUb4qC8W89hTGSSeZTCWodYT8EXH+7w1DnpwZZA4CRKdfB2oAJY9AGDoiw8XYwcxtSUDtrWCt05+MpzOwMfazr+Ox0dZ/heNuxH3TXiIYvXTEVtl+uTD6TP2TALHy9djz8IwYcytqBlTSt8HW5Topx++o6cMOxsPBBRtrUEUQO+5kJUHS0SFoC9b6RDC3E5cGXk+ozxr0Sg+smVBc7nvPChSuVJ7BxinTeG2Vd+e19FlIBlk4cxfmvOHKBySuJs+RCK704PD/vXcdMxrWkJ5Pq+xBP3yhkpNJ6t1KXQsCpvHNXNS5Uot6fEAKOwgXR3SiL6Hxn+M2cT1gXXEDuV2f4u3P9HHZI4Rz/Jfs2l+J+BjaeoB09WtJDAnNMggLpdWnxb2fEd268nV3ccX0lFRdAi8xhp6uFGI4NX7unahSbN+algGALHPaTPUSInKO+XgmXbH7qbKstcO+ape6cLh3+rHftGBUG8U599sUo9XfVMHD/d5HYTQrjKcrrNoZhNVpXCXGAvVa+eEMfjRxmEtI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(2906002)(1076003)(8936002)(6666004)(16526019)(54906003)(81166007)(8676002)(7696005)(82310400003)(26005)(5660300002)(186003)(508600001)(47076005)(70586007)(356005)(336012)(83380400001)(426003)(4326008)(316002)(70206006)(36860700001)(2616005)(110136005)(86362001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 22:55:09.5982 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41271499-0fb1-41df-dc3a-08d993538087
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3421
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

- Include drm buddy to DRM root Makefile
- Add drm buddy init and exit function calls
  to drm core

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/Makefile  | 2 +-
 drivers/gpu/drm/drm_drv.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 0dff40bb863c..dc61e91a3154 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -18,7 +18,7 @@ drm-y       :=	drm_aperture.o drm_auth.o drm_cache.o \
 		drm_dumb_buffers.o drm_mode_config.o drm_vblank.o \
 		drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
 		drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o \
-		drm_managed.o drm_vblank_work.o
+		drm_managed.o drm_vblank_work.o drm_buddy.o
 
 drm-$(CONFIG_DRM_LEGACY) += drm_agpsupport.o drm_bufs.o drm_context.o drm_dma.o \
 			    drm_legacy_misc.o drm_lock.o drm_memory.o drm_scatter.o \
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 7a5097467ba5..6707eec21bef 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -43,6 +43,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_mode_object.h>
 #include <drm/drm_print.h>
+#include <drm/drm_buddy.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
@@ -1034,6 +1035,7 @@ static void drm_core_exit(void)
 	drm_sysfs_destroy();
 	idr_destroy(&drm_minors_idr);
 	drm_connector_ida_destroy();
+	drm_buddy_module_exit();
 }
 
 static int __init drm_core_init(void)
@@ -1043,6 +1045,7 @@ static int __init drm_core_init(void)
 	drm_connector_ida_init();
 	idr_init(&drm_minors_idr);
 	drm_memcpy_init_early();
+	drm_buddy_module_init();
 
 	ret = drm_sysfs_init();
 	if (ret < 0) {
-- 
2.25.1

