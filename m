Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 499686EFC0E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 22:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615FF10E143;
	Wed, 26 Apr 2023 20:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F94D10E1FD;
 Wed, 26 Apr 2023 20:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682542680; x=1714078680;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=J6L5i84sKlEMhvAxlqdPRAX58eVyOsh4vYJ6mNoZn/M=;
 b=VdfecDy251KBN3nZFdshjvXZKGIzpzV9lrm0R7tpH5ZZXm0/SStX4egy
 qjYh+3RjZ5Pm08aVhPdY833JY9owJmFbo9xknT3w4hVo+ZLIKkItn070H
 NVOszXdvT+eMXM6tfBB1C41DaGWyKZvfotUd5LQ61fSVAQ178Dicuz59s
 ByOdgX3dHhyek1S2x4EOy9Y4dakF2dFWolil8sfQPvqZpVg18mc1acE10
 eZNAwKS+gW8t3ZHAEVHDwJZN/pl2bwxp3LKECRrbHtS81+nXDG9iQGAYu
 hcbzLB7AK3pLe6r2An72DVdeieKyEkf3tqtPw8ECvNyfVcFY2zSkRp1ik A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="336158362"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="336158362"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 13:57:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="838081083"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="838081083"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 26 Apr 2023 13:57:57 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 13:57:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 13:57:56 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 13:57:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WF8Bac5BjYn0x3nJOu4SObZrJpEpNX+2JsWJNqjVZ0yrYUrtfpLYQXWBjPFonVQp3donrqR2zvObEsZumvcpIJv5nUoqJLau3JnfjGUa5OskaWVzr66o4ce+PwMl7kprgJgC7UqZylLWpek8i8c4HJyljBSRBjjf2estutJCbh+y+w5635NX8E6XrwI3hTqYuuA9NKroiuPGvxyOz5I1P2HSYDN1d4yQz/FGlmyILpHXGW98L+hYrZrBi2QkGRdlreC+8Kn+VblJuPTR+ZcLpzZMGqYxor0jxw56kF/SvhRzGOzjfrIeM8AKWcyc+keoWvEKCTfmebd51Rv6PzCHsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpJWIkMvzVXblJQ8KvRrjdMIUYA/ubliRIMMwXSS2jo=;
 b=SbeWcCWAK44x7Lq0KILXIcxlT3ciudMuHI2/6d6JNDRkcG52P02KD5zemaxzm3R3CBmWacdVwPFz4hCSAFxT5Ig+xGUn7jNUegWtoV088tyCXIkA3XKdC2BqsLZ6bN5/MrE/s3IWz4/S5hD3qvq5s8smWHsK4OM1ry37gA3mTRs/511QXO8yJNp5EMkw2Rhck2LVRQR7kSa2v7plekGvv378433/OSCONtLUhQDP8mwQaGn0q7K/QyeTfbUjs8IegGgCh1EDDK+LO2F91aAqn1DIKoPNwVKzv9wSz/WUB0KqsB2HbAgUpnEabrbn1e6JBs6sAL1OXcQCKbxVdOIycA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6343.namprd11.prod.outlook.com (2603:10b6:930:3c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Wed, 26 Apr
 2023 20:57:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 20:57:49 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 08/14] drm/xe: Convert GuC Engine print to snapshot capture
 and print.
