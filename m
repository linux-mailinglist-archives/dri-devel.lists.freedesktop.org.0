Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0965863BFBF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 13:08:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A7C10E3C8;
	Tue, 29 Nov 2022 12:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A3C10E3C5;
 Tue, 29 Nov 2022 12:07:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqb3pRQOFj8WNa9OzN+0LuBiTbud1xBYoeZIOGgIORmMTNHF2b+Ci+1PX47BfkLOa1K0ruBZv061wMso7Ryy7wXENHCeNBPohrrCYKgqq7xf/LkkPvK49gLnZ4Z07sGp5eTmotk7k2YBTjkE5kW9Bttm6xr+IEjsM6QENvH7NVip2+k/8iR60A3hkM36VeLT5Y/rbNrvuYvoZ0t+0E4c7XWsiAlwIW6OlTp+Ai+HwdP8/QuKTVFd4AwSCTF3OWRT2Ac2pTx6/fYG+6ISjZHx2hP6WqZo5t9CJTzGC3RtrUAKiFYysLggvjxuUwoTOL2cnc3/l1lmeb83f6pun6ZXOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhuc1l7CUHV4DxPqVA92IroD520wmBqtTwhR+v5JUm4=;
 b=N511HV/qJxBC8nfKjlyQxTYoCIFBm8MfBcUbSca7gwyeTxTpPSH6lbKbV0cnWc78M8rUBq/3XoKjnoeYl3k9aWQx0adC91WjfKTz+ViUxhOXWoL5KHGP7Eny3yBmpEsyQJPlcd6/WXa5l+dgYJT9t1t6u9ql8bLZcP6+kmSTFjd86VzOz7QwEZNb1LbxnvSv7qytNItAlZvZsrkODb7qH5l6kxFdwmdvjKenAumzhw/AJ+d41WzdOrFnZ+G1n8xHGpUqM+WOlBSV4Ap65niJVOL4hrSNXAFDsUTp1vtT/nDPkmiUiVePnlP0Qsa48l/p0XvFklRJxb4yFTVdpRnVVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhuc1l7CUHV4DxPqVA92IroD520wmBqtTwhR+v5JUm4=;
 b=JfP5WCpkxWLxLvd2o07PkMvqcOqwwNoGn5Ctym6/lbqIuE+upIE7CCBae/eDjkPkddqOWZwIUXMW8zP/amCF6HA6WrRCYKn94ExU4Zo3P31tAdSIp7wcDWuQnOgkH+lPEPmeDRdqszBcXhGl+k6VEJ8VPdxQuoYbBSMl5DEEvV4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH0PR12MB7885.namprd12.prod.outlook.com (2603:10b6:510:28f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Tue, 29 Nov
 2022 12:07:49 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 12:07:49 +0000
Message-ID: <d35db289-2d82-1fad-49e0-f41daea460ab@amd.com>
Date: Tue, 29 Nov 2022 13:07:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW1BBVENIIHY0XSBkcm06IE9wdGltaXNlIGZvciBj?=
 =?UTF-8?Q?ontinuous_memory_allocation?=
Content-Language: en-US
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20221129105655.125571-1-xinhui.pan@amd.com>
 <fe127690-9dbb-797f-c0c3-f1e05657293f@amd.com>
 <DM4PR12MB51650DA0960F7E13F3F64E9687129@DM4PR12MB5165.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <DM4PR12MB51650DA0960F7E13F3F64E9687129@DM4PR12MB5165.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH0PR12MB7885:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e982c81-4539-45cb-c89f-08dad2025595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1qe8MJjh3isONq6/mI5Q1NpUwBFOgQZCeTn8oVaebCvWtiKEzfQIrY/3uxjM5hHYKkcW85iaB0OR1WYMNhSiQslS+ebJwVdlT1GnnaxV8DUBe2FbbDsWezGdd9Jwz0ccmZQEcAGvhiq31U9NS7Po2wtRqunmfASjBt6wT9sefMu/TGwuu2Igcuu4TF1Xb/52V2x1Ru1n7dKpbVRxonpFcvzG/BASxqxf6TFtRKoZzQUf3PzobDYSYWdQ3WJQFQr5idToGNCJvqomL3E8rhjV16znGRsS8UKnCtZkUwnvPe4IlFQj77MerLOMnGPgtxPCoPq6SDtC1odUga6DA43Ydd4QgfilyCZZ3ZO3m9e71Dr4mpPVUwEvKfTAAXDwxt6YEM6uzZtm0lyq2JVqirKTEYKaEwwj8cFCeB6g7jNkvqq+GY+b2hZX+tIy8b9RltVGBB102yI2RxTwDOy8LFW+VV2cz2nc2n3f2emTJSmc+WUk608eTfnQtLkmMi4D1BrNj/1jrkk0qAQzhOpvVPeQRn9qInogsMqz5KZlchcqt7b0b0sjstO4bljdZZD0Q3/CxULwoRZaR2yxQBLuKYyvklYsMXaLQqEfdC7VEmsj/mdepy53UnJSHDoT5O3tHzsLwyQQ0ftycFe7v/qSY4HIFy8VvWymE9oKzC0fbchvS3Bp0NPGsLtIoAG6YS8dNktQ5j0NhdUSC09/prsciPN4Efof7VRGMGpRN/Yq2Zazrcc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(366004)(346002)(396003)(39860400002)(451199015)(31686004)(66899015)(224303003)(8936002)(6506007)(5660300002)(41300700001)(2906002)(4326008)(31696002)(86362001)(36756003)(66946007)(316002)(110136005)(54906003)(478600001)(6486002)(38100700002)(66556008)(83380400001)(2616005)(6666004)(66476007)(186003)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXJVR1ZuSXpQaWNoVkhFRjdrWDNMS3FPZWJNcjN3QnJSTGdHVm0ybVdiQzQx?=
 =?utf-8?B?emI0bnpURVRWazN0ZldRV2tpR1ljTFVLS2w5NXlaTDJkL0kwcnMxekFaVFha?=
 =?utf-8?B?WGVJbTZjcDlKMjhSVTVacUNlaXUzMGQreTVzejBUL01DRkZ3T29oVThTKzlE?=
 =?utf-8?B?M2J3RXVFLzdsUmc2dk9UTmpiaUg1YTRNWi93RDJhWXRCNHd1MFBlMkJGZEtE?=
 =?utf-8?B?Qm9OdE1KcjQyRkh2V0xZeER2TnA3MEl3WFZ0QUdvMFRHRWVNdEY3RHhKQWg5?=
 =?utf-8?B?WHZ4MWRsRVkvTlVlRHNacGd0K3AzdFRHN0s5NU9SLzhzalZHSVQrbStKZDNG?=
 =?utf-8?B?YiszTlE5Qm9zV2dhcVhZR0JVdnYxM0xHNW9TWTVEYUhmay9KZVoyMittaUZO?=
 =?utf-8?B?OVdiNERocWpYMUNMS2wwZEhKL3cvQVluYjN1TTU5ZXBaR0I3RjIyUkhneit6?=
 =?utf-8?B?Q3ZLeFBNYU5CWStLWTlnVDJjcUhXU041MTdTN0NLZ2JWem9UTUhYeWpvOU15?=
 =?utf-8?B?clpBdDJ2SWp4R25oZ1ZTcHo1Vm1YWTVVVWVNTFRlS0ZDNnJGR1czQUdObkJP?=
 =?utf-8?B?ZUZ3UFpRQmpBUG1IeWFiWHZRckFOTGFtd0Y2dHBzeFJDbHhNQ0ZxSjA4QldD?=
 =?utf-8?B?MnlBWklnQTk5YkdQMmsxWXRQS09sMjYxTnBFaG5BdHk3Z2lZMFVEbGl1TUpQ?=
 =?utf-8?B?eG94bTlYRzRmM1lCZU5rbFVlbXFLcnVZUnhzQjBzNUtvemFWeUV0WnNHSVR5?=
 =?utf-8?B?NEVkaFZxcHZYRnFwcWx1N2VoWDN4em40Y21jZkJBaktxU0JpeHJpSFVDWHZj?=
 =?utf-8?B?VDQvS2pMVzB6aGxiK2dwRkg5NW80Q2JMQy9WNFpERHAxSHhOOGRFaHgyTGFy?=
 =?utf-8?B?WFB3WnBENlBmYUFuc1MzVm5jUVdLUTBqWUtWNXZRTGdndW8xNDZiUnFyUWR0?=
 =?utf-8?B?UWFST1RVaFoyUUU4S0pQc3M5OHBiQVJUL1h2WWtPWTZrOWUrL2FGbTIwOEE3?=
 =?utf-8?B?L21oRjROdEpUTkJoSXVpa05JOFpPait1NG1aZFFoT3M1V1JDMzhscWUvUGRv?=
 =?utf-8?B?ZE9BYlZCa1BwUTRKR1RrUGRzbngwVml3aWlUTGlDTDVBbUJLNklhSU1wRGo2?=
 =?utf-8?B?dUVraDEzSXNVM2o2SFlCUnpqam1GM2lrSkdrNmlWNkpCYjdkbm1kdk9JTVpl?=
 =?utf-8?B?Q2ZRM1dGU2VZUE5iTC95ZXludDF2Q0pydlRQUE45ZU1ERDU0R29XUjZZcFZD?=
 =?utf-8?B?RHJESG9zaUQ5Zys4THArM0tYSVhPdE9tcW8zWVVWaU5tdTJKWnhSeVJPSmFs?=
 =?utf-8?B?dTlQQWJJWEtxaVB0RjgwWWIwOUhzcFp4cEtTOWFQeFVjclhaZE5LY2hzbytx?=
 =?utf-8?B?STJOcjdpejhkM2Exa2dSWGJacWlvWUg3NS80UGVjOW5SRlAvaW00SUpmZURI?=
 =?utf-8?B?WnZaUDhKUk5BS1k4RlJabklYNW5nRnM5OWZ0c044VnhDVXFHcXF5RzNtTjE2?=
 =?utf-8?B?UTBoVG0wenRLQUV3NlVMNDFoMDBUTDU2SERINXQra3plNGV5MjFxMWp6YkNp?=
 =?utf-8?B?bkRFa3VPR1hERFZXUUFKK2N3dUVmdnhWWkVRRFJIYUNaWTBXVjE0cHJKQmFq?=
 =?utf-8?B?NGhQVUEvSHVUOUFjbGhpbkoxL0N6OTZZVWozNjBhU1lTdUhHeUpWaE5EbFRE?=
 =?utf-8?B?c29uYldmR2NseDNtcUtaTm50S253OVZxYmQybmFzOExYVGZNNlB0cWt6TS9D?=
 =?utf-8?B?dGQzbTZiaG1sSHVXVXVlRFY0OVo0MUdVelQ5NitaQ2kzWURCeUNITUxRQUJK?=
 =?utf-8?B?cFlIcEFOZXAybDR4UC9WQ2NlQkxuS2VzOEVEeHRtQmZRYlNIR3d5MnBEQjVs?=
 =?utf-8?B?bzh2MEM2c044bTR4NFlTSTdNY0w2dHAyc1NaSXprM0RTWVdHYzlCTW1vQlZT?=
 =?utf-8?B?WmdvQ2VLNVhSWW0rRG00bndzc1I3Zm5RTC85YkRXaVVqMkNrdFJvSGJINFJ3?=
 =?utf-8?B?V2JldnVGRmw5aW5VNEN3MlNMTmxKaThZRklNeVRGajh2S0MxU0lrR2s2Y2RN?=
 =?utf-8?B?bW9xeGJFSm1jeFJobVQxOUdya1VSV1ZvZEZMTmZkVnJZNlBPeVZwaFdQQzhp?=
 =?utf-8?B?b1c4cUQ1M2g5dis5OXNyM1ZKdVRJbW5mamxYNzhnMFEwam0vQXMydTl4U2tF?=
 =?utf-8?Q?aiw6ZvhFSZ96UAd9UzLCyHobIMqS3PiC/mogTGc07/d9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e982c81-4539-45cb-c89f-08dad2025595
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 12:07:49.6181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QjMOU9/jjfpr2fJPUS7COHIR53J1aPoUXE98pc4yXyesnbZUpsRMjssK+jCi6SqN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7885
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
Cc: "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "matthew.auld@intel.com" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.11.22 um 12:54 schrieb Pan, Xinhui:
> [AMD Official Use Only - General]
>
> comments inline.
>
> ________________________________________
> 发件人: Koenig, Christian <Christian.Koenig@amd.com>
> 发送时间: 2022年11月29日 19:32
> 收件人: Pan, Xinhui; amd-gfx@lists.freedesktop.org
> 抄送: daniel@ffwll.ch; matthew.auld@intel.com; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Paneer Selvam, Arunpravin; intel-gfx@lists.freedesktop.org
> 主题: Re: [PATCH v4] drm: Optimise for continuous memory allocation
>
> Am 29.11.22 um 11:56 schrieb xinhui pan:
>> Currently drm-buddy does not have full knowledge of continuous memory.
>>
>> Lets consider scenario below.
>> order 1:    L             R
>> order 0: LL   LR      RL      RR
>> for order 1 allocation, it can offer L or R or LR+RL.
>>
>> For now, we only implement L or R case for continuous memory allocation.
>> So this patch aims to implement the rest cases.
>>
>> Adding a new member leaf_link which links all leaf blocks in asceding
>> order. Now we can find more than 2 sub-order blocks easier.
>> Say, order 4 can be combined with corresponding order 4, 2+2, 1+2+1,
>> 0+1+2+0, 0+2+1+0.
> Well that description is a bit confusing and doesn't make to much sense
> to me.
>
> When you have two adjacent free order 0 blocks then those should be
> automatically combined into an order 1. This is a fundamental property
> of the buddy allocator, otherwise the whole algorithm won't work.
>
> [xh] sorry, The order above is not 4, should be 3.
> order 3 can be combined with corresponding order 3, 2+2, 1+2+1, 0+1+2+0, 0+2+1+0
> the order 0 + 1 + 2 + 0 case does not have two same order 0 adjacent. they are in different tree.
> looks like below
> order 3:                            L3                                               R3
> order 2:            L2                              (R2)*                    L2*
> order 1:    L1             (R1)                                         L1
> order 0: L0   (R0)                                                 (L0)
> R0 + R1+R2 +L0 with () around combined to be order 3.
> R2 + L2 with * followed combined to be order 3.
> etc....
>
> When you have the case of a free order 1 block with two adjacent free
> order 0 blocks then we a fragmented address space. In this case the best
> approach is to fail the allocation and start to swap things out.
>
> [xh] Eviction is expensive.

No, it isn't. Eviction is part of the algorithm to clean this up.

When we can't find any free room then evicting and moving things back in 
is the best we can do to de-fragment the address space.

This is expected behavior.

Regards,
Christian.

> And if it still fails to find the continuous memory with this approach, then let's evict.
>
> So what exactly is the goal here?
>
> Regards,
> Christian.
>
>> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
>> ---
>> change from v3:
>> reworked totally. adding leaf_link.
>>
>> change from v2:
>> search continuous block in nearby root if needed
>>
>> change from v1:
>> implement top-down continuous allocation
>> ---
>>    drivers/gpu/drm/drm_buddy.c | 108 +++++++++++++++++++++++++++++++++---
>>    include/drm/drm_buddy.h     |   1 +
>>    2 files changed, 102 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 11bb59399471..8edafb99b02c 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -80,6 +80,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>>    {
>>        unsigned int i;
>>        u64 offset;
>> +     LIST_HEAD(leaf);
>>
>>        if (size < chunk_size)
>>                return -EINVAL;
>> @@ -136,6 +137,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>>                        goto out_free_roots;
>>
>>                mark_free(mm, root);
>> +             list_add_tail(&root->leaf_link, &leaf);
>>
>>                BUG_ON(i > mm->max_order);
>>                BUG_ON(drm_buddy_block_size(mm, root) < chunk_size);
>> @@ -147,6 +149,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>>                i++;
>>        } while (size);
>>
>> +     list_del(&leaf);
>>        return 0;
>>
>>    out_free_roots:
>> @@ -205,6 +208,9 @@ static int split_block(struct drm_buddy *mm,
>>        mark_free(mm, block->left);
>>        mark_free(mm, block->right);
>>
>> +     list_add(&block->right->leaf_link, &block->leaf_link);
>> +     list_add(&block->left->leaf_link, &block->leaf_link);
>> +     list_del(&block->leaf_link);
>>        mark_split(block);
>>
>>        return 0;
>> @@ -256,6 +262,9 @@ static void __drm_buddy_free(struct drm_buddy *mm,
>>                        break;
>>
>>                list_del(&buddy->link);
>> +             list_add(&parent->leaf_link, &block->leaf_link);
>> +             list_del(&buddy->leaf_link);
>> +             list_del(&block->leaf_link);
>>
>>                drm_block_free(mm, block);
>>                drm_block_free(mm, buddy);
>> @@ -386,6 +395,78 @@ alloc_range_bias(struct drm_buddy *mm,
>>        return ERR_PTR(err);
>>    }
>>
>> +static struct drm_buddy_block *
>> +find_continuous_blocks(struct drm_buddy *mm,
>> +                    int order,
>> +                    unsigned long flags,
>> +                    struct drm_buddy_block **rblock)
>> +{
>> +     struct list_head *head = &mm->free_list[order];
>> +     struct drm_buddy_block *free_block, *max_block = NULL, *end, *begin;
>> +     u64 pages = BIT(order + 1);
>> +     u64 cur_pages;
>> +
>> +     list_for_each_entry(free_block, head, link) {
>> +             if (max_block) {
>> +                     if (!(flags & DRM_BUDDY_TOPDOWN_ALLOCATION))
>> +                             break;
>> +
>> +                     if (drm_buddy_block_offset(free_block) <
>> +                         drm_buddy_block_offset(max_block))
>> +                             continue;
>> +             }
>> +
>> +             cur_pages = BIT(order);
>> +             begin = end = free_block;
>> +             while (true) {
>> +                     struct drm_buddy_block *prev, *next;
>> +                     int prev_order, next_order;
>> +
>> +                     prev = list_prev_entry(begin, leaf_link);
>> +                     if (!drm_buddy_block_is_free(prev) ||
>> +                         drm_buddy_block_offset(prev) >
>> +                         drm_buddy_block_offset(begin)) {
>> +                             prev = NULL;
>> +                     }
>> +                     next = list_next_entry(end, leaf_link);
>> +                     if (!drm_buddy_block_is_free(next) ||
>> +                         drm_buddy_block_offset(next) <
>> +                         drm_buddy_block_offset(end)) {
>> +                             next = NULL;
>> +                     }
>> +                     if (!prev && !next)
>> +                             break;
>> +
>> +                     prev_order = prev ? drm_buddy_block_order(prev) : -1;
>> +                     next_order = next ? drm_buddy_block_order(next) : -1;
>> +                     if (next_order >= prev_order) {
>> +                             BUG_ON(drm_buddy_block_offset(end) +
>> +                                    drm_buddy_block_size(mm, end) !=
>> +                                    drm_buddy_block_offset(next));
>> +                             end = next;
>> +                             cur_pages += BIT(drm_buddy_block_order(next));
>> +                     }
>> +                     if (prev_order >= next_order) {
>> +                             BUG_ON(drm_buddy_block_offset(prev) +
>> +                                    drm_buddy_block_size(mm, prev) !=
>> +                                    drm_buddy_block_offset(begin));
>> +                             begin = prev;
>> +                             cur_pages += BIT(drm_buddy_block_order(prev));
>> +                     }
>> +                     if (pages == cur_pages)
>> +                             break;
>> +                     BUG_ON(pages < cur_pages);
>> +             }
>> +
>> +             if (pages > cur_pages)
>> +                     continue;
>> +
>> +             *rblock = end;
>> +             max_block = begin;
>> +     }
>> +     return max_block;
>> +}
>> +
>>    static struct drm_buddy_block *
>>    get_maxblock(struct list_head *head)
>>    {
>> @@ -637,7 +718,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>                           struct list_head *blocks,
>>                           unsigned long flags)
>>    {
>> -     struct drm_buddy_block *block = NULL;
>> +     struct drm_buddy_block *block = NULL, *rblock = NULL;
>>        unsigned int min_order, order;
>>        unsigned long pages;
>>        LIST_HEAD(allocated);
>> @@ -689,17 +770,30 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>                                break;
>>
>>                        if (order-- == min_order) {
>> +                             if (!(flags & DRM_BUDDY_RANGE_ALLOCATION) &&
>> +                                 min_order != 0 && pages == BIT(order + 1)) {
>> +                                     block = find_continuous_blocks(mm,
>> +                                                                    order,
>> +                                                                    flags,
>> +                                                                    &rblock);
>> +                                     if (block)
>> +                                             break;
>> +                             }
>>                                err = -ENOSPC;
>>                                goto err_free;
>>                        }
>>                } while (1);
>>
>> -             mark_allocated(block);
>> -             mm->avail -= drm_buddy_block_size(mm, block);
>> -             kmemleak_update_trace(block);
>> -             list_add_tail(&block->link, &allocated);
>> -
>> -             pages -= BIT(order);
>> +             do {
>> +                     mark_allocated(block);
>> +                     mm->avail -= drm_buddy_block_size(mm, block);
>> +                     kmemleak_update_trace(block);
>> +                     list_add_tail(&block->link, &allocated);
>> +                     pages -= BIT(drm_buddy_block_order(block));
>> +                     if (block == rblock || !rblock)
>> +                             break;
>> +                     block = list_next_entry(block, leaf_link);
>> +             } while (true);
>>
>>                if (!pages)
>>                        break;
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index 572077ff8ae7..c5437bd4f4f3 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -50,6 +50,7 @@ struct drm_buddy_block {
>>         */
>>        struct list_head link;
>>        struct list_head tmp_link;
>> +     struct list_head leaf_link;
>>    };
>>
>>    /* Order-zero must be at least PAGE_SIZE */

