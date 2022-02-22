Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C68F34BFB31
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 15:51:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CE710E85B;
	Tue, 22 Feb 2022 14:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2B510E855;
 Tue, 22 Feb 2022 14:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645541494; x=1677077494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=MWIsW/HP3dwWvfr5Oing21QcjhKqQ/YYs6dgjEiaIuk=;
 b=BimI4Z7wIVw0LXW1mSpFPY9VQspEPUDQmISKx7SvXCwH7OzASnm43+l0
 D5wxRSe5/6LiIalhkoy8FSBCy3dMjZoPk1PoDrGckjHR5BsXH5attSt/H
 ZmmMKDyf8jU+4XtEFOfuT9qLr/S9GaQoYOkdsqc5t1lKs3Ee85+ZFFHhF
 ZncIAHH0iTZYZkENBySIv2XP/iKgQ8ETlLVeL4HAKWA9OdgFwPTwkhq4I
 xloFBe25RcNPz7i1EREqMyigyG1cgRVONJ6LEbFzNTy0DYJ/Z3fl4bXoM
 j3k5L87ffx7o+Ju1njUhRnj/G9vdLChcNU4CUQenobtjU3mWnthQWF6Wm A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="251462640"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="251462640"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 06:51:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="683541015"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2022 06:51:32 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 22 Feb 2022 06:51:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 22 Feb 2022 06:51:32 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 22 Feb 2022 06:51:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WpyslnpgIJgiJz1jFDKYzTJ5ERplSZRBN6m2ytkuEKt4VDt52+5oE6uFjwouGhyIkA+palkbw9HvwM+GbGT1or3/F0PI9SKWhLuMwot7639C335AxzmTiRRBHVboLwlzxlIPq3qqtM8XVkdjvGo0/K4gPQkwwBlo+l7aJv84n2fmHUSjXCRjceObPWipX9q31QR5Zv87pHTB1RkWsnL8zKbsWyJnYBGxr0js4guiHNjwK68CLZmPM6uuCOuuxRaxGCngUfiQDGJtthYIzZcexE8mhJLccPDnmXZu560YH3RZNMte8wxGZd8tV5LbvTxu+7x07xXPmjWLs+raK/Gkwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDzcATe6EUesN4dj12+h3S8M1LIVjMhuzNCigiXCVj8=;
 b=YRZMWnoPKxvAYC/q9rTjZ0y7PYw71KaesM6Qe5aZRrYphNc+Ei04EitjKd4jhSC7Ordd141lW0Jbz5TS9A7w0T1tB+a6lg0vxwzt6zm/iEgI4hxyMtmut5eTNQu2cYolr9kTeTT8z+asa4YX+/UpNURv5AAWx18qMcYphApPkilfmpsrZkC/TtUPJMtRm4Udxo+Z1608xOFrOQc/vpi9YwQ8pc6yWA1ohNP+o9D/t8f41AzAAcBDPTUglGXiLBLMpeNaPiWJATvijPzZWYr8B7xKC/gtJtgFFuMVEHHqJpJfHlECo9Y1kcWAAMIkixIcPWjT91TACf0psyS4pKF+yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by PH0PR11MB5627.namprd11.prod.outlook.com (2603:10b6:510:e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Tue, 22 Feb
 2022 14:51:30 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475%9]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 14:51:30 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/7] drm/i915: use the memcpy_from_wc call from the drm
