Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933614A8887
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 17:26:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21D610E6A8;
	Thu,  3 Feb 2022 16:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFFA10E649;
 Thu,  3 Feb 2022 16:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643905561; x=1675441561;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=umOHpoUefb7jlKPUswjucxN1iA4XwzgOtqz7EJcFseE=;
 b=HCYTwkiwife7lwNIEi/0vuGeIz/RWcCIBv/dzkKaY74VWhSm8Pwon2HD
 wylUIJrZ9Mu6Jfzyg8qdK7CVsESgAhzFPuXMzFKygxHe/H9zMO9jfA+PQ
 Z0T1uMZk54iz4jvLXxURBTM01HUqTLlYYNpbFZRGaq/qOV1vkwVv91hA3
 2FertvNTUqsEDVV9f1s/MJya3pXmhSOy4yxdsLyCt7VqX4LsaARclq5o9
 x/hp1cl3iOtTeuRC2Dh2iAIgCO4Hb/dhaYVbaSCaANqXbfbNDNCYfUIZ+
 92RDQPfEaofie5r5itreuGFvXk4le/h7uEfAZU95FJ3fk02ckG8egByEt w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="308907618"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="308907618"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 08:26:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="483289872"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga006.jf.intel.com with ESMTP; 03 Feb 2022 08:26:00 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 3 Feb 2022 08:25:59 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 3 Feb 2022 08:25:59 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 3 Feb 2022 08:25:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRrIYlx8xWY19dxUKyJjtSNBNCTXjt/udpjP0IT6sdvkGxFdtatm/mzDhTKY8E1GtQa2FpkBLrT+IH9wicKdta4R5yIgErnI5db2KP0NffQ0qTIC2xDASYQsuALxeBo+XflDoqHx8rlF4HYx8FrSBO2Tu75WMEA7FYanDLcayTUEOQzYYqEpmyh92ohJlgVaoL1nEqGUPNi41Wf2q0y8IL5njFpQQGQr2Lr/zfYDBRKOrk+H+5QWskbf4WRpSBMbJdJi7HgEOkihXrPa6WOGkMPAAvYEZiWsr+ry0zx9DR1Eb5z+R9OaetBldxo9w27EkQ7fEjayCOrviVneaVeDqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BAsI81/u/c/VIKBkweI0YHgjBUxI4tL5+nRz3j0vMQ8=;
 b=ZIb8s0FE3xYNdOl1th6462TtzkoNgSD5h/5Obgxd1RCDHA0ALqRCx0KFo782gy5QaWjOckZbFVT3OMZbn5hjCDeGxJlGftpYohflnII7xH5Wy4kui6mSQiyV7WAtR/Ss/wV/RyCAeY5ijpZm/XNvMiRmOhKqT4NsYMUTFw4ccxMRCDjKeyDI//6HaBXPjgadgab7lszbKOvVYjtVoPNnAk3S2/0vBEAKRS85sXf5lvg24Eu7O4xHY30uMHI89w76Q7vs+7kLL9QX6lG7fO7LvLlXy55ctqwk6fTC54OWDsBFs3hOq79TVSt1KaKdTaiweAD4RDY7ompkl464Hlknpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by BN6PR1101MB2097.namprd11.prod.outlook.com (2603:10b6:405:50::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Thu, 3 Feb
 2022 16:25:56 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::4c25:af8f:60a8:3992]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::4c25:af8f:60a8:3992%5]) with mapi id 15.20.4930.022; Thu, 3 Feb 2022
 16:25:56 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915: Add fallback inside memcpy_from_wc functions
