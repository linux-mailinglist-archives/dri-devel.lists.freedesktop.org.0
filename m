Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 891934EB3E7
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 21:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474F410E362;
	Tue, 29 Mar 2022 19:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2078.outbound.protection.outlook.com [40.107.96.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA4310E270;
 Tue, 29 Mar 2022 19:08:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBKkiCACI+KM5+n4jO1in4n43cIqkcGj54IdpZ65VlaBgov30eHWOqBjoC8Nil79KrbODn0IkiK0oETY4OO/Ge3nc89gVA/fa6WIVmDSp+dkPIJ7g22ydmaMdxeRYVQLwSyaWbeooTERXN33XfqzSXnqdNmBwFgM8kZuH7kI0XBfprlnx94xKxAdoN7ggbHv0JG1HiWFZYyWQvq/e9+T/QfL1003YEJPoiQ5MD87ZEx+0sCNHovpFTsXhjlqnJahK93ouDjRGqlN1usi8E/6GFGYFBp7InIbgP8ouX7kFud8Dj1yhd2fs0ZuaAA4jFrEdDRs1+Rm1HUfSW+OO7VdsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHMOPQwpiYIG8pbk2v7MaZy2naPF//E26ZltrKduRQI=;
 b=IjHgS0I/1hu0nJM2i8GjBpg23KZJPVv3Ey8vcZ4tK3hWinPinaE4Bhf9uMMgehM2RHVak6IZuGBbC3anJrC1mLg1VER1L5uZg3FgUKUcjQ1Kl+FSnYiy3LbyDNXv8yeKpnmJLTXaBDYp1TGSd5sqWff7ekv39A82dKQzS5k4o5wPduxGnGHBnesd+uMm5umMRs5EYQnRohxdyr/haDs1pHABy+njvXNDqVgqwiBifY68scj3R9pZeuWMbKxTNEyN4V5NHo3l0LqOw2MaKYaUnUJeSMym3E3e6igZrQ8sU1mRAdE6+lkhqWE8A+XX4zfznVGrZc25VRb/KdAzteK/Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHMOPQwpiYIG8pbk2v7MaZy2naPF//E26ZltrKduRQI=;
 b=VV2p3dvxVikQAcDebDNxm+LlNCrPSyHM4qmEtYQ+akZg44mNwGKIu1FEaxCrzmBNuYtY/6mgG1CReTGJc7LCGAgAeMl6RHZLI7GXygLs6ZtKOUdNQro6qQzgkJ+YkjJxcFhyOAMWOBGxqsLaLzJt2+rkKgtFVrut//1dWZEx9yE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by BYAPR12MB2808.namprd12.prod.outlook.com (2603:10b6:a03:69::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Tue, 29 Mar
 2022 19:08:34 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14%6]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 19:08:33 +0000
Message-ID: <73513866-504a-1289-c9ad-4fef81f80ed6@amd.com>
Date: Wed, 30 Mar 2022 00:48:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v11] drm/amdgpu: add drm buddy support to amdgpu
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220323062552.228429-1-Arunpravin.PaneerSelvam@amd.com>
 <c255f3ea-a269-1886-f79a-2d8a38b956b1@gmail.com>
 <MN2PR12MB4342B7FD0CC5C480DEEF8A77E41D9@MN2PR12MB4342.namprd12.prod.outlook.com>
 <2b77dca5-df7e-5a65-eb3e-f186e1037e4d@amd.com>
 <417bc262-17db-551f-1334-3cfafe997c60@amd.com>
 <1eaf81e5-84c5-dbf2-b0ec-5ca59e872242@amd.com>
