Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE88671AD4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 12:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0021C10E70F;
	Wed, 18 Jan 2023 11:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B2E10E65F;
 Wed, 18 Jan 2023 11:38:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adgOZfQqVZYCUEJSCZh2O8wKGxvf2LKvsWYWI28izxGHTp8HYwUvv61o1DeiPtXcpDUjMjsaRsUxE3f9K6snoTm55NXTP87iN6YOGu6AFCnmo8ddFs/rO3IHBpu4kGAWHR+WIVs/+mG/7hYr1coLaacVFSVXFSikyhg26fnEs4OBMLVJ9snPvunCh0QVrJj+G86dN7y83ZdvWJsSjmvRsMOh3oR3kR4wV3ROBOqQe0rYMZR1HXJvIvIVJAmg3IfOdihk07H37G9/DQvMCUXQXxMZKp0LZ49dBiTVlTJ1l1RUicBa7YZU+l2YvycxS4v+w9YD9AKv/qsXDN1dQ1DQYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkn1hHHxC4PRkTke9eVK+/MFhYdrr4z53H6XliDBEj4=;
 b=fghYJz+B98lgyElmGnKoKSMGpjRyBLVZp7az7WINPK7YCjI46wRWeNb+Iu4ag2EmKrYxFBX7iL/8dFzYL/q/azBo5q8vBGpTJ81qaZhqqvhdzytBLl4Dw4lGNnBf6/8AkVzDF5FKXt5qO5q5i+YATHY6sTuUU+GTVQF9enwrY3MdeJc2MiLS+4F2KcxBgZ3gJxelencvzmqIDj1GNQyGG1DigBuXRYPlfbV8pkCplU+kvxSnHqwJKtth7af6RhcNPdDE0XO5xC/qrkpiHxV9FFKWM8pUQfSt1ZFPwBmzu5iXjqA/C92z+gIg8EJyxag+lLXAvD1BliORy3rrIVBMTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkn1hHHxC4PRkTke9eVK+/MFhYdrr4z53H6XliDBEj4=;
 b=M6l8hS0EXl2xEA9NPurGmaG+ZOEp8DwI+FygcgPc79/feCwkkTPO+3Y0EQq5qggH6Xc7EC1qnyAmesrch25ZlAqgazeDFVXCiDjfHcE9I9YzwUa7iNAaJZMUcIyV7UfYXOTuuQPjP9RTuWW7rd9aQ48mUzM0XisfByvqOwV8nPo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 11:37:57 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 11:37:57 +0000
