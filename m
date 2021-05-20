Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0921389E0A
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 08:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCE66EEA2;
	Thu, 20 May 2021 06:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBE76E932;
 Thu, 20 May 2021 06:39:25 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id l4so23452915ejc.10;
 Wed, 19 May 2021 23:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ChSUX7n0pMgeSOn3NlNxlj/b1+yC7/VnQB7mZpVJgWk=;
 b=CE0dST83c9UbxXdWur6yH+23M+wWrijc00/8nxxIAKNREiqkUGH4gUC3z839Iu1X16
 LnxUQOTeHhQ4On6ps2yxG7j9Rb+2D/77x7cunt8C+ryTYW/ee0EaRvjGzt0h2nCxS072
 4fsqgcPz0bJEtBInXr3McUPm3KHtoiHrs60RQiEN9qkHJAHlCAC7wl6cZnoB4pTDt+l9
 w1Xon5t/qcMZb5j19Tg70AeHdsqgFPNArGOyIJDaUzZqjOeAuQJemZLxiaWUhudOjcen
 LeKCXNtCIRk0gtHcRCZ8p62Bf9lm3mnHV11w2qSNy++iA/DMgj7+MUEvlmtuo8aqqDsp
 3Eaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ChSUX7n0pMgeSOn3NlNxlj/b1+yC7/VnQB7mZpVJgWk=;
 b=XZ+jfO76TUC1EbOiovQeHViurSq9lBnnd1r565XF0Nh9iTNY1NoWXWrFdze6sgECSX
 chloakTqEk9MtycbhcF5WeoyC5hgcgURCjw0Qx+0zcYPydmxFdjW0UgfSVvtLOtyn9qG
 qKk43q80VQ1jJ0DiERwgergX9Fjnffr4eD6sND94uWtuxkzjU6jJZ3TaScXyKE8G2mv0
 Q803daTPQDqHpfchIHE2UeCtIj8nSTOYkgn6a1mSdB6SpHDlE6PFUEk0leWCVvqlut/a
 +gpwyOCG97NnzTMXJ/JKSodYv5m4PdUpagx2D8y6V+pgstcbOKCEBTpBQ9tP+IglNWBi
 qDSw==
X-Gm-Message-State: AOAM533kT67hLZ35qiiaGuWO6Cog0xNOrxX6zlzlH2Wl9oTAs72gfHAW
 nyrCH9iobwSytVyNDsxmc2uTTVcuRLA=
X-Google-Smtp-Source: ABdhPJx5MwIc3G3w+9Qdp9NHKTNcmj4XfIu58Vv6RC9zmT3VcRsu5TMiaXy/Faku6PL4Cs+NqrHc5Q==
X-Received: by 2002:a17:906:5291:: with SMTP id
 c17mr2991721ejm.527.1621492764515; 
 Wed, 19 May 2021 23:39:24 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:4635:589e:67a4:e02a?
 ([2a02:908:1252:fb60:4635:589e:67a4:e02a])
 by smtp.gmail.com with ESMTPSA id e23sm1002339eds.2.2021.05.19.23.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 23:39:24 -0700 (PDT)
Subject: =?UTF-8?B?UmU6IOWbnuWkjTog5Zue5aSNOiBbUkZDIFBBVENIIDEvMl0gZHJtL2Ft?=
 =?UTF-8?Q?dgpu=3a_Fix_memory_corruption_due_to_swapout_and_swapin?=
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20210519022852.16766-1-xinhui.pan@amd.com>
 <c7f28ef7-c0a1-ff76-2b48-4559a8e0e593@amd.com>
 <BN9PR12MB5163D9CC209C0B9B02CD8A5B872B9@BN9PR12MB5163.namprd12.prod.outlook.com>
 <DM4PR12MB5165E11F06A62127A32E9F0B872B9@DM4PR12MB5165.namprd12.prod.outlook.com>
 <075eaedb-ca07-83fa-7c1f-6b94ae5a4e6e@gmail.com>
 <DM4PR12MB51652009560A0FE2AA93ECD9872A9@DM4PR12MB5165.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d8fe3545-2feb-cd71-79be-97287bf96dcb@gmail.com>
Date: Thu, 20 May 2021 08:39:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <DM4PR12MB51652009560A0FE2AA93ECD9872A9@DM4PR12MB5165.namprd12.prod.outlook.com>
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

