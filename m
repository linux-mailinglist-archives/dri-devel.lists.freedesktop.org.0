Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3363FD28D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 06:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3066E111;
	Wed,  1 Sep 2021 04:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2062.outbound.protection.outlook.com [40.107.96.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7A16E05C;
 Wed,  1 Sep 2021 04:49:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hplpcsih8vSvlh9aybt/5LN/GSsj5/kym/xJeMv3SqZ5yNAsep9waXsYKKVtO1v7Bi0qMmmJqGf8gWElrHMImPkzSSCW4x3LK4IhQVinnlySsQT6nUJ3mcfFQBCzmAe0CwARsy8SK7aBsgouPB5oidBoQ7ztpsmMApUpmTJqzfOqrdwDpWeNPXM0zfHicQ3SEYfzZtHM62lDvjFgBSTmRcHxdRWyhuZ7emALjvk0Jaw9I10HCOtWEegep1Ux41UIrUVbLGAv6mozZKVzqF+3UtdxyyQBXJjU0wIrxSvBkbLNNi2WgOH5YzO4tUj7MhIXW7w/0t+9EhydfzT92mFeEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lchjkwVnpD0GnlakjYMTpvNwjRgReMiAHxdqMddDLsI=;
 b=AMQ3WGbWdzjuDTLZfsqx634BcyzzjwVORcjfksdsTgF284/vAdy/3lmQxi0xpDJTynglROiv+VWd47UHJVqkz6pyHWkQyoHUvjkjSappXe2wLzrjFwzvz30Kjh1vSZvmKrNcqS8teDijctzVNXJm9pgJ0H0apwEuMDYZmWBGV7Po0NKUJH2JXBkeyLrSs76ewU6IDadzxGRCVpy5dIasZhkAvdk/tYo701iXEOrXX3J1+6P6OmRy/plL9kVKfk2vPoBKjwF7TvhR1n4/0x63tpeagZscFjKd0+zS1dQUqrhwM1qHaxFzLiXFTtLVdvMta+p88EBk1topkQlYRcavTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lchjkwVnpD0GnlakjYMTpvNwjRgReMiAHxdqMddDLsI=;
 b=4G6sy3o15CyvN4S+ly3jt0ChDxKLb58yHgYZM7+JLorLDeqSmSGxHJ8tFF3TtGxYdgQue+brALebs39ZrMVIog6gKTwCclcnKJWL/IEu2PieIMsrwb0wA9sZ4f9yiSyIosC7n8K70vLOjFfKyOfzLUtWs30LdsB2o6eX3hYohSQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2846.namprd12.prod.outlook.com (2603:10b6:805:70::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Wed, 1 Sep
 2021 04:49:35 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d%6]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 04:49:35 +0000
Subject: Re: [diagnostic TDR mode patches] unify our solution
 opinions/suggestions in one thread
To: Jingwen Chen <Jingwen.Chen2@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <BL1PR12MB526942160701B46D4B28EEEC84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <BL1PR12MB5269EB4E07A80EEB48A391DF84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <abf7b9de-67ef-25d4-a4be-11df93d2f799@amd.com>
 <20210901042513.nn3kdnh6xqkrbarn@wayne-dev>
 <9ee69f03-5636-0171-a3f8-bd3c5d79b592@amd.com>
 <20210901044015.bnevloqxl6qw7jl3@wayne-dev>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <bd105fac-b7e2-a024-f45a-ad44a66a076a@amd.com>
Date: Wed, 1 Sep 2021 00:49:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210901044015.bnevloqxl6qw7jl3@wayne-dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::8) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:b95:7ef3:48be:2d7e]
 (2607:fea8:3edf:49b0:b95:7ef3:48be:2d7e) by
 YT1PR01CA0069.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 04:49:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 679ee784-6d53-4ca7-3b2a-08d96d03e545
