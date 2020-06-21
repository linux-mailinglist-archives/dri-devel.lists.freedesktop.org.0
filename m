Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF09202910
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jun 2020 08:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7556E44D;
	Sun, 21 Jun 2020 06:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760044.outbound.protection.outlook.com [40.107.76.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F15C6E451;
 Sun, 21 Jun 2020 06:05:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUSTUCg8QA28QOsdK7ET1kzVlbReLYE0CLjJ2tGkvLL8G25BhKzr/BxiC8Gn3IIT3Q395vHO1EW1qbMj2YXlPrQSFHw+8W9P69hueLe8emSBTwUKZ08cmk9EBrnoN2hK5n1kVel/5B6P/8AreUAR9IgDm53m2KNpuesChLM6DdrLQAsvc/SW5+ceF55RRji2Uvl8SgbEHNaRWWkACq/toKxDHHIE/m65BfdSXT3C3r+qe4lDCYqfbUdvtcZJINyiFtUgXlpCU+aYqMUMK52J0Acgo6vfQOyi2sFVEgNV1BR2TkmibgvXj80Ykm416AS99veyOsn/KLpVGHrANUNlZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIrWzPMowm5TjuEA66Z8rI3MCFz1SjUvQwR6p2ItHPY=;
 b=GinsgcsGfjBZHghT5nPN1v2YTy3BXFimFoyrWwULYGlFFSMiteVj704tKgytZcNxfLNMpLWdCh5bNOP7xMkWru6FaSksNdBfH/6nsL/AoanWyUF0STOLpa2XEsTjknlRQZycVzKWRPiDPtkgpNKiyaLujhinWHNRRUAxLUdprb08DmT3PDbT4V/79fTDC3OBUmmkbWCO17hrPHPokMtv6ECU8BSgES1B7uuW8NUnMOTofCZpTNCjIXceBngc4irJ9+3L6No7092Y7Qz6yqI1iZrEmyveA485naNpz/tpkyAxVbEME2f5GNbOaS2bGKPgvwjBheG0yJqXCcJwiQIeew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIrWzPMowm5TjuEA66Z8rI3MCFz1SjUvQwR6p2ItHPY=;
 b=wmqvPRT33I0deUOB1oexOgKakmY73LK4ByNNwEMho4P8YjoJYoMqIPIPbILsy6RV1PD1F2UhoPpiUbUumET/eN0KdbHQmFDIcjZlR4XXHkHKMvYAZbX4O2gG4CAKdLqCNIgBCBm/aaIy9KGdNuxOXtdO8OSmy+WKvrOlnJrTQgI=
Received: from BN6PR22CA0069.namprd22.prod.outlook.com (2603:10b6:404:ca::31)
 by BN6PR12MB1185.namprd12.prod.outlook.com (2603:10b6:404:1e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Sun, 21 Jun
 2020 06:05:44 +0000
Received: from BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:ca:cafe::ea) by BN6PR22CA0069.outlook.office365.com
 (2603:10b6:404:ca::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend
 Transport; Sun, 21 Jun 2020 06:05:44 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BN8NAM11FT043.mail.protection.outlook.com (10.13.177.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3109.22 via Frontend Transport; Sun, 21 Jun 2020 06:05:44 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 21 Jun
 2020 01:05:44 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 21 Jun
 2020 01:05:43 -0500
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Sun, 21 Jun 2020 01:05:43 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 5/8] drm/amdgpu: Refactor sysfs removal
Date: Sun, 21 Jun 2020 02:03:05 -0400
Message-ID: <1592719388-13819-6-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(136003)(396003)(39850400004)(376002)(46966005)(336012)(70206006)(478600001)(7696005)(86362001)(26005)(186003)(8676002)(36756003)(30864003)(5660300002)(8936002)(70586007)(6666004)(2616005)(4326008)(426003)(44832011)(356005)(2906002)(82310400002)(47076004)(82740400003)(83380400001)(110136005)(81166007)(316002)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84289a31-c179-4f89-2dc7-08d815a9228b
X-MS-TrafficTypeDiagnostic: BN6PR12MB1185:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1185544903072AEFB4F5A8BBEA960@BN6PR12MB1185.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-Forefront-PRVS: 04410E544A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fR39fJ7bwDbEg9hgKXS4gpwjq9ac9cOWxtnXd0rVyb4rXqNRhxGMmxZ3fM2rII/bJykWL+xzMJIOrdm5IRfeIvwe7gQYX4YYhd0zdofdVVedWWcK0C0IJLrpEDb17SjurUH6pHA+qOqpU4s8HOZ2nWgF8iDMtaJQhqU+o1fOC7n5vNQ9dxSS+KYgjjhgnISWwLdjMnAxafa+rYi6uWAgxWgMc4d2oxS7+GXov4sgTdnUOC2ryld6qe3PNbbizqiNm2ZWStu0YpX9FZek8CgzWudi3rZLEsPt+f+01/rPxUB7dAiOXlkLg3YMItX2vfdEUcLNopV4JB9qiZ62tFIsoD9Vie8Up1GzpakFxj6X3a5LS3ohV11OJkMUJ8es2fufns4VZmuNMZBPvDiIkMixEQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2020 06:05:44.5698 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84289a31-c179-4f89-2dc7-08d815a9228b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1185
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

Track sysfs files in a list so they all can be removed during pci remove
since otherwise their removal after that causes crash because parent
folder was already removed during pci remove.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h          | 13 +++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c |  7 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   | 35 ++++++++++++++++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 12 ++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c      |  8 ++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 ++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c     | 13 ++++++++++-
 drivers/gpu/drm/amd/amdgpu/df_v3_6.c         | 10 +++++---
 8 files changed, 99 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 604a681..ba3775f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -726,6 +726,15 @@ struct amd_powerplay {
 
 #define AMDGPU_RESET_MAGIC_NUM 64
 #define AMDGPU_MAX_DF_PERFMONS 4
+
+struct amdgpu_sysfs_list_node {
+	struct list_head head;
+	struct device_attribute *attr;
+};
+
+#define AMDGPU_DEVICE_ATTR_LIST_NODE(_attr) \
+	struct amdgpu_sysfs_list_node dev_attr_handle_##_attr = {.attr = &dev_attr_##_attr}
+
 struct amdgpu_device {
 	struct device			*dev;
 	struct drm_device		*ddev;
@@ -992,6 +1001,10 @@ struct amdgpu_device {
 	char				product_number[16];
 	char				product_name[32];
 	char				serial[16];
+
+	struct list_head sysfs_files_list;
+	struct mutex	 sysfs_files_list_lock;
+
 };
 
 static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_device *bdev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
index fdd52d8..c1549ee 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
@@ -1950,8 +1950,10 @@ static ssize_t amdgpu_atombios_get_vbios_version(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%s\n", ctx->vbios_version);
 }
 
+
 static DEVICE_ATTR(vbios_version, 0444, amdgpu_atombios_get_vbios_version,
 		   NULL);
+static AMDGPU_DEVICE_ATTR_LIST_NODE(vbios_version);
 
 /**
  * amdgpu_atombios_fini - free the driver info and callbacks for atombios
@@ -1972,7 +1974,6 @@ void amdgpu_atombios_fini(struct amdgpu_device *adev)
 	adev->mode_info.atom_context = NULL;
 	kfree(adev->mode_info.atom_card_info);
 	adev->mode_info.atom_card_info = NULL;
-	device_remove_file(adev->dev, &dev_attr_vbios_version);
 }
 
 /**
@@ -2038,6 +2039,10 @@ int amdgpu_atombios_init(struct amdgpu_device *adev)
 		return ret;
 	}
 
+	mutex_lock(&adev->sysfs_files_list_lock);
+	list_add_tail(&dev_attr_handle_vbios_version.head, &adev->sysfs_files_list);
+	mutex_unlock(&adev->sysfs_files_list_lock);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index e7b9065..3173046 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2928,6 +2928,12 @@ static const struct attribute *amdgpu_dev_attributes[] = {
 	NULL
 };
 
+static AMDGPU_DEVICE_ATTR_LIST_NODE(product_name);
+static AMDGPU_DEVICE_ATTR_LIST_NODE(product_number);
+static AMDGPU_DEVICE_ATTR_LIST_NODE(serial_number);
+static AMDGPU_DEVICE_ATTR_LIST_NODE(pcie_replay_count);
+
+
 /**
  * amdgpu_device_init - initialize the driver
  *
@@ -3029,6 +3035,9 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	INIT_LIST_HEAD(&adev->shadow_list);
 	mutex_init(&adev->shadow_list_lock);
 
+	INIT_LIST_HEAD(&adev->sysfs_files_list);
+	mutex_init(&adev->sysfs_files_list_lock);
+
 	INIT_DELAYED_WORK(&adev->delayed_init_work,
 			  amdgpu_device_delayed_init_work_handler);
 	INIT_DELAYED_WORK(&adev->gfx.gfx_off_delay_work,
@@ -3281,6 +3290,13 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	if (r) {
 		dev_err(adev->dev, "Could not create amdgpu device attr\n");
 		return r;
+	} else {
+		mutex_lock(&adev->sysfs_files_list_lock);
+		list_add_tail(&dev_attr_handle_product_name.head, &adev->sysfs_files_list);
+		list_add_tail(&dev_attr_handle_product_number.head, &adev->sysfs_files_list);
+		list_add_tail(&dev_attr_handle_serial_number.head, &adev->sysfs_files_list);
+		list_add_tail(&dev_attr_handle_pcie_replay_count.head, &adev->sysfs_files_list);
+		mutex_unlock(&adev->sysfs_files_list_lock);
 	}
 
 	if (IS_ENABLED(CONFIG_PERF_EVENTS))
@@ -3298,6 +3314,16 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	return r;
 }
 
+static void amdgpu_sysfs_remove_files(struct amdgpu_device *adev)
+{
+	struct amdgpu_sysfs_list_node *node;
+
+	mutex_lock(&adev->sysfs_files_list_lock);
+	list_for_each_entry(node, &adev->sysfs_files_list, head)
+		device_remove_file(adev->dev, node->attr);
+	mutex_unlock(&adev->sysfs_files_list_lock);
+}
+
 /**
  * amdgpu_device_fini - tear down the driver
  *
@@ -3332,6 +3358,11 @@ void amdgpu_device_fini_early(struct amdgpu_device *adev)
 	amdgpu_fbdev_fini(adev);
 
 	amdgpu_irq_fini_early(adev);
+
+	amdgpu_sysfs_remove_files(adev);
+
+	if (adev->ucode_sysfs_en)
+		amdgpu_ucode_sysfs_fini(adev);
 }
 
 void amdgpu_device_fini_late(struct amdgpu_device *adev)
@@ -3366,10 +3397,6 @@ void amdgpu_device_fini_late(struct amdgpu_device *adev)
 	adev->rmmio = NULL;
 	amdgpu_device_doorbell_fini(adev);
 
-	if (adev->ucode_sysfs_en)
-		amdgpu_ucode_sysfs_fini(adev);
-
-	sysfs_remove_files(&adev->dev->kobj, amdgpu_dev_attributes);
 	if (IS_ENABLED(CONFIG_PERF_EVENTS))
 		amdgpu_pmu_fini(adev);
 	if (amdgpu_discovery && adev->asic_type >= CHIP_NAVI10)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 6271044..e7b6c4a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -76,6 +76,9 @@ static DEVICE_ATTR(mem_info_gtt_total, S_IRUGO,
 static DEVICE_ATTR(mem_info_gtt_used, S_IRUGO,
 	           amdgpu_mem_info_gtt_used_show, NULL);
 
+static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_gtt_total);
+static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_gtt_used);
+
 /**
  * amdgpu_gtt_mgr_init - init GTT manager and DRM MM
  *
@@ -114,6 +117,11 @@ static int amdgpu_gtt_mgr_init(struct ttm_mem_type_manager *man,
 		return ret;
 	}
 
+	mutex_lock(&adev->sysfs_files_list_lock);
+	list_add_tail(&dev_attr_handle_mem_info_gtt_total.head, &adev->sysfs_files_list);
+	list_add_tail(&dev_attr_handle_mem_info_gtt_used.head, &adev->sysfs_files_list);
+	mutex_unlock(&adev->sysfs_files_list_lock);
+
 	return 0;
 }
 
@@ -127,7 +135,6 @@ static int amdgpu_gtt_mgr_init(struct ttm_mem_type_manager *man,
  */
 static int amdgpu_gtt_mgr_fini(struct ttm_mem_type_manager *man)
 {
-	struct amdgpu_device *adev = amdgpu_ttm_adev(man->bdev);
 	struct amdgpu_gtt_mgr *mgr = man->priv;
 	spin_lock(&mgr->lock);
 	drm_mm_takedown(&mgr->mm);
@@ -135,9 +142,6 @@ static int amdgpu_gtt_mgr_fini(struct ttm_mem_type_manager *man)
 	kfree(mgr);
 	man->priv = NULL;
 
-	device_remove_file(adev->dev, &dev_attr_mem_info_gtt_total);
-	device_remove_file(adev->dev, &dev_attr_mem_info_gtt_used);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index ddb4af0c..554fec0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -2216,6 +2216,8 @@ static DEVICE_ATTR(usbc_pd_fw, S_IRUGO | S_IWUSR,
 		   psp_usbc_pd_fw_sysfs_read,
 		   psp_usbc_pd_fw_sysfs_write);
 
+static AMDGPU_DEVICE_ATTR_LIST_NODE(usbc_pd_fw);
+
 
 
 const struct amd_ip_funcs psp_ip_funcs = {
@@ -2242,13 +2244,17 @@ static int psp_sysfs_init(struct amdgpu_device *adev)
 
 	if (ret)
 		DRM_ERROR("Failed to create USBC PD FW control file!");
+	else {
+		mutex_lock(&adev->sysfs_files_list_lock);
+		list_add_tail(&dev_attr_handle_usbc_pd_fw.head, &adev->sysfs_files_list);
+		mutex_unlock(&adev->sysfs_files_list_lock);
+	}
 
 	return ret;
 }
 
 static void psp_sysfs_fini(struct amdgpu_device *adev)
 {
-	device_remove_file(adev->dev, &dev_attr_usbc_pd_fw);
 }
 
 const struct amdgpu_ip_block_version psp_v3_1_ip_block =
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 7723937..39c400c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -148,6 +148,12 @@ static DEVICE_ATTR(mem_info_vis_vram_used, S_IRUGO,
 static DEVICE_ATTR(mem_info_vram_vendor, S_IRUGO,
 		   amdgpu_mem_info_vram_vendor, NULL);
 
+static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_vram_total);
+static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_vis_vram_total);
+static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_vram_used);
+static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_vis_vram_used);
+static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_vram_vendor);
+
 static const struct attribute *amdgpu_vram_mgr_attributes[] = {
 	&dev_attr_mem_info_vram_total.attr,
 	&dev_attr_mem_info_vis_vram_total.attr,
@@ -184,6 +190,15 @@ static int amdgpu_vram_mgr_init(struct ttm_mem_type_manager *man,
 	ret = sysfs_create_files(&adev->dev->kobj, amdgpu_vram_mgr_attributes);
 	if (ret)
 		DRM_ERROR("Failed to register sysfs\n");
+	else {
+		mutex_lock(&adev->sysfs_files_list_lock);
+		list_add_tail(&dev_attr_handle_mem_info_vram_total.head, &adev->sysfs_files_list);
+		list_add_tail(&dev_attr_handle_mem_info_vis_vram_total.head, &adev->sysfs_files_list);
+		list_add_tail(&dev_attr_handle_mem_info_vram_used.head, &adev->sysfs_files_list);
+		list_add_tail(&dev_attr_handle_mem_info_vis_vram_used.head, &adev->sysfs_files_list);
+		list_add_tail(&dev_attr_handle_mem_info_vram_vendor.head, &adev->sysfs_files_list);
+		mutex_unlock(&adev->sysfs_files_list_lock);
+	}
 
 	return 0;
 }
@@ -198,7 +213,6 @@ static int amdgpu_vram_mgr_init(struct ttm_mem_type_manager *man,
  */
 static int amdgpu_vram_mgr_fini(struct ttm_mem_type_manager *man)
 {
-	struct amdgpu_device *adev = amdgpu_ttm_adev(man->bdev);
 	struct amdgpu_vram_mgr *mgr = man->priv;
 
 	spin_lock(&mgr->lock);
@@ -206,7 +220,6 @@ static int amdgpu_vram_mgr_fini(struct ttm_mem_type_manager *man)
 	spin_unlock(&mgr->lock);
 	kfree(mgr);
 	man->priv = NULL;
-	sysfs_remove_files(&adev->dev->kobj, amdgpu_vram_mgr_attributes);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index 90610b4..455eaa4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -272,6 +272,9 @@ static ssize_t amdgpu_xgmi_show_error(struct device *dev,
 static DEVICE_ATTR(xgmi_device_id, S_IRUGO, amdgpu_xgmi_show_device_id, NULL);
 static DEVICE_ATTR(xgmi_error, S_IRUGO, amdgpu_xgmi_show_error, NULL);
 
+static AMDGPU_DEVICE_ATTR_LIST_NODE(xgmi_device_id);
+static AMDGPU_DEVICE_ATTR_LIST_NODE(xgmi_error);
+
 static int amdgpu_xgmi_sysfs_add_dev_info(struct amdgpu_device *adev,
 					 struct amdgpu_hive_info *hive)
 {
@@ -285,10 +288,19 @@ static int amdgpu_xgmi_sysfs_add_dev_info(struct amdgpu_device *adev,
 		return ret;
 	}
 
+	mutex_lock(&adev->sysfs_files_list_lock);
+	list_add_tail(&dev_attr_handle_xgmi_device_id.head, &adev->sysfs_files_list);
+	mutex_unlock(&adev->sysfs_files_list_lock);
+
 	/* Create xgmi error file */
 	ret = device_create_file(adev->dev, &dev_attr_xgmi_error);
 	if (ret)
 		pr_err("failed to create xgmi_error\n");
+	else {
+		mutex_lock(&adev->sysfs_files_list_lock);
+		list_add_tail(&dev_attr_handle_xgmi_error.head, &adev->sysfs_files_list);
+		mutex_unlock(&adev->sysfs_files_list_lock);
+	}
 
 
 	/* Create sysfs link to hive info folder on the first device */
@@ -325,7 +337,6 @@ static int amdgpu_xgmi_sysfs_add_dev_info(struct amdgpu_device *adev,
 static void amdgpu_xgmi_sysfs_rem_dev_info(struct amdgpu_device *adev,
 					  struct amdgpu_hive_info *hive)
 {
-	device_remove_file(adev->dev, &dev_attr_xgmi_device_id);
 	sysfs_remove_link(&adev->dev->kobj, adev->ddev->unique);
 	sysfs_remove_link(hive->kobj, adev->ddev->unique);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
index a7b8292..f95b0b2 100644
--- a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
+++ b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
@@ -265,6 +265,8 @@ static ssize_t df_v3_6_get_df_cntr_avail(struct device *dev,
 /* device attr for available perfmon counters */
 static DEVICE_ATTR(df_cntr_avail, S_IRUGO, df_v3_6_get_df_cntr_avail, NULL);
 
+static AMDGPU_DEVICE_ATTR_LIST_NODE(df_cntr_avail);
+
 static void df_v3_6_query_hashes(struct amdgpu_device *adev)
 {
 	u32 tmp;
@@ -299,6 +301,11 @@ static void df_v3_6_sw_init(struct amdgpu_device *adev)
 	ret = device_create_file(adev->dev, &dev_attr_df_cntr_avail);
 	if (ret)
 		DRM_ERROR("failed to create file for available df counters\n");
+	else {
+		mutex_lock(&adev->sysfs_files_list_lock);
+		list_add_tail(&dev_attr_handle_df_cntr_avail.head, &adev->sysfs_files_list);
+		mutex_unlock(&adev->sysfs_files_list_lock);
+	}
 
 	for (i = 0; i < AMDGPU_MAX_DF_PERFMONS; i++)
 		adev->df_perfmon_config_assign_mask[i] = 0;
@@ -308,9 +315,6 @@ static void df_v3_6_sw_init(struct amdgpu_device *adev)
 
 static void df_v3_6_sw_fini(struct amdgpu_device *adev)
 {
-
-	device_remove_file(adev->dev, &dev_attr_df_cntr_avail);
-
 }
 
 static void df_v3_6_enable_broadcast_mode(struct amdgpu_device *adev,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
