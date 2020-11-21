Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDD52BBD3B
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 06:22:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8536E980;
	Sat, 21 Nov 2020 05:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E106E97A;
 Sat, 21 Nov 2020 05:21:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DPGeaGIHFJRQZmtb4AWK95kUXaHF2+Syq87USaqCca6Fw1PIUCcewoqQyXKMlVKhigZo/DIWrxAqNHs/pI1as4Xgz5tlfPxHVF4G85mqnO001tFlQT74QAou1llNWWQ4HV4UnBYAPDABdh9bMCarO/lpsjLJzKbeUJIHnio7d979B+qO400tPq+IJdl58aYW6sX5HpX7uSXm+FclbnLgw/tum2oeFruacwqqXxNPMXC8S3BsnrvLpzlEzE9jH/IbsQNQ/CaTeSRLmzQg/rOo0dZWhLgq5WNxBUdFbT8DLBRs+IPzBcq/NXrnHbZZYifgUtgJ7XzFUJsCXGkoOkVo/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqvJ0ki6km4calgkaeOmhsKH+BuDCHRao+v76nQRuTU=;
 b=FaKPNcQMRh9DOL+wooT4nVF9oKwKgvdINAM8rHQtZi9bCIP/c6c97L7FEaujgKBnnfU/r/ty7VmtAjp19U8lV3JhcmqG3XDpnz7EPiHY0Ht3nUB036Wd4aTJfdT8h+AglAavVJIfO6mdBxZoMkVwkmerbbBZkQ17psujmZ3e9v8+4i89fRmTJDXvE720TqzYZuEeu6TaLlqMFvdQQxkeGGHuDg857M1DezRfkx9pQ2RomxphOQhtbz28wJBDsqJxnbpcZPAPn67oHHwFBM23vb3vqzTTUkdctBaZMdYsHZgw28eSljYAyBIrtpCJNsXQGw+jJzj4e5G83dsulWHo8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqvJ0ki6km4calgkaeOmhsKH+BuDCHRao+v76nQRuTU=;
 b=cont+OEiVgBmrVk8Ca70yDBU/1Z0U6YGlG8fRgU/gtxcfaIg2Q01iBk+E46U4/ZPGd+PTzEGP2HsDzUiR3KvqEeUv+H1T8JZwH5wQbGsI8Tji6+z6omcZ9a1P/YUbWm35X7n1/MH8yeoj6CTLJFuvdCboFAMRkSSEkFxYShSTZg=
Received: from BN6PR04CA0098.namprd04.prod.outlook.com (2603:10b6:404:c9::24)
 by DM6PR12MB4025.namprd12.prod.outlook.com (2603:10b6:5:1c8::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Sat, 21 Nov
 2020 05:21:44 +0000
Received: from BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:c9:cafe::96) by BN6PR04CA0098.outlook.office365.com
 (2603:10b6:404:c9::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Sat, 21 Nov 2020 05:21:44 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT028.mail.protection.outlook.com (10.13.176.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3589.22 via Frontend Transport; Sat, 21 Nov 2020 05:21:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 20 Nov
 2020 23:21:43 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 20 Nov
 2020 23:21:43 -0600
Received: from ubuntu-1604-test.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1979.3 via
 Frontend Transport; Fri, 20 Nov 2020 23:21:42 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ckoenig.leichtzumerken@gmail.com>, <daniel.vetter@ffwll.ch>,
 <robh@kernel.org>, <l.stach@pengutronix.de>, <yuq825@gmail.com>,
 <eric@anholt.net>
Subject: [PATCH v3 10/12] drm/amdgpu: Avoid sysfs dirs removal post device
 unplug
Date: Sat, 21 Nov 2020 00:21:20 -0500
Message-ID: <1605936082-3099-11-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 769f32f5-6e32-4bf8-dac0-08d88ddd55fc
X-MS-TrafficTypeDiagnostic: DM6PR12MB4025:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4025EF24CD8D99611CE3751BEAFE0@DM6PR12MB4025.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KgbvmCoULHQCCJfkE14MHDFA8Ob2EkEcXMBITNdiRa1om/PTnWn4Uj1hfzLkU0kY0Ys5UtqCk4GZfhN11nqn5B1R3x/H2SXcfy0ZInRJLuf79TRWxwwQkIhhTFt1QPrQb6jzNKv10YMhuCGSqJ7+zLjHolblMoXv9mWsu4MlyneJJRwbEGO2y2AF75I6dk+m5fqvckEwx2RHxSSun6oj4fMvGu2vPiQbOn7Cr/5lrka2MAd+aqKvPR2oS36uf5kFlCQGY08N5kJSSIxQu0fXmMgAvBGd8dpRKkhVOqaiRLSwlgVRpxtcYu8Hmdr/V3BcAowc7rshv6xTaH4K1QmVsh/RtrcqI+/LfofnmpcmPo7WYDFxZHrRNwhpZJtNP9TqB7JXlBApvfg3E0lGhWvc/w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(46966005)(81166007)(86362001)(7696005)(47076004)(426003)(2906002)(336012)(82310400003)(186003)(6666004)(4326008)(36756003)(44832011)(8676002)(83380400001)(5660300002)(316002)(8936002)(82740400003)(26005)(356005)(2616005)(54906003)(478600001)(70206006)(7416002)(70586007)(110136005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2020 05:21:44.2398 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 769f32f5-6e32-4bf8-dac0-08d88ddd55fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4025
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

Avoids NULL ptr due to kobj->sd being unset on device removal.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c   | 4 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index caf828a..812e592 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -27,6 +27,7 @@
 #include <linux/uaccess.h>
 #include <linux/reboot.h>
 #include <linux/syscalls.h>
+#include <drm/drm_drv.h>
 
 #include "amdgpu.h"
 #include "amdgpu_ras.h"
@@ -1043,7 +1044,8 @@ static int amdgpu_ras_sysfs_remove_feature_node(struct amdgpu_device *adev)
 		.attrs = attrs,
 	};
 
-	sysfs_remove_group(&adev->dev->kobj, &group);
+	if (!drm_dev_is_unplugged(&adev->ddev))
+		sysfs_remove_group(&adev->dev->kobj, &group);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
index 2b7c90b..54331fc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
@@ -24,6 +24,7 @@
 #include <linux/firmware.h>
 #include <linux/slab.h>
 #include <linux/module.h>
+#include <drm/drm_drv.h>
 
 #include "amdgpu.h"
 #include "amdgpu_ucode.h"
@@ -464,7 +465,8 @@ int amdgpu_ucode_sysfs_init(struct amdgpu_device *adev)
 
 void amdgpu_ucode_sysfs_fini(struct amdgpu_device *adev)
 {
-	sysfs_remove_group(&adev->dev->kobj, &fw_attr_group);
+	if (!drm_dev_is_unplugged(&adev->ddev))
+		sysfs_remove_group(&adev->dev->kobj, &fw_attr_group);
 }
 
 static int amdgpu_ucode_init_single_fw(struct amdgpu_device *adev,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