Date: Wed, 26 Apr 2023 16:57:07 -0400
Message-ID: <20230426205713.512695-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230426205713.512695-1-rodrigo.vivi@intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0069.prod.exchangelabs.com (2603:10b6:a03:94::46)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ab85acd-64bf-4a2e-13c3-08db4698e4cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Yx0xnkJfSUQ9Ntelg7XUpiP57ggcq0GkWaOUQD9y+lPMCFO4kt2UActuQTCYEV3Mh1eN8qkv8/E7+RdZpFzgI+AWkYXf5Bi4bJGTnHdmgEIIqKMnBnPC+JZbvrt9OhT+QLvQvi2etY8Fs6oGRp8Gny3tYs+oFtpLmopdBJfePuu09S2a/LD3bcoTFrJTFyTwcxOpR4pIiTv+MiLvI8DY8WNo7OQxK8/nofGcOmd06vmj3xjE+q8QybgUNvww8tGsHOENn9eZVTTHLwIgY40GAlXmVJJUkoGvWUoQDfwy3HciZa2oWDuAvGYk8HwBc0ywtHSDPzFnHzqah6ZgW4HOGTvImobYRzqGed7qHzO1TcVe/CuEuYSQ5ejdn6JGyhECfpiIFUnCFZmJ0u1y2quuRAUGAMJC0gkUjdVjAcNTra9e+r1BAVe5L2gEf2ja2GiIq5Jdlz1Mp/0jBXCJC1iaZtPl730iupkIzBMPmp4sCBxZHMB5VLpxU14vEOFRa17MvnKvvSZxPDfsqilJCExcCx7XssS7At0Sf1MTcR5Lnt8YyC1MnTya3vOhShr7nUm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(396003)(39860400002)(366004)(136003)(451199021)(83380400001)(450100002)(107886003)(45080400002)(478600001)(2616005)(1076003)(6506007)(26005)(186003)(6512007)(6486002)(30864003)(5660300002)(44832011)(36756003)(82960400001)(66946007)(2906002)(38100700002)(41300700001)(86362001)(66556008)(66476007)(4326008)(6916009)(8676002)(8936002)(316002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i6DU3S3Ud/tUvEdzReScCfbwm+0gNXn07dtiOo5R6gDJ1br0ja4KtdbaPtnH?=
 =?us-ascii?Q?t1ReB3eCiF8NHkdtulaTimmFl7fHXlDAWFuV7+WUKPzL1x05ad9GTmDnsaC9?=
 =?us-ascii?Q?6yIBAYlauFvLxalqsacI29fouwiJEoqxqmBTUUwSKwaypH9YCw+LTQkP0VNe?=
 =?us-ascii?Q?yHAZFMDb4GkUMA3uHx9Fkxtbj9ePXNpGVWRNDMDSSjTOkUvHxdGAnzTso0RJ?=
 =?us-ascii?Q?9P2KNkPGq9DVbyGTbjBBe8+LUpx7+lPdNDYT9Va/vhikNS5DAkIqSTGkyDKj?=
 =?us-ascii?Q?rPVAptgwP/FkJKJZ7El8l5f7iFxhCxtoAwi8pmacJo+xvIRqEU6Q97HI9KET?=
 =?us-ascii?Q?7cQLCuyB13P/5mo+LhZcxS6CNFFfe5ovzWgaV6NrQJsdxE+weYfCDJhGR1wu?=
 =?us-ascii?Q?1yHDJ7De6qbEUk61aP2zX6SR+RvWOFb7OUurdPcGVfI+XEeaskBteqqn9JDy?=
 =?us-ascii?Q?oRy/1RCU2UKStsmEthLz6bUlqTdWRsnbVrstm4VlCvi/fmWxxOm0FCyRWiiU?=
 =?us-ascii?Q?GxLJQrh7Rv29JicJikq3UPvsCNjVAHkzTWwLtsS6fpo/9RgHDadvKjI+yDUb?=
 =?us-ascii?Q?3ElhjPwMsGABhdBor0x0CkuWNPZne3fBn86fQ+oofUdbc2wPIMcZTgqKVwtQ?=
 =?us-ascii?Q?YPLRPo5rpwexALoI1OmGOzx1j2nwPWyBUc/2kc09K9dkHcYAfhCZacn8iwQc?=
 =?us-ascii?Q?dx7A1JlMJBGBcDFoAItY9PS1+DCJl9ZT08Mc6zgr6ujDdQlUxiypzc7j4+W6?=
 =?us-ascii?Q?HO/gbtlcLzlR2lq4e1GDqsAhgoroMI+vfnPTZdeS9GEBva1QMiliNC6cHx3U?=
 =?us-ascii?Q?5TOKNbQ+N+YCSm9pf4OqPbeOi8NakSnp2r6OIRBtqM7+j+L7Wm4hhNQ958mY?=
 =?us-ascii?Q?Yj12mAUxyngok1gG/kNJ5wQYXdywojmwpn/GyS2LqPsRJrQ2cSSXyMFZHVjg?=
 =?us-ascii?Q?IGtxVEiN20sXVt9ITQ4HJbOf9AHDGReUNuLqRS9oDD/5cKdAHSoO9MI5rQIH?=
 =?us-ascii?Q?25Qg+xJNj2zBQLvkwIycBUfzxCUX4+pHWURbfCGmi1NLuGruX7XMwJXa5kra?=
 =?us-ascii?Q?ps/RQaM7cvFgrKg27aKdgmmnOJPfs/mvmoc8FpyIyNp05o2syrRzkqb83+uF?=
 =?us-ascii?Q?KDc4mUWQddf+tdIMzfxdB5JP1ttur8yhkBtBvItI575dZ9r3Zh2HEqSrwCIV?=
 =?us-ascii?Q?ZcWCmeIL9jgE5EuCjQfUGNAfOuOl28OjMU+FqIkPSYvClXCYBcCll1dvX8ZQ?=
 =?us-ascii?Q?OkzB7Hxmbf9uWhfHEwlBMCNVQoRL0p1oT/ySrIF5taLg3pfkiPlH14anktwM?=
 =?us-ascii?Q?mDGQpN2Ez0m4OsYoZbDT1UhFTWX9c4HxNL/L/nIpuwQ5BqILSK9AgPhspRyJ?=
 =?us-ascii?Q?vsVHbwf/pNkFeyG/cMHVm4DefmYzUfKJa4vokigCNP5Ub2Cs8aK6M62n5sCK?=
 =?us-ascii?Q?feAQr36lCSJ94f5dGpPA/N3zEjUgEbC76BdfjH1Drbkg/Dk6wRvoZQhEaHT8?=
 =?us-ascii?Q?tkFwtL40SbWJIrJE9NRmvhKs2QNPdCYopfhqrr34VP4603a2sGMBEH85Jpsn?=
 =?us-ascii?Q?RC14iPwWPMyJfjkzDqndyhccP2f9LEgW0SBNLbWbwAv8oUgmX1HNuxh9RMHK?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab85acd-64bf-4a2e-13c3-08db4698e4cb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 20:57:49.3244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJb3AiNkg+aawPNqALn72YQ/+6oYAfU2YuDSnAN+fJnuExExnjZCTHIFwLsGejz+fi60aHVprFOoSmHLKHwbYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6343
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
 drivers/gpu/drm/xe/xe_guc_submit.c       | 212 +++++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_submit.h       |  10 +-
 drivers/gpu/drm/xe/xe_guc_submit_types.h |  91 ++++++++++
 3 files changed, 274 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index a5fe7755ce4c..9c06411f857f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1596,75 +1596,211 @@ int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	return 0;
 }
 
