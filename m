Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7B375E9AC
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 04:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CF010E0B8;
	Mon, 24 Jul 2023 02:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF4C10E0B8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 02:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690165519; x=1721701519;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=lUCta+26jqDbeYHTQfK/cSnp5PJTGG36JXi5JkKvqHg=;
 b=g2SfMcrEcdYnqsZ/iJ7CJAijgNsVcYTJEuWXM5xqE+evKevDab3mOGBx
 1QVXmGS5swTj8WJydaMRi1VSGecm3sacZrsIfpB/kDfPUNYZUrkZI0Ua8
 k+mTrGTi9fBJM7Xn3fDVuBpgXKEXssMxeRPiSzk9xNeizOpCge6ZAyUeq
 mxBFmo1idBlLTaPGaduTUKVrfcqRHOF04FeYkbj/pf20mc5AlyOJocnsW
 abWapRR2IoFt4GmdfTS/UZCY3Dh9RuC1BWyY0LAaWjQnGq2h0d64eoK1S
 zwoYUeMGMuXMV1EKccnqbRULQTiSVTLqk4sfyTebV3y4a4i6WXAc0gp1W A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="398230246"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="398230246"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2023 19:25:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="839271096"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="839271096"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2023 19:25:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 23 Jul 2023 19:25:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 23 Jul 2023 19:25:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 23 Jul 2023 19:25:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7ML6EOxotF1vA31kGWjM4jeIgWWmYvzchM6IvDP52v4hbKAiNDOCZP2mpx6qTbEZU3X7KWgopOXlfKPgZPb3uv9zHoGTIVIEb0HQHmFiOl28w5FviKggS53V5DaS0VB/iOYXp9MgTQc/WylzH/8YhuHMpCLpTmGitR7rAK4ajznCDJ2GmSuxqJjztRpTBx+GAA8PVCuK+m5ahfp7CB/krREocsjPsnCcyO1ixD6f7C8ebavmBf1fElhNkMEhJRd3ShXHRBZzWTJQDdbFt6PvVUMAPtC3Vgkxte6igFHR46LjUQuJZds47+DzhTpt9rm2jrYLSB7l+TL1JUv5I5wTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8PbJm35CpaBCw0d3WBf2dKR3iT/9kbp23QGchXvS94=;
 b=dV7gwDE57l1WTcVqc908+ip95O0Ed10nuDbQBgaPs5sE/YwZAPDrjuiV2tfWrUyaaClBBwl7iD73FTdgi8MHdB3bnRXCnNXm3ygVyiQFze0MybTatEApms6Ihsz0uoMEF2/VdPmuFv6F/NiLJpdfdw34zTtd9EPQZQyrM3k0iuJrQYrQFMEA0NocXPyi9eF7JdiiaYfSiOc5eVDb1UH/y3m4v4DZQ/SdyJt5/ijUWj4RqSgNouFXNXnWrI7i7kf7Aj3HTnSQXawzv1XdZYzYURS9pMBF+QkqNmy2mXDBioZ+wDdt96UZ7eTjWWUWuwlXl00S1Kn5QmPJDiP5HOAocw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by PH7PR11MB8480.namprd11.prod.outlook.com (2603:10b6:510:2fe::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 02:25:10 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::6da5:f747:ba54:6938]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::6da5:f747:ba54:6938%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 02:25:10 +0000
Date: Sun, 23 Jul 2023 19:25:06 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Sumitra Sharma <sumitraartsy@gmail.com>, Patrik Jakobsson
 <patrik.r.jakobsson@gmail.com>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, Fabio
 <fmdefrancesco@gmail.com>, Deepak R Varma <drv@mailo.com>, Alison Schofield
 <alison.schofield@intel.com>
Subject: Re: [PATCH] Remove unnecessary calls to kmap{,_local_page}() when
 acquiring pages using GFP_DMA32.
