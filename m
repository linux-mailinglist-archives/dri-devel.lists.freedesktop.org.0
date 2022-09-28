Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 428A35ED323
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 04:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6C410E23B;
	Wed, 28 Sep 2022 02:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594E310E22F;
 Wed, 28 Sep 2022 02:44:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/x6o12FBhIrQ8xeN8FJJ7FNQnGnpuHZa4EEV9jmgNNKB+uXeGKUVtM87YHMTcVCV7vDu3rqFNYZD4puZUGzBmbCPGh4Tiyb3AUGOBZtB6sKHkVSkhqSZ7EAFxmUXC43OuuXaBWLrVepzZ96MQsFZWgPeVbooWf66Q6Fcid5FjJ9HJzcAQ5+3VfCHhnGL+FuPQ+LRcVsd7IUGs2VeycGuC3emsB8U/z/NnhwZMKlKB4df9qdVOwDntqOxirWQz/m+obUH8l9vqFydMZi+9KCGrHuWEqciZXk4ij7QJdnVyF8/IUzkWgI/nWWwijErCioUdZcWZW6OXo6us7qZOPBEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6gNqwzd7iXsuynL4ktp6BLGe+3G9gnnbFsyqgVr7JY=;
 b=CParN5XTwK4QMD482FYoZFbe6cL1/W6BuR9pXtoyw/zK24EztHUjsRqz80knO1DuugzV2bEcHR5J548ruhX+vWrOhwL/gPgel4rKIgsEVbLO+/QYXoGBL3/5cqPyJGeJ3zQE44NlyjbyQ5QlqQwbxOfjulQsS87FgniLhKTYoSBbKs+0CAH+DuIzZtz6rkRVDqp86aWcDmc8p0MzNFoB5nTilhNXQnSzY7yYjltVDx54usDzBMnqaKf9d8ZHY+ARLKiYcWskZlUScv8jst0ZbEBN+DJgO75RtM99V7BR49Ct9Ym+q04ceYurQsSd9h5XdQeBs0tiU/81OmgWOGEteQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6gNqwzd7iXsuynL4ktp6BLGe+3G9gnnbFsyqgVr7JY=;
 b=cUYxZok5iMtYSYEaxLmsopuKRzOaNvpG5fNPrspv8cg6Ok4nqKIIl76l8wj8B+pcAXFzn98hIeNnlfbSKeUrlSlrW66O+XT0nibaaT8brwVED4eiI3hedWx1P/c+e1QXPGkXGHgMe2L/sQTQTP53PyQnwAOyTkKJpHLZ79LkV4Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by BL3PR12MB6546.namprd12.prod.outlook.com (2603:10b6:208:38d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Wed, 28 Sep
 2022 02:44:02 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5c7:e934:c098:f2ac]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5c7:e934:c098:f2ac%7]) with mapi id 15.20.5654.026; Wed, 28 Sep 2022
 02:44:02 +0000
Content-Type: multipart/mixed; boundary="------------hpxQVHHM1gEWb7lOAiQCk0JU"
Message-ID: <db9636f8-0eb2-e5ee-567b-f22c83375e5a@amd.com>
Date: Tue, 27 Sep 2022 22:44:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4] drm/sched: Add FIFO sched policy to run queue v3
Content-Language: en-US
To: Luben Tuikov <luben.tuikov@amd.com>, dri-devel@lists.freedesktop.org
References: <20220921182831.25214-1-andrey.grodzovsky@amd.com>
 <5c3e72bb-0df7-b76c-1679-5bbb571e4a2c@amd.com>
 <43891f6c-615b-3b5e-204d-b0815dc858cf@amd.com>
 <7e9ca77b-80a1-57d3-f505-d1761c38c5ee@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <7e9ca77b-80a1-57d3-f505-d1761c38c5ee@amd.com>
