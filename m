Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A9A510483
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 18:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F256610E8C7;
	Tue, 26 Apr 2022 16:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C659110E1A2;
 Tue, 26 Apr 2022 16:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650991833; x=1682527833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=SsgGOQ6lgdQAdGZjsd17faGSvFyQkuAUFRCdb5aZCHU=;
 b=AqC8CHGfgQwgWnKh6ZUoULSKfxT84GFSK18k4oc9K+T/xhrSDvBDH3rZ
 7bhtlvKebnVpu/7ngsyfrjTZmbLvANxYkc7e1E/bU3+thKZiI8tlyN9dn
 Nsz6FZjg0441/n9BO9YZ9x8Jb6asXVZC3Q9W7q/XencUYZzX2/UR4whu4
 j7U5U5Q4Id1aVbluAZlrH84oKjgArH6YGDiqm95BsYupwcW9njzTPLanx
 AKPYmGBRf9Fd4HzO/a1J9m/QXD+/S1skFJqf0Q/Hd5cpKmgIPbuVSSgSz
 LcarVxdKgt5HbD2GR7VLgDYw7yT6N4zkXagGuhVSc1+/zUhOkIIJqAuiw A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="265457808"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="265457808"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 09:49:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="650292313"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Apr 2022 09:49:51 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 09:49:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 26 Apr 2022 09:49:51 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 26 Apr 2022 09:49:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWi8mdbEGYGDEh+KPTDSvyLmYx7C85J/A9CbI3SsoFoS+UsbugYpcOFe7+5hOMapdRYNGvIQCMq0XA7in2vx1QKAgIHeTevNQrGuzWc1PvMetqta8Y5fVxgy7T1BfG2ZUopMwqNnXrrL7XaBP037PKTCZpKJsjRxPLZhhByQPn26Ql15Qj8ilrPVxIvUMmNypq/WE1JzizuYtMr4T1S21HExNPSdt5vO/rwYmUS4FA6uqH5GwJzJQ9/ge8wmrYSx+f2txDz578jmO7r4kM4yYEatbdvIsASt/sWJlUlWrBVKlXgXlBfsUYkRtZhcfErfMgMAH6rOSLg/C/TdpL/+9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHj0M/45ot8dJaRp/Xky9JMFW6YKv3g+1IuHOq4Is4w=;
 b=hT6yDfPxFN0MG2CK5JKxm61BCmyl6mZ0TRJn5tbXeWtGOgocZmeGLfaC5YFetgWvaXkzSPbNtJUkICD1ML9G1lCzp3VX1Hm+wWwm+vPMM1ONheWZHn3NmWUhzUoy+ovfdvPDMiahdYvRq1dw44pzS5eT6YbQOyRCudz9G2ntGIxN2whm4I3tdKhAnvOSDevkJeST8QvfiJR6FJbpBAELs++Qva3VQNizVSYJJ3LQ0Z69+Zzw5RppIgnmcnQw9gJz3VtPIIEAnlZwPI5urVWpSYiuFya6Biehz0vKP7oo1hPZ6PNmh6PuMlwJN81O9CIsstoRfWTQ1r95w1DEs7fcFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by MN2PR11MB4366.namprd11.prod.outlook.com (2603:10b6:208:190::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 26 Apr
 2022 16:49:48 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::3d83:3af5:c95f:e062]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::3d83:3af5:c95f:e062%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 16:49:48 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 3/7] drm/i915: use the memcpy_from_wc call from the drm
