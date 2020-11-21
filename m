Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5E42BBD3F
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 06:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCD66E985;
	Sat, 21 Nov 2020 05:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A4C6E983;
 Sat, 21 Nov 2020 05:22:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kg0JMvji1VXdHj60HV180+Z8QYnIPxolgLNpvIeKG3gXmXqJxQxyWvcPsCbyA1NGg2vi+oBAOVAytiyTTFIWRRL1z3SfKkrJe1yUwggwpsm/M52PX1oQYBONds+80vNDLQeLXqN5QSyFQsBWJZSXy4cNOqvKI+7jBmfDrWdflm7neLLgHHUTKNxr2AnA5SRXV+bmPvS7DvKLjXPuaVe3ZscgUYVwRx3CXifiQ/FHNsqeTXNlXN+OTnJr4Dk9aExfwAjhohr2ur7ZkSaXz4WQq24Y8DiMKL6ztSnZNPOxaj4mgnbhONqmD7caH7br7voMnQVzgV168met36Vzd61X0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsrozk3gekHp8aQM2w7jt4fHgrGLcAQ4RWpP0KtUvbQ=;
 b=ZWwrwKiuxnYOHGqEo/Fiv8b+Pwtbx2Z3m77dKZsntAwUDQQWZhAhSmmGIwmnkchUaTB29IvcfDQCspBMGFoHI/Ilxpg1EdZeYEbunodZOHHPM2b28UgzW/YiM64Kvqq4cCZa1iXL15ZFfSQKS6Je31hzjnFNaA+FpE7nHz9G/9WTUrP2LVjpV0PKsa0pVHI/e9TG+R4fqsOffHIyBwpDXAVCVYjpfY620rkqioOaiYVrEv/H1YiYsyK9ifk+dsb/zPlkJNu9L4rpAeBLcQm/v0vh2Vv3UsNvaE3gsbJqiAC0rXH7BoI5c8qGZLJxc89SD64rBpsD/TEoV4tiI2xtzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsrozk3gekHp8aQM2w7jt4fHgrGLcAQ4RWpP0KtUvbQ=;
 b=gWSXBUPAR8KBzbkGq8kTZq66ZQSWQYs8HFvQab7vYUzr+rZNQJgZ9USZTcQydzy46LrE6LNWV+9YctoWZoB1fpfh/CT2qF8y71R6HPvuFuYV599xg/7LDEQuorSNHFoy18OI4JfR6+nocHYYkgsdec+Okk8huHIXoAOn5yM8i0g=
Received: from DM5PR12CA0050.namprd12.prod.outlook.com (2603:10b6:3:103::12)
 by BY5PR12MB4034.namprd12.prod.outlook.com (2603:10b6:a03:205::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Sat, 21 Nov
 2020 05:22:12 +0000
Received: from DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:103:cafe::46) by DM5PR12CA0050.outlook.office365.com
 (2603:10b6:3:103::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21 via Frontend
 Transport; Sat, 21 Nov 2020 05:22:12 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT012.mail.protection.outlook.com (10.13.173.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3589.22 via Frontend Transport; Sat, 21 Nov 2020 05:22:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 20 Nov
 2020 23:22:11 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 20 Nov
 2020 23:22:10 -0600
Received: from ubuntu-1604-test.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1979.3 via
 Frontend Transport; Fri, 20 Nov 2020 23:22:10 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ckoenig.leichtzumerken@gmail.com>, <daniel.vetter@ffwll.ch>,
 <robh@kernel.org>, <l.stach@pengutronix.de>, <yuq825@gmail.com>,
 <eric@anholt.net>
Subject: [PATCH v3 12/12] drm/amdgpu: Fix a bunch of sdma code crash post
 device unplug
Date: Sat, 21 Nov 2020 00:21:22 -0500
Message-ID: <1605936082-3099-13-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0026c668-b2e6-49c6-acba-08d88ddd667b
X-MS-TrafficTypeDiagnostic: BY5PR12MB4034:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4034AECC995B84D588D08349EAFE0@BY5PR12MB4034.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K1gH245yGhsurSP9Hldjpe6qF2b2xMv8LlVBBcCkdKzPB9rTLY9IZ0bmS5R/oVw5T1bzhvMyMhtT1Z5CNcB3ex2EbfY8mgeEus3N7weiI2Vqt7CYsDPQ0RdL+tNZfFk/uhQ5ppY5ULbCOBaT2QRwuGqcf+6Cxz8Kwl43faKqE2N8GMQTX16c7WWX8TjE2hqnywFkDqOjRdcNxCYrdWykNSWhGjNXnj09GoDG3gk1O7CU+TBm/tmiVvAKPBrK4NnIoF7tCmWipRL5xUhHErkwVoKK8uMlau09raukxc76Yt3g9gUkBla147LeWEwZ/WE81VYUjkJuHYNHVFvU8pvHKrZZ130dc9VDIrxyVbBw4EkbSpivKLXIE8zkyYVxWCVmbHh4gA3ZjO4VU7vOadj7Ow==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966005)(70206006)(70586007)(6666004)(47076004)(4326008)(356005)(8936002)(2616005)(36756003)(7416002)(82310400003)(336012)(8676002)(82740400003)(26005)(86362001)(81166007)(5660300002)(2906002)(316002)(186003)(54906003)(44832011)(478600001)(426003)(83380400001)(110136005)(7696005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2020 05:22:11.7886 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0026c668-b2e6-49c6-acba-08d88ddd667b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4034
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We can't allocate and submit IBs post device unplug.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index fdbe7d4..a62ad20 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -31,6 +31,7 @@
 #include <linux/dma-buf.h>
 
 #include <drm/amdgpu_drm.h>
+#include <drm/drm_drv.h>
 #include "amdgpu.h"
 #include "amdgpu_trace.h"
 #include "amdgpu_amdkfd.h"
@@ -1602,7 +1603,10 @@ static int amdgpu_vm_bo_update_mapping(struct amdgpu_device *adev,
 	struct amdgpu_vm_update_params params;
 	enum amdgpu_sync_mode sync_mode;
 	uint64_t pfn;
-	int r;
+	int r, idx;
+
+	if (!drm_dev_enter(&adev->ddev, &idx))
+		return -ENOENT;
 
 	memset(&params, 0, sizeof(params));
 	params.adev = adev;
@@ -1645,6 +1649,8 @@ static int amdgpu_vm_bo_update_mapping(struct amdgpu_device *adev,
 	if (r)
 		goto error_unlock;
 
+
+	drm_dev_exit(idx);
 	do {
 		uint64_t tmp, num_entries, addr;
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
