Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AFD6E9B81
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 20:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C767710E429;
	Thu, 20 Apr 2023 18:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F1D10E086;
 Thu, 20 Apr 2023 18:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682014886; x=1713550886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=eVjZlVC++/aTWwLm/7ebeorh6lTeUT53J5zju8PiwIQ=;
 b=avs2imPjYBR99+hFDDNhVCkLILbFA142vXQUqoC0EfVUds4VkHt2PEw1
 OKlZ0KJIEMrP7IvDg60XqsIzIvGW1xVco4ebpbI4S06ByX4fkKgwgfyv4
 gwGNTl+W7OjrVVntGKngj2mFNiUo1sVEPAJ3HqdofoPuSpVHtSXiFddOg
 ZEeciWTwDK4oGOc2nakM9Ytzg3PoIQpm1bjkfKbA4TbOQAwoeP++nvVNu
 rJyL0nXFZW337jjUockYBRoqN/IlIbGiNluFCMVutFZSa1stM1fQvgGZG
 yIZSK8RFLqAEil6UkgqjHEp2EGuIbeNGT95cKJHkzDoLDZPA8OHPtLr5I g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="325422273"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="325422273"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 11:21:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="866436797"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="866436797"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 20 Apr 2023 11:21:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 11:21:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 11:21:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 11:21:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RpSHmVvyVEin5uT91e4ejBWL9XzF5/25cnHhfycCdXBx0zKveil4fBfSs/16bWiIXNe+9CcvMbJOEP6MBxH+G3y/ZsbEGJ70u+70KWGgnGuO+JRjFDn9prlZD9HF1t4/5y9T4OvcnD+HmO9dzENMhg9FyyFLv8/4ZfdkS03vH18KEPZuDB5kzamyMJftOHqQ9zBZtslDZAbbTnxdUrdaEG24L1IQg8BN+IL9TcehhpGDbgWfTLR2AdupdJIwMer+37cnH+dAgg2tVR9noG9MLbDKgpl8ros7sWJiXeylu7XrjpJ+Sf4Ie8kro+QbpwVnkuOn+NIj3jqNBqktwQnfOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvdNuHxVJYtUm0+fNiQ8KDyjswg/Ia9sAuZL0oMSPR0=;
 b=T5FWaXvhcl08if6HMr3xKPXDaxK2OilV61dMFmqrwh1egqWQFLzSUptSdeBAQ8gNJVy2kqIAC7pneAnwALfTt/vhFoxCrvpOx9ahASl9sMYI6aVgUPBzuom17KkrJxTLjZbBcqSv3vt/pzBRRFWBDh4XFlQdhc4h5ePLPZwzy4LtqIPN+FAKd6W+0zP6W5v2dr7CRZXHtQZ2cs9OyGYRrzH6GeQSvhmuxO240u6hLSng7huRFUPYqACki2FG1nMAf+riaY53qvr+Yv6PByXVFXETCeDFYkJV0yPmCT24qzoy4XGTmFFxh/FTsaPUvYbLqrKf9kkEFF+Q6G7qogtdfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by DM4PR11MB7184.namprd11.prod.outlook.com (2603:10b6:8:110::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 18:21:19 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::31f7:5096:35b0:b458]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::31f7:5096:35b0:b458%2]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 18:21:19 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v4 3/3] drm/xe: switch to using drm_exec
