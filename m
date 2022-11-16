Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4294162B59B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 09:51:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1605910E445;
	Wed, 16 Nov 2022 08:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2080.outbound.protection.outlook.com [40.107.95.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588C110E02D;
 Wed, 16 Nov 2022 08:51:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVJdqbZJkSaPUhwEOBSRmbMG4QpRENT11B634g+hDDU7nWtMpNcV5DyRXYd3IDuxYULxsTfogS1P4rHRdJVKjCR5xvlTSQD99pBVZaxPgAbxJNKMHF4eD4T/8gEwvBdNc0A/B3bcYjhAH4PU34o/X2H2mU8gcPCNz423zOMyGOj4MJ7fo0A1tdW4gvGAJ1uLRRs6fp4WuC5kQZEqLa7JgurxcxJ4cmiaQiAYf/5e1+GQhsmgofoTbTvpMgHXRscS4AgfwCF89KbctNN/TcNS7PgbO+KeYGPmoTM/F3XqeEQUBWrDAmwwf+joKlLtJB9H/Bz3F2oRN28qbhhNcwEj4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QH+FwXAU95htJ4wXhif6/XSatHdIbV6E/fzrcW1trQ=;
 b=Uwhg7qyGYKrY0wN/dVU470aeDmgd7D1ecrY0KFIarSjvESKJK9z71sHUYOruBV4mC+a/R8U7Tosc2p+S0hdGyPa+Ru6YvwGuJkN7mqlF+9RdJxxeYtYpEz5x+WUo49X9iGAvFcAu+BXQMy8L2v5CqujrjDVB6W+PHNRhyqxT0/XrrwrXyojwhlKdO11Hs8UnxUit+3P/mKoVlMy62mZu4IJww+8dekNOiqqEI9jxZ+0Is7bOMpVUmmjSMWgLRdVLsHRpanW+nrAWI80iBcxD/cAfT+IytuSqODMGJJTckhvnR5gc0sQOr17Kf2nHuPVWtdCwQidLCEs88YxvTty7vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QH+FwXAU95htJ4wXhif6/XSatHdIbV6E/fzrcW1trQ=;
 b=X6vrlqmrROA5K6IRYtFcJjKOQwPiqLtZGilY1SrEIBW6R1yKFGAW+tRiF42bcBoGABhieteNi3tWvalpGhdbOPUqa6vMUrbfr1d3VaxLzFeabR1z1LprnaRygb1LQDWaqMtdDxISLb8jy0if4zJi4JXFcfw8D6AhERUG1n6W3Zs=
Received: from BN0PR04CA0205.namprd04.prod.outlook.com (2603:10b6:408:e9::30)
 by DM4PR12MB5199.namprd12.prod.outlook.com (2603:10b6:5:396::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Wed, 16 Nov
 2022 08:51:14 +0000
Received: from BN8NAM11FT111.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::7a) by BN0PR04CA0205.outlook.office365.com
 (2603:10b6:408:e9::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Wed, 16 Nov 2022 08:51:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT111.mail.protection.outlook.com (10.13.177.54) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Wed, 16 Nov 2022 08:51:14 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 16 Nov 2022 02:51:10 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/gem: Remove BUG_ON  in drm_gem_private_object_init
Date: Wed, 16 Nov 2022 14:20:12 +0530
Message-ID: <20221116085012.187756-2-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20221116085012.187756-1-Amaranath.Somalapuram@amd.com>
References: <20221116085012.187756-1-Amaranath.Somalapuram@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT111:EE_|DM4PR12MB5199:EE_
X-MS-Office365-Filtering-Correlation-Id: 0be25f33-1ff9-4059-2600-08dac7afb7c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2XRH7haFbziT8vGVpFWkrZbn3SxfSLIsuc5vDfN9hCaV5UjpDgaX6YPSLaTo2OzY4cvk/gJAOjKs+bzPiv4sYLUyuPwvnHcbu/kKPKxMPCE4gxlSUUlkdvMdxP5Q21Uc0auPPTOLZBL3d/vknrdu+2cgyyiFKHKqqbiBcPUSA93zoo71a/oU8SxPfUtSFRGbAe9ydzRUbL7XueGDoYcNuWYNo9xK7J7egQdH8bnZZ5y1gRMM1FhDDVM8zHmcnwsnsj1ktT9f+QOBGK6qTk96wf3J7j2GzATH2MpSIRuQV0JUe5iK7qjy7wwK9CyIIP0J4O6z6xuXBRzLsDCqgG3tXqIAnI8VC0uiol5MaurQks3fasE0TKJP4kdTxB4BYjItBYhvyucIOCMe4q0TRL1hRvO/Rux5Hp7rc6lw2pI2QR/lXy/GUYovb8okuBTDFlkWS1SusZFMSSKRov33TbnGBlOUZN+UjGo2G7kHgzBWWC5B5rh+y40UAye+8FhB3pulZcfSSmu/R8w5TefT/L++EkzT7Yyy8frHD1Ytv8j+zUxlvih4CSGzvX5IxxVjKjG8PgkDuNiNv1ov8NZ9cdADyBWfPonO1xeKYMLsx9OYsDvjKku6Z/x3ort6oq25WTvSjtMIk2gAaIfJ8HPsh/bK08BkfUiuzuUWCcrCZ9rjUAO6wHTnFIanRWKvSSpf9nYYXn/GpQVLw4OQgkKC2WjQvbkbN4QL3tNU99I+uZkd16InQIVRVtwnXyxX4mdKFH13kO5kVZ9OXNnIm1ais5dzOiEcETIAQfSf/M4bASdd+aTa3XnDjvxjO28mV5PrufUb
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(82310400005)(86362001)(82740400003)(478600001)(7696005)(316002)(356005)(36860700001)(110136005)(54906003)(41300700001)(36756003)(26005)(4744005)(2906002)(83380400001)(81166007)(450100002)(40460700003)(70586007)(47076005)(5660300002)(8676002)(426003)(1076003)(40480700001)(16526019)(186003)(4326008)(336012)(70206006)(2616005)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 08:51:14.2495 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be25f33-1ff9-4059-2600-08dac7afb7c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT111.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5199
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
Cc: alexander.deucher@amd.com, Somalapuram
 Amaranath <Amaranath.Somalapuram@amd.com>, arunpravin.paneerselvam@amd.com,
 christian.koenig@amd.com, shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ttm_resource allocate size in bytes i.e less than page size.

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index b8db675e7fb5..a346e3b7f9a8 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -152,7 +152,7 @@ EXPORT_SYMBOL(drm_gem_object_init);
 void drm_gem_private_object_init(struct drm_device *dev,
 				 struct drm_gem_object *obj, size_t size)
 {
-	BUG_ON((size & (PAGE_SIZE - 1)) != 0);
+	//BUG_ON((size & (PAGE_SIZE - 1)) != 0);
 
 	obj->dev = dev;
 	obj->filp = NULL;
-- 
2.32.0

