Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD795AD12B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 13:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA0210E2FB;
	Mon,  5 Sep 2022 11:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7739E10E250;
 Mon,  5 Sep 2022 11:06:04 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id p16so16324415ejb.9;
 Mon, 05 Sep 2022 04:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=t6Kz0eQbLFf77qZLFmO+CDjlkZRTbzkdz9LiCWjVrVA=;
 b=VXucMFhmWUvXh7lMmxWwsxDBkbMJQvZwn5aEISGRa09piYGkzj5O+FLVFnvx38LewB
 d0X+q0FyCS1OsRU829wsQiskcLvO3EQeLPBUCLswHzhipiSKGN7nzqn7qY4i4DqwdfW4
 /nmmqkuhogdLATpHuEcJ0ftHcksK/AT1M6e4dJA+4js2LKHHtd5xP62qWul8EOMfNglJ
 INXePsJDRMowD0xRVpQOQaU19ia6BI/xwV35Q3k12D/NKVyjD130EsdZmf+bCe04vp7P
 kCnyzKXQILA7pKyw7NEdsDSbPB4WntXKjRJkW0XDkmVdzxqzaqGgVDdpSYPXUdKAEf6h
 2zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=t6Kz0eQbLFf77qZLFmO+CDjlkZRTbzkdz9LiCWjVrVA=;
 b=ZgJGqYspiunn63AJcfyfMvP1i5kZPDfK7pcA+oN+/vzIBDORTcRt1zGlMZHz+k0n21
 2eYYUKmBdhqvzmi9EHTgj7iTA57csh73TaEM56Gnsi73lper3YInxzqdEESc9YaQM6mn
 ZKeSujUeDh0HkYB/4ZWprDN4IMYY47CMm7+ZsyvTdWE0bz+NFJnI44RfxP49U3XowY89
 FeK5UxsKsC5w+522pkihp9xq/hOd9ewiBf/Wqt8w0rExaLlZEtEQS1NV3zF8Xw+hY4Te
 O79RHGKtwe3PvlT98i5XMxMu5ORwsK7Qt5iEKLlD/Qdo+gl2qOKgOyGM7lFKbk8nDX4R
 jdsw==
X-Gm-Message-State: ACgBeo0DRRUFDBykMO7YGLAl6cZ7DusvLUQqIUPsqRO/8VTq1IYBn1vR
 wUnM+VfVOYh6gpEH1hkiAGE=
X-Google-Smtp-Source: AA6agR6le56GVVARBpvwCYDzLIAANysZF6VG4g3JzajOQu+r+vXwS0h9BvrLoINcXIbsPCSyHjA5ug==
X-Received: by 2002:a17:907:2d2b:b0:731:2179:5ba with SMTP id
 gs43-20020a1709072d2b00b00731217905bamr37416889ejc.207.1662375962921; 
 Mon, 05 Sep 2022 04:06:02 -0700 (PDT)
Received: from [192.168.178.21] (p4fc20f4e.dip0.t-ipconnect.de. [79.194.15.78])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a17090607c100b0072ed9efc9dfsm4959898ejc.48.2022.09.05.04.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 04:06:01 -0700 (PDT)
Message-ID: <8067007d-fc16-f038-cae2-e445a7748824@gmail.com>
Date: Mon, 5 Sep 2022 13:05:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/ttm: update bulk move object of ghost BO
Content-Language: en-US
To: "Yin, ZhenGuo (Chris)" <zhengyin@amd.com>,
 ZhenGuo Yin <zhenguo.yin@amd.com>, amd-gfx@lists.freedesktop.org
References: <20220901092946.2030744-1-zhenguo.yin@amd.com>
 <df602f9a-d55e-e034-febd-ac15d76cfa28@gmail.com>
 <e42b6dac-de91-249c-4ccd-a379e209d6b0@gmail.com>
 <d769ba2c-c796-6544-91c3-936037b3d82b@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <d769ba2c-c796-6544-91c3-936037b3d82b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: jingwen.chen2@amd.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yeah, I realized that as well after sending the first mail.

The problem is that we keep the bulk move around when there currently 
isn't any resource associated with the template.

So the correct code should look something like this:

if (fbo->base.resource) {
     ttm_resource_set_bo(fbo->base.resource, &fbo->base);
     bo->resource = NULL;
     ttm_bo_set_bulk_move(&fbo->base, NULL);
} else {
     fbo->bulk_move = NULL;
}

Regards,
Christian.

Am 05.09.22 um 09:59 schrieb Yin, ZhenGuo (Chris):
> Inside the function ttm_bo_set_bulk_move, it calls 
> ttm_resource_del_bulk_move to remove the old resource from the 
> bulk_move list.
>
> If we set the bulk_move to NULL manually as suggested, the old 
> resource attached in the ghost BO seems won't be removed from the 
> bulk_move.
>
> On 9/1/2022 7:13 PM, Christian König wrote:
>> Am 01.09.22 um 13:11 schrieb Christian König:
>>> Am 01.09.22 um 11:29 schrieb ZhenGuo Yin:
>>>> [Why]
>>>> Ghost BO is released with non-empty bulk move object. There is a
>>>> warning trace:
>>>> WARNING: CPU: 19 PID: 1582 at ttm/ttm_bo.c:366 
>>>> ttm_bo_release+0x2e1/0x2f0 [amdttm]
>>>> Call Trace:
>>>>    amddma_resv_reserve_fences+0x10d/0x1f0 [amdkcl]
>>>>    amdttm_bo_put+0x28/0x30 [amdttm]
>>>>    amdttm_bo_move_accel_cleanup+0x126/0x200 [amdttm]
>>>>    amdgpu_bo_move+0x1a8/0x770 [amdgpu]
>>>>    ttm_bo_handle_move_mem+0xb0/0x140 [amdttm]
>>>>    amdttm_bo_validate+0xbf/0x100 [amdttm]
>>>>
>>>> [How]
>>>> The resource of ghost BO should be moved to LRU directly, instead of
>>>> using bulk move. The bulk move object of ghost BO should set to NULL
>>>> before function ttm_bo_move_to_lru_tail_unlocked.
>>>>
>>>> Fixed:·5b951e487fd6bf5f·("drm/ttm:·fix·bulk·move·handling·v2")
>>>> Signed-off-by: ZhenGuo Yin <zhenguo.yin@amd.com>
>>>
>>> Good catch, but the fix is not 100% correct. Please rather just NULL 
>>> the member while initializing the BO structure.
>>>
>>> E.g. something like this:
>>>
>>>  ....
>>>  fbo->base.pin_count = 0;
>>> +fbo->base.bulk_move= NULL;
>>>  if (bo->type != ttm_bo_type_sg)
>>>  ....
>>
>> On the other hand thinking about it that won't work either.
>>
>> You need to set bulk_move to NULL manually in an else clauses or 
>> something like this.
>>
>> Regards,
>> Christian.
>>
>>>
>>> Thanks,
>>> Christian.
>>>
>>>> ---
>>>>   drivers/gpu/drm/ttm/ttm_bo_util.c | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c 
>>>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>> index 1cbfb00c1d65..a90bbbd91910 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>> @@ -238,6 +238,7 @@ static int ttm_buffer_object_transfer(struct 
>>>> ttm_buffer_object *bo,
>>>>         if (fbo->base.resource) {
>>>>           ttm_resource_set_bo(fbo->base.resource, &fbo->base);
>>>> +        ttm_bo_set_bulk_move(&fbo->base, NULL);
>>>>           bo->resource = NULL;
>>>>       }
>>>
>>

