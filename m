Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC8C6EFC0D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 22:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1666110EA32;
	Wed, 26 Apr 2023 20:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1161210E1FD;
 Wed, 26 Apr 2023 20:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682542679; x=1714078679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ZMwmbviybjc8wmkpoL7hmf4i9Gf/cztUam8fqFGFqTk=;
 b=fN1vLtr8jbfjDCZIgCjj/fi0ORgfGymb/RpLOu7kUsZCHpP8MpqUxmXy
 FZl67QGdbY9FNrea0PYcgAQTxsKWZaOcnnxhhdOizaeDdAXMI8QjKtkVG
 VOD1hUXu1qeZ+kV/mMEbtiQT/ih9jNFb4pCmhqayyC2ytnCV3qlcdxscJ
 CxqbJExTwitnm7Q4w958AXmml9WDc4mkkRP7CbNz5I/OOP/L/BKYzfsKt
 wZ44W+CuRfm7SQctPEBMF6i6FwjdJib2YmRi9IhrURnhX9mqLU5YSnu6p
 /39gWq4VcNpbWyn4Tdqcn6YHI+MS2wpqBTRDod66p6R1J5ZJizogFCLdK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="375203691"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="375203691"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 13:57:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="688105228"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="688105228"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 26 Apr 2023 13:57:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 13:57:57 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 13:57:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 13:57:57 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 13:57:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F7zLPUz+yRgu8phQ9f7jbFrbQZpp5tUSIuzncsbZoJuL6rxcAg013T+zegDriaLnW+HD80rUpYB5uoPxGZ9N9mj7nFiuWhp4I3bpCCup1L1X1QgDbNqnsAEjAMnCd6WCEe1t3BhjYdwQXJ1I5fV59wzPwHzQEK9WsGAINCpso9IpRyDHC70NXBIEJd9ZWsUNpi9X61gQO1v4578Fy/U+IEy58hg2M7cLTUTNJzM/ANsoaqEOQ5laUZkTex6rV7w/UiTETIE9KczzAw0ZwRjItzM3DNR1CiDGbcOMCgOCEics3ki0Vc69fZTBtRboVizL2MNv2hkR1jk+OlLXpUbzkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGFDCgxRF56vNjOom4nZdt0e97JmY/lRYbx+II7PMlg=;
 b=cqSpD/0LIBW2MaN3GmN73Qz2vRaGu9qVJOSt7AdNX6DSIoLRUFqIfllg145L3der+VLUKmuaBq+ncIU3n1+sNawqpq4ZNBj658sCp5fLaNVkqDXpe+1UZGbrbRlIt36lf5yLHA+oX6V0iiUevGbsNP49E7v4Iy43Xu0crjifSfx3lIyFHZyMOcsVnHafubZ3x4ymmOZ0WVVAAKAk73CVVkX7ilioM/KNx/V6JXlyFFpLBZ/bAdW4lgIE1DRPSwNyYoiZTLmQlvogG9A8LPwTuky/Y1gTpDkY/+LOidU7mMPi3G1b9QdL+GoNuEtxMmXeupKtHoZm3TYQ2Mv+19LKlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6343.namprd11.prod.outlook.com (2603:10b6:930:3c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Wed, 26 Apr
 2023 20:57:53 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 20:57:53 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 09/14] drm/xe: Add GuC Submit Engine snapshot to
 xe_devcoredump.
