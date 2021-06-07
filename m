Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD3C39DCB5
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 14:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61476E15C;
	Mon,  7 Jun 2021 12:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435EF6E09E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 12:41:52 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id a20so17498695wrc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 05:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=KZreFnyKWWKFIVuVeLdyEaYInAbGIHiNJWehJloSWIs=;
 b=d/3P5HFEKJhY8cLMm/9L5S6gEkSrdu5+L9RMd5Z+Vp33hcxizOF2ODSNHYsaHywdqR
 8cu4RCD+7XFvDha0ICnYRrd/cAGlF6exU/i2l2Z2RXiZc/o41De9IDGXp9mUkQhReIqq
 s4TYrSQ1KOkGLvv64AbFLd+M7arwVi1lBHZ32rIWe2b2ez88KDxH8TuTjkU0wbrmzzi6
 aoxzdE549ZmqboKDyXIUl7AouUFCmSYml2w5koGOaqxnkIczNnlRodl3T9gEW3hD0596
 K1JSwVOtV7ZL64lhTNiZ7F0+5UFcJG0qCMNKHIvMf+DLVdV2I1lDnZHmDiflxD7AoW3e
 Ui7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=KZreFnyKWWKFIVuVeLdyEaYInAbGIHiNJWehJloSWIs=;
 b=W7agrdCuBNLm3xeEMkIchY0HmWJmSePmzQo41DAD7Im0UO8lQMUUd0g7FMSy2B2g04
 PdNzmGfC9a/2mm/n6BqhuD1IcJLaMWHW+O0D8kc2M4VW+6HcZIAbn8jd6MxMxsGhNri6
 3pnDZ/kiYnq7HYSvnlK1lRh7LGOXiFLPXmeLu61AusDy4b8Fs4t7c/JurVVqETuuBHP5
 Yud8OaLNoSKTGeS2bwnAMhUMv0zfyi9pKRsY37o/OHT+KbUgBFS8bbn0XwSXDHKa99zs
 o0cafJpSxjqYWifVPW0DiQeiUSHnSjAgK5synlcnwe7N8e1RMp5yPK1nbmtxYXQjjiOH
 weAA==
X-Gm-Message-State: AOAM530m7NexoWe+GR1v3/CaaMt5Q2kLl2Z+Q1FQB27SdDtMbHqeN1hp
 RyUsGiM+vWVrRSt9PNsRm4r74OSy6RE=
X-Google-Smtp-Source: ABdhPJw+uQvr5eMo6gcPETIAz8PGLMBTOebBpWRv8ePzI3Rry5+CyLv4SxkXeUQGE0d26OellVX4hg==
X-Received: by 2002:a5d:4890:: with SMTP id g16mr17107750wrq.353.1623069710993; 
 Mon, 07 Jun 2021 05:41:50 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:ce67:4e4d:875d:ffeb?
 ([2a02:908:1252:fb60:ce67:4e4d:875d:ffeb])
 by smtp.gmail.com with ESMTPSA id a123sm18307793wmd.2.2021.06.07.05.41.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 05:41:50 -0700 (PDT)
Subject: Re: [PATCH 1/4] drm/ttm: add TTM_PL_FLAG_TEMPORARY flag v3
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Lang.Yu@amd.com
References: <20210601122528.1643-1-christian.koenig@amd.com>
 <0051cab9-8d65-d28f-956e-3a60718bf000@gmail.com>
 <0fc2844d-b954-2386-17e3-e2c4232fc247@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f067ec3f-ae6c-fb9d-d87b-e31311bf3cf3@gmail.com>
Date: Mon, 7 Jun 2021 14:41:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <0fc2844d-b954-2386-17e3-e2c4232fc247@shipmail.org>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks!

Lang can anybody from your team give as an reviewed-by/test-by on the 
amdgpu patches? I just want another pair of eyes looking over it.

If nobody else has time I will ask Nirmoy for a quick testing round.

Thanks,
Christian.

Am 07.06.21 um 14:38 schrieb Thomas Hellström (Intel):
> Sure. LGTM,
>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>
>
> On 6/7/21 2:36 PM, Christian König wrote:
>> Thomas any comments on this?
>>
>> Is the purpose of this now clear enough?
>>
>> Thanks,
>> Christian.
>>
>> Am 01.06.21 um 14:25 schrieb Christian König:
>>> From: Lang Yu <Lang.Yu@amd.com>
>>>
>>> Sometimes drivers need to use bounce buffers to evict BOs. While 
>>> those reside
>>> in some domain they are not necessarily suitable for CS.
>>>
>>> Add a flag so that drivers can note that a bounce buffers needs to be
>>> reallocated during validation.
>>>
>>> v2: add detailed comments
>>> v3 (chk): merge commits and rework commit message
>>>
>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Lang Yu <Lang.Yu@amd.com>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/ttm/ttm_bo.c    | 3 +++
>>>   include/drm/ttm/ttm_placement.h | 7 +++++--
>>>   2 files changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c 
>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>> index 51a94fd63bd7..6b393502198e 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>> @@ -929,6 +929,9 @@ static bool ttm_bo_places_compat(const struct 
>>> ttm_place *places,
>>>   {
>>>       unsigned i;
>>>   +    if (mem->placement & TTM_PL_FLAG_TEMPORARY)
>>> +        return false;
>>> +
>>>       for (i = 0; i < num_placement; i++) {
>>>           const struct ttm_place *heap = &places[i];
>>>   diff --git a/include/drm/ttm/ttm_placement.h 
>>> b/include/drm/ttm/ttm_placement.h
>>> index aa6ba4d0cf78..8995c9e4ec1b 100644
>>> --- a/include/drm/ttm/ttm_placement.h
>>> +++ b/include/drm/ttm/ttm_placement.h
>>> @@ -47,8 +47,11 @@
>>>    * top of the memory area, instead of the bottom.
>>>    */
>>>   -#define TTM_PL_FLAG_CONTIGUOUS  (1 << 19)
>>> -#define TTM_PL_FLAG_TOPDOWN     (1 << 22)
>>> +#define TTM_PL_FLAG_CONTIGUOUS  (1 << 0)
>>> +#define TTM_PL_FLAG_TOPDOWN     (1 << 1)
>>> +
>>> +/* For multihop handling */
>>> +#define TTM_PL_FLAG_TEMPORARY   (1 << 2)
>>>     /**
>>>    * struct ttm_place

