Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1A64341CD
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 00:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E316E1A2;
	Tue, 19 Oct 2021 22:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E4B6E171;
 Tue, 19 Oct 2021 22:55:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMIENoFHLC0eeeWqAfLboS2Q3kmw3rR5vvHiF3ApIISxfUuSkHiO41fEdyJCb0ByfcLeB98aqWBZPqfWeZyf74nVD7ebeO8ouqlvFIH2MQEkgigSZkvbkHrum8jDhLz0zyfbp/0ZqolYnAOrfs7l0LfnC9tsIiwnZhDqJentR6Fq5zQSQmhrweEeP60m7v0A2MMli6EoagfKHXtCurVhzyzFVoAz84pHg5/Zb0MDqKZM+LHRd5uIsMsTZEPMynOlytmAwIf6tVCvsSpS/DWWMdjKDbkRyLbZz8XM3B9fggOKX9bOsHqsF9KeyFxHaS9VgIE6u3UkHpe+jTgdo4HuHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOaNYgs60em2wNEpIbpujxhWyBqf8w+LPBDwKf4CB4o=;
 b=PSLVK0Pm+X5brXbVYv2FU0Djx4eKc3Oxu0xIlANZH57W4sUu+r+FX2Ojugf7PyWzH/52hQWIVszpP0tv4EHX5oCnAXUWflZq6LYL6vsnmmjXxBiSJfhZOsj8GdeY+v+PTjrpcHGH/g/U5pByuK+Vb028uOLIlN3tzEhoVfo7OF3NSArW3OFbFtTEE1G611zOZxUAIJBjw4puyfHrymJgfxWvfFOIoqwXTH+OoiKEXcOc7+E0/GSxjcFWuFWy7mqndwLv91xbXtE6P/uGzQL22CGth90t7ByYutfx9mkkq9Po6fM/WNhfmkthCk1elxCc6tushUay+JQdf0nXdrs9IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOaNYgs60em2wNEpIbpujxhWyBqf8w+LPBDwKf4CB4o=;
 b=S+nl6fSjKzptQJ2wvrJehYvXrMph9nNzSnWj2t8b0lcOoVyE+IgaXefIFRT6/RAjweL6k6AVgHNU6GwscKNizDLJwp9qe3vgMcr1jpYiZcwKY8LXTM8XLJU+QWNPmjVUu80O6WglHL6K/3It/dD0IQKhQd7AarZwTevEL3vM/e4=
Received: from MWHPR11CA0015.namprd11.prod.outlook.com (2603:10b6:301:1::25)
 by BL1PR12MB5285.namprd12.prod.outlook.com (2603:10b6:208:31f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Tue, 19 Oct
 2021 22:55:28 +0000
Received: from CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:1:cafe::80) by MWHPR11CA0015.outlook.office365.com
 (2603:10b6:301:1::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 22:55:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT032.mail.protection.outlook.com (10.13.174.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 22:55:27 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 17:55:23 -0500
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <daniel@ffwll.ch>, <matthew.auld@intel.com>,
 <alexander.deucher@amd.com>, Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 09/13] drm: remove i915 selftest config check
Date: Wed, 20 Oct 2021 04:24:05 +0530
Message-ID: <20211019225409.569355-10-Arunpravin.PaneerSelvam@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: d7da8c8a-4488-4068-12ab-08d993538b63
X-MS-TrafficTypeDiagnostic: BL1PR12MB5285:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5285588403FD800AE9A45EB1E4BD9@BL1PR12MB5285.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:274;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bQef3ED7duMEjUX7h4Vc/g1jIYjVollr2Zk9iBjK6f8E/xKoOMSJE08f+EAOr39MkDIQNRPN09BQDZEH2Xu8FO3195fGQjh0CuM5M4WzlP5K504rlg8pdu+XRFv0KRFBxGgIGzPKEDM/a5m2qokb6/3YpK+tL/HZLB3TF7BmYZfrZWKaT0+3ZkNJyM/XeplpNXBazR/xDiwgnGrLn6grmgikXrd3B3O3o/uTSxUfSCL1CidpLmIoZMupxQTM4/GiWiguHH9WYOWIlhyrkJuNSHSe2JATJT19Vk0gFuGU2RQpXxlSGk0iShmieg6WP2JbJ1FRBlq/VkCO2kzJNjbcZkNGjyqHfzHWUVKJNlT+WL5m7y7pAONQCUrr73kKjyNCLx6LsBLnlaZWWf/gmmULrg52hDKLPvjO9m2HNqIESXwDlhOCR/bqq444yyW6WSwzFo/VbOELVkBz+nwkmMasze4cvphua6mtNFg7S8I7OMwxYCSsjAG53SRk67FgsXIUzV7evXST+kBTKfDT2N7g8koPOIWvdOzDkD2F7ixqVHWfJMXOkga+mLJ3jGobVlHYAf9P2mFyMHrXuJQIIpXfcyaj1nrkmRKcB9Pifpkcr4SkbVgIIeqLdc8/uEM3zIwAiMg6yWdWucCkF7JOeLX8XnyRYnw8cCIsoQBIRJ3z3xlXnnmvBNk0vnfiBXCqMQ7bB00UTOFf/F+dzz3kNuVzpRPiO+22swO5ud7CenH6YOc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(86362001)(16526019)(4326008)(70206006)(186003)(5660300002)(8676002)(54906003)(7696005)(6666004)(110136005)(316002)(83380400001)(82310400003)(47076005)(26005)(356005)(36756003)(81166007)(8936002)(4744005)(426003)(1076003)(508600001)(336012)(70586007)(36860700001)(2906002)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 22:55:27.8091 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7da8c8a-4488-4068-12ab-08d993538b63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5285
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

i915 buddy selftests will be moved to drm selftest folder,
hence the config condition check may be removed.

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 5eb7c4187009..e7a5d6d47a37 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -689,10 +689,6 @@ void drm_buddy_print(struct drm_buddy_mm *mm, struct drm_printer *p)
 }
 EXPORT_SYMBOL(drm_buddy_print);
 
-#if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
-#include "selftests/i915_buddy.c"
-#endif
-
 void drm_buddy_module_exit(void)
 {
 	kmem_cache_destroy(slab_blocks);
-- 
2.25.1

