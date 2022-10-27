Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F5E60FC39
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 17:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FD910E67C;
	Thu, 27 Oct 2022 15:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A93210E67C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 15:46:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dE27OaQ6s90KhoO+xZAbg9PF8YPIMfe0QQwrFf635xlmx9NNESBF2pGhphTlR06cIJYD4kd77kGRC0vQViUAVLokV7NVW695g6dAQdfmSH7QFZaew8zTXlrauyt2P51aTFIsA1suA6v4np4aJYld9LH0mdPxHdos69VUbUThqYEuqYvX8t1ivJcYAaQfCcf4JcSCfMOXGohapAJ3jwgBCnxvjbBbI8mdYb1y+TT9ZlHWB1Fdym7Anri+CBA4PnyCOQ3TgcPc0YlTuNV6eFmn/lYd9QHgxtb33hKMZqobCVUz3f7wf+BS3aZkJ1QgvSIumGM7mV0OosB/T1hKQcBu1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqYx+r7Xpg/QUBLCJjmsGX0RwYOP+PkC2vaUimNRzRk=;
 b=OqwEYLJ/jI3lxokd49yXxJDorVPgiPO3EBSbg4aUHre5JQYQhd8Sox90As7XAkm6QftbxrCrpc9o35etDkI21TX/VEEJfWJxqHDbaD0KHskVnyVziGKqrw4Zx2s8nh6pKNIMs4l5KqRI+xtq4Gww/lh2lgmY14S3Wo1yPHfZ1sd9FmJzwqE6FwW2s2tDDjuOdaeeHYR8Spd9fwSTJLJWPVaSKpvIx+EfnEg5OuZHTkF2OebDEBWa73DN1jzKhxnL4n8MaAt2jBFmmcuLWHbjlKulz0d8A0ZH5ITIPDwEM/NAztv/QvECVb6oDwtvpIOxLmxMqN/OpP62oTGpb9n72Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqYx+r7Xpg/QUBLCJjmsGX0RwYOP+PkC2vaUimNRzRk=;
 b=orvnLyuFjrccHUMLl9Tol/HeSKE0dWzlyT0Hfoe07iyEdix6MaA6jcb7XCl8hif2vPkNoyNvggbrBKqJCpSoPYad7aeE+9/RNFWuxILLCQ1WLWZJaly7nbte9IvjcfHPuFq9DYz16YgONvzX1nd3Q5kMPXnJBvEplpKfkBVZlQ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 BL3PR12MB6402.namprd12.prod.outlook.com (2603:10b6:208:3b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 27 Oct
 2022 15:46:41 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 15:46:39 +0000
Message-ID: <99811448-08ac-8ae8-abbb-dd9c81589854@amd.com>
Date: Thu, 27 Oct 2022 11:46:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 broler Liew <brolerliew@gmail.com>
References: <20221025061846.447975-1-brolerliew@gmail.com>
 <CADnq5_NweAo-7snRLkidNkOizu7Ft+7GgXCS2Rnv1oxmRFb_RQ@mail.gmail.com>
 <a70dcda0-6723-38f6-efeb-e8edb16dab55@amd.com>
 <69e672a5-a68e-7bad-fc49-4281c1c6039d@amd.com>
 <9774ddd6-60d9-245c-77ac-59951c13b263@amd.com>
 <ac73b553-9173-4ac5-ef16-a95b8a8cd4f9@amd.com>
 <5bc35aea-466b-bd09-563e-f3e32796b83b@amd.com>
 <CAODyvyypneTxCDUgUNB0UCm+eZtKn_yLJRxZ8nh-kg2PUkaTjw@mail.gmail.com>
 <37c0c9f3-be29-aa0e-94b3-c1ae75e70763@amd.com>
Content-Language: en-CA
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH] drm/scheduler: set current_entity to next when remove
 from rq
