Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 382F75BEE34
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 22:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF3C10E77E;
	Tue, 20 Sep 2022 20:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB3410E778;
 Tue, 20 Sep 2022 20:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663704317; x=1695240317;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EETNmBK+/upGAnQZs1afVUYD4QbaBMDLI9UcNzP/Zco=;
 b=VuK0BL/ONYIunPeE4IfhoDc9T2Lm3XtcAARUYjAYzuW8nkbnopGWrBja
 HSUijcQENsZRFumd7kx8/5BhrcDeT5wuiJHUbsAJMJ2xfavMaXJz4OjuV
 FPOVqjrmkj2Awm/IiWbnXnCaL/tnB3pfZwCGwksiej5ftBOj1Tkt6izdw
 OZQF1Hkw5NqZa5qP/edDp7QN01NvIK2GaZHWShQpP2qEEktAmk9W6f6k7
 3yBx2f3VF8nXYP2xnIVqzOEhNQjkEFQWv9hKo+0cG4V2rDyVrLYOT/oKN
 QlkSsAqTRlO/+2RZC4xwA9LowfBq8GMGRWHtB3labOpDT0tHLbpePwwj0 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="282852216"
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="282852216"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 13:05:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="722890643"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 20 Sep 2022 13:05:17 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 13:05:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 13:05:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 20 Sep 2022 13:05:16 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 20 Sep 2022 13:05:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YGG2gAPaHXWVBM9ZBkpccJ4YBsT8Y17jacGdEhadOIeJDXfMLe9Fc+6rrbY8JUL9NcEQBxmeat7hqEaxZi7PZfaIe9jjTuGA8owyAFzsSXFX5h62CunMKQLhFaymnHrq1uw6GC6QqgDU9hIf8RL129paU1YSzEbK+N+wWSuN9lKnbQw3FuOdz6v/HOZoGXi/7WTwBVqafhV3z8i2fU4P5weMfntS+NeWu5bmXdKSEaIjiaB7oy1yX343VPdbmYFpplF/3Dtoy/ePovFUznuU5KZclTPgw6GFID0Rv1WG5mTpaTibcZJFMlsSrZS44f4DbNVlzjWTsEOM7eP2gyZfgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YFgIOX0ItvAxV7zG4raXJI8WbOk4L3krVePWnSRs18=;
 b=PYuMroW2kWU0C6Jpb/ztaGqiAukeiHmdi8AKm4Eva/9vg3At+SOyD2iJdTUbIOVCoA7eAtGiGesN8cPFuMauV8PsS4ylpS6ufwlX7tfEoJj1KjuWgU/r/2A0kHe50HZ84rtf/VPp8Z+vB/zNRQx1QdJvsexRT9UMIvdmqncX/Wm6NqffX87nqnmCsttW2rkXfZ1q6UbZJXIfKMhcOwudOOvmbT23hOylkiz9MSVWzPwwBE5DN5sKfjZhuX0D51A5DGecV/hJZv5NNs5/vMGB6eqeeolZRPm6j1OP8E7i3B+BW6ufjhWT1U2wyeEqenyBVg7C2vi5UkMGTvlCQVl9pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5615.namprd11.prod.outlook.com (2603:10b6:a03:305::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.24; Tue, 20 Sep
 2022 20:05:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7b64:871c:564d:91fa]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7b64:871c:564d:91fa%6]) with mapi id 15.20.5632.019; Tue, 20 Sep 2022
 20:05:14 +0000
Date: Tue, 20 Sep 2022 13:05:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/mtl: enable local stolen memory
Message-ID: <20220920200512.pjjehlrebcr63uf2@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20220920071940.3775059-1-aravind.iddamsetty@intel.com>
 <20220920083149.pfgk62ugajc7trth@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20220920083149.pfgk62ugajc7trth@ldmartin-desk2.lan>
