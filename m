Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FAB6E80B3
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 19:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D6FE10EA50;
	Wed, 19 Apr 2023 17:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66D910EA5B;
 Wed, 19 Apr 2023 17:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681927040; x=1713463040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=N7JXzrFIHiRK2SMYHLLwITn25px3/xISumN93japdyM=;
 b=S2C+x2yIBjrOiy1JX5N0fOTf7Guj9cPr4yPhY6c1zv6WhoO7kmz6VYt5
 bqMw3IfDK7f0H7WxRs7R222VRGoeMQ05ahDZpJmP/G7FSoH6zprRRUvjf
 6Pr7/ApQwEq/xNJb2lEl8trAqlVtxiXyt6SbJlCA5mC87IR61rL4Ttvxn
 MgKdw4zh0LeISkR0Kg6qxDxWnwuYbfbdtydTXeMGUedlk+jP1QZmOBpgp
 ELN6Bdirtn6Q07L98dm8iZjKiQuOZ5b7KGO3lVx917STTpKbshIFYn4Rz
 LT1i5FOApS8YLT3PTib6TX3Tycew6nScF+RsFRozI0hx1amtYeB7WQxLq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="345519881"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="345519881"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 10:57:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="756192766"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="756192766"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 19 Apr 2023 10:57:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 10:57:19 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 10:57:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 10:57:19 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 10:57:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=duH+FfsGpj0j64InTxydvVTsYpstRMubSLylT6IVa5UOq3V3QOZVtqbH/kZBuzGnXgKFdKXtQp1ftAl/ZZSVcYeJClqMq/L5geno5SZlSwT06Jvg4lzs0Ci0O0XyzkOCWrfLBgtOfZRYpaE8vT69aLkYYWRepsi3jZyDiJR78n4WMZblRGxsHC8cgq1zAya/7FBNeXKr+97U78lFnQTx1wXQOTTWGlAMyzr+IAyAZSwpPMHWFUAf4hswNXI749jirpjOjgxUT6BRW/bvsxvfuogOCyEmYljtyocXtUUlkAwPOwUhDZlIVM3IRsHnq287W+Bt+aojF2kIYUDtV8Bh/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAVp+RAgZRXfjPDgm2+IXWMb2H2EvtMDf6Hfey8aWOA=;
 b=JJOYbHh5iHXabeLs1e4RTxEBOC2lGW5cap02Az689DuJG/sdgQ4sGTwxrL2jrWvClq2acxZxq6saDhZ7pxeg3h6sQP3hTxWw74Dsqpqr50BC+dUuhv54/ESpd0gvBam1tRyI3KzCIP2iFoyGAJrD30iiv5YDG5cukv6JhjFoGlnnlWPYL9iYuVcNqBwJ//ikzNY8xfUJrRy3fdLdq7aH1df9zDjeiBEzEz+L5UxZ+C/owdiaP4RwVeDrz3OfCVQXWnYooji/Nw6ybqxuV2+4un2s86Wnbc4XQhGVWxog0TW8l2iPggYQRv11Z6Tr1Oj5jGGUQldPyeGF67C5v96BGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by SA1PR11MB6848.namprd11.prod.outlook.com (2603:10b6:806:29c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 17:57:16 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::31f7:5096:35b0:b458]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::31f7:5096:35b0:b458%2]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 17:57:16 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v3 3/3] drm/xe: switch to using drm_exec
