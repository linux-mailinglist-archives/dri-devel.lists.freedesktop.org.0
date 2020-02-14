Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FEA15DD21
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 16:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E456F9F6;
	Fri, 14 Feb 2020 15:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEB86F9FB;
 Fri, 14 Feb 2020 15:57:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XpseHFhxO1itLqJSaF6NAytTgtp2WA+RDBx8SNwmWdNSsd/aqezvqLD8pbqOVXVA0tWrwGcdBAF/B7YVCvd5zruTjJ6eYSwW95RQKgD/te4ipgGc+nIQrC23oLu8ja18jk0PG7Av9fMB2SlEssqQuD1i+1F+u02lq3dss8nJZurisuz+4R3nRNYKP7v9sWX4K7vzj5HgMmm0eZbBSEdHomoYxIwb3NX0NOfjJ5iLIb0zNnddPLXqI61ObLCe4lAgeA4macvJ4tcvSE9Z03UDl5Ud4z/zuw2FyRw6orHn+iMslo6+7ErrXBQRsU1Qedp8ViBDG/q/7n0xiOh8+VC8Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCod5hSt1K1BbXJXcf/RSS+TJFsOmI14u7cdB2jdZBE=;
 b=VV3ccTX55zlnV+efqxeGuzJzbUCq8MtcfG1IukoDDZhBMlIr1uCTctpNBItiOZdL/OK/Zr3M4c6+4PJPHBgbulpGV1zjynRGBtLzffzq/1u/j8pKSfFFXb104feBsD1ywheXmxBSdsdz5nrfvNwlox787xwx6yGoo4H8TFbVfTAfi4S/ctZGupCFTuhTZr7s6lQok/QcTqsF76xBqaIYsub/ihEf1Xh2uAPlVpktM8ZSSxL9ZdIa4SB2WbhKfo6fbLBclTsBpPDYUDbsOTkkLmE0Z2ra/g1KGSd/JF8p6TO5vvKqJdM4fvQdKvIHcsf887DHFsaBmK1W/6VjTd31FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCod5hSt1K1BbXJXcf/RSS+TJFsOmI14u7cdB2jdZBE=;
 b=dFb/Wyln4S2Lzy7ma7V6qQOMWEdmNWNOvtUdLJ8UxOTWqUL6rBYoGK2iy4v3swBGGGKedfu+dhSpvKRB4km+RbU2zqyaSIrKWnasLnZaw0rmz6OabnCNAAwnBrf5CVeJdSKsCaZSJ5y23uEYLcTp4Kwq8A7Tx8MGIwJLyH0zAIQ=
Received: from SN1PR12CA0078.namprd12.prod.outlook.com (2603:10b6:802:20::49)
 by BN8PR12MB3426.namprd12.prod.outlook.com (2603:10b6:408:4a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25; Fri, 14 Feb
 2020 15:57:18 +0000
Received: from BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::208) by SN1PR12CA0078.outlook.office365.com
 (2603:10b6:802:20::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend
 Transport; Fri, 14 Feb 2020 15:57:18 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT029.mail.protection.outlook.com (10.13.177.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2729.22 via Frontend Transport; Fri, 14 Feb 2020 15:57:18 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 14 Feb
 2020 09:57:17 -0600
Received: from yuho-zbook.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 14 Feb 2020 09:57:16 -0600
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>,
 <lkaplan@cray.com>, <daniel@ffwll.ch>, <nirmoy.das@amd.com>,
 <damon.mcdougall@amd.com>, <juan.zuniga-anaya@amd.com>
Subject: [PATCH 10/11] drm, cgroup: add update trigger after limit change
Date: Fri, 14 Feb 2020 10:56:49 -0500
Message-ID: <20200214155650.21203-11-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200214155650.21203-1-Kenny.Ho@amd.com>
References: <20200214155650.21203-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(136003)(39860400002)(428003)(199004)(189003)(5660300002)(2906002)(8936002)(81166006)(36756003)(6636002)(478600001)(81156014)(8676002)(4326008)(316002)(426003)(86362001)(110136005)(15650500001)(7696005)(336012)(26005)(2616005)(186003)(6666004)(70586007)(70206006)(356004)(1076003)(921003)(2101003)(83996005)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3426; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 817dc613-b77d-41e1-9e7a-08d7b1669190
X-MS-TrafficTypeDiagnostic: BN8PR12MB3426:
X-Microsoft-Antispam-PRVS: <BN8PR12MB34268FDCF3A4AAF389DEEB0883150@BN8PR12MB3426.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-Forefront-PRVS: 03137AC81E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ftod30y8DGzek4AiNCqdJA1l/AWBKIb7BO9tZpWrJxKcu0CNi+/qI4z3c7Q7ZKIebN/Ayi/CstgxirJrHgQF3YlTaf6fpXiXOBXJz4jxXx8MytkqyiyUT2dt+pieMIQknrSTJTO14kyjJiTqjdh26gINDYby2D6/s9qRKZNJQgb3iBV1NJQbrGUAjYpI8UnMIYLlcjis1Dm3JBPJra8kwRjEgEUKDg3AGovHJX5y31VTh9nLDKRNGKXtT3922gthYLygR95jIzomhUWsYw42ASC/O4L/jfV8hYWIZnzZfl84QgmS4HSmBB8MIgaMQdi05hSA30/3zlkHEB61NJUZZ52FBjFVWnpiGutujAErSO/a/E3xgVEzbpbwy1NODsDC7SDvJSBDAZTLY/W/LwUQ/8AxJpk9JkaB27p1PbbfXxH0eLuGtyJa7wCChaY8xk53HP8furtsU/i8M20xG+Ao/8wNmhOj3JvvocjKvScppvgbzW2Q91nefubIo5YMJDLwEHOOkJx956y0kYYuoRpJ8FVqULu/oc7kZhLyVmRcRjs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 15:57:18.2758 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 817dc613-b77d-41e1-9e7a-08d7b1669190
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3426
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

Before this commit, drmcg limits are updated but enforcement is delayed
until the next time the driver check against the new limit.  While this
is sufficient for certain resources, a more proactive enforcement may be
needed for other resources.

Introducing an optional drmcg_limit_updated callback for the DRM
drivers.  When defined, it will be called in two scenarios:
1) When limits are updated for a particular cgroup, the callback will be
triggered for each task in the updated cgroup.
2) When a task is migrated from one cgroup to another, the callback will
be triggered for each resource type for the migrated task.

