Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D8915DD16
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 16:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C36C6F9F2;
	Fri, 14 Feb 2020 15:57:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B283A6F9F2;
 Fri, 14 Feb 2020 15:57:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HzqPuDhGE+lAyiiKEexfpIiqNI0u9Q1b2AMLw4+JtdT66raLbN2Bbg/ZIFLGKs/d8E6uezPyygBPNlS6fJSP367s4GsTnRLIK7UjbP5VcMf3VrW8jlYxASaaEZELcEcNd8S8HuNQJMuO6MjFo2RICbUOljsJs4TDeNaz3b6MsG3aARJ3L2tIVuBreMSuhRlnSPQuMwKRHf1Q+tfNQtrE6DQc39fHSCbyPs773naBIH+pqGe9DLp0LF1PXpjFoGuVGTTbOL/Mv9rlF6SlZSORDAfZb1JoRv17b4f0Y1NuYMC2NP5+vUf8xEqlQzIYStSrHLAhE/9ax9XyI+pvVoXDsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nE+NdonnuiVF4c6wxyhLbj83GLvODHYdGsIm5dEwkuI=;
 b=nGtseDWPIXQB8yBCivNbx8GY0RNneDKjyHIDNja7/ArfanHOsdPg4IFh+c4xwikJA0MOnOe/lCDJGkxmQoJG2axAaePWJR7qjmyEZKuoY38xZmZwZPFyV4/CAmLA+MrVbdHJ0k5Glx0NXuJaWIPLowssn0RE2KoBZkfF1PJcBZSe1WXAKpC609gNGREhxp6kHOQ+DOqbHFNn/HxbvUqkiKWJ84pwgJ+9m7XwjT9Xc+TMdScgvnh7n+GOKMcA22XbW/yXX62kxkdaxqJL2opqO1gjC8/8EbsylBvqnwfiWSV1TAOm60wQnL2O5Yk2y+amu+aYg9Bn1VNF40Eb99hkrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nE+NdonnuiVF4c6wxyhLbj83GLvODHYdGsIm5dEwkuI=;
 b=1FBWZJEhqFZCpmkPnCBXH2j2roBNkfrqzt0uZM3ousA7cuRla0gWQa7Qhjf2JAgyW1jGD1+78DAGALOpFg3LkLQBx/stRX+ZR6QAkQKpytRzS9/v/4dtZMN8FrlqBA35aH8LhmW1Jii9ve9BBLzhvraZkktdHi+xOT/DErfL8V4=
