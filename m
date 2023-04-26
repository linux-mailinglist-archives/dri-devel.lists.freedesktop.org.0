Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A586EFC0A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 22:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115DC10E571;
	Wed, 26 Apr 2023 20:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB98610E143;
 Wed, 26 Apr 2023 20:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682542670; x=1714078670;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8tCEhFU8D5egYLjxV8SkHwfENznd/1VsDrNDjG/bdJI=;
 b=OLB2jK/MKTDggEa3r42GF8qgOq+OM67TEZvih9EKxD4gDLJ3KNp7tXnw
 5K3+qAtCIYAJjK6YfYyEPOqiHSFZ3oMWHSaKmkKOf59BRNHypWU0QZd6r
 LoZDt9fbhSgSL4l14zYiy9KC85Qb+WRFajVCIk2UekVud/7TJNMyT8Sxj
 wsNllGMzh0jty0WHHxxKYzFOVa4gkbO/tEVzgjJUmA2k9CCvIU9Q9vg3D
 ouAUWs32+0rQpFevyACa9OWgB1H5qYM8W0XLYxMLiANbz1L1zUD+/1E3r
 tswVNWpjQ+6HURdvM/tugtaPX2ovJ6FqXsjmoJaMBivCmZuQyiU35fZ5z w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="375203577"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="375203577"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 13:57:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="688105128"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="688105128"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 26 Apr 2023 13:57:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 13:57:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 13:57:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 13:57:49 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 13:57:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFYQOtpKnjcUtHKBVRcicQ3tfCZJ53qtJ7pyxuaUQfkt5x1MPRNbFpTbnZlZ1TGi+TE0HSv0zNd3tO9PZn7AcAoRQDu9c3wnLA2jYa1bo714lj6cZ43nLOZnmuAmYsfJvDY8cS8YhdIwbAsst525lNUXkKDKIhpXjRZZKN5w7/abJxKcIANAKONv8GKc7EWMil1CxyoRadrCucsefppN9te0YDl+inXrrRHno0iLnSSTT41XB8DtkPZr/4z30f1KUC99r4sDQ3RW3jfkTKKCysObprzslCSor8XI3N6f/chwoOx6NWTEZ6dEp/iGe/MDTsRSwqI/951twWvC7B4vRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1U3zlc4pimNxypxFQFNkYa9cSpwZdaNzYZ/aGWyvRWs=;
 b=OfwwXSy0oXC1H6x9OWa75jtYcOwxGhx3i9nv34gyOO2WjFAmAGqZj2fHbwytoJLlRiLLVFd8GaKgkQBgPN/2DzxCeTTPtoCwN2gDBywxZEzZeAu4LYvKY3fzSpEYY5xXENgwUc5imiQAZGRcV5tqubFiquwdsrkfKYObqOZy2cfJDaIVnEqXbA5eKofRxxlUm1wBoJGP5LoP9g9kOneAdlbXgbLl65eohfrpBTSfVVrC/hNZ5gg2yyYdoKFz57xyqUO49CNWshEReG5dNrTI9xEPGNG5/rQAzKqf5pI1q+Ugc39dFGka5r8gDcSyKpM2uHYts+qHz7qZ30ahkftcOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6343.namprd11.prod.outlook.com (2603:10b6:930:3c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Wed, 26 Apr
 2023 20:57:42 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 20:57:42 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 06/14] drm/xe: Add GuC CT snapshot to xe_devcoredump.
