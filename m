Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D718426FC
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 15:32:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1F610FA2F;
	Tue, 30 Jan 2024 14:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C8110FA2F;
 Tue, 30 Jan 2024 14:32:51 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-40e80046246so22263615e9.1; 
 Tue, 30 Jan 2024 06:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706625109; x=1707229909; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g8VsAPUOaE4aY1SJPZwDoTZsIGhIdKyw4msywfQX4Vs=;
 b=TTaBOQLioAQVtRgGT9xk67fTpFiPqb6+XlCtx8aw1Tekgsz0MDLNeqStrBCySsUz7n
 6ibILEqcNPeFjIYe1IFiKcMMbvRbr97wA1GelFvGlhZQnJUK9KpcYHLNlkdcXoOoYdJU
 Vwekm7m+QUezDZJ3Y5NhbKKfBxAaaZTX/emFOwKkYYd8DPnhqGfvir8WMpL+rXw/z8TF
 av6TEM7RndM1wc/qL/snNUEYvpKWgOoe+TRKYLnmU7HSfP+X91ev4rw3ZTLhRVGvoPU0
 rDjnrgHthd1MpHhSPaJQltbOmolDfkIvvhsJuY8Z6ZdAsb/WszUN4+Av+a5vtf9Ro6fm
 iAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706625109; x=1707229909;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g8VsAPUOaE4aY1SJPZwDoTZsIGhIdKyw4msywfQX4Vs=;
 b=Titzb/vqavxByB/Jyowk3CTq3qS/qe/E9ljQ7sfQIljexZIwm/Dyk3a1GSrIGNETBn
 UAk1qVSfON2ze/xeLTyggW42ixxFeut8vZVNDWQSGikg5sLj2UziI2maEijdH7kNKnDH
 DWC6udmURKQ/ECHgH/BN3MWKaguQg0UFK/VEgc+1CuSklsFuqJnkC8vhPJC3vVXo4z/a
 caiE5FfMb6CLVezpr8k9kLEGbQ9Xaj/c7/EHhYLcNJcAUrdBPOZsshW8wC8EVZnmTExb
 zGShPVA7pijXx2eO5H31eSEgFCEPYl+kLUzwB7mMyhYd9g17f7MMLXJaYBqDbPHh581l
 OxpA==
X-Gm-Message-State: AOJu0YwMFrmFp8jtcuoxLr2PLBzvyfL4MFoWb+PWE4CcNu/yuXI7Vf94
 VScL85Uaz2LRXnXzTPsD3RckmiwoMoi11bUe7WXlwzGW7lGmgyQq
X-Google-Smtp-Source: AGHT+IFSVEql0wdjFMo3TZnj5gyGnyuX7yO7FN0iD40DI9+SaUdKAvwNEcHiMlatvS7FXCH7T1CILA==
X-Received: by 2002:a05:600c:3516:b0:40f:25be:e811 with SMTP id
 h22-20020a05600c351600b0040f25bee811mr1449732wmq.8.1706625109310; 
 Tue, 30 Jan 2024 06:31:49 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXENqPmJ2/FGsX1qxdEV034CeiLP93ivNmQ7ALLtRZgwyXmgFLAF+x5njCd8Zk0Z7ZCisvwtrTDc9HjQ92iY+mZK103zDonL04xXxFh+QPRmEP+Ii6K5/Vej4aZJxoCt4VSvwoKShYlhuvHVcBZCOxde/m5B3U8NB71iXIxLEFQGBAZ5gD+JE/TsO7RdzD4x0KNIeOBykNOaxBlcfJx
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 bd25-20020a05600c1f1900b0040ee0abd8f1sm12634652wmb.21.2024.01.30.06.31.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 06:31:48 -0800 (PST)
Message-ID: <26bde5f6-62a5-494c-b59f-b330eb85f4bb@gmail.com>
Date: Tue, 30 Jan 2024 15:31:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix a build error
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oak Zeng <oak.zeng@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20240127155327.423294-1-oak.zeng@intel.com>
 <21f2b595-0690-4372-bd81-86d23ac7498b@gmail.com>
 <0d1e2c15-c951-4c97-b242-a1231ae4f608@linux.intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <0d1e2c15-c951-4c97-b242-a1231ae4f608@linux.intel.com>
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
Cc: Amaranath.Somalapuram@amd.com, lucas.demarchi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.01.24 um 21:25 schrieb Thomas Hellström:
> Hi,
>
> On 1/29/24 17:48, Christian König wrote:
>> Am 27.01.24 um 16:53 schrieb Oak Zeng:
>>> This fixes a build failure on drm-tip. This issue was introduced during
>>> merge of "drm/ttm: replace busy placement with flags v6". For some
>>> reason, the xe_bo.c part of above change is not merged. Manually merge
>>> the missing part to drm_tip
>>
>> Mhm, I provided this as manual fixup for drm-tip in this rerere commit:
>>
>> commit afc5797e8c03bed3ec47a34f2bc3cf03fce24411
>> Author: Christian König <christian.koenig@amd.com>
>> Date:   Thu Jan 25 10:44:54 2024 +0100
>>
>>     2024y-01m-25d-09h-44m-07s UTC: drm-tip rerere cache update
>>
>>     git version 2.34.1
>>
>>
>> And for me compiling xe in drm-tip worked fine after that. No idea 
>> why that didn't work for you.
>>
>> Anyway feel free to add my rb to this patch here if it helps in any way.
>>
>> Regards,
>> Christian.
>
> I reverted that rerere cache update and added another one, so now it 
> works. Not sure exactly what the difference was, but the resulting 
> patch was for the drm-misc-next merge in my case, and It was for 
> drm-xe-something in your case.

