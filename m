Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2678D63C15F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 14:43:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C701510E06C;
	Tue, 29 Nov 2022 13:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C10A10E011;
 Tue, 29 Nov 2022 13:43:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFeA3KxPyxsuaAWU7gfyamx1cG6+HcVZ7o9gjGhUmVbl6kHt/QOazXKvTHCodn7mqdT2Xi2TbQ9EMgBcTAR2HLQo2hT3AjzqG3vQoQsdfrwJSFH5bfoTnpOXtVm/eM1JUiSKibnmBhj2Px6C1qAEDanMYY5CaBMNr6jirVICpk/bUmglvKmj+vgq3q11cJz/dRsMM+VkbQoqj7KpqDnWVlNz9cT5T4K7JSiq6/9nnOs3Qa07NvqwUCX38R1CsFa8PmqrME98SQsy+EtekNlUlX/lUgGt3izyUG261ORvrrlRqyHXdBW2ufMMv+uIso4HzpGthMs6FQoz1pu3swC/UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4MNYDx5TBVsgpqUbbgKY4kKT3HnAm8JP4u6QXtOll1M=;
 b=JvLgezSpYHuFKIyA+z7w0dhpuGN03+B/teqm892OJznQ5w4GsBKF/ot4+0R1cVlFymINU1vgm81exfQDub2aZ1CuqAEyQalqqNnzi0U7LTR67db+EVJNR3OKI7ghoJNwID2bQpNMiqvxSLxWJyuE/E7ufbrXnwOr835DiL6MvzO+uX5OfuN3wQcnfdOzWK2rqns83teEtj46l1NL0IENczngT51HqVUl6jDrIloXXZk5Ki9GBxoVCTTAuLyHdMwswR/fpc4v8svk5IeoTczNAO+lCeOAezdS3Za2uFZjyf/hIul+ExaMIL1l/Y8o9pVsJDtmeq896H3Yt6xEWy583A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4MNYDx5TBVsgpqUbbgKY4kKT3HnAm8JP4u6QXtOll1M=;
 b=XDOqbzY5txFoX9GBTUMBZtqe63pj6MuHWd61Fq2tBnMM5Q9+M2JAnJAmjsG9tuUeiP8iU24qxleh+pFNyc/65+wSlZAdgdFMUlP5hA8Z3d3g7w8aSMe2osqVGRw4bYPtxoU5nxQkBagiITMcqbFeG0gqdXVgx8Av8K/CISafuwk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4042.namprd12.prod.outlook.com (2603:10b6:5:215::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 13:43:02 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 13:43:02 +0000
Message-ID: <74565216-4d21-3fdf-71d0-42770c2fa74f@amd.com>
Date: Tue, 29 Nov 2022 14:42:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: =?UTF-8?B?UmU6IOWbnuWkjTog5Zue5aSNOiBbUEFUQ0ggdjRdIGRybTogT3B0aW1p?=
 =?UTF-8?Q?se_for_continuous_memory_allocation?=
Content-Language: en-US
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20221129105655.125571-1-xinhui.pan@amd.com>
 <fe127690-9dbb-797f-c0c3-f1e05657293f@amd.com>
 <DM4PR12MB51650DA0960F7E13F3F64E9687129@DM4PR12MB5165.namprd12.prod.outlook.com>
 <d35db289-2d82-1fad-49e0-f41daea460ab@amd.com>
 <DM4PR12MB5165D3DE1E110A24D0E29B7387129@DM4PR12MB5165.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <DM4PR12MB5165D3DE1E110A24D0E29B7387129@DM4PR12MB5165.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4042:EE_
X-MS-Office365-Filtering-Correlation-Id: 07fb2f6e-38b4-40a1-743f-08dad20fa2ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l/TH4mXwgSWH9jwkg0W9+WITfhAYDlWovhLYnkR5+HFp7OW3VfAaR0H4ZjUboIuyZCMeMbsNexFxh22xs8S0EUxsEefAiiGwF/uwwiM1KTa2qBrbBo7ERCXpRPBi5enPMorUJfKunyiP9o6dWhyLblH0K9Bu8CdxV0x5mpqePxv5EOko2O5WM5QdyqnnQ5k4psUsfFi1bPwumSmYCHlqWbsctLphJC8BjjuKi10FN6nbicGVk0LfEHKAtr9+nvlqalE6al4LQkDLcBHzLrOW6QAaaLXNPwyl6mZcnCkn8jG3p+fqHHbYPJxpLl/2uCfyBIAUF6yURh0Obhsmn03saqGsBj6x7HAzDI0BxjN042W90LW9o2FSW1o32ppWxnyk8mPcVXQ61/U6yAYdhzNXwufSwOzg9dDPCcg+cy0GkGsQNDtfRk9WqN0cWfOfclPOqiCEiowuKRFrwbOB3t12GbIG5RDQ+6QUEBVd77qBZmvpb6nZ0rMQnCISNMZZW7ixXl4+3xUwRVxhBvk1McdHpoabTrOpNNlR8vvf/Hgy0PHGUvd0CtVRnzcU+2nvpTfUgPddWwGxGRN1jwfYe81aHGoQBCl+zDnPRXA8rRguaHVia/f1lf1mgZOI6HQ64tFCiM8RpNDQZCSLGcxM97UxKX7DNzGnqva39pR+UW5DKP6maOE2aaqfk0u2fS0dn6fx0QIdSJ7pFpNBdxChTlQckj0/OkTGXghQs3UEtVfruOc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(451199015)(2616005)(31686004)(2906002)(83380400001)(6512007)(6506007)(38100700002)(6666004)(41300700001)(478600001)(66946007)(66476007)(66556008)(6486002)(36756003)(224303003)(186003)(5660300002)(8936002)(66899015)(31696002)(4326008)(86362001)(110136005)(30864003)(54906003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUZmSGJCQW5jSnhxMFN3UUVZSnRVR1ZrUXhkK2ovR0tYV0dpSUFoRDdpa1NQ?=
 =?utf-8?B?OVd2bU5OTWFmdjZyOHRpTlBaeWN3SnVCTFdRQ2kvMlFYSnR2WUcvbG1ITE80?=
 =?utf-8?B?ZCtBckNYK0FaNk5KdmViODcrU1Frd3k4RWo1dDFtZW9uQnJtZWgwNEhnZjNB?=
 =?utf-8?B?M1FWRFp4Rnd4dkhoZTJoeDBjUVFyaVBqVDlqZnJ6WlFTNURmTklQdCthRlJN?=
 =?utf-8?B?dGtPSWhROHdNc09JcTV1eEFvczBRVnBUUTZuN2tta3RXdmozdHp4V0tSUThB?=
 =?utf-8?B?eDRIK1oxcTVWcSszM0hzcEpHazhOdkozUXdtdGlkQ1hLdWg4MnNhaTZQK3hW?=
 =?utf-8?B?ejZoT1JKbkdtZzZaNis4cW9MZzdOd0djRkhKaGJ3WnkzT1BXRHNGdzY1VzVk?=
 =?utf-8?B?NVdjNmNuVzJya2ZjdmNRQzFXbjdzWlBzM2taODFwTlFiYlcyQkQ3T0pxT2FT?=
 =?utf-8?B?cGM5Qk9mUWhYaHBpU3hLVm9MSXYwRkhrQno3SmM5UFpCVVFnSitCdzdKZWRJ?=
 =?utf-8?B?QXhRN3p5YjB1TThwZHdlYmdpalhQdkhiMVUwR0p6QUwyR0N0WGl1a3daWUpn?=
 =?utf-8?B?c0htN2hKaFhPbUh3RVozMSszY09CSTJFeDZlb1RwVGVRYTYzbzkvTXBBcmxT?=
 =?utf-8?B?RkRlLzJoWFVLaUJIdmlKMnRReFRWS1laZDk0YVNoTmM2bDI1Vm1EMjRocm9l?=
 =?utf-8?B?Nk9SZzZnL3ltUmdMNC9HMUJIaU01ZUk2RWF2M1NkUjBCZFh3M001K1pnZFhB?=
 =?utf-8?B?bU0zZUNQZmh3OGZJMXAwQTgzcS9EeEdsSnhJZGoyL0E2cXB4akVBNktHR1Bx?=
 =?utf-8?B?NXl6M25YWU85djFRU0s1aHltL2o3ZVhvSjdvOCtoaFlQbjk3MGdVNmhoU0N2?=
 =?utf-8?B?d0VDbFJNbTAzVWEzcGg5WDNkU0FBUkVaVVgzWFU3S1pzWVBQTk14RWdKWUJu?=
 =?utf-8?B?ZDIreFgwK0h6K2xRYUVzdWU4Z1ZZLzRCUkZGejlKU1g4ZHJ4YXJ1dE56R1pI?=
 =?utf-8?B?aTR4OEx3N0srdDQ4SjJhdUtmdmlOZVlFSW5lUGZvWEdHQ29YekNCY1RmWnZB?=
 =?utf-8?B?NC9LbjBGNUZNalk3NFlkWEVnS0M2YzZBeXVDZXNuYy91SlIwcUMvZjZyNVdS?=
 =?utf-8?B?WXBQQ3hUbGY4MGVFczd3M3piUFFLd0NvUU4xUW5wVm1mQkN2SUh2WVV3UHFu?=
 =?utf-8?B?MTVJcVI2QkxMbzBMUmdOSThNS2ZBOHZvc0Q3R25aTVhWVVM4blhtcDBkM1lk?=
 =?utf-8?B?ZTRWb3MwTlRrQ0Zyck5FcHpkbXVsQS9zazJxWFFxZXJVZ1Y3bWZnWldiM3lw?=
 =?utf-8?B?azRSbmJYQlFnalh1Y0F2SysxNGovbXRQSmk5Q0QwN0l2Qzc5T1gwdFVsOUtC?=
 =?utf-8?B?QVRwdHN6QUYrQWhtaFJNNElTYk5OYmwxc0xhVHdFOG5rWENaYnJvS1I4ZnFK?=
 =?utf-8?B?Rm9LNXBWaFYxZnl2bC9IbEZ5RUUwSVBqOEkycEdWWW9mQlcwTVM5NlhZV2hE?=
 =?utf-8?B?bVpxMHovcVNoSnNWM0s3SFN1ditOS0FFOEQzOEFYckY2YWlZZytZajhiRHo2?=
 =?utf-8?B?YU52ZDNaSjd5SDlIK1dYcDdPanByYytPU2VJdWMrU1lzR3lsc3B4YXlNU0pk?=
 =?utf-8?B?bm9rL2FPMVYrTGNkdUVCTk8rOFlFZVFDb0lyQ3JhSnFwSzRUTUNEb3BDTGky?=
 =?utf-8?B?ZW5rYmNMSVpkQmRPSEMyKytXTUgrL1NRK2FTek1abXZpMVB2M2NwRlFCTTdT?=
 =?utf-8?B?ZENLdDR5V0swMFcrMHhWZVBxWCtlTzk5Y1VSWUVHOXBSWGE1cUlyRzUxbkpo?=
 =?utf-8?B?N0hIblpjck9wcmkxRUVwUDZjc2dOc0xOa3B4YXlUZ0xyNG44K1RBQk5HZm1z?=
 =?utf-8?B?UXR2Rk9XVXFTdFV2cG90QWFmVkNSK0VMcTN0SWVvV3VSWGI3SURaMytlZmVq?=
 =?utf-8?B?Unl0UWFEUVhPVDBJN2tFUDFEdDdRejY1UkRnVlA4R0QyUEVFWm9iNFF4SVBs?=
 =?utf-8?B?MStYd1VPTUY4eUtzWDRKNmF6alRPNEFIblRpQ1FYc0gybjh2OHNrUmNxY2E5?=
 =?utf-8?B?bTBWZ0VjSk81cjNKU0Y5c1JPcG1uSjJuVXJVdm5rbWtvZ1lWWEVVV1lKMGNy?=
 =?utf-8?B?dk9sM1FBSmttMlVyQnIwYTk5aC9wTGtyZDJCNmlKZXhqc3dZWndZWkJuVFZH?=
 =?utf-8?Q?9jEaZiJEo3rkd1jL34Tn83YfUpP4s33ihMwAvGSmgqQd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07fb2f6e-38b4-40a1-743f-08dad20fa2ba
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 13:43:02.4535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5sOwVIOdOvCZG9AMV992dzn1l3zHvh1ZzC2IJUcr9DmiQRtFoa7O/i2llI3PZEvv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4042
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

Am 29.11.22 um 14:14 schrieb Pan, Xinhui:
> [AMD Official Use Only - General]
>
> comments line.
>
> ________________________________________
> 发件人: Koenig, Christian <Christian.Koenig@amd.com>
> 发送时间: 2022年11月29日 20:07
> 收件人: Pan, Xinhui; amd-gfx@lists.freedesktop.org
> 抄送: daniel@ffwll.ch; matthew.auld@intel.com; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Paneer Selvam, Arunpravin; intel-gfx@lists.freedesktop.org
> 主题: Re: 回复: [PATCH v4] drm: Optimise for continuous memory allocation
>
> Am 29.11.22 um 12:54 schrieb Pan, Xinhui:
>> [AMD Official Use Only - General]
>>
>> comments inline.
>>
>> ________________________________________
>> 发件人: Koenig, Christian <Christian.Koenig@amd.com>
>> 发送时间: 2022年11月29日 19:32
>> 收件人: Pan, Xinhui; amd-gfx@lists.freedesktop.org
>> 抄送: daniel@ffwll.ch; matthew.auld@intel.com; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Paneer Selvam, Arunpravin; intel-gfx@lists.freedesktop.org
>> 主题: Re: [PATCH v4] drm: Optimise for continuous memory allocation
>>
>> Am 29.11.22 um 11:56 schrieb xinhui pan:
>>> Currently drm-buddy does not have full knowledge of continuous memory.
>>>
>>> Lets consider scenario below.
>>> order 1:    L             R
>>> order 0: LL   LR      RL      RR
>>> for order 1 allocation, it can offer L or R or LR+RL.
>>>
>>> For now, we only implement L or R case for continuous memory allocation.
>>> So this patch aims to implement the rest cases.
>>>
>>> Adding a new member leaf_link which links all leaf blocks in asceding
>>> order. Now we can find more than 2 sub-order blocks easier.
>>> Say, order 4 can be combined with corresponding order 4, 2+2, 1+2+1,
>>> 0+1+2+0, 0+2+1+0.
>> Well that description is a bit confusing and doesn't make to much sense
>> to me.
>>
>> When you have two adjacent free order 0 blocks then those should be
>> automatically combined into an order 1. This is a fundamental property
>> of the buddy allocator, otherwise the whole algorithm won't work.
>>
>> [xh] sorry, The order above is not 4, should be 3.
>> order 3 can be combined with corresponding order 3, 2+2, 1+2+1, 0+1+2+0, 0+2+1+0
>> the order 0 + 1 + 2 + 0 case does not have two same order 0 adjacent. they are in different tree.
>> looks like below
>> order 3:                            L3                                               R3
>> order 2:            L2                              (R2)*                    L2*
>> order 1:    L1             (R1)                                         L1
>> order 0: L0   (R0)                                                 (L0)
>> R0 + R1+R2 +L0 with () around combined to be order 3.
>> R2 + L2 with * followed combined to be order 3.
>> etc....
>>
>> When you have the case of a free order 1 block with two adjacent free
>> order 0 blocks then we a fragmented address space. In this case the best
>> approach is to fail the allocation and start to swap things out.
>>
>> [xh] Eviction is expensive.
> No, it isn't. Eviction is part of the algorithm to clean this up.
>
> When we can't find any free room then evicting and moving things back in
> is the best we can do to de-fragment the address space.
>
> This is expected behavior.
>
> [xh]  I believe eviction is the best approach to cleanup memory.
> But as its cost is not cheap, it should be the final step.
> As long as we could find any room to satisfy the request, no need to trigger eviction.
>
> Just a test in theory
> two threads run parallelly.
> total memory is 128.
> while true {
> alloc 32
> alloc 32
> free 32
> free 32
> alloc 64
> free 64
> }
>
> when thread 0 wants to alloc 64, the memory layout might be
> (32) means allocated, _32_ means free.
> case 1: (32) _32_ _32_ (32)
> case 2: (32) _32_ (32) _32_
> case 3: (32) (32)  _64_
> case 4: (32) _32_ 64_
> case 5: _128_
> case 6: (64) _64_
>
> without this patch, it would trigger eviction in case 1 and case 2.
> with this patch, it would trigger eviction only in case 2.
> obviously, the two threads totally consume memory at most 128 at any time, no overcommit.
> The eviction is the less the better.

No, once more: Eviction is part of why this works as it should.

In other words eviction is expected here and de-fragments the address 
space into larger blocks.

This patch here breaks the general approach of the buddy allocator and 
is a no-go as far as I can see.

If looking at adjacent blocks would come without extra cost then we 
could consider it, but this here means extra overhead and complexity.

Regards,
Christian.

>
>
> Regards,
> Christian.
>
>> And if it still fails to find the continuous memory with this approach, then let's evict.
>>
>> So what exactly is the goal here?
>>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
>>> ---
>>> change from v3:
>>> reworked totally. adding leaf_link.
>>>
>>> change from v2:
>>> search continuous block in nearby root if needed
>>>
>>> change from v1:
>>> implement top-down continuous allocation
>>> ---
>>>     drivers/gpu/drm/drm_buddy.c | 108 +++++++++++++++++++++++++++++++++---
>>>     include/drm/drm_buddy.h     |   1 +
>>>     2 files changed, 102 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>> index 11bb59399471..8edafb99b02c 100644
>>> --- a/drivers/gpu/drm/drm_buddy.c
>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>> @@ -80,6 +80,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>>>     {
>>>         unsigned int i;
>>>         u64 offset;
>>> +     LIST_HEAD(leaf);
>>>
>>>         if (size < chunk_size)
>>>                 return -EINVAL;
>>> @@ -136,6 +137,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>>>                         goto out_free_roots;
>>>
>>>                 mark_free(mm, root);
>>> +             list_add_tail(&root->leaf_link, &leaf);
>>>
>>>                 BUG_ON(i > mm->max_order);
>>>                 BUG_ON(drm_buddy_block_size(mm, root) < chunk_size);
>>> @@ -147,6 +149,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>>>                 i++;
>>>         } while (size);
>>>
>>> +     list_del(&leaf);
>>>         return 0;
>>>
>>>     out_free_roots:
>>> @@ -205,6 +208,9 @@ static int split_block(struct drm_buddy *mm,
>>>         mark_free(mm, block->left);
>>>         mark_free(mm, block->right);
>>>
>>> +     list_add(&block->right->leaf_link, &block->leaf_link);
>>> +     list_add(&block->left->leaf_link, &block->leaf_link);
>>> +     list_del(&block->leaf_link);
>>>         mark_split(block);
>>>
>>>         return 0;
>>> @@ -256,6 +262,9 @@ static void __drm_buddy_free(struct drm_buddy *mm,
>>>                         break;
>>>
>>>                 list_del(&buddy->link);
>>> +             list_add(&parent->leaf_link, &block->leaf_link);
>>> +             list_del(&buddy->leaf_link);
>>> +             list_del(&block->leaf_link);
>>>
>>>                 drm_block_free(mm, block);
>>>                 drm_block_free(mm, buddy);
>>> @@ -386,6 +395,78 @@ alloc_range_bias(struct drm_buddy *mm,
>>>         return ERR_PTR(err);
>>>     }
>>>
>>> +static struct drm_buddy_block *
>>> +find_continuous_blocks(struct drm_buddy *mm,
>>> +                    int order,
>>> +                    unsigned long flags,
>>> +                    struct drm_buddy_block **rblock)
>>> +{
>>> +     struct list_head *head = &mm->free_list[order];
>>> +     struct drm_buddy_block *free_block, *max_block = NULL, *end, *begin;
>>> +     u64 pages = BIT(order + 1);
>>> +     u64 cur_pages;
>>> +
>>> +     list_for_each_entry(free_block, head, link) {
>>> +             if (max_block) {
>>> +                     if (!(flags & DRM_BUDDY_TOPDOWN_ALLOCATION))
>>> +                             break;
>>> +
>>> +                     if (drm_buddy_block_offset(free_block) <
>>> +                         drm_buddy_block_offset(max_block))
>>> +                             continue;
>>> +             }
>>> +
>>> +             cur_pages = BIT(order);
>>> +             begin = end = free_block;
>>> +             while (true) {
>>> +                     struct drm_buddy_block *prev, *next;
>>> +                     int prev_order, next_order;
>>> +
>>> +                     prev = list_prev_entry(begin, leaf_link);
>>> +                     if (!drm_buddy_block_is_free(prev) ||
>>> +                         drm_buddy_block_offset(prev) >
>>> +                         drm_buddy_block_offset(begin)) {
>>> +                             prev = NULL;
>>> +                     }
>>> +                     next = list_next_entry(end, leaf_link);
>>> +                     if (!drm_buddy_block_is_free(next) ||
>>> +                         drm_buddy_block_offset(next) <
>>> +                         drm_buddy_block_offset(end)) {
>>> +                             next = NULL;
>>> +                     }
>>> +                     if (!prev && !next)
>>> +                             break;
>>> +
>>> +                     prev_order = prev ? drm_buddy_block_order(prev) : -1;
>>> +                     next_order = next ? drm_buddy_block_order(next) : -1;
>>> +                     if (next_order >= prev_order) {
>>> +                             BUG_ON(drm_buddy_block_offset(end) +
>>> +                                    drm_buddy_block_size(mm, end) !=
>>> +                                    drm_buddy_block_offset(next));
>>> +                             end = next;
>>> +                             cur_pages += BIT(drm_buddy_block_order(next));
>>> +                     }
>>> +                     if (prev_order >= next_order) {
>>> +                             BUG_ON(drm_buddy_block_offset(prev) +
>>> +                                    drm_buddy_block_size(mm, prev) !=
>>> +                                    drm_buddy_block_offset(begin));
>>> +                             begin = prev;
>>> +                             cur_pages += BIT(drm_buddy_block_order(prev));
>>> +                     }
>>> +                     if (pages == cur_pages)
>>> +                             break;
>>> +                     BUG_ON(pages < cur_pages);
>>> +             }
>>> +
>>> +             if (pages > cur_pages)
>>> +                     continue;
>>> +
>>> +             *rblock = end;
>>> +             max_block = begin;
>>> +     }
>>> +     return max_block;
>>> +}
>>> +
>>>     static struct drm_buddy_block *
>>>     get_maxblock(struct list_head *head)
>>>     {
>>> @@ -637,7 +718,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>                            struct list_head *blocks,
>>>                            unsigned long flags)
>>>     {
>>> -     struct drm_buddy_block *block = NULL;
>>> +     struct drm_buddy_block *block = NULL, *rblock = NULL;
>>>         unsigned int min_order, order;
>>>         unsigned long pages;
>>>         LIST_HEAD(allocated);
>>> @@ -689,17 +770,30 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>                                 break;
>>>
>>>                         if (order-- == min_order) {
>>> +                             if (!(flags & DRM_BUDDY_RANGE_ALLOCATION) &&
>>> +                                 min_order != 0 && pages == BIT(order + 1)) {
>>> +                                     block = find_continuous_blocks(mm,
>>> +                                                                    order,
>>> +                                                                    flags,
>>> +                                                                    &rblock);
>>> +                                     if (block)
>>> +                                             break;
>>> +                             }
>>>                                 err = -ENOSPC;
>>>                                 goto err_free;
>>>                         }
>>>                 } while (1);
>>>
>>> -             mark_allocated(block);
>>> -             mm->avail -= drm_buddy_block_size(mm, block);
>>> -             kmemleak_update_trace(block);
>>> -             list_add_tail(&block->link, &allocated);
>>> -
>>> -             pages -= BIT(order);
>>> +             do {
>>> +                     mark_allocated(block);
>>> +                     mm->avail -= drm_buddy_block_size(mm, block);
>>> +                     kmemleak_update_trace(block);
>>> +                     list_add_tail(&block->link, &allocated);
>>> +                     pages -= BIT(drm_buddy_block_order(block));
>>> +                     if (block == rblock || !rblock)
>>> +                             break;
>>> +                     block = list_next_entry(block, leaf_link);
>>> +             } while (true);
>>>
>>>                 if (!pages)
>>>                         break;
>>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>>> index 572077ff8ae7..c5437bd4f4f3 100644
>>> --- a/include/drm/drm_buddy.h
>>> +++ b/include/drm/drm_buddy.h
>>> @@ -50,6 +50,7 @@ struct drm_buddy_block {
>>>          */
>>>         struct list_head link;
>>>         struct list_head tmp_link;
>>> +     struct list_head leaf_link;
>>>     };
>>>
>>>     /* Order-zero must be at least PAGE_SIZE */

