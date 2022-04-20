Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5210D50885B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 14:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335CF10F15D;
	Wed, 20 Apr 2022 12:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2044.outbound.protection.outlook.com [40.107.96.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E964F10F17C;
 Wed, 20 Apr 2022 12:42:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXtXjYpfcD8mLf6vd6m954ToURZvbRVFOOy6Gu6ZEncf09y8aR4oJzAvB+iy8WTx09R4Au/XqdA4kbDuo7v2yBlOmTs+qxvt3ABwuzTVg3lGg9bHaVZ41/5tjFFNTFMb9YIrtLH0m3xw87CPzUmMv/Ph/kXWRtYEJ35Ss5k2FVyTOB1AeBskTgAyO3asbSkGYDEGE8tJDI4oSxu0k1M/4pOUBawNZGnnZjk5KHAfOlWUOHbbWxJ1itUr2lvUGnYRXXeDoHRqNa61ujIzwzjeT2GMsfp4nvJhgipYj1vPmy9kBC8v+bU+Bmuew3TOer/UdW1LSkBRjj9HgC+DlA1bag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q8p6Q7j1ehyFTVNWl3pGXEVmDTOXYSil/+G2J1Wcct4=;
 b=PZAziMkKvo3Cqae2E8woJSsQ89dMJc3n7giD+B/vnWE98yqppQa+cSDX773TfSF2n+jDZs0SF/8Ty/ZJVOwA6s+VLsrPq8JGrhgX8nSh4R5sVN8PhFmcpKa3VTh7x7HPdLj149egfUqLpHpYIfRuniVUjou3u4fcOQnGJIKCyou0KX6VICUdOjcALG0jTalHZOAy3cD40HYuT7Rsau3j/TuukHryeA303Q0RU+xKRhMA+zeGhjFskQdQud0GCUYauqN+pfKQ7O9CoVlqN+GAhSCROXZp5noBIOKoTP4it+R0BkLeZxim5SPZDOMvHQfuRkwTkeTq+s3jUfjeUNLT3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8p6Q7j1ehyFTVNWl3pGXEVmDTOXYSil/+G2J1Wcct4=;
 b=LF+67A58CVc/vMr9f+Rx7AjHReMoRtG8i+Sng09Z2PVEgLlrRaLw6GN19PO4w1QmT3MlhVcnXblUNzsDObxr8i2p6tIzFBtxzpCp9m1/pzwJAMySmoq3R523ZrclIy6bP+UqBvMFHPeDNX+l2n3H9+lREf63uw3Kq/Y2M0fBLZo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN1PR12MB2381.namprd12.prod.outlook.com (2603:10b6:802:2f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 12:42:28 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5164.026; Wed, 20 Apr 2022
 12:42:28 +0000
Content-Type: multipart/alternative;
 boundary="------------2R6jqFgzNJ0RbutqKPIW5VOm"
Message-ID: <71f3ac77-b6ed-e503-8e05-dcf9d2c2811a@amd.com>
Date: Wed, 20 Apr 2022 14:42:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmalloc
 limit
Content-Language: en-US
To: "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20220420085612.1664787-1-KevinYang.Wang@amd.com>
 <00dfec71-cf38-d6d9-8775-0ae88f59224e@amd.com>
 <CO6PR12MB54733101E19842B59668482B82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <65ef352b-59c8-e802-5285-afc59e56fa9b@amd.com>
 <CO6PR12MB547340CB065269B1731812B182F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <572ed15c-b47e-e7b3-850a-cb0d5259af04@gmail.com>
 <CO6PR12MB54735D4B8E05AB1C17D356AE82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CO6PR12MB54735D4B8E05AB1C17D356AE82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
X-ClientProxiedBy: AM7PR04CA0017.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::27) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0ebb653-9142-4344-a0b2-08da22cb3a37
X-MS-TrafficTypeDiagnostic: SN1PR12MB2381:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB2381E2FE2F14FFE7DE34F05683F59@SN1PR12MB2381.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1hV3pl56RA8Cv0rDoHWoUfPVSYkcLz2Oq7tYE8q1x0nhQzTt1wQXISgIjJEhyVPjc0lcMQ0Uqmjb8ZCfUJA+Ec2EB3T+NtVpwWng9helkkdWiiSzCM53doH9p3GLtRrVFFIh+8EIglNOHxtrqgF1Bs7s6KjwuCRuo1WODVItJStnF4W3WsErTckhWodtf0+eqRAHC2LY/GAO/K8CIf4W4i5rBHshu2hzkajrsF3ovlQgBKfzSu4q7AAsxwZDLNsRwKaz6TEffyqX8nSEV1wpcA39m8tBqbRVJIPIorKA2uEJjBQNLzoWVAZRGv1OsAkBDj+Mzhfa+jNqC+BHA0lQfEGVg7EUeOa+zEFNbKirO4IFkh5TpInUXcF34dctZPeKSNkh4Ln/Jzuni6fDXa9ELbTXBTJuOMXjZQYziQlvMbbndX6Wr9hkNBLxhnRH/07JFmzeC3acWoJpL9xpQz8XzKXM3U9BWYoyQch98DcOXyRrDtepTCFoj3PwtIxOGubfD3cLgmXW4rgvrjvS515lZkF1rHuDQ6Td+tjfpt7ZmDk4HNfagr0bJuPEn6a4KIuGaSgkX71XYZf9bbOAMoIbRRnP2BDnA0OAtFmDOO939XuZw7Om0wqkSV8hYaVGg9NarMv7S3VsEJFnkeee873cvTz3VzV0i5BX6elfogGDlDPSTaNcywYipPv0YXFWO/vMENmZ26Z4SpF4RBqp4x+nC1p2NICx6o1upf6B3usDf3nD53oTSlurk0aoyH1E3pdhF/+4FCHqZRiUMrRF7jCykViipFfNiKxgEWeEqeh0lTjExUCH59TWxQ/GeWTE04S4zfID8uK+RhKWb6PuleKscg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(38100700002)(19627405001)(316002)(8676002)(66556008)(66946007)(31686004)(166002)(110136005)(66476007)(5660300002)(45080400002)(6512007)(33964004)(53546011)(2906002)(6506007)(83380400001)(6486002)(86362001)(508600001)(186003)(30864003)(6666004)(31696002)(26005)(66574015)(2616005)(8936002)(45980500001)(43740500002)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjRLbEh5OCtJS0lnUWtqVzlYYzJCYXV2b1owbGYyR29ZVlhHUTRBNDBlTmNr?=
 =?utf-8?B?YnJvejFLM2pjaVNoc3Rqb0UraEFtYmNESitaSGwyVHFBaHFKRDNrZjlxdWlO?=
 =?utf-8?B?MzNuUHJFcWgwc09SRXRIMmV1dHhwMkdwcUZBSytsMjZSenlGWHVWT2Fpek5z?=
 =?utf-8?B?MzBzUUZsTTVkUmRJZnlTa0FWUGlXcXlDdm0yK2NMek42L3VpS0RaK3VEMDlL?=
 =?utf-8?B?SUQzU2lHdzdTZnBRRVpHQVlnclZXTDhMUko4c25zUS9SQ3l2MmRXTUkzYjY5?=
 =?utf-8?B?WmpJbU9EZEF5SHFpUTlkYVBMZVY2TmpZc2ZrcWNJRHgzYjNoZnRjVHZpbU9q?=
 =?utf-8?B?akdTa0FFRG9GZUptejlGcXZ2RGNYWittT2hSM09yWFFPSDVqcUJCSXE4UVNi?=
 =?utf-8?B?Zng2b0dndUFlWDdBNDFYdWxsNHloTzlOUFNBaExnWmxxNnB3YTRBSXExbjA3?=
 =?utf-8?B?eVpNbFlyTVNoN2RySE13WHBlL0xaRW1EcFdvdVh1M1p6MnlCMFpkVGpEYjRx?=
 =?utf-8?B?VDdxMXAzYzJHUFNvcGNVMGlnK0YwNHlkSnVCNS9vM0VtUlFHNlVxU1dMaHJ4?=
 =?utf-8?B?S3d1b0pPbHhnb01qbkp0d1phT0FFMDZkTk5YS3phMUo4V0ovZUMrWE03eDA0?=
 =?utf-8?B?Q0RnVWNQT0RzcWVHSXNzYnBML3phdnkxQmxOYWEvZHVpUEhCNU92MUovOGFU?=
 =?utf-8?B?MFlWN2pJMEhHaE81TzRpaS9iNlFBYXlaSHpBNVlheUR1eTV2UkNHWGNqdStk?=
 =?utf-8?B?QlRyd2NzcjZSZ25pd2JnK3Q1SFkrWTlUZWlVQ1JMdkFncXY2Yk9vY0c1SjVn?=
 =?utf-8?B?ejZQVjZSL3pjU05VN2xySDkzNmJTSlM1NGViTTM4MTBjdmpHSWpjNnp5WXhJ?=
 =?utf-8?B?OWVKVDcrdjFRTXFFK0RvMlhBd1Jsd0FPYVF3UlhtaldNb2xWSnl0TllJOEph?=
 =?utf-8?B?WVJnMnduZC9BTDQvNlZJK1FwZTQ2RVR4Rk4xR0RkOHNGbkRtK1ZWUExSRHNr?=
 =?utf-8?B?eDZBcnVLMS9HVjh0SHQwLzNKNVZMamlneWE2N1F2YVNBOHNaVHVSYVBmUUJ4?=
 =?utf-8?B?b2NlMi9OdEllaVJwZ3Y5VVU5R3hxZElVTEd5UThkMzA5VkZWT3dEbDBHaVpu?=
 =?utf-8?B?ZXhiMUFCMjdycno2VWt5blI2QjlMa1VVTW1oUTZiTFZGUkVqRS8rTHZlR2xD?=
 =?utf-8?B?MFVzcFFXK0o3Mm9QQ0xTZVNjRTNEbkgyZjJ3WUliQWphdEd4enVwSjMvRU9D?=
 =?utf-8?B?VDNuWjloTjJVZVAvQzV4UWpLZXF3YXJTZ28wZXBwVk9PK3RxOW9SandJd0hQ?=
 =?utf-8?B?OHlMa0pYRlZFRy8rcjZrQWlieHRHMXFod09FZEtoM0tEeEFkTjBDMXZURGJl?=
 =?utf-8?B?VEYyTE9tbUY2eVNpU2NtZmN0ZUZZSkZLVlkySjNiRzJnUlF6SnMxb25DYWhW?=
 =?utf-8?B?NXd1WjdhVm9pNXJyOWRKNFpBbVUzVXBRQmhYODF1QmV3c1NzOFZUTDVTeHBx?=
 =?utf-8?B?ZitOYW5Rd2kvZ3hObDN6WVQyU1BlQ0dxUHBOZHlacVppeVV2RTAycjlJcGlI?=
 =?utf-8?B?aHI2elpsVUxFK2R0TmM0ZExudGdHSEluSGxNclhKUnFWWHZiZmp3QmkxSG9Y?=
 =?utf-8?B?WW1lM2JValR4a3d5c2xGZitzSEFFZmNwcWRpblJUMEJ2Y3owM1FuZUlvR3Ir?=
 =?utf-8?B?ZFZFTVI0REIyeFYxQ0xPMVAySnMvRnZMRGZ5R25TdjZSaUcxT3FyejNkbDdX?=
 =?utf-8?B?TkZqMWhyRG5aQTNlajdqbDhLa21qODZ5MEZOeWliWGVSak9hbHZsdW9wSGVW?=
 =?utf-8?B?N2hzQjZ2cGM5eXVVOHdmbm9aMW1nUUJPQXYzMThCZnV6elRJZGZvYmdyb1pU?=
 =?utf-8?B?NGZkTlpibnhWdlZhalkzcTVNb3oxdmQ2Nklqa3BrSWZic1o2VTdXSWtEYnZp?=
 =?utf-8?B?NU55NlpDc1RkaW1jNGxFNXlsNmxveWlHSGZSZkd3LzJ6VU1pVGluN2t5QnZs?=
 =?utf-8?B?UUpMVHlVS1kvdS9GMGNVZkR3amRPK1N0cFRPVHJvSFRNdlJGVEhWcUFKWUVT?=
 =?utf-8?B?ZCs2VVpyWGhwekk2c1orV0hOMnB1K2hHMDdvbGFWV2ZtQlNJcklYQUZKNm5l?=
 =?utf-8?B?eDFpYU9oVWlpVVJJNzh0b2FrM1VUOGpUTFhaa1UrZURmQXp2K0xRSHMwdjBn?=
 =?utf-8?B?dlFJVytXbzdvWHJ0cXdXb0tRRGNHMG1pN0YvMU9TRzU2NGs1aUE3SkplYW5j?=
 =?utf-8?B?c2hTWlYwMEJLcTJhaE1PSnBYa1hkWDFXL0plMkhaTG9IUzRCU2twYTMybENM?=
 =?utf-8?B?VXFGMzhTSFg2dVQxMWppS1YxSFhKRnBLdE1NTmMxQ2V1REZoNG9oZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ebb653-9142-4344-a0b2-08da22cb3a37
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 12:42:28.1619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YTV4wiOz0SCKSehwFkfSNN+M5FSWQ7QmEe6053NVz15aNO3VRbfnmAdJRwyl7M+f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2381
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

--------------2R6jqFgzNJ0RbutqKPIW5VOm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Kevin,

yes and that is perfectly valid and expected behavior. There is 
absolutely no need to change anything in TTM here.

What we could do is:
1) Change the test case to use something larger than 1TiB.
2) Change kvmalloc to allow GFP_ZERO allocations even in the vmalloc 
fallback path.

