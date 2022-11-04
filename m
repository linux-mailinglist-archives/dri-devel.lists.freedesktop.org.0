Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1348619192
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 08:06:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D2210E6D0;
	Fri,  4 Nov 2022 07:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C49F10E6D0;
 Fri,  4 Nov 2022 07:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667545552; x=1699081552;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Hy73bog8XzsCNNMdutLfGzremlQKzYUoXYfPyY2t1V0=;
 b=EfDc5WjQ9Wa4KT9QvYkzTPOGEcds87zuRC4kUG5OWvp9Pk1SM6zxhSdX
 i7NDrOYy7+NG1f9jLak+mI8DPjgDDj2HYZkLmDYD8OHcBWoMF4djEyXx3
 ytr95DXDNI6km92zDG5MiWEF75/XkWAW0H1FmP6yxu1pWoaf+KJHJtORW
 VHOpIIgT+1DKLnui+QnAzRQnbqHXIjUiKJGzNNAiLU0uO9kCDDDck6nry
 z06PYgZCsn4i8vdT4607slWayE94u9Irb3ZPmFxrGiTFZc3bv7yoqnnOk
 jbSqgyMjc8ZFzWlnM9YPPIVBJaoyVEWe84lHRHzbEfqHzm/lsMCmkQgFX g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="336598682"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; d="scan'208";a="336598682"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 00:05:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="724251137"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; d="scan'208";a="724251137"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Nov 2022 00:05:51 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 4 Nov 2022 00:05:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 4 Nov 2022 00:05:50 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 4 Nov 2022 00:05:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbgw7w7usGfGh3wVLlSlEAovMm96Avm1R+0P2JKh8B+6yUW3tpdo8TttBAp0ZKDGcwoNkqDvwzWN3kyfWje/n9dJYVRdfop0ZjsOrxKHdX9GerN8rxlMc0nSI7YyRFTpgLhe0KWxnxzc77oftZCbGHPBPGbEy+Nk/MHiaWTgHmTS+VMnWUUIMXpUQA/qpv68HAanJF0QO8pXrI6i9jjEY5WcClbzR/VssdcJbsN0tUivHjiFK+fBDj0tlN+z2z0cYuIOWwIFUgpiOLDSLJuwbnbklNvi246lsD00hhNAa71z+MW8lhsp1nkTkwAqhaaaDmzs5WPaRxFjGyFeVzEFng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSijLQ6PkwNo24LoLJNG8kYIz/W9kxF6XR13hqTwHGc=;
 b=RxqU8A+I6GVLmwX5ySj/sw/quIafNOGYPQlBq55Lb2IyALR9y+z5zPGk6itH4lcFRdtbBf+ZNDPJse4wqBAwuU92Ys7LoROCcjdRJ5sf6reckXpnAOlJ0/Ipsh04+9g78KQki5TYymQFk2y1UKwm5RH/YoDKahdS7ozK+Y9uNrt26p1+rXHautAyYcnahRXYmASdrpJpEYv2w+NcvUiFMfysqeDbDPc2L7suxXV6C4zsACM9mqRgnuE4nIB+4l2fzela3n49AdM6tYCfnze6Oof5wgSx3JPXHeZ33JRiKpB9kqmjmsYgJk4xz4JCHUi9mo6rCFiVedfiN5axrySWMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB7181.namprd11.prod.outlook.com (2603:10b6:8:113::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Fri, 4 Nov
 2022 07:05:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::928a:8709:1301:c988]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::928a:8709:1301:c988%5]) with mapi id 15.20.5769.021; Fri, 4 Nov 2022
 07:05:49 +0000
Date: Fri, 4 Nov 2022 00:05:42 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Media GT and Render GT share
 common GGTT
