Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C406027A9
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 10:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77AE110EEF1;
	Tue, 18 Oct 2022 08:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70057.outbound.protection.outlook.com [40.107.7.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D69910EEF1;
 Tue, 18 Oct 2022 08:57:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfMLewIA6CxCD3w4c1eKdqTLBZc7ZvIHLkpDuP2UgI2pxhiVydU3guJzts9HAVTiSfY3PzsFAvrSsqssdsaUGwoK9CY4g0G5kki1l6Gy0SxMrjHt5VsjLuXZPP407/fp8JYdtYHnaeZIfoLOhALQoi0158IdKk2zQU8hp1l7QXcqIf6UptJtno75ipUbWZRA46In8pEBT8y5V4F4N2nzZqFQ8idn48h+EHw8nVy2R6WfQDnJxw+1B4g1pg0aZD6fWzXuqPVh4YzIvWU7FHPkbwl82zg+NeLfB0ZTYuWNokQpjpzzQmpFHW0kJaj+t0B+IFGSt2p8ZOGf/mjXBOvRYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqwJCSGjT2esYjKBkbxmpZdGWTZBZZK5hYeibCpufYU=;
 b=fgUwqBAnrhhZyMUo0rr+hp4iQyHyJJibsa71cgrtD5KkRwyr1UKXt91LCW1ZjYwxiOqojYkxzKTpCD462HJobuFLJa3o4jeR8xCj7ETQ91UexmTfV/8MZ/ANWsDeIwVxPOHqEaNG8nGHQs5JnRIfjHfJes8RrCuROo/pX7QXwcRV6SnVKSlmTG8rrwdqdLm8peYDtKKeU59uioGO7mDSEUXi1vvE85vr+UZxIsmMmTaw25YuAomYRZbT3LI6F9rDIKuZgEmdemaTnSdnHLdNCdg6rmHnze/k5rAoovwmro3drMJJNWtg9LbOTJX0J4Q1YWpfUNJvwlDaZspAtfquUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqwJCSGjT2esYjKBkbxmpZdGWTZBZZK5hYeibCpufYU=;
 b=iPl71mOJ6kLNX6cjs6iTQYWR5j9R0wRjhqEvHZWrImi4Rbb+MC9q9Cl1cFwsSLz3iIhYfjKuMbxq2cq3qqhXSyabRVjoSBkHQJqJcY5Bu7PsDTJLapcesCY+S/rm5GxfkRnNLDNCgCS56mAM535MDQ7HOP/KYOrriuE8hbtlEQXeqMtYrujgEiRpY480I4McZVk04FHihaVZeuR87ENi+0Ygu+Gs9z3YrgnfudUJvX5GXdDbAzLDF7Eer+F/Uc8dTE+IJuqijDPbxIhRTIVRt+1l4V85Hz0v5Z49z63/vPeGm5hTT2zIj7FRdIySq39z6WZ0xBl1kcO8rfMKU9IGag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8256.eurprd04.prod.outlook.com (2603:10a6:102:1c6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Tue, 18 Oct
 2022 08:57:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 08:57:39 +0000
Message-ID: <a5966644-72d7-4b25-83d1-9765d0593e44@suse.com>
Date: Tue, 18 Oct 2022 10:57:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: i915 "GPU HANG", bisected to a2daa27c0c61 "swiotlb: simplify
 swiotlb_max_segment"
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
References: <20221018082413.GA25785@lst.de>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221018082413.GA25785@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: b7b1ec7f-63ea-4131-cacc-08dab0e6cf7c
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Aqa1Kbk5ugW/26/HgcVQ/c7A/GlRCPUNaCpa2kOSqG4qzfj+FhxKQvicGYmvs+rP+LnsXFIY4Umct4rwhjTJR8s+803vRLQunYX6Eg1VnXI29Ltr1Y7LrTOwQQtKGM0Y6+BKVi4vfPumMZlIx5dWuKwHG8M5DtXwpPm1buYjTMGNkiUbqynLdkDbe3kvQy+rIv5XjkffTaTKngvsBTdAtfSLBVdJHZzE9c6RPou3UFkzAzTA+qNaMm2H9RBD02OM4Z4B4bs2YD+UOG35O+ARyHYlsCwlR0e5OGwl6DiNL5gqt+PZtygV0v7uw3Kf0V/XJ0bQNyi8lm5nndva4SUSERPtpU+BiY90Bw/rvnXiYDeG+6on2db3lpLZaSitfY4AEaXJxXgjKWXHcR/+oFDZd/rpSfqzTnVWK3ryEafLLC1D4jU9uD4l0/pL5WFj6dYbDuLwOEQybgIVD0EkQ/Rrd86wXDG9m8bac/5DaCaGE1SwYdyP/WOIAbGiXVBov8VfXheEGOcDiM5PffVAcACVTxG55lBrodG6FQqjxIqg996DbRz46NFSGK2qMNBiZbltxlcTxNyAabYHulQbaLgxIrYuO53KmDkAEBodx79nd0vEYyG3i3aaLLRGvw9Qzq2i2hnaPaBFPmu5NY+IC+rI/c7WjYmtzhxAx1gmqLdHOkilisBuT/YkjNXbK3cDFE61DiSsfYGg7GAZUxaeahw1Wc+8yTlSaYbMHVRjzUuhfoNyPyMiAcdLzqL/CBgTDlyVCfhMGC5Nai6l7I9iASorbtRaWGChRdwUYBRj/NoRMP0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6560.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(396003)(346002)(366004)(136003)(451199015)(26005)(186003)(41300700001)(6512007)(478600001)(2616005)(2906002)(36756003)(6506007)(7416002)(4326008)(5660300002)(8936002)(31696002)(86362001)(53546011)(38100700002)(54906003)(6916009)(316002)(6486002)(8676002)(66946007)(66556008)(66476007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mkc4cVRDMTByUVVFU29lZjNQdkliUWxJUWw3WUtHcTg5dnNIbklDUVJiSk8y?=
 =?utf-8?B?aktLRmMrL29UUzNqNkEvMUpFQVBXenYrOVpnMkJnekFGS2xGMFppYTllS0gy?=
 =?utf-8?B?MG0xQXkzMXA1RWpxbGZwM29Rd1BmN2c3K2ZycG5WUzh3eU1vay85cUFibHRi?=
 =?utf-8?B?b09kcWdaaVJySERkL25odHdaNzVyeWZuVVNyL2NINmRFZGxWbXpQb1hybU4z?=
 =?utf-8?B?Z09VRkU2VzJrcjUzei9BL2xINllaYXNNRlJQRzR1TGEwNVpSOC8yNXZaY0Va?=
 =?utf-8?B?bEVKSWdNOXZZRzNGZUp6Z2NYTExkNEdUSjlzYW93TUsrNi9SU1NmaUdBTVVV?=
 =?utf-8?B?SGFQZ09BbjJqZ1FGL3JNc2xDZVlLZmFOd2pjOGwxNkVHcXVSaHdiU2Fzc1NJ?=
 =?utf-8?B?SUZKQitYWkoxSHZLRDdZeWZ1bE9DZnBxSGI1ZzNmY09qUHd5S3hSaHlUTlhL?=
 =?utf-8?B?c3oyQ2cvLzQ1eW9zRDBNaXVsSDl5ekNzN1FzdGNRSE9VbDJjU083L0UyT3JJ?=
 =?utf-8?B?L0RZcm9ZZ1VZRTdtWnVCZHZUZ0wyd0JSU0ZpVVRxL0hyS3RWZGNoQnpjRC84?=
 =?utf-8?B?cWg4N0tuTmZVMTZuVEdzR2NXcUNPb3o1UkQralhCR3dZL0xGUTYvODVmaU9F?=
 =?utf-8?B?R09pNjhPQ1pIa2x2Y2k1VmZuUkFzUHMwcGxLTmtPaXNTN25xT0ZLUUdGMWN0?=
 =?utf-8?B?T0dZWlBYRWNQWHZlQ2JBT3lvVUJHNW5Ec0JXc21ScXZlMjc4dDE5MXd5aW9Q?=
 =?utf-8?B?WkNNUGVuSVJxU05TeTd6RWs5V3YxMUxzR0U3WXpJREg3bVJkSDBvVHd6K2hQ?=
 =?utf-8?B?UTZHTndPd0Y2R0ZPdTBTMkJJU2U2UVhPUFBENDRlOUo4bXpzYUZUbmdjVXN6?=
 =?utf-8?B?ckxlZTlabG1Tdk9pMDV6OERqS3pQMDFFMlNqdDk3NGIvODBBbHYxeXdCNnhT?=
 =?utf-8?B?QUd2QkkwY3A0N2x3MWRGTE9vZmVyZjVZajBWaGl6Z3lJY29IM1p0ZGdGNjNp?=
 =?utf-8?B?SmpVVUJSUVhBWFN0aWcwdnFHRFN5YzVrblBtL00wSCtVM2JRWGtPcWNvU2Uy?=
 =?utf-8?B?akg2aDB2L3VFWVljUFJYRVhjQ0MrWEVwaWNMNVJiK09qcWdaSFhUWnJzdlFN?=
 =?utf-8?B?c3hUaC9YTHFPdDR5VXVKdzFJa1BvSlE3UUZMSVhjQUpaUkg3MEx3b3djMytP?=
 =?utf-8?B?Z1F1ZC9IelhCNHZkTDdvVnhRRnVCSHA1WUhDMXNaaVFNUURLYmxlTVdlSmpP?=
 =?utf-8?B?YlRyVmsvdFljS1N4UndudkRMK0JGM1pINXE0NFNpVXFlcUdrUTBydWdpbmlL?=
 =?utf-8?B?cFYvcXR0THpIeTFETHA4MEhUNnpOS3VlK2JIdmJWVE1sNklnejVIOU8rWkdh?=
 =?utf-8?B?S3RKMGg0Y29rMzVud2hRMURiU3FuenBsbjZPQ0xKT0d0S2RINUZ4Q2REUTRl?=
 =?utf-8?B?Lytib0NlL2srdkt4bDVCdjZYNTdKcVI5cVh5RERKTzMvRC9XdEZXTzhWVjdu?=
 =?utf-8?B?UmF2b0l3cnBSK2JRMjJWc0NUbDZYRDlzeTB5SlRpeVpnYTdzWUl0c0JZOFdR?=
 =?utf-8?B?M05kOVBaTVJON3pNMVNVZVpySXMxZEFyV1MzbG5DdEhTVkZUYjkwdkVLeVRY?=
 =?utf-8?B?S2ZKNHZFVUhqM0FieWV6a2VOZ0MrNENYbzMyclFGcXp4NHd0eldTNVVDc0sr?=
 =?utf-8?B?Tys5aHZUb3R2NnRwd2hDVUJ4aEJRWkxIOWNhK25yUWpzMTZIdDhQTEt0MU1z?=
 =?utf-8?B?T2ZuSnl3b0FDaFVvOW05OVZ1UDB6UTdHVjM4MUQzRHVneFJ6UWp4RDY1UmpE?=
 =?utf-8?B?ekpzS3VWZ2x4cTNaclNlL1RXcGkybDl0eVNNU2J6dmdzVHVkQVJYcUNhZkZ6?=
 =?utf-8?B?bkxMUnBVa2lBeXdQVDhlNXdxNFQrQlRhY2I4V3VSa2FZL000MHVuOGwxWjNz?=
 =?utf-8?B?eGljanNwWHVHSlZBSnZkWmxOdTdPQjRycnBQd3RoRlBVM1NmODYvWFdRdjA5?=
 =?utf-8?B?aXlYVGhOTHJ4bGRPRXRubkV2UmZvSm12Nm1rc1AyZElJZEtnNXFZZ2laZXVM?=
 =?utf-8?B?T1gySXV2RFFSOFpIdzA3b0x1ejhHUWs3Y3FGcHp0NmViQ1pOdW1rbVUyRmZm?=
 =?utf-8?Q?249D1jMTBNMjrGI4Y4eCL45cz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b1ec7f-63ea-4131-cacc-08dab0e6cf7c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 08:57:39.7937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0lJmNEjoGe8XX8uNUvvtD4nyKEwsDiul5PdoGnAE8mujmiumgWgzDZv12rD6l4zD1mBAkAIz1PG9pD56pGuhcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8256
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
Cc: Juergen Gross <jgross@suse.com>, Robert Beckett <bob.beckett@collabora.com>,
 Stefano Stabellini <sstabellini@kernel.org>, regressions@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 intel-gfx@lists.freedesktop.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, iommu@lists.linux.dev,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 xen-devel@lists.xenproject.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18.10.2022 10:24, Christoph Hellwig wrote:
> @@ -127,19 +128,22 @@ static inline unsigned int i915_sg_dma_sizes(struct scatterlist *sg)
>  	return page_sizes;
>  }
>  
> -static inline unsigned int i915_sg_segment_size(void)
> +static inline unsigned int i915_sg_segment_size(struct device *dev)
>  {
> -	unsigned int size = swiotlb_max_segment();
> -
> -	if (size == 0)
> -		size = UINT_MAX;
> -
> -	size = rounddown(size, PAGE_SIZE);
> -	/* swiotlb_max_segment_size can return 1 byte when it means one page. */
> -	if (size < PAGE_SIZE)
> -		size = PAGE_SIZE;
> -
> -	return size;
> +	size_t max = min_t(size_t, UINT_MAX, dma_max_mapping_size(dev));
> +
> +	/*
> +	 * Xen on x86 can reshuffle pages under us.  The DMA API takes
> +	 * care of that both in dma_alloc_* (by calling into the hypervisor
> +	 * to make the pages contigous) and in dma_map_* (by bounce buffering).
> +	 * But i915 abuses ignores the coherency aspects of the DMA API and
> +	 * thus can't cope with bounce buffering actually happening, so add
> +	 * a hack here to force small allocations and mapping when running on
> +	 * Xen.  (good luck with TDX, btw --hch)
> +	 */
> +	if (IS_ENABLED(CONFIG_X86) && xen_domain())
> +		max = PAGE_SIZE;
> +	return round_down(max, PAGE_SIZE);
>  }

Shouldn't this then be xen_pv_domain() that you use here, and - if you
really want IS_ENABLED() in addition - CONFIG_XEN_PV?

Jan
