Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 511704B3293
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 03:10:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8506310E606;
	Sat, 12 Feb 2022 02:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C297310E606;
 Sat, 12 Feb 2022 02:10:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELKxDRw/jGwCOq2AHNPjMO/bZZdFOjIqRlwI4Hn+izv2J7Mu1VaeMA6dmoSlCBsvmW02Tc/6XxFK2eVOhou5Gu4zKHAfdeU0RpzLVl4UpUsg75zvAsDMTn6sbGZ7akTjdI3KNELZJ9uz8+DmS6hjBuxbEGDirW/SbeHtcsjMF3JOvHgTt6mR/AiqSgM4geLR2i3KsLWbN6slgXFo5rMBM4xPgB2xv4ofQgXvQIhU4WyYNiRIIlWDTtMrSDqKQLW+/EG7AwRlxmZtjz4H3uE3fBj4DmNRI9H/stLXwd+aGf1UWixIxp/NKRzIRtsD/4pIUBRHxTiYSVcN4p1okVTBcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DT8AznKO5daA6XOmUc8K3YviKmEe8amgNBbHypaI2Yg=;
 b=PAv4s+B+HqqYgaMocbw6nd8mcdg2UfdHtzWfHfsYu4Ccf5iwon33XKqCOrUvBa0UvZsZtGh6i82LG+df/CfuXTjUQLp3Mpy+ICiVliv/ez1Aowkg/4fp9K0gMIfgUtlZSovv2w95DEYuEDWZf0PZXcpAUbLeAUBpEwRZbqODaFP1c07cSDXYpVdwn3ixd4N88JiNWL0AqtY85vM0q1ejHLqLj7wvseBiGBjn4j8UnVbnnaTKLbmZ1F3mQey+ON0VocRYV7fA6A8QqkOdND/ASe6zRojiqPb+rR7n1FWOpqJ3CyM6UqaAWLm+G/4MI6mq/eQ9sVg/vM0FJYVyyHnXoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DT8AznKO5daA6XOmUc8K3YviKmEe8amgNBbHypaI2Yg=;
 b=Y+ETZkNZ4mKJY3iUPClRltsFzfkgo91OYYAUgE2sy12p2N+8WStTAnI/1u46zf8tzKQ2NjLg73rIM7RasECqYFYtuuAJmwY0ueqt0tdFKT0x4xhLXeDVEvQ/Z/DdSiiNPkQ3u/pSP4SQq2yzM+k+z0S8Sp4cRz+4dQoehUBjS305LNAFC7UUhxrDB5Hx0VWmnnxn7qUB9j7egJaOaQAcIe1AsWUmASxWj2IoBzSSD2PZiCTEumLRL1iApFokW7hz39RKyMNTytwVRtmP3yeQgjPZjBhwydzm2v79fstn/JDFme+vJrdaIFgO3In0RW40A9P1f89aoEuAXCkJJ7l//Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 by BY5PR12MB3986.namprd12.prod.outlook.com (2603:10b6:a03:195::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Sat, 12 Feb
 2022 02:10:30 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::498:6469:148a:49c7]) by BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::498:6469:148a:49c7%5]) with mapi id 15.20.4975.014; Sat, 12 Feb 2022
 02:10:30 +0000
Message-ID: <4b6b472d-07b6-0c96-22ed-9a77a878cf61@nvidia.com>
Date: Fri, 11 Feb 2022 18:10:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 2/3] mm/gup.c: Migrate device coherent pages when
 pinning instead of failing
