Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFA35AF67D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 23:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C39210E20D;
	Tue,  6 Sep 2022 21:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825CC10E20D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 21:01:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3oAISrFX5nIKl0ayMfOljixvutguBUBdnOHpli9VQHRRfIXpOlJfgpqJ/Uz0UHYwbRbxRx2mKXfYlW6Hi/jrkc4ToVpH/1uGtvMPKD/NFw89+9Q/Ggw3PumDqeQJjZ6bwsbbzc1B4eXMlEpJiQpq5knY8j91TEYdP1niiR71852MKc2iOoEYX+DvXuXx+bsz5s7f3ayGg0wjAKLzKiWd1UmE5wCS09TaRMavXqxgYP7O+hZfUUk9kGX4mLKfRPPJV0YiHk1qr2JhkCJde1ORpc1NScuQ++xWw4zjAgMiYEni/9n8a5jz6n3zFuhX0x2DGCjJcmtPnb2xzDDdCS6zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UyoMs6tRHa+cgVZ2hann83YfaVw0WhM26muL1oeDIjU=;
 b=J97YXC2wp2asViJzcEE+BYpQLjuUQyD4mTFTYR2FnC3HZ1Y3pwE9qo7kGjYBCtQ2yGZHZhdYKqiS7PiH2lNi4bCUaLunuwUBcze1hxMaAcxXRtjWhga4WPxt0AVYtNIBRNQr/G1vWyU8KbYQ7txJmiTR9dcp+/xGpjA5iIDoAFzavUaYwVFRBf3Bbg4BQakaS525IjytHEAJfQAZj/Qp9YhMD5xAp4+dOvWRzOUAbabmput2yEWWieNhZWUD9NP5LaFpajM6O9EzUYgjeIGIITbU65mQL8y0mUQ3+ol1EmsglorqyhTTCYWkC7M1Z6/6h3Ke+PdY8RolqoFy8lLojg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyoMs6tRHa+cgVZ2hann83YfaVw0WhM26muL1oeDIjU=;
 b=dVCc4EPnWLWoCWoHz4TWUTcEcYQC8QDChCRgsDgI9zUc9Sy8DmXxWFhjY1BOv+3dFoTXiKUUNCKBb4JXeCghzgMhLCfhOkKJoWo1u+nN5wWJlJoWpj9f/fXD7fI+5/eKokBfY4GWdXgggHKfHm9yYnSkSYAvRukfYMv7JHek4Hw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by MW3PR12MB4492.namprd12.prod.outlook.com (2603:10b6:303:57::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 21:01:54 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf%6]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 21:01:54 +0000
Message-ID: <e0e94b1d-3af8-0723-426e-e35601faf164@amd.com>
Date: Tue, 6 Sep 2022 17:01:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] drm/scheduler: quieten kernel-doc warnings
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20220404213040.12912-1-rdunlap@infradead.org>
 <68961bab-6448-9a98-8916-9c3cb0c5d020@amd.com>
 <e61a6903-550d-df70-6297-f49cc2750244@infradead.org>
 <ddde170c-7f2c-d9bc-7044-4c609bc915b5@amd.com>
 <CADnq5_NEgVxjAOgvire32K1=PTGzHcs3GL9BqhmQCqq3EBzVDA@mail.gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <CADnq5_NEgVxjAOgvire32K1=PTGzHcs3GL9BqhmQCqq3EBzVDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0143.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::22) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a76c6c6-2068-45f1-0839-08da904b06d3