X-MS-TrafficTypeDiagnostic: SN6PR12MB2846:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2846D364FCD7A97BF16E5B5AEACD9@SN6PR12MB2846.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NbNrGdvyFXASrx4cBNebhlpYlb1BOXEq1iFvO/tQgEpzMs48s/xESMiscZbKXcS4IuAa7px22wegJir1Q06AFoMj7aXib6O0OXNLyB/hd4SiYsVMCxTDSxjViaE4GQz6hzTRhVw9Rskq/yY5OYM6JSeKdC6qzV1f7zCUAjqvciDkUO2optFFPPBGuaSIvZvh5ZJS1ZFqUs++/ou1KT7LRu5riy8nR6Z3e1DzHR3FTjhoB4W5CD0blIt4UU+nmJNJsUEDkylwEnJkZUMA3iRKQsoPQIcrcNLMqYQmSKrzxNl/ru5RPEmINfFJsiL2zcBkirDZ9H1omo/AdZbTKRw2uNNn/kL97Lqi93hYFoa1tJhA3A+BEfLc9f0l3esdCDaHWUxK/Kjvo482UCriiO4KJoSV3k614M0dPvZ01cyuzIYggwrWp+caKeZVwB6lkMYe4rDQNDsE4W8k5uiyAUNr/kk2y8d/4eE4gxuZ77RNRExTRv1GEjOOh7Ihd8/VI2MieF27EOmDlUTZHCrmj9huIrxhlNfVKju+JygGz0TKJvkc/N9fdjP/TDPZGNFu1iSg8+5Q63vk32yyMmzPT9y+4JbwE4U692LtMnG7NsgVa3op6S1p5OQ9JX+WEHmHT7j/8IzmsvuxzgOHfpsqs2BKxJuWP4lIMWj4YOTs7GMQq9eQJhBd8GUtraHlgWuCgq/z3EzJObBLuNyErdjf+CLg+tqp/3Knyf0Xhm0WLFW2wRA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(84040400005)(186003)(2906002)(53546011)(6486002)(316002)(66556008)(66476007)(4326008)(44832011)(110136005)(66946007)(8676002)(478600001)(8936002)(36756003)(5660300002)(54906003)(31686004)(2616005)(38100700002)(83380400001)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0xJajNXK2d0b25qWXlJNVlOVHc3RDZ0b0JHTzRtUSt5eW1PWlZZaWx4VWM0?=
 =?utf-8?B?MXJpSUUxbUJ4MXRxNU9qTlY1aDJEY3BHZm9WQk56UXUxSTlQbE85U2VERS9y?=
 =?utf-8?B?enRRVHg1U0ZidVhtdlJxRjFKQ05NUUxTWlo3S3lmNmVOK0Z4dm9JR3RvSHBu?=
 =?utf-8?B?ZUFNZVh6dHB5aDkrcGR0S0NGVDI5K2orcjVwTitEdldRSER1MGxTTWhCK0la?=
 =?utf-8?B?VmNpRFBLNlY2TTdVMUxCTHZNUzJiTWk2OHd6NHBlV2FBN3lyM0x1eDRaKzA3?=
 =?utf-8?B?L2xCRGhvNkd0L1ZKbHJ2L21oNElMUVhHbGpwREhXVzFVaDYrZEN4WFNybnZG?=
 =?utf-8?B?dFZFTjd0aDNhNUQzS0FidHZkVE1iS0pQSjliQUxRQmFWdVZOYlZ6RjZ1VlUw?=
 =?utf-8?B?MUtzKzRHWFZsTlRKTjRvZjhkUXRIUC9LclR4ZlhXM0J6aFdIUW5YaVp6Z1ZW?=
 =?utf-8?B?RllIUFdmZWM3bjdTOFpiYUhTWE5wdFk1YUMvNW5sQ1pCSmdmM043UzI4VmVq?=
 =?utf-8?B?VWE5VXdnMWhTSEZtazNsaUdpM0R5Wm9Yak83NlB5LzMxVm9rTjRUQ2VwZHZD?=
 =?utf-8?B?djZnZUoyOFRjT3hkTTIray80SW0xb1dOenQ5Q2NGS0JJVERLK0FXVThIUE5r?=
 =?utf-8?B?K1NFK0tCNzZzSGNWZnFlWjhvRzBZNVYrUHI2VjhOK2RLa01mMzBtcWM5WERr?=
 =?utf-8?B?ck10NndwODB1TXlNUExydUJEeEMxcU1EV2dsZUd2QytBM2N1bkYzTTNyS0tw?=
 =?utf-8?B?Zm1YUnNqNFY2UHc1ak5QTjM0WXFMQnFFeU9tWjBxSk1hTzV4RVRmaGVvS2ha?=
 =?utf-8?B?cE5pREllRkY5L3JYUTNMYVJJVXJ5aDAyc01uckw2N2hPVEVOcjlrMjRxb3F2?=
 =?utf-8?B?K0YwUmowKzMvSkdtTGp0MFlPVUtMSzQwN3RDNStIUndONzRCRUtNdnN6UGVR?=
 =?utf-8?B?UWsySWV4MkU0UUtxazUxKzdSYzdHUGRpemoyemhVYlJSdVY4bVhDQkJQbFFN?=
 =?utf-8?B?OEhScHptNGx2dTN2Z1dLVjYvbnMwR3hOUEt2MEgzd3UyRnZDdTd3YkNMWnVE?=
 =?utf-8?B?anJ0TlF1ckFlNnNDYUJOUE56YzZUSkQxZmhlYU9icmJHR1BGTEJjQXRuYW9R?=
 =?utf-8?B?VHRIWkowb0loZmwxUk9rMThoYk9JUkRsV2o5MUpNa0JrWWhSb0d2N09TZkc4?=
 =?utf-8?B?TDZjNjhkU0JtQzk1bGJxTjg3cWpTTUxDdkxWSnlGbDZieTJMK24wVTJSSTBJ?=
 =?utf-8?B?dmVxVkhMNVJLWXdUbjY1RkcyenZ3ZUJ2TU9xclE3c3VsNDRCYTV5NTdvOVpE?=
 =?utf-8?B?UkxSYm1FSmVYd3J6aVE2YVJkOVJQWVFoZ2o5bHhBVEYyWnBUa0ltUFArRlNM?=
 =?utf-8?B?TUlMZWhuYjBkREVpMlM3eUxLN2RyMWRNUlU3YzdJL3RxVlBHTHZiL3FvV0c3?=
 =?utf-8?B?VFVZd1VBenM1UHdaQWRicHlaOXhjNC96MUxWRzVpMkgwd2Z4VUlBbDB3Y3lP?=
 =?utf-8?B?L2t4c1pRQzZDWkxLOGpnU08xNlRzQmFTMHZGN0JWNjFzQkkxZUpvS3NrOFZa?=
 =?utf-8?B?bVVTRWJ4Ym8rK2o4TEdjMEc2VU5xUG9VTTB3aU1ORytNckxnUnd0aUM1WGQ2?=
 =?utf-8?B?aXpXdFVWWlNkZzFUKzhCdngzTW1mMEJsVm04YmthLzNLSHJ4c0htb280dWJ4?=
 =?utf-8?B?RHJyYjJKdFQvMVNDdmhkWXhITTdnMnZIZHIrbGY3Z3RZakZpWmtHcllmbEhH?=
 =?utf-8?B?anlmdWowREV6RFRUc2hwRmJPSStVRG9WbVFvcFN6c3I5Z3gwRnpBd3hPd0JP?=
 =?utf-8?B?dGhSSDdWeTVIcTAzRVhpRWt6ZjFZL1BaUFMrbWVsWkJGa1g0cWk3emFKdHhQ?=
 =?utf-8?Q?O88Edir2Bxu3q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 679ee784-6d53-4ca7-3b2a-08d96d03e545
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 04:49:35.0323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/ZLyK97nag6T2K1iCtzfbUXuQdFwd5XwPZvKGKwxJMqnaoR0XUiChjzPe+sfAgVRUpL8IlZc8sI8P+wC/EVXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2846
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2021-09-01 12:40 a.m., Jingwen Chen wrote:
> On Wed Sep 01, 2021 at 12:28:59AM -0400, Andrey Grodzovsky wrote:
>> On 2021-09-01 12:25 a.m., Jingwen Chen wrote:
>>> On Wed Sep 01, 2021 at 12:04:47AM -0400, Andrey Grodzovsky wrote:
>>>> I will answer everything here -
>>>>
>>>> On 2021-08-31 9:58 p.m., Liu, Monk wrote:
>>>>
>>>>
>>>>       [AMD Official Use Only]
>>>>
>>>>
>>>>       In the previous discussion, you guys stated that we should drop the
>>>>       “kthread_should_park” in cleanup_job.
>>>>
>>>>
>>>>       @@ -676,15 +676,6 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler
>>>>       *sched)
>>>>
>>>>       {
>>>>
>>>>               struct drm_sched_job *job, *next;
>>>>
>>>>
>>>>       -       /*
>>>>
>>>>       -        * Don't destroy jobs while the timeout worker is running  OR
>>>>       thread
>>>>
>>>>       -        * is being parked and hence assumed to not touch pending_list
>>>>
>>>>       -        */
>>>>
>>>>       -       if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
>>>>
>>>>       -           !cancel_delayed_work(&sched->work_tdr)) ||
>>>>
>>>>       -           kthread_should_park())
>>>>
>>>>       -               return NULL;
>>>>
>>>>
>>>>       But I suddenly have a question here: if return the timedout job no matter
>>>>       kthread_should_park() or not, then we are backing to the original problem
>>>>       again: that the timedout_job is suddenly signaling and cleanup_job still
>>>>       returns it to sched_main and job is freed while it is still handling by
>>>>       vendor’s timeout callback
>>>>
>>>>
>>>>       If we return NULL when kthread_should_park() in cleanup_job, we can prevent
>>>>       above scenario from happening: once a job is processed by job_timedout we
>>>>       can stop its scheduler, and after that even this job suddenly signaled the
>>>>       cleanup_job won’t return it so sched_main won’t free it in parallel …
>>>>
>>>>
>>>>       What do you think ?
>>>>
>>>>
>>>> Is your analysis above takes into account that you also submit
>>>> '[PATCH 2/2] drm/sched: serialize job_timeout and scheduler' then I don't see a
>>>> problem -
>>> Hi Andrey,
>>> Monk has talked to me and we agreed that as there're multiple opinions about the
>>> '[PATCH 2/2] drm/sched: serialize job_timeout and scheduler' and patch
>>> 1 is an independent patch to fix some error. So we should not take the patch 2 into
>>> analysis.
>>>
>>>> I think that as long as you put kthread_park(sched->thread) BEFORE
>>>> fetching next bad job from pending list (under spinlock) there is no
>>>> such issue as in the case you describe because this potential bad job
>>>> that became signaled will be removed from pending list before you
>>>> even fetch the next job and by the time you fetch it the scheduler
>>>> thread is already stopped anyway
>>>>
>>>> If you don't submit and we keep the removal hack for now then also no problem
>>>> because
>>>> we temporary remove the job we fetch for TDR from pending list under spinlock
>>>> exactly to avoid this race
>>>>
>>> So can you help review [PATCH 1/2] drm/sched: fix the bug of time out calculation(v3)?
>>> patch v3 keeps this kthread_should_park check.
>>
>> But since in both cases looks like there is no danger of use after free
>> then I see no reason to keep kthread_should_park check.
>>
>> Andrey
> OK, I get it. So patch v4 has removed this check, can you help review
> [PATCH 1/2] drm/sched: fix the bug of time out calculation(v4)?