In-Reply-To: <37c0c9f3-be29-aa0e-94b3-c1ae75e70763@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::8) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|BL3PR12MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: 86cca806-b46d-41bf-e691-08dab8326ee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T37F/eGTfiz3C9FUsLlLGkErOkRa+PX4s+ZbitRXiI1er5FCIiZ4D2hTGr9dfm49w6CZcrdp49yMnVYGdiR21023dMIPuEOyQ2kcWOPh2KnFBgtGlk7J2BruLJ2cX9lMX2j5r2p+G4fUYgbmfQLUa5vZ6B8f7GwxoZLRnBSzeAylWXP41SQ5G1zt4YgFFKAZrkvbjPyEC05JuwFsvr70faUWidQZP1+feOn84wmbfcP8hBcJkMNKUXYHBdlumnmt6EXW0D/8FJwJHAcaKkhhXFBeiEI+EflaczsZIo9VVi/RdxcCY9zzn+Wqm6n7A1x+YuUYDZ+Oendb2Vstr8NDYAJufzJ90HOgJazHTpZaCxH+Tx5YRSxeAUpt9XsL0eMz694JTODBBkVEYxXAa4y/Hysq457qYTqUjo29pA5BuxvbM+DVBRc8wDNNjrCBQR5u2gZ0ZrGRJI46gVoE+IipAkgUkIeYf2zmbAPGEue5JU2YyufsjjB7bOg3LJFMQBk6AV+6FaaWLAjueCSIr373UWcniF1kgrYYLcad8jwKpgqpjhm0rT29ul3jE2QQKcicTZeDrywNcaoy9XPBc0AZ6RkqmOByEb70WCWa1xvbIZPVMraLC4LOqQSPceE/dafKfQUe1yPRRmFDzqK5JlfyAsr9eRoXEIKZ3PFpKuFyQi/lwXIc0omA0wS/5gOsGAghnKTMvGMSnKNsKj+P2LoD7S8FYlAhshLsyYZSvvWDby8/JezmAhHCdlPM8Iu4q7Dkx+n+Qrj/xS5pP5jG3FIQ2s6aGXo8pY09QPt/emVVGmQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(451199015)(31686004)(478600001)(31696002)(86362001)(83380400001)(6486002)(8676002)(36756003)(6666004)(6506007)(53546011)(5660300002)(26005)(8936002)(6512007)(41300700001)(110136005)(66476007)(66946007)(2616005)(38100700002)(2906002)(186003)(4001150100001)(66556008)(44832011)(4326008)(316002)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGZZZVhsamUwTGlZM2FGY28rUjZyK0hKUVFHc0xlNU5MUkZXYjFIakdCRk5y?=
 =?utf-8?B?N1FaYmNQOTJuT0VOSlVNVWs2SHNyMVo3VXZacUVScW5mRmFQclFUdTl5YWhz?=
 =?utf-8?B?N2svTEtxb0J0SE52NnkvKzd1TDhJVXZsYkpzV0pFVFpaTEpFcHRNdG5YQ3lo?=
 =?utf-8?B?SE5aQWluRkJKR1FGNFAxbGNGRHRlcUZyem9aeUk4V1l3WXVjeXRqdkJxLzBp?=
 =?utf-8?B?YnpwcnNMbng0eStyQXMyMmhBY3ZXeC9aOWJnVjFHdFMxajZJL3VMamF1TjJl?=
 =?utf-8?B?UFBaRU5JZ3Z6bVZqWW9mOWl0ZVV3WWVLU3lZeUZWZWRHVUkzSUxYdTFLSmdu?=
 =?utf-8?B?eUdab1hEZldVNWJtdFFsWnNDckdlTGdtbTBQZEF1dm9qbEVrYmk3WlBVdkRS?=
 =?utf-8?B?TVNwVkk4bTkremlpSFFPYnNRM0IwM2hjRTJxZm5KYjZpUzhOSk1ZNXVSL0ds?=
 =?utf-8?B?QVRDSy94NGdTRUwwM3k2d3hqcVp4YjFSd1c2K2IzSHQ2TXJ3amYrUTFQTDVO?=
 =?utf-8?B?SDNkRmtGempldVFqNzV2MXYxZjdjWVU0WE9DZGUzdGZBSnJiMXd1bHM1UENo?=
 =?utf-8?B?V2V1ekxGZFVBWFdzLzNQWklZbCtuWU92cFhWSXBjazZYMnZMOG9ISldNWWtM?=
 =?utf-8?B?RFRLbHRteUtHczhZV1dIaTNDQmJ3OXh0R01nOUFkbWlxN2g3VzNGcWYwcStQ?=
 =?utf-8?B?aTNMb09WZ2dOV1FaclFXVTY4V2dIN1h1VnFCdmczYXdoZElSZVNqUEw5eS8v?=
 =?utf-8?B?ckV2NGxRdWFKa3UwbFVHVVF4aXNxR3NYMGNMMnBkYlBFOFlmOElFZHhlQzNi?=
 =?utf-8?B?RU43WkFpdS9UakFWbmlxZDQvdXFjVHJVcjJDN1JYNmJlWGE0TkNvTXJRek1G?=
 =?utf-8?B?RCs3VmpwSTZ2UVNWOXROekZkdGdRa0dOS0RRSTk1WkVvSUs0ZG1PY0FtUnNF?=
 =?utf-8?B?VDBKR2JrN0t0VDNzNkFHU2lzMXVER3doWHczRlZ1czMrQXExbkc4R0lHMWpG?=
 =?utf-8?B?eWQwRXZ4V0xPMmJITkxZNEkzSkFnZHBaWDJwZlVxL1czUHdENkIrMWY4NFY4?=
 =?utf-8?B?dUtpV0YybzgwN1Q5R29LbEVZZ3lxTFR1ZzV1NzFRSnpDbmV3QWF2ZHB4ck5Z?=
 =?utf-8?B?ZWxIaW5NOUgwZnJxbytKNE9zYTV2SkhZV215SXc4cHpWSGRXR0FKVUlESE5G?=
 =?utf-8?B?MUJiTHd3akNJVmtIQmlMUmNqcjdjRzdub0FHU3Bvby8rM2I2dGwrTkcvMDQ1?=
 =?utf-8?B?c1pEZFhsbGlrLzgrS243VmR3VUpsdGVaZVlMbjNzbG9Rb1NBalVRMnR2UGxr?=
 =?utf-8?B?dFkwcDcvUGlHWVJHaklYTmhnZFhHMDh0SlhWVVM4YkszSTBrcmFZUUFtR2wz?=
 =?utf-8?B?QUlJaUFpeXpRNXlKSVZUQnM1OEpSazJEdk1rTUc4UWpsVkFqMjJlbmVBbU96?=
 =?utf-8?B?NnlyZ1JYWjByT0FVanVsRHhDenpRWndZbEVyZ2lPaE4xV3VlYWVyRE4wYkpO?=
 =?utf-8?B?VmdDZVVuN0FOZVZiVENvNWdQcmNqeVF5bEF0dlNtTytiQnJiM3ZmQ1FxRzd1?=
 =?utf-8?B?Yk9LUk5tY0NNWnpBMSswbTZPenp5YmZvUVFLUlFkVHpWZFBGQWUyN3pnNXBD?=
 =?utf-8?B?RVM5ZjRlUUpVeUFUamJBblNaQVdpMlNJbjNBU3ZmKyt0M2c0ZTZ2RTMzcUJx?=
 =?utf-8?B?UzNVc0NDZEp3WUF3R21XbGx2eUtBSnpaV1FsdVpENW1oeTZ4cHJEVFkzdS82?=
 =?utf-8?B?RUJxSHVHMlZZUGtIalVvVWlmUGNZOTRNQk9LY1NPbVFWbWZINGY5OWduVEFh?=
 =?utf-8?B?MG1vY2NpV2V2K0haUDgvYU5zdTZla1ZOa29IMlcrK3o3OTJKQ0FPL3dOUkVv?=
 =?utf-8?B?aWxvZFVLdzFkMDlTNVdvMS9iQVBIUDJFQlVKSzc0amFDdHhMK0VuOXl2RVJS?=
 =?utf-8?B?dGliaUtsTytBY3Z5cHZzeWZlTUdxL3F1TkxNUWI5aTJSaTlWN0t5UlVldjFy?=
 =?utf-8?B?K0ZZVTBvQzNLbjRWSm96bUY0RHlLdjE2ZjNQZ29WblpLOTRHYUlLQk5md0pS?=
 =?utf-8?B?VFgrYWdVdGZyeVRLVG5FZ3pDdGp1RjVucTM3aExaam9kYVZaYmV5eVlFRlpV?=
 =?utf-8?Q?DWLE4s1Vsj0zKVO78JaB/kkTN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86cca806-b46d-41bf-e691-08dab8326ee3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 15:46:39.0744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ykkfo5l+qpzTVPfPDn3oMhiay6oZlkeUvRdgu0jT4R318ADauzlkjv7iXfvgCO9R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6402
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

