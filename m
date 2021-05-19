Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0A0388B3F
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 12:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECBC96ECFA;
	Wed, 19 May 2021 10:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8BF6ECFA;
 Wed, 19 May 2021 10:01:33 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id b17so14676345ede.0;
 Wed, 19 May 2021 03:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=/Ycn2ygxBe+DYdOvwDuLm6JrS1HW5kOLb2PyHOv9fag=;
 b=DdFkYOlOv1nzw5YCouNK47OppH0wmZPLdDZXa/52kdIHYNRvp6W0kSaLpD1HUimwQD
 /bw2OcrZzz5b80eBmqPyk4M+cUyMr2UYsfzloUo5l0Loxw/4rfiYZ6oVR9b+4P52bagm
 w9iqFvh/LxLQRw7SdrG1C+hiwYgIqkbQFg/7DKK/9K5Hb/GBRSQt0q9kaNUqAh0AUaJ1
 d5LlDOnCBbeIzyaeA+cbPn9lsstuDivseIrZdddVruEe6RnOpmF3EiXz0FHG6R59wGx7
 UeO2nTKz137CmrmBlF+v/pPWU49asFAmtWQGTX+zPG9WFvETLwNgncoQxCNp3bMbXvJ+
 4JXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=/Ycn2ygxBe+DYdOvwDuLm6JrS1HW5kOLb2PyHOv9fag=;
 b=An77Kr7A2GH85Xdryzyazn4Q6ZKeVjY6md6E2xIx55vLFDjwAnvjA1YeqT5c91Wn0N
 dSJn3ZJOlEAFQ6NlzHgCodU411tjHZ9bbL+XaKs54IlEItX5Eq7X9zmK1idjwyRijikw
 ZBmCOOFnIBHT7wD/Tvst8XRb5t3xTFUJc3vxxl/2Sn2fyW0cLG/yjq+RLUTRAAk1OmCS
 GgPGFN5k3oPG4gtzvBirnBvZqFmppKluVCiHIkseCOQT2uZGu6mc+j1nFkSdd++zlQ93
 jJnaia5eEsv5XLxqrs/K/uGMxJwLnf0LBf1Ui3lee9oanX02+qGo3c6IR9JOGglz/xQm
 PL9Q==
X-Gm-Message-State: AOAM532fYZA9finFDEkSy2ps+BvXhizxHyAhLM5Y7K79uESdIwEExK/x
 eZH1ofp9IkxD/iZ34x4Hmfvr4kpkrhk=
X-Google-Smtp-Source: ABdhPJx+LUE6s2sDH/4zQxgxpBAqOqT2iMDDHmqLaRC9AcSAYH5lntcWuzJ2mZQTkq+/bD6O6acdgg==
X-Received: by 2002:aa7:ca1a:: with SMTP id y26mr13237683eds.297.1621418491846; 
 Wed, 19 May 2021 03:01:31 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:8e28:1d3:41f3:e15a?
 ([2a02:908:1252:fb60:8e28:1d3:41f3:e15a])
 by smtp.gmail.com with ESMTPSA id t17sm12906890ejs.15.2021.05.19.03.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 03:01:31 -0700 (PDT)
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW1JGQyBQQVRDSCAxLzJdIGRybS9hbWRncHU6IEZp?=
 =?UTF-8?Q?x_memory_corruption_due_to_swapout_and_swapin?=
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20210519022852.16766-1-xinhui.pan@amd.com>
 <c7f28ef7-c0a1-ff76-2b48-4559a8e0e593@amd.com>
 <BN9PR12MB5163D9CC209C0B9B02CD8A5B872B9@BN9PR12MB5163.namprd12.prod.outlook.com>
 <DM4PR12MB5165E11F06A62127A32E9F0B872B9@DM4PR12MB5165.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <075eaedb-ca07-83fa-7c1f-6b94ae5a4e6e@gmail.com>
Date: Wed, 19 May 2021 12:01:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <DM4PR12MB5165E11F06A62127A32E9F0B872B9@DM4PR12MB5165.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'm scratching my head how that is even possible.

See when a BO is created in the system domain it is just an empty hull, 
e.g. without backing store and allocated pages.

So the swapout function will just ignore it.

Christian.

