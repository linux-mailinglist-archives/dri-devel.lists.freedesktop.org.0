Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A083260F337
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 11:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C7A10E592;
	Thu, 27 Oct 2022 09:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B6610E597
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 09:08:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PoDVd9d3OYQzv0PS2M3f6aZVuLQ6cwJserUrVTv2+TwSnZ2O0EE49IzQXG/qB2FBhAJcez9MsI3V4dJ2YHW2gaohcMwc+sLRdheUiJMAaJWwZnWfYGyYysgg61QLnhFN/eScUL4idCRl1DZQVnUD1Ff/nIr1ZhKPsa5i2yH/uOGLC0MxZffnzGyYIqmtUnjTcAQxP8DhKSMJrPyA9XpSGqSdKw9DyOd0I9pj/P4wDWu5GFFqBbdsPAtyPctNP75b1cO1MjpkChnHr1vmv9mHFBQ68dzSMdrfq4cygGgxvP6L3DGW6aeMRflf19Xdnn2dTOkyzTJLKpaGYi5y2df19Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1GwXRaB7B0zca6EzctTLwCXbfksXF+0BW51MNjagwk=;
 b=k868x/NFlikjm1eyyrAm9uK9LyB2x+TeEP8QddXP5e4HzkbUsv28a7uT2Px8fAVnB2REXD9OErJkqEWd/kvSM2h8i9Ds1Ku7QG3lyv9Fp82P2D4KwBK+2WtSyjkffmHVDmCWGAvswQj/jhAGmiOx3idnMmpWe2m1OJIHum4ALuMx+5Q0J55IxMNBJCU0+ZA38j6Z110V/bgKMNfQKbVmgfEjL9Zvp8C5AgVT1ZmG89WEB0lupJxvuJa/Q6ApXJoUlBHuPel04wwvOGm3tup6PJg8PMYrBe5HqQ+K+qNi0K/JXIUGXgwVOkFN5IfzelgwskVzb0waffbp4EcGsJTsNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1GwXRaB7B0zca6EzctTLwCXbfksXF+0BW51MNjagwk=;
 b=AzuoQaO+0htUHbo+SOCa1MTK4qcMYnx29/FoRkUYuLqQjUi005otb+NzD3KY5jGfK6CNa+6ijocObVdxA8VZH3A+8LTp6xMgyEHjj1jooU15E04O2TSalNxMcv9WcuBs8lQhuy5Jx8/+ub444wihvWngpwNroc0JtLBmuk/4bxE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4424.namprd12.prod.outlook.com (2603:10b6:208:26a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14; Thu, 27 Oct
 2022 09:08:10 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279%4]) with mapi id 15.20.5746.023; Thu, 27 Oct 2022
 09:08:10 +0000
Content-Type: multipart/alternative;
 boundary="------------XPo3OFFq6Zim57Vdbw1t5zvJ"
Message-ID: <37c0c9f3-be29-aa0e-94b3-c1ae75e70763@amd.com>
Date: Thu, 27 Oct 2022 11:08:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/scheduler: set current_entity to next when remove
 from rq
Content-Language: en-US
To: broler Liew <brolerliew@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>
References: <20221025061846.447975-1-brolerliew@gmail.com>
 <CADnq5_NweAo-7snRLkidNkOizu7Ft+7GgXCS2Rnv1oxmRFb_RQ@mail.gmail.com>
 <a70dcda0-6723-38f6-efeb-e8edb16dab55@amd.com>
 <69e672a5-a68e-7bad-fc49-4281c1c6039d@amd.com>
 <9774ddd6-60d9-245c-77ac-59951c13b263@amd.com>
 <ac73b553-9173-4ac5-ef16-a95b8a8cd4f9@amd.com>
 <5bc35aea-466b-bd09-563e-f3e32796b83b@amd.com>
 <CAODyvyypneTxCDUgUNB0UCm+eZtKn_yLJRxZ8nh-kg2PUkaTjw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAODyvyypneTxCDUgUNB0UCm+eZtKn_yLJRxZ8nh-kg2PUkaTjw@mail.gmail.com>
