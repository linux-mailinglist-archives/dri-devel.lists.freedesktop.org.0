Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8626C3FA0B4
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 22:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6446E9C8;
	Fri, 27 Aug 2021 20:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2047.outbound.protection.outlook.com [40.107.100.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0AF06E9C5;
 Fri, 27 Aug 2021 20:39:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brX6OfN6Hh/zByDJc7JO7n9d6yQolWxHMf66coSZGcfqQJcxxj2oRmDYiS8fyhRydAXRr9p8uQPDJATYyRwQtI4iVhkJJpwRKh1RQqNWCVeG8/u1GZy82/IciVwVEfyAA2Xiv43XHMi8mES7JbEfxiD8XUj+3eIUwy1vqbC8hw3Mpjt3dbt8RihFAchhFwwje8+BWjdcPIFOTdlOlNpKZi4adPMaxT6hpennbUm3O2IUc41/nL3ov02mqbCGBKBePLKjcwXSn4E65a0KfmKudvNQXpTaOqI7Ef+zT/2KlamZh0/5soodEID9rM+KLspAJXTHoyx4tbR9Oga2o6Drqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVjj2p1/2cub+2D3463dfzFPKnfwfhsAgOXarlqz1oY=;
 b=TorIALTSlMYQK+1Ey5fb2lC1aZM3BA4sUGe/wBYT1c5P2lRtiXLGH5EIrdWnD8EvyMWURq3jOM/8jD773GIFQH8cAEPNVdrI2VVgu+ek5/ZibL+Z12JRDYYfjzr4hLSPeHfSu+4GHRb+S5B6stg96lKDHYe/fC5dWR5ryMhZrhKGTdmepCZakqMGFgtZcEcqIuWWehubktZNHwDcfCcOPT73PBb3uNQEQTnuq1aIxIbZ1ntcwPw+pNJqj1GJfE/Go3GrzqDlDtYyDqdSCblu8T8O9zKFvajdykg9R7bQ3v5Nw4Ju1gHelQXZO6ufecqkHRP1EkxTXzcX+8C+dR4ytw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVjj2p1/2cub+2D3463dfzFPKnfwfhsAgOXarlqz1oY=;
 b=ZK13Du2CLCULSil9Jk+8sfhpHUVHgPKi1sqmQjzHfIv6ieZ7dWH1j6YO0U2JpjUq+MbaEY9zQ5/hx8MqgXT4o7nAQ/sIvAK+rTmu7M1vGmUlV7b54qsjuoMr3/eJ9olCny/tcCCa4zIimzwQxFAZnadPDD5i+V6teT9gzijwCME=
Received: from BN9PR03CA0723.namprd03.prod.outlook.com (2603:10b6:408:110::8)
 by DM6PR12MB3098.namprd12.prod.outlook.com (2603:10b6:5:11c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Fri, 27 Aug
 2021 20:39:26 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:110:cafe::cc) by BN9PR03CA0723.outlook.office365.com
 (2603:10b6:408:110::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Fri, 27 Aug 2021 20:39:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 20:39:26 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 27 Aug 2021 15:39:25 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <ckoenig.leichtzumerken@gmail.com>, Andrey Grodzovsky
 <andrey.grodzovsky@amd.com>
Subject: [PATCH v3 4/4] drm/amdgpu: Add a UAPI flag for hot plug/unplug
Date: Fri, 27 Aug 2021 16:39:10 -0400
Message-ID: <20210827203910.5565-5-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210827203910.5565-1-andrey.grodzovsky@amd.com>
References: <20210827203910.5565-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f94056d-a358-4e10-744d-08d9699ac2d8
X-MS-TrafficTypeDiagnostic: DM6PR12MB3098:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3098A1D15C169AFA71451BEDEAC89@DM6PR12MB3098.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TCbphYuh5I7/SDp/XWonxM/FmL4dfiDbC2SmK8PjPPlKTDeqE14JHmowaZkf2iGrKoiM7IUTNWKZOmFTWxMXqu15K/HGWBPV+KPI7b6pJ+88t2Jscx3dW8qbBZbP+C9zqz0OmjeCbtLOXS+djat0JSK7Ymp4jFEnbjOH0O0t3eK/WQl6b99eRFxV+W2IIsLgkdbOx+iwz48oXBWacRbP0++t9VshyFBw3ScAykWgyQnEK2J6iCbBu9dO68CD0IkXP0NPe/ldZ9ikCUNT6jNW49veneJwHrdzunTadWW/Sdbv45QLbGdVL24JaDgIzCpgkYG+elQIvuY2l4c2cjeq+6hj5bcUYVxveo2EFGngC+yskmyKvSE8ag3qR0+eaAmnvS263n5BxstdDnOVUZZZJauYQha6Lw9m0UAgOPSMNWeocadZWaNeyv7iS3EQJ77liimtMi7pwz8HVUfkQI5cNKRrxwQDP/pW1bEmGU8gDoPXheD0vC1mGGWt5fU1mr8UQxohy0TSu1HTf7gO72OgsNnIbTly2VNEFRkW1qQUu+trBPIi8ZgK9ypXR5s9/BvQPiyqzbn1Ikli57L8vTlVJIZUQuWvIcMmmwlOCvE7qRdkKRKU1CzQXDhIoNpPRIwlE6uJqT64buQ89tmP4s1CUbnnZ4FzXS0l443OUSgLSfBTmTrwblfFphZT0jWPyEDSYUpiueIITI0eImGml+qG2u0CKGVm3J3Sc6UzGbTxj0Q=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(46966006)(36840700001)(6666004)(47076005)(316002)(44832011)(356005)(36756003)(426003)(82310400003)(83380400001)(81166007)(82740400003)(4326008)(5660300002)(2616005)(7696005)(8676002)(54906003)(336012)(110136005)(8936002)(1076003)(26005)(186003)(2906002)(16526019)(36860700001)(4744005)(86362001)(478600001)(70206006)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 20:39:26.4051 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f94056d-a358-4e10-744d-08d9699ac2d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3098
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

To support libdrm tests.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 6400259a7c4b..c2fdf67ff551 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -96,9 +96,10 @@
  * - 3.40.0 - Add AMDGPU_IDS_FLAGS_TMZ
  * - 3.41.0 - Add video codec query
  * - 3.42.0 - Add 16bpc fixed point display support
+ * - 3.43.0 - Add device hot plug/unplug support
  */
 #define KMS_DRIVER_MAJOR	3
-#define KMS_DRIVER_MINOR	42
+#define KMS_DRIVER_MINOR	43
 #define KMS_DRIVER_PATCHLEVEL	0
 
 int amdgpu_vram_limit;
-- 
2.25.1

