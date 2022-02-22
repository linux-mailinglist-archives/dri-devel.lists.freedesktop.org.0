Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E78C74BFB34
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 15:51:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92E810E876;
	Tue, 22 Feb 2022 14:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F7010E876;
 Tue, 22 Feb 2022 14:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645541510; x=1677077510;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jRcMKmhyem09w/fQwCziYsc40OlL2oN5r/8yb1/jju0=;
 b=gV/taqogS1wOz2AYoLEp0dPQoqsGvTHOrCj56gEVnXp8na2tQQOUkU07
 ADb8YpBNeLQvThxvCm61p0TPgrZfujbzS/Sd+JFHh63Ulx3SViPkgny2B
 NUxnigZhrbCQU+qn+QAIbuz0TVwcC9xQ7O2/A53I+SQ3h7jI+etPqQI8c
 fFo5vNn7vYGrQuCZQ+WMJ5LcaCy3/33GGNUCiPF85mZ0M06lyzqIvTzKB
 tv2h3I4h4H2+fv+/0ahOgtMpaH54F1KY/LYKLwRMenN84Zw04CmltQiG6
 bWA4x1ClbSG/AWfthqj27jECfp96Meu3rJaFcPe6BQvABOh6IdzXo6Ql+ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="314955735"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="314955735"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 06:51:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="627714837"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Feb 2022 06:51:49 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 22 Feb 2022 06:51:48 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 22 Feb 2022 06:51:48 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 22 Feb 2022 06:51:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mch4O6f9fc16JXQJjb0pKej6OUmkOkvN9bMC6HCY6ocEzsxdCl6peMcrjDWErCvUTP9h6VvTAOS6A1YzCObKzaULrx/VC2p9KokX26xlGbiRLtrmwoco+qNnN5fOyQQTP7hwAIQazVoejMkWdDmqMXOvQ1hhpqqCBZbNlOIbrR+0UPFng+GYcdp09ru1ejLVhBKyopvIS7Rrf6l80Jm1eqfT9fFiW8wfjY9MgbRbI+STesoOJfLe0Uwxosc4OSkPHFfVJ22AUNeWkdoIyzNNbm1ZJoLBGu+2TRxOXJ6wBe2Upe7iskVEtrGFAdkDob6puyt9DgPRJ+fHUv6X3P+1LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4s9Nc+c9gxVh5rkvdRldvbiG/z5k8EDVMUiOLewX/2I=;
 b=QzmxiAC3DuWG4a5uSn2c6F3WGdc8mDGpfizM3See9HzCtfPgltlzkalYdwTJmGraOLMqkMBtbFT3bHn86Y8adRYKuiwz95fU4DlU6VXv379/5cuRFvAmrmKS9JSHDuK0JCijRa+Q0ly1+ZC9fI0LLnSOpCpHamPz8f0HMOfcOUp8Ia9Jd2O8JTpv3G4UmGiBcgCPgASaO0C/hO0nKZJc/AZtHEt9X41TDBgwGRhGVKD9Jv9x+UUrv1TdexrhUdj0cnC7QTL/IBtQcfu/nPdDSzmhmHROwNn3xQeHETk0FKyTqC9V5o8MkPlm97s3/rZoDGCbI5+qXoMF/gekvDrHSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by BYAPR11MB3221.namprd11.prod.outlook.com (2603:10b6:a03:1c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Tue, 22 Feb
 2022 14:51:46 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475%9]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 14:51:46 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/7] drm/i915/selftests: use the memcpy_from_wc call from the
 drm
Date: Tue, 22 Feb 2022 20:22:04 +0530
Message-ID: <20220222145206.76118-6-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222145206.76118-1-balasubramani.vivekanandan@intel.com>
References: <20220222145206.76118-1-balasubramani.vivekanandan@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::21)
 To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f99d122-caf9-4d1f-6ea2-08d9f612d930