X-ClientProxiedBy: FR3P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN2PR12MB4424:EE_
X-MS-Office365-Filtering-Correlation-Id: 90a6d2a4-9be5-446a-e77b-08dab7fac509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q0E8XU9lDKJ+YVaw/eZV76JoYDSeOOIliOcG97++pJGdG9iz+2TzLsv8BT0Kre/SM3BMF/W17yIgD+A/5jzdxgDKv8VNXHuDeBGpy7j9OXdppD6nYjirXuqQ7o+p0+jW4On0e1Wdz3BlYY2n88GxN4Irx+AwxsVjuwRyBV8CWxjiwERyFRIsanSEXGrWbLphCBgNk5+/KELa9mYpe+Ukh3z2z05ps4XquEZbBTwT8KyjU81RG9fvHOZOhSxjaS7x9LlNn4rednXOc4S70E8JJZXFbsgHAPrSwOMHCbB3O9LNzQvF9aYg6ObUhIdFCv2GT+lg7i8VJ1CJi5wlVHWtgtTWCxY+zC2NQDWkx2BfVxGBO1pI6oriOihSuKTVj6S4LfvBYm8eWk5rWvi34veoYht/syGvqyM9TvUOZnTEE1xiGiwr2dxgdt/MpDJ4Bkskv8MqaP4FLYde5ioLmn+k6o1qWJGdhRWwFkrqZHt7cnnQ105aPTOVPc62xnuW+74oA9U4VoC3gMUkP4O63/k38H1CsmhunLMZkHmPJyD3omR+Fvzk24b5YEBzle8rlg0lI9eluVZ7aVtOJnIrDpUI+Vq1+XjAYW4P0eO/9+jLwKgtW/IxxYpqFSV70HWONkGTua1ZTk6laa7qPSMnV2JC08RrEwcrgzkPykRzdp8x50NWzDalYtZ+Qjmzn6qA/AV1CRdYELlghjzMlC9xKKmhVX34+tWCdcpVb/j1AWya97vGi20D3cM7Zte70f0o+BOeHdITIVl9SnFdII6e22kQo6OZ3c6xaCGTnIirS8RtNqU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199015)(31686004)(2906002)(36756003)(4001150100001)(66476007)(6636002)(66556008)(38100700002)(5660300002)(110136005)(41300700001)(8936002)(316002)(66946007)(4326008)(8676002)(2616005)(26005)(83380400001)(6512007)(478600001)(31696002)(53546011)(6506007)(66574015)(33964004)(6666004)(186003)(6486002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkxLN0VpRW9HRmZ3Zk4yYmk4R1c2QlJ0alVIK0tha0ViMUVIN2xLemE4dUVn?=
 =?utf-8?B?WWY4Y1ZaZDNZdVd3aUVqTDlNbi9rSTJMa2NjdlU2am9PUHJrTnMzcjNqZ3cx?=
 =?utf-8?B?QkdEQ3BTS05YL0lkQ0VGQmN3UzNROXJaVkZNWnlOTy9tZDB3QlBoNy9lZFh4?=
 =?utf-8?B?SU9Hd3I5cmFPS0pLUHo4QzNUN3FIK0RHZUtiVWsxb0p0S0tNRjVudWJFUVhI?=
 =?utf-8?B?dmJGSWQ1MmdySG5xYzAvWXMxdkxWLyt2MmFieHZBc1hXSjI1MTZoNk9HTVJ0?=
 =?utf-8?B?WVRuaVgzdG9MNjB6UUtnRW1pdUxkVGFkc3U3OVdoWHNQZncxaGNHSFBGUmZl?=
 =?utf-8?B?cU9WdkZjL0ZmK1ZYTjlIT2V5cTRROC9TeEMvWFB1MTZDc2xvRXE2QUIxaDlt?=
 =?utf-8?B?RTFzSE45dWdidktHR2kway93c05SUzFvKy9oWHBEZTIzOE5wZzJiL0RHYWxn?=
 =?utf-8?B?enYxb3ZFWmdXQklNVWZpK3JKa085YXI4YUNMWm9NVm9ZSVEvZFFJY0w1VWMw?=
 =?utf-8?B?SzRjWENmOEgxdDMrOHNhNzlVYnVsYkdIb1FkSG45eE0yUmNDSlJFMERud2pN?=
 =?utf-8?B?ZERiR01RMXJJSjFsL1QyZmZySFVoY2IrcmlhbjhReHVTQ3JueUVmV3p1RUYr?=
 =?utf-8?B?blhWaWJnSGU0UTdERE5JN2ZYYi94QlAxVk9BRHpuSWhjQ1VEVXczTUZDaTNt?=
 =?utf-8?B?OTdSbDNMRmwxS0pZVTNBbzRWVUpyVGtodmNna1lxZGVTTU1QajFacDIrZkg3?=
 =?utf-8?B?RVNadlk2cjdueWZkVnB1aUJNVlZRbTFkZ3hPNTNmMkh1MWR4Y0dOWkxiZ3ZL?=
 =?utf-8?B?TXRjL016bjhWMCswd2xZQXc3eFRNL1hCOE5GQTQ5UHF0QXZvSmdVV3R0Undu?=
 =?utf-8?B?Q3F5WkJWdHZHSEVrR0FHbnJSUG1mMU83NkZuc1VncXhJU3FuR3A2ZkhyY1FQ?=
 =?utf-8?B?YzlzVjYrVGY0YThiR2lZbkhpenJmcWM4aEJST0hlclI4L3lXOGtQVy90ckNo?=
 =?utf-8?B?a0RPQ2piNjNRSGh0dkhYZjZ2cklHV1FuL2ZyaVRsaDZYV0dGcW1CM3l1elJG?=
 =?utf-8?B?Yjh6Y0Q4bzFZMUt1RVh1ZzVZRkxZMFBteVJJeTlDWGlYWUx3ZUZIWElxVWFz?=
 =?utf-8?B?aE40SW95K0VhSDYvSkJ0L09Ba0ltSk1ZQWlVU1JkWWVnc1FmSmtlOTh3Rlhx?=
 =?utf-8?B?K0NmMTRWbndYT204STNBVVBXNjNUQ2tZVWZ0ZG1CMzZBWEhNaXg1OXRKMmVu?=
 =?utf-8?B?T3BwWTdTOGd4V1lqYTNLSFNDcnhYOUd1UlhoVVJEWUEzelVUS0hOL2R1VVZ6?=
 =?utf-8?B?OHpWdkp5NHRrV3BiRXFMVmRCcjRuOUxXd0MyMmtEcm5HUm5BMVlabUticU16?=
 =?utf-8?B?c3VaV0VXRmcvTjFrbFBWT29IendmSk9ieHowem1QNWRmYzV0WG8wSnVVRUt6?=
 =?utf-8?B?SUVqYUxBOElqOERCV3MzeW5VNnJiR2NDRW9CZEdYaVMxMGtrNmtHVHdnUU0z?=
 =?utf-8?B?TjVSbFZJR3ljWEwrWVdnWlFpbHNBUzlpbTFuZmJmbldyVWVpSWVKT0tTYTdB?=
 =?utf-8?B?OUljUFdFaDFaWUYwTGlPTklOMDloVHBjdFRwQ2NYQXBKbWttSmwzUzJHMGx5?=
 =?utf-8?B?N21DdkJVcWY5S2R1ZTlzR3F4MnNHMEJmRm9rT01EUHhsQ1h0aGFXaXNKcTBU?=
 =?utf-8?B?WFlCOEx6b2xTYVZNRDFsRHRqK09nR0hGUk9JNFQxUlo3YmhTd2cxSG5XSDhm?=
 =?utf-8?B?NUtwSXhHSDBWL3Q3UUZ1QytxaHFIY29uc1plM1phdmcxd0cvRnZhZkE2MHVx?=
 =?utf-8?B?THJINzJudkxoMDNZczVWZXhVZi9ESXQ4UXAwQjAwa1k1ZEFnbGt5Zk9xK2Zx?=
 =?utf-8?B?MDdGaG5hRWFMZEQ5YkIyMjU1ZGRRbk5ESVFjbElEMC9kWGZqK0R0bUw4eE5l?=
 =?utf-8?B?Z3VYUHArUGdiVGNzcDhBeHBkbmNrbE9QV0F4N2dKRm1ramswN3JwMVV6SXR0?=
 =?utf-8?B?OTViSnppSk9qU01hS3ZZSmNhK2grVC9nY1JrZkRWaTFjT3VkVG1velh1am9p?=
 =?utf-8?B?Vzl2b0l3cEtmVVAzQTdjZDFNR3ZYbEtGOUpEQkE5ODF1NFRsTWhIUUdGb1dO?=
 =?utf-8?Q?XufZdpr/7Qg+Xx+1/U5dKdGjb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a6d2a4-9be5-446a-e77b-08dab7fac509
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 09:08:10.3064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61+i2iqmA1CbBximDfip8g2thRCg9cyzqq5jtuHy8vMby3LoRU1EcsWOIj095YUv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4424
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

--------------XPo3OFFq6Zim57Vdbw1t5zvJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 27.10.22 um 11:00 schrieb broler Liew:
> It's very nice of you-all to finger it out that it may crash when it 
> is the last entity in the list.   Absolutely I made a mistake about that.
> But I still cannot understand why we need to restart the selection 
> from the list head when the current entity is removed from rq.
> In drm_sched_rq_select_entity, starting from head may cause the first 
> entity to be selected more often than others, which breaks the equal 
> rule the scheduler wants to achieve.
> Maybe the previous one is the better choice when current_entity == entity?

That's a good argument, but we want to get rid of the round robin 
algorithm anyway and switch over to the fifo.

So this is some code which is already not used by default any more and 
improving it doesn't make much sense.

Regards,
Christian.

>
> Luben Tuikov <luben.tuikov@amd.com> 于2022年10月27日周四 16:24写道：
>
>     On 2022-10-27 04:19, Christian König wrote:
>     > Am 27.10.22 um 10:07 schrieb Luben Tuikov:
>     >> On 2022-10-27 03:01, Luben Tuikov wrote:
>     >>> On 2022-10-25 13:50, Luben Tuikov wrote:
>     >>>> Looking...
>     >>>>
>     >>>> Regards,
>     >>>> Luben
>     >>>>
>     >>>> On 2022-10-25 09:35, Alex Deucher wrote:
>     >>>>> + Luben
>     >>>>>
>     >>>>> On Tue, Oct 25, 2022 at 2:55 AM brolerliew
>     <brolerliew@gmail.com> wrote:
>     >>>>>> When entity move from one rq to another, current_entity
>     will be set to NULL
>     >>>>>> if it is the moving entity. This make entities close to rq
>     head got
>     >>>>>> selected more frequently, especially when doing load
>     balance between
>     >>>>>> multiple drm_gpu_scheduler.
>     >>>>>>
>     >>>>>> Make current_entity to next when removing from rq.
>     >>>>>>
>     >>>>>> Signed-off-by: brolerliew <brolerliew@gmail.com>
>     >>>>>> ---
>     >>>>>>  drivers/gpu/drm/scheduler/sched_main.c | 5 +++--
>     >>>>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>     >>>>>>
>     >>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>     b/drivers/gpu/drm/scheduler/sched_main.c
>     >>>>>> index 2fab218d7082..00b22cc50f08 100644
>     >>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>     >>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>     >>>>>> @@ -168,10 +168,11 @@ void
>     drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>     >>>>>>          spin_lock(&rq->lock);
>     >>>>>>
>     >>>>>> atomic_dec(rq->sched->score);
>     >>>>>> -  list_del_init(&entity->list);
>     >>>>>>
>     >>>>>>          if (rq->current_entity == entity)
>     >>>>>> -               rq->current_entity = NULL;
>     >>>>>> +               rq->current_entity =
>     list_next_entry(entity, list);
>     >>>>>> +
>     >>>>>> +  list_del_init(&entity->list);
>     >>>>>>
>     >>>>>>          if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>     >>>>>> drm_sched_rq_remove_fifo_locked(entity);
>     >>>>>> --
>     >>>>>> 2.34.1
>     >>>>>>
>     >>> Looks good. I'll pick it up into some other changes I've in
>     tow, and repost
>     >>> along with my changes, as they're somewhat related.
>     >> Actually, the more I look at it, the more I think that we do
>     want to set
>     >> rq->current_entity to NULL in that function, in order to pick
>     the next best entity
>     >> (or scheduler for that matter), the next time around. See
>     sched_entity.c,
>     >> and drm_sched_rq_select_entity() where we start evaluating from
>     the _next_
>     >> entity.
>     >>
>     >> So, it is best to leave it to set it to NULL, for now.
>     >
>     > Apart from that this patch here could cause a crash when the
>     entity is
>     > the last one in the list.
>     >
>     > In this case current current_entity would be set to an incorrect
>     upcast
>     > of the head of the list.
>
>     Absolutely. I saw that, but in rejecting the patch, I didn't feel
>     the need to mention it.
>
>     Thanks for looking into this.
>
>     Regards,
>     Luben
>

--------------XPo3OFFq6Zim57Vdbw1t5zvJ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 27.10.22 um 11:00 schrieb broler Liew:<br>
    <blockquote type="cite" cite="mid:CAODyvyypneTxCDUgUNB0UCm+eZtKn_yLJRxZ8nh-kg2PUkaTjw@mail.gmail.com">
      
      <div dir="ltr">It's very nice of you-all to finger it out that it
        may crash when it is the last entity in the list.&nbsp; &nbsp;Absolutely I
        made a mistake about&nbsp;that.
        <div>But I still cannot understand why we need to restart the
          selection from the list head when the current entity
          is&nbsp;removed from rq.</div>
        <div>In drm_sched_rq_select_entity, starting from head may cause
          the first entity to be selected more often than others, which
          breaks the equal rule the scheduler wants to achieve.<br>
        </div>
        <div>Maybe the previous one is the better choice when
          current_entity == entity?</div>
      </div>
    </blockquote>
    <br>
    That's a good argument, but we want to get rid of the round robin
    algorithm anyway and switch over to the fifo.<br>
    <br>
    So this is some code which is already not used by default any more
    and improving it doesn't make much sense.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:CAODyvyypneTxCDUgUNB0UCm+eZtKn_yLJRxZ8nh-kg2PUkaTjw@mail.gmail.com"><br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">Luben Tuikov &lt;<a href="mailto:luben.tuikov@amd.com" moz-do-not-send="true" class="moz-txt-link-freetext">luben.tuikov@amd.com</a>&gt;
          于2022年10月27日周四 16:24写道：<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On
          2022-10-27 04:19, Christian König wrote:<br>
          &gt; Am 27.10.22 um 10:07 schrieb Luben Tuikov:<br>
          &gt;&gt; On 2022-10-27 03:01, Luben Tuikov wrote:<br>
          &gt;&gt;&gt; On 2022-10-25 13:50, Luben Tuikov wrote:<br>
          &gt;&gt;&gt;&gt; Looking...<br>
          &gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt; Regards,<br>
          &gt;&gt;&gt;&gt; Luben<br>
          &gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt; On 2022-10-25 09:35, Alex Deucher wrote:<br>
          &gt;&gt;&gt;&gt;&gt; + Luben<br>
          &gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt; On Tue, Oct 25, 2022 at 2:55 AM
          brolerliew &lt;<a href="mailto:brolerliew@gmail.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">brolerliew@gmail.com</a>&gt;
          wrote:<br>
          &gt;&gt;&gt;&gt;&gt;&gt; When entity move from one rq to
          another, current_entity will be set to NULL<br>
          &gt;&gt;&gt;&gt;&gt;&gt; if it is the moving entity. This make
          entities close to rq head got<br>
          &gt;&gt;&gt;&gt;&gt;&gt; selected more frequently, especially
          when doing load balance between<br>
          &gt;&gt;&gt;&gt;&gt;&gt; multiple drm_gpu_scheduler.<br>
          &gt;&gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt;&gt; Make current_entity to next when
          removing from rq.<br>
          &gt;&gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: brolerliew &lt;<a href="mailto:brolerliew@gmail.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">brolerliew@gmail.com</a>&gt;<br>
          &gt;&gt;&gt;&gt;&gt;&gt; ---<br>
          &gt;&gt;&gt;&gt;&gt;&gt;&nbsp;
          &nbsp;drivers/gpu/drm/scheduler/sched_main.c | 5 +++--<br>
          &gt;&gt;&gt;&gt;&gt;&gt;&nbsp; &nbsp;1 file changed, 3 insertions(+), 2
          deletions(-)<br>
          &gt;&gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt;&gt; diff --git
          a/drivers/gpu/drm/scheduler/sched_main.c
          b/drivers/gpu/drm/scheduler/sched_main.c<br>
          &gt;&gt;&gt;&gt;&gt;&gt; index 2fab218d7082..00b22cc50f08
          100644<br>
          &gt;&gt;&gt;&gt;&gt;&gt; ---
          a/drivers/gpu/drm/scheduler/sched_main.c<br>
          &gt;&gt;&gt;&gt;&gt;&gt; +++
          b/drivers/gpu/drm/scheduler/sched_main.c<br>
          &gt;&gt;&gt;&gt;&gt;&gt; @@ -168,10 +168,11 @@ void
          drm_sched_rq_remove_entity(struct drm_sched_rq *rq,<br>
          &gt;&gt;&gt;&gt;&gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; spin_lock(&amp;rq-&gt;lock);<br>
          &gt;&gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          atomic_dec(rq-&gt;sched-&gt;score);<br>
          &gt;&gt;&gt;&gt;&gt;&gt; -&nbsp; &nbsp; &nbsp;
          &nbsp;list_del_init(&amp;entity-&gt;list);<br>
          &gt;&gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (rq-&gt;current_entity ==
          entity)<br>
          &gt;&gt;&gt;&gt;&gt;&gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rq-&gt;current_entity
          = NULL;<br>
          &gt;&gt;&gt;&gt;&gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rq-&gt;current_entity
          = list_next_entry(entity, list);<br>
          &gt;&gt;&gt;&gt;&gt;&gt; +<br>
          &gt;&gt;&gt;&gt;&gt;&gt; +&nbsp; &nbsp; &nbsp;
          &nbsp;list_del_init(&amp;entity-&gt;list);<br>
          &gt;&gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (drm_sched_policy ==
          DRM_SCHED_POLICY_FIFO)<br>
          &gt;&gt;&gt;&gt;&gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          drm_sched_rq_remove_fifo_locked(entity);<br>
          &gt;&gt;&gt;&gt;&gt;&gt; --<br>
          &gt;&gt;&gt;&gt;&gt;&gt; 2.34.1<br>
          &gt;&gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt; Looks good. I'll pick it up into some other
          changes I've in tow, and repost<br>
          &gt;&gt;&gt; along with my changes, as they're somewhat
          related.<br>
          &gt;&gt; Actually, the more I look at it, the more I think
          that we do want to set<br>
          &gt;&gt; rq-&gt;current_entity to NULL in that function, in
          order to pick the next best entity<br>
          &gt;&gt; (or scheduler for that matter), the next time around.
          See sched_entity.c,<br>
          &gt;&gt; and drm_sched_rq_select_entity() where we start
          evaluating from the _next_<br>
          &gt;&gt; entity.<br>
          &gt;&gt;<br>
          &gt;&gt; So, it is best to leave it to set it to NULL, for
          now.<br>
          &gt; <br>
          &gt; Apart from that this patch here could cause a crash when
          the entity is <br>
          &gt; the last one in the list.<br>
          &gt; <br>
          &gt; In this case current current_entity would be set to an
          incorrect upcast <br>
          &gt; of the head of the list.<br>
          <br>
          Absolutely. I saw that, but in rejecting the patch, I didn't
          feel the need to mention it.<br>
          <br>
          Thanks for looking into this.<br>
          <br>
          Regards,<br>
          Luben<br>
          <br>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------XPo3OFFq6Zim57Vdbw1t5zvJ--
