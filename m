Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 961F66B7D2E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 17:15:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D92610E573;
	Mon, 13 Mar 2023 16:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD1010E573;
 Mon, 13 Mar 2023 16:15:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKi/glsYXedpbXSVPGIdHiVV5/sJMmZMl09W2j++YzAysyX5MNj4QcoqiwYv6E2DaR4scl09XBKUKgGCul7c/ZCVsYr+I9OlA4nLXpDQ2UAPTnXdYlEpCq3nnVcHPeajh12Urfi2LTr4OsNpDxIoxJ37sASugNNKJv7Pk7/DsJoAE3RqRP5TOfG7bIaP3zt/JK/Wc6JclQrEmDLrE/IFirpRNbWZqd0hrA8oku+0ZPY9RCGTiwERHh997gRe5dxhQOMqEaR3m+TtxVuYsurKpTj1pSh4kk4C9sEyUYvc9UqwrCG660w3gzugyF232xJttGXKP1i/+Fx8Fq4lwqI6Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHExA9joTveCAtTaRXD4MX9RlZAODsSmJNoLNj6yTWE=;
 b=L6hMmVChOiAhlJmgzIhrjgasNXoyEoiI+mt3ygYoob/iLIzzKEE/RE+ghaQdOme/lCEFpKE+pM14f8MBLlVwIY7cKuKZGLR3Ob1xL5JM6O37y5Ul7JhmOY7OIfAc3RVy2rwysvKqyeeYTjXqRm4MTB5lX+sO3I9RHrdI+3HNN8Rufb9bK+RoPDLXNvJJCAoMjJBzGt0wwu/6RVry/xLpkpyJRBq8ABui0FnNWPOUb4rtNd3uEBNXkh5n/RxbnKPbkIaCR3mMFiRIZ++h3Vx1e5kdyWc34rHW2hvUVL9cDnUKufCDMkTr6Q315iLFkhmPlj+9I4P8wiuq9kvDwZWDcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHExA9joTveCAtTaRXD4MX9RlZAODsSmJNoLNj6yTWE=;
 b=vZ4cMRp9LsmTGgYF0fObIxiyaGSXHthNoOxFjDja1zw82IQuV5kU03Z7geYAbVyorL2BdmjKCSkiTyGSVznNZXfO36YUMfAQ7ZMi0Z1JEKTvtJgUY2l5rND7EejJxQcVxDx60EV8usykFtnmtuINGDnG0Y3OfQgGtG+vC2rrPxk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN9PR12MB5308.namprd12.prod.outlook.com (2603:10b6:408:105::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 16:15:24 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 16:15:24 +0000
Message-ID: <0bc78dea-72cb-cadf-5708-39c765f2b7a8@amd.com>
Date: Mon, 13 Mar 2023 17:15:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] drm/msm: Embed the hw_fence in msm_gem_submit
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20230311173513.1080397-1-robdclark@gmail.com>
 <20230311173513.1080397-3-robdclark@gmail.com>
 <b846101c-e6ef-2d3e-9db9-077003b72e57@amd.com>
 <CAF6AEGvH==PPLpdxim4Pi=Q7RA8Ou4NYxvYBW=N8sh9amEqQVQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAF6AEGvH==PPLpdxim4Pi=Q7RA8Ou4NYxvYBW=N8sh9amEqQVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BN9PR12MB5308:EE_