Date: Wed, 26 Apr 2023 16:57:08 -0400
Message-ID: <20230426205713.512695-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230426205713.512695-1-rodrigo.vivi@intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cb941d0-6bda-4db1-b6fd-08db4698e710
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8R4NO0FHH9KMdPDOfgZiZ2R/VnzPptQLVS2np56yfRqDrJ+ptO05ma3+yzK87TuYwZhbDs4Sbp0bnsQeUiXkYsIBQhQksomMrInnuhN23iFobOGSE0ntRVDUebtOr0wtXR96ze8r0jOexCiMHy7QtCxr/CPydWLlZ3mlR2yrBYP9R8MwpMoU16sQtP3lfH2bqU3GldhlfISZMjZwLLzGizbVpkTRF9UROzX4otTk+023tBKtFdVgr9Ac5nVOpyjLi0NLT5eZ2F0ttVa60d7jNFa2yr0qb/OJxZGiO4fpcZs52//BTjJzzJE/5R/DT317MsiLeIHbAKi0Mb+vz/J/a6BavgCgO6UAyR/5Qoax7epNxHBBmIlpUd7hxRHF9qmuCvIP9qYT2i2d3ly/vm7QGw7jk30J1QeE0hGP1gUaUNjkAgqx5tS4N6GrZr8FYZpgxmXB/Y6eQLHwJu2CZsRBam88qRdZX2D2Tti09Ex4/33WDObQRHgdgcZ9f3eWOq4tcBV0sNl3kMWlCtokxmSt81+PlUCoCzMAZ76UT8xPdX8BxeLPVo4htlqDvM0UiIvw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(396003)(39860400002)(366004)(136003)(451199021)(83380400001)(450100002)(107886003)(478600001)(2616005)(1076003)(6506007)(26005)(186003)(6512007)(6486002)(5660300002)(44832011)(36756003)(82960400001)(66946007)(2906002)(38100700002)(41300700001)(86362001)(66556008)(66476007)(4326008)(6916009)(8676002)(8936002)(316002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VM+QZ/ppJ87iqgYVtJIyp24yfKv7ZIIiBFtRUMKeFIHCueSdNI6AYIB/ygQg?=
 =?us-ascii?Q?er/YkuKoGNE2RvBjvrRJBGf07Lq37q0KLI+83oaZDChTly0PKDyO94J9XUDF?=
 =?us-ascii?Q?zURmNJp7JJVTk8dB+rF2/sarfxvYfmHnWUejW5g/Dop1kuHqw0jdr9yhA5Nq?=
 =?us-ascii?Q?ye/F10iySFpN7w5PvGOi3rUjQ3dQVWVrsspEDcuo1vUzkv7NDcMtt4zkK6qw?=
 =?us-ascii?Q?UkMiBdSVWhv68VWERFG3Q182DPJxeCO1qSxutvWYUU/T/PHsh6PQk4nvH72z?=
 =?us-ascii?Q?DUKeefJxz6WkKuKiJcOfQePmoLIUBXlwCV51Wyn0loH9wPgpJEl1d+wJ3Dtz?=
 =?us-ascii?Q?KEyIj9eUAXdKchJeUs6uBYHeQp7Vw+kLFVmAMMbaeugixm+sisFT896Do+WS?=
 =?us-ascii?Q?bdtiFUp0cXNmauv+QFCIOAo1Tz3CUlDCti+MSG5Z69SJdbat2nO6Rc/y1tz5?=
 =?us-ascii?Q?7CqXmwFedEQCGvdOk+bE6KGBapfB8ZekkNdOU4OrEqek2OGMZcSNR6GHEWif?=
 =?us-ascii?Q?eFMxeJj503sXtXh0qG7Bgb8Z0yLPCbkgMj3v81bAXY2QB1wRiIq/0XQMH7li?=
 =?us-ascii?Q?yu7MMnJyn1KKKaEM5sD2gexOK7uuF9tH5duF2UXumZA/IBj7ekEDxrHZc1vJ?=
 =?us-ascii?Q?xauYcrhBGU5CctYvbgE8V6kNnKuk1C3mqwzgYPwaUfdKb+RDgTMRQdygOrKq?=
 =?us-ascii?Q?cdOL34r2xNxIdqu+SrxVizZUhhHokGanKEIv7vtbU7YHn6ATncyyZr8b1EC7?=
 =?us-ascii?Q?UmTU/F5CLZlFl4JFN5e/O3o2YrQXycLngVmCbKckOQOeucX+hLR+8WnEHp6u?=
 =?us-ascii?Q?EYrTSU1jqybVMcIGcUTQlIpIDXdEO7N/GFpnipGGkHCIStKfaso8YimsX5hA?=
 =?us-ascii?Q?4g918jpbV48+berfE5lWfWIsZQOW2MUO0bqt72tzr4e/TvYL3vEV6t0dnhfq?=
 =?us-ascii?Q?cASTDMRzUvBNR5zm7PP4WSW+z43Tw5awJzYjPGXMiqQt116Ks8NG0xrEtg3F?=
 =?us-ascii?Q?UT7muuj1erqgMF/kmrG9GlFtf5LzEhRJXR5NBVLY0SUrc6hSVmtFpWzBNdrC?=
 =?us-ascii?Q?kRydxREUVHp50oBcoDnu6PeUZzepvUjH4KIkSnd43ZHL+Vdca/hAlH7a/jdM?=
 =?us-ascii?Q?HF2eBUeqdqJDhWm7v0eKi1qmTz6Kii/W2Sq/NpVoYgaqJay1ffjyYIgUPKml?=
 =?us-ascii?Q?nt50NuGXK/ZTZsodS4tsicca/T1nquksGrq7EwCu+xOKXFwx/XKjHNrKwNNX?=
 =?us-ascii?Q?or0QabO3Bs5JLz6DdBML0sVJ1F1CmDR1ZkeD+jbb8qtmdwW5pDXTUyABCNCq?=
 =?us-ascii?Q?+ybm2owvJjbMxk67kMinAewzWB64SdeAVIJlBh/eu1tEbcU6Py/BBy8rfF1J?=
 =?us-ascii?Q?4x1rla1hrbKh2apANOUfK86jqN+OvV52aUyHJMRjsK1m5DOoh/eK6x2bVxOc?=
 =?us-ascii?Q?escTa9ttxXAo+Eoz5inLEajGzCQWQmtpdfExz7/bKzYPxGe84ty9A0cQTu7+?=
 =?us-ascii?Q?CdbvNM3mmjzZaBObahLJ73QdW/Whu6ucrLFW+wSYPE8GLfSKs5EWSVLw4PK1?=
 =?us-ascii?Q?tKgxFOVukz/A2A5cQ6unEkevYYhfda3o/7vQ0hDZXDZT6wMx+F/ajcRkQXK8?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb941d0-6bda-4db1-b6fd-08db4698e710
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 20:57:53.2526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IrQ2R2blIscY71Uvnr9JpzjUkxC4MTOdF2Qv2w8XX7+riqL3OC4Xub2G8TPh3RvuISKxtH1OTTfl3lPw6TFDkA==
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

