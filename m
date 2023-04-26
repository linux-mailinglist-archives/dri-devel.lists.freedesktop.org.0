Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8F86EFC12
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 22:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CAD10E135;
	Wed, 26 Apr 2023 20:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A2D10EA27;
 Wed, 26 Apr 2023 20:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682542695; x=1714078695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=CZ0F39L9qspctKjLyUyWLX6/ddNeNCa5WTb6XFH6CPY=;
 b=F8R8hJIoln/uBaa2HLEysggyxYdivlfPxPyHslHocDjxXlY89ZZMQRPU
 gme8TqHFYt+nbuMxh1ktzU3xKHhvzc1/LeUjVwjcZWpCjgvtrIWByYVJn
 5j9hEsK54JMOp2YBCIPnDtJ6AwQWXtwak7FNKYaq87u40B+0yZEAY72tA
 +05nAbbn6nJBcc8WCpQsTd9BV8yG4pNQ1nVDKFzx8Wxa+uy7LIZ9ROjxx
 FGc4oCy7jqsw6k0vicmXLMr8A9oTkZiPZr7EzA7z3BVM3pwNO7q4lUs7c
 60nJAY/QoU+mjedDeA2iQLIIV/GYQUaYCG9PKPitZumHLHh1/XOuVTumr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="375203780"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="375203780"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 13:58:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="688105314"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="688105314"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 26 Apr 2023 13:58:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 13:58:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 13:58:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 13:58:02 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 13:58:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bV+t+44GmKKG+Z8EySQ7rHMJVOlMpUQwu+581Iwdj+EhfNIKtotyl90VXqd5z8O2E36nYKtYESD3MgFoLRhjohT9lmF9wO7NWa/+BcL6a00HROi/Nn84r99qvvJvsLtHhadP2fdADnWu9RtrncDpq0aGtFKvnVcUiB4iFBhAZXgL1hto5X6cRXwcgt7pxJnHU7q3sHkRKdiP8HAuPHi7J5bt8CcBZTaLVvY9qMuxGUSe7Q2pi8td1wn0wFICYdKDaENyc2em2Y2eCRCqDX1Rq2BQAT0QinnskG61w61lR3SivGfTH4ZiWlwQdIt6kbtuzAPvx0aGl5v3pY8R8KqorA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4eyZ1NSRMJdSiTRaliz7l/a1+bEQUzqnnZ351kLvJw=;
 b=aad6/zO0Dg7QEclKOysCS4h3zWIbTOPtEED+g4MutuA4XS49NWBCzNkqWqHkBdzxQqIHFBtjB7fqzqb1Sgg8ntlDohFhoHdntMa3v4aELhC4TStg3sebsl3TMdxQJaQBaPonDXefuKwSv1/VqouKZkmGC8qfqOJBhpSAKy0gF1iLG+p7NPhN08ZKR6KXnP+CFV3E1gDlce0uu7q0OZrq+e8Q1gcbBZtYw3SPn51wmjLZB23xzTGhjJKuKzbtl87G/SPPRkauViCE8PMgLMvkiwcKDDJl3t0wfhr5JFyGWaPNrRidt7EO7rzzwBWK9j8nRoCkRUglia/isL3Gphvpyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6343.namprd11.prod.outlook.com (2603:10b6:930:3c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Wed, 26 Apr
 2023 20:58:01 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 20:58:00 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 11/14] drm/xe: Add HW Engine snapshot to xe_devcoredump.