-static void guc_engine_wq_print(struct xe_engine *e, struct drm_printer *p)
+static void
+guc_engine_wq_snapshot_capture(struct xe_engine *e,
+			       struct xe_guc_submit_engine_snapshot *snapshot)
 {
 	struct xe_guc *guc = engine_to_guc(e);
 	struct xe_device *xe = guc_to_xe(guc);
 	struct iosys_map map = xe_lrc_parallel_map(e->lrc);
 	int i;
 
+	snapshot->guc.wqi_head = e->guc->wqi_head;
+	snapshot->guc.wqi_tail = e->guc->wqi_tail;
+	snapshot->parallel.wq_desc.head = parallel_read(xe, map, wq_desc.head);
+	snapshot->parallel.wq_desc.tail = parallel_read(xe, map, wq_desc.tail);
+	snapshot->parallel.wq_desc.status = parallel_read(xe, map,
+							  wq_desc.wq_status);
+
+	if (snapshot->parallel.wq_desc.head !=
+	    snapshot->parallel.wq_desc.tail) {
+		for (i = snapshot->parallel.wq_desc.head;
+		     i != snapshot->parallel.wq_desc.tail;
+		     i = (i + sizeof(u32)) % WQ_SIZE)
+			snapshot->parallel.wq[i / sizeof(u32)] =
+				parallel_read(xe, map, wq[i / sizeof(u32)]);
+	}
+}
+
+static void
+guc_engine_wq_snapshot_print(struct xe_guc_submit_engine_snapshot *snapshot,
+			     struct drm_printer *p)
+{
+	int i;
+
 	drm_printf(p, "\tWQ head: %u (internal), %d (memory)\n",
-		   e->guc->wqi_head, parallel_read(xe, map, wq_desc.head));
+		   snapshot->guc.wqi_head, snapshot->parallel.wq_desc.head);
 	drm_printf(p, "\tWQ tail: %u (internal), %d (memory)\n",
-		   e->guc->wqi_tail, parallel_read(xe, map, wq_desc.tail));
-	drm_printf(p, "\tWQ status: %u\n",
-		   parallel_read(xe, map, wq_desc.wq_status));
-	if (parallel_read(xe, map, wq_desc.head) !=
-	    parallel_read(xe, map, wq_desc.tail)) {
-		for (i = parallel_read(xe, map, wq_desc.head);
-		     i != parallel_read(xe, map, wq_desc.tail);
+		   snapshot->guc.wqi_tail, snapshot->parallel.wq_desc.tail);
+	drm_printf(p, "\tWQ status: %u\n", snapshot->parallel.wq_desc.status);
+
+	if (snapshot->parallel.wq_desc.head !=
+	    snapshot->parallel.wq_desc.tail) {
+		for (i = snapshot->parallel.wq_desc.head;
+		     i != snapshot->parallel.wq_desc.tail;
 		     i = (i + sizeof(u32)) % WQ_SIZE)
 			drm_printf(p, "\tWQ[%zu]: 0x%08x\n", i / sizeof(u32),
-				   parallel_read(xe, map, wq[i / sizeof(u32)]));
+				   snapshot->parallel.wq[i / sizeof(u32)]);
 	}
 }
 