X-MS-Office365-Filtering-Correlation-Id: 1026d0a9-3215-4b2d-2d2a-08db23de2695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WXfvc8Yu5aG6e4wxrOzJhwaMEBmDCs4fIDD7GzAL8Dj/CEAVjSdDduUogAPQnZ6OaH5KZS8Rpp7kdmkqB4ILIpDdpmciYgmC3IeYHAvYfyib5BrvVK+I469xY+6wFK63k5MD/F096cGuhcr9YUKC/OLRXr/U6HlCpycnUox0LObzbA89EhixZlnFnS0Ag+9b1rVx4ZighJ8ChNvdJIeXbulAcwC/U69+VG7NaCir11Ngakk9f6JekHkyGz35+prQi7EzSjaXArc8FymVX/CTBlQES7v/mPqxCFeNQLX8NqbFLrTHjdHkJbcLSJPMznPReVb0yzNUbJUSfptBN/ln0G2i98sO3O7euulg+lbfHr1JgFaLhTm+zwvEb1wz/fPGLErJ0eKzNAMsZl+1PMvApX+3J2LCYzbXzraeDSqtMMoG09auXIEzQcBk2H8oIHoma3FkINdQQcj9HBxDcxNlDzM2JUs6djTNcBt2Io5dSWyU+5YMM0rwRGj3Rnnz6eGSyZM0uiOlnPjm14ymZtgsWR3UwghE3e5KMNgoQIYoOl4i4sPGjPLVWvAIO+g1JrhfOghhLviJJ5SCtoGLq6ZKmxmh9al7uIWwF76oaoisMkgQdHXXMngc2bChm7kFpr7OUmLjI+xsBmYtU+wZBq3Smm1m4ZeNUTG38I+pQ8kBH8AA5iSnim+f8qgRXW1iCH64
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199018)(2616005)(7416002)(186003)(31686004)(53546011)(6512007)(6506007)(8936002)(83380400001)(66899018)(6666004)(38100700002)(66574015)(30864003)(6486002)(966005)(5660300002)(66556008)(66476007)(4326008)(2906002)(8676002)(41300700001)(316002)(478600001)(31696002)(36756003)(66946007)(54906003)(86362001)(6916009)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZERuVmEzR0pUeEoydC8rQVBWNGRoN1JVaXF6VU9mK29WcE5NN3Rvd2czWnk3?=
 =?utf-8?B?V2V5UjlZTTRPeGsxeDQyd2VzRzlsSkI3Zm5EU0t6L080VVhWSlJwVVUyNDhx?=
 =?utf-8?B?Si85WWZ2SHl2bXRGYW1PMTdJdVhKc2VyZjBaelB1cjA3SHVmeU5Qd2hIaWEx?=
 =?utf-8?B?RkZCVWhnMnNSNTYrOEp0YnZXcG45dG9LVHM4akF4R0U2ZncxNTFrZlowcFRF?=
 =?utf-8?B?QVA0VXlhWExOYjhPdk9MVUtZMW5ncmI4eVdWQWM5OGlpWmVNQ3JhUmlCdkFx?=
 =?utf-8?B?QzhIeDV5WFFaNzg4UW9KRVNvVnJCdHUrc2FoMU45NHR0OSszSWNnQ2MrUCt6?=
 =?utf-8?B?RU45bFcwTnF0NDJTVnVlNUV0S2xXUjExMHBmcnE2cXcwNVB2VHYrdDdtaHdY?=
 =?utf-8?B?ODAwdUxOZ2tYVW0vN0VCYk5FSHRvUjFmWW5RaHRUSzFIOXpQVnpyK0ZTNy81?=
 =?utf-8?B?dTNWcHFKWHVyYS8rR2d4dVJ4QTA2czRRalZBVUppM1owYmFvNHdNSkg3SCs2?=
 =?utf-8?B?WmxXMGJNRExPSVhXc1dIWXNjRGkyWmgyT3V3NnhVMVhOZFp2UWhsNlF1YUhB?=
 =?utf-8?B?Ky9Ka0pXdEErbEhnYWVJdFQvRWtYMGtmWFF1bHJMRmJadXFtL0t5Q1BnMDRB?=
 =?utf-8?B?VU5GbHEzSXVQVkFXMXd5VzlYZEsvSFlmN2ZqTlBPUjVtYS9wMTNLd2h3eDha?=
 =?utf-8?B?NGo0VG1hOU5SbHcrZ1o5R1NmbXkyQVYyNmpGRUowVm5Nb3pJWk1mYTloWDRJ?=
 =?utf-8?B?K0VPWjVPWm1MOGQ0bXJsQkRJWGxjSTJ1YVZ5azFpUWZuMk1pRkI3WlEzUkVV?=
 =?utf-8?B?VTlKeS8zWlRnK3Z0cFdBZC9yS0RXNC9kdEJrcFRsNEJMeXlkbCtDd05JbzlV?=
 =?utf-8?B?UExMTUpIdjRmaDlvaXNPQm5kTWd0bVcvQllyQlZNTzhDTXdPdEQzZGZVYkpr?=
 =?utf-8?B?UkNMTzFhYjNXcnBjWkV4ckJGcTBUcDJMbmVxR3BEZ21uK2Q4SEFoTWtyeXRv?=
 =?utf-8?B?VDNKL21jRTgyMS9vcjJTV2d5UDVkOXFNd2pOaW9hbHgzUU4rMHQ1LzNVaWNn?=
 =?utf-8?B?U2UyazFSdXdBNnNTTjQ4QkhRQXFMbnNjbVdKem9NRzFQMno0UGcvb0MvKzIy?=
 =?utf-8?B?aFU1cXNDQ1JsQUZ4Vk9QNWFEOThPejZmYmRIbmxhaVlIakNoa3BMR2psV2dX?=
 =?utf-8?B?UzhFM2xCMlBiVkhORWlkYURNcUluRVc3eGFCNG5qS3dESFhTN1ZsWkJWbE5Q?=
 =?utf-8?B?V2Jib3NIV1VneU9NTlJBWTdwVWpWODRpc21MZHdkNDYzMU9SZ29jem9oUlNy?=
 =?utf-8?B?UVF3Q245RFhpYnBJL2wwQzFKUlNUQk5JQXQra0wvMTVXa2dkTEtQWFRmR2dq?=
 =?utf-8?B?eFRheGp2VVBGSjdtNE5vcU4vQnBXczlMeHZ5ZHgrYmlycGF0bGJqdk5YVWlR?=
 =?utf-8?B?TUZOS1g4N3lxcVFsamxLZkZ5aGFqMnMvSW51Z1J4R3dwekZqREQyYnI0VTR4?=
 =?utf-8?B?WHUwSVNOVmhSVGl4dFZhQWsrdHp6VDF3c1ZmMUM2UVZ5RnVMN1lHVFRUQzZ5?=
 =?utf-8?B?RHd6QTFPMktoeGJrb3JuOUJ6RU9kR1dyZkVZL2F1UmNuNW1PbnJkMnJDUUxS?=
 =?utf-8?B?QUs3VTZyODhqZDB2T211NXBNb3Z0YkZCQkpobEtFMzE2Yjl1MEVLZTVCR21a?=
 =?utf-8?B?VjBGKytFVzc5STFMOGQ3YnJDNllZSm5xa0NtZ3k3ZnBwbXhoc2dsTzlZQWda?=
 =?utf-8?B?M2RsSVNlMnlwWG5NejVHcnQzb0VWM2cyc1dPcFl2MG9NV0JENFY3RU5JaDBk?=
 =?utf-8?B?dXd0cVJxRGhPRkt0ZGpJT3Fnemk0Q2JLd2FJVGZteDh6bkFOeGc0TWpwVTVp?=
 =?utf-8?B?R2w4elJMdUJXN3FDOW0vd21NUDZYMVA1NzJrVUpTQldPeHd0NHRzQTE1NXFn?=
 =?utf-8?B?ZTZpdGRsbDRtTXluUWFaU1BtaWdQREpyTmZhQUhnOUJXUVp0WWRidkIzWTRn?=
 =?utf-8?B?ZzN6dTIvcTRuaG9CeWtEWFlDalFpQUUzaGVVUGE0aG1PZ284bFJFbm5IVHhv?=
 =?utf-8?B?cnJHSmg5azJyODVzV01NSmJLWnBnZmwxZUVYSGZjNTFnRkRoajBPeHJyRjJu?=
 =?utf-8?B?dStjVnNLTTFBN3M1K3R4VjRPa2pyemRmbmtPbkYrV3dpVVNvL2JneVFrRjlJ?=
 =?utf-8?Q?8H6wLDNwG6bdCzYZ2yBkgTrKa3q3SJX0lYg92gSTHFT2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1026d0a9-3215-4b2d-2d2a-08db23de2695
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 16:15:24.3204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nsv01RxYYJXmOmCzC4xTuJXV9GhWizAaneoA2zHjJg59Z+qTSYxAR5nO0JBATu4v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5308
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>, "Tuikov, Luben" <Luben.Tuikov@amd.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.03.23 um 15:45 schrieb Rob Clark:
> On Mon, Mar 13, 2023 at 12:19 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 11.03.23 um 18:35 schrieb Rob Clark:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Avoid allocating memory in job_run() by embedding the fence in the
>>> submit object.  Since msm gpu fences are always 1:1 with msm_gem_submit
>>> we can just use the fence's refcnt to track the submit.  And since we
>>> can get the fence ctx from the submit we can just drop the msm_fence
>>> struct altogether.  This uses the new dma_fence_init_noref() to deal
>>> with the fact that the fence's refcnt is initialized when the submit is
>>> created, long before job_run().
>> Well this is a very very bad idea, we made the same mistake with amdgpu
>> as well.
>>
>> It's true that you should not have any memory allocation in your run_job
>> callback, but you could also just allocate the hw fence during job
>> creation and initializing it later on.
>>
>> I've suggested to embed the fence into the job for amdgpu because some
>> people insisted of re-submitting jobs during timeout and GPU reset. This
>> turned into a nightmare with tons of bug fixes on top of bug fixes on
>> top of bug fixes because it messes up the job and fence lifetime as
>> defined by the DRM scheduler and DMA-buf framework.
>>
>> Luben is currently working on cleaning all this up.
> This actually shouldn't be a problem with msm, as the fence doesn't
> change if there is a gpu reset.  We simply signal the fence for the
> offending job, reset the GPU, and re-play the remaining in-flight jobs
> (ie. things that already had their job_run() called) with the original
> fences.  (We don't use gpu sched's reset/timeout handling.. when I
> migrated to gpu sched I kept our existing hangcheck/recovery
> mechanism.)

