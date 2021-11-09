Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF7444AF1F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 14:59:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5966E7D7;
	Tue,  9 Nov 2021 13:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6242B6E511;
 Tue,  9 Nov 2021 13:59:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFszfeat8uK59pKSkFJZVNFSHjWMBNE0KuAbMkfJf4J7IxUP82zxO38YnoM2DSb8IVyhd8zglqTsPVTgBQCoUw4uKt9Lj+WSfhvg9Xo+0TUqraERbKjdgRNuA/exMOHVRpMyTbDBVGcyXwlWFmNvE4HHUuQdW1ZW/dknaUtX3x+gKg3lgLGFI1utc3WnYbdOZSrdAUM64MiuzegQQQ3tj28P8Bjn8YepXX2dHB7yL6fHbq4pPx0qGYP3+WyVMh8zcV87OsGp/w0OS5S6CBo3HiPKiCNWmOZkbCF15kAZz+7XiwR2RBY2acNUepYDp8dVLrCXWJa359U7KxPkcrSI8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ri2CaKGe7niWypQJIoO8VHMhWhtLrC9Hy8voiUrIgw4=;
 b=SBrbSVWZKiYt1dQmlrFkNit+wAR540AfDMrf/D+/iCHsOP8LEnmaJn31dUsPRT/6MpuqxMSEynV5sPF30+EKcQmWZPU4EfGTflo4ky8ofCP8xHE/WaK4EMMuq+zGGmRSMw8HogsmqZQjUyutxDjwOUjZFCzFyhrwvZ6rTqvJeLO1EQUqBYSj5/2q8o5vgWACxk7SzziRMZT4KfY0ckSoktFsZQKkZX9n5ia+nh3ikG9mSbEN41cQK0SytGDp5LDzxvWoy+3+5B+NM0ZojuwgoO6YztdAvhxyE3Ltkn8qguVavYSovek2srLAV2+yD8FjXzYd0xIw0zAuFW5yrm1Qgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ri2CaKGe7niWypQJIoO8VHMhWhtLrC9Hy8voiUrIgw4=;
 b=Aw5i8B9MdEK7mTjlMk5MnOkYrCJJXO8NUo9iK+Koaqo9UEMjoQ98Rv2N2YICuzPyJQg8e2ufyArUc2BKuNspvcmigmXMJe9GcC0ocvA1w7Y2UIjRxdBSmMPElHma4psQS7nsL2NJqdHprVeFAkinf+DwEAmFqQ7HNQv7K0Zy79Q=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1344.namprd12.prod.outlook.com
 (2603:10b6:300:9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 13:59:20 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 13:59:20 +0000
Subject: =?UTF-8?B?UmU6IOWbnuWkjTog5Zue5aSNOiDlm57lpI06IFtQQVRDSF0gZHJtL3R0?=
 =?UTF-8?Q?m=3a_Put_BO_in_its_memory_manager=27s_lru_list?=
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20211109111954.41968-1-xinhui.pan@amd.com>
 <da46c607-1a3c-7ea9-92ef-78a2b60d38c9@amd.com>
 <DM4PR12MB51653AB0F1A0B89A41782B1087929@DM4PR12MB5165.namprd12.prod.outlook.com>
 <76d78ff7-efe4-4796-ec18-a668757f2e04@amd.com>
 <DM4PR12MB51657C53FAA6C096884118AD87929@DM4PR12MB5165.namprd12.prod.outlook.com>
 <DM4PR12MB51658A8C75586BCC2B0BDA6487929@DM4PR12MB5165.namprd12.prod.outlook.com>
 <5b2e8116-7bff-604c-5b9a-e37e29d66dd0@amd.com>
 <DM4PR12MB51658C237B36EE47DDC68F9D87929@DM4PR12MB5165.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <282e5be4-07c7-c1e7-049b-6af1eb7a2fd3@amd.com>
Date: Tue, 9 Nov 2021 14:59:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <DM4PR12MB51658C237B36EE47DDC68F9D87929@DM4PR12MB5165.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6P192CA0041.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::18) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (79.194.4.163) by
 AM6P192CA0041.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Tue, 9 Nov 2021 13:59:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3558ba17-0368-4630-2d16-08d9a389203e