Content-Language: en-US
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
References: <cover.0d3c846b1c6c294e055ff7ebe221fab9964c1436.1644207242.git-series.apopple@nvidia.com>
 <dd9960b327ca49a9103d9f97868ea7b0b81186c4.1644207242.git-series.apopple@nvidia.com>
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <dd9960b327ca49a9103d9f97868ea7b0b81186c4.1644207242.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::30) To BY5PR12MB4130.namprd12.prod.outlook.com
 (2603:10b6:a03:20b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 775050ca-7c2d-4f28-dd2b-08d9edccd83b
X-MS-TrafficTypeDiagnostic: BY5PR12MB3986:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB3986716E26EFA11363DFB029A8319@BY5PR12MB3986.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RlTR6yO5zwY2yTRUQMQAAqCfN88POBRt1tM25lzS75t/A/RgHXlOEhtYrMoYs9IStRDLW/mNps1qwzEAIlaWiD60RiQklElZ8jBfwTLFKSD6ZO00ibf5pP7+wop8yWQfuwyk8eZTCgr7R5H852AwRtP2dgw84tEBec+vfxceoRSi7gGb9toy6naYklbt49p1YRFi31nUshtAyF2gCJ19jpGJ+vx/RtV+75Fm8yDzxsborIt6pkRGdYzsPSG7nNCdPQOVOOdfBZ10f+yjOIvZMcgOkILjNmLqrEwhI78tbIr8etb8Ta/5QOmZSnOeyyqAjl2Dl+xck1/eVHOE1cxxQkmiSs++UUnprRMNIp7YyVG2N3STeycemuYzQDhcdfFCmpwpITPuKcQXfUOPBJL2g3UuUJFsHjT7/GCIIqFpGGhmk7/1uJ8N/r1/mnCTL44cSAZkU+ugBXlRv/7OtM6ASe9Dl4p82mnztmbtzLN5qnm1HZjCjbGXltGw7ENPsxCbednEu2B17G8md2wRroXPE/4Da7NxDDjMyxaQA/a8jQ2xrE6A25NTAJ0wbK6SMxi9jeCrS2jdFml1OuK0kvPsH0p/aVVrn9MSkRgrriViNC+Ew+EzXnyxlsnhvvjEKX9YZjsgb+C24pn0L/GSNgQQKtpqgEfEUgfBKqZhrvsNX+YvJnDWrwBMZKMTvAXfuZSPHhWLL39Nfc0aUURmTL++xKH4Zyec6K/IU2McDvHCdDgx1vKx26mkyce2U5ZxcuNl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4130.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(53546011)(31696002)(36756003)(508600001)(66556008)(6512007)(83380400001)(7416002)(66946007)(2616005)(4326008)(6506007)(26005)(186003)(2906002)(5660300002)(316002)(86362001)(8936002)(8676002)(66476007)(6486002)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXdiMGl6RUlWRXRiQlpPK05MSy8vWmZ4NGQxVEVHWUlaRXlFVXNOWGYyYkxp?=
 =?utf-8?B?eGE3czB5MTV4eFpFWTZMZGVVSUJjRmdoS1BYQWhmL3FYVk9tM244SUdOSHVn?=
 =?utf-8?B?YTlObUE5eUd5Y0pNUEhlbER4VEZVd05RQkpVeHZiVHF4STltWjBvQUZ1K1JD?=
 =?utf-8?B?eXdpWHVHeWhEdURnOXMwQlFtWEo3czFuNVJtcGZGeHgxbFQzaitldDJYeERU?=
 =?utf-8?B?UFJHVzN3Y1pmZW5TS01wYW1FTXJWNHk5UzFCbzhqNXduQlJBWDhlNS9CWUpm?=
 =?utf-8?B?RTFoc2FXYXZYNS9OMFhhakZWSm5Db1htRENJVTNIbXhUUTRyQStMTEo3NElV?=
 =?utf-8?B?b1BnN1lDWmV4azg0d29LRWxhcGE4bVJGUlNCZm9ReTd1eWVES0J6NCt3VFMx?=
 =?utf-8?B?aHRIWFp0NlFNbWxFMFhFck41cVl6UTVUdzV6V0taQkVxU29XMTlOSUVhQ0I5?=
 =?utf-8?B?N2xoK2pmSFpaaWJ3NHFpUWR4bmkxOUxUZGVWTEw3cUYxMlJxT05oZjNhMmhI?=
 =?utf-8?B?VWtWQWxKUFhYV1JyZVQxMmpWTDR2Uk94Qjl1UmF3MjdoeDI0a2RmLzZMc05q?=
 =?utf-8?B?VzhmZWQ2TFprdExYZzM1blYvS0oycXRGbE8wZ2dHak5BeG1YRGNNTWdWcitH?=
 =?utf-8?B?M3RkS1d6SnJkL0xUUkg1U0hBMTFzM1Rsc3RTUzJEWU5LVXRFcUI5c083dWxw?=
 =?utf-8?B?cDROL0VUNDBoZGxHdFNCaDJPV0ZmSkg2VE42MTFLTEZuNlNMNUFVVU82bTc2?=
 =?utf-8?B?WmFRVkRjN1J0OXdFaHlsVWFxM0hodG9lYjJsemJkN1d4eFhFbkVXdTVtRnhO?=
 =?utf-8?B?UGppWmc0ek1OTXpCZ3RyYlZLbDNVWnlOYUE2aHp0SHI0UC9PS2pFWlB3cGxR?=
 =?utf-8?B?enBlTUxtd3NiWWY1VG96SjJjdlRkLzVIZTFMRmt5aGxTU2J5eC9CSXg4Qnh6?=
 =?utf-8?B?eDdQdXVTWHVFUXUxTmttYnZRcU44Z0U1VTFwQWZqZ09sdk9RY1FkRVVIZmxU?=
 =?utf-8?B?MUFCQVpwWUNVVVhReHZCeVRSbzdaSlpwQ2U1M0h4SE9jUFlNNndYME1sclRl?=
 =?utf-8?B?dGgxOTVySjQyK2tJSS81NXNnaUdLNHh1Um1nb3k4aGp5Q3B4VExzYUwzNnBK?=
 =?utf-8?B?RElEUHNrMmI5QkFoRExhMHQyWGwrUlhnRGM4YW5hb2N5djRKY1QvbkttSkRl?=
 =?utf-8?B?dUxpSkg1bUxCWEg5TE1POGk4aGtSdTQzU09uUnJneFdTNjNOQWs2RHFLY0JB?=
 =?utf-8?B?ckJrNTE3QTkvS2txOEtZaERLQmJkTnRGYzBDbE9LenUyZXlQdW13NHpZSCs3?=
 =?utf-8?B?dU5FTUQ3MzljV01BY1grUGtaay82WUxSaFBnSHgwRjZSM3ZBUmNGZDhjdFBN?=
 =?utf-8?B?Z1hPZXNqaXpjaFFEYmNWVzdiVHRuMlplOEVNekJXSm1ZUDE5VHRZTGxMTFhU?=
 =?utf-8?B?bGkvTFgzL2thM2RaZ1BzYTFTaHRmd1dUYmNkMzFjZHovcGljNFdoOHorSy9y?=
 =?utf-8?B?L2dFRFRhM2o1VGZBdHRKVjhwV0sxa1pCbitFbGF2bDkyZnJyS2JKQkdLZlRY?=
 =?utf-8?B?dlZMa1dzaVVmbnBrNVFpa0N6bEFuVkdqRFkybW5LSitHWHB1S2QzQ2UxaWpO?=
 =?utf-8?B?SW1BRk1XWEtONXlLZVhXNG1YZHVJY3pxSVU2Q29YQnkxVFlReFAreHN5VWZH?=
 =?utf-8?B?ZFRWNkI2NXphOW9IcVVYbkZIcGFSMUJEYmM0V2xvM21xOHhmZURqbGw1WXZq?=
 =?utf-8?B?T3BwT1Z4aUR1M1NIeDBTdGVsYVJlZ0N6YnMycDc3MFEvWHZTYkk5bzRQQkl2?=
 =?utf-8?B?WXVVMHNzL1JlU2E4dEpQaDMxTU5PT0ROWk9DeVdwV0FEQ3lRWUxDM09kdCtU?=
 =?utf-8?B?UFU3djcrZVMzc0xJOTZ5Nk52MzBJeW84RWx1WlhNSVFGbHA5UDZtaEtWWWJE?=
 =?utf-8?B?Yk9QbGovZzM3enY4L3hQOG9ETHFTQVdlVFp3eEpYYlRRaWZhWityUW9lUTZV?=
 =?utf-8?B?d0xRMUxPZmNRUjlUU1hkVDZIUnpQVmhWZXZqTURoSGNSM2QzYnFRYVJCUE5K?=
 =?utf-8?B?TEpsTUtOaXRsMUlsaCtWWlRva2JFMk11ZStXd0ZXdXV6NFBiL0tQUE1FSlN2?=
 =?utf-8?B?RXFlSzI5eG5wSnlJeGJkNE44b0VNbGNORkM2dHlsQnE0REN6V1VPQS9VUnJm?=
 =?utf-8?Q?IdN8d42Xo+NlpeptQDust+4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 775050ca-7c2d-4f28-dd2b-08d9edccd83b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2022 02:10:30.8268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2KiGV8e0k0IkwGyhhqcEnS0XevlPWlcgFxXduw7tE+sFoxQieybkaLJbvXkKiNjq0HgBfDnt+MgZRz0mhFW45A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3986
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
Cc: alex.sierra@amd.com, rcampbell@nvidia.com, willy@infradead.org,
 Felix.Kuehling@amd.com, dri-devel@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, jglisse@redhat.com, amd-gfx@lists.freedesktop.org,
 jgg@nvidia.com, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/6/22 20:26, Alistair Popple wrote:
> Currently any attempts to pin a device coherent page will fail. This is
> because device coherent pages need to be managed by a device driver, and
> pinning them would prevent a driver from migrating them off the device.
> 
> However this is no reason to fail pinning of these pages. These are
> coherent and accessible from the CPU so can be migrated just like
> pinning ZONE_MOVABLE pages. So instead of failing all attempts to pin
> them first try migrating them out of ZONE_DEVICE.
> 

Hi Alistair and all,

Here's a possible issue (below) that I really should have spotted the
first time around, sorry for this late-breaking review. And maybe it's
actually just my misunderstanding, anyway.


> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
> 
> Changes for v2:
> 
>   - Added Felix's Acked-by
>   - Fixed missing check for dpage == NULL
> 
>   mm/gup.c | 105 ++++++++++++++++++++++++++++++++++++++++++++++++++------
>   1 file changed, 95 insertions(+), 10 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 56d9577..5e826db 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1861,6 +1861,60 @@ struct page *get_dump_page(unsigned long addr)
>   
>   #ifdef CONFIG_MIGRATION
>   /*
> + * Migrates a device coherent page back to normal memory. Caller should have a
> + * reference on page which will be copied to the new page if migration is
> + * successful or dropped on failure.
> + */
> +static struct page *migrate_device_page(struct page *page,
> +					unsigned int gup_flags)
> +{
> +	struct page *dpage;
> +	struct migrate_vma args;
> +	unsigned long src_pfn, dst_pfn = 0;
> +
> +	lock_page(page);
> +	src_pfn = migrate_pfn(page_to_pfn(page)) | MIGRATE_PFN_MIGRATE;
> +	args.src = &src_pfn;
> +	args.dst = &dst_pfn;
> +	args.cpages = 1;
> +	args.npages = 1;
> +	args.vma = NULL;
> +	migrate_vma_setup(&args);
> +	if (!(src_pfn & MIGRATE_PFN_MIGRATE))
> +		return NULL;
> +
> +	dpage = alloc_pages(GFP_USER | __GFP_NOWARN, 0);
> +
> +	/*
> +	 * get/pin the new page now so we don't have to retry gup after
> +	 * migrating. We already have a reference so this should never fail.
> +	 */
> +	if (dpage && WARN_ON_ONCE(!try_grab_page(dpage, gup_flags))) {
> +		__free_pages(dpage, 0);
> +		dpage = NULL;
> +	}
> +
> +	if (dpage) {
> +		lock_page(dpage);
> +		dst_pfn = migrate_pfn(page_to_pfn(dpage));
> +	}
> +
> +	migrate_vma_pages(&args);
> +	if (src_pfn & MIGRATE_PFN_MIGRATE)
> +		copy_highpage(dpage, page);
> +	migrate_vma_finalize(&args);
> +	if (dpage && !(src_pfn & MIGRATE_PFN_MIGRATE)) {
> +		if (gup_flags & FOLL_PIN)
> +			unpin_user_page(dpage);
> +		else
> +			put_page(dpage);
> +		dpage = NULL;
> +	}
> +
> +	return dpage;
> +}
> +
> +/*
>    * Check whether all pages are pinnable, if so return number of pages.  If some
>    * pages are not pinnable, migrate them, and unpin all pages. Return zero if
>    * pages were migrated, or if some pages were not successfully isolated.
> @@ -1888,15 +1942,40 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>   			continue;
>   		prev_head = head;
>   		/*
> -		 * If we get a movable page, since we are going to be pinning
> -		 * these entries, try to move them out if possible.
> +		 * Device coherent pages are managed by a driver and should not
> +		 * be pinned indefinitely as it prevents the driver moving the
> +		 * page. So when trying to pin with FOLL_LONGTERM instead try
> +		 * migrating page out of device memory.
>   		 */
>   		if (is_dev_private_or_coherent_page(head)) {
> +			/*
> +			 * device private pages will get faulted in during gup
> +			 * so it shouldn't be possible to see one here.
> +			 */
>   			WARN_ON_ONCE(is_device_private_page(head));
> -			ret = -EFAULT;
> -			goto unpin_pages;
> +			WARN_ON_ONCE(PageCompound(head));
> +
> +			/*
> +			 * migration will fail if the page is pinned, so convert
> +			 * the pin on the source page to a normal reference.
> +			 */
> +			if (gup_flags & FOLL_PIN) {
> +				get_page(head);
> +				unpin_user_page(head);

OK...but now gup_flags can no longer be used as a guide for how to
release these pages, right? In other words, up until this point,
FOLL_PIN meant "call unpin_user_page() in order to release". However,
now this page must be released via put_page().

See below...

> +			}
> +
> +			pages[i] = migrate_device_page(head, gup_flags);
> +			if (!pages[i]) {
> +				ret = -EBUSY;
> +				break;
> +			}
> +			continue;
>   		}
>   
> +		/*
> +		 * If we get a movable page, since we are going to be pinning
> +		 * these entries, try to move them out if possible.
> +		 */
>   		if (!is_pinnable_page(head)) {
>   			if (PageHuge(head)) {
>   				if (!isolate_huge_page(head, &movable_page_list))
> @@ -1924,16 +2003,22 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>   	 * If list is empty, and no isolation errors, means that all pages are
>   	 * in the correct zone.
>   	 */
> -	if (list_empty(&movable_page_list) && !isolation_error_count)
> +	if (!ret && list_empty(&movable_page_list) && !isolation_error_count)
>   		return nr_pages;
>   
> -unpin_pages:
> -	if (gup_flags & FOLL_PIN) {
> -		unpin_user_pages(pages, nr_pages);
> -	} else {
> -		for (i = 0; i < nr_pages; i++)
> +	for (i = 0; i < nr_pages; i++)
> +		if (!pages[i])
> +			continue;
> +		else if (gup_flags & FOLL_PIN)
> +			unpin_user_page(pages[i]);

...and here, for example, we are still trusting gup_flags to decide how
to release the pages.

This reminds me: out of the many things to monitor, the FOLL_PIN counts
in /proc/vmstat are especially helpful, whenever making changes to code
that deals with this:

	nr_foll_pin_acquired
	nr_foll_pin_released

...and those should normally be equal to each other when "at rest".


thanks,
-- 
John Hubbard
NVIDIA

> +		else
>   			put_page(pages[i]);
> +
> +	if (ret && !list_empty(&movable_page_list)) {
> +		putback_movable_pages(&movable_page_list);
> +		return ret;
>   	}
> +
>   	if (!list_empty(&movable_page_list)) {
>   		ret = migrate_pages(&movable_page_list, alloc_migration_target,
>   				    NULL, (unsigned long)&mtc, MIGRATE_SYNC,