In-Reply-To: <1eaf81e5-84c5-dbf2-b0ec-5ca59e872242@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::13) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff8128ac-15f4-43fb-4321-08da11b784d9
X-MS-TrafficTypeDiagnostic: BYAPR12MB2808:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB280868D5271E7714205CBE56E41E9@BYAPR12MB2808.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x/kg9QVO5EGmP60Cx71K6dqcFLoPLrP66gjgt05gXzHHzv7+b4YISzobAm6EYj8JT4bIJuTGRrDHrWPCxmXhCfLnoz22ZZhrHb/phxY2OLDJ81+6wIJAKUuXhx5dSlaiB23LQiIaSplJ2FGLZ5Px9yOHGEaoCmSzimITvXvqObEzferPrbYHjunkT4LIT5+0Tgc/QF/4AdVlCHYZ3/CRVuO04kxv8yRgo7LleWKXcWtOi6mYv0U4k+nhxmv4jWm32mZ/jWzS/fyuFEzQveApbUSyHEIA6DJ6mfr1wHdOkn3dxrT4lH4toyaQbZsrz6yfj9+9i9rko2RxNhouCQPFZzsmivrB3+6zYQnWmfqfYB4pAuCCl+y/jgJEBK7XTnFsvlUbj8cpdugzoFKHcd7+keJWpaN0xUQHwYZehAsn50s8W4kS9ZZ9hmMCRZtmiHXnKkcktATmA5NXC5oUvbApdgSUpLyLPSAJYH0/8V+B8aCkG84mAlCcAuY6PmeBZEFSl3SBENdt+gepMmUKHM7FbJAKKq4sD/f5sBPqivv9U5f+mEGANsXoxr//vnL6cq1E8zegs+QrbgMf0G1dsJevJHtYi/ihcDuNggNElkdaNUuWfobuJstUCuJhp4TjqEryLDYtKN1/3AwRBiAwTjvYSlrM2ERycmNKJ8MklixtWhu0T93rDOhhGJGeEcnzEHpRf/PsHAfUFun7XZjr5MsRbI/OSHYNUVmu9mZOOw6FNCI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(53546011)(38100700002)(4326008)(31696002)(6666004)(66946007)(31686004)(6486002)(6506007)(26005)(8936002)(2906002)(8676002)(186003)(86362001)(66574015)(5660300002)(6862004)(66556008)(66476007)(6512007)(36756003)(6636002)(508600001)(2616005)(37006003)(83380400001)(316002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDluOWQ3MTlkZkIwNXFHbTNVWGFYYlg1dW9ZWG9zcmFodTJnaDVxemk5OWU0?=
 =?utf-8?B?bzZPNjJvZ0wwQUwvb0FkM2VBUVRxYjdFNTFMb09aQXdnL2UzNUR5ZGttTzB1?=
 =?utf-8?B?YUl2ZHBZRmNLL2oxYWhMNWVnRURjMzJnTmt2THJSZGlhanU2WVR0UU5vYkQy?=
 =?utf-8?B?emR5eWh1TmZNTzJRZXc0WVFEdGg2ckwvS1ZBZFJncXNCdVJBR2ozQTNiWUJu?=
 =?utf-8?B?S3JSUytoV0NsKzN2UTMvMXpjcmRJMUgvcm9ZaGhURmQzVUV1Q0ttTWdXWjlr?=
 =?utf-8?B?VElZdEgzYm4xRDRlaE9KQ1dxNEpRajRjRm1vVll0WXAwcmVRRXhnKytvS0pz?=
 =?utf-8?B?QjVtUDRpYTZscnRzUjJGR2NPTlpoRHJiTFM1M2QxUFNxR0I0Z1RxR2VWN29Z?=
 =?utf-8?B?a2Q3Nm9rRWpIaXlQYVJkM01UMmxZUis2SXJ2cGI3MUs1NmZqelZkRW14SUpx?=
 =?utf-8?B?SDVvbTZ2SEhrUGNkeDN3UmQ5K2d4ZmQxVm9lNEpzVFdHalM5Z2UybHlzSTNP?=
 =?utf-8?B?RkxqZW0yMGFzUHp1MUZTL3FsSGRPWCs0b2plcVROUVE3TkF1ZCtVYnl6dFRY?=
 =?utf-8?B?cFFZbHRJRjN0NnN1NmRBd3hsQ096dEljTS9JZ0ZyM2hzUm9wY2tJeDJIRnlM?=
 =?utf-8?B?cENVdVZ5UytiQStZSitpTGdxWHU2YTMvRXc0ejB3S04vdjdTaDl1bUFNU0Y2?=
 =?utf-8?B?T1RJOUViems5dVBsVjBQWHhmNXVmbGNwNUV3TEp4cXhHKzVOOHp3b0ltNTNJ?=
 =?utf-8?B?aUtwRVZJeHdDY3gxK3hCdDB6aE5oeGRQNmVtQlYrV2lDVVQ4MUlWVVpPdUZ6?=
 =?utf-8?B?NkdheGJycHBndy9CNWVROWJyZ1NrZUt1UVM2S1FySXRzeG5tRUpyT1F3bXR6?=
 =?utf-8?B?cUY4VGRtQ042V1QzYTh5OTBzRGdWRnd0eWZDbU5TM04yUGJyQVpVYUFzMWJT?=
 =?utf-8?B?aWRNUWhQQVN1NzhZNDNZRkZyckRGdytsd1VnclRyN2lzZnhpbkQwdTV4STBr?=
 =?utf-8?B?eWt4eW5nOEx3QWVhWEt4N3BSaGtRNlRZRE4zYmxlNVF3cVR0VmxybW8veXUr?=
 =?utf-8?B?U3hqVUFiemx3a3d1VkdjRXFIUVBzNGVFSlJUL3RrNHgrVDU0T0tZUTRkYk14?=
 =?utf-8?B?L2xCWHB0NlVORThDd2JFTmtWRVdiQXpyRm1tdkduWjFnaXlRR3lDbm9mVTFO?=
 =?utf-8?B?UWdtcC9FUmlyb0NQK1RsYi84Q3hyTHlFWDJ0MEYrS0VtNFQ4RlpDdklqRWds?=
 =?utf-8?B?WjQxbGVBaTJ4eGdkR05lQVgyajQ0WHJIbEl3Z3R6akQxTE5OWGFFTjh3UzQ4?=
 =?utf-8?B?ZlZIRExxUjF1SDlIcmxPTUNPbmN3VGlVK05raTZuUks4M0hqbVBFSDc4M3R1?=
 =?utf-8?B?aE1nZVZUZHlqSTNQVTM3c3BoVkkxT25RZ056UFNFUXhjMGtKV3BsSEZBYlJC?=
 =?utf-8?B?YjZNUXQ1L0hBeVkrcFR2Wi9nekFsY2FQcFZ3Yjd4U3Y5VHdjNWh1ZkpqQzd2?=
 =?utf-8?B?UEx1WkRYUCs3ckUzaHNOYWRqdlh5OWhMci9OdlJldHdDQVRoaGFVaFptVW5I?=
 =?utf-8?B?WG1JYzhwWnJIMFRZeG40YTh1bGZMVXFySG0zRVliZTJrV1hCVC8wSEk1cU5r?=
 =?utf-8?B?aXNEYjZaSFhSd2kvNFduVEhCS0lldzdVOXJXc3hRUVArU21zTThlaUtiN0h3?=
 =?utf-8?B?NTcxSUVwWXpHck9jZlBnZEt6ZkJubjh2RHovaG9kMnpiRjlvYUlMZHdLdVQz?=
 =?utf-8?B?L3hvNVhXblNjUmxlMlBTOUtyMEtodWV1ZW5CdVhVSWdJOENlUkZQRmxRUHJ2?=
 =?utf-8?B?S2EwNk10ejYyRkFHRHBxcmNnb0E1OHY1Tk4zZTVSK2JOVVFwQ1JrbHJLa0ZH?=
 =?utf-8?B?V3pBTW05RDZBblZGQm8vL0ErVDdpYnVpZy9XSDdaV2E4dVVNOXV3clpteVlU?=
 =?utf-8?B?Mm9aQjJ6SS9JT2hrYmJxNG9uZVNrTnU5VStlRlVqZ2xqWTlBUjVOUFRteUdx?=
 =?utf-8?B?Qk5rMWdtbWJrYkNOTlA1eVordnp0alZyVi83VnVBS0NtRnhUSU5UNVJEYWt6?=
 =?utf-8?B?NTRBZ0d4SnNVMmZMLzEzWk1XcHZOQk5seXhnSWNrcHl4Z2FBRG9qMHB4UnBl?=
 =?utf-8?B?dXJPZi9uZFROZFlrZi9CMHlvcW1MU0E1VEJtdzB6SVlVYXlDRCtMdFRsOHYy?=
 =?utf-8?B?N0JRK082YVA1QzhOalRHR3grS0IwUlo3cTR0TTJSaU9leDhHNmJSQU5QNjYr?=
 =?utf-8?B?c05SQmMxZXRqTlJWWDZNcFlIdXdGOGRlZWRDS3dVUFphekVuSlZLTTFmRTh1?=
 =?utf-8?B?MHJVZiszb0NRaVpXQ21acjBXdHJWZ3lTSzZtQ3N4ZWp0Sk1SOW5LQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8128ac-15f4-43fb-4321-08da11b784d9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 19:08:33.7488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /w5JOWmMAZtJvyRfAiWMtf9pp17O2viutiXsZmFi9BKO1cPVW74JGdaL5tMQxucP6aGv6SuqBk9niPswuJd5iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2808
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



