Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AE36EFC0B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 22:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D25D10E689;
	Wed, 26 Apr 2023 20:57:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D4F10E143;
 Wed, 26 Apr 2023 20:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682542671; x=1714078671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ts+9q166jJloFKnnplj6KfEZLA+xJFyjE1FQkWXoCfg=;
 b=W7F9zxagFQvdhdLZinJ7+SyiBBNlYnMjBGqrpnZcd9goL03y+T7nD9hS
 BFGO2i59TwPjN8Ts9xyv3yNn/YfBenZSNsYeVMmmYwtxJiSIuedT9uyGG
 DcT9+1Z+aFdrbl+KRZjppmHI8PHTaDq9anoOJXfyncN74MC9mqPiMJ7pY
 pJ57xtNjkMk8V1j/chyZbBC+gQmiDQjuP8iFxt4o+EkiIbHxY/HlFUgS6
 GrK6ZEUMWKD1+frwE4f8v+erY2VIg4jGCPNE5sXm57DddTf08F9PPrORZ
 ZF7Z48p4cutJMnb3aWSiF3El4HgxB8+AeUkFiQwe6tnm+ubVzIUD1HNGM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="336158336"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="336158336"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 13:57:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="838081044"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="838081044"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 26 Apr 2023 13:57:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 13:57:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 13:57:49 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 13:57:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcIKZgoNYUf8fVlvuvc3P5gWeBFaJeVsvZoCx+0ITP5sk3ga6bGEg+3E9jekYasvybC+pVIv9kQNcJd1FAR5COruw7YquUQ9G+SQYeug6IYLscQg5F/t25g2Wc6jMtqjZdoL/LqOocYEZYbAVDEfL5k8e3nPJsp6lqwRATozUj6Z8uNShgS0Fbd3BGLZ6VvGB49P+w0aWctHVk8DDOzg+8ycSzGSwFfhK/nhveKn8ezRUF7Q3XGpJR2zSMjxjyUrOrJuTZeXiju2qLUxb4RoCZx6g7C/hAFb4tzMhdm+akJdfXsbvhLNVDYhuZUyHP/r8NRxyozes0d7m98uHiBTuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knQtoMCnlhQRuX0EFU/xq3+L+bDrHdF5CvgfMZxH+3o=;
 b=V6oQVsO7V9gwBA7BVcmS/VrV64pElZ8lFsmcfIi8lSJHnPGlhkHDVXrJXV2MQ+nksUJO9vj1drXhu/EZCkuHZ/9jGN0k6jO88d4EqOV6s3gHy0Wl1nbhfO2PSnFMabW1H2djbJZCsTwp+/ODleQV6tycudCIpMk52x7ntLmG/0uFejOib0f5Qtepj3yy68ecnDSH4KqUlkzxI2y5JCKGj2bZwK1h9lAKw4bxksjo5Ne7uS1P9IoT/ZUmGxAxd2oDWtSoR6isxwSl1ZIUrJxtFiE9I0Y5OIeVUde3rxk/JCckWjyqCLuiXdfshaKDDuqiGXy+CCrwt5ZAe66PoPNcrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6343.namprd11.prod.outlook.com (2603:10b6:930:3c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Wed, 26 Apr
 2023 20:57:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 20:57:45 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 07/14] drm/xe: Introduce guc_submit_types.h with relevant
 structs.