Message-ID: <20221104070542.yh5ff4elpzqe2xj4@ldmartin-desk2.lan>
References: <20221031123111.1240326-1-aravind.iddamsetty@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221031123111.1240326-1-aravind.iddamsetty@intel.com>
X-ClientProxiedBy: BYAPR07CA0030.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::43) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c0d4094-8f3b-4c22-5b51-08dabe330086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 42mZhQuRW1N2wFGh+Mc9aOcN0MerfQkLw87YhoSSzUjjkzgoXHtwkFhmmEKHKfn6dzGdiDQ/YHUN9EKfWUJrFJGJKQAJ+XnwX9HS/PldHHu9meL/GDVnuKq3bqr6KK2dlA7krzlFdpXASSFGxZM8vNPYnXlVJLuz3+Wn1374nQZsB7N5qxt8xfRtixAs3dG1fmcteyQorFn2EIT1sKWXlTQB8KHEtMdqrE1a1SivCNMfAoJgDYP+sdSOgJIiK81pEgWODAyVMyzXVIxR3mfvljG3Ky90R5Uj6BP/4SjpePp4y+dWTN4tX6i/nJFUGhDU5DFUGjCWMPpqRWhCoZ1/rYm2PJlI/8HpZOO49MUMbzzsLBEzYUTOAr5U8/9eCdM+luvlgc6RMHnGXKiuvnzw05/vBv2Q0TapOzHtLnqJa6a0demWflvFGVTulEgm7inuYJ37O9ip+2aE/BCTLjTxbiOX84ZXbWRC99kCtwmTX3CguKzDAc8Ou+J0VmkBGVIIb55fp+I5n4sJie/cruFGFqNLHyUWCa0OF+dd64cCbB2eJReYkkp8VZHtVfqm+CXqXp3h8Z7CYuTZ5499syW84V+rwP53aO24DZzgwKt48P56UiEL8cdAqTbjPbcNgwC36EQjMUsvGayeyEomFFHywg82xXzfDdj22Z5LZ8dtw5yuCexAWPnDQSeiyS5r29LY45cPnMWpx22mpWm0QhzPVr1S74OWBf+9QswqnmlUTlLVrK4WXNjkePO8+m4gaC8F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(396003)(136003)(346002)(376002)(451199015)(82960400001)(38100700002)(86362001)(36756003)(66556008)(6506007)(4326008)(478600001)(2906002)(6486002)(6666004)(450100002)(6862004)(5660300002)(1076003)(66946007)(66476007)(316002)(45080400002)(41300700001)(8676002)(6636002)(9686003)(8936002)(186003)(6512007)(26005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q5uG1KJkULAmP0zon+hDFS5Nn823IwfR1Eh0vIcHxmgDpUoZSnpITaJQbLjd?=
 =?us-ascii?Q?Mjcmm7j2nYSHBqP6QkRWusTjQKuUfXzgnJEQ8L9o56azVG3HoeW/M0yVwpkh?=
 =?us-ascii?Q?9seSF+BgeO/DhMqkXS1ScQ511baH0bHhRswiAi5p7uZXYIwr+5DB+Ph6rPmO?=
 =?us-ascii?Q?NUC2J7kugJdymVZ2zwEetbKwEcxrfVKbQihh+Q0ofbFQWqu25v2S1YJffcKX?=
 =?us-ascii?Q?7V+gJOdxYM7urEQwxkoNfRXPndr3mo8SLOS+06lBLxM96fxcV+qmCRRlz2ht?=
 =?us-ascii?Q?4GbmvhIpid+MndKxW9G/aUdLaL6HUorx4c6XkW/E0MtxfvsBxHYvniuc/w/+?=
 =?us-ascii?Q?O2xn9AhyOakW7TKJJ2DdNWNxixeVy5+nzV9SH0e74q9WQLSH9tanGVtr0z57?=
 =?us-ascii?Q?n/7VA5iZwUwM4k3gbYsMfeNXfVca4PuvzyIFyDRUnR/amiLir9gmrrP3QSjl?=
 =?us-ascii?Q?GKYeBDp1pqdrf0nrQAdMzln0+qRsYPQKxXMtAwRBpvr6LYxUKIgY+P7lp8jd?=
 =?us-ascii?Q?q1G3vYeYoldGurrwxqa5C2IKSbfymM3Xtx2w14wmXVGXEoPNYDTsmF8kjkN/?=
 =?us-ascii?Q?rDGIpo0EEtBaTumlKLc/JVFd3tjWqRWYQzZMlFQRBDP1/sctEuVBjUWheGdm?=
 =?us-ascii?Q?kTNCCuambAzRuubsnvhbITMgDrt5bMbHZnkq2AgaOkN54zAUNrrxjiBpD7vv?=
 =?us-ascii?Q?ekNJDUm1PDfN90BVuFVa70xe9/nc76vWUWdAY/QvXBduOVR28/2qguFpn6zX?=
 =?us-ascii?Q?HshEnoAHYqks38JctKG4XicHxf21gVV9iDXkWEvjzTrxveucCvpJVXtz1bwn?=
 =?us-ascii?Q?1vUBf46jWX6MwoM4BmB5se7vNnqe8YN4efYWRRVZxh/hyrpo8hOwro3Pk1Vy?=
 =?us-ascii?Q?YAINerl5mq9vapXqOdGs7cZQvFTyQGUeR4bA2Qo4WHXu96+5IOtQ6GvEjwVJ?=
 =?us-ascii?Q?Nzm1Ur976LKdAJD8y3HqLxMXzrB7UuohUAW2rKrQpkp6mbQRmo/Kk/xbSnm5?=
 =?us-ascii?Q?KGKOaksMYuu8L9qtDs6NOl/sp6TkI98Yb6lhyIL59Y7eeT1oV9xJJNoUB5CF?=
 =?us-ascii?Q?Rp8SufmGneTKXUVVL4e27/pWgXstNZU1NiT2afVcOy5Vs6wmFXdaMx2OgZ3m?=
 =?us-ascii?Q?mjqiJzb07pJ75zL2gRnAIxEgHkRWhN023tnlNDR00czN/IQ+bF6+4zkynjqh?=
 =?us-ascii?Q?Vxap3ULLmzRnlL4ANXrPPsq65jg65XTIlO925qa/o9JcbrNHyMym4eV82Pm8?=
 =?us-ascii?Q?D53br4msWnASOOapu5rLDT/dd0Tv7NtKwARCckaqv1PJDU7v8yb0Ze5yBkNE?=
 =?us-ascii?Q?AdTwEq7awS8Ppab26nKi00gO9h6MaUDcEHSX/dqukm101rsUZeOuyr50/cvr?=
 =?us-ascii?Q?9rINGBiluFUFcuk4ANmQoPOIuA1+SynFjHam52g+DRf5pV4k5gZ7WK24YxOq?=
 =?us-ascii?Q?k3vyePBiIPH2tOZ+kqqeDEVbAsMSs2+IWJpBr1OawxzOzop0cNdG/oQkqbEq?=
 =?us-ascii?Q?u7FJ5Jhtc6KTCZtsDugDgfFYVxppPGpogFsX0qb15NuKgnNGGC1657jvENc7?=
 =?us-ascii?Q?2K8I26w0VX7vLaMmqs582wtZUZTAGf4XZe3m2oh5HnJ7ttvtVFcEdEjMpx2k?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c0d4094-8f3b-4c22-5b51-08dabe330086
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 07:05:49.0886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ZoIpV4XehLZveiqtbSXFYSkgXd24omiGS/Zpq0Bj2QXsaALp/koSOxw2UkujxWU5O9/Br1Pt76svW+4UGianJpYXlgvWbUwFNrGaQo2LQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7181
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 31, 2022 at 06:01:11PM +0530, Aravind Iddamsetty wrote:
>On XE_LPM+ platforms the media engines are carved out into a separate
>GT but have a common GGTMMADR address range which essentially makes
>the GGTT address space to be shared between media and render GT.
>
>BSPEC: 63834
>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>---
> drivers/gpu/drm/i915/gt/intel_ggtt.c      | 49 +++++++++++-------
> drivers/gpu/drm/i915/gt/intel_gt.c        | 15 +++++-
> drivers/gpu/drm/i915/gt/intel_gt_types.h  |  3 ++
> drivers/gpu/drm/i915/gt/intel_gtt.h       |  3 ++
> drivers/gpu/drm/i915/i915_driver.c        | 19 +++++--
> drivers/gpu/drm/i915/i915_gem_evict.c     | 63 +++++++++++++++++------
> drivers/gpu/drm/i915/i915_vma.c           |  5 +-
> drivers/gpu/drm/i915/selftests/i915_gem.c |  2 +
> drivers/gpu/drm/i915/selftests/mock_gtt.c |  1 +
> 9 files changed, 115 insertions(+), 45 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>index 2518cebbf931..f5c2f3c58627 100644
>--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>@@ -196,10 +196,13 @@ void i915_ggtt_suspend_vm(struct i915_address_space *vm)
>
> void i915_ggtt_suspend(struct i915_ggtt *ggtt)
> {
>+	struct intel_gt *gt;
>+
> 	i915_ggtt_suspend_vm(&ggtt->vm);
> 	ggtt->invalidate(ggtt);
>
>-	intel_gt_check_and_clear_faults(ggtt->vm.gt);
>+	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>+		intel_gt_check_and_clear_faults(gt);
> }
>
> void gen6_ggtt_invalidate(struct i915_ggtt *ggtt)
>@@ -214,27 +217,36 @@ void gen6_ggtt_invalidate(struct i915_ggtt *ggtt)
>
> static void gen8_ggtt_invalidate(struct i915_ggtt *ggtt)
> {
>-	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
>+	struct intel_uncore *uncore;
>+	struct intel_gt *gt;
>
>-	/*
>-	 * Note that as an uncached mmio write, this will flush the
>-	 * WCB of the writes into the GGTT before it triggers the invalidate.
>-	 */
>-	intel_uncore_write_fw(uncore, GFX_FLSH_CNTL_GEN6, GFX_FLSH_CNTL_EN);
>+	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link) {
>+		uncore = gt->uncore;
>+		/*
>+		 * Note that as an uncached mmio write, this will flush the
>+		 * WCB of the writes into the GGTT before it triggers the invalidate.
>+		 */
>+		intel_uncore_write_fw(uncore, GFX_FLSH_CNTL_GEN6, GFX_FLSH_CNTL_EN);
>+	}
> }
>
> static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
> {
>-	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
> 	struct drm_i915_private *i915 = ggtt->vm.i915;
>
> 	gen8_ggtt_invalidate(ggtt);
>
>-	if (GRAPHICS_VER(i915) >= 12)
>-		intel_uncore_write_fw(uncore, GEN12_GUC_TLB_INV_CR,
>-				      GEN12_GUC_TLB_INV_CR_INVALIDATE);
>-	else
>-		intel_uncore_write_fw(uncore, GEN8_GTCR, GEN8_GTCR_INVALIDATE);
>+	if (GRAPHICS_VER(i915) >= 12) {
>+		struct intel_gt *gt;
>+
>+		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>+			intel_uncore_write_fw(gt->uncore,
>+					      GEN12_GUC_TLB_INV_CR,
>+					      GEN12_GUC_TLB_INV_CR_INVALIDATE);
>+	} else {
>+		intel_uncore_write_fw(ggtt->vm.gt->uncore,
>+				      GEN8_GTCR, GEN8_GTCR_INVALIDATE);
>+	}
> }
>
> u64 gen8_ggtt_pte_encode(dma_addr_t addr,
>@@ -986,8 +998,6 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>
> 	ggtt->vm.pte_encode = gen8_ggtt_pte_encode;
>
>-	setup_private_pat(ggtt->vm.gt);
>-
> 	return ggtt_probe_common(ggtt, size);
> }
>
>@@ -1186,7 +1196,7 @@ static int ggtt_probe_hw(struct i915_ggtt *ggtt, struct intel_gt *gt)
> 		(u64)ggtt->mappable_end >> 20);
> 	drm_dbg(&i915->drm, "DSM size = %lluM\n",
> 		(u64)resource_size(&intel_graphics_stolen_res) >> 20);
>-
>+	INIT_LIST_HEAD(&ggtt->gt_list);
> 	return 0;
> }
>
>@@ -1296,9 +1306,11 @@ bool i915_ggtt_resume_vm(struct i915_address_space *vm)
>
> void i915_ggtt_resume(struct i915_ggtt *ggtt)
> {
>+	struct intel_gt *gt;
> 	bool flush;
>
>-	intel_gt_check_and_clear_faults(ggtt->vm.gt);
>+	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>+		intel_gt_check_and_clear_faults(gt);
>
> 	flush = i915_ggtt_resume_vm(&ggtt->vm);
>
>@@ -1307,9 +1319,6 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
> 	if (flush)
> 		wbinvd_on_all_cpus();
>
>-	if (GRAPHICS_VER(ggtt->vm.i915) >= 8)
>-		setup_private_pat(ggtt->vm.gt);
>-
> 	intel_ggtt_restore_fences(ggtt);
> }
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
>index 2e796ffad911..d72efb74563a 100644
>--- a/drivers/gpu/drm/i915/gt/intel_gt.c
>+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>@@ -110,9 +110,17 @@ static int intel_gt_probe_lmem(struct intel_gt *gt)
>
> int intel_gt_assign_ggtt(struct intel_gt *gt)
> {
>-	gt->ggtt = drmm_kzalloc(&gt->i915->drm, sizeof(*gt->ggtt), GFP_KERNEL);
>+	/* Media GT shares primary GT's GGTT */
>+	if (gt->type == GT_MEDIA) {
>+		gt->ggtt = to_gt(gt->i915)->ggtt;
>+	} else {
>+		gt->ggtt = drmm_kzalloc(&gt->i915->drm, sizeof(*gt->ggtt), GFP_KERNEL);
>+		if (!gt->ggtt)
>+			return -ENOMEM;
>+	}
>
>-	return gt->ggtt ? 0 : -ENOMEM;
>+	list_add_tail(&gt->ggtt_link, &gt->ggtt->gt_list);

I don't think this really works.  You're adding to &gt->ggtt->gt_list
that you just allocated above. I had this patch applied and noticed
this:

[  151.417250] ------------[ cut here ]------------
[  151.417251] list_add corruption. prev is NULL.
[  151.417254] WARNING: CPU: 10 PID: 1780 at lib/list_debug.c:23 __list_add_valid+0x3e/0xb0
[  151.417259] Modules linked in: i915(+) prime_numbers drm_buddy drm_display_helper drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops ttm overlay fuse x86_pkg_temp_thermal coretemp crct10dif_pclmul crc32_pclmul wmi_bmof ghash_clmulni_intel kvm_intel video wmi ip_tables x_tables e1000e igb dca ptp i2c_i801 i2c_smbus pps_core
[  151.417299] CPU: 10 PID: 1780 Comm: modprobe Tainted: G        W          6.0.0 #382
[  151.417302] XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
[  151.417304] RIP: 0010:__list_add_valid+0x3e/0xb0
[  151.417307] Code: 75 46 4c 8b 0a 4d 39 c1 75 56 48 39 fa 74 6f 49 39 f9 74 6a b8 01 00 00 00 c3 cc cc cc cc 48 c7 c7 c0 57 5f 82 e8 96 9c 61 00 <0f> 0b 31 c0 c3 cc cc cc cc 48 c7 c7 e8 57 5f 82 e8 81 9c 61 00 0f
[  151.417309] RSP: 0018:ffffc90005787b80 EFLAGS: 00010282
[  151.417313] RAX: 0000000000000000 RBX: ffff8881428fb778 RCX: 0000000000000000
[  151.417315] RDX: 0000000000000001 RSI: ffffffff825e0c4c RDI: 00000000ffffffff
[  151.417316] RBP: ffff88813f6c3828 R08: ffff88849effffe8 R09: 00000000fffdffff
[  151.417318] R10: ffff88849e200000 R11: ffff88849ed00000 R12: 0000000000000000
[  151.417320] R13: ffff8881428fdaa0 R14: ffff88813f6c3f50 R15: ffff8881428fdab0
[  151.417322] FS:  00007fc71052d540(0000) GS:ffff88849f900000(0000) knlGS:0000000000000000
[  151.417325] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  151.417327] CR2: 0000555a8fad6858 CR3: 000000013b7f4006 CR4: 0000000000770ee0
[  151.417329] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  151.417331] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
[  151.417332] PKRU: 55555554
[  151.417333] Call Trace:
[  151.417335]  <TASK>
[  151.417336]  intel_gt_assign_ggtt+0x42/0xa0 [i915]



