Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 535106EFC17
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 22:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5958710E204;
	Wed, 26 Apr 2023 20:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEDF10E204;
 Wed, 26 Apr 2023 20:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682542715; x=1714078715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aH6S+KTs0l5OcCogQ6uiDCexdNs5FG/0PBFcNPzpvQA=;
 b=We92nB7PjfZsumKFqt4gLQCi/L+3tiUymNnGchI6HBXILxQMGVgH4n6B
 FRwKpsG+xUVToP9yu9AcueOM3WOFjSvDfG60w9tp4hNxVr/u+w2Qye+KE
 jC0F0QWjJMClO4F+7ro12FM5YIF099TTqrI6ZkkJvR4dESo8FDZD3nbeD
 CLJ6kcJPdl38RIHg5Rxt0D0UAY5uts5XwwMBWw5stQ5cLDVqRlmF7cAuT
 XnSdc98BOvPy1+/2nLXHYNIOglwrMauZgMGj6uO+eC7H7rfMYpfmy9ZPY
 dQMRKOQuG1v9Nsd877PjetHu3G/oLmDOoAgqRVVdZJiJOL40VULqHqC4T Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="410249628"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="410249628"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 13:58:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="868435339"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="868435339"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 26 Apr 2023 13:58:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 13:58:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 13:58:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 13:58:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrHuvAAh8sap+uE8f1yf2rAAdb22M2OO/Bo2Hq32Y4h9MXTu4tCS/mqsdJQx74rl3jLk1p7Q7Yr5WTfpFBghjXhDqMpbfOUg/PzD/yBrhCMte0Y9DTNAS6PElJ/r68PrYCADAB5WqSSQK84tl6lVzYRxwZG5YQsGvcgE7DZDEYU/oYen0MWn3fNg9j0gxsg3tfyjsHkOODCqYo++J2CnWMFCpRKpKWkavf0M4JdMDrje23r0J9Ytf5wxUsg/Mbq7I18thXXwpe9H1tIXxGdP5MNkhxbDMN/d0g6Fg/ZlayrU6kvkj31U3yEdKlEVHZTwt2TW9LwG4G0On1iAchMChQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vyy5KIMYFXp7q70HIZ/hbDQAVF0bDpiMEqRZxx733uc=;
 b=fMYGpT5z1sa6AfKQEhE2v2rLXa6WGRB6lk7f22IQtCsefXQC4ThP7kwAS2UmAOOvkjLJHjvPHnuq0+Bi8cGsvAwsXoNGWCSwENdSxV84GCyJGtEyy1GD/nwBUcS/gjrPTLEECCn5rUxKlxr9oJAv3zTYKUqXV7V6ws0al3cbrOO2AGxKIkbJD/3tIIyk84DFIF3qy4LXhrrMKOornzIHX3dzG3xh1oCdpiqcdzkhXEsn7uyRpsnPBaK7dpAsOoIDfKXP5scmQfAkgeTGhgMDFbDmxSIE1xk0ih8xLGBDk8M22RjoGdU0Qby39bL9R5/IMO0SEeAnhcqBUz+CXFyHag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN0PR11MB6182.namprd11.prod.outlook.com (2603:10b6:208:3c6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 20:58:08 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 20:58:08 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 13/14] drm/xe: Convert VM print to snapshot capture and print.