X-ClientProxiedBy: YT1PR01CA0042.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::11) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB1947:EE_|BL3PR12MB6546:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d572dc5-ca4e-4eb6-4f7c-08daa0fb4d74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IOKYEYc2FdEdHMnXcQ+SqJCY0fAlcxcUSStHLDk9+wIBEWxaUQEff0EturQvOFxwnQ6LUg1DrvxdYNtVwiv8X5e0GqzsFmZQJKxfWdWO05typM17D+rJ5rtIpoe5n2J2YtM9GflmgFlg1G4HN33++A/KX5qT90PHCpHL0wXBjal7QIuTkYkcXrKBuYh56/tPF32zl1qKDMMdxxqmx47lCaRZ0C1GZqOrMpngZQvcQm1kFt0w63NwhVR9SLxBOL3vpadUUWK1cK2BJZvIDZBz6NhqsjfLjqdroTZ9DOYLq12mo00GUOcvAtTr9Juau2IC3T3P2aLuU3HkRTQ1lFF9zin3zPvnY2nEa7bqlD1Z7mpAMNYfLJpp0Jgs7JrV2QJjPMXRf8q4X6M2Suu40EDJFwiRCXkuoWuF0DtjB7bgfe+0+8hnK6Caddtbo8FAakpn0xvg1HETNSvkBQmrCRYVOwYITfUSPyeFqunpYNaBwkN1iLSugyQ9Dce+GqGd/uGPVxYyXhWMfZ91+CnKxohDndJKBMOxfDeGGrFclGulHX2bMA2jpJxkeY49/UQZN97nlYcwi0AuwjP4C8/wDNP94Zic8Fup+DXvb2ZpV7KoB1HFbKBwDrWjWqLEnTVzJO0NuzT8ZiXNdnjipQ+f5Mq+uKJi+afulBWd/xnCsAtbMG5OR//5PI7Swgc33hgPoqqB4nJ7Ms4gewM7buPV9kURD6rFyN65lVo1HRg/0d6605Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(451199015)(6506007)(41300700001)(53546011)(2906002)(38100700002)(6486002)(33964004)(478600001)(36756003)(235185007)(5660300002)(31686004)(6512007)(2616005)(8936002)(30864003)(186003)(31696002)(44832011)(316002)(8676002)(86362001)(4326008)(66946007)(66556008)(83380400001)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aG1ucFdoWU80S203eWJ1ODQrbW90d3l1YmVSWnZnMmdKYmxKNjloUENMZ2xz?=
 =?utf-8?B?S04rUU5lN3BZamZLYnZjeU0zTDBuU0pwZlVLbmxVOFNWWDZxSXN0Z2Q3V203?=
 =?utf-8?B?UFBpYml1dS8rYTJOQVFLVUdWZ3JMZlJZc3hoM0g3aFNUMk94aVlHLzZveXJO?=
 =?utf-8?B?SFFTRGdBZDE2S3pwYjdFTTZGamZEbXhSVVR4R0JWQVhGN0c2aW1UTU81elJy?=
 =?utf-8?B?Z2RYMHk2d2dDMUY2SW9EV21CRHpnbEhHWFF6VXJrbnc5aTUzK2Y4QXVWeUhp?=
 =?utf-8?B?U1hwT1VVb2VHaWo1RVdBT3JFQ1pYN2tielJFOVJ2cmJCVmcrRkVXRW94MDlj?=
 =?utf-8?B?a3ZreUI4bHhZb1RYZ0NiTWw3V3ZQa0cxd05LdnhQcE1BMjh3TVFmL0YxMHR6?=
 =?utf-8?B?QkpmR01TUU11T3kxbk5LR2JvYWt3SThlcjR6ZXBydk96bnRRbG5DK1Y5MWtq?=
 =?utf-8?B?YUg4L09xNCtTVEdqMFJ0c3E3ZVc5bXdWYVdJL2VFb2xrQ2ZMODZPMEs4Qmwy?=
 =?utf-8?B?MXFrKzFtRHJKZUt0dTRvcHkyYUxNbGE0VHNBeWk2aExkV2tmVW40NjY0U0w2?=
 =?utf-8?B?M1Zpczc2TzBpWlpWN3NQVDhNem9SNjNaNkhRRG5mTkZkZXE2TWlvL1Bwc1hS?=
 =?utf-8?B?aHFzT0lHd2UxUnVSWEM2UUlQbWx5YWFEMXU5WEw0TjMyWHpvd0NyZ3hNVXZH?=
 =?utf-8?B?RUN5c05udENWK1h1UDRnbENINmtJVGxSWUhXcWM2Mnl3UDJrbnFVcjJFZEZV?=
 =?utf-8?B?T3VmRFZtZ2tYUUk4Q1pIOHN2V2Z4SnBMc0s0YWwwNFdtK1JkbGZ6bkpBRDVr?=
 =?utf-8?B?SWtjYXZDZS9WNit5c0xuOUlnaE9UMzJmSWora0lONzBrbmNRNkdBLy8rLzJF?=
 =?utf-8?B?aXBEZGJiT2JCb3pPNEJBcWExT1ZPUGRTQVFUSmprbEdueE5ybktjNWpsQ3Js?=
 =?utf-8?B?YzBrMHNRUzhBcGwyQU9peUh6QmRVT3ZCMlhqYTJrbEc5Z09CN3VBcGQxOTN3?=
 =?utf-8?B?ZjNOd2QvN1lvaXViYlg0Mno1QmFTd1ZHeFZ5VEV6N0hyUzJsNWRiZG9sUjZo?=
 =?utf-8?B?QjBVNlZVaEEvaTJFc085WTBzWWFQQ3ZRTWtvN0ljUUM1aE5HY0xKM3Z6WkNV?=
 =?utf-8?B?NjIxZWtLU1dJcmdZL2JZcERwRHRSZ0lkNm5ZcnFiTXcwYXpkdjhNVTRaVHEz?=
 =?utf-8?B?bnB0c1IvcmJBWWo2Y1Ewb3NHWW4xWWRKemJaeC9XRHkzTGRMZExoNGViMEFy?=
 =?utf-8?B?dzByb3BwVFl3Vys2U2l5d29TQXFvZFNBdVVGWHNUMmpNaHVUZVRvSDVlU29B?=
 =?utf-8?B?Y2czYUJlMFJpd3JkYXU3eHdpenMwMlhWYlk1cEw2ZHhZNkc4TTB3b2NtWmJ6?=
 =?utf-8?B?RktsMGMxMm50U2ZGQ2FwVG5vajZxL2t5Nll3TGUxMERTakZQNW1NWFBwY1Mx?=
 =?utf-8?B?bFZ6QmowdUxabWNNemJhVkZrL2tIWkxMOW05VU5raEFUdFkwVEJyNDhDMnNp?=
 =?utf-8?B?WnZqVVFwT01wdDVRSm9nRis3Q1JhQ1V4WVpTWkZEdnhId1NpRm90VHZEMUN1?=
 =?utf-8?B?UXFMNUs3RHJ4d2h5RCtzZDVXT1kxejYxNW9JeDNXV2t0TUUyYkhONEt6YzZq?=
 =?utf-8?B?SG5SQ3A3S1M4ekMwQTdUY0JwZ04vZVlMNmp5SjFyOWFrM2pFZnJOUmdQdWYw?=
 =?utf-8?B?Q2ROaGE5UlRTRi9KWW5sa094YW80bVVOMkhTNkEzSFMzWENnYzdScXZNSDFS?=
 =?utf-8?B?U1BwdnFxWFQ5VE9vRlljM1BaWitDcmJFd2NaL2ZKRUlSVUtsbDlLNjhPeGlZ?=
 =?utf-8?B?ZGlmVklKZWg5ZEZwYXQ1cW5VYWhDQ3YveXpzM0Z2RlZuN0NRaXVUZkJKMDY2?=
 =?utf-8?B?TVZIZm1rZUo5NzlkUFp1SnB0MHFZeWhwK2w0K2JyaFV5bWFYZEJUTEozMTBG?=
 =?utf-8?B?RUI2SkNpQ3MvZURmUU90NmE5V05VSXNkQkdUY1JYejFLM3JXVUhSb2NoN3Ju?=
 =?utf-8?B?a09Wc1RySGx1UURCUUhSbzQzOTVZQWlnTWRQTXVJbXRmT0FzNEtVOTBLNGZE?=
 =?utf-8?B?OFhhYU5Qc1JPdDVpbGZpWGlrb0xnUGZyRTE0SzNHa1NycmVzWmJTVkMrVm5t?=
 =?utf-8?B?N3Q1Zi9HeXNEMFIyUnlQWllIeU9ZeHlBSTVCbzlzVXBIaW1BenVCMjdNdHZk?=
 =?utf-8?Q?NFC5ciiSHdRRzSbmKpnRUYvso8EZwXffOTO1P79UGxdP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d572dc5-ca4e-4eb6-4f7c-08daa0fb4d74
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 02:44:02.6487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ZxT+5O8OEov8Jm6vNFo0R3rrUZXgNwfBwP4dgtg+tHxvOZ/2+FhxomYXFdvR15K5bBcbb/fP9VaoZ6N18eh7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6546
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

--------------hpxQVHHM1gEWb7lOAiQCk0JU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hey, i have problems with my git-send today so i just attached V5 as a 
patch here.

Andrey