On 29/03/22 9:30 pm, Arunpravin Paneer Selvam wrote:
> 
> 
> On 29/03/22 4:54 pm, Christian König wrote:
>> Am 29.03.22 um 13:19 schrieb Arunpravin Paneer Selvam:
>>> [SNIP]
>>>>> +	pages_left = node->base.num_pages;
>>>>>    
>>>>>    	i = 0;
>>>>> -	spin_lock(&mgr->lock);
>>>>>    	while (pages_left) {
>>>>> -		uint32_t alignment = tbo->page_alignment;
>>>>> +		if (tbo->page_alignment)
>>>>> +			min_page_size = tbo->page_alignment << PAGE_SHIFT;
>>>>> +		else
>>>>> +			min_page_size = mgr->default_page_size;
>>>> The handling here looks extremely awkward to me.
>>>>
>>>> min_page_size should be determined outside of the loop, based on default_page_size, alignment and contiguous flag.
>>> I kept min_page_size determine logic inside the loop for cases 2GiB+
>>> requirements, Since now we are round up the size to the required
>>> alignment, I modified the min_page_size determine logic outside of the
>>> loop in v12. Please review.
>>
>> Ah! So do we only have the loop so that each allocation isn't bigger 
>> than 2GiB? If yes couldn't we instead add a max_alloc_size or something 
>> similar?
> yes we have the loop to limit the allocation not bigger than 2GiB, I
> think we cannot avoid the loop since we need to allocate the remaining
> pages if any, to complete the 2GiB+ size request. In other words, first
> iteration we limit the max size to 2GiB and in the second iteration we
> allocate the left over pages if any.

Hi Christian,

Here my understanding might be incorrect, should we limit the max size =
2GiB and skip all the remaining pages for a 2GiB+ request?

Thanks,
Arun
>>
>> BTW: I strongly suggest that you rename min_page_size to min_alloc_size. 
>> Otherwise somebody could think that those numbers are in pages and not 
>> bytes.
> modified in v12
>>
>>>> Then why do you drop the lock and grab it again inside the loop? And what is "i" actually good for?
>>> modified the lock/unlock placement in v12.
>>>
>>> "i" is to track when there is 2GiB+ contiguous allocation request, first
>>> we allocate 2GiB (due to SG table limit) continuously and the remaining
>>> pages in the next iteration, hence this request can't be a continuous.
>>> To set the placement flag we make use of "i" value. In our case "i"
>>> value becomes 2 and we don't set the below flag.
>>> node->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
>>>
>>> If we don't get such requests, I will remove "i".
>>
>> I'm not sure if that works.
>>
>> As far as I can see drm_buddy_alloc_blocks() can allocate multiple 
>> blocks at the same time, but i is only incremented when we loop.
>>
>> So what you should do instead is to check if node->blocks just contain 
>> exactly one element after the allocation but before the trim.
> ok
>>
>>>>> +
>>>>> +		/* Limit maximum size to 2GB due to SG table limitations */
>>>>> +		pages = min(pages_left, 2UL << (30 - PAGE_SHIFT));
>>>>>    
>>>>>    		if (pages >= pages_per_node)
>>>>> -			alignment = pages_per_node;
>>>>> -
>>>>> -		r = drm_mm_insert_node_in_range(mm, &node->mm_nodes[i], pages,
>>>>> -						alignment, 0, place->fpfn,
>>>>> -						lpfn, mode);
>>>>> -		if (unlikely(r)) {
>>>>> -			if (pages > pages_per_node) {
>>>>> -				if (is_power_of_2(pages))
>>>>> -					pages = pages / 2;
>>>>> -				else
>>>>> -					pages = rounddown_pow_of_two(pages);
>>>>> -				continue;
>>>>> -			}
>>>>> -			goto error_free;
>>>>> +			min_page_size = pages_per_node << PAGE_SHIFT;
>>>>> +
>>>>> +		if (!is_contiguous && !IS_ALIGNED(pages, min_page_size >> PAGE_SHIFT))
>>>>> +			is_contiguous = 1;
>>>>> +
>>>>> +		if (is_contiguous) {
>>>>> +			pages = roundup_pow_of_two(pages);
>>>>> +			min_page_size = pages << PAGE_SHIFT;
>>>>> +
>>>>> +			if (pages > lpfn)
>>>>> +				lpfn = pages;
>>>>>    		}
>>>>>    
>>>>> -		vis_usage += amdgpu_vram_mgr_vis_size(adev, &node->mm_nodes[i]);
>>>>> -		amdgpu_vram_mgr_virt_start(&node->base, &node->mm_nodes[i]);
>>>>> -		pages_left -= pages;
>>>>> +		BUG_ON(min_page_size < mm->chunk_size);
>>>>> +
>>>>> +		mutex_lock(&mgr->lock);
>>>>> +		r = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
>>>>> +					   (u64)lpfn << PAGE_SHIFT,
>>>>> +					   (u64)pages << PAGE_SHIFT,
>>>>> +					   min_page_size,
>>>>> +					   &node->blocks,
>>>>> +					   node->flags);
>>>>> +		mutex_unlock(&mgr->lock);
>>>>> +		if (unlikely(r))
>>>>> +			goto error_free_blocks;
>>>>> +
>>>>>    		++i;
>>>>>    
>>>>>    		if (pages > pages_left)
>>>>> -			pages = pages_left;
>>>>> +			pages_left = 0;
>>>>> +		else
>>>>> +			pages_left -= pages;
>>>>>    	}
>>>>> -	spin_unlock(&mgr->lock);
>>>>>    
>>>>> -	if (i == 1)
>>>>> +	/* Free unused pages for contiguous allocation */
>>>>> +	if (is_contiguous) {
>>>> Well that looks really odd, why is trimming not part of
>>>> drm_buddy_alloc_blocks() ?
>>> we didn't place trim function part of drm_buddy_alloc_blocks since we
>>> thought this function can be a generic one and it can be used by any
>>> other application as well. For example, now we are using it for trimming
>>> the last block in case of size non-alignment with min_page_size.
>>
>> Good argument. Another thing I just realized is that we probably want to 
>> double check if we only allocated one block before the trim.
> ok
>>
>> Thanks,
>> Christian.
>>
