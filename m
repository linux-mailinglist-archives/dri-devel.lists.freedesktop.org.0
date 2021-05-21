Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 818B838CCFC
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 20:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81DF56E7DA;
	Fri, 21 May 2021 18:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAA06E7DA
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 18:11:36 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id k14so28305612eji.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 11:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=yoXCvEAzVT9yjqx8OljpzDvqRPSlMZsAy5yE/eRDuaE=;
 b=TkYGb4Y6vFlpegLRs/uH8MY5FPxwX1g57o1HWEPjtcXpaaiI/WRrb7hjSubd27ZFYM
 e1cCHvzqmss9ADvBDv7rlDUSpCcBMFI/1oaXWtP4X97uIy2L7dQ526N/EbOSiNrxsu1D
 zbPInj+Fb+JR36KFHMV7XITn/W1Mjh6A0b2XzQMvIe5nNQt0Bypi7PJelV3jKI9jRQu3
 M7Fhxdgt3WDR7PWNgc5joXO92Ofox2HUqGoxiShnhNaePMWTwoiawycE3wk6CTxZlFkx
 5FPGgG7t8IcUm65nkAZ+6snPuql2IKs9TIASMtVPAsxqaMiToCAhdYoSXWG9iouArJ1q
 MH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=yoXCvEAzVT9yjqx8OljpzDvqRPSlMZsAy5yE/eRDuaE=;
 b=bwKdkGJ4XlIC8W0OE1GdT8ZoXer6JxwWIdwEAE2NKRTDeJZqCW2m76OZjZA/BpeF+P
 BQipw9g50h+aJbsmf7B/pzcQEnIdLJnaqv7JKkWBNwa2VSmHwhyKBSA6xBtryQ3qIHSS
 7bz/AF+eFBicF/Cye0qUEsLzRQJOGDLibfd1tz/FoC8qMWCA3eFGr+U99l9S4i2R4Suw
 QMQwWzqxwe/1b9tqz2AzueC9yFcuCAVgSVB0EzHRQ4MnxlRTzpn2ve4Sl1gH4Ws3+0KI
 bIavsPtP5x/zjtXwdFmCBF+UMYSlqLJYRkhnfeI46K/VBl17p9aZc7TD6A/PcKgzTW/y
 j+mA==
X-Gm-Message-State: AOAM533fYWez8tdw+6xLD7xagyZoEZbi5qhR3kpbfzJryLUYY4OhejQ1
 wMCvX6Acdc34TAXEzFmRo90ZnaN4xss=
X-Google-Smtp-Source: ABdhPJxxPmhneRTPypVxna1lwSXhZiPTvUZSVU0meSG97nGmZa1qFVRr8Mm/sWeps5bAjUb1jVs1Og==
X-Received: by 2002:a17:906:b2c1:: with SMTP id
 cf1mr11315192ejb.544.1621620695321; 
 Fri, 21 May 2021 11:11:35 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:8496:ee5:88c2:a2c4?
 ([2a02:908:1252:fb60:8496:ee5:88c2:a2c4])
 by smtp.gmail.com with ESMTPSA id m10sm4492671edp.48.2021.05.21.11.11.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 11:11:34 -0700 (PDT)
Subject: Re: [PATCH 1/4] dma-buf: add dma_fence_array_for_each (v2)
To: Jason Ekstrand <jason@jlekstrand.net>
References: <20210520190007.534046-1-jason@jlekstrand.net>
 <20210520190007.534046-2-jason@jlekstrand.net>
 <5698cfc1-471b-5e13-bf3f-1c7025dc9a2c@gmail.com>
 <CAOFGe95V8wnR4AqoQm1s+1y8Mv-+RzmYS1fMf_d=aUek3TGK5g@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <938e7c1f-6bc5-4429-bebc-803b8fbd421a@gmail.com>