Sure

Andrey


>>
>>> Best Regards,
>>> JingWen
>>>>       Thanks
>>>>
>>>>
>>>>       ------------------------------------------
>>>>
>>>>       Monk Liu | Cloud-GPU Core team
>>>>
>>>>       ------------------------------------------
>>>>
>>>>
>>>>       From: Liu, Monk
>>>>       Sent: Wednesday, September 1, 2021 9:23 AM
>>>>       To: Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey
>>>>       <Andrey.Grodzovsky@amd.com>; Daniel Vetter <daniel@ffwll.ch>; Chen, JingWen
>>>>       <JingWen.Chen2@amd.com>
>>>>       Cc: DRI Development <dri-devel@lists.freedesktop.org>;
>>>>       amd-gfx@lists.freedesktop.org
>>>>       Subject: [diagnostic TDR mode patches] unify our solution opinions/
>>>>       suggestions in one thread
>>>>
>>>>
>>>>       [AMD Official Use Only]
>>>>
>>>>
>>>>       Hi Daniel/Christian/Andrey
>>>>
>>>>
>>>>       It looks the voice from you three are spread over those email floods to me,
>>>>       the feature we are working on (diagnostic TDR scheme) is pending there for
>>>>       more than 6 month (we started it from feb 2021).
>>>>
>>>>
>>>>       Honestly speaking the email ways that we are using now is not friendly and
>>>>       quite painful to me ….
>>>>
>>>>       Can we try to put all our opinions, suggestions, or even objects here
>>>>       together, let’s go through them one by one, it’s too hard for us to reply
>>>>       each email on different questions .
>>>>
>>>>
>>>>       For [PATCH 1/2] drm/sched: fix the bug of time out calculation(v4)
>>>>
>>>>
>>>>       This is a fixing patch on the timeout timer in scheduler, can we complete
>>>>       this one first ? it should already resolved all the questions and
>>>>       suggestions.
>>>>
>>>>
>>>> I have no objections for this one besides getting rid of the
>>>> kthread_should_park()) return null part,
>>>> if my answer above is not wrong then it seems superfluous to me
>>>>
>>>>
>>>>
>>>>       For [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
>>>>
>>>>
>>>>       I think I already explained the questions raised by Daniel in other thread
>>>>       , regarding why I use __kthread_should_park()
>>>>
>>>>
>>>> Is this race free ? Can't the other thread execute kthread_park after the check
>>>> ?
>>>>
>>>>
>>>>       For other aspects, can we put all our opinion synthesized here ?
>>>>
>>>>
>>>> So to summarize from previous threads I think that the best solution
>>>> to the problem being solved in this patch is if we do HW fence embedding
>>>> at the drm_sched_job level instead of doing it only for amdgpu, and modifying
>>>> all
>>>> the drivers to support this we can both remove this hack and solve the race
>>>> against concurrent drm_sched_cleanup_jobs job freeing just by taking reference
>>>> to the hw fence of the job at the beginning of drm_sched_job_timedout
>>>>
>>>> If doing this refactoring for all the drivers is not an option now and you need
>>>> a quick
>>>> solution such as the serialization you do here then take into account other
>>>> concurrent
>>>> TDR handlers that might run, as mentioned before, without serializing against
>>>> other TDR handlers from other
>>>> schedulers you just race here against them, e.g. you parked it now but another
>>>> one in progress will unpark it as part of calling  drm_sched_start for other
>>>> rings.
>>>> So you either need a global lock or dedicated single threaded queue as Daniel
>>>> suggested.
>>>> At minimum we should change cancel_delayed_work in drm_sched_stop to
>>>> cancel_delayed_work_sync
>>>> to cancel and flush all concurrent TDRs and probably move it to the begining of
>>>> the function, after kthread_park
>>>> and before we start playing with the pending list.
>>>>
>>>> P.S One comment I had regarding single threaded queue is that in case we have
>>>> multiple TDR
>>>> arising from same event we will proceed to resetting multiple times - something
>>>> that with trylock
>>>> we mostly avoid today within amdgpu (see amdgpu_device_lock_adev and
>>>> amdgpu_device_lock_hive_adev)
>>>> Daniel mentioned it's not a problem but I still haven't understood why not.
>>>>
>>>> Andrey
>>>>
>>>>
>>>>
>>>>       Thanks !
>>>>
>>>>
>>>>       ------------------------------------------
>>>>
>>>>       Monk Liu | Cloud-GPU Core team
>>>>
>>>>       ------------------------------------------
>>>>
>>>>
