Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE9C11BE1A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 21:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C541A6EBD2;
	Wed, 11 Dec 2019 20:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C996EBCE;
 Wed, 11 Dec 2019 20:39:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbuC8mUrqWP7pK9shR2NTlbNOv7rmFeCj2bReT9G2E6skvJ7xZui359oShs5c0Jr7uy19P1xgXZYYU6o4LWh7hTQh7IFywPyzZ0WplDblr4M9ZInPr6wJShPUVKNnF9XEM9G4QYzv414WCQr72DzOqNiExecphnL67Z9zSHuOFw+yhbJ224aa1ad7fSpR6w5Hf377G/8vnO+MoKHG+Jf5Kj0CA2/Qgg3Q09LUujtAMeSVHH0XN1Ptl5U68Kt9YikAK5UmVxMddA/rj6BDH6YWJZl9EqgVm5hQuU3NsHLLRncLSMQtPfmbTCUMMpRASIYJ6WtwZWw8hXM2tj4tCzEUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbmvfEVDn4wlCMN0iZvdDxhc9PmPptczfmGfkV79hL4=;
 b=ghFBWUT8oZMOFvgSW/nrrj6KSk1X7InD9nxpO8K/Vm0khPNhL1cZwTbsRBzWq8yaZCihNg5DTHmkqMhUBsis1h7RUFI+EPXP/JI4NAfphZn4aeEJgCd4VGA6CIIyDmBVegELO0k1Pptp8vQsOOMo63QW7oKySRC52oQsNiTQ5eCg8ZJjvTJJQB/zdAtY5zGMZSIpmZZBsXpPeLBrq3vvgMR3n8/c7U6ltwxYcoWXiMdFd5tENm9jQKspUb6BWmNhxrtXj5EayMFzuNtVvHkWUEGycTQ3PY3a6OrZAUnOzzHyNCeEC/+RGmBtBq0cWNYEVpdxtLlWXJ4UDTUgEMJkhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbmvfEVDn4wlCMN0iZvdDxhc9PmPptczfmGfkV79hL4=;
 b=bYZgeM8oDjtHQiyHbAT1jU3PJdPgb3BV1MXH1Zu9oXuo7MIV3kaYObSd2tjSeEubUHSt1cDxs80hnh3DlrwlF4nY+I0Y6HtionvIzl5i+nhXju/x/WQHszMvtdOir5aRxrXcmgKFEAWxh010dNUgKj3mJTQfmURgQAGhlm2HIQ0=
Received: from DM3PR12CA0045.namprd12.prod.outlook.com (2603:10b6:0:56::13) by
 DM6PR12MB3706.namprd12.prod.outlook.com (2603:10b6:5:1cc::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.16; Wed, 11 Dec 2019 20:39:12 +0000
Received: from CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::209) by DM3PR12CA0045.outlook.office365.com
 (2603:10b6:0:56::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Wed, 11 Dec 2019 20:39:12 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT030.mail.protection.outlook.com (10.13.174.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Wed, 11 Dec 2019 20:39:11 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 11 Dec
 2019 14:39:10 -0600
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Wed, 11 Dec 2019 14:39:09 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RESEND PATCH 5/5] drm/amdgpu: Switch from system_highpri_wq to
 system_unbound_wq
Date: Wed, 11 Dec 2019 15:38:52 -0500
Message-ID: <1576096732-3596-5-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576096732-3596-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1576096732-3596-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(428003)(189003)(199004)(110136005)(336012)(8936002)(70586007)(44832011)(26005)(81166006)(70206006)(36756003)(8676002)(81156014)(54906003)(4326008)(478600001)(356004)(426003)(6666004)(316002)(2616005)(5660300002)(2906002)(7696005)(450100002)(186003)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3706; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9135bb6-e863-43e6-4d90-08d77e7a2df3
X-MS-TrafficTypeDiagnostic: DM6PR12MB3706:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3706543FB0A34B33EFF49397EA5A0@DM6PR12MB3706.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 024847EE92
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TLU2fs1fKuENzN3on6mwJDLzeRGVAH4cjGqQ/8indenL9KymqUvLceI5Xbu6rFhxGNH8onltg8Bic2LxwrmqkNV4LVj03JmkqZTGwY1x4cTQr7lrb0ZG2yVhH0cPqKLIoINJtWXQFDIg2wDBhTKMXgPurLbac+4rlOnaflwMN9pfban4N5TFidsLAGcDLdePFimWyFuWuWeT2Hx/wZNe4uAzMz3C02hNFM8SuBUoPCwQj0aOxUKkgeoIN6b00dDXsNu/JOmA31imp7mcc6T2l9Vd7YBpBGvdBuIyHFkic1GlSPx1kJdyzQpLaj/gf5QbOILddTR7pQ3qbkG7+SvatjxZ2/Q6QOhJST/WNko8FGKcnY1Y4Is7XnbdCHZwUNDCiI+dprtybZLHlPC2tHoLAWa1zAPmeAeCG2t1TBpgsaqYloinqUglsa+1CrYyeYSJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2019 20:39:11.6651 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9135bb6-e863-43e6-4d90-08d77e7a2df3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3706
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
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index e4089a0..1518565 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3842,7 +3842,7 @@ static int amdgpu_do_asic_reset(struct amdgpu_hive_info *hive,
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