Yeah, I've noticed that this was applied to the drm-xe-something branch 
as well. That's why I reverted and re-applied the patch but dim still 
ended up applying it to drm-xe-something instead of drm-misc-next so I 
thought that this was intentional.

It would be rather nice if somebody can tell me what the heck went wrong 
here so that I don't repeat this mistake.

Thanks,
Christian.

>
> /Thomas
>
>
>>
>>>
>>> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_bo.c | 33 +++++++++++++++------------------
>>>   1 file changed, 15 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index 686d716c5581..d6a193060cc0 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -38,22 +38,26 @@ static const struct ttm_place 
>>> sys_placement_flags = {
>>>   static struct ttm_placement sys_placement = {
>>>       .num_placement = 1,
>>>       .placement = &sys_placement_flags,
>>> -    .num_busy_placement = 1,
>>> -    .busy_placement = &sys_placement_flags,
>>>   };
>>>   -static const struct ttm_place tt_placement_flags = {
>>> -    .fpfn = 0,
>>> -    .lpfn = 0,
>>> -    .mem_type = XE_PL_TT,
>>> -    .flags = 0,
>>> +static const struct ttm_place tt_placement_flags[] = {
>>> +    {
>>> +        .fpfn = 0,
>>> +        .lpfn = 0,
>>> +        .mem_type = XE_PL_TT,
>>> +        .flags = TTM_PL_FLAG_DESIRED,
>>> +    },
>>> +    {
>>> +        .fpfn = 0,
>>> +        .lpfn = 0,
>>> +        .mem_type = XE_PL_SYSTEM,
>>> +        .flags = TTM_PL_FLAG_FALLBACK,
>>> +    }
>>>   };
>>>     static struct ttm_placement tt_placement = {
>>> -    .num_placement = 1,
>>> -    .placement = &tt_placement_flags,
>>> -    .num_busy_placement = 1,
>>> -    .busy_placement = &sys_placement_flags,
>>> +    .num_placement = 2,
>>> +    .placement = tt_placement_flags,
>>>   };
>>>     bool mem_type_is_vram(u32 mem_type)
>>> @@ -230,8 +234,6 @@ static int __xe_bo_placement_for_flags(struct 
>>> xe_device *xe, struct xe_bo *bo,
>>>       bo->placement = (struct ttm_placement) {
>>>           .num_placement = c,
>>>           .placement = bo->placements,
>>> -        .num_busy_placement = c,
>>> -        .busy_placement = bo->placements,
>>>       };
>>>         return 0;
>>> @@ -251,7 +253,6 @@ static void xe_evict_flags(struct 
>>> ttm_buffer_object *tbo,
>>>           /* Don't handle scatter gather BOs */
>>>           if (tbo->type == ttm_bo_type_sg) {
>>>               placement->num_placement = 0;
>>> -            placement->num_busy_placement = 0;
>>>               return;
>>>           }
>>>   @@ -1391,8 +1392,6 @@ static int __xe_bo_fixed_placement(struct 
>>> xe_device *xe,
>>>       bo->placement = (struct ttm_placement) {
>>>           .num_placement = 1,
>>>           .placement = place,
>>> -        .num_busy_placement = 1,
>>> -        .busy_placement = place,
>>>       };
>>>         return 0;
>>> @@ -2150,9 +2149,7 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
>>>         xe_place_from_ttm_type(mem_type, &requested);
>>>       placement.num_placement = 1;
>>> -    placement.num_busy_placement = 1;
>>>       placement.placement = &requested;
>>> -    placement.busy_placement = &requested;
>>>         /*
>>>        * Stolen needs to be handled like below VRAM handling if we 
>>> ever need
>>

