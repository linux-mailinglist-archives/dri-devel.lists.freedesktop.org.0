Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E09211E8BE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 17:54:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFC36EB25;
	Fri, 13 Dec 2019 16:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690086.outbound.protection.outlook.com [40.107.69.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7266EB1E;
 Fri, 13 Dec 2019 16:54:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJaGpV890HTutxrX6He/6F4DudhL5A8gSozksU4CJPP93OrJAELadDt4wCOULl8DD2ZSlXlhmymza6EdrAcymz9w9J/2KO12cRXz4LBxPT2XxUW+Pq7rkfabE2JcaTDdSMKBKYygRWN55NFoLskvtJdMWqGLiPyGldVdna1uQBPyU262bWOU2DU6k4xFvN1JiZhynodzg84B4tUGcBpGfv0TnqVJP5YateqYtzb0dQ7BOKmjHYW4OHvi7xGVdDCwD6kAZoJIB7eYF6mEX8xjj/jlRfTzH9dSLP2Q0ry0GgbswXl0e7oTusrNKEJKRz4rcj9qvIXPU+2RqG+ayZb8VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7YCTovCGCupkwEREoIPbAFjwbGRtVuJJLOKH97FXfg=;
 b=G15p/jP/Df33zN/AmpIGTCuwGVIfukIZMyT1xAQz0bCP2beu9e0i7KJ/5ftCZgZ0iyMnvXZ+XxSRFYRfYdf79T6Wq6v0XoO3832S5HLWM9rDRW0MJjEWMUqM6fXx1iz/S634Lvpx+Lwv/aaycGGi3ZkxR/oc5WtGMMIVg8FCkBZ6+izU0DiVa9lyxhoKj+bCIypW7FvaRI5pYaef/HyNoin4QA+vG/X7Pu3qUmkyhk76YksRkLmxJ0S41LANGL5EmAM/l2pbTeEGkfFqOttyQtagMR40wZ9GJQA3tS/w4a/dHJbL/TdRJ5bca2ajc2SMCqcNrnIscAmBtHp4qsZ+xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7YCTovCGCupkwEREoIPbAFjwbGRtVuJJLOKH97FXfg=;
 b=qlagc9IY5hM7PDEORKaeVZ2IV3k/ABOGmahLtEnahbZ5/BfYuChf5/qGYIMQD0COu/KRLg6aUFHnOtD5/Wlk7ax9UuCpW6y3ALWdL4/dmhDCD92RJqdEMxnRpOql+wq1MI53DAPaVJPGkWuPJjqBhuaXtd706OThMg5FHeH5vqE=
Received: from CY4PR1201CA0002.namprd12.prod.outlook.com
 (2603:10b6:910:16::12) by BN6PR12MB1395.namprd12.prod.outlook.com
 (2603:10b6:404:1f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.15; Fri, 13 Dec
 2019 16:54:20 +0000
Received: from CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::201) by CY4PR1201CA0002.outlook.office365.com
 (2603:10b6:910:16::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.17 via Frontend
 Transport; Fri, 13 Dec 2019 16:54:19 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT054.mail.protection.outlook.com (10.13.174.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Fri, 13 Dec 2019 16:54:18 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 10:54:18 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 10:54:17 -0600
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Fri, 13 Dec 2019 10:54:17 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 3/5] drm/amdgpu: Add task barrier to XGMI hive.
Date: Fri, 13 Dec 2019 11:54:07 -0500
Message-ID: <1576256049-12838-3-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576256049-12838-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1576256049-12838-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(39850400004)(346002)(428003)(189003)(199004)(186003)(356004)(26005)(6666004)(336012)(7696005)(44832011)(70586007)(70206006)(450100002)(478600001)(4326008)(86362001)(54906003)(8936002)(110136005)(81156014)(81166006)(2616005)(2906002)(8676002)(426003)(316002)(36756003)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1395; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6f71fd3-0122-4b3e-f53c-08d77fed1873
X-MS-TrafficTypeDiagnostic: BN6PR12MB1395:
X-Microsoft-Antispam-PRVS: <BN6PR12MB139573B7C4F740C916015FDEEA540@BN6PR12MB1395.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-Forefront-PRVS: 0250B840C1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6n75C5YyGqZs84dGdUEA/O061I53L/nktNny0ii58O7hf/xINGCQa9QpFW+VjdV8TEp9Pd7WFXrqlxLhXgJh2c7c8mNdFqnYaRV0so9nehm5qeP05YexzZiuSoXN9dWIY3808ekIl43fRYs6ibDNcXca5nkFYd5L20JO95XvgyWPF2rxjo1WripVwfKLetsnWlm5Vty/pB2JT4dOe/Cx9BmucyoFgkTapGfvIKPYG2jQzqLK5axpNQUJtCQ6FaWQiNMqXhN48vMZWEobUmf+dOxAyC8EMOiwaddnBJE/ovrkhjbEqMMRYkvW0Gthf0dIUYh3zjL1O+nPz06WhBktV2lTDg2S5llJcNCYJ7Ymtcm+hUY6q8GCSh6L+ajegbvNBzoWhwgMBguR30cuS1ODZFsnb0AidNSBcpUCwDK2cOIT0sqZLSnomFKCO6SbTOQI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2019 16:54:18.8842 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f71fd3-0122-4b3e-f53c-08d77fed1873
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1395
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
Reviewed-by: Le Ma <Le.Ma@amd.com>
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
