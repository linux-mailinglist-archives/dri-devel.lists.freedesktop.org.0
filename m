Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5547C5888FD
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 11:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8095911B00C;
	Wed,  3 Aug 2022 09:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0257211ADAA;
 Wed,  3 Aug 2022 09:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659517225; x=1691053225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=JWFo7jBHuoSe0bX+hFNCB0EUMpH79CfnEXfVZQa/b14=;
 b=G0x+uCYpaiGUOnGWTKJb2HeDd4be9IjwjrSLVEGemwhS7R5XB4f/qgm3
 tQuS/HUy4M2290qbb9DW7Nw7SAue5xzJcbhmuEfdg6bfF5qQKYxIu8/9F
 NIDL0ryzr3I9qWEqTM24KRF2GbmhQzVg8dbs5Ln6702NzLpe6Z6FLXwxB
 bexCAqhRhfevrQ5JRb+WhyRzV9JqmSbwZXuu+CzUgEnpNxeh1H8hh5VG7
 h5llc6q0rjUXRJAT803WJDBTsZ+77kZTLMG4RoLvzDTfO9S8XaE21SfLO
 Lg7WLYKQSZPITVhGRV3zB8aiK8v7n9NEfNvhzKEtsBZwkrjtmtbv/ofN6 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="289634920"
