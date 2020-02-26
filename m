Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C68170842
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 20:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815E36EB9F;
	Wed, 26 Feb 2020 19:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4096E182;
 Wed, 26 Feb 2020 19:02:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSGBdhqMukkKBCQ/THzozcDgEKHvucL8nuYI4yqqaefAjtJX9cgH3d4PFBP7KayJ8xuXkwdquSeSBEyJ17p1AYhVsAgT+/aDrE0E/+tEtpUPbgNp2fgV4fLCqwsZWfImDcA5HTZ4k1gtDbeBckHYdw1Upp6XSgcveAZEmwvSSS2C7PNMGepdpdz7xWuX/kmSPzEp6cQVTSMMDe9yFqeWeZc+2t0wObpCTOYSwYqyXry+HqqEMx/fXNMTIuc7ses7qIfhoCBWHJKQslzrhk+EYfr9E+/Grglu71E53XGXyFzXNCrBUm38TAJzSBvKK8l5cPiDnt2FbLqwba6dFi2JGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7hi9C3bgjndcmDcy7j5BoWa6flwa/zQrZ4rC0zMA2s=;
 b=ewP2AYxCYINtaZAcUCuh9OyFf7KnFhMsbb8ClCzmvEtcYkZK6tqUCadjE8QHwtJIGe2YsAEhKIb9MucGThb/t/CxRFAw4venrVmADW3XeayOR62ARpLTwEXP+bvkfpg6nRPgz6JyaIr79rhLONijJKHVxFYJTBrkqAqRPX5fEC8Yrl9PdssxmE4zkOmsKEfjD2mLn4H7wmLfHPn8dTUOYrvme0Q0LcVc70KpynqVxqVaEJxvFsVNhNNJfJuvGXur4RGcRmCF6Wxf5udqGw8uSIu/FaXXkNrF1NhS1vdXhP0YY+Avl/dRry/I1ApvFuOPsBXofNBPMvthjbFneToEmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7hi9C3bgjndcmDcy7j5BoWa6flwa/zQrZ4rC0zMA2s=;
 b=HBGl4rveDIlxXDvGSwaNqf31SSqJDasjDT7pFModmxKu6jtcp3RY/eq4Wn9r4pu4GynN6bohuK7Ah/zoeZO1R3/ks0zHvlPzXH3hB3a6hikjU5cjWXOX9B3q7MabPiUCeZfTLAMnE2eZksUGimeCgY4cf5pZVAjlcFBwgazcNTc=
