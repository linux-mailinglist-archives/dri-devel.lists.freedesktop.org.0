Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC1D170853
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 20:02:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEAB6EBCB;
	Wed, 26 Feb 2020 19:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750071.outbound.protection.outlook.com [40.107.75.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB7B6EBAE;
 Wed, 26 Feb 2020 19:02:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BjHQGUY2EhWuiTjV+jcp+w38PRGKXBJ6CFPZKv/XdQowJew8fcInCqv9YShfYmXoIirDYfonnnHgEm3BqMAtDFSZl53VVg8lYVtgFAxhA+vq16RQ2GSs2xCVtXsKkNoOS3MFZ01h6YZxzWoFzVmTyKj+vtVxPE1KlXmGhYaatLbNiwzsm2UN3I/ILem55uUrAekPOyEdvUYt9/GZ4iybqHjM92x3C56jvdkmnndb98qOM+OG4cb8jD3sIchUmtEWqIQhyx74aO9AJXr1+eLVfB67qkwyCGZTU3mCQSsjVxSirGxIwm/TDoCDMkOhh47snwMppBDnwtrCOwxO5C7/ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtbIUCcTEiB8r0n5RAMV9tMcF6GnAvzY3cASx+IKURY=;
 b=emLkzoYWlH+fLlWzFez2/pBG1Fv/xf3vPmTrlwBFWBYEp8jzoMTMKwAiSNx03ZL+peDg3T3Q+41Un0ay7cPCc+eeJkoFocqu7wpUTcRs3Qkk62c+q1hL0XA8qyxNaJBH7UIH0IwCqk8AsHjswNqQHygsVM+lotzR7/Ly5oMWp6H2MTun/tKsnkQ0qeME+IK4nvxtxwCgfBVXqGME06Qe8wyurHuSe5TUuhYWt/rF1pdZdx8DUiPbauJh3g0pWuiWH/ptXWRj5o1oaFLZXLLqo8A7KBesSIHvyyiCCJCxHsDSg5ao0NiH7p/uPZ5kZDZWdh9yNjfjwSt5u0EzWpW9ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtbIUCcTEiB8r0n5RAMV9tMcF6GnAvzY3cASx+IKURY=;
 b=y7I620llbdPyqeDCZVflQsR5Az+01WIJSNOa2yO4Ma9KoomvHIwlUQ/p/An1Wf2zT1muXlsvvv8cHcxkN5qD/orj5l5cU2ozNPIH3P2pOBKdH0rUG0KaY0dXzJm5sReTXfGYaQnc/ra4xN7ozusuUovf8p2+PIr+zkcsDzVVnVU=
Received: from DM5PR04CA0057.namprd04.prod.outlook.com (2603:10b6:3:ef::19) by
 BY5PR12MB3713.namprd12.prod.outlook.com (2603:10b6:a03:1a6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.22; Wed, 26 Feb
 2020 19:02:09 +0000
Received: from DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ef:cafe::9e) by DM5PR04CA0057.outlook.office365.com
 (2603:10b6:3:ef::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend
 Transport; Wed, 26 Feb 2020 19:02:09 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT017.mail.protection.outlook.com (10.13.172.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2772.14 via Frontend Transport; Wed, 26 Feb 2020 19:02:08 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 26 Feb
 2020 13:02:08 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 26 Feb
 2020 13:02:07 -0600
Received: from yuho-zbook.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 26 Feb 2020 13:02:07 -0600
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>
Subject: [PATCH v2 07/11] drm, cgroup: Add total GEM buffer allocation limit
Date: Wed, 26 Feb 2020 14:01:48 -0500
Message-ID: <20200226190152.16131-8-Kenny.Ho@amd.com>
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
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(346002)(396003)(428003)(189003)(199004)(2906002)(70206006)(7696005)(316002)(36756003)(356004)(8676002)(70586007)(110136005)(81166006)(81156014)(6666004)(8936002)(4326008)(478600001)(1076003)(86362001)(30864003)(336012)(2616005)(426003)(26005)(186003)(5660300002)(921003)(83996005)(2101003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB3713; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb9f5da8-6077-4a61-8670-08d7baee610c
X-MS-TrafficTypeDiagnostic: BY5PR12MB3713:
X-Microsoft-Antispam-PRVS: <BY5PR12MB371341E95CEB823E8101070883EA0@BY5PR12MB3713.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 0325F6C77B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CGezJMHQr/QbUaHhW9VOOG9/Tyvg26/AZBo0LeWjk5HOTWnrKNhQrYcqH11v6qqFmTD/MxwAPu0vFQhXNDBvhwIdPsRq+UEPKtVaT3pSylMJh5T2q+TWu41rJn8fTWGeDrvG5ydrRLXQ5CAIt9fR8X4Do1CgcnNJHClEPT1xWrTRSy3K30OHBHwZdA1MaF0YO6EFG8Rjgi3F2d21h6EqqjSldsf50qkqgm1/hDTmxjGgFvkny8s1TjE9NOi/3tvznl0oQPsCXebUEsr36DvV4TzDd2OH/Ax4RuMyaIc7zc3XJ1u0Uj+NE05m0luMqw69pALiQQomNHEvm5rjq8vM4+PTkoOcvMJ63QH7EYj58j+kpd9bhQLvUyn/JUZSx/3Kwp23GdzkPqC/Gd/+tAs+npr1FC4fDVE2wpwTrDoHK92yIDL+BM4X+W6sFqNN9TYJ3RpaaNE3GQ/CcMdPrh3M67ejtmmbGNQFFQ7Gjy2OnfvmLJdUCYV2niFWfB143rmoZzEf1HWJ2mhA7+7AN8JCA5XBv2kk+oFmx0JYnG+hp5g=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2020 19:02:08.8438 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9f5da8-6077-4a61-8670-08d7baee610c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3713
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

The drm resource being limited here is the GEM buffer objects.  User
applications allocate and free these buffers.  In addition, a process
can allocate a buffer and share it with another process.  The consumer
of a shared buffer can also outlive the allocator of the buffer.

For the purpose of cgroup accounting and limiting, ownership of the
buffer is deemed to be the cgroup for which the allocating process
belongs to.  There is one cgroup limit per drm device.

The limiting functionality is added to the previous stats collection
function.  The drm_gem_private_object_init is modified to have a return
value to allow failure due to cgroup limit.

The try_chg function only fails if the DRM cgroup properties has
limit_enforced set to true for the DRM device.  This is to allow the DRM
cgroup controller to collect usage stats without enforcing the limits.

gpu.buffer.default
        A read-only flat-keyed file which exists on the root cgroup.
        Each entry is keyed by the drm device's major:minor.

        Default limits on the total GEM buffer allocation in bytes.

gpu.buffer.max
        A read-write flat-keyed file which exists on all cgroups.  Each
        entry is keyed by the drm device's major:minor.

        Per device limits on the total GEM buffer allocation in byte.
        This is a hard limit.  Attempts in allocating beyond the cgroup
        limit will result in ENOMEM.  Shorthand understood by memparse
        (such as k, m, g) can be used.

        Set allocation limit for /dev/dri/card1 to 1GB
        echo "226:1 1g" > gpu.buffer.total.max

        Set allocation limit for /dev/dri/card0 to 512MB
        echo "226:0 512m" > gpu.buffer.total.max

Change-Id: Id3265bbd0fafe84a16b59617df79bd32196160be
Signed-off-by: Kenny Ho <Kenny.Ho@amd.com>
---
 Documentation/admin-guide/cgroup-v2.rst    |  21 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  19 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |   6 +-
 drivers/gpu/drm/drm_gem.c                  |  11 +-
 include/drm/drm_cgroup.h                   |   8 +-
 include/drm/drm_gem.h                      |   2 +-
 include/linux/cgroup_drm.h                 |   1 +
 kernel/cgroup/drm.c                        | 227 ++++++++++++++++++++-
 8 files changed, 278 insertions(+), 17 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 065f2b52da57..f2d7abf5c783 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2087,6 +2087,27 @@ GPU Interface Files
 
 	Total number of GEM buffer allocated.
 
+  gpu.buffer.default
+	A read-only flat-keyed file which exists on the root cgroup.
+	Each entry is keyed by the drm device's major:minor.
+
+	Default limits on the total GEM buffer allocation in bytes.
+
+  gpu.buffer.max
+	A read-write flat-keyed file which exists on all cgroups.  Each
+	entry is keyed by the drm device's major:minor.
+
+	Per device limits on the total GEM buffer allocation in byte.
+	This is a hard limit.  Attempts in allocating beyond the cgroup
+	limit will result in ENOMEM.  Shorthand understood by memparse
+	(such as k, m, g) can be used.
+
+	Set allocation limit for /dev/dri/card1 to 1GB
+	echo "226:1 1g" > gpu.buffer.total.max
+
+	Set allocation limit for /dev/dri/card0 to 512MB
+	echo "226:0 512m" > gpu.buffer.total.max
+
 GEM Buffer Ownership
 ~~~~~~~~~~~~~~~~~~~~
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 6e1faf8a2bca..171397708855 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1413,6 +1413,23 @@ amdgpu_get_crtc_scanout_position(struct drm_device *dev, unsigned int pipe,
 						  stime, etime, mode);
 }
 
+#ifdef CONFIG_CGROUP_DRM
+
+static void amdgpu_drmcg_custom_init(struct drm_device *dev,
+	struct drmcg_props *props)
+{
+	props->limit_enforced = true;
+}
+
+#else
+
+static void amdgpu_drmcg_custom_init(struct drm_device *dev,
+	struct drmcg_props *props)
+{
+}
+
+#endif /* CONFIG_CGROUP_DRM */
+
 static struct drm_driver kms_driver = {
 	.driver_features =
 	    DRIVER_USE_AGP | DRIVER_ATOMIC |
@@ -1444,6 +1461,8 @@ static struct drm_driver kms_driver = {
 	.gem_prime_vunmap = amdgpu_gem_prime_vunmap,
 	.gem_prime_mmap = amdgpu_gem_prime_mmap,
 
+	.drmcg_custom_init = amdgpu_drmcg_custom_init,
+
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
 	.date = DRIVER_DATE,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 5766d20f29d8..4d08ccbc541a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -34,6 +34,7 @@
 
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_cache.h>
+#include <drm/drm_cgroup.h>
 #include "amdgpu.h"
 #include "amdgpu_trace.h"
 #include "amdgpu_amdkfd.h"
@@ -551,7 +552,10 @@ static int amdgpu_bo_do_create(struct amdgpu_device *adev,
 	bo = kzalloc(sizeof(struct amdgpu_bo), GFP_KERNEL);
 	if (bo == NULL)
 		return -ENOMEM;
-	drm_gem_private_object_init(adev->ddev, &bo->tbo.base, size);
+	if (!drm_gem_private_object_init(adev->ddev, &bo->tbo.base, size)) {
+		kfree(bo);
+		return -ENOMEM;
+	}
 	INIT_LIST_HEAD(&bo->shadow_list);
 	bo->vm_bo = NULL;
 	bo->preferred_domains = bp->preferred_domain ? bp->preferred_domain :
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 589f8f6bde2c..30adf730da0f 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -150,11 +150,17 @@ EXPORT_SYMBOL(drm_gem_object_init);
  * no GEM provided backing store. Instead the caller is responsible for
  * backing the object and handling it.
  */
-void drm_gem_private_object_init(struct drm_device *dev,
+bool drm_gem_private_object_init(struct drm_device *dev,
 				 struct drm_gem_object *obj, size_t size)
 {
 	BUG_ON((size & (PAGE_SIZE - 1)) != 0);
 
+	obj->drmcg = drmcg_get(current);
+	if (!drmcg_try_chg_bo_alloc(obj->drmcg, dev, size)) {
+		drmcg_put(obj->drmcg);
+		obj->drmcg = NULL;
+		return false;
+	}
 	obj->dev = dev;
 	obj->filp = NULL;
 
@@ -167,8 +173,7 @@ void drm_gem_private_object_init(struct drm_device *dev,
 
 	drm_vma_node_reset(&obj->vma_node);
 
-	obj->drmcg = drmcg_get(current);
-	drmcg_chg_bo_alloc(obj->drmcg, dev, size);
+	return true;
 }
 EXPORT_SYMBOL(drm_gem_private_object_init);
 
diff --git a/include/drm/drm_cgroup.h b/include/drm/drm_cgroup.h
index 1eb3012e16a1..2783e56690db 100644
--- a/include/drm/drm_cgroup.h
+++ b/include/drm/drm_cgroup.h
@@ -13,6 +13,9 @@
  * of storing per device defaults
  */
 struct drmcg_props {
+	bool			limit_enforced;
+
+	s64			bo_limits_total_allocated_default;
 };
 
 void drmcg_bind(struct drm_minor (*(*acq_dm)(unsigned int minor_id)),
@@ -26,7 +29,7 @@ void drmcg_unregister_dev(struct drm_device *dev);
 
 void drmcg_device_early_init(struct drm_device *device);
 
-void drmcg_chg_bo_alloc(struct drmcg *drmcg, struct drm_device *dev,
+bool drmcg_try_chg_bo_alloc(struct drmcg *drmcg, struct drm_device *dev,
 		size_t size);
 
 void drmcg_unchg_bo_alloc(struct drmcg *drmcg, struct drm_device *dev,
@@ -59,9 +62,10 @@ static inline void drmcg_device_early_init(struct drm_device *device)
 {
 }
 
-static inline void drmcg_chg_bo_alloc(struct drmcg *drmcg,
+static inline bool drmcg_try_chg_bo_alloc(struct drmcg *drmcg,
 		struct drm_device *dev,	size_t size)
 {
+	return true;
 }
 
 static inline void drmcg_unchg_bo_alloc(struct drmcg *drmcg,
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 9c588c329da0..ef073a5e7d67 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -352,7 +352,7 @@ void drm_gem_object_release(struct drm_gem_object *obj);
 void drm_gem_object_free(struct kref *kref);
 int drm_gem_object_init(struct drm_device *dev,
 			struct drm_gem_object *obj, size_t size);
-void drm_gem_private_object_init(struct drm_device *dev,
+bool drm_gem_private_object_init(struct drm_device *dev,
 				 struct drm_gem_object *obj, size_t size);
 void drm_gem_vm_open(struct vm_area_struct *vma);
 void drm_gem_vm_close(struct vm_area_struct *vma);
diff --git a/include/linux/cgroup_drm.h b/include/linux/cgroup_drm.h
index 103868d972d0..71023654fb77 100644
--- a/include/linux/cgroup_drm.h
+++ b/include/linux/cgroup_drm.h
@@ -26,6 +26,7 @@ enum drmcg_res_type {
 struct drmcg_device_resource {
 	/* for per device stats */
 	s64			bo_stats_total_allocated;
+	s64			bo_limits_total_allocated;
 
 	s64			bo_stats_peak_allocated;
 
diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
index 5a700833a304..4b19e533941d 100644
--- a/kernel/cgroup/drm.c
+++ b/kernel/cgroup/drm.c
@@ -37,6 +37,8 @@ static void (*put_drm_dev)(struct drm_device *dev);
 
 enum drmcg_file_type {
 	DRMCG_FTYPE_STATS,
+	DRMCG_FTYPE_LIMIT,
+	DRMCG_FTYPE_DEFAULT,
 };
 
 /**
@@ -90,6 +92,8 @@ static inline int init_drmcg_single(struct drmcg *drmcg, struct drm_device *dev)
 	drmcg->dev_resources[minor] = ddr;
 
 	/* set defaults here */
+	ddr->bo_limits_total_allocated =
+		dev->drmcg_props.bo_limits_total_allocated_default;
 
 	return 0;
 }
@@ -289,6 +293,38 @@ static void drmcg_print_stats(struct drmcg_device_resource *ddr,
 	}
 }
 
+static void drmcg_print_limits(struct drmcg_device_resource *ddr,
+		struct seq_file *sf, enum drmcg_res_type type)
+{
+	if (ddr == NULL) {
+		seq_puts(sf, "\n");
+		return;
+	}
+
+	switch (type) {
+	case DRMCG_TYPE_BO_TOTAL:
+		seq_printf(sf, "%lld\n", ddr->bo_limits_total_allocated);
+		break;
+	default:
+		seq_puts(sf, "\n");
+		break;
+	}
+}
+
+static void drmcg_print_default(struct drmcg_props *props,
+		struct seq_file *sf, enum drmcg_res_type type)
+{
+	switch (type) {
+	case DRMCG_TYPE_BO_TOTAL:
+		seq_printf(sf, "%lld\n",
+			props->bo_limits_total_allocated_default);
+		break;
+	default:
+		seq_puts(sf, "\n");
+		break;
+	}
+}
+
 static int drmcg_seq_show_fn(int id, void *ptr, void *data)
 {
 	struct drm_minor *minor = ptr;
@@ -311,6 +347,12 @@ static int drmcg_seq_show_fn(int id, void *ptr, void *data)
 	case DRMCG_FTYPE_STATS:
 		drmcg_print_stats(ddr, sf, type);
 		break;
+	case DRMCG_FTYPE_LIMIT:
+		drmcg_print_limits(ddr, sf, type);
+		break;
+	case DRMCG_FTYPE_DEFAULT:
+		drmcg_print_default(&minor->dev->drmcg_props, sf, type);
+		break;
 	default:
 		seq_puts(sf, "\n");
 		break;
@@ -324,6 +366,130 @@ int drmcg_seq_show(struct seq_file *sf, void *v)
 	return drm_minor_for_each(&drmcg_seq_show_fn, sf);
 }
 
+static void drmcg_pr_cft_err(const struct drmcg *drmcg,
+		int rc, const char *cft_name, int minor)
+{
+	pr_err("drmcg: error parsing %s, minor %d, rc %d ",
+			cft_name, minor, rc);
+	pr_cont_cgroup_name(drmcg->css.cgroup);
+	pr_cont("\n");
+}
+
+static int drmcg_process_limit_s64_val(char *sval, bool is_mem,
+			s64 def_val, s64 max_val, s64 *ret_val)
+{
+	int rc = strcmp("max", sval);
+
+
+	if (!rc)
+		*ret_val = max_val;
+	else {
+		rc = strcmp("default", sval);
+
+		if (!rc)
+			*ret_val = def_val;
+	}
+
+	if (rc) {
+		if (is_mem) {
+			*ret_val = memparse(sval, NULL);
+			rc = 0;
+		} else {
+			rc = kstrtoll(sval, 0, ret_val);
+		}
+	}
+
+	if (*ret_val > max_val)
+		rc = -EINVAL;
+
+	return rc;
+}
+
+/**
+ * drmcg_limit_write - parse cgroup interface files to obtain user config
+ *
+ * Minimal value check to keep track of user intent.  For example, user
+ * can specify limits greater than the values allowed by the parents.
+ * This way, the user configuration is kept and comes into effect if and
+ * when parents' limits are relaxed.
+ */
+static ssize_t drmcg_limit_write(struct kernfs_open_file *of, char *buf,
+		size_t nbytes, loff_t off)
+{
+	struct drmcg *drmcg = css_to_drmcg(of_css(of));
+	enum drmcg_res_type type =
+		DRMCG_CTF_PRIV2RESTYPE(of_cft(of)->private);
+	char *cft_name = of_cft(of)->name;
+	char *limits = strstrip(buf);
+	struct drmcg_device_resource *ddr;
+	struct drmcg_props *props;
+	struct drm_minor *dm;
+	char *line;
+	char sattr[256];
+	s64 val;
+	int rc;
+	int minor;
+
+	while (limits != NULL) {
+		line =  strsep(&limits, "\n");
+
+		if (sscanf(line,
+			__stringify(DRM_MAJOR)":%u %255[^\t\n]",
+							&minor, sattr) != 2) {
+			pr_err("drmcg: error parsing %s ", cft_name);
+			pr_cont_cgroup_name(drmcg->css.cgroup);
+			pr_cont("\n");
+
+			continue;
+		}
+
+		mutex_lock(&drmcg_mutex);
+		if (acquire_drm_minor)
+			dm = acquire_drm_minor(minor);
+		else
+			dm = NULL;
+		mutex_unlock(&drmcg_mutex);
+
+		if (IS_ERR_OR_NULL(dm)) {
+			pr_err("drmcg: invalid minor %d for %s ",
+					minor, cft_name);
+			pr_cont_cgroup_name(drmcg->css.cgroup);
+			pr_cont("\n");
+
+			continue;
+		}
+
+		mutex_lock(&dm->dev->drmcg_mutex);
+		ddr = drmcg->dev_resources[minor];
+		props = &dm->dev->drmcg_props;
+		switch (type) {
+		case DRMCG_TYPE_BO_TOTAL:
+			rc = drmcg_process_limit_s64_val(sattr, true,
+				props->bo_limits_total_allocated_default,
+				S64_MAX,
+				&val);
+
+			if (rc || val < 0) {
+				drmcg_pr_cft_err(drmcg, rc, cft_name, minor);
+				break;
+			}
+
+			ddr->bo_limits_total_allocated = val;
+			break;
+		default:
+			break;
+		}
+		mutex_unlock(&dm->dev->drmcg_mutex);
+
+		mutex_lock(&drmcg_mutex);
+		if (put_drm_dev)
+			put_drm_dev(dm->dev); /* release from acquire */
+		mutex_unlock(&drmcg_mutex);
+	}
+
+	return nbytes;
+}
+
 struct cftype files[] = {
 	{
 		.name = "buffer.total.stats",
@@ -331,6 +497,20 @@ struct cftype files[] = {
 		.private = DRMCG_CTF_PRIV(DRMCG_TYPE_BO_TOTAL,
 						DRMCG_FTYPE_STATS),
 	},
+	{
+		.name = "buffer.total.default",
+		.seq_show = drmcg_seq_show,
+		.flags = CFTYPE_ONLY_ON_ROOT,
+		.private = DRMCG_CTF_PRIV(DRMCG_TYPE_BO_TOTAL,
+						DRMCG_FTYPE_DEFAULT),
+	},
+	{
+		.name = "buffer.total.max",
+		.write = drmcg_limit_write,
+		.seq_show = drmcg_seq_show,
+		.private = DRMCG_CTF_PRIV(DRMCG_TYPE_BO_TOTAL,
+						DRMCG_FTYPE_LIMIT),
+	},
 	{
 		.name = "buffer.peak.stats",
 		.seq_show = drmcg_seq_show,
@@ -363,12 +543,16 @@ struct cgroup_subsys gpu_cgrp_subsys = {
  */
 void drmcg_device_early_init(struct drm_device *dev)
 {
+	dev->drmcg_props.limit_enforced = false;
+
+	dev->drmcg_props.bo_limits_total_allocated_default = S64_MAX;
+
 	drmcg_update_cg_tree(dev);
 }
 EXPORT_SYMBOL(drmcg_device_early_init);
 
 /**
- * drmcg_chg_bo_alloc - charge GEM buffer usage for a device and cgroup
+ * drmcg_try_chg_bo_alloc - charge GEM buffer usage for a device and cgroup
  * @drmcg: the DRM cgroup to be charged to
  * @dev: the device the usage should be charged to
  * @size: size of the GEM buffer to be accounted for
@@ -377,29 +561,52 @@ EXPORT_SYMBOL(drmcg_device_early_init);
  * for the utilization.  This should not be called when the buffer is shared (
  * the GEM buffer's reference count being incremented.)
  */
-void drmcg_chg_bo_alloc(struct drmcg *drmcg, struct drm_device *dev,
+bool drmcg_try_chg_bo_alloc(struct drmcg *drmcg, struct drm_device *dev,
 		size_t size)
 {
 	struct drmcg_device_resource *ddr;
 	int devIdx = dev->primary->index;
+	struct drmcg_props *props = &dev->drmcg_props;
+	struct drmcg *drmcg_cur = drmcg;
+	bool result = true;
+	s64 delta = 0;
 
 	if (drmcg == NULL)
-		return;
+		return true;
 
 	mutex_lock(&dev->drmcg_mutex);
-	for ( ; drmcg != NULL; drmcg = drmcg_parent(drmcg)) {
-		ddr = drmcg->dev_resources[devIdx];
+	if (props->limit_enforced) {
+		for ( ; drmcg != NULL; drmcg = drmcg_parent(drmcg)) {
+			ddr = drmcg->dev_resources[devIdx];
+			delta = ddr->bo_limits_total_allocated -
+					ddr->bo_stats_total_allocated;
+
+			if (delta <= 0 || size > delta) {
+				result = false;
+				break;
+			}
+		}
+	}
+
+	drmcg = drmcg_cur;
+
+	if (result || !props->limit_enforced) {
+		for ( ; drmcg != NULL; drmcg = drmcg_parent(drmcg)) {
+			ddr = drmcg->dev_resources[devIdx];
 
-		ddr->bo_stats_total_allocated += (s64)size;
+			ddr->bo_stats_total_allocated += (s64)size;
 
-		if (ddr->bo_stats_peak_allocated < (s64)size)
-			ddr->bo_stats_peak_allocated = (s64)size;
+			if (ddr->bo_stats_peak_allocated < (s64)size)
+				ddr->bo_stats_peak_allocated = (s64)size;
 
-		ddr->bo_stats_count_allocated++;
+			ddr->bo_stats_count_allocated++;
+		}
 	}
 	mutex_unlock(&dev->drmcg_mutex);
+
+	return result;
 }
-EXPORT_SYMBOL(drmcg_chg_bo_alloc);
+EXPORT_SYMBOL(drmcg_try_chg_bo_alloc);
 
 /**
  * drmcg_unchg_bo_alloc -
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
