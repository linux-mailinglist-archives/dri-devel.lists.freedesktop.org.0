Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E38B3170844
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 20:02:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1598D6EBA7;
	Wed, 26 Feb 2020 19:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1156EB91;
 Wed, 26 Feb 2020 19:02:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dm3SMRDL41zFZu799kIMSlmSOyDuQH1AgMfwX/1RjEp4MvrrvQPqCAxmrbrhrJ24sO66qXvQLz/Nu9cS4dbsGsDQ7+Zv1cELsaGe2CsTcSMrxg4neIenyZPv/eNycvF+kmn2qVXipZOVeAalpZLSLv5vj6mDQIJ1U6vTlths77DbzNz5i0+xY4ItfijO4gLMa6LYWHDi1KlwdighroO+UOHt5ENtMxXHZ6ykP0VM0BitWWHMrXp15KILJ7sJo5Bd/lEJMFg0pTA4vMBYLj1oFZldmvRdDUSPXY10IcvCadEc3GRUium3yjnssyzbQmFETj8dSj+3jpd55i6LkHV+Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDjmHQ9BMdiPJKyRL+KkHYw+s6jN5irmJDPeYaRghG8=;
 b=cpZh1c2uYVit0ls1p5UE65eiD2JKuI4ImX74m6wZnVjoRTboPuuYccf5+sDwgqVseRJSCbS8xuqABurkZjkD83Oc3C47vQDG8EbEsFxC7PWt0zOZQhpAnkwuu2vFxgQpgEq9j/9R6HaGgR++tA0GFq1TONtk/hjmD4HVoD/ai21IDB3hLFHeHRWCrxy5NeE30GnG+gaVgt5cqaUb3V0iW3Cp11V/eLxe8pUgevm30CUz3rMhcDCSj/zSuu2Qmg+HhHfzyWFDj0KOhcgbJ0Ac6shu/9IIJtSpEsbaWD4qv/gauc0pt4yuAboJ8s8eEaSORLBrO/8BGPUnk3uewacdLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDjmHQ9BMdiPJKyRL+KkHYw+s6jN5irmJDPeYaRghG8=;
 b=Pm6HAe4/1NhI5/lHxI02gsnZSteHEFIykxs3RYi78tCDMK0u80OwHk3Os85nQDi7b5I6QtZ1/9nhJ8crfE5v8tWQdeiG1tCdD74JZBAnMVlIgc+yzcwstkxFXgKRgw122eA9AidnG9jpcmajNd3m4l87cI7k/FRBc+CaNoh2D+E=
Received: from DM5PR19CA0036.namprd19.prod.outlook.com (2603:10b6:3:9a::22) by
 MW2PR12MB2540.namprd12.prod.outlook.com (2603:10b6:907:7::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.21; Wed, 26 Feb 2020 19:02:05 +0000
Received: from DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:9a:cafe::7b) by DM5PR19CA0036.outlook.office365.com
 (2603:10b6:3:9a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend
 Transport; Wed, 26 Feb 2020 19:02:05 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT063.mail.protection.outlook.com (10.13.172.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2772.14 via Frontend Transport; Wed, 26 Feb 2020 19:02:05 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 26 Feb
 2020 13:02:04 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 26 Feb
 2020 13:02:04 -0600
Received: from yuho-zbook.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 26 Feb 2020 13:02:03 -0600
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>
Subject: [PATCH v2 03/11] drm, cgroup: Initialize drmcg properties
Date: Wed, 26 Feb 2020 14:01:44 -0500
Message-ID: <20200226190152.16131-4-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200226190152.16131-1-Kenny.Ho@amd.com>
References: <lkaplan@cray.com; daniel@ffwll.ch; nirmoy.das@amd.com;
 damon.mcdougall@amd.com; juan.zuniga-anaya@amd.com; hannes@cmpxchg.org>
 <20200226190152.16131-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(136003)(396003)(428003)(199004)(189003)(36756003)(70206006)(70586007)(6666004)(356004)(478600001)(2906002)(8936002)(86362001)(81166006)(8676002)(81156014)(316002)(110136005)(26005)(7696005)(426003)(2616005)(5660300002)(4326008)(1076003)(336012)(186003)(921003)(83996005)(1121003)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR12MB2540; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6206e1c6-f6fb-46e5-7814-08d7baee5f1b
X-MS-TrafficTypeDiagnostic: MW2PR12MB2540:
X-Microsoft-Antispam-PRVS: <MW2PR12MB25402B41BA6F49342AA1406C83EA0@MW2PR12MB2540.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 0325F6C77B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VhYj0yEz9HKrcefFgRF87N9JNqNnAMGmZOG6y74u01Dr1mYIoPmWBo7mRtLV0thglK1beL2oL5b1Dh2xdmb+MPdwA6whnCkbhGMmQi/ajbCJ8uLcjoqFEdUjmg7cMdXi+R35FiHEiu2HHlYIpZhQXaxk3EH+wZJsDRTsL+uPgCLgjbldCvS4VDwuDjp4brYLkyp5lLyj4RwQHCpcxr+/qTauubjcUi2zfO01eSnM9wUW0WDsqPXY/pglJTLUMsGJsC+nY1573A6J76HMWhQWotHZYmJInp3peyWgbo5zLdWmdd2r5tlNt+w2OQKnym1LJtXtnHd0yxXK5CtTKqQn+drHEFYq/aD6yBDZrVfltgghhfHnhMssJIFmHQa0PYFKxqhibtmdXHNxhB5YyLfmfTmNhL73rEXPJy+98bFnyZJdzFbUDJeUGXtm1Tb95SVQWfNv2e73+P88yE670iW/u6rduOrmLXjwOtCbWWMdG+lKR2i0d6H+QtdAOeSnoxoOOBrHedJf/3qdqtrYohN/98Yc3u/WQIC/azRT5LLlLb8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2020 19:02:05.5943 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6206e1c6-f6fb-46e5-7814-08d7baee5f1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2540
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
index e418a61f5c85..e10bd42ebdba 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -644,6 +644,7 @@ int drm_dev_init(struct drm_device *dev,
 	mutex_init(&dev->filelist_mutex);
 	mutex_init(&dev->clientlist_mutex);
 	mutex_init(&dev->master_mutex);
+	mutex_init(&dev->drmcg_mutex);
 
 	dev->anon_inode = drm_fs_inode_new();
 	if (IS_ERR(dev->anon_inode)) {
@@ -680,6 +681,7 @@ int drm_dev_init(struct drm_device *dev,
 	if (ret)
 		goto err_setunique;
 
+	drmcg_device_early_init(dev);
 	return 0;
 
 err_setunique:
@@ -694,6 +696,7 @@ int drm_dev_init(struct drm_device *dev,
 	drm_fs_inode_free(dev->anon_inode);
 err_free:
 	put_device(dev->dev);
+	mutex_destroy(&dev->drmcg_mutex);
 	mutex_destroy(&dev->master_mutex);
 	mutex_destroy(&dev->clientlist_mutex);
 	mutex_destroy(&dev->filelist_mutex);
@@ -770,6 +773,7 @@ void drm_dev_fini(struct drm_device *dev)
 
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
index 307bb75db248..ff94b48aa2dc 100644
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
index 061bb9c458e4..351df517d5a6 100644
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
 
@@ -171,3 +263,16 @@ struct cgroup_subsys gpu_cgrp_subsys = {
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
