Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5476EFC08
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 22:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E34610E579;
	Wed, 26 Apr 2023 20:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD47F10E1FD;
 Wed, 26 Apr 2023 20:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682542663; x=1714078663;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=RT2pcV4mE66+r+8OkHSQOk9Iph/smSRTVpkM9otbiT0=;
 b=KhFTrY94Iaulis4zEQbGrXpku1jKp/UQG9ufEfujqVe6Bx8V6GW/5+nz
 6tyuZYe2iLRZ07RacISKSiGGWVnmb8NICE4YbT+FffZ0UI+yBr4AMXTza
 Ppb5gHtm19TnjudYLpsO+vLLX4NNoDvKANbZxAwgGJ2LD1rDfnQ5rz7Cq
 aAazL2mSfTwSSYBiXeoOXyZJcds8xdFYTUmG80ahAk9k59UVkyiISPzOZ
 qEeiQKNSJDG+85YqkzMHF6x5QRzNA3w6L2E1zdTm0M75+THcYNJnDStVm
 EbYcGe5xGxfG9GnkxZYxgtO9htVkKFPlfvYBlTr/dC3l7cZQZzSvAGRIU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="375203549"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="375203549"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 13:57:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="688105075"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="688105075"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 26 Apr 2023 13:57:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 13:57:42 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 13:57:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 13:57:41 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 13:57:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBLgZMLxxsfHvB84oowKWiyqlhIRaXP6oOhyyCih1IWeIrr/jjZwMzhgq6G600+EwxOuewc5ksdntlE3aMpm9bzMSpjzyBIHFUEX/phpipOtiGsmHis+yiLLRYeOp++ivKntPdcvsi6BwPaYE0jjtdyX8oMQT4DCi3341QOApd6GOoAMZjoxccyn3hSHgUMXxQWxqGWvSeXdU/O4oZTJj2ossVAsPqxmsgghRKsxRq/7vQwKmvxnsinbqMCWIHbBifyZdhzPL0Y+z1x8ax7BG60c9OSN2r13V9zoXY2+Rw5qzsiukiyczDVefXUYqELvD/AG9hidaKCEHSDAWc4WDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYXK7wSloNUM/a3bkwS2xGCZ63PdE0yyWThkEK5cwaI=;
 b=ni2w4MbQ6IpxgqsB3VX2lMAvCFDyQCXK/sYf07xw6FkK/h5VhAHS9w5d4NeJm8SDqRYz5OiXCGy0TSdFSlI2zcsG7OmAc3RbXZer9qe0y1uiJTjkfbhDfPBWfPxbNaPupNslTdyKfMKbJYwSsvxigHUX2u6rS3qfNnC4JMgDMWYyMUnM4CsKBrswR/gSfGIhqWcyLIIOxfJqeFzX7lw6/sIo/2r2dTycBw8qZpwhhyketff6tn2SW35ZthBFzNDD6xFMSDONbJonoTGlpx7vjpF2Sx/WONauYjwzKAJHoqDXXhwhRyuJ3wRzjj2lIT2AHIkhl/+DJ45g0fxC83gxvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6343.namprd11.prod.outlook.com (2603:10b6:930:3c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Wed, 26 Apr
 2023 20:57:38 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 20:57:38 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 05/14] drm/xe: Convert GuC CT print to snapshot capture and
 print.