Date: Wed, 19 Apr 2023 19:56:50 +0200
Message-ID: <20230419175650.3259121-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419175650.3259121-1-francois.dugast@intel.com>
References: <20230419175650.3259121-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::10) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|SA1PR11MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: ba66988f-a631-4d80-29a9-08db40ff82df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U4LzsUMHLFyUJZo3V2HeunPSOibaTLqBu4vlCz9sqy+FJltdmlA2w+vaLMS/h7EQHzvOJSy/4pDzGfa3PGSLvzQJVggq9k8lMoplAZWOoeGifQQMz2nDMbtVYR712yWmGF3i82526ClDn+3Nxs25JPvzpE0ddZ1AevuBnSb8WcGGN2EFN66+H7+earBRuFsjFtw7/CNoYWvQ5RN1tbcwqw8xIO7T1GWIAbIMjGcwMTiKnqdBj2q1mNy3uVb1ljmNovPXz47GFHd7oAYMWlLi4s1FTsr5F2TLuKLnccVXwkixjfIExfJLgI2w1WKgrR25oS5BgO2YlGN0Had8rIIdHOTCA/B1ZGotxlTkSNpia3z6hQ01bZW24ewrCKuqZ5U5i8+NopWqthHOqnqpJPGSF2Xrd0Urox0iLGkA4mrvDbB3a82sSPYg2s0Jp/Ns9XkwecpgdJdcpUceKiK28C9ZtLtgRMzRWZznStqMf1QENJBlhhfvxZkj/z/NCh77ITvk9mLMKN+rfLp2NaN/m5bt8wEXwk79dC3pG9buVINyd+wDsBelQIngwrhFjPYpY5am8e2f7yUO8id3IzPSlwtTQCFyycLRE/fH9YwE4RdhuXI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199021)(36756003)(4326008)(316002)(6916009)(66946007)(66556008)(66476007)(6486002)(41300700001)(6666004)(478600001)(5660300002)(8676002)(8936002)(30864003)(2906002)(44832011)(86362001)(38100700002)(2616005)(107886003)(6506007)(1076003)(26005)(83380400001)(82960400001)(186003)(6512007)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjlJY01OVHZ4WkpydHl3SXZyRUU5WGhoSFZyeDRHNmF2ZGpITkNlVzAzWEQz?=
 =?utf-8?B?c1JhMUIyeUduNE9tNXhBRWFiMTNZK01Fak9PcEQ4d0pLMndRZW5sNnN5MEtl?=
 =?utf-8?B?aktDTnJMTUlRbHF6Z1M1Rmh0Z1ZtMi9WTTRWV0pmUUVvaERaWmdnb2NiYzdu?=
 =?utf-8?B?VmdNaEV3dml1Zy9SQ3lhSTA0Yjc3SnhxTHpOYTRWeDc1YkcrR0lwdUNidXg3?=
 =?utf-8?B?YzQ5Q3VoNHdIc0laQ3A0cWd4Ums2cjJxYTNqYkd3dSs3MzRNQkkyVVRHS0ZC?=
 =?utf-8?B?bm9wdnFFRGRHUExJbDJhOUxDbXQxSWxMVlVESHZBV1VrQ2cvZTYvY2tUOWpP?=
 =?utf-8?B?SFdoQ3JiYmx2TXo2VXBZYXg5R01KRFpvT055bGRtZnN5aEgyclR4WkVJRHYr?=
 =?utf-8?B?MEFDTk8xMVlsQlBDMC9LSnhLejdsUUI5a1A4dWIyRmpJMmNOaFRrTjU5anI5?=
 =?utf-8?B?U1FVS0NnbFFrNjdnYlUvVTcxeS9UdGprL0JjZGRDeFZVRFVyV1Yva2kya0JV?=
 =?utf-8?B?V2VMREJNT2NJaUFKcHB5M1hmS1E0L2NQV1NyQkR6UWhaM29RZGNQcVhyalVN?=
 =?utf-8?B?dXljSFR4SGdZdmdES2cyRXBOb0VTb1lINnl0eDZXN2pUSmVCMTcvcU91RFlm?=
 =?utf-8?B?NzVuSVdPRkNxeHYrdGl6VmdTNFJYL2dYdVZldjZmYjRHN05zdGI2TWN6Nmsv?=
 =?utf-8?B?UzFRRjFhK1Bvb1NsL2tsd0ZXbHlldUFMaFdSc2o3ZU5ZUkVsaExMaTZYMkxT?=
 =?utf-8?B?MjJBck5VMEo3NnNlZUZrcHZjZ2FPZ1hwMU9lUnFXUE41WTMrTnRScjdvRktk?=
 =?utf-8?B?OExqR0hWK3JWR0hQM2lPVFBuZkgrQ1ZXekZsQWRkSW5DclB2Z0NCRE1TUnJT?=
 =?utf-8?B?WDNROFltZC9id1hBUXZNdzd1RkhTMTd1ait0R1d6SEdVSW1lOXpsTU94TFMr?=
 =?utf-8?B?TGdYQys2Q3Z0UGdDeFkyamtoVk9yRnF2MFlZSi9QY1hWYTQySWMwRG1uazdJ?=
 =?utf-8?B?Rk40clI4T3RhakgwWVVlcW5Fb1RldkpVR1VsU1ZTN0FoY2tXV2Nadm1Mejhm?=
 =?utf-8?B?b1hsVzVReTNlWkpkQnlnenUvazJOUGtIb1RISW5WTVBYbXpLSnJ5aEsvVVYx?=
 =?utf-8?B?N0FqWmNjWlZ0d0d6enRnRU9oMm5CbUtzMlEwa1loOEF3VVB2ZU5KVUdQZDla?=
 =?utf-8?B?Q2oyUDN5UFg5TFE2NzlKNU1Nd2VCMVRKcGM4b2RvMGplaVdNODJJQVByM2Zo?=
 =?utf-8?B?eW1XY3Vsc0tvTThyM3R3bDV4YkV5RkZQZUNTZ0RONUZkMlZ0UVhMS0VVU0Fq?=
 =?utf-8?B?SlpLbVJvdzlNS1pxbGR5R3BZM09KekNKSi9HSGlXSmFXZFZzbndEWGkzVlQr?=
 =?utf-8?B?WVl4ZHNWbnZmMHpTSk1xU05RL2ZMQ1pwRFB3MldKY3QraUM2L1lRS0FkdVds?=
 =?utf-8?B?UEFRNkpONTlOaEpZRW4wenM1dkZ2bDZ1ZHVtRHJ0a2JGZ2wrWHFQNWpSb3NB?=
 =?utf-8?B?aVZzRzcyVzNocVgxajMwRmJRTG1GUWdzY0lIL1VJS0d3SzlXV2w2R2d4VE9S?=
 =?utf-8?B?dWkrYUd3NFJaZldFRkpjSy84djRJS242aTd3M2JqQVZOYTQ5NkNhb1NESUNU?=
 =?utf-8?B?WG1YTTgySlZBd3lXNWZjTHVWdExkdk15U3l2cU1OVE5ScHRVSXU4L3gxYVhE?=
 =?utf-8?B?WlVXQTl2VHg5WFpGSE1tZng5MlUyTkI4Ums1TDcyOEw0RWFsUm41MUtSNEJs?=
 =?utf-8?B?WnhxbkxrcW96MVBPRWJBeXVocjlicVhNd2ZRYmpUMWh2MGZQT0toWjBHZlht?=
 =?utf-8?B?RVlKVFVSZHpkeGJlRitlekY1QlJrQ2Z2bzg1b3JUckpDSFV2Z0huemxnczlh?=
 =?utf-8?B?ZGpWVHVQR1hIQXFUSjdMUDFoZzI1dUV6bVRVYnF5NytKMVBXK05qeUZoUTkz?=
 =?utf-8?B?NEVlSG1WdWQzOUNxb3lHck91dUlISW00eTVnaUZ4eWdwYlJFUHdvOGxhS092?=
 =?utf-8?B?MWh1ajc0WlF1WWVmdy9RSjNCeVlDbFp2VXYwZnk1SWtBcEU5dW9yN1pZYlhk?=
 =?utf-8?B?L0xwM3BIeGlqM0xqUjFEQm9meEpISHpxaGtNVGRzOGVldm1JcnBNaGZCUHN6?=
 =?utf-8?B?bEFBeEhSOW1ZYTBDZFR5WTRzdE4reC9qem96dWlNNCtZRlFKRGVESjBnZ2pk?=
 =?utf-8?B?ZkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba66988f-a631-4d80-29a9-08db40ff82df
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 17:57:16.2195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nuMsXfnQvxpok43upuEIh0dL7oSk2+VIFG9wemaPJxbUKiy2IkFwPBztSpHBsi2l1gJebm8IsuRpFxS9tlJTLKwx4cc14buQhHxdrpb/EOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6848
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
 drivers/gpu/drm/xe/Kconfig           |   1 +
 drivers/gpu/drm/xe/tests/xe_bo.c     |  17 +-
 drivers/gpu/drm/xe/xe_bo.c           |  29 +--
 drivers/gpu/drm/xe/xe_bo.h           |   6 +-
 drivers/gpu/drm/xe/xe_bo_evict.c     |  24 ++-
 drivers/gpu/drm/xe/xe_bo_types.h     |   1 -
 drivers/gpu/drm/xe/xe_exec.c         |  30 +--
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  56 +-----
 drivers/gpu/drm/xe/xe_vm.c           | 287 +++++++++++++--------------
 drivers/gpu/drm/xe/xe_vm.h           |  29 +--
 drivers/gpu/drm/xe/xe_vm_madvise.c   |  36 ++--
 11 files changed, 232 insertions(+), 284 deletions(-)

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
index 9bd381e5b7a6..78e43fd5c909 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -176,6 +176,7 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
 		XE_BO_CREATE_VRAM_IF_DGFX(gt);
 	struct xe_vm *vm = xe_migrate_get_vm(xe->gt[0].migrate);
 	struct ww_acquire_ctx ww;
