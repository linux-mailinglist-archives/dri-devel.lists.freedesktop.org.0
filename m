Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A64BB15DD1A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 16:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1966F9F5;
	Fri, 14 Feb 2020 15:57:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::620])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2378A6F9EC;
 Fri, 14 Feb 2020 15:57:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oH1rJhaEscMJGyCuHuyd4qwtgWi0MBXx+WpjZ2CI5Vw6XKMxFbJGqSJe4yrxTsGA++tgFf7whbQeHshLDXfncT9IeEobdvRAMigiEbBs23fSJgXIRSjYQOLV3dF4qiz1nioarF164KQLXTIdhzKOH5FtJ5fSqlNuIbH0muSLfUQyR5LK72RdVyfdi/fvTu8Ftt9RjO1bjUWU7zD/I+VMgfIwqKLtDt0JZkpyUBrRK1w5Jmiul1nkFrqHhxaRCDaJVU131DgNwdV9u4QigZAf/b4Tr/cQcmvRXggCWopl55+ToBt7TcHhhKHDP9fZURvyTT16TOoaS6w/uiH9gsD9Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DltWDmUoat4C6/gr1wh/v/rSEdrfM7FwlqNY9LzYxuU=;
 b=awvJ5TGcrm+jc+bYOw9NYXt7ZrPtIjKzDSg5chs0pDLAHgUSsnzKCaDi0GJ+yCG50sUK2lXsifwi1nFNSSitEaH4oJ+55DZSfe7ihLubGY2AeplB6wy4Ru5T+zRj83rK5sduNJ71qbA+aKNzjwBURvMtMuQJI0MqeDsNoQGob/6+BakuOGMwNvMnVCfC2xv/kkc+C3ttqqeZTfToiAh1qCdGSGStfqEKuKV/hWDd7ax7qTgqa2jcYdg7dz/tdvuSVASi3rupPXRLkwd5AQ+aykFeLyedvm3cwJDCj5QK59AtaD6iDoHeMOHczqHYjfqlO9wFwP8utFh88+ti48IgEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DltWDmUoat4C6/gr1wh/v/rSEdrfM7FwlqNY9LzYxuU=;
 b=HIbR4fNS0VXt3PLHnFqh3JyfBN6gmCzzE9pnqfUuef1mEffYKkLvg9hajzpKdvjdplEd4kVXBndOharzZu1gBn2TeRNZqzpslj1HBQ0lq3e8Lowy6nIwmtv56vE0Bvx1i5gjV1kBhSADRYtFcoqws6gKcI3dTSWm2pELM2dXCbw=