Date: Wed, 26 Apr 2023 16:57:06 -0400
Message-ID: <20230426205713.512695-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230426205713.512695-1-rodrigo.vivi@intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0054.prod.exchangelabs.com (2603:10b6:a03:94::31)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bb9a13a-98e0-4281-a92c-08db4698e29f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a0aU2TnwKev9qL3NAfZJcbEvOkMZp1sPiC5kGzYKHG5aiifpLdBeU3V6/QCar+P9Wk7neUcjxGVBwuEbdypAs8ylLOtZQWwRO4vjqbNMjplgL4PRV68RKzYX/Ic/HqJ8s8Z6doPnCY7OefTpPtYeMuvkKC4IRE54+PP6Prm0rLiciZoQkQM1hVcHvhMG5CAwuo25oN6sdpqoKvAC3UHSjF1mZw8KZ603blzmN5zVTZUcq3VlpUjRmdlJtT9xZmfbmENCkVtfQDAMPTLSXWQsnVs1r0cHDMnZVOR+B4Rv2blyX3mICGi29eCZ9srrDd4Xp1NRn8lI10RPR8yi0t3otEy6TDrJPudagC+IQDEyZOCeZspevhMr9ss6Fkeb6hoedJlwjDywXYXbOeS2Z6ZeEuZx35coIjCuhB8LkXYIoCeTDAkLZsJA0z/CItoWaxuuj77aHFmgA6FGaeTzoByu34MaQT9k7hz+rmU9UM7I7py84yBRdsghJGpf0GW5hCkYymXQwO4EgcV62vKwDoTjObOsVPkY0SY9IFKzIQfo+myTzzcL6k1YTomso2W7BWaZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(396003)(39860400002)(366004)(136003)(451199021)(83380400001)(450100002)(107886003)(478600001)(2616005)(1076003)(6506007)(26005)(186003)(54906003)(6512007)(6486002)(5660300002)(44832011)(36756003)(82960400001)(66946007)(2906002)(38100700002)(41300700001)(86362001)(66556008)(66476007)(4326008)(6916009)(8676002)(8936002)(316002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1V0aDVVM0JsQWh6bm9JdDNZR3UweGJEODhXcjZCb1ZuUUlranZaUjJKbjZK?=
 =?utf-8?B?d1BIOW1vL29rRUFRN2xTRVdpdDV4L0twV0JPQXdNUmtJR0lzdlorZ2Q2Q2lr?=
 =?utf-8?B?dXJ5cytCMy9kOVNBanhKeWVzZU9jclBwUkVxRUdhOUo2ZU52RjVtc0V3VEVo?=
 =?utf-8?B?d1JkcndURFV5YTJ1cXFVZEtoL08vcTRhbXZTcTJuUmQvVHlIZW5zN0NmOGMr?=
 =?utf-8?B?ZWFNaWd6clpRbE8rTnQ3WjRZVlV5cUZTdkx4dDVrUUhySjh2eFBpUDFyUVJ5?=
 =?utf-8?B?MkloV1IvVStQd3FLUVdZbTlRSDdTdHlZbUtqOWpTZUxtYjVkOWFLb1RFQ0tQ?=
 =?utf-8?B?K0pRa0EzWm1QQlFiaDdzOHF0a1NEZkZ4N2IraXh4YzJQbWkySWZzcXpZbUQv?=
 =?utf-8?B?N20zQzVJdkYwMGoycVdDWnZ2NEpCZVNwamt6cWxsdG5iQ0dGa2FGcGY4NUp2?=
 =?utf-8?B?T1QvVkNPSEpnQjIyOU51NDBRNEEzWE9xYTI1MnVMR3E5b2xuU2tsRHY2cGxF?=
 =?utf-8?B?UXYxTHV2bkZtbWx0RmFISFhMUTFrb3l0R2s1ZTdaeVgwdmNaSklJRkgrY296?=
 =?utf-8?B?YitJdWFjTDd5aXV6UFNpY3hJSk1lekZPRFdNR3JQQ2FwMEtPbmZOQ25YdzN6?=
 =?utf-8?B?RWM1dWNiM3FucVA5SHZ1OVluUUlLd3M1aFlVRVpVR1lJWktzUUN0Vm1zRENQ?=
 =?utf-8?B?L3l2elhUNm1GenhwdVk4UitkME9FMXRFRmdjMU40dlhkTTlnWHN0eHljR2xC?=
 =?utf-8?B?emRucU41eEVpL0lETURIWDljOUtIR1lQcHVmSWxkdWxrUmw0LzVSb2IxZkVL?=
 =?utf-8?B?T0NGYy9zOFd3cFlsS2hQZEdnaGhjOHdQV3dDMWNxM2JyTzdmMGdEVzk1ZWxs?=
 =?utf-8?B?MW1pWitsRlJWZ2VqYlNST01NNmU4eDV6clNubFJId2tMeWwwRUlPRmhoOG9L?=
 =?utf-8?B?MEdRd280VCt2eXF6czRXVkhjamRWczFhaWQxZnZpUWg3TmpYdzZoZWpKeFpZ?=
 =?utf-8?B?MllQK2VlclY3SkVJK004azd4RkpnVHpjenN6SEh6TUZkMGNHUklsN205b1VS?=
 =?utf-8?B?NFZDOXUvbEZpZTZWNjFuWFNaZVE4ZGExMHdaQU1hY3A1ZHNIUkxJeUhtYUlT?=
 =?utf-8?B?YUpCam80Z0N5TU5SKzZNZ2FwTDNQQVdqVWhERksyQkd4anlzL0JtQXd6aTZi?=
 =?utf-8?B?bmJlZTVDRjNidEh6eHRpNG5jRlcyZnNyb0hndm9YN01wMWZHTW5jZElZQ0N6?=
 =?utf-8?B?OFlVWkhYUUdPV3A0VXB4VUo0NkRWcXVFbUtaNlVtdUhJNldJQ3NITXg3Ryto?=
 =?utf-8?B?WFNEMGQ5WUdmU2Znc0RqK1ZXSWt6VENhM1ZTeTdFV2J0bnFFTG9tVSt5OUxh?=
 =?utf-8?B?N3dRcnFpbythTlRrZDQwZitUQUw1a0oza01xcVFZOUUzRU04Y2YxemsyeW5L?=
 =?utf-8?B?YTNqdjdtLzVLc0xPUDVhY3c4b2lJZnp1WEx5Q1pMUHJ3dFpFS2xWc3QvYzBO?=
 =?utf-8?B?WnZGUnJJbUduY05hbDZFTkQveTZrTzFGMWVKK2tWcGNrYVlYYXNmRVFQV0Jn?=
 =?utf-8?B?Y05jbUZVQzY5VWkwTzhTc0lqM09Lc1h1eWpIU2M0OVJtQ043UmtkcTMvS0dp?=
 =?utf-8?B?L2Z0NCt5NWJpbHg1VGU1NkJzdTErTTJGUGszUktCQ1JYWklpNE1zSkF3SEZk?=
 =?utf-8?B?S1VLZGVIMTdlbk1WTFJibXE2WFhlaTF5c1gyNU9YVjdXSVJ1dFROM3JXZzlp?=
 =?utf-8?B?c1FUZHpkSUNhQlNCUVVITGJPZTQxTzRMSU9VWmJhTGtXT0ZjeHJPZkFCdm5x?=
 =?utf-8?B?OU1yRStRUUQ0K2RhNkFCM0w0UmZ1Z2FUUUtGR3VZSW1FekEzTzlqWHYwWjJp?=
 =?utf-8?B?RTlTejU3ekRWd0xYRWs1R3I1Y0QvQk9WUkE2MXdnb3BFWDRNdU0ybEtJQVdm?=
 =?utf-8?B?YVBOTDMxZzIwS1M3eHJaTXBxc2EyenNxQVdEUTdtdFAwRmdRQlJWVjRWdHlo?=
 =?utf-8?B?elRZL3FVbFkzelc2S09qS3hoZEJoVkR4VHNsVjgveTRKSzBKWVo3OHVDcGVS?=
 =?utf-8?B?K1kySVVzZ2hKeG5kVUsrcTJKUnBIMURDL2ZrZEZ5SGM4cUR3OUEycjI0Q0l3?=
 =?utf-8?B?S3dWbmdRVTdTcWxXSUE5U0c0cDl2Z08ybUJQQVhrQUhaQTFzWUdHdExkdUYw?=
 =?utf-8?B?RGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb9a13a-98e0-4281-a92c-08db4698e29f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 20:57:45.6626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vwtDdOSnAVpxF0fqyGb43KzQomCzfylCCZe5KOuIHwl6COtrK7GuZ9OmUEGGd9UMw48aQQ438CY8hZ8f3hDu/w==
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
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These structs and definitions are only used for the guc_submit
and they were added specifically for the parallel submission.

While doing that also delete the unused struct guc_wq_item.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_fwif.h         | 29 -----------
 drivers/gpu/drm/xe/xe_guc_submit.c       | 40 ++++-----------
 drivers/gpu/drm/xe/xe_guc_submit_types.h | 64 ++++++++++++++++++++++++
 3 files changed, 75 insertions(+), 58 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_submit_types.h

diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 20155ba4ef07..27d132ce2087 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -46,35 +46,6 @@
 #define GUC_MAX_ENGINE_CLASSES		16
 #define GUC_MAX_INSTANCES_PER_CLASS	32
 
-/* Work item for submitting workloads into work queue of GuC. */
-#define WQ_STATUS_ACTIVE		1
-#define WQ_STATUS_SUSPENDED		2
-#define WQ_STATUS_CMD_ERROR		3
-#define WQ_STATUS_ENGINE_ID_NOT_USED	4
-#define WQ_STATUS_SUSPENDED_FROM_RESET	5
-#define WQ_TYPE_NOOP			0x4
-#define WQ_TYPE_MULTI_LRC		0x5
-#define WQ_TYPE_MASK			GENMASK(7, 0)
-#define WQ_LEN_MASK			GENMASK(26, 16)
-
-#define WQ_GUC_ID_MASK			GENMASK(15, 0)
-#define WQ_RING_TAIL_MASK		GENMASK(28, 18)
-
-struct guc_wq_item {
-	u32 header;
-	u32 context_desc;
-	u32 submit_element_info;
-	u32 fence_id;
-} __packed;
-
-struct guc_sched_wq_desc {
-	u32 head;
-	u32 tail;
-	u32 error_offset;
-	u32 wq_status;
-	u32 reserved[28];
-} __packed;
-
 /* Helper for context registration H2G */
 struct guc_ctxt_registration_info {
 	u32 flags;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 231fb4145297..a5fe7755ce4c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -22,6 +22,7 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_engine_types.h"
+#include "xe_guc_submit_types.h"
 #include "xe_hw_engine.h"
 #include "xe_hw_fence.h"
 #include "xe_lrc.h"
@@ -378,32 +379,12 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_engine *e)
 		       __guc_engine_policy_action_size(&policy), 0, 0);
 }
 
