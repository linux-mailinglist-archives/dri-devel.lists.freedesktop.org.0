Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A257A4DBB9D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 01:20:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7350810EABC;
	Thu, 17 Mar 2022 00:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7897710EABA;
 Thu, 17 Mar 2022 00:20:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtJm04GtcTgYA4zFphwXKqN+bDBQG2Jvdh9Y6gYfka89CpPog/OFnBMJiCbkArrqV1P+OBskfjLuQRwvk4IM4Ll5AM+ELlY7kefaduTuLG2z7L/hC2WeIVZ4W8+/tvBeCNI2TBpxNO7X6SYdDS4PFFnBfIXhvSVkW4PuDIbHBbyLRVQPvAVj583Ys17TiTMy8J9rzYeqcEYWiesE2t74fzxeXMTfnsLdom3coG/Lh7v6BiTeedHnJU2dK+WmXVLpRT5WRLidLZuW2gJtDbvfYE3f3oAeiFfr1nxCKWc1bMdPbcduYNsHFHPRlCl7VjeI0jVZyS4ksKcbMGT3sJQphw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6Ei4IO43jKEUrpU5Q75ITNG3B3tpUZb9RwKIxJcSN0=;
 b=oDNOrk1JbXAtocu29nU4WTGUyPIgFbFxItv8uzcMotiYCu07h+LtZnB2TZN7O8SCsliMp86dR5sIKiYQVe0C8JSqnPSKTHQg6mwK3bFEdaHNe/QhdNcxIgoJ/bxJkagIjW8oleBD5oyRX0nH/q5+VY7Uin1zW9XrU0FLx4uLe/mt0gPdi3uSnFpxhtWrgoJPFlfk8AA8Pedh36PRYLZ2p6tPmol6T1/BASzWRU/4LSV6g50k/Z83eJHtD2uHrW7QhrdmA2BfWjHKlEb8nMQR9A+FZFPk5LhhbYT8+7/t426kDinJ6YkGuqywS9n6X9IZVItncgkm9gLydN86pOU6dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6Ei4IO43jKEUrpU5Q75ITNG3B3tpUZb9RwKIxJcSN0=;
 b=5c/b8Ey/jJHwYbsrTuP3uvCKHuExHWkemCrnrBje1FVOUjeP0Op9P5BNLI2KXQMFKCp+YS7ABZi0CWhppDnAplTpL7+Aplmy3YZOPeWZTQLaHQFpZI5DNDrISYyGu1B0DFphNyCBqTIGEP6YPtgIdG5P0MWLJsIP/Xocea7sF5g=
