Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B42B495E11
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 12:01:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C630410EA00;
	Fri, 21 Jan 2022 11:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA53B10EA00
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 11:01:02 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 az27-20020a05600c601b00b0034d2956eb04so21460333wmb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 03:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=lLGSMeSTcWsRfSp17dIUaYIF6uHiKPgnKaoYj+UhetE=;
 b=Da5Q19RT9sKauGiAg5uihyv17alwbZ54wgYoty71gfOKsgSjcvl1QHE0j4h/QF3sSE
 LQdHA++y5BYhw2crsgOCTleptiWVqyIPKhQ67FssaZ/1omNhKwc82xeH6Wf/sxMQZvjw
 aZJ/hYUXAPRkLnb+dTyQbSOvyzJKWSrLUeFtpZeZqJmHe7yew+23KbEnRE19L+2LVxFK
 NYCgwz6eRJPUP3Hnz+DyqNlRKXjJ+G2H9MQOliWMo3D90paFHLfBltJX8UrYNERUKH8x
 tDTHsqQgQJem97kuDbPtDgtsyYstcE5VOZAlbHOl9Po1hd+vxtf/F5ZUJ2twkH/9c0On
 QGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=lLGSMeSTcWsRfSp17dIUaYIF6uHiKPgnKaoYj+UhetE=;
 b=Q0eFUaCBU4BtzUBQoJIbNYr+ruHq/ujkyKt8grIgnHQ4dJCP4hTvt78u9MwtLVvYiZ
 PoAKVVfyk2d7ezP+VUdhK3YQj6vyCtAASOgnFLmR1uo2jhimApbBiWR18RdJxPD7aAk8
 e7HdqsLqgiMFF8xc8JHgkPEqndoPU/yVR+GcP/i3XFO9/u1AqB+HiVBBBF/5wDowQbMq
 BhxqD8d2IGJjtlKRfQuh68qmgDphT8xAGgqpJEByiHHoBXb5XpX7JxSvAttKwezIiTAy
 gUj6XRvD/ckIiUVL6m8/YdGF9NTn3xp+wx0PEeIDL6sXJ3H5nig32ynGRDQYKCXO3ADH
 GDUQ==
X-Gm-Message-State: AOAM531VOreBWqekz04H8NQIfTXqju2unDiy5WZE0yHaeAuYohNnzAvY
 Kp0H5uhOWypnfplIfRdTP0U=
X-Google-Smtp-Source: ABdhPJz/O/FAYxlPiiHWdB2t6V7yRcg/qlKlC3RhCYLkPqf5aKGXjCIDlVZU18GNA+ObqNxaxYjeyw==
X-Received: by 2002:adf:f94e:: with SMTP id q14mr3328004wrr.526.1642762860852; 
 Fri, 21 Jan 2022 03:01:00 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:5ab7:6e01:32ef:2782?
 ([2a02:908:1252:fb60:5ab7:6e01:32ef:2782])
 by smtp.gmail.com with ESMTPSA id y15sm2413366wry.36.2022.01.21.03.00.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 03:01:00 -0800 (PST)
Subject: Re: [Linaro-mm-sig] [PATCH 2/9] dma-buf: warn about dma_fence_array
 container rules
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 sumit.semwal@linaro.org, gustavo@padovan.org, daniel.vetter@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20220120132747.2348-1-christian.koenig@amd.com>
 <20220120132747.2348-3-christian.koenig@amd.com>
 <be78e61c-992c-4fa6-7a2b-b9b93310a34d@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <532d9358-f5b2-73fb-5931-f14b2c264169@gmail.com>
Date: Fri, 21 Jan 2022 12:00:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <be78e61c-992c-4fa6-7a2b-b9b93310a34d@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 21.01.22 um 08:31 schrieb Thomas Hellström:
>
> On 1/20/22 14:27, Christian König wrote:
>> It's not allowed to nest another dma_fence container into a 
>> dma_fence_array
>> or otherwise we can run into recursion.
>>
>> Warn about that when we create a dma_fence_array.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> ---
>>   drivers/dma-buf/dma-fence-array.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/dma-buf/dma-fence-array.c 
>> b/drivers/dma-buf/dma-fence-array.c
>> index 3e07f961e2f3..4bfbcb885bbc 100644
>> --- a/drivers/dma-buf/dma-fence-array.c
>> +++ b/drivers/dma-buf/dma-fence-array.c
>> @@ -176,6 +176,19 @@ struct dma_fence_array 
>> *dma_fence_array_create(int num_fences,
>>         array->base.error = PENDING_ERROR;
>>   +    /* dma_fence_array objects should never contain any other fence
> Nit: First comment line of multi-line comments shouldn't contain text.
>> +     * containers or otherwise we run into recursion and potential 
>> kernel
>> +     * stack overflow on operations on the dma_fence_array.
>> +     *
>> +     * The correct way of handling this is to flatten out the array 
>> by the
>> +     * caller instead.
>> +     *
>> +     * Enforce this here by checking that we don't create a 
>> dma_fence_array
>> +     * with any container inside.
>> +     */
>> +    while (seqno--)
>> +        WARN_ON(dma_fence_is_container(fences[seqno]));
>> +
>
> s/seqno/num_fences/g ?

Ah, of course! Typing to fast.

Thanks,
Christian.

>
> Thanks,
>
> Thomas
>
>
>
>>       return array;
>>   }
>>   EXPORT_SYMBOL(dma_fence_array_create);
>

