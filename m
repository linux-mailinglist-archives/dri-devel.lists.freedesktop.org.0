Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9081B60F0DE
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 09:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65DD10E02D;
	Thu, 27 Oct 2022 07:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2064.outbound.protection.outlook.com [40.107.102.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DD910E02D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 07:01:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XmEEmWGOlevrLvrE9+y15TSPRQxtqT4vWEqTG0yChTErD8WsUADixXJriJLN66reIKa6r/UOVDrVa3wXNZw6RC1fRuYu1qLoCMRMXNpTjATlUDN6K9VFYxdCjaseDR91j+khFVVOiqZ5Iibx+vCa2gVXnKv+yadJTW1QJlyebtCkei6Yc9L6FsNdtn/bLeq2sq68auQcDrPqOHkU8e33btkk0M/CZGVgaRpxvzQmWsU6otTVqliX1xszjBEhf0W5af9Q3IbLt90b+Q6vsVpa4jif80bNU/hm5bIz5MhYGpo0yAMVlNnWseddkGARgQtKrefM5Fc/oVX2zQldnmN0YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dCYG/9B1oDVmYEmxGrNGijWQ1zedUIBIA1vzuKNg1A=;
 b=C0+c0uqUF8Wq/dIRumdpSTU6kE8fSaqrHBbt87JhG56gdSwHi7mHZJYbkkZi8v3/8lLC7uD8ZIRAezZ4CtNKkvgmnVHjPl2+O8NVq3J/3vh5SCuO5J9amMDQhpp2oZl9yCw6XfpTyVhix615K5D/WvVU1m5Bi+fGPeLGDsBp3ZirbbXbG3+MYt4PeGmUpcAp7Pg9m2cdSH5Wg0NrHAx4A0KFCXZazss9Mxj7BkrIkBj9XLKBtLCKb3wNNPcqYJnmZWPzhE3QW95oOyj38tko96ZSUGNQdptaVx9P85PMHNH5LKe1QmnM7ncNHG7KYiV+9UyaLWCS65HHeb5daGgL+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dCYG/9B1oDVmYEmxGrNGijWQ1zedUIBIA1vzuKNg1A=;
 b=dN5pumAHfeQb+KDtdoejQLe08LcVt3C1tYw9VibzTJcNBjVR6xJ9bEz0M5b9PswAlwxLt3j90GEWaQsCnTnaacoEFKGrJ1UrwCFJJlzBHT5eENvvundOcUsiP93T5/10J4N/1PBn+C+azxyt1U2bfv0O7qc3PaA5UKXIgHL2hYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DM4PR12MB5231.namprd12.prod.outlook.com (2603:10b6:5:39b::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.28; Thu, 27 Oct 2022 07:01:46 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 07:01:45 +0000
Message-ID: <69e672a5-a68e-7bad-fc49-4281c1c6039d@amd.com>
Date: Thu, 27 Oct 2022 03:01:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-CA
From: Luben Tuikov <luben.tuikov@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, brolerliew <brolerliew@gmail.com>
References: <20221025061846.447975-1-brolerliew@gmail.com>
 <CADnq5_NweAo-7snRLkidNkOizu7Ft+7GgXCS2Rnv1oxmRFb_RQ@mail.gmail.com>
 <a70dcda0-6723-38f6-efeb-e8edb16dab55@amd.com>
Subject: Re: [PATCH] drm/scheduler: set current_entity to next when remove
 from rq
In-Reply-To: <a70dcda0-6723-38f6-efeb-e8edb16dab55@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0143.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::28) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DM4PR12MB5231:EE_
X-MS-Office365-Filtering-Correlation-Id: bd305be2-0da4-4ad6-0ae2-08dab7e91c40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B8DFv8P0M9Z08Mv+eljejqdOkdTDj0dGI1QZ5xdn8RIeG6qDtiF4sXBeIhq6pthWtMsXBaVHzrRMcFZdjPmZoCCZcXb8TYlqcRYui4iJ/YNMkaYXiK2DnpXGfsvKqHTLDwuP/4c+Iv55NcT2Lh1WVLXgjns9VRXX4Mm0Kab5DbXUPJWtld+zosExL4PF7h9QMh8WDxclUkMAM/0CANMFCVpk17Lz3obOBHDFg4XbuNET+zdyvWWmpGUlTukgDrciJ4+IbNFis+RSpe9927zRZraw0jTr7fNQi+2+8p0xeIVXI4yr/P1yISEIHO5OdZGb2KuJLGpHMpvWkm2USQRhc6WK6a1lqB4avYX7HHfbinmRVHnfMsOi8YErId1U32gRL4Bbhgcl6jly3OG8Y23++3dqSQMmhZrrcrM/og0crZO+uD/5tHK9SVC+BXPBh6ooJeaWDOoHOVk9CcEBcxzHvEkKv11a0bUdiSB5+VlAMhUxjmgls1Ktm0lby9ww7rzaxFtLigen58xW6tm8wwNMG4zOuN7lBStZN9A/MH7GRQ2QN5dqdtDjywWqpYoiXDBz4usz2s7CbDwZfS+aqTSAPpxECtiyhirIfqy7XutdaOg51RW+IOjnz3TORAVK14HeL0m7CoYOzOvQOIxCz5MQJUcnvB0R0a+6sIWK0+P7xQs4oO+BJ2wYt3XJepRcFTsGoIVzGrQ9tnqZRy4G4zmSnCqu10gLMWw7hov2XwsZzaeAiuWFC0tm7Gv9MAo53sy2xZdmF3qtNIR7f4mp2wVaCqhXl+KlxHjcZVxRlaIdcd8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199015)(316002)(31696002)(83380400001)(4001150100001)(6512007)(110136005)(53546011)(5660300002)(8936002)(4326008)(66946007)(41300700001)(26005)(66476007)(8676002)(44832011)(6506007)(86362001)(66556008)(2616005)(36756003)(6486002)(31686004)(186003)(38100700002)(478600001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SThtMFBUY3A1SG9KNFphWjVVWEFVSmxQQVZiY2I0NGl5QmlEakVPTGFiMFZp?=
 =?utf-8?B?N3NZZkx6L0JNWWYxRXQwa29ZVXdZQXIxZSs3Nm5zUmgwTFlKb2lTTEVYdUpS?=
 =?utf-8?B?NVRRcnpQU1JVQStuSTV6VEFXZkJxZzJSZFYveEtWVnBUWTMwWkw3ZmNXWjVT?=
 =?utf-8?B?Q01QQVFKZWQvN05PcDJmcmZkVExhQUFrYjFxaFY0dGg0RWlyTGg3Q1RvNk03?=
 =?utf-8?B?MXE2V2Jzc2J6STBiSzNMa2NZajRVazdHWHhDcUcxQkJQMmxFbHNmZHYwZUYw?=
 =?utf-8?B?ei9PNGw4b0tyVkxQTTMrbVA3YTVOTjM5dWZDNUxicHhlYTQ2eHdPajFvRllq?=
 =?utf-8?B?MEJkcUdaUWtmTG00TEZHcEU0eXhyWlo5ZEpzWXZhMFNHVVZRMWFQOFNNUFRt?=
 =?utf-8?B?NTkycHFsMFphWkNweDJTWlFGTUx1L0t1L0FnR2czYWxUeE9oOTVkcWQybVBt?=
 =?utf-8?B?ZTdWeUlSNUY3YWFHRUJGTEZLZC9GdGFPM3B6UGtPdENJVUFYK0lqQy9VUnBv?=
 =?utf-8?B?Q1YvTjNOL1JSd3hPcjdhczdRTkp0dTdxRmpVT0dpbnFiMGlncHEvMktSRjJh?=
 =?utf-8?B?dFh0ZERUYWtEUXRKdTVlWmpzNjhDYXp6cDhTQWdwcW4ydHhJSlpERFNJYlkr?=
 =?utf-8?B?SGN6Z3pIRHVCUis2SmpkcVRoUEpzWThoVlphYStra3RwWnBKbnFqK2pPTVNx?=
 =?utf-8?B?NjVVZnFwYWtRWUVNd1VYdHBCdVlyY2xCdGFULy9KUXpSSTZiaVJhand4b0U5?=
 =?utf-8?B?Rmw2cEhFWDBGZDFkVE9hQXg3em9IOXdzTmt3TGl3Z2gxYTJzUy8vVElMWXdq?=
 =?utf-8?B?eTAramwxM1Fpdy9wNUZvR0tsWWV2MHpBV2crdlNtaktkUG9BcTdOdUp6MFNW?=
 =?utf-8?B?T0lnSXNaQ3VJamR3ZTZ5NFJ6NTVOUTJKODJyOEZuSjIzV24rcStGQmNuTUlF?=
 =?utf-8?B?dU9MbWc2UW9TR0Q3ZlhUeFdiMTJ4eFZYMzdxYjBCajBrUGlvS0cyNTNhK2d2?=
 =?utf-8?B?Z2xkR0NnRkplbW1OYmYybG0xZVN0TnZlZVZTSnpnRVlhZ29vUHZYRTRiTWth?=
 =?utf-8?B?eFdIdkNLR1lZYkN4cDkvNGFJV09paGRKOWREWExlMjJDOFByejRjWlRrazkw?=
 =?utf-8?B?YlVyNVhOY1k4UDFTUXVyaTk4RUxzcFpnUTZtQklGam00Z0hScEowZXJUOTZY?=
 =?utf-8?B?LzhNalZtRlVtVDZvNXBNOWlZdjMvMDBPQmIxRzYzSTRFOHljN29IcFEyTXFQ?=
 =?utf-8?B?YkhIbUg1U0V2QS90dVhrRklNRk1UbFVVZDRkWXF2R3NnY2txa1MycmY0Z0h5?=
 =?utf-8?B?ZDdMZ0VNMjU1S3Bta0dnMFJWRFF3Y0Znc0tSL2N2bFlhb3FnNUhReHdCajg0?=
 =?utf-8?B?MWRWTS9VVjA1cTVubUZkb3FiSDRmMEt3U3ZyUXh5ZmF2OFh2NG1IK3JkMG1C?=
 =?utf-8?B?UFFSOGdvN0dsaDIzUWRCM1lwYXU5TEdGYzhzbERHcFRIZ201QTF2QVp0Qzht?=
 =?utf-8?B?blJBTExVeUwrSEJpcUdzNjdTUU5Wa1FHdzlZRW1DeHZ1bWtFd2ZwcnZ5enh2?=
 =?utf-8?B?K0Jpb2lIb1dSN1NpRElhR01TWVpOdkZ2dyswNG5jSnBqYUlEMy80OXZRc2Yv?=
 =?utf-8?B?OTNoN01tRzVxcXhlM1JJd1NteDFUUU1HVmJZeEl5NjNIVGkrYXFoSFpxVkMv?=
 =?utf-8?B?dTBZTHV0dDdRRVNldTdsYlZzU2FwU2JzRE1OaENSS3FhbnVmanFRd0RuN1Va?=
 =?utf-8?B?aVQ1SlVYS1FJaDE1bks1RlgvRDBYTFg4UmJuTzl0OFA3R2Z1clJsZ2U2cVE3?=
 =?utf-8?B?b2RjYThqcWpBNzBNczIwN09qNmg1U1hXd1FBVkVpdWVZM2Q4UzZrUWx1c253?=
 =?utf-8?B?Um1KbDlLcmkxK0FWWUlnWFRvb2M0bFRmdGpPSG82VDNKQ3VJS3I1WFJsZWtI?=
 =?utf-8?B?U2tBenBFK2Z6QlJmWTd0RmtkQTkzVXZKU1hLQTdSRURNNmNkSi9lZm5ERmcz?=
 =?utf-8?B?MS9Ickk2K0I1MVBvbHlxY1ZpMjR0R1BzYVh6Qk96VHF1bVlGeVhuK0F2Zjkw?=
 =?utf-8?B?MHVkUENZWk50Mk9XWWZXM2xNK2NBNFNLWFhDV0dveG15V3BFUVhiTFZNSDhV?=
 =?utf-8?Q?lHxIfWcQuV9q3d1UfCM3+8oFE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd305be2-0da4-4ad6-0ae2-08dab7e91c40
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 07:01:45.9162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZRY67aPTXy9lK419C04JLJGCMQNtdjcw4N5JYBwjoPDFC/FrkXJC57GI/88+60a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5231
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

On 2022-10-25 13:50, Luben Tuikov wrote:
> Looking...
> 
> Regards,
> Luben
> 
> On 2022-10-25 09:35, Alex Deucher wrote:
>> + Luben
>>
>> On Tue, Oct 25, 2022 at 2:55 AM brolerliew <brolerliew@gmail.com> wrote:
>>>
>>> When entity move from one rq to another, current_entity will be set to NULL
>>> if it is the moving entity. This make entities close to rq head got
>>> selected more frequently, especially when doing load balance between
>>> multiple drm_gpu_scheduler.
>>>
>>> Make current_entity to next when removing from rq.
>>>
>>> Signed-off-by: brolerliew <brolerliew@gmail.com>
>>> ---
>>>  drivers/gpu/drm/scheduler/sched_main.c | 5 +++--
>>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 2fab218d7082..00b22cc50f08 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -168,10 +168,11 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>         spin_lock(&rq->lock);
>>>
>>>         atomic_dec(rq->sched->score);
>>> -       list_del_init(&entity->list);
>>>
>>>         if (rq->current_entity == entity)
>>> -               rq->current_entity = NULL;
>>> +               rq->current_entity = list_next_entry(entity, list);
>>> +
>>> +       list_del_init(&entity->list);
>>>
>>>         if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>>                 drm_sched_rq_remove_fifo_locked(entity);
>>> --
>>> 2.34.1
>>>
> 

Looks good. I'll pick it up into some other changes I've in tow, and repost
along with my changes, as they're somewhat related.

Regards,
Luben