X-MS-TrafficTypeDiagnostic: BYAPR11MB3221:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR11MB3221E8E70072456C635870249F3B9@BYAPR11MB3221.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mYDTcUtu7KIs2hQcCiPWOLvLCpLQ5P7rg6SKEn+GYF1GOeLtavvyUsnioJOQVJGFn7LeI3W8E5XKBsO69dfC9zj5gyBn1BdUfUn2eMJHoSNbM4MiAFdvgpYW2xFYxcWCGiEsiHOSZeWXsvB5pY7p0JzNs0f9kgPDlOX69iEeNZ3HqnfxP9EX2r2g09lTvQlKgomXCajRGfGmXbdcnEsX0YqjghliJjZ7UI+Q7ta5iHAjcM7QeVDjW9r39z3um5/PKpoGzy5c/qr864UmgXcR/9vev4fQxCs42n2qWDmsxAD3ppmETV2nNBlI9/aUSPyfIze/sAmlndWJU/uSPVdmdlTpq1Pv8qVcN4yQldA4CrVZpDeC8PIIAuf7+h8aKDaB8KcegWir1h4L+XW5hajGph9n4ZiWjYPWZl4VWU/6Jkmdl59neTnV1RYNNZXcCoBeEBgAClym7qmiPYRkp/98dDaz8+lQsabWiuKzbPsryOjP7k1insx4jY5kFBRcCjOWanYJHzfjqwerh4yju5GOA//u7lpBO5cH48M6IsXOupr9aqlHOItxhNCt7dnfBIvOsjyZq/gOTyBfucbhQZGlitWkmVaeIsZUqvImi9ZFh5ycWgzBwSw0CAjZOA9me1D9IsBB7/eyhAPGv5izGQCv4ge/NYwbl6ZMyZCOYgHbiGO+aB/RzPOyprV5ykdUV3dXktWGCavmmuZEEqQkLD1jBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(2616005)(316002)(66946007)(83380400001)(4326008)(450100002)(8676002)(186003)(1076003)(66476007)(38100700002)(66556008)(26005)(6666004)(6512007)(6506007)(82960400001)(5660300002)(44832011)(8936002)(36756003)(43170500006)(2906002)(508600001)(86362001)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u8nsDe/RNSpuUa4PYOmvwsQPYT3qUEaavJLzg04wWaunldpV7wx44x/IjVdj?=
 =?us-ascii?Q?vvezBVCAdhQR/RIKWZ7JSrloguSmh/DxwaUmgBwVdvLzcnW/iywvv+4c5hOA?=
 =?us-ascii?Q?qm6wly4txcpeq/dTeOlgIwrTybh3oYgBQqOA4YXOUAVLY/OXlOkY1wgGscV6?=
 =?us-ascii?Q?mX2Qs0hWMHBpILqJdb8HoJaFhOpsUfx/xwgRzO2v3psxYda0kGcWE8pGJ3Fe?=
 =?us-ascii?Q?lDnTdgYdM0bOhlBY9BOHQLK9GYo3kSTR2X3eiLMQYY8CVd5X1BtKu9Cy59ac?=
 =?us-ascii?Q?1xSyx4rWA9qWSwgr9kmrIjY/226y1NovAdcQkJN4Q+NeFL/JyW4jW0ZANWwH?=
 =?us-ascii?Q?3oEEvIeYZsV7FiEYL0yp5hnTG7nejfRyICYBImKJL5UOnTcLdbjOwNQ17fM8?=
 =?us-ascii?Q?nEMEF9ljdIh/PqR9DA2gzJjaBoa866BTpSzsyJo615TQu9bas6Hj92NkUyL0?=
 =?us-ascii?Q?koaANmeAIOyfwM9neJzVnqJPJPsrm8bNQ0VPNtBjj2+rUdYAzmam+uGhpGR1?=
 =?us-ascii?Q?v+6ZtMgnGQ9PH47Dikt15ZWS26hekUnEwlnN9z5bfgT2IE8VUkgCABUIDqIg?=
 =?us-ascii?Q?VBPXLCg5gduHDtObYFSmhNQlWcN9NmFLA/8CtlrEXEddoMtofH5+pFgh8LCM?=
 =?us-ascii?Q?IgRWWjd7Yk9bSYAQsAuhvPaVGsbZm6Oog/U+cIPbKx5Fc8gStvE76KIa9/Ig?=
 =?us-ascii?Q?LYct+q/oGf+b2KOUSqF3SKd3U4WabFbxfjZC3WPTCvzUr/5DlXnRx9E9otSs?=
 =?us-ascii?Q?e/fAiHMfx/mxU9fwE9z/ZRq1vscW57X2+b+2r/HAHmVe9EsmIiRGakMgT3L8?=
 =?us-ascii?Q?P89CVejUBX+SpSfu4/VYBPlV28/MPw5YpKeDtzl1392ganc/v+EYXr3V8+c7?=
 =?us-ascii?Q?l6JtDlk/z0BrTAhgXTpw5tu/qP9rFWCctq3Uq/BMhWvRhUpKWyzoJc3p1XQF?=
 =?us-ascii?Q?/bGVNcnBd2KQNm0/v95WNwZHszcyeWaN363UDfd6Vh51bjHRiHDdTNiX8UMx?=
 =?us-ascii?Q?xiwn5gSwfEc+h/dI3vnmm+gkbHCliKLCzfC2r1Ju2JER3WuCnXLxz/2HvvAs?=
 =?us-ascii?Q?sBmFYTRgkReqFJbxmEQbvlBZBdpMFGr5RqjZWPBQDSpot0I8h3oVzUY3ICvw?=
 =?us-ascii?Q?VfCU4qQuAMYpPuBNOqWw/u+GpRCrHASeP54COvewDSLvV1Tb793pvM7nFPSF?=
 =?us-ascii?Q?G2qV7epnlql6YKg/FPeyjhVyatlq83ajE3alxlF58nceRkpiJbsQwDqyk7py?=
 =?us-ascii?Q?LHSHF5BredXcTkoQrXt8//DQEw37O6DGTs+4NPDe7r9FHtklkENU50Dx9V6u?=
 =?us-ascii?Q?OiY/tGt2Ne8uLjGnxZfyVZo93DFvSfVxrXziIHJeBHDUqkDz3JHUP5ka1TxR?=
 =?us-ascii?Q?MLW1JDdcilne1W714RrS/Nfx29eqj8hTXqaiAh1nLMdhIh9YVjd0z5AQuXHZ?=
 =?us-ascii?Q?Xii5Bug0wzbvYm7ooMFcJjZO3zTu8dda3fomrdcnMfW/P5UihgjDDuy5aaFf?=
 =?us-ascii?Q?W12YEWncXz+dshyI8hdr4XAWG0NywPSGEJvjdwbvLEhAsAL4nAY5dMiXga84?=
 =?us-ascii?Q?0n57l2h8GQ2L4o8ceMOgCvHV6HFOEMDi1KDdo1/gzJYUfsE6ETNafQ/DYZIn?=
 =?us-ascii?Q?K3KCEkhB0GXkKlwxCU52xvDvr2+8m4I0xZZ4gPX3U4xrxOB1iMwd5DVgq4h8?=
 =?us-ascii?Q?r8YLDYnq9liZes7Z6eVUN9I2JTRijZBwIKLQE75AVMnRUJpXwPXu+CSXaIET?=
 =?us-ascii?Q?exSK56ajXQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f99d122-caf9-4d1f-6ea2-08d9f612d930
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 14:51:46.4247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GnswfeypTCuTPoxYcoEn2XvLpwfpzk9nHbcWhlcxjb41HVhN3M17LCHEkbp56+hg5o+PqGttbnuJJ5NyEhASBU60Ws89zztQjTD2iiUMVPXOk/KCq+ltoHRZtEOcp9ih
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3221
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
Cc: michael.cheng@intel.com,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 wayne.boyer@intel.com, casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 siva.mullati@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

