Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C0048AC70
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 12:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1927113635;
	Tue, 11 Jan 2022 11:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD1B113635;
 Tue, 11 Jan 2022 11:27:21 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id o3so32313980wrh.10;
 Tue, 11 Jan 2022 03:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=wzSIvmK0FC7GKp/cmS9osW+9w8pDjkPKnFbNuusa8zc=;
 b=o5n+iPCxXrG5UbrpvjBW6ksPyDQjoKNXdd72IPUJnnWR80oArksh8CcSos7cjf7xoK
 0EGMS4122inRXTjtZAHBEOokhfQMzriMC0m20tbs3BWiSPZqzqz3Ooomyx7YSM+KgbyR
 f4gwdK4UIvbW/MF3ZDRSLnkjQPrM6eeJVBfBHjpphkbr09wzEw0OpjBqSK5L0vUz8qZw
 1tKbIV3leSjaMOQf8hlFJAiy6mru/knC8P5d8p2uDHj5F6BjVyDQlCrsUh2P/PWVrobT
 OSqcuiKzF8/I8ZinapNvMrN77XYLvE0Lh1K8a1evCWAOxB8qoQPrNAgEtXxXwM8LvFYR
 7iUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=wzSIvmK0FC7GKp/cmS9osW+9w8pDjkPKnFbNuusa8zc=;
 b=2TL0BBvWurtDq8XJ9wdz1ArRaPHl54akDbNfzdqw4WJo2JJO9zWAcwDpLgA5qKDKfq
 PVORQeJTbMgCWsKNdYfRhJZVtnPcSd7F6e9QpmIiZMXz8ea+DJaGGQW8r0wSed8ZDGPS
 sY9QitgovppTUqx6RBt/T8HgWwNV/Sz//ts3rhjz7t3wthQ/G3BPZ76BLkTr0eGasVG2
 SRcKsdolHS3eGm/oU23diX2lc/QuDkfiF5dBex2Z2KJvobMg1XfgebDUQuz8cWG4D7fl
 ZG/qDI3ppr/o6U+F8Z+ZO5qH3KKq7CVGPNy/P1mVxICitti0g0atP50URrwuWjrK1+u1
 LQmg==
X-Gm-Message-State: AOAM532rB3fb6w8julO+pz2yO7x3ej/8huihByKG3C8GXS1wps+zigv0
 SYaw78fWNX65zvfZc1EhPtfE6f+4chw=
X-Google-Smtp-Source: ABdhPJxAMn+RU3FYYyNaDOgzflxccEZip70wd3y3/om7P7zQuGMeLcXyVFqcfGRQS0BDGIdrrSkJrg==
X-Received: by 2002:adf:fc0e:: with SMTP id i14mr3282401wrr.119.1641900440413; 
 Tue, 11 Jan 2022 03:27:20 -0800 (PST)
Received: from [192.168.178.21] (p57b0bff8.dip0.t-ipconnect.de.
 [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id z17sm6257174wrr.4.2022.01.11.03.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 03:27:19 -0800 (PST)
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW1BBVENIXSBkcm0vdHRtOiBQdXQgQk8gaW4gaXRz?=
 =?UTF-8?Q?_memory_manager=27s_lru_list?=
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, 
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20211109111954.41968-1-xinhui.pan@amd.com>
 <da46c607-1a3c-7ea9-92ef-78a2b60d38c9@amd.com>
 <DM4PR12MB51653AB0F1A0B89A41782B1087929@DM4PR12MB5165.namprd12.prod.outlook.com>
 <76d78ff7-efe4-4796-ec18-a668757f2e04@amd.com>
 <DM4PR12MB51657C53FAA6C096884118AD87929@DM4PR12MB5165.namprd12.prod.outlook.com>
 <DM4PR12MB51658A8C75586BCC2B0BDA6487929@DM4PR12MB5165.namprd12.prod.outlook.com>
 <DM5PR12MB246972E69DADF83D83FD9C73F1519@DM5PR12MB2469.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <04b252b5-b04c-a5a7-23ec-adc10024d317@gmail.com>
Date: Tue, 11 Jan 2022 12:27:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <DM5PR12MB246972E69DADF83D83FD9C73F1519@DM5PR12MB2469.namprd12.prod.outlook.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

IIRC we have completely dropped this patch in favor of a check at a 
different place.

Regards,
Christian.

Am 11.01.22 um 09:47 schrieb Chen, Guchun:
> [Public]
>
> Hi Christian,
>
> Looks this patch still missed in 5.16 kernel. Is it intentional?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/ttm/ttm_bo.c?h=v5.16
>
> Regards,
> Guchun
>
> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Pan, Xinhui
> Sent: Tuesday, November 9, 2021 9:16 PM
> To: Koenig, Christian <Christian.Koenig@amd.com>; amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Subject: 回复: 回复: [PATCH] drm/ttm: Put BO in its memory manager's lru list
>
> [AMD Official Use Only]
>
> [AMD Official Use Only]
>
> Actually this patch does not totally fix the mismatch of lru list with mem_type as mem_type is changed in ->move() and lru list is changed after that.
>
> During this small period, another eviction could still happed and evict this mismatched BO from sMam(say, its lru list is on vram domain) to sMem.
> ________________________________________
> 发件人: Pan, Xinhui <Xinhui.Pan@amd.com>
> 发送时间: 2021年11月9日 21:05
> 收件人: Koenig, Christian; amd-gfx@lists.freedesktop.org
> 抄送: dri-devel@lists.freedesktop.org
> 主题: 回复: 回复: [PATCH] drm/ttm: Put BO in its memory manager's lru list
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
> Not moving the BO would make things less efficient, but should never cause a crash.
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
>>> After we move BO to a new memory region, we should put it to the new
>>> memory manager's lru list regardless we unlock the resv or not.
>>>
>>> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
>> Interesting find, did you trigger that somehow or did you just
>> stumbled over it by reading the code?
>>
>> Patch is Reviewed-by: Christian König <christian.koenig@amd.com>, I
>> will pick that up for drm-misc-next.
>>
>> Thanks,
>> Christian.
>>
>>> ---
>>>     drivers/gpu/drm/ttm/ttm_bo.c | 2 ++
>>>     1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>>> b/drivers/gpu/drm/ttm/ttm_bo.c index f1367107925b..e307004f0b28
>>> 100644
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

