Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9136304AD
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 00:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1ABE10E823;
	Fri, 18 Nov 2022 23:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9632010E81A;
 Fri, 18 Nov 2022 23:44:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UPW9MQqzvMuZzcAP313Ih/hFvTX2beQOR4zgsWfJbhsQBZPxSk1D8Ljj+XWGChuXLXxXIgv7z3YkuIJ9lSVCW1k/wKh39JsWOMUPXMuHgfCpuInYh/BYm15dVqjmC86xLqUOrHsWNnCU6Y88a/i7ySK0a9iIbDLVC7a8CNNKUM56VdRe/fcnsoRv77HiBDgkNd47sau3P0XwzehWuQXJw8iMKfLoF69xxWnOyay5H3mFni9+v90Zj3iyhG4f4cKAyDEUS+QzPyZ4slRd/1NqJjU0ZmXKknMg4Eeo3HUl4MEEfOUZv5Mja+HQhAayhfUy8vdrMyfXZuqc+h0Ey3M3bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ftdrtYZn0RwkgwVYpdgwvwzLQ4M3gdgnmZ2cvtwtYWA=;
 b=M7pF36XLoIEMHiPbqDjyw8z0S0rLRt9N5TPwUusS8sjYLDjl5oAoaDvvHuSWhKTEx7446DaUzkr0B3CksuRez6xuZEdA2V5aRgrCgDdcfqYriSEnGfVH35B2hOy1zqkS7r9ybwSVpe7DnxuqCewCtSMt+11zcBPl0sNn1XmksDZlcmrvIGulRF97U0d0pfVvzxK8+FRYoduZr2f/6yBbQ6DoHhUkqdn0k4BdpGcWb8aGULbiFzqkvC6qfovk2IVgK+4/g2qwvstylR/ErtCNJdnNiIEr4eYshKz4G6QFNQQtTKIMsn9H3I0DDDYVJA++fCA0OkDDJYWIQsE8CngKvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftdrtYZn0RwkgwVYpdgwvwzLQ4M3gdgnmZ2cvtwtYWA=;
 b=Vda03ikUtFRALKNOGbhfPssMeZZDHaKjpD14bhC7rOnH+JLumOI56/rDnwMg3tvnsR3YT6qHYUZU2IyANnwMEdM+sikwFQ18M9u325tW/lNEhIKp4mERq1e2bwmnhlgnyNqJMNQTu7ENrFQFsUWS6cntTvaQ1C1KYV5ofYB3DG4=
Received: from DM6PR03CA0056.namprd03.prod.outlook.com (2603:10b6:5:100::33)
 by DM8PR12MB5494.namprd12.prod.outlook.com (2603:10b6:8:24::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.20; Fri, 18 Nov 2022 23:44:36 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::7c) by DM6PR03CA0056.outlook.office365.com
 (2603:10b6:5:100::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Fri, 18 Nov 2022 23:44:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 23:44:36 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 17:44:35 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/6] drm/amdgpu: Generalize KFD dmabuf import