Message-ID: <64bde1026a0af_7a6c729452@iweiny-mobl.notmuch>
References: <20230719134314.GA7590@ubuntu>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230719134314.GA7590@ubuntu>
X-ClientProxiedBy: SJ0P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::31) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|PH7PR11MB8480:EE_
X-MS-Office365-Filtering-Correlation-Id: c2f3fa96-5fa5-4e3a-c561-08db8bed33dd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8eyaPjdrjrdqLzR3ByFSevdxslRkaph1+lpGKLuuacmFKMZH4Im+dXDwK9Lk7GhljM3kh9jhhbl1LOYo0pscfKr/6OA5Qhd+UTRLZQLs15m3HWfHbliJ+Xpy/tQJDcx0lOtqHQUMNHxi2Wi0XaMECJwqSa/J/pdof8Vm2podAQBTSIdJKAURdfXvMr2y+5+fBNqKW4z4/CWjGEe3SPYwXTD6WEsDAoGlFhrsmSpupvvhVvIj7q4dAAUX7DyOAyVNuzNCZAkp+vmdwIgnK7PiCOiHGK87sl6tTAGn6w5zzAKaJKgj4DHYmeomy7clSbElpt8NHFno05F+019dL4TIGZ8Cr8C4oeRNrsHjL+fnp+L/nYTubrWwjZN0pcA7SLZKT4zTJN6LIW60MpZL3NZ6tgnbIWtv4IFaATOdus2hUr7Z+Nr16IvMCCj8GXpVawwzZfNn1iXc2Axcgi5Ern5iOHtugb0LuYIwm4rox/dMURHjxqoISgdOEqcT0N1En6NyVUuq2I302ZABzji5h4eGjixLJrFynfuqrRTLimR++gzr6I3VQ4/xKlq2rogCAMphsrLszxF5qzU9DFv5sBb3bA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(376002)(366004)(39860400002)(346002)(451199021)(5660300002)(6506007)(186003)(26005)(316002)(6636002)(66476007)(66946007)(66556008)(41300700001)(6486002)(966005)(9686003)(2906002)(6512007)(6666004)(8676002)(478600001)(8936002)(44832011)(83380400001)(110136005)(86362001)(82960400001)(921005)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZHMe14Vhi/fXkS3sL3L+XPEYeJzcfYKdyMLmvTb67S/LvLQ/d5XEcEQldi27?=
 =?us-ascii?Q?Fm8wFf10BmnBpinnVosOBX0xA/kVgK4KWgJbeI4BDjvDJWFJkv0RkB0h5LuI?=
 =?us-ascii?Q?XtkCR3haBJO8K2/+oD94h7RRLHGMQMFWAuL1yt4p9Gh/085r4tFnCrx9sAF5?=
 =?us-ascii?Q?2p4kPK8aCpEYcbgkdS5YeknUo4TLaV0fUt1bo4HLlwpmT8yNWmZSB8aSIVUL?=
 =?us-ascii?Q?/2PRCqgXDF2JOJsX4HO2yTZP72i2WVlIqj3SrZLoa+dSTF56h9MGVVYFYK2e?=
 =?us-ascii?Q?0aIqbXW3ty9Haw3FUk6iHX7/nIFSy6sqZcfsXoFQTtHdhmLqIhzEvPjmr2Ky?=
 =?us-ascii?Q?mR8pUF6ONle4jf4KrCkDk/gOmJgfNwU8SB+Mphao6XqGjscon1doHKUPOOfu?=
 =?us-ascii?Q?6n9lWET6l6HHXwEzq7JUpOvRgF33rFEeU1mDbspfqtYIADUA6ScKa9+hDHgP?=
 =?us-ascii?Q?nvcYHjE/4O5A11b7P1dtpbkV54Bh/wWMTiDQMWAjjHOfkmnxD7Hnt5aztg9w?=
 =?us-ascii?Q?FRcYhog4XmT90ZekgoPVud0m92BzgLvez6YvZUoJGvZV06S8NInxC/SIjVBG?=
 =?us-ascii?Q?rcnVcH3uzo1qNd9yGqfTv4C4O0y3eoXf93VwA8GcrD7j6pLg0lTX5Ki9AM5H?=
 =?us-ascii?Q?3RIpCReJTPi9tRxCfNCdpikC4byFgiSGDEiIr2Wx5EwK43XVKdRfEfzU1MOj?=
 =?us-ascii?Q?pCVIId2NmaIEt4xjS1BFpCJByD6cdWz0Kbgl/nfw0ktUxadM9EK5ndv7qZme?=
 =?us-ascii?Q?nEkQvktsPXUDaCJEq421c1pEpWaGQdonvOZPW/rqqwBH5Mn5D2lflew0U9+G?=
 =?us-ascii?Q?KhjoHrhEUnrUVwyfjnsC/Ap5L8SYItHNlwA0KMAzM6NOrCTUVOwUzi2HYglq?=
 =?us-ascii?Q?GwYu8ZZtg8lfC1aax1lrdEdPCuRAQkOwbEI4FXSNirzJ+Z/iGPxxHHUfeSIG?=
 =?us-ascii?Q?J7Bvgp1azIKNWGvKUdLI2FtU6SFPlbKxJzt2ZUG4eaxpN2M/AScQJROnqkQq?=
 =?us-ascii?Q?56f+uERYbCAabk2H2H8MMVUxbBBGgdAWTpQVLP48kqU2kelgJA2HMBQZuxlM?=
 =?us-ascii?Q?WtdxWIJdDDqtjEZgVn7MbsDnDKgUkLkTCnntnz9M4GGY5cmxq9wwjRh8X21X?=
 =?us-ascii?Q?0BkitoxXQ0X0SqGLNTkZC5nsOOUeEYBeJBdOB3oqGObT2fVbO6xJVjqkPbNv?=
 =?us-ascii?Q?QLYrjPueLxy6/+c8dixt9yHGNNFXuTBft8H0SCpd+aRI6NJvBwJFQ4nPku/E?=
 =?us-ascii?Q?nFjIluQukXB55TM/OBL6N8C2bIaTknLOWniN1ZbdTlrAdYHdhU6780AGcmFd?=
 =?us-ascii?Q?QReZpLRbIsLwUEAZEjklzFnCs63xVtbPhAPFh28TV1t40krCP/zJ27v+O6Q3?=
 =?us-ascii?Q?/89Q+YjVejlUTnSsDswoHriDBm0bJHE5kyZ0f/Db0PkMam76Xq4Vqdlpz7oO?=
 =?us-ascii?Q?vxT48MucnvlRSPq93c9oYPaBXYcGbIhcXOZkltgCJmTHE994wJiKC4FXYJQJ?=
 =?us-ascii?Q?5hfhap3d2CUl5bluqClHtp9bBVaXEKeUyi8l01Yw46hugjXzH6I3VxrfyfvC?=
 =?us-ascii?Q?YCeYlqAa+3dlky56hHHpmSP+U2LNjelu+N80GfYv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f3fa96-5fa5-4e3a-c561-08db8bed33dd
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 02:25:10.0716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xxqJzR5Gcn7iaykXaBSbL9F/5xBEMrPPKoFDcGA2Js7Fgcy+gVYXoXg3RLR8QmjIOLxsYzYWM9m5Hq9NmlR67w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8480
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sumitra Sharma wrote:
> The GFP_DMA32 uses the DMA32 zone to satisfy the allocation
> requests. Therefore, pages allocated with GFP_DMA32 cannot
> come from Highmem.
> 
> Avoid using calls to kmap() / kunmap() as the kmap() is being
> deprecated [1].
> 
> Avoid using calls to kmap_local_page() / kunmap_local() as the
> code does not depends on the implicit disable of migration of
> local mappings and is, in fact, an unnecessary overhead for
> the main code [2].
> 
> Hence, use a plain page_address() directly in the
> psb_mmu_alloc_pd function.
> 
> [1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com/
> [2]: https://lwn.net/Articles/836503/
> 
> Suggested-by: Ira Weiny <ira.weiny@intel.com>

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> ---
>  drivers/gpu/drm/gma500/mmu.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/gma500/mmu.c b/drivers/gpu/drm/gma500/mmu.c
> index a70b01ccdf70..1a44dd062fd1 100644
> --- a/drivers/gpu/drm/gma500/mmu.c
> +++ b/drivers/gpu/drm/gma500/mmu.c
> @@ -184,20 +184,15 @@ struct psb_mmu_pd *psb_mmu_alloc_pd(struct psb_mmu_driver *driver,
>  		pd->invalid_pte = 0;
>  	}
>  
> -	v = kmap_local_page(pd->dummy_pt);
> +	v = page_address(pd->dummy_pt);
>  	for (i = 0; i < (PAGE_SIZE / sizeof(uint32_t)); ++i)
>  		v[i] = pd->invalid_pte;
>  
> -	kunmap_local(v);
> -
> -	v = kmap_local_page(pd->p);
> +	v = page_address(pd->p);
>  	for (i = 0; i < (PAGE_SIZE / sizeof(uint32_t)); ++i)
>  		v[i] = pd->invalid_pde;
>  
> -	kunmap_local(v);
> -
> -	clear_page(kmap(pd->dummy_page));
> -	kunmap(pd->dummy_page);
> +	clear_page(page_address(pd->dummy_page));
>  
>  	pd->tables = vmalloc_user(sizeof(struct psb_mmu_pt *) * 1024);
>  	if (!pd->tables)
> -- 
> 2.25.1
> 