> swapout function create one swap storage which is filled with zero. And set ttm->page_flags as TTM_PAGE_FLAG_SWAPPED.  Just because ttm has no backend page this time, no real data is swapout to this swap storage.

That's the fundamental problem. A TT object which isn't populated 
shouldn't be considered for swapout nor eviction in the first place.

I'm going to take a look later today.

Christian.

Am 20.05.21 um 04:55 schrieb Pan, Xinhui:
> [AMD Official Use Only]
>
> swapout function create one swap storage which is filled with zero. And set ttm->page_flags as TTM_PAGE_FLAG_SWAPPED.  Just because ttm has no backend page this time, no real data is swapout to this swap storage.
>
> swapin function is called during populate as TTM_PAGE_FLAG_SWAPPED is set.
> Now here is the problem, we swapin data to ttm bakend memory from swap storage. That just causes the memory been overwritten.
>
> ________________________________________
> 发件人: Christian König <ckoenig.leichtzumerken@gmail.com>
> 发送时间: 2021年5月19日 18:01
> 收件人: Pan, Xinhui; Kuehling, Felix; amd-gfx@lists.freedesktop.org
> 抄送: Deucher, Alexander; daniel@ffwll.ch; Koenig, Christian; dri-devel@lists.freedesktop.org
> 主题: Re: 回复: [RFC PATCH 1/2] drm/amdgpu: Fix memory corruption due to swapout and swapin
>
> I'm scratching my head how that is even possible.
>
> See when a BO is created in the system domain it is just an empty hull,
> e.g. without backing store and allocated pages.
>
> So the swapout function will just ignore it.
>
> Christian.
>
> Am 19.05.21 um 07:07 schrieb Pan, Xinhui:
>> [AMD Official Use Only]
>>
>> I have reverted Chris'  patch, still hit this failure.
>> Just see two lines in Chris' patch. Any BO in cpu domian would be swapout first. That is why we hit this issue frequently now. But the bug is there long time ago.
>>
>> -       for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
>> -               list_for_each_entry(bo, &glob->swap_lru[i], swap) {
>> [snip]
>> +       for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
>> +               for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
>>
>>
>> ________________________________________
>> 发件人: Pan, Xinhui <Xinhui.Pan@amd.com>
>> 发送时间: 2021年5月19日 12:09
>> 收件人: Kuehling, Felix; amd-gfx@lists.freedesktop.org
>> 抄送: Deucher, Alexander; Koenig, Christian; dri-devel@lists.freedesktop.org; daniel@ffwll.ch
>> 主题: 回复: [RFC PATCH 1/2] drm/amdgpu: Fix memory corruption due to swapout and swapin
>>
>> yes, we really dont swapout SG BOs.
>> The problems is that before we validate a userptr BO, we create this BO in CPU domain by default. So this BO has chance to swapout.
>>
>> we set flag TTM_PAGE_FLAG_SG on userptr BO in popluate() which is too late.
>> I have not try to revert Chris' patch as I think it desnt help. Or I can have a try later.
>>
>> ________________________________________
>> 发件人: Kuehling, Felix <Felix.Kuehling@amd.com>
>> 发送时间: 2021年5月19日 11:29
>> 收件人: Pan, Xinhui; amd-gfx@lists.freedesktop.org
>> 抄送: Deucher, Alexander; Koenig, Christian; dri-devel@lists.freedesktop.org; daniel@ffwll.ch
>> 主题: Re: [RFC PATCH 1/2] drm/amdgpu: Fix memory corruption due to swapout and swapin
>>
>> Swapping SG BOs makes no sense, because TTM doesn't own the pages of
>> this type of BO.
>>
>> Last I checked, userptr BOs (and other SG BOs) were protected from
>> swapout by the fact that they would not be added to the swap-LRU. But it
>> looks like Christian just removed the swap-LRU. I guess this broke that
>> protection:
>>
>> commit 2cb51d22d70b18eaf339abf9758bf0b7608da65c
>> Author: Christian König <christian.koenig@amd.com>
>> Date:   Tue Oct 6 16:30:09 2020 +0200
>>
>>        drm/ttm: remove swap LRU v3
>>
>>        Instead evict round robin from each devices SYSTEM and TT domain.
>>
>>        v2: reorder num_pages access reported by Dan's script
>>        v3: fix rebase fallout, num_pages should be 32bit
>>
>>        Signed-off-by: Christian König <christian.koenig@amd.com>
>>        Tested-by: Nirmoy Das <nirmoy.das@amd.com>
>>        Reviewed-by: Huang Rui <ray.huang@amd.com>
>>        Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>        Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F424009%2F&amp;data=04%7C01%7CXinhui.Pan%40amd.com%7Cb4422d8b3e4947cd243c08d91aad14c3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637570152942496679%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=K3%2FnFpN56y8L49UuYRM6SqefVFLnqIwpDAtWpS1XvnQ%3D&amp;reserved=0
>>
>> Regards,
>>      Felix
>>
>>
>> On 2021-05-18 10:28 p.m., xinhui pan wrote:
>>> cpu 1                                           cpu 2
>>> kfd alloc BO A(userptr)                         alloc BO B(GTT)
>>>        ->init -> validate                               -> init -> validate -> populate
>>>        init_user_pages                            -> swapout BO A //hit ttm pages limit
>>>         -> get_user_pages (fill up ttm->pages)
>>>          -> validate -> populate
>>>              -> swapin BO A // Now hit the BUG
>>>
>>> We know that get_user_pages may race with swapout on same BO.
>>> Threre are some issues I have met.
>>> 1) memory corruption.
>>> This is because we do a swap before memory is setup. ttm_tt_swapout()
>>> just create a swap_storage with its content being 0x0. So when we setup
>>> memory after the swapout. The following swapin makes the memory
>>> corrupted.
>>>
>>> 2) panic
>>> When swapout happes with get_user_pages, they touch ttm->pages without
>>> anylock. It causes memory corruption too. But I hit page fault mostly.
>>>
>>> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
>>> ---
>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 16 +++++++++++++++-
>>>     1 file changed, 15 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>> index 928e8d57cd08..42460e4480f8 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>> @@ -835,6 +835,7 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr)
>>>         struct amdkfd_process_info *process_info = mem->process_info;
>>>         struct amdgpu_bo *bo = mem->bo;
>>>         struct ttm_operation_ctx ctx = { true, false };
>>> +     struct page **pages;
>>>         int ret = 0;
>>>
>>>         mutex_lock(&process_info->lock);
>>> @@ -852,7 +853,13 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr)
>>>                 goto out;
>>>         }
>>>
>>> -     ret = amdgpu_ttm_tt_get_user_pages(bo, bo->tbo.ttm->pages);
>>> +     pages = kvmalloc_array(bo->tbo.ttm->num_pages,
>>> +                     sizeof(struct page *),
>>> +                     GFP_KERNEL | __GFP_ZERO);
>>> +     if (!pages)
>>> +             goto unregister_out;
>>> +
>>> +     ret = amdgpu_ttm_tt_get_user_pages(bo, pages);
>>>         if (ret) {
>>>                 pr_err("%s: Failed to get user pages: %d\n", __func__, ret);
>>>                 goto unregister_out;
>>> @@ -863,6 +870,12 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr)
>>>                 pr_err("%s: Failed to reserve BO\n", __func__);
>>>                 goto release_out;
>>>         }
>>> +
>>> +     WARN_ON_ONCE(bo->tbo.ttm->page_flags & TTM_PAGE_FLAG_SWAPPED);
>>> +
>>> +     memcpy(bo->tbo.ttm->pages,
>>> +                     pages,
>>> +                     sizeof(struct page*) * bo->tbo.ttm->num_pages);
>>>         amdgpu_bo_placement_from_domain(bo, mem->domain);
>>>         ret = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
>>>         if (ret)
>>> @@ -872,6 +885,7 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr)
>>>     release_out:
>>>         amdgpu_ttm_tt_get_user_pages_done(bo->tbo.ttm);
>>>     unregister_out:
>>> +     kvfree(pages);
>>>         if (ret)
>>>                 amdgpu_mn_unregister(bo);
>>>     out:
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7CXinhui.Pan%40amd.com%7Cb4422d8b3e4947cd243c08d91aad14c3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637570152942496679%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=QOuCH8r6DMdp%2Bvr6LAPhDw0BUCKPzK%2Bbv6MoHx4AmMo%3D&amp;reserved=0

