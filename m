Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B4E6D164F
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 06:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CACB10E025;
	Fri, 31 Mar 2023 04:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE6B10E025;
 Fri, 31 Mar 2023 04:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680236461; x=1711772461;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=f9eKYmqwtdNvwYU7uC8mwvOyCnxXJ+tOe5PKPSNDG0E=;
 b=AMWRVfyM8aFB3Q+KhUFP4v7y4OFvnm8Kpa35/O4KCNnccHjN/sqgzrKy
 fD/UoHh42jBJdFH0p/4GRuTEerT/bt3xksmFpY2vjAtfg8LLDXl79iMDg
 rhIyD5XsWIqRuHcLqailsffnRl/4COHVtO/4v8yv/m2WgNXwzZg4Jo2bz
 Z97EDf5KmtMs79K8SEvjXDrUlG8jy6X3Xb4Fys9O8HS275IOBHKuFUDGk
 OwiBT7l2hdW9qO8LLGhnKroxQMau3uwcq97GURgJiyLaUtBBFFRmM2x7N
 jKe6O0Dw7NMOU3R+Yj0/p5RRyLs3PnUWSFvWgiU9fqf8DjaZ2k4QKX1A+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="340082231"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; d="scan'208";a="340082231"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 21:18:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="635153141"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; d="scan'208";a="635153141"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 30 Mar 2023 21:18:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 21:18:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 21:18:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 30 Mar 2023 21:18:13 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 30 Mar 2023 21:18:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJ0YTFBCeVYq1MtLQtPERYpiLEN0He4VUAsz076L9cIQnic4CAUkpqrm30NI4QZOKn0QtiOjbnfmUaaiweawzrVBaXzY6c8Y9ofyfvYmhnVCC8Y5bO0uUXiCL54qHYDNgcKFwyydvSLbLF+RwiyHwr3c7hZYbwJBwDRI89aTtjFDICcMMHlSjvY6vS1esXFNT1qoBFSWJC5jCXpeYXkrifdF1+Yj8DoQ1Jt1lfoVenUV+IBvEXBIWrxW+OTrmsZt/H84GOYk03jJ6swxp9a+dJe+7jRXjZCuM8hW0t3Vp517+J/ewqLgnkQpnDHzs6RZOYGB2pyDfZKpTLJcuepF6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pY6lVtOqGpaLkl5tJnLTHEnjMhEXfMQf16OKr96XTJQ=;
 b=m9m0STlvaxUkHtTcTgnVp8nWbchx95+o7hI6DkcWKwSsjv+sOr419dSBlCT6e/EZKCrbDOdAgpeRJiN8IVJntC6hMulwGUGpBgQzVwlrQIgKvykJbXlvQj1GivVF3nbGh4900G0loNgfAMlhUpb0RWbc80FwgPurj1BslNKmZVuM99KdbknZYjcV3D4sCuVCC3rdDbQ3Kwzl2YSY3pqubhrdqoFLvydAEuYmCXgrykg03L6EgK5QTs4ayJIvWZ2DJtFa+faK+fPw7p9/4GaYyD+QMTZT/2dVkvzwUWlB57JU6ZjUQ/YHohDBckvl/IJspk0wxaEPb/Rla7e/U+I2PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by MW4PR11MB7006.namprd11.prod.outlook.com (2603:10b6:303:22f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.29; Fri, 31 Mar
 2023 04:18:06 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::c5b2:6996:5aee:91db]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::c5b2:6996:5aee:91db%5]) with mapi id 15.20.6222.033; Fri, 31 Mar 2023
 04:18:06 +0000
Date: Thu, 30 Mar 2023 21:18:00 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Matthew Auld
 <matthew.auld@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Chris Wilson
 <chris@chris-wilson.co.uk>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 9/9] drm/i915: Use kmap_local_page() in
 gem/i915_gem_execbuffer.c
