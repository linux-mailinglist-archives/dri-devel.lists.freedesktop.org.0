Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AF9717B73
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 11:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F70D10E1BC;
	Wed, 31 May 2023 09:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC5110E1BC
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 09:11:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WshKUeGImAaGFBFfiyTHqv35F0RqD9+7NQMff+NT2FWYhIFAoaxt0Ita42IZ7C2Q3QwrbZF2xDobWyNMkSpx1MFQVcfltQOesvZZKDJkFUPT2LbN9svukU43fVbqfR+GWZwBa/00YOpRphYq03ee496MIj+iMiH6jM2XgeuhRpaA5N5IznEHbS6HJgIaXSBg6wXoY1z2cVXlEQZ/vzwBv4qEdl0boHImYpDQBTHIydaL+if6J2wvqdp7xus45J+LndBgHYEqG9JR4V28s12LK3Rsr6g6O8miuYMXfNy2pb8BrKO06NmIhfTvTKmwNoaQqkHNrO5sLXF8RSUS3Gpyhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XhdXai1jo8TZjsppjujCwLpmJRnP018oYNAydIQfiVo=;
 b=JUUACxiTRO/7S7bHKbYSBy8Z2v8ndI6WTIVn3E71DXhWIlSs885XKbOGLZO6t0MBTx1ZoEXY/+5fR6LR8TwoBm470A6fwc1rSTla02YPuh1yQSBdhXFMme0NgIwggRvDgowSfb/cLsjU7V84PCtrsYd9cO4Z3Ak4Sp3D84caP5sBXRVTQi2wTiwhfhJ/4xboQ19cugWAkR68v2C4T7B9TtvOhkhDUrn9CMA4nTbX8cLvpwjft3/Gp22Rd769md0TgnVHqZPLnz+YunqO02TCbJpUx8Es8+45ByZYRR7/0iqcPlDNeG226WzGIEYRh7Kzzn/D3QXM5NJPpAl23JwI7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhdXai1jo8TZjsppjujCwLpmJRnP018oYNAydIQfiVo=;
 b=0tIkE9BGY+K8975K0e05vpRJ+G3saD8BNfA2MUNnBjxxXlrGT9zXhb5UwNffMYd7xYRiJDqZl6bXEo166tdqpNBjaJY40nQx3rezrw39N2Ai7MTllWo6aar/gIFZFxsggKCZpCKSUnCo3Cq0V6RB9XW2/Sp1JtOgbT7W9yJAM7M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH3PR12MB8355.namprd12.prod.outlook.com (2603:10b6:610:131::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Wed, 31 May
 2023 09:11:55 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::907f:26e2:673a:2ad2]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::907f:26e2:673a:2ad2%6]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 09:11:55 +0000
