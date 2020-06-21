Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0184B202912
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jun 2020 08:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605746E435;
	Sun, 21 Jun 2020 06:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6B46E46E;
 Sun, 21 Jun 2020 06:05:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZsUz83fI0CVhDsJSk4vQkWD1Ylli6UmX163x7arJ16a2x8U0ocfsMhJkM5mryjZIGM63dzHlN9QMWyVdWhvb1hvWShIyeQKl+k/nMzs5fBDesrhaI79ohvWnCQV8T8W7ws6bbcbSgy24w05dIKFBhZuyf/oQ4UH2iLZ35ZUtLbi+3Td5GEOwP7biyn2VA4AmZe/UbL5qg8/iRgnPeylVBpy0lCZsVI1+l4obEL53hEFoG1wrc4BVkEotPJRO/FpF7707FSwpVXDI1AjQBKdqpyprssQjZXi5F5REZvZP0Ijkbn6SRj6urpNPJK966pDfIUcmt6PnDYSl2yYeogXgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWbJvVp7IuCrsCYEhlhEzkyhqVj4OaLruQXzNsKht7k=;
 b=aEagy46gHbt4F4+2nSqE36S5XkoXVl8TdCbhpIaSDEorBTqa1WekVPx/4eOb2pjAyAhJ66dTaeJhbUD7VrC2/qPg8atDSi21WzuovpKd+xO20MXzMQ4n3CSKk/P6BuAVGZtJmb2JOvqsFTtsdFHhiZ7a3Bt3QUG7h6oB/AkylIf/7lTmDA+aPWjWN6a08LcMpY8FOfubeGxdlEFQJpDAt2lbmguTGR7+ZOMvL9gqLQPReVcrVKbwqEfjtRDRlAwdQj051hnhnblCiBAJVn2ndGaXZSCnCm2yPVUGVhbN7P9pDBhBCOK5m0D/cpBby7qM/rE8iwIj48W/sOad224FrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWbJvVp7IuCrsCYEhlhEzkyhqVj4OaLruQXzNsKht7k=;
 b=oL1zLciTVEJ3GJ8m4X1OsZPn0W/oRgOfSUmrqZZDWshBiMQS697Ax0gtKph0lo6B2oyxfCC6WPmXpx18UM0yUb4Nyh4Xw3dsu9dMHPkFGiAzJJP8Uehmr8NZMH+IwFjUlGMHIHXLNSVdUMJaj83A0phL14vRW9Z2St1K8M4zVm8=
Received: from DM5PR12CA0011.namprd12.prod.outlook.com (2603:10b6:4:1::21) by
 BY5PR12MB3777.namprd12.prod.outlook.com (2603:10b6:a03:1a9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Sun, 21 Jun
 2020 06:05:48 +0000
Received: from DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:1:cafe::57) by DM5PR12CA0011.outlook.office365.com
 (2603:10b6:4:1::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Sun, 21 Jun 2020 06:05:47 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT052.mail.protection.outlook.com (10.13.172.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3109.22 via Frontend Transport; Sun, 21 Jun 2020 06:05:47 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 21 Jun
 2020 01:05:46 -0500
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Sun, 21 Jun 2020 01:05:45 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 7/8] drm/amdgpu: Fix sdma code crash post device unplug
Date: Sun, 21 Jun 2020 02:03:07 -0400
Message-ID: <1592719388-13819-8-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(46966005)(70586007)(70206006)(478600001)(7696005)(86362001)(186003)(26005)(8936002)(5660300002)(36756003)(8676002)(6666004)(2616005)(4326008)(426003)(336012)(44832011)(54906003)(2906002)(82310400002)(82740400003)(83380400001)(47076004)(110136005)(81166007)(316002)(356005);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8c810c6-0c97-4b4d-9ae7-08d815a9247a
X-MS-TrafficTypeDiagnostic: BY5PR12MB3777:
X-Microsoft-Antispam-PRVS: <BY5PR12MB3777F899B55FA073F1D6401BEA960@BY5PR12MB3777.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:165;
X-Forefront-PRVS: 04410E544A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: djjX+oz3HObDeEOdsO24Mm2eiaTIIMbkFjlRslYbAz9B/aew5EC78CcIhx6woQUCFYxVjVih1ylJLKADetQdxarqV3UDac3nn0GfTrRuRrKWSXUvJuVjRTcC1LUORUNPp8O0Ua0kJ5zu1afak5i9jemXE+pnFJ4EYerofIOdhp98hMdQvMZlVx6YrUFkHWOa+9AZDQtM5e2ICFz7M9ykdsXBLb7M/J6hS+fZJ41C92Ugt86J1yYtXDwMIpQ2VVTcW3++uEy/X/fzDWIUG1JHINUWQ+HIXGwewRRJha0K0rrQDuXY7aqK33+ycckpeVTgVERbrDejiV5sIoHtldXqrpZkf1U/89X+aE990Wq2A00kuevINzcFCnOyhtF4HqwyaDHwdgYK12RyToyxQvmqtA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2020 06:05:47.7756 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c810c6-0c97-4b4d-9ae7-08d815a9247a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3777
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net,
 ckoenig.leichtzumerken@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

entity->rq becomes null aftre device unplugged so just return early
in that case.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
index 8d9c6fe..d252427 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -24,6 +24,7 @@
 #include "amdgpu_job.h"
 #include "amdgpu_object.h"
 #include "amdgpu_trace.h"
+#include <drm/drm_drv.h>
 
 #define AMDGPU_VM_SDMA_MIN_NUM_DW	256u
 #define AMDGPU_VM_SDMA_MAX_NUM_DW	(16u * 1024u)
@@ -94,7 +95,12 @@ static int amdgpu_vm_sdma_commit(struct amdgpu_vm_update_params *p,
 	struct drm_sched_entity *entity;
 	struct amdgpu_ring *ring;
 	struct dma_fence *f;
-	int r;
+	int r, idx;
+
+	if (!drm_dev_enter(p->adev->ddev, &idx)) {
+		r = -ENODEV;
+		goto nodev;
+	}
 
 	entity = p->immediate ? &p->vm->immediate : &p->vm->delayed;
 	ring = container_of(entity->rq->sched, struct amdgpu_ring, sched);
@@ -104,7 +110,7 @@ static int amdgpu_vm_sdma_commit(struct amdgpu_vm_update_params *p,
 	WARN_ON(ib->length_dw > p->num_dw_left);
 	r = amdgpu_job_submit(p->job, entity, AMDGPU_FENCE_OWNER_VM, &f);
 	if (r)
-		goto error;
+		goto job_fail;
 
 	if (p->unlocked) {
 		struct dma_fence *tmp = dma_fence_get(f);
@@ -118,10 +124,15 @@ static int amdgpu_vm_sdma_commit(struct amdgpu_vm_update_params *p,
 	if (fence && !p->immediate)
 		swap(*fence, f);
 	dma_fence_put(f);
-	return 0;
 
-error:
-	amdgpu_job_free(p->job);
+	r = 0;
+
+job_fail:
+	drm_dev_exit(idx);
+nodev:
+	if (r)
+		amdgpu_job_free(p->job);
+
 	return r;
 }
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
