Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB4D60B405
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 19:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6725410E58A;
	Mon, 24 Oct 2022 17:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E317B10E58A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 17:25:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NgP2iaBp2mDmyKfk7AsWi0TIeckFHRo1SrM8Up8NVTtXiHhSPbG5chKFDYdZ6KhXWAq0BzcUmMW/TCiKq7O8MGPlLk/6bmzFk84YGJffYXxROVM44iZQN+SQT8zBghFzHyeScoZ61RS0E96WysYSG/Jt1GuRUjk5e9qaPi3Lj6HhGZfh4yIgla+DF1UEO/G+7mhBthehSfghYOB5CuUVuwcUcnE/6SNB8zwfhm83RtIg1Kjrh8pBHYt54nuf/mgYnFX2CKI2ZLZ2fnErGiNC80KJZxvqz+dHbXC75k6kQwzRPK9gvKTa1gVjASSV/bnxQu5pKYfERLdhWGLXmz9oXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSc0P8VyFQEzhtPE40zMfEvZRGNM3UH4Cnr2/5SfVeI=;
 b=Brx2pXa2Q3xk2vSZxfQexJggj2YdyMZsJt1M5kZaJkP2zZJr0ZtNql89WTkrvDMkzSE22gOd1yKQO9jC4TLg8/8uiBu3TLa+fML5+mqpD/ADhKxQLV2kgSwUWLZEnjj4S5JhEF0dAs96s0VCPEHea45zEdY5W7P4v5ziCx3CtVmrqvshVj75IGHpvlljx4mTsZz/ghLGM6on5oGKDwMJab88GBu8tVVHV3nRNNsqAkKncbaqkBbtpYZBwGpRa3nOq7E2yjWDnGcWkpBaFKqpfQguNyHQTebG0cZwrgmzWzc6mhSO/5z2Fds1FxZl4u4nnjO0GWR3hmMtSo+dZ1zdbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSc0P8VyFQEzhtPE40zMfEvZRGNM3UH4Cnr2/5SfVeI=;
 b=BOVjHQkjKRQBELHsciTxgBiqhwdL1tSHhmKjshNQKMfv0HcQUQvIEdw7iYIdgZC2Wl+W3uae+LWwB/tHDKND/P/7azLqrrpboyzKbMQIr2DunbwFjUo/JgUFHyHfWNFCxas7gQofVkoFqJlNjGeXmR/vOdzPJZj6NCt6y4roKYA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 IA1PR12MB7493.namprd12.prod.outlook.com (2603:10b6:208:41b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 17:25:09 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 17:25:09 +0000
Message-ID: <66d383ed-dbb1-ce8b-5eaa-2600982aa6e6@amd.com>
Date: Mon, 24 Oct 2022 13:25:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [RFC PATCH] drm/scheduler: Set the FIFO schedulig policy as the
 default
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
References: <20221022010945.95560-1-luben.tuikov@amd.com>
 <cc300dfb-93dd-9bdf-540a-07a3891d863e@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <cc300dfb-93dd-9bdf-540a-07a3891d863e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0100.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::9) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|IA1PR12MB7493:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bf76779-debe-42d1-abd4-08dab5e4b36f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pwYxxtrtXt93hF0WX1W90jVcHEg478VN+FfFegkTz74oM69dXSY8aVtvMdbymiRaqW6UFUkbqPlk3FwIivWM5qmZl/ObDIAEIrYuVyA2oArrpL7KDvDjuXEPTjvhN2/aFj5hz3ygrXEAc+Jadmmcg17EseP7GZd8BzHegVYx3fmJWDJPYVEFbDl42X9ApcvUsB4CbMviXnHirmhdbm/u2a2uYnqMImSiIz4AApbDSi4nV1ZFMqrsn8TgmCSyAo66PuzYRrj6frJayDHl4D7ToZmaAH2U9UBQDzcYeyTTJBkYbaLy/bMRRXIm2pwcWKK5qVYdXpx2VrkxA2g0V5oRSO41eyz4NJi1+A35xhHxR1X6/eOHYGRtOYiNrr3hefIntq96BiNWPalmnLQZusxNKa35dXs8W1xvbGWe4b8x4w6Cdj6/pqg3Aab+YsAbTN0TL+Ki2l9Gd9bOfTP5/k4jdGtsYqLB4pj2xnmvM9aL78nXCWGyhiXPrGz6zkOVhxsVYdkhXlfAVdmlV8cUlFydaXf0zVmGAhr0dJGFQdyOVlxiHx1kvibsAjsdcXxt8GbHOIDmh+d5Iv4b2OHHP9qCVKlDYk+cCuIz2sGhWNqPTUBZv9uJkiai75YbOIJweNuP6gt3lyqEuLgNJgOXl3bLLIMPh4oZtbOPA+DLshusR96ZJe5Vmp4pwTD8mXMcYb/q5Pt6lIDea8arHy/M/lZhf0+igrHev62iDXczU7s51dQcPaV3PLK+e5lOssYYNKcpDvww2EKQ/c7q19BDl50Y5G5fQ7pX5/Rn72TLz1Ug3Mo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(451199015)(31686004)(36756003)(4001150100001)(2906002)(5660300002)(4326008)(110136005)(44832011)(66946007)(8676002)(66476007)(41300700001)(8936002)(66556008)(316002)(53546011)(26005)(6512007)(31696002)(83380400001)(2616005)(6506007)(38100700002)(186003)(86362001)(66574015)(6666004)(478600001)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0l0NTY3U0twYjdnQ3o1NnhPRnp6eVNtZE1PVXFHaVhXbXVmbmhKM1pxcmx0?=
 =?utf-8?B?SjNyNTlRNlV6R0k2Nm9JVG0vbkd6YW45U28zQ3E1ZC9WN3g2TTRkWVJlb2pr?=
 =?utf-8?B?Z1J5YXlrOThWUVB3U0hUdW0vb2l1cHE0OE1EUjM2VWJFaEpGa1Y5L0N3TEFJ?=
 =?utf-8?B?Q0d1Z0ZoTUdDbEpGaEhVbmNqdzV3L29FWHRqWXBrTUxlN28vcGRTMk9qSTl2?=
 =?utf-8?B?TDc0ZEJRTldLNFpneE45dm41ZlhQbmhPdUhCTlQrbmtHeCtLS3ZqTlhxaVZu?=
 =?utf-8?B?TXg1ZDdlNWkyRENIbUNySXNKMWZNTzlXQjlNNWZqZXBxZ3FhYTZ0alh5NkM0?=
 =?utf-8?B?T1p6d1Z3WVRxajBEVVYvc1U4YkdNcjQ4OFJnZlBOQUhaVkt6cTdETWwxbFY0?=
 =?utf-8?B?VEZtdGJGbkFpWkxQK2dmTGlJekxFNjB0R1V4TWNDa2ZsSU1aODVWcTRWbmtL?=
 =?utf-8?B?RG9uODVaMXNQTkJOR29XU290cmNtd1NCYkZhaS9QWEZrTzlGVXhFNmdGUW1u?=
 =?utf-8?B?OGsxd0Y4cE9IQitMYjF1ZFBSc21UZWpRa1FJSzBITHhRKzA2Y2FuTXlPVTBu?=
 =?utf-8?B?RXVIOFFRRWtMakgvRnIwcVBDKytzQldJeTdiMFlvMUxEU29wbWZzNE9WRHBu?=
 =?utf-8?B?YTRLbXU0Zm5tbmIrWHBCa0o1RXdJbFFzaC9MQkNZOEJuRHdXNmREbjdQS2dh?=
 =?utf-8?B?TU9qVzl2bmRpdDFEYWRQVTRsaTBsV01GanNhb3RSc0ZtL3EvMEJQMGRUZFZN?=
 =?utf-8?B?WlB6VFcvbWYrcFBkeHVHdDhEcEFkc1EyWHdPbVRMbmFRMmRyTHg2bGJzQmRN?=
 =?utf-8?B?WUFvUVJNeGY2NGl2V0N6aEFDZnQyRWl6QTJPaDJRSW9pcmE2T1B2Zmg0eXlG?=
 =?utf-8?B?MXRHVi9VMlpqY2ZJVFE1Z2c0Slh2b2NLRXVSVWdUcEZ5NVAwL1p6ZmNYRnFy?=
 =?utf-8?B?Q0tTODNxNnFkdDE2NldDV0xXdjhLcWVlOGJGZWtXeUxjbktaQXlwRHczMmVN?=
 =?utf-8?B?L0tqYTRBcXBwQitzd29kYWQrOW0zaVZuTUxyalR6U3RMNUl0U1Z3S1NndXd1?=
 =?utf-8?B?VjIrWllCcUx4RUpDQUxYT1ZsTEJzRjB2WENBd3Vic0Y1MnhXSVpjQmllQldM?=
 =?utf-8?B?WW1CazBSejZPNjlBV2pia2htV1JmK3JZSXZLbmpIVTlQeW4vVnBTTFBqdjhn?=
 =?utf-8?B?cVFBSnpCY2xLU01sak9DcUQ0bjlvcThTOGVGWXhzQ1BCRXpJYlJ0cVVJaitR?=
 =?utf-8?B?TVYvWXlkc0NVTFk0SzZyS1ZJd1BuZVE3aW55bnRIMDhScHJHeHFYQmF3THAr?=
 =?utf-8?B?QTlOUXl1c2Q2TkZRczB1SDVhZENXRmdzdEE3V2owQ2dOWU9XZmhDWXFjUWJq?=
 =?utf-8?B?L2tUaml6YUFCZU4yekgzVk5kbFpGeUNEUmdQWUF5YmJhQ3p2M3JvYUJiek5G?=
 =?utf-8?B?TUxhMXJJZHpsOVZCR1lXODRUejBreHArdFRmUlVwZjRYNkZHWE81cVRZZmly?=
 =?utf-8?B?QitEOUNtanlEdFh3SkFEWkVXdVdhamFCWnhZVm1CT3grNTkvcGlFNFlSTlNo?=
 =?utf-8?B?b0lKamRRZmxlYjllTjI4MjEvNEJSdEZKcjI5TmN5aXhWL2ZjNC85SWhycGpv?=
 =?utf-8?B?Sk9SbE53TGpTVnNPdGdpNjlzZ2Y4M1BDUk1CMm9UVzQrbUplRmZnUmQ5TzUw?=
 =?utf-8?B?dGZlYk01VnJQS1lPTUxvVzYwN05BRnpXeHR4TTdDeFhmaGhIYW40M3RNSFk0?=
 =?utf-8?B?QTNlMGVwK0lGU01VZXg5dzNVVmpQM05McTBQRy9RL2MybmhkSjJXWDBPdE85?=
 =?utf-8?B?Zms3cXljZkdMVExDVnoyR0pTbVR2WlZ2Nk4yaGVETUtYbHFUV0IxVGRIYWh6?=
 =?utf-8?B?eDlxSlZMbDhndCt4NFJRVzdLenFDTkZBQzMwWXovTEI1TDVoV3BSbUpiSzdn?=
 =?utf-8?B?WUxUaGFJMXh4N0o4SkZQOXhhOTB0OWZ0VUJNVjV4MUliUnU1VURLeFZCMGlD?=
 =?utf-8?B?SVVFclFyRkR1WkJRbVJXSUV1ek9MNGRlVkpCVWZzajMwOGhLY1RnckpDeTlT?=
 =?utf-8?B?cjhXNkZmcytrTktMenlXQUtUNm8zbitsZ1B4N00xMG9ZRTZMOTFKUVFCeEZO?=
 =?utf-8?Q?j5O3yEy0qm/YoqcBrTRPsZhQU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf76779-debe-42d1-abd4-08dab5e4b36f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 17:25:09.5363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bj67VZzoo9XeVr4+CSkgbddv3e3ijL9Vp+SwvU0KsNm0IrC/mqwfaeb1hYlusBd1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7493
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