Date: Tue, 26 Apr 2022 22:21:44 +0530
Message-ID: <20220426165148.1784-4-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426165148.1784-1-balasubramani.vivekanandan@intel.com>
References: <20220426165148.1784-1-balasubramani.vivekanandan@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0129.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::8) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee18bad7-8745-43a7-26f8-08da27a4c645
X-MS-TrafficTypeDiagnostic: MN2PR11MB4366:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtFwd,ExtAddr
X-Microsoft-Antispam-PRVS: <MN2PR11MB43661A012E7DD2655CFA40D99FFB9@MN2PR11MB4366.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CFq8D993+3IvfeCHLivfRvhV6ASuT3tl0Y+Pus4qai9v+EX5yuuWLyXqjKxunCWioW4lmTp8wI2NMunSA4MQp/UVtYA/jVPC5xmLan0ijaqLg1EWCI1YPwe0c+Gqc9+BVcWktUumDGyYA5k+5ZsoKp0UDoEQBHZJmcyBYtcNuGjOlC/W4Q6rFumLkLBdanZB2k+/iI8pG6yNplylLzLDm3YDxl2xQb+8UlGFwZNfEJP/oz+ISIlLVhhBUxtBQlimZvDjyU0zfLWO+sApf3/m6xmjp91olOwxfIRuvc00XpwqGN0veofrZ4A9XvvOfcjEIq+oksK4rC0Ln3oeLhg4OUGMn+VRJJuElzhQ2e2EQfBJp/ueDabglgJvCamHnUpZ8Vnj/Vlw7OYfhMxD6FiZ9QxCtjW+DRSYEjnsWYOkMhKNfJJ+oxwuOkyerywOATTR8R5YPAeFow09p3eS1HkxUNiQ/kWdmgvNYckM+cpQopj6aCxOmfzpdf9gVZOEde3PHelHlp4RDTGty/dBhErk4XpqUMdXDlAnHGtJyfoTOMItzFzuRMFybua8DHPi8j3jE0hRLPv2RpPkJ8gp12wDCme/srr5nfcjYvXqY6IPlhzCgLgOSRXe93D+I6lJ8KUP9zIjDYhPXXKWIbChapo70XRaqal8XHnTUtHPGlcEq1r46MFnUOMX0DUw/LK3QBN9vyskhcmnLhmNIiiuHIrn/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6666004)(2616005)(66946007)(6512007)(5660300002)(107886003)(82960400001)(450100002)(26005)(8936002)(66556008)(54906003)(316002)(86362001)(2906002)(1076003)(38100700002)(44832011)(6486002)(508600001)(4326008)(8676002)(66476007)(83380400001)(186003)(6506007)(43170500006)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DHaaxIf9tiwR+jbGnKv7GcE+0P7xkpnpHGDSVK2YhyFN2944Yq884o5ByKXB?=
 =?us-ascii?Q?HotK1sz1OomJ+6t+duriI61YqdZAwAvaYQgckNLOFWxfdWXN4ETmXvomPBxk?=
 =?us-ascii?Q?M5iWwvUYCD3/w0JfUjej4pVGb3SWQFy7a2BM+npcRh2aiQUL/5w9wy+4KiCq?=
 =?us-ascii?Q?P1KsZp9mCPKxICOITdLp5f7lvPzxwqWXH4o91WCp0r03lC39lqeZ6Z8u2aeN?=
 =?us-ascii?Q?kcJG6JOQeFuf23s/TvTq5soBAm7JfJYuYjoYWB5J+GPeiWDMKQrW4H8X7rik?=
 =?us-ascii?Q?+M75dh0IQcGigqUhHPsrdge+PqitG8JEMRVXc2RejmONyR37fEMmd5bXkkgo?=
 =?us-ascii?Q?JmKNvYia4mrpfXXMmZ5SduS4qUrSTlvVy2Ko+NO+4G8eLRT9m6wU0R6/vU1k?=
 =?us-ascii?Q?FU0xO37TZOttxClzmoIgatMFCP4UG1MSDzuPvPF8HlP9Tgw+WjeQJHMZ+n5K?=
 =?us-ascii?Q?FRGYfOy7949pfslgCoV/vuPIGvZ1jqTPx2gaZcRZvDnhoKEh2Ec9NvJZG8hY?=
 =?us-ascii?Q?+m9AGkMx2fWPf4+doOZ+UOAo9zBFDpYBfdJ9lNfAlMDPDNjsT91uWFqUZmvn?=
 =?us-ascii?Q?GxageubEJwGDwEmDJK0CaHp0fNlIe2Eo0Fjcm7fzXwvW7KhVpOzagySYUr5b?=
 =?us-ascii?Q?b0oPWClXUuflo6sMI4mcJpk9WQ25+RlgLjz+ZbblHy0v11NJqaYK+w5jWcob?=
 =?us-ascii?Q?jUtJXdW2I0Wxu/Td7+gLMrwJaDcpawmSaYMbauq5SqTPfYWtxVaP2f9buVUZ?=
 =?us-ascii?Q?g8mDDTtmlrJHEeOBeKqszZXg1iYkrwfV/UDmQkpG+19nHJEMvyS04OYbi5ma?=
 =?us-ascii?Q?B6N6PS157gHbl9IuV5Qixi/hl6WdYggahim6JIbM+gGTaKlksNHjoa/2uQJ+?=
 =?us-ascii?Q?HfPmmpJgGRiUDwM6J41B8XUAMUTpzMjZGCHA826Jrxy8pOO58J/ar91jWVc7?=
 =?us-ascii?Q?UC40uOZBtDygshW/KwpPhiPynnFqu4GiOGg4Vz8DCGMHqqE8MhpjuK2D9UVj?=
 =?us-ascii?Q?eKz44ib/iNcvBTMSnPHL0mpNXMB2fpaenDL8sFa3OH9bUbGQLgqd0WJ9QbxJ?=
 =?us-ascii?Q?6UuCf5cBlvj829IbiiyZZuVtFAyhztI+MWy0GM+fHW1W5LT48pjnuC9n2rlh?=
 =?us-ascii?Q?2wKL89q1aG2F/f3gcDx8vMHB5XoBhZTxKGOtPZM2AFDRKxc9ZopKjuWtb/1/?=
 =?us-ascii?Q?crs7Z2+XJyBv6hT1t6xYPGIRgSqsUIFT4qtYdzFSF97gMKfsQ11LqrgI97nv?=
 =?us-ascii?Q?1cPE+1ah1ydqcRV+wT0La5OnV8dyJiDBWK3KpWrkYU4dWPz0KiNgYxUafJ65?=
 =?us-ascii?Q?lGxWTU1LIPmoVgp0f9baW3Jvwhes5O9mZls1MBeva6jUrtyIDWHJAxxQbVk8?=
 =?us-ascii?Q?ukvlkNVxusNAcbojPJ1YgMrrV15Pw+yneqSuQa2jVSZwUWDNOVTVGmYsmxWP?=
 =?us-ascii?Q?KbLFkAqTQ1WexpeT4u1u3/xqnxwkIw7R6kG/dMStSHMopxjEdA0I533XqJae?=
 =?us-ascii?Q?ppozN0L2qU3OZ9mOy6QW/jx+eNYdm/N47JA73AiJmH6XlEyLgOXmGnzS+NwF?=
 =?us-ascii?Q?vp7m/2EeRycbjir1QCtWAqC39yYoGUD48/eYvJBWrjgvQ1QtCdEyoARbyyOw?=
 =?us-ascii?Q?PMCBVS93ey2qnv/UgzhkX32z0A7yFHj2vXcpK/td3vWA8ksocQ6CK8Xwm1sj?=
 =?us-ascii?Q?xvMoUT29YowjS5iwO/YlQ6T5ae1wo4C5J5e3bWsart0uO3F5pMQoTQ2ufTHs?=
 =?us-ascii?Q?RZkM2Gicy6zeOkSBVqxFYSsNrOFDxooOhlcRz1dtCulR6Gda44cP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee18bad7-8745-43a7-26f8-08da27a4c645
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 16:49:48.6054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7J+NK2xgOoqVH/vOAtB3e7yppwEMviTm6gYmj7ynrfGrYLTAdDYEjCz7wv4P0vgh9jBGDk/I+0iBkB8dupB3K3vY5vIY1HwXulTFtFvfjVaqZXBzR3ZT75+yYmn3UdV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4366
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
Cc: siva.mullati@intel.com, lucas.demarchi@intel.com,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