Received: from SN1PR12CA0078.namprd12.prod.outlook.com (2603:10b6:802:20::49)
 by DM6PR12MB2761.namprd12.prod.outlook.com (2603:10b6:5:41::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.23; Fri, 14 Feb
 2020 15:57:16 +0000
Received: from BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::208) by SN1PR12CA0078.outlook.office365.com
 (2603:10b6:802:20::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend
 Transport; Fri, 14 Feb 2020 15:57:16 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT029.mail.protection.outlook.com (10.13.177.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2729.22 via Frontend Transport; Fri, 14 Feb 2020 15:57:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 14 Feb
 2020 09:57:14 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 14 Feb
 2020 09:57:14 -0600
Received: from yuho-zbook.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 14 Feb 2020 09:57:13 -0600
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>,
 <lkaplan@cray.com>, <daniel@ffwll.ch>, <nirmoy.das@amd.com>,
 <damon.mcdougall@amd.com>, <juan.zuniga-anaya@amd.com>
Subject: [PATCH 07/11] drm, cgroup: Add total GEM buffer allocation limit
Date: Fri, 14 Feb 2020 10:56:46 -0500
Message-ID: <20200214155650.21203-8-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200214155650.21203-1-Kenny.Ho@amd.com>
References: <20200214155650.21203-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(396003)(376002)(428003)(199004)(189003)(6666004)(356004)(70206006)(86362001)(110136005)(316002)(81156014)(1076003)(8676002)(6636002)(8936002)(336012)(30864003)(81166006)(70586007)(4326008)(26005)(5660300002)(478600001)(36756003)(2906002)(2616005)(186003)(426003)(7696005)(921003)(2101003)(83996005)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2761; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68551b83-9e56-416b-3433-08d7b1669058
X-MS-TrafficTypeDiagnostic: DM6PR12MB2761:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2761280128F5AB344699927F83150@DM6PR12MB2761.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 03137AC81E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Blx27xS6Xjjg4hX0D9gQeHiwpfHKZM+zE2PgDWr22iaGr8cxnw8IE5KA5TMYaCgyiQv9+wQkecWLPxkiTTLF7tN3AZrTjqH2GM+UeSrOMsF9MV5N/kC0RIL2vhoQC0wjiBgPPbo1jtfu0XrscX4sWBdtZRrljAMrdrwyQs2dblXthLSiSBeC0myVCb6okv+JhVy1rgQ6PRkhM2bSP5mKr6qIGfqHjp1bL0NPL0hffEhATgsVzBUYbYvykMBE00xlKqP+F8mqm5DlwGU9xhmPL1UZdEWC7NxYJZcnsaKfPmGQKClh4r9+p99O5/5X3oUFtvk+ts+ji1+Wvb/36KOPJ903GHLqVjoyvyt6z54uBIo9OlOnRxw4kag/ag6Kwx48BFe6TEmAXRg4v9pDDaahUUrIC3+UASM4YUxi2991K+PgsZ7lK/b97ERA5xOla7tDP2XsjGaNambGqcFtH/XEu/9EjVH+wFDX1XHkvhnRRUjreC7q4Db6Eq2P7MIZTezD73b76/F3FbG9YwLTjlTs4OyRcIeYIIZ6RBpcw3IQitY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 15:57:16.2264 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68551b83-9e56-416b-3433-08d7b1669058
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

drm.buffer.default
        A read-only flat-keyed file which exists on the root cgroup.
        Each entry is keyed by the drm device's major:minor.

        Default limits on the total GEM buffer allocation in bytes.

drm.buffer.max
        A read-write flat-keyed file which exists on all cgroups.  Each
        entry is keyed by the drm device's major:minor.

        Per device limits on the total GEM buffer allocation in byte.
        This is a hard limit.  Attempts in allocating beyond the cgroup
        limit will result in ENOMEM.  Shorthand understood by memparse
        (such as k, m, g) can be used.

        Set allocation limit for /dev/dri/card1 to 1GB
        echo "226:1 1g" > drm.buffer.total.max

        Set allocation limit for /dev/dri/card0 to 512MB
        echo "226:0 512m" > drm.buffer.total.max

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
index 19fcf54ace83..064172df63e2 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2081,6 +2081,27 @@ DRM Interface Files
 
 	Total number of GEM buffer allocated.
 
+  drm.buffer.default
+	A read-only flat-keyed file which exists on the root cgroup.
+	Each entry is keyed by the drm device's major:minor.
+
+	Default limits on the total GEM buffer allocation in bytes.
+
+  drm.buffer.max
+	A read-write flat-keyed file which exists on all cgroups.  Each
+	entry is keyed by the drm device's major:minor.
+
+	Per device limits on the total GEM buffer allocation in byte.
+	This is a hard limit.  Attempts in allocating beyond the cgroup
+	limit will result in ENOMEM.  Shorthand understood by memparse
+	(such as k, m, g) can be used.
+
+	Set allocation limit for /dev/dri/card1 to 1GB
+	echo "226:1 1g" > drm.buffer.total.max
+
+	Set allocation limit for /dev/dri/card0 to 512MB
+	echo "226:0 512m" > drm.buffer.total.max
+
 GEM Buffer Ownership
 ~~~~~~~~~~~~~~~~~~~~
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index f28d040de3ce..3ebef1d62346 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1397,6 +1397,23 @@ amdgpu_get_crtc_scanout_position(struct drm_device *dev, unsigned int pipe,
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
@@ -1430,6 +1447,8 @@ static struct drm_driver kms_driver = {
 	.gem_prime_vunmap = amdgpu_gem_prime_vunmap,
 	.gem_prime_mmap = amdgpu_gem_prime_mmap,
 
+	.drmcg_custom_init = amdgpu_drmcg_custom_init,
+
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
 	.date = DRIVER_DATE,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 46c76e2e1281..b81c608cb2cc 100644
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
index d158470edd98..06e7576f1758 100644
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
index 6ac7018923f7..5748845c45eb 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -354,7 +354,7 @@ void drm_gem_object_release(struct drm_gem_object *obj);
 void drm_gem_object_free(struct kref *kref);
 int drm_gem_object_init(struct drm_device *dev,
 			struct drm_gem_object *obj, size_t size);
-void drm_gem_private_object_init(struct drm_device *dev,
+bool drm_gem_private_object_init(struct drm_device *dev,
 				 struct drm_gem_object *obj, size_t size);
 void drm_gem_vm_open(struct vm_area_struct *vma);
 void drm_gem_vm_close(struct vm_area_struct *vma);
diff --git a/include/linux/cgroup_drm.h b/include/linux/cgroup_drm.h
index 51a0cd37da92..b03d90623763 100644
--- a/include/linux/cgroup_drm.h
+++ b/include/linux/cgroup_drm.h
@@ -26,6 +26,7 @@ enum drmcg_res_type {
 struct drmcg_device_resource {
 	/* for per device stats */
 	s64			bo_stats_total_allocated;
+	s64			bo_limits_total_allocated;
 
 	s64			bo_stats_peak_allocated;
 
diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
index bc162aa9971d..ee85482edd90 100644
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
@@ -363,12 +543,16 @@ struct cgroup_subsys drm_cgrp_subsys = {
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
