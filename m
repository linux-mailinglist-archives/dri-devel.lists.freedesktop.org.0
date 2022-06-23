Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D620557E32
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 16:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16A810E7A0;
	Thu, 23 Jun 2022 14:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A8E10E75C;
 Thu, 23 Jun 2022 14:51:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2Gjm9shn1ZDahglYUUWPeyerQgmhktRsA1KX2Nlnsna+sTmMF7dVmB8owfh00hcMoyaQqeoxTK6Pc5RY+RhKBmUfRlvaxDvpiCEoiZ6cEk5xF5hUbqygh6GROvC9DAScI8ThMdHBhumg5tVC+dQ1AUawdpYmW2zpIDZMmhrFSBM599zmzKShRHGxPHhNVT8vXPq6ZUIq26xQNNVDK7bi/2kV/k27ZTy4XX70cDn4e3Pr7Eu5eszBMeUQLjb/348P4rM5aP+V9Vi8TJFUVQDSWNnNBkjMVMVbgT5YyTu0KBKorHJ6WurRLxnkia8cYDJRAfYVZSUOLzHQ8/71E5Ydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8x9cEhBV6RhceuGAPwCgb0cvmC6J6IG64WfAVm3O4Ys=;
 b=hW0j5rEoEGFSB3+qhfJMBONVXJA2lsFLTX0U2uqMpN3foC/PA+h6UXrGOPFgpdNN5fLuqnjLoM6aUt9r97XWALF1z8WufGeIgiJs/vnGZWTZPQ7HpDFeSinfG21ulfVN1qXE3PIEFrOH0KXzam2UwsQYPUlM4gl+8JdusWpVex/mWk+VdgFTHwxj2Brzm0ixX/SCpWtLV0MRG1GBHq9co37drCwxtarWDy1Roz37lrXeTcjZccHqAYrIBUHFoeSk9ci+qZ1LVURoV7XW9rhCkBSdUs4WpYtbu5S13JqZPoEbB0PoYn0dPrv4AXMHWZM4fwGzCUZR0bAPQ0ueh6P+wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8x9cEhBV6RhceuGAPwCgb0cvmC6J6IG64WfAVm3O4Ys=;
 b=C40pSfEMrV8zGDifrUL8YgXpyE9+qYBvtBfOUfNlbo02ojZ5W29PGUJVWZf28QxJts9B60zwnIUlw61ZQbZS6goGLnU3q16xNCNx9FbsqhfheBKaZRR/9B4WYWbvlTL3Us68aM7CBu86rWw5SlaPelffmf8ldqum31E8JGQahK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by MN2PR12MB3440.namprd12.prod.outlook.com (2603:10b6:208:d0::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Thu, 23 Jun
 2022 14:51:32 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91%9]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 14:51:32 +0000
Message-ID: <e911dec4-0b53-ab01-1507-a75c25fd9648@amd.com>
Date: Thu, 23 Jun 2022 10:51:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5/5] drm/amdgpu: Follow up change to previous drm
 scheduler change.
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
 <20220620220302.86389-6-andrey.grodzovsky@amd.com>
 <87fa2e6e-b519-11ef-65f4-7ab5ca091973@gmail.com>
 <2f22b90f-74ca-f70d-68ed-4dbf49360e2b@amd.com>
 <b011246b-fe55-0385-a64b-585c0baa2863@amd.com>
 <76e95c1d-83a0-2cd4-518b-7b769e963d13@amd.com>
 <29ca5b47-76e6-0850-1062-0b3a4f513303@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <29ca5b47-76e6-0850-1062-0b3a4f513303@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0133.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::10) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6984b40e-f56c-4a5e-229f-08da5527dc74
