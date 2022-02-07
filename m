Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ECE4AC4F7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 17:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17B110E2B0;
	Mon,  7 Feb 2022 16:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1D510E2C9;
 Mon,  7 Feb 2022 16:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644250342; x=1675786342;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=dGnyquuCpkxfitJMGNQlzyYQfytm3E1/tmzryjabndA=;
 b=PehXQm+HC/4VLhioqbHLZyvD5Ug/R38Ugc2bcBwaciA4YOOBrO6EUo3j
 N4yoaF4jn0B4gI9xTiNm1+lHejEMU+RLaVvIzKXrp2AswHZATfE9eozV9
 GKvKNPcm0U/UxUyKylM3kuHRk4vvUfUk0UUVdXd3aSyrOyUIORltPCW3c
 MaR672p90S5PCQ+fzxGsecoUyW5a4rU8wEyvkGJuaTPOPnAYGChe9QvLQ
 RO4IVVzXzgezs+V/sKWv7ZRDRVhXmA+nrkwtTT51fVDdYIaZLuFHAaX25
 1luvYA0B8igjwzAY4KOchg2qAeGmScLvXlaoPwYYdbHieK8QklTJs+z4u w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="335148876"
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="335148876"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 08:12:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="770677542"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga006.fm.intel.com with ESMTP; 07 Feb 2022 08:12:22 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 7 Feb 2022 08:12:21 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 7 Feb 2022 08:12:21 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 7 Feb 2022 08:12:21 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 7 Feb 2022 08:12:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AaPynzNON50DY2k6rAppg90AcPDB+95AjNZ0t1VFDsiJdokrsRtj7AZTAw5y1SaIuMYc9ckhYmZD46OKe3LxwN8+BEhtdzXbSZJUu3sMkTXz5YnCvcLa5rOKZwEGLpcaggonLUOIJH28lyT3uZICaSehEidZK4TGq9fBb2Z93uoks8WVW6+BG4wm4Ib2OyEdRhS9RRc96/HNN6+9yQKuY/lNrR1AN02Py3X5Nt+/QWYCaj9sAxMZdVaxJ/dZoH+14SOp5rX0LypQtCibYKEGwNDnf+XaRXFhtepDKyvGdy/D9I4fFQqHorT5X47SXmPRWoVDr2YoZbFyiS4RLMgl9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gt2g1NZjOKTfhWmmZCoTlgA9wvap3dmrCNmt3bSYcAc=;
 b=YzHMTXEzMDcHitdzP1evrFPM2ltHwsrXPb23RJQajF+dwd/5Tm+5hnzto1FP164lbSk0DeYpAkwiylPDJPt+JdGm+x1joiNygpxH6iOX4sUaqKsX8oTopG0tz/TCAwr2NQ9Th9AG1HzKbNnvml4g//QEELQt/20o0VILzr97OOSvRU/6W1uIXabvA2BlrTGAFf8PjRAZ6Ontrydq++cD5u+ucHNAQeEV6+DSFWD7FGx+61oFu2j+/VNUKBCtnu2YNM26GqBe9nQC7L7y8XMcOq2yrhQDjABBgw5kcZHkdzm7HCcL3CcSIQcM98ohrrHn0ifppE3IoeHgvADDAvoXGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by BYAPR11MB2853.namprd11.prod.outlook.com (2603:10b6:a02:c8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Mon, 7 Feb
 2022 16:12:16 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::4c25:af8f:60a8:3992]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::4c25:af8f:60a8:3992%6]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 16:12:16 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 1/1] drm/i915: Add fallback inside memcpy_from_wc functions
