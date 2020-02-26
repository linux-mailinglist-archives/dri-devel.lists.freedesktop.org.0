Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FA2170843
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 20:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7ED6EB9C;
	Wed, 26 Feb 2020 19:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6A96E107;
 Wed, 26 Feb 2020 19:02:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPonj55NW3W4swJP8O23xVx552XApuCRzxz0tTvq1v35QqfSS014mqLYWOSTKBrviP7sVeSXxqCK051fAZXekZ3MeddCFn2nEb7RQrAzQmSW5otJljL4FY2TKZEykxPQk2sARhc27ml1eXz+dW/KO2D1Br5FQKcRFi910+ZMjPENMqYJxvMT4vVAMlAsfAgSDVaUSjBMIv6MaY12YAsOkB8WaHPv7QdIR1J6mySc+VBRApo7qEv4lJCos30Dk2DwK8we4lkFR5REpTlEcCFPnXxUbirQwLsdm3+K1oN8yBug8Ix0UHsyzlKDDmrmby6QGPgXehZJ5O+iSrFljwc0ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dC80z490x8sni2ZqGHuoJ/3EBLF3zugdZGEK5Ukyck0=;
 b=ExRAGX0qM0efyV7aaJV33GgMU4apKLCpwDdWoZvlFz4QWugKygJt5SKlGddwNniJ60SwZvpTbWP+BrAsqvQufw8rZZY4g4dZCwQ892fOAsZmHoMykF+Qvk3uUQukV/hYMSRInEEd1DEeBnz4XlZiMnNT/Atyz23mRu4zzTg7LajlnagauFdleiE8G4ELo9TF6LGXSZId71o6EudgELt92g15jwy0EsQbIuoyZhDDYkbM2cg3lMIyZTu5GRs1ifXdgFNgpJ9ZzOtz3OEueSmiqkuokYHzdovfMD8ZxX7tf69YpX9Aflr79PAltN/Xu5LRnHpA8hM74YQ9OprC0rJr/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dC80z490x8sni2ZqGHuoJ/3EBLF3zugdZGEK5Ukyck0=;
 b=lGjAlDV/6q/ERlytj0/HlD6csUGaIJWXe2RX2tWv37Zsuc8UQpUOf0wLkhKCjFy1xloNzlcrdy5YGMYFZk/XOTjTfChJJJQrAXsJ13qI0aHVLnC7q+8zuROyIgJA4HE+lh6CmBPww9jhOW/VrDYAay9pS4I3F0Mr6Kp9kKp8Hc0=
Received: from MN2PR16CA0032.namprd16.prod.outlook.com (2603:10b6:208:134::45)
 by MN2PR12MB4190.namprd12.prod.outlook.com (2603:10b6:208:1dd::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Wed, 26 Feb
 2020 19:02:05 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:208:134:cafe::91) by MN2PR16CA0032.outlook.office365.com
 (2603:10b6:208:134::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15 via Frontend
 Transport; Wed, 26 Feb 2020 19:02:05 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2772.14 via Frontend Transport; Wed, 26 Feb 2020 19:02:05 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 26 Feb
 2020 13:02:04 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 26 Feb
 2020 13:02:03 -0600
Received: from yuho-zbook.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 26 Feb 2020 13:02:03 -0600
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>
Subject: [PATCH v2 02/11] drm, cgroup: Bind drm and cgroup subsystem
Date: Wed, 26 Feb 2020 14:01:43 -0500
Message-ID: <20200226190152.16131-3-Kenny.Ho@amd.com>
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
 SFS:(10009020)(4636009)(396003)(376002)(136003)(346002)(39860400002)(428003)(189003)(199004)(81156014)(110136005)(2616005)(8676002)(70206006)(426003)(6666004)(26005)(70586007)(81166006)(186003)(356004)(1076003)(8936002)(478600001)(7696005)(86362001)(316002)(5660300002)(2906002)(36756003)(4326008)(336012)(921003)(2101003)(83996005)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4190; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f62ef0fb-7496-4f8c-fea5-08d7baee5ecf
X-MS-TrafficTypeDiagnostic: MN2PR12MB4190:
X-Microsoft-Antispam-PRVS: <MN2PR12MB419024C6E468D6E96C777FDC83EA0@MN2PR12MB4190.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 0325F6C77B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S1tcfA2YlO45KEOJ1Gxbj3YVLuBNUglMe5U7+9t4beaQyFcNP+/qA1l21YqYq+UffjPLPDVIg3+fDq9rloE8T9FczIt1uUSJSe3Inm7qrCWeu4/P7JnelOlvnsyVXKYNKIp2gqXSGhroACI/j5S/h/lzPEsEdJkzziWmK4Adx7tSA4HiRd+u3v91M8AYHoScB6tGVUUnzzgmiWuMP0s/ZlqhFUqoS/ttiWzHVXTEUNByv74sHARU0Y6vmc8wXSqzm+56pVnIO8ecfIYIhvZmuCvascAFqkCpLmokQGWWi4RUTEo8b1SRP2oSRh5+xH6QffRbqudwU62+32swUBcn+qGWAR10Y2NukmSnQAKVortPklW/gqTfTF6Mxi/GWkIIbUdmJhJM44dFUGUNIOmLSgcnuTRGGjklbOOqG1APSC+LtAYi6BTXM+0rloSllmNf2QyUmej0XQKa3jtlPf9IGoB74INF59r+oRlzYTs5ptmlA1YiA2mhflPQ3grrQoBjDRlqZtAk84GmyAk5jnK7/TYWn0izjSes0At6o1ECMZM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2020 19:02:05.1447 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f62ef0fb-7496-4f8c-fea5-08d7baee5ecf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4190
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
index 7c18a980cd4b..e418a61f5c85 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -41,6 +41,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_mode_object.h>
 #include <drm/drm_print.h>
+#include <drm/drm_cgroup.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
@@ -973,6 +974,8 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 
 	ret = 0;
 
+	drmcg_register_dev(dev);
+
 	DRM_INFO("Initialized %s %d.%d.%d %s for %s on minor %d\n",
 		 driver->name, driver->major, driver->minor,
 		 driver->patchlevel, driver->date,
@@ -1007,6 +1010,8 @@ EXPORT_SYMBOL(drm_dev_register);
  */
 void drm_dev_unregister(struct drm_device *dev)
 {
+	drmcg_unregister_dev(dev);
+
 	if (drm_core_check_feature(dev, DRIVER_LEGACY))
 		drm_lastclose(dev);
 
@@ -1113,6 +1118,7 @@ static const struct file_operations drm_stub_fops = {
 
 static void drm_core_exit(void)
 {
+	drmcg_unbind();
 	unregister_chrdev(DRM_MAJOR, "drm");
 	debugfs_remove(drm_debugfs_root);
 	drm_sysfs_destroy();
@@ -1139,6 +1145,8 @@ static int __init drm_core_init(void)
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
index 345af54a5d41..307bb75db248 100644
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
index 5e38a8230922..061bb9c458e4 100644
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