Date: Wed, 26 Apr 2023 16:57:05 -0400
Message-ID: <20230426205713.512695-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230426205713.512695-1-rodrigo.vivi@intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0051.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: d3e1f501-7a88-4ad1-2f83-08db4698e042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zUAaa42Mho5WXQQ0etk4hbKqXlFDwkJe6K64UBo4b7CyFeEawGv/+4nVNEDtHwkwset5uZFWvqzD+Czz38QUcci6N+BIW1L17QkVhHloWrbCFG7LDrdLsg3OytTp9GmqLPx+ukyiuZ5e0xsxmyitzLkA+Ine/4mpXVAlLhc45w7WruAn3sUh02d2httVJowK9ctpwbzyDTbL3yvG1dEYf0Y/hd9RXZuNYBusCi9UpTnRJ1bjfQnA8uSMphObKoF57P0r/3d/AFyGBE9Xb9KXX7/JqfH9bpfJTxSHEZtOrfianR2VoGkDcyFywWK7pfxjKMhfzD8j4vku4MM/f6yrGkJAo4ueITCCzwmnra7IRKft2jZUjx6//mnbsguRGAfLK75W2kZoZ9Yl69qaDRIC7+GhI4NSo4WbBTZ+NL6EVnGoHKPLA/LkTHme0ESrXJ5iGjhTICb4f813jz7scpC0YPIxdUN0oLQNbvxdQx6SPB3rGHbalOYGQq6TqN6tLN3rOsVzjD7ZPBzqpUZ09Yv+AbcxJkgW7L5xhS3LxA+eDfZtv1JA5UO/qgJ/cleYBou5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(396003)(39860400002)(366004)(136003)(451199021)(83380400001)(450100002)(107886003)(478600001)(2616005)(1076003)(6506007)(26005)(186003)(6512007)(6486002)(5660300002)(44832011)(36756003)(82960400001)(66946007)(2906002)(38100700002)(41300700001)(86362001)(66556008)(66476007)(4326008)(6916009)(8676002)(8936002)(316002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n0WE+bTsTUa2JDkzLwvd0JDbqCvFaEbGgKQSzxJJq5V/M5ChC8GNUJn91MOw?=
 =?us-ascii?Q?pKnts99hFjy8lbZ1lsxnTmvNCSgJx8qPg9Ph2BA67BQaC/tU8UNQQSyBdsNJ?=
 =?us-ascii?Q?pKME2tIyKB6rRfMUqXIf2V32LCvTGGiANcHzsklWFhgrVchPIQnVivRY0dZH?=
 =?us-ascii?Q?F8PnxzYC7SxaCyBv0M0I82vWm8izLcWldH3YyNEYHDCQZJAVUMIZASa9dh5O?=
 =?us-ascii?Q?Xf/m+rjJXSN8EBs85UU21afqsDX1MMqo+U7FNPFVsrs313j9dOW3dbhXopyl?=
 =?us-ascii?Q?ZbP3YQ8Id7NtbA0fWr0MlnPsTGTDFaonGpAZmBOJFRgPshETqBnuAqRGPa23?=
 =?us-ascii?Q?frlUlF2mu5KECYgncI9xVbYZrYe/Llv+hxSINWUQzY6xfldBxU/wixTCZ9gN?=
 =?us-ascii?Q?b0qj9meE2yUCmdAyAqN3nqYhOvsWmwi2BcKcwAdOn8FMLn+RI+Y37yiMDHA0?=
 =?us-ascii?Q?T4PLUN3VvjsTgXpV3PsVi9N9ENRzlrPytxjz1R4i7wUsXiUprqtxWXnKoYAy?=
 =?us-ascii?Q?WvZHgfYRIcUFuB9gBFWT60EXIZaz1HC0WlyfIPGZ0lwTCwoQzEzHjSwvcBcR?=
 =?us-ascii?Q?hEHT3qsrHhPnKoRhvCE0U0xd93V6Q549I8Cqyv4/IFtGfp6KvSFDY9RVGEWc?=
 =?us-ascii?Q?CCE5CMX82GurZ1pLLZi30Y0+V8axeckLOLUqIe5Fv7kGw2ZCrlHcT8wbvZip?=
 =?us-ascii?Q?4NGNKUzTuBvvZgT0Kzjq8vLMnbDsKLeYLlT3BjqP1W0IQSx54QvIetTS6Xp+?=
 =?us-ascii?Q?6yb6ioj9Y+ygZ8Wl+q++vald5WqQim/wnHytCqrVP2s7xDccRO5O1mXl7PA4?=
 =?us-ascii?Q?67Z0BF2WqvJ0jxLT7uQ3qQVWg2yTsDlFOH+2MyeZnVaXMat/p/qNnEeYbc3E?=
 =?us-ascii?Q?gKpRc5QqTqANBLBjLvG16Jd1uRsHb0ZmKLPk54IcMJDjo86i9XLbhAjwmrs1?=
 =?us-ascii?Q?FZGrda8MZCwj4VEX3NshnDV1YtJyFLlFEiUsURe80kkK4G/tr6Sor0Xujw04?=
 =?us-ascii?Q?e6UwdpomB48o7S4L7nNPrk+kReZjG2JRF3wnScC3dawYPXdASdr4hL3YkiKn?=
 =?us-ascii?Q?SDSD8q5G1m1R+IT1pAgIDvWnMgJcfpzkprbK/MCuwM30a0jv3rrQgmZ9jOfV?=
 =?us-ascii?Q?bqX66GgHrq3TwLai9r6/RQxCiOCKnnkCh9dHlgAjzu8INDN57sOuVZayb+MI?=
 =?us-ascii?Q?7vMPuZzlwjDfovGrAAHce4LMMSA7+j25aBglw1I5FtiRdGz8FJ4TK7b7CS9J?=
 =?us-ascii?Q?Ej3O6L6PZ3B4zC8oriQZn2O+8Dv4VdE/Ib5i9G4/Ggx4s0HMHFfMHnlqdhLy?=
 =?us-ascii?Q?CL6HPZhxU2AXaMDCncZ9pciIhhRD/te6vjbimLt4enewMfaL7n6ARYXCxyLm?=
 =?us-ascii?Q?RegABaj5cW/1cQ3YeO4QoIe9xanUf72FcnuTuRreaaBBMGHM4l1irXAqNCRR?=
 =?us-ascii?Q?ydO2WUdFKAeGB7zq3HFybENJ32KWEy0F/FKPLZdR9SgyBfrJ1mlNSj9Sr0I7?=
 =?us-ascii?Q?kWvUGmnV9Pa+v0Q53LPBcZkWHmXEpzdYNpZ4T7Ea8wJtotRTYe7M69D59PEu?=
 =?us-ascii?Q?Cse+kppivxRPFuMfC6Sn+h8cYisCs1LVpzh/gg3vvUbxIpnrOttColAHX7wc?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e1f501-7a88-4ad1-2f83-08db4698e042
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 20:57:42.1204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqA9/Replcw6qeOKh4KKzF6JcP5Sp0it1Mb2lozTN0ds4mGie0VVGvxSDA0X2thEhBKepXy7goJ30bDLcslGXg==
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
 drivers/gpu/drm/xe/xe_devcoredump.c       | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index a08929c01b75..795581c58d90 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -11,6 +11,7 @@
 
 #include "xe_engine.h"
 #include "xe_gt.h"