Date: Mon, 7 Feb 2022 21:43:08 +0530
Message-ID: <20220207161308.447676-2-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220207161308.447676-1-balasubramani.vivekanandan@intel.com>
References: <20220207161308.447676-1-balasubramani.vivekanandan@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1PR01CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1::12) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94af336f-db3c-41fd-68d9-08d9ea549b7d
X-MS-TrafficTypeDiagnostic: BYAPR11MB2853:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR11MB2853C7E913E558BF1DC3A4CE9F2C9@BYAPR11MB2853.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FkDNZAf2VwE/jP2DuJS1q/FJDzB9S92ZKX5Jv2ibHr+Cd/5JeF+BNfUbguPcJhJbGRHAHmD9jJ/NtajkjsrL+9A5eHw5E8V2iKGc/vTyntfuTArQub2wlkPrVcRAmGB5oCcpXqYvERvjp8pfYkJ/pPWXlq9vNwBXL9ajxYo/uPQu8AhuL1N7PQjZGnnsKvlIeEtjJggunL1WZhutMfdtj513/dgOxnIK+Rg3zVmADV6zWVvkGBjE8DRwvFZdfnIjZ+4LxSolYE1IZbCALSHXFPlhDV3Sr9Xp8sY8toc/eAZH8OsJusqVElTPJhWkZ4TD4fkp6/JRpS8AdMoEGHPtHZtfK7klHR0lbO6mWj22MAQ03+ql0PpxliOta8DvILF8TFDK5GWqPl3NnZg/aLZC1NxW2TyNYvvUcacrNWk9fEKDuYVVzDYr6fT1+1R0KUGY+znKid9oYktYYJSGQZdzTnaw+FNgnTWaCIrKNoT4tMRhMVIjSAB1i6717c2apyeBpBPIo6+cY4eo/ECdySkP/DAwH2YqxgUJNPP7LILfBWY+uL2NR4LC+C51fu/tKt4KqqojWu4Zrzp2X53ygl1iFuCWziwPVxK5AR1o3+Xmh8hWCEIo0J/k8wn1m2Sytrk4OGGKB17ZI9mJ4up/JV1ZMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(82960400001)(8936002)(83380400001)(4326008)(66556008)(450100002)(107886003)(66476007)(8676002)(36756003)(1076003)(508600001)(26005)(6486002)(38100700002)(6506007)(86362001)(44832011)(6512007)(5660300002)(2906002)(66946007)(316002)(6666004)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hNf9cnskvd+D6YmmLfbJzYNuxP1rSi+3ipr51jdbNV20i8TdSWFXoH+xqdhc?=
 =?us-ascii?Q?QwCSgGSs2UmAq3NrFgAwJfET90eOY+qvdsG3oSZRdO8gldVOI9PP0MfbZoxu?=
 =?us-ascii?Q?4tHy9apYqAjzLH6hyhy8HcXgr8DSntSu14wuXPA/tZFpesAoWpV47qVOJU1o?=
 =?us-ascii?Q?u35EchA7QWBzfpKhj3S7nZnpVmbr7SNJRMkX5glSqkz7QAjFdcgXendCZNHa?=
 =?us-ascii?Q?YMoVX+OAGfzuNGf4l7RFIl9YWUL7r2XI+Smfa+iHI4k7+j1AzAQff/pqLB5f?=
 =?us-ascii?Q?zDS9CFRET2zWyvHLihhyAh+GHfYr+99u8+n8YLCdwNnNOeeRk7sFJDPVxF9T?=
 =?us-ascii?Q?7sp3/E6MW7kg+oL31KN0hrO3ehPZpfdE7zbmFxqXErg1GGy4xPVsjCGDy2O0?=
 =?us-ascii?Q?m/IC1qiWOEMxof0uHAD2ckEXmX37oZ/JUUzFFsLcjpZ4Ii43l1SHATYGOXl9?=
 =?us-ascii?Q?jYe3pL57KhJSfR1nrrsv06RX5SbKWPRsPzSg/yJxl1tzwpH47G8rGDozqIIb?=
 =?us-ascii?Q?grC3M/rg0I/5PfqlY587hkLraUG83WR6+cjV12A2IbsfXCL0h3JcSLbu0XpU?=
 =?us-ascii?Q?PIU+6zZPf8qphEPJK16G0x4Gj1EFcPEmQTFoJdg8zm/wQsGweLwkhEi7ANlV?=
 =?us-ascii?Q?TlaVysoQtq1GkSMViWY10WAIrOupMD4yrGkZtX28R6D45LZUcnwVgxLSe+Ea?=
 =?us-ascii?Q?YDcocC1tEFD6jz99LzR6MAbz0KNBeUY+pKs7AwB7RxHQIEM2UzFKfSyXiGsM?=
 =?us-ascii?Q?LzAKfRXhONG6DxLt9AoJqn/YZTd9w2oEPJzJmgvBqI1cXpN6X/i7yy3PNgIf?=
 =?us-ascii?Q?x+bhsf/BdObVC88yEAJ5WnONC/pFhXM4alT/yMI3V5b5w3HqxQEMaj1hDsYh?=
 =?us-ascii?Q?DuqMvr4uBjpZAiyEMzqS85r3w+J5Y/z3N5lVk2uEdcu6tVr11bdD2MDUVVuU?=
 =?us-ascii?Q?vXUgeY6L5qGLiSYQU3NieUSAMC2HEr7A6qaluF22c+27hdxO1VcRyt0GRWYd?=
 =?us-ascii?Q?GtaDuvZncPBRn+HWUWhbthIKZbICM6NafPPCw0QpaoUSiMLHxW27tT2KqZIP?=
 =?us-ascii?Q?3POIdSWervueUJV6VEWCZyfSIxrOh5YlDhV2q3oxZZ/a01B3UL3bqev09svR?=
 =?us-ascii?Q?NFPljCkPmbzhm3no/4kLRHGBkQ7tKK9AYGbdgg8nncVOgJSq3qYdWPfznQdJ?=
 =?us-ascii?Q?DhmRRnMPAX+YtNri9RUn/g8qtrM17+wy7mTk1OUrQdmqYiutG03rnxdhls1r?=
 =?us-ascii?Q?ODCsmNVJbFU90EGhLCiqIRX8ViGSNgUtWJXtMhDzkQ+IroHFz1d2xpGGfhU4?=
 =?us-ascii?Q?TMli8+4sQB4djbMjH6VLPOlfb3nRs8E6avlL/C25siUnhnVjMTYp415vJyRA?=
 =?us-ascii?Q?5bG0n1+z465OPrUs9Tvkz24GIy3wwkDcUiYOd7togQQUYxP/tN1x4i0jdBdm?=
 =?us-ascii?Q?3+kX7gtU0N7rx0t9z8Jdgc6KVEc8KAjNG1ENJCh1TCV7Rln8eq/nqmg3r8Al?=
 =?us-ascii?Q?PzlZpQqzTrYHUEvCqcvK+wgwJaHpEXqCpJpGuzvodp2CY0wrT2fkl+IxVBP1?=
 =?us-ascii?Q?7x05UXO0Zw5xSwSe1qrLO8b5sGgad3H8xeZ0pRCkrDraD+KxFrkJvMnLf2lq?=
 =?us-ascii?Q?ZIerMIIGcxRLgqr0Tr2kpUBZyBhWzJrYjRrwWvRdgq5h883qLk+nWzM7NC0y?=
 =?us-ascii?Q?TIVExOS3kmC3iZ21Q1EQjCbu8jEzPzG4MbnDyxv186NKvLavUYw95QjcgpdQ?=
 =?us-ascii?Q?SeFYK1gBCA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94af336f-db3c-41fd-68d9-08d9ea549b7d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 16:12:16.0001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qe0Lk4GumxieDpKBf0ma7PJZ48KlcXPItdU2bK6j4ziJ37+iCgWpmvVc0z8v/Gkwco2comrybrS7VBCgjL8HxgcTni6WecWnzkPxmJlLFdB2AXX3ODi+UEyrbd8or2ca
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2853
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, Balasubramani
 Vivekanandan <balasubramani.vivekanandan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