Message-ID: <8a83394b-87a0-7fbf-7280-fd3af78ea1f8@amd.com>
Date: Wed, 31 May 2023 11:11:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] drm/sched: Rename to drm_sched_wakeup_if_can_queue()
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>
References: <20230517233550.377847-1-luben.tuikov@amd.com>
 <20230517233550.377847-2-luben.tuikov@amd.com>
 <34ee5d50-d8ac-0ce3-cf60-418ca6888294@amd.com>
 <CADnq5_NM1J7ZTF3ab6f9dzXygjBMiQvG4jPJgPcAdSmOseq7rg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_NM1J7ZTF3ab6f9dzXygjBMiQvG4jPJgPcAdSmOseq7rg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH3PR12MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: 709a52b8-01ab-4663-db45-08db61b7141c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fFS8MalvBYuJJ/Gf2v8K9NXAhdyqzJuawPSp/KqDbOYnoL1uIBtqkOfvXYXHmnooGeltiYez/O+69/6HsjZwNBEktwcRnRfFY4UNrQAUS2T6X24/MRIMZ5w6o+SziQ/+ESGmS6XPNLYCvLXXgz7ZCJD+9c/Nq4mTcr+tk+fsQs0yr3B1gQZcE497Khl76K2k9VHIzDer8q2maJr5lFmJXO+hFINLMvcuaiyC+tpuhVe/BikS0M3J0UcrRBN3idaIvBQk8Rfo7Qwl/dYVcnqHNChra8mn+ck5mz2cKE1NvQ9RwAn9JYkR16VnLRarwWDO6UBbZSm9FADlnPi2FXBWG3sGI1gOhiTvCh4vIzgZofc8/c8zSVzuxuiu82ImYGUQdtfUf/FqQVUyjJ4NOB6sTgK0IBI4wdi856D2splMcQpAmMrditjXwkFylWQACgTJv7boQ62qAE32aWxckoQqBsQSag3f2gWj7rxFH5Rn4Ope3JQOr6mh/m2JpiraN4MAzrgPTXdTkv5M/vKke6u3h+01tjdOWdVGyzdeQBYCO0BPa/KVCQGzGaH6CtsGCGyt6RfXhYQ8lD2Qt/pGR6iXnblvWOMr6Dgpbai5tRg+d620sOEE0SqEubQ39aNlNxw2yIIb9q1lDVlHyo0NhySQ9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199021)(2906002)(6486002)(31686004)(41300700001)(186003)(31696002)(86362001)(38100700002)(8936002)(8676002)(2616005)(478600001)(53546011)(110136005)(54906003)(6512007)(6666004)(316002)(6506007)(83380400001)(66574015)(66946007)(4326008)(36756003)(66556008)(66476007)(6636002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFJ5aXNFaXZudDIvWUErT2c4V3lSYmlHVnRGUFlHZG9zNm1xQUNGS0ZpTE9X?=
 =?utf-8?B?dlM1Wk95R0hNcitRZ1ROc0RWcDE5SlRQSmw1bzRhM2hhZVl4ZmhUcE1SRWwz?=
 =?utf-8?B?K2JITktVRXhhU1pCYWxnSXE5RjQ2Sk1DQ3l2S1VFMjBlelBTLzg4V3ZtaHpB?=
 =?utf-8?B?a2pzYkFLTzNCYStHb09GbDJoQjIrcExGdUZMMDBtbjAxbHB0UXBPRDVXZEJN?=
 =?utf-8?B?TEo3UEFYZTVtS1B3T2t3Y3ZVSHFKUnBWN3ZLOEgyQU13d1EyNml0VEJhY0c2?=
 =?utf-8?B?SlRVTEJrMTJOWmg1ZE9ybEFDQ0FQaVRLS2V4T0o5U0pzeGhxSUEyanRKOGRL?=
 =?utf-8?B?TUxuemhlOWZ6cU8yZDBxWWQrSzBkYktLMVIyT3E5VzMrWkJkaGE0d2ZjNGg5?=
 =?utf-8?B?SFYyRVM5NTFnWjhlemhBcVI2cElvK1QzM1V6dkpVMGtSMTByaW5yK0NqU2tH?=
 =?utf-8?B?djViR09KZGZzZTlabThNdU1JMFF3WmkwbmN2ZnBRbEZzdUJnVDdCL202blMz?=
 =?utf-8?B?Qndpa0NLN1kwSFQwMGRLdXpkbnE5bE9xLzFoZHdiT1BrQXZxNVpZQ1RvdG9F?=
 =?utf-8?B?WFJlbEJaNWh6QnFyeXlFUUNoWktRbFJpemFia20vamJsSXg2Vk5OQVNEMFhq?=
 =?utf-8?B?dnNOazdKQXhiYjhPaTJWcDFKM3dJVGtPdlpBVzVJMnFxTzlMeU9uYXhRb2dv?=
 =?utf-8?B?N0hINlJoSFk2NU5sWEFrRUlnYkU5dTFzSnVpTWZWaG5oNzlFc1QrbkhHbHpI?=
 =?utf-8?B?a3k2cmg5eG4ybGZvUXlPaXBRQnI1dHZRY0xqQzdISWNOS0YxZURUWWwwM3cr?=
 =?utf-8?B?WEhBbmsvd2w1bWpHZm02Z2FPSWF6azBlNThhMXcrTjlUSDh5amlSME5OekM0?=
 =?utf-8?B?MDZhZWVOdFUwVTNkNS9mY1B2dkFuUkFtbVIzNjVwTy9Bd21Zb3hjSCtuditU?=
 =?utf-8?B?blgyT1E4RWZuc3ZmTGF0dkw3T3BEM2l5UFR4TnFuRWpaTzR6bWgwN2dYTk9a?=
 =?utf-8?B?Mjh3RHk2UE9icVNzczJlUXlWMUJZalhURmVubTBsMWVReHJGL2UycEp3Z1Ax?=
 =?utf-8?B?RU9OQjRtYUU1VnZzdXFVS1JIRVpwZlY4eDlQVWFKbUorK2ZGckxoZkIrY2hV?=
 =?utf-8?B?TmdrSVBNZE42ZjBHamhycFlOUis5Tk9GOWVBNDc2N0NUQkx2RDRzdGZEc1dK?=
 =?utf-8?B?V3BDWGU2SUl3VmtuWE0vNFNvSldMQUYwYTBvRk53amdQM2lnNmg0MFBqU3A5?=
 =?utf-8?B?ZXZIMmxJaWU1WmtOTm9FeUdHUmdKOTdnNDNrN2FMSjlsUE9KQ0FKclBsVUJ5?=
 =?utf-8?B?T0hUWHlUS3BtYTdkMGtjVHptNkthTXIxaXg2RGt6WVdER1dwL2VDWDF6M29M?=
 =?utf-8?B?ampKTUNUamZaRjJ3TjZ6YjVpZnpVR0I4bW1CaUM5UkpyM3FHbmQzdGhsU2VU?=
 =?utf-8?B?VW05ZndyR1g3NUNzWW10MnlLU2gxdWJKWFd6MndteXBKcEJyMXE5WDlDOEJC?=
 =?utf-8?B?bGxYbmVYNC96SVltSGVpd0VUU2dVL21pN2I5OTVRVFlZVGQ3SGFjbFYzTVpn?=
 =?utf-8?B?eGJjajFKTUJrUDIzdUdhZmY5aE15OFk5RjMyclRMcUxjMVp3NXFsN1ZGTmh2?=
 =?utf-8?B?QUYvQVZBZTF2aDBSOXRjT3NyKzJpSm9TM3Noa1hiaU96WGhxak42QVFKSUFJ?=
 =?utf-8?B?VlRPcWx1WDlnWGZWQ21NUVhaamVORkhMWjM0YU1UUkJDRGMybElUOGlQOHpP?=
 =?utf-8?B?USt4WEZJSWZxSkpBNUFqRy9NZnNZYnJ5WTI0dUg0QzFEaVVYVElqLzhRaTdy?=
 =?utf-8?B?YkYwcE0vb3ZLSDh2ZnpDNnl1d0NwaUd1N0xqUVhVcUo0djZkRG5LTjBya2dH?=
 =?utf-8?B?M1JNb1lEc0dnazZhRVdCckdVRnBsWVFVcEhqNTF3cjZEQzNrT1pWVVRKM2k5?=
 =?utf-8?B?SjVkMmZEN2hXR2FFWmNHRlh1T2RVTWROdlRkS0NxcmVFbVI3MjdRaVdIRE95?=
 =?utf-8?B?cDVNeUFxdWdxM1JjYXVLdUJKcUZDTVhMMTdEQjhVUFpCdGlxeUxDdlhpS2Mx?=
 =?utf-8?B?REMxcnZCWC9jSXhhQzNHbWo5MURVQ29xVGpkeDRCMnJKcGIzOXZ6WG1PUjNx?=
 =?utf-8?B?RXI0dU9SdnRGSGVOakkzanFXdi8ySTNIdUEzUGFaRUIxMkxVb0Vuc0xmd3VZ?=
 =?utf-8?Q?9la2kYAX1T4M1D0caLL0Vo2wV5u41q8o8HZ7/imSZua+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 709a52b8-01ab-4663-db45-08db61b7141c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 09:11:54.9922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b5syKGF9hKYRXNoId+hKtaorQORSq7amyig4SWORe6tQT6GysNfmiSKkWzEQFfXf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8355
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
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks good to me as well, but I'm wondering if we shouldn't just always 
wake the scheduler up here.

Christian.

Am 19.05.23 um 15:41 schrieb Alex Deucher:
> Series is:
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>
> On Thu, May 18, 2023 at 9:03 AM Luben Tuikov <luben.tuikov@amd.com> wrote:
>> On 2023-05-17 19:35, Luben Tuikov wrote:
>>> Rename drm_sched_wakeup() to drm_sched_wakeup_if_canqueue() since the former
>>> is misleading, as it wakes up the GPU scheduler _only if_ more jobs can be
>>> queued to the underlying hardware.
>>>
>>> This distinction is important to make, since the wake conditional in the GPU
>>> scheduler thread wakes up when other conditions are also true, e.g. when there
>>> are jobs to be cleaned. For instance, a user might want to wake up the
>>> scheduler only because there are more jobs to clean, but whether we can queue
>>> more jobs is irrelevant.
>>>
>>> v2: Separate "canqueue" to "can_queue". (Alex D.)
>>>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Alex Deucher <Alexander.Deucher@amd.com>
>>> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
>> ^ ping!
>>
>> Regards,
>> Luben
>>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_entity.c | 4 ++--
>>>   drivers/gpu/drm/scheduler/sched_main.c   | 6 +++---
>>>   include/drm/gpu_scheduler.h              | 2 +-
>>>   3 files changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index cfb433e9200586..68e807ae136ad8 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -342,7 +342,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
>>>                container_of(cb, struct drm_sched_entity, cb);
>>>
>>>        drm_sched_entity_clear_dep(f, cb);
>>> -     drm_sched_wakeup(entity->rq->sched);
>>> +     drm_sched_wakeup_if_can_queue(entity->rq->sched);
>>>   }
>>>
>>>   /**
>>> @@ -565,7 +565,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>>                if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>>                        drm_sched_rq_update_fifo(entity, submit_ts);
>>>
>>> -             drm_sched_wakeup(entity->rq->sched);
>>> +             drm_sched_wakeup_if_can_queue(entity->rq->sched);
>>>        }
>>>   }
>>>   EXPORT_SYMBOL(drm_sched_entity_push_job);
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 8739322c30321b..b352227a605538 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -860,12 +860,12 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>>>   }
>>>
>>>   /**
>>> - * drm_sched_wakeup - Wake up the scheduler when it is ready
>>> - *
>>> + * drm_sched_wakeup_if_can_queue - Wake up the scheduler
>>>    * @sched: scheduler instance
>>>    *
>>> + * Wake up the scheduler if we can queue jobs.
>>>    */
>>> -void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
>>> +void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
>>>   {
>>>        if (drm_sched_can_queue(sched))
>>>                wake_up_interruptible(&sched->wake_up_worker);
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index 31d1f5166c79fe..e95b4837e5a373 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -549,7 +549,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>>>                                      unsigned int num_sched_list);
>>>
>>>   void drm_sched_job_cleanup(struct drm_sched_job *job);
>>> -void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
>>> +void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
>>>   void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
>>>   void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
>>>   void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);