Date: Wed, 26 Apr 2023 16:57:10 -0400
Message-ID: <20230426205713.512695-12-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230426205713.512695-1-rodrigo.vivi@intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0065.prod.exchangelabs.com (2603:10b6:a03:94::42)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: 32bee399-f1ea-49dc-4afd-08db4698ebaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z9HyhuhPswA6LIQ4/w5AMNrBwB+yiL0bvCS19O1Lqld9AoeMhbNVudjk+ydqKbcXFImWmJH65pw2xymg8VejtRgFrVkSA1CtmAM5M8Men2JVSotyIyhf3obOUmXj9YJ2lr85VqpYaEmc1ZF+rTNi2BkAdL/ixP5q16ueHmvyGrRjqrCueqlybuqgnSNkcmCP/EpsxQ3z1ter7c88w/UQf1zMXcePpg0ktMhheWDGYgOSJxc0r34ttdM8oIOoXU5RVKp58B9/mvRzdFI91UV/ATuoHaAeT9hcLL6OoK1vSS6PYy5hBVYZLSicalzZ9Wp8vkitn6ajrquO3ZC0gBU3s+Ey1GSp5uWopyuzAU2vW7DsInJjzbA1ON3hk0BX81zN9CCEnu1+TqVgA55ntoCNs3PJhDK+qnKIVLAfIG3V/95JNYEVvDDninmC5MsrJdtTNtikh8RrVPg2qRvBh+J/Ij4Z+N5v1dowqbMybR6WV4OMDiDDfLPu7YaCG9wzy8KPw8q6DNyKIPkJJEu1S4AznpMWSBRRl34uOgsMW0PSTwCWa9R45+yZeeV4m1NUA+Py
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(396003)(39860400002)(366004)(136003)(451199021)(83380400001)(450100002)(107886003)(478600001)(2616005)(1076003)(6506007)(26005)(186003)(6512007)(6486002)(5660300002)(44832011)(36756003)(82960400001)(66946007)(2906002)(38100700002)(41300700001)(86362001)(66556008)(66476007)(4326008)(6916009)(8676002)(8936002)(316002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DIan2MvQwZOu9VFsW9TEhiTD9Xss8yOw5AxW2QuIBqayfpROTpKVFbI2GLYB?=
 =?us-ascii?Q?0FESTs6YpQehueZo1AHJZ0T+mL40upcef7TTw2K6mQQ3YKI0unKu4hKZYXxL?=
 =?us-ascii?Q?Ei1XySk5SGG8hSXzti3FbaiQh5jfWgAhnphvjnM2tf3uRjYQ9GFO5UuRinlN?=
 =?us-ascii?Q?SSrOxwy+dCmJ6sXq5tSXKmpsbGtbDJrOlxu4U+qD3eW3uT8ik/5wGzREAoUQ?=
 =?us-ascii?Q?M5Qp1kv9VgPt5QWSxPrOwwfUceAhY65AqYcJONzOYVi6As7Q8h1vVgDwC6HW?=
 =?us-ascii?Q?HfWePON9XoSkQ48fXKXC7Sd0x1dt6Et7OuByJhBpmMDPksJq+jgXe2QEp3z5?=
 =?us-ascii?Q?1QelbjFLlUBmIyiZMxdznR7i7pLORhH5EwJCx9KMOe54hAi8Tiw2z0hspNqd?=
 =?us-ascii?Q?+ryveRfCCLXhpwTaLKsgDqH9H1RqdJQ2Q0039ZB3sjuU5p7vd3W6qo2VVDp2?=
 =?us-ascii?Q?Jf/VDyi5iKAvWfCiiXwKtwRHPcWlV0b4emrD3CNqcoyFbKAtd6+YKP77Ep1y?=
 =?us-ascii?Q?PfYp8HFUF3mKCODPz4olF/0gcGXLSG7qLY7w05kVvqTuEbr/3xBaDFcsF36V?=
 =?us-ascii?Q?T8MwxXIs58h/cAsILD891oXCU9WzujkZ+V4IyZR17gTh6k0JIBdKzw9A31Dh?=
 =?us-ascii?Q?5sH4BVO2zO0WLyiLvE+j31QT/JjPX11ebQ6sgyb6LCVt3dl2BG9+xj8K2hAP?=
 =?us-ascii?Q?xOOoWds+vZDS/Ln7FQwuiLZskWwpS27C4utlAAZPiNrrNR6ZHS1ibd258ARp?=
 =?us-ascii?Q?EZmTpxG77KIfiX52EIJM51sJAsko6jw3kn+MufCQJq6QlkNH53Z4jPbqHfP/?=
 =?us-ascii?Q?J8Swd4mfvUpUFVmaW+UimTaLM9wlHmzISMtM0fgblf9C0HT6nPURaT3Ge1vB?=
 =?us-ascii?Q?yjnKtA+yY00SqDsO0CJ7GyARhFzhqHSKWVMCWyON0ocQd43skiVL4PR8r3Sv?=
 =?us-ascii?Q?y28tNbfx48BP3S/0MOksMRUAxXAa475/oD2+TW4HxReRpa5OV6oJZ3pG3Rct?=
 =?us-ascii?Q?PTaFkbTYONPF0Y+LVqvxHOsNB8+nKOIkY7IC2J9BaCZEWJu9HUN27mof1rzZ?=
 =?us-ascii?Q?MUlezNOsKw9deCCgvlXQ0zGRM8n+Xk420H+GgSXz9DtDaH6GMpfXsRi4BJ+6?=
 =?us-ascii?Q?ucpCRDSLgF2TkeZL414EOH/Jx+v/XrNKlMyV48rNJX3LqmkiPkigJGUxDVxn?=
 =?us-ascii?Q?zfiLT/s1etF074uNdR9bHbNKwi8nAYpabqMH5CKrJlX8BXncEvTENRCHf0VG?=
 =?us-ascii?Q?TnMKX6eS8thU9HCnZC1sSSQzds/fh34J6Lk3rebiWrLwrccoqbN+I4f7ZNCh?=
 =?us-ascii?Q?3X4v/kwq5+r9xeM5zWjLDiCOy/9EZcovx2c4+jMhdrCw+80JrGxjhIFb9XBj?=
 =?us-ascii?Q?NzywmopsyU6DTjvuz1iv2MhjDuHcKsqhRBUFr53R3l3jkRIThFaGi9YQd0Nz?=
 =?us-ascii?Q?cjy4iPa8r6UNmb+B017TF3foEENu1ZN67hisJOWynJm/tPQzeEjtYDSEld7h?=
 =?us-ascii?Q?OnCOlkBO0BCotfaNdYjMu3w8C53LFuWw7SxBTnLKrT3aPWzuTtZ0459RWK+n?=
 =?us-ascii?Q?X7wDL68JkIQlo/77tYSeoqaNaOJztJjIDfku9ZNFtDWcvFMzw+2vnyBEeeBm?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32bee399-f1ea-49dc-4afd-08db4698ebaa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 20:58:00.8577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FgFzMG7If2SKTlxNmGZ57LlLA/qhhjM68Re28tKEH87z6LI0DOk+aAHtvfuqCuXZxGeGcdJAap46+LFT2k6tUA==
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

Let's continue to add our existent simple logs to devcoredump one
by one. Any format change should come on follow-up work.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 45 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 ++
 2 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 0e7ec654a9f2..1ffd12646a99 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -9,10 +9,13 @@
 #include <linux/devcoredump.h>
 #include <generated/utsrelease.h>
 
+#include "xe_device.h"
 #include "xe_engine.h"
+#include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_submit.h"
+#include "xe_hw_engine.h"
 
 /**
  * DOC: Xe device coredump
@@ -62,6 +65,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	struct drm_printer p;
 	struct drm_print_iterator iter;
 	struct timespec64 ts;
+	struct xe_engine *e;
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
 
 	/* Our device is gone already... */
 	if (!data || !coredump_to_xe(coredump))
@@ -75,6 +81,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	mutex_lock(&coredump->lock);
 
 	ss = &coredump->snapshot;
+	e = coredump->faulty_engine;
 	p = drm_coredump_printer(&iter);
 
 	drm_printf(&p, "**** Xe Device Coredump ****\n");
@@ -92,6 +99,10 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
 	xe_guc_engine_snapshot_print(coredump->snapshot.ge, &p);
 
+	drm_printf(&p, "\n**** HW Engines ****\n");
+	for_each_hw_engine(hwe, e->gt, id)
+		xe_hw_engine_snapshot_print(coredump->snapshot.hwe[id], &p);
+
 	mutex_unlock(&coredump->lock);
 
 	return count - iter.remain;
@@ -100,6 +111,8 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 static void xe_devcoredump_free(void *data)
 {
 	struct xe_devcoredump *coredump = data;
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
 
 	/* Our device is gone. Nothing to do... */
 	if (!data || !coredump_to_xe(coredump))
@@ -109,6 +122,8 @@ static void xe_devcoredump_free(void *data)
 
 	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
 	xe_guc_engine_snapshot_free(coredump->snapshot.ge);
+	for_each_hw_engine(hwe, coredump->faulty_engine->gt, id)
+		xe_hw_engine_snapshot_free(coredump->snapshot.hwe[id]);
 
 	coredump->faulty_engine = NULL;
 	drm_info(&coredump_to_xe(coredump)->drm,
@@ -122,13 +137,43 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump)
 	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
 	struct xe_engine *e = coredump->faulty_engine;
 	struct xe_guc *guc = engine_to_guc(e);
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+	u32 adj_logical_mask = e->logical_mask;
+	u32 width_mask = (0x1 << e->width) - 1;
+	int i;
+	bool cookie;
 
 	lockdep_assert_held(&coredump->lock);
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
 
+	cookie = dma_fence_begin_signalling();
+	for (i = 0; e->width > 1 && i < XE_HW_ENGINE_MAX_INSTANCE;) {
+		if (adj_logical_mask & BIT(i)) {
+			adj_logical_mask |= width_mask << i;
+			i += e->width;
+		} else {
+			++i;
+		}
+	}
+
+	xe_force_wake_get(gt_to_fw(e->gt), XE_FORCEWAKE_ALL);
+
 	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct);
 	coredump->snapshot.ge = xe_guc_engine_snapshot_capture(e);
+
+	for_each_hw_engine(hwe, e->gt, id) {
+		if (hwe->class != e->hwe->class ||
+		    !(BIT(hwe->logical_instance) & adj_logical_mask)) {
+			coredump->snapshot.hwe[id] = NULL;
+			continue;
+		}
+		coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe);
+	}
+
+	xe_force_wake_put(gt_to_fw(e->gt), XE_FORCEWAKE_ALL);
+	dma_fence_end_signalling(cookie);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index e055b266af70..8b17ecf1b6e6 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -9,6 +9,8 @@
 #include <linux/ktime.h>
 #include <linux/mutex.h>
 
+#include "xe_hw_engine_types.h"
+
 struct xe_device;
 
 /**
@@ -29,6 +31,8 @@ struct xe_devcoredump_snapshot {
 	struct xe_guc_ct_snapshot *ct;
 	/** @ge: Guc Engine snapshot */
 	struct xe_guc_submit_engine_snapshot *ge;
+	/** @hwe: HW Engine snapshot array */
+	struct xe_hw_engine_snapshot *hwe[XE_NUM_HW_ENGINES];
 };
 
 /**
-- 
2.39.2