Let's start to move our existent logs to devcoredump one by
one. Any format change should come on follow-up work.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 7 ++++++-
 drivers/gpu/drm/xe/xe_devcoredump_types.h | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 795581c58d90..0e7ec654a9f2 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -12,6 +12,7 @@
 #include "xe_engine.h"
 #include "xe_gt.h"
 #include "xe_guc_ct.h"
+#include "xe_guc_submit.h"
 
 /**
  * DOC: Xe device coredump
@@ -89,6 +90,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 
 	drm_printf(&p, "\n**** GuC CT ****\n");
 	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
+	xe_guc_engine_snapshot_print(coredump->snapshot.ge, &p);
 
 	mutex_unlock(&coredump->lock);
 
@@ -106,6 +108,7 @@ static void xe_devcoredump_free(void *data)
 	mutex_lock(&coredump->lock);
 
 	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
+	xe_guc_engine_snapshot_free(coredump->snapshot.ge);
 
 	coredump->faulty_engine = NULL;
 	drm_info(&coredump_to_xe(coredump)->drm,
@@ -117,13 +120,15 @@ static void xe_devcoredump_free(void *data)
 static void devcoredump_snapshot(struct xe_devcoredump *coredump)
 {
 	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
-	struct xe_guc *guc = engine_to_guc(coredump->faulty_engine);
+	struct xe_engine *e = coredump->faulty_engine;
+	struct xe_guc *guc = engine_to_guc(e);
 
 	lockdep_assert_held(&coredump->lock);
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
 
 	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct);
+	coredump->snapshot.ge = xe_guc_engine_snapshot_capture(e);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 1e44d5346364..e055b266af70 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -27,6 +27,8 @@ struct xe_devcoredump_snapshot {
 	/* GuC snapshots */
 	/** @ct_snapshot: GuC CT snapshot */
 	struct xe_guc_ct_snapshot *ct;
+	/** @ge: Guc Engine snapshot */
+	struct xe_guc_submit_engine_snapshot *ge;
 };
 
 /**
-- 
2.39.2

