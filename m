Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BE17075DA
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 01:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E6410E4A1;
	Wed, 17 May 2023 23:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFBA10E2D7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 23:02:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AV8UQVB1NPY2sLPgfynxeF2qLs1sOfiazOSPSooEKa4PVVch10BawFvds0CZSBMIhBSZL4u5xlUuerpe7pTGFK0kkwVecSOLAn8v6eAqBq6Qbj0kEuf3a0q0KtZEfez1mw9IXnAgVX2zJ+WnV04o+rMRfxJB1+7YRjaske0g7nTD03HJYVnOn7gCfas/rBoUsqo46dPkBmGAuxEXJXWtyFsdTdePK6clt7bmBpYWL6eAK3ElYDctTs2P/rPNGrwhpvAxw8Mi2EZVD84m35vXlMVFUuRd9qatVadP4SFdVK0mFMc8vTBHlHilXMDk+34NVpdnrVQG0s+B7HzexWnJJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/FSWkOQ0tbY6sZG4E87r2YPHbscZLQnuqzg3SMu68Y=;
 b=FlkiEmUVFG0eKcIGy8MtmUq8g6rqfFB8PWpOH6plKsUsahfPlUqVUjHg33omq07BlCNxJWq9s0MHNSwMukmjqs55Wi4yj4j1nmGKt2jcTjVEAHK6Dul4iWSqXQ0fLZhqhwNq0XVFTUJj/aWpxP6UvspTlvNH0gAmFnXnFV5gWaKt6w+2AYgH7ef8pbs+auLiI8vA4738eQ29VC9E40+fGzkA3gxpPVNuangPhE4xOON0/JGPEw21fq9mCd4vKkK0ozzdKf4FCQ/BP53HcHEoXFJmdRL37OQy/Q3xg/j8UTZq36+O+hhz2V+cIrTt7EdSIOnMklclDGyYnNdaHwfvLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/FSWkOQ0tbY6sZG4E87r2YPHbscZLQnuqzg3SMu68Y=;
 b=juQMjRlkoFKrOzazX/Qp03JqxKY1ub+du9Q0ynAxH5HJJU6w2vc3i22BmJGr6D2C0yG/phl6PiZNe5SLfQ1OuDr/Ujve3bYeU3SG6CYQ0zV9YjlnJNVRNuYvEBT8fThHUQlYDmHAKAkg0JiEdh2x8Rdf846rqzBZJqYMpDwdEkw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 PH7PR12MB6881.namprd12.prod.outlook.com (2603:10b6:510:1b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24; Wed, 17 May
 2023 23:02:52 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310%7]) with mapi id 15.20.6411.017; Wed, 17 May 2023
 23:02:52 +0000
Message-ID: <128e898f-eece-38cf-07c2-e3ddae57231d@amd.com>
Date: Wed, 17 May 2023 19:02:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-CA, en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20230517190356.349044-1-luben.tuikov@amd.com>
 <20230517190356.349044-2-luben.tuikov@amd.com>
 <CADnq5_MHqGG1wrneuKCOcrv=yqswBp6_TxTCdZbBa7MZi5SqBw@mail.gmail.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH 2/2] drm/sched: Rename to drm_sched_wakeup_if_canqueue()