+#include "xe_guc_ct.h"
 
 /**
  * DOC: Xe device coredump
@@ -47,6 +48,11 @@ static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
 	return container_of(coredump, struct xe_device, devcoredump);
 }
 
+static struct xe_guc *engine_to_guc(struct xe_engine *e)
+{
+	return &e->gt->uc.guc;
+}
+
 static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 				   size_t count, void *data, size_t datalen)
 {
@@ -81,6 +87,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	ts = ktime_to_timespec64(ktime_sub(ss->snapshot_time, ss->boot_time));
 	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
 
+	drm_printf(&p, "\n**** GuC CT ****\n");
+	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
+
 	mutex_unlock(&coredump->lock);
 
 	return count - iter.remain;
@@ -96,6 +105,8 @@ static void xe_devcoredump_free(void *data)
 
 	mutex_lock(&coredump->lock);
 
+	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
+
 	coredump->faulty_engine = NULL;
 	drm_info(&coredump_to_xe(coredump)->drm,
 		 "Xe device coredump has been deleted.\n");
@@ -106,10 +117,13 @@ static void xe_devcoredump_free(void *data)
 static void devcoredump_snapshot(struct xe_devcoredump *coredump)
 {
 	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
+	struct xe_guc *guc = engine_to_guc(coredump->faulty_engine);
 
 	lockdep_assert_held(&coredump->lock);
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
+
+	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 3f395fa9104e..1e44d5346364 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -23,6 +23,10 @@ struct xe_devcoredump_snapshot {
 	ktime_t snapshot_time;
 	/** @boot_time:  Relative boot time so the uptime can be calculated. */
 	ktime_t boot_time;
+
+	/* GuC snapshots */
+	/** @ct_snapshot: GuC CT snapshot */
+	struct xe_guc_ct_snapshot *ct;
 };
 
 /**
-- 
2.39.2