Date: Thu, 20 Apr 2023 20:21:02 +0200
Message-ID: <20230420182102.3302646-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230420182102.3302646-1-francois.dugast@intel.com>
References: <20230420182102.3302646-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0348.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::11) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|DM4PR11MB7184:EE_
X-MS-Office365-Filtering-Correlation-Id: 02751370-7cac-4fce-566d-08db41cc092e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9b0Zrs61g4OtvVr5BrRnlHG5osQ/+OJmUeBXT3vQLQ4uQyLfueJrcwWVUHzCWTgO610xYD7hZpAuKrRmNrwn5Q9dFXCj+1ratH9+Qe56xnVJRH8YBkScwm/jSGbmOcEHnMwaXHuWCuPUATo1UTembYxnba7fNlXF/uzxmUhWgFPENciAPQYXHHE1m67XCot3rg4Q1wO29HqDcBj3dvUjBYX+k2mwY6cS4y2/bk9cFzT4X1yUlEGJEq/bqYstIhcE96htiDxf6SXqs0C1GOxATq/R3IfKk8/CLM/rrBHT9T013eFIKS5LMF7sw/3J3ABcSsLL59CqL81uDAYw0dqCgAjkbXPNafmL+xvFwboq1tfxLc5gdax17Za6chjgf48VrwlOuiGen1b6itReraB5tKV2FqX1XbbBmUGj4zIO79RR7/ifOGI0DhkDPJKPcbAkEDUHnqr3swjK/Z2nAV8CVmyMexcDee9q14jm4MVupu+URFg4I8KSACl8ubzx+njfyUcR/ulQQVzPlAR+JrleD+JIBnkGe3/e52JlQC1O3ygoQbWfIIgYN300A2GHHo56rZlp0F3P4Qw+BARDOURglTC/awykFMWc3+CvN47coGBsN11u3N2i3tjnGl4Ed0kh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(396003)(366004)(346002)(136003)(451199021)(38100700002)(66899021)(41300700001)(5660300002)(44832011)(8676002)(2906002)(30864003)(8936002)(36756003)(86362001)(6486002)(6666004)(6512007)(1076003)(26005)(6506007)(107886003)(478600001)(2616005)(83380400001)(186003)(66556008)(66476007)(66946007)(316002)(6916009)(4326008)(82960400001)(21314003)(579004)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzBGamxIbXNJVjNBbGJyOTdkcjczeWRFRkI2TEZ2M25IL3FxNTh0YWNXU1ZQ?=
 =?utf-8?B?ckNsekRUbVdmT09YcGxnUEFXc2FuS1N4RmgzV3d2K3FwV3ZjeUZCYWtlaTRw?=
 =?utf-8?B?a0REcWsvK0lscXBKOEVMU09xMXh0QkpqSEdpUzJDc09kOGJ1Wk03WlZxUjA1?=
 =?utf-8?B?VVV2czJsNSt4NHQwN1o1THhYQUVka0ZFRi9LUmZ2RlFKb2wrTkwyMXJtSFM3?=
 =?utf-8?B?TGwxMUVWcjR0amwyZGRXWWRRUXY5VytGTE8vZDllUnN1Q21lNDh6bWM2SU9s?=
 =?utf-8?B?SEp5S1BtbG1xUlJJZVpuYVlMZkVGYlArNkRsZDcyMWg1TzFvc21zM05jdy81?=
 =?utf-8?B?Mm1jMEVxQlRQTVNhL1pjMkZ6cFRlM1dnSy80TElWbng4OFQ4d3NPaW03Y1h0?=
 =?utf-8?B?UFdFVHhKU2pnVjZvMmVQQVovckRDcEYzQVV0eklnSzVleDc5TnZRb05ablRj?=
 =?utf-8?B?T2FQQmg5cEpkYXcwa3Q2UTQ5VVJzR1o1Y2FlT1NBaXFaVG9IYjJvcEFkSzF2?=
 =?utf-8?B?a1dKUVNNRG1VV0Zudk1yT3VHYUYrRzBtemtqNnoxSlNJRmJmcTUxQ2NPRm1W?=
 =?utf-8?B?SkxleVduMW0vZUxYK0tPd0ZxaFEvUTRMNEFxbVBrUnB4UkZGS2dWZkVHRVpW?=
 =?utf-8?B?b2J0TTcvWkxKc0Q4MDdBTzdEM1ExcVNRdGpDSy9PRmYzckNHYkNSM0dYKzFW?=
 =?utf-8?B?Q2RpaVR2V293MU5xcDFsM01XVFBxWmpneEZOMDM0VnN1L1BQamNSSmFpUEhl?=
 =?utf-8?B?Z28yaC9xR21NWngwMXduWVhXaGVuOXVxVUFzK3BZcXlvOWRhaGVwL1lONndE?=
 =?utf-8?B?V3lKT2IrK1ZiMzJDVFM0KzMvNmZNMCtHMzgyTEh4dXZoaERDTURXMGF2aE9l?=
 =?utf-8?B?YUlUMkNrZUVvM2txc2hvYXdUZ2RwRjNXTlY4djU4ZWVaVmNGMktFcmJiK3NN?=
 =?utf-8?B?cHdhRHpxQ2srTmlTZXNLNlJydjJLbXNmSURlODdxemdwZk1vRW5wQU04ZGZy?=
 =?utf-8?B?TGduVnZKclQzS04vZjdPTm5JTXkwYUZVNFJGbHdZNmNtc1ZsT0pZM2VXMEhm?=
 =?utf-8?B?MFBaVkYxdTVBeTlIZEFrcVNlZzhVL2ppcXlKN0IzYVlsRzBFMU9HUTAwYnVi?=
 =?utf-8?B?NHhCN3lsRjJNMWsvQTM0UURQMUROR05qMk5iVFRxclpaek81ai9JeW43RDdT?=
 =?utf-8?B?aFYwYVpZZmxjSi9sSk1kY0VDQU5oNUNYQ0VFbXRwVWo5bnErQkFDQnNPRHg2?=
 =?utf-8?B?K2xOVGZJTVRneGdNQ2lvWG9pM094L21sUTlKd3NKV0taVGlmV1BBbXkvNm84?=
 =?utf-8?B?NmppNC9hOWordm9HVStvSEtqWE5vaTQ3aUNmOHVPMjE4TVJtdFhHYURGS3VN?=
 =?utf-8?B?THkvWkprSWsvLzNpMmJQLzdPUXNxc1NpUU45M0QxWGQ5bmJOdnlDeFRoU0Rq?=
 =?utf-8?B?amplQmtRWnlVeHhYUkh1bk8vK2dlM1JEVnVsa1I1OTdWMWFaVHNLWUp6bGZx?=
 =?utf-8?B?U1YvRjRnU2xhZlhtTHpBekM0OEdyR1ZvMVo5blJVeDVzZGZOQlh2YjZUOStY?=
 =?utf-8?B?QTZ0QzJtMjdPMkJ4eFRSZmpwd2YzVHdhUnFOTW5JazhIQ3lYRmZJRTlBaFlP?=
 =?utf-8?B?WjlBWlgrZUkwQjlvaFFPRG9SQkt5NG8wOTlPVlhkTTZ4TGVnam9qQWgzb3Vz?=
 =?utf-8?B?NlJQRXZoVlptTUNBcG1ZWTk0MXZBS3NJU2FzL0RpQnh4ajdmY0xpeVpYK0ti?=
 =?utf-8?B?MUo1Wk9ha0IybHZ3OEZiajZqcnc0THRwb3k5ZWVhcVFsR1VMMWp3ZEtOZ05y?=
 =?utf-8?B?eC8raEJsQStMSUhjTVYxVVZQbUxQV3BtdzllWWVOVTRNQVZnNTlmMmlBc3N1?=
 =?utf-8?B?dWdaaktTUE5OWnd6NDlIY0xlM2FRRHMyOCt1Y0J6OVVyeHliWmt6cDJibUtX?=
 =?utf-8?B?OWQ4M05BcmJlc3V6NS9FN0JMSnpJYUh3WWQ5STlBS1hLc29oeHdKSzRIelJq?=
 =?utf-8?B?TkVZYmNVMVFTWmdSUW5vd1M0cG5TTUFGdVVqSy9ETFQ3K1JXOHc0WkdXQldp?=
 =?utf-8?B?cXZ0U1IwWVFNNjB3TGpZYkxFYzNwdkNaQXpnWVFiWmIyZERkejYySGIxY0tK?=
 =?utf-8?B?S2ZndEd5aUErOWhyc3o5NTN6N0JhaUVBYU5HbnQwRmc1TFJSVXRZSlZkS0hv?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02751370-7cac-4fce-566d-08db41cc092e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 18:21:18.9285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0AaLOv1KrZuZZoETv9ykHRzr3YM8c1m1ZXGMCKSYCb6vtw+06/oLckO/K6gW4F5xV3pxKRWSYjPM83O3QoptmJ4WoErAMHvIhargchWdy9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7184
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
Cc: matthew.brost@intel.com, Francois Dugast <francois.dugast@intel.com>,
 lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org, dakr@redhat.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the use of ttm_execbuf_util helpers with the drm_exec helpers.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c |   7 +-
 drivers/gpu/drm/xe/Kconfig                   |   1 +
 drivers/gpu/drm/xe/tests/xe_bo.c             |  26 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c        |   6 +-
 drivers/gpu/drm/xe/xe_bo.c                   |  35 +-
 drivers/gpu/drm/xe/xe_bo.h                   |   6 +-
 drivers/gpu/drm/xe/xe_bo_evict.c             |  24 +-
 drivers/gpu/drm/xe/xe_bo_types.h             |   1 -
 drivers/gpu/drm/xe/xe_engine.c               |   6 +-
 drivers/gpu/drm/xe/xe_exec.c                 |  30 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c         |  56 +---
 drivers/gpu/drm/xe/xe_lrc.c                  |   6 +-
 drivers/gpu/drm/xe/xe_migrate.c              |  12 +-
 drivers/gpu/drm/xe/xe_vm.c                   | 321 +++++++++----------
 drivers/gpu/drm/xe/xe_vm.h                   |  33 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c           |  36 +--
 16 files changed, 276 insertions(+), 330 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 6d9abc95dbcd..4f317f984e57 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -40,6 +40,7 @@
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_exec.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_privacy_screen_consumer.h>
 #include <drm/drm_probe_helper.h>