memcpy_from_wc functions can fail if SSE4.1 is not supported or the
supplied addresses are not 16-byte aligned. It was then upto to the
caller to use memcpy as fallback.
Now fallback to memcpy is implemented inside memcpy_from_wc functions
relieving the user from checking the return value of i915_memcpy_from_wc
and doing fallback.

When doing copying from io memory address memcpy_fromio should be used
as fallback. So a new function is added to the family of memcpy_to_wc
functions which should be used while copying from io memory.

This change is implemented also with an intention to perpare for porting
memcpy_from_wc code to ARM64. Since SSE4.1 is not valid for ARM,
accelerated reads will not be supported and the driver should rely on
fallback always.
So there would be few more places in the code where fallback should be
introduced. For e.g. GuC log relay is currently not using fallback since
a GPU supporting GuC submission will mostly have SSE4.1 enabled CPU.
This is no more valid with Discrete GPU and with enabling support for
ARM64.
With fallback moved inside memcpy_from_wc function, call sites would
look neat and fallback can be implemented in a uniform way.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c |  5 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c   |  8 ++-
 drivers/gpu/drm/i915/i915_gpu_error.c      |  9 ++-
 drivers/gpu/drm/i915/i915_memcpy.c         | 78 ++++++++++++++++------
 drivers/gpu/drm/i915/i915_memcpy.h         | 18 ++---
 5 files changed, 78 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index e03e362d320b..e187c4bfb7e4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -444,7 +444,7 @@ static void
 i915_gem_object_read_from_page_iomap(struct drm_i915_gem_object *obj, u64 offset, void *dst, int size)
 {
 	void __iomem *src_map;
-	void __iomem *src_ptr;
+	const void __iomem *src_ptr;
 	dma_addr_t dma = i915_gem_object_get_dma_address(obj, offset >> PAGE_SHIFT);
 
 	src_map = io_mapping_map_wc(&obj->mm.region->iomap,
@@ -452,8 +452,7 @@ i915_gem_object_read_from_page_iomap(struct drm_i915_gem_object *obj, u64 offset
 				    PAGE_SIZE);
 
 	src_ptr = src_map + offset_in_page(offset);
-	if (!i915_memcpy_from_wc(dst, (void __force *)src_ptr, size))
-		memcpy_fromio(dst, src_ptr, size);
+	i915_io_memcpy_from_wc(dst, src_ptr, size);
 
 	io_mapping_unmap(src_map);
 }
diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
index 37c38bdd5f47..64b8521a8b28 100644
--- a/drivers/gpu/drm/i915/gt/selftest_reset.c
+++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
@@ -99,8 +99,10 @@ __igt_reset_stolen(struct intel_gt *gt,
 			memset_io(s, STACK_MAGIC, PAGE_SIZE);
 
 		in = (void __force *)s;
-		if (i915_memcpy_from_wc(tmp, in, PAGE_SIZE))
+		if (i915_can_memcpy_from_wc(tmp, in, PAGE_SIZE)) {
+			i915_io_memcpy_from_wc(tmp, in, PAGE_SIZE);
 			in = tmp;
+		}
 		crc[page] = crc32_le(0, in, PAGE_SIZE);
 
 		io_mapping_unmap(s);
@@ -135,8 +137,10 @@ __igt_reset_stolen(struct intel_gt *gt,
 				      PAGE_SIZE);
 
 		in = (void __force *)s;
-		if (i915_memcpy_from_wc(tmp, in, PAGE_SIZE))
+		if (i915_can_memcpy_from_wc(tmp, in, PAGE_SIZE)) {
+			i915_io_memcpy_from_wc(tmp, in, PAGE_SIZE);
 			in = tmp;
+		}
 		x = crc32_le(0, in, PAGE_SIZE);
 
 		if (x != crc[page] &&
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 127ff56c8ce6..2c14a28cbbbb 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -297,8 +297,10 @@ static int compress_page(struct i915_vma_compress *c,
 	struct z_stream_s *zstream = &c->zstream;
 
 	zstream->next_in = src;
-	if (wc && c->tmp && i915_memcpy_from_wc(c->tmp, src, PAGE_SIZE))
+	if (wc && c->tmp && i915_can_memcpy_from_wc(c->tmp, src, PAGE_SIZE)) {
+		i915_io_memcpy_from_wc(c->tmp, (const void __iomem *)src, PAGE_SIZE);
 		zstream->next_in = c->tmp;
+	}
 	zstream->avail_in = PAGE_SIZE;
 
 	do {
@@ -397,8 +399,11 @@ static int compress_page(struct i915_vma_compress *c,
 	if (!ptr)
 		return -ENOMEM;
 
-	if (!(wc && i915_memcpy_from_wc(ptr, src, PAGE_SIZE)))
+	if (wc)
+		i915_io_memcpy_from_wc(ptr, src, PAGE_SIZE);
+	else
 		memcpy(ptr, src, PAGE_SIZE);
+
 	list_add_tail(&virt_to_page(ptr)->lru, &dst->page_list);
 	cond_resched();
 
diff --git a/drivers/gpu/drm/i915/i915_memcpy.c b/drivers/gpu/drm/i915/i915_memcpy.c
index 1b021a4902de..4d9fbf3b2614 100644
--- a/drivers/gpu/drm/i915/i915_memcpy.c
+++ b/drivers/gpu/drm/i915/i915_memcpy.c
@@ -24,15 +24,10 @@
 
 #include <linux/kernel.h>
 #include <asm/fpu/api.h>
+#include <linux/io.h>
 
 #include "i915_memcpy.h"
 
-#if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
-#define CI_BUG_ON(expr) BUG_ON(expr)
-#else
-#define CI_BUG_ON(expr) BUILD_BUG_ON_INVALID(expr)
-#endif
-
 static DEFINE_STATIC_KEY_FALSE(has_movntdqa);
 
 static void __memcpy_ntdqa(void *dst, const void *src, unsigned long len)
@@ -93,6 +88,26 @@ static void __memcpy_ntdqu(void *dst, const void *src, unsigned long len)
 	kernel_fpu_end();
 }
 
+/* The movntdqa instructions used for memcpy-from-wc require 16-byte alignment,
+ * as well as SSE4.1 support. To check beforehand, pass in the parameters to
+ * i915_can_memcpy_from_wc() - since we only care about the low 4 bits,
+ * you only need to pass in the minor offsets, page-aligned pointers are
+ * always valid.
+ *
+ * For just checking for SSE4.1, in the foreknowledge that the future use
+ * will be correctly aligned, just use i915_has_memcpy_from_wc().
+ */
+bool i915_can_memcpy_from_wc(void *dst, const void *src, unsigned long len)
+{
+	if (unlikely(((unsigned long)dst | (unsigned long)src | len) & 15))
+		return false;
+
+	if (static_branch_likely(&has_movntdqa))
+		return true;
+
+	return false;
+}
+
 /**
  * i915_memcpy_from_wc: perform an accelerated *aligned* read from WC
  * @dst: destination pointer
@@ -104,24 +119,18 @@ static void __memcpy_ntdqu(void *dst, const void *src, unsigned long len)
  * (@src, @dst) must be aligned to 16 bytes and @len must be a multiple
  * of 16.
  *
- * To test whether accelerated reads from WC are supported, use
- * i915_memcpy_from_wc(NULL, NULL, 0);
- *
- * Returns true if the copy was successful, false if the preconditions
- * are not met.
+ * If the acccelerated read from WC is not possible fallback to memcpy
  */
-bool i915_memcpy_from_wc(void *dst, const void *src, unsigned long len)
+void i915_memcpy_from_wc(void *dst, const void *src, unsigned long len)
 {
-	if (unlikely(((unsigned long)dst | (unsigned long)src | len) & 15))
-		return false;
-
-	if (static_branch_likely(&has_movntdqa)) {
+	if (i915_can_memcpy_from_wc(dst, src, len)) {
 		if (likely(len))
 			__memcpy_ntdqa(dst, src, len >> 4);
-		return true;
+		return;
 	}
 
-	return false;
+	/* Fallback */
+	memcpy(dst, src, len);
 }
 
 /**
@@ -134,12 +143,15 @@ bool i915_memcpy_from_wc(void *dst, const void *src, unsigned long len)
  * @src to @dst using * non-temporal instructions where available, but
  * accepts that its arguments may not be aligned, but are valid for the
  * potential 16-byte read past the end.
+ *
+ * Fallback to memcpy if accelerated read is not supported
  */
 void i915_unaligned_memcpy_from_wc(void *dst, const void *src, unsigned long len)
 {
 	unsigned long addr;
 
-	CI_BUG_ON(!i915_has_memcpy_from_wc());
+	if (!i915_has_memcpy_from_wc())
+		goto fallback;
 
 	addr = (unsigned long)src;
 	if (!IS_ALIGNED(addr, 16)) {
@@ -154,6 +166,34 @@ void i915_unaligned_memcpy_from_wc(void *dst, const void *src, unsigned long len
 
 	if (likely(len))
 		__memcpy_ntdqu(dst, src, DIV_ROUND_UP(len, 16));
+
+	return;
+
+fallback:
+	memcpy(dst, src, len);
+}
+
+/**
+ * i915_io_memcpy_from_wc: perform an accelerated *aligned* read from WC
+ * @dst: destination pointer
+ * @src: source pointer
+ * @len: how many bytes to copy
+ *
+ * To be used when the when copying from io memory.
+ *
+ * memcpy_fromio() is used as fallback otherewise no difference to
+ * i915_memcpy_from_wc()
+ */
+void i915_io_memcpy_from_wc(void *dst, const void __iomem *src, unsigned long len)
+{
+	if (i915_can_memcpy_from_wc(dst, (const void __force *)src, len)) {
+		if (likely(len))
+			__memcpy_ntdqa(dst, (const void __force *)src, len >> 4);
+		return;
+	}
+
+	/* Fallback */
+	memcpy_fromio(dst, src, len);
 }
 
 void i915_memcpy_init_early(struct drm_i915_private *dev_priv)
diff --git a/drivers/gpu/drm/i915/i915_memcpy.h b/drivers/gpu/drm/i915/i915_memcpy.h
index 3df063a3293b..93ea9295e28c 100644
--- a/drivers/gpu/drm/i915/i915_memcpy.h
+++ b/drivers/gpu/drm/i915/i915_memcpy.h
@@ -12,23 +12,13 @@ struct drm_i915_private;
 
 void i915_memcpy_init_early(struct drm_i915_private *i915);
 
-bool i915_memcpy_from_wc(void *dst, const void *src, unsigned long len);
+void i915_memcpy_from_wc(void *dst, const void *src, unsigned long len);
 void i915_unaligned_memcpy_from_wc(void *dst, const void *src, unsigned long len);
+void i915_io_memcpy_from_wc(void *dst, const void __iomem *src, unsigned long len);
 
-/* The movntdqa instructions used for memcpy-from-wc require 16-byte alignment,
- * as well as SSE4.1 support. i915_memcpy_from_wc() will report if it cannot
- * perform the operation. To check beforehand, pass in the parameters to
- * to i915_can_memcpy_from_wc() - since we only care about the low 4 bits,
- * you only need to pass in the minor offsets, page-aligned pointers are
- * always valid.
- *
- * For just checking for SSE4.1, in the foreknowledge that the future use
- * will be correctly aligned, just use i915_has_memcpy_from_wc().
- */
-#define i915_can_memcpy_from_wc(dst, src, len) \
-	i915_memcpy_from_wc((void *)((unsigned long)(dst) | (unsigned long)(src) | (len)), NULL, 0)
+bool i915_can_memcpy_from_wc(void *dst, const void *src, unsigned long len);
 
 #define i915_has_memcpy_from_wc() \
-	i915_memcpy_from_wc(NULL, NULL, 0)
+	i915_can_memcpy_from_wc(NULL, NULL, 0)
 
 #endif /* __I915_MEMCPY_H__ */
-- 
2.25.1