X-MS-TrafficTypeDiagnostic: MWHPR12MB1344:
X-Microsoft-Antispam-PRVS: <MWHPR12MB13449FFCD02F9AFC9259927783929@MWHPR12MB1344.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tlg63OXG+MsomAKk7sTNv8dArHbS84Ps8RaaYt5Ybmnf+XN6mTqmgtWHFVxP/Z/I5D7QY7B0tdgkDI67nBmSCYo+0KqnHxl+2+2P61PjjfjFzl9QrJbZ6wob3pclLwpdg2BVoPeQIBkgcFPT8ri7Kroz/8ZVWEJcJkuhFRM9Nr/EFtQbqx66wLONsyyXQlBZGgNJOzYFzlF2Ol3Wzt2W9SHxyS8iIPLAPIBbENicJ6tTUjZSM5ZRcVccU1DANHs6pSijCzL+kleWOwnE4e79hsvlP1Vn0X7nCxE+NAC/oixqNvUKJ+xf/SKwRBcnpdB15OVIV5h8GmQdWATJ23Uk3f3E1unK49OaoWlKqHHaFMjHkrQCsWsjHB+4VF9T+C/Q5wkhTZxvCCkOaEtEQsmHc+d8wnqVzwNOludgd68iJ8kNmOgMgmthZ+GHqjM8sosG4C5WQc5gp47WXsU6VEDCJI798QhgEm+eB5xmMGOegjyWMgQ5G1W5oztmlMjSl0Z7470YpN5wwn03p33phPv4VdJQ3svwMY+2H739VQSAI92u8Q3sgwqXP7wkrpdii9pSspW4LsfA4hHKnr4/9BZHyVtxSL+XRi5AxFz1Y3W36JBGjfGU3sOlLPMaVTcHvs4oAjfjN89BHBl3a9+9rVECgBumO1xyUL1nrJQ/TvRcqwBhWQ+YN5NLtKf41lyBWuJfa1Yi+vPs0WHaSsdjZIaWzfwDQGVX9cC/yuDF9y2GkFgR82nvBzqGiXhTuI4o4urX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(31686004)(26005)(66574015)(110136005)(5660300002)(450100002)(6486002)(2906002)(16576012)(186003)(6666004)(508600001)(86362001)(2616005)(224303003)(83380400001)(31696002)(66556008)(956004)(66476007)(36756003)(4326008)(66946007)(8936002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmRmZ0JyWUN4RUppN0M4MDUzc29oUXRRbkZFUDVyRU1CVVNmOUxvK0ZBRUE5?=
 =?utf-8?B?SlhqenhHZjRCaEJEWFh2T2lJeC9EeittdjZYeXJXU3VFUzVwZ3pSeUtaRmJY?=
 =?utf-8?B?ajJzSzZidGhJRUxUYTkwODM1cGk3TmorQlR1dUVjSitTeEtqeDhhUnBKeFFV?=
 =?utf-8?B?MlJhT1pkQ2JJTC9qU3haOGpYQ3hkQ1JzbDFaZWN3SVhIQUlyRkN2L2dEN3dZ?=
 =?utf-8?B?S25yNG80Z01lN0t1VXR1Y2dLQ09mNmtSdFM4OW5lZkd0N1p3ZzNDVEVCQUZp?=
 =?utf-8?B?cFRETzBxbmx4a2dITTREYnJnTDlxNnpmSlFPRE9Qa3ZnRUZxOUtxSmlBbVlP?=
 =?utf-8?B?U3ZFRFhWcC9aQ2d2WDNybzNhd3R3V1lxV1pGV0IwN1VTdkZHOTZIbWRJT3c5?=
 =?utf-8?B?V2RqdEhuY09vMHRHbTZsYlRGYnhoK0lTSnNaVE01VWRQU0dHbTBnZGlOMmY2?=
 =?utf-8?B?VmlQaFUwUnAybzVXenFHRm5JMnJQVFFBSWxkNWlEa1JxTitiak0vY1IydmFj?=
 =?utf-8?B?emd0ZERSeUtKOG5GNUJJNTg4Q2g3alpOOXpvbE8vTFN2K3JzZlVzSFRmL3pl?=
 =?utf-8?B?bGRSYlBMMzFmWFowRE9obDVwR2cyWUFPL01DL3g0SG50a2pnTGRVNk1vNXFZ?=
 =?utf-8?B?VXNDQ3JJTC9MK0hQRnhrUWpwckFZV0hncHFMTzlIdVZERklaaHQ5akR4MHZJ?=
 =?utf-8?B?WFM1SlRyQzlEay9UM3YwUUUwc3JJSGRna0RxUXlnSWR0MGZyRHVScGJYM2lR?=
 =?utf-8?B?K2dxdWRGMTdnbi9GWlNWQmdoODY2emRIby80bTV6K3llbnBJWVBRVVRHdTlD?=
 =?utf-8?B?TkFRMi9heWJ1YjB5Z3E3YXNxVjBSSmZ4YUg5enZ4My91bmRpMDZRYWYxWm1u?=
 =?utf-8?B?N1V1SHp1MWlvR2F6RlZMUlNGYVFUSzdqZTJJNUxjS216czhmZDUzbk5BbU5J?=
 =?utf-8?B?WFVnaVgvcmRKMjE2R3A1cTZYK0FNeFRkSWRzRjVrak1BSmRqZlkvMzdCOWJt?=
 =?utf-8?B?OEFYblY2cVA1aWZqZXgyVnNpYnQ1RU44TWlMcjdRSGRTcWVlM2NBcU5QMlNB?=
 =?utf-8?B?RE9sbmltcjVCRzlhNFQrZnFocm5YanZnc21KUFliUFVXZTZzT2tka1E2bVd5?=
 =?utf-8?B?eldBaVhmYVR0RCtJN3kreExVUkxTVVJQV0trenQyUmRJTkVVdGlWMCtTTEhl?=
 =?utf-8?B?NitLKzAzTWlYanBDRDVmOExybm4wVHFsR2tDWitxNHpGOUdZT1BzN3h0V2NV?=
 =?utf-8?B?bVB2Wld4V0RSZ21jclRQLy96SjQ1aksrOE5LZk15b01XVm1hRVJNWVRHclFY?=
 =?utf-8?B?OHV4ZmtJemFGRE1teHk1TXM5M2lubWdmWnFzbkJVbVIyb3paQUh4NzJJYktr?=
 =?utf-8?B?R3Y1OW9rZkxnOFJ0cUs4TXFWeElpSHZQYTNmNVhFc3NuT0xXekwzOGpGSTBl?=
 =?utf-8?B?cGEyeEROV0JpSWhsRVhGaXZXS2hwc0lUaENIbFNmbHM5LzBCeWptVUFSRWcy?=
 =?utf-8?B?a2hJUzRwL25taEJnYTdWU05PMmx0OHRMTDhhQ1ZzUVprL3hGSDFOU2NqY1E4?=
 =?utf-8?B?bitFSzhUZVMvQVBpYVc4d041TGJCT1hIajlnYjhGWlNQaVV4MXZ5cHFMZE1u?=
 =?utf-8?B?RDBXaW5PVVBqdm5IaVlXSjFWbXpNRDV6RFJUWWU2RmlKMmQwVUJZRVhNa1Ni?=
 =?utf-8?B?bVdDSHhtcjZSOEhmNXdQK2lGSk5FampnUnF5WVBmMVJHZlJSM201MGVxL1lC?=
 =?utf-8?B?aGJ2Nzhnd2tSVXZzV1JxUWVRS1pVWWE3VEFEY1ZMMU5qMmFjRTd3VE1VK0hO?=
 =?utf-8?B?cS8zeXFtRkd0MmE1aWM2S2JWc0hYS1RBQ0puTW81T3F5THVQTktWbDFSem90?=
 =?utf-8?B?K3JpNS9mMTdmbW1XekJVcEpUVUhubjBsWTFYdnp2SW9SeGVhVGg2SVVhZjNs?=
 =?utf-8?B?ZDFGd1Y2RFVIWFl5ZFZiM2RVeE0vQ1pWdE5VUElYUXZYY1NHRmlmVkhaSWpo?=
 =?utf-8?B?aVhnMzZ5Rm5VN0xpWHFiMU5yNU5NMjBkRWtkUUY5QVNnMXFEK21ZWUZvWG4v?=
 =?utf-8?B?Rk83SDB0WTJMdTROajB6dDV5UHM2NW9zTFY5bFBoMkVRS0daR3NCY1BaWVVo?=
 =?utf-8?Q?wpqI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3558ba17-0368-4630-2d16-08d9a389203e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 13:59:19.8637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 375t3/8jf2rk2gZaBkGZkTGONRRVHp8KRCAvcujWokfFBUJT4DET7uDJNU9g9xgE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1344
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

In general the correct idea, but the wrong place to check that.

Calling amdgpu_ttm_bo_eviction_valuable() is only optional, but that 
check must be mandatory for correct operation.

This needs to be inside ttm_bo_evict_swapout_allowable().

Christian.

Am 09.11.21 um 14:41 schrieb Pan, Xinhui:
> [AMD Official Use Only]
>
> yes, a double check is needed.
> how about change below.
>
> As long as we detect such mismatch, it indicates another eviction is on going. return false here is reasonable.
>
> @@ -1335,6 +1336,8 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>          struct dma_fence *f;
>          int i;
>
> +       if (bo->resource->mem_type != place->mem_type)
> +               return false;
>          /* Swapout? */
>          if (bo->resource->mem_type == TTM_PL_SYSTEM)
>                  return true;
>
> ________________________________________
> 发件人: Koenig, Christian <Christian.Koenig@amd.com>
> 发送时间: 2021年11月9日 21:18
> 收件人: Pan, Xinhui; amd-gfx@lists.freedesktop.org
> 抄送: dri-devel@lists.freedesktop.org
> 主题: Re: 回复: 回复: [PATCH] drm/ttm: Put BO in its memory manager's lru list
>
> Exactly that's the reason why we should have the double check in TTM
> I've mentioned in the other mail.
>
> Christian.
>
> Am 09.11.21 um 14:16 schrieb Pan, Xinhui:
>> [AMD Official Use Only]
>>
>> Actually this patch does not totally fix the mismatch of lru list with mem_type as mem_type is changed in ->move() and lru list is changed after that.
>>
>> During this small period, another eviction could still happed and evict this mismatched BO from sMam(say, its lru list is on vram domain) to sMem.
>> ________________________________________
>> 发件人: Pan, Xinhui <Xinhui.Pan@amd.com>
>> 发送时间: 2021年11月9日 21:05
>> 收件人: Koenig, Christian; amd-gfx@lists.freedesktop.org
>> 抄送: dri-devel@lists.freedesktop.org
>> 主题: 回复: 回复: [PATCH] drm/ttm: Put BO in its memory manager's lru list
>>
>> Yes, a stable tag is needed. vulkan guys say 5.14 hit this issue too.
>>
>> I think that amdgpu_bo_move() does support copy from sysMem to sysMem correctly.
>> maybe something below is needed.
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index c83ef42ca702..aa63ae7ddf1e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -485,7 +485,8 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
>>           }
>>           if (old_mem->mem_type == TTM_PL_SYSTEM &&
>>               (new_mem->mem_type == TTM_PL_TT ||
>> -            new_mem->mem_type == AMDGPU_PL_PREEMPT)) {
>> +            new_mem->mem_type == AMDGPU_PL_PREEMPT ||
>> +            new_mem->mem_type == TTM_PL_SYSTEM)) {
>>                   ttm_bo_move_null(bo, new_mem);
>>                   goto out;
>>           }
>>
>> otherwise, amdgpu_move_blit() is called to do the system memory copy which use a wrong address.
>>    206         /* Map only what can't be accessed directly */
>>    207         if (!tmz && mem->start != AMDGPU_BO_INVALID_OFFSET) {
>>    208                 *addr = amdgpu_ttm_domain_start(adev, mem->mem_type) +
>>    209                         mm_cur->start;
>>    210                 return 0;
>>    211         }
>>
>> line 208, *addr is zero. So when amdgpu_copy_buffer submit job with such addr, page fault happens.
>>
>>
>> ________________________________________
>> 发件人: Koenig, Christian <Christian.Koenig@amd.com>
>> 发送时间: 2021年11月9日 20:35
>> 收件人: Pan, Xinhui; amd-gfx@lists.freedesktop.org
>> 抄送: dri-devel@lists.freedesktop.org
>> 主题: Re: 回复: [PATCH] drm/ttm: Put BO in its memory manager's lru list
>>
>> Mhm, I'm not sure what the rational behind that is.
>>
>> Not moving the BO would make things less efficient, but should never
>> cause a crash.
>>
>> Maybe we should add a CC: stable tag and push it to -fixes instead?
>>
>> Christian.
>>
>> Am 09.11.21 um 13:28 schrieb Pan, Xinhui:
>>> [AMD Official Use Only]
>>>
>>> I hit vulkan cts test hang with navi23.
>>>
>>> dmesg says gmc page fault with address 0x0, 0x1000, 0x2000....
>>> And some debug log also says amdgu copy one BO from system Domain to system Domain which is really weird.
>>> ________________________________________
>>> 发件人: Koenig, Christian <Christian.Koenig@amd.com>
>>> 发送时间: 2021年11月9日 20:20
>>> 收件人: Pan, Xinhui; amd-gfx@lists.freedesktop.org
>>> 抄送: dri-devel@lists.freedesktop.org
>>> 主题: Re: [PATCH] drm/ttm: Put BO in its memory manager's lru list
>>>
>>> Am 09.11.21 um 12:19 schrieb xinhui pan:
>>>> After we move BO to a new memory region, we should put it to
>>>> the new memory manager's lru list regardless we unlock the resv or not.
>>>>
>>>> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
>>> Interesting find, did you trigger that somehow or did you just stumbled
>>> over it by reading the code?
>>>
>>> Patch is Reviewed-by: Christian König <christian.koenig@amd.com>, I will
>>> pick that up for drm-misc-next.
>>>
>>> Thanks,
>>> Christian.
>>>
>>>> ---
>>>>      drivers/gpu/drm/ttm/ttm_bo.c | 2 ++
>>>>      1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> index f1367107925b..e307004f0b28 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> @@ -701,6 +701,8 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>>>>          ret = ttm_bo_evict(bo, ctx);
>>>>          if (locked)
>>>>                  ttm_bo_unreserve(bo);
>>>> +     else
>>>> +             ttm_bo_move_to_lru_tail_unlocked(bo);
>>>>
>>>>          ttm_bo_put(bo);
>>>>          return ret;