-#define PARALLEL_SCRATCH_SIZE	2048
-#define WQ_SIZE			(PARALLEL_SCRATCH_SIZE / 2)
-#define WQ_OFFSET		(PARALLEL_SCRATCH_SIZE - WQ_SIZE)
-#define CACHELINE_BYTES		64
-
-struct sync_semaphore {
-	u32 semaphore;
-	u8 unused[CACHELINE_BYTES - sizeof(u32)];
-};
-
-struct parallel_scratch {
-	struct guc_sched_wq_desc wq_desc;
-
-	struct sync_semaphore go;
-	struct sync_semaphore join[XE_HW_ENGINE_MAX_INSTANCE];
-
-	u8 unused[WQ_OFFSET - sizeof(struct guc_sched_wq_desc) -
-		sizeof(struct sync_semaphore) * (XE_HW_ENGINE_MAX_INSTANCE + 1)];
-
-	u32 wq[WQ_SIZE / sizeof(u32)];
-};
-
 #define parallel_read(xe_, map_, field_) \
-	xe_map_rd_field(xe_, &map_, 0, struct parallel_scratch, field_)
+	xe_map_rd_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
+			field_)
 #define parallel_write(xe_, map_, field_, val_) \
-	xe_map_wr_field(xe_, &map_, 0, struct parallel_scratch, field_, val_)
+	xe_map_wr_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
+			field_, val_)
 
 static void __register_mlrc_engine(struct xe_guc *guc,
 				   struct xe_engine *e,
@@ -486,13 +467,13 @@ static void register_engine(struct xe_engine *e)
 		struct iosys_map map = xe_lrc_parallel_map(lrc);
 
 		info.wq_desc_lo = lower_32_bits(ggtt_addr +
-			offsetof(struct parallel_scratch, wq_desc));
+			offsetof(struct guc_submit_parallel_scratch, wq_desc));
 		info.wq_desc_hi = upper_32_bits(ggtt_addr +
-			offsetof(struct parallel_scratch, wq_desc));
+			offsetof(struct guc_submit_parallel_scratch, wq_desc));
 		info.wq_base_lo = lower_32_bits(ggtt_addr +
-			offsetof(struct parallel_scratch, wq[0]));
+			offsetof(struct guc_submit_parallel_scratch, wq[0]));
 		info.wq_base_hi = upper_32_bits(ggtt_addr +
-			offsetof(struct parallel_scratch, wq[0]));
+			offsetof(struct guc_submit_parallel_scratch, wq[0]));
 		info.wq_size = WQ_SIZE;
 
 		e->guc->wqi_head = 0;