X-MS-TrafficTypeDiagnostic: MN2PR12MB3440:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB34405C4638D2FBCB60D3365EEAB59@MN2PR12MB3440.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2OGPuAwbZyFOVc91qBo1c57An/NmvPP8wAe4t8jTnO5jS07wRFV1pdmEnPh/tG5Rnq0T+g2ORIPc0z4MIhpmB/e8n/gDNWMJbZ0KQyPk+rVsFiFiCxrNmFgwMeKAPQ7+GaHviF52hxNDnc8nxAaHeA/I0xiwZiCG3zAWOgkDbG8IjjDJuDdEFKYiEB03oSVM0JzcBwQe9XjXn5HTUGZx1x1qpYNqv1RNHE4f30bZVelxJxk6okBbsqdFlDvD3KeyWLdWK0NMmNeSELgfaO+ipWstu3MCmkV/14rddv0LLjShk68M/Hvj7NhE9P6iuSytCnp5JY3kFZqWIXCCGPdMSQ0kjD+PpRIVixGajZlIXFEIebaalYhS1wfgTc3e9u+TZF9PHf7WObKs+77rnMJGjt6xpGS5UmXBitMjYQ8rfRszWxlQyjNQ2vzCni7gMSVAgAOTCyJEhtIdtZ33LUISgTv7Z9CoNa1TR7hvJmtiMMJSS0GuMyWdt69ALsh0ZFRxPZN6QMB2e6f7ldiYmLJaBVHa5x7WfcqLnDooAvBfLPWgdUlFH76tBJSlTWjnqZa00InTXHIuGw0whPFEvzBmUl/wdC6506W82JMAwL5elzChJWjhKOfZezz0vnlqUJOLsR/SCjz4ifEK0IRlDeb2zbKbvsnijs+k5UXRqRXBW6I/410N6+eJ0f+7U5K5Ft6KIVGG41j+18J61keVAG0mFisx5yGW6nqdvH4TKmHWULVYorJgEZGYmQ1E17MW9VAGMgOGkiKgniJeqgPaegVYC4VzSpO9xpWUZRT/tOe++QU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(39860400002)(396003)(346002)(136003)(6486002)(83380400001)(478600001)(8676002)(2906002)(31686004)(110136005)(38100700002)(8936002)(316002)(44832011)(66946007)(66556008)(4326008)(53546011)(6506007)(66476007)(5660300002)(31696002)(41300700001)(6512007)(66574015)(36756003)(86362001)(6666004)(2616005)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2RSaXM0Nm9laUxid3dWV3o3UUJJRmNKeUZxSWxTUUd1OVA4cnJpSkUvQUNn?=
 =?utf-8?B?RjdmbnhJdTIzVDlET3dhM3RyZ08wdzZaV0psN0lzaWFwSTNFV3I1M1dvYzVp?=
 =?utf-8?B?UmYvNHY0V2VSVDlrRGczRzI2d2JVVThVNjNLa3c2NTdoazZCeUlLT0E2dC9j?=
 =?utf-8?B?QnpnZ0x6aWdsMUFnODd3TGdxMEtLd1MxQTlCc1dTU3lCdEcwUThLTnRvakJ1?=
 =?utf-8?B?M29FOXkwZXh5M1VpUm1YRFY5elF1UkpWUlQxZzFwcG03anArUmtMQTh1bGxw?=
 =?utf-8?B?eTQ4blFqTlBldklxZmpXbHJYd3JBVXhaVDVLZ0FQZEJqMjJ1WWJsS05kbmdS?=
 =?utf-8?B?b3I5dDdMM3lJQnphc1FiZmVDTnNiV2hVZEpxUzk2akVodjhNbEhjTis5bWNG?=
 =?utf-8?B?cGtIbWQ4S1diNmJMZXdvKzFFek5nVjdYSnFDVFRFK3lTcGppY0Jjc3pLYkpj?=
 =?utf-8?B?c3RWdWltREQ1RXdPUmNFOVNpUzdSQVFwZ0hSWXRMc2s1QU9sRllVNGdBc29K?=
 =?utf-8?B?Y2p0T1QyRkM0REZiZmlMTnYyRUluY1RxVjFHdGJIRUc2N3RPY1F6SUVNbnIw?=
 =?utf-8?B?TGVvTWhid05BeS9iZ2VKTjdmc3Q2Tk16VExwMFh6MURrbDZrREc4NmZKV09F?=
 =?utf-8?B?NnU0UkRaeUdNYWh2VDVoSEFaSjhkemFNdFZuM3Mrc3JNQ1FiaDVPdGRXekJ2?=
 =?utf-8?B?c3gyUTV3WmlhaS9tY1lQeUs4dWswZmpNd0FkTHhZenNWMDlaRG1xNEpwKzBS?=
 =?utf-8?B?UjJ5eVdmVFB5NkdQa0tTUzkzZGZvZFFzQ2RLVVIyd2NHQWJFK3FZcFFySHdz?=
 =?utf-8?B?QTREM0RuWUNwT2k0RjJ1UHlJeTQrc2JIVVpGbGw3b3pJRXFMVFNxRVc1aFZj?=
 =?utf-8?B?L3k1RDNDeGxOS1pmdUZ2REpaNGdyMlYwWHlqM0F3Q1pEaGRLdHdXRmRJZUp6?=
 =?utf-8?B?WlgzT1B6YnJKRVhLV2tsck0xRWZ2V3JsNHN0UDJhbjBYZ1NZcFUwbGtUMFB0?=
 =?utf-8?B?SXRyQi9LLzV2Wm5lOUVhNkkyeU0xUmVQVjRMMjVKakRSUmMvT2JWQU1reWJq?=
 =?utf-8?B?R3ZqN09sZUhHSnQ2a0xuUVgvb29uNElDS1R3NjhWcTc4ZFEybk8xVFJjN2Vl?=
 =?utf-8?B?czZLKzN6UkhVaDZYdHF2QXdsYmk4UVFYRHcrSUozUnRwc2xBd0swaDJJU0V5?=
 =?utf-8?B?S3pTNWE0ajljUVpkOVNna1BWajZsWE92cFFkRzhNU2R3alM3WGVQT0dtQXhF?=
 =?utf-8?B?emwvZ3Y1S2xmNDJJSTJzSzV2M2dZbFNURVVOVExwYmVTOGJyVGlSc3BiSkhm?=
 =?utf-8?B?TWlubzhxVDQ0bmxjRGdLcktiVnhzTDhvQjRmYnhKQWR3MDlPaW9kMDdUMlhO?=
 =?utf-8?B?WjhLdzJBQkY5c3YyTkNqVkk4QytlaDZ2QVVoMjU5bEl1VGVFOS9PRW9LdVVj?=
 =?utf-8?B?UkpEekdmd2ZzODNqaDJkNS9YZXZFdGV6WUUzVFlDaHM0d1JFNC9UZkcyZWho?=
 =?utf-8?B?Y2Y1d2VYSjQ4UEp1aXQreWl2WnNiM3drNTN4d0taMFIvYjU4azFsaXI0M0Ny?=
 =?utf-8?B?NnJ0NUZxWCt0Nm1hVlo2eU9lNWN2SXA2aUY5MEN1WUNYUFJCcFp1YnR0SWFO?=
 =?utf-8?B?Q2x2bHd2NDNVa2NtRHloODg3Mjh3QmRGcHpIRmlaNUFTYTB4NkFuMmxQNTM3?=
 =?utf-8?B?amVrdnZ2MFk4RjBDTnFFYWNzU1RlVERwb3hYTWU4dEh4ZVVPS09FUGxRL1RS?=
 =?utf-8?B?cWx4SW9iQksrY1ZMR2JXcHozRnpYRkx6V1NSUWJIQ09qVEEzbDRIaTVKZytF?=
 =?utf-8?B?OHRzQ3JPY0RISnlGTk1ZUGRIOUs0TlhxcURjZEIzYTQ3UzhJb1E1Y1M5NDFr?=
 =?utf-8?B?eVZyRGhqMzFxYk5VY24weGlXMnVLNlpGSVdTMjlkQ2xyNlFGZENwWTNFeHBa?=
 =?utf-8?B?alF6YjA4cnJOZUZYTURyYy9BMmR4QzZEenNRdlVUVzJSQUdOeVVUVVZMV0hE?=
 =?utf-8?B?emFadno0RjZjL1htYWtVSFIrMVMwSkpYYWhTU3o0Q2N5ZHh1UXNxU3QvQW9R?=
 =?utf-8?B?NWV6MDgzdnhVWjllOUtkTzFVQmc1V0ZCSEIwLzRjWGtVRjAvd3ZiRkU4TFFX?=
 =?utf-8?B?bkUwMGJJSHRBRGVMcEJIOEgvSmdOWnh6K2NVMXVaTE9UMngvdFZPeUl0bGhD?=
 =?utf-8?Q?HkWXMCLkE+V/VlLtFNnIpA0arMwnxepYk0DlsKZr/Y9r?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6984b40e-f56c-4a5e-229f-08da5527dc74
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 14:51:32.2030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6YlnhLjWrM5yvlf4T/M6Z/XiSCQxjYnZdlpyTrgsIbBqLoXKUirZpwaZ60lto+FEr83/GbM7KYQYLxNaGkYgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3440
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
Cc: jingwen.chen2@amd.com, monk.liu@amd.com, yiqing.yao@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-06-23 01:52, Christian König wrote:
> Am 22.06.22 um 19:19 schrieb Andrey Grodzovsky:
>>
>> On 2022-06-22 03:17, Christian König wrote:
>>> Am 21.06.22 um 22:00 schrieb Andrey Grodzovsky:
>>>>
>>>> On 2022-06-21 03:28, Christian König wrote:
>>>>> Am 21.06.22 um 00:03 schrieb Andrey Grodzovsky:
>>>>>> Align refcount behaviour for amdgpu_job embedded HW fence with
>>>>>> classic pointer style HW fences by increasing refcount each
>>>>>> time emit is called so amdgpu code doesn't need to make workarounds
>>>>>> using amdgpu_job.job_run_counter to keep the HW fence refcount 
>>>>>> balanced.
>>>>>
>>>>> Could we now also remove job_run_counter?
>>>>>
>>>>> Christian.
>>>>
>>>>
>>>> I am afraid not, job counter is needed since at all times the 
>>>> refcount on the
>>>> embedded fence cannot drop to zero because this will free the job 
>>>> itself before
>>>> the end of it's life cycle. We have to be able to differentiate in 
>>>> amdgpu_fence_emit
>>>> between first ever call where we init the embedded fence's refcount 
>>>> from scratch using kref_init
>>>> to repeating calls when refcount already > 0 and we just fake 
>>>> increase the refcount to align
>>>> behavior with pointer style fences in other drivers.
>>>
>>> Well what we should probably rather do is move the init out of emit 
>>> instead.
>>>
>>> The only down side I can see is that the sequence number isn't know 
>>> on initial init and so needs to be zero or something like that.
>>>
>>> Regards,
>>> Christian.
>>
>>
>> Not sure how this help, the problem is not there but in 
>> amdgpu_job_run, for embedded fence and resubmit job in pending list 
>> amdgpu_job_run
>> will be called twice or even 3 times with recheck guilty job 
>> sequence. I am supposed to do dma_fence_init to embeded HW fence only 
>> on first call while on second and
>> third only update sequence_num and increase refcount. How can i 
>> differentiate between first and non first calls without 
>> job_run_counter ?
>
> Yeah, good point. We should really stop re-submitting jobs altogether 
> in the kernel and move that whole functionality into userspace.
>
> Christian.