On 2022-09-27 19:56, Luben Tuikov wrote:
> Inlined:
>
> On 2022-09-22 12:15, Andrey Grodzovsky wrote:
>> On 2022-09-22 11:03, Luben Tuikov wrote:
>>> The title of this patch has "v3", but "v4" in the title prefix.
>>> If you're using "-v" to git-format-patch, please remove the "v3" from the title.
>>>
>>> Inlined:
>>>
>>> On 2022-09-21 14:28, Andrey Grodzovsky wrote:
>>>> When many entities competing for same run queue on
>>>> the same scheduler When many entities have  unacceptably long wait
>>>> time for some jobs waiting stuck in the run queue before being picked
>>>> up are observed (seen using  GPUVis).
>>> Use this as your opening:
>>>
>>> "When many entities are competing for the same run queue on the same scheduler,
>>> we observe an unusually long wait times and some jobs get starved. This has
>>> been observed on GPUVis."
>>>
>>>> The issue is due to the Round Robin policy used by schedulers
>>>> to pick up the next entity's job queue for execution. Under stress
>>>> of many entities and long job queues within entity some
>>>> jobs could be stack for very long time in it's entity's
>>> "stuck", not "stack".
>>>
>>>> queue before being popped from the queue and executed
>>>> while for other entities with smaller job queues a job
>>>> might execute earlier even though that job arrived later
>>>> then the job in the long queue.
>>>>      
>>>> Fix:
>>>> Add FIFO selection policy to entities in run queue, chose next entity
>>>> on run queue in such order that if job on one entity arrived
>>>> earlier then job on another entity the first job will start
>>>> executing earlier regardless of the length of the entity's job
>>>> queue.
>>>>      
>>>> v2:
>>>> Switch to rb tree structure for entities based on TS of
>>>> oldest job waiting in the job queue of an entity. Improves next
>>>> entity extraction to O(1). Entity TS update
>>>> O(log N) where N is the number of entities in the run-queue
>>>>      
>>>> Drop default option in module control parameter.
>>>>
>>>> v3:
>>>> Various cosmetical fixes and minor refactoring of fifo update function. (Luben)
>>>>
>>>> v4:
>>>> Switch drm_sched_rq_select_entity_fifo to in order search (Luben)
>>>>      
>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>> Tested-by: Li Yunxiang (Teddy) <Yunxiang.Li@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/scheduler/sched_entity.c |  26 +++++-
>>>>    drivers/gpu/drm/scheduler/sched_main.c   | 107 ++++++++++++++++++++++-
>>>>    include/drm/gpu_scheduler.h              |  32 +++++++
>>>>    3 files changed, 159 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> index 6b25b2f4f5a3..f3ffce3c9304 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> @@ -73,6 +73,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>>    	entity->priority = priority;
>>>>    	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
>>>>    	entity->last_scheduled = NULL;
>>>> +	RB_CLEAR_NODE(&entity->rb_tree_node);
>>>>    
>>>>    	if(num_sched_list)
>>>>    		entity->rq = &sched_list[0]->sched_rq[entity->priority];
>>>> @@ -417,14 +418,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>>>    
>>>>    	sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>>>>    	if (!sched_job)
>>>> -		return NULL;
>>>> +		goto skip;
>>>>    
>>>>    	while ((entity->dependency =
>>>>    			drm_sched_job_dependency(sched_job, entity))) {
>>>>    		trace_drm_sched_job_wait_dep(sched_job, entity->dependency);
>>>>    
>>>> -		if (drm_sched_entity_add_dependency_cb(entity))
>>>> -			return NULL;
>>>> +		if (drm_sched_entity_add_dependency_cb(entity)) {
>>>> +			sched_job = NULL;
>>>> +			goto skip;
>>>> +		}
>>>>    	}
>>>>    
>>>>    	/* skip jobs from entity that marked guilty */
>>>> @@ -443,6 +446,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>>>    	smp_wmb();
>>>>    
>>>>    	spsc_queue_pop(&entity->job_queue);
>>>> +
>>>> +	/*
>>>> +	 * It's when head job is extracted we can access the next job (or empty)
>>>> +	 * queue and update the entity location in the min heap accordingly.
>>>> +	 */
>>>> +skip:
>>>> +	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>>> +		drm_sched_rq_update_fifo(entity,
>>>> +					 (sched_job ? sched_job->submit_ts : ktime_get()));
>>>> +
>>>>    	return sched_job;
>>>>    }
>>>>    
>>>> @@ -502,11 +515,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>>>    {
>>>>    	struct drm_sched_entity *entity = sched_job->entity;
>>>>    	bool first;
>>>> +	ktime_t ts =  ktime_get();
>>>>    
>>>>    	trace_drm_sched_job(sched_job, entity);
>>>>    	atomic_inc(entity->rq->sched->score);
>>>>    	WRITE_ONCE(entity->last_user, current->group_leader);
>>>>    	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
>>>> +	sched_job->submit_ts = ts;
>>>>    
>>>>    	/* first job wakes up scheduler */
>>>>    	if (first) {
>>>> @@ -518,8 +533,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>>>    			DRM_ERROR("Trying to push to a killed entity\n");
>>>>    			return;
>>>>    		}
>>>> +
>>>>    		drm_sched_rq_add_entity(entity->rq, entity);
>>>>    		spin_unlock(&entity->rq_lock);
>>>> +
>>>> +		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>>> +			drm_sched_rq_update_fifo(entity, ts);
>>>> +
>>>>    		drm_sched_wakeup(entity->rq->sched);
>>>>    	}
>>>>    }
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index 4f2395d1a791..565707a1c5c7 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -62,6 +62,64 @@
>>>>    #define to_drm_sched_job(sched_job)		\
>>>>    		container_of((sched_job), struct drm_sched_job, queue_node)
>>>>    
>>>> +int drm_sched_policy = DRM_SCHED_POLICY_RR;
>>>> +
>>>> +/**
>>>> + * DOC: sched_policy (int)
>>>> + * Used to override default entities scheduling policy in a run queue.
>>>> + */
>>>> +MODULE_PARM_DESC(sched_policy,
>>>> +		 "specify schedule policy for entities on a runqueue (DRM_SCHED_POLICY_RR = Round Robin (default), DRM_SCHED_POLICY_FIFO  = use FIFO");
>>>> +module_param_named(sched_policy, drm_sched_policy, int, 0444);
>>>> +
>>>> +static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
>>>> +							    const struct rb_node *b)
>>>> +{
>>>> +	struct drm_sched_entity *ent_a =  rb_entry((a), struct drm_sched_entity, rb_tree_node);
>>>> +	struct drm_sched_entity *ent_b =  rb_entry((b), struct drm_sched_entity, rb_tree_node);
>>>> +
>>>> +	return ktime_before(ent_a->oldest_job_waiting, ent_b->oldest_job_waiting);
>>>> +}
>>>> +
>>>> +static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity)
>>>> +{
>>>> +	struct drm_sched_rq *rq = entity->rq;
>>>> +
>>>> +	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
>>>> +		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
>>>> +		RB_CLEAR_NODE(&entity->rb_tree_node);
>>>> +	}
>>>> +}
>>>> +
>>>> +static inline void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
>>>> +						   ktime_t ts)
>>>> +{
>>>> +	struct drm_sched_rq *rq = entity->rq;
>>>> +
>>>> +	drm_sched_rq_remove_fifo_locked(entity);
>>>> +
>>>> +	entity->oldest_job_waiting = ts;
>>>> +
>>>> +	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
>>>> +		      drm_sched_entity_compare_before);
>>>> +}
>>>> +
>>>> +void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
>>>> +{
>>>> +	/*
>>>> +	 * Both locks need to be grabbed, one to protect from entity->rq change
>>>> +	 * for entity from within concurrent drm_sched_entity_select_rq and the
>>>> +	 * other to update the rb tree structure.
>>>> +	 */
>>>> +	spin_lock(&entity->rq_lock);
>>>> +	spin_lock(&entity->rq->lock);
>>>> +
>>>> +	drm_sched_rq_update_fifo_locked(entity, ts);
>>>> +
>>>> +	spin_unlock(&entity->rq->lock);
>>>> +	spin_unlock(&entity->rq_lock);
>>>> +}
>>> I thought you were going to drop one of the locks here?
>>> Address this by either updating the comment to explain to future programmers
>>> what is going on here and why the locking is not consistent (2 vs 1 lock),
>>> or drop one of the locks, as per my previous review.
>>
>> Note that after last review drm_sched_rq_update_fifo_locked is not
>> called anywhere
>> besides drm_sched_rq_update_fifo and so becomes obsolete and I will
>> remove it now.
>> In this case the double locking above is consistent and the reason is
>> explained in the
>> comment above.
> WHen you say "it's consistent" you mean it's being done from other places, I suppose.
>
>
>>
>>>> +
>>>>    /**
>>>>     * drm_sched_rq_init - initialize a given run queue struct
>>>>     *
>>>> @@ -75,6 +133,7 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>>>>    {
>>>>    	spin_lock_init(&rq->lock);
>>>>    	INIT_LIST_HEAD(&rq->entities);
>>>> +	rq->rb_tree_root = RB_ROOT_CACHED;
>>>>    	rq->current_entity = NULL;
>>>>    	rq->sched = sched;
>>>>    }
>>>> @@ -92,9 +151,12 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>>>>    {
>>>>    	if (!list_empty(&entity->list))
>>>>    		return;
>>>> +
>>>>    	spin_lock(&rq->lock);
>>>> +
>>>>    	atomic_inc(rq->sched->score);
>>>>    	list_add_tail(&entity->list, &rq->entities);
>>>> +
>>>>    	spin_unlock(&rq->lock);
>>>>    }
>>>>    
>>>> @@ -111,23 +173,30 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>>    {
>>>>    	if (list_empty(&entity->list))
>>>>    		return;
>>>> +
>>>>    	spin_lock(&rq->lock);
>>>> +
>>>>    	atomic_dec(rq->sched->score);
>>>>    	list_del_init(&entity->list);
>>>> +
>>>>    	if (rq->current_entity == entity)
>>>>    		rq->current_entity = NULL;
>>>> +
>>>> +	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>>> +		drm_sched_rq_remove_fifo_locked(entity);
>>>> +
>>>>    	spin_unlock(&rq->lock);
>>>>    }
>>>>    
>>>>    /**
>>>> - * drm_sched_rq_select_entity - Select an entity which could provide a job to run
>>>> + * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>>>>     *
>>>>     * @rq: scheduler run queue to check.
>>>>     *
>>>>     * Try to find a ready entity, returns NULL if none found.
>>>>     */
>>>>    static struct drm_sched_entity *
>>>> -drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>>>> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>>    {
>>>>    	struct drm_sched_entity *entity;
>>>>    
>>>> @@ -163,6 +232,36 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>>>>    	return NULL;
>>>>    }
>>>>    
>>>> +/**
>>>> + * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
>>>> + *
>>>> + * @rq: scheduler run queue to check.
>>>> + *
>>>> + * Find oldest waiting ready entity, returns NULL if none found.
>>>> + */
>>>> +static struct drm_sched_entity *
>>>> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>> +{
>>>> +	struct rb_node *rb;
>>>> +	bool found = false;
>>>> +	struct drm_sched_entity *entity;
>>>> +
>>>> +	spin_lock(&rq->lock);
>>>> +	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
>>>> +		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>>>> +
>>>> +		if (drm_sched_entity_is_ready(entity)) {
>>>> +			rq->current_entity = entity;
>>>> +			reinit_completion(&entity->entity_idle);
>>>> +			found = true;
>>>> +			break;
>>>> +		}
>>>> +	}
>>>> +	spin_unlock(&rq->lock);
>>>> +
>>>> +	return found ? entity : NULL;
>>>> +}
>>> You really don't need "found", and you don't need "entity" to be outside the loop.
>>>
>>> As per my last review, use this (which I've compiled and run):
>>>
>>> static struct drm_sched_entity *
>>> drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>> {
>>> 	struct rb_node *rb;
>>>
>>> 	spin_lock(&rq->lock);
>>> 	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
>>> 		struct drm_sched_entity *entity;
>>>
>>> 		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>>> 		if (drm_sched_entity_is_ready(entity)) {
>>> 			rq->current_entity = entity;
>>> 			reinit_completion(&entity->entity_idle);
>>> 			break;
>>> 		}
>>> 	}
>>> 	spin_unlock(&rq->lock);
>>>
>>> 	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
>>> }
>>>
>>> The only way we can exit the loop is,
>>> 1. The loop invariant is false, i.e. rb == NULL, or
>>> 2. The "break;" jump from inside the if () inside the loop.
>>>
>>> Also note that "rb" does NOT need to be initialized, since, the for() statement
>>> is always executed, and the assignment "rb = rb_first_cached(&rq->rb_tree_root);"
>>> initializes it--this is why GCC doesn't complain :-)
>>>
>>> Also note that you don't need to export "entity" as it makes the for() loop relocatable
>>> to another function with only having a dependency on "rb" being defined--the loop
>>> is self-contained.
>>>
>>> At the "return" statement, we know that we've exited the loop, by either the loop
>>> invariant being false, i.e. rb == NULL, or by the "break;" jump, in which case
>>> we know that rb != NULL. This is why the "return;" statement as presented above works
>>> correctly.
>>>
>>> Please use that function in the way it is above, which is minimal and mature.
>>
>> Makes sense, missed the point that at the end rb will be set to NULL
> Yeah, use the loop as I've written it above.
>
> Okay, send out v5.
>
> Regards,
> Luben
>
>> Andrey
>>
>>
>>> Regards,
>>> Luben
>>>
>>>> +
>>>>    /**
>>>>     * drm_sched_job_done - complete a job
>>>>     * @s_job: pointer to the job which is done
>>>> @@ -803,7 +902,9 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>>>    
>>>>    	/* Kernel run queue has higher priority than normal run queue*/
>>>>    	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>>> -		entity = drm_sched_rq_select_entity(&sched->sched_rq[i]);
>>>> +		entity = drm_sched_policy != DRM_SCHED_POLICY_FIFO ?
>>>> +				drm_sched_rq_select_entity_rr(&sched->sched_rq[i]) :
>>>> +				drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]);
>>>>    		if (entity)
>>>>    			break;
>>>>    	}
>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>> index 599855c6a672..1f7d9dd1a444 100644
>>>> --- a/include/drm/gpu_scheduler.h
>>>> +++ b/include/drm/gpu_scheduler.h
>>>> @@ -50,6 +50,12 @@ enum drm_sched_priority {
>>>>    	DRM_SCHED_PRIORITY_UNSET = -2
>>>>    };
>>>>    
>>>> +/* Used to chose between FIFO and RR jobs scheduling */
>>>> +extern int drm_sched_policy;
>>>> +
>>>> +#define DRM_SCHED_POLICY_RR    0
>>>> +#define DRM_SCHED_POLICY_FIFO  1
>>>> +
>>>>    /**
>>>>     * struct drm_sched_entity - A wrapper around a job queue (typically
>>>>     * attached to the DRM file_priv).
>>>> @@ -196,6 +202,21 @@ struct drm_sched_entity {
>>>>    	 * drm_sched_entity_fini().
>>>>    	 */
>>>>    	struct completion		entity_idle;
>>>> +
>>>> +	/**
>>>> +	 * @oldest_job_waiting:
>>>> +	 *
>>>> +	 * Marks earliest job waiting in SW queue
>>>> +	 */
>>>> +	ktime_t				oldest_job_waiting;
>>>> +
>>>> +	/**
>>>> +	 * @rb_tree_node:
>>>> +	 *
>>>> +	 * The node used to insert this entity into time based priority queue
>>>> +	 */
>>>> +	struct rb_node			rb_tree_node;
>>>> +
>>>>    };
>>>>    
>>>>    /**
>>>> @@ -205,6 +226,7 @@ struct drm_sched_entity {
>>>>     * @sched: the scheduler to which this rq belongs to.
>>>>     * @entities: list of the entities to be scheduled.
>>>>     * @current_entity: the entity which is to be scheduled.
>>>> + * @rb_tree_root: root of time based priory queue of entities for FIFO scheduling
>>>>     *
>>>>     * Run queue is a set of entities scheduling command submissions for
>>>>     * one specific ring. It implements the scheduling policy that selects
>>>> @@ -215,6 +237,7 @@ struct drm_sched_rq {
>>>>    	struct drm_gpu_scheduler	*sched;
>>>>    	struct list_head		entities;
>>>>    	struct drm_sched_entity		*current_entity;
>>>> +	struct rb_root_cached		rb_tree_root;
>>>>    };
>>>>    
>>>>    /**
>>>> @@ -314,6 +337,13 @@ struct drm_sched_job {
>>>>    
>>>>    	/** @last_dependency: tracks @dependencies as they signal */
>>>>    	unsigned long			last_dependency;
>>>> +
>>>> +	/**
>>>> +	 * @submit_ts:
>>>> +	 *
>>>> +	 * When the job was pushed into the entity queue.
>>>> +	 */
>>>> +	ktime_t                         submit_ts;
>>>>    };
>>>>    
>>>>    static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
>>>> @@ -503,6 +533,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>>>>    void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>>    				struct drm_sched_entity *entity);
>>>>    
>>>> +void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts);
>>>> +
>>>>    int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>>    			  enum drm_sched_priority priority,
>>>>    			  struct drm_gpu_scheduler **sched_list,
--------------hpxQVHHM1gEWb7lOAiQCk0JU
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-sched-Add-FIFO-sched-policy-to-run-queue.patch"
Content-Disposition: attachment;
 filename="0001-drm-sched-Add-FIFO-sched-policy-to-run-queue.patch"