Can you add an R-B to V1 of this patch, as the v1 is what I'd like pushed.
I sent it right after this one.

Regards,
Luben

On 2022-10-24 06:42, Christian König wrote:
> Am 22.10.22 um 03:09 schrieb Luben Tuikov:
>> The currently default Round-Robin GPU scheduling can result in starvation
>> of entities which have a large number of jobs, over entities which have
>> a very small number of jobs (single digit).
>>
>> This can be illustrated in the following diagram, where jobs are
>> alphabetized to show their chronological order of arrival, where job A is
>> the oldest, B is the second oldest, and so on, to J, the most recent job to
>> arrive.
>>
>>      ---> entities
>> j | H-F-----A--E--I--
>> o | --G-----B-----J--
>> b | --------C--------
>> s\/ --------D--------
>>
>> WLOG, asuming all jobs are "ready", then a R-R scheduling will execute them
>> in the following order (a slice off of the top of the entities' list),
>>
>> H, F, A, E, I, G, B, J, C, D.
>>
>> However, to mitigate job starvation, we'd rather execute C and D before E,
>> and so on, given, of course, that they're all ready to be executed.
>>
>> So, if all jobs are ready at this instant, the order of execution for this
>> and the next 9 instances of picking the next job to execute, should really
>> be,
>>
>> A, B, C, D, E, F, G, H, I, J,
>>
>> which is their chronological order. The only reason for this order to be
>> broken, is if an older job is not yet ready, but a younger job is ready, at
>> an instant of picking a new job to execute. For instance if job C wasn't
>> ready at time 2, but job D was ready, then we'd pick job D, like this:
>>
>> 0 +1 +2  ...
>> A, B, D, ...
>>
>> And from then on, C would be preferred before all other jobs, if it is ready
>> at the time when a new job for execution is picked. So, if C became ready
>> two steps later, the execution order would look like this:
>>
>> ......0 +1 +2  ...
>> A, B, D, E, C, F, G, H, I, J
>>
>> This is what the FIFO GPU scheduling algorithm achieves. It uses a
>> Red-Black tree to keep jobs sorted in chronological order, where picking
>> the oldest job is O(1) (we use the "cached" structure), and balancing the
>> tree is O(log n). IOW, it picks the *oldest ready* job to execute now.
>>
>> The implemntation is already in the kernel, and this commit only changes
>> the default GPU scheduling algorithm to use.
>>
>> This was tested and achieves about 1% faster performance over the Round
>> Robin algorithm.
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Alex Deucher <Alexander.Deucher@amd.com>
>> Cc: Direct Rendering Infrastructure - Development <dri-devel@lists.freedesktop.org>
>> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>
> 
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 2fab218d708279..d0ff9e11cb69fa 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -62,13 +62,13 @@
>>   #define to_drm_sched_job(sched_job)		\
>>   		container_of((sched_job), struct drm_sched_job, queue_node)
>>   
>> -int drm_sched_policy = DRM_SCHED_POLICY_RR;
>> +int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
>>   
>>   /**
>>    * DOC: sched_policy (int)
>>    * Used to override default entities scheduling policy in a run queue.
>>    */
>> -MODULE_PARM_DESC(sched_policy, "Specify schedule policy for entities on a runqueue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin (default), " __stringify(DRM_SCHED_POLICY_FIFO) " = use FIFO.");
>> +MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
>>   module_param_named(sched_policy, drm_sched_policy, int, 0444);
>>   
>>   static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
>>
>> base-commit: 16d2a3f2ad1d2b95bf9122c910c63b0efe74179d
> 

