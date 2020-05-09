Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAECF1CC3C8
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 20:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E6A6E398;
	Sat,  9 May 2020 18:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB906E39E;
 Sat,  9 May 2020 18:52:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enbxzSZy/V1hIt79KuhgHFz3sl0Amr4+3hIoq0WidKm8IVxtTRiFnkYeEacFtQWK7Ap7HwDwWxF9El5B1ZNGFqc0RIaPRG+8lG6lPl4Ys9WWs/eWOhGdzJW2QgMg8+sxbrLlJ3uele7D+Eqps6/rGzORwaydNt+smA2igzh9wT7A0I3pDEy5H/HQzdexsxMtrmn3cvmafTC0h4OXQhEqX4PeDrPsPgeGhrh2vIGtgcB5Z1cCOmrLcfPQYLkfhbRHRCbXKtAT3IbECZ1KkuKMKU0mzIJhkKrT1ANyjW8k74Etlfwv+9ET+Go+HWjFbqsBdXjH5IAM40XNR6S5dKC8YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdl2DAs24j4F/A057eRMv+6H+/of4pv+GMkaU8Nn2M8=;
 b=nyrOVucG0678VmeW49EjpfNhIz6O0Q1TdAjcTGpnS8aa5ydjLmvgBRWo5wXgMTEnwDe2wFHARmOX10ABbJ2klb+YoYPfsNZdvGBcNFjjgmkc4q0pTALZWh/6uT9lsBwg0Yr0VqzLpcWRXpfmU9sCzL6gCg2tN1L86iajiJXyJsOzzNH9JKlfE39LFXC4MXrkBfanvKpd+rWUb5ZKUI+WX+OpndK0QshHAEA6MLda4zh40TJbDvWRhKX6htlY2wzhBEAWdXzrG54ZFo9e52A1EPUXmQMleF1bP7DQI/kbFzn3dZDk6sHebAPSZuH+R4lZ50/L/0RLCG7sIT29CLoJwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdl2DAs24j4F/A057eRMv+6H+/of4pv+GMkaU8Nn2M8=;
 b=2z0j1Zxvkj8z4WbLhCvjTGDHYFwbOaN02BAxuCQWu6naWcgt0LuRwyS8qAzcLtxWFfPKdwQGeA84ll6kDCnHHz3zzWZZ7hFSp2oNmPUkEWOkzF6iIFEoa+Cdr9wlpR9/UxF/fXKSutK4kNoiMqdS0AiidckMp20bWUrKaJR9M5s=
Received: from DM3PR14CA0141.namprd14.prod.outlook.com (2603:10b6:0:53::25) by
 BN8PR12MB2868.namprd12.prod.outlook.com (2603:10b6:408:9c::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.33; Sat, 9 May 2020 18:52:17 +0000
Received: from DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:53:cafe::e) by DM3PR14CA0141.outlook.office365.com
 (2603:10b6:0:53::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26 via Frontend
 Transport; Sat, 9 May 2020 18:52:17 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT047.mail.protection.outlook.com (10.13.172.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2979.27 via Frontend Transport; Sat, 9 May 2020 18:52:16 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 9 May 2020
 13:52:15 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 9 May 2020
 13:52:15 -0500
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Sat, 9 May 2020 13:52:15 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/6] drm/amdgpu: Wait for all user clients
Date: Sat, 9 May 2020 14:51:47 -0400
Message-ID: <1589050310-19666-4-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(46966005)(33430700001)(81166007)(8936002)(82740400003)(4326008)(478600001)(7696005)(82310400002)(33440700001)(86362001)(6666004)(5660300002)(8676002)(356005)(47076004)(2616005)(44832011)(2906002)(36756003)(316002)(426003)(186003)(26005)(70586007)(110136005)(54906003)(336012)(70206006);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6386a75-e927-4c44-fbf9-08d7f44a181f
X-MS-TrafficTypeDiagnostic: BN8PR12MB2868:
X-Microsoft-Antispam-PRVS: <BN8PR12MB2868712198725906FD17EA28EAA30@BN8PR12MB2868.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:206;
X-Forefront-PRVS: 03982FDC1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kje4ZOnIZZyt8lN7XwwB3nfnZQl5Wcmh1CDnreJswVYI+k7LPHEnewMj60LjGYtw56P5ZWw1/I6vBkwRzQfLmdjWH/Tdf0M2/y78jQOTTi6YnLoZBCAcm1yHTlp67twwY2uWMitMOBX+PQV6fDE5/zx/m0b8D6UhfzaWWQ7pFo2MWgHMfKmWCp8bWDaPjzqbiy60R5Dkz5x8qx56sotCkxjEj9XGemfL7+JC12bSet+2/QulnWKRMh1c3Fyutnzv4EBPWy/x73oFxGZ1BMCQY3WBdHX2GpH0WY5KqDov2bV+vZkcJQrzoSgygcJ2mMRGSxfZ1rqLpy4BL+SMmlOskI1Izvn+m0NR5oFfkWbxRPUCl6gFb15/dvpplFhAg0i0Dkac2BAI5uZFT3AxA/+NWUFWa+sZLKQWaEhW+Sg8W1hpyZk+zu3hm/M4G/p9QLjyOf/ToteDZqOBZfwy4J6ST9EEkfTFZnRAh+peGFH1vizELkYJKZOxrBOI+EmenkcOLslgZ3SLdKzZJnrBZa4gpAzol5Kk7yNhjrBAqmtv8jYvzanPy4NeF337xpFgkYpa
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2020 18:52:16.4881 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6386a75-e927-4c44-fbf9-08d7f44a181f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2868
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

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c    | 4 ++++
 4 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index bc1e0fd..79274d5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -990,6 +990,8 @@ struct amdgpu_device {
 	char				product_number[16];
 	char				product_name[32];
 	char				serial[16];
+
+	wait_queue_head_t		user_clients_done;
 };
 
 static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_device *bdev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 4da52b7..3bd67cf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3271,6 +3271,9 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	if (r)
 		dev_err(adev->dev, "amdgpu_pmu_init failed\n");
 
+
+	init_waitqueue_head(&adev->user_clients_done);
+
 	return 0;
 
 failed:
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index ea2b47e..0531727 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1141,10 +1141,12 @@ static void
 amdgpu_pci_remove(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
+	struct amdgpu_device *adev = dev->dev_private;
 
 	drm_dev_unplug(dev);
 
 	amdgpu_force_unmap_user_space_mappings(dev);
+	wait_event(adev->user_clients_done, (dev->open_count == 0));
 
 	amdgpu_driver_unload_kms(dev);
 	pci_disable_device(pdev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 61fb2ef..d8fc775 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -957,8 +957,12 @@ static int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file
  */
 void amdgpu_driver_lastclose_kms(struct drm_device *dev)
 {
+	struct amdgpu_device *adev = dev->dev_private;
+
 	drm_fb_helper_lastclose(dev);
 	vga_switcheroo_process_delayed_switch();
+
+	wake_up(&adev->user_clients_done);
 }
 
 /**
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