Date: Wed, 26 Apr 2023 16:57:04 -0400
Message-ID: <20230426205713.512695-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230426205713.512695-1-rodrigo.vivi@intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0024.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::37) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: c15ee3da-7b6e-48cc-2a22-08db4698ddfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tXj9oNkWRqEDF/6cLsVOpiEVa0qijhL/upEpZqG0CYOMpA77z/0pVRAfWOHiBCy4ov+sJY2NjQHaCGA7WMQ7CIIAgcwoIO3RJTzaAWvt6aA1jeMZUHWoIqkkHhRDEWzmelhM59BKc/Do3NqKTIRocWn7wA5ENolH1n9++B8MdqTPlXxAh1rvbzE/eiB/bN5T2/dcKh9phhEPGU7eTSoB6w7dSyY1p3v+haFaGeTcuVnH/yvttskGiCXxPHeD70ufY/QjCp5Fgwi9ixt+xcUurxFTcsLKGHYq//9PrgWMY2nk9XyMyU2qkfSRTrUD1SX/X8WwRlZnoHBVE/gkUXzutZFSjl7aIColbDpCAQVpfgWD7a5PmNK+IQ24qYmnH7neI0NfGW+Eb2FKwBhFLfc9QeL4Qr+Yh/JXLTwNdwQUsMuPDg+GYIGsT1XY7ykpYCUZwreqpuMbyn8HnZouo8vxF/2d9MeQrUu1IwxzfS1L0fTnhvSqu/izSPdgijr/MgCw5Qw3y28d2KS0W9cnTOVFirzrBlduGrdh6qUWYqDkfE57p9DbNaOKyYCUemmB6dD7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(396003)(39860400002)(366004)(136003)(451199021)(83380400001)(450100002)(107886003)(478600001)(2616005)(1076003)(6506007)(26005)(186003)(6512007)(6486002)(5660300002)(44832011)(36756003)(82960400001)(66946007)(2906002)(38100700002)(41300700001)(86362001)(66556008)(66476007)(4326008)(6916009)(8676002)(8936002)(316002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IV9I8bzZmfFSga8sYRYWtvir8eruHxjRqCZ0cugbA16dQb9BcFQ5tIvvP2VG?=
 =?us-ascii?Q?W/xYuVwpy56OP9/+Z2PHt4KTwqPvl+ce0/EEJcqZQhQfsfK3JE21wWEDUnGq?=
 =?us-ascii?Q?mX1VSGathsUgcr/ucdA4nUELVu5SSBjmmtFzTJ1dfuj9IfIMWRlzVOmVinAj?=
 =?us-ascii?Q?MPFkgBSF1PDUl/mrRzlfhRV4uKF3HGxZcQPw3jFFPkTH4Kfqzwg65BmsVFLu?=
 =?us-ascii?Q?8RldOx6naB2ZIqirXKPfogJD+YyN5V1p5JM224j+IoX2aoFnkINQBLAZLggp?=
 =?us-ascii?Q?kbDIu15oiWLwPsGXohZVHuGtq2yFunAaKPftv8o8agYPZMqTadzLs1OznvXu?=
 =?us-ascii?Q?GmDy8XdvFVimdHawCoKVUGaABJlPS3hUfXW6N2whysse8z++1/jZyAYh+OGJ?=
 =?us-ascii?Q?cV8HEwN4CzOKFmGkwlIo2oJmUXlQoOs1Jxa+YpWMpJMP8ZjxdjaJ9Ke4yheJ?=
 =?us-ascii?Q?m901J8DrFkRHNyYxVm1fitL8JC8d6r+ktskmI0obGmHxMxUhWEVkQaqZ0mrK?=
 =?us-ascii?Q?wBn8Ty4UG5lP9smxtMUTFRF7TeXRS6DUR0ZV6Hwo5xmQKeu/o77QEVxtOEI4?=
 =?us-ascii?Q?wfrsWK6lbdv7YLYE6drbEx5MO0/xGpbRWZNJcG/AN5580WDdjJVo5UR14gtA?=
 =?us-ascii?Q?YBLqly0x770aQgQj+Edg/B6Fg8RaFFjpdec47XNuE2cEVdWLO7MTmS6PvIOZ?=
 =?us-ascii?Q?myoijovu7ylM/cjJjvfSRLGzcbDhacfNRCtxnIfoGDpn0SREOQiU8VHo2Hxg?=
 =?us-ascii?Q?W2w52JCAom3NTF53e8kVC6Sw9lSyWXlGnpHR9BEZbw+ZFkk0B4KPyLJX76w1?=
 =?us-ascii?Q?xVnGuXhZiauZe8v/AgkZ/8fW83v8FkB8q1emNmyUyIiIu2y8YeakDZ6dIsFt?=
 =?us-ascii?Q?4NLCxOTfg2Bn0thhs5pWq/md0heJhndlbNIr+HY9iv5QeSIvzPBx3If/Fx6Y?=
 =?us-ascii?Q?Gs+QxEpXojTCYB1nBEHmjERgsK7tsYsSAtYAXT0T88JFkAA6v3GZ4w68DQ+G?=
 =?us-ascii?Q?ZOLY1pK9y7VOxo0HY0pkKO+lBMnwI61jcczdz3i/ovnkEMUPRhBmDceBbiAW?=
 =?us-ascii?Q?YaMBMcFbmX5GgN4cDp3QZOYmCmCHepzDFFqfjbBH7Vo6OROrJdj4KAkP+p5S?=
 =?us-ascii?Q?92/JzV3wGgrMyQqErXrp1nV91WfMWDRpqD33KD3ZEDlvt144ptM0gvm2qOVj?=
 =?us-ascii?Q?ZYTtOcbIwgkn83zvy4/5S6P8XphA14y4Mhu/QkPIghVTeEkpsGKJ3FsJEe24?=
 =?us-ascii?Q?1vCaUMR1CmyBXPyiRDTMJ2jleOgOMci1iuHK4+K8rEy7hd/s2Hy51kVX0hNW?=
 =?us-ascii?Q?ZE7Oy/+jjZkTqxZWqV548Iq5YOQNsPta+Vbd6i0PkIDM1M1p9Q+N1E4PeqAr?=
 =?us-ascii?Q?0PCSDL1l4BD/J+RjH9YIgJVRn6BFXxjjw/g5QWlU6QBog6J344I84UdkWIYi?=
 =?us-ascii?Q?uE1r1R3+3LKlEwB6bJmfmyVbJtJB834pVOl4fN1Y9NhjXmdNc8B1i8RRKmex?=
 =?us-ascii?Q?0BPBu7N5HX68TBgYQlSjJORoR2bcKXmPkY4nkLTMdMyLc4PotFIkiT95Yjp5?=
 =?us-ascii?Q?bXhUZM80l4XTH36tESf73S1jX3NO3uFUUk6Pc8eRiWdfPLWf2S6K1huW+sEj?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c15ee3da-7b6e-48cc-2a22-08db4698ddfa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 20:57:37.9710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCOA0NRBQ2fTkhemexmHHp6jfPFckaQ3wJSNJqaDa6Lz6jfTXQD+scc7HSeDa3jpYT3UJHT/lKPlraGJ57fjhA==
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
 drivers/gpu/drm/xe/xe_guc_ct.c       | 132 +++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_ct.h       |   7 +-
 drivers/gpu/drm/xe/xe_guc_ct_types.h |  26 ++++++
 3 files changed, 145 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index e16e5fe37ed4..0b7b95dbd9be 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1095,31 +1095,26 @@ static void g2h_worker_func(struct work_struct *w)
 	xe_device_mem_access_put(ct_to_xe(ct));
 }
 
