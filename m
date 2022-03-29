Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7A74EAC2B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 13:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A21810EFE9;
	Tue, 29 Mar 2022 11:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE7C10EFE9;
 Tue, 29 Mar 2022 11:24:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAf7FnZCRw2UWUveo3cfP6VAC79zU7TI2m/JrAFEToe9ojIpKXIONbA2pQBpOlnMtFFKDNagEyPAGE5siHpIeQhn+CBW8LeJvzS7p5WelKeJzA05msdHGzStd5E6NkSyv1TazsULqufEkKstwivONhPk4AgxWue3wyvDKDAcOqJ8AK/32PHyl+xIp5R0QuESa2lCHhcNeuu7/8qoPqmnCx78wBKdtlleiOLlE/N2LWlGvFw8BhSnhzPPPG6Iqd0PwJA4Kz7GfH+cBtdF5b+k4nndsdtV9ZfHZUjsMU67VlpgHI/Yi29pWiJ2/rAv+jMWpCMb1VCWQqIPEb7Z3H4zIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rerkMtfINlnfyq0vSJV4d09qsYwo5BYbAcnF8xvxpG8=;
 b=QB+unzYsTj23wlmZpaxXQ0dns28Z0QMsEeNa9j9zZIyccut4jxG8U+/+lljLscUe++QWapHyk6brwgMJVp6d6nEhVBsd0RyouyqGCyit79bRqVn8Tshcmy34UO9kBJZxn/AF62yFihdwaMP6q9SVFgiAfGsPX+V8yCmkAMxCGzu4ujslmYAyOCuDEDnFDdPsv0vqA0o0jzTD3OoBlFhCGXDtdQWZhg5IUeWVYYQQvpQqrvLozVqB9eV58HPsaWHEoBC0k9ItALiTeNnZ+jnJb7cGOawOuSpuVL7wIBucLa7529CAGxRavoFSaiGHhIMbzd1KmljKij64jIiccG2mOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rerkMtfINlnfyq0vSJV4d09qsYwo5BYbAcnF8xvxpG8=;
 b=gcXS8aMqOHhE7RgC404ptHCWUIBtdlbprologwIsf8aNarN2d13QAvf92qXcnp0gisR7OC+k8zySuEhFk72Hn8DmYMsnDiPVVsPHcYQ+llRCTwDX0YyAkOQPNm59vxUBo2Ttc7+0/pjHMd15NpghZrw43II/x0kIEZcTMz6k8sc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN8PR12MB3140.namprd12.prod.outlook.com (2603:10b6:408:67::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.21; Tue, 29 Mar
 2022 11:24:09 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 11:24:08 +0000
Message-ID: <417bc262-17db-551f-1334-3cfafe997c60@amd.com>
Date: Tue, 29 Mar 2022 13:24:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v11] drm/amdgpu: add drm buddy support to amdgpu
Content-Language: en-US
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
References: <20220323062552.228429-1-Arunpravin.PaneerSelvam@amd.com>
 <c255f3ea-a269-1886-f79a-2d8a38b956b1@gmail.com>
 <MN2PR12MB4342B7FD0CC5C480DEEF8A77E41D9@MN2PR12MB4342.namprd12.prod.outlook.com>
 <2b77dca5-df7e-5a65-eb3e-f186e1037e4d@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <2b77dca5-df7e-5a65-eb3e-f186e1037e4d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0054.eurprd07.prod.outlook.com
 (2603:10a6:203:2::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d91abc33-2260-488e-4eda-08da1176a450
X-MS-TrafficTypeDiagnostic: BN8PR12MB3140:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB3140972C2437828E6E63463B831E9@BN8PR12MB3140.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n3TjluDqZk074bjTZwKuMI0sM0m8q1oXi7YVaLIqwetjW+uG+OqVtmYRq3lOtyEzaa2GxjUuxPFstQOWpToecKYuQv8kwspnjq93Uf4TDp2NtpSN7B4maGZghV65Xg+ayBfGNQupuk0Q2TWUx/fvnz+vyK3b7KyzMlmrMsKJkf4sjUzdhbEkhKVefR9iYu4fo0JRuoyK/7Rj6tq5E9uFb8FKP6LtPHPIGO8AnOYh4xJ2mTLpZlVXwVYtslJMDnnHXpuHyrECXCurvQ4RbKSGe+TRxVCYzFb5JOtnkVzkCKE7qcm18Ly5/sPnNGSQgwHVrafeTWmU21nc8Mt32ovrUcYEIwMKkJQo8cHPYSPtA6MrPyqHmA+m29uKYsoDKS2K705LXSl2urzqQuJtoXZVz3veTtRV3g9Nz5ilYlLSuYMmVpHXoH+Dzm9jt75OOCKwZaYHbunSsOyXl9ZpZ2GWPoqsfPOYdeYngqLAr30VlwvSj4ILe4tZCoeNMrP4Lwv9M9hOvLs9+y5PBk+pkPMxLbpw7TkJ5w1HgKHV+ffK3C+6J4nH7tYz1qQpXIR7aZYwzEg2nqtAzNLT3kGOG2+1x+1tbC6LXRfY/tBZ+kaVoETLPW9cdP66FApQwspEafYLRppN17ANBq5dh5Umk1SzDQ1cFVgJtCh2DjdtvXn/BaB4EkR9DrB9GeQ07VJR4r7Yy7jQh9fz5EQdioUEci4WSOaLB9f/2Mw/4qfaDSwYhV3lauj69Szv9fKr8xiy+WQM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(66476007)(6862004)(4326008)(66946007)(6486002)(6666004)(66556008)(38100700002)(6506007)(37006003)(508600001)(316002)(54906003)(31696002)(86362001)(83380400001)(6636002)(6512007)(26005)(186003)(2616005)(36756003)(31686004)(5660300002)(2906002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUgzcEh6bHNWdUorL0J6VXlYNWR1Z09FaWwvb2ZGeS96MlF0eEhZQ05SM1VU?=
 =?utf-8?B?QkRRVlhibWR4RFpVbk5DV1J1dEcyMS85RUlVdDVwSTA2NnZocUhLakEwc3k4?=
 =?utf-8?B?cWppU1N3cENUamU5Y1ptdm9zQ1FGZFBEaU9icklsalFxZjVERUFpNHZzOTYr?=
 =?utf-8?B?THZrRFJ6NzNhbzNCQ2JMUEM4MHVuNnA2KzlSQkRDUzM4RFRUeVc5TUt1VnA0?=
 =?utf-8?B?NkczRjIyYmxJZGozNWZ1czYvQXBCS1BMZnZTdGZkbjh0ZFVDcWVwMFQxUXo1?=
 =?utf-8?B?clVGYmRCUytTRnJSeU9EYlJ3dnBsWFJBZjJGbkRYUisvcUdZeEpvbW1hRmo4?=
 =?utf-8?B?NDRSTmtvUi9IejM4VWxkQjFSL01wSlJYU1F2bUFDeFFpYm9xRU5UY1pSakVr?=
 =?utf-8?B?Vjl1VXVSQU0vYUszMis3UmZZb0w4aVVYWUF3blJKN0huMjF0UGlOU2JIVHk0?=
 =?utf-8?B?N3FOWExkdDcrSzhsOWtmbE4rMjF2OVFMMWpTYW05ZUV6blFjRzBLZ21SU0dT?=
 =?utf-8?B?dngrMzBDT2tLVmk2dkhOdkkwMDI2T01ML0NFaTdlZjBiK3duWGpORTB0cmdM?=
 =?utf-8?B?WGluRzQ4Ykt6UXpnb0NFenFHZElOUlhtdDVsc09QWTBjdE1uVGlmMWhHbmF4?=
 =?utf-8?B?cGl3b3luMURRWjFIR3h5SjBnMm0vSGxJYUtSMHg0L3lqV3I0bkNaQUdRYndi?=
 =?utf-8?B?cVBiWVB5TXdIL0JyS3gwbUNOU3YzUnVzSjhXMEtHd253ZUdvRkFsSjliWm5L?=
 =?utf-8?B?TWtjdzZxc0trQVV3QlEzMyszQzYxM1VabjNmWDgxRC9GbGxhc1hQZ3ZiZkY4?=
 =?utf-8?B?Q05JZ2NtZTVLMkJnSmp0SWlKUjZtMDB4eklZcndDWDBIcS9lSEJ3YzBWd3Ax?=
 =?utf-8?B?eVIxVk9La05EcDk5VHhNblRCT0JsMjdWU0lncjdvaElBQkVOQ2Z3YzF5bUdE?=
 =?utf-8?B?WlZsZENwSndCellWQWZucGdNdHFWZHlQNFExS1k4RXJyQnBIT2NVcHdUaEFW?=
 =?utf-8?B?VTYyZnNJbk0wUDVIUC9CUTVmUFIrdVhYbTdDNERwMjZrQnpkU0UyMkJ0UGs2?=
 =?utf-8?B?Nk9peTFCRjNBcUhDdTlKMVM1ZW5CQVhUQStRblFCckdwRnZaWUl0Y0tJMjhj?=
 =?utf-8?B?SUh1dnlOaUNVd3hlKzBOK2ptQUtTM09DS1JNai9TRUhkaWNVWklSSE9IY3ov?=
 =?utf-8?B?WUl6L1hmbG9nMjY1TWNORmdjZTJoMkJsWDhacFhFQnJPazR5ek5sZlJtcnVr?=
 =?utf-8?B?LzdycysyY0R4cUxqanBpN2hicFRKOHdkZGcyZU1LOW1hVlFGazRsSEVjU1ZB?=
 =?utf-8?B?Y1d2dGpmRzcrWWo1TUNWeUEwbUpaUm5HVTZ2Sjk4WE0raG5xUWhsdEhneUVB?=
 =?utf-8?B?VjVhMGNHWXA1Qmg2VW5YU3lqZGJXa3RuWVV4T3BPNzhEczRsNDEwVTRKVWVx?=
 =?utf-8?B?Q2RSMVFQNnBkWlE4QXNBMEZ1K0tCRUFNZDdFUUVsMFR6UUR4UzF2Rkhta2Nt?=
 =?utf-8?B?ajNLMVUwTUd3MDRyT3VoMytiZEpyelJGTXBjWDVSWnAxeU14MFl5WDU4bmNi?=
 =?utf-8?B?WEtRQ1p0ZVBsWmRLZWNtaDF5azBOQ2I3OTN3NkxzVWFuSm8yRlAwRHJzSDVH?=
 =?utf-8?B?VTZJRE9CMjNFRDRFMko2UWhFYnRzQVNTMlU4aHRVVWtZa1pxY2FscTUvZEFh?=
 =?utf-8?B?TVN6Y2ozbEVCN1JzU0ozUzRjT1QrYlpzL0htUFl2MHdFbWpQZmE2RkV6eG9H?=
 =?utf-8?B?OTh6WWFNeW16MlJJNWFkVVljVTBINlUyRUFxRFdzSEFlQzlPTkVFeHlzclR4?=
 =?utf-8?B?Y01GRGNpUDByckovNmZvRUlDQ0pudlcxdU5BbEhhbDZHanlzVVkrN0VwTmIy?=
 =?utf-8?B?YkdDSURCNi9iU0V3djdZaFNjZXRZQ1BQUXZUQkRuS3h2MjZVaW80NHFnRjND?=
 =?utf-8?B?RzBOekE1RVJBUW1iOUcwYXJFam9QRkpMb1c3RTdpbUJkaUdRcXRybTFGTk05?=
 =?utf-8?B?MGhoSGhqdVpNeVl3VEdnRnlxTGRQVjhQaWgwQVBJUHRQd1hkVWdzOTBTWWt6?=
 =?utf-8?B?aUY0YXY1TkVveXE0QjMvQ1ZxajFWbnZsVDhiYm9JR3FURWRWTDYwc0MvTVhC?=
 =?utf-8?B?bzFQOFdleFBKTkVQWkNPVDBlYVk5dGtSVlhNdC9qMHNYNzEydUVWSXFIY2xx?=
 =?utf-8?B?OEtLUHJQZlNpR2VPdXJac0VQMWFLYzFqR0tuNkxodEIrSU1TRW5RUThQOE5u?=
 =?utf-8?B?SElKVHgxZ2dITzJUUkplTlBIbWtyZFJSd2hLWndFL1RMaGZCTnFQaTNZSnNB?=
 =?utf-8?B?S2hEYy9McnB0azJhNFVBWGZaakpTQXRPcUV6aTFTVHAyVUtLZkJYQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d91abc33-2260-488e-4eda-08da1176a450
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 11:24:08.8292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4FWyfRSaRr4Daqvvs5M2OMjik9/HJ8907IxhPvpX/j5/M9BuN5gDFIck0DzvF2ln
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3140
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.03.22 um 13:19 schrieb Arunpravin Paneer Selvam:
> [SNIP]
>>> +	pages_left = node->base.num_pages;
>>>    
>>>    	i = 0;
>>> -	spin_lock(&mgr->lock);
>>>    	while (pages_left) {
>>> -		uint32_t alignment = tbo->page_alignment;
>>> +		if (tbo->page_alignment)
>>> +			min_page_size = tbo->page_alignment << PAGE_SHIFT;
>>> +		else
>>> +			min_page_size = mgr->default_page_size;
>> The handling here looks extremely awkward to me.
>>
>> min_page_size should be determined outside of the loop, based on default_page_size, alignment and contiguous flag.
> I kept min_page_size determine logic inside the loop for cases 2GiB+
> requirements, Since now we are round up the size to the required
> alignment, I modified the min_page_size determine logic outside of the
> loop in v12. Please review.

Ah! So do we only have the loop so that each allocation isn't bigger 
than 2GiB? If yes couldn't we instead add a max_alloc_size or something 
similar?

BTW: I strongly suggest that you rename min_page_size to min_alloc_size. 
Otherwise somebody could think that those numbers are in pages and not 
bytes.

>> Then why do you drop the lock and grab it again inside the loop? And what is "i" actually good for?
> modified the lock/unlock placement in v12.
>
> "i" is to track when there is 2GiB+ contiguous allocation request, first
> we allocate 2GiB (due to SG table limit) continuously and the remaining
> pages in the next iteration, hence this request can't be a continuous.
> To set the placement flag we make use of "i" value. In our case "i"
> value becomes 2 and we don't set the below flag.
> node->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
>
> If we don't get such requests, I will remove "i".

I'm not sure if that works.

As far as I can see drm_buddy_alloc_blocks() can allocate multiple 
blocks at the same time, but i is only incremented when we loop.

So what you should do instead is to check if node->blocks just contain 
exactly one element after the allocation but before the trim.

>>> +
>>> +		/* Limit maximum size to 2GB due to SG table limitations */
>>> +		pages = min(pages_left, 2UL << (30 - PAGE_SHIFT));
>>>    
>>>    		if (pages >= pages_per_node)
>>> -			alignment = pages_per_node;
>>> -
>>> -		r = drm_mm_insert_node_in_range(mm, &node->mm_nodes[i], pages,
>>> -						alignment, 0, place->fpfn,
>>> -						lpfn, mode);
>>> -		if (unlikely(r)) {
>>> -			if (pages > pages_per_node) {
>>> -				if (is_power_of_2(pages))
>>> -					pages = pages / 2;
>>> -				else
>>> -					pages = rounddown_pow_of_two(pages);
>>> -				continue;
>>> -			}
>>> -			goto error_free;
>>> +			min_page_size = pages_per_node << PAGE_SHIFT;
>>> +
>>> +		if (!is_contiguous && !IS_ALIGNED(pages, min_page_size >> PAGE_SHIFT))
>>> +			is_contiguous = 1;
>>> +
>>> +		if (is_contiguous) {
>>> +			pages = roundup_pow_of_two(pages);
>>> +			min_page_size = pages << PAGE_SHIFT;
>>> +
>>> +			if (pages > lpfn)
>>> +				lpfn = pages;
>>>    		}
>>>    
>>> -		vis_usage += amdgpu_vram_mgr_vis_size(adev, &node->mm_nodes[i]);
>>> -		amdgpu_vram_mgr_virt_start(&node->base, &node->mm_nodes[i]);
>>> -		pages_left -= pages;
>>> +		BUG_ON(min_page_size < mm->chunk_size);
>>> +
>>> +		mutex_lock(&mgr->lock);
>>> +		r = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
>>> +					   (u64)lpfn << PAGE_SHIFT,
>>> +					   (u64)pages << PAGE_SHIFT,
>>> +					   min_page_size,
>>> +					   &node->blocks,
>>> +					   node->flags);
>>> +		mutex_unlock(&mgr->lock);
>>> +		if (unlikely(r))
>>> +			goto error_free_blocks;
>>> +
>>>    		++i;
>>>    
>>>    		if (pages > pages_left)
>>> -			pages = pages_left;
>>> +			pages_left = 0;
>>> +		else
>>> +			pages_left -= pages;
>>>    	}
>>> -	spin_unlock(&mgr->lock);
>>>    
>>> -	if (i == 1)
>>> +	/* Free unused pages for contiguous allocation */
>>> +	if (is_contiguous) {
>> Well that looks really odd, why is trimming not part of
>> drm_buddy_alloc_blocks() ?
> we didn't place trim function part of drm_buddy_alloc_blocks since we
> thought this function can be a generic one and it can be used by any
> other application as well. For example, now we are using it for trimming
> the last block in case of size non-alignment with min_page_size.

Good argument. Another thing I just realized is that we probably want to 
double check if we only allocated one block before the trim.

Thanks,
Christian.
