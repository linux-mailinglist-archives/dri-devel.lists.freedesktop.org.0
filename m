Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A86E89177C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 12:15:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C44FF11265E;
	Fri, 29 Mar 2024 11:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="r5YsriSp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2138.outbound.protection.outlook.com [40.107.93.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB79411265E;
 Fri, 29 Mar 2024 11:15:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EkMeNenO/r5cqtn1olNlOBkJq1Ym42C5lG+qg+NyRYZ1vJixWl3pT/8ZrlTNnjLqlmiOyrebnlB1QH/mT5bvoghUXbSNsva7HDBSRP+PBW2LZquJJWK01MRSwdAwpCqo5LTk9qj8dY/yHrFWmu9RzNGXhYhTwLS+56Hif0YQA7FsIRUIBQQqoxUGUWljOIrNA/n95UQgLUCKOkVtSap/eDcEM54gcirz+f0/fzORlu9ZzDyv5UtThHk2o8+HaV0Jt2MhhxieUSf+xPXuRAEEyh8G8EWT91exPc4uGS7Ktvpp1D+gVBtt8Da67O43Jxjhu57LTbDU3/lyBRExlaJRng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltjyCfUStfIrGkVhqmASdl40r8uHaBEysnD8cOfIGXM=;
 b=n7ouWIKkjC97iEYbCy3w1dOlPIkbqEhb5giKqQcK2vxlj64NvYvzeXswAd9NBstC6wSWYAdHmzfTlna2ZcYjf7nxPriiusB/nPf1Qn6LsFP14obnJfMvOT32LXbKC86SeusLbXH6XLwffpEaXjrjHifcNQToEvfU5y2Kw3QcruoyfFXy49DcJjExdlOgheqs/GnxZ/02gaZ5rTI+3lmKgk7OJHslrQJZOL8REInxChcvnvFMiPk8QuVNkb07ddlxvYG3xHCmx3N6jLkk+EfszTtA7yPlXXKY4tGCHG6b1oR38ur2077GMulXJ5EywQw8ik6nYeaCTk+exS65f4urCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltjyCfUStfIrGkVhqmASdl40r8uHaBEysnD8cOfIGXM=;
 b=r5YsriSpWsmwe3aG/9Njlc7LJjdQIdZ7qJ9VCYfH71+/UvZ8A60/LRN+dN9EtEi9ldEWRIxjGskj7P1zZlN+4gI1EEkxhN9HsmSi6znIjdVpP8dc7zOCGAo3ejlTdjB7HsA+EOQhXePeYl4US3azp7M5OeaqzqyT8t3Mzo2w+SM=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB9077.namprd12.prod.outlook.com (2603:10b6:610:1a2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Fri, 29 Mar
 2024 11:15:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7409.031; Fri, 29 Mar 2024
 11:15:17 +0000
Message-ID: <f4c04ec4-b385-4cd7-af7f-000282443246@amd.com>
Date: Fri, 29 Mar 2024 12:15:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: remove unused paramter
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
To: Jesse Zhang <jesse.zhang@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>
References: <20240325074540.2426476-1-jesse.zhang@amd.com>
 <f497b2d6-171a-46ec-84a7-cc148b39b992@amd.com>
Content-Language: en-US
In-Reply-To: <f497b2d6-171a-46ec-84a7-cc148b39b992@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB9077:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YT6maHFvWxxS1UZqbr2JhXjOB3kR0c63uF3y8m4fEVVyqsL8qCAbogNFMPoe3CEhRuVzoKoPm97HQvcfr8pCCWIuzOXNz7i41d+XVfqCR83lUDn2FsoIFbgDMH/TxlQFrZomAtoziFEhoI76S3EsZztc0RDhQLbMHikIvDg7Np2Udk9EPuXmxOUisG+Zvb+m+jRZYxcWI9dJEOWpJAX1kYu5vQ9gBJ2IMHVd7jHu1OhzHALF8gL7W6jFzGjCY6olmHsV5gM6+SkZb+l6/kmc7Cp83Xkd2y3XgdLrxC0OSCIt6bjBn4jmcvYdPOgww+1xnV4Z72kxv0JNsaB0WjB/htzQAcCBPTfYIQm/h5hm/45OrYU0h+fgehqKPNzJ7HVW38IvVlnZcyro4XilyCDoV/o3TuXFxKAHbSvTWEQGE615z7SS8lm9p9i3I0njjOPP/qy8IQ1jPHblZkOAJL43ie8MHz3fv3NUsXd+QaQP5nd93i+RQe6CUMib0GFLcBbCSpnawl4JhZxgXE8PMIZZrIk8pngDhvimTvZ2iSBl2xW9BXFLOuIFlOhU25NRpST12xkQAa6hgjxFstd5I/aDDyQL/VYvHAoAljcZUoysKbaspIVkyZi2Nz/dwe6Z9xcuNKPnmU/vXg452mb0fqnWFXoGeKZ30wYQ5Msx8wXgzHk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3NGZ2ZsdU5JdFlKUkNYRmxoc3hVVFdqZC9GRUx6S2ZkZW1Eam54d01TbnRy?=
 =?utf-8?B?STEwbThwbmt0NExhR1I1TUN3aW16ZFNic09HWXlFUHBYTk1YTFp0cktXblJF?=
 =?utf-8?B?WnltVXVDTGgxTzNNSWZjeXNzNm9DMXNWcDk2UlpMc0dnM0Z4TmJoMXJEbVh5?=
 =?utf-8?B?Snd0eDBZTEFuTHRsbnF4SjVqeG4zWXczblYyc1lXUTNCc3NBNWszRE5xVGFK?=
 =?utf-8?B?VitGVE9jaGI5c3BCNzk0ZGlHWTFkQVlVRlAzZVZPM0FXQnhmVTdSaVhyeCs3?=
 =?utf-8?B?ZEJXMEpXVE1WNVhYR1RWWGxPVndzaDNRUzN3czRFSFVWeFFMK2xFVHZJVlNk?=
 =?utf-8?B?SkVvTlp5TWJ5czZzR0pKRStneUExUmw4OEpENmlMdm0zRTNLQ2plZFVmZ0Zs?=
 =?utf-8?B?aWE1Tk80akFQaFlOT3R4RngzeEhaT1dTMzJzbVowOU93YUszSW5XeVZUeDdG?=
 =?utf-8?B?ck5rbE52ZnhaZEliNjY3aUJ4VjBwcEl1bHNrd2lqR2dUYnJyc2FPb2NHNjNM?=
 =?utf-8?B?dWhHQmhiYUtNdHIyM0RRNi9Sb1NRMkFwbWNybTRwWUdJMVRIS0s5UjBkTVI1?=
 =?utf-8?B?cW9FTDIvV0R3VUlXVENFNmhrbjZ0TXhicEQvZXhCLzNHbThxTDJ0MFJGTVNV?=
 =?utf-8?B?WDBSelFVYk0rR1JkZ3h3eHFIQ1lHZS84ck9lNXREZnB4QjB1Vzk5MUp2N3RB?=
 =?utf-8?B?RWxORXVMMEtIbXY2ZE5ycURDV0V6RmpPeVIzWWtmRkIxV04yVTJPSU92RDhY?=
 =?utf-8?B?ditJWEJwRFd1LzVwdUYwSC96OG00ZCtpcEV1TndiV1ZESHdNQXNtMFpvWFBZ?=
 =?utf-8?B?QWJyNWVsRzFadXpyUnlRc2xLcEZzZ1hVOTRobllyWUErQjYrV1k3eE9uS3hK?=
 =?utf-8?B?ZW5GQ09mcW92eWROR3k2SEpDY0phbXUvb0x5L2o0OHZZTjRqcjRZTFFGeDl5?=
 =?utf-8?B?WVdUeVhZUksvc1JyRDZ5MjJaV0FoY2d6ZXNuOUtWTXczcjQzdjRjaWcyNWNk?=
 =?utf-8?B?WGpXeEFmbXdnQlU2VytiUGlUWmR6MWltQkhKZUhaaUEvT2h1eWdGeXpUdlk4?=
 =?utf-8?B?aDZjcHhUQ2RKK2pGbDJEWmR6SXQxL0prTXBYbjBYTk5ubk9SYUtmN0RYZmNY?=
 =?utf-8?B?QTFSaTBaWjBkS0Z1WGtFOGJTcHJhVDdHTHl1QXJJYUFVdGhHNWl6bnZ3bEhs?=
 =?utf-8?B?UmRuWFVRc2ZWaytEdGFhRFdJRFpaT1BoeXNpZm5NdGdKSTlsVndaTXlQNy9D?=
 =?utf-8?B?QThMdFpvOHpTcDhZU3hwQjhKUVFBWWJ5WkVoLzZaUXlKT0p6NVpnZC9ZaW1C?=
 =?utf-8?B?bVdXYkN5MWoyZ2VMRzQrV3BQaFIwemhueDhSMk5UcWo0L2RrMU9OOVJ2WHl4?=
 =?utf-8?B?VGl2blFFckYwYWV6YjVnWWhoVzlsSHRjTHU1aTdyMFJJVkEvUnFZUDJCWG9T?=
 =?utf-8?B?Z2lzYTJTVm1kdElCQVpHQzZnMVhJdU40MVBOb0EzRnJIR0hzU3NhdUptM1RO?=
 =?utf-8?B?L3R3bGxpWEZnSmpkbE5jZi9Uc2NBVUtjeUo1Lzh0eXZGZG9IQUJPbVFnOU1V?=
 =?utf-8?B?VEJOKzNwYnFMUVdmeFhGQURCVVQ0c1VWUHk3TUMvVXdOZ0JCTUU0eG1jUnVw?=
 =?utf-8?B?UzdsMHNtL2RHMit5UWt2Smt4b3gwQU4rNm9Ha1pFallHN09ZdXdUaG15cG1Y?=
 =?utf-8?B?dk9RRUcrd0QyeGlYeERLRWxZemcyaEhicDhBMFN3OTNKWUpWK2hvOElkZDV1?=
 =?utf-8?B?V1BHay9IWmRsbEtRZDR6bDBRVHJ6VDM4TzZTd2hZZGw5TFRQQTNnemlRVGxp?=
 =?utf-8?B?SkU2QWNKekNOeHRUZTIzZUs3a21pNkk3emNHakg5RndGL0hWeWhadSs1MEpV?=
 =?utf-8?B?MFFzMTZFZVQ2bm1MM0NseFhsMCtzUzJaZTNGa2xnQ1pXR2NDcGxMWm1tZHRU?=
 =?utf-8?B?NVdvUnRRWFYyS3k5VWFuNUQ0cFV5L2dUbWdmYUxqRHVDc2VSYkEwY000V3Yw?=
 =?utf-8?B?bmExNlJvWnY0TnBmVmVvRTNSWVRkMHNxbWFWZ3MyVEdFQUE4b1VxQ3dFcS8z?=
 =?utf-8?B?RG9wNU9yQUc4NHN4VW9oNStHK29yZEQ2bGtFQys4TzFDR2pjaEdmeWcyeFFG?=
 =?utf-8?Q?JGfkU9B/MmjSHEWtZdEYbw3BW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e60907f-9a53-4712-5bad-08dc4fe18370
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 11:15:17.3192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: guvWHAUvmaNT8y6+3dnjwCIcIGBAF8PjAfp5/cN9S6iobzTKL9AT2cZX7pqaQXXN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9077
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

Am 29.03.24 um 12:10 schrieb Christian König:
> Am 25.03.24 um 08:45 schrieb Jesse Zhang:
>> remove the unsed the paramter in the function
>> ttm_bo_bounce_temp_buffer and ttm_bo_add_move_fence.
>>
>> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
>
> Good catch, Reviewed-by: Christian König <christian.koenig@amd.com>

Please rebase that patch on top of drm-misc-next.

Regards,
Christian.

>
> Regards,
> Christian.
>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c | 10 ++++------
>>   1 file changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index edf10618fe2b..7f08787687a7 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -402,7 +402,6 @@ void ttm_bo_put(struct ttm_buffer_object *bo)
>>   EXPORT_SYMBOL(ttm_bo_put);
>>     static int ttm_bo_bounce_temp_buffer(struct ttm_buffer_object *bo,
>> -                     struct ttm_resource **mem,
>>                        struct ttm_operation_ctx *ctx,
>>                        struct ttm_place *hop)
>>   {
>> @@ -470,7 +469,7 @@ static int ttm_bo_evict(struct ttm_buffer_object 
>> *bo,
>>           if (ret != -EMULTIHOP)
>>               break;
>>   -        ret = ttm_bo_bounce_temp_buffer(bo, &evict_mem, ctx, &hop);
>> +        ret = ttm_bo_bounce_temp_buffer(bo, ctx, &hop);
>>       } while (!ret);
>>         if (ret) {
>> @@ -699,7 +698,6 @@ EXPORT_SYMBOL(ttm_bo_unpin);
>>    */
>>   static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
>>                    struct ttm_resource_manager *man,
>> -                 struct ttm_resource *mem,
>>                    bool no_wait_gpu)
>>   {
>>       struct dma_fence *fence;
>> @@ -753,7 +751,7 @@ static int ttm_bo_mem_force_space(struct 
>> ttm_buffer_object *bo,
>>               return ret;
>>       } while (1);
>>   -    return ttm_bo_add_move_fence(bo, man, *mem, ctx->no_wait_gpu);
>> +    return ttm_bo_add_move_fence(bo, man, ctx->no_wait_gpu);
>>   }
>>     /**
>> @@ -802,7 +800,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>>           if (unlikely(ret))
>>               goto error;
>>   -        ret = ttm_bo_add_move_fence(bo, man, *mem, ctx->no_wait_gpu);
>> +        ret = ttm_bo_add_move_fence(bo, man, ctx->no_wait_gpu);
>>           if (unlikely(ret)) {
>>               ttm_resource_free(bo, mem);
>>               if (ret == -EBUSY)
>> @@ -866,7 +864,7 @@ static int ttm_bo_move_buffer(struct 
>> ttm_buffer_object *bo,
>>   bounce:
>>       ret = ttm_bo_handle_move_mem(bo, mem, false, ctx, &hop);
>>       if (ret == -EMULTIHOP) {
>> -        ret = ttm_bo_bounce_temp_buffer(bo, &mem, ctx, &hop);
>> +        ret = ttm_bo_bounce_temp_buffer(bo, ctx, &hop);
>>           if (ret)
>>               goto out;
>>           /* try and move to final place now. */
>

