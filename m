Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF5F6304B6
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 00:45:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E05010E82D;
	Fri, 18 Nov 2022 23:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::611])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E070F10E822;
 Fri, 18 Nov 2022 23:44:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TshNBiUwo0nHro3jy6pHZUXfz10pd71bbuyFQbebycSAqo+UoVGEPh05RTX4T7476VrdSFVudfA7vkSIp3P8BpPVFvn+4Yh2isrdS4Yrnd1t3o4+qOD0kumth9BH84rRB5d+yV7jmSmQsCiCgMij8/u+Du8KPxeU+WcWdBdkG8DP2JF2342md3dtT3xm7PvSeoduPUNht48n7XSZwjv/qTqW+poukrQjUbXGp84APJRyPEYdPMCQlO8UT7MtkXSVq2J574QvazFiGwKR8qoQZ/KslrrErToR2WeYqSUMlDE2CYT7OQ5xR1AKoucXCWU+ZSxDPlMkj6KmnF5H+pqrJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rHwDlwC5Ppk5MBrNaHtl6E2VCkfhWbOCgEKSpuHgEwQ=;
 b=XomJeqOyv1I4ttd/G6k3ShFH5othuuDTnIVwdjYmO6HUOiMpLicahZ43WToepzL2KhlzKpkAMCLvKTb09XKVnYx148YiOJhlP2BKbmhn1mUUIhXYDtt2Q9deTk1lgE+ziZURMOkX9JkX4Rz1xp1wutQKdq8Pipla4zNd8UbqZztivbnq00go2A7HMtgSxGMdVVPHqrnDtD1fno5L9BXV86VH2NbxBWMg78OU/gGwoS6YzvyNALDzbTaJ4i9Lr5VPmYkeW3mXLcufUFq6B1jDVCB3aXqM/o3IuLJc92Qk0vF7m7/X+iTsBDXsyDBYFzxgC9p+Q4XdLMgrjDwF5bLniw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHwDlwC5Ppk5MBrNaHtl6E2VCkfhWbOCgEKSpuHgEwQ=;
 b=wgprWvoRKkWBz4ODbcawiVIG2Vr8Q/T632ZzcemDtodbY+qr0rX0ecPj7v47X760fMxpyXs0B/ihE4k+nDQPok3VyW2I9I+KU5Z8yUcJtUT7pJ9IPBNQUQCSIjG7ntiBqnLNx8X1JaX/M9GST2GSvbXc+1tToXDLpipFN8ewQ2M=
Received: from DM6PR03CA0058.namprd03.prod.outlook.com (2603:10b6:5:100::35)
 by PH7PR12MB6955.namprd12.prod.outlook.com (2603:10b6:510:1b8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Fri, 18 Nov
 2022 23:44:39 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::5) by DM6PR03CA0058.outlook.office365.com
 (2603:10b6:5:100::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Fri, 18 Nov 2022 23:44:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 23:44:38 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 17:44:36 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/6] drm/amdgpu: update mappings not managed by KFD