So, I started fixing this, including the bug taking the next element as an entity, but it could be actually the list_head... a la your patch being fixed, and then went down the rabbit whole of also fixing drm_sched_rq_select_entity(), but the problem is that at that point we don't know if we should start from the _next_ entity (as it is currently the case) or from the current entity (a la list_for_each_entry_from()) as it would be the case with this patch (if it were fixed for the list_head bug).

But the problem is that elsewhere in the GPU scheduler (sched_entity.c), we do want to start from rq->current_entity->next, and picking "next" in drm_sched_rq_remove_entity(), would then skip an entity, or be biased for an entity twice. This is why this function is called drm_sched_rq_remove_entity() and not drm_sched_rq_next_entity_or_null().

So all this work seemed moot, given that we've already switched to FIFO-based scheduling in drm-misc-next, and so I didn't see a point in developing this further at this point (it's been working alright)--we're going with FIFO-based scheduling.

Regards,
Luben


On 2022-10-27 05:08, Christian König wrote:
> Am 27.10.22 um 11:00 schrieb broler Liew:
>> It's very nice of you-all to finger it out that it may crash when it is the last entity in the list.   Absolutely I made a mistake about that.
>> But I still cannot understand why we need to restart the selection from the list head when the current entity is removed from rq.
>> In drm_sched_rq_select_entity, starting from head may cause the first entity to be selected more often than others, which breaks the equal rule the scheduler wants to achieve.
>> Maybe the previous one is the better choice when current_entity == entity?
> 
> That's a good argument, but we want to get rid of the round robin algorithm anyway and switch over to the fifo.
> 
> So this is some code which is already not used by default any more and improving it doesn't make much sense.
> 
> Regards,
> Christian.
> 
>>
>> Luben Tuikov <luben.tuikov@amd.com> 于2022年10月27日周四 16:24写道：
>>
>>     On 2022-10-27 04:19, Christian König wrote:
>>     > Am 27.10.22 um 10:07 schrieb Luben Tuikov:
>>     >> On 2022-10-27 03:01, Luben Tuikov wrote:
>>     >>> On 2022-10-25 13:50, Luben Tuikov wrote:
>>     >>>> Looking...
>>     >>>>
>>     >>>> Regards,
>>     >>>> Luben
>>     >>>>
>>     >>>> On 2022-10-25 09:35, Alex Deucher wrote:
>>     >>>>> + Luben
>>     >>>>>
>>     >>>>> On Tue, Oct 25, 2022 at 2:55 AM brolerliew <brolerliew@gmail.com> wrote:
>>     >>>>>> When entity move from one rq to another, current_entity will be set to NULL
>>     >>>>>> if it is the moving entity. This make entities close to rq head got
>>     >>>>>> selected more frequently, especially when doing load balance between
>>     >>>>>> multiple drm_gpu_scheduler.
>>     >>>>>>
>>     >>>>>> Make current_entity to next when removing from rq.
>>     >>>>>>
>>     >>>>>> Signed-off-by: brolerliew <brolerliew@gmail.com>
>>     >>>>>> ---
>>     >>>>>>   drivers/gpu/drm/scheduler/sched_main.c | 5 +++--
>>     >>>>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>     >>>>>>
>>     >>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>     >>>>>> index 2fab218d7082..00b22cc50f08 100644
>>     >>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>     >>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>     >>>>>> @@ -168,10 +168,11 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>     >>>>>>          spin_lock(&rq->lock);
>>     >>>>>>
>>     >>>>>>          atomic_dec(rq->sched->score);
>>     >>>>>> -       list_del_init(&entity->list);
>>     >>>>>>
>>     >>>>>>          if (rq->current_entity == entity)
>>     >>>>>> -               rq->current_entity = NULL;
>>     >>>>>> +               rq->current_entity = list_next_entry(entity, list);
>>     >>>>>> +
>>     >>>>>> +       list_del_init(&entity->list);
>>     >>>>>>
>>     >>>>>>          if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>     >>>>>>                  drm_sched_rq_remove_fifo_locked(entity);
>>     >>>>>> --
>>     >>>>>> 2.34.1
>>     >>>>>>
>>     >>> Looks good. I'll pick it up into some other changes I've in tow, and repost
>>     >>> along with my changes, as they're somewhat related.
>>     >> Actually, the more I look at it, the more I think that we do want to set
>>     >> rq->current_entity to NULL in that function, in order to pick the next best entity
>>     >> (or scheduler for that matter), the next time around. See sched_entity.c,
>>     >> and drm_sched_rq_select_entity() where we start evaluating from the _next_
>>     >> entity.
>>     >>
>>     >> So, it is best to leave it to set it to NULL, for now.
>>     >
>>     > Apart from that this patch here could cause a crash when the entity is
>>     > the last one in the list.
>>     >
>>     > In this case current current_entity would be set to an incorrect upcast
>>     > of the head of the list.
>>
>>     Absolutely. I saw that, but in rejecting the patch, I didn't feel the need to mention it.
>>
>>     Thanks for looking into this.
>>
>>     Regards,
>>     Luben
>>
> 