-static void guc_ct_ctb_print(struct xe_device *xe, struct guc_ctb *ctb,
-			     struct drm_printer *p)
+static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
+				     struct guc_ctb_snapshot *snapshot)
 {
 	u32 head, tail;
 
-	drm_printf(p, "\tsize: %d\n", ctb->info.size);
-	drm_printf(p, "\tresv_space: %d\n", ctb->info.resv_space);
-	drm_printf(p, "\thead: %d\n", ctb->info.head);
-	drm_printf(p, "\ttail: %d\n", ctb->info.tail);
-	drm_printf(p, "\tspace: %d\n", ctb->info.space);
-	drm_printf(p, "\tbroken: %d\n", ctb->info.broken);
+	snapshot->cmds = kmalloc_array(ctb->info.size, sizeof(u32), GFP_ATOMIC);
 
-	head = desc_read(xe, ctb, head);
-	tail = desc_read(xe, ctb, tail);
-	drm_printf(p, "\thead (memory): %d\n", head);
-	drm_printf(p, "\ttail (memory): %d\n", tail);
-	drm_printf(p, "\tstatus (memory): 0x%x\n", desc_read(xe, ctb, status));
+	xe_map_memcpy_from(xe, &snapshot->desc, &ctb->desc, 0,
+			   sizeof(struct guc_ct_buffer_desc));
+	memcpy(&snapshot->info, &ctb->info, sizeof(struct guc_ctb_info));
+
+	head = snapshot->desc.head;
+	tail = snapshot->desc.tail;
 
 	if (head != tail) {
 		struct iosys_map map =
 			IOSYS_MAP_INIT_OFFSET(&ctb->cmds, head * sizeof(u32));
 
 		while (head != tail) {
-			drm_printf(p, "\tcmd[%d]: 0x%08x\n", head,
-				   xe_map_rd(xe, &map, 0, u32));
+			snapshot->cmds[head] = xe_map_rd(xe, &map, 0, u32);
 			++head;
 			if (head == ctb->info.size) {
 				head = 0;
@@ -1131,20 +1126,119 @@ static void guc_ct_ctb_print(struct xe_device *xe, struct guc_ctb *ctb,
 	}
 }
 
-void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p)
+static void guc_ctb_snapshot_print(struct guc_ctb_snapshot *snapshot,
+				   struct drm_printer *p)
+{
+	u32 head, tail;
+
+	drm_printf(p, "\tsize: %d\n", snapshot->info.size);
+	drm_printf(p, "\tresv_space: %d\n", snapshot->info.space);
+	drm_printf(p, "\thead: %d\n", snapshot->info.head);
+	drm_printf(p, "\ttail: %d\n", snapshot->info.tail);
+	drm_printf(p, "\tspace: %d\n", snapshot->info.space);
+	drm_printf(p, "\tbroken: %d\n", snapshot->info.broken);
+	drm_printf(p, "\thead (memory): %d\n", snapshot->desc.head);
+	drm_printf(p, "\ttail (memory): %d\n", snapshot->desc.tail);
+	drm_printf(p, "\tstatus (memory): 0x%x\n", snapshot->desc.status);
+
+	head = snapshot->desc.head;
+	tail = snapshot->desc.tail;
+
+	while (head != tail) {
+		drm_printf(p, "\tcmd[%d]: 0x%08x\n", head,
+			   snapshot->cmds[head]);
+		++head;
+		if (head == snapshot->info.size)
+			head = 0;
+	}
+}
+
+static void guc_ctb_snapshot_free(struct guc_ctb_snapshot *snapshot)
+{
+	kfree(snapshot->cmds);
+}
+
+/**
+ * xe_guc_ct_snapshot_capture - Take a quick snapshot of the CT state.
+ * @ct: GuC CT object.
+ *
+ * This can be printed out in a later stage like during dev_coredump
+ * analysis.
+ *
+ * Returns: a GuC CT snapshot object that must be freed by the caller
+ * 	    by using `xe_guc_ct_snapshot_free`.
+ */
+struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct)
 {
+	struct xe_guc_ct_snapshot *snapshot;
+
+	snapshot = kzalloc(sizeof(struct xe_guc_ct_snapshot), GFP_ATOMIC);
+
 	if (ct->enabled) {
+		snapshot->ct_enabled = true;
+		guc_ctb_snapshot_capture(ct_to_xe(ct), &ct->ctbs.h2g,
+					 &snapshot->h2g);
+		guc_ctb_snapshot_capture(ct_to_xe(ct), &ct->ctbs.g2h,
+					 &snapshot->g2h);
+	}
+
+	return snapshot;
+}
+
+/**
+ * xe_guc_ct_snapshot_print - Print out a given GuC CT snapshot.
+ * @snapshot: GuC CT snapshot object.
+ * @p: drm_printer where it will be printed out.
+ *
+ * This function prints out a given GuC CT snapshot object.
+ */
+void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
+			      struct drm_printer *p)
+{
+	if (snapshot->ct_enabled) {
 		drm_puts(p, "\nH2G CTB (all sizes in DW):\n");
-		guc_ct_ctb_print(ct_to_xe(ct), &ct->ctbs.h2g, p);
+		guc_ctb_snapshot_print(&snapshot->h2g, p);
 
 		drm_puts(p, "\nG2H CTB (all sizes in DW):\n");
-		guc_ct_ctb_print(ct_to_xe(ct), &ct->ctbs.g2h, p);
-		drm_printf(p, "\tg2h outstanding: %d\n", ct->g2h_outstanding);
+		guc_ctb_snapshot_print(&snapshot->g2h, p);
+
+		drm_printf(p, "\tg2h outstanding: %d\n",
+			   snapshot->g2h_outstanding);
 	} else {
 		drm_puts(p, "\nCT disabled\n");
 	}
 }
 