Date: Fri, 18 Nov 2022 18:44:21 -0500
Message-ID: <20221118234422.1468806-6-Felix.Kuehling@amd.com>
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
X-MS-TrafficTypeDiagnostic: DM6NAM11FT014:EE_|PH7PR12MB6955:EE_
X-MS-Office365-Filtering-Correlation-Id: b02293d2-142d-47b4-e238-08dac9bedb4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4iEsZYkEDOQf/5ZIx7PFV5LKpG2lePIVeGGItpxqo2IH1m61fENnXtWBQY2J1y7X4ydn3VifYTMHqaeavGvZ7lmdrUEtuYgzqaAj3mBQcmYEhrHc78PqOAe2erRXI7SnpG3jkcWQTgMZc6CMj2hR80PKzVRBipVz+l/Gf7f4blc6c2OhBwUdXT8I0vP3VT/E4jxV3sGtMWvzuw1LKJW4N9CJa/B4LT1wTLfLxa0mCsqX8zjwgpE5sLTpRuDkbRUipfy4oQkQpeRTwcvcyXpWpWMvX7To24eAoUOrqV6+9O/CWX1VXFDfDq6NJob+ULs7jzYBcYtvhlpbvphvgZ+BdkJmyZ/jBQlUZpLzF+HUjSzBvgmNqB+r4wyfyxZzoEQ0mJ6re/YeA4PG1nhwVosMlbC56q+2/+G5w9gMS+kaaAC38D8KAWoxQfgxkHndc9mIZnKIiHbQQ3C6h3raWP0yQ4ZCPb302XDtc83gZ88pEaljfR0SpApK6Yumeg8b/9QpUgdvMie1Ee2p72y/sDxxQKJJ5BHZkBRXJ+y/dfwkMLRo2FWOb/BAt0aOehJ6EqL81XV91A/0v81hBgFLh9z78HZqQ/81HTZrDW8yevsyRxS4sZrAeoi96xL1rLe3PKqlpSQJAtYYp5CYfTcHCD8h/nHaF2Lok1CL9gZ1vlgy56UYd4fYjOOGDXWX/4k6O564nn5anlg8CAaWiJLiAB2NnfbH06X6qJbndeQE0MZTEPs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(356005)(40460700003)(110136005)(41300700001)(82310400005)(316002)(186003)(8676002)(47076005)(70586007)(81166007)(450100002)(5660300002)(70206006)(1076003)(83380400001)(336012)(82740400003)(15650500001)(86362001)(36860700001)(8936002)(2616005)(2906002)(478600001)(426003)(36756003)(40480700001)(7696005)(26005)(16526019)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 23:44:38.5914 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b02293d2-142d-47b4-e238-08dac9bedb4e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6955
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

When restoring after an eviction, use amdgpu_vm_handle_moved to update
BO VA mappings in KFD VMs that are not managed through the KFD API. This
should allow using the render node API to create more flexible memory
mappings in KFD VMs.

v2: Sync with pd fence after all page table updates
v3: Update comments, remove TODOs that are no longer applicable

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 28 +++++++++++++++----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index e13dff75ca5c..ecf81f27cb4b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -2655,12 +2655,6 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 	if (ret)
 		goto validate_map_fail;
 
-	ret = process_sync_pds_resv(process_info, &sync_obj);
-	if (ret) {
-		pr_debug("Memory eviction: Failed to sync to PD BO moving fence. Try again\n");
-		goto validate_map_fail;
-	}
-
 	/* Validate BOs and map them to GPUVM (update VM page tables). */
 	list_for_each_entry(mem, &process_info->kfd_bo_list,
 			    validate_list.head) {
@@ -2708,6 +2702,19 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 	if (failed_size)
 		pr_debug("0x%lx/0x%lx in system\n", failed_size, total_size);
 
+	/* Update mappings not managed by KFD */
+	list_for_each_entry(peer_vm, &process_info->vm_list_head,
+			vm_list_node) {
+		struct amdgpu_device *adev = amdgpu_ttm_adev(
+			peer_vm->root.bo->tbo.bdev);
+
+		ret = amdgpu_vm_handle_moved(adev, peer_vm, &ctx.ticket);
+		if (ret) {
+			pr_debug("Memory eviction: handle moved failed. Try again\n");
+			goto validate_map_fail;
+		}
+	}
+
 	/* Update page directories */
 	ret = process_update_pds(process_info, &sync_obj);
 	if (ret) {
@@ -2715,6 +2722,15 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 		goto validate_map_fail;
 	}
 
+	/* Sync with fences on all the page tables. They implicitly depend on any
+	 * move fences from amdgpu_vm_handle_moved above.
+	 */
+	ret = process_sync_pds_resv(process_info, &sync_obj);
+	if (ret) {
+		pr_debug("Memory eviction: Failed to sync to PD BO moving fence. Try again\n");
+		goto validate_map_fail;
+	}
+
 	/* Wait for validate and PT updates to finish */
 	amdgpu_sync_wait(&sync_obj, false);
 
-- 
2.32.0