-static void guc_engine_print(struct xe_engine *e, struct drm_printer *p)
+/**
+ * xe_guc_engine_snapshot_capture - Take a quick snapshot of the GuC Engine.
+ * @e: Xe Engine.
+ *
+ * This can be printed out in a later stage like during dev_coredump
+ * analysis.
+ *
+ * Returns: a GuC Submit Engine snapshot object that must be freed by the
+ * 	    caller, using `xe_guc_engine_snapshot_free`.
+ */
+struct xe_guc_submit_engine_snapshot *
+xe_guc_engine_snapshot_capture(struct xe_engine *e)
 {
 	struct drm_gpu_scheduler *sched = &e->guc->sched;
 	struct xe_sched_job *job;
+	struct xe_guc_submit_engine_snapshot *snapshot;
 	int i;
 
-	drm_printf(p, "\nGuC ID: %d\n", e->guc->id);
-	drm_printf(p, "\tName: %s\n", e->name);
-	drm_printf(p, "\tClass: %d\n", e->class);
-	drm_printf(p, "\tLogical mask: 0x%x\n", e->logical_mask);
-	drm_printf(p, "\tWidth: %d\n", e->width);
-	drm_printf(p, "\tRef: %d\n", kref_read(&e->refcount));
-	drm_printf(p, "\tTimeout: %ld (ms)\n", sched->timeout);
-	drm_printf(p, "\tTimeslice: %u (us)\n", e->sched_props.timeslice_us);
-	drm_printf(p, "\tPreempt timeout: %u (us)\n",
-		   e->sched_props.preempt_timeout_us);
+	snapshot = kzalloc(sizeof(struct xe_guc_submit_engine_snapshot),
+			   GFP_ATOMIC);
+
+	snapshot->guc.id = e->guc->id;
+	memcpy(&snapshot->name, &e->name, sizeof(snapshot->name));
+	snapshot->class = e->class;
+	snapshot->logical_mask = e->logical_mask;
+	snapshot->width = e->width;
+	snapshot->refcount = kref_read(&e->refcount);
+	snapshot->sched_timeout = sched->timeout;
+	snapshot->sched_props.timeslice_us = e->sched_props.timeslice_us;
+	snapshot->sched_props.preempt_timeout_us =
+		e->sched_props.preempt_timeout_us;
+
+	snapshot->lrc = kmalloc_array(e->width, sizeof(struct lrc_snapshot),
+				GFP_ATOMIC);
+
 	for (i = 0; i < e->width; ++i ) {
 		struct xe_lrc *lrc = e->lrc + i;
 
+		snapshot->lrc[i].context_desc =
+			lower_32_bits(xe_lrc_ggtt_addr(lrc));
+		snapshot->lrc[i].head = xe_lrc_ring_head(lrc);
+		snapshot->lrc[i].tail.internal = lrc->ring.tail;
+		snapshot->lrc[i].tail.memory =
+			xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL);
+		snapshot->lrc[i].start_seqno = xe_lrc_start_seqno(lrc);
+		snapshot->lrc[i].seqno = xe_lrc_seqno(lrc);
+
+	}
+
+	snapshot->schedule_state = atomic_read(&e->guc->state);
+	snapshot->engine_flags = e->flags;
+
+	snapshot->parallel_execution = xe_engine_is_parallel(e);
+	if (snapshot->parallel_execution)
+		guc_engine_wq_snapshot_capture(e, snapshot);
+
+	spin_lock(&sched->job_list_lock);
+	snapshot->pending_list_size = list_count_nodes(&sched->pending_list);
+	snapshot->pending_list = kmalloc_array(snapshot->pending_list_size,
+					 sizeof(struct pending_list_snapshot),
+					 GFP_ATOMIC);
+	i = 0;
+	list_for_each_entry(job, &sched->pending_list, drm.list) {
+		snapshot->pending_list[i].seqno = xe_sched_job_seqno(job);
+		snapshot->pending_list[i].fence =
+			dma_fence_is_signaled(job->fence) ? 1 : 0;
+		snapshot->pending_list[i].finished =
+			dma_fence_is_signaled(&job->drm.s_fence->finished)
+			? 1 : 0;
+		i++;
+	}
+	spin_unlock(&sched->job_list_lock);
+
+	return snapshot;
+}
+
+/**
+ * xe_guc_engine_snapshot_print - Print out a given GuC Engine snapshot.
+ * @snapshot: GuC Submit Engine snapshot object.
+ * @p: drm_printer where it will be printed out.
+ *
+ * This function prints out a given GuC Submit Engine snapshot object.
+ */
+void
+xe_guc_engine_snapshot_print(struct xe_guc_submit_engine_snapshot *snapshot,
+			     struct drm_printer *p)
+{
+	int i;
+
+	drm_printf(p, "\nGuC ID: %d\n", snapshot->guc.id);
+	drm_printf(p, "\tName: %s\n", snapshot->name);
+	drm_printf(p, "\tClass: %d\n", snapshot->class);
+	drm_printf(p, "\tLogical mask: 0x%x\n", snapshot->logical_mask);
+	drm_printf(p, "\tWidth: %d\n", snapshot->width);
+	drm_printf(p, "\tRef: %d\n", snapshot->refcount);
+	drm_printf(p, "\tTimeout: %ld (ms)\n", snapshot->sched_timeout);
+	drm_printf(p, "\tTimeslice: %u (us)\n",
+		   snapshot->sched_props.timeslice_us);
+	drm_printf(p, "\tPreempt timeout: %u (us)\n",
+		   snapshot->sched_props.preempt_timeout_us);
+
+	for (i = 0; i < snapshot->width; ++i ) {
 		drm_printf(p, "\tHW Context Desc: 0x%08x\n",
-			   lower_32_bits(xe_lrc_ggtt_addr(lrc)));
+			   snapshot->lrc[i].context_desc);
 		drm_printf(p, "\tLRC Head: (memory) %u\n",
-			   xe_lrc_ring_head(lrc));
+			   snapshot->lrc[i].head);
 		drm_printf(p, "\tLRC Tail: (internal) %u, (memory) %u\n",
-			   lrc->ring.tail,
-			   xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL));
+			   snapshot->lrc[i].tail.internal,
+			   snapshot->lrc[i].tail.memory);
 		drm_printf(p, "\tStart seqno: (memory) %d\n",
-			   xe_lrc_start_seqno(lrc));
-		drm_printf(p, "\tSeqno: (memory) %d\n", xe_lrc_seqno(lrc));
+			   snapshot->lrc[i].start_seqno);
+		drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->lrc[i].seqno);
 	}