Date: Tue, 22 Feb 2022 20:22:02 +0530
Message-ID: <20220222145206.76118-4-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222145206.76118-1-balasubramani.vivekanandan@intel.com>
References: <20220222145206.76118-1-balasubramani.vivekanandan@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1PR0101CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:18::13) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62f073f4-c5bd-4ef3-77c4-08d9f612cf78
X-MS-TrafficTypeDiagnostic: PH0PR11MB5627:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR11MB562753EEC5F8446587981F5F9F3B9@PH0PR11MB5627.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZZtDGOg+rHYOUO6+vNc9RYk5ohZiXtF1/uPsCwIWy60wliqGK7huEqz3cqqNnRZtv6TsRwsR+E9kr6vg8kwOwicJOQtpFqfRONV46cmjlNJgYf2pPX+c2nMB+algtPfO5iaO+7fd3mlrZD/3gn/FarRGY4vaEhhtK9iDmdM4CjJrqkvBprOD5ZsK5zGHq2DbKHQu+24kGyCsoi7LWJVqRDP6P+QdMMtilbLTrLgHPHjzapagAfRqJye/Rap9L5u9KlH/Xqbn+3Ia9rbJKnoyAosP8SyvLJgY3Hux01ha2TnhckyIk7mJPBsNKbw0fO5+7fAOIenF1SQM+jXhlVFISTNaGwitnv/aDPrAckBgl28TTrXtUGrJwpVFgXqKBfrhve244fU96p4ylLPfQfZikwx/aYpPn4bZHh3wopI+hhd4u4qc4K7xovu1dqtyYAdJjYO+64fzsBADGiYDEei70AXlcLCynsBGbJhGwMNCL3vZ3x2F5UCr3lLcLjSqnCsmuXBR4mOn2EGzO6MHP5gZrYO2b4fZpOlM1ezDvND49hBfdCOVXNFSgGT9pf3a8AAOZXbYBVy3xhrL747Y7smUpnioOT3Kj8xgSoAZYpZBAObgBy1lcc1vhCVsLaXLLox8uhXX6wJekQl76cTIN47DplHKsRxATdni4dgrl2ml8e+xhL4cc6DxE/ygidgPdseo/PuE2pLZfoNXvKFZ26GnsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(82960400001)(38100700002)(316002)(66946007)(66556008)(66476007)(4326008)(8676002)(450100002)(8936002)(44832011)(5660300002)(2906002)(107886003)(2616005)(36756003)(186003)(26005)(1076003)(43170500006)(83380400001)(6666004)(6486002)(508600001)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5AYe20uXEx33mKHaBqsOb/KgZpoAuBx3qqD0NErIRjNTxY6qfj457nAWT0Qr?=
 =?us-ascii?Q?6Z9kc543mI4wrEvc2oqBFrUB6bSQV0J6hXV+J3OuSbBNFTkyRfz08rZ6QUtD?=
 =?us-ascii?Q?sfiUSGZ5R3gWlAtPvGwhFPbxnMJ05T2AUj/qUyb6cQPrScSpXy8U3APqTlnh?=
 =?us-ascii?Q?/xx+VqAgdHFZ8tlA9fL2U6irnIMvDTQ7E+m21F5EoVWpQcn+k0BldIqZDzgM?=
 =?us-ascii?Q?+GUtyM+fvBbVb3JmSSZGh1t/qvWDVCf20mnlQ/ZY5X50HQFyIMyceamP9rB0?=
 =?us-ascii?Q?USNiRjBJ2IYlxwwv+04PvrZe6lL17b1uXrWZPEO6D/dtjoS2DmjIjLw0w4I5?=
 =?us-ascii?Q?sD+Or6KomWL595xUZ2ksd5cij026DoCbxdZLvGsf+m9RRK4qPGNUq4dPwpcO?=
 =?us-ascii?Q?WZBMmqL/wIdZmHXpUQSV1b5gph7l++kYM8oNZ1ru6HhEQTb4V/5VtxTWRTbN?=
 =?us-ascii?Q?oC0f33QA4wGPZql4ZHzFNQEO9vShJyIhry3hmKDx3SZ56sqzg4k7ikcZQmI3?=
 =?us-ascii?Q?4s3i23uqRPPuoEAN+IGf83c98MDtkoWwfnZ1hdO0aw3sCT2saK/hhVKXsnsz?=
 =?us-ascii?Q?0gYUY/PDslV1jC8xHXHc8ROPvl0s6TeyDn32oVYZedQCECNX4V1nk6Upq+iC?=
 =?us-ascii?Q?yCaYuH3q0nhEHodO40Rp4yZaTOKhdM9Ns1VDmEhNPIYBD8IGxjuL7Tx5pFHG?=
 =?us-ascii?Q?z2eS/EPiCF/dRBqg6voUQRn2RAumUjr3sET71CgASyn3N6I3jhBCG48SsYf2?=
 =?us-ascii?Q?CX7UxSTLi3orw/VtITAYzIthPayF6Klzxk8sMY4kZ0edD+k9yr/P/YpYm0Kp?=
 =?us-ascii?Q?dyK+rP/sIPsB7y80MpCChTJ0BeXvWe0e3g8Iiap4WKjzRrWiSANrkG7qTpk3?=
 =?us-ascii?Q?VO/S9Owfm17qG2zC+4WUVfVKeLwD7qWKl27mEY8LP945A/7n1xDXpv3TIlsd?=
 =?us-ascii?Q?+swwvESAJd0Q5v2Y9ACdAegDCigl6NxXrOUPrI4mT69uzk7JR9AtlkzgZc2l?=
 =?us-ascii?Q?giaD+sYAvY6OQRn7ExAwwgfeDLjKnAM4eAuh2QUfdGpEopjIfRg5tTvJVC/6?=
 =?us-ascii?Q?zF3wsj0lvPsyzbiFXb8ctVDzaNsbTmU7645XUp36T35cJG307ntehZt9UvQr?=
 =?us-ascii?Q?4HnHcxva0MWlXtD2zYH482JBhJ8QR3mfSwfrBPamVQwa/J2OENF51u4XrfSh?=
 =?us-ascii?Q?zBh3FPZN3KwWwNb4BRBNFypcQOCOch8G709ZYM2vgPeGZlMKJ1TsPb48Lbwj?=
 =?us-ascii?Q?KJvU36LYp+e5Hw8+Uin/BQod1TA6TnmK2MYOVK3hYAVc1hyp5qfuHs2b0oad?=
 =?us-ascii?Q?7qtZ6IKgxeARx5PlBuu2QOpJ6SnzEAUC9tAlYE1L3/3Dpwp7pr1n2sIVeqZv?=
 =?us-ascii?Q?CkeeyP0WR+qNliNaSt+CoNL+p70l3C9FSUdHeDnkpoR9PeljBvDBv9Z2AFiU?=
 =?us-ascii?Q?rjD6jVpO6tAWVSWs+9mUC5hcSBTyVuVC0vjf0plzoTHKkNjU8IS3FhdJgve4?=
 =?us-ascii?Q?wGz+fV9pWTspQXZu2ojf9lI9dxPECc1XtHm2sbfA338lSgwfVfRONdjGpFJu?=
 =?us-ascii?Q?rvgsVnAp+NuCRkWcosRdgZ+6//a7Es1HJLR6vtYODs44qCaODnfyueuuA5/r?=
 =?us-ascii?Q?hhon9qXcDeG6lX17pqbqrUinj4w+rSNCqBc1+O33AZW+Je2QNdegJqlsVqZ0?=
 =?us-ascii?Q?JD1fMi6MR+OMqjsTql0BVAw/YFW3jy777zC94xNHU71UYBD/iW1rOkrQHWVF?=
 =?us-ascii?Q?IJwekU/hCg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f073f4-c5bd-4ef3-77c4-08d9f612cf78
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 14:51:30.1196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h2nqOMutDhpX9EnLoKMvLX5kmfoqPItfMxFIioOmI29W0929X6vL91IXkcUC1r8jgz5zfIepY+io8HaYUMUfCKeD3CJnGkNx03QtxTegUi0vGInmy1WqikVahnL9E10/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5627
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
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 2d593d573ef1..49ff8e3e71d9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -449,16 +449,16 @@ static void
 i915_gem_object_read_from_page_iomap(struct drm_i915_gem_object *obj, u64 offset, void *dst, int size)
 {
 	void __iomem *src_map;
-	void __iomem *src_ptr;
+	struct iosys_map src_ptr;
+
 	dma_addr_t dma = i915_gem_object_get_dma_address(obj, offset >> PAGE_SHIFT);
 
 	src_map = io_mapping_map_wc(&obj->mm.region->iomap,
 				    dma - obj->mm.region->region.start,
 				    PAGE_SIZE);
 
-	src_ptr = src_map + offset_in_page(offset);
-	if (!i915_memcpy_from_wc(dst, (void __force *)src_ptr, size))
-		memcpy_fromio(dst, src_ptr, size);
+	iosys_map_set_vaddr_iomem(&src_ptr, (src_map + offset_in_page(offset)));
+	drm_memcpy_from_wc_vaddr(dst, &src_ptr, size);
 
 	io_mapping_unmap(src_map);
 }
-- 
2.25.1

