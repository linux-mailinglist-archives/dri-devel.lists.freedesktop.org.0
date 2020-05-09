Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 306611CC3C6
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 20:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E4E6E397;
	Sat,  9 May 2020 18:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAAB46E0AD;
 Sat,  9 May 2020 18:52:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRf/KugzX1IxpTvv7bAUIhseVBkO80ib9akk/+ihtyEfe61Ei1KpGRnpdKJaE+75OMwxSUMDSFLYE0W9V0rUQ69qC9CGTrhPyZCIc17yBtAsGV4xKBWzKjyv67jSkubSSOWX8YQ89sCjl6NpABD4CseVBsFU9wA/rcIf8p6UG8DpHWt3O7y6zKWS4YzS8RX/2TMb3AogeAv3EOq0PNRTpz4FVe+lRnxW8rhUgdHsLs5aQKUMoGzzRQQvj1T1D+llNsmQLNqioqxYdeBBsmWpMvh1dwC4lkkqHFh8IoxhxwW4GxgXkS4CitiWXDCdlisgYaacihf/38KZktcqcSUleA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwCMmCKmyZXvvhFINGmUUmA0Vz6VXlMRhr4P3gBVDLM=;
 b=k6YxLFVibbmURI6uSbZGhPpGur1Ht4n8oUSvdisP0gIX6USS3s8mBjgLl7Fl0K69p2OfmrlagWC+1m9AKlhcFs9HAw5rlC96EDVG40Ro7yr6wdOTumSSEiBLZBmC/YXdMhccpwWr7zELxKRF444rTMvXB0Gozjk1xX0maB50ETEMOnF3/sQMw3swX7uP1OOSa6SPv8MxeMpkX0T8mFAe33EheU06szK63tbO4ocK3XeSzEZCHJt3zoOZ3cbN1DXVM+lFKddmvxTQ65157PhyH1eGEJG+6F76RwFW8u6U7Gj4C2FafqR5cnDx0j5tiJ5H8zNzCPh/KESr+22Zg9I2ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwCMmCKmyZXvvhFINGmUUmA0Vz6VXlMRhr4P3gBVDLM=;
 b=vrSj0loOtrX+xDCpWbsiGP839Fs9fbRWnJxLt49afqwqUfNRnn4cO/U7hidpjDDAQvnyFpZy6ksw44wKs5jLZbdhFrlbJq4z3+6nA6mr0GbfyCa0lDPc729KUFMNjSDoIGPhOd6ZT+KwmuaJv56/eckiwMStr1+A4MAkAUOR1Uk=
Received: from DM5PR15CA0052.namprd15.prod.outlook.com (2603:10b6:3:ae::14) by
 CY4PR1201MB2503.namprd12.prod.outlook.com (2603:10b6:903:d1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Sat, 9 May
 2020 18:52:14 +0000
Received: from DM6NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ae:cafe::e2) by DM5PR15CA0052.outlook.office365.com
 (2603:10b6:3:ae::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Sat, 9 May 2020 18:52:14 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT035.mail.protection.outlook.com (10.13.172.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2979.27 via Frontend Transport; Sat, 9 May 2020 18:52:13 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 9 May 2020
 13:52:12 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 9 May 2020
 13:52:12 -0500
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Sat, 9 May 2020 13:52:12 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/6] drm/ttm: Add unampping of the entire device address space
Date: Sat, 9 May 2020 14:51:45 -0400
Message-ID: <1589050310-19666-2-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(39860400002)(346002)(136003)(46966005)(33430700001)(4326008)(36756003)(426003)(5660300002)(110136005)(8936002)(44832011)(54906003)(86362001)(82740400003)(336012)(316002)(7696005)(2906002)(2616005)(356005)(47076004)(81166007)(33440700001)(82310400002)(70586007)(26005)(478600001)(6666004)(70206006)(8676002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c952b311-8393-44f6-3b80-08d7f44a1661
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2503:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB2503D6CEC448D7EA04475BF4EAA30@CY4PR1201MB2503.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-Forefront-PRVS: 03982FDC1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YmMrv2luw0Gcvss2xoP05O/LTZ8l9G84c+bV0NTJVJQlz19iSmr0aVn1K04exS2Zka7wPExbwdSy/c0pyr0Q5K3B/2NvbJDonyn2V9ned4lBONwO42ZGA3H23tHV8zrZG4cfZdKT+7xGkzwTqT0+IVN5rz+aw7ts+kOe0O9QsIgVL29E2upPT3c8791zeqt83GFiUVUU61Y1bFy/tHt5Fz1YorTEOJSEPrdXtPqNnB5zK1zkjp+yDICQk6s3pEGeUSSjjeTbk7ovXKEhKWrGs8YveZbU7yUJsikxYRpZA4V1+Z9CG1cc58v+VHG9tyWD4RrQJjlvWIgkwV8btttLnZNJLVLL7FMiOBje34tQQiPepX5rQ8m+B0TTTbiMxPWmaOOWSUh0nhTHYes5qyF+LtQOocRjiqww7OQ68AS+njMqMuMQuJM+V2qElEXJgNDEPfp86joV7zYKofqYZZQ5V5L7SIGIjgwXKcRukNbhiklOgEWalc3t+C9izOMJW+e4l4WgigbGKBNlHT7MqjD+pvFG8K/CW8AMiDAUeg1tZg6PQYrwifqLZeeoyM8MUDhot+3RMaXXJeSg7sBj4PpPVg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2020 18:52:13.5533 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c952b311-8393-44f6-3b80-08d7f44a1661
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2503
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
 drivers/gpu/drm/ttm/ttm_bo.c    | 22 +++++++++++++++++++++-
 include/drm/ttm/ttm_bo_driver.h |  2 ++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index c5b516f..eae61cc 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1750,9 +1750,29 @@ void ttm_bo_unmap_virtual(struct ttm_buffer_object *bo)
 	ttm_bo_unmap_virtual_locked(bo);
 	ttm_mem_io_unlock(man);
 }
+EXPORT_SYMBOL(ttm_bo_unmap_virtual);
 
+void ttm_bo_unmap_virtual_address_space(struct ttm_bo_device *bdev)
+{
+	struct ttm_mem_type_manager *man;
+	int i;
 
-EXPORT_SYMBOL(ttm_bo_unmap_virtual);
+	for (i = 0; i < TTM_NUM_MEM_TYPES; i++) {
+		man = &bdev->man[i];
+		if (man->has_type && man->use_type)
+			ttm_mem_io_lock(man, false);
+	}
+
+	unmap_mapping_range(bdev->dev_mapping, 0, 0 , 1);
+	/*TODO What about ttm_mem_io_free_vm(bo) ? */
+
+	for (i = TTM_NUM_MEM_TYPES - 1; i >= 0; i--) {
+		man = &bdev->man[i];
+		if (man->has_type && man->use_type)
+			ttm_mem_io_unlock(man);
+	}
+}
+EXPORT_SYMBOL(ttm_bo_unmap_virtual_address_space);
 
 int ttm_bo_wait(struct ttm_buffer_object *bo,
 		bool interruptible, bool no_wait)
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index c9e0fd0..3133463 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -600,6 +600,8 @@ int ttm_bo_device_init(struct ttm_bo_device *bdev,
  */
 void ttm_bo_unmap_virtual(struct ttm_buffer_object *bo);
 
+void ttm_bo_unmap_virtual_address_space(struct ttm_bo_device *bdev);
+
 /**
  * ttm_bo_unmap_virtual
  *
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
