Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CA859EBA4
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 20:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C6E1134B2;
	Tue, 23 Aug 2022 18:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4FD113501;
 Tue, 23 Aug 2022 18:57:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFue+X2bvKrBNWasme6l+ggvRnMNFIAl8oRtyYQtx9p5hu49yPjUwhGPlW5w6Op0qBTTsPjpESbfwUdNspYUAGm/nEqCYjSW65PaAgGinXpIqp10nUwrYLgWlohYHqOafmeTZLqGRvKlFXwTZ39vwTbMgANradPcuBEktxH37J6zCr7Hr4BHmkCHrB61GlU+tdD4V+ieQSngGSn9QItmkSUxQ6XLePGjZr4UhZ0SCEx+IXYQFETNQIZiI9qLQsbBag/46o3xj1qJZLXP2M6VJzozvSctiLPy9t3pDfEBwcZfSW1nV8Eo/aOTK25bVBNJJdWfdSEq3Lt6VZ2n/Vhnlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/kZnjk/aVwbGzWFm7jsyaaegjhYMvLGdoP+mXga8aLM=;
 b=c4+srqRtTq0qaP2qwJ9CD4W9nPAMNHn4ZGIoDsHpyUrqlzfquflVX1EydeOHWhJIAQ2k9gJVQzlxikRtC2TrpOO73oA53HGVeRL6SbQSWphjpdAkjoDSdIUYipan+ZlYev9lMTgGSbxQ2F4RB1N6XnY4hQuxieeIowcOoBEBk1tAjEBIQuhUHuwdS2eGUhKpsqqKTpMXbz7P7bxEIySFSNalanFnchkEx5/SNZx3KtYH5Wpw4VKxRxUt38RzzgEgr3JWP39UNT8A8k0sZMFlBqf4bSyzSSHE3XE9tF0d5YgSquaLpV90DbMjpkUIMi4z388npzdnC8IHBVwgStw0hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kZnjk/aVwbGzWFm7jsyaaegjhYMvLGdoP+mXga8aLM=;
 b=lernyiMZF6t6JxfSAkd93A4p7OKBYf8452lv6d+/CmC0EmnGjrqCRhxjlVe+FUmvfhI5FZ0L2txNH/ykXh+DZkvFlggmpa+rZkMoksg+0MARZ2racf56RrZ7Cq+FG1Lff/7ON034CLTHg1utDGuIawcOvHy//wUg6CdoWW4VP0Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by MN2PR12MB3661.namprd12.prod.outlook.com (2603:10b6:208:169::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Tue, 23 Aug
 2022 18:57:29 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf%6]) with mapi id 15.20.5566.015; Tue, 23 Aug 2022
 18:57:28 +0000
Message-ID: <54bbcee9-68c7-5b4d-1050-7f098c96a805@amd.com>
Date: Tue, 23 Aug 2022 14:57:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/sced: Add FIFO policy for scheduler rq
Content-Language: en-US
To: Luben Tuikov <luben.tuikov@amd.com>, dri-devel@lists.freedesktop.org
References: <20220822200917.440681-1-andrey.grodzovsky@amd.com>
 <d5c45e7a-257b-7c60-33b5-7c103b0b1f93@amd.com>
 <bf0791b0-c917-6b6e-75bf-0c16869aa045@amd.com>
 <1eadb06c-7d2c-0317-a34a-c219c68b93c3@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <1eadb06c-7d2c-0317-a34a-c219c68b93c3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT2PR01CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::17) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e781101-445f-48fb-3248-08da85395385