That sounds much saner than what we did.

So you basically need the dma_fence reference counting separate to 
initializing the other dma_fence fields?

What would happen if a dma_fence which is not completely initialized 
gets freed? E.g. because of an error?

Would it be to much to just keep the handling as it is today and only 
allocate the dma_fence without initializing it? If necessary we could 
easily add a dma_fence_is_initialized() function which checks the 
fence_ops for NULL.

Thanks,
Christian.

>
> BR,
> -R
>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>> Note that this applies on top of https://patchwork.freedesktop.org/series/93035/
>>> out of convenience for myself, but I can re-work it to go before
>>> depending on the order that things land.
>>>
>>>    drivers/gpu/drm/msm/msm_fence.c      | 45 +++++++++++-----------------
>>>    drivers/gpu/drm/msm/msm_fence.h      |  2 +-
>>>    drivers/gpu/drm/msm/msm_gem.h        | 10 +++----
>>>    drivers/gpu/drm/msm/msm_gem_submit.c |  8 ++---
>>>    drivers/gpu/drm/msm/msm_gpu.c        |  4 +--
>>>    drivers/gpu/drm/msm/msm_ringbuffer.c |  4 +--
>>>    6 files changed, 31 insertions(+), 42 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
>>> index 51b461f32103..51f9f1f0cb66 100644
>>> --- a/drivers/gpu/drm/msm/msm_fence.c
>>> +++ b/drivers/gpu/drm/msm/msm_fence.c
>>> @@ -103,14 +103,9 @@ void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence)
>>>        spin_unlock_irqrestore(&fctx->spinlock, flags);
>>>    }
>>>
>>> -struct msm_fence {
>>> -     struct dma_fence base;
>>> -     struct msm_fence_context *fctx;
>>> -};
>>> -
>>> -static inline struct msm_fence *to_msm_fence(struct dma_fence *fence)
>>> +static inline struct msm_gem_submit *fence_to_submit(struct dma_fence *fence)
>>>    {
>>> -     return container_of(fence, struct msm_fence, base);
>>> +     return container_of(fence, struct msm_gem_submit, hw_fence);
>>>    }
>>>
>>>    static const char *msm_fence_get_driver_name(struct dma_fence *fence)
>>> @@ -120,20 +115,20 @@ static const char *msm_fence_get_driver_name(struct dma_fence *fence)
>>>
>>>    static const char *msm_fence_get_timeline_name(struct dma_fence *fence)
>>>    {
>>> -     struct msm_fence *f = to_msm_fence(fence);
>>> -     return f->fctx->name;
>>> +     struct msm_gem_submit *submit = fence_to_submit(fence);
>>> +     return submit->ring->fctx->name;
>>>    }
>>>
>>>    static bool msm_fence_signaled(struct dma_fence *fence)
>>>    {
>>> -     struct msm_fence *f = to_msm_fence(fence);
>>> -     return msm_fence_completed(f->fctx, f->base.seqno);
>>> +     struct msm_gem_submit *submit = fence_to_submit(fence);
>>> +     return msm_fence_completed(submit->ring->fctx, fence->seqno);
>>>    }
>>>
>>>    static void msm_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>>>    {
>>> -     struct msm_fence *f = to_msm_fence(fence);
>>> -     struct msm_fence_context *fctx = f->fctx;
>>> +     struct msm_gem_submit *submit = fence_to_submit(fence);
>>> +     struct msm_fence_context *fctx = submit->ring->fctx;
>>>        unsigned long flags;
>>>        ktime_t now;
>>>
>>> @@ -165,26 +160,22 @@ static void msm_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>>>        spin_unlock_irqrestore(&fctx->spinlock, flags);
>>>    }
>>>
>>> +static void msm_fence_release(struct dma_fence *fence)
>>> +{
>>> +     __msm_gem_submit_destroy(fence_to_submit(fence));
>>> +}
>>> +
>>>    static const struct dma_fence_ops msm_fence_ops = {
>>>        .get_driver_name = msm_fence_get_driver_name,
>>>        .get_timeline_name = msm_fence_get_timeline_name,
>>>        .signaled = msm_fence_signaled,
>>>        .set_deadline = msm_fence_set_deadline,
>>> +     .release = msm_fence_release,
>>>    };
>>>
>>> -struct dma_fence *
>>> -msm_fence_alloc(struct msm_fence_context *fctx)
>>> +void
>>> +msm_fence_init(struct msm_fence_context *fctx, struct dma_fence *f)
>>>    {
>>> -     struct msm_fence *f;
>>> -
>>> -     f = kzalloc(sizeof(*f), GFP_KERNEL);
>>> -     if (!f)
>>> -             return ERR_PTR(-ENOMEM);
>>> -
>>> -     f->fctx = fctx;
>>> -
>>> -     dma_fence_init(&f->base, &msm_fence_ops, &fctx->spinlock,
>>> -                    fctx->context, ++fctx->last_fence);
>>> -
>>> -     return &f->base;
>>> +     dma_fence_init_noref(f, &msm_fence_ops, &fctx->spinlock,
>>> +                          fctx->context, ++fctx->last_fence);
>>>    }
>>> diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_fence.h
>>> index cdaebfb94f5c..8fca37e9773b 100644
>>> --- a/drivers/gpu/drm/msm/msm_fence.h
>>> +++ b/drivers/gpu/drm/msm/msm_fence.h
>>> @@ -81,7 +81,7 @@ void msm_fence_context_free(struct msm_fence_context *fctx);
>>>    bool msm_fence_completed(struct msm_fence_context *fctx, uint32_t fence);
>>>    void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence);
>>>
>>> -struct dma_fence * msm_fence_alloc(struct msm_fence_context *fctx);
>>> +void msm_fence_init(struct msm_fence_context *fctx, struct dma_fence *f);
>>>
>>>    static inline bool
>>>    fence_before(uint32_t a, uint32_t b)
>>> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
>>> index c4844cf3a585..e06afed99d5b 100644
>>> --- a/drivers/gpu/drm/msm/msm_gem.h
>>> +++ b/drivers/gpu/drm/msm/msm_gem.h
>>> @@ -259,10 +259,10 @@ struct msm_gem_submit {
>>>        struct ww_acquire_ctx ticket;
>>>        uint32_t seqno;         /* Sequence number of the submit on the ring */
>>>
>>> -     /* Hw fence, which is created when the scheduler executes the job, and
>>> +     /* Hw fence, which is initialized when the scheduler executes the job, and
>>>         * is signaled when the hw finishes (via seqno write from cmdstream)
>>>         */
>>> -     struct dma_fence *hw_fence;
>>> +     struct dma_fence hw_fence;
>>>
>>>        /* Userspace visible fence, which is signaled by the scheduler after
>>>         * the hw_fence is signaled.
>>> @@ -309,16 +309,16 @@ static inline struct msm_gem_submit *to_msm_submit(struct drm_sched_job *job)
>>>        return container_of(job, struct msm_gem_submit, base);
>>>    }
>>>
>>> -void __msm_gem_submit_destroy(struct kref *kref);
>>> +void __msm_gem_submit_destroy(struct msm_gem_submit *submit);
>>>
>>>    static inline void msm_gem_submit_get(struct msm_gem_submit *submit)
>>>    {
>>> -     kref_get(&submit->ref);
>>> +     dma_fence_get(&submit->hw_fence);
>>>    }
>>>
>>>    static inline void msm_gem_submit_put(struct msm_gem_submit *submit)
>>>    {
>>> -     kref_put(&submit->ref, __msm_gem_submit_destroy);
>>> +     dma_fence_put(&submit->hw_fence);
>>>    }
>>>
>>>    void msm_submit_retire(struct msm_gem_submit *submit);
>>> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
>>> index be4bf77103cd..522c8c82e827 100644
>>> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
>>> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
>>> @@ -47,7 +47,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>>>                return ERR_PTR(ret);
>>>        }
>>>
>>> -     kref_init(&submit->ref);
>>> +     kref_init(&submit->hw_fence.refcount);
>>>        submit->dev = dev;
>>>        submit->aspace = queue->ctx->aspace;
>>>        submit->gpu = gpu;
>>> @@ -65,10 +65,9 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>>>        return submit;
>>>    }
>>>
>>> -void __msm_gem_submit_destroy(struct kref *kref)
>>> +/* Called when the hw_fence is destroyed: */
>>> +void __msm_gem_submit_destroy(struct msm_gem_submit *submit)
>>>    {
>>> -     struct msm_gem_submit *submit =
>>> -                     container_of(kref, struct msm_gem_submit, ref);
>>>        unsigned i;
>>>
>>>        if (submit->fence_id) {
>>> @@ -78,7 +77,6 @@ void __msm_gem_submit_destroy(struct kref *kref)
>>>        }
>>>
>>>        dma_fence_put(submit->user_fence);
>>> -     dma_fence_put(submit->hw_fence);
>>>
>>>        put_pid(submit->pid);
>>>        msm_submitqueue_put(submit->queue);
>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
>>> index 380249500325..a82d11dd5fcf 100644
>>> --- a/drivers/gpu/drm/msm/msm_gpu.c
>>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
>>> @@ -716,7 +716,7 @@ static void retire_submits(struct msm_gpu *gpu)
>>>                         * been signalled, then later submits are not signalled
>>>                         * either, so we are also done.
>>>                         */
>>> -                     if (submit && dma_fence_is_signaled(submit->hw_fence)) {
>>> +                     if (submit && dma_fence_is_signaled(&submit->hw_fence)) {
>>>                                retire_submit(gpu, ring, submit);
>>>                        } else {
>>>                                break;
>>> @@ -760,7 +760,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>>
>>>        msm_gpu_hw_init(gpu);
>>>
>>> -     submit->seqno = submit->hw_fence->seqno;
>>> +     submit->seqno = submit->hw_fence.seqno;
>>>
>>>        msm_rd_dump_submit(priv->rd, submit, NULL);
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
>>> index 57a8e9564540..5c54befa2427 100644
>>> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
>>> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
>>> @@ -18,7 +18,7 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
>>>        struct msm_gpu *gpu = submit->gpu;
>>>        int i;
>>>
>>> -     submit->hw_fence = msm_fence_alloc(fctx);
>>> +     msm_fence_init(fctx, &submit->hw_fence);
>>>
>>>        for (i = 0; i < submit->nr_bos; i++) {
>>>                struct drm_gem_object *obj = &submit->bos[i].obj->base;
>>> @@ -37,7 +37,7 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
>>>
>>>        mutex_unlock(&gpu->lock);
>>>
>>> -     return dma_fence_get(submit->hw_fence);
>>> +     return dma_fence_get(&submit->hw_fence);
>>>    }
>>>
>>>    static void msm_job_free(struct drm_sched_job *job)

