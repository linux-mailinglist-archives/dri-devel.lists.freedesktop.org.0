Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 621C44DAAC3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 07:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D21410E6C8;
	Wed, 16 Mar 2022 06:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63D110E6C7;
 Wed, 16 Mar 2022 06:34:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RAHwiOHtXmxvtkOvfxU+P15AS/ffL2BgYjvnm1mPCrEdYmeT+Om40wrdfbIYsuRI99JBfBP1dM1LjZdUbBsfhD/c8LtdJnnmITbbhYUKJ91rmqHpJIqQTHSVCmAGW2LqovU9GqyAWYUKIW4WMCpJQ1UyXQ4t9TXMUsEY2Ptz1bglY6h1qBgwZs3c2hvr69NbdeiKXQYjb2KKqenEIQd3fHFM2Ocsq76N8qZ5QMaZYIVcW5i7eMv6NJB2wN04DAKJ0kZS5Rs3b0V7w5ES6FRs5kRn0HunyyaTafeFWa3Mc5kycgFQk4vRccIrKx6xJMzLXcpwmmyc+L66BFIu8Qlp/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epSWYVPbNnNmsKPhpkOr4DThsDGKzfOOA2hdBC5VVM0=;
 b=QHvwt7ES3GTdL1Cn0noa3R/meE5v6n2tRVmO2j4PVmnX+qS2EwHIyUZpkDfbxlKEs3oxwkP94pUrTSAoglx+kBLYUKqSmVO/ikKAxj/DNQQMiEPLLJaHvrERevjUhTxCOGuGlYq1pbO6KubxfFFkTPKIAO/vTsOPxh3VA7CGB32jAshZjdH568PjAHQatM3Z21FiNYEv4LpL+GmTnI+AhBuGaRPYw05us6NL81VXVcK/BJD+yQatMZ5nxiIZtTocrHLDaZVW1AQ5rXeWd23lqciyOhvXThAtYQXAy5VrTKxlTjfLuuFmV8k65fkN4vMcFT8rmKMDHpepNIbeiOIbIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epSWYVPbNnNmsKPhpkOr4DThsDGKzfOOA2hdBC5VVM0=;
 b=2B9msL/oSdd4M9uWEomcWW6260+7AF8kIhoxR4kmQFaYcJQzF3dwRN7GVOSvEPDyyV3Tdu35/nJAFJ2kA6RA2C0HJEkO/+HTO3D8BRz4WOvjRxjKMDzLabZX1D4zWEBuuZ4rdnxDH2ZiWRJ4QyI6QvAq8Y0xNivZX84u7QNIb6Y=
Received: from MW4PR04CA0241.namprd04.prod.outlook.com (2603:10b6:303:88::6)
 by DM5PR12MB4662.namprd12.prod.outlook.com (2603:10b6:4:a6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Wed, 16 Mar
 2022 06:34:41 +0000
Received: from CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::67) by MW4PR04CA0241.outlook.office365.com
 (2603:10b6:303:88::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.20 via Frontend
 Transport; Wed, 16 Mar 2022 06:34:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT045.mail.protection.outlook.com (10.13.175.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5081.14 via Frontend Transport; Wed, 16 Mar 2022 06:34:40 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 16 Mar
 2022 01:34:36 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm: Fix a infinite loop condition when order becomes 0
Date: Wed, 16 Mar 2022 12:04:16 +0530
Message-ID: <20220316063416.3051-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e772009-c3ab-45f6-8693-08da07170cb5
X-MS-TrafficTypeDiagnostic: DM5PR12MB4662:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB4662820D41589349B46341D6E4119@DM5PR12MB4662.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4L31hTWkNSUzG61eAi2IcIwMrnoY/0oZ6CjDQtZ3NBXnodrTWsaGoH7okkyh0MYkel/bxZo6yU9ziHllpzZzWB8JiJ0hx1JYfKgm/+lanqgTmtrqu1Cf1bGIUD8MI4qHXikQO+mx30Kgk1ymAGWRZaMjgH0wX8ymuW7pexsM+jB5FNj5dVMVrKWW7NzkKKRs1iNuB2P0a3k4Dy/EiH1709J7wwOU7CK4sq/V/qNpTGg4lj1w3A8LPfIFK+pmb45lX5VfcbgkzbAZ5h5Yz7yaz5xgBfHFwlfJ7cfc7xgkZHKv/cPo1Bn4E+C73bx7cndZt5OIfl+ojt25A8etmH/XvfjTgyIDUD/cogc1snq4BDkxRLCtGM+EcI95JJaTWnbG6YQ2oqLEVQs4rO5r1TeXkthno9BsnIeeWlUJiuF/9UknUqGvzUMNifwpZFKbTzmG9H1W94Bg2txbFqY4/6TLNCL1LOR08cpqLx5bXO7u+ppTwJPHqWhPd37yU7wvkgRrWFngK3ShWHuOuDijT7+IUmIbwDTEMSh3Apl5k9G2vFDHXYHx9iJfSVc2UHC2eErh2rndNisUlKY3r+vjCmXks/BpS13PszfZ/8flAhINfZBmbNshJaKJbbqN+FMHiAJD1n5DKGCn9yjp1WIlXISgkedXw2OKmGHpIHvSr0IkcPDIBIIZ9lNqsXTAZcd82F/MZZlFCt6ko9W8xHIPohnvNA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(6666004)(7696005)(40460700003)(5660300002)(26005)(70206006)(70586007)(356005)(426003)(1076003)(2616005)(336012)(16526019)(186003)(86362001)(83380400001)(81166007)(508600001)(47076005)(36756003)(316002)(82310400004)(36860700001)(54906003)(110136005)(4744005)(4326008)(2906002)(8676002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 06:34:40.3493 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e772009-c3ab-45f6-8693-08da07170cb5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB4662
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
Cc: pmenzel@molgen.mpg.de, Arunpravin Paneer
 Selvam <Arunpravin.PaneerSelvam@amd.com>, matthew.auld@intel.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

handle a situation in the condition order-- == min_order,
when order = 0 and min_order = 0, leading to order = -1,
it now won't exit the loop. To avoid this problem,
added a order check in the same condition, (i.e)
when order is 0, we return -ENOSPC

v2: use full name in email program and in Signed-off tag

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 72f52f293249..5ab66aaf2bbd 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -685,7 +685,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			if (!IS_ERR(block))
 				break;
 
-			if (order-- == min_order) {
+			if (!order || order-- == min_order) {
 				err = -ENOSPC;
 				goto err_free;
 			}

base-commit: 3bd60c0259406c5ca3ce5cdc958fb910ad4b8175
-- 
2.25.1