-	drm_printf(p, "\tSchedule State: 0x%x\n", atomic_read(&e->guc->state));
-	drm_printf(p, "\tFlags: 0x%lx\n", e->flags);
-	if (xe_engine_is_parallel(e))
-		guc_engine_wq_print(e, p);
+	drm_printf(p, "\tSchedule State: 0x%x\n", snapshot->schedule_state);
+	drm_printf(p, "\tFlags: 0x%lx\n", snapshot->engine_flags);
 
-	spin_lock(&sched->job_list_lock);
+	if (snapshot->parallel_execution)
+		guc_engine_wq_snapshot_print(snapshot, p);
 
-	list_for_each_entry(job, &sched->pending_list, drm.list)
+	for(i = 0; i < snapshot->pending_list_size; i++)
 		drm_printf(p, "\tJob: seqno=%d, fence=%d, finished=%d\n",
-			   xe_sched_job_seqno(job),
-			   dma_fence_is_signaled(job->fence) ? 1 : 0,
-			   dma_fence_is_signaled(&job->drm.s_fence->finished) ?
-			   1 : 0);
-	spin_unlock(&sched->job_list_lock);
+			   snapshot->pending_list[i].seqno,
+			   snapshot->pending_list[i].fence,
+			   snapshot->pending_list[i].finished);
+}
+
+/**
+ * xe_guc_engine_snapshot_free - Free all allocated objects for a given
+ * snapshot.
+ * @snapshot: GuC Submit Engine snapshot object.
+ *
+ * This function free all the memory that needed to be allocated at capture
+ * time.
+ */
+void xe_guc_engine_snapshot_free(struct xe_guc_submit_engine_snapshot *snapshot)
+{
+	kfree(snapshot->lrc);
+	kfree(snapshot->pending_list);
+	kfree(snapshot);
+}
+
+static void guc_engine_print(struct xe_engine *e, struct drm_printer *p)
+{
+	struct xe_guc_submit_engine_snapshot *snapshot;
+
+	snapshot = xe_guc_engine_snapshot_capture(e);
+	xe_guc_engine_snapshot_print(snapshot, p);
+	xe_guc_engine_snapshot_free(snapshot);
 }
 