Regards,
Christian.

Am 20.04.22 um 14:39 schrieb Wang, Yang(Kevin):
>
> [AMD Official Use Only]
>
>
> Hi Chirs,
>
> yes, right, the amdgpu drive rwill use amdgpu_bo_validate_size() 
> function to verify bo size,
> but when driver try to allocate VRAM domain bo fail, the amdgpu driver 
> will fall back to allocate domain = (GTT | VRAM)  bo.
> please check following code, it will cause the 2nd time to allocate bo 
> fail during allocate 256Mb buffer to store dma address (via kvmalloc()).
>
>   initial_domain = (u32)(0xffffffff & args->in.domains);
> retry:
>         r = amdgpu_gem_object_create(adev, size, args->in.alignment,
>                  initial_domain,
>                  flags, ttm_bo_type_device, resv, &gobj);
>         if (r && r != -ERESTARTSYS) {
>                 if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {
>     flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
>     goto retry;
>                 }
>
>                 if (initial_domain == AMDGPU_GEM_DOMAIN_VRAM) {
>     initial_domain |= AMDGPU_GEM_DOMAIN_GTT;
>     goto retry;
>                 }
> DRM_DEBUG("Failed to allocate GEM object (%llu, %d, %llu, %d)\n",
>             size, initial_domain, args->in.alignment, r);
>   }
>
> Best Regards,
> Kevin
>
> ------------------------------------------------------------------------
> *From:* Christian König <ckoenig.leichtzumerken@gmail.com>
> *Sent:* Wednesday, April 20, 2022 7:55 PM
> *To:* Wang, Yang(Kevin) <KevinYang.Wang@amd.com>; Koenig, Christian 
> <Christian.Koenig@amd.com>; dri-devel@lists.freedesktop.org 
> <dri-devel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org 
> <amd-gfx@lists.freedesktop.org>
> *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds 
> kmalloc limit
> Hi Kevin,
>
> no, the test case should already fail in amdgpu_bo_validate_size().
>
> If we have a system with 2TiB of memory where the test case could 
> succeed then we should increase the requested size to something larger.
>
> And if the underlying core Linux kernel functions don't allow 
> allocations as large as the requested one we should *NEVER* ever add 
> workarounds like this.
>
> It is perfectly expected that this test case is not able to fulfill 
> the desired allocation. That it fails during kvmalloc is unfortunate, 
> but not a show stopper.
>
> Regards,
> Christian.
>
>
> Am 20.04.22 um 13:32 schrieb Wang, Yang(Kevin):
>>
>> [AMD Official Use Only]
>>
>>
>> Hi Chris,
>>
>> you misunderstood background about this case.
>>
>> although we expect this test case to fail, it should fail at the 
>> location where the Bo actual memory is actually allocated. now the 
>> code logic will cause the failure to allocate memory to store DMA 
>> address.
>>
>> e.g: the case is failed in 2TB system ram machine, it should be 
>> allocated successful, but it is failed.
>>
>> allocate 1TB BO, the ttm should allocate 1TB/4k * 8 buffer to store 
>> allocate result (page address), this should not be failed usually.
>>
>> There is a similar fix in upstream kernel 5.18, before this fix 
>> entered the TTM code, this problem existed in TTM.
>>
>> kernel/git/torvalds/linux.git - Linux kernel source tree 
>> <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Fcommit%2F%3Fh%3Dv5.18-rc3%26id%3Da421ef303008b0ceee2cfc625c3246fa7654b0ca&data=05%7C01%7CKevinYang.Wang%40amd.com%7C2e9fd86a27d64a39432508da22c4b1f1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637860525454702938%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=CiP9x3grwQ2aXFZPjpsAtwLCpBVeJufbGngy%2BtXLFbM%3D&reserved=0>
>> mm: allow !GFP_KERNEL allocations for kvmalloc
>>
>> Best Regards,
>> Kevin
>>
>> ------------------------------------------------------------------------
>> *From:* Koenig, Christian <Christian.Koenig@amd.com> 
>> <mailto:Christian.Koenig@amd.com>
>> *Sent:* Wednesday, April 20, 2022 6:53 PM
>> *To:* Wang, Yang(Kevin) <KevinYang.Wang@amd.com> 
>> <mailto:KevinYang.Wang@amd.com>; dri-devel@lists.freedesktop.org 
>> <mailto:dri-devel@lists.freedesktop.org> 
>> <dri-devel@lists.freedesktop.org> 
>> <mailto:dri-devel@lists.freedesktop.org>; 
>> amd-gfx@lists.freedesktop.org <mailto:amd-gfx@lists.freedesktop.org> 
>> <amd-gfx@lists.freedesktop.org> <mailto:amd-gfx@lists.freedesktop.org>
>> *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size 
>> exceeds kmalloc limit
>> Am 20.04.22 um 11:07 schrieb Wang, Yang(Kevin):
>>>
>>> [AMD Official Use Only]
>>>
>>>
>>>
>>> ------------------------------------------------------------------------
>>> *From:* Koenig, Christian <Christian.Koenig@amd.com> 
>>> <mailto:Christian.Koenig@amd.com>
>>> *Sent:* Wednesday, April 20, 2022 5:00 PM
>>> *To:* Wang, Yang(Kevin) <KevinYang.Wang@amd.com> 
>>> <mailto:KevinYang.Wang@amd.com>; dri-devel@lists.freedesktop.org 
>>> <mailto:dri-devel@lists.freedesktop.org> 
>>> <dri-devel@lists.freedesktop.org> 
>>> <mailto:dri-devel@lists.freedesktop.org>; 
>>> amd-gfx@lists.freedesktop.org <mailto:amd-gfx@lists.freedesktop.org> 
>>> <amd-gfx@lists.freedesktop.org> <mailto:amd-gfx@lists.freedesktop.org>
>>> *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size 
>>> exceeds kmalloc limit
>>> Am 20.04.22 um 10:56 schrieb Yang Wang:
>>> > if the __GFP_ZERO is set, the kvmalloc() can't fallback to use 
>>> vmalloc()
>>>
>>> Hui what? Why should kvmalloc() not be able to fallback to vmalloc()
>>> when __GFP_ZERO is set?
>>>
>>> And even that is really the case then that sounds like a bug in 
>>> kvmalloc().
>>>
>>> Regards,
>>> Christian.
>>>
>>> [kevin]:
>>> it is really test case from libdrm amdgpu test, which try to 
>>> allocate a big BO which will cause ttm tt init fail.
>>
>>
>> LOL! Guys, this test case is intended to fail!
>> *
>> *The test consists of allocating a buffer so ridiculous large that it 
>> should never succeed and be rejected by the kernel driver.
>>
>> This patch here is a really clear NAK.
>>
>> Regards,
>> Christian.
>>
>>> it may be a kvmalloc() bug, and this patch can as a workaround 
>>> in ttm before this issue fix.
>>>
>>> void *kvmalloc_node(size_t size, gfp_t flags, int node)
>>> {
>>> ...
>>> if ((flags & GFP_KERNEL) != GFP_KERNEL)
>>>         return kmalloc_node(size, flags, node);
>>> ...
>>> }
>>>
>>> Best Regards,
>>> Kevin
>>>
>>> > to allocate memory, when request size is exceeds kmalloc limit, it 
>>> will
>>> > cause allocate memory fail.
>>> >
>>> > e.g: when ttm want to create a BO with 1TB size, it maybe fail.
>>> >
>>> > Signed-off-by: Yang Wang <KevinYang.Wang@amd.com> 
>>> <mailto:KevinYang.Wang@amd.com>
>>> > ---
>>> >   drivers/gpu/drm/ttm/ttm_tt.c | 14 +++++++++++---
>>> >   1 file changed, 11 insertions(+), 3 deletions(-)
>>> >
>>> > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c 
>>> b/drivers/gpu/drm/ttm/ttm_tt.c
>>> > index 79c870a3bef8..9f2f3e576b8d 100644
>>> > --- a/drivers/gpu/drm/ttm/ttm_tt.c
>>> > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>>> > @@ -97,9 +97,12 @@ int ttm_tt_create(struct ttm_buffer_object *bo, 
>>> bool zero_alloc)
>>> >   static int ttm_tt_alloc_page_directory(struct ttm_tt *ttm)
>>> >   {
>>> >        ttm->pages = kvmalloc_array(ttm->num_pages, sizeof(void*),
>>> > -                     GFP_KERNEL | __GFP_ZERO);
>>> > + GFP_KERNEL);
>>> >        if (!ttm->pages)
>>> >                return -ENOMEM;
>>> > +
>>> > +     memset(ttm->pages, 0, ttm->num_pages * sizeof(void *));
>>> > +
>>> >        return 0;
>>> >   }
>>> >
>>> > @@ -108,10 +111,12 @@ static int 
>>> ttm_dma_tt_alloc_page_directory(struct ttm_tt *ttm)
>>> >        ttm->pages = kvmalloc_array(ttm->num_pages,
>>> > sizeof(*ttm->pages) +
>>> > sizeof(*ttm->dma_address),
>>> > - GFP_KERNEL | __GFP_ZERO);
>>> > + GFP_KERNEL);
>>> >        if (!ttm->pages)
>>> >                return -ENOMEM;
>>> >
>>> > +     memset(ttm->pages, 0, ttm->num_pages * (sizeof(*ttm->pages) 
>>> + sizeof(*ttm->dma_address)));
>>> > +
>>> >        ttm->dma_address = (void *)(ttm->pages + ttm->num_pages);
>>> >        return 0;
>>> >   }
>>> > @@ -120,9 +125,12 @@ static int 
>>> ttm_sg_tt_alloc_page_directory(struct ttm_tt *ttm)
>>> >   {
>>> >        ttm->dma_address = kvmalloc_array(ttm->num_pages,
>>> >                                         sizeof(*ttm->dma_address),
>>> > - GFP_KERNEL | __GFP_ZERO);
>>> > + GFP_KERNEL);
>>> >        if (!ttm->dma_address)
>>> >                return -ENOMEM;
>>> > +
>>> > +     memset(ttm->dma_address, 0, ttm->num_pages * 
>>> sizeof(*ttm->dma_address));
>>> > +
>>> >        return 0;
>>> >   }
>>> >
>>>
>>
>