X-MS-TrafficTypeDiagnostic: MN2PR12MB3661:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3hUEgvxso8NayuK31LaeNRH1a1g5IxcV5WBK7gvKkqVcV3ZcpGOQMYc5p7bvvWvTvo8cYwvdbpWYWJ4MXNYh4CWR+nB/0FduWMtoOCMucCE7/bRZRsArYAXSsHuN/zOdxE89aBqpaaK8+1H7cnwd8p3x2L1UzauwG+DeCYSSsOJ3nk3Hyaq+bcWOA0/ApqOXjb+oceiJA9rihxkC+kthIG2d29Xwm86oSP+8TYbiBWUWf4IiGITvc7FVh57bfRKwgIDIkYMixtjqoLTzAETMkbpheVAbZeQiv2e79UWhgA5IpkyEhIKvmAS0uHH6dfkl7xjrU17/xjNPydxULF58L/YcMfh5BKJ5F1Ke4rxgVQLqWNgJCVVUDDnLw8XK7utb4ja58/iSEBFcLXq8CwH2+bNLspvXklY1PCcBzV5SXN1Ju+MS8/03oOMslds3Anwh2PAsa5GNQkqwgywRtcQB+KOnlQ38L5gEIAmfl2oykhdYC0HOUd1kQ0ZyJoYD/mrh+BVER3BxQgHqwTsDDjDf5+Q9MV7NIpewknY5gM64SNBysceF6Fw6xYrAmg8ANMD7jzK6dU8uWl4XlRPzTIcit5dRHwX0KDQq6FVIHaD5VmhQWL3GUr2TWWPpeXUxrlg/d9S0p0eIL00mZzq2Hy/syHBMUJuQfK5Fe+lPs9mqFGl/gUoP667rOJtdClILBGSp4dUFUJOCdG1lmYjvDEATRUlPEPOA3HmcIEsnDjDyN9HEdl76ZyTqeMuq8niu/wgAlFu28c283dU2NvEkyocaqzIpoxw1lGtYI5cOVslG+ng=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(39860400002)(346002)(396003)(376002)(83380400001)(44832011)(2906002)(8936002)(4326008)(66946007)(66476007)(8676002)(66556008)(5660300002)(6666004)(6506007)(26005)(53546011)(6486002)(41300700001)(36756003)(31686004)(6512007)(186003)(2616005)(478600001)(31696002)(86362001)(316002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnFJN0VRQithVXpXb2hGNlpLWTJBTFI1NFRwVjNIV0xobXI2dmdTdDR3bmtu?=
 =?utf-8?B?b2F3SXdKMVMwenVvazZRL1BpK2dVWmpUN0REM0R5UmRiN2plV1JSS1BwaEps?=
 =?utf-8?B?MG1QbjArRWRKdEpxaUkvMkNleFE4eEFvQ2ovWVhPZUxBaU1MeDgwMUgwdW1W?=
 =?utf-8?B?ZFpnRXJKa1VLT0ZaVWxFM1VmeXlNV05laGJNb3BhcXpZVzdPZ1doWGs3RXVP?=
 =?utf-8?B?c3lxZ1pYZnp2NnNma3FkcFFOQ01yendQRHZBdUx0eUppNlpvcXpUL21jSjVs?=
 =?utf-8?B?ODhrSjN2U0VOSWx2VFV2RW1QWlhPKzRIU01vQXFJalhJNUtFcVZNcmc5eVdv?=
 =?utf-8?B?ZFdDeGtmbi8rTDJHR2h0NE9OOGVLc1p4MS9RaE9RazFCSXFNQW8zVVZYSnVC?=
 =?utf-8?B?WEFTRGpKZjVDQ3JuZDJhaTlUVmZ6UVdpc0p6RnBRVytYSHRLY0VzSllzMko2?=
 =?utf-8?B?U05Td3Z4b2xQY0t3RC9DZ2VrMlVpWkNPWWliMURQUmxsVjU5NTR4Q3VKSUtT?=
 =?utf-8?B?QUhhZkE1MTJCSlhoaG96eit6RDl1QkNaYzNNdFk0TXhaazRFU2ROUk4rc2NQ?=
 =?utf-8?B?Yk0wMjZIbmRWRE1SaytPYUoydDV2dXcxQ1dIdS9sd2diWS9PQXhnUGFRTm9R?=
 =?utf-8?B?VWxXOWt2NEIrUkM2c2MrMEh3NENvckloa0t4N2FON2c1VFhiMVhQcjNuQTUw?=
 =?utf-8?B?dElycjhsNEtnUEVhb1lISUEybEFVWFcxbkFiaEJUR3VQcDFzUWJyN2FQRFhz?=
 =?utf-8?B?YTZXMENmL0hHcUZJSFB3a3BuVU52M3gvOWJMMXYyTzNmVzdTS2hmZTZWMXhW?=
 =?utf-8?B?WUtkdlVMSzJEdUgxY2hadXVPdlF5YjFwdXF4QjIwbzkvY2NObGdyUjlZZUtU?=
 =?utf-8?B?b3pKaUUyZWVGT21pdVdSWVJZRGFPM1B3VWJTTjlqNDVhNUVNU1ZwWTdQWm5J?=
 =?utf-8?B?SFlzcEVYVzBYUk92eld5YURwaExvUFFCb0dqL2F5TmxQaTV3TEZxZlRjemIy?=
 =?utf-8?B?SkRiYWFTbnRRUW5lcWVSa3ZuZmluR2d4dXJsaThIMnRyWG9IaWlWUEhUV0hw?=
 =?utf-8?B?bmdRZDlqc0srcmtTQW1nTU9VQzJpVFVQNlRSZ3hnS2lUSXRoMGUvOHpiWDhy?=
 =?utf-8?B?azhndXVweE00dWNJUEhzOWhXa1JidzR1VTJ5Vlc0bmZVWFAyL0lLVU50RDZt?=
 =?utf-8?B?VGkxOTBVdEN3YTRlYjFLSUFOK1A0Qlk3OUM4R245UjJqejBZdFZhY2x0KzFI?=
 =?utf-8?B?UmNXRHQ4YlJGRllEU1lWaVBjUlRhZThpemxIVjd4TU9rR1MvNnBmdXJNMWFZ?=
 =?utf-8?B?d0lCNDFiM1VmcXhMMkNkbUI4eHNsc3JlbWdDbkI5TmRwQU16cjFmVlV4YWpV?=
 =?utf-8?B?dmlXNlBTcTN3UFp4WEFDZDJWN1NPT0dWVldDVytYdXd3OGY0ME9NMTQ3NllP?=
 =?utf-8?B?NmNqTUx4Tmw2RkZicmlSc3ZpVkJuMm5KTEIwZ1M0ZHlPRnJjeVFEU0N5WHJJ?=
 =?utf-8?B?dFo0Z2p1b2ZVNWQzNER0U3RhZFhyUjZlaUkwQ2VMeWNDT3lLUHZ1M01QOHBl?=
 =?utf-8?B?dW8waU82SUFDZEpkRGNqZXF2YUp6dFczUVFrZzZ2UWx2WWRJbUc4d3F0bmxu?=
 =?utf-8?B?dUdtTUV4OUlxVjRkN0xaMVJaN1RKdXBVakpBNk1tMGNIN0tlNFQ0V09wVnZn?=
 =?utf-8?B?VHIrSFFxazBEUDMvWWNSTlBWZUlnTUNweFVZcFRtdkJPemhVZTVYeGR3SWJm?=
 =?utf-8?B?OVlSSGNnTUVaam9SMVBXWEJzTzJ4TUwrOGxqY3FTVXhMbG8rVWZhSEI4TjZo?=
 =?utf-8?B?dzA2Ti9peWM1TXJDWUVVY0R0QWhMcUdvc2tKOTNhaHB4ZFhxMnBBQWhZbkdu?=
 =?utf-8?B?NTJ4SzZXS3dHTHZPWWVTMCtDOE53TGRGY3BoZ0VZOXJSZWxGZkxpcm5iU3hk?=
 =?utf-8?B?cksvTmIrWlF5SUtWNUphYlhkbDhEQnZxR3dOc1ZBd1J4Mzc0ZERIT3IzdWlU?=
 =?utf-8?B?MG16Y25CQ0VSQU1ITVErZEtUa0VNN04vOGRqUDlLZTJSb2FESlB0VzBWMGVV?=
 =?utf-8?B?enpBVW9HbWNmR1pNTGtQWFA5cVJiNGJ2YlJQOWFtR1JZYmE1ZTR5ZGtmc1lu?=
 =?utf-8?Q?qxyepjd8J6b0hAtblcuBWZi4Q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e781101-445f-48fb-3248-08da85395385
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 18:57:28.8464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHOfhwSsKtQ3SAzGJEFcYrNovtBGfBJnB9wS4xxKYW65P/VbV4dTytX+62tXgylJsBjTohd7gG2/pEZobSQfxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3661
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
Cc: ckoenig.leichtzumerken@gmail.com, Li Yunxiang <Yunxiang.Li@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-08-23 14:30, Luben Tuikov wrote:

>
> On 2022-08-23 14:13, Andrey Grodzovsky wrote:
>> On 2022-08-23 12:58, Luben Tuikov wrote:
>>> Inlined:
>>>
>>> On 2022-08-22 16:09, Andrey Grodzovsky wrote:
>>>> Poblem: Given many entities competing for same rq on
>>> ^Problem
>>>
>>>> same scheduler an uncceptabliy long wait time for some
>>> ^unacceptably
>>>
>>>> jobs waiting stuck in rq before being picked up are
>>>> observed (seen using  GPUVis).
>>>> The issue is due to Round Robin policy used by scheduler
>>>> to pick up the next entity for execution. Under stress
>>>> of many entities and long job queus within entity some
>>> ^queues
>>>
>>>> jobs could be stack for very long time in it's entity's
>>>> queue before being popped from the queue and executed
>>>> while for other entites with samller job queues a job
>>> ^entities; smaller
>>>
>>>> might execute ealier even though that job arrived later
>>> ^earlier
>>>
>>>> then the job in the long queue.
>>>>
>>>> Fix:
>>>> Add FIFO selection policy to entites in RQ, chose next enitity
>>>> on rq in such order that if job on one entity arrived
>>>> ealrier then job on another entity the first job will start
>>>> executing ealier regardless of the length of the entity's job
>>>> queue.
>>>>
>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>> Tested-by: Li Yunxiang (Teddy) <Yunxiang.Li@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/scheduler/sched_entity.c |  2 +
>>>>    drivers/gpu/drm/scheduler/sched_main.c   | 65 ++++++++++++++++++++++--
>>>>    include/drm/gpu_scheduler.h              |  8 +++
>>>>    3 files changed, 71 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> index 6b25b2f4f5a3..3bb7f69306ef 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> @@ -507,6 +507,8 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>>>    	atomic_inc(entity->rq->sched->score);
>>>>    	WRITE_ONCE(entity->last_user, current->group_leader);
>>>>    	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
>>>> +	sched_job->submit_ts = ktime_get();
>>>> +
>>>>    
>>>>    	/* first job wakes up scheduler */
>>>>    	if (first) {
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index 68317d3a7a27..c123aa120d06 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -59,6 +59,19 @@
>>>>    #define CREATE_TRACE_POINTS
>>>>    #include "gpu_scheduler_trace.h"
>>>>    
>>>> +
>>>> +
>>>> +int drm_sched_policy = -1;
>>>> +
>>>> +/**
>>>> + * DOC: sched_policy (int)
>>>> + * Used to override default entites scheduling policy in a run queue.
>>>> + */
>>>> +MODULE_PARM_DESC(sched_policy,
>>>> +		"specify schedule policy for entites on a runqueue (-1 = auto(default) value, 0 = Round Robin,1  = use FIFO");
>>>> +module_param_named(sched_policy, drm_sched_policy, int, 0444);
>>> As per Christian's comments, you can drop the "auto" and perhaps leave one as the default,
>>> say the RR.
>>>
>>> I do think it is beneficial to have a module parameter control the scheduling policy, as shown above.
>>
>> Christian is not against it, just against adding 'auto' here - like the
>> default.
> Exactly what I said.
>
> Also, I still think an O(1) scheduling (picking next to run) should be
> what we strive for in such a FIFO patch implementation.
> A FIFO mechanism is by it's nature an O(1) mechanism for picking the next
> element.
>
> Regards,
> Luben


The only solution i see for this now is keeping a global per rq jobs 
list parallel to SPCP queue per entity - we use this list when we switch
to FIFO scheduling, we can even start building  it ONLY when we switch 
to FIFO building it gradually as more jobs come. Do you have other solution
in mind ?

Andrey

>
>>
>>>> +
>>>> +
>>>>    #define to_drm_sched_job(sched_job)		\
>>>>    		container_of((sched_job), struct drm_sched_job, queue_node)
>>>>    
>>>> @@ -120,14 +133,16 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>>    }
>>>>    
>>>>    /**
>>>> - * drm_sched_rq_select_entity - Select an entity which could provide a job to run
>>>> + * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>>>>     *
>>>>     * @rq: scheduler run queue to check.
>>>>     *
>>>> - * Try to find a ready entity, returns NULL if none found.
>>>> + * Try to find a ready entity, in round robin manner.
>>>> + *
>>>> + * Returns NULL if none found.
>>>>     */
>>>>    static struct drm_sched_entity *
>>>> -drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>>>> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>>    {
>>>>    	struct drm_sched_entity *entity;
>>>>    
>>>> @@ -163,6 +178,45 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>>>>    	return NULL;
>>>>    }
>>>>    
>>>> +/**
>>>> + * drm_sched_rq_select_entity_fifo - Select an entity which could provide a job to run
>>>> + *
>>>> + * @rq: scheduler run queue to check.
>>>> + *
>>>> + * Try to find a ready entity, based on FIFO order of jobs arrivals.
>>>> + *
>>>> + * Returns NULL if none found.
>>>> + */
>>>> +static struct drm_sched_entity *
>>>> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>> +{
>>>> +	struct drm_sched_entity *tmp, *entity = NULL;
>>>> +	ktime_t oldest_ts = KTIME_MAX;
>>>> +	struct drm_sched_job *sched_job;
>>>> +
>>>> +	spin_lock(&rq->lock);
>>>> +
>>>> +	list_for_each_entry(tmp, &rq->entities, list) {
>>>> +
>>>> +		if (drm_sched_entity_is_ready(tmp)) {
>>>> +			sched_job = to_drm_sched_job(spsc_queue_peek(&tmp->job_queue));
>>>> +
>>>> +			if (ktime_before(sched_job->submit_ts, oldest_ts)) {
>>>> +				oldest_ts = sched_job->submit_ts;
>>>> +				entity = tmp;
>>>> +			}
>>>> +		}
>>>> +	}
>>> Here I think we need an O(1) lookup of the next job to pick out to run.
>>> I see a number of optimizations, for instance keeping the current/oldest
>>> timestamp in the rq struct itself,
>>
>> This was my original design with rb tree based min heap per rq based on
>> time stamp of
>> the oldest job waiting in each entity's job queue (head of entity's SPCP
>> job queue). But how in this
>> case you record the timestamps of all the jobs waiting in entity's the
>> SPCP queue behind the head job ?
>> If you record only the oldest job and more jobs come you have no place
>> to store their timestamps and so
>> on next job select after current HEAD how you will know who came before
>> or after between 2 job queues of
>> of 2 entities ?
>>
>>
>>> or better yet keeping the next job
>>> to pick out to run at a head of list (a la timer wheel implementation).
>>> For suck an optimization to work, you'd prep things up on job insertion, rather
>>> than on job removal/pick to run.
>>
>> I looked at timer wheel and I don't see how this applies here - it
>> assumes you know before
>> job submission your deadline time for job's execution to start - which
>> we don't so I don't see
>> how we can use it. This seems more suitable for real time scheduler
>> implementation where you
>> have a hard requirement to execute a job by some specific time T.
>>
>> I also mentioned a list, obviously there is the brute force solution of
>> just ordering all jobs in one giant list and get
>> naturally a FIFO ordering this way with O(1) insertions and extractions
>> but I assume we don't want one giant jobs queue
>> for all the entities to avoid more dependeies between them (like locking
>> the entire list when one specific entity is killed and
>> needs to remove it's jobs from SW queue).
>>
>>> I'm also surprised that there is no job transition from one queue to another,
>>> as it is picked to run next--for the above optimizations to implemented, you'd
>>> want a state transition from (state) queue to queue.
>>
>> Not sure what you have in mind here ? How this helps ?
>>
>> Andrey
>>
>>
>>> Regards,
>>> Luben
>>>
>> In my origianl design
>>
>>>> +
>>>> +	if (entity) {
>>>> +		rq->current_entity = entity;
>>>> +		reinit_completion(&entity->entity_idle);
>>>> +	}
>>>> +
>>>> +	spin_unlock(&rq->lock);
>>>> +	return entity;
>>>> +}
>>>> +
>>>>    /**
>>>>     * drm_sched_job_done - complete a job
>>>>     * @s_job: pointer to the job which is done
>>>> @@ -804,7 +858,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>>>    
>>>>    	/* Kernel run queue has higher priority than normal run queue*/
>>>>    	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>>> -		entity = drm_sched_rq_select_entity(&sched->sched_rq[i]);
>>>> +		entity = drm_sched_policy != 1 ?
>>>> +				drm_sched_rq_select_entity_rr(&sched->sched_rq[i]) :
>>>> +				drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]);
>>>> +
>>>>    		if (entity)
>>>>    			break;
>>>>    	}
>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>> index addb135eeea6..95865881bfcf 100644
>>>> --- a/include/drm/gpu_scheduler.h
>>>> +++ b/include/drm/gpu_scheduler.h
>>>> @@ -314,6 +314,14 @@ struct drm_sched_job {
>>>>    
>>>>    	/** @last_dependency: tracks @dependencies as they signal */
>>>>    	unsigned long			last_dependency;
>>>> +
>>>> +       /**
>>>> +	* @submit_ts:
>>>> +	*
>>>> +	* Marks job submit time
>>>> +	*/
>>>> +       ktime_t				submit_ts;
>>>> +
>>>>    };
>>>>    
>>>>    static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
> Regards,