+/**
+ * xe_guc_submit_print - GuC Submit Print.
+ * @guc: GuC.
+ * @p: drm_printer where it will be printed out.
+ *
+ * This function capture and prints snapshots of **all** GuC Engines.
+ */
 void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
 {
 	struct xe_engine *e;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 8002734d6f24..4153c2d22013 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -13,7 +13,6 @@ struct xe_engine;
 struct xe_guc;
 
 int xe_guc_submit_init(struct xe_guc *guc);
-void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
 
 int xe_guc_submit_reset_prepare(struct xe_guc *guc);
 void xe_guc_submit_reset_wait(struct xe_guc *guc);
@@ -27,4 +26,13 @@ int xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 					   u32 len);
 int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
+struct xe_guc_submit_engine_snapshot *
+xe_guc_engine_snapshot_capture(struct xe_engine *e);
+void
+xe_guc_engine_snapshot_print(struct xe_guc_submit_engine_snapshot *snapshot,
+			     struct drm_printer *p);
+void
+xe_guc_engine_snapshot_free(struct xe_guc_submit_engine_snapshot *snapshot);
+void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
index d369ea0bad60..0b726609dc14 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
@@ -61,4 +61,95 @@ struct guc_submit_parallel_scratch {
 	u32 wq[WQ_SIZE / sizeof(u32)];
 };
 