Date: Fri, 18 Nov 2022 18:44:17 -0500
Message-ID: <20221118234422.1468806-2-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20221118234422.1468806-1-Felix.Kuehling@amd.com>
References: <20221118234422.1468806-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT014:EE_|DM8PR12MB5494:EE_
X-MS-Office365-Filtering-Correlation-Id: 17071b8e-2c09-488d-96c2-08dac9bed9d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vxoba7F0CTgvq3XXErRnrAllSCsdK5btsAdtFBYsZQAG85LPG6brSfJrGixdMVpsVctI2e4m/6rkiIAIW8e6jIn/QNsGNUGfBnEYeITif/QCpUeDkNEQ9uPD2jMxt1fVeavOVPpmOjHKRthWtgEVz1I0EJfGWZqPgjkDluC/mQtrYUlzfyacHq7zB7SHDPsf/Ch5TcoMutgHDSOUnM/a3fbI/KsYBlfb6f2+NFuTAtC288Zr110d7p0QFwfTNuioVXoqKDBUO679t1YPMLz7uc5dhzhdjJgpyZzF1cISV9p5QR1+J1wTgkh3WIYEBQX38ebw3EXPfocPGCHv2UaPJkA0NQOpnWab8bqh7NH4rM5m+P9pnqdMmjP46y+9hg+tFDHl2h4EpSo2fYdGr+UBpbIYuGV9564vvBn4KQuFE70reITPHUOhaN8lUlidsZhtHwv0kzMQi0yPzJkrCpSYHEXR2gxdnWoXKIjWkpf5bPfSuV9r7BTee6kOvrXTPVBIqcnWeL6wRNz3gcvhcB/hVhbt4bBfnY8cRo42e/t5LsmE792X4laJ2SzuKOW6u6p2PgDv4m/fMibmI3SE10bLrjCeYXmcGJvM4HBs+TGgv5Bk262q2kJqY5ix+3zxZr0wZChlvDvhRF26ID7bVA6H8aWiocQpptgp4i92Wtfaqza0kPusL+47miXCQaGblqbb0c3Iu3nxiaKxkta8f4IrtTpiw/gpAz+3vKglIURvzHU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199015)(40470700004)(36840700001)(46966006)(336012)(7696005)(1076003)(5660300002)(186003)(16526019)(110136005)(316002)(2616005)(40460700003)(26005)(450100002)(36756003)(8936002)(70586007)(70206006)(8676002)(36860700001)(82310400005)(81166007)(356005)(41300700001)(86362001)(82740400003)(83380400001)(2906002)(47076005)(426003)(40480700001)(6666004)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 23:44:36.1384 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17071b8e-2c09-488d-96c2-08dac9bed9d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5494
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

Use proper amdgpu_gem_prime_import function to handle all kinds of
imports. Remember the dmabuf reference to enable proper multi-GPU
attachment to multiple VMs without erroneously re-exporting the
underlying BO multiple times.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 38 ++++++++++---------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 3a763916a5a1..67c832ae498b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -2183,30 +2183,27 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
 	struct amdgpu_bo *bo;
 	int ret;
 
-	if (dma_buf->ops != &amdgpu_dmabuf_ops)
-		/* Can't handle non-graphics buffers */
-		return -EINVAL;
-
-	obj = dma_buf->priv;
-	if (drm_to_adev(obj->dev) != adev)
-		/* Can't handle buffers from other devices */
-		return -EINVAL;
+	obj = amdgpu_gem_prime_import(adev_to_drm(adev), dma_buf);
+	if (IS_ERR(obj))
+		return PTR_ERR(obj);
 
 	bo = gem_to_amdgpu_bo(obj);
 	if (!(bo->preferred_domains & (AMDGPU_GEM_DOMAIN_VRAM |
-				    AMDGPU_GEM_DOMAIN_GTT)))
+				    AMDGPU_GEM_DOMAIN_GTT))) {
 		/* Only VRAM and GTT BOs are supported */
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_put_obj;
+	}
 
 	*mem = kzalloc(sizeof(struct kgd_mem), GFP_KERNEL);
-	if (!*mem)
-		return -ENOMEM;
+	if (!*mem) {
+		ret = -ENOMEM;
+		goto err_put_obj;
+	}
 
 	ret = drm_vma_node_allow(&obj->vma_node, drm_priv);
-	if (ret) {
-		kfree(mem);
-		return ret;
-	}
+	if (ret)
+		goto err_free_mem;
 
 	if (size)
 		*size = amdgpu_bo_size(bo);
@@ -2223,7 +2220,8 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
 		| KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE
 		| KFD_IOC_ALLOC_MEM_FLAGS_EXECUTABLE;
 
-	drm_gem_object_get(&bo->tbo.base);
+	get_dma_buf(dma_buf);
+	(*mem)->dmabuf = dma_buf;
 	(*mem)->bo = bo;
 	(*mem)->va = va;
 	(*mem)->domain = (bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM) ?
@@ -2235,6 +2233,12 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
 	(*mem)->is_imported = true;
 
 	return 0;
+
+err_free_mem:
+	kfree(mem);
+err_put_obj:
+	drm_gem_object_put(obj);
+	return ret;
 }
 
 /* Evict a userptr BO by stopping the queues if necessary
-- 
2.32.0

