Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B006D3C2C12
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 02:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CE16EAA5;
	Sat, 10 Jul 2021 00:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7170A6EAA3;
 Sat, 10 Jul 2021 00:30:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nrIDkWDnCgfVY8gKQ0jcZgt7FitQfrptnox6ICT/OZS0mdDN3SuusxIrDUTv6l7cxS8dYFj/4QXzc3KDsoMlA+ngt7GvQ1C/LiirJaxBdQlbPhhx2xCfOmtb2ajBxlx5ss67FYt5dyCskD56E18l9n6jhiX1vVAZfpeGMx8MNGZAW2QgtNafnr2+u/rVe0Cmtrq3TFpUlyobOEN5Ag1oUwKyoHyjRBmCksB5aPqHaUi+43NDJ1GfcSRFbcg946yszrC3HgUmqTjqhPuDCELeC/vz9m/T7dOAVkGdKVbx5HuiArp7i+zUxnmrUtnjpRBQoE97FhtgbmsQcbot2r/1ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4WdKEXzWuv9ssMOnV8mAfohVIotjSMcLYIsJwB/7J0=;
 b=i9OVW6NvR0Joa8lCdeEbnJjotcVH2w5JIZripiZtXPrA2xdSf2NtEF6oYitjQzA2JLb3ygVKh9a9YvaUCD4hypua6RHauxaUYSDfqjt7GRaFss0HGRqXri/WZEIc06eh7py5bbmphcppQ5WIMHoGW4dboA9ggZ7iRGOvq4N0AzOtK0ZTGKWYZ/0qVNzndm9piwFx+HwTxCRUWjqwkFmNAR1schx6kYYB4JwAqcwm06NNWWl/BdWRT34BcC+V7S3valXoydHNF80IbBVP1OSv8wKzzfzW8aVqUuS+/a9/mZBTvZ9E5k3cZFVla3VvrQcJZp1DYANvVWxJIKp2T0GeNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4WdKEXzWuv9ssMOnV8mAfohVIotjSMcLYIsJwB/7J0=;
 b=WMr5XGBVAStPssVcAD9pO4jFvIXjWg38OCvTspWOtTcYhEO9cXJfRJm0M1TRWzGSK2CliIwJJRpIsg8Rp0MXV2BkPWsJLPCKjAFDoVgodgcu5NPTld8p3jaGg++cY8AWbJlXc4q+zrtVM4+3Xl4ECqs7u8Y1eZFpa4raEdL3GDM=
Received: from DM5PR07CA0123.namprd07.prod.outlook.com (2603:10b6:3:13e::13)
 by SA0PR12MB4382.namprd12.prod.outlook.com (2603:10b6:806:9a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Sat, 10 Jul
 2021 00:29:58 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13e:cafe::fa) by DM5PR07CA0123.outlook.office365.com
 (2603:10b6:3:13e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Sat, 10 Jul 2021 00:29:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4308.20 via Frontend Transport; Sat, 10 Jul 2021 00:29:58 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 9 Jul 2021
 19:29:57 -0500
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/1] drm/ttm: Fix COW check
Date: Fri, 9 Jul 2021 20:28:37 -0400
Message-ID: <20210710002837.366942-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce5b2883-9378-423d-39fc-08d94339d8ff
X-MS-TrafficTypeDiagnostic: SA0PR12MB4382:
X-Microsoft-Antispam-PRVS: <SA0PR12MB43827C9A97E94D156C56C7F492179@SA0PR12MB4382.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3gpfogKhGLfknN42YUz7ZbtJ3YvoY8m/ve2b6/hWGReZ0Der+ytr0HAJtBjaVVWFA76525XR+6c32z/BEKt8UuKU9ZXKfDnoqwAp2oU0NbwjwV7WyP/6YRDwKBpOjENrxbtm1QzlWN6+HTnmNyH7OMOP7j5xxfAM9FyUJtL3E7olj52YDquMSMmqQv3Jpv6TnDOecZu5UZ8roBsDaUNQqpHPDpxXQgOLX+brK/vQyHUGeE4wv5LA7IuFomoCakEMUHvhJj4JTgctsLLJugT5AxdVnC3CFlaqq8kb3CEa9Wjb/JMMHo7FfzialKtCLIeX4BO2yYmfSLKRIkAAQ7CnIzU121kjWxj2JPv4S6X0P97918IjlcyRnvHZ7ju7dv7EKjHeGuFmQB/U82c/RXrRMN/7Er16KRNRMsM1apm/doxQbpT7J3Pp2/27ocb5Nk3aTTLuPSm4gdLUTlrO8nTStqLJ0YwSvp3HgJTC1njl1uXAVmforfXYSjTO0sMcTi8AGJcTFWraPr4x+bi79olTzx7WRphBhjx2M2eQ8V1GqYNPQ/0kGL8wDcTvD9zfpGs768o7bV1GzONiBiVMeK2r3L37s9Hbu5wv15C8nVC1mpQ4M9f4cUyHVJyPca00KOoIdViY2E9veANuz9PpnudwCSy9nFTBVA1ILusPkkpVDGPknX++uCVf+J6EGPM+8WtwoM3w6FYBYG2fUaipNN3zqdZQLaYNrRTQkETS3bAVQ5c=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966006)(36840700001)(36756003)(82310400003)(7696005)(8676002)(6666004)(316002)(26005)(16526019)(186003)(70206006)(47076005)(82740400003)(1076003)(2906002)(70586007)(4326008)(8936002)(450100002)(426003)(110136005)(5660300002)(36860700001)(81166007)(336012)(356005)(478600001)(54906003)(2616005)(86362001)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2021 00:29:58.1418 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce5b2883-9378-423d-39fc-08d94339d8ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4382
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
Cc: Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KFD Thunk maps invisible VRAM BOs with PROT_NONE, MAP_PRIVATE.
is_cow_mapping returns true for these mappings. Add a check for
vm_flags & VM_WRITE to avoid mmap failures on private read-only or
PROT_NONE mappings.

v2: protect against mprotect making a mapping writable after the fact

Fixes: f91142c62161 ("drm/ttm: nuke VM_MIXEDMAP on BO mappings v3")
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index f56be5bc0861..9ad211ede611 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -542,17 +542,28 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 }
 EXPORT_SYMBOL(ttm_bo_vm_access);
 
+static int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
+			      unsigned long end, unsigned long newflags)
+{
+	/* Enforce no COW since would have really strange behavior with it. */
+	if (is_cow_mapping(newflags) && (newflags & VM_WRITE))
+		return -EINVAL;
+
+	return 0;
+}
+
 static const struct vm_operations_struct ttm_bo_vm_ops = {
 	.fault = ttm_bo_vm_fault,
 	.open = ttm_bo_vm_open,
 	.close = ttm_bo_vm_close,
 	.access = ttm_bo_vm_access,
+	.mprotect = ttm_bo_vm_mprotect,
 };
 
 int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo)
 {
 	/* Enforce no COW since would have really strange behavior with it. */
-	if (is_cow_mapping(vma->vm_flags))
+	if (is_cow_mapping(vma->vm_flags) && (vma->vm_flags & VM_WRITE))
 		return -EINVAL;
 
 	ttm_bo_get(bo);
-- 
2.32.0