X-IronPort-AV: E=Sophos;i="5.93,213,1654585200"; d="scan'208";a="289634920"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2022 02:00:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,213,1654585200"; d="scan'208";a="635610597"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 03 Aug 2022 02:00:00 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 3 Aug 2022 01:59:59 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 3 Aug 2022 01:59:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 3 Aug 2022 01:59:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 3 Aug 2022 01:59:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPmCGll2a6+xqzihvqIA0QSD7lPqBBHaKKV3QYOkiukK/ood4r0WeahaOf+i5KUnpr4jUH4oqm1Yhv1JV5vSHN8u0XoVH5KijzxkKEYMsPDcI5wvbjDbLntCv+jmLmcnsksPPLSSS0s9MMeFXZhOqs4mN7G3fHcn6Ccks6I62ih1taTEoTHjN4G7O9hoPFYlnz6f3eBEem0Pvgenz8xsxpE+q399gFQUQN+LI9S2SI86a8y4dR+tOxoZrY3RIHl/MKwCoR1eJmFY2i2Km7mqFhyoVZNeg0rSXs3omcRjcVop++ZxqZZqPrfe5Wj7ex36C4c8pAnXriufC80rzfXbUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvJsJV9SPtLxw6Fe+Ag5kdZY8cbFBN04jMVuClUo5L0=;
 b=IKrtCUx2SG/bZEMxc/F9wB9bFnQwWMqOzDZvq+gVgbAcuhIuaystT1/AMvCOjsomxUI8NaXDwF6/ErsuIT1XW+aBGk9n95MwCqSjEwvPUxU+8KTKn1Lhbf0O8mfdcrZ38nEsMdA0WY0qUnhns6dYqSHPJv7YLInxXYpRdkYlMkO+WFHYcmkVSppe8sTYroKeC/wwnDVwoI7DCVexjcw1vF0OX0qFa/IE31jJCjJyuxRNBmpX7uKpihIN+aLFKHCC5Q0F6oEmnliWnXkiLGiU1K5szQm1tf+BR5KbM/FyRwjmdzQUDy9PbOneBxo6ympCXxzN6WS/evhExyynq9dltg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1372.namprd11.prod.outlook.com (2603:10b6:3:11::14) by
 BL0PR11MB3090.namprd11.prod.outlook.com (2603:10b6:208:74::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.11; Wed, 3 Aug 2022 08:59:57 +0000
Received: from DM5PR11MB1372.namprd11.prod.outlook.com
 ([fe80::bc9e:4951:a404:5507]) by DM5PR11MB1372.namprd11.prod.outlook.com
 ([fe80::bc9e:4951:a404:5507%3]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 08:59:56 +0000
From: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 2/2] drm/i915: Sanitycheck PCI BARs
Date: Wed, 3 Aug 2022 10:58:29 +0200
Message-ID: <20220803085829.1466903-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220803075549.1464461-1-piotr.piorkowski@intel.com>
References: <20220803075549.1464461-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::17) To DM5PR11MB1372.namprd11.prod.outlook.com
 (2603:10b6:3:11::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c12076da-780c-4173-7c86-08da752e89c7
X-MS-TrafficTypeDiagnostic: BL0PR11MB3090:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yFF5aJ11aSdC3l8POj2hXAPlR4iqnW+JUEJWrQ6Id9CmH4G9QhSLSTHpcyT4cj06L4YWKPTQ1A9JyA1NZA3djrfTzv+gfr/+2dwgLoTOIb6OWeBCqv8cQV83JR3QyNJnjecOq38p0YSpMgFu+FPcoRrdaoI5zy32l0G5Tas6QtZSHDawsLpndZHdEInq7XrO7hN01xT94OgofANMJku1IH/wRjqZlGjMm5lm/mxJWwGKOHmojk6fW6L6egl+Cz+NJ4Ii2jNihDZtkoCCf/uEKFOjFbLv6RKIvDiraFJ9pE/lhZPyJQjNtztkRstD/RxOPgrBcE20Q/DoW5+apN3pxalCGqs160yCR5lhwX4juVqI1dAv6rSkWah/M65RATyDC5uOw57RFA1xNG3M5tdl+Ru00EYukQekEtzVMe9uS5A7Bj5QpvgdS0JOABoO0wEUCtterrHW8oGsZVzhqKYR0rqG5/6Fzt2Gzo5ENWGxhLhwwh25XAXuWp3oIY3rsK6myn1FOlYdKgdGpV/nRpBcX6mDNEyvPXDTkZJEdpo2f8qF23qV0kD7J/+zkQ1wQ9I4FUktXDmT4o34A+Hs6DuzPruwgkopGzLZ96gWZBtmQJnb2c4NQZDWc+E1hr4r3rGdDm5qigApfkw3EZ9Z98/odGLG6nKz7sykODjCDbSrPkNRDguCnlqCzfAzSJSlXBH/JssNwef+MQFNHPX0jiQIWj9UKBTQmz2NVDMIisBXo645DeeW2Ft/4c46I67akH8i
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1372.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(346002)(136003)(376002)(366004)(478600001)(1076003)(83380400001)(36756003)(66574015)(316002)(6486002)(186003)(2906002)(54906003)(8936002)(6666004)(2616005)(66946007)(66476007)(66556008)(86362001)(4326008)(8676002)(6512007)(41300700001)(5660300002)(26005)(6506007)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eG80czBoWlE1alNtMzBPMFhXc0xFdHkrckZQQWJJNEhOb3J3ZWJlSVVuVzZk?=
 =?utf-8?B?eG9yay9BdjFkYVM2TU9MN25SZTdkcXpmM3lXa2hyd05tNTk5QURRSUFwbVpz?=
 =?utf-8?B?RHp4VWRnK0VKSDNpWDlYS0xTQmZsSU45Y09wVUplVWx6WXZUdmZHalZMRzYr?=
 =?utf-8?B?N0ovSzQ4Z2U0N0k4YTlDTkdpUVJKSXluNGszM2FFb2Q4N1Iza1g1OFJtaXdh?=
 =?utf-8?B?bWVaSDVlNUk2aGpCS2w4Rkp2VXh0NUU5cWx1dEYzVzBNbG40RC8vSTI5Y25a?=
 =?utf-8?B?cVpNeTB5TlJEM0dyWTU3YzE3V3lacGdsWWtBaU5BRUFTRnFpb3hCYzJIY2tG?=
 =?utf-8?B?MkIyczVtVlhkQkNQRC9WS1JJMkZONXRic05rWVpuK3JrdTlQMXZaWFJXemVs?=
 =?utf-8?B?MlgveURoWVIyZ3BYTEwrQ3BMcjJQMFNNaGpYd3VML0kzVWZEWHV1a3NVSWZV?=
 =?utf-8?B?RSs3L1JXYUlzR0J5QzN5d0R6cG5zTS9iRS9PNGdYQ1BUNEVmTy9YWldrMnc1?=
 =?utf-8?B?TnNETXorYlVDTVJBSkVxYmd0UURZcDJBZVhHMEg0NmlROFpOVW1EQ2FQWm9F?=
 =?utf-8?B?U1U4ZUI0d2luYmRickhjYkJ6RXNqR3FkQys0SWlFY0l5QzVHTkliZXp1bjkv?=
 =?utf-8?B?bzVySmxNTG53Y3hjMlhVY3FxazZvZzdlSFlkQmpTM0dYVm1uYk51Vjl4bk1l?=
 =?utf-8?B?LzhKbGp5MDRBMHV4djZPMlFvcG84a0FicW5xbGltSVFhTUtQdElWeVppNTlR?=
 =?utf-8?B?ZmZWQ0lFdzBpb3N4VUxkQjJYYnJzWWRld0V0cGYzdTVQODJwRzhGWkpYNDEx?=
 =?utf-8?B?aEVpYlNSNTM3ZUdVSkxZZ2FkeGNoQ1BhSlhaRWN5aVd4TmVBSEVDU3l5NElW?=
 =?utf-8?B?TFc3YkxrcWxKM1Zra0kxZnFwY0x4dVI2ZzhyNWIxVFpMR0RFdG5nZllZcjVW?=
 =?utf-8?B?WmVkdmh0aHlUS1RZMUFSaUdFeG0rSzk0Tm1GWjhydUNzcjkzSDloN1ovNitY?=
 =?utf-8?B?SkMxZUdOWnVFaG05TlF2QUNsMkhJRTdydVZIQTFwUE1xZTRtQytRWExrTDBu?=
 =?utf-8?B?Z3JtNVJLZ1MrOTB3UkhYRnNtL1NKc05pSkhYQ0swZngrYkM3VEczVThkaVNv?=
 =?utf-8?B?L2twRStmbXRNTmRLSXQ2TXIvbXU2anVQZmk0TndPVHU4clN3c1ZaY2F0UWpw?=
 =?utf-8?B?czI2dlJGbndjZ3psZWpYNFQxZXdYOUxqUXFYZDJIOXZPOGgwNTF1cEtUbGZk?=
 =?utf-8?B?dklLRFNmTnh2emRsWWc3SVdaeHBrK3RQS2ljQ3k3VGM5L2JPTlVWMGhlRzZZ?=
 =?utf-8?B?SFZVNnh3aFFPb3F4VWlXM3A5MlZYWmh2TXVZN2ZtNUV0SE1JUkhFTWNxUUJa?=
 =?utf-8?B?ZTcvK2M2VlVVYXJvc0RyQXAwUW5VYUEvN0hFTktESWE2RUJiL1JTc3QwV2I0?=
 =?utf-8?B?U0g2NFIxRTU5czNIQ2UrU0NIbXJUWGF2d2o0L0E1Vm5YclpLSzdMdUI1UU5j?=
 =?utf-8?B?NHlkYjVHeGRJcm4xZityeGxnNzh3TjFad1JIZEo4OXh4MTluSnVFSkFIWmdI?=
 =?utf-8?B?bzFqMDFqZ2g0NDFNY3M5eUI4Rmc3elVZQzU5ak5aaXFRRHYvMFpZUHNsd3h6?=
 =?utf-8?B?UlNtblE0VHJKSkw4enJzYU9jWjdVaWNrZ3RCNXhRUHZ2bU9jeDFRMzZEdUtT?=
 =?utf-8?B?TTZ5Ynl5bXc5aG8xUmpJcFg0enRLUTJ0eUlGVjhlRmJJRFBpZFAvU09DNkNI?=
 =?utf-8?B?Vk1IdkU0V0R3K2hOakE4akVWVm5QQVNCSmhNV2ZWdFk0SFlza0tJQ01aZUtD?=
 =?utf-8?B?bG43WEt3QzVnN1ZJVTk4dlZkM05oWStybDZvVkxrcVNzY3VydEMxTGViRnlh?=
 =?utf-8?B?bzRWWHBUR3R6VzQ4MC9PaGIydlBGSmxYTXVqQXpsMEU1RlN0TGd4U0V5NEdx?=
 =?utf-8?B?a25PTUVwaWlCRXdoOTl4T1VkSnJFb1BnMzVZY0RkRmpmZVllaC8zK01XOTBj?=
 =?utf-8?B?N25xOGxpYVhJdXBiM2MzRk92OHgzcTRqaFVKV1NHNE5JVlBwS1ZTVnVneEFC?=
 =?utf-8?B?b05IQktLMU12bGQ2NkJGZHJpNVFhenpHYzdiUWl6NnZXUU5JTjRweFNaK25t?=
 =?utf-8?B?ekk3Nlp1MHd5R0Qyby9yc1FYVlJHYWVvdEJvbmdqSExtNnJkMFc2SmVCYm5r?=
 =?utf-8?B?Qnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c12076da-780c-4173-7c86-08da752e89c7
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1372.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 08:59:56.8406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FzWlT+PyDbiNSJGuYvpBFR6+z2ED3JeXV/Xeq5bNV8gIJmciF2P0jWnw2Uuf5u+KD3BJXMOhYiq/iknYKW9HdxgxZI3YJxK54qST6z1Ms30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3090
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

For proper operation of i915 we need usable PCI GTTMMADDR BAR 0
(1 for GEN2). In most cases we also need usable PCI GFXMEM BAR 2.
Let's add functions to check if BARs are set, and that it have
a size greater than 0.
In case GTTMMADDR BAR, let's validate at the beginning of i915
initialization.
For other BARs, let's validate before first use.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c  |  4 ++++
 drivers/gpu/drm/i915/gt/intel_ggtt.c        |  7 ++++++
 drivers/gpu/drm/i915/gt/intel_region_lmem.c |  4 ++++
 drivers/gpu/drm/i915/i915_pci.c             | 25 +++++++++++++++++++++
 drivers/gpu/drm/i915/i915_pci.h             |  4 ++++
 5 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index c369cfd185bc..4f4c9461a23b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -18,6 +18,7 @@
 #include "gt/intel_region_lmem.h"
 #include "i915_drv.h"
 #include "i915_gem_stolen.h"
+#include "i915_pci.h"
 #include "i915_reg.h"
 #include "i915_utils.h"
 #include "i915_vgpu.h"
@@ -828,6 +829,9 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 	if (WARN_ON_ONCE(instance))
 		return ERR_PTR(-ENODEV);
 
+	if (!i915_pci_resource_valid(pdev, GEN12_LMEM_BAR))
+		return ERR_PTR(-ENXIO);
+
 	/* Use DSM base address instead for stolen memory */
 	dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
 	if (IS_DG1(uncore->i915)) {
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 8214e07a0f5b..30cf5c3369d9 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -18,6 +18,7 @@
 #include "intel_gt_regs.h"
 #include "intel_pci_config.h"
 #include "i915_drv.h"
+#include "i915_pci.h"
 #include "i915_scatterlist.h"
 #include "i915_utils.h"
 #include "i915_vgpu.h"
@@ -931,6 +932,9 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
 	u16 snb_gmch_ctl;
 
 	if (!HAS_LMEM(i915)) {
+		if (!i915_pci_resource_valid(pdev, GTT_APERTURE_BAR))
+			return -ENXIO;
+
 		ggtt->gmadr = pci_resource(pdev, GTT_APERTURE_BAR);
 		ggtt->mappable_end = resource_size(&ggtt->gmadr);
 	}
@@ -1085,6 +1089,9 @@ static int gen6_gmch_probe(struct i915_ggtt *ggtt)
 	unsigned int size;
 	u16 snb_gmch_ctl;
 
+	if (!i915_pci_resource_valid(pdev, GTT_APERTURE_BAR))
+		return -ENXIO;
+
 	ggtt->gmadr = pci_resource(pdev, GTT_APERTURE_BAR);
 	ggtt->mappable_end = resource_size(&ggtt->gmadr);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index 1e79d3c8b126..f3ad93db0b21 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -4,6 +4,7 @@
  */
 
 #include "i915_drv.h"
+#include "i915_pci.h"
 #include "i915_reg.h"
 #include "intel_memory_region.h"
 #include "intel_pci_config.h"
@@ -201,6 +202,9 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 	if (!IS_DGFX(i915))
 		return ERR_PTR(-ENODEV);
 
+	if (!i915_pci_resource_valid(pdev, GEN12_LMEM_BAR))
+		return ERR_PTR(-ENXIO);
+
 	if (HAS_FLAT_CCS(i915)) {
 		resource_size_t lmem_range;
 		u64 tile_stolen, flat_ccs_base;
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index aacc10f2e73f..9fd788e147a3 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -30,6 +30,7 @@
 #include "i915_drv.h"
 #include "i915_pci.h"
 #include "i915_reg.h"
+#include "intel_pci_config.h"
 
 #define PLATFORM(x) .platform = (x)
 #define GEN(x) \
@@ -1262,6 +1263,27 @@ static bool force_probe(u16 device_id, const char *devices)
 	return ret;
 }
 
+bool i915_pci_resource_valid(struct pci_dev *pdev, int bar)
+{
+	if (!pci_resource_flags(pdev, bar))
+		return false;
+
+	if (pci_resource_flags(pdev, bar) & IORESOURCE_UNSET)
+		return false;
+
+	if (!pci_resource_len(pdev, bar))
+		return false;
+
+	return true;
+}
+
+static bool intel_mmio_bar_valid(struct pci_dev *pdev, struct intel_device_info *intel_info)
+{
+	int gttmmaddr_bar = intel_info->graphics.ver == 2 ? GEN2_GTTMMADR_BAR : GTTMMADR_BAR;
+
+	return i915_pci_resource_valid(pdev, gttmmaddr_bar);
+}
+
 static int i915_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	struct intel_device_info *intel_info =
@@ -1287,6 +1309,9 @@ static int i915_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (PCI_FUNC(pdev->devfn))
 		return -ENODEV;
 
+	if (!intel_mmio_bar_valid(pdev, intel_info))
+		return -ENXIO;
+
 	/* Detect if we need to wait for other drivers early on */
 	if (intel_modeset_probe_defer(pdev))
 		return -EPROBE_DEFER;
diff --git a/drivers/gpu/drm/i915/i915_pci.h b/drivers/gpu/drm/i915/i915_pci.h
index ee048c238174..c0bda6aae806 100644
--- a/drivers/gpu/drm/i915/i915_pci.h
+++ b/drivers/gpu/drm/i915/i915_pci.h
@@ -6,7 +6,11 @@
 #ifndef __I915_PCI_H__
 #define __I915_PCI_H__
 
+#include <linux/pci.h>
+
 int i915_pci_register_driver(void);
 void i915_pci_unregister_driver(void);
 
+bool i915_pci_resource_valid(struct pci_dev *pdev, int bar);
+
 #endif /* __I915_PCI_H__ */
-- 
2.25.1