Message-ID: <64265ef8725fe_375f7e294a@iweiny-mobl.notmuch>
References: <20230329073220.3982460-1-zhao1.liu@linux.intel.com>
 <20230329073220.3982460-10-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230329073220.3982460-10-zhao1.liu@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0068.prod.exchangelabs.com (2603:10b6:a03:94::45)
 To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|MW4PR11MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: ac2573e3-15a6-45cd-a3ce-08db319eece9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mp2/lTyTY/ARcfiTLQwpg+orGtFI4C7djUdxJXBsdHaNNrmbR3g3j3XFvc3a2f0mbLa/oiXw3uCoBVS/rWP/2BierFwnFvfJVFU9bbJWJ0bmwbMpwOtvkftQP0c1bNQOM3uCbiVYjMiUaXgbB2rQOp7pyxmKIEVZ6e6xdcc5LVX2GAzTTP8oPZ3TtkSuTIr8B6sBU7lmGSLDWkxsFGKyeh+h2DgNQl8sZ21AvHiTYVGLxb27flYw1NE9qUCBD9GzYJabNy+cMXPCuz9MBMyilGHPdjF/783A6px4Kwpg2ow3+UQ1y0terOTCXDdDSM9+rQz44+9Lhfy3xTurPfAJWtACIPZi9A0lcqytMNCtYPBCaETC1B26f/uDvxS/B/DnppZyd+81UwvsLPLeOwTIlVGIBdcVKm8j2Pmo1IwVxOOQeMkY/2mTkB7i8FXLVOWDRrDrsxm7a7i8xtZ+eo2Qu/xPlhZ1CMKVjzJqfyO1mXqyN6uRWNZETU0xMlXliXgCDEw6dGeoQt0FBjUF9d75UzNLs8wwvO5CTf1SaqyMoQ7U8dTkFE7yUzk5W9YX71z6iyIHj2YH21xSbz8zB0J09o8czakWsLv2n5ZY/ABE034=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199021)(6512007)(2906002)(83380400001)(54906003)(4326008)(66476007)(7416002)(66556008)(66946007)(8676002)(478600001)(110136005)(316002)(6506007)(26005)(44832011)(6666004)(186003)(9686003)(86362001)(38100700002)(82960400001)(6486002)(921005)(5660300002)(966005)(41300700001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kHb9TR0bMnSO12teK+Bz0IoMR978KLplOl2/WcNRJc9jFzWJ7oBPcw03By4t?=
 =?us-ascii?Q?PUpizDFOmMJ9tvAVfj+oWbsbDrsrWeMjvnHBjl936tQwuaZxX4YFWXQdjMKw?=
 =?us-ascii?Q?uTYaF2pT81GR7IJvms6cGut3zX0bipjDmtjFKBJ5jswJGUF7nWI3JPtOQxU5?=
 =?us-ascii?Q?eMjAEKmYDsSm8D/Ez3f2pFHGWJRMb9oBH5BPyr9+oylQCWLQHlRLReCHBc44?=
 =?us-ascii?Q?yuvmALdXe96ZRwk5caLQtDwdikc7x8Px1y4+Sa46uBlnnvQZwYLxYNWl8uvX?=
 =?us-ascii?Q?DJAcu4YvSp9WxxIjeyqXAtw/Wmbr9XHsExZSGN7685svcFlegxFXEu/jvqBb?=
 =?us-ascii?Q?RWmtCwEt0J8VsCQ/n1hqUYAqzGji5m3Oq78Fmw75cJrF3j3ZDd/jEjcGABJo?=
 =?us-ascii?Q?TTVmEW4CPjz28jcXVSS3Dp2NmDFigDlA/WWhNsDfWuO8+qWB0gXTJxPjD67h?=
 =?us-ascii?Q?hwkRmsdX+kPY2B6t1uAoR85Ot1N1vOOe8evJ9N6wQthGJhfWOgaZGTTcP0nh?=
 =?us-ascii?Q?v3Eody7GeH9AbiZJaknxhOteWlacFKY5UXOZYxBY0uo5GU6zWfByeXkjL8eX?=
 =?us-ascii?Q?074k3nWVB+471MEIKaYzSF4VVevymlqOpc9ov5bxOHWhqrmxgvJ/a53P4yVo?=
 =?us-ascii?Q?FNZ+WOyEc4FdGBbf5SbAOCvivPGnTkUMcPysDF/s6vhFnqUo8yWRMa3WqynJ?=
 =?us-ascii?Q?DQQB1n6afjlYFDxcocJDnAxKjl7ZNQKKrDZ24QKvCAPkTMgWNE7MDrzIsmj3?=
 =?us-ascii?Q?RhGO9++tB5ppWZ7Y822ZJOFny9m87DLKhM8AbIcSBcxuTHlwUW0bmq2jVKqh?=
 =?us-ascii?Q?svTmkUfcV6MjTTuNweFSHc8RhRshMZnUR+0k8us08RWcZSiB7XqRRYC+82Ou?=
 =?us-ascii?Q?ZqGZctlsUNxUSzokgZCwF+teT4bF4K5K370Q/ef6bnGSRlKgDACqMEkayANG?=
 =?us-ascii?Q?C2JV1RIoa7NtvP6KkUlMXKM8qdpYs3TtMlYTiBF8Qgnf4EvL5Biznkeqj6rt?=
 =?us-ascii?Q?IsFTcRfTQg+WnsFV33g54aBs5Hfl9VzhbXq1VYQEBd9u9sLpGCphVOaW2nNM?=
 =?us-ascii?Q?gBbDRBGLFjgMyQKHFy9SEmR7MCOVgsYvycH8sN71JODpGvrIdsp8COwuyy4e?=
 =?us-ascii?Q?yC3jD9qoRUlH48UIf/Tc5QxW63conLNhy+is1cZqjNbOsmX+bEoopzLcHjtM?=
 =?us-ascii?Q?JIzH9y6GH4ryOqwZhiEsa/PLi4bt+y3K1X9njrKulEi7e4sLERjkUJhpLkYi?=
 =?us-ascii?Q?yLMzsMKCsM5khTpOEnbGDDpzzcCSeyAuhodekBORU/WJekUG8DASKd6CzXUp?=
 =?us-ascii?Q?faLMnxjCkUjNTu4wfSTN2lSupQsVjMBnHdOSWVB7WOWEGfTr8oRya/ouO1rX?=
 =?us-ascii?Q?5nC6J2l54j00wiSa0MIDli7uIoRdXruNp0skFdT/oJWOJO4hin3cwzguRxe2?=
 =?us-ascii?Q?Q/QiaFOTq4ySrXxjl/aR61DfVWt0EQDby7fN3fo/kyyMZkTqjGa0xpvfFMo1?=
 =?us-ascii?Q?5yIHJey95DL/5tJPtevFt4mFW8YAN+Sfp/1JgTgmADoWYlmn0DVC1pXrMvZY?=
 =?us-ascii?Q?Nf3hCyoR8HpyKSlqIQ1AsBi6bNL2xIvut/awumBK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2573e3-15a6-45cd-a3ce-08db319eece9
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 04:18:05.5729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KeaMWVqt58v4ajfJbeibqK8Cwc7yUrjWsLtPIN5Z+vW2o0yX8ac7o/mQIrX7CONAjqt0ptKfAPpNJ4v4dRDHfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7006
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
Cc: "Fabio M . De Francesco" <fmdefrancesco@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>, Zhao Liu <zhao1.liu@intel.com>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> The use of kmap_atomic() is being deprecated in favor of
> kmap_local_page()[1], and this patch converts the calls from
> kmap_atomic() to kmap_local_page().
> 
> The main difference between atomic and local mappings is that local
> mappings doesn't disable page faults or preemption (the preemption is
> disabled for !PREEMPT_RT case, otherwise it only disables migration).
> 
> With kmap_local_page(), we can avoid the often unwanted side effect of
> unnecessary page faults and preemption disables.
> 
> In i915_gem_execbuffer.c, eb->reloc_cache.vaddr is mapped by
> kmap_atomic() in eb_relocate_entry(), and is unmapped by
> kunmap_atomic() in reloc_cache_reset().