--------------2R6jqFgzNJ0RbutqKPIW5VOm
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Kevin,<br>
    <br>
    yes and that is perfectly valid and expected behavior. There is
    absolutely no need to change anything in TTM here.<br>
    <br>
    What we could do is:<br>
    1) Change the test case to use something larger than 1TiB.<br>
    2) Change kvmalloc to allow GFP_ZERO allocations even in the vmalloc
    fallback path.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 20.04.22 um 14:39 schrieb Wang,
      Yang(Kevin):<br>
    </div>
    <blockquote type="cite" cite="mid:CO6PR12MB54735D4B8E05AB1C17D356AE82F59@CO6PR12MB5473.namprd12.prod.outlook.com">
      
      <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
      <p style="font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" align="Left">
        [AMD Official Use Only]<br>
      </p>
      <br>
      <div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <span style="font-family: Calibri, Arial, Helvetica,
            sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0);">Hi Chirs,</span></div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <br>
        </div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <span style="font-family: Calibri, Arial, Helvetica,
            sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0);">yes, right, the amdgpu
            drive rwill use&nbsp;</span><span style="font-family: Calibri,
            Arial, Helvetica, sans-serif; font-size: 12pt;
            background-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0);
            display: inline !important;">amdgpu_bo_validate_size()
            function to verify bo size,</span></div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <span style="font-family: Calibri, Arial, Helvetica,
            sans-serif; font-size: 12pt; background-color: rgba(0, 0, 0,
            0); display: inline !important; color: rgb(0, 0, 0);">but
            when driver try to allocate VRAM domain bo fail, the amdgpu
            driver will fall back to allocate domain = (GTT | VRAM)&nbsp; bo.</span></div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          color: rgb(0, 0, 0);" class="elementToProof">
          <span style="font-size: 12pt; font-family: Calibri, Arial,
            Helvetica, sans-serif; background-color: rgba(0, 0, 0, 0);
            display: inline !important; color: rgb(0, 0, 0);">please
            check following code, it will cause the 2</span><span style="font-family: Calibri, Arial, Helvetica, sans-serif;
            background-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0);
            display: inline !important;"><span style="font-size:
              13.3333px;">nd time</span><span style="font-size: 12pt;">&nbsp;to
              allocate bo fail during allocate 256Mb buffer to store dma
              address (via kvmalloc()).</span></span></div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <span style="font-family:&quot;Segoe UI&quot;, &quot;Segoe UI
            Web (West European)&quot;, &quot;Segoe UI&quot;,
            -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica
            Neue&quot;,
            sans-serif;font-size:14px;background-color:rgb(255, 255,
            255);display:inline !important"><br>
          </span></div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <span style="font-family: Calibri, Arial, Helvetica,
            sans-serif; font-size: 12pt; background-color: rgba(0, 0, 0,
            0); display: inline !important; color: rgb(0, 0, 0);">&nbsp; &nbsp; &nbsp;
            &nbsp; initial_domain = (u32)(0xffffffff &amp;
            args-&gt;in.domains);</span><span style="font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web
            (West European)&quot;, &quot;Segoe UI&quot;, -apple-system,
            BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;,
            sans-serif;font-size:14px;background-color:rgb(255, 255,
            255);display:inline !important">
            <div><span style="font-family: Calibri, Arial, Helvetica,
                sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
                background-color: rgba(0, 0, 0, 0);">retry:</span></div>
            <div><span style="font-family: Calibri, Arial, Helvetica,
                sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
                background-color: rgba(0, 0, 0, 0);">&nbsp; &nbsp; &nbsp; &nbsp; r =
                amdgpu_gem_object_create(adev, size,
                args-&gt;in.alignment,</span></div>
            <div><span style="font-family: Calibri, Arial, Helvetica,
                sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
                background-color: rgba(0, 0, 0, 0);">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;initial_domain,</span></div>
            <div><span style="font-family: Calibri, Arial, Helvetica,
                sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
                background-color: rgba(0, 0, 0, 0);">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;flags, ttm_bo_type_device, resv,
                &amp;gobj);</span></div>
            <div><span style="font-family: Calibri, Arial, Helvetica,
                sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
                background-color: rgba(0, 0, 0, 0);">&nbsp; &nbsp; &nbsp; &nbsp; if (r
                &amp;&amp; r != -ERESTARTSYS) {</span></div>
            <div><span style="font-family: Calibri, Arial, Helvetica,
                sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
                background-color: rgba(0, 0, 0, 0);">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if
                (flags &amp; AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {</span></div>
            <div><span style="font-family: Calibri, Arial, Helvetica,
                sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
                background-color: rgba(0, 0, 0, 0);">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; flags &amp;= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;</span></div>
            <div><span style="font-family: Calibri, Arial, Helvetica,
                sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
                background-color: rgba(0, 0, 0, 0);">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; goto retry;</span></div>
            <div><span style="font-family: Calibri, Arial, Helvetica,
                sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
                background-color: rgba(0, 0, 0, 0);">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</span></div>
            <div><br>
            </div>
            <div><span style="font-family: Calibri, Arial, Helvetica,
                sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
                background-color: rgba(0, 0, 0, 0);">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if
                (initial_domain == AMDGPU_GEM_DOMAIN_VRAM) {</span></div>
            <div><span style="font-family: Calibri, Arial, Helvetica,
                sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
                background-color: rgba(0, 0, 0, 0);">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; initial_domain |= AMDGPU_GEM_DOMAIN_GTT;</span></div>
            <div><span style="font-family: Calibri, Arial, Helvetica,
                sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
                background-color: rgba(0, 0, 0, 0);">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; goto retry;</span></div>
            <div><span style="font-family: Calibri, Arial, Helvetica,
                sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
                background-color: rgba(0, 0, 0, 0);">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</span></div>
            <div><span style="font-family: Calibri, Arial, Helvetica,
                sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
                background-color: rgba(0, 0, 0, 0);">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                DRM_DEBUG(&quot;Failed to allocate GEM object (%llu, %d,
                %llu, %d)\n&quot;,</span></div>
            <div><span style="font-family: Calibri, Arial, Helvetica,
                sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
                background-color: rgba(0, 0, 0, 0);">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size, initial_domain, args-&gt;in.alignment,
                r);</span></div>
          </span><span style="font-family: Calibri, Arial, Helvetica,
            sans-serif; font-size: 12pt; background-color: rgba(0, 0, 0,
            0); display: inline !important; color: rgb(0, 0, 0);">&nbsp; &nbsp; &nbsp;
            &nbsp; }</span><span style="font-family:&quot;Segoe UI&quot;,
            &quot;Segoe UI Web (West European)&quot;, &quot;Segoe
            UI&quot;, -apple-system, BlinkMacSystemFont, Roboto,
            &quot;Helvetica Neue&quot;,
            sans-serif;font-size:14px;background-color:rgb(255, 255,
            255);display:inline !important"><br>
          </span></div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <br>
        </div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <span style="font-family: Calibri, Arial, Helvetica,
            sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0);">Best Regards,</span></div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <span style="font-family: Calibri, Arial, Helvetica,
            sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0);">Kevin</span></div>
        <div style="font-family:Calibri,Arial,Helvetica,sans-serif;
          font-size:12pt; color:rgb(0,0,0)">
          <br>
        </div>
        <hr tabindex="-1" style="display:inline-block; width:98%">
        <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt" face="Calibri, sans-serif" color="#000000"><b>From:</b>
            Christian König <a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a><br>
            <b>Sent:</b> Wednesday, April 20, 2022 7:55 PM<br>
            <b>To:</b> Wang, Yang(Kevin) <a class="moz-txt-link-rfc2396E" href="mailto:KevinYang.Wang@amd.com">&lt;KevinYang.Wang@amd.com&gt;</a>;
            Koenig, Christian <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a>;
            <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a>;
            <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
            <b>Subject:</b> Re: [PATCH] drm/ttm: fix ttm tt init fail
            when size exceeds kmalloc limit</font>
          <div>&nbsp;</div>
        </div>
        <div class="elementToProof">Hi Kevin,<br>
          <br>
          no, the test case should already fail in
          amdgpu_bo_validate_size().<br>
          <br>
          If we have a system with 2TiB of memory where the test case
          could succeed then we should increase the requested size to
          something larger.<br>
          <br>
          And if the underlying core Linux kernel functions don't allow
          allocations as large as the requested one we should *NEVER*
          ever add workarounds like this.<br>
          <br>
          It is perfectly expected that this test case is not able to
          fulfill the desired allocation. That it fails during kvmalloc
          is unfortunate, but not a show stopper.<br>
          <br>
          Regards,<br>
          Christian.<br>
          <br>
          <br>
          <div class="x_moz-cite-prefix">Am 20.04.22 um 13:32 schrieb
            Wang, Yang(Kevin):<br>
          </div>
          <blockquote type="cite">
            <p style="margin-top: 0px; margin-bottom:
              0px;font-family:Arial; font-size:10pt; color:#0000FF;
              margin:5pt" align="Left">
              [AMD Official Use Only]<br>
            </p>
            <br>
            <div>
              <div class="x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                  font-size:12pt; color:rgb(0,0,0);
                  background-color:rgba(0,0,0,0)">Hi Chris,</span></div>
              <div class="x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <br>
              </div>
              <div class="x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                  font-size:12pt; color:rgb(0,0,0);
                  background-color:rgba(0,0,0,0)">you misunderstood
                  background about this case.</span></div>
              <div class="x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                  font-size:12pt; color:rgb(0,0,0);
                  background-color:rgba(0,0,0,0)"><br>
                </span></div>
              <div class="x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                  font-size:12pt; color:rgb(0,0,0);
                  background-color:rgba(0,0,0,0)">a</span><span style="color:rgb(0,0,0);
                  font-family:Calibri,Arial,Helvetica,sans-serif;
                  font-size:12pt; background-color:rgba(0,0,0,0)">lthough
                  we expect this test case to fail, it should fail at
                  the location where the Bo actual memory is actually
                  allocated. now the code logic will cause the failure
                  to allocate memory to store DMA address.</span></div>
              <div class="x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <span style="color:rgb(0,0,0);
                  font-family:Calibri,Arial,Helvetica,sans-serif;
                  font-size:12pt; background-color:rgba(0,0,0,0)"><br>
                </span></div>
              <div class="x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <span style="color:rgb(0,0,0);
                  font-family:Calibri,Arial,Helvetica,sans-serif;
                  font-size:12pt; background-color:rgba(0,0,0,0)"><span style="background-color:rgb(255,255,255);
                    display:inline!important">e.g:&nbsp;</span>the case is
                  failed in 2TB system ram machine, it should be
                  allocated successful, but it is failed.</span></div>
              <div class="x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <span style="color:rgb(0,0,0);
                  font-family:Calibri,Arial,Helvetica,sans-serif;
                  font-size:12pt"><br>
                </span></div>
              <div class="x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <span style="color:rgb(0,0,0);
                  font-family:Calibri,Arial,Helvetica,sans-serif;
                  font-size:12pt; background-color:rgba(0,0,0,0)">allocate
                  1TB BO, the ttm should allocate 1TB/4k * 8 buffer to
                  store allocate result (page address), this should not
                  be failed usually.</span></div>
              <div class="x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <span style="color:rgb(0,0,0); font-size:12pt;
                  background-color:rgba(0,0,0,0);
                  font-family:Calibri,Arial,Helvetica,sans-serif"><br>
                </span></div>
              <div class="x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <span style="color:rgb(0,0,0); font-size:12pt;
                  background-color:rgba(0,0,0,0);
                  font-family:Calibri,Arial,Helvetica,sans-serif">There
                  is a similar fix in upstream kernel 5.18, b</span><span style="color:rgb(0,0,0); font-size:12pt;
                  background-color:rgba(0,0,0,0);
                  font-family:Calibri,Arial,Helvetica,sans-serif">efore
                  this fix entered the TTM code, this problem existed in
                  TTM.</span></div>
              <div class="x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <span style="color:rgb(0,0,0); font-size:12pt;
                  background-color:rgba(0,0,0,0);
                  font-family:Calibri,Arial,Helvetica,sans-serif"><br>
                </span></div>
              <div class="x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <span style="color:rgb(0,0,0); font-size:12pt;
                  background-color:rgba(0,0,0,0);
                  font-family:Calibri,Arial,Helvetica,sans-serif"><a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Fcommit%2F%3Fh%3Dv5.18-rc3%26id%3Da421ef303008b0ceee2cfc625c3246fa7654b0ca&amp;data=05%7C01%7CKevinYang.Wang%40amd.com%7C2e9fd86a27d64a39432508da22c4b1f1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637860525454702938%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=CiP9x3grwQ2aXFZPjpsAtwLCpBVeJufbGngy%2BtXLFbM%3D&amp;reserved=0" data-auth="Verified" originalsrc="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.18-rc3&amp;id=a421ef303008b0ceee2cfc625c3246fa7654b0ca" shash="KMFRekIa5um9dneRj4pqsGBn2wIcYBwLUel6we5AalD06U/g9WcKPxBwS4F9Mgfpnqpq0GbN+8AA16pzy6v+Ay23e5shnO53IP8e7UcwQUE0fw1Wd4T+gBBF8PJiMugXDZiWlVYrV3tySgoFbmz+CuFzrYJbobUVj6E5khawPfo=" id="LPlnk660272" moz-do-not-send
 ="true">kernel/git/torvalds/linux.git
                    - Linux kernel source tree</a><br>
                </span></div>
              <div class="x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <span class="x_commit-subject" style="font-size:12pt;
                  margin:1.5em 0em 0.5em; padding:0em; color:rgb(0,0,0);
                  font-family:Calibri,Arial,Helvetica,sans-serif;
                  background-color:rgb(255,255,255)">mm: allow
                  !GFP_KERNEL allocations for kvmalloc</span><br>
              </div>
              <div class="x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <div><br>
                </div>
                <span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                  font-size:12pt; color:rgb(0,0,0);
                  background-color:rgba(0,0,0,0)">Best Regards,</span></div>
              <div class="x_elementToProof" style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <span style="font-family:Calibri,Arial,Helvetica,sans-serif;
                  font-size:12pt; color:rgb(0,0,0);
                  background-color:rgba(0,0,0,0)">Kevin</span><br>
                <div><br>
                </div>
              </div>
              <hr tabindex="-1" style="display:inline-block; width:98%">
              <div id="x_divRplyFwdMsg" dir="ltr"><font style="font-size:11pt" face="Calibri, sans-serif" color="#000000"><b>From:</b> Koenig, Christian
                  <a href="mailto:Christian.Koenig@amd.com" data-auth="NotApplicable" class="x_moz-txt-link-rfc2396E" moz-do-not-send="true">
                    &lt;Christian.Koenig@amd.com&gt;</a><br>
                  <b>Sent:</b> Wednesday, April 20, 2022 6:53 PM<br>
                  <b>To:</b> Wang, Yang(Kevin) <a href="mailto:KevinYang.Wang@amd.com" data-auth="NotApplicable" class="x_moz-txt-link-rfc2396E" moz-do-not-send="true">
                    &lt;KevinYang.Wang@amd.com&gt;</a>; <a href="mailto:dri-devel@lists.freedesktop.org" data-auth="NotApplicable" class="x_moz-txt-link-abbreviated
                    moz-txt-link-freetext" moz-do-not-send="true">
                    dri-devel@lists.freedesktop.org</a> <a href="mailto:dri-devel@lists.freedesktop.org" data-auth="NotApplicable" class="x_moz-txt-link-rfc2396E" moz-do-not-send="true">
                    &lt;dri-devel@lists.freedesktop.org&gt;</a>; <a href="mailto:amd-gfx@lists.freedesktop.org" data-auth="NotApplicable" class="x_moz-txt-link-abbreviated
                    moz-txt-link-freetext" moz-do-not-send="true">
                    amd-gfx@lists.freedesktop.org</a> <a href="mailto:amd-gfx@lists.freedesktop.org" data-auth="NotApplicable" class="x_moz-txt-link-rfc2396E" moz-do-not-send="true">
                    &lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
                  <b>Subject:</b> Re: [PATCH] drm/ttm: fix ttm tt init
                  fail when size exceeds kmalloc limit</font>
                <div>&nbsp;</div>
              </div>
              <div>Am 20.04.22 um 11:07 schrieb Wang, Yang(Kevin):<br>
                <blockquote type="cite">
                  <p style="margin-top: 0px; margin-bottom:
                    0px;margin-top:0px; margin-bottom:0px;
                    font-family:Arial; font-size:10pt; color:#0000FF;
                    margin:5pt" align="Left">
                    [AMD Official Use Only]<br>
                  </p>
                  <br>
                  <div>
                    <div style="font-family:Calibri,Arial,Helvetica,sans-serif;
                      font-size:12pt; color:rgb(0,0,0)">
                      <br>
                    </div>
                    <hr tabindex="-1" style="display:inline-block;
                      width:98%">
                    <div id="x_x_divRplyFwdMsg" dir="ltr"><font style="font-size:11pt" face="Calibri,
                        sans-serif" color="#000000"><b>From:</b> Koenig,
                        Christian
                        <a href="mailto:Christian.Koenig@amd.com" data-auth="NotApplicable" class="x_x_moz-txt-link-rfc2396E" moz-do-not-send="true">
                          &lt;Christian.Koenig@amd.com&gt;</a><br>
                        <b>Sent:</b> Wednesday, April 20, 2022 5:00 PM<br>
                        <b>To:</b> Wang, Yang(Kevin) <a href="mailto:KevinYang.Wang@amd.com" data-auth="NotApplicable" class="x_x_moz-txt-link-rfc2396E" moz-do-not-send="true">
                          &lt;KevinYang.Wang@amd.com&gt;</a>; <a href="mailto:dri-devel@lists.freedesktop.org" data-auth="NotApplicable" class="x_x_moz-txt-link-abbreviated
                          x_moz-txt-link-freetext moz-txt-link-freetext" moz-do-not-send="true">
                          dri-devel@lists.freedesktop.org</a> <a href="mailto:dri-devel@lists.freedesktop.org" data-auth="NotApplicable" class="x_x_moz-txt-link-rfc2396E" moz-do-not-send="true">
                          &lt;dri-devel@lists.freedesktop.org&gt;</a>; <a href="mailto:amd-gfx@lists.freedesktop.org" data-auth="NotApplicable" class="x_x_moz-txt-link-abbreviated
                          x_moz-txt-link-freetext moz-txt-link-freetext" moz-do-not-send="true">
                          amd-gfx@lists.freedesktop.org</a> <a href="mailto:amd-gfx@lists.freedesktop.org" data-auth="NotApplicable" class="x_x_moz-txt-link-rfc2396E" moz-do-not-send="true">
                          &lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
                        <b>Subject:</b> Re: [PATCH] drm/ttm: fix ttm tt
                        init fail when size exceeds kmalloc limit</font>
                      <div>&nbsp;</div>
                    </div>
                    <div class="x_x_BodyFragment"><font size="2"><span style="font-size:11pt">
                          <div class="x_x_PlainText x_x_elementToProof">Am
                            20.04.22 um 10:56 schrieb Yang Wang:<br>
                            &gt; if the __GFP_ZERO is set, the
                            kvmalloc() can't fallback to use vmalloc()<br>
                            <br>
                            Hui what? Why should kvmalloc() not be able
                            to fallback to vmalloc() <br>
                            when __GFP_ZERO is set?<br>
                            <br>
                            And even that is really the case then that
                            sounds like a bug in kvmalloc().</div>
                          <div class="x_x_PlainText x_x_elementToProof"><br>
                            Regards,<br>
                            Christian.</div>
                          <div class="x_x_PlainText x_x_elementToProof"><br>
                            <div class="x_x_PlainText" style="margin:0px;
                              background-color:rgb(255,255,255)">
                              [kevin]:</div>
                          </div>
                          <div class="x_x_PlainText x_x_elementToProof"><span class="x_x_PlainText" style="margin:0px;
                              background-color:rgb(255,255,255)">it is
                              really test case from libdrm amdgpu test,
                              which try to allocate a big BO which will
                              cause ttm tt init fail.</span><br>
                          </div>
                        </span></font></div>
                  </div>
                </blockquote>
                <br>
                <br>
                LOL! Guys, this test case is intended to fail!<br>
                <b><br>
                </b>The test consists of allocating a buffer so
                ridiculous large that it should never succeed and be
                rejected by the kernel driver.<br>
                <br>
                This patch here is a really clear NAK.<br>
                <br>
                Regards,<br>
                Christian.<br>
                <br>
                <blockquote type="cite">
                  <div>
                    <div class="x_x_BodyFragment"><font size="2"><span style="font-size:11pt">
                          <div class="x_x_PlainText x_x_elementToProof"><span class="x_x_PlainText" style="margin:0px;
                              background-color:rgb(255,255,255)">it may
                              be a kvmalloc() bug, and this patch can as
                              a workaround in<span style="background-color:rgb(255,255,255);
                                display:inline!important">&nbsp;ttm</span>&nbsp;before
                              this issue fix.</span></div>
                          <div class="x_x_PlainText x_x_elementToProof"><span class="x_x_PlainText" style="margin:0px;
                              background-color:rgb(255,255,255)"><br>
                            </span></div>
                          <div class="x_x_PlainText x_x_elementToProof"><span class="x_x_PlainText" style="margin:0px;
                              background-color:rgb(255,255,255)">void
                              *kvmalloc_node(size_t size, gfp_t flags,
                              int node)&nbsp;<br>
                            </span></div>
                          <div class="x_x_PlainText x_x_elementToProof"><span class="x_x_PlainText" style="margin:0px;
                              background-color:rgb(255,255,255)">{</span></div>
                          <div class="x_x_PlainText x_x_elementToProof"><span class="x_x_PlainText" style="margin:0px;
                              background-color:rgb(255,255,255)">...</span></div>
                          <div class="x_x_PlainText x_x_elementToProof"><span class="x_x_PlainText" style="margin:0px;
                              background-color:rgb(255,255,255)">&nbsp; &nbsp; &nbsp; &nbsp;
                              if ((flags &amp; GFP_KERNEL) !=
                              GFP_KERNEL)<br>
                            </span></div>
                          <div class="x_x_PlainText x_x_elementToProof"><span class="x_x_PlainText" style="margin:0px;
                              background-color:rgb(255,255,255)">&nbsp; &nbsp; &nbsp; &nbsp;
                              &nbsp; &nbsp; &nbsp; &nbsp; return kmalloc_node(size, flags,
                              node);<br>
                            </span></div>
                          <div class="x_x_PlainText x_x_elementToProof"><span class="x_x_PlainText" style="margin:0px;
                              background-color:rgb(255,255,255)">...</span></div>
                          <div class="x_x_PlainText x_x_elementToProof"><span class="x_x_PlainText" style="margin:0px;
                              background-color:rgb(255,255,255)">}</span></div>
                          <div class="x_x_PlainText x_x_elementToProof"><br>
                          </div>
                          <div class="x_x_PlainText x_x_elementToProof">Best
                            Regards,</div>
                          <div class="x_x_PlainText x_x_elementToProof">Kevin<br>
                            <br>
                            &gt; to allocate memory, when request size
                            is exceeds kmalloc limit, it will<br>
                            &gt; cause allocate memory fail.<br>
                            &gt;<br>
                            &gt; e.g: when ttm want to create a BO with
                            1TB size, it maybe fail.<br>
                            &gt;<br>
                            &gt; Signed-off-by: Yang Wang <a href="mailto:KevinYang.Wang@amd.com" data-auth="NotApplicable" class="x_x_moz-txt-link-rfc2396E" moz-do-not-send="true">
                              &lt;KevinYang.Wang@amd.com&gt;</a><br>
                            &gt; ---<br>
                            &gt;&nbsp;&nbsp; drivers/gpu/drm/ttm/ttm_tt.c | 14
                            +++++++++++---<br>
                            &gt;&nbsp;&nbsp; 1 file changed, 11 insertions(+), 3
                            deletions(-)<br>
                            &gt;<br>
                            &gt; diff --git
                            a/drivers/gpu/drm/ttm/ttm_tt.c
                            b/drivers/gpu/drm/ttm/ttm_tt.c<br>
                            &gt; index 79c870a3bef8..9f2f3e576b8d 100644<br>
                            &gt; --- a/drivers/gpu/drm/ttm/ttm_tt.c<br>
                            &gt; +++ b/drivers/gpu/drm/ttm/ttm_tt.c<br>
                            &gt; @@ -97,9 +97,12 @@ int
                            ttm_tt_create(struct ttm_buffer_object *bo,
                            bool zero_alloc)<br>
                            &gt;&nbsp;&nbsp; static int
                            ttm_tt_alloc_page_directory(struct ttm_tt
                            *ttm)<br>
                            &gt;&nbsp;&nbsp; {<br>
                            &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;pages =
                            kvmalloc_array(ttm-&gt;num_pages,
                            sizeof(void*),<br>
                            &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GFP_KERNEL |
                            __GFP_ZERO);<br>
                            &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            GFP_KERNEL);<br>
                            &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ttm-&gt;pages)<br>
                            &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
                            &gt; +<br>
                            &gt; +&nbsp;&nbsp;&nbsp;&nbsp; memset(ttm-&gt;pages, 0,
                            ttm-&gt;num_pages * sizeof(void *));<br>
                            &gt; +<br>
                            &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
                            &gt;&nbsp;&nbsp; }<br>
                            &gt;&nbsp;&nbsp; <br>
                            &gt; @@ -108,10 +111,12 @@ static int
                            ttm_dma_tt_alloc_page_directory(struct
                            ttm_tt *ttm)<br>
                            &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;pages =
                            kvmalloc_array(ttm-&gt;num_pages,<br>
                            &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            sizeof(*ttm-&gt;pages) +<br>
                            &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            sizeof(*ttm-&gt;dma_address),<br>
                            &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            GFP_KERNEL | __GFP_ZERO);<br>
                            &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            GFP_KERNEL);<br>
                            &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ttm-&gt;pages)<br>
                            &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
                            &gt;&nbsp;&nbsp; <br>
                            &gt; +&nbsp;&nbsp;&nbsp;&nbsp; memset(ttm-&gt;pages, 0,
                            ttm-&gt;num_pages * (sizeof(*ttm-&gt;pages)
                            + sizeof(*ttm-&gt;dma_address)));<br>
                            &gt; +<br>
                            &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;dma_address = (void
                            *)(ttm-&gt;pages + ttm-&gt;num_pages);<br>
                            &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
                            &gt;&nbsp;&nbsp; }<br>
                            &gt; @@ -120,9 +125,12 @@ static int
                            ttm_sg_tt_alloc_page_directory(struct ttm_tt
                            *ttm)<br>
                            &gt;&nbsp;&nbsp; {<br>
                            &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;dma_address =
                            kvmalloc_array(ttm-&gt;num_pages,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            sizeof(*ttm-&gt;dma_address),<br>
                            &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            GFP_KERNEL | __GFP_ZERO);<br>
                            &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            GFP_KERNEL);<br>
                            &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ttm-&gt;dma_address)<br>
                            &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
                            &gt; +<br>
                            &gt; +&nbsp;&nbsp;&nbsp;&nbsp; memset(ttm-&gt;dma_address, 0,
                            ttm-&gt;num_pages *
                            sizeof(*ttm-&gt;dma_address));<br>
                            &gt; +<br>
                            &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
                            &gt;&nbsp;&nbsp; }<br>
                            &gt;&nbsp;&nbsp; <br>
                            <br>
                          </div>
                        </span></font></div>
                  </div>
                </blockquote>
                <br>
              </div>
            </div>
          </blockquote>
          <br>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------2R6jqFgzNJ0RbutqKPIW5VOm--
