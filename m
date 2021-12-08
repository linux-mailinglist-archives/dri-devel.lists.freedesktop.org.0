Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD8E46DD4A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 21:54:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555FF6E8BE;
	Wed,  8 Dec 2021 20:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2043.outbound.protection.outlook.com [40.107.102.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C046E8AA;
 Wed,  8 Dec 2021 20:54:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eU2VAQR2ZVeGXWv5joi/XHkjHp0qFkDcXYxCgsqIHdvlWLIfKmq8E8neWj3Xuy9CIMnq0sJ3cHgsIeavH014oB/mxJgKz5CpP6fIzbkTaeFQ2ZuaEMYKb7RG8mouMiW7XUTVRe9hgvrgIdkJYomWyT2EpKKrlq6yzs8iPVTEsXsQW/DqYeBzzHVktiGC/NmPAezyqdSrW6uNrHmM4M3jqFWAfBB9q5Jd2GjREKqchIpKAaC6qwEiJSSJIlnFOQO8Nab9/TrfRFqUikUlr7F5ceUyxzW0RfbwF60Gq5Np9IVPJSBeDa6PD6s+//QOYfk8jbpwu/UaeM0hfYEj38l8Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tcc9h4EbgsyotCesshM2fqMwVEPPGXgtknZEvn/KBx8=;
 b=CTkavNnFHsHw9a7YxfULFxRjH2BBYbeCSlRP/dtbcWUXrtK3f+xoA3s9DkK3mzA/xG1PxPquZcUHO0aoNERAm885LiAt8fTIwv4v9oPX40UPen0Jr4+jNnEyGu1w9D8XNgoBk/+9inrRMnZFdneA9bBiBRJwMLjgA2U0HehVkLuJOXrTRPTo2hUxj4k58NS3T0pcfqGAOTmCCYylfC2Fk3KZi0R8qYigrByw4w1Mgmk/84FCN5jVQG7X4YZ0A8xiNCIWUnJxKNfnn44o6Q895DTOMh/No8CUuAzQu/chXmzchFv41myyBn9GhA2FBR+OTK7RgXkoLMFiKdubT9OGJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tcc9h4EbgsyotCesshM2fqMwVEPPGXgtknZEvn/KBx8=;
 b=nTUvNF67qer2Mwi/PCCHQTIWFM9yuG4WjRFY2eQyhDRgY86Vjo1/NG+C/t7p62nSZIhhDHC7WFx0vwPDwfR5TOGsZ5XblmWNWarwkP9uzoETdHeh9k8kf8PM1BOy3sgZ86CGJcG6/00U41Frd478U9L00D9+Y4XJcv67tihmr/8=
Received: from BN6PR11CA0049.namprd11.prod.outlook.com (2603:10b6:404:f7::11)
 by MN2PR12MB4303.namprd12.prod.outlook.com (2603:10b6:208:198::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Wed, 8 Dec
 2021 20:53:58 +0000
Received: from BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:f7:cafe::f7) by BN6PR11CA0049.outlook.office365.com
 (2603:10b6:404:f7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Wed, 8 Dec 2021 20:53:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT007.mail.protection.outlook.com (10.13.177.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Wed, 8 Dec 2021 20:53:57 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 8 Dec
 2021 14:53:56 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
Date: Wed, 8 Dec 2021 15:53:44 -0500
Message-ID: <20211208205344.3034-1-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 328691fe-0f6f-400d-4d19-08d9ba8cdb2b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4303:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB43034BBB71C8B2FB350B03FFFE6F9@MN2PR12MB4303.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6BK2iFyauzEkjgWrCRB3zSANfUKXiuOwLuvPp0Wx6AcHUmGVTVA5pK74UDLIu8/1jTFiN3e2/V7+RZt0AszsX6hUvTQfzx+IXE6Gy88BFo/UttV8fTAQj6aWAzFFB/K7lcsk5s4M5IUBSDKVt1R4EPKjeN8qY/RuOseW+HrpLPZe75SHvqrBg9131jQD6xvfBgkoLnFu7d0j2RoILneq0iv8x+bNaeI8sV/m8GikscyA5/b4H1pCuGOJoklasKhj0jmI316Jw1NbFoT1OuVkq5eulmZczdHvNpJh/S5INQ0v3E8/aXM5d8kZfrkpRfkTb0AJ15Tacr7sRGYEeSUmZYHVXqH6jYY5bxz+7YzKrHsXROKjULJdV8Wxawg2o4mw8YuqBK3nKXBhTZ8/zilWtkvFN1n0DbKIr91l88BLRXwY+JCJyGOU77hageIGble927HUReo7Q7Y2Erhf85PJg2eWylQ39zPvIQum4gdxbPQdc94lGH7hGzRLhHCeFpvUUXZOq6K2a8foIhxsCHpY0ArvQH2f1UesMp1qHwEMMlPzDleIL4AC0vcbnepysjk4MwLQIy7NkVlCnuzCgogeJkrnD+oScCzJ4HVQIp50gJtg9OmfusuXBr63vSNKRJSBZN9b30wgyufgOLDZ5iLT9h5UZINT6gTYbOh1TCDWdyZSkw27BS/LI9KmwEwpIt7mKlVKNOke175qQQJKX6lyjFJfY6JYcOi19c1fcRon0xchAHna1QbDMH9ceNtopfskI31jdmzJbh60QlD9gx9DsUe/vE0byJLx629GMggwIT4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(8676002)(83380400001)(86362001)(356005)(81166007)(8936002)(1076003)(40460700001)(7696005)(82310400004)(508600001)(2616005)(44832011)(5660300002)(426003)(186003)(2906002)(16526019)(70586007)(70206006)(54906003)(26005)(36860700001)(4326008)(36756003)(110136005)(47076005)(6666004)(336012)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 20:53:57.8622 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 328691fe-0f6f-400d-4d19-08d9ba8cdb2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4303
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
Cc: daniel.vetter@ffwll.ch, Felix Kuehling <Felix.Kuehling@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>, David
 Yat Sin <david.yatsin@amd.com>, alexander.deucher@amd.com, airlied@redhat.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When an application having open file access to a node forks, its shared
mappings also get reflected in the address space of child process even
though it cannot access them with the object permissions applied. With the
existing permission checks on the gem objects, it might be reasonable to
also create the VMAs with VM_DONTCOPY flag so a user space application
doesn't need to explicitly call the madvise(addr, len, MADV_DONTFORK)
system call to prevent the pages in the mapped range to appear in the
address space of the child process. It also prevents the memory leaks
due to additional reference counts on the mapped BOs in the child
process that prevented freeing the memory in the parent for which we had
worked around earlier in the user space inside the thunk library.

Additionally, we faced this issue when using CRIU to checkpoint restore
an application that had such inherited mappings in the child which
confuse CRIU when it mmaps on restore. Having this flag set for the
render node VMAs helps. VMAs mapped via KFD already take care of this so
this is needed only for the render nodes.

Cc: Felix Kuehling <Felix.Kuehling@amd.com>

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/drm_gem.c       | 3 ++-
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 09c820045859..d9c4149f36dd 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1058,7 +1058,8 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
 			goto err_drm_gem_object_put;
 		}
 
-		vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
+		vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND
+				| VM_DONTDUMP | VM_DONTCOPY;
 		vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
 		vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
 	}
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 33680c94127c..420a4898fdd2 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -566,7 +566,7 @@ int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo)
 
 	vma->vm_private_data = bo;
 
-	vma->vm_flags |= VM_PFNMAP;
+	vma->vm_flags |= VM_PFNMAP | VM_DONTCOPY;
 	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
 	return 0;
 }
-- 
2.17.1