memcpy_from_wc functions in i915_memcpy.c will be removed and replaced
by the implementation in drm_cache.c.
Updated to use the functions provided by drm_cache.c.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/i915/selftests/intel_memory_region.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
index 7acba1d2135e..d7531aa6965a 100644
--- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
@@ -7,6 +7,7 @@
 #include <linux/sort.h>
 
 #include <drm/drm_buddy.h>
+#include <drm/drm_cache.h>
 
 #include "../i915_selftest.h"
 
@@ -1033,7 +1034,10 @@ static inline void igt_memcpy(void *dst, const void *src, size_t size)
 
 static inline void igt_memcpy_from_wc(void *dst, const void *src, size_t size)
 {
-	i915_memcpy_from_wc(dst, src, size);
+	struct iosys_map src_map;
+
+	iosys_map_set_vaddr(&src_map, (void *)src);
+	drm_memcpy_from_wc_vaddr(dst, &src_map, size);
 }
 
 static int _perf_memcpy(struct intel_memory_region *src_mr,
@@ -1057,7 +1061,7 @@ static int _perf_memcpy(struct intel_memory_region *src_mr,
 		{
 			"memcpy_from_wc",
 			igt_memcpy_from_wc,
-			!i915_has_memcpy_from_wc(),
+			!drm_memcpy_fastcopy_supported(),
 		},
 	};
 	struct drm_i915_gem_object *src, *dst;
-- 
2.25.1