+	struct drm_exec exec;
 	int err, i;
 
 	kunit_info(test, "Testing device %s gt id %u vram id %u\n",
@@ -198,9 +199,9 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
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
@@ -249,9 +250,9 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
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
@@ -259,18 +260,18 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
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
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 3ab404e33fae..bb185093c5e0 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -8,6 +8,7 @@
 #include <linux/dma-buf.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_exec.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
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
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index bdf82d34eb66..ba408ac96be5 100644
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
+		err = drm_exec_prepare_obj(exec, &xe_vm_ttm_bo(vm)->base, num_shared);
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
@@ -2008,12 +1972,6 @@ struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm)
 	return &vm->pt_root[idx]->bo->ttm;
 }
 
-static void xe_vm_tv_populate(struct xe_vm *vm, struct ttm_validate_buffer *tv)
-{
-	tv->num_shared = 1;
-	tv->bo = xe_vm_ttm_bo(vm);
-}
-
 static bool is_map_op(u32 op)
 {
 	return VM_BIND_OP(op) == XE_VM_BIND_OP_MAP ||
@@ -2032,11 +1990,9 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
 			 struct xe_sync_entry *syncs, u32 num_syncs,
 			 struct async_op_fence *afence)
 {
-	LIST_HEAD(objs);
-	LIST_HEAD(dups);
-	struct ttm_validate_buffer tv_bo, tv_vm;
-	struct ww_acquire_ctx ww;
 	struct xe_bo *vbo;
+	struct drm_exec exec;
+	struct ttm_buffer_object *obj;
 	int err, i;
 
 	lockdep_assert_held(&vm->lock);
@@ -2053,8 +2009,6 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
 		return 0;
 	}
 
