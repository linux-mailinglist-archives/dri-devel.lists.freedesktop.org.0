Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 965B8583582
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 01:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5AD9453F;
	Wed, 27 Jul 2022 23:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2043.outbound.protection.outlook.com [40.107.95.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6430991B2A;
 Wed, 27 Jul 2022 23:08:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkTzE7Zw0Gw6IAmDDiRVxb1t/UWQQFq/Hn9+b6GpA0DTiBgvYCPlyJEOU3G9z5hZ23Ag03CljLtHcUO0jbh09pLFIIi4pqS/9+52myzGcWv3MuS5QaFvimx8K+FLflSukUSgiLB1pI9sTxcmZW+PiHJZkES59lTqa/Ya/eovtxuV5vJj87tTVzL1gxyBAMmf0MLeKgCFyivc6HsJdz8aTEh+tuN0rCwmB6+R+5lxOu3GiSIuwGL9Ouv7FgKjwiLkC8q1HwDwxHtxf/nUtB/mulopMywV0Y6d8BxcP27sAN1OpRek+YZLbVdJk5kSU6Huljigj5bGZsf8+RAQIqJZQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tZxZAuFNA7bbxK1Qh3Gm1s5n1mbbMQbJUyHcCj8ygc=;
 b=l33S8p9Klxajtl95LGVhL8WhjR56C2lJPWyhWpSnWRY5dvVNozO2PSkX4+FGMnOR5aKDEjZhhA/QcG6/ZAUwe3qFKwcHEC2TnUMYMftZf87KPCKA0hgadorZGKPfZM7uFxhKEVRiccXuavjobQT/dqDlHaM0zIAJIPRX23eTD4o9Lncr8hWb1utdMHWWbUkQBhbAI9l0hSA8Lu6bXGD8csUGVp9R3WktgZ8i6uiYGi6bjEANHIRkfyjw9OG405ddOIywydGhW6vj4C0RP/67Ovfvz7s4WpMywNFlfnaKH7BECwqrur8XdX+TUc869lZIT7oSM4WBrC3lCGHm2TZGkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tZxZAuFNA7bbxK1Qh3Gm1s5n1mbbMQbJUyHcCj8ygc=;
 b=FNwSMbYVJXsrvKbRB6A6W2epP+1ZCxvl+7Ggzc0uLFkTuv51vdMU+iYjBp9f0Hoc2Q9l3D2KSLzFI3bwJRPV6UYnVGonemLNrJ84PHzcWyPIUW/hsTgAdzTea9mdijAltYWyRijCUM+YQB33IyhVl2wb/bxqDLilHriC1E3i4TY=
Received: from BN6PR17CA0056.namprd17.prod.outlook.com (2603:10b6:405:75::45)
 by DM5PR12MB1243.namprd12.prod.outlook.com (2603:10b6:3:74::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Wed, 27 Jul
 2022 23:08:15 +0000
Received: from BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:75:cafe::25) by BN6PR17CA0056.outlook.office365.com
 (2603:10b6:405:75::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.20 via Frontend
 Transport; Wed, 27 Jul 2022 23:08:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT031.mail.protection.outlook.com (10.13.177.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Wed, 27 Jul 2022 23:08:10 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 27 Jul
 2022 18:08:09 -0500
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Fix stub fence refcount underflow
Date: Wed, 27 Jul 2022 19:07:55 -0400
Message-ID: <20220727230755.1445806-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97db8cdf-811f-4467-7e02-08da7024e007
X-MS-TrafficTypeDiagnostic: DM5PR12MB1243:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yIprzvFbbELUebU14hyA9p4xSCaf3LZrmhZ79x/WusDXo8vNnocUj1GjhtWdFoWXAWfYZxFKYvVTu1ygDLLQezd/SccId/IzqbQcDHqTOQiiKgG/8GPpm1cE4gze9eQpnAY+ZhromTo62CFSsUL9viDUe25cXC5+mEoxWfBF38IUZcpVsOlDTX5fflBTG9HOB6tOSBQ2ReatqgGTTaOSruVkDbtK0lRAheWRXY7JQ8LptSs5ZMFe2gf/wJFMNtX/NmkqHhxsHnPofqdzn8lK2TWaeTwGRUD2OR/poeEIkVAp6oRolr4gwHt+y4lIGLTz1fvcE06PRRpmTdnFqUJnFItYqIYSRQaOwbpmBUyTAyitGWdHt7rhCS5MPTlCbFqdIHCjx8xhiFUFemCyIRrfP99Bg6o0aHvWfQVIz6lel+2dofKP7+6vRaJ5X/ZO+hjABVG2jU+98p+yMzbrnRP5fiW7+f92JOGs2Odj0knyHdC6L8a34ba32ve3YOAoCGV/dPrTJzBX3/4X6DdqtQaxDWpnJ7wen1MHtD+fL1Okvqv2HdrNLS7zCBuHshKIYxQKhiGcXh0KC8CXCwym3cDroPsTbbOa9VGvwqBStMq1de4irNkQIvTambx7/gPcDm2tnwY2NE1UlvghECeA2RlphToUnFeBttDrUnTGZXCxfZNOHUVYgTJY78EKgt0HreIncmic6wrfPmDVdBY8UWbv0TVrSmJuYiplvhrpzzSFP5Pu5jjWnrKYTZJfI7nO9tflWpCZJkGkOntmixToYg+9vQMF+FoTmFWVlKYNW6sIgL38p8kAWofhKLAoyJ47UBThypVoqfPRmRLRi0jYb8dcNw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39860400002)(136003)(346002)(396003)(40470700004)(46966006)(36840700001)(110136005)(36756003)(81166007)(47076005)(82310400005)(16526019)(186003)(1076003)(316002)(426003)(40460700003)(450100002)(70206006)(66574015)(2616005)(336012)(2906002)(8936002)(5660300002)(356005)(8676002)(4326008)(83380400001)(41300700001)(40480700001)(86362001)(36860700001)(478600001)(6666004)(26005)(82740400003)(7696005)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 23:08:10.5286 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97db8cdf-811f-4467-7e02-08da7024e007
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1243
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't drop the stub fence reference after installing it as a replacement
for the eviction fence. dma_resv_replace_fences doesn't take another
reference to the fence, so it takes ownership of the reference passed
in by us.

Fixes: 548e7432dc2d ("dma-buf: add dma_resv_replace_fences v2")
CC: Christian König <christian.koenig@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 87a3a3ae9448..a6c7dcd8c345 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -294,7 +294,6 @@ static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
 	replacement = dma_fence_get_stub();
 	dma_resv_replace_fences(bo->tbo.base.resv, ef->base.context,
 				replacement, DMA_RESV_USAGE_READ);
-	dma_fence_put(replacement);
 	return 0;
 }
 
-- 
2.32.0

