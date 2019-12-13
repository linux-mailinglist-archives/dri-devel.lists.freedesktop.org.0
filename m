Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7112B11E8BF
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 17:54:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CD36EB30;
	Fri, 13 Dec 2019 16:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EE16EB03;
 Fri, 13 Dec 2019 16:54:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wde0CTCt3yw8vkcXtyaJpO6gFJ6t2aLM1RcPys74kDFQQGqnG7RsWAtjZHOxzlJjW+JS+HwniuwA1e0rgAky7gSRPeZXahNCl8zQ0gAI7tBxC67G3AzQj8QRPyrdcrKwUC8YLU1mYOqYIPiHlxG24U/PxLVlSuW9CgmrkdRpyAGqsmUuspa0Tve84l9XSViYX1Ghc6+RAWiyZzZZHWAz7dvut59WN5BcFEAiI3aOsnXoy1wxLl9Wlac0ayJUBO4C84WP53Qp+5pJRfP2e/S1a5KFuRarYcDF+J50NOhixUjA9AlAmTOdfPCGv6QUJW5aAtP+4UJf3BzQUTygiuyO/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cD943eFKsAoKQeJgeCZKhRnzxthli9UqNhUInHkSilo=;
 b=MkFjCbUosDWFiDcEv0MhbrVGP+UtUriZM86PLBIB978Tpri9He9QrWXl/b5oZlQSlbbQQgUwlmD1SXsZ9mboIpL7FeMy+VfepNDU8sBPIefAwpMd1hRRGyKcyw5HY3MD+koKmLJTy9S2W5I6S38xea6RI9clJ9TMmfXG8Caa9tOA+JmC4xv4PoGaQH6o37kBe/YX92eBbS6sGAOcNFFgeH1s7860o3oWWKF7sQLCJZNm+70nNoBtsF0OePHPLOAdCwFbN5y2P3Ym/W4z8CJCJ7R13uKtVdDGMdnoCRvVBLB3RmFhqDOf0aeYADr5ASuQ1DPg5vIQCRoCE2J9KAXjWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cD943eFKsAoKQeJgeCZKhRnzxthli9UqNhUInHkSilo=;
 b=fxazWXaRDPbM11LjYVBY84ovCv5iduE4GCussVE7qD8M3cDla4XfaFK1coTyDhGvgy5p3K0URh09SOYC3tUZ5WodOSI/9eXGmdcOS/YAL0KMFt0Jz76zMFiEs4gKALkZvnaQQcSdYkFIWkrT0rQhltJwgKL/rjl+RzNWpkgneO0=
Received: from CY4PR1201CA0007.namprd12.prod.outlook.com
 (2603:10b6:910:16::17) by BYAPR12MB3463.namprd12.prod.outlook.com
 (2603:10b6:a03:ac::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.16; Fri, 13 Dec
 2019 16:54:21 +0000
Received: from CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::206) by CY4PR1201CA0007.outlook.office365.com
 (2603:10b6:910:16::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.16 via Frontend
 Transport; Fri, 13 Dec 2019 16:54:20 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT054.mail.protection.outlook.com (10.13.174.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Fri, 13 Dec 2019 16:54:20 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 10:54:20 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 10:54:19 -0600
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Fri, 13 Dec 2019 10:54:19 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 5/5] drm/amdgpu: Switch from system_highpri_wq to
 system_unbound_wq
Date: Fri, 13 Dec 2019 11:54:09 -0500
Message-ID: <1576256049-12838-5-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576256049-12838-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1576256049-12838-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(428003)(189003)(199004)(8676002)(110136005)(81166006)(81156014)(7696005)(54906003)(8936002)(70206006)(36756003)(2616005)(44832011)(86362001)(5660300002)(336012)(70586007)(356004)(6666004)(186003)(2906002)(450100002)(4326008)(316002)(26005)(426003)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3463; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a500348-6e14-4132-e40a-08d77fed1952
X-MS-TrafficTypeDiagnostic: BYAPR12MB3463:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3463E6E03935191CA36B49D7EA540@BYAPR12MB3463.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0250B840C1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a6i1BelcigYPXIITflDTF9M9li9m1/XmSDTsLxRqCtEBpMWnrtnGcJtKz/7kYxBJF+mKKZayAZPgjZo4m4C7kBnIt6gHhSOYMzqN52k8K9xIMiqEjs0Whi2Ijn+OcJcyK+acWU65t72YSXgnBkBANUkJEWniVBDTXhvWL05Smywvt1LoTkN12xPZBCRdTA7t+3TDF7W0zIxkO1G261LBzoi7gJNjtyFsguM4i8Mqyr//pWCkPyZ0w3BT3nF4yY8sPTz34SSZcy4vkb6x+/6SgBt9o/ZSnhMTnLNrHXFrmQSek0hBGsJ+hqP+tLyroYPUX9T6Vvzea/g2CNVY/QhYAcl58LLpILXZu/ITjH8I6G9oa/kwcJMwhod6M/C69jzM0VeGZxyJ4wJpCg0gxpaUkgejGmv6IHxwVmegjOK3z6fMMpbeZeMmYNjW/V6CcE30
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2019 16:54:20.3452 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a500348-6e14-4132-e40a-08d77fed1952
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3463
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
Cc: Alexander.Deucher@amd.com, Le.Ma@amd.com, Evan.Quan@amd.com,
 hawking.zhang@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is to avoid queueing jobs to same CPU during XGMI hive reset
because there is a strict timeline for when the reset commands
must reach all the GPUs in the hive.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Reviewed-by: Le Ma <Le.Ma@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 2ae944c..03b85b1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3837,7 +3837,7 @@ static int amdgpu_do_asic_reset(struct amdgpu_hive_info *hive,
 		list_for_each_entry(tmp_adev, device_list_handle, gmc.xgmi.head) {
 			/* For XGMI run all resets in parallel to speed up the process */
 			if (tmp_adev->gmc.xgmi.num_physical_nodes > 1) {
-				if (!queue_work(system_highpri_wq, &tmp_adev->xgmi_reset_work))
+				if (!queue_work(system_unbound_wq, &tmp_adev->xgmi_reset_work))
 					r = -EALREADY;
 			} else
 				r = amdgpu_asic_reset(tmp_adev);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
