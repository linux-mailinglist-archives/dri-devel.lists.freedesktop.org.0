Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 057173FECCA
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 13:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24656E4CD;
	Thu,  2 Sep 2021 11:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3EC6E4CD
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 11:18:19 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v10so2304845wrd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Sep 2021 04:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ZTiW4luCSMfWjbqhEJKygUhu82TdRH/NEECLCQ1wsrg=;
 b=XQD+7N51b/DELgFV2Nf1n9hwj1LsaDBVJhEh2yfvpslvWwohqXuukdG6Gyb6uSbRCD
 RkqQ7zQlel1Z8GCdp6MKLW7HdPcHKJ8nF+QQUgDaMQcJj92vv2N/52lfBz9ZhzkMyPbX
 f0ZzGhK/1uiRQjRVcecxAj8qnqHku98pV8OrqOEuVXCZQLE8jt4mzy5kztxu+SKYduJI
 GQH4mahVmMEIMa+7oaaSqRWm9w2nPG1CyqwtJx1vj4gRShTgEA8+lfjCyRjwxSjZ8P5u
 GLixfp8BarEMM2WPHXaQKVWKquy9ag8zgwqksXJ+VG7o6HPlCpcqGbWhAY+3hY7rOzKa
 ahOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ZTiW4luCSMfWjbqhEJKygUhu82TdRH/NEECLCQ1wsrg=;
 b=Ewgl+ra9omEy4/IRv84Oe5rwuP/H3OWGXoYAU1xLKrbn547bKT9AGfFJhBs6mZppbw
 bJgQUyA8zpCulfSm+djQOJxQY006TZ7GPmaEXdMWpyqHCxhiWjhoidXGccQxeEDIv7bE
 3ECM/xxk6o+DSnPvj8KMIWM1FE3fXJcbLgWRY4EBSAycEEsuyjbfGOO7SnVb/7f9ilsK
 THIswPvsURVZJMb09uF92KVOe+7dyoCzvnlJRLPM1cSR9FthjW3jivv238kVhcPhzFPL
 7ligA689nXg9v4LwZWYB8QliDik7Mk92vc2AuI+vunqmB7q65dtbNxC3WTY/VD7JfYkZ
 IEEw==
X-Gm-Message-State: AOAM530b9VwZe4ffmNvSz18pT4VC2zI2aNNXMy3LacDxr0gxT1f01saf
 u6dW2BgEtBFMVOpu6fm1At22HzGSfl4=
X-Google-Smtp-Source: ABdhPJx74JrKbqmVDVRbksuTFUNjk6yyFRhvOmczGs4/EoId84JEuMcUQbNRXMiRd9hPZgd3LJMO5w==
X-Received: by 2002:adf:f2d1:: with SMTP id d17mr3073614wrp.381.1630581497960; 
 Thu, 02 Sep 2021 04:18:17 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:eecb:a21b:e309:246?
 ([2a02:908:1252:fb60:eecb:a21b:e309:246])
 by smtp.gmail.com with ESMTPSA id x18sm1554878wrw.19.2021.09.02.04.18.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 04:18:17 -0700 (PDT)
Subject: Re: [PATCH] dma-buf: cleanup kerneldoc of removed component
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210901080002.5892-1-christian.koenig@amd.com>
 <CAO_48GG0KVArNe23KcwL4qXCn9PGCmfx9B21een4_h+UUv7xMA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <66a15ece-4a89-6e68-4b75-1d48b6796eb4@gmail.com>
Date: Thu, 2 Sep 2021 13:18:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAO_48GG0KVArNe23KcwL4qXCn9PGCmfx9B21een4_h+UUv7xMA@mail.gmail.com>
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

Am 01.09.21 um 16:53 schrieb Sumit Semwal:
> Hi Christian,
>
> On Wed, 1 Sept 2021 at 13:30, Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> The seqno-fence was removed, cleanup the kerneldoc include as well.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Fixes: 992c238188a8 ("dma-buf: nuke seqno-fence")
> Thanks for fixing; LGTM, please feel free to add my
> Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
>
> Or I could push it as well, if you'd like.

Already taken care of.

Thanks,
Christian.

>
>> ---
>>   Documentation/driver-api/dma-buf.rst | 6 ------
>>   1 file changed, 6 deletions(-)
>>
>> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
>> index f5ac4c90b237..2cd7db82d9fe 100644
>> --- a/Documentation/driver-api/dma-buf.rst
>> +++ b/Documentation/driver-api/dma-buf.rst
>> @@ -176,12 +176,6 @@ DMA Fences Functions Reference
>>   .. kernel-doc:: include/linux/dma-fence.h
>>      :internal:
>>
>> -Seqno Hardware Fences
>> -~~~~~~~~~~~~~~~~~~~~~
>> -
>> -.. kernel-doc:: include/linux/seqno-fence.h
>> -   :internal:
>> -
>>   DMA Fence Array
>>   ~~~~~~~~~~~~~~~
>>
>> --
>> 2.25.1
>>
> Best,
> Sumit.