First off thanks for the series and sticking with this.  That said this
patch kind of threw me for a loop because tracing the map/unmap calls did
not make sense to me.  See below.

> 
> And this mapping/unmapping occurs in two places: one is in
> eb_relocate_vma(), and another is in eb_relocate_vma_slow().
> 
> The function eb_relocate_vma() or eb_relocate_vma_slow() doesn't
> need to disable pagefaults and preemption during the above mapping/
> unmapping.
> 
> So it can simply use kmap_local_page() / kunmap_local() that can
> instead do the mapping / unmapping regardless of the context.
> 
> Convert the calls of kmap_atomic() / kunmap_atomic() to
> kmap_local_page() / kunmap_local().
> 
> [1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com
> 
> v2: No code change since v1. Added description of the motivation of
>     using kmap_local_page() and "Suggested-by" tag of Fabio.
> 
> Suggested-by: Ira Weiny <ira.weiny@intel.com>
> Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
> Suggested by credits:
>   Ira: Referred to his task document, review comments.
>   Fabio: Referred to his boiler plate commit message and his description
>          about why kmap_local_page() should be preferred.
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 9dce2957b4e5..805565edd148 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -1151,7 +1151,7 @@ static void reloc_cache_unmap(struct reloc_cache *cache)
>  
>  	vaddr = unmask_page(cache->vaddr);
>  	if (cache->vaddr & KMAP)
> -		kunmap_atomic(vaddr);
> +		kunmap_local(vaddr);

In the cover letter you don't mention this unmap path.  Rather you mention
only reloc_cache_reset().

After digging into this and considering these are kmap_atomic() calls I
_think_ what you have is ok.  But I think I'd like to see the call paths
documented a bit more clearly.  Or perhaps cleaned up a lot.

For example I see the following call possibility from a user ioctl.  In
this trace I see 2 examples where something is unmapped first.  I don't
understand why that is required?  I would assume reloc_cache_unmap() and
reloc_kmap() are helpers called from somewhere else requiring a remapping
of the cache but I don't see it.

i915_gem_execbuffer2_ioctl()
eb_relocate_parse()
eb_relocate_parse_slow()
eb_relocate_vma_slow()
	eb_relocate_entry()
		reloc_cache_unmap()
			kunmap_atomic()  <=== HERE!
		reloc_cache_remap()
			kmap_atomic()
		relocate_entry()
			reloc_vaddr()
				reloc_kmap()
					kunmap_atomic() <== HERE!
					kmap_atomic()

	reloc_cache_reset()
		kunmap_atomic()

Could these mappings be cleaned up a lot more?  Perhaps by removing some
of the helper functions which AFAICT are left over from older versions of
the code?

Also as an aside I think it is really bad that eb_relocate_entry() returns
negative errors in a u64.  Better to get the types right IMO.

Thanks for the series!
Ira

>  	else
>  		io_mapping_unmap_atomic((void __iomem *)vaddr);
>  }
> @@ -1167,7 +1167,7 @@ static void reloc_cache_remap(struct reloc_cache *cache,
>  	if (cache->vaddr & KMAP) {
>  		struct page *page = i915_gem_object_get_page(obj, cache->page);
>  
> -		vaddr = kmap_atomic(page);
> +		vaddr = kmap_local_page(page);
>  		cache->vaddr = unmask_flags(cache->vaddr) |
>  			(unsigned long)vaddr;
>  	} else {
> @@ -1197,7 +1197,7 @@ static void reloc_cache_reset(struct reloc_cache *cache, struct i915_execbuffer
>  		if (cache->vaddr & CLFLUSH_AFTER)
>  			mb();
>  
> -		kunmap_atomic(vaddr);
> +		kunmap_local(vaddr);
>  		i915_gem_object_finish_access(obj);
>  	} else {
>  		struct i915_ggtt *ggtt = cache_to_ggtt(cache);
> @@ -1229,7 +1229,7 @@ static void *reloc_kmap(struct drm_i915_gem_object *obj,
>  	struct page *page;
>  
>  	if (cache->vaddr) {
> -		kunmap_atomic(unmask_page(cache->vaddr));
> +		kunmap_local(unmask_page(cache->vaddr));
>  	} else {
>  		unsigned int flushes;
>  		int err;
> @@ -1251,7 +1251,7 @@ static void *reloc_kmap(struct drm_i915_gem_object *obj,
>  	if (!obj->mm.dirty)
>  		set_page_dirty(page);
>  
> -	vaddr = kmap_atomic(page);
> +	vaddr = kmap_local_page(page);
>  	cache->vaddr = unmask_flags(cache->vaddr) | (unsigned long)vaddr;
>  	cache->page = pageno;
>  
> -- 
> 2.34.1
> 