Date: Fri, 21 May 2021 20:11:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAOFGe95V8wnR4AqoQm1s+1y8Mv-+RzmYS1fMf_d=aUek3TGK5g@mail.gmail.com>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.05.21 um 18:27 schrieb Jason Ekstrand:
> On Fri, May 21, 2021 at 2:51 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 20.05.21 um 21:00 schrieb Jason Ekstrand:
>>> From: Christian König <ckoenig.leichtzumerken@gmail.com>
>>>
>>> Add a helper to iterate over all fences in a dma_fence_array object.
>>>
>>> v2 (Jason Ekstrand)
>>>    - Return NULL from dma_fence_array_first if head == NULL.  This matches
>>>      the iterator behavior of dma_fence_chain_for_each in that it iterates
>>>      zero times if head == NULL.
>>>    - Return NULL from dma_fence_array_next if index > array->num_fences.
>>>
>>> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> BTW: I'm only seeing this patch from the series. Looks like somehow the
>> rest didn't made it into my inbox.
> https://lists.freedesktop.org/archives/dri-devel/2021-May/307561.html
>
> Not sure why it didn't make your mail.  This one was CC'd to you
> because you're the author from a year ago or something.

Yeah, feel free to add an Acked-by on exporting the fences to the 
sync_file part.

But I think we really need to untangle the resource management from the 
implicit sync handling before the importing fence part can land.

Regards,
Christian.

>
> --Jason
>
>
>>> ---
>>>    drivers/dma-buf/dma-fence-array.c | 27 +++++++++++++++++++++++++++
>>>    include/linux/dma-fence-array.h   | 17 +++++++++++++++++
>>>    2 files changed, 44 insertions(+)
>>>
>>> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
>>> index d3fbd950be944..2ac1afc697d0f 100644
>>> --- a/drivers/dma-buf/dma-fence-array.c
>>> +++ b/drivers/dma-buf/dma-fence-array.c
>>> @@ -201,3 +201,30 @@ bool dma_fence_match_context(struct dma_fence *fence, u64 context)
>>>        return true;
>>>    }
>>>    EXPORT_SYMBOL(dma_fence_match_context);
>>> +
>>> +struct dma_fence *dma_fence_array_first(struct dma_fence *head)
>>> +{
>>> +     struct dma_fence_array *array;
>>> +
>>> +     if (!head)
>>> +             return NULL;
>>> +
>>> +     array = to_dma_fence_array(head);
>>> +     if (!array)
>>> +             return head;
>>> +
>>> +     return array->fences[0];
>>> +}
>>> +EXPORT_SYMBOL(dma_fence_array_first);
>>> +
>>> +struct dma_fence *dma_fence_array_next(struct dma_fence *head,
>>> +                                    unsigned int index)
>>> +{
>>> +     struct dma_fence_array *array = to_dma_fence_array(head);
>>> +
>>> +     if (!array || index >= array->num_fences)
>>> +             return NULL;
>>> +
>>> +     return array->fences[index];
>>> +}
>>> +EXPORT_SYMBOL(dma_fence_array_next);
>>> diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
>>> index 303dd712220fd..588ac8089dd61 100644
>>> --- a/include/linux/dma-fence-array.h
>>> +++ b/include/linux/dma-fence-array.h
>>> @@ -74,6 +74,19 @@ to_dma_fence_array(struct dma_fence *fence)
>>>        return container_of(fence, struct dma_fence_array, base);
>>>    }
>>>
>>> +/**
>>> + * dma_fence_array_for_each - iterate over all fences in array
>>> + * @fence: current fence
>>> + * @index: index into the array
>>> + * @head: potential dma_fence_array object
>>> + *
>>> + * Test if @array is a dma_fence_array object and if yes iterate over all fences
>>> + * in the array. If not just iterate over the fence in @array itself.
>>> + */
>>> +#define dma_fence_array_for_each(fence, index, head)                 \
>>> +     for (index = 0, fence = dma_fence_array_first(head); fence;     \
>>> +          ++(index), fence = dma_fence_array_next(head, index))
>>> +
>>>    struct dma_fence_array *dma_fence_array_create(int num_fences,
>>>                                               struct dma_fence **fences,
>>>                                               u64 context, unsigned seqno,
>>> @@ -81,4 +94,8 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
>>>
>>>    bool dma_fence_match_context(struct dma_fence *fence, u64 context);
>>>
>>> +struct dma_fence *dma_fence_array_first(struct dma_fence *head);
>>> +struct dma_fence *dma_fence_array_next(struct dma_fence *head,
>>> +                                    unsigned int index);
>>> +
>>>    #endif /* __LINUX_DMA_FENCE_ARRAY_H */

