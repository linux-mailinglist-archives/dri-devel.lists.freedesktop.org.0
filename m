Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C304202908
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jun 2020 08:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536F76E440;
	Sun, 21 Jun 2020 06:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EEC6E431;
 Sun, 21 Jun 2020 06:05:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcHLRq1aHU21EgUTCEZnxJrJpHXzeb0IUYA+MBwR00EyzGo9PKybRTEXeCR1bds4vJnPCVubDV7DVwrTZD7hZM/P7Qx6BKgfvw+xOOVVU7XgbK7n+/SaWODpgu1Fj/LrLBaDhteu+D+UN3jZjVni+u78XHuYjzqkGAMmtXQNHoQZtg5x9wUz5s72l8uNMuXPgyeHtK9CLIWwWLOiVSQ2Fp5wvDgIDKkGBvLWENI9kpTIt7rsQ5Ssi1UpGJbZvXaR11PxBIiqfPSQTzKaHXx4ojQy+gYoR1HBfwYArGdaUerdu+hfeedDzvimCbPn5Zz66QJJhTaTmCCKaWQpzUcdkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LK31aSdV7jTR9uF8W+DmCM+W+0H/07TTemjLEKoRhM=;
 b=VEZwSyHjVvJOitSCidmqzJH+QxqVSOSS01eAxKaSu9gkdckjAiRf79MCXTPa8Bj/H9dschiKQJi1WROheXyrngKehc6cKWE2C4tkUcd2sGQk8MKVe2SD5gwWSR9rCS/BJ1brUlBkUvL2A9XedZ8ncszrpbXoL+WyaG4bkbsJlon42UGUdR2dlAZLNkowQhqr6bf3X6u9dhqFAmAN3snjQ5us94UXfYKWjiVmuOfOil9AWCsL25yUkU52LRCmbwETwp0nt/6ir1RNND432RIFlconWeuNjDAOmXuxkPxydRytyIGEaU153iL/9UqTP+QtLIgqNoXJ7jv2/wVaGM3JAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LK31aSdV7jTR9uF8W+DmCM+W+0H/07TTemjLEKoRhM=;
 b=o9x6I1eVhL6kCjaaKYYtotBSRbd2M31cCs25hBSEmuOd2uAZm3wiAQfiW/M6Ia4zvkA+SGscf5ZsQwWTXS4WJms71fi8OJz2CzxmfMU+WQM4g9ochkdjQVUd1a4pcPz39078dfQxDmdMmLaJ8C1zb5O53jGUm625jW8wtERjbvE=
Received: from DM6PR17CA0031.namprd17.prod.outlook.com (2603:10b6:5:1b3::44)
 by DM6PR12MB4297.namprd12.prod.outlook.com (2603:10b6:5:211::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Sun, 21 Jun
 2020 06:05:42 +0000
Received: from DM6NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b3:cafe::7f) by DM6PR17CA0031.outlook.office365.com
 (2603:10b6:5:1b3::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Sun, 21 Jun 2020 06:05:42 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT061.mail.protection.outlook.com (10.13.173.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3109.22 via Frontend Transport; Sun, 21 Jun 2020 06:05:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 21 Jun
 2020 01:05:41 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 21 Jun
 2020 01:05:40 -0500
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Sun, 21 Jun 2020 01:05:40 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 3/8] drm/ttm: Add unampping of the entire device address
 space
Date: Sun, 21 Jun 2020 02:03:03 -0400
Message-ID: <1592719388-13819-4-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(46966005)(81166007)(36756003)(4326008)(478600001)(110136005)(316002)(54906003)(8676002)(336012)(186003)(70206006)(26005)(426003)(5660300002)(44832011)(82310400002)(2616005)(356005)(8936002)(7696005)(70586007)(47076004)(83380400001)(86362001)(82740400003)(6666004)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9e56809-e162-4669-c5ca-08d815a92142
X-MS-TrafficTypeDiagnostic: DM6PR12MB4297:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4297531BB0FC3035FA1FFCBAEA960@DM6PR12MB4297.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 04410E544A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YPEFZ3OAkLZZpmlxnyUG3RQG1QQoFDfKcF9Ln9qceIyQP8QwqxAz8d+I2x85w6R80MFklSP2CV5aWuuzBxGpj2i6Pm4OKcepcoiq6EtR/5rje1MvqVayiwq0o+BEkOEgIjp5gwcQDsvXv1UC4hUhQUWT2cHHyA97+AuZX7zNv83g81ILB43dorIOxB4UYkQG/OsgsM1XgViK6C9k+SCXXigmsKRMcfBvqJyTdurT61C4CCqxSas0s9cHo56TMWVWB2rfe1HV0Gkwnacwu4Lac7SlOoDGnb0/JpJqVb+t3Tt2k1VSWq/7Rum9N0YIsC1hU4yz9CRvQGgK7GnxqULcYQqXbH2y9X2PskIdPcJepoZ35U5tBfGbAusRpxidAX2wQ901V+XGz+PCQO4yUtNlWg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2020 06:05:42.3766 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9e56809-e162-4669-c5ca-08d815a92142
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4297
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

Helper function to be used to invalidate all BOs CPU mappings
once device is removed.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c    | 8 ++++++--
 include/drm/ttm/ttm_bo_driver.h | 7 +++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index c5b516f..926a365 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1750,10 +1750,14 @@ void ttm_bo_unmap_virtual(struct ttm_buffer_object *bo)
 	ttm_bo_unmap_virtual_locked(bo);
 	ttm_mem_io_unlock(man);
 }
-
-
 EXPORT_SYMBOL(ttm_bo_unmap_virtual);
 
+void ttm_bo_unmap_virtual_address_space(struct ttm_bo_device *bdev)
+{
+	unmap_mapping_range(bdev->dev_mapping, 0, 0, 1);
+}
+EXPORT_SYMBOL(ttm_bo_unmap_virtual_address_space);
+
 int ttm_bo_wait(struct ttm_buffer_object *bo,
 		bool interruptible, bool no_wait)
 {
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index c9e0fd0..39ea44f 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -601,6 +601,13 @@ int ttm_bo_device_init(struct ttm_bo_device *bdev,
 void ttm_bo_unmap_virtual(struct ttm_buffer_object *bo);
 
 /**
+ * ttm_bo_unmap_virtual_address_space
+ *
+ * @bdev: tear down all the virtual mappings for this device
+ */
+void ttm_bo_unmap_virtual_address_space(struct ttm_bo_device *bdev);
+
+/**
  * ttm_bo_unmap_virtual
  *
  * @bo: tear down the virtual mappings for this BO
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
