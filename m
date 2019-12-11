Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1696C11BE15
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 21:39:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005076EBC7;
	Wed, 11 Dec 2019 20:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0636EBCD;
 Wed, 11 Dec 2019 20:39:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYt6kScidkq4LbvmMom7+BjZLAGx/+UNsXed3wcovr4n1NQuCn2ONN9QQQAqgPtmbPPToZAW1lClGLRQLmwlRYAEFkPe3RSpDd845OR7i/ywgUGI+nNH5PpThsEyCpvIX1Pce0+NKhwPdK/BM7kaz6jTngnikzti2chI2/nuO79Ly2WBYyDiByrWAcw/nYK8ZfiwU82rc5fwGwUnpLZPwJeunGN6tgGma6X76mfEggYrqUH1SVyseeJpxlUBO1msjFFBYnQayXN4qFPtnzWSuCIjyiHBxsWln/iR+mAEZ5wcNAFDXTrPofIjpx2GxPYRaTEYeex+0npsZ5ngKHMH6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSEt2f9/EfxdoaHGLa7jypJphLCUQe7rpLGN/Y3n8iI=;
 b=odgDvJjlBq1l87ErkcgBubpyw0GK5B4s9zKeoszntOB0+tKXfUFJpXrIe4Vm/BBI73KTCvJ0WdBpJQ0av3jBTpEfqqzEnSgTXZnqBStpkEKTg21MQjhqTKeE/uWO8ju5FyZ1AAsIjIv35N7YTYglPVjmlEZnOjD2M/eQSceaWt3DCYbyTelQbYvwrvuKxREf48k4+DHbHiMgzH4iCRaQv6BuWCsT5OmD+KC7qcIfqVwMRDeE/8C1MYUshZPiHmt1b2wNzsSOfF6gx7eKgfnj9A7ZPunTi7YWoi1abJZ+A9ZVPTMuiWVQzCSmAEQq8Q8YRX68g8hN426LXyFN7iTJxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSEt2f9/EfxdoaHGLa7jypJphLCUQe7rpLGN/Y3n8iI=;
 b=nMSwbk7Cld6K/eJgUoD53+b8U/gywXSsMchHHgKwjZrkl814/QCK/kaC8w7ZW8T6YKJy2OQ76BMTFsZla/Sh3VP6noks5V4b8yJz6OLZjgEbMKf/LLHGDQzHIyLBZlSoI6LqHOuBSeAplRWRfs9NBsr+mM+BRM1P+WwmUnMvavY=
Received: from BN6PR1201CA0023.namprd12.prod.outlook.com
 (2603:10b6:405:4c::33) by BN6PR1201MB0132.namprd12.prod.outlook.com
 (2603:10b6:405:4d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.17; Wed, 11 Dec
 2019 20:39:10 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::207) by BN6PR1201CA0023.outlook.office365.com
 (2603:10b6:405:4c::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.16 via Frontend
 Transport; Wed, 11 Dec 2019 20:39:10 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT051.mail.protection.outlook.com (10.13.174.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Wed, 11 Dec 2019 20:39:09 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 11 Dec
 2019 14:39:08 -0600
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Wed, 11 Dec 2019 14:39:07 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RESEND PATCH 3/5] drm/amdgpu: Add task barrier to XGMI hive.
Date: Wed, 11 Dec 2019 15:38:50 -0500
Message-ID: <1576096732-3596-3-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576096732-3596-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1576096732-3596-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(136003)(396003)(428003)(189003)(199004)(44832011)(36756003)(110136005)(26005)(316002)(54906003)(426003)(2616005)(336012)(186003)(5660300002)(478600001)(2906002)(86362001)(356004)(70206006)(81166006)(8676002)(450100002)(4326008)(8936002)(6666004)(7696005)(70586007)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0132; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc82ff4d-c8a0-453a-8b5a-08d77e7a2c93
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0132:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0132749F223472193621CE13EA5A0@BN6PR1201MB0132.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-Forefront-PRVS: 024847EE92
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jp0Y403qpIdkK8Aku9diaEsVZ6rbPFJ6+4c0q/+O7YqqUfjLwI9qkE5Spj8xaQ3BtGuz3pJ9fyTHvRhdFyLbBjyRM7u8qFHXZt5DGJFdVSzofczTHMMh91ynOmiuuUxPOMjhbhcL1w0ewbjzpc//4EzT8i2hH28eacNhSOLoZl5nM2EwoTPbs+RrKQHjv57YjS8MbKkvx968g40obGyMVYjThpHR2Vi0rPTKcwHrzhLgy6w0/zu/XwlshZKxUuIS925pl/aKpzOtASZVdbu69WOE4zIVsAT5QqxvoBJ4Bkckp2Ktp3fwKZYppzS475P0QBnRu6ibsIb/0+Qj2HiXjAnU5wriJRpGOvid0LGTDnV3SQvmcPNzqmCduENuk2BXM8Ngf1lQQypJo4Jqte2t3eBT3+JfsCUoLs6Q7OWC2MIFszWRgBGL8wGtdp/WCJUv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2019 20:39:09.3590 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc82ff4d-c8a0-453a-8b5a-08d77e7a2c93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0132
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

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 4 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index 61d13d8..5cf920d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -261,6 +261,7 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev, int lo
 	INIT_LIST_HEAD(&tmp->device_list);
 	mutex_init(&tmp->hive_lock);
 	mutex_init(&tmp->reset_lock);
+	task_barrier_init(&tmp->tb);
 
 	if (lock)
 		mutex_lock(&tmp->hive_lock);
@@ -408,6 +409,8 @@ int amdgpu_xgmi_add_device(struct amdgpu_device *adev)
 	top_info->num_nodes = count;
 	hive->number_devices = count;
 
+	task_barrier_add_task(&hive->tb);
+
 	if (amdgpu_device_ip_get_ip_block(adev, AMD_IP_BLOCK_TYPE_PSP)) {
 		list_for_each_entry(tmp_adev, &hive->device_list, gmc.xgmi.head) {
 			/* update node list for other device in the hive */
@@ -470,6 +473,7 @@ void amdgpu_xgmi_remove_device(struct amdgpu_device *adev)
 		mutex_destroy(&hive->hive_lock);
 		mutex_destroy(&hive->reset_lock);
 	} else {
+		task_barrier_rem_task(&hive->tb);
 		amdgpu_xgmi_sysfs_rem_dev_info(adev, hive);
 		mutex_unlock(&hive->hive_lock);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
index bbf504f..74011fb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
@@ -22,6 +22,7 @@
 #ifndef __AMDGPU_XGMI_H__
 #define __AMDGPU_XGMI_H__
 
+#include <drm/task_barrier.h>
 #include "amdgpu_psp.h"
 
 struct amdgpu_hive_info {
@@ -33,6 +34,7 @@ struct amdgpu_hive_info {
 	struct device_attribute dev_attr;
 	struct amdgpu_device *adev;
 	int pstate; /*0 -- low , 1 -- high , -1 unknown*/
+	struct task_barrier tb;
 };
 
 struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev, int lock);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
