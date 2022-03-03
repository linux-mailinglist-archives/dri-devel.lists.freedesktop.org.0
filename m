Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EE14CC4C6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 19:12:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072D310EB85;
	Thu,  3 Mar 2022 18:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104AD10EB58;
 Thu,  3 Mar 2022 18:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646331122; x=1677867122;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ghWSYON4BNyUja3kwJN4byG4m6mHqjQHvzsx1e6HfM8=;
 b=QKyIRyd6fVArJVCOvpLZamJdOjmN1He+zbsLHT8Hh6/Xjs/WTCBAUI8k
 9FsPttgorQODl03/Dn6qzBEeGqCSkRtH8kZ/QmWtdiQT8BpNWHsdQ1MEV
 XxFILg8oFvvg2ngN83nn5F3OLH8irKMXxyXT+N4nYrzj8xhW9DndhWy8E
 MW0H3Xej2gmI0QjZTO6E3+KslaFYei6Fhm6DsAcu9N/6BjPzg7jWrpve/
 1NNTMetiUZvChz5BBMrqwy4Lcf6okAuEdWhCHygy12LbCYXQeDq5DD9Be
 4Dbg3ioiSwSfdSKpAs4E22VmjWDsNjuzq4gNAMz4quPlvyesCcyGGUXyl Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="233724297"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="233724297"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 09:59:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="545950300"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga007.fm.intel.com with ESMTP; 03 Mar 2022 09:59:37 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 3 Mar 2022 09:59:37 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Thu, 3 Mar 2022 09:59:37 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 3 Mar 2022 09:59:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnQaHbXU5bqS8DSSjzNWkkErVXBn4hLfboPxqfZVgy55tBKG9o7uq8/0Lm0l3IQ/p4tkzRMtWQlFuk26YOVwq4q0XFan8cdo/L0LMUVqUjq4nnvpdLa40cC4shjld5IbK5/B+HdV//pkhwbkjopKTEiVw9LjtiOVaLbj8d48CxYSDx8Vn467v062OPdFkpzCxBAQr7pIJK/HjPhOLGeTOevq2Ehm6U1TmT/0yNTgQMIfChhmLyrTa2g4i5qR5kcWKoNogv5YL3TE8xDpHV3eOqbMD56+KrPsCUIha/LVexIS6EjwwtagIYH1uvP9zRsinG8BuZYWQCIB36hVr0HgYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5BpQiILXsfejoWONDIWaz2C4WC1NW2uHWq8JKDYE9A=;
 b=a+fGMsCzk8v5Yn+nbxWgYrTZxmzVuttNGn8zI9caTvSBv5U6TnwRlX7NMgYgCjWDzMKlWeHaCePB6pIlSX4BJL65pUwhT5IL2f7Ix2/TdELikwiNlwqs97rwaR5NDMCBEv/S2zbwmzP2MRl8P1+hlxM4b7Ax+RRKV9Up+3gWZ3DxUxSGJ8ijnORUil9jqw1vvnulsb5Rb4mYx8rKLl87UOOK14XAcWqxfrCzrmGY/myxYjugNRHMcsUKEw9HgC8CWa++9tuEzpA1rchclvJuZHuqX0m3zvd3wSH6nS5gQnKro4GakxIBj+SKCQCYb9T4J7qK61GZ07NubYf2wKVwog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by DM5PR11MB1244.namprd11.prod.outlook.com (2603:10b6:3:13::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14; Thu, 3 Mar 2022 17:59:34 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475%8]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 17:59:34 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 6/7] drm/i915/gt: Avoid direct dereferencing of io memory