Date: Wed, 26 Apr 2023 16:57:12 -0400
Message-ID: <20230426205713.512695-14-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230426205713.512695-1-rodrigo.vivi@intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0110.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN0PR11MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: 86967b94-e522-44b8-fc4d-08db4698efda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HqL3fJACDjE4SHLgxkKTCnCf/y72k/g56QkT9v2vLP8ooGbzIPKO1pIS2H+NDhfyKZtAjyaXBV9K9pf6qpHbhzQ/yN9xxjWNRdkyIKUA+wLs37wwM658qhleOlXPe1h1ZnUMTZzxD+8f+PLjNBbnZ5GLn99C0iI6c6xdC73BJ5wI5ZiM7wREf4ttvTWj+ZkTerwhg2TeNdtMolUhYIwKBQoj4Y7tov+zN6VS89pIBuvOeZDoQpm/BmgcKzAciab3SRsJUhhkz7iRfJy4/Zr+p8x3OtoTYflxv8UXo1dYPsFXG/4e7WMarQEECcCNuZD5pjvwdSohObFU9OxTJs5IxfD9BSkJ0CUScd2YWxF4V9xVi4/XThJ7uZQRrH9LOzZQMxHkqxaHl9S4KIjVB+Aq8mEIrTHqPFIdsbDK69psXZPPLaFrkajYV8jcFtCOzuBqXK3ZWllTSv1gYedOIkFZ7y251ojzBPTzLJ/DaLccutm68UJsu+Yl8ymopXDIND745Qw7HrawWHSK3OY6DrBp6bxk+7Mql6qI7Cwf2tJgNUm42U+Sd5STuuQRQ7VANqKI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199021)(2616005)(83380400001)(186003)(1076003)(26005)(6506007)(6512007)(316002)(6916009)(66476007)(86362001)(4326008)(450100002)(38100700002)(82960400001)(66556008)(66946007)(2906002)(44832011)(41300700001)(107886003)(478600001)(5660300002)(36756003)(8676002)(6486002)(6666004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iyPJwJmNcpEdsmJ2/M9rGnBEuPafoiQlJ/i9CnJvRdgqvFyzV134bCmuxrxF?=
 =?us-ascii?Q?M6VcbSWl2fjiNu/RRuVfO4P8VG0rYLOKr1ozJ5nl9yeH1VBW9ewLxx90rkV9?=
 =?us-ascii?Q?//bKxPS5jV4Z+oVo9TA73wG02zEmulbkMeLc+WcZDKxFHPBnqMkr+K8KjOlA?=
 =?us-ascii?Q?oPbg3RDeiELxSB4PUtptQPfpw6bCzV6YYBaHWM4dPHpbo7O2w0yZyW9cBOxM?=
 =?us-ascii?Q?vU9s8mjVd3SNOK6zx6ZQIm2bYGoUo2+4YeufAK7IqVvvNuFs4Me2+p3k4Pdi?=
 =?us-ascii?Q?IfhEj+IMNdIvzh9sLUcLPP26Z938kqn4tCnhpAx8wG9XC+JAuDJNMQ4t1sWn?=
 =?us-ascii?Q?qQYwGf6CZ24pUf1OvfVpPuLp1LSivZ8fOYpmr/FVat3xrVPlpTl/AjCY0+i6?=
 =?us-ascii?Q?880LZFIo+8p9F3RRwkb7x6R/4C/8OMyeJhrEG9YsQQL9+TD++Gebhu671Kzi?=
 =?us-ascii?Q?AqmS3PwDUMzND1VB4WZkzllQ86XoSPkTzcZjqIZvAewbp/Bz56zGCreDX4Uq?=
 =?us-ascii?Q?0NM7cVcfZEFoAsKYkuO2K7O++AsnAabTJJkAi/mVqSuEq71UF1yB3AeEUu+L?=
 =?us-ascii?Q?M88rHR3jCX4KTFf4nGn68AJvYTQ/tNJER1L9YJ1ze7fKa+svjFra4DqD6bST?=
 =?us-ascii?Q?Rw+kmo6rTgx/h9iAr56/cS26M37KQ6OZkvqpacyblvF078CGWKKJYDkJodsv?=
 =?us-ascii?Q?+LEHBXaqbueBj4DVjRPM5h4aJtMiBkz11ONT1d6fRj3b/mDkdbo8jx0q7xE4?=
 =?us-ascii?Q?qp7sjNE8B4UKe3ZDrY/4tjnzaOiX6mQYaCEHYN84LKMlP8a3xE2BbBYROWtL?=
 =?us-ascii?Q?eWvvDEWjDWLsxR3WJq7h9frnIfD/e7Znpx+p4VPudJhLaj/SIrNX96yE6K7b?=
 =?us-ascii?Q?qC1xk1J1MoApByUxirIkswDHV5vZeKnYrQe4lz/oN/1tC7JsSLagDQxvmQ40?=
 =?us-ascii?Q?iHfoOxBhxjpjBbwcTB4dz/Qn1so0kIpVC9xGJVYdqWUV1rQjNNXZct/dQviU?=
 =?us-ascii?Q?CZZbWLH885xJcUpkSGBPGrmEnANT8x+ggre9fWxgkZrRRHOsBU3xK63iOa+C?=
 =?us-ascii?Q?7KCuEBZ+OHBl7T/+cbHg7hZjJ/8byWfYe0pdRcL2tGRpClanMkjwKhmNRzoY?=
 =?us-ascii?Q?RNvFOaMCymsgnXYmWvZL14B4nqcnd2/wCExxHcgjECXfmG064EBMONlAYNJU?=
 =?us-ascii?Q?hEqJLcK0qL3NoNWUy8/8V8JK8paHSp/jl9BomW8G2agBsuM8AIBOP3eTKTfZ?=
 =?us-ascii?Q?hDiLJnLk7eIb92Bhd+cXnqXu0uOw6tX4C+dn9UYyAx0CJqbCnGtx1d1S+GFL?=
 =?us-ascii?Q?tsppVZgRxM8pZILFVVUC9emVs4GGQKge0a2RERDLKGNW5Qvmpj6NpJ+jn9ol?=
 =?us-ascii?Q?Z/NG2oRjdLOKEBO1+NfnchjlLpr1AaAIn2FOrBGAZSZ7nYoHrztY8KADG7yU?=
 =?us-ascii?Q?y4WQfis8pTMWr5fzWgnMVH8/vz7j3oZxXfInbrKawbQGWyPhpb3SvFod2Huv?=
 =?us-ascii?Q?KTTnGQycZAgihozHXXbuWewzGoIu268gbJiwSmZRt3IUpT/Z5IZpD9n/8ZIC?=
 =?us-ascii?Q?OYh86KYw4uFQrf6ijsmtdWmjDLqnYnZ3JHn0GOljIsBzm7UhuZ2soRNmEZ91?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86967b94-e522-44b8-fc4d-08db4698efda
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 20:58:07.9539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18BCWRhg9cMQbFfE0ItkSNlzeMCAib7n8HS+SkYHNdKSUpAXSvtL4nBSsOp6pvU3Vjse2usEX7CLCeh1Uo5MWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6182
X-OriginatorOrg: intel.com
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
Cc: dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The goal is to allow for a snapshot capture to be taken at the time
of the crash, while the print out can happen at a later time through
the exposed devcoredump virtual device.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c |   2 +-
 drivers/gpu/drm/xe/xe_vm.c         | 137 +++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_vm.h         |   6 +-
 drivers/gpu/drm/xe/xe_vm_types.h   |  18 ++++
 4 files changed, 143 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 74659d0a69b3..ac98bc1843e8 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -753,7 +753,7 @@ static void simple_error_capture(struct xe_engine *e)
 				continue;
 			xe_hw_engine_print(hwe, &p);
 		}