I think something like below would do it (untested):

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index c1e23b4be8ed6..454b668108457 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -8,6 +8,7 @@
  #include <linux/types.h>
  #include <linux/stop_machine.h>
  
+#include <drm/drm_managed.h>
  #include <drm/i915_drm.h>
  #include <drm/intel-gtt.h>
  
@@ -1196,7 +1197,7 @@ static int ggtt_probe_hw(struct i915_ggtt *ggtt, struct intel_gt *gt)
  		(u64)ggtt->mappable_end >> 20);
  	drm_dbg(&i915->drm, "DSM size = %lluM\n",
  		(u64)resource_size(&intel_graphics_stolen_res) >> 20);
-	INIT_LIST_HEAD(&ggtt->gt_list);
+
  	return 0;
  }
  
@@ -1218,6 +1219,19 @@ int i915_ggtt_probe_hw(struct drm_i915_private *i915)
  	return 0;
  }
  
+struct i915_ggtt *i915_ggtt_create(struct drm_i915_private *i915)
+{
+	struct i915_ggtt *ggtt;
+
+	ggtt = drmm_kzalloc(&i915->drm, sizeof(*ggtt), GFP_KERNEL);
+	if (!ggtt)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&ggtt->gt_list);
+
+	return ggtt;
+}
+
  int i915_ggtt_enable_hw(struct drm_i915_private *i915)
  {
  	if (GRAPHICS_VER(i915) < 6)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 143359acde5a7..ea3b895dbe6b7 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -115,12 +115,13 @@ int intel_gt_assign_ggtt(struct intel_gt *gt)
  	if (gt->type == GT_MEDIA) {
  		gt->ggtt = to_gt(gt->i915)->ggtt;
  	} else {
-		gt->ggtt = drmm_kzalloc(&gt->i915->drm, sizeof(*gt->ggtt), GFP_KERNEL);
-		if (!gt->ggtt)
-			return -ENOMEM;
+		gt->ggtt = i915_ggtt_create(gt->i915);
+		if (IS_ERR(gt->ggtt))
+			return PTR_ERR(gt->ggtt);
  	}
  
  	list_add_tail(&gt->ggtt_link, &gt->ggtt->gt_list);
+
  	return 0;
  }
  
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index cb1272702a1a1..f2a608c182c82 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -585,6 +585,7 @@ int i915_ggtt_enable_hw(struct drm_i915_private *i915);
  void i915_ggtt_enable_guc(struct i915_ggtt *ggtt);
  void i915_ggtt_disable_guc(struct i915_ggtt *ggtt);
  int i915_init_ggtt(struct drm_i915_private *i915);
+struct i915_ggtt *i915_ggtt_create(struct drm_i915_private *i915);
  void i915_ggtt_driver_release(struct drm_i915_private *i915);
  void i915_ggtt_driver_late_release(struct drm_i915_private *i915);
  
-- 
2.38.1