@@ -7340,11 +7341,11 @@ static int i915_gem_object_read_from_page(struct xe_bo *bo,
 	void *virtual;
 	bool is_iomem;
 	int ret;
-	struct ww_acquire_ctx ww;
+	struct drm_exec exec;
 
 	XE_BUG_ON(size != 8);
 
-	ret = xe_bo_lock(bo, &ww, 0, true);
+	ret = xe_bo_lock(bo, &exec, 0, true);
 	if (ret)
 		return ret;
 
@@ -7361,7 +7362,7 @@ static int i915_gem_object_read_from_page(struct xe_bo *bo,
 
 	ttm_bo_kunmap(&map);
 out_unlock:
-	xe_bo_unlock(bo, &ww);
+	xe_bo_unlock(bo, &exec);
 	return ret;
 }
 #endif
diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index f6f3b491d162..bbcc9b64b776 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -8,6 +8,7 @@ config DRM_XE
 	select SHMEM
 	select TMPFS
 	select DRM_BUDDY
+	select DRM_EXEC
 	select DRM_KMS_HELPER
 	select DRM_PANEL
 	select DRM_SUBALLOC_HELPER
diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 9bd381e5b7a6..316c6cf2bb86 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -175,17 +175,17 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
 	unsigned int bo_flags = XE_BO_CREATE_USER_BIT |
 		XE_BO_CREATE_VRAM_IF_DGFX(gt);
 	struct xe_vm *vm = xe_migrate_get_vm(xe->gt[0].migrate);
-	struct ww_acquire_ctx ww;
+	struct drm_exec exec;
 	int err, i;
 
 	kunit_info(test, "Testing device %s gt id %u vram id %u\n",
 		   dev_name(xe->drm.dev), gt->info.id, gt->info.vram_id);
 
 	for (i = 0; i < 2; ++i) {
-		xe_vm_lock(vm, &ww, 0, false);
+		xe_vm_lock(vm, &exec, 0, false);
 		bo = xe_bo_create(xe, NULL, vm, 0x10000, ttm_bo_type_device,
 				  bo_flags);
-		xe_vm_unlock(vm, &ww);
+		xe_vm_unlock(vm, &exec);
 		if (IS_ERR(bo)) {
 			KUNIT_FAIL(test, "bo create err=%pe\n", bo);
 			break;
@@ -198,9 +198,9 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
 			goto cleanup_bo;
 		}
 
-		xe_bo_lock(external, &ww, 0, false);
+		xe_bo_lock(external, &exec, 0, false);
 		err = xe_bo_pin_external(external);
-		xe_bo_unlock(external, &ww);
+		xe_bo_unlock(external, &exec);
 		if (err) {
 			KUNIT_FAIL(test, "external bo pin err=%pe\n",
 				   ERR_PTR(err));
@@ -240,18 +240,18 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
 
 		if (i) {
 			down_read(&vm->lock);
-			xe_vm_lock(vm, &ww, 0, false);
+			xe_vm_lock(vm, &exec, 0, false);
 			err = xe_bo_validate(bo, bo->vm, false);
-			xe_vm_unlock(vm, &ww);
+			xe_vm_unlock(vm, &exec);
 			up_read(&vm->lock);
 			if (err) {
 				KUNIT_FAIL(test, "bo valid err=%pe\n",
 					   ERR_PTR(err));
 				goto cleanup_all;
 			}
-			xe_bo_lock(external, &ww, 0, false);
+			xe_bo_lock(external, &exec, 0, false);
 			err = xe_bo_validate(external, NULL, false);
-			xe_bo_unlock(external, &ww);
+			xe_bo_unlock(external, &exec);
 			if (err) {
 				KUNIT_FAIL(test, "external bo valid err=%pe\n",
 					   ERR_PTR(err));
@@ -259,18 +259,18 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
 			}
 		}
 
-		xe_bo_lock(external, &ww, 0, false);
+		xe_bo_lock(external, &exec, 0, false);
 		xe_bo_unpin_external(external);
-		xe_bo_unlock(external, &ww);
+		xe_bo_unlock(external, &exec);
 
 		xe_bo_put(external);
 		xe_bo_put(bo);
 		continue;
 
 cleanup_all:
-		xe_bo_lock(external, &ww, 0, false);
+		xe_bo_lock(external, &exec, 0, false);
 		xe_bo_unpin_external(external);
-		xe_bo_unlock(external, &ww);
+		xe_bo_unlock(external, &exec);
 cleanup_external:
 		xe_bo_put(external);
 cleanup_bo:
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index cdcecf8d5eef..7b0c76956146 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -393,14 +393,14 @@ static int migrate_test_run_device(struct xe_device *xe)
 
 	for_each_gt(gt, xe, id) {
 		struct xe_migrate *m = gt->migrate;
-		struct ww_acquire_ctx ww;
+		struct drm_exec exec;
 
 		kunit_info(test, "Testing gt id %d.\n", id);
-		xe_vm_lock(m->eng->vm, &ww, 0, true);
+		xe_vm_lock(m->eng->vm, &exec, 0, true);
 		xe_device_mem_access_get(xe);
 		xe_migrate_sanity_test(m, test);
 		xe_device_mem_access_put(xe);
-		xe_vm_unlock(m->eng->vm, &ww);
+		xe_vm_unlock(m->eng->vm, &exec);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 3ab404e33fae..3a1c1b5e3284 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -8,6 +8,7 @@
 #include <linux/dma-buf.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_exec.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
@@ -1626,7 +1627,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_file *xef = to_xe_file(file);
 	struct drm_xe_gem_create *args = data;
-	struct ww_acquire_ctx ww;
+	struct drm_exec exec;
 	struct xe_vm *vm = NULL;
 	struct xe_bo *bo;
 	unsigned bo_flags = XE_BO_CREATE_USER_BIT;
@@ -1662,7 +1663,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 		vm = xe_vm_lookup(xef, args->vm_id);
 		if (XE_IOCTL_ERR(xe, !vm))
 			return -ENOENT;
-		err = xe_vm_lock(vm, &ww, 0, true);
+		err = xe_vm_lock(vm, &exec, 0, true);
 		if (err) {
 			xe_vm_put(vm);
 			return err;
@@ -1679,7 +1680,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	bo = xe_bo_create(xe, NULL, vm, args->size, ttm_bo_type_device,
 			  bo_flags);
 	if (vm) {
-		xe_vm_unlock(vm, &ww);
+		xe_vm_unlock(vm, &exec);
 		xe_vm_put(vm);
 	}
 
@@ -1720,26 +1721,30 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 	return 0;
 }
 
-int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
+int xe_bo_lock(struct xe_bo *bo, struct drm_exec *exec,
 	       int num_resv, bool intr)
 {
-	struct ttm_validate_buffer tv_bo;
-	LIST_HEAD(objs);
-	LIST_HEAD(dups);
+	int err;
 
-	XE_BUG_ON(!ww);
+	drm_exec_init(exec, intr);
+	drm_exec_while_not_all_locked(exec) {
+		err = drm_exec_prepare_obj(exec, &bo->ttm.base,
+					   num_resv);
+		drm_exec_continue_on_contention(exec);
+		if (err && err != -EALREADY)
+			goto out_err;
+	}
 
-	tv_bo.num_shared = num_resv;
-	tv_bo.bo = &bo->ttm;;
-	list_add_tail(&tv_bo.head, &objs);
+	return 0;
 
-	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
+out_err:
+	drm_exec_fini(exec);
+	return err;
 }
 
-void xe_bo_unlock(struct xe_bo *bo, struct ww_acquire_ctx *ww)
+void xe_bo_unlock(struct xe_bo *bo, struct drm_exec *exec)
 {
-	dma_resv_unlock(bo->ttm.base.resv);
-	ww_acquire_fini(ww);
+	drm_exec_fini(exec);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index effa9d0cf0f6..553d9270fffb 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -74,6 +74,7 @@
 
 #define XE_BO_PROPS_INVALID	(-1)
 
+struct drm_exec;
 struct sg_table;
 
 struct xe_bo *xe_bo_alloc(void);
@@ -141,10 +142,9 @@ static inline void xe_bo_assert_held(struct xe_bo *bo)
 		dma_resv_assert_held((bo)->ttm.base.resv);
 }
 
-int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
+int xe_bo_lock(struct xe_bo *bo, struct drm_exec *exec,
 	       int num_resv, bool intr);
-
-void xe_bo_unlock(struct xe_bo *bo, struct ww_acquire_ctx *ww);
+void xe_bo_unlock(struct xe_bo *bo, struct drm_exec *exec);
 
 static inline void xe_bo_unlock_vm_held(struct xe_bo *bo)
 {
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 6642c5f52009..46d9d9eb110c 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -3,6 +3,8 @@
  * Copyright © 2022 Intel Corporation
  */
 
+#include <drm/drm_exec.h>
+
 #include "xe_bo_evict.h"
 
 #include "xe_bo.h"
@@ -27,7 +29,7 @@
 int xe_bo_evict_all(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
-	struct ww_acquire_ctx ww;
+	struct drm_exec exec;
 	struct xe_bo *bo;
 	struct xe_gt *gt;
 	struct list_head still_in_list;
@@ -62,9 +64,9 @@ int xe_bo_evict_all(struct xe_device *xe)
 		list_move_tail(&bo->pinned_link, &still_in_list);
 		spin_unlock(&xe->pinned.lock);
 
-		xe_bo_lock(bo, &ww, 0, false);
+		xe_bo_lock(bo, &exec, 0, false);
 		ret = xe_bo_evict_pinned(bo);
-		xe_bo_unlock(bo, &ww);
+		xe_bo_unlock(bo, &exec);
 		xe_bo_put(bo);
 		if (ret) {
 			spin_lock(&xe->pinned.lock);
@@ -96,9 +98,9 @@ int xe_bo_evict_all(struct xe_device *xe)
 		list_move_tail(&bo->pinned_link, &xe->pinned.evicted);
 		spin_unlock(&xe->pinned.lock);
 
-		xe_bo_lock(bo, &ww, 0, false);
+		xe_bo_lock(bo, &exec, 0, false);
 		ret = xe_bo_evict_pinned(bo);
-		xe_bo_unlock(bo, &ww);
+		xe_bo_unlock(bo, &exec);
 		xe_bo_put(bo);
 		if (ret)
 			return ret;
@@ -123,7 +125,7 @@ int xe_bo_evict_all(struct xe_device *xe)
  */
 int xe_bo_restore_kernel(struct xe_device *xe)
 {
-	struct ww_acquire_ctx ww;
+	struct drm_exec exec;
 	struct xe_bo *bo;
 	int ret;
 
@@ -140,9 +142,9 @@ int xe_bo_restore_kernel(struct xe_device *xe)
 		list_move_tail(&bo->pinned_link, &xe->pinned.kernel_bo_present);
 		spin_unlock(&xe->pinned.lock);
 
-		xe_bo_lock(bo, &ww, 0, false);
+		xe_bo_lock(bo, &exec, 0, false);
 		ret = xe_bo_restore_pinned(bo);
-		xe_bo_unlock(bo, &ww);
+		xe_bo_unlock(bo, &exec);
 		if (ret) {
 			xe_bo_put(bo);
 			return ret;
@@ -182,7 +184,7 @@ int xe_bo_restore_kernel(struct xe_device *xe)
  */
 int xe_bo_restore_user(struct xe_device *xe)
 {
-	struct ww_acquire_ctx ww;
+	struct drm_exec exec;
 	struct xe_bo *bo;
 	struct xe_gt *gt;
 	struct list_head still_in_list;
@@ -204,9 +206,9 @@ int xe_bo_restore_user(struct xe_device *xe)
 		xe_bo_get(bo);
 		spin_unlock(&xe->pinned.lock);
 
-		xe_bo_lock(bo, &ww, 0, false);
+		xe_bo_lock(bo, &exec, 0, false);
 		ret = xe_bo_restore_pinned(bo);
-		xe_bo_unlock(bo, &ww);
+		xe_bo_unlock(bo, &exec);
 		xe_bo_put(bo);
 		if (ret) {
 			spin_lock(&xe->pinned.lock);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 06de3330211d..2ba34a8c9b66 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -11,7 +11,6 @@
 #include <drm/drm_mm.h>
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_device.h>
-#include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/ttm/ttm_placement.h>
 
 struct xe_device;
diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 094ec17d3004..0840006f644d 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -88,18 +88,18 @@ struct xe_engine *xe_engine_create(struct xe_device *xe, struct xe_vm *vm,
 				   u32 logical_mask, u16 width,
 				   struct xe_hw_engine *hwe, u32 flags)
 {
-	struct ww_acquire_ctx ww;
+	struct drm_exec exec;
 	struct xe_engine *e;
 	int err;
 
 	if (vm) {
-		err = xe_vm_lock(vm, &ww, 0, true);
+		err = xe_vm_lock(vm, &exec, 0, true);
 		if (err)
 			return ERR_PTR(err);
 	}
 	e = __xe_engine_create(xe, vm, logical_mask, width, hwe, flags);
 	if (vm)
-		xe_vm_unlock(vm, &ww);
+		xe_vm_unlock(vm, &exec);
 
 	return e;
 }
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index ea869f2452ef..b7f0a2f551a6 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -6,6 +6,7 @@
 #include "xe_exec.h"
 
 #include <drm/drm_device.h>
+#include <drm/drm_exec.h>
 #include <drm/drm_file.h>
 #include <drm/xe_drm.h>
 
@@ -91,21 +92,16 @@
  *	Unlock all
  */
 
-static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
-			 struct ttm_validate_buffer tv_onstack[],
-			 struct ttm_validate_buffer **tv,
-			 struct list_head *objs)
+static int xe_exec_begin(struct xe_engine *e, struct drm_exec *exec)
 {
 	struct xe_vm *vm = e->vm;
 	struct xe_vma *vma;
-	LIST_HEAD(dups);
 	int err;
 
-	*tv = NULL;
 	if (xe_vm_no_dma_fences(e->vm))
 		return 0;
 
-	err = xe_vm_lock_dma_resv(vm, ww, tv_onstack, tv, objs, true, 1);
+	err = xe_vm_lock_dma_resv(vm, exec, true, 1);
 	if (err)
 		return err;
 
@@ -120,8 +116,7 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
 
 		err = xe_bo_validate(vma->bo, vm, false);
 		if (err) {
-			xe_vm_unlock_dma_resv(vm, tv_onstack, *tv, ww, objs);
-			*tv = NULL;
+			xe_vm_unlock_dma_resv(vm, exec);
 			return err;
 		}
 	}
@@ -129,14 +124,10 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
 	return 0;
 }
 
-static void xe_exec_end(struct xe_engine *e,
-			struct ttm_validate_buffer *tv_onstack,
-			struct ttm_validate_buffer *tv,
-			struct ww_acquire_ctx *ww,
-			struct list_head *objs)
+static void xe_exec_end(struct xe_engine *e, struct drm_exec *exec)
 {
 	if (!xe_vm_no_dma_fences(e->vm))
-		xe_vm_unlock_dma_resv(e->vm, tv_onstack, tv, ww, objs);
+		xe_vm_unlock_dma_resv(e->vm, exec);
 }
 
 int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
@@ -149,14 +140,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct xe_engine *engine;
 	struct xe_sync_entry *syncs = NULL;
 	u64 addresses[XE_HW_ENGINE_MAX_INSTANCE];
-	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
-	struct ttm_validate_buffer *tv = NULL;
 	u32 i, num_syncs = 0;
 	struct xe_sched_job *job;
 	struct dma_fence *rebind_fence;
 	struct xe_vm *vm;
-	struct ww_acquire_ctx ww;
-	struct list_head objs;
+	struct drm_exec exec;
 	bool write_locked;
 	int err = 0;
 
@@ -267,7 +255,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto err_unlock_list;
 	}
 
-	err = xe_exec_begin(engine, &ww, tv_onstack, &tv, &objs);
+	err = xe_exec_begin(engine, &exec);
 	if (err)
 		goto err_unlock_list;
 
@@ -373,7 +361,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err)
 		xe_sched_job_put(job);
 err_engine_end:
-	xe_exec_end(engine, tv_onstack, tv, &ww, &objs);
+	xe_exec_end(engine, &exec);
 err_unlock_list:
 	if (write_locked)
 		up_write(&vm->lock);
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 1677640e1075..365a675f3663 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -8,8 +8,8 @@
 #include <linux/bitfield.h>
 #include <linux/circ_buf.h>
 
+#include <drm/drm_exec.h>
 #include <drm/drm_managed.h>
-#include <drm/ttm/ttm_execbuf_util.h>
 
 #include "xe_bo.h"
 #include "xe_gt.h"
@@ -83,11 +83,6 @@ static bool vma_matches(struct xe_vma *vma, struct xe_vma *lookup)
 	return true;
 }
 
-static bool only_needs_bo_lock(struct xe_bo *bo)
-{
-	return bo && bo->vm;
-}
-
 static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
 {
 	struct xe_vma *vma = NULL, lookup;
@@ -110,10 +105,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	struct xe_vm *vm;
 	struct xe_vma *vma = NULL;
 	struct xe_bo *bo;
-	LIST_HEAD(objs);
-	LIST_HEAD(dups);
-	struct ttm_validate_buffer tv_bo, tv_vm;
-	struct ww_acquire_ctx ww;
+	struct drm_exec exec;
 	struct dma_fence *fence;
 	bool write_locked;
 	int ret = 0;
@@ -171,20 +163,8 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 
 	/* Lock VM and BOs dma-resv */
 	bo = vma->bo;
-	if (only_needs_bo_lock(bo)) {
-		/* This path ensures the BO's LRU is updated */
-		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
-	} else {
-		tv_vm.num_shared = xe->info.tile_count;
-		tv_vm.bo = xe_vm_ttm_bo(vm);
-		list_add(&tv_vm.head, &objs);
-		if (bo) {
-			tv_bo.bo = &bo->ttm;
-			tv_bo.num_shared = xe->info.tile_count;
-			list_add(&tv_bo.head, &objs);
-		}
-		ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
-	}
+	ret = xe_vm_bo_lock(vm, bo, &exec, xe->info.tile_count, false);
+
 	if (ret)
 		goto unlock_vm;
 
@@ -227,10 +207,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	vma->usm.gt_invalidated &= ~BIT(gt->info.id);
 
 unlock_dma_resv:
-	if (only_needs_bo_lock(bo))
-		xe_bo_unlock(bo, &ww);
-	else
-		ttm_eu_backoff_reservation(&ww, &objs);
+	xe_vm_bo_unlock(vm, bo, &exec, true);
 unlock_vm:
 	if (!ret)
 		vm->usm.last_fault_vma = vma;
@@ -501,10 +478,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 	struct xe_vm *vm;
 	struct xe_vma *vma;
 	struct xe_bo *bo;
-	LIST_HEAD(objs);
-	LIST_HEAD(dups);
-	struct ttm_validate_buffer tv_bo, tv_vm;
-	struct ww_acquire_ctx ww;
+	struct drm_exec exec;
 	int ret = 0;
 
 	/* We only support ACC_TRIGGER at the moment */
@@ -537,28 +511,14 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 
 	/* Lock VM and BOs dma-resv */
 	bo = vma->bo;
-	if (only_needs_bo_lock(bo)) {
-		/* This path ensures the BO's LRU is updated */
-		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
-	} else {
-		tv_vm.num_shared = xe->info.tile_count;
-		tv_vm.bo = xe_vm_ttm_bo(vm);
-		list_add(&tv_vm.head, &objs);
-		tv_bo.bo = &bo->ttm;
-		tv_bo.num_shared = xe->info.tile_count;
-		list_add(&tv_bo.head, &objs);
-		ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
-	}
+	ret = xe_vm_bo_lock(vm, bo, &exec, xe->info.tile_count, false);
 	if (ret)
 		goto unlock_vm;
 
 	/* Migrate to VRAM, move should invalidate the VMA first */
 	ret = xe_bo_migrate(bo, XE_PL_VRAM0 + gt->info.vram_id);
 
-	if (only_needs_bo_lock(bo))
-		xe_bo_unlock(bo, &ww);
-	else
-		ttm_eu_backoff_reservation(&ww, &objs);
+	xe_vm_bo_unlock(vm, bo, &exec, true);
 unlock_vm:
 	up_read(&vm->lock);
 	xe_vm_put(vm);
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index fb8c6f7d6528..bc07a7c0718d 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -709,16 +709,16 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 
 void xe_lrc_finish(struct xe_lrc *lrc)
 {
-	struct ww_acquire_ctx ww;
+	struct drm_exec exec;
 
 	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
 	if (lrc->bo->vm)
-		xe_vm_lock(lrc->bo->vm, &ww, 0, false);
+		xe_vm_lock(lrc->bo->vm, &exec, 0, false);
 	else
 		xe_bo_lock_no_vm(lrc->bo, NULL);
 	xe_bo_unpin(lrc->bo);
 	if (lrc->bo->vm)
-		xe_vm_unlock(lrc->bo->vm, &ww);
+		xe_vm_unlock(lrc->bo->vm, &exec);
 	else
 		xe_bo_unlock_no_vm(lrc->bo);
 	xe_bo_put(lrc->bo);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 8686a2a7b035..97238971458d 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -86,13 +86,13 @@ struct xe_engine *xe_gt_migrate_engine(struct xe_gt *gt)
 static void xe_migrate_fini(struct drm_device *dev, void *arg)
 {
 	struct xe_migrate *m = arg;
-	struct ww_acquire_ctx ww;
+	struct drm_exec exec;
 
-	xe_vm_lock(m->eng->vm, &ww, 0, false);
+	xe_vm_lock(m->eng->vm, &exec, 0, false);
 	xe_bo_unpin(m->pt_bo);
 	if (m->cleared_bo)
 		xe_bo_unpin(m->cleared_bo);
-	xe_vm_unlock(m->eng->vm, &ww);
+	xe_vm_unlock(m->eng->vm, &exec);
 
 	dma_fence_put(m->fence);
 	if (m->cleared_bo)
@@ -315,7 +315,7 @@ struct xe_migrate *xe_migrate_init(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_migrate *m;
 	struct xe_vm *vm;
-	struct ww_acquire_ctx ww;
+	struct drm_exec exec;
 	int err;
 
 	XE_BUG_ON(xe_gt_is_media_type(gt));
@@ -332,9 +332,9 @@ struct xe_migrate *xe_migrate_init(struct xe_gt *gt)
 	if (IS_ERR(vm))
 		return ERR_CAST(vm);
 
-	xe_vm_lock(vm, &ww, 0, false);
+	xe_vm_lock(vm, &exec, 0, false);
 	err = xe_migrate_prepare_vm(gt, m, vm);
-	xe_vm_unlock(vm, &ww);
+	xe_vm_unlock(vm, &exec);
 	if (err) {
 		xe_vm_close_and_put(vm);
 		return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index bdf82d34eb66..3a53a2d65853 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -7,7 +7,7 @@
 
 #include <linux/dma-fence-array.h>
 
-#include <drm/ttm/ttm_execbuf_util.h>
+#include <drm/drm_exec.h>
 #include <drm/ttm/ttm_tt.h>
 #include <drm/xe_drm.h>
 #include <linux/kthread.h>
@@ -261,10 +261,10 @@ static void arm_preempt_fences(struct xe_vm *vm, struct list_head *list)
 static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
 {
 	struct xe_engine *e;
-	struct ww_acquire_ctx ww;
+	struct drm_exec exec;
 	int err;
 
-	err = xe_bo_lock(bo, &ww, vm->preempt.num_engines, true);
+	err = xe_bo_lock(bo, &exec, vm->preempt.num_engines, true);
 	if (err)
 		return err;
 
@@ -275,7 +275,7 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
 					   DMA_RESV_USAGE_BOOKKEEP);
 		}
 
-	xe_bo_unlock(bo, &ww);
+	xe_bo_unlock(bo, &exec);
 	return 0;
 }
 
@@ -317,11 +317,8 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
 
 int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
 {
-	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
-	struct ttm_validate_buffer *tv;
-	struct ww_acquire_ctx ww;
-	struct list_head objs;
 	struct dma_fence *pfence;
+	struct drm_exec exec;
 	int err;
 	bool wait;
 
@@ -329,7 +326,7 @@ int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
 
 	down_write(&vm->lock);
 
-	err = xe_vm_lock_dma_resv(vm, &ww, tv_onstack, &tv, &objs, true, 1);
+	err = xe_vm_lock_dma_resv(vm, &exec, true, 1);
 	if (err)
 		goto out_unlock_outer;
 
@@ -363,7 +360,7 @@ int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
 	up_read(&vm->userptr.notifier_lock);
 
 out_unlock:
-	xe_vm_unlock_dma_resv(vm, tv_onstack, tv, &ww, &objs);
+	xe_vm_unlock_dma_resv(vm, &exec);
 out_unlock_outer:
 	up_write(&vm->lock);
 
@@ -389,72 +386,57 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
 		list_empty(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
 }
 
+static struct drm_gem_object *xe_vm_gem(struct xe_vm *vm)
+{
+	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
+		XE_VM_FLAG_GT_ID(vm->flags) : 0;
+
+	/* Safe to use index 0 as all BO in the VM share a single dma-resv lock */
+	return &vm->pt_root[idx]->bo->ttm.base;
+}
+
+
 /**
  * xe_vm_lock_dma_resv() - Lock the vm dma_resv object and the dma_resv
  * objects of the vm's external buffer objects.
  * @vm: The vm.
- * @ww: Pointer to a struct ww_acquire_ctx locking context.
- * @tv_onstack: Array size XE_ONSTACK_TV of storage for the struct
- * ttm_validate_buffers used for locking.
- * @tv: Pointer to a pointer that on output contains the actual storage used.
- * @objs: List head for the buffer objects locked.
+ * @exec: Pointer to a struct drm_exec execution context.
  * @intr: Whether to lock interruptible.
  * @num_shared: Number of dma-fence slots to reserve in the locked objects.
  *
  * Locks the vm dma-resv objects and all the dma-resv objects of the
- * buffer objects on the vm external object list. The TTM utilities require
- * a list of struct ttm_validate_buffers pointing to the actual buffer
- * objects to lock. Storage for those struct ttm_validate_buffers should
- * be provided in @tv_onstack, and is typically reserved on the stack
- * of the caller. If the size of @tv_onstack isn't sufficient, then
- * storage will be allocated internally using kvmalloc().
+ * buffer objects on the vm external object list using helpers provided
+ * by drm_exec.
  *
  * The function performs deadlock handling internally, and after a
  * successful return the ww locking transaction should be considered
  * sealed.
  *
- * Return: 0 on success, Negative error code on error. In particular if
- * @intr is set to true, -EINTR or -ERESTARTSYS may be returned. In case
- * of error, any locking performed has been reverted.
+ * Return: 0 on success, Negative error code on error.
  */
-int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
-			struct ttm_validate_buffer *tv_onstack,
-			struct ttm_validate_buffer **tv,
-			struct list_head *objs,
-			bool intr,
-			unsigned int num_shared)
-{
-	struct ttm_validate_buffer *tv_vm, *tv_bo;
+int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
+			bool intr, unsigned int num_shared)
+{
 	struct xe_vma *vma, *next;
-	LIST_HEAD(dups);
+	struct drm_gem_object *obj;
 	int err;
 
 	lockdep_assert_held(&vm->lock);
 
-	if (vm->extobj.entries < XE_ONSTACK_TV) {
-		tv_vm = tv_onstack;
-	} else {
-		tv_vm = kvmalloc_array(vm->extobj.entries + 1, sizeof(*tv_vm),
-				       GFP_KERNEL);
-		if (!tv_vm)
-			return -ENOMEM;
-	}
-	tv_bo = tv_vm + 1;
-
-	INIT_LIST_HEAD(objs);
-	list_for_each_entry(vma, &vm->extobj.list, extobj.link) {
-		tv_bo->num_shared = num_shared;
-		tv_bo->bo = &vma->bo->ttm;
-
-		list_add_tail(&tv_bo->head, objs);
-		tv_bo++;
+	drm_exec_init(exec, intr);
+	drm_exec_while_not_all_locked(exec) {
+		err = drm_exec_prepare_obj(exec, xe_vm_gem(vm), num_shared);
+		drm_exec_continue_on_contention(exec);
+		if (unlikely(err) && err != -EALREADY)
+			goto out_err;
+		list_for_each_entry(vma, &vm->extobj.list, extobj.link) {
+			obj = &vma->bo->ttm.base;
+			err = drm_exec_prepare_obj(exec, obj, num_shared);
+			drm_exec_break_on_contention(exec);
+			if (unlikely(err) && err != -EALREADY)
+				goto out_err;
+		}
 	}
-	tv_vm->num_shared = num_shared;
-	tv_vm->bo = xe_vm_ttm_bo(vm);
-	list_add_tail(&tv_vm->head, objs);
-	err = ttm_eu_reserve_buffers(ww, objs, intr, &dups);
-	if (err)
-		goto out_err;
 
 	spin_lock(&vm->notifier.list_lock);
 	list_for_each_entry_safe(vma, next, &vm->notifier.rebind_list,
@@ -466,14 +448,10 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
 			list_move_tail(&vma->rebind_link, &vm->rebind_list);
 	}
 	spin_unlock(&vm->notifier.list_lock);
-
-	*tv = tv_vm;
 	return 0;
 
 out_err:
-	if (tv_vm != tv_onstack)
-		kvfree(tv_vm);
-
+	drm_exec_fini(exec);
 	return err;
 }
 
@@ -481,20 +459,16 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
  * xe_vm_unlock_dma_resv() - Unlock reservation objects locked by
  * xe_vm_lock_dma_resv()
  * @vm: The vm.
- * @tv_onstack: The @tv_onstack array given to xe_vm_lock_dma_resv().
- * @tv: The value of *@tv given by xe_vm_lock_dma_resv().
- * @ww: The ww_acquire_context used for locking.
- * @objs: The list returned from xe_vm_lock_dma_resv().
+ * @exec: The @drm_exec given to xe_vm_lock_dma_resv().
  *
  * Unlocks the reservation objects and frees any memory allocated by
  * xe_vm_lock_dma_resv().
  */
-void xe_vm_unlock_dma_resv(struct xe_vm *vm,
-			   struct ttm_validate_buffer *tv_onstack,
-			   struct ttm_validate_buffer *tv,
-			   struct ww_acquire_ctx *ww,
-			   struct list_head *objs)
+void xe_vm_unlock_dma_resv(struct xe_vm *vm, struct drm_exec *exec)
 {
+	struct drm_gem_object *obj, *skip = xe_vm_gem(vm);
+	unsigned long index;
+
 	/*
 	 * Nothing should've been able to enter the list while we were locked,
 	 * since we've held the dma-resvs of all the vm's external objects,
@@ -503,20 +477,22 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
 	 */
 	XE_WARN_ON(!list_empty(&vm->notifier.rebind_list));
 
-	ttm_eu_backoff_reservation(ww, objs);
-	if (tv && tv != tv_onstack)
-		kvfree(tv);
+	drm_exec_for_each_locked_object(exec, index, obj) {
+		struct xe_bo *bo = gem_to_xe_bo(obj);
+
+		if (obj != skip)
+			ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
+	}
+	drm_exec_fini(exec);
 }
 
+
 static void preempt_rebind_work_func(struct work_struct *w)
 {
 	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
 	struct xe_vma *vma;
-	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
-	struct ttm_validate_buffer *tv;
-	struct ww_acquire_ctx ww;
-	struct list_head objs;
 	struct dma_fence *rebind_fence;
+	struct drm_exec exec;
 	unsigned int fence_count = 0;
 	LIST_HEAD(preempt_fences);
 	int err;
@@ -556,8 +532,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 			goto out_unlock_outer;
 	}
 
-	err = xe_vm_lock_dma_resv(vm, &ww, tv_onstack, &tv, &objs,
-				  false, vm->preempt.num_engines);
+	err = xe_vm_lock_dma_resv(vm, &exec, false, vm->preempt.num_engines);
 	if (err)
 		goto out_unlock_outer;
 
@@ -631,7 +606,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	up_read(&vm->userptr.notifier_lock);
 
 out_unlock:
-	xe_vm_unlock_dma_resv(vm, tv_onstack, tv, &ww, &objs);
+	xe_vm_unlock_dma_resv(vm, &exec);
 out_unlock_outer:
 	if (err == -EAGAIN) {
 		trace_xe_vm_rebind_worker_retry(vm);
@@ -979,27 +954,16 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 
 static void xe_vma_destroy_unlocked(struct xe_vma *vma)
 {
-	struct ttm_validate_buffer tv[2];
-	struct ww_acquire_ctx ww;
+	struct xe_vm *vm = vma->vm;
 	struct xe_bo *bo = vma->bo;
-	LIST_HEAD(objs);
-	LIST_HEAD(dups);
+	struct drm_exec exec;
 	int err;
 
-	memset(tv, 0, sizeof(tv));
-	tv[0].bo = xe_vm_ttm_bo(vma->vm);
-	list_add(&tv[0].head, &objs);
-
-	if (bo) {
-		tv[1].bo = &xe_bo_get(bo)->ttm;
-		list_add(&tv[1].head, &objs);
-	}
-	err = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
+	err = xe_vm_bo_lock(vm, xe_bo_get(bo), &exec, 0, false);
 	XE_WARN_ON(err);
-
 	xe_vma_destroy(vma, NULL);
+	xe_vm_bo_unlock(vm, bo, &exec, false);
 
-	ttm_eu_backoff_reservation(&ww, &objs);
 	if (bo)
 		xe_bo_put(bo);
 }
@@ -1285,7 +1249,7 @@ static void vm_error_capture(struct xe_vm *vm, int err,
 void xe_vm_close_and_put(struct xe_vm *vm)
 {
 	struct rb_root contested = RB_ROOT;
-	struct ww_acquire_ctx ww;
+	struct drm_exec exec;
 	struct xe_device *xe = vm->xe;
 	struct xe_gt *gt;
 	u8 id;
@@ -1307,7 +1271,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	}
 
 	down_write(&vm->lock);
-	xe_vm_lock(vm, &ww, 0, false);
+	xe_vm_lock(vm, &exec, 0, false);
 	while (vm->vmas.rb_node) {
 		struct xe_vma *vma = to_xe_vma(vm->vmas.rb_node);
 
@@ -1346,7 +1310,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 					      NULL);
 		}
 	}
-	xe_vm_unlock(vm, &ww);
+	xe_vm_unlock(vm, &exec);
 
 	if (contested.rb_node) {
 
@@ -1383,7 +1347,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 {
 	struct xe_vm *vm =
 		container_of(w, struct xe_vm, destroy_work);
-	struct ww_acquire_ctx ww;
+	struct drm_exec exec;
 	struct xe_device *xe = vm->xe;
 	struct xe_gt *gt;
 	u8 id;
@@ -1409,14 +1373,14 @@ static void vm_destroy_work_func(struct work_struct *w)
 	 * is needed for xe_vm_lock to work. If we remove that dependency this
 	 * can be moved to xe_vm_close_and_put.
 	 */
-	xe_vm_lock(vm, &ww, 0, false);
+	xe_vm_lock(vm, &exec, 0, false);
 	for_each_gt(gt, xe, id) {
 		if (vm->pt_root[id]) {
 			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
 			vm->pt_root[id] = NULL;
 		}
 	}
-	xe_vm_unlock(vm, &ww);
+	xe_vm_unlock(vm, &exec);
 
 	trace_xe_vm_free(vm);
 	dma_fence_put(vm->rebind_fence);
@@ -1999,21 +1963,6 @@ static int __vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
 	}
 }
 
-struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm)
-{
-	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
-		XE_VM_FLAG_GT_ID(vm->flags) : 0;
-
-	/* Safe to use index 0 as all BO in the VM share a single dma-resv lock */
-	return &vm->pt_root[idx]->bo->ttm;
-}
-
-static void xe_vm_tv_populate(struct xe_vm *vm, struct ttm_validate_buffer *tv)
-{
-	tv->num_shared = 1;
-	tv->bo = xe_vm_ttm_bo(vm);
-}
-
 static bool is_map_op(u32 op)
 {
 	return VM_BIND_OP(op) == XE_VM_BIND_OP_MAP ||
@@ -2032,11 +1981,8 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
 			 struct xe_sync_entry *syncs, u32 num_syncs,
 			 struct async_op_fence *afence)
 {
-	LIST_HEAD(objs);
-	LIST_HEAD(dups);
-	struct ttm_validate_buffer tv_bo, tv_vm;
-	struct ww_acquire_ctx ww;
 	struct xe_bo *vbo;
+	struct drm_exec exec;
 	int err, i;
 
 	lockdep_assert_held(&vm->lock);
@@ -2053,8 +1999,6 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
 		return 0;
 	}
 
-	xe_vm_tv_populate(vm, &tv_vm);
-	list_add_tail(&tv_vm.head, &objs);
 	vbo = vma->bo;
 	if (vbo) {
 		/*
@@ -2063,29 +2007,29 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
 		 * take a reference here.
 		 */
 		xe_bo_get(vbo);
-
-		tv_bo.bo = &vbo->ttm;
-		tv_bo.num_shared = 1;
-		list_add(&tv_bo.head, &objs);
 	}
 
 again:
-	err = ttm_eu_reserve_buffers(&ww, &objs, true, &dups);
-	if (!err) {
-		err = __vm_bind_ioctl(vm, vma, e, bo,
-				      bind_op->op, bind_op->region, syncs,
-				      num_syncs, afence);
-		ttm_eu_backoff_reservation(&ww, &objs);
-		if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
-			lockdep_assert_held_write(&vm->lock);
-			err = xe_vma_userptr_pin_pages(vma);
-			if (!err)
-				goto again;
-		}
+	err = xe_vm_bo_lock(vm, vbo, &exec, 1, true);
+	if (err)
+		goto error;
+	err = __vm_bind_ioctl(vm, vma, e, bo,
+			      bind_op->op, bind_op->region, syncs,
+			      num_syncs, afence);
+	xe_vm_bo_unlock(vm, vbo, &exec, false);
+	if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
+		lockdep_assert_held_write(&vm->lock);
+		err = xe_vma_userptr_pin_pages(vma);
+		if (!err)
+			goto again;
 	}
 	xe_bo_put(vbo);
 
 	return err;
+
+error:
+	xe_bo_put(vbo);
+	return err;
 }
 
 struct async_op {
@@ -2450,18 +2394,18 @@ static int vm_bind_ioctl_async(struct xe_vm *vm, struct xe_vma *vma,
 static bool bo_has_vm_references(struct xe_bo *bo, struct xe_vm *vm,
 				 struct xe_vma *ignore)
 {
-	struct ww_acquire_ctx ww;
+	struct drm_exec exec;
 	struct xe_vma *vma;
 	bool ret = false;
 
-	xe_bo_lock(bo, &ww, 0, false);
+	xe_bo_lock(bo, &exec, 0, false);
 	list_for_each_entry(vma, &bo->vmas, bo_link) {
 		if (vma != ignore && vma->vm == vm && !vma->destroyed) {
 			ret = true;
 			break;
 		}
 	}
-	xe_bo_unlock(bo, &ww);
+	xe_bo_unlock(bo, &exec);
 
 	return ret;
 }
@@ -2582,10 +2526,10 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
 	}
 
 	if (first->start != lookup->start) {
-		struct ww_acquire_ctx ww;
+		struct drm_exec exec;
 
 		if (first->bo)
-			err = xe_bo_lock(first->bo, &ww, 0, true);
+			err = xe_bo_lock(first->bo, &exec, 0, true);
 		if (err)
 			goto unwind;
 		new_first = xe_vma_create(first->vm, first->bo,
@@ -2596,7 +2540,7 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
 					  (first->pte_flags & PTE_READ_ONLY),
 					  first->gt_mask);
 		if (first->bo)
-			xe_bo_unlock(first->bo, &ww);
+			xe_bo_unlock(first->bo, &exec);
 		if (!new_first) {
 			err = -ENOMEM;
 			goto unwind;
@@ -2612,11 +2556,11 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
 	}
 
 	if (last->end != lookup->end) {
-		struct ww_acquire_ctx ww;
+		struct drm_exec exec;
 		u64 chunk = lookup->end + 1 - last->start;
 
 		if (last->bo)
-			err = xe_bo_lock(last->bo, &ww, 0, true);
+			err = xe_bo_lock(last->bo, &exec, 0, true);
 		if (err)
 			goto unwind;
 		new_last = xe_vma_create(last->vm, last->bo,
@@ -2627,7 +2571,7 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
 					 (last->pte_flags & PTE_READ_ONLY),
 					 last->gt_mask);
 		if (last->bo)
-			xe_bo_unlock(last->bo, &ww);
+			xe_bo_unlock(last->bo, &exec);
 		if (!new_last) {
 			err = -ENOMEM;
 			goto unwind;
@@ -2763,7 +2707,7 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
 					       u64 addr, u64 range, u32 op,
 					       u64 gt_mask, u32 region)
 {
-	struct ww_acquire_ctx ww;
+	struct drm_exec exec;
 	struct xe_vma *vma, lookup;
 	int err;
 
@@ -2776,14 +2720,14 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
 	case XE_VM_BIND_OP_MAP:
 		XE_BUG_ON(!bo);
 
-		err = xe_bo_lock(bo, &ww, 0, true);
+		err = xe_bo_lock(bo, &exec, 0, true);
 		if (err)
 			return ERR_PTR(err);
 		vma = xe_vma_create(vm, bo, bo_offset_or_userptr, addr,
 				    addr + range - 1,
 				    op & XE_VM_BIND_FLAG_READONLY,
 				    gt_mask);
-		xe_bo_unlock(bo, &ww);
+		xe_bo_unlock(bo, &exec);
 		if (!vma)
 			return ERR_PTR(-ENOMEM);
 
@@ -2808,13 +2752,13 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
 	case XE_VM_BIND_OP_UNMAP_ALL:
 		XE_BUG_ON(!bo);
 
-		err = xe_bo_lock(bo, &ww, 0, true);
+		err = xe_bo_lock(bo, &exec, 0, true);
 		if (err)
 			return ERR_PTR(err);
 		vma = vm_unbind_all_lookup_vmas(vm, bo);
 		if (!vma)
 			vma = ERR_PTR(-EINVAL);
-		xe_bo_unlock(bo, &ww);
+		xe_bo_unlock(bo, &exec);
 		break;
 	case XE_VM_BIND_OP_MAP_USERPTR:
 		XE_BUG_ON(bo);
@@ -3288,28 +3232,83 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
  * XXX: Using the TTM wrappers for now, likely can call into dma-resv code
  * directly to optimize. Also this likely should be an inline function.
  */
-int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
+int xe_vm_lock(struct xe_vm *vm, struct drm_exec *exec,
 	       int num_resv, bool intr)
 {
-	struct ttm_validate_buffer tv_vm;
-	LIST_HEAD(objs);
-	LIST_HEAD(dups);
+	struct dma_resv *obj;
+	struct ww_acquire_ctx *ww = &exec->ticket;
+	int err;
 
 	XE_BUG_ON(!ww);
 
-	tv_vm.num_shared = num_resv;
-	tv_vm.bo = xe_vm_ttm_bo(vm);;
-	list_add_tail(&tv_vm.head, &objs);
+	obj = xe_vm_gem(vm)->resv;
+	ww_acquire_init(ww, &reservation_ww_class);
+
+	if (intr)
+		err = dma_resv_lock_interruptible(obj, ww);
+	else
+		err = dma_resv_lock(obj, ww);
 
-	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
+	if (unlikely(err))
+		return err;
+
+	num_resv = max(num_resv, 1);
+	err = dma_resv_reserve_fences(obj, num_resv);
+	if (err)
+		goto out_err;
+
+	return 0;
+
+out_err:
+	dma_resv_unlock(&vm->resv);
+	return err;
 }
 
-void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww)
+void xe_vm_unlock(struct xe_vm *vm, struct drm_exec *exec)
 {
+	struct ww_acquire_ctx *ww = &exec->ticket;
+
 	dma_resv_unlock(&vm->resv);
 	ww_acquire_fini(ww);
 }
 
+int xe_vm_bo_lock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
+		  int num_resv, bool intr)
+{
+	int err;
+
+	drm_exec_init(exec, intr);
+	drm_exec_while_not_all_locked(exec) {
+		err = drm_exec_prepare_obj(exec, xe_vm_gem(vm),
+					   num_resv);
+		drm_exec_continue_on_contention(exec);
+		if (err && err != -EALREADY)
+			goto out_err;
+
+		if (bo && !bo->vm) {
+			err = drm_exec_prepare_obj(exec, &bo->ttm.base,
+						   num_resv);
+			drm_exec_continue_on_contention(exec);
+			if (err && err != -EALREADY)
+				goto out_err;
+		}
+	}
+
+	return 0;
+
+out_err:
+	drm_exec_fini(exec);
+	return err;
+}
+
+void xe_vm_bo_unlock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
+		     bool lru_update)
+{
+	if (lru_update && bo && (!bo->vm || xe_vm_no_dma_fences(vm)))
+		ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
+	drm_exec_fini(exec);
+}
+
 /**
  * xe_vm_invalidate_vma - invalidate GPU mappings for VMA without a lock
  * @vma: VMA to invalidate
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 748dc16ebed9..b2b7ff5c12fb 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -6,6 +6,8 @@
 #ifndef _XE_VM_H_
 #define _XE_VM_H_
 
+#include <drm/drm_exec.h>
+
 #include "xe_macros.h"
 #include "xe_map.h"
 #include "xe_vm_types.h"
@@ -38,10 +40,14 @@ static inline void xe_vm_put(struct xe_vm *vm)
 	kref_put(&vm->refcount, xe_vm_free);
 }
 
-int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
+int xe_vm_lock(struct xe_vm *vm, struct drm_exec *exec,
 	       int num_resv, bool intr);
+void xe_vm_unlock(struct xe_vm *vm, struct drm_exec *exec);
 
-void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww);
+int xe_vm_bo_lock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
+		  int num_resv, bool intr);
+void xe_vm_bo_unlock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
+		     bool lru_update);
 
 static inline bool xe_vm_is_closed(struct xe_vm *vm)
 {
@@ -96,8 +102,6 @@ int xe_vm_async_fence_wait_start(struct dma_fence *fence);
 
 extern struct ttm_device_funcs xe_ttm_funcs;
 
-struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm);
-
 /**
  * xe_vm_reactivate_rebind() - Reactivate the rebind functionality on compute
  * vms.
@@ -124,23 +128,10 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma);
 
 int xe_vma_userptr_check_repin(struct xe_vma *vma);
 
-/*
- * XE_ONSTACK_TV is used to size the tv_onstack array that is input
- * to xe_vm_lock_dma_resv() and xe_vm_unlock_dma_resv().
- */
-#define XE_ONSTACK_TV 20
-int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
-			struct ttm_validate_buffer *tv_onstack,
-			struct ttm_validate_buffer **tv,
-			struct list_head *objs,
-			bool intr,
-			unsigned int num_shared);
-
-void xe_vm_unlock_dma_resv(struct xe_vm *vm,
-			   struct ttm_validate_buffer *tv_onstack,
-			   struct ttm_validate_buffer *tv,
-			   struct ww_acquire_ctx *ww,
-			   struct list_head *objs);
+int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
+			bool intr, unsigned int num_shared);
+
+void xe_vm_unlock_dma_resv(struct xe_vm *vm, struct drm_exec *exec);
 
 void xe_vm_fence_all_extobjs(struct xe_vm *vm, struct dma_fence *fence,
 			     enum dma_resv_usage usage);
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 29815852985a..6fe1316ea229 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -28,16 +28,16 @@ static int madvise_preferred_mem_class(struct xe_device *xe, struct xe_vm *vm,
 
 	for (i = 0; i < num_vmas; ++i) {
 		struct xe_bo *bo;
-		struct ww_acquire_ctx ww;
+		struct drm_exec exec;
 
 		bo = vmas[i]->bo;
 
-		err = xe_bo_lock(bo, &ww, 0, true);
+		err = xe_bo_lock(bo, &exec, 0, true);
 		if (err)
 			return err;
 		bo->props.preferred_mem_class = value;
 		xe_bo_placement_for_flags(xe, bo, bo->flags);
-		xe_bo_unlock(bo, &ww);
+		xe_bo_unlock(bo, &exec);
 	}
 
 	return 0;
@@ -53,16 +53,16 @@ static int madvise_preferred_gt(struct xe_device *xe, struct xe_vm *vm,
 
 	for (i = 0; i < num_vmas; ++i) {
 		struct xe_bo *bo;
-		struct ww_acquire_ctx ww;
+		struct drm_exec exec;
 
 		bo = vmas[i]->bo;
 
-		err = xe_bo_lock(bo, &ww, 0, true);
+		err = xe_bo_lock(bo, &exec, 0, true);
 		if (err)
 			return err;
 		bo->props.preferred_gt = value;
 		xe_bo_placement_for_flags(xe, bo, bo->flags);
-		xe_bo_unlock(bo, &ww);
+		xe_bo_unlock(bo, &exec);
 	}
 
 	return 0;
@@ -89,17 +89,17 @@ static int madvise_preferred_mem_class_gt(struct xe_device *xe,
 
 	for (i = 0; i < num_vmas; ++i) {
 		struct xe_bo *bo;
-		struct ww_acquire_ctx ww;
+		struct drm_exec exec;
 
 		bo = vmas[i]->bo;
 
-		err = xe_bo_lock(bo, &ww, 0, true);
+		err = xe_bo_lock(bo, &exec, 0, true);
 		if (err)
 			return err;
 		bo->props.preferred_mem_class = mem_class;
 		bo->props.preferred_gt = gt_id;
 		xe_bo_placement_for_flags(xe, bo, bo->flags);
-		xe_bo_unlock(bo, &ww);
+		xe_bo_unlock(bo, &exec);
 	}
 
 	return 0;
@@ -112,13 +112,13 @@ static int madvise_cpu_atomic(struct xe_device *xe, struct xe_vm *vm,
 
 	for (i = 0; i < num_vmas; ++i) {
 		struct xe_bo *bo;
-		struct ww_acquire_ctx ww;
+		struct drm_exec exec;
 
 		bo = vmas[i]->bo;
 		if (XE_IOCTL_ERR(xe, !(bo->flags & XE_BO_CREATE_SYSTEM_BIT)))
 			return -EINVAL;
 
-		err = xe_bo_lock(bo, &ww, 0, true);
+		err = xe_bo_lock(bo, &exec, 0, true);
 		if (err)
 			return err;
 		bo->props.cpu_atomic = !!value;
@@ -130,7 +130,7 @@ static int madvise_cpu_atomic(struct xe_device *xe, struct xe_vm *vm,
 		 */
 		if (bo->props.cpu_atomic)
 			ttm_bo_unmap_virtual(&bo->ttm);
-		xe_bo_unlock(bo, &ww);
+		xe_bo_unlock(bo, &exec);
 	}
 
 	return 0;
@@ -143,18 +143,18 @@ static int madvise_device_atomic(struct xe_device *xe, struct xe_vm *vm,
 
 	for (i = 0; i < num_vmas; ++i) {
 		struct xe_bo *bo;
-		struct ww_acquire_ctx ww;
+		struct drm_exec exec;
 
 		bo = vmas[i]->bo;
 		if (XE_IOCTL_ERR(xe, !(bo->flags & XE_BO_CREATE_VRAM0_BIT) &&
 				 !(bo->flags & XE_BO_CREATE_VRAM1_BIT)))
 			return -EINVAL;
 
-		err = xe_bo_lock(bo, &ww, 0, true);
+		err = xe_bo_lock(bo, &exec, 0, true);
 		if (err)
 			return err;
 		bo->props.device_atomic = !!value;
-		xe_bo_unlock(bo, &ww);
+		xe_bo_unlock(bo, &exec);
 	}
 
 	return 0;
@@ -174,16 +174,16 @@ static int madvise_priority(struct xe_device *xe, struct xe_vm *vm,
 
 	for (i = 0; i < num_vmas; ++i) {
 		struct xe_bo *bo;
-		struct ww_acquire_ctx ww;
+		struct drm_exec exec;
 
 		bo = vmas[i]->bo;
 
-		err = xe_bo_lock(bo, &ww, 0, true);
+		err = xe_bo_lock(bo, &exec, 0, true);
 		if (err)
 			return err;
 		bo->ttm.priority = value;
 		ttm_bo_move_to_lru_tail(&bo->ttm);
-		xe_bo_unlock(bo, &ww);
+		xe_bo_unlock(bo, &exec);
 	}
 
 	return 0;
-- 
2.25.1

