Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DDA4DBB98
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 01:20:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7993410EAB4;
	Thu, 17 Mar 2022 00:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1519310EAB2;
 Thu, 17 Mar 2022 00:20:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEBx2EGGJn9mG1KY7DQZoKp08ewWlAU3XXHlFzCQlQAr1XUDRdKoOmOqYRnxUgmdJOxpO4ij+vAsUXa41ax4KqBP22XzkErl/06xDrM3cvClbTR9l5kTGR5Lkvg4NshDyTTXqQ8XCvbUmprwcI0hFWGiL7YeI/miuv+1zovjYAVF/0z5UlSb9oqgb4F1DaLALpwqF/QGNw8RUqlooei2k1oJk2m0ycY/7P2u7BS6qbM85OAIAi0zlK/j1DKuBWsZ0DTl/SpzbMEPgOXbCfFXdAj3tgRVrjFGHKLQQrAz4k+rEBDnJydlt8PM8RmHPVTwjCcQHAejk554E/MPJPhsbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVLlYUIHGHDGSTHJAeTDyjw+b8aJUCpdC+onfys13gQ=;
 b=er93IXD37AgVgJfJ24aPE6DrCGacWd2C++Exl0NUfE575sJso+39UEKs9+R0ho5A6rWnTCaddzk9kkRd4qqFFNlvGwUN8N0dfe8az2UC1uiheb75fp10YbvPoF5IBKVoKIEPZ0UxNWBh6Pr86RRbVSNMzzY1kz/jiPtgemxqr9u1i33Wr1h8pETN6q/6JNW1Nhd320NT0Ehw4G1XBfjCN36lZXjsI6+h3mz6Kp8TrQ16ttM3f02VcnaXs5rwbl8x3an5q06iVVbnZXA4LG/2dgckOLtDlgaQTmJiKd5G1r2qy1kW9b9H2FXNoZGAGmmLxPhjTg7rhLmXGKvwNqkavA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVLlYUIHGHDGSTHJAeTDyjw+b8aJUCpdC+onfys13gQ=;
 b=RnRb2Pje/2td24rsvPLcecmvJ0wNA45IBLiYyEkQRpKZ6nwSFJiNKQFkHfhtTefvLUoMka0D/JtVnhq0Oo4THZA3W3iL5gLoxTpE7mpHm4ULwWL20neS5C+13Fk5mRmwT0uOLEayx3JWQNV64mYjRZZtLvClhLFWkt7aaVoUpJU=