Content-Transfer-Encoding: base64

RnJvbSAwZWRlMmRlMzBiMDY5YjljNjczYzQ3ZDU3YzRhMDY1MDYyZTA0MGZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lA
YW1kLmNvbT4KRGF0ZTogRnJpLCAyOSBKdWwgMjAyMiAxMjoyNjo1MCAtMDQwMApTdWJqZWN0OiBk
cm0vc2NoZWQ6IEFkZCBGSUZPIHNjaGVkIHBvbGljeSB0byBydW4gcXVldWUKTUlNRS1WZXJzaW9u
OiAxLjAKQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJh
bnNmZXItRW5jb2Rpbmc6IDhiaXQKCldoZW4gbWFueSBlbnRpdGllcyBhcmUgY29tcGV0aW5nIGZv
ciB0aGUgc2FtZSBydW4gcXVldWUKb24gdGhlIHNhbWUgc2NoZWR1bGVyLCB3ZSBvYnNlcnZlIGFu
IHVudXN1YWxseSBsb25nIHdhaXQKdGltZXMgYW5kIHNvbWUgam9icyBnZXQgc3RhcnZlZC4gVGhp
cyBoYXMgYmVlbiBvYnNlcnZlZCBvbiBHUFVWaXMuCgpUaGUgaXNzdWUgaXMgZHVlIHRvIHRoZSBS
b3VuZCBSb2JpbiBwb2xpY3kgdXNlZCBieSBzY2hlZHVsZXJzCnRvIHBpY2sgdXAgdGhlIG5leHQg
ZW50aXR5J3Mgam9iIHF1ZXVlIGZvciBleGVjdXRpb24uIFVuZGVyIHN0cmVzcwpvZiBtYW55IGVu
dGl0aWVzIGFuZCBsb25nIGpvYiBxdWV1ZXMgd2l0aGluIGVudGl0eSBzb21lCmpvYnMgY291bGQg
YmUgc3R1Y2sgZm9yIHZlcnkgbG9uZyB0aW1lIGluIGl0J3MgZW50aXR5J3MKcXVldWUgYmVmb3Jl
IGJlaW5nIHBvcHBlZCBmcm9tIHRoZSBxdWV1ZSBhbmQgZXhlY3V0ZWQKd2hpbGUgZm9yIG90aGVy
IGVudGl0aWVzIHdpdGggc21hbGxlciBqb2IgcXVldWVzIGEgam9iCm1pZ2h0IGV4ZWN1dGUgZWFy
bGllciBldmVuIHRob3VnaCB0aGF0IGpvYiBhcnJpdmVkIGxhdGVyCnRoZW4gdGhlIGpvYiBpbiB0
aGUgbG9uZyBxdWV1ZS4KwqAgwqAKRml4OgpBZGQgRklGTyBzZWxlY3Rpb24gcG9saWN5IHRvIGVu
dGl0aWVzIGluIHJ1biBxdWV1ZSwgY2hvc2UgbmV4dCBlbnRpdHkKb24gcnVuIHF1ZXVlIGluIHN1
Y2ggb3JkZXIgdGhhdCBpZiBqb2Igb24gb25lIGVudGl0eSBhcnJpdmVkCmVhcmxpZXIgdGhlbiBq
b2Igb24gYW5vdGhlciBlbnRpdHkgdGhlIGZpcnN0IGpvYiB3aWxsIHN0YXJ0CmV4ZWN1dGluZyBl
YXJsaWVyIHJlZ2FyZGxlc3Mgb2YgdGhlIGxlbmd0aCBvZiB0aGUgZW50aXR5J3Mgam9iCnF1ZXVl
LgrCoCDCoAp2MjoKU3dpdGNoIHRvIHJiIHRyZWUgc3RydWN0dXJlIGZvciBlbnRpdGllcyBiYXNl
ZCBvbiBUUyBvZgpvbGRlc3Qgam9iIHdhaXRpbmcgaW4gdGhlIGpvYiBxdWV1ZSBvZiBhbiBlbnRp
dHkuIEltcHJvdmVzIG5leHQKZW50aXR5IGV4dHJhY3Rpb24gdG8gTygxKS4gRW50aXR5IFRTIHVw
ZGF0ZQpPKGxvZyBOKSB3aGVyZSBOIGlzIHRoZSBudW1iZXIgb2YgZW50aXRpZXMgaW4gdGhlIHJ1
bi1xdWV1ZQrCoCDCoApEcm9wIGRlZmF1bHQgb3B0aW9uIGluIG1vZHVsZSBjb250cm9sIHBhcmFt
ZXRlci4KCnYzOgpWYXJpb3VzIGNvc21ldGljYWwgZml4ZXMgYW5kIG1pbm9yIHJlZmFjdG9yaW5n
IG9mIGZpZm8gdXBkYXRlIGZ1bmN0aW9uLiAoTHViZW4pCgp2NDoKU3dpdGNoIGRybV9zY2hlZF9y
cV9zZWxlY3RfZW50aXR5X2ZpZm8gdG8gaW4gb3JkZXIgc2VhcmNoIChMdWJlbikKCnY1OiBGaXgg
dXAgZHJtX3NjaGVkX3JxX3NlbGVjdF9lbnRpdHlfZmlmbyBsb29wCsKgIMKgClNpZ25lZC1vZmYt
Ynk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgpUZXN0ZWQt
Ynk6IExpIFl1bnhpYW5nIChUZWRkeSkgPFl1bnhpYW5nLkxpQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYyB8IDI2ICsrKysrKy0KIGRyaXZlcnMv
Z3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jICAgfCA5OSArKysrKysrKysrKysrKysrKysr
KysrKy0KIGluY2x1ZGUvZHJtL2dwdV9zY2hlZHVsZXIuaCAgICAgICAgICAgICAgfCAzMiArKysr
KysrKwogMyBmaWxlcyBjaGFuZ2VkLCAxNTEgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jIGIv
ZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYwppbmRleCA2YjI1YjJmNGY1
YTMuLmYzZmZjZTNjOTMwNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9z
Y2hlZF9lbnRpdHkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0
eS5jCkBAIC03Myw2ICs3Myw3IEBAIGludCBkcm1fc2NoZWRfZW50aXR5X2luaXQoc3RydWN0IGRy
bV9zY2hlZF9lbnRpdHkgKmVudGl0eSwKIAllbnRpdHktPnByaW9yaXR5ID0gcHJpb3JpdHk7CiAJ
ZW50aXR5LT5zY2hlZF9saXN0ID0gbnVtX3NjaGVkX2xpc3QgPiAxID8gc2NoZWRfbGlzdCA6IE5V
TEw7CiAJZW50aXR5LT5sYXN0X3NjaGVkdWxlZCA9IE5VTEw7CisJUkJfQ0xFQVJfTk9ERSgmZW50
aXR5LT5yYl90cmVlX25vZGUpOwogCiAJaWYobnVtX3NjaGVkX2xpc3QpCiAJCWVudGl0eS0+cnEg
PSAmc2NoZWRfbGlzdFswXS0+c2NoZWRfcnFbZW50aXR5LT5wcmlvcml0eV07CkBAIC00MTcsMTQg
KzQxOCwxNiBAQCBzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqZHJtX3NjaGVkX2VudGl0eV9wb3Bfam9i
KHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5ICplbnRpdHkpCiAKIAlzY2hlZF9qb2IgPSB0b19kcm1f
c2NoZWRfam9iKHNwc2NfcXVldWVfcGVlaygmZW50aXR5LT5qb2JfcXVldWUpKTsKIAlpZiAoIXNj
aGVkX2pvYikKLQkJcmV0dXJuIE5VTEw7CisJCWdvdG8gc2tpcDsKIAogCXdoaWxlICgoZW50aXR5
LT5kZXBlbmRlbmN5ID0KIAkJCWRybV9zY2hlZF9qb2JfZGVwZW5kZW5jeShzY2hlZF9qb2IsIGVu
dGl0eSkpKSB7CiAJCXRyYWNlX2RybV9zY2hlZF9qb2Jfd2FpdF9kZXAoc2NoZWRfam9iLCBlbnRp
dHktPmRlcGVuZGVuY3kpOwogCi0JCWlmIChkcm1fc2NoZWRfZW50aXR5X2FkZF9kZXBlbmRlbmN5
X2NiKGVudGl0eSkpCi0JCQlyZXR1cm4gTlVMTDsKKwkJaWYgKGRybV9zY2hlZF9lbnRpdHlfYWRk
X2RlcGVuZGVuY3lfY2IoZW50aXR5KSkgeworCQkJc2NoZWRfam9iID0gTlVMTDsKKwkJCWdvdG8g
c2tpcDsKKwkJfQogCX0KIAogCS8qIHNraXAgam9icyBmcm9tIGVudGl0eSB0aGF0IG1hcmtlZCBn
dWlsdHkgKi8KQEAgLTQ0Myw2ICs0NDYsMTYgQEAgc3RydWN0IGRybV9zY2hlZF9qb2IgKmRybV9z
Y2hlZF9lbnRpdHlfcG9wX2pvYihzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAqZW50aXR5KQogCXNt
cF93bWIoKTsKIAogCXNwc2NfcXVldWVfcG9wKCZlbnRpdHktPmpvYl9xdWV1ZSk7CisKKwkvKgor
CSAqIEl0J3Mgd2hlbiBoZWFkIGpvYiBpcyBleHRyYWN0ZWQgd2UgY2FuIGFjY2VzcyB0aGUgbmV4
dCBqb2IgKG9yIGVtcHR5KQorCSAqIHF1ZXVlIGFuZCB1cGRhdGUgdGhlIGVudGl0eSBsb2NhdGlv
biBpbiB0aGUgbWluIGhlYXAgYWNjb3JkaW5nbHkuCisJICovCitza2lwOgorCWlmIChkcm1fc2No
ZWRfcG9saWN5ID09IERSTV9TQ0hFRF9QT0xJQ1lfRklGTykKKwkJZHJtX3NjaGVkX3JxX3VwZGF0
ZV9maWZvKGVudGl0eSwKKwkJCQkJIChzY2hlZF9qb2IgPyBzY2hlZF9qb2ItPnN1Ym1pdF90cyA6
IGt0aW1lX2dldCgpKSk7CisKIAlyZXR1cm4gc2NoZWRfam9iOwogfQogCkBAIC01MDIsMTEgKzUx
NSwxMyBAQCB2b2lkIGRybV9zY2hlZF9lbnRpdHlfcHVzaF9qb2Ioc3RydWN0IGRybV9zY2hlZF9q
b2IgKnNjaGVkX2pvYikKIHsKIAlzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAqZW50aXR5ID0gc2No
ZWRfam9iLT5lbnRpdHk7CiAJYm9vbCBmaXJzdDsKKwlrdGltZV90IHRzID0gIGt0aW1lX2dldCgp
OwogCiAJdHJhY2VfZHJtX3NjaGVkX2pvYihzY2hlZF9qb2IsIGVudGl0eSk7CiAJYXRvbWljX2lu
YyhlbnRpdHktPnJxLT5zY2hlZC0+c2NvcmUpOwogCVdSSVRFX09OQ0UoZW50aXR5LT5sYXN0X3Vz
ZXIsIGN1cnJlbnQtPmdyb3VwX2xlYWRlcik7CiAJZmlyc3QgPSBzcHNjX3F1ZXVlX3B1c2goJmVu
dGl0eS0+am9iX3F1ZXVlLCAmc2NoZWRfam9iLT5xdWV1ZV9ub2RlKTsKKwlzY2hlZF9qb2ItPnN1
Ym1pdF90cyA9IHRzOwogCiAJLyogZmlyc3Qgam9iIHdha2VzIHVwIHNjaGVkdWxlciAqLwogCWlm
IChmaXJzdCkgewpAQCAtNTE4LDggKzUzMywxMyBAQCB2b2lkIGRybV9zY2hlZF9lbnRpdHlfcHVz
aF9qb2Ioc3RydWN0IGRybV9zY2hlZF9qb2IgKnNjaGVkX2pvYikKIAkJCURSTV9FUlJPUigiVHJ5
aW5nIHRvIHB1c2ggdG8gYSBraWxsZWQgZW50aXR5XG4iKTsKIAkJCXJldHVybjsKIAkJfQorCiAJ
CWRybV9zY2hlZF9ycV9hZGRfZW50aXR5KGVudGl0eS0+cnEsIGVudGl0eSk7CiAJCXNwaW5fdW5s
b2NrKCZlbnRpdHktPnJxX2xvY2spOworCisJCWlmIChkcm1fc2NoZWRfcG9saWN5ID09IERSTV9T
Q0hFRF9QT0xJQ1lfRklGTykKKwkJCWRybV9zY2hlZF9ycV91cGRhdGVfZmlmbyhlbnRpdHksIHRz
KTsKKwogCQlkcm1fc2NoZWRfd2FrZXVwKGVudGl0eS0+cnEtPnNjaGVkKTsKIAl9CiB9CmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyBiL2RyaXZlcnMv
Z3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCmluZGV4IDRmMjM5NWQxYTc5MS4uNTM0OWZj
MDQ5Mzg0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4u
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwpAQCAtNjIsNiAr
NjIsNTggQEAKICNkZWZpbmUgdG9fZHJtX3NjaGVkX2pvYihzY2hlZF9qb2IpCQlcCiAJCWNvbnRh
aW5lcl9vZigoc2NoZWRfam9iKSwgc3RydWN0IGRybV9zY2hlZF9qb2IsIHF1ZXVlX25vZGUpCiAK
K2ludCBkcm1fc2NoZWRfcG9saWN5ID0gRFJNX1NDSEVEX1BPTElDWV9SUjsKKworLyoqCisgKiBE
T0M6IHNjaGVkX3BvbGljeSAoaW50KQorICogVXNlZCB0byBvdmVycmlkZSBkZWZhdWx0IGVudGl0
aWVzIHNjaGVkdWxpbmcgcG9saWN5IGluIGEgcnVuIHF1ZXVlLgorICovCitNT0RVTEVfUEFSTV9E
RVNDKHNjaGVkX3BvbGljeSwKKwkJICJzcGVjaWZ5IHNjaGVkdWxlIHBvbGljeSBmb3IgZW50aXRp
ZXMgb24gYSBydW5xdWV1ZSAoRFJNX1NDSEVEX1BPTElDWV9SUiA9IFJvdW5kIFJvYmluIChkZWZh
dWx0KSwgRFJNX1NDSEVEX1BPTElDWV9GSUZPICA9IHVzZSBGSUZPIik7Cittb2R1bGVfcGFyYW1f
bmFtZWQoc2NoZWRfcG9saWN5LCBkcm1fc2NoZWRfcG9saWN5LCBpbnQsIDA0NDQpOworCitzdGF0
aWMgX19hbHdheXNfaW5saW5lIGJvb2wgZHJtX3NjaGVkX2VudGl0eV9jb21wYXJlX2JlZm9yZShz
dHJ1Y3QgcmJfbm9kZSAqYSwKKwkJCQkJCQkgICAgY29uc3Qgc3RydWN0IHJiX25vZGUgKmIpCit7
CisJc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKmVudF9hID0gIHJiX2VudHJ5KChhKSwgc3RydWN0
IGRybV9zY2hlZF9lbnRpdHksIHJiX3RyZWVfbm9kZSk7CisJc3RydWN0IGRybV9zY2hlZF9lbnRp
dHkgKmVudF9iID0gIHJiX2VudHJ5KChiKSwgc3RydWN0IGRybV9zY2hlZF9lbnRpdHksIHJiX3Ry
ZWVfbm9kZSk7CisKKwlyZXR1cm4ga3RpbWVfYmVmb3JlKGVudF9hLT5vbGRlc3Rfam9iX3dhaXRp
bmcsIGVudF9iLT5vbGRlc3Rfam9iX3dhaXRpbmcpOworfQorCitzdGF0aWMgaW5saW5lIHZvaWQg
ZHJtX3NjaGVkX3JxX3JlbW92ZV9maWZvX2xvY2tlZChzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAq
ZW50aXR5KQoreworCXN0cnVjdCBkcm1fc2NoZWRfcnEgKnJxID0gZW50aXR5LT5ycTsKKworCWlm
ICghUkJfRU1QVFlfTk9ERSgmZW50aXR5LT5yYl90cmVlX25vZGUpKSB7CisJCXJiX2VyYXNlX2Nh
Y2hlZCgmZW50aXR5LT5yYl90cmVlX25vZGUsICZycS0+cmJfdHJlZV9yb290KTsKKwkJUkJfQ0xF
QVJfTk9ERSgmZW50aXR5LT5yYl90cmVlX25vZGUpOworCX0KK30KKwordm9pZCBkcm1fc2NoZWRf
cnFfdXBkYXRlX2ZpZm8oc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSwga3RpbWVfdCB0
cykKK3sKKwlzdHJ1Y3QgZHJtX3NjaGVkX3JxICpycTsKKworCS8qCisJICogQm90aCBsb2NrcyBu
ZWVkIHRvIGJlIGdyYWJiZWQsIG9uZSB0byBwcm90ZWN0IGZyb20gZW50aXR5LT5ycSBjaGFuZ2UK
KwkgKiBmb3IgZW50aXR5IGZyb20gd2l0aGluIGNvbmN1cnJlbnQgZHJtX3NjaGVkX2VudGl0eV9z
ZWxlY3RfcnEgYW5kIHRoZQorCSAqIG90aGVyIHRvIHVwZGF0ZSB0aGUgcmIgdHJlZSBzdHJ1Y3R1
cmUuCisJICovCisJc3Bpbl9sb2NrKCZlbnRpdHktPnJxX2xvY2spOworCXNwaW5fbG9jaygmZW50
aXR5LT5ycS0+bG9jayk7CisKKwlycSA9IGVudGl0eS0+cnE7CisKKwllbnRpdHktPm9sZGVzdF9q
b2Jfd2FpdGluZyA9IHRzOworCisJcmJfYWRkX2NhY2hlZCgmZW50aXR5LT5yYl90cmVlX25vZGUs
ICZycS0+cmJfdHJlZV9yb290LAorCQkgICAgICBkcm1fc2NoZWRfZW50aXR5X2NvbXBhcmVfYmVm
b3JlKTsKKworCXNwaW5fdW5sb2NrKCZlbnRpdHktPnJxLT5sb2NrKTsKKwlzcGluX3VubG9jaygm
ZW50aXR5LT5ycV9sb2NrKTsKK30KKwogLyoqCiAgKiBkcm1fc2NoZWRfcnFfaW5pdCAtIGluaXRp
YWxpemUgYSBnaXZlbiBydW4gcXVldWUgc3RydWN0CiAgKgpAQCAtNzUsNiArMTI3LDcgQEAgc3Rh
dGljIHZvaWQgZHJtX3NjaGVkX3JxX2luaXQoc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hl
ZCwKIHsKIAlzcGluX2xvY2tfaW5pdCgmcnEtPmxvY2spOwogCUlOSVRfTElTVF9IRUFEKCZycS0+
ZW50aXRpZXMpOworCXJxLT5yYl90cmVlX3Jvb3QgPSBSQl9ST09UX0NBQ0hFRDsKIAlycS0+Y3Vy
cmVudF9lbnRpdHkgPSBOVUxMOwogCXJxLT5zY2hlZCA9IHNjaGVkOwogfQpAQCAtOTIsOSArMTQ1
LDEyIEBAIHZvaWQgZHJtX3NjaGVkX3JxX2FkZF9lbnRpdHkoc3RydWN0IGRybV9zY2hlZF9ycSAq
cnEsCiB7CiAJaWYgKCFsaXN0X2VtcHR5KCZlbnRpdHktPmxpc3QpKQogCQlyZXR1cm47CisKIAlz
cGluX2xvY2soJnJxLT5sb2NrKTsKKwogCWF0b21pY19pbmMocnEtPnNjaGVkLT5zY29yZSk7CiAJ
bGlzdF9hZGRfdGFpbCgmZW50aXR5LT5saXN0LCAmcnEtPmVudGl0aWVzKTsKKwogCXNwaW5fdW5s
b2NrKCZycS0+bG9jayk7CiB9CiAKQEAgLTExMSwyMyArMTY3LDMwIEBAIHZvaWQgZHJtX3NjaGVk
X3JxX3JlbW92ZV9lbnRpdHkoc3RydWN0IGRybV9zY2hlZF9ycSAqcnEsCiB7CiAJaWYgKGxpc3Rf
ZW1wdHkoJmVudGl0eS0+bGlzdCkpCiAJCXJldHVybjsKKwogCXNwaW5fbG9jaygmcnEtPmxvY2sp
OworCiAJYXRvbWljX2RlYyhycS0+c2NoZWQtPnNjb3JlKTsKIAlsaXN0X2RlbF9pbml0KCZlbnRp
dHktPmxpc3QpOworCiAJaWYgKHJxLT5jdXJyZW50X2VudGl0eSA9PSBlbnRpdHkpCiAJCXJxLT5j
dXJyZW50X2VudGl0eSA9IE5VTEw7CisKKwlpZiAoZHJtX3NjaGVkX3BvbGljeSA9PSBEUk1fU0NI
RURfUE9MSUNZX0ZJRk8pCisJCWRybV9zY2hlZF9ycV9yZW1vdmVfZmlmb19sb2NrZWQoZW50aXR5
KTsKKwogCXNwaW5fdW5sb2NrKCZycS0+bG9jayk7CiB9CiAKIC8qKgotICogZHJtX3NjaGVkX3Jx
X3NlbGVjdF9lbnRpdHkgLSBTZWxlY3QgYW4gZW50aXR5IHdoaWNoIGNvdWxkIHByb3ZpZGUgYSBq
b2IgdG8gcnVuCisgKiBkcm1fc2NoZWRfcnFfc2VsZWN0X2VudGl0eV9yciAtIFNlbGVjdCBhbiBl
bnRpdHkgd2hpY2ggY291bGQgcHJvdmlkZSBhIGpvYiB0byBydW4KICAqCiAgKiBAcnE6IHNjaGVk
dWxlciBydW4gcXVldWUgdG8gY2hlY2suCiAgKgogICogVHJ5IHRvIGZpbmQgYSByZWFkeSBlbnRp
dHksIHJldHVybnMgTlVMTCBpZiBub25lIGZvdW5kLgogICovCiBzdGF0aWMgc3RydWN0IGRybV9z
Y2hlZF9lbnRpdHkgKgotZHJtX3NjaGVkX3JxX3NlbGVjdF9lbnRpdHkoc3RydWN0IGRybV9zY2hl
ZF9ycSAqcnEpCitkcm1fc2NoZWRfcnFfc2VsZWN0X2VudGl0eV9ycihzdHJ1Y3QgZHJtX3NjaGVk
X3JxICpycSkKIHsKIAlzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAqZW50aXR5OwogCkBAIC0xNjMs
NiArMjI2LDM0IEBAIGRybV9zY2hlZF9ycV9zZWxlY3RfZW50aXR5KHN0cnVjdCBkcm1fc2NoZWRf
cnEgKnJxKQogCXJldHVybiBOVUxMOwogfQogCisvKioKKyAqIGRybV9zY2hlZF9ycV9zZWxlY3Rf
ZW50aXR5X2ZpZm8gLSBTZWxlY3QgYW4gZW50aXR5IHdoaWNoIHByb3ZpZGVzIGEgam9iIHRvIHJ1
bgorICoKKyAqIEBycTogc2NoZWR1bGVyIHJ1biBxdWV1ZSB0byBjaGVjay4KKyAqCisgKiBGaW5k
IG9sZGVzdCB3YWl0aW5nIHJlYWR5IGVudGl0eSwgcmV0dXJucyBOVUxMIGlmIG5vbmUgZm91bmQu
CisgKi8KK3N0YXRpYyBzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAqCitkcm1fc2NoZWRfcnFfc2Vs
ZWN0X2VudGl0eV9maWZvKHN0cnVjdCBkcm1fc2NoZWRfcnEgKnJxKQoreworCXN0cnVjdCByYl9u
b2RlICpyYjsKKworCXNwaW5fbG9jaygmcnEtPmxvY2spOworCWZvciAocmIgPSByYl9maXJzdF9j
YWNoZWQoJnJxLT5yYl90cmVlX3Jvb3QpOyByYjsgcmIgPSByYl9uZXh0KHJiKSkgeworCQlzdHJ1
Y3QgZHJtX3NjaGVkX2VudGl0eSAqZW50aXR5OworCisJCWVudGl0eSA9IHJiX2VudHJ5KHJiLCBz
dHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSwgcmJfdHJlZV9ub2RlKTsKKwkJaWYgKGRybV9zY2hlZF9l
bnRpdHlfaXNfcmVhZHkoZW50aXR5KSkgeworCQkJcnEtPmN1cnJlbnRfZW50aXR5ID0gZW50aXR5
OworCQkJcmVpbml0X2NvbXBsZXRpb24oJmVudGl0eS0+ZW50aXR5X2lkbGUpOworCQkJYnJlYWs7
CisJCX0KKwl9CisJc3Bpbl91bmxvY2soJnJxLT5sb2NrKTsKKworCXJldHVybiByYiA/IHJiX2Vu
dHJ5KHJiLCBzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSwgcmJfdHJlZV9ub2RlKSA6IE5VTEw7Cit9
CisKIC8qKgogICogZHJtX3NjaGVkX2pvYl9kb25lIC0gY29tcGxldGUgYSBqb2IKICAqIEBzX2pv
YjogcG9pbnRlciB0byB0aGUgam9iIHdoaWNoIGlzIGRvbmUKQEAgLTgwMyw3ICs4OTQsOSBAQCBk
cm1fc2NoZWRfc2VsZWN0X2VudGl0eShzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkKQog
CiAJLyogS2VybmVsIHJ1biBxdWV1ZSBoYXMgaGlnaGVyIHByaW9yaXR5IHRoYW4gbm9ybWFsIHJ1
biBxdWV1ZSovCiAJZm9yIChpID0gRFJNX1NDSEVEX1BSSU9SSVRZX0NPVU5UIC0gMTsgaSA+PSBE
Uk1fU0NIRURfUFJJT1JJVFlfTUlOOyBpLS0pIHsKLQkJZW50aXR5ID0gZHJtX3NjaGVkX3JxX3Nl
bGVjdF9lbnRpdHkoJnNjaGVkLT5zY2hlZF9ycVtpXSk7CisJCWVudGl0eSA9IGRybV9zY2hlZF9w
b2xpY3kgIT0gRFJNX1NDSEVEX1BPTElDWV9GSUZPID8KKwkJCQlkcm1fc2NoZWRfcnFfc2VsZWN0
X2VudGl0eV9ycigmc2NoZWQtPnNjaGVkX3JxW2ldKSA6CisJCQkJZHJtX3NjaGVkX3JxX3NlbGVj
dF9lbnRpdHlfZmlmbygmc2NoZWQtPnNjaGVkX3JxW2ldKTsKIAkJaWYgKGVudGl0eSkKIAkJCWJy
ZWFrOwogCX0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2dwdV9zY2hlZHVsZXIuaCBiL2luY2x1
ZGUvZHJtL2dwdV9zY2hlZHVsZXIuaAppbmRleCA1OTk4NTVjNmE2NzIuLjFmN2Q5ZGQxYTQ0NCAx
MDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZ3B1X3NjaGVkdWxlci5oCisrKyBiL2luY2x1ZGUvZHJt
L2dwdV9zY2hlZHVsZXIuaApAQCAtNTAsNiArNTAsMTIgQEAgZW51bSBkcm1fc2NoZWRfcHJpb3Jp
dHkgewogCURSTV9TQ0hFRF9QUklPUklUWV9VTlNFVCA9IC0yCiB9OwogCisvKiBVc2VkIHRvIGNo
b3NlIGJldHdlZW4gRklGTyBhbmQgUlIgam9icyBzY2hlZHVsaW5nICovCitleHRlcm4gaW50IGRy
bV9zY2hlZF9wb2xpY3k7CisKKyNkZWZpbmUgRFJNX1NDSEVEX1BPTElDWV9SUiAgICAwCisjZGVm
aW5lIERSTV9TQ0hFRF9QT0xJQ1lfRklGTyAgMQorCiAvKioKICAqIHN0cnVjdCBkcm1fc2NoZWRf
ZW50aXR5IC0gQSB3cmFwcGVyIGFyb3VuZCBhIGpvYiBxdWV1ZSAodHlwaWNhbGx5CiAgKiBhdHRh
Y2hlZCB0byB0aGUgRFJNIGZpbGVfcHJpdikuCkBAIC0xOTYsNiArMjAyLDIxIEBAIHN0cnVjdCBk
cm1fc2NoZWRfZW50aXR5IHsKIAkgKiBkcm1fc2NoZWRfZW50aXR5X2ZpbmkoKS4KIAkgKi8KIAlz
dHJ1Y3QgY29tcGxldGlvbgkJZW50aXR5X2lkbGU7CisKKwkvKioKKwkgKiBAb2xkZXN0X2pvYl93
YWl0aW5nOgorCSAqCisJICogTWFya3MgZWFybGllc3Qgam9iIHdhaXRpbmcgaW4gU1cgcXVldWUK
KwkgKi8KKwlrdGltZV90CQkJCW9sZGVzdF9qb2Jfd2FpdGluZzsKKworCS8qKgorCSAqIEByYl90
cmVlX25vZGU6CisJICoKKwkgKiBUaGUgbm9kZSB1c2VkIHRvIGluc2VydCB0aGlzIGVudGl0eSBp
bnRvIHRpbWUgYmFzZWQgcHJpb3JpdHkgcXVldWUKKwkgKi8KKwlzdHJ1Y3QgcmJfbm9kZQkJCXJi
X3RyZWVfbm9kZTsKKwogfTsKIAogLyoqCkBAIC0yMDUsNiArMjI2LDcgQEAgc3RydWN0IGRybV9z
Y2hlZF9lbnRpdHkgewogICogQHNjaGVkOiB0aGUgc2NoZWR1bGVyIHRvIHdoaWNoIHRoaXMgcnEg
YmVsb25ncyB0by4KICAqIEBlbnRpdGllczogbGlzdCBvZiB0aGUgZW50aXRpZXMgdG8gYmUgc2No
ZWR1bGVkLgogICogQGN1cnJlbnRfZW50aXR5OiB0aGUgZW50aXR5IHdoaWNoIGlzIHRvIGJlIHNj
aGVkdWxlZC4KKyAqIEByYl90cmVlX3Jvb3Q6IHJvb3Qgb2YgdGltZSBiYXNlZCBwcmlvcnkgcXVl
dWUgb2YgZW50aXRpZXMgZm9yIEZJRk8gc2NoZWR1bGluZwogICoKICAqIFJ1biBxdWV1ZSBpcyBh
IHNldCBvZiBlbnRpdGllcyBzY2hlZHVsaW5nIGNvbW1hbmQgc3VibWlzc2lvbnMgZm9yCiAgKiBv
bmUgc3BlY2lmaWMgcmluZy4gSXQgaW1wbGVtZW50cyB0aGUgc2NoZWR1bGluZyBwb2xpY3kgdGhh
dCBzZWxlY3RzCkBAIC0yMTUsNiArMjM3LDcgQEAgc3RydWN0IGRybV9zY2hlZF9ycSB7CiAJc3Ry
dWN0IGRybV9ncHVfc2NoZWR1bGVyCSpzY2hlZDsKIAlzdHJ1Y3QgbGlzdF9oZWFkCQllbnRpdGll
czsKIAlzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eQkJKmN1cnJlbnRfZW50aXR5OworCXN0cnVjdCBy
Yl9yb290X2NhY2hlZAkJcmJfdHJlZV9yb290OwogfTsKIAogLyoqCkBAIC0zMTQsNiArMzM3LDEz
IEBAIHN0cnVjdCBkcm1fc2NoZWRfam9iIHsKIAogCS8qKiBAbGFzdF9kZXBlbmRlbmN5OiB0cmFj
a3MgQGRlcGVuZGVuY2llcyBhcyB0aGV5IHNpZ25hbCAqLwogCXVuc2lnbmVkIGxvbmcJCQlsYXN0
X2RlcGVuZGVuY3k7CisKKwkvKioKKwkgKiBAc3VibWl0X3RzOgorCSAqCisJICogV2hlbiB0aGUg
am9iIHdhcyBwdXNoZWQgaW50byB0aGUgZW50aXR5IHF1ZXVlLgorCSAqLworCWt0aW1lX3QgICAg
ICAgICAgICAgICAgICAgICAgICAgc3VibWl0X3RzOwogfTsKIAogc3RhdGljIGlubGluZSBib29s
IGRybV9zY2hlZF9pbnZhbGlkYXRlX2pvYihzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc19qb2IsCkBA
IC01MDMsNiArNTMzLDggQEAgdm9pZCBkcm1fc2NoZWRfcnFfYWRkX2VudGl0eShzdHJ1Y3QgZHJt
X3NjaGVkX3JxICpycSwKIHZvaWQgZHJtX3NjaGVkX3JxX3JlbW92ZV9lbnRpdHkoc3RydWN0IGRy
bV9zY2hlZF9ycSAqcnEsCiAJCQkJc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSk7CiAK
K3ZvaWQgZHJtX3NjaGVkX3JxX3VwZGF0ZV9maWZvKHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5ICpl
bnRpdHksIGt0aW1lX3QgdHMpOworCiBpbnQgZHJtX3NjaGVkX2VudGl0eV9pbml0KHN0cnVjdCBk
cm1fc2NoZWRfZW50aXR5ICplbnRpdHksCiAJCQkgIGVudW0gZHJtX3NjaGVkX3ByaW9yaXR5IHBy
aW9yaXR5LAogCQkJICBzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKipzY2hlZF9saXN0LAotLSAK
Mi4yNS4xCgo=

--------------hpxQVHHM1gEWb7lOAiQCk0JU--