+/**
+ * xe_guc_ct_snapshot_free - Free all allocated objects for a given snapshot.
+ * @snapshot: GuC CT snapshot object.
+ *
+ * This function free all the memory that needed to be allocated at capture
+ * time.
+ */
+void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
+{
+	guc_ctb_snapshot_free(&snapshot->h2g);
+	guc_ctb_snapshot_free(&snapshot->g2h);
+	kfree(snapshot);
+}
+
+/**
+ * xe_guc_ct_print - GuC CT Print.
+ * @ct: GuC CT.
+ * @p: drm_printer where it will be printed out.
+ *
+ * This function quickly capture a snapshot and immediately print it out.
+ */
+void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p)
+{
+	struct xe_guc_ct_snapshot *snapshot;
+
+	snapshot = xe_guc_ct_snapshot_capture(ct);
+	xe_guc_ct_snapshot_print(snapshot, p);
+	xe_guc_ct_snapshot_free(snapshot);
+}
+
 #ifdef XE_GUC_CT_SELFTEST
 /*
  * Disable G2H processing in IRQ handler to force xe_guc_ct_send to enter flow
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 49fb74f91e4d..29e0dff7ad9b 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -13,9 +13,14 @@ struct drm_printer;
 int xe_guc_ct_init(struct xe_guc_ct *ct);
 int xe_guc_ct_enable(struct xe_guc_ct *ct);
 void xe_guc_ct_disable(struct xe_guc_ct *ct);
-void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p);
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
 
+struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct);
+void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
+			      struct drm_printer *p);
+void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
+void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p);
+
 static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
 {
 	wake_up_all(&ct->wq);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index 64e3dd14d4b2..93046d95b009 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -48,6 +48,32 @@ struct guc_ctb {
 	struct guc_ctb_info info;
 };
 
+/**
+ * struct guc_ctb_snapshot - GuC command transport buffer (CTB) snapshot
+ */
+struct guc_ctb_snapshot {
+	/** @desc: snapshot of the CTB descriptor */
+	struct guc_ct_buffer_desc desc;
+	/** @cmds: snapshot of the CTB commands */
+	u32 *cmds;
+	/** @info: snapshot of the CTB info */
+	struct guc_ctb_info info;
+};
+
+/**
+ * struct xe_guc_ct_snapshot - GuC command transport (CT) snapshot
+ */
+struct xe_guc_ct_snapshot {
+	/** @ct_enabled: CT enabled info at capture time. */
+	bool ct_enabled;
+	/** @g2h_outstanding: G2H outstanding info at the capture time */
+	u32 g2h_outstanding;
+	/** @g2h: G2H CTB snapshot */
+	struct guc_ctb_snapshot g2h;
+	/** @h2g: H2G CTB snapshot */
+	struct guc_ctb_snapshot h2g;
+};
+
 /**
  * struct xe_guc_ct - GuC command transport (CT) layer
  *
-- 
2.39.2