Received: from BN9PR03CA0032.namprd03.prod.outlook.com (2603:10b6:408:fb::7)
 by MN2PR12MB3391.namprd12.prod.outlook.com (2603:10b6:208:c3::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Thu, 17 Mar
 2022 00:20:42 +0000
Received: from BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::34) by BN9PR03CA0032.outlook.office365.com
 (2603:10b6:408:fb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14 via Frontend
 Transport; Thu, 17 Mar 2022 00:20:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT045.mail.protection.outlook.com (10.13.177.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5081.14 via Frontend Transport; Thu, 17 Mar 2022 00:20:41 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 16 Mar
 2022 19:20:40 -0500
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [RFC PATCH 2/4] drm/amdgpu: Attach eviction fence on alloc
Date: Wed, 16 Mar 2022 20:20:04 -0400
Message-ID: <20220317002006.342457-3-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317002006.342457-1-Felix.Kuehling@amd.com>
References: <20220317002006.342457-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc57e17d-9418-44c3-b1c3-08da07abf8be
X-MS-TrafficTypeDiagnostic: MN2PR12MB3391:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3391B6DF1AA456A3A3022EAC92129@MN2PR12MB3391.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kCwckgURmFbWJt6F8dmJFo2H5hgaSqpXXxs8+OrNXsYpWPWCAwYAIVggeEPFpTNVzWo0TegHaAfZTlbrCbwtXC80yE/8KKEvYAKjUUbvYFVaObYiCvLl/BMbSPOHAj9ZV58MHkSNqElTZpSfEK5oNJRfQsZS40NPRqWtER0clDa3SOgbjONbBPKbnAMlWZkBjxlxw3Ah6kf136WjytT7wlIJ8yXGagc7g+gvK//rK3UwD/HYK4Usbazbx7Drzn+kR6TU5n7rTHMZYl+iUMNNWbqqdQFy6yggNteU3+8caA4/hrc0vWZCQrf/w18Ig1wLNHGz53gNmzu0MhnHLDAkCxE0+m93EeLJJxBkliUd0vdShSd/gjXDV95ehBiSg7035EX1kpGf3bLHx8tD1FOf/biFkfGUtX6qqz78MtHTEVBsKvBDoOHAaxm0m/2mRU3vI+VhOCFaFG+3XdhuF/demqnZcEKeVdUwPvUoMWhUEpAbZUcpXQShfs++sGX/fFmwdfoSwq29bEse6eA0qc/EzcgNl7ZQLdDdRLCufwTv/0q+29+oBd31nIaW5Q7xWRX8knZZiGFKCFYnhzwTwlb9/MJwO1py1Ja93q52UMxatyjpEZW2Uozwe/75JM184iM9DeJ558uFWtcil8Hp7sUho9ZSgiGReFaCZbuEJuGEH4fgbK6KgDn0VcuU9fV4TfOeK4fyhAgGnER7bptFBvkZRQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(36756003)(336012)(186003)(26005)(8676002)(4326008)(426003)(2616005)(1076003)(16526019)(47076005)(508600001)(40460700003)(6666004)(7696005)(83380400001)(54906003)(2906002)(316002)(6916009)(36860700001)(8936002)(450100002)(70206006)(70586007)(82310400004)(81166007)(86362001)(356005)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 00:20:41.8989 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc57e17d-9418-44c3-b1c3-08da07abf8be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3391
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
Cc: christian.koenig@amd.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of attaching the eviction fence when a KFD BO is first mapped,
attach it when it is allocated or imported. This in preparation to allow
KFD BOs to be mapped using the render node API.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 62 +++++++++----------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index d23fdebd2552..019e6e363fd2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -361,6 +361,23 @@ static int amdgpu_amdkfd_bo_validate(struct amdgpu_bo *bo, uint32_t domain,
 	return ret;
 }
 
+static int amdgpu_amdkfd_bo_validate_and_fence(struct amdgpu_bo *bo,
+					       uint32_t domain,
+					       struct dma_fence *fence)
+{
+	int ret = amdgpu_bo_reserve(bo, false);
+
+	if (ret)
+		return ret;
+
+	ret = amdgpu_amdkfd_bo_validate(bo, domain, true);
+	if (!ret)
+		amdgpu_bo_fence(bo, fence, true);
+	amdgpu_bo_unreserve(bo);
+
+	return ret;
+}
+
 static int amdgpu_amdkfd_validate_vm_bo(void *_unused, struct amdgpu_bo *bo)
 {
 	return amdgpu_amdkfd_bo_validate(bo, bo->allowed_domains, false);
@@ -1621,6 +1638,11 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		}
 		bo->allowed_domains = AMDGPU_GEM_DOMAIN_GTT;
 		bo->preferred_domains = AMDGPU_GEM_DOMAIN_GTT;
+	} else {
+		ret = amdgpu_amdkfd_bo_validate_and_fence(bo, domain,
+				&avm->process_info->eviction_fence->base);
+		if (ret)
+			goto err_validate_bo;
 	}
 
 	if (offset)
@@ -1630,6 +1652,7 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 
 allocate_init_user_pages_failed:
 err_pin_bo:
+err_validate_bo:
 	remove_kgd_mem_from_kfd_bo_list(*mem, avm->process_info);
 	drm_vma_node_revoke(&gobj->vma_node, drm_priv);
 err_node_allow:
@@ -1699,10 +1722,6 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 	if (unlikely(ret))
 		return ret;
 
-	/* The eviction fence should be removed by the last unmap.
-	 * TODO: Log an error condition if the bo still has the eviction fence
-	 * attached
-	 */
 	amdgpu_amdkfd_remove_eviction_fence(mem->bo,
 					process_info->eviction_fence);
 	pr_debug("Release VA 0x%llx - 0x%llx\n", mem->va,
@@ -1819,19 +1838,6 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 	if (unlikely(ret))
 		goto out_unreserve;
 
-	if (mem->mapped_to_gpu_memory == 0 &&
-	    !amdgpu_ttm_tt_get_usermm(bo->tbo.ttm)) {
-		/* Validate BO only once. The eviction fence gets added to BO
-		 * the first time it is mapped. Validate will wait for all
-		 * background evictions to complete.
-		 */
-		ret = amdgpu_amdkfd_bo_validate(bo, domain, true);
-		if (ret) {
-			pr_debug("Validate failed\n");
-			goto out_unreserve;
-		}
-	}
-
 	list_for_each_entry(entry, &mem->attachments, list) {
 		if (entry->bo_va->base.vm != avm || entry->is_mapped)
 			continue;
@@ -1858,10 +1864,6 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 			 mem->mapped_to_gpu_memory);
 	}
 
-	if (!amdgpu_ttm_tt_get_usermm(bo->tbo.ttm) && !bo->tbo.pin_count)
-		amdgpu_bo_fence(bo,
-				&avm->process_info->eviction_fence->base,
-				true);
 	ret = unreserve_bo_and_vms(&ctx, false, false);
 
 	goto out;
@@ -1878,7 +1880,6 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
 		struct amdgpu_device *adev, struct kgd_mem *mem, void *drm_priv)
 {
 	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
-	struct amdkfd_process_info *process_info = avm->process_info;
 	unsigned long bo_size = mem->bo->tbo.base.size;
 	struct kfd_mem_attachment *entry;
 	struct bo_vm_reservation_context ctx;
@@ -1919,15 +1920,6 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
 			 mem->mapped_to_gpu_memory);
 	}
 
-	/* If BO is unmapped from all VMs, unfence it. It can be evicted if
-	 * required.
-	 */
-	if (mem->mapped_to_gpu_memory == 0 &&
-	    !amdgpu_ttm_tt_get_usermm(mem->bo->tbo.ttm) &&
-	    !mem->bo->tbo.pin_count)
-		amdgpu_amdkfd_remove_eviction_fence(mem->bo,
-						process_info->eviction_fence);
-
 unreserve_out:
 	unreserve_bo_and_vms(&ctx, false, false);
 out:
@@ -2090,8 +2082,16 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
 	amdgpu_sync_create(&(*mem)->sync);
 	(*mem)->is_imported = true;
 
+	ret = amdgpu_amdkfd_bo_validate_and_fence(bo, (*mem)->domain,
+				&avm->process_info->eviction_fence->base);
+	if (ret)
+		goto err_remove_mem;
+
 	return 0;
 
+err_remove_mem:
+	remove_kgd_mem_from_kfd_bo_list(*mem, avm->process_info);
+	drm_vma_node_revoke(&obj->vma_node, drm_priv);
 err_free_mem:
 	kfree(mem);
 err_put_obj:
-- 
2.32.0