Received: from SN1PR12CA0078.namprd12.prod.outlook.com (2603:10b6:802:20::49)
 by BY5PR12MB3699.namprd12.prod.outlook.com (2603:10b6:a03:195::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25; Fri, 14 Feb
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
 15.20.2729.22 via Frontend Transport; Fri, 14 Feb 2020 15:57:10 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 14 Feb
 2020 09:57:09 -0600
Received: from yuho-zbook.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 14 Feb 2020 09:57:08 -0600
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>,
 <lkaplan@cray.com>, <daniel@ffwll.ch>, <nirmoy.das@amd.com>,
 <damon.mcdougall@amd.com>, <juan.zuniga-anaya@amd.com>
Subject: [PATCH 02/11] drm, cgroup: Bind drm and cgroup subsystem
Date: Fri, 14 Feb 2020 10:56:41 -0500
Message-ID: <20200214155650.21203-3-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200214155650.21203-1-Kenny.Ho@amd.com>
References: <20200214155650.21203-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(428003)(189003)(199004)(336012)(26005)(2616005)(186003)(426003)(86362001)(316002)(7696005)(110136005)(1076003)(356004)(6666004)(70206006)(70586007)(2906002)(8936002)(5660300002)(81156014)(8676002)(4326008)(478600001)(81166006)(36756003)(6636002)(921003)(1121003)(2101003)(83996005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB3699; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d500ff1c-ba2f-4568-7f55-08d7b1668d39
X-MS-TrafficTypeDiagnostic: BY5PR12MB3699:
X-Microsoft-Antispam-PRVS: <BY5PR12MB36994A982EAC7C5577BBB50B83150@BY5PR12MB3699.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 03137AC81E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oJpObbpCu8/Oo7EjQdw2TAH0q1Olek4LH8eXV/LZVppr3V6gB1tpesgj1kIeBZqpDq3DjJ80MXIMHmXcpELdyj+PkUQD6s8AJlxtJx7NBtnxpzK/naDZXpmcs0jFJ8a9Mj+npifRvTzOGwGhe4ypn/6IrAbMy3Kx1Lqj8NKpA3i1brJraWJFR/Dd3H+3ALN/v7Xo5dRaRSv5SljaSYa78Q4t91vz2AktOjnAYKoycrE4qgN+NQOaqzJnDyIkxtWsLlGPyA6i2USwFuhVXpfJm2pdXjHPM//CMygEqt6aBujGwe85OGk9aCpTOnydtp7gkFOCCPaPoyA91bCyt0rPbofbb+hOrsjvEQZX2VakKQFv+V00owaltAyJc7aF+yBORjSVQHXzbFEXt5qr/6mQ2ztuddJuMa+nA+JUVAF3ATI0i3V0J1usasvY202hawDNypVu+N8Qbv4PXh6oTxdajSYztnUERLHV2U+A5z83RaMbNeKMdboa3BKO9EX0pY/Tw0v9jN1T7Syy/DTAxDjEbLPa4TDW2ugfWl6j08B46BY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 15:57:10.9920 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d500ff1c-ba2f-4568-7f55-08d7b1668d39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3699
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

Since the drm subsystem can be compiled as a module and drm devices can
be added and removed during run time, add several functions to bind the
drm subsystem as well as drm devices with drmcg.

Two pairs of functions:
drmcg_bind/drmcg_unbind - used to bind/unbind the drm subsystem to the
cgroup subsystem as the drm core initialize/exit.

drmcg_register_dev/drmcg_unregister_dev - used to register/unregister
drm devices to the cgroup subsystem as the devices are presented/removed
from userspace.

Change-Id: I1cb6b2080fc7d27979d886ef23e784341efafb41
---
 drivers/gpu/drm/drm_drv.c  |   8 +++
 include/drm/drm_cgroup.h   |  39 +++++++++++
 include/linux/cgroup_drm.h |   4 ++
 kernel/cgroup/drm.c        | 131 +++++++++++++++++++++++++++++++++++++
 4 files changed, 182 insertions(+)
 create mode 100644 include/drm/drm_cgroup.h

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 1b9b40a1c7c9..8e59cc5a5bde 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -41,6 +41,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_mode_object.h>
 #include <drm/drm_print.h>
+#include <drm/drm_cgroup.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
@@ -972,6 +973,8 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 
 	ret = 0;
 
+	drmcg_register_dev(dev);
+
 	DRM_INFO("Initialized %s %d.%d.%d %s for %s on minor %d\n",
 		 driver->name, driver->major, driver->minor,
 		 driver->patchlevel, driver->date,
@@ -1006,6 +1009,8 @@ EXPORT_SYMBOL(drm_dev_register);
  */
 void drm_dev_unregister(struct drm_device *dev)
 {
+	drmcg_unregister_dev(dev);
+
 	if (drm_core_check_feature(dev, DRIVER_LEGACY))
 		drm_lastclose(dev);
 
@@ -1112,6 +1117,7 @@ static const struct file_operations drm_stub_fops = {
 
 static void drm_core_exit(void)
 {
+	drmcg_unbind();
 	unregister_chrdev(DRM_MAJOR, "drm");
 	debugfs_remove(drm_debugfs_root);
 	drm_sysfs_destroy();
@@ -1138,6 +1144,8 @@ static int __init drm_core_init(void)
 	if (ret < 0)
 		goto error;
 
+	drmcg_bind(&drm_minor_acquire, &drm_dev_put);
+
 	drm_core_init_complete = true;
 
 	DRM_DEBUG("Initialized\n");
diff --git a/include/drm/drm_cgroup.h b/include/drm/drm_cgroup.h
new file mode 100644
index 000000000000..530c9a0b3238
--- /dev/null
+++ b/include/drm/drm_cgroup.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2019 Advanced Micro Devices, Inc.
+ */
+#ifndef __DRM_CGROUP_H__
+#define __DRM_CGROUP_H__
+
+#ifdef CONFIG_CGROUP_DRM
+
+void drmcg_bind(struct drm_minor (*(*acq_dm)(unsigned int minor_id)),
+		void (*put_ddev)(struct drm_device *dev));
+
+void drmcg_unbind(void);
+
+void drmcg_register_dev(struct drm_device *dev);
+
+void drmcg_unregister_dev(struct drm_device *dev);
+
+#else
+
+static inline void drmcg_bind(
+		struct drm_minor (*(*acq_dm)(unsigned int minor_id)),
+		void (*put_ddev)(struct drm_device *dev))
+{
+}
+
+static inline void drmcg_unbind(void)
+{
+}
+
+static inline void drmcg_register_dev(struct drm_device *dev)
+{
+}
+
+static inline void drmcg_unregister_dev(struct drm_device *dev)
+{
+}
+
+#endif /* CONFIG_CGROUP_DRM */
+#endif /* __DRM_CGROUP_H__ */
diff --git a/include/linux/cgroup_drm.h b/include/linux/cgroup_drm.h
index ba7981ac3afc..854591bbb430 100644
--- a/include/linux/cgroup_drm.h
+++ b/include/linux/cgroup_drm.h
@@ -5,6 +5,10 @@
 #define _CGROUP_DRM_H
 
 #include <linux/cgroup.h>
+#include <drm/drm_file.h>
+
+/* limit defined per the way drm_minor_alloc operates */
+#define MAX_DRM_DEV (64 * DRM_MINOR_RENDER)
 
 #ifdef CONFIG_CGROUP_DRM
 
diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
index e97861b3cb30..37f98dc47268 100644
--- a/kernel/cgroup/drm.c
+++ b/kernel/cgroup/drm.c
@@ -1,11 +1,142 @@
 // SPDX-License-Identifier: MIT
 // Copyright 2019 Advanced Micro Devices, Inc.
+#include <linux/bitmap.h>
+#include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/cgroup.h>
 #include <linux/cgroup_drm.h>
+#include <drm/drm_file.h>
+#include <drm/drm_device.h>
+#include <drm/drm_cgroup.h>
 
 static struct drmcg *root_drmcg __read_mostly;
 
+/* global mutex for drmcg across all devices */
+static DEFINE_MUTEX(drmcg_mutex);
+
+static DECLARE_BITMAP(known_devs, MAX_DRM_DEV);
+
+static struct drm_minor (*(*acquire_drm_minor)(unsigned int minor_id));
+
+static void (*put_drm_dev)(struct drm_device *dev);
+
+/**
+ * drmcg_bind - Bind DRM subsystem to cgroup subsystem
+ * @acq_dm: function pointer to the drm_minor_acquire function
+ * @put_ddev: function pointer to the drm_dev_put function
+ *
+ * This function binds some functions from the DRM subsystem and make
+ * them available to the drmcg subsystem.
+ *
+ * drmcg_unbind does the opposite of this function
+ */
+void drmcg_bind(struct drm_minor (*(*acq_dm)(unsigned int minor_id)),
+		void (*put_ddev)(struct drm_device *dev))
+{
+	mutex_lock(&drmcg_mutex);
+	acquire_drm_minor = acq_dm;
+	put_drm_dev = put_ddev;
+	mutex_unlock(&drmcg_mutex);
+}
+EXPORT_SYMBOL(drmcg_bind);
+
+/**
+ * drmcg_unbind - Unbind DRM subsystem from cgroup subsystem
+ *
+ * drmcg_bind does the opposite of this function
+ */
+void drmcg_unbind(void)
+{
+	mutex_lock(&drmcg_mutex);
+	acquire_drm_minor = NULL;
+	put_drm_dev = NULL;
+	mutex_unlock(&drmcg_mutex);
+}
+EXPORT_SYMBOL(drmcg_unbind);
+
+/**
+ * drmcg_register_dev - register a DRM device for usage in drm cgroup
+ * @dev: DRM device
+ *
+ * This function make a DRM device visible to the cgroup subsystem.
+ * Once the drmcg is aware of the device, drmcg can start tracking and
+ * control resource usage for said device.
+ *
+ * drmcg_unregister_dev reverse the operation of this function
+ */
+void drmcg_register_dev(struct drm_device *dev)
+{
+	if (WARN_ON(dev->primary->index >= MAX_DRM_DEV))
+		return;
+
+	mutex_lock(&drmcg_mutex);
+	set_bit(dev->primary->index, known_devs);
+	mutex_unlock(&drmcg_mutex);
+}
+EXPORT_SYMBOL(drmcg_register_dev);
+
+/**
+ * drmcg_unregister_dev - Iterate through all stored DRM minors
+ * @dev: DRM device
+ *
+ * Unregister @dev so that drmcg no longer control resource usage
+ * of @dev.  The @dev was registered to drmcg using
+ * drmcg_register_dev function
+ */
+void drmcg_unregister_dev(struct drm_device *dev)
+{
+	if (WARN_ON(dev->primary->index >= MAX_DRM_DEV))
+		return;
+
+	mutex_lock(&drmcg_mutex);
+	clear_bit(dev->primary->index, known_devs);
+	mutex_unlock(&drmcg_mutex);
+}
+EXPORT_SYMBOL(drmcg_unregister_dev);
+
+/**
+ * drm_minor_for_each - Iterate through all stored DRM minors
+ * @fn: Function to be called for each pointer.
+ * @data: Data passed to callback function.
+ *
+ * The callback function will be called for each registered device, passing
+ * the minor, the @drm_minor entry and @data.
+ *
+ * If @fn returns anything other than %0, the iteration stops and that
+ * value is returned from this function.
+ */
+static int drm_minor_for_each(int (*fn)(int id, void *p, void *data),
+		void *data)
+{
+	int rc = 0;
+
+	mutex_lock(&drmcg_mutex);
+	if (acquire_drm_minor) {
+		unsigned int minor;
+		struct drm_minor *dm;
+
+		minor = find_next_bit(known_devs, MAX_DRM_DEV, 0);
+		while (minor < MAX_DRM_DEV) {
+			dm = acquire_drm_minor(minor);
+
+			if (IS_ERR(dm))
+				continue;
+
+			rc = fn(minor, (void *)dm, data);
+
+			put_drm_dev(dm->dev); /* release from acquire_drm_minor */
+
+			if (rc)
+				break;
+
+			minor = find_next_bit(known_devs, MAX_DRM_DEV, minor+1);
+		}
+	}
+	mutex_unlock(&drmcg_mutex);
+
+	return rc;
+}
+
 static void drmcg_css_free(struct cgroup_subsys_state *css)
 {
 	struct drmcg *drmcg = css_to_drmcg(css);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
