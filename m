Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C35B1170850
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 20:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D3C6EBC3;
	Wed, 26 Feb 2020 19:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6CC6EBB1;
 Wed, 26 Feb 2020 19:02:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZmLyK4z1NlcwPr9WZ3B98vFZL6TbIKb82HmC0WFlcY76mDqBM4l+UH5kmmiIqZsow8PgGMGX+kUrB1ylLj22MpBq2lQwIF245lVCo8OFtz1iOKE7eUXJvg5kkrHv5iOB4u1k922j8s7RDXpEI74OpQZAyN53gSkikzwF9dlUGf2TRh2vA0yFUtbEolOag8fdeFCUow1mISJLtBYUZORyYX2ejKgUczCQwuDBtI6ZGg77RmqAvskCNqaohnK4cSlKMy85zFvX+sLv+KKwQmHtm34UAcVRDSq71yk6Fz2FHHisclueJj9+NyBBzoHKczUZBQgzMuZYdKL8yunf8rwV0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpbplLFkHuHULlyRgLQceVq8WbBsfo1Ixm0Kgnaxgfw=;
 b=Q82QbTWW5f+nFfUqISbhrt5CwZYhAZhXo2PJypf0JqtKWtcLz3qB75dscsT7YEbV5B6QxEIe5eikdpax+hLZL98kVguoC/X5jilQ4TR3Dfo7quOdOYAZktaVnfrQC2TG6vsgZWSxQ3qjdmkV/6I6nN2wOhbg7926Ae68zBQMkcUWsvCKKyKvml9KhjkKhYYPKXPTyG0C3qwHv8K2aUFSi8ijYXRXATTJ4Sleu5kWOXtx9BH8iOfA7wcYyieg+kBYHarV7jyrGsnjbq7FrE4ShMq6uEQZ/bgsa4AMjOzJyvric7s1sh8BovCF7wBkRxE22rVIcHtFBaTMvmVBUqgolw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpbplLFkHuHULlyRgLQceVq8WbBsfo1Ixm0Kgnaxgfw=;
 b=TBwDjCjaVT982ve+94KXrgKUqBUIQzOymIyCDzHnPK1DX0hGCuTzyWasF/UBhAb2mKX2kc/lLjWepdZqqotWjvpGdesf0hN3cx4q89dmVJRs6khcBBwo1HOlSIxjLd46eetq8rviU4L4dnZJswU7sGPD7iblZcimLP/4fIwYBXE=
Received: from BN6PR1701CA0005.namprd17.prod.outlook.com
 (2603:10b6:405:15::15) by MN2PR12MB4111.namprd12.prod.outlook.com
 (2603:10b6:208:1de::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Wed, 26 Feb
 2020 19:02:11 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:15:cafe::4) by BN6PR1701CA0005.outlook.office365.com
 (2603:10b6:405:15::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14 via Frontend
 Transport; Wed, 26 Feb 2020 19:02:11 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2772.14 via Frontend Transport; Wed, 26 Feb 2020 19:02:11 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 26 Feb
 2020 13:02:10 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 26 Feb
 2020 13:02:10 -0600
Received: from yuho-zbook.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 26 Feb 2020 13:02:09 -0600
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>
Subject: [PATCH v2 10/11] drm, cgroup: add update trigger after limit change
Date: Wed, 26 Feb 2020 14:01:51 -0500
Message-ID: <20200226190152.16131-11-Kenny.Ho@amd.com>
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
 SFS:(10009020)(4636009)(396003)(376002)(136003)(346002)(39860400002)(428003)(199004)(189003)(2906002)(316002)(478600001)(110136005)(1076003)(70206006)(336012)(426003)(70586007)(2616005)(15650500001)(6666004)(26005)(86362001)(81156014)(356004)(81166006)(4326008)(186003)(36756003)(5660300002)(8676002)(8936002)(7696005)(921003)(1121003)(2101003)(83996005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4111; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a535615-d7c7-4425-802d-08d7baee626b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4111:
X-Microsoft-Antispam-PRVS: <MN2PR12MB41113FD59711A8EBFED242E783EA0@MN2PR12MB4111.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-Forefront-PRVS: 0325F6C77B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9DF4S9Sokm9GXdfAyEQ5Rv+Np8elsrpTXKHcc9fLPsEPlzd68XA7cvE92UoaMeYRtNzQrSmBvsqBAlHtHkSX8gyIUygaAtIrEHyrQUuP+9IM0f3K0u90ZNLSX8wuc2OGLOx8huU0xdQ6BnSK+ph3t0+gxwYAElRN/7pW5Aj2i7jQxZMmkgoHo/LyjkPwVn9H2pWkZ/of4gruxJy2H1cEHw5REuRjoGkhdCjUgfy4ovZVT2cQfSoQqq/YT0z85TIxF6kpEAQDdobyDbIp4N5Xb+Mx4mgzO+v4sQZfrv6ODwWl6lzpWycib5ODhzxjEb8670gpio+Gj+tbtosQnhU03hixKt8zAr6W6GGn3jdIKcGJbqFSmiILUMwH/31YIRGd8u83GgHIIt7SgzW+x4o/Md7w8cx2/UcFUR6BnBIAsuojdBe+8lobtLx5jzSXqPi1T15baMcQOjnsksO365iaaNDfmpZsfVhk+Skl6TQsINtuBJgI1GQZERyXsRUkNUhl14hntg/x5rTi0PpWr0Z5vEDbNK4t5UjkWvDcKwNrgnE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2020 19:02:11.1979 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a535615-d7c7-4425-802d-08d7baee626b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111
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
 kernel/cgroup/drm.c   | 58 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

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
index 2eadabebdfea..da439a351b07 100644
--- a/kernel/cgroup/drm.c
+++ b/kernel/cgroup/drm.c
@@ -127,6 +127,26 @@ static inline void drmcg_update_cg_tree(struct drm_device *dev)
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
 static void drmcg_calculate_effective_compute(struct drm_device *dev,
 		const unsigned long *free_weighted,
 		struct drmcg *parent_drmcg)
@@ -208,6 +228,8 @@ static void drmcg_apply_effective_compute(struct drm_device *dev)
                                 capacity);
 			ddr->compute_count_eff =
 				bitmap_weight(ddr->compute_eff, capacity);
+
+			drmcg_limit_updated(dev, drmcg, DRMCG_TYPE_COMPUTE);
 		}
 	}
 	rcu_read_unlock();
@@ -732,10 +754,46 @@ static int drmcg_css_online(struct cgroup_subsys_state *css)
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
 struct cgroup_subsys gpu_cgrp_subsys = {
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