X-MS-TrafficTypeDiagnostic: MW3PR12MB4492:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3t8yFX71rVlveXAO06VTemoS4iOivfw1BAbwEtPlfJlpDGaz3+bIscxcEu78YcBXmmLdCjQbWxNGPCczN+CC+b4D3r66ZkOTnb7OJqms36j1LBH9k2EL0p+4AdFy0iyOcHpQq3PQU1WV8BxM0TKm/8qHZjHAXYKbIyLgwLotD0QN0pqD9b54xs6mGaEmJ2aofKqy6Jay3EJ/zUo95js8kU+ZbkJ5VIucQlfhfnh6gR8zQnDOWJ36Nkk/8xlyPJBOwY1Q+12emdjhUQT4buMWaUJVxPdMlocJhSw9Cg2Hzuwc1Gzi1wncv30KulSFqHJWSWSDSgz1+r721MIC2XtXXgAaSMGZXc3wTnvgguNS5pxMwgPsjXOFawD7uhHCrZXz3vP8LcO+wu/lXSCsSOo9tXPbzKDM4gxX9WvourIPeawL/q15RQC2tIJezlzUYPBTfmaDDtp8VHWe1hueSjXKRZm6w436EQrUMLp/p+X1Uh7GA6WSOGHJk51faFSdXikGHOnlXUw9gjGxjhM7Mxi3tOgrkXf9su7mwtJzqCM343yoBb1e/wGrHqlN+Wgq1pbgRml5IhenhRzS0RaWqUnHUNjPbH/r1c1CzHJ2LSbI21wo9hslJVIKy3bO8gdL1UMtxHRnofegfbVxJrVuEGisO7/N7aoo38MXVJA1GRc3wiG7V8mnEdzLNp1DeKP9udbkOZpjx+kDjE0MDyNNER64PsBJ7rshDhCiqXJyyCRF9uY+e0KfKZsTfQ21Kwu8qucWI+4SND9N9Oq3mTkeJBig9FfxzTL5GQo0lci9i1WIsCQo+ZwNc1R0xuc3RYWJaPU1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(4326008)(8676002)(83380400001)(66556008)(5660300002)(66946007)(66476007)(31686004)(316002)(38100700002)(84970400001)(6506007)(6666004)(478600001)(66574015)(41300700001)(53546011)(6486002)(31696002)(86362001)(6916009)(54906003)(36756003)(186003)(6512007)(2616005)(8936002)(2906002)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rko0alhhU0cvRWErYlpybkdmSDhtdWRsKy8zT3N6bXl3V1M5NUNoQVFLRmZM?=
 =?utf-8?B?M1YzQng2QUNnYzI2OWNTd2phcEJHNEN4ZFh5c0FwRlJyVDE1K2pIbnhvTkMr?=
 =?utf-8?B?aFFGVWtuSEUrZ2l2ejNDSXkwMENHNW43dlBrdG9ZdG1INGhOV0tvM1BoWmFN?=
 =?utf-8?B?c3FhR2UyVldIWWV0d2RjM2Nod1FITUZsVk1neHNhRTF1OVFQOXQwYktLM0Rq?=
 =?utf-8?B?d2I2Q2FyWmpVdzBrYTZ5ZWdsRnhwWnpqN05MbGoxM1ZtYUVSYS9LWnBvb0d6?=
 =?utf-8?B?ZllJYnhCWlA2WExOdmloeExZV1FXK2s0V25KYXI5dWxvVDAva01NNFBFWGxn?=
 =?utf-8?B?NkdRbzl0ZU9rbGxzNkdobXRhT2laQTZDcnFjN0NnRTIzUTF4bGJ0TTdzZ3Fm?=
 =?utf-8?B?dlU4TTN0R0ZXUGdaYzJUT0tDRldObFRuV3B3TTNJc1NPSlh4dllrWGNodS9h?=
 =?utf-8?B?Ym03TTV5bzhvRU1jK0FZWmpFSEJkMmkvV3VhdzV5NzBPZEppUHZvbzAweGV0?=
 =?utf-8?B?SUhvQXM4VkVoaU9yOFpWZkdobTBDM1dBQlM2aWZySGRpdU1EU3lOTGs3bVRZ?=
 =?utf-8?B?cEN6UUVHWUUxMXBwaUc5UVI5NE1UZkNnT2E5WnVpT0dTMndwTzUzTUVxbVlJ?=
 =?utf-8?B?eHhMc2l3bDFNZy9CNGZMTDY5YWZPcDFkSDZiWTlDRnV3TXdHTmE2cG40Tkd1?=
 =?utf-8?B?NlRCZnMwTDRwNWNwNU8xOTlXNkx2MGJyaEYzUWh5c1VRcVlpMWpITVp6UWxE?=
 =?utf-8?B?akpYSmFsL25tcTEwNGhXZmV1OUNnR0drekhRWFVYQ1plMlR2RVI5cWsxS29q?=
 =?utf-8?B?VWZDN3Q4QVR6OHVVN29ydzhSaU9YaHJJQXlsUW9CNExHemEraGwvV3FabmFM?=
 =?utf-8?B?dWFTa2syVjVWRWEvRlJONWVCU0tvTmt2K0xZMmFxbXZ2K01sZ21qRUJ5K3l2?=
 =?utf-8?B?cTJUQmw5c1l6MUNuN0RtSnNFdzRKZGhNNE9nNUhjUkJwRk5CN2FTTGFCYWww?=
 =?utf-8?B?UklVQ1dINnRPaGJyTmtuUkU2ZHlVQ0lWNmh5cXNSTWhBMDlhUTgvTEhySjZz?=
 =?utf-8?B?SlFNWVJuejJHZTZvWEJhQnYvSEJMQ3JxYy9tcUgweWYrVktIdkRXTFpRRlF1?=
 =?utf-8?B?SVRpM2UyUXJOeG5URHljRWwzUlJPZXlCT0RxTjZuQkREVVBvRTV3MkhrTTIw?=
 =?utf-8?B?R1EvczNmcnJSNlNlM0tqN2RFMFMwOWZFVTNjZm1WcU5yU0Y0QzE1am1wb1VR?=
 =?utf-8?B?UkFhZXNTeERldkZmWTJHenQ2KzE3TmZZeCs5TGc0M1lsYUoxZTVENjkxc2RU?=
 =?utf-8?B?UmVPMGpEV2NYTGE2WThoS1p4SFpBQXVsMXhET3QwQlFXNGhyb05oN0FMWm15?=
 =?utf-8?B?SEd6VVJQTTUzdzVOUXJFMFN6ekVlM3g5MUowMXkzUDM0ZkJRMXllbmNOQVlB?=
 =?utf-8?B?dUUyRXdxaXBsRGhkY3BRbVNpSU1MVWlCUkd4c1VsMm1iNngxQnRHbmN4ZU1N?=
 =?utf-8?B?YUhuT0I2anJWRWRKTW5tMWNpdmdjR0JiRTZ1L1JKc2RSOVB1ajNSMHVYVWJX?=
 =?utf-8?B?NVBsK0FjaEs4MVhYWlVFeGFRUGRhek0xVmUwSUp3MUhCUjlHcmZhT2RrcHNM?=
 =?utf-8?B?VUF3clVTK3JQUUxaVVVpU0VGRDBvQmpndVhCU0w2Q3kvWHIwTG9NeFpYR3o5?=
 =?utf-8?B?b3NpaFBGUVIyTWJwbmUxWUZKVW85alQ1WTh0N2R5UDIwWHFMRnpYaVV3Rys5?=
 =?utf-8?B?eXhSdm8wcFFtSnVyT1JjTW1CNDl3TkpxeWh4NnB5UjNkb2tyd1VORy9ZcjVj?=
 =?utf-8?B?WkNFRzVKVFlSMC9YdS9vZUNXQTVhL0dLUm85MFRWcFpzQXZ0MEYySjN2THp6?=
 =?utf-8?B?MTc2dm81bTZLUGd0RmlLWkxOZlQ0eFF6ODRWUURKRGdTUFA4RHQwVkFZZFBB?=
 =?utf-8?B?dSs1NDMzeDJpY3FMSHR4OWRtc1pXUkVZemVQL05FeGp1di83VHdRMVg4NTJ3?=
 =?utf-8?B?aGZqL3BZUzR6MmRtL1BSWWE5YmNvUGhFK04vcDVJcVVTYjhab3Q5d2pLSEVG?=
 =?utf-8?B?dzJUcHZwd09uQytUYS9JYy8zdEhTOVdkalRDMXBWbFRpb1B4S2JDTlo3K3RS?=
 =?utf-8?B?Y3ExczFuUlZsd0MrVGJFaUZPYVhHT0ZubEwyeTErSm0zNHAvY3JwRUt1RDM0?=
 =?utf-8?Q?/6ouMr8TsNlS2Ex3XWmhCKrheCuArzOs9GS7SpN6sXGI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a76c6c6-2068-45f1-0839-08da904b06d3
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 21:01:53.9661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GmAy4oUFEdigV4SzMhFNcB5Q0le4LEHXKy7qxTzHlJUehBeDeCe9pWAlEZ+MIprmjOhEw02BFDKaaIFjRaofGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4492
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
Cc: Jiawei Gu <Jiawei.Gu@amd.com>, David Airlie <airlied@linux.ie>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nayan Deshmukh <nayan26deshmukh@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pushed to drm-misc-next