Message-ID: <ec3d42b7-5e11-ef50-5110-056600f10d91@amd.com>
Date: Wed, 18 Jan 2023 12:37:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Ongoing failure for "dim rebuild-tip"
To: Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
References: <b1605ab2-7f60-1e2d-de21-a6eb94afdbc7@amd.com>
 <87h6wocctz.fsf@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <87h6wocctz.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: a0fcadfa-c53e-4d4c-231a-08daf948721d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DxSlnlfYCWMRT3m/y8Wue8eby1mIXeGkhszog0yokLw/+riXngMkfKyua+QlpRewqv49xLbI3V8vcOUouPb8P1wi5la7a3tnbLwGhPK6DrWQBb2bbzqwU1PL2H4cDjlhIwd96r5f+PpuZtr2fQfz+LgznXLlUno7OgtGKJank7sO81efJIndCjjzb+NyIP7f5wAreJCdF3wJZMQ23/ueE7phRFYVLpywYaaAwKorTXsj0V+wTo3kki4DRiyZwCwLvHhn/g6aIGQmotJYhQjC8No2zZqPTKJMVWHwSMrtFnBpCY2GrZjZyiEnfcaak8jEaDGYsmD75BVyb6dBlOH3WFoyXYRVKv/YjIyaxLw21giCnbmrCKUcrFS+olugDHgPiLomu0ar4zQldNDvkZVGaE2TsUX7tghucztp761EITAVBiCCDsamFAPwRuyik3NuH0MMy43C02IR9w8YqcyOG5EdOA1MqRrhjp0QK57MYrTv2deQBHHUMdgVUEOmNe4s4niLB8c25KDvlHMHuJZ+mBX/Afqxuj+dkajkxdvPhGP5vAvAGrXxXWisNlcJTcNLxULp+B5+Vm6xKUIv3j527h1p6cFdzD4zkgEXfUyXBz5VFDbJpeaH89dc78UbOqt4mb+ykiUhmYNQh8aLLXRorbOnAQMBmlzlWRfcxtP5fYCe8zNw9A1flJZYuEBdl56kJRMgkeb2C23OZPY/B4flcYoygyJkW2HjorztgGpB+Pg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(376002)(396003)(346002)(366004)(451199015)(31686004)(110136005)(316002)(83380400001)(66476007)(41300700001)(6506007)(8676002)(8936002)(6666004)(66574015)(5660300002)(66556008)(36756003)(66946007)(2906002)(2616005)(38100700002)(186003)(86362001)(6486002)(6512007)(31696002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDZKTGR6SGhTM0RZWE1RVVVYMWJaUUFjTGJiVXFub0JVb3k1K3U2dDRLSzM2?=
 =?utf-8?B?Y21BUkhDV2FPajlxbkVlRjVRcy9kemYrZzc0ajBIZWZnV0lESktnUkswaHgz?=
 =?utf-8?B?Mk5OaVZ0dWRKRDZUbUpTS3FZdEtCeWxaalJJZVFPUHZMQTB6TWdmYWhoYTJx?=
 =?utf-8?B?a2RUUzRZMEtVR1NtQXJqQmloZnNiWDJTMWd1d1NPZ3lWR1NEb2hLT29ieFVK?=
 =?utf-8?B?a09ZSzdya2VhSW9yaW9JTVozaWQxRFFROTlYUWN5eDM0ek8zQ0xHRS9rVkFZ?=
 =?utf-8?B?RTBoNjBwcFViU3psT0dVZEJFNUh1M3F0c2JqTi9vMHlJTUR3b1ltb2NhV2dj?=
 =?utf-8?B?SDZLckt0ZFM0ZVhvNVo2SjR3NlJ3dzZ2cVBqQTN1d3RtRXFJbjZtUG8yY2Rw?=
 =?utf-8?B?ZG02NHdaTWRaN3Y4OUNBM2xZRDRXT3Ztbjl4Sk9XNFdDUmFkNjU1ZzdxTndi?=
 =?utf-8?B?RVBQNlpkMFBLRVdQTGVjcnVua2FWUHVXNGFNTCt3OE5yMTdFakl2cHF1RUVP?=
 =?utf-8?B?QWUydHZBKzI5QzVmeFlqbTBjNTEyaEthS2FOZHZ4dnFFQlppU3N0R2tOOUlK?=
 =?utf-8?B?QkZyK201UUFZOFl0Qy9JMkhhdlA1K21pTThta082Y05ObjVYbDRmTDdabllC?=
 =?utf-8?B?VXkvU1VPZlF5QnNDQWlFWXRxbmxNZ2IrcEZjaVNIMGx2MDNlLzB6dW54MnNZ?=
 =?utf-8?B?bWJjMnZOZllTYURCV1cwL3BvdWJWTzg0aDIzWkM2b2p4WWswY2YrZFk0YTQr?=
 =?utf-8?B?MEo2bEhuYkd0a2gxM3NRTXBUQUpJRkVVYjNpQUMyUFY5d25ubUJNckcxM0k5?=
 =?utf-8?B?aVFvUjd0dEJuQTRWazJIMERvRlV4Zjl5QkZSdW1CRDA2NWdxVW1zYXQwbThm?=
 =?utf-8?B?U3ZIVEhlQW9iUU9zWnp4Sm1iK3dDckMrb0I0KzM4TUs0eXdPekUvNXNOYW9J?=
 =?utf-8?B?eDNlamZmbTc4TUZPWWJqNmhHR0hVUDRXcGh4dW5IN0RWenphSGtWN1dTb0o2?=
 =?utf-8?B?SGk3b0kvRnVBdlZRRmFvZmFXNDk1QUVLQk94cXp4c3luQktad1VwaHd4U0tG?=
 =?utf-8?B?cTh6cW5OU0FoU0JwTVZlZ1h2ZHBRUDNHSDVqa0ovZC9peVBreXAxS3NpeUhw?=
 =?utf-8?B?dEE1R0tsZk1KNk1nT2dOV1lYMnExWWF3YUdZOTNEMzZyYUxONEd1blIvbDdR?=
 =?utf-8?B?MmplaWhPV2VDV2xVY3RBaVQxZ09NSlhsK3N2d1hoRkNuNXRmR1BSSkVKM01i?=
 =?utf-8?B?SXAwSHZCYitjbElTMHBDc3RVdnR5WXFRNHhxRlZqZzdwMjRiOXJQUFd5NERF?=
 =?utf-8?B?N3Rrbyt1RWtrMUNicHV6ZkNxa3RIZ1dqcXViUTZJOHJYM2tmNGpyWWs4MnBK?=
 =?utf-8?B?NjNhYlJIWUtFLys4cmZuTWZjNU5ZZ0pFbVN2aThPOWJ5czE2QmpIVFpjYWlX?=
 =?utf-8?B?anZ6RDFjRnZUL3l0Yk1hRmF6RytLaXlKSXp6NU4zMVF5bG56Z1VIL0kxM052?=
 =?utf-8?B?N2tIQmRSeTJEcFJ1RHQ0VTQyOFNXTUx2Y1NnYnpHVlFieWFPVEhPNFhTZ0ww?=
 =?utf-8?B?SjRCTS9lZGF0blpsTnVHckZLTkpLeCtzajJPZGFIYkJ3K09DNTJsY0RCK2xV?=
 =?utf-8?B?OUxtWmk2c0pFdFpkbVUvNXdrREtCYkF4Sks1S21GNVJUVnFxemVRRW9zTThR?=
 =?utf-8?B?Sm51K2Z0Q3RzUHI5U2JscUEwWmNSdU95eVlrVjU1dEg0R0R4OGRvVVhWZlc4?=
 =?utf-8?B?RVlhL21HbUxQcFhFY2ZoVE5DTmtXWEtLRWNiTGF6ZGhYR2JpZHVEYnVVVXgw?=
 =?utf-8?B?aHFYeC96cUc5dWFwZlk0a2xjT0pxY0JhTUxIWlVyR01xZ1BkclNEMGZZZWw1?=
 =?utf-8?B?V3cxMFlXUTdwTkVtTVgwYkZhRWNSN2N2ajFDODhMSERyUThpQm1vckp2MGts?=
 =?utf-8?B?YzNpV1ptRkV5enM4OUNoYlRnbUJZN0VITXRqZEdkRklxbXdiOHVTMlNsNy9r?=
 =?utf-8?B?S2VGVHJIMXQ3T1N5NnQ4c2FOVWhuZUhneGFZSjNDcE4wUHZVTkZXS01VVzdC?=
 =?utf-8?B?MmZDZk9MZmV1Qm5JOTJ3c2hsUkVReE1oSXh5eENGRFU5ZkpGS04wQVZQNmI3?=
 =?utf-8?B?cUV3bTBOQ2ZrOHpqQ2h0clFRZFVYTG03VDBWcTlTY3FRV3hyZG1JTnhhcE9s?=
 =?utf-8?Q?cbvIl0FJiDFshQXYOsKpYDuBakXPlMH3FckCjQLvkgOs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0fcadfa-c53e-4d4c-231a-08daf948721d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 11:37:57.6007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TTAZ/5zYH/hvMAkxlwTqToNoKAYDTfP1dK0eceEbFxHNfmV+lmGuLRxrIeoNkm40
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6806
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



Am 18.01.23 um 12:16 schrieb Jani Nikula:
> On Wed, 18 Jan 2023, Christian König <christian.koenig@amd.com> wrote:
>> Hi guys,
>>
>> for a couple of weeks now the command "dim rebuild-tip" fails for me.
>> The error message is:
>>
>> Merging drm-intel/drm-intel-gt-next... Applying manual fixup patch for
>> drm-tip merge... patching file drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> dim:
>> dim: FAILURE: Could not merge drm-intel/drm-intel-gt-next
>> dim: See the section "Resolving Conflicts when Rebuilding drm-tip"
>> dim: in the drm-tip.rst documentation for how to handle this situation.
>>
>> This also happens on a fresh clean install of dim, so I'm pretty sure
>> that this isn't a problem on my side.
>>
>> What can we do?
> I think you should probably try to update your git. Looks like you're
> using git version 2.25.1, and over the past year most people have been
> using 2.34.1 or later.
>
> There can be subtle differences either in the merge conflicts or in the
> recorded conflict resolutions (git rerere) between git versions, and
> sometimes a resolution from one can't be reused in another.
>
> If we knew which exact versions we require, we could add a check in
> dim. Maybe we should just randomly warn about older than
> 2.34.1. *shrug*.

Ah! Thanks a lot for that hint, yes that explains it.

All the systems where I had this phenomena where Ubuntu 20.04 based 
(which uses git 2.25.1), the ones with Ubuntu 22.04 where unaffected.

Good to know,
Christian.

>
>
> BR,
> Jani.
>
>