Change-Id: I0ce7c4e5a04c31bd0f8d9853a383575d4bc9a3fa
Signed-off-by: Kenny Ho <Kenny.Ho@amd.com>
---
 include/drm/drm_drv.h | 10 ++++++++
 kernel/cgroup/drm.c   | 59 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 1f65ac4d9bbf..e7333143e722 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -724,6 +724,16 @@ struct drm_driver {
 	void (*drmcg_custom_init)(struct drm_device *dev,
 			struct drmcg_props *props);
 
+	/**
+	 * @drmcg_limit_updated
+	 *
+	 * Optional callback
+	 */
+	void (*drmcg_limit_updated)(struct drm_device *dev,
+			struct task_struct *task,
+			struct drmcg_device_resource *ddr,
+			enum drmcg_res_type res_type);
+
 	/**
 	 * @gem_vm_ops: Driver private ops for this object
 	 *
diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
index a4e88a3704bb..d3fa23b71f5f 100644
--- a/kernel/cgroup/drm.c
+++ b/kernel/cgroup/drm.c
@@ -133,6 +133,26 @@ static inline void drmcg_update_cg_tree(struct drm_device *dev)
 	mutex_unlock(&cgroup_mutex);
 }
 
+static void drmcg_limit_updated(struct drm_device *dev, struct drmcg *drmcg,
+		enum drmcg_res_type res_type)
+{
+	struct drmcg_device_resource *ddr =
+		drmcg->dev_resources[dev->primary->index];
+	struct css_task_iter it;
+	struct task_struct *task;
+
+	if (dev->driver->drmcg_limit_updated == NULL)
+		return;
+
+	css_task_iter_start(&drmcg->css.cgroup->self,
+			CSS_TASK_ITER_PROCS, &it);
+	while ((task = css_task_iter_next(&it))) {
+		dev->driver->drmcg_limit_updated(dev, task,
+				ddr, res_type);
+	}
+	css_task_iter_end(&it);
+}
+
 static void drmcg_calculate_effective_lgpu(struct drm_device *dev,
 		const unsigned long *free_static,
 		const unsigned long *free_weighted,
@@ -230,6 +250,8 @@ static void drmcg_apply_effective_lgpu(struct drm_device *dev)
 			bitmap_copy(ddr->lgpu_eff, ddr->lgpu_stg, capacity);
 			ddr->lgpu_count_eff =
 				bitmap_weight(ddr->lgpu_eff, capacity);
+
+			drmcg_limit_updated(dev, drmcg, DRMCG_TYPE_LGPU);
 		}
 	}
 	rcu_read_unlock();
@@ -686,7 +708,6 @@ static void drmcg_nested_limit_parse(struct kernfs_open_file *of,
 	}
 }
 
-
 /**
  * drmcg_limit_write - parse cgroup interface files to obtain user config
  *
@@ -879,10 +900,46 @@ static int drmcg_css_online(struct cgroup_subsys_state *css)
 	return drm_minor_for_each(&drmcg_online_fn, css_to_drmcg(css));
 }
 
+static int drmcg_attach_fn(int id, void *ptr, void *data)
+{
+	struct drm_minor *minor = ptr;
+	struct task_struct *task = data;
+	struct drm_device *dev;
+
+	if (minor->type != DRM_MINOR_PRIMARY)
+		return 0;
+
+	dev = minor->dev;
+
+	if (dev->driver->drmcg_limit_updated) {
+		struct drmcg *drmcg = drmcg_get(task);
+		struct drmcg_device_resource *ddr =
+			drmcg->dev_resources[minor->index];
+		enum drmcg_res_type type;
+
+		for (type = 0; type < __DRMCG_TYPE_LAST; type++)
+			dev->driver->drmcg_limit_updated(dev, task, ddr, type);
+
+		drmcg_put(drmcg);
+	}
+
+	return 0;
+}
+
+static void drmcg_attach(struct cgroup_taskset *tset)
+{
+	struct task_struct *task;
+	struct cgroup_subsys_state *css;
+
+	cgroup_taskset_for_each(task, css, tset)
+		drm_minor_for_each(&drmcg_attach_fn, task);
+}
+
 struct cgroup_subsys drm_cgrp_subsys = {
 	.css_alloc	= drmcg_css_alloc,
 	.css_free	= drmcg_css_free,
 	.css_online	= drmcg_css_online,
+	.attach		= drmcg_attach,
 	.early_init	= false,
 	.legacy_cftypes	= files,
 	.dfl_cftypes	= files,
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
