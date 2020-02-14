Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E29AF15DD09
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 16:57:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A06F6F9E8;
	Fri, 14 Feb 2020 15:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680058.outbound.protection.outlook.com [40.107.68.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7176F9E6;
 Fri, 14 Feb 2020 15:57:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6B86umGFIGimbvRam7c9HTA22+ad0bbwk7/UrQxe1E5sdaV5upRfrQWDKyq3a3ELqHHUGrA6vy6L1X0mphzG1X5AdDGBvIML8ZEjnEB26N6En9Fb2wOFdIJdyMgeQx9PiIuLJe7lZ54vXTNamIdaSdiG92uoaevPURI577OCWvbzz1VnmYk/ntZakTSHrkIECGmCs4juVtVTjFtAC7fsu/RfRJnrXTDFjMOj6zpa7N4BLAt3MgzuFqbXyF0CfnnWBtmrLHQJLc+RpdmdXNFylK7GLtnmCrxLYlADFUwmPKLNocmakIC2TaHZF/NVWJwWDtlwrzB9x7JmHgJC1hYcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IE8lLucDYfCrdS9utv/BkKHREyx2rBrFyW9gbmx+UyI=;
 b=PTW0h5KMffo8FiLxLhkiJkGPCjxdQVI1xylN3nkYfITf09JgmNpwhO6zSzhZpggYwx93ypEnIbDLdXiJcq5Jvqa8akL6/7LlQLb7Tl+JhS3OX/h8y7K6Asm/1soBD8ifOL+CR/L9KDz/wDqowuRXFb2q4/9uvuaOtNAMcpf1fJLJk0A+hUessLNmCXV1T36h8sLc4L9BcWmKMP7rIvKTDHLXlZnsUVsL9RlLBA/wUYUzqkRc91WiAyKaHfeO6SO1MBB/uLl6stu0+awPMujZdyw+f7HlHeKDPQJ3fcu8SfNWv7RX4LzjEeOJisT74ouPgfjWTDg7bNdrCOfkRlAJwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IE8lLucDYfCrdS9utv/BkKHREyx2rBrFyW9gbmx+UyI=;
 b=EB1T3tPfKYaLCKOYfeK0VTXNJx+lzUCXoJVwUOVPrpbG7K6oUN0eaXUYGqd642r0Eht8eof6ozsl+BuU8X8wbllSuc2CMWaSPVi0XUPfRqI03j0wC1Kx7yQa5mCzKT8JWuLU/psjojDoNivFBa7x+CQ3ZAF6JXzJOXzUjgei2DE=
Received: from SN1PR12CA0078.namprd12.prod.outlook.com (2603:10b6:802:20::49)
 by MW2PR12MB2428.namprd12.prod.outlook.com (2603:10b6:907:6::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.23; Fri, 14 Feb
 2020 15:57:08 +0000
Received: from BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::208) by SN1PR12CA0078.outlook.office365.com
 (2603:10b6:802:20::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend
 Transport; Fri, 14 Feb 2020 15:57:08 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT029.mail.protection.outlook.com (10.13.177.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2729.22 via Frontend Transport; Fri, 14 Feb 2020 15:57:08 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 14 Feb
 2020 09:57:08 -0600
Received: from yuho-zbook.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 14 Feb 2020 09:57:07 -0600
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>,
 <lkaplan@cray.com>, <daniel@ffwll.ch>, <nirmoy.das@amd.com>,
 <damon.mcdougall@amd.com>, <juan.zuniga-anaya@amd.com>
Subject: [PATCH 01/11] cgroup: Introduce cgroup for drm subsystem
Date: Fri, 14 Feb 2020 10:56:40 -0500
Message-ID: <20200214155650.21203-2-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200214155650.21203-1-Kenny.Ho@amd.com>
References: <20200214155650.21203-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(396003)(346002)(428003)(189003)(199004)(186003)(86362001)(5660300002)(7696005)(26005)(8936002)(2616005)(81156014)(110136005)(426003)(356004)(6666004)(8676002)(81166006)(4326008)(36756003)(70586007)(316002)(70206006)(478600001)(336012)(6636002)(1076003)(2906002)(921003)(83996005)(2101003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR12MB2428; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c56c5ed-2b38-4082-1b3e-08d7b1668bca
X-MS-TrafficTypeDiagnostic: MW2PR12MB2428:
X-Microsoft-Antispam-PRVS: <MW2PR12MB2428E4A1FC3EB89BF95CED0C83150@MW2PR12MB2428.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 03137AC81E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 687Vh3NMemC7b1hvhqCp6VqKTORvVH9bwj2sIUvrHdZe8R52BwqJH7GfNrRQ/px6l5md7FK01HzRLpls81kKpImwNDRTEnYcloNbRrZD5XzXXBANEVTicsvc1jWx+sxinzo6L5Rlmhr29sDxEbYQqabr6c4pdAHalskMs0dr1ckBcJ4KreZw+1fhm/9tOPX2uVI0mfclHGhL3LtIRDwj+OCjsUFAihiOo9ZApHtc63PxrYXU44ZIefg1mRVUjS7DORNo6XM/z0ieEHk0gxHAs+iR26BXBS6CX4ebxT9XR7/re0H5hf+nACXmTzVxlPu7FvYuPveT4OI3uQ2rkcs+Xpn1Z2ZMz/O361Lr6/FNmN1krucB/+QJ1ddcxPWzVAH+hO9jyLN4EBITcPHmdUZ8bwZ3lHuZYx9jS05ZqKj5K0/PuXmceR4eEJEpo76KsMbkJ3u9YJ3JZ5dfAtJovdDgWqZq2UqIKWJ9pP6yQgSViPc7DdhKyo7FzkEldBB1DDTsZJAEliL2IBvjNrv+yugLKuniIa5911k//m+BuJ/gnFY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 15:57:08.5843 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c56c5ed-2b38-4082-1b3e-08d7b1668bca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2428
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
index 5361ebec3361..384db8df0f30 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -61,8 +61,10 @@ v1 is available under Documentation/admin-guide/cgroup-v1/.
      5-6. Device
      5-7. RDMA
        5-7-1. RDMA Interface Files
-     5-8. Misc
-       5-8-1. perf_event
+     5-8. DRM
+       5-8-1. DRM Interface Files
+     5-9. Misc
+       5-9-1. perf_event
      5-N. Non-normative information
        5-N-1. CPU controller root cgroup process behaviour
        5-N-2. IO controller root cgroup process behaviour
@@ -2051,6 +2053,18 @@ RDMA Interface Files
 	  ocrdma1 hca_handle=1 hca_object=23
 
 
+DRM
+---
+
+The "drm" controller regulates the distribution and accounting of
+of DRM (Direct Rendering Manager) and GPU-related resources.
+
+DRM Interface Files
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
index 000000000000..ba7981ac3afc
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
+	return css_to_drmcg(task_get_css(task, drm_cgrp_id));
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
index acb77dcff3b4..ddedad809e8b 100644
--- a/include/linux/cgroup_subsys.h
+++ b/include/linux/cgroup_subsys.h
@@ -61,6 +61,10 @@ SUBSYS(pids)
 SUBSYS(rdma)
 #endif
 
+#if IS_ENABLED(CONFIG_CGROUP_DRM)
+SUBSYS(drm)
+#endif
+
 /*
  * The following subsystems are not supported on the default hierarchy.
  */
diff --git a/init/Kconfig b/init/Kconfig
index b4daad2bac23..8ea6bcfbe5e9 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -981,6 +981,11 @@ config CGROUP_RDMA
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
index 000000000000..e97861b3cb30
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
+struct cgroup_subsys drm_cgrp_subsys = {
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