X-ClientProxiedBy: BYAPR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:40::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5615:EE_
X-MS-Office365-Filtering-Correlation-Id: 667ba056-e822-4172-77b4-08da9b436e7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PdukVm4JdzeO1Pezz04dg946gJfRDHx5ZdtHh0Ca8anuaodXzJqySsRDgdFNEV4vu7UofEbwkdRJ1IMpTuNdPKmNhEZCHKot3Eh8RJKPtsQCSHHVRmWC0OnHeqkCCJD0a1D79JKq/iYvPzYciKbwwJguj7b9zySCqcGhjsDxk6uTnCbK2j3VRsc940pJCp+loKuRwP0oFrZgNPhiT2H4ikmVYDtix1a1P9mIxAl2Ux3JRYrtv7snPTxsW72rtuk/47pbVO6s5+ev6fPxlyxWjv+fl+Z/Ok4ZemubRsXo5Z35tDrq4eLN8Sdnk8a4jp8B1STK1tAuubkyzZMsUXqUiH5gqeJ8j0q71q1Lr4ae4Ggt62YWauPL/jry9r1Lrh4fWaqJ5JMdLDtD4x2LF6wzxAup7J9JCjYN///hOtvfy+mMw4Z3YQbctQ5CAG+Jhv94pP/uECfb00zbJFlHctuC+cQVFVkEUGM1k4cpXgDFNelsutChKpFeMehPNSVfC7Q9vxQ9LYsKLRAqinqKbf6wpXpipROcVIA6Sdm2QHtD4x/y401B0v8xCbGoJ0AQ+ZmgdfE/TVaRiNoMgqgiAuNuzw0x+kUtoyxqKVlyBPmzsHLZmMKK+tSe9QgHSrH5TLmlRJ/4NApP/TyBe4DlhevVpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(346002)(396003)(366004)(376002)(39860400002)(451199015)(41300700001)(478600001)(86362001)(5660300002)(36756003)(4326008)(450100002)(8676002)(66556008)(66476007)(30864003)(66946007)(6862004)(8936002)(6636002)(82960400001)(2906002)(38100700002)(6486002)(316002)(1076003)(186003)(26005)(6512007)(9686003)(83380400001)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lSZ4BQELEpQ5rCzcUlILM+WvMIYcsgENt/Qj3XXfPlh6PdSRDnIGnHtLXJvg?=
 =?us-ascii?Q?dgaDX45JwAZ+1u8lLzIU7zgXxBLdQAsrQeqEOcumQswGQWWdDKsSgalBY9SV?=
 =?us-ascii?Q?r/6XThEoRMuC/DdsDaOf5SlHu7VtA6qkBkQ5C8V5/EkforJjGIrXXdnVYgd5?=
 =?us-ascii?Q?7wYMiP6ojSLwjlm+WOLS6+T33opnL1bk8sqqNlcQal74q2cDNtVEqqydZwfH?=
 =?us-ascii?Q?DAYjyAuUluHDiNS7a+Ay90FPuEgTYxq+RrwVR5igKg2NWgfd+7iEUVyai3VG?=
 =?us-ascii?Q?C+CGQ4Jyrft6C37Sm7lbJzUuhyWOPKZimJTUAYo4NuvW8evqrNFXWDrHYZOv?=
 =?us-ascii?Q?Ubaw5D/Tv8RO5g9LVSlXcNPwnsHM6uHX+M089feJkcUz2S3jltI9d6Uy2QRg?=
 =?us-ascii?Q?3X1bmQ/97hi0MBhxzV1wKjRXx5TqWEHoImLbESh0HpCj8DDLsU1yE7r6+Axb?=
 =?us-ascii?Q?YbOdejj6B0oOleLUNhWDqmcy8UpjVAW4KUI8nt7zXech+vYCRBjG7/+SSEIh?=
 =?us-ascii?Q?2gERdUwWlKXpgIGSw4EksK0JxJKok6uQyjOizOExtr7rDFN87+3nciY/mbvT?=
 =?us-ascii?Q?HLZZXM1XSaz+ZEOzwiAQ47eQH/H3UTT4ZvNNdnVW2tezGk+wYqid7v2qbJNA?=
 =?us-ascii?Q?WuDUD+UwgM6g7JM/Md0+x3+B6D4B2uztOl85A6UTDzDlPFDH3DysiXjtVlCs?=
 =?us-ascii?Q?hYT4Ep+cF3V/cVReffUEX7HMkonTYAbThuvzeK1VFH6FN4Qio+RGDI/tNc6h?=
 =?us-ascii?Q?JgfVbkn2wLuSyBArG81uBqYds+qfBqpccQi5XRcHcT+YTfCH1urBl0SBoDNo?=
 =?us-ascii?Q?hNJ4iAx025K5V+M3hULC0SmUsmVfOWXUa3eYTtFxmz744pxFreah8FRQILtb?=
 =?us-ascii?Q?+JpfIfO+fUBMxN8+bvBpMjsiS6HnCVcgwaW+N3pUA+QE84r0F6EKgTdp+vmB?=
 =?us-ascii?Q?9E+KST3maAos1MfMZ98vSyHI53cxw83Gwk551NZVeYkOollO8w1w1oaoL1j8?=
 =?us-ascii?Q?/JxuVHUmda+7SJ2VgylefE7uJOL9a+69ijLpt/AuxZ9XbG+wfNO2WjNG1Wx0?=
 =?us-ascii?Q?4PhG1z5ZH9ck6p9fmyce6rVfagBiZL5gE4I1oJ6RHFGKOkvXqDmoT91zO6qm?=
 =?us-ascii?Q?x4l/quCNYcgPLOedxpEbxpU2lm8ErLDjtqxiUxtHI7j1UzXbnW29RDUWhu53?=
 =?us-ascii?Q?Nsh5+czGdh3GEeKKRtRf55BgXRtxfnvJJx6xKnVmkOnmLD5L2kZDpyhwLYZ2?=
 =?us-ascii?Q?73xDtnCc7dS+7CpvR3Y+HlCwLdmoG3v/ckCNIYzEnLKTokppBCy21yilAnav?=
 =?us-ascii?Q?lfhPxT2IVOfN9oalb7P2yBD+526l+6duix3+/J5UkO4QsukqXnnGc+NKERa3?=
 =?us-ascii?Q?WGOSNKF0wj4nDTkusezlCACJ2vkn6w8AUR3EFm7MTPB6zdE3wcMFKlBANeof?=
 =?us-ascii?Q?chpxU2VBSXC+uBIMCw/GPUlmCRwIa0dR9l1EqvLJjD3z1cOZ/6qkv+0rX7Tq?=
 =?us-ascii?Q?tbA/tMHjrvzMwCOFmuUTHQGHKSYxmvjQ0r1JNvs1RHUyiVo7g2XeqSe5rCPm?=
 =?us-ascii?Q?nlN83m+nA03rUUTBYWZb1iE+U7bxIWcpz4YUVGjsa5kGr7ia1A0ROvTR1JxY?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 667ba056-e822-4172-77b4-08da9b436e7d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 20:05:14.6582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mkk6l0ovxwSDV5vVyhMg7dU3kFlfuKCXhaEhAHKv3eAJE+HknFFWy79NCN8xfmqlC1Cms+fq5eP43zJhARrTDkcG8vP+jEVlqQNr7+I7URU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5615
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