+struct lrc_snapshot {
+	u32 context_desc;
+	u32 head;
+	struct {
+		u32 internal;
+		u32 memory;
+	} tail;
+	u32 start_seqno;
+	u32 seqno;
+};
+
+struct pending_list_snapshot {
+	u32 seqno;
+	bool fence;
+	bool finished;
+};
+
+/**
+ * struct xe_guc_submit_engine_snapshot - Snapshot for devcoredump
+ */
+struct xe_guc_submit_engine_snapshot {
+	/** @name: name of this engine */
+	char name[MAX_FENCE_NAME_LEN];
+	/** @class: class of this engine */
+	enum xe_engine_class class;
+	/**
+	 * @logical_mask: logical mask of where job submitted to engine can run
+	 */
+	u32 logical_mask;
+	/** @width: width (number BB submitted per exec) of this engine */
+	u16 width;
+	/** @refcount: ref count of this engine */
+	u32 refcount;
+	/**
+	 * @sched_timeout: the time after which a job is removed from the
+	 * scheduler.
+	 */
+	long sched_timeout;
+
+	/** @sched_props: scheduling properties */
+	struct {
+		/** @timeslice_us: timeslice period in micro-seconds */
+		u32 timeslice_us;
+		/** @preempt_timeout_us: preemption timeout in micro-seconds */
+		u32 preempt_timeout_us;
+	} sched_props;
+
+	/** @lrc: LRC Snapshot */
+	struct lrc_snapshot *lrc;
+
+	/** @schedule_state: Schedule State at the moment of Crash */
+	u32 schedule_state;
+	/** @engine_flags: Flags of the faulty engine */
+	unsigned long engine_flags;
+
+	/** @guc: GuC Engine Snapshot */
+	struct {
+		/** @wqi_head: work queue item head */
+		u32 wqi_head;
+		/** @wqi_tail: work queue item tail */
+		u32 wqi_tail;
+		/** @id: GuC id for this xe_engine */
+		u16 id;
+	} guc;
+
+	/**
+	 * @parallel_execution: Indication if the failure was during parallel
+	 * execution
+	 */
+	bool parallel_execution;
+	/** @parallel: snapshot of the useful parallel scratch */
+	struct {
+		/** @wq_desc: Workqueue description */
+		struct {
+			/** @head: Workqueue Head */
+			u32 head;
+			/** @tail: Workqueue Tail */
+			u32 tail;
+			/** @status: Workqueue Status */
+			u32 status;
+		} wq_desc;
+		/** @wq: Workqueue Items */
+		u32 wq[WQ_SIZE / sizeof(u32)];
+	} parallel;
+
+	/** @pending_list_size: Size of the pending list snapshot array */
+	int pending_list_size;
+	/** @pending_list: snapshot of the pending list info */
+	struct pending_list_snapshot *pending_list;
+};
+
 #endif
-- 
2.39.2