Date: Thu, 3 Mar 2022 23:30:12 +0530
Message-ID: <20220303180013.512219-7-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303180013.512219-1-balasubramani.vivekanandan@intel.com>
References: <20220303180013.512219-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0126.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::30) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99b947b2-eabf-4e1b-71fe-08d9fd3f9354
X-MS-TrafficTypeDiagnostic: DM5PR11MB1244:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR11MB12445F18048B7CF95192C7409F049@DM5PR11MB1244.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ESljUbb25Zw8MT289nVGxjActqb37ovvClKcI4pahejDxxGsZgfiGiDLIuyKT4hcJnXsR87vKAZSeVE28OMDfQX1ugsFvjb5wKca6JtDjqfoG7LJvr8PfIN6v5tlzjwqF0rL3GjvKGgccdFn3kGjdNECIfAqPPdDknLVnB6+OcRD2SVcB8Znv0tP9JFM5kScyLqxbsupkBiOn51/i/QaSBTN69rz1n09cHy8ZQx7f4w6Gow5t9v3jT86XVsSClhKV10rl4plI9onjzpC7ZdXFa/T017FII/jul4K93jAaLrDFTNFC0roSNVM/JlyvJAzbL73lIQVXIkYhnawsema3fUQJlKlUy2qZue9UnKbhJi/KPEwdkc0aqhGyD1kUf8+HnhzVwjvr0Z5KsZO4Jsf+4oBNVtvaght9cJu0NCqTMDzoCR1CguFRvx3ovYeqFb98stjaR0WfthNmFGBiGjD9WfqhPeLgKj1Tgpg9DLMizfM098QCBXi3f/hJt4+ilAaLfzDQxhCypUzgo9QX+zH3u5vE6l7CwxG8u3QVnWMh0vqasT5/kT+W3DIvJgIochYr+d8QOkH1hefK6eWXMjOicuU7UN4CSK6OhqzeFhMNPbxcKp/S5CXCsFOKBvmwy10MTzmmF57uitHfvM4pR/0Og==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(6486002)(316002)(38100700002)(66946007)(66556008)(6666004)(450100002)(66476007)(8676002)(82960400001)(86362001)(4326008)(54906003)(83380400001)(36756003)(6506007)(107886003)(1076003)(2616005)(5660300002)(2906002)(6512007)(44832011)(186003)(8936002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFNPZjY3Q3FKeEM4RGlUazVCSy9HL0hTM2o0am4rb2FRbXlWNVBjWmFiL0pD?=
 =?utf-8?B?Q3lCUmMyUjdiYm9ENFFPcG1DbWVTalRYOE40RUppNU1yV1VWSUtZcTZQRkFN?=
 =?utf-8?B?RnRsK3lqV3hXQjJ4MFV4UWtvM3dZRmhXREp0cEZ1cGZicjdXTDRQbWd3dlI5?=
 =?utf-8?B?SGVaOU1jS3V3cmtwcFJCZ2tNNkliemFMNHY0YjRNd1NZblAxZEVtT1VFZENq?=
 =?utf-8?B?T1dqT0xUb1FtTWZDMjU1MlZKQ0I0SG1vYkQwYytMeTNEVkpYMEpkcld6ODAx?=
 =?utf-8?B?aTA0R0FLOERUVFMwbVNwQlRTNW9yTHFTaTZoNmNuZWpRRHFiOVNueDlodTdG?=
 =?utf-8?B?T0NTWURTaitlZzV3M0FYdjRPMUxjQmJwODJQTExyeXp5dVRlOER5eGVXR3kv?=
 =?utf-8?B?a1daMm9kbUhzZHBpN1UwUlh5RVFpSmMwR3J4a3pOeVhrN04yZUNOZ0dnMS9C?=
 =?utf-8?B?WlZ2VmFTNzE5WTkzV1VNUFVPMVZXeCtHcDQzVSsyY0h3Yk1QSFF2MzcydDNx?=
 =?utf-8?B?b1RVU1hvTUt6SzhqUFlBc0NURmE3TUt0U0ZKU20zc3lSSHpoQWJSUkhJRlFY?=
 =?utf-8?B?TGg2cDNaUjBYdUNGTnlGZEMwcXpic2FDb1U4SWZzeVNyUndadVhPWmV5Q0tF?=
 =?utf-8?B?OU1VV3JDMnlCYVR3UGtPYno2NyswQUJQT2w3di96VGlXdUhoRFZMNnk1NGN6?=
 =?utf-8?B?WE5NekVBcXVYY2Zwc2tzKzV4M2RDRTJjeFd2TmZZMWo3dTNUSG03Y3RYZURX?=
 =?utf-8?B?S0s2ajR5cWpVV05lNUJqajIzbldRY0FiR3FjT2dPVCtmaEdTd0IxN21UWmhT?=
 =?utf-8?B?QWdrUVZ3VXBhd1lsYzhtcHhKRmtOMjlJaUhwYVZQL096NmkyWFJaRVhXZmx4?=
 =?utf-8?B?bnRGQVU5NytlQXN5NVFyZ2F4MUVuY0RvcGdZRlZROWc4TVNBQldtaVpMajN3?=
 =?utf-8?B?SCtYZkVtbVRqcmthKysxTFMyQWhZckg0Qi9keUl4VFlNSTY1Z2ZzamliRHNi?=
 =?utf-8?B?amtnM2xNYmMxQ3BLWmo1Wll2RFNrKzRzWHlDV1JHN3VyODRrQlRldW00NDVu?=
 =?utf-8?B?cDhMU0VwTHlvdTJkZ1hSemE5U1RLT2pHVkdPenZ5L3FhYmtnbHhnZm42bjQv?=
 =?utf-8?B?TEhQQnNQYUt6TmU2NmUvNkdmbFJSWEczL1YxNzFuRUxjT2QxMkNQbVpweTZK?=
 =?utf-8?B?eXhxZFZZdnR2dmlGckZ1d1QweUpJODRkYkRaOTRvZFRwaldJSEc1emVkemcv?=
 =?utf-8?B?NXpyN2Mrbzg4MFNOQk02WjYwK0RHNVkvZDF4RVExdHUzSUJOZHJ5Qy9sc0ZO?=
 =?utf-8?B?eDRtUVpleHBXSE1zVGh0Sk9LcEpNcFVKTlRoaDlCNVNIOFVXdlBEYmFLTDMr?=
 =?utf-8?B?OVg1NFhVcXpRTldGanZzRXQ5VVBlTUdHV0tiTU9ub3pISERhRTVINTNUTDNW?=
 =?utf-8?B?TnZ5VDhDT3hkYVdUNEpYR2RCU20xbnFGTlI4cjIrdWIrMW9LclpkUHdpVFZr?=
 =?utf-8?B?SWRnTThscFBkSERHaVV1elYyeCtsYStKeXZSVUxTQ0pFOExGUDIvck5MVTY2?=
 =?utf-8?B?eVJxMW92TWtvZHRSc3VMM0N3ekxGbUN2RVlJS0NXbVdsWEtFTnRMMkJkb2Uv?=
 =?utf-8?B?RHhsSlBxYXRRNkYrN0thNDQ2MWlvcktBRDcwZjEzQzFmMk9hNVRiZ3g1NmRs?=
 =?utf-8?B?alhjaFdWeU9QUUJlcmVra2hxYXdyVHBHZmRqNnlrdHhLRjFPSGpUU013YSsv?=
 =?utf-8?B?N09DTktJU0lmblpMMU0zNTBxTUlyVHEwdiswalI3YVExdUZ1UGJ3ZWV5MHBS?=
 =?utf-8?B?MEMrL203NDRkT0FXeElnMVZRd05udTNRNGpVVkVmdGFhNDlhazhPNXMxNE9G?=
 =?utf-8?B?V2FlM0s1RStvNEkxL1A2M3VhR2tKTmdLU0g4RWdQajVmSUtnV3o5UmRpV0Zs?=
 =?utf-8?B?c0N6eXY0cTRRdExKVWxFRUxQYitJaGxBeEgxeVNKQ1VKeWloVmljUWVJeS91?=
 =?utf-8?B?UXV4RC9QbHZ2R2hudlhxTjI0Nk5GUTNzMnBlNStoUXZBbllLOUxoNTQ1alQ2?=
 =?utf-8?B?MkJzbmxxSG5vTDRiaURqc1BRdUNDWHhsVUJvbWowU2xIaXVvbDVlQ2h5aENO?=
 =?utf-8?B?MThxTEZnS3NaWTF3RnVzY21tb3BvQnBWYkRrZ1RiZ0NNWGxlWDk4M1NuRXJP?=
 =?utf-8?B?S3A0WGxZQ1VTaStRVzBrNUh3WVV1U2diMmtDY3lRMUVucGNRZUcrTER3YmQx?=
 =?utf-8?B?VW9EL3oyRCs5Sk9IU1RKTk5NS1pmMU10aGhUS3NyTUtzRkxqb2ZwTlJPMmJJ?=
 =?utf-8?B?b0JXRENIQW5GeG9nbXJuTDZkZ1U4bk9UNjlqeG1KakhQYjZWbHhqUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b947b2-eabf-4e1b-71fe-08d9fd3f9354
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 17:59:34.7749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9k8KPmK8iLUoNt5py/MGbielqwWcEM4P5QgAgWu5688Yj7Xso3emVmKRyySFWsJptj8Ir8xX4dfAerCDR5P1eSNKM+JiKRtg/z0BDSsoJeUeXPLVjvd4lCXpbE5gtkt2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1244
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
Cc: Matthew Brost <matthew.brost@intel.com>, michael.cheng@intel.com,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 wayne.boyer@intel.com, casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 siva.mullati@intel.com,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

io mapped memory should not be directly dereferenced to ensure
portability. io memory should be read/written/copied using helper
functions.
i915_memcpy_from_wc() function was used to copy the data from io memory to
a temporary buffer and pointer to the temporary buffer was passed to CRC
calculation function.
But i915_memcpy_from_wc() only does a copy if the platform supports fast
copy using non-temporal instructions. Otherwise the pointer to io memory
was passed for CRC calculation. CRC function will directly dereference
io memory and would not work properly on non-x86 platforms.
To make it portable, it should be ensured always temporary buffer is
used for CRC and not io memory.
drm_memcpy_from_wc_vaddr() is now used for copying instead of
i915_memcpy_from_wc() for 2 reasons.
- i915_memcpy_from_wc() will be deprecated.
- drm_memcpy_from_wc_vaddr() will not fail if the fast copy is not
supported but uses memcpy_fromio as fallback for copying.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_reset.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
index 37c38bdd5f47..79d2bd7ef3b9 100644
--- a/drivers/gpu/drm/i915/gt/selftest_reset.c
+++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
@@ -3,6 +3,7 @@
  * Copyright © 2018 Intel Corporation
  */
 
+#include <drm/drm_cache.h>
 #include <linux/crc32.h>
 
 #include "gem/i915_gem_stolen.h"
@@ -82,7 +83,7 @@ __igt_reset_stolen(struct intel_gt *gt,
 	for (page = 0; page < num_pages; page++) {
 		dma_addr_t dma = (dma_addr_t)dsm->start + (page << PAGE_SHIFT);
 		void __iomem *s;
-		void *in;
+		struct iosys_map src_map;
 
 		ggtt->vm.insert_page(&ggtt->vm, dma,
 				     ggtt->error_capture.start,
@@ -98,10 +99,9 @@ __igt_reset_stolen(struct intel_gt *gt,
 					     ((page + 1) << PAGE_SHIFT) - 1))
 			memset_io(s, STACK_MAGIC, PAGE_SIZE);
 
-		in = (void __force *)s;
-		if (i915_memcpy_from_wc(tmp, in, PAGE_SIZE))
-			in = tmp;
-		crc[page] = crc32_le(0, in, PAGE_SIZE);
+		iosys_map_set_vaddr_iomem(&src_map, s);
+		drm_memcpy_from_wc_vaddr(tmp, &src_map, PAGE_SIZE);
+		crc[page] = crc32_le(0, tmp, PAGE_SIZE);
 
 		io_mapping_unmap(s);
 	}
@@ -122,7 +122,7 @@ __igt_reset_stolen(struct intel_gt *gt,
 	for (page = 0; page < num_pages; page++) {
 		dma_addr_t dma = (dma_addr_t)dsm->start + (page << PAGE_SHIFT);
 		void __iomem *s;
-		void *in;
+		struct iosys_map src_map;
 		u32 x;
 
 		ggtt->vm.insert_page(&ggtt->vm, dma,
@@ -134,10 +134,9 @@ __igt_reset_stolen(struct intel_gt *gt,
 				      ggtt->error_capture.start,
 				      PAGE_SIZE);
 
-		in = (void __force *)s;
-		if (i915_memcpy_from_wc(tmp, in, PAGE_SIZE))
-			in = tmp;
-		x = crc32_le(0, in, PAGE_SIZE);
+		iosys_map_set_vaddr_iomem(&src_map, s);
+		drm_memcpy_from_wc_vaddr(tmp, &src_map, PAGE_SIZE);
+		x = crc32_le(0, tmp, PAGE_SIZE);
 
 		if (x != crc[page] &&
 		    !__drm_mm_interval_first(&gt->i915->mm.stolen,
@@ -146,7 +145,7 @@ __igt_reset_stolen(struct intel_gt *gt,
 			pr_debug("unused stolen page %pa modified by GPU reset\n",
 				 &page);
 			if (count++ == 0)
-				igt_hexdump(in, PAGE_SIZE);
+				igt_hexdump(tmp, PAGE_SIZE);
 			max = page;
 		}
 
-- 
2.25.1

