Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76454170841
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 20:02:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370766EB91;
	Wed, 26 Feb 2020 19:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770075.outbound.protection.outlook.com [40.107.77.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F07A6EB8D;
 Wed, 26 Feb 2020 19:02:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcTe3AeUT+R87cb6775rKmvDnrfdMukKmcZQh811PKy8YUuAx3dnF1Ukrssyfrbz2KyX7Kd2iTyQkrMvDQ5S6+95i8TU805kXGMx3A+Pqypek68bMldB9TGTQGsUn/oHQcq3a4aE5/E0IOPo8uc8tfxQR4RUypBTlwrql1HTP1q22dZpNUzJbRNzHBLH6FrpiCVkr9gNTp+THjeOEmJB5ZJvL0W4JileL7bUswy4b7NlE/UX2wJkn9tjZ41huYT21p4kQtry/NyKcKp+DBJflm1WXijB1oMJYi3nkCog/4mX6oc2pu6Tur2QR41Cyi3QjOCIdStqfXZmd0kvS3iJwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZBN1682Pm8WEeV5XlYZHllyETV/AMrAB1zuVH+Z6xA=;
 b=BzaItQU8x1Cz0bbu8XKhZgV8m3Uqf1GhqUUhC+v8x7U3OCGUUofrckTto4vFCiK8trUzWLneCZ1tNM1pmJwD8sd5zzCSP4705n+OHRTjolVFeAeB7nIb9sjDiYFBW2jwoHPRJwO5fPzt/MNawfnarwoJjBzF+V7EWU6ksqxmHlH6K0QwclKN5Ef1WSTPglB2tN+N7Tz0i0ZCzO/+aXL8oV1rzkO/FxOHb/1HO+8YC11bUTyrIqdme/fsvLOXng6Og9Q39YJNRO+jrBco+7Meljef9bvqM3eWm9aV1Q4qxDZ2DH7If9k2buQqjjPH9HgFr3Q06tGrCUmdCRqQqb2UiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZBN1682Pm8WEeV5XlYZHllyETV/AMrAB1zuVH+Z6xA=;
 b=Akw57VC8d3PeP1KRRkXGInw8XIE5sCzqaIrC/8ZqI72sEQU4OBIqJrqRnGI7kbjXs/IQRdHldCfyi6cdkP7stRrsmpILYRnw7BP1OUbJmXpm7bHQXd8e9oTL4AuNwuJw5NVib+3M4ItCG7ZOyW21qmJxpHSs4OvTQlNEhlZLgTc=
Received: from DM5PR19CA0027.namprd19.prod.outlook.com (2603:10b6:3:9a::13) by
 MN2PR12MB3311.namprd12.prod.outlook.com (2603:10b6:208:100::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Wed, 26 Feb
 2020 19:02:04 +0000
Received: from DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:9a:cafe::a1) by DM5PR19CA0027.outlook.office365.com
 (2603:10b6:3:9a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend
 Transport; Wed, 26 Feb 2020 19:02:04 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT063.mail.protection.outlook.com (10.13.172.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2772.14 via Frontend Transport; Wed, 26 Feb 2020 19:02:04 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 26 Feb
 2020 13:02:03 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 26 Feb
 2020 13:02:03 -0600
Received: from yuho-zbook.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 26 Feb 2020 13:02:02 -0600
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>
Subject: [PATCH v2 01/11] cgroup: Introduce cgroup for drm subsystem
Date: Wed, 26 Feb 2020 14:01:42 -0500
Message-ID: <20200226190152.16131-2-Kenny.Ho@amd.com>
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
 SFS:(10009020)(4636009)(376002)(396003)(136003)(346002)(39860400002)(428003)(199004)(189003)(86362001)(336012)(2906002)(26005)(70206006)(81156014)(186003)(426003)(81166006)(110136005)(70586007)(8936002)(4326008)(36756003)(478600001)(8676002)(2616005)(316002)(5660300002)(6666004)(1076003)(356004)(7696005)(921003)(1121003)(83996005)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3311; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ffe2dd4-b3bc-45bd-57e2-08d7baee5e7b
X-MS-TrafficTypeDiagnostic: MN2PR12MB3311:
X-Microsoft-Antispam-PRVS: <MN2PR12MB33118B327B27CF4F22D44FC683EA0@MN2PR12MB3311.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0325F6C77B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 62qpnapjYYAefi+/vAtsCj6rWUYg7FJNKlcr77ZBTnfNZKzDu6Hy3iXqykXlqPj+/KI9RH/1JNw4clDBAFa6bSDhZp9p32I5B94KTip1Jm7IJfitbiv5DgsZ871oC/f4zDdyZ8A3bkIE91DNHKkWLTJU/MJlZMi7LuCRzqeLQzorT5xF4a1SZ/s389l4+eSvPXu/zGTeXBKlJ9fuxENpn5IGJRAdMA33BuR2PuXAOa99TSFYgddZcAQFXZVksd6qoPOcs+U+Ycihq/U+mxbCyXO9idU2Blg5NlHYRu8S3ewdwj4KdFEx51UUBNnviPnPZ6dGKL5qVEu6reedTLT2Gdl43Dn+8JjkpAyQw5DaTaQ/zWeeGMYFP3xA7DRQ21Yy/ncWCEj+5dvKzdKRnc60GGG5cTEWFIcpHWTn9owxvSbWNIXjDisWpEzc4Efswf1b943ZQ2ZDvqQRNtyboYyXqTHc6RkBohPxUuaBcZFYtDzC2c0ckXA5KzUruD0daEdtXzkdJnL7s2zr6lA+bj015hr8G/UuJUH4ijmNn6qYgv0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2020 19:02:04.5419 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ffe2dd4-b3bc-45bd-57e2-08d7baee5e7b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3311
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

With the increased importance of machine learning, data science and
other cloud-based applications, GPUs are already in production use in
data centers today.  Existing GPU resource management is very coarse
grain, however, as sysadmins are only able to distribute workload on a
per-GPU basis.  An alternative is to use GPU virtualization (with or
without SRIOV) but it generally acts on the entire GPU instead of the
specific resources in a GPU.  With a drm cgroup controller, we can
enable alternate, fine-grain, sub-GPU resource management (in addition
to what may be available via GPU virtualization.)

Change-Id: Ia90aed8c4cb89ff20d8216a903a765655b44fc9a
Signed-off-by: Kenny Ho <Kenny.Ho@amd.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 18 ++++-
 Documentation/cgroup-v1/drm.rst         |  1 +
 include/linux/cgroup_drm.h              | 92 +++++++++++++++++++++++++
 include/linux/cgroup_subsys.h           |  4 ++
 init/Kconfig                            |  5 ++
 kernel/cgroup/Makefile                  |  1 +
 kernel/cgroup/drm.c                     | 42 +++++++++++
 7 files changed, 161 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/cgroup-v1/drm.rst
 create mode 100644 include/linux/cgroup_drm.h
 create mode 100644 kernel/cgroup/drm.c

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 0636bcb60b5a..7deff912185e 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -61,8 +61,10 @@ v1 is available under Documentation/admin-guide/cgroup-v1/.
      5-6. Device
      5-7. RDMA
        5-7-1. RDMA Interface Files
-     5-8. Misc
-       5-8-1. perf_event
+     5-8. GPU
+       5-8-1. GPU Interface Files
+     5-9. Misc
+       5-9-1. perf_event
      5-N. Non-normative information
        5-N-1. CPU controller root cgroup process behaviour
        5-N-2. IO controller root cgroup process behaviour
@@ -2057,6 +2059,18 @@ RDMA Interface Files
 	  ocrdma1 hca_handle=1 hca_object=23
 
 
+GPU
+---
+
+The "gpu" controller regulates the distribution and accounting of
+of GPU-related resources.
+
+GPU Interface Files
+~~~~~~~~~~~~~~~~~~~~
+
+TODO
+
+
 Misc
 ----
 
diff --git a/Documentation/cgroup-v1/drm.rst b/Documentation/cgroup-v1/drm.rst
new file mode 100644
index 000000000000..5f5658e1f5ed
--- /dev/null
+++ b/Documentation/cgroup-v1/drm.rst
@@ -0,0 +1 @@
+Please see ../cgroup-v2.rst for details
diff --git a/include/linux/cgroup_drm.h b/include/linux/cgroup_drm.h
new file mode 100644
index 000000000000..345af54a5d41
--- /dev/null
+++ b/include/linux/cgroup_drm.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2019 Advanced Micro Devices, Inc.
+ */
+#ifndef _CGROUP_DRM_H
+#define _CGROUP_DRM_H
+
+#include <linux/cgroup.h>
+
+#ifdef CONFIG_CGROUP_DRM
+
+/**
+ * The DRM cgroup controller data structure.
+ */
+struct drmcg {
+	struct cgroup_subsys_state	css;
+};
+
+/**
+ * css_to_drmcg - get the corresponding drmcg ref from a cgroup_subsys_state
+ * @css: the target cgroup_subsys_state
+ *
+ * Return: DRM cgroup that contains the @css
+ */
+static inline struct drmcg *css_to_drmcg(struct cgroup_subsys_state *css)
+{
+	return css ? container_of(css, struct drmcg, css) : NULL;
+}
+
+/**
+ * drmcg_get - get the drmcg reference that a task belongs to
+ * @task: the target task
+ *
+ * This increase the reference count of the css that the @task belongs to
+ *
+ * Return: reference to the DRM cgroup the task belongs to
+ */
+static inline struct drmcg *drmcg_get(struct task_struct *task)
+{
+	return css_to_drmcg(task_get_css(task, gpu_cgrp_id));
+}
+
+/**
+ * drmcg_put - put a drmcg reference
+ * @drmcg: the target drmcg
+ *
+ * Put a reference obtained via drmcg_get
+ */
+static inline void drmcg_put(struct drmcg *drmcg)
+{
+	if (drmcg)
+		css_put(&drmcg->css);
+}
+
+/**
+ * drmcg_parent - find the parent of a drm cgroup
+ * @cg: the target drmcg
+ *
+ * This does not increase the reference count of the parent cgroup
+ *
+ * Return: parent DRM cgroup of @cg
+ */
+static inline struct drmcg *drmcg_parent(struct drmcg *cg)
+{
+	return css_to_drmcg(cg->css.parent);
+}
+
+#else /* CONFIG_CGROUP_DRM */
+
+struct drmcg {
+};
+
+static inline struct drmcg *css_to_drmcg(struct cgroup_subsys_state *css)
+{
+	return NULL;
+}
+
+static inline struct drmcg *drmcg_get(struct task_struct *task)
+{
+	return NULL;
+}
+
+static inline void drmcg_put(struct drmcg *drmcg)
+{
+}
+
+static inline struct drmcg *drmcg_parent(struct drmcg *cg)
+{
+	return NULL;
+}
+
+#endif	/* CONFIG_CGROUP_DRM */
+#endif	/* _CGROUP_DRM_H */
diff --git a/include/linux/cgroup_subsys.h b/include/linux/cgroup_subsys.h
index acb77dcff3b4..f4e627942115 100644
--- a/include/linux/cgroup_subsys.h
+++ b/include/linux/cgroup_subsys.h
@@ -61,6 +61,10 @@ SUBSYS(pids)
 SUBSYS(rdma)
 #endif
 
+#if IS_ENABLED(CONFIG_CGROUP_DRM)
+SUBSYS(gpu)
+#endif
+
 /*
  * The following subsystems are not supported on the default hierarchy.
  */
diff --git a/init/Kconfig b/init/Kconfig
index a34064a031a5..bb78dff44d9d 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -965,6 +965,11 @@ config CGROUP_RDMA
 	  Attaching processes with active RDMA resources to the cgroup
 	  hierarchy is allowed even if can cross the hierarchy's limit.
 
+config CGROUP_DRM
+	bool "DRM controller (EXPERIMENTAL)"
+	help
+	  Provides accounting and enforcement of resources in the DRM subsystem.
+
 config CGROUP_FREEZER
 	bool "Freezer controller"
 	help
diff --git a/kernel/cgroup/Makefile b/kernel/cgroup/Makefile
index 5d7a76bfbbb7..31f186f58121 100644
--- a/kernel/cgroup/Makefile
+++ b/kernel/cgroup/Makefile
@@ -4,5 +4,6 @@ obj-y := cgroup.o rstat.o namespace.o cgroup-v1.o freezer.o
 obj-$(CONFIG_CGROUP_FREEZER) += legacy_freezer.o
 obj-$(CONFIG_CGROUP_PIDS) += pids.o
 obj-$(CONFIG_CGROUP_RDMA) += rdma.o
+obj-$(CONFIG_CGROUP_DRM) += drm.o
 obj-$(CONFIG_CPUSETS) += cpuset.o
 obj-$(CONFIG_CGROUP_DEBUG) += debug.o
diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
new file mode 100644
index 000000000000..5e38a8230922
--- /dev/null
+++ b/kernel/cgroup/drm.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: MIT
+// Copyright 2019 Advanced Micro Devices, Inc.
+#include <linux/slab.h>
+#include <linux/cgroup.h>
+#include <linux/cgroup_drm.h>
+
+static struct drmcg *root_drmcg __read_mostly;
+
+static void drmcg_css_free(struct cgroup_subsys_state *css)
+{
+	struct drmcg *drmcg = css_to_drmcg(css);
+
+	kfree(drmcg);
+}
+
+static struct cgroup_subsys_state *
+drmcg_css_alloc(struct cgroup_subsys_state *parent_css)
+{
+	struct drmcg *parent = css_to_drmcg(parent_css);
+	struct drmcg *drmcg;
+
+	drmcg = kzalloc(sizeof(struct drmcg), GFP_KERNEL);
+	if (!drmcg)
+		return ERR_PTR(-ENOMEM);
+
+	if (!parent)
+		root_drmcg = drmcg;
+
+	return &drmcg->css;
+}
+
+struct cftype files[] = {
+	{ }	/* terminate */
+};
+
+struct cgroup_subsys gpu_cgrp_subsys = {
+	.css_alloc	= drmcg_css_alloc,
+	.css_free	= drmcg_css_free,
+	.early_init	= false,
+	.legacy_cftypes	= files,
+	.dfl_cftypes	= files,
+};
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