In-Reply-To: <CADnq5_MHqGG1wrneuKCOcrv=yqswBp6_TxTCdZbBa7MZi5SqBw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0128.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::26) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|PH7PR12MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: adebeec0-a843-4f42-102b-08db572ad79e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qKa7u8guLxZcjnopIY/1h/t43elWNHClfQnNi3Go1P/Pwb/Jgw0n5a2ZVp6NPdx4ni6oCkqBnwJZoT7MN6LA5EUITL7bkIw5kVDivmnOCzMEmn0wIy222Q91HmzueBDVAMdZyizZwNT+X6gqacQXnBbhFKtZ8QSndaAz97F7mPx34q/FSWLGKGJFv/nCMx3Rpb7eheP7EoswQY7cdcNP0GlWIquVc6jOJW7LFxl2Sb6sBGOtgefILI0xT7ANMG+ul1USI1FNATA8WJpcOz6Td6EPF2PN44hwaR1J/Cu/NT3+KsqkCsWaV7NC34KnL4sP33FPuSLkj5PTpzx84f1eJqZWWSTkQJ2GeA/h/DQEWFpwVVySWAQlh9c1y8mSqU2qOjg/U5FYk6Ji30DYHD88vUfL6tNm1Z/ISGvRYnvRKZ6EJb9IuLK10qhoimRA/g2PoQGP0ImU6AxvLdVSAOl9UxSjw0WT5MxNl7RDl+lwnPvitAlZfs9Ka8/mV+5E0jIq05z3DeDzCHVXInmrflGvQOuCe3I7UcykLeijpb0R4nlPSw+VYxHR7fWr7mwK1LzINolsy9nyDDsF+P6AqPb4AXdScG44hL3K6VfMDxCUDA+ykxv64vcf0hop82MVcHftWDq+5qQaBFO4sCdJhQ9wvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(451199021)(31686004)(4326008)(66556008)(478600001)(6486002)(66946007)(66476007)(316002)(54906003)(6916009)(86362001)(36756003)(66574015)(83380400001)(186003)(2616005)(53546011)(6506007)(26005)(6512007)(31696002)(8676002)(5660300002)(44832011)(2906002)(41300700001)(38100700002)(8936002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWNpck81Zm9JOFdNSE1mOW43SlcyOW05K1FPZlViSVpjYW5YN092SThKNUpJ?=
 =?utf-8?B?ZHhzU1B3eEkwT3lkYzRxTC8zYTJja05RQW4xVDcvb0U0Y1hSYXJxQ21xVlJR?=
 =?utf-8?B?dnpPY3UvWW81dXE4bGxEbGhSQUt4WUdYNWdTR0dUcU1GWlBBdlJsdVVKUC90?=
 =?utf-8?B?TE1HcEV1aTd2MFpKM3BDaVFacEtXbi96ZVJSOEtCcmI5Zkx4Z1FYSFZCYThN?=
 =?utf-8?B?ZnBOR3NBcEt5SzU5b01IRVhON0MvelppcGgrMERoSWxWRklIand6YjBWaldo?=
 =?utf-8?B?c0Jnc0dQNE1LRTc2M201TkRrYWZZUlFWTHZwMnJnU0RSOUNteXBCSGNvZTZJ?=
 =?utf-8?B?WGlYb1AxdVVsbEp1NThjdGR5K0R5RVJjemZodDJGZUdTZG5MQlBqZDNTSkZG?=
 =?utf-8?B?ay9tWTVnZnVWZGc1SjFrNGVyNHgyODJrSUhEWWVocUdhaEpvN3JmKzJLc2s1?=
 =?utf-8?B?WWRsallIOE9FeUVIblMwN1FMYkFTQmRDbDczVHZKb0hNWnVWdmxKRWhld2ZB?=
 =?utf-8?B?MjROUXlkcVFQbVJwODBQc3daOStCYmxqSi9nb0czNHFuaWIrMnI1bW5NTmUy?=
 =?utf-8?B?MTNkbGFuQzI0UEQvUi96Z05PWU05OTYzbFc3SDdMemJkS1ZTNWZXSmdhRm9r?=
 =?utf-8?B?ZGxXdkd5NkM2L0NDSVRUWFlPeUlmaHl5aVJNWVUwekdxc2w2Q0YyaWdpTWdN?=
 =?utf-8?B?RzdNYlg4Lzl6UUdTK0lUTklWNWRleE5abFdkMWhCQWhBSVNXUTRIN3hSNHhR?=
 =?utf-8?B?enI1OEVxb0dia0RKOWdycVZVZ3crRkVyd3JnbVpuMEpIZlpEMnZCMnFCWjJk?=
 =?utf-8?B?RXpMRkhmMlBqM1RiNU0yNjJpSzNVWXAzcFVMbUxSQU8rMnFkT09vaXpUT095?=
 =?utf-8?B?ZUpNcS9MSVRkSVJydVdObGdBZ1FJL2JtL2JYY1hOTUhtWVlRS2FEdyt4K0pC?=
 =?utf-8?B?aHcreHVId3NuaEl2NFhacU5ZVVRsazVUb1FlNlV5K1c4VGROSnpPWDMrclkx?=
 =?utf-8?B?KzZMNE90Q2NrT1hUdDZoNTQxOTVlSTUraWZMbW85UHdYSStEWnlLQmxYZ3lu?=
 =?utf-8?B?eUJGSXFFOXdvQXp5c2YySXh2Tzc3cXZOcEtaa3FHck1PcEdKeGpYb09VKzho?=
 =?utf-8?B?OEdmdlQzNkFpSjBET0xycy9kYlR4WEdtWnBlYXZoSmdHWTlhY05wWVJucVB2?=
 =?utf-8?B?a2NFNjVweGU4QWJVYXhrVzcvWk1rSmh4MlNVbXRRaHBGd0wxVXNUMDZoVUVL?=
 =?utf-8?B?cUF5WDlsSkR0RUtvTFYydjNJb1FEdjczU2UvMzJpTDFFYU1DdzVOdDRsSTRQ?=
 =?utf-8?B?Y1NFOFBXMm9sRGlLKzlROUlnVlBEbER4bTdRRFdiWktuQU1XUzZCU3RvN1U2?=
 =?utf-8?B?eEhuOVl0MUUxME9pVGpwN0pZSGxJZXlpR1ltUHF3VmFBWWJjcXVTV05uMTVU?=
 =?utf-8?B?a2FxTGFuZUhzVHpVNkROeHZZY1F5a0Nac3FQS3RycDVqdXdmblBBcVgyVlh4?=
 =?utf-8?B?UHFSOHQwclNjcDFySERTeCtPM2MzTW1EbE15T1VmK3JTZ0FFWDd1SXJ2K0Na?=
 =?utf-8?B?Y1IyNzlJTkdGcDB6L0tqVGRmb1U1ZFVpUHh5RUxPNnhsS0JGd1VoenovSEc3?=
 =?utf-8?B?cHZWbTV3V0dsa09Rbk5NVjlNV3gvNkNNQm9JK2R5eGgwVWQxSnl5WkdsaXRQ?=
 =?utf-8?B?OUJUamxUQzRaRmZTcFRONWdVdlBQUVlFcVBpeitJa05nbHhpM0xhWDUvKytD?=
 =?utf-8?B?VjdRZC9YZ3JMMk1JaFRvR2trQm42bGs2MVBsRTlIL0lxTEZySGdrTTdRdFM4?=
 =?utf-8?B?MmRVVmhOSjMwSHh3RlhpbTRVZWM1VCt6NEZQVFBObkF3dlYveGhJTnJOVkIw?=
 =?utf-8?B?ZjhlMlNuTzg1OVBNa0NSajM0c3BBUk9pYXdNaDdhQTVsSk8rNFM3V2s5bXRV?=
 =?utf-8?B?R0RUN0JpWWpMUEJGU1dTNVBaQU5xNE9MVDNmRFB5UThJa2hjZUUyVkt0U1pB?=
 =?utf-8?B?U2MvN0h6S1N1WVl6MSswbE9jb3BaZlNRa0dNY2E0dGtlbGtkOXY5a2szd0dX?=
 =?utf-8?B?OHFVcC9nSERYTm9BS2J4TldFa3BtOWxyaEhXMTMyOFB5QTBTMDh1WWdWK2ZF?=
 =?utf-8?Q?anb4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adebeec0-a843-4f42-102b-08db572ad79e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 23:02:52.2845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cXONnEKCEgQBEvnUfOUA032RDhmnEE/9Vulo2qu8Soz4BbARyAChSFRbrzR9Gb6F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6881
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-17 16:43, Alex Deucher wrote:
> On Wed, May 17, 2023 at 3:04 PM Luben Tuikov <luben.tuikov@amd.com> wrote:
>>
>> Rename drm_sched_wakeup() to drm_sched_wakeup_if_canqueue() since the former
> 
> I think drm_sched_wakeup_if_can_queue() looks cleaner.

Yeah, I can change it to this--I was concerned of too many underscores in the name.
(I was also considering drm_sched_wakeup_queue_cond() to mean "wake up if
we can queue conditionally...)

Regards,
Luben

> 
> Alex
> 
>> is misleading, as it wakes up the GPU scheduler _only if_ more jobs can be
>> queued to the underlying hardware.
>>
>> This distinction is important to make, since the wake conditional in the GPU
>> scheduler thread wakes up when other conditions are also true, e.g. when there
>> are jobs to be cleaned. For instance, a user might want to wake up the
>> scheduler only because there are more jobs to clean, but whether we can queue
>> more jobs is irrelevant.
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Alex Deucher <Alexander.Deucher@amd.com>
>> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
>> ---
>>  drivers/gpu/drm/scheduler/sched_entity.c | 4 ++--
>>  drivers/gpu/drm/scheduler/sched_main.c   | 6 +++---
>>  include/drm/gpu_scheduler.h              | 2 +-
>>  3 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>> index cfb433e9200586..371b44fb4bacf4 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -342,7 +342,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
>>                 container_of(cb, struct drm_sched_entity, cb);
>>
>>         drm_sched_entity_clear_dep(f, cb);
>> -       drm_sched_wakeup(entity->rq->sched);
>> +       drm_sched_wakeup_if_canqueue(entity->rq->sched);
>>  }
>>
>>  /**
>> @@ -565,7 +565,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>                 if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>                         drm_sched_rq_update_fifo(entity, submit_ts);
>>
>> -               drm_sched_wakeup(entity->rq->sched);
>> +               drm_sched_wakeup_if_canqueue(entity->rq->sched);
>>         }
>>  }
>>  EXPORT_SYMBOL(drm_sched_entity_push_job);
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 8739322c30321b..f437dbe62112cc 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -860,12 +860,12 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>>  }
>>
>>  /**
>> - * drm_sched_wakeup - Wake up the scheduler when it is ready
>> - *
>> + * drm_sched_wakeup_if_canqueue - Wake up the scheduler
>>   * @sched: scheduler instance
>>   *
>> + * Wake up the scheduler if we can queue jobs.
>>   */
>> -void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
>> +void drm_sched_wakeup_if_canqueue(struct drm_gpu_scheduler *sched)
>>  {
>>         if (drm_sched_can_queue(sched))
>>                 wake_up_interruptible(&sched->wake_up_worker);
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 31d1f5166c79fe..a05dd01e264842 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -549,7 +549,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>>                                     unsigned int num_sched_list);
>>
>>  void drm_sched_job_cleanup(struct drm_sched_job *job);
>> -void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
>> +void drm_sched_wakeup_if_canqueue(struct drm_gpu_scheduler *sched);
>>  void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
>>  void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
>>  void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
>> --
>> 2.40.1
>>