Received: from MN2PR01CA0014.prod.exchangelabs.com (2603:10b6:208:10c::27) by
 MN2PR12MB4094.namprd12.prod.outlook.com (2603:10b6:208:15f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Wed, 26 Feb
 2020 19:02:06 +0000
Received: from BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:208:10c:cafe::2b) by MN2PR01CA0014.outlook.office365.com
 (2603:10b6:208:10c::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21 via Frontend
 Transport; Wed, 26 Feb 2020 19:02:06 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT021.mail.protection.outlook.com (10.13.177.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2772.14 via Frontend Transport; Wed, 26 Feb 2020 19:02:06 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 26 Feb
 2020 13:02:05 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 26 Feb
 2020 13:02:05 -0600
Received: from yuho-zbook.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 26 Feb 2020 13:02:04 -0600
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>
Subject: [PATCH v2 04/11] drm, cgroup: Add total GEM buffer allocation stats
Date: Wed, 26 Feb 2020 14:01:45 -0500
Message-ID: <20200226190152.16131-5-Kenny.Ho@amd.com>
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
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(346002)(136003)(428003)(189003)(199004)(30864003)(7696005)(316002)(110136005)(26005)(1076003)(8936002)(81156014)(8676002)(81166006)(4326008)(336012)(2616005)(426003)(70586007)(356004)(86362001)(5660300002)(186003)(478600001)(2906002)(6666004)(70206006)(36756003)(921003)(1121003)(2101003)(83996005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4094; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 442efcc0-950c-4b11-3f30-08d7baee5f63
X-MS-TrafficTypeDiagnostic: MN2PR12MB4094:
X-Microsoft-Antispam-PRVS: <MN2PR12MB409444B2CB4FC6BF88C0612C83EA0@MN2PR12MB4094.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0325F6C77B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6/9/IuuoLHg8jQSWV0qoZ15nFvKBz7s7nbbJmZFrctaZ7WNlA0BTkc479Q4Zk6kXTO8vbh9wMyj/AO6Iq3Rr1qB3QocKOp9wFxMTZkU8xHk3o7NhAOofA5qssX/S6ih0zJISB30O/j1xKy3EwC+kyoj02vi2UGJvjIBFOaev1FR1Bzvxg5l87NwtySwDt2IEC39rvAZOYBLtu7d6UdU3/hAWAAO/rGXst1cCQJnZf9Lgrx1UinpboqO+WDCcjT56NmPWttiotQpFp6zTh9scBfjwnMmWTObOF/B4FaweagCOMluuJAJYTZoXeB1uQ83qRumh9YMnXdAyDZJr6bh5Pjyfe6v4BEMmySMpEqFg312Hnl+jtEf2u+5Xuw1Fah4YsdwGExytEXEZ7hkoL1LH8Xg0Xs1JBLQZa294+0FEy9D1K+Ou0NdiyhMNREOb85u0tNiXS2drTsDGh7nMwe/GqFGmTYzwh+s2HBWwRIV/rwqbkjjto+HN73xq/r8B4p3nx7Yyw9FtUMx61gvBg2twHLqd3uXq1NWSvtHYlN+1uIM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2020 19:02:06.1107 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 442efcc0-950c-4b11-3f30-08d7baee5f63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4094
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

The drm resource being measured here is the GEM buffer objects.  User
applications allocate and free these buffers.  In addition, a process
can allocate a buffer and share it with another process.  The consumer
of a shared buffer can also outlive the allocator of the buffer.

For the purpose of cgroup accounting and limiting, ownership of the
buffer is deemed to be the cgroup for which the allocating process
belongs to.  There is one cgroup stats per drm device.  Each allocation
is charged to the owning cgroup as well as all its ancestors.

Similar to the memory cgroup, migrating a process to a different cgroup
does not move the GEM buffer usages that the process started while in
previous cgroup, to the new cgroup.

The following is an example to illustrate some of the operations.  Given
the following cgroup hierarchy (The letters are cgroup names with R
being the root cgroup.  The numbers in brackets are processes.  The
processes are placed with cgroup's 'No Internal Process Constraint' in
mind, so no process is placed in cgroup B.)

R (4, 5) ------ A (6)
 \
  B ---- C (7,8)
   \
    D (9)

Here is a list of operation and the associated effect on the size
track by the cgroups (for simplicity, each buffer is 1 unit in size.)

==  ==  ==  ==  ==  ===================================================
R   A   B   C   D   Ops
==  ==  ==  ==  ==  ===================================================
1   0   0   0   0   4 allocated a buffer
1   0   0   0   0   4 shared a buffer with 5
1   0   0   0   0   4 shared a buffer with 9
2   0   1   0   1   9 allocated a buffer
3   0   2   1   1   7 allocated a buffer
3   0   2   1   1   7 shared a buffer with 8
3   0   2   1   1   7 sharing with 9
3   0   2   1   1   7 release a buffer
3   0   2   1   1   7 migrate to cgroup D
3   0   2   1   1   9 release a buffer from 7
2   0   1   0   1   8 release a buffer from 7 (last ref to shared buf)
==  ==  ==  ==  ==  ===================================================

gpu.buffer.stats
        A read-only flat-keyed file which exists on all cgroups.  Each
        entry is keyed by the drm device's major:minor.

        Total GEM buffer allocation in bytes.

Change-Id: Ibc1f646ca7dbc588e2d11802b156b524696a23e7
Signed-off-by: Kenny Ho <Kenny.Ho@amd.com>
---
 Documentation/admin-guide/cgroup-v2.rst |  50 +++++++++-
 drivers/gpu/drm/drm_gem.c               |   9 ++
 include/drm/drm_cgroup.h                |  16 +++
 include/drm/drm_gem.h                   |  10 ++
 include/linux/cgroup_drm.h              |   6 ++
 kernel/cgroup/drm.c                     | 126 ++++++++++++++++++++++++
 6 files changed, 216 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 7deff912185e..c041e672cc10 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -63,6 +63,7 @@ v1 is available under Documentation/admin-guide/cgroup-v1/.
        5-7-1. RDMA Interface Files
      5-8. GPU
        5-8-1. GPU Interface Files
+       5-8-2. GEM Buffer Ownership
      5-9. Misc
        5-9-1. perf_event
      5-N. Non-normative information
@@ -2068,7 +2069,54 @@ of GPU-related resources.
 GPU Interface Files
 ~~~~~~~~~~~~~~~~~~~~
 
-TODO
+  gpu.buffer.stats
+	A read-only flat-keyed file which exists on all cgroups.  Each
+	entry is keyed by the drm device's major:minor.
+
+	Total GEM buffer allocation in bytes.
+
+GEM Buffer Ownership
+~~~~~~~~~~~~~~~~~~~~
+
+For the purpose of cgroup accounting and limiting, ownership of the
+buffer is deemed to be the cgroup for which the allocating process
+belongs to.  There is one cgroup stats per drm device.  Each allocation
+is charged to the owning cgroup as well as all its ancestors.
+
+Similar to the memory cgroup, migrating a process to a different cgroup
+does not move the GEM buffer usages that the process started while in
+previous cgroup, to the new cgroup.
+
+The following is an example to illustrate some of the operations.  Given
+the following cgroup hierarchy (The letters are cgroup names with R
+being the root cgroup.  The numbers in brackets are processes.  The
+processes are placed with cgroup's 'No Internal Process Constraint' in
+mind, so no process is placed in cgroup B.)
+
+R (4, 5) ------ A (6)
+ \
+  B ---- C (7,8)
+   \
+    D (9)
+
+Here is a list of operation and the associated effect on the size
+track by the cgroups (for simplicity, each buffer is 1 unit in size.)
+
+==  ==  ==  ==  ==  ===================================================
+R   A   B   C   D   Ops
+==  ==  ==  ==  ==  ===================================================
+1   0   0   0   0   4 allocated a buffer
+1   0   0   0   0   4 shared a buffer with 5
+1   0   0   0   0   4 shared a buffer with 9
+2   0   1   0   1   9 allocated a buffer
+3   0   2   1   1   7 allocated a buffer
+3   0   2   1   1   7 shared a buffer with 8
+3   0   2   1   1   7 sharing with 9
+3   0   2   1   1   7 release a buffer
+3   0   2   1   1   7 migrate to cgroup D
+3   0   2   1   1   9 release a buffer from 7
+2   0   1   0   1   8 release a buffer from 7 (last ref to shared buf)
+==  ==  ==  ==  ==  ===================================================
 
 
 Misc
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index a9e4a610445a..589f8f6bde2c 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -38,6 +38,7 @@
 #include <linux/dma-buf.h>
 #include <linux/mem_encrypt.h>
 #include <linux/pagevec.h>
+#include <linux/cgroup_drm.h>
 
 #include <drm/drm.h>
 #include <drm/drm_device.h>
@@ -46,6 +47,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vma_manager.h>
+#include <drm/drm_cgroup.h>
 
 #include "drm_internal.h"
 
@@ -164,6 +166,9 @@ void drm_gem_private_object_init(struct drm_device *dev,
 		obj->resv = &obj->_resv;
 
 	drm_vma_node_reset(&obj->vma_node);
+
+	obj->drmcg = drmcg_get(current);
+	drmcg_chg_bo_alloc(obj->drmcg, dev, size);
 }
 EXPORT_SYMBOL(drm_gem_private_object_init);
 
@@ -957,6 +962,10 @@ drm_gem_object_release(struct drm_gem_object *obj)
 		fput(obj->filp);
 
 	dma_resv_fini(&obj->_resv);
+
+	drmcg_unchg_bo_alloc(obj->drmcg, obj->dev, obj->size);
+	drmcg_put(obj->drmcg);
+
 	drm_gem_free_mmap_offset(obj);
 }
 EXPORT_SYMBOL(drm_gem_object_release);
diff --git a/include/drm/drm_cgroup.h b/include/drm/drm_cgroup.h
index fda426fba035..1eb3012e16a1 100644
--- a/include/drm/drm_cgroup.h
+++ b/include/drm/drm_cgroup.h
@@ -26,6 +26,12 @@ void drmcg_unregister_dev(struct drm_device *dev);
 
 void drmcg_device_early_init(struct drm_device *device);
 
+void drmcg_chg_bo_alloc(struct drmcg *drmcg, struct drm_device *dev,
+		size_t size);
+
+void drmcg_unchg_bo_alloc(struct drmcg *drmcg, struct drm_device *dev,
+		size_t size);
+
 #else
 
 struct drmcg_props {
@@ -53,5 +59,15 @@ static inline void drmcg_device_early_init(struct drm_device *device)
 {
 }
 
+static inline void drmcg_chg_bo_alloc(struct drmcg *drmcg,
+		struct drm_device *dev,	size_t size)
+{
+}
+
+static inline void drmcg_unchg_bo_alloc(struct drmcg *drmcg,
+		struct drm_device *dev,	size_t size)
+{
+}
+
 #endif /* CONFIG_CGROUP_DRM */
 #endif /* __DRM_CGROUP_H__ */
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 0b375069cd48..9c588c329da0 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -310,6 +310,16 @@ struct drm_gem_object {
 	 *
 	 */
 	const struct drm_gem_object_funcs *funcs;
+
+	/**
+	 * @drmcg:
+	 *
+	 * DRM cgroup this GEM object belongs to.
+	 *
+	 * This is used to track and limit the amount of GEM objects a user
+	 * can allocate.
+	 */
+	struct drmcg *drmcg;
 };
 
 /**
diff --git a/include/linux/cgroup_drm.h b/include/linux/cgroup_drm.h
index ff94b48aa2dc..34b0aec7c964 100644
--- a/include/linux/cgroup_drm.h
+++ b/include/linux/cgroup_drm.h
@@ -11,6 +11,11 @@
 /* limit defined per the way drm_minor_alloc operates */
 #define MAX_DRM_DEV (64 * DRM_MINOR_RENDER)
 
+enum drmcg_res_type {
+	DRMCG_TYPE_BO_TOTAL,
+	__DRMCG_TYPE_LAST,
+};
+
 #ifdef CONFIG_CGROUP_DRM
 
 /**
@@ -18,6 +23,7 @@
  */
 struct drmcg_device_resource {
 	/* for per device stats */
+	s64			bo_stats_total_allocated;
 };
 
 /**
diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
index 351df517d5a6..addb096edac5 100644
--- a/kernel/cgroup/drm.c
+++ b/kernel/cgroup/drm.c
@@ -13,6 +13,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_device.h>
+#include <drm/drm_ioctl.h>
 #include <drm/drm_cgroup.h>
 
 static struct drmcg *root_drmcg __read_mostly;
@@ -26,6 +27,18 @@ static struct drm_minor (*(*acquire_drm_minor)(unsigned int minor_id));
 
 static void (*put_drm_dev)(struct drm_device *dev);
 
+#define DRMCG_CTF_PRIV_SIZE 3
+#define DRMCG_CTF_PRIV_MASK GENMASK((DRMCG_CTF_PRIV_SIZE - 1), 0)
+#define DRMCG_CTF_PRIV(res_type, f_type)  ((res_type) <<\
+		DRMCG_CTF_PRIV_SIZE | (f_type))
+#define DRMCG_CTF_PRIV2RESTYPE(priv) ((priv) >> DRMCG_CTF_PRIV_SIZE)
+#define DRMCG_CTF_PRIV2FTYPE(priv) ((priv) & DRMCG_CTF_PRIV_MASK)
+
+
+enum drmcg_file_type {
+	DRMCG_FTYPE_STATS,
+};
+
 /**
  * drmcg_bind - Bind DRM subsystem to cgroup subsystem
  * @acq_dm: function pointer to the drm_minor_acquire function
@@ -252,7 +265,66 @@ drmcg_css_alloc(struct cgroup_subsys_state *parent_css)
 	return &drmcg->css;
 }
 
+static void drmcg_print_stats(struct drmcg_device_resource *ddr,
+		struct seq_file *sf, enum drmcg_res_type type)
+{
+	if (ddr == NULL) {
+		seq_puts(sf, "\n");
+		return;
+	}
+
+	switch (type) {
+	case DRMCG_TYPE_BO_TOTAL:
+		seq_printf(sf, "%lld\n", ddr->bo_stats_total_allocated);
+		break;
+	default:
+		seq_puts(sf, "\n");
+		break;
+	}
+}
+
+static int drmcg_seq_show_fn(int id, void *ptr, void *data)
+{
+	struct drm_minor *minor = ptr;
+	struct seq_file *sf = data;
+	struct drmcg *drmcg = css_to_drmcg(seq_css(sf));
+	enum drmcg_file_type f_type =
+		DRMCG_CTF_PRIV2FTYPE(seq_cft(sf)->private);
+	enum drmcg_res_type type =
+		DRMCG_CTF_PRIV2RESTYPE(seq_cft(sf)->private);
+	struct drmcg_device_resource *ddr;
+
+	if (minor->type != DRM_MINOR_PRIMARY)
+		return 0;
+
+	ddr = drmcg->dev_resources[minor->index];
+
+	seq_printf(sf, "%d:%d ", DRM_MAJOR, minor->index);
+
+	switch (f_type) {
+	case DRMCG_FTYPE_STATS:
+		drmcg_print_stats(ddr, sf, type);
+		break;
+	default:
+		seq_puts(sf, "\n");
+		break;
+	}
+
+	return 0;
+}
+
+int drmcg_seq_show(struct seq_file *sf, void *v)
+{
+	return drm_minor_for_each(&drmcg_seq_show_fn, sf);
+}
+
 struct cftype files[] = {
+	{
+		.name = "buffer.total.stats",
+		.seq_show = drmcg_seq_show,
+		.private = DRMCG_CTF_PRIV(DRMCG_TYPE_BO_TOTAL,
+						DRMCG_FTYPE_STATS),
+	},
 	{ }	/* terminate */
 };
 
@@ -276,3 +348,57 @@ void drmcg_device_early_init(struct drm_device *dev)
 	drmcg_update_cg_tree(dev);
 }
 EXPORT_SYMBOL(drmcg_device_early_init);
+
+/**
+ * drmcg_chg_bo_alloc - charge GEM buffer usage for a device and cgroup
+ * @drmcg: the DRM cgroup to be charged to
+ * @dev: the device the usage should be charged to
+ * @size: size of the GEM buffer to be accounted for
+ *
+ * This function should be called when a new GEM buffer is allocated to account
+ * for the utilization.  This should not be called when the buffer is shared (
+ * the GEM buffer's reference count being incremented.)
+ */
+void drmcg_chg_bo_alloc(struct drmcg *drmcg, struct drm_device *dev,
+		size_t size)
+{
+	struct drmcg_device_resource *ddr;
+	int devIdx = dev->primary->index;
+
+	if (drmcg == NULL)
+		return;
+
+	mutex_lock(&dev->drmcg_mutex);
+	for ( ; drmcg != NULL; drmcg = drmcg_parent(drmcg)) {
+		ddr = drmcg->dev_resources[devIdx];
+
+		ddr->bo_stats_total_allocated += (s64)size;
+	}
+	mutex_unlock(&dev->drmcg_mutex);
+}
+EXPORT_SYMBOL(drmcg_chg_bo_alloc);
+
+/**
+ * drmcg_unchg_bo_alloc -
+ * @drmcg: the DRM cgroup to uncharge from
+ * @dev: the device the usage should be removed from
+ * @size: size of the GEM buffer to be accounted for
+ *
+ * This function should be called when the GEM buffer is about to be freed (
+ * not simply when the GEM buffer's reference count is being decremented.)
+ */
+void drmcg_unchg_bo_alloc(struct drmcg *drmcg, struct drm_device *dev,
+		size_t size)
+{
+	int devIdx = dev->primary->index;
+
+	if (drmcg == NULL)
+		return;
+
+	mutex_lock(&dev->drmcg_mutex);
+	for ( ; drmcg != NULL; drmcg = drmcg_parent(drmcg))
+		drmcg->dev_resources[devIdx]->bo_stats_total_allocated
+			-= (s64)size;
+	mutex_unlock(&dev->drmcg_mutex);
+}
+EXPORT_SYMBOL(drmcg_unchg_bo_alloc);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