@@ -594,7 +575,7 @@ static void wq_item_append(struct xe_engine *e)
 
 	XE_BUG_ON(i != wqi_size / sizeof(u32));
 
-	iosys_map_incr(&map, offsetof(struct parallel_scratch,
+	iosys_map_incr(&map, offsetof(struct guc_submit_parallel_scratch,
 					wq[e->guc->wqi_tail / sizeof(u32)]));
 	xe_map_memcpy_to(xe, &map, 0, wqi, wqi_size);
 	e->guc->wqi_tail += wqi_size;
@@ -1674,6 +1655,7 @@ static void guc_engine_print(struct xe_engine *e, struct drm_printer *p)
 		guc_engine_wq_print(e, p);
 
 	spin_lock(&sched->job_list_lock);
+
 	list_for_each_entry(job, &sched->pending_list, drm.list)
 		drm_printf(p, "\tJob: seqno=%d, fence=%d, finished=%d\n",
 			   xe_sched_job_seqno(job),
diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
new file mode 100644
index 000000000000..d369ea0bad60
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GUC_SUBMIT_TYPES_H_
+#define _XE_GUC_SUBMIT_TYPES_H_
+
+#include "xe_hw_engine_types.h"
+
+/* Work item for submitting workloads into work queue of GuC. */
+#define WQ_STATUS_ACTIVE		1
+#define WQ_STATUS_SUSPENDED		2
+#define WQ_STATUS_CMD_ERROR		3
+#define WQ_STATUS_ENGINE_ID_NOT_USED	4
+#define WQ_STATUS_SUSPENDED_FROM_RESET	5
+#define WQ_TYPE_NOOP			0x4
+#define WQ_TYPE_MULTI_LRC		0x5
+#define WQ_TYPE_MASK			GENMASK(7, 0)
+#define WQ_LEN_MASK			GENMASK(26, 16)
+
+#define WQ_GUC_ID_MASK			GENMASK(15, 0)
+#define WQ_RING_TAIL_MASK		GENMASK(28, 18)
+
+#define PARALLEL_SCRATCH_SIZE	2048
+#define WQ_SIZE			(PARALLEL_SCRATCH_SIZE / 2)
+#define WQ_OFFSET		(PARALLEL_SCRATCH_SIZE - WQ_SIZE)
+#define CACHELINE_BYTES		64
+
+struct guc_sched_wq_desc {
+	u32 head;
+	u32 tail;
+	u32 error_offset;
+	u32 wq_status;
+	u32 reserved[28];
+} __packed;
+
+struct sync_semaphore {
+	u32 semaphore;
+	u8 unused[CACHELINE_BYTES - sizeof(u32)];
+};
+
+/**
+ * Struct guc_submit_parallel_scratch - A scratch shared mapped buffer.
+ */
+struct guc_submit_parallel_scratch {
+	/** @wq_desc: Guc scheduler workqueue descriptor */
+	struct guc_sched_wq_desc wq_desc;
+
+	/** @go: Go Semaphore */
+	struct sync_semaphore go;
+	/** @join: Joined semaphore for the relevant hw engine instances */
+	struct sync_semaphore join[XE_HW_ENGINE_MAX_INSTANCE];
+
+	/** @unused: Unused/Reserved memory space */
+	u8 unused[WQ_OFFSET - sizeof(struct guc_sched_wq_desc) -
+		  sizeof(struct sync_semaphore) *
+		  (XE_HW_ENGINE_MAX_INSTANCE + 1)];
+
+	/** @wq: Workqueue info */
+	u32 wq[WQ_SIZE / sizeof(u32)];
+};
+
+#endif
-- 
2.39.2

