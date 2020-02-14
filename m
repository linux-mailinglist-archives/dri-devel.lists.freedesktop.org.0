Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4EB15DD0E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 16:57:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8453D6F9EF;
	Fri, 14 Feb 2020 15:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D344B6F9E6;
 Fri, 14 Feb 2020 15:57:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkXiGhSuaaXD7mv1ZJX/K66SsOzTF8BQTHrAJdW/D4m7UefI0nP7Z/6SsT2jCGVu2jQV2aDFjN5lS2O3Ys1UY/qlPiaKm8TA/UXLH89nfTcWCmxxa4HiZp79tJbFlv74nJwW02OI3vhfvZqpI57Y8Ne/zy+SbHJdBZrI9ISbJSBcoVoy82a/H9liXoriZZ/C6DmgKbLz9gni/onXMOROPx/hl0F5vzSB+DgVX1bRPQLOfbIIl1gfl4TE5DqLV6bE6OsbpZng8aF5c2fJVG/g81jHTZSPINVR/WsKmz8wXURDX6zsnu+h5ZPiKE1WQRfJo7T0uVLrTBObRiAkIk08ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CV7hGKAQeTmH37PsOyv+FEVbtbyZ1TJI7sXBsy6xaBQ=;
 b=U5d70NDL7K67BmzFZCeiH9WXlNWAj9Po4utrP53iv1Sbzze6ktc0gWRyUOu2TybvZAk08HpAEhJjSoO3b0VrhgpmXXQWqeWSPpAqNfiidLLaUH1rSjrAlxCApqSCyhlCThUDpn5zBhDuCAeK7Q/3DvG5M6Cz5GQ9Us3X5+EDS/Bk6ivK/30+zOV7oyonZEncf3OE6i9u+oqZRrpc8ZpCM1SH4UvuGT3PlHmxXn1VN+Hhbwh4HHp9M1lVbSDuuLs7teFp3AFiVOusreqTsCQuMSvuVAfiWc4DbDeFX0olXE+QG9gHdSBmA07lxKAlFLgeUCdAfzEaTE+YmlpddRkIXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CV7hGKAQeTmH37PsOyv+FEVbtbyZ1TJI7sXBsy6xaBQ=;
 b=uIWnIxTcOFpBfiPcqKacFI19Kf+Wa31RvTsYiNGnMeORaE/yoeLkidMNg95XyOPLXUPETTymHFanVCM8X81aYyHQ0Qr+pTQMQoGb9dcfnNP3GZ6iNxDybtlEROnwueuLyyBGUFB7+0L8WAf8ut7MmZ6AGE+tBkYI4k1jkEJbkVg=
Received: from SN1PR12CA0078.namprd12.prod.outlook.com (2603:10b6:802:20::49)
 by DM6PR12MB2761.namprd12.prod.outlook.com (2603:10b6:5:41::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.23; Fri, 14 Feb
 2020 15:57:11 +0000
Received: from BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::208) by SN1PR12CA0078.outlook.office365.com
 (2603:10b6:802:20::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend
 Transport; Fri, 14 Feb 2020 15:57:11 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT029.mail.protection.outlook.com (10.13.177.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2729.22 via Frontend Transport; Fri, 14 Feb 2020 15:57:11 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 14 Feb
 2020 09:57:10 -0600
Received: from yuho-zbook.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 14 Feb 2020 09:57:09 -0600
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>,
 <lkaplan@cray.com>, <daniel@ffwll.ch>, <nirmoy.das@amd.com>,
 <damon.mcdougall@amd.com>, <juan.zuniga-anaya@amd.com>
Subject: [PATCH 03/11] drm, cgroup: Initialize drmcg properties
Date: Fri, 14 Feb 2020 10:56:42 -0500
Message-ID: <20200214155650.21203-4-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200214155650.21203-1-Kenny.Ho@amd.com>
References: <20200214155650.21203-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(396003)(376002)(428003)(199004)(189003)(6666004)(356004)(70206006)(86362001)(110136005)(316002)(81156014)(1076003)(8676002)(6636002)(8936002)(336012)(81166006)(70586007)(4326008)(26005)(5660300002)(478600001)(36756003)(2906002)(2616005)(186003)(426003)(7696005)(921003)(2101003)(83996005)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2761; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28801ced-5f46-4de6-7cf9-08d7b1668d99
X-MS-TrafficTypeDiagnostic: DM6PR12MB2761:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2761DE9679EF5AE804761C1383150@DM6PR12MB2761.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 03137AC81E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8a5IU/n/HswOpS3I2RDZLnARtdy/6Y0zR/MKTj5ikm565VAV1PuLwAC4GFliDyIfPT0k5n5TPGQObf2FeMjzUvrrlbDVsKBGZDTlHMTU6/oEQ5gSb8bc/p6pI1tJjgTX+o4QiV9ApgsCyq5Y3SGjJj4KBMFOgSMjF8pABzuL3RhRUsfu21sJJMb88pCI0b1YLZ5ODekOjs/sgHAMGPcJkcpsqxTq/OYPolZchqD9KzrgsaHLAcVVMCZsRXEjkaVWHW0LJMwNAUNP2fzw9oUjFMz3ktetEs2hhdfoqcuVGom33dsHFo+IIYKYt3+E6mqCcZvr0/13xInUGJl/zE8rLQ2ooFGWqEd4UoKw9SZNKDoMfi5QUwdspxfkBGLAqsZLOgacgJjE7WRbN31Q3p5GpGbfXNBiXTpQa8NODjylnRrdq7pu+n3rfOkmw6Q0BkOehui8F3Y28IyQUQuBB4Lc/V3bJuYiSDhobXWGfWkFHGoVftXIfEE1QHgDw2ANq7NobFHRAWsmO8PGHw7AY2Vi2biisbUCSA2BACWHvMIzYzM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 15:57:11.6211 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28801ced-5f46-4de6-7cf9-08d7b1668d99
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2761
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
Cc: Kenny Ho <Kenny.Ho@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drmcg initialization involves allocating a per cgroup, per device data
structure and setting the defaults.  There are two entry points for
drmcg init:

1) When struct drmcg is created via css_alloc, initialization is done
for each device

2) When DRM devices are created after drmcgs are created
  a) Per device drmcg data structure is allocated at the beginning of
  DRM device creation such that drmcg can begin tracking usage
  statistics
  b) At the end of DRM device creation, drmcg_register_dev will update in
  case device specific defaults need to be applied.