On Tue, Sep 20, 2022 at 01:31:49AM -0700, Lucas De Marchi wrote:
>On Tue, Sep 20, 2022 at 12:49:40PM +0530, Aravind Iddamsetty wrote:
>>As an integrated GPU, MTL does not have local memory and
>>HAS_LMEM() returns false.  However the platform's stolen memory
>>is presented via BAR2 (i.e., the BAR we traditionally consider
>>to be the LMEM BAR) and should be managed by the driver the same
>>way that local memory is on dgpu platforms (which includes
>>setting the "lmem" bit on page table entries).  We use the term
>>"local stolen memory" to refer to this model.
>>
>>Cc: Matt Roper <matthew.d.roper@intel.com>
>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>>Signed-off-by: CQ Tang <cq.tang@intel.com>
>>Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>Original-author: CQ Tang
>>---
>>drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 113 +++++++++++++++++----
>>drivers/gpu/drm/i915/gt/intel_ggtt.c       |   2 +-
>>drivers/gpu/drm/i915/i915_drv.h            |   3 +
>>3 files changed, 100 insertions(+), 18 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>>index acc561c0f0aa..bad5250fb764 100644
>>--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>>@@ -77,6 +77,19 @@ void i915_gem_stolen_remove_node(struct drm_i915_private *i915,
>>	mutex_unlock(&i915->mm.stolen_lock);
>>}
>>
>>+static bool is_dsm_invalid(struct drm_i915_private *i915, struct resource *dsm)
>>+{
>>+	if (!HAS_BAR2_SMEM_STOLEN(i915)) {
>
>I called a similar function as is_dsm_valid() in
>https://patchwork.freedesktop.org/series/108620/
>
>sounds weird  with "invalid" and the double negation on return early
>style.
>
>>+		if (dsm->start == 0)
>>+			return true;
>>+	}
>>+
>>+	if (dsm->end <= dsm->start)
>>+		return true;
>>+
>>+	return false;
>>+}
>>+
>>static int i915_adjust_stolen(struct drm_i915_private *i915,
>>			      struct resource *dsm)
>>{
>>@@ -84,7 +97,7 @@ static int i915_adjust_stolen(struct drm_i915_private *i915,
>>	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
>>	struct resource *r;
>>
>>-	if (dsm->start == 0 || dsm->end <= dsm->start)
>>+	if (is_dsm_invalid(i915, dsm))
>>		return -EINVAL;
>>
>>	/*
>>@@ -136,7 +149,7 @@ static int i915_adjust_stolen(struct drm_i915_private *i915,
>>	 * overlaps with the non-stolen system memory range, since lmem is local
>>	 * to the gpu.
>>	 */
>>-	if (HAS_LMEM(i915))
>>+	if (HAS_LMEM(i915) || HAS_BAR2_SMEM_STOLEN(i915))
>
>comment above makes no sense when you add this.  For this specific case
>it's still system memory, reserved by the BIOS and that we access by
>mapping the lmembar
>
>>		return 0;
>>
>>	/*
>>@@ -371,8 +384,6 @@ static void icl_get_stolen_reserved(struct drm_i915_private *i915,
>>
>>	drm_dbg(&i915->drm, "GEN6_STOLEN_RESERVED = 0x%016llx\n", reg_val);
>>
>>-	*base = reg_val & GEN11_STOLEN_RESERVED_ADDR_MASK;
>>-
>>	switch (reg_val & GEN8_STOLEN_RESERVED_SIZE_MASK) {
>>	case GEN8_STOLEN_RESERVED_1M:
>>		*size = 1024 * 1024;
>>@@ -390,6 +401,12 @@ static void icl_get_stolen_reserved(struct drm_i915_private *i915,
>>		*size = 8 * 1024 * 1024;
>>		MISSING_CASE(reg_val & GEN8_STOLEN_RESERVED_SIZE_MASK);
>>	}
>>+
>>+	if ((GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70)) && !IS_DGFX(i915))
>>+		/* the base is initialized to stolen top so subtract size to get base */
>>+		*base -= *size;
>
>that doesn't necessarily holds true.  According to the spec the wopcm
>base is 1MB aligned so even if it is "at the top", it may not mean it is at the
>very very top that we can just subtract the size.
>
>
>>+	else
>>+		*base = reg_val & GEN11_STOLEN_RESERVED_ADDR_MASK;
>>}
>>
>>static int i915_gem_init_stolen(struct intel_memory_region *mem)
>>@@ -423,8 +440,7 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
>>	if (i915_adjust_stolen(i915, &i915->dsm))
>>		return 0;
>>
>>-	GEM_BUG_ON(i915->dsm.start == 0);
>>-	GEM_BUG_ON(i915->dsm.end <= i915->dsm.start);
>>+	GEM_BUG_ON(is_dsm_invalid(i915, &i915->dsm));
>>
>>	stolen_top = i915->dsm.end + 1;
>>	reserved_base = stolen_top;
>>@@ -796,6 +812,46 @@ static const struct intel_memory_region_ops i915_region_stolen_lmem_ops = {
>>	.init_object = _i915_gem_object_stolen_init,
>>};
>>
>>+static int get_mtl_gms_size(struct intel_uncore *uncore)
>>+{
>>+	u16 ggc, gms;
>>+
>>+	ggc = intel_uncore_read16(uncore, _MMIO(0x108040));
>
>??
>
>>+
>>+	/* check GGMS, should be fixed 0x3 (8MB) */
>>+	if ((ggc & 0xc0) != 0xc0)
>>+		return -EIO;
>>+
>>+	/* return valid GMS value, -EIO if invalid */
>>+	gms = ggc >> 8;
>>+	switch (gms) {
>>+	case 0x0 ... 0x10:
>>+		return gms * 32;
>>+	case 0x20:
>>+		return 1024;
>>+	case 0x30:
>>+		return 1536;
>>+	case 0x40:
>>+		return 2048;
>>+	case 0xf0 ... 0xfe:
>>+		return (gms - 0xf0 + 1) * 4;
>>+	default:
>>+		return -EIO;
>>+	}
>>+}
>>+
>>+static inline bool lmembar_is_igpu_stolen(struct drm_i915_private *i915)
>
>doesn't deserve an inline. lmembar_is_igpu_stolen() doesn't make much
>sense as the lmembar is never igpu stolen.... you probably mean
>something else here
>
>>+{
>>+	u32 regions = RUNTIME_INFO(i915)->memory_regions;
>>+
>>+	if (regions & REGION_LMEM)
>>+		return false;
>>+
>>+	drm_WARN_ON(&i915->drm, (regions & REGION_STOLEN_LMEM) == 0);
>>+
>>+	return true;
>>+}
>>+
>>struct intel_memory_region *
>>i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>>			   u16 instance)
>>@@ -806,19 +862,16 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>>	struct intel_memory_region *mem;
>>	resource_size_t io_start, io_size;
>>	resource_size_t min_page_size;
>>+	int ret;
>>
>>	if (WARN_ON_ONCE(instance))
>>		return ERR_PTR(-ENODEV);
>>
>>-	if (!i915_pci_resource_valid(pdev, GEN12_LMEM_BAR))
>>+	if (!i915_pci_resource_valid(pdev, GFXMEM_BAR))
>
>at least for MTL, Bspec 63830 still calls this lmembar. So the rename
>for me is a net loss
>
>>		return ERR_PTR(-ENXIO);
>>
>>-	/* Use DSM base address instead for stolen memory */
>>-	dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
>>-	if (IS_DG1(uncore->i915)) {
>>-		lmem_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>>-		if (WARN_ON(lmem_size < dsm_base))
>>-			return ERR_PTR(-ENODEV);
>>+	if (lmembar_is_igpu_stolen(i915) || IS_DG1(i915)) {
>>+		lmem_size = pci_resource_len(pdev, GFXMEM_BAR);
>
>this looks confusing, but apparently correct. For DG1 the stolen is
>on top of lmem. For MTL, it's on the end of lmembar (256M). This works
>because on DG1 aperture == lmem size.
>
>>	} else {
>>		resource_size_t lmem_range;
>>
>>@@ -827,13 +880,39 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>>		lmem_size *= SZ_1G;
>>	}
>>
>>-	dsm_size = lmem_size - dsm_base;
>>-	if (pci_resource_len(pdev, GEN12_LMEM_BAR) < lmem_size) {
>>+	if (HAS_BAR2_SMEM_STOLEN(i915)) {
>>+		/*
>>+		 * MTL dsm size is in GGC register, not the bar size.
>
>it's not exclusive to MTL. it has been there for ages and it was never
>the BAR size like this comment says. Or at least it doesn't match the
>else condition that is using the GEN12_DSMBASE register
>
>>+		 * also MTL uses offset to DSMBASE in ptes, so i915
>>+		 * uses dsm_base = 0 to setup stolen region.
>>+		 */
>>+		ret = get_mtl_gms_size(uncore);
>>+		if (ret < 0) {
>>+			drm_err(&i915->drm, "invalid MTL GGC register setting\n");
>>+			return ERR_PTR(ret);
>>+		}
>>+
>>+		dsm_base = 0;
>
>if we stop handling part of the values in the registers as relative to
>the mapping and rather handle them as we read from the registers
>(physical addresses), the size calculations should still match and we
>shouldn't need all the if/else dance. If we pass the right io_start we
>can then make them relative to the mapping by subtracting it, or if we
>don't want GTT to be in the mapping we subtract it.
>
>That makes me wonder if choosing the i915_gem_stolen_lmem_setup() for
>all of this is even the right choice given we are actually talking about
>system memory that is mapped through the lmembar.


another approach could be:  handle the several coding style issues,
function names etc. Since this works for MTL, it's better than the
hypothetical solution that is not written and may not work well. I may
have missed something in my analysis. So I'd be fine to go with improved
version of this patch, and I can add to my todo list to try to clean
this up later.

Lucas De Marchi


>
>>+		dsm_size = (resource_size_t)(ret * SZ_1M);
>>+
>>+		GEM_BUG_ON(pci_resource_len(pdev, GFXMEM_BAR) != 256 * SZ_1M);
>>+		GEM_BUG_ON((dsm_size + 8 * SZ_1M) > lmem_size);
>>+	} else {
>>+		/* Use DSM base address instead for stolen memory */
>>+		dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
>>+		if (WARN_ON(lmem_size < dsm_base))
>>+			return ERR_PTR(-ENODEV);
>>+		dsm_size = lmem_size - dsm_base;
>>+	}
>>+
>>+	io_size = dsm_size;
>>+	if (pci_resource_len(pdev, GFXMEM_BAR) < dsm_size) {
>>		io_start = 0;
>>		io_size = 0;
>>+	} else if (HAS_BAR2_SMEM_STOLEN(i915)) {
>>+		io_start = pci_resource_start(pdev, GFXMEM_BAR) + 8 * SZ_1M;
>
>should be the GGSM?
>
>
>Lucas De Marchi
>
>>	} else {
>>-		io_start = pci_resource_start(pdev, GEN12_LMEM_BAR) + dsm_base;
>>-		io_size = dsm_size;
>>+		io_start = pci_resource_start(pdev, GFXMEM_BAR) + dsm_base;
>>	}
>>
>>	min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
>>diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>index 30cf5c3369d9..b31fe0fb013f 100644
>>--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>@@ -931,7 +931,7 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>>	unsigned int size;
>>	u16 snb_gmch_ctl;
>>
>>-	if (!HAS_LMEM(i915)) {
>>+	if (!HAS_LMEM(i915) && !HAS_BAR2_SMEM_STOLEN(i915)) {
>>		if (!i915_pci_resource_valid(pdev, GTT_APERTURE_BAR))
>>			return -ENXIO;
>>
>>diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>>index 134fc1621821..ef3120322077 100644
>>--- a/drivers/gpu/drm/i915/i915_drv.h
>>+++ b/drivers/gpu/drm/i915/i915_drv.h
>>@@ -973,6 +973,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>>
>>#define HAS_ONE_EU_PER_FUSE_BIT(i915)	(INTEL_INFO(i915)->has_one_eu_per_fuse_bit)
>>
>>+#define HAS_BAR2_SMEM_STOLEN(i915) (!HAS_LMEM(i915) && \
>>+				    GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
>>+
>>/* intel_device_info.c */
>>static inline struct intel_device_info *
>>mkwrite_device_info(struct drm_i915_private *dev_priv)
>>-- 
>>2.25.1
>>