So i guess we keep this for now and see how to move resubmit 
functionality to user space ? as a separate task ?

Andrey


>
>>
>> Andrey
>>
>>
>>>
>>>>
>>>> I guess we could assume that embedded fence is all zeroes before 
>>>> first dma_fence_init  if assuming the job itself
>>>> was allocated using kzalloc and so u can look at dma_fence_ops == 
>>>> NULL or maybe seqno == 0
>>>> as a hint if that the fist call or not but it's a risky assumption 
>>>> in my opinion.
>>>>
>>>> Andrey
>>>>
>>>>
>>>>>
>>>>>>
>>>>>> Also since in the previous patch we resumed setting 
>>>>>> s_fence->parent to NULL
>>>>>> in drm_sched_stop switch to directly checking if job->hw_fence is
>>>>>> signaled to short circuit reset if already signed.
>>>>>>
>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>> Tested-by: Yiqing Yao <yiqing.yao@amd.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c |  2 ++
>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 23 
>>>>>> ++++++++++++++++------
>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  |  7 ++++++-
>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  4 ----
>>>>>>   4 files changed, 25 insertions(+), 11 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c 
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>>>>>> index 513c57f839d8..447bd92c4856 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>>>>>> @@ -684,6 +684,8 @@ int amdgpu_amdkfd_submit_ib(struct 
>>>>>> amdgpu_device *adev,
>>>>>>           goto err_ib_sched;
>>>>>>       }
>>>>>>   +    /* Drop the initial kref_init count (see drm_sched_main as 
>>>>>> example) */
>>>>>> +    dma_fence_put(f);
>>>>>>       ret = dma_fence_wait(f, false);
>>>>>>     err_ib_sched:
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>> index c99541685804..f9718119834f 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>> @@ -5009,16 +5009,28 @@ static void 
>>>>>> amdgpu_device_recheck_guilty_jobs(
>>>>>>             /* clear job's guilty and depend the folowing step to 
>>>>>> decide the real one */
>>>>>>           drm_sched_reset_karma(s_job);
>>>>>> -        /* for the real bad job, it will be resubmitted twice, 
>>>>>> adding a dma_fence_get
>>>>>> -         * to make sure fence is balanced */
>>>>>> -        dma_fence_get(s_job->s_fence->parent);
>>>>>> drm_sched_resubmit_jobs_ext(&ring->sched, 1);
>>>>>>   +        if (!s_job->s_fence->parent) {
>>>>>> +            DRM_WARN("Failed to get a HW fence for job!");
>>>>>> +            continue;
>>>>>> +        }
>>>>>> +
>>>>>>           ret = dma_fence_wait_timeout(s_job->s_fence->parent, 
>>>>>> false, ring->sched.timeout);
>>>>>>           if (ret == 0) { /* timeout */
>>>>>>               DRM_ERROR("Found the real bad job! ring:%s, 
>>>>>> job_id:%llx\n",
>>>>>>                           ring->sched.name, s_job->id);
>>>>>>   +
>>>>>> +            /* Clear this failed job from fence array */
>>>>>> +            amdgpu_fence_driver_clear_job_fences(ring);
>>>>>> +
>>>>>> +            /* Since the job won't signal and we go for
>>>>>> +             * another resubmit drop this parent pointer
>>>>>> +             */
>>>>>> + dma_fence_put(s_job->s_fence->parent);
>>>>>> +            s_job->s_fence->parent = NULL;
>>>>>> +
>>>>>>               /* set guilty */
>>>>>>               drm_sched_increase_karma(s_job);
>>>>>>   retry:
>>>>>> @@ -5047,7 +5059,6 @@ static void amdgpu_device_recheck_guilty_jobs(
>>>>>>             /* got the hw fence, signal finished fence */
>>>>>>           atomic_dec(ring->sched.score);
>>>>>> -        dma_fence_put(s_job->s_fence->parent);
>>>>>> dma_fence_get(&s_job->s_fence->finished);
>>>>>> dma_fence_signal(&s_job->s_fence->finished);
>>>>>> dma_fence_put(&s_job->s_fence->finished);
>>>>>> @@ -5220,8 +5231,8 @@ int amdgpu_device_gpu_recover(struct 
>>>>>> amdgpu_device *adev,
>>>>>>        *
>>>>>>        * job->base holds a reference to parent fence
>>>>>>        */
>>>>>> -    if (job && job->base.s_fence->parent &&
>>>>>> - dma_fence_is_signaled(job->base.s_fence->parent)) {
>>>>>> +    if (job && (job->hw_fence.ops != NULL) &&
>>>>>> +        dma_fence_is_signaled(&job->hw_fence)) {
>>>>>>           job_signaled = true;
>>>>>>           dev_info(adev->dev, "Guilty job already signaled, 
>>>>>> skipping HW reset");
>>>>>>           goto skip_hw_reset;
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c 
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>>> index d6d54ba4c185..9bd4e18212fc 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>>> @@ -164,11 +164,16 @@ int amdgpu_fence_emit(struct amdgpu_ring 
>>>>>> *ring, struct dma_fence **f, struct amd
>>>>>>       if (job && job->job_run_counter) {
>>>>>>           /* reinit seq for resubmitted jobs */
>>>>>>           fence->seqno = seq;
>>>>>> +        /* TO be inline with external fence creation and other 
>>>>>> drivers */
>>>>>> +        dma_fence_get(fence);
>>>>>>       } else {
>>>>>> -        if (job)
>>>>>> +        if (job) {
>>>>>>               dma_fence_init(fence, &amdgpu_job_fence_ops,
>>>>>>                          &ring->fence_drv.lock,
>>>>>>                          adev->fence_context + ring->idx, seq);
>>>>>> +            /* Against remove in amdgpu_job_{free, free_cb} */
>>>>>> +            dma_fence_get(fence);
>>>>>> +        }
>>>>>>           else
>>>>>>               dma_fence_init(fence, &amdgpu_fence_ops,
>>>>>>                          &ring->fence_drv.lock,
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c 
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>> index 58568fdde2d0..638e1d600258 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>> @@ -267,10 +267,6 @@ static struct dma_fence 
>>>>>> *amdgpu_job_run(struct drm_sched_job *sched_job)
>>>>>>               DRM_ERROR("Error scheduling IBs (%d)\n", r);
>>>>>>       }
>>>>>>   -    if (!job->job_run_counter)
>>>>>> -        dma_fence_get(fence);
>>>>>> -    else if (finished->error < 0)
>>>>>> -        dma_fence_put(&job->hw_fence);
>>>>>>       job->job_run_counter++;
>>>>>>       amdgpu_job_free_resources(job);
>>>>>
>>>
>
