Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBDD44AE97
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 14:17:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31176E21C;
	Tue,  9 Nov 2021 13:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CAE6E21C;
 Tue,  9 Nov 2021 13:17:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwK6IRzK74Iv3XN95OVHTs6/zXeGuLXwhRdEvoOcyTrGhzAQE0fdEcXbhey6/sgcEv2MOqpXSCvfDt6lr3gPd9JmnbNZO68ARWMEH1JGJSoEV8uz35Oto52slsrfsoijQntmkTULHz6YOpqlwP4IMUjG/QDjOB9TG4wcqU18ZKD2nokM3j7bdvY05P+l7dRVwqLVy/imdxgzxOMK2JqLfVpttYUaJbZRuUd4FJoQeTvGrDfKH1c8qHZ3afLZUX8RrGdpvTLhAH4TkjprK684sgh4Q2jjwMgqP0tYBkez0VZdMv84bgtioGAgJGCLZWTr35Jz/thVeANbr1uZc5YlPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTV6z/MyGnM/M7Vavw9jwf+Qu6YzDfybLcElNiN8jiw=;
 b=TwlfLzz0jnJsf7p1tYNQkYg3J+Dw6FxzjRs3ErlN3ETuwKn002serrenp4oXy/8mq00goJ8dNMD/GP7VdfJ6qxa9sSbvb3huLM0TJIlei/3iqFpFEYlXWRZ9Ow1A2E6qta/u/mdSUR0TblnKJ/6Bh+swIkeRIlcsuwHvtF2uJ1wgSTJGPSf/ibSAn/eAGEhF7m4qcZZCqZpfm3aV9M3/pVo/24wvtraPTV0JlawmnZT9blWpMf6dvfPw3u7M6/b2T3960kfJq199QJmN8ifTuPWsP0DrrWjeX+VySvxbvisWXxEBnlewCJc06GzC8RGvwJD3RpLdfWWONBy7aJcR1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTV6z/MyGnM/M7Vavw9jwf+Qu6YzDfybLcElNiN8jiw=;
 b=zQQi6btaY2jUYeYf3SdIhjzD0DMQmmy1oEndKaCo9qOzrWfW1aRPZh5jFMQXr3T3uO9+hm09pPqn3Rp/81j6YbQ1O92pTT+EJZLBA2A2MmQ223nxtRXTLFuzIUQJB6vBeG078kF5Z7WhFr72Hp4AgSdFl6BIPj+5rQWBkOp/Q2s=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4345.namprd12.prod.outlook.com
 (2603:10b6:303:59::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 13:17:05 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 13:17:05 +0000
Subject: =?UTF-8?B?UmU6IOWbnuWkjTog5Zue5aSNOiBbUEFUQ0hdIGRybS90dG06IFB1dCBC?=
 =?UTF-8?Q?O_in_its_memory_manager=27s_lru_list?=
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20211109111954.41968-1-xinhui.pan@amd.com>
 <da46c607-1a3c-7ea9-92ef-78a2b60d38c9@amd.com>
 <DM4PR12MB51653AB0F1A0B89A41782B1087929@DM4PR12MB5165.namprd12.prod.outlook.com>
 <76d78ff7-efe4-4796-ec18-a668757f2e04@amd.com>
 <DM4PR12MB51657C53FAA6C096884118AD87929@DM4PR12MB5165.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3179316c-2518-73ba-1388-1ae6417ccd42@amd.com>
Date: Tue, 9 Nov 2021 14:16:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <DM4PR12MB51657C53FAA6C096884118AD87929@DM4PR12MB5165.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0053.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::15) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (79.194.4.163) by
 AS9PR06CA0053.eurprd06.prod.outlook.com (2603:10a6:20b:463::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Tue, 9 Nov 2021 13:17:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d176b64f-7b18-4ad9-3bec-08d9a383399c
X-MS-TrafficTypeDiagnostic: MW3PR12MB4345:
X-Microsoft-Antispam-PRVS: <MW3PR12MB4345EBEDA41028DE09E2CF9483929@MW3PR12MB4345.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZXQBTn+n5nO1NSF5U8b91TBy2FtenL7nHlBp4VdhXCAibk8ErlPGoug31qKVaIMuxceeRDQm0/Uz6a3II/RMJbuGDftELb+ZjfB2D2jNm/1nLkKv56mI/kQdd5MxZwpWTLM91crMzfFobaBF8T4R/Owq8B7uVjJU7pyuAxRWK0eu2PxHwjU4yU/8OJa8M6awvDWEnK6NwbBJBJ2TvQiKXuHtU0fI86KtXbhPP8TVk/3R7CTeYSkxuvqos1f3J0JJOAmwbDsEMAeuj9iWT6GXBK8GK/JzPnZYImfoqiVER6WVOUtCzQUCNbO0o5Oi9jOYB+iWRYMhXVf+DZAZlK2Cp1BhqWObkAkM3jXAbAFnmACeFOsZdbWEU+t3/KrrQ+qmLoGw9/+TMBDc3TZjmbswKKE17hM9mSuo8E2XgTzC9EGqSkgtKNezcVIvBdCk0zl7/VqUDnSpPQmbkjb+REpg8rD8xwL5TClBrU8UrxuafUUCsPRuO8RT1AyjyiK+riBf+weVFhSC+fkrevXPGPyCjW5AGye5t5Q86+vhM5WVZQc6rHqpOgbys7aE1hbNuXXy3rhpRqUkg5t8mqSGWquZt0goCNZKaI09coO6pa078HmT56oU3Em9wz6WSkfBh7XAcxR1B2lhkWYBbG8AAoYueD7Az/iM+iIUjzLaNG6IQWPAps12ejK6VEMVmyvH9j4/LGcD7K4yUfwe6VR85Gyd1iQJB/eCEvXaRrIMmOJ6ASY1n9VkckjPsE5iXKYK1v87
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(224303003)(66946007)(186003)(66476007)(110136005)(4326008)(26005)(316002)(16576012)(6486002)(31696002)(66556008)(450100002)(8936002)(31686004)(66574015)(6666004)(2616005)(956004)(83380400001)(5660300002)(86362001)(36756003)(38100700002)(508600001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFJPV24waXorZFk1akJJWStiQXBlamQ2L0V2bUwvV0NEL0pFdW5td09CUU1K?=
 =?utf-8?B?b1lqV1NFdkwwYzhaMUhvcWIyR2VlUU5FMXMzcmFldDNwVkxHSnRKSVArREdk?=
 =?utf-8?B?UTh4NWZpbmp5NFcrdkh1ZWozb0hoaG9yUzB6d3phdjIyYkwxYzBTa1FHTGVv?=
 =?utf-8?B?cTk0T0R3U1VXdmI5R3QvY2x6ZlVUWDZRQklKTEV4d2JiNWtCMVpMdkpmc3F3?=
 =?utf-8?B?MEwreGFockF5cURid3lzbVZlZ053ZnlWT0JNbTBBZjlOZEVCR3VXeXBhcFpQ?=
 =?utf-8?B?aEtwcWxWMmFUOG1NOW9XdU5BaGhKY2VscE1DbHg4ejc5QXY2TEVIdU84SXE3?=
 =?utf-8?B?M3NhQ3pjZnFaV0FzVjNsUDMwbDhRcVlyMCsyQjhYcm5WNndTMXZiQnRWamsr?=
 =?utf-8?B?U1l5anF2bFFZSkxRUTNoNTVRb0NBV0IxV21SWE1PS3R5dCtNRXk0WmhYSm14?=
 =?utf-8?B?aE5haTZUUVhQUGdvSlhnN3hSN2JrbVFZblVpUmF6VENsU1NMN1RyOHl6d2lz?=
 =?utf-8?B?c0p0YW9LTGdMMndXUGkyN0poazRLVkJFaUJzMVFiU0R2V1REV3VnR0tZMy9h?=
 =?utf-8?B?eXRub28wY0FBVzBwTUlyTHd2aUxtbXNJVXRiYlBaam1McFVIdVQ1R0hERjJR?=
 =?utf-8?B?dnozYmZSVktDOEpFekg5TDNaeG9YVEZkdEphWHRNLzR5VTlRbVVsQ1A5c3dn?=
 =?utf-8?B?ZXFiNWhCV1ppUFh5Szh1UWtxdnk1ZjFsaDI4OFpHUDBBaEJLNmdXUm5PbFg0?=
 =?utf-8?B?WUpiZkJuUzhPSWcrNmZ0Q05EemtNaHBVM0VVcUdGYVF4RVlGa0JsZHR0N0pF?=
 =?utf-8?B?QSs2SlBLMEt5U1VMVTJPR21qaG11VDJBZURycnpPRC84bmY4SjdGWkdHMUJX?=
 =?utf-8?B?YTlqVVcxRjVnNTVEYlNoeFFUYlN5RUZsaVdXbU1NNXFEaHUwNkRSbE9NR3dn?=
 =?utf-8?B?VFpEVEZ6ZzBaU0tldml1MVlEQmZBWXZxeDRwQ0hHam1tSytObkRWTXVpaFhs?=
 =?utf-8?B?UG5lTisvVGE1UWJLOVArMjBVU3hVZVJhek9wcXZtbEUwUUJrTldST2Q5SFds?=
 =?utf-8?B?ZEZlVG1ZRCttVml2Y09DekEzL0FiTTJNQUxYVy9IeURFTk5nelJIWXByM21o?=
 =?utf-8?B?YnhDakJOMEswRlRUamp2UnhWc1l2ZTVXbEpUVVh5M1NqNCt2VWY4L3BwOWc3?=
 =?utf-8?B?Z1QyYmFWcFpOTTIzTm1CYmVJbnNHZUNlb1lNUFRRMFM5eVdEdXdIZkhRM3BV?=
 =?utf-8?B?Z1dCMm9RWXhjekUrYnVxamFrSkx4SmkzYVRKbFhnYm82M1dEOHgyMDZVYmZN?=
 =?utf-8?B?ZlZjeUF6WjUrZEFMZFhxT2RJQktid2N2clErNzdaQmgwSUk0dmFpV3NHSjJo?=
 =?utf-8?B?NHVsTStuVnBlUTlzb0NjOUwyZ3IydTQ0eGtrbG9oVnRKc3NSQ1kxbnNtZjVT?=
 =?utf-8?B?ZXpGMTBLVGl2aWtiVk05RmozeHlqdFNHd2ZqZEE0TlljMW91VlFhdGZ6djQ5?=
 =?utf-8?B?dHVHNklmazFCNENjbmhnVGJoUGdSY3RPZ1lkd2paVE85UGFLWEl6LzhUR2lu?=
 =?utf-8?B?RGJnTDFpR1EyTlc2R2FtTExuVXVqTCswcnY4TjQwdzhIRmwwMTZlZnlOblFx?=
 =?utf-8?B?VHAveVRZWnExY0kxNkx5OG9oMlJwWHI5akFzWnl6OE9tQVg1NWY3YllxckN0?=
 =?utf-8?B?WFlEK0tQR3d0WUl6a2w4eVlWRFNEeVlpNlVKRG5JRXZVVlZwTkYzY2srZ3FP?=
 =?utf-8?B?b05LVG52QmZ1M0FLd0hneFpiOGd4MldqdUxkbkh5UXpvZ3hLRnJBOU1HZzB1?=
 =?utf-8?B?TWpxc1dMVlUzMGpLdVlOM21haHIranZZTm1FOVp3OURkMDZuRUM1Uk1MM29E?=
 =?utf-8?B?cW9NV3Z6VEI3UG82REZtb2NSbEFvdXJRODVmdnduS1ViTFU1c2lFUHlGMzYx?=
 =?utf-8?B?SDc2YjRUVEUrdVlFSWcyZEYra2NDK3FTTngyc2E5NmFreTVlNlhxclRJVkt2?=
 =?utf-8?B?aTRzT3BQaXFBdk5EdStOUUFXT1V1bHhRNk1EWlhYSnBHYlU2KzE4M0J4ejFV?=
 =?utf-8?B?dDJWdmF4VmxrR2JCaXhYdFRaYnlHSFlEQ0lPZi9sOVlPR3dBcFhSK3FHbGE4?=
 =?utf-8?Q?7IdY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d176b64f-7b18-4ad9-3bec-08d9a383399c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 13:17:05.3798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fLpLemk4uKs7BqlONqJT1ECspt66NHGu9k4tVcSYDHaKhXsm17IrmOxtAMMW7SDP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4345
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yeah, but that should never happen in the first place.

Even when the BO is on the wrong LRU TTM should check that beforehand.

In other words when we pick a BO from the LRU we should still double 
check bo->resource->mem_type to make sure it is what we are searching for.

Christian.

Am 09.11.21 um 14:05 schrieb Pan, Xinhui:
> [AMD Official Use Only]
>
> Yes, a stable tag is needed. vulkan guys say 5.14 hit this issue too.
>
> I think that amdgpu_bo_move() does support copy from sysMem to sysMem correctly.
> maybe something below is needed.
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index c83ef42ca702..aa63ae7ddf1e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -485,7 +485,8 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
>          }
>          if (old_mem->mem_type == TTM_PL_SYSTEM &&
>              (new_mem->mem_type == TTM_PL_TT ||
> -            new_mem->mem_type == AMDGPU_PL_PREEMPT)) {
> +            new_mem->mem_type == AMDGPU_PL_PREEMPT ||
> +            new_mem->mem_type == TTM_PL_SYSTEM)) {
>                  ttm_bo_move_null(bo, new_mem);
>                  goto out;
>          }
>
> otherwise, amdgpu_move_blit() is called to do the system memory copy which use a wrong address.
>   206         /* Map only what can't be accessed directly */
>   207         if (!tmz && mem->start != AMDGPU_BO_INVALID_OFFSET) {
>   208                 *addr = amdgpu_ttm_domain_start(adev, mem->mem_type) +
>   209                         mm_cur->start;
>   210                 return 0;
>   211         }
>
> line 208, *addr is zero. So when amdgpu_copy_buffer submit job with such addr, page fault happens.
>
>
> ________________________________________
> 发件人: Koenig, Christian <Christian.Koenig@amd.com>
> 发送时间: 2021年11月9日 20:35
> 收件人: Pan, Xinhui; amd-gfx@lists.freedesktop.org
> 抄送: dri-devel@lists.freedesktop.org
> 主题: Re: 回复: [PATCH] drm/ttm: Put BO in its memory manager's lru list
>
> Mhm, I'm not sure what the rational behind that is.
>
> Not moving the BO would make things less efficient, but should never
> cause a crash.
>
> Maybe we should add a CC: stable tag and push it to -fixes instead?
>
> Christian.
>
> Am 09.11.21 um 13:28 schrieb Pan, Xinhui:
>> [AMD Official Use Only]
>>
>> I hit vulkan cts test hang with navi23.
>>
>> dmesg says gmc page fault with address 0x0, 0x1000, 0x2000....
>> And some debug log also says amdgu copy one BO from system Domain to system Domain which is really weird.
>> ________________________________________
>> 发件人: Koenig, Christian <Christian.Koenig@amd.com>
>> 发送时间: 2021年11月9日 20:20
>> 收件人: Pan, Xinhui; amd-gfx@lists.freedesktop.org
>> 抄送: dri-devel@lists.freedesktop.org
>> 主题: Re: [PATCH] drm/ttm: Put BO in its memory manager's lru list
>>
>> Am 09.11.21 um 12:19 schrieb xinhui pan:
>>> After we move BO to a new memory region, we should put it to
>>> the new memory manager's lru list regardless we unlock the resv or not.
>>>
>>> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
>> Interesting find, did you trigger that somehow or did you just stumbled
>> over it by reading the code?
>>
>> Patch is Reviewed-by: Christian König <christian.koenig@amd.com>, I will
>> pick that up for drm-misc-next.
>>
>> Thanks,
>> Christian.
>>
>>> ---
>>>     drivers/gpu/drm/ttm/ttm_bo.c | 2 ++
>>>     1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>>> index f1367107925b..e307004f0b28 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>> @@ -701,6 +701,8 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>>>         ret = ttm_bo_evict(bo, ctx);
>>>         if (locked)
>>>                 ttm_bo_unreserve(bo);
>>> +     else
>>> +             ttm_bo_move_to_lru_tail_unlocked(bo);
>>>
>>>         ttm_bo_put(bo);
>>>         return ret;