Entry point #2 usually applies to the root cgroup since it can be
created before DRM devices are available.  The drmcg controller will go
through all existing drm cgroups and initialize them with the new device
accordingly.

Change-Id: I64e421d8dfcc22ee8282cc1305960e20c2704db7
Signed-off-by: Kenny Ho <Kenny.Ho@amd.com>
---
 drivers/gpu/drm/drm_drv.c  |   4 ++
 include/drm/drm_cgroup.h   |  18 +++++++
 include/drm/drm_device.h   |   7 +++
 include/drm/drm_drv.h      |   9 ++++
 include/linux/cgroup_drm.h |  12 +++++
 kernel/cgroup/drm.c        | 105 +++++++++++++++++++++++++++++++++++++
 6 files changed, 155 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 8e59cc5a5bde..44a66edc81c2 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -643,6 +643,7 @@ int drm_dev_init(struct drm_device *dev,
 	mutex_init(&dev->filelist_mutex);
 	mutex_init(&dev->clientlist_mutex);
 	mutex_init(&dev->master_mutex);
+	mutex_init(&dev->drmcg_mutex);
 
 	dev->anon_inode = drm_fs_inode_new();
 	if (IS_ERR(dev->anon_inode)) {
@@ -679,6 +680,7 @@ int drm_dev_init(struct drm_device *dev,
 	if (ret)
 		goto err_setunique;
 
+	drmcg_device_early_init(dev);
 	return 0;
 
 err_setunique:
@@ -693,6 +695,7 @@ int drm_dev_init(struct drm_device *dev,
 	drm_fs_inode_free(dev->anon_inode);
 err_free:
 	put_device(dev->dev);
+	mutex_destroy(&dev->drmcg_mutex);
 	mutex_destroy(&dev->master_mutex);
 	mutex_destroy(&dev->clientlist_mutex);
 	mutex_destroy(&dev->filelist_mutex);
@@ -769,6 +772,7 @@ void drm_dev_fini(struct drm_device *dev)
 
 	put_device(dev->dev);
 
+	mutex_destroy(&dev->drmcg_mutex);
 	mutex_destroy(&dev->master_mutex);
 	mutex_destroy(&dev->clientlist_mutex);
 	mutex_destroy(&dev->filelist_mutex);
diff --git a/include/drm/drm_cgroup.h b/include/drm/drm_cgroup.h
index 530c9a0b3238..fda426fba035 100644
--- a/include/drm/drm_cgroup.h
+++ b/include/drm/drm_cgroup.h
@@ -4,8 +4,17 @@
 #ifndef __DRM_CGROUP_H__
 #define __DRM_CGROUP_H__
 
+#include <linux/cgroup_drm.h>
+
 #ifdef CONFIG_CGROUP_DRM
 
+/**
+ * Per DRM device properties for DRM cgroup controller for the purpose
+ * of storing per device defaults
+ */
+struct drmcg_props {
+};
+
 void drmcg_bind(struct drm_minor (*(*acq_dm)(unsigned int minor_id)),
 		void (*put_ddev)(struct drm_device *dev));
 
@@ -15,8 +24,13 @@ void drmcg_register_dev(struct drm_device *dev);
 
 void drmcg_unregister_dev(struct drm_device *dev);
 
+void drmcg_device_early_init(struct drm_device *device);
+
 #else
 
+struct drmcg_props {
+};
+
 static inline void drmcg_bind(
 		struct drm_minor (*(*acq_dm)(unsigned int minor_id)),
 		void (*put_ddev)(struct drm_device *dev))
@@ -35,5 +49,9 @@ static inline void drmcg_unregister_dev(struct drm_device *dev)
 {
 }
 
+static inline void drmcg_device_early_init(struct drm_device *device)
+{
+}
+
 #endif /* CONFIG_CGROUP_DRM */
 #endif /* __DRM_CGROUP_H__ */
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 1acfc3bbd3fb..a94598b8f670 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -8,6 +8,7 @@
 
 #include <drm/drm_hashtab.h>
 #include <drm/drm_mode_config.h>
+#include <drm/drm_cgroup.h>
 
 struct drm_driver;
 struct drm_minor;
@@ -308,6 +309,12 @@ struct drm_device {
 	 */
 	struct drm_fb_helper *fb_helper;
 
+        /** \name DRM Cgroup */
+	/*@{ */
+	struct mutex drmcg_mutex;
+	struct drmcg_props drmcg_props;
+	/*@} */
+
 	/* Everything below here is for legacy driver, never use! */
 	/* private: */
 #if IS_ENABLED(CONFIG_DRM_LEGACY)
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index cf13470810a5..1f65ac4d9bbf 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -715,6 +715,15 @@ struct drm_driver {
 			    struct drm_device *dev,
 			    uint32_t handle);
 
+	/**
+	 * @drmcg_custom_init
+	 *
+	 * Optional callback used to initialize drm cgroup per device properties
+	 * such as resource limit defaults.
+	 */
+	void (*drmcg_custom_init)(struct drm_device *dev,
+			struct drmcg_props *props);
+
 	/**
 	 * @gem_vm_ops: Driver private ops for this object
 	 *
diff --git a/include/linux/cgroup_drm.h b/include/linux/cgroup_drm.h
index 854591bbb430..2014097eb75c 100644
--- a/include/linux/cgroup_drm.h
+++ b/include/linux/cgroup_drm.h
@@ -4,6 +4,7 @@
 #ifndef _CGROUP_DRM_H
 #define _CGROUP_DRM_H
 
+#include <linux/mutex.h>
 #include <linux/cgroup.h>
 #include <drm/drm_file.h>
 
@@ -12,11 +13,19 @@
 
 #ifdef CONFIG_CGROUP_DRM
 
+/**
+ * Per DRM cgroup, per device resources (such as statistics and limits)
+ */
+struct drmcg_device_resource {
+	/* for per device stats */
+};
+
 /**
  * The DRM cgroup controller data structure.
  */
 struct drmcg {
 	struct cgroup_subsys_state	css;
+	struct drmcg_device_resource	*dev_resources[MAX_DRM_DEV];
 };
 
 /**
@@ -70,6 +79,9 @@ static inline struct drmcg *drmcg_parent(struct drmcg *cg)
 
 #else /* CONFIG_CGROUP_DRM */
 
+struct drmcg_device_resource {
+};
+
 struct drmcg {
 };
 
diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
index 37f98dc47268..30fd9aeffbe7 100644
--- a/kernel/cgroup/drm.c
+++ b/kernel/cgroup/drm.c
@@ -1,11 +1,17 @@
 // SPDX-License-Identifier: MIT
 // Copyright 2019 Advanced Micro Devices, Inc.
 #include <linux/bitmap.h>
+#include <linux/export.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/cgroup.h>
+#include <linux/fs.h>
+#include <linux/seq_file.h>
+#include <linux/mutex.h>
+#include <linux/kernel.h>
 #include <linux/cgroup_drm.h>
 #include <drm/drm_file.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_device.h>
 #include <drm/drm_cgroup.h>
 
@@ -54,6 +60,47 @@ void drmcg_unbind(void)
 }
 EXPORT_SYMBOL(drmcg_unbind);
 
+/* caller must hold dev->drmcg_mutex */
+static inline int init_drmcg_single(struct drmcg *drmcg, struct drm_device *dev)
+{
+	int minor = dev->primary->index;
+	struct drmcg_device_resource *ddr = drmcg->dev_resources[minor];
+
+	if (ddr == NULL) {
+		ddr = kzalloc(sizeof(struct drmcg_device_resource),
+			GFP_KERNEL);
+
+		if (!ddr)
+			return -ENOMEM;
+	}
+
+	drmcg->dev_resources[minor] = ddr;
+
+	/* set defaults here */
+
+	return 0;
+}
+
+static inline void drmcg_update_cg_tree(struct drm_device *dev)
+{
+	struct cgroup_subsys_state *pos;
+	struct drmcg *child;
+
+	if (root_drmcg == NULL)
+		return;
+
+	/* init cgroups created before registration (i.e. root cgroup) */
+
+	/* use cgroup_mutex instead of rcu_read_lock because
+	 * init_drmcg_single has alloc which may sleep */
+	mutex_lock(&cgroup_mutex);
+	css_for_each_descendant_pre(pos, &root_drmcg->css) {
+		child = css_to_drmcg(pos);
+		init_drmcg_single(child, dev);
+	}
+	mutex_unlock(&cgroup_mutex);
+}
+
 /**
  * drmcg_register_dev - register a DRM device for usage in drm cgroup
  * @dev: DRM device
@@ -71,6 +118,13 @@ void drmcg_register_dev(struct drm_device *dev)
 
 	mutex_lock(&drmcg_mutex);
 	set_bit(dev->primary->index, known_devs);
+
+	if (dev->driver->drmcg_custom_init)
+	{
+		dev->driver->drmcg_custom_init(dev, &dev->drmcg_props);
+
+		drmcg_update_cg_tree(dev);
+	}
 	mutex_unlock(&drmcg_mutex);
 }
 EXPORT_SYMBOL(drmcg_register_dev);
@@ -137,23 +191,61 @@ static int drm_minor_for_each(int (*fn)(int id, void *p, void *data),
 	return rc;
 }
 
+static int drmcg_css_free_fn(int id, void *ptr, void *data)
+{
+	struct drm_minor *minor = ptr;
+	struct drmcg *drmcg = data;
+
+	if (minor->type != DRM_MINOR_PRIMARY)
+		return 0;
+
+	kfree(drmcg->dev_resources[minor->index]);
+
+	return 0;
+}
+
 static void drmcg_css_free(struct cgroup_subsys_state *css)
 {
 	struct drmcg *drmcg = css_to_drmcg(css);
 
+	drm_minor_for_each(&drmcg_css_free_fn, drmcg);
+
 	kfree(drmcg);
 }
 
+static int init_drmcg_fn(int id, void *ptr, void *data)
+{
+	struct drm_minor *minor = ptr;
+	struct drmcg *drmcg = data;
+	int rc;
+
+	if (minor->type != DRM_MINOR_PRIMARY)
+		return 0;
+
+	mutex_lock(&minor->dev->drmcg_mutex);
+	rc = init_drmcg_single(drmcg, minor->dev);
+	mutex_unlock(&minor->dev->drmcg_mutex);
+
+	return rc;
+}
+
 static struct cgroup_subsys_state *
 drmcg_css_alloc(struct cgroup_subsys_state *parent_css)
 {
 	struct drmcg *parent = css_to_drmcg(parent_css);
 	struct drmcg *drmcg;
+	int rc;
 
 	drmcg = kzalloc(sizeof(struct drmcg), GFP_KERNEL);
 	if (!drmcg)
 		return ERR_PTR(-ENOMEM);
 
+	rc = drm_minor_for_each(&init_drmcg_fn, drmcg);
+	if (rc) {
+		drmcg_css_free(&drmcg->css);
+		return ERR_PTR(rc);
+	}
+
 	if (!parent)
 		root_drmcg = drmcg;
 
@@ -171,3 +263,16 @@ struct cgroup_subsys drm_cgrp_subsys = {
 	.legacy_cftypes	= files,
 	.dfl_cftypes	= files,
 };
+
+/**
+ * drmcg_device_early_init - initialize device specific resources for DRM cgroups
+ * @dev: the target DRM device
+ *
+ * Allocate and initialize device specific resources for existing DRM cgroups.
+ * Typically only the root cgroup exists before the initialization of @dev.
+ */
+void drmcg_device_early_init(struct drm_device *dev)
+{
+	drmcg_update_cg_tree(dev);
+}
+EXPORT_SYMBOL(drmcg_device_early_init);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