memcpy_from_wc functions in i915_memcpy.c will be removed and replaced
by the implementation in drm_cache.c.
Updated to use the functions provided by drm_cache.c.

v2: Pass newly added src offset argument to the modified
drm_memcpy_from_wc_vaddr() function.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 06b1b188ce5a..c1ff0a591a24 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -438,16 +438,16 @@ static void
 i915_gem_object_read_from_page_iomap(struct drm_i915_gem_object *obj, u64 offset, void *dst, int size)
 {
 	void __iomem *src_map;
-	void __iomem *src_ptr;
+	struct iosys_map src;
+
 	dma_addr_t dma = i915_gem_object_get_dma_address(obj, offset >> PAGE_SHIFT);
 
 	src_map = io_mapping_map_wc(&obj->mm.region->iomap,
 				    dma - obj->mm.region->region.start,
 				    PAGE_SIZE);
 
-	src_ptr = src_map + offset_in_page(offset);
-	if (!i915_memcpy_from_wc(dst, (void __force *)src_ptr, size))
-		memcpy_fromio(dst, src_ptr, size);
+	iosys_map_set_vaddr_iomem(&src, src_map);
+	drm_memcpy_from_wc_vaddr(dst, &src, offset_in_page(offset), size);
 
 	io_mapping_unmap(src_map);
 }
-- 
2.25.1