Received: from BN9PR03CA0045.namprd03.prod.outlook.com (2603:10b6:408:fb::20)
 by BN9PR12MB5308.namprd12.prod.outlook.com (2603:10b6:408:105::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Thu, 17 Mar
 2022 00:20:44 +0000
Received: from BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::99) by BN9PR03CA0045.outlook.office365.com
 (2603:10b6:408:fb::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17 via Frontend
 Transport; Thu, 17 Mar 2022 00:20:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT045.mail.protection.outlook.com (10.13.177.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5081.14 via Frontend Transport; Thu, 17 Mar 2022 00:20:43 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 16 Mar
 2022 19:20:42 -0500
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [RFC PATCH 4/4] drm/amdgpu: Do bo_va ref counting for KFD BOs
Date: Wed, 16 Mar 2022 20:20:06 -0400
Message-ID: <20220317002006.342457-5-Felix.Kuehling@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: bf255dcc-45c3-498a-db6f-08da07abf9d0
X-MS-TrafficTypeDiagnostic: BN9PR12MB5308:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5308404B5CC7F9DD3FE051B492129@BN9PR12MB5308.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1rDzJrZFg6qOhXPBp6ZwGZeCjPlJMqgBsB8bx+1SNYq90V5y+oh7fOIEtrGqD2KWOa37O8HcJIAoeeoAFVAKGrPUiHlVthweHPAjW1ZAORDEVgpTVVPvgMpMo4C2kCxkTcX+a2ZtCFj8Y95FbbAr+75+6jmWVpwhLmiCh2JMCKhDyUsP26Wk5kRdKTgXU++D1dInYvd/uallPvbu+F9hW+1uG5wkXTfor5HeLzFQPcLJ1w17z8VjPQgOhDZ3dvWqSDdcVWaxZOAHfOfS0Uubo3yHxEAAuEOjsTU7S5onvMcvIthCGZyaKtgQd06LQabjK+OtFtKYLDYdbmaHdyXqFnRB82GZ7nmnyv/pTtlNtWxHpwHSYIKOt5XivvpE/3xbekA61VP3Q57joJJUH28lJ1dQyy5LAZLZ9iKo41y8TebwTCoRLWOyCGV/5zVqJSKTVN3j1tqrEGiJWg5vhlWcZ4NGxTEKiVwsb9IM0ho32q4ResI9xiKmWuxJ8LvGFfcXYofFbV6rPahATjSIeMewX061YtkQAdRT2VC0q/HNMeoF2Q0OwCMuOUYY8oKsibFD/+T51wR5xAs9eA3eYMvffxrxPw1OIN+X1UwII3KaU1Ugbwe0rfUbWdVWyn6Ej/jp/fgXVF0Gw5JCf+SCFwqSJIHiohi9bG9j7oSx68zvIVFnaV2bo7RO4e6jzsX4qoMMknO+MNuOKVNcBagnEjCqCw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(4326008)(86362001)(82310400004)(8676002)(83380400001)(450100002)(70206006)(47076005)(70586007)(16526019)(36860700001)(426003)(336012)(2616005)(1076003)(186003)(26005)(356005)(81166007)(40460700003)(508600001)(8936002)(2906002)(54906003)(316002)(7696005)(6916009)(5660300002)(36756003)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 00:20:43.6644 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf255dcc-45c3-498a-db6f-08da07abf9d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5308
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

This is needed to correctly handle BOs imported into the GEM API, which
would otherwise get added twice to the same VM.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 26 +++++++++++++++----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 6f90ff4b485d..bf90b2fa2738 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -371,8 +371,16 @@ static int amdgpu_amdkfd_bo_validate_and_fence(struct amdgpu_bo *bo,
 		return ret;
 
 	ret = amdgpu_amdkfd_bo_validate(bo, domain, true);
-	if (!ret)
-		amdgpu_bo_fence(bo, fence, true);
+	if (ret)
+		goto unreserve_out;
+
+	ret = dma_resv_reserve_shared(bo->tbo.base.resv, 1);
+	if (ret)
+		goto unreserve_out;
+
+	amdgpu_bo_fence(bo, fence, true);
+
+unreserve_out:
 	amdgpu_bo_unreserve(bo);
 
 	return ret;
@@ -716,6 +724,7 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 	uint64_t va = mem->va;
 	struct kfd_mem_attachment *attachment[2] = {NULL, NULL};
 	struct amdgpu_bo *bo[2] = {NULL, NULL};
+	struct amdgpu_bo_va *bo_va;
 	int i, ret;
 
 	if (!va) {
@@ -779,7 +788,12 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 			pr_debug("Unable to reserve BO during memory attach");
 			goto unwind;
 		}
-		attachment[i]->bo_va = amdgpu_vm_bo_add(adev, vm, bo[i]);
+		bo_va = amdgpu_vm_bo_find(vm, bo[i]);
+		if (!bo_va)
+			bo_va = amdgpu_vm_bo_add(adev, vm, bo[i]);
+		else
+			++bo_va->ref_count;
+		attachment[i]->bo_va = bo_va;
 		amdgpu_bo_unreserve(bo[i]);
 		if (unlikely(!attachment[i]->bo_va)) {
 			ret = -ENOMEM;
@@ -803,7 +817,8 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 			continue;
 		if (attachment[i]->bo_va) {
 			amdgpu_bo_reserve(bo[i], true);
-			amdgpu_vm_bo_del(adev, attachment[i]->bo_va);
+			if (--attachment[i]->bo_va->ref_count == 0)
+				amdgpu_vm_bo_del(adev, attachment[i]->bo_va);
 			amdgpu_bo_unreserve(bo[i]);
 			list_del(&attachment[i]->list);
 		}
@@ -820,7 +835,8 @@ static void kfd_mem_detach(struct kfd_mem_attachment *attachment)
 
 	pr_debug("\t remove VA 0x%llx in entry %p\n",
 			attachment->va, attachment);
-	amdgpu_vm_bo_del(attachment->adev, attachment->bo_va);
+	if (--attachment->bo_va->ref_count == 0)
+		amdgpu_vm_bo_del(attachment->adev, attachment->bo_va);
 	drm_gem_object_put(&bo->tbo.base);
 	list_del(&attachment->list);
 	kfree(attachment);
-- 
2.32.0