-		xe_analyze_vm(&p, e->vm, e->gt->info.id);
+		xe_vm_print(&p, e->vm, e->gt->info.id);
 		xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
 		dma_fence_end_signalling(cookie);
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 4cffdb84680a..075640dbdff0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3369,38 +3369,139 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	return 0;
 }
 
-int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
+/**
+ * xe_vm_snapshot_capture - Take a quick snapshot of the HW Engine.
+ * @vm: Xe VM
+ * @gt_id: GT id number
+ *
+ * This can be printed out in a later stage like during dev_coredump
+ * analysis.
+ *
+ * Returns: a Xe VM snapshot object that must be freed by the
+ * 	    caller, using `xe_vm_snapshot_free`.
+ */
+struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm, int gt_id)
 {
+	struct xe_vm_snapshot *snapshot;
 	struct rb_node *node;
-	bool is_vram;
-	uint64_t addr;
+	int i = 0;
+
+	snapshot = kzalloc(sizeof(struct xe_vm_snapshot), GFP_ATOMIC);
+
+	if (!down_read_trylock(&vm->lock))
+		return snapshot;
+
+	snapshot->acquired = true;
+
+	for (node = rb_first(&vm->vmas); node; node = rb_next(node))
+		snapshot->num_nodes++;
+
+	snapshot->vm_nodes = kmalloc_array(snapshot->num_nodes,
+					   sizeof(struct vm_node_snapshot),
+					   GFP_ATOMIC);
 
-	if (!down_read_trylock(&vm->lock)) {
-		drm_printf(p, " Failed to acquire VM lock to dump capture");
-		return 0;
-	}
 	if (vm->pt_root[gt_id]) {
-		addr = xe_bo_addr(vm->pt_root[gt_id]->bo, 0, GEN8_PAGE_SIZE, &is_vram);
-		drm_printf(p, " VM root: A:0x%llx %s\n", addr, is_vram ? "VRAM" : "SYS");
+		snapshot->vm_root = kzalloc(sizeof(struct vm_node_snapshot),
+				      GFP_ATOMIC);
+		snapshot->vm_root->addr = xe_bo_addr(vm->pt_root[gt_id]->bo, 0,
+					       GEN8_PAGE_SIZE,
+					       &snapshot->vm_root->is_vram);
 	}
 
 	for (node = rb_first(&vm->vmas); node; node = rb_next(node)) {
 		struct xe_vma *vma = to_xe_vma(node);
-		bool is_userptr = xe_vma_is_userptr(vma);
+		snapshot->vm_nodes[i].is_userptr = xe_vma_is_userptr(vma);
 
-		if (is_userptr) {
+		if (snapshot->vm_nodes[i].is_userptr) {
 			struct xe_res_cursor cur;
 
-			xe_res_first_sg(vma->userptr.sg, 0, GEN8_PAGE_SIZE, &cur);
-			addr = xe_res_dma(&cur);
+			xe_res_first_sg(vma->userptr.sg, 0, GEN8_PAGE_SIZE,
+					&cur);
+			snapshot->vm_nodes[i].addr = xe_res_dma(&cur);
 		} else {
-			addr = xe_bo_addr(vma->bo, 0, GEN8_PAGE_SIZE, &is_vram);
+			snapshot->vm_nodes[i].addr = xe_bo_addr(vma->bo, 0,
+							  GEN8_PAGE_SIZE,
+							  &snapshot->vm_nodes[i].is_vram);
 		}
-		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s\n",
-			   vma->start, vma->end, vma->end - vma->start + 1ull,
-			   addr, is_userptr ? "USR" : is_vram ? "VRAM" : "SYS");
+		snapshot->vm_nodes[i].vma.start = vma->start;
+		snapshot->vm_nodes[i].vma.end = vma->end;
+		i++;
 	}
 	up_read(&vm->lock);
 
-	return 0;
+	return snapshot;
+}
+
+/**
+ * xe_vm_snapshot_print - Print out a given Xe HW Engine snapshot.
+ * @snapshot: Xe VM snapshot object.
+ * @p: drm_printer where it will be printed out.
+ *
+ * This function prints out a given Xe HW Engine snapshot object.
+ */
+void xe_vm_snapshot_print(struct xe_vm_snapshot *snapshot,
+			  struct drm_printer *p)
+{
+	int i;
+
+	if (!snapshot)
+		return;
+
+	if (!snapshot->acquired) {
+		drm_printf(p, " Failed to acquire VM lock to dump capture");
+		return;
+	}
+
+	if (snapshot->vm_root) {
+		drm_printf(p, " VM root: A:0x%llx %s\n",
+			   snapshot->vm_root->addr,
+			   snapshot->vm_root->is_vram ? "VRAM" : "SYS");
+	}
+
+	for (i = 0; snapshot->vm_nodes && i < snapshot->num_nodes; i++)
+		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s\n",
+			   snapshot->vm_nodes[i].vma.start,
+			   snapshot->vm_nodes[i].vma.end,
+			   snapshot->vm_nodes[i].vma.end -
+			   snapshot->vm_nodes[i].vma.start + 1ull,
+			   snapshot->vm_nodes[i].addr,
+			   snapshot->vm_nodes[i].is_userptr ?
+			   "USR" : snapshot->vm_nodes[i].is_vram ?
+			   "VRAM" : "SYS");
+}
+
+/**
+ * xe_vm_snapshot_free - Free all allocated objects for a given snapshot.
+ * @snapshot: Xe VM snapshot object.
+ *
+ * This function free all the memory that needed to be allocated at capture
+ * time.
+ */
+void xe_vm_snapshot_free(struct xe_vm_snapshot *snapshot)
+{
+	if (!snapshot)
+		return;
+
+	if (snapshot->vm_root)
+		kfree(snapshot->vm_root);
+	if (snapshot->vm_nodes)
+		kfree(snapshot->vm_nodes);
+	kfree(snapshot);
+}
+
+/**
+ * xe_vm_print - Xe VM Print.
+ * @p: drm_printer
+ * @vm: Xe VM
+ * @gt_id: GT id number
+ *
+ * This function quickly capture a snapshot and immediately print it out.
+ */
+void xe_vm_print(struct drm_printer *p, struct xe_vm *vm, int gt_id)
+{
+	struct xe_vm_snapshot *snapshot;
+
+	snapshot = xe_vm_snapshot_capture(vm, gt_id);
+	xe_vm_snapshot_print(snapshot, p);
+	xe_vm_snapshot_free(snapshot);
 }
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 748dc16ebed9..924884b36469 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -145,7 +145,11 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
 void xe_vm_fence_all_extobjs(struct xe_vm *vm, struct dma_fence *fence,
 			     enum dma_resv_usage usage);
 
-int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id);
+struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm, int gt_id);
+void xe_vm_snapshot_print(struct xe_vm_snapshot *snapshot,
+			  struct drm_printer *p);
+void xe_vm_snapshot_free(struct xe_vm_snapshot *snapshot);
+void xe_vm_print(struct drm_printer *p, struct xe_vm *vm, int gt_id);
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
 #define vm_dbg drm_dbg
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index fada7896867f..18e79b6a2182 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -149,6 +149,24 @@ struct xe_vma {
 	} extobj;
 };
 
+
+struct vm_node_snapshot {
+	bool is_userptr;
+	bool is_vram;
+	struct {
+		u64 start;
+		u64 end;
+	} vma;
+	u64 addr;
+};
+
+struct xe_vm_snapshot {
+	bool acquired;
+	struct vm_node_snapshot *vm_root;
+	struct vm_node_snapshot *vm_nodes;
+	int num_nodes;
+};
+
 struct xe_device;
 
 #define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->resv)
-- 
2.39.2