Date: Thu, 3 Feb 2022 21:57:03 +0530
Message-ID: <20220203162703.352447-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BMXPR01CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:c::32) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db896d60-926f-4430-d2a9-08d9e731db18
X-MS-TrafficTypeDiagnostic: BN6PR1101MB2097:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN6PR1101MB20977574E3D2F580EA1CBFB39F289@BN6PR1101MB2097.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hThF88jq2ErB7LKWuXFZIQ4qw8SOta+a/95E95ChXwUOW6rzBndAib5AflBingfDMvkiVUhe4eXJv2zShBYio7p1uRDdZhWHc7qE/wtXiojBKsd7esMwBNkOYMJeTCnslPYMdF9E51C7MfTPVikyPaSqHnzbJYGx0H9jaH21PD0toFiMaCV24/RbxbGRbcvewueVVt6FomMRsJkwpsy+nE0vH4wnytvdVpFj4JbSuku6+I0ZAzTdhMouC7AmiPyjGsoBZ+6UYBtO+2/sGvpj85Q+3ncBW3ZuK3gwdmg2wDm7AKPd3jxHH9vDcEMg0KeBF/FUz1aYlR2hW9++hA6/Jg1ptVvwtNo0tdtROYNstDAs20I+o/t6o1mHZNP/Ya09drpAb9EDYyQ5lnf7SivK88PZ79ABqDJMabknIitYjte5nXIUlsJxhEzLDywT3vBb9axAiaxKV8RQS0uOIvBs6uf453HiICVxsbLVpEusxjLZJL5PpZBe8gczKMCPcmBd6fcBvv/G8fpMhGE+hBpGzd8DpBBqWsdbxtEouf3Xg5WlCnPS9jMxu0XXS3dJV39hNXUd/Bq2HJPwnLZ5iBw+H5KifzP/7w9hoQ3t+DDk9NvgFKDttMB9VMh4JZJ6LQadKeViJ80bZ5yQbB5gkc1nYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66556008)(6486002)(44832011)(66946007)(66476007)(508600001)(6512007)(5660300002)(450100002)(83380400001)(2616005)(2906002)(107886003)(316002)(26005)(186003)(1076003)(38100700002)(82960400001)(86362001)(36756003)(6666004)(6506007)(8936002)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aIZfZnetF4K3y6V53iJS2zsNlnsEuPdWlanVfB/T4UTkjlXfVF3SOAHiBLur?=
 =?us-ascii?Q?7nbabA3Kb32Ei4TwL9TsbyDh5zeFAUoocJ7KAUe8VhhLSSmlw5nmHmiZLWzW?=
 =?us-ascii?Q?sYNL7d9oSbQAQmHoBybIu1T6HlFOco+hiRviretnT/oQ5EWCeWP/hRaTc73V?=
 =?us-ascii?Q?tvr5ZFA8nu0SOOQkLqxagn/9WhtjkZHTmM8igy0Q3UsqiJLaxpqSrbftitVX?=
 =?us-ascii?Q?DBE8vyF4zcn/sYFGPQDnbm4pweSe9/huKPAtyzbS+cW/86eyW+KMm51m29B3?=
 =?us-ascii?Q?XyhBw9eunBHu+6+IhV4FTN3xGJi1YOLL4GAjhsrED/fBfQybGU2+pZbHBn+V?=
 =?us-ascii?Q?86+idlN/8LMB7uR+Y1DFFvH+to9Ngx4BO4kUFzEgs4PGFUtlpoizwbdcIppq?=
 =?us-ascii?Q?Vux7pUR4u3OeMqlcBfL22gHSBgjPXU9DuCRex8/vwPBpoLZICSOigPN7W18p?=
 =?us-ascii?Q?HRgjjzuwNoBa9uNEkaWm/orkEQnaE4PllXcSXxvbjm2IEv1fKeP+NgiJNrJe?=
 =?us-ascii?Q?XB7k5jlAiKFjYHbuF8EnQ934GteqBuwR+f2WPAuY5GqB3DnfRpU8UdgWFXrO?=
 =?us-ascii?Q?OivDb7lnzKcytKR10Eq2tVtO+R+nLqYKic2mCwPA0HyJ6gaOWv7/bB4dhTGi?=
 =?us-ascii?Q?WgE1Txtb3tVoqKyYXq5sd9Am22S/Tv2tPsfSBYjO+e5Fv1FB1maWFYSfsY6r?=
 =?us-ascii?Q?CDZXaqX5sh2M5cGVshC3ED1UzRLekHM+/aibgj2Q0jGYvRpdC57DzmGhJY29?=
 =?us-ascii?Q?BJdYwa4kjGk0D0nbdSeNah0tz/ql14BIFFaFslFrBaNYub2IJppmkrw2eBDx?=
 =?us-ascii?Q?qY4Cs7MnLrGZ9vDXxJwBJ3c1qqAn4oJ4GQr45HL3v2NzfwgzmrUE8SZ3gIxu?=
 =?us-ascii?Q?vVqga4LHgRK621xqYsdNlE+IAFf2tR3UGx3FGleEQ19HEulXtYjD+0xC7LUD?=
 =?us-ascii?Q?GXQDCF6DAxhfImENN5e0dP0PVQvTAKH7qTCnTQfI0XCLzWVycmjoZt/B75qI?=
 =?us-ascii?Q?HJ+Vz0ta/jG8sHNly2W1X86q+z68RDSwLDmBACdOOjRdT6xazHIBeL9tHg4y?=
 =?us-ascii?Q?mxEo9rPzcwkf+z3ypuMFnHsuLixRXvnR6g9rO9x8IL59zT6szgWTzDkIPjFs?=
 =?us-ascii?Q?RwRkFb+vNs6gqmTnU5UPc2NZ4ABFjQyzylc6FgU3ZRs6mpGooz7OXDrz3PwK?=
 =?us-ascii?Q?l8EvUM/3//JjsAUoeGRlxz0cDJ8b6ysvbEtDyTsaYy+Kpxq0JarVD5nMULj5?=
 =?us-ascii?Q?M07QTU0rANh2f5hPh3b8Uqz3DbZ6eO2qRiHlGa/9CyMGc2Rtd0iLajUzrQ8R?=
 =?us-ascii?Q?T0K7m3hzj4sL6KPSu2OdleOA1YWRRs/7N9ad7u40latpPwCI9jZoTjrHuKRx?=
 =?us-ascii?Q?/c7vm8GNW3+WaTF2WwoN591aAYe6/xXbj5PPLKpYNhNemqmO4/QfmHSkvxGC?=
 =?us-ascii?Q?FVoqnpwKkf4WQzyeImv/0sErgcsZVPcmp26tH02m5L7v9nE/B8Z6LzPUvXFz?=
 =?us-ascii?Q?XaNrDZprizzqByTb/fTf0jI/qZgjGX+ewTS18chz8H4UsN5yJPu6W9r4FNse?=
 =?us-ascii?Q?KDNp3IulTjVRSymbB3Xzt0q8vkkjI0YGaQmajvmhaLy0OMqg2sMZEXIx/E8y?=
 =?us-ascii?Q?3VSlBHQUv9sgSbbD2pRxLrGSr/IQboQ6Uk8Mf2uhHMzrYPjwjmByZVFllXW2?=
 =?us-ascii?Q?8DAgXIX/dtR8mD64ec8tCPHSSpXj35NNTgMY1BtA52N4NvzMvV0M4lgA/NHT?=
 =?us-ascii?Q?a9TFA0ls1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db896d60-926f-4430-d2a9-08d9e731db18
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 16:25:56.6136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rrerbf5UlsRQ2oiuiMMnQmwgazeD07VgBJCemw8jND1eleVdDgknTd+veMvd55hxUeAu0Q8fxWRxK/6wHUBaTuN/eX7Fc/zUFq5QjGDhjgllcEnqWfx9s2Hp7HWXz7Sa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2097
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
 drivers/gpu/drm/i915/gem/i915_gem_object.c |  3 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c   |  8 ++-
 drivers/gpu/drm/i915/i915_gpu_error.c      |  9 ++-
 drivers/gpu/drm/i915/i915_memcpy.c         | 78 ++++++++++++++++------
 drivers/gpu/drm/i915/i915_memcpy.h         | 18 ++---
 5 files changed, 77 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index e03e362d320b..b139a88fce70 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
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
index aee42eae4729..90db5de86c25 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -296,8 +296,10 @@ static int compress_page(struct i915_vma_compress *c,
 	struct z_stream_s *zstream = &c->zstream;
 
 	zstream->next_in = src;
-	if (wc && c->tmp && i915_memcpy_from_wc(c->tmp, src, PAGE_SIZE))
+	if (wc && c->tmp && i915_can_memcpy_from_wc(c->tmp, src, PAGE_SIZE)) {
+		i915_io_memcpy_from_wc(c->tmp, src, PAGE_SIZE);
 		zstream->next_in = c->tmp;
+	}
 	zstream->avail_in = PAGE_SIZE;
 
 	do {
@@ -396,8 +398,11 @@ static int compress_page(struct i915_vma_compress *c,
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
index 1b021a4902de..b1f8abf35452 100644
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
+	if (i915_can_memcpy_from_wc(dst, src, len)) {
+		if (likely(len))
+			__memcpy_ntdqa(dst, src, len >> 4);
+		return;
+	}
+
+	/* Fallback */
+	memcpy_fromio(dst, src, len);
 }
 
 void i915_memcpy_init_early(struct drm_i915_private *dev_priv)
diff --git a/drivers/gpu/drm/i915/i915_memcpy.h b/drivers/gpu/drm/i915/i915_memcpy.h
index 3df063a3293b..3ae71ba9e3e5 100644
--- a/drivers/gpu/drm/i915/i915_memcpy.h
+++ b/drivers/gpu/drm/i915/i915_memcpy.h
@@ -12,23 +12,13 @@ struct drm_i915_private;
 
 void i915_memcpy_init_early(struct drm_i915_private *i915);
 
-bool i915_memcpy_from_wc(void *dst, const void *src, unsigned long len);
+void i915_memcpy_from_wc(void *dst, const void *src, unsigned long len);
 void i915_unaligned_memcpy_from_wc(void *dst, const void *src, unsigned long len);
+void i915_io_memcpy_from_wc(void *dst, const void *src, unsigned long len);
 
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