Am 19.05.21 um 07:07 schrieb Pan, Xinhui:
> [AMD Official Use Only]
>
> I have reverted Chris'  patch, still hit this failure.
> Just see two lines in Chris' patch. Any BO in cpu domian would be swapout first. That is why we hit this issue frequently now. But the bug is there long time ago.
>
> -       for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> -               list_for_each_entry(bo, &glob->swap_lru[i], swap) {
> [snip]
> +       for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
> +               for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
>
>
> ________________________________________
> 发件人: Pan, Xinhui <Xinhui.Pan@amd.com>
> 发送时间: 2021年5月19日 12:09
> 收件人: Kuehling, Felix; amd-gfx@lists.freedesktop.org
> 抄送: Deucher, Alexander; Koenig, Christian; dri-devel@lists.freedesktop.org; daniel@ffwll.ch
> 主题: 回复: [RFC PATCH 1/2] drm/amdgpu: Fix memory corruption due to swapout and swapin
>
> yes, we really dont swapout SG BOs.
> The problems is that before we validate a userptr BO, we create this BO in CPU domain by default. So this BO has chance to swapout.
>
> we set flag TTM_PAGE_FLAG_SG on userptr BO in popluate() which is too late.
> I have not try to revert Chris' patch as I think it desnt help. Or I can have a try later.
>
> ________________________________________
> 发件人: Kuehling, Felix <Felix.Kuehling@amd.com>
> 发送时间: 2021年5月19日 11:29
> 收件人: Pan, Xinhui; amd-gfx@lists.freedesktop.org
> 抄送: Deucher, Alexander; Koenig, Christian; dri-devel@lists.freedesktop.org; daniel@ffwll.ch
> 主题: Re: [RFC PATCH 1/2] drm/amdgpu: Fix memory corruption due to swapout and swapin
>
> Swapping SG BOs makes no sense, because TTM doesn't own the pages of
> this type of BO.
>
> Last I checked, userptr BOs (and other SG BOs) were protected from
> swapout by the fact that they would not be added to the swap-LRU. But it
> looks like Christian just removed the swap-LRU. I guess this broke that
> protection:
>
> commit 2cb51d22d70b18eaf339abf9758bf0b7608da65c
> Author: Christian König <christian.koenig@amd.com>
> Date:   Tue Oct 6 16:30:09 2020 +0200
>
>       drm/ttm: remove swap LRU v3
>
>       Instead evict round robin from each devices SYSTEM and TT domain.
>
>       v2: reorder num_pages access reported by Dan's script
>       v3: fix rebase fallout, num_pages should be 32bit
>
>       Signed-off-by: Christian König <christian.koenig@amd.com>
>       Tested-by: Nirmoy Das <nirmoy.das@amd.com>
>       Reviewed-by: Huang Rui <ray.huang@amd.com>
>       Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>       Link: https://patchwork.freedesktop.org/patch/424009/
>
> Regards,
>     Felix
>
>
> On 2021-05-18 10:28 p.m., xinhui pan wrote:
>> cpu 1                                           cpu 2
>> kfd alloc BO A(userptr)                         alloc BO B(GTT)
>>       ->init -> validate                               -> init -> validate -> populate
>>       init_user_pages                            -> swapout BO A //hit ttm pages limit
>>        -> get_user_pages (fill up ttm->pages)
>>         -> validate -> populate
>>             -> swapin BO A // Now hit the BUG
>>
>> We know that get_user_pages may race with swapout on same BO.
>> Threre are some issues I have met.
>> 1) memory corruption.
>> This is because we do a swap before memory is setup. ttm_tt_swapout()
>> just create a swap_storage with its content being 0x0. So when we setup
>> memory after the swapout. The following swapin makes the memory
>> corrupted.
>>
>> 2) panic
>> When swapout happes with get_user_pages, they touch ttm->pages without
>> anylock. It causes memory corruption too. But I hit page fault mostly.
>>
>> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
>> ---
>>    drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 16 +++++++++++++++-
>>    1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> index 928e8d57cd08..42460e4480f8 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> @@ -835,6 +835,7 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr)
>>        struct amdkfd_process_info *process_info = mem->process_info;
>>        struct amdgpu_bo *bo = mem->bo;
>>        struct ttm_operation_ctx ctx = { true, false };
>> +     struct page **pages;
>>        int ret = 0;
>>
>>        mutex_lock(&process_info->lock);
>> @@ -852,7 +853,13 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr)
>>                goto out;
>>        }
>>
>> -     ret = amdgpu_ttm_tt_get_user_pages(bo, bo->tbo.ttm->pages);
>> +     pages = kvmalloc_array(bo->tbo.ttm->num_pages,
>> +                     sizeof(struct page *),
>> +                     GFP_KERNEL | __GFP_ZERO);
>> +     if (!pages)
>> +             goto unregister_out;
>> +
>> +     ret = amdgpu_ttm_tt_get_user_pages(bo, pages);
>>        if (ret) {
>>                pr_err("%s: Failed to get user pages: %d\n", __func__, ret);
>>                goto unregister_out;
>> @@ -863,6 +870,12 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr)
>>                pr_err("%s: Failed to reserve BO\n", __func__);
>>                goto release_out;
>>        }
>> +
>> +     WARN_ON_ONCE(bo->tbo.ttm->page_flags & TTM_PAGE_FLAG_SWAPPED);
>> +
>> +     memcpy(bo->tbo.ttm->pages,
>> +                     pages,
>> +                     sizeof(struct page*) * bo->tbo.ttm->num_pages);
>>        amdgpu_bo_placement_from_domain(bo, mem->domain);
>>        ret = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
>>        if (ret)
>> @@ -872,6 +885,7 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr)
>>    release_out:
>>        amdgpu_ttm_tt_get_user_pages_done(bo->tbo.ttm);
>>    unregister_out:
>> +     kvfree(pages);
>>        if (ret)
>>                amdgpu_mn_unregister(bo);
>>    out:
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