Andrey

On 2022-09-06 13:57, Alex Deucher wrote:
> On Tue, Sep 6, 2022 at 1:38 PM Andrey Grodzovsky
> <andrey.grodzovsky@amd.com> wrote:
>> I RBed, see bellow.
> Can you push the patch to drm-misc?
>
> Alex
>
>> Andrey
>>
>> On 2022-08-31 14:34, Randy Dunlap wrote:
>>> ping?
>>>
>>> On 4/4/22 14:58, Andrey Grodzovsky wrote:
>>>> Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>> Andrey
>>>>
>>>> On 2022-04-04 17:30, Randy Dunlap wrote:
>>>>> Fix kernel-doc warnings in gpu_scheduler.h and sched_main.c.
>>>>>
>>>>> Quashes these warnings:
>>>>>
>>>>> include/drm/gpu_scheduler.h:332: warning: missing initial short description on line:
>>>>>     * struct drm_sched_backend_ops
>>>>> include/drm/gpu_scheduler.h:412: warning: missing initial short description on line:
>>>>>     * struct drm_gpu_scheduler
>>>>> include/drm/gpu_scheduler.h:461: warning: Function parameter or member 'dev' not described in 'drm_gpu_scheduler'
>>>>>
>>>>> drivers/gpu/drm/scheduler/sched_main.c:201: warning: missing initial short description on line:
>>>>>     * drm_sched_dependency_optimized
>>>>> drivers/gpu/drm/scheduler/sched_main.c:995: warning: Function parameter or member 'dev' not described in 'drm_sched_init'
>>>>>
>>>>> Fixes: 2d33948e4e00 ("drm/scheduler: add documentation")
>>>>> Fixes: 8ab62eda177b ("drm/sched: Add device pointer to drm_gpu_scheduler")
>>>>> Fixes: 542cff7893a3 ("drm/sched: Avoid lockdep spalt on killing a processes")
>>>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>>>> Cc: David Airlie <airlied@linux.ie>
>>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>> Cc: Nayan Deshmukh <nayan26deshmukh@gmail.com>
>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>> Cc: Jiawei Gu <Jiawei.Gu@amd.com>
>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>> Acked-by: Christian König <christian.koenig@amd.com>
>>>>> ---
>>>>> Feel free to make changes or suggest changes...
>>>>>
>>>>> v2: drop @work description (already done by Andrey)
>>>>>
>>>>>     drivers/gpu/drm/scheduler/sched_main.c |    3 ++-
>>>>>     include/drm/gpu_scheduler.h            |    9 +++++----
>>>>>     2 files changed, 7 insertions(+), 5 deletions(-)
>>>>>
>>>>> --- linux-next-20220404.orig/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ linux-next-20220404/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -198,7 +198,7 @@ static void drm_sched_job_done_cb(struct
>>>>>     }
>>>>>       /**
>>>>> - * drm_sched_dependency_optimized
>>>>> + * drm_sched_dependency_optimized - test if the dependency can be optimized
>>>>>      *
>>>>>      * @fence: the dependency fence
>>>>>      * @entity: the entity which depends on the above fence
>>>>> @@ -984,6 +984,7 @@ static int drm_sched_main(void *param)
>>>>>      *        used
>>>>>      * @score: optional score atomic shared with other schedulers
>>>>>      * @name: name used for debugging
>>>>> + * @dev: target &struct device
>>>>>      *
>>>>>      * Return 0 on success, otherwise error code.
>>>>>      */
>>>>> --- linux-next-20220404.orig/include/drm/gpu_scheduler.h
>>>>> +++ linux-next-20220404/include/drm/gpu_scheduler.h
>>>>> @@ -328,10 +328,10 @@ enum drm_gpu_sched_stat {
>>>>>     };
>>>>>       /**
>>>>> - * struct drm_sched_backend_ops
>>>>> + * struct drm_sched_backend_ops - Define the backend operations
>>>>> + *    called by the scheduler
>>>>>      *
>>>>> - * Define the backend operations called by the scheduler,
>>>>> - * these functions should be implemented in driver side.
>>>>> + * These functions should be implemented in the driver side.
>>>>>      */
>>>>>     struct drm_sched_backend_ops {
>>>>>         /**
>>>>> @@ -408,7 +408,7 @@ struct drm_sched_backend_ops {
>>>>>     };
>>>>>       /**
>>>>> - * struct drm_gpu_scheduler
>>>>> + * struct drm_gpu_scheduler - scheduler instance-specific data
>>>>>      *
>>>>>      * @ops: backend operations provided by the driver.
>>>>>      * @hw_submission_limit: the max size of the hardware queue.
>>>>> @@ -434,6 +434,7 @@ struct drm_sched_backend_ops {
>>>>>      * @_score: score used when the driver doesn't provide one
>>>>>      * @ready: marks if the underlying HW is ready to work
>>>>>      * @free_guilty: A hit to time out handler to free the guilty job.
>>>>> + * @dev: system &struct device
>>>>>      *
>>>>>      * One scheduler is implemented for each hardware ring.
>>>>>      */