-	xe_vm_tv_populate(vm, &tv_vm);
-	list_add_tail(&tv_vm.head, &objs);
 	vbo = vma->bo;
 	if (vbo) {
 		/*
@@ -2063,29 +2017,30 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
 		 * take a reference here.
 		 */
 		xe_bo_get(vbo);
-
-		tv_bo.bo = &vbo->ttm;
-		tv_bo.num_shared = 1;
-		list_add(&tv_bo.head, &objs);
 	}
+	obj = xe_vm_ttm_bo(vm);
 
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
@@ -2450,18 +2405,18 @@ static int vm_bind_ioctl_async(struct xe_vm *vm, struct xe_vma *vma,
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
@@ -2582,10 +2537,10 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
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
@@ -2596,7 +2551,7 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
 					  (first->pte_flags & PTE_READ_ONLY),
 					  first->gt_mask);
 		if (first->bo)
-			xe_bo_unlock(first->bo, &ww);
+			xe_bo_unlock(first->bo, &exec);
 		if (!new_first) {
 			err = -ENOMEM;
 			goto unwind;
@@ -2612,11 +2567,11 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
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
@@ -2627,7 +2582,7 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
 					 (last->pte_flags & PTE_READ_ONLY),
 					 last->gt_mask);
 		if (last->bo)
-			xe_bo_unlock(last->bo, &ww);
+			xe_bo_unlock(last->bo, &exec);
 		if (!new_last) {
 			err = -ENOMEM;
 			goto unwind;
@@ -2763,7 +2718,7 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
 					       u64 addr, u64 range, u32 op,
 					       u64 gt_mask, u32 region)
 {
-	struct ww_acquire_ctx ww;
+	struct drm_exec exec;
 	struct xe_vma *vma, lookup;
 	int err;
 
@@ -2776,14 +2731,14 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
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
 
@@ -2808,13 +2763,13 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
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
@@ -3291,17 +3246,24 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
 	       int num_resv, bool intr)
 {
-	struct ttm_validate_buffer tv_vm;
-	LIST_HEAD(objs);
-	LIST_HEAD(dups);
+	struct dma_resv *obj;
+	int ret;
 
 	XE_BUG_ON(!ww);
 
-	tv_vm.num_shared = num_resv;
-	tv_vm.bo = xe_vm_ttm_bo(vm);;
-	list_add_tail(&tv_vm.head, &objs);
+	obj = xe_vm_ttm_bo(vm)->base.resv;
+	ww_acquire_init(ww, &reservation_ww_class);
+
+	if (intr)
+		ret = dma_resv_lock_interruptible(obj, ww);
+	else
+		ret = dma_resv_lock(obj, ww);
 
-	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
+	if (unlikely(ret))
+		return ret;
+
+	num_resv = max(num_resv, 1);
+	return dma_resv_reserve_fences(obj, num_resv);
 }
 
 void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww)
@@ -3310,6 +3272,43 @@ void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww)
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
index 748dc16ebed9..8f7ba4fcea6a 100644
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
@@ -40,9 +42,13 @@ static inline void xe_vm_put(struct xe_vm *vm)
 
 int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
 	       int num_resv, bool intr);
-
 void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww);
 
+int xe_vm_bo_lock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
+		  int num_resv, bool intr);
+void xe_vm_bo_unlock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
+		     bool lru_update);
+
 static inline bool xe_vm_is_closed(struct xe_vm *vm)
 {
 	/* Only guaranteed not to change when vm->resv is held */
@@ -124,23 +130,10 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma);
 
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

