Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3503989C3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 14:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72E56EC66;
	Wed,  2 Jun 2021 12:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9959C6EC66
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 12:37:00 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id g20so3711342ejt.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 05:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=x7gNhpf4yMDzjzmQHesomGdiWDQSdpVpp1q6LWeXgTE=;
 b=gzXQ8TC6wWBmFfpJEYmnjPeMWlLAYlh8cxqdiGoPXCIdI2+zjESR7HPU+JTLSXVCd0
 O0uFds4CUYrkI+e+iWbmJHMM6JOLpDdW0NdUWUYUdO8fh7g+OygdC7mqRhxnABiPfFK9
 WJ2tzecXNX/2Ns7nfHaSRE0T26pEelukHwMRSHsIR9jFRc2ip1KYNV7VgK4BZfo+/CJo
 8XJLQbO2+gWKeuW9Mpj2dOGMXw/+bH82C41MYO8F3/+iWy3ZFNtdOOvB8Dz2MbP9C9K9
 FfYy/JTU+adFneVkZ2jzcMmhHPdViz0GR4pBfNK3i82UW9898+7In0RYwnjVKEW/hHfS
 7uSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=x7gNhpf4yMDzjzmQHesomGdiWDQSdpVpp1q6LWeXgTE=;
 b=dyoBHPYDk55QNjXWFZ7HQzs2UuVnVZ/uFk8kDJLQ5KM7OIkAQGWUajpzQVZcjL9SKI
 CBM0sUa0RVQev7vbfSA2g8eQPMeku7+Ii0CpNDNQaMihWqDjzHX5WXhUo8kr/k370wV0
 SQBCG1d6wTEFe44KIHOvP0nyEZg1BtMRAUTkClqA6l4sWkQtwT0XRw5PK2hpaTmD9Ixv
 jGOKieSP8B/LORqmG5mtjPIdEk23Yc4Z2+P73GXCNzVqhliUc2Gn7M99ej1kSKEAnRVi
 E8MAGY/yfBqmmRGshVpj6zLn0Jllr9sS+2ZwezHzHaHIWoUR8gjS7K90SSQbZzQcYs/k
 5aLg==
X-Gm-Message-State: AOAM533pNXnTkTkb4du0FeyRFWAatZm0jo4yxA4CtnBWMl96WpDU17yY
 4KNkD3+r6Lu5FZjDnPKK9UKgZlnWKrc=
X-Google-Smtp-Source: ABdhPJzFX7xlJTCuN1fJs3cVRA/mo+KYFYC4F7bslbIFhYAZDyKsqIhop8yQJb/iiLB/qGt2ewNzUg==
X-Received: by 2002:a17:906:498b:: with SMTP id
 p11mr34702192eju.295.1622637419389; 
 Wed, 02 Jun 2021 05:36:59 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:cd07:2759:3eec:1d00?
 ([2a02:908:1252:fb60:cd07:2759:3eec:1d00])
 by smtp.gmail.com with ESMTPSA id p15sm1271345edr.50.2021.06.02.05.36.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 05:36:58 -0700 (PDT)
Subject: Re: [PATCH 1/7] dma-buf: fix inconsistent debug print
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210602111714.212426-1-christian.koenig@amd.com>
 <YLd6k+LIHLja07V9@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c40b4c90-b595-9be0-29db-01b7bb5d24a6@gmail.com>
Date: Wed, 2 Jun 2021 14:36:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLd6k+LIHLja07V9@phenom.ffwll.local>
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
Cc: dri-devel@lists.freedesktop.org, jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 02.06.21 um 14:33 schrieb Daniel Vetter:
> On Wed, Jun 02, 2021 at 01:17:08PM +0200, Christian König wrote:
>> The code tries to acquire the rcu protected fence list, but then ignores
>> individual fences which have been modified while holding the rcu.
>>
>> Stop that madness and just note cleanly that the list was concurrently modified.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> Yeah it's debugfs, it's better not to be fancy here and if you race you
> can just re-grab it all.
>
> What's worse, we do grab the dma_resv_lock, which means no one should be
> able to race with us. I think 100% right thing here is actually to drop
> the rcu_read_lock too, and switch over to rcu_dereference_protected().
>
> And also drop the seqcount check, that would be a bug. seqcount is only
> to get a consistent snapshot of all fences on the read (i.e. protected by
> rcu only) section. We hold the write lock with dma_resv_lock here.

Yes that what I had in mind as alternative as well.

Just wasn't 100% sure which way to go here.

Going to adjust that,
Christian.

>
> Cheers, Daniel
>
>> ---
>>   drivers/dma-buf/dma-buf.c | 19 ++++++++-----------
>>   1 file changed, 8 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index eadd1eaa2fb5..d3b4e370dbc1 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -1383,22 +1383,17 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
>>   				buf_obj->name ?: "");
>>   
>>   		robj = buf_obj->resv;
>> -		while (true) {
>> -			seq = read_seqcount_begin(&robj->seq);
>> -			rcu_read_lock();
>> -			fobj = rcu_dereference(robj->fence);
>> -			shared_count = fobj ? fobj->shared_count : 0;
>> -			fence = rcu_dereference(robj->fence_excl);
>> -			if (!read_seqcount_retry(&robj->seq, seq))
>> -				break;
>> -			rcu_read_unlock();
>> -		}
>> -
>> +		seq = read_seqcount_begin(&robj->seq);
>> +		rcu_read_lock();
>> +		fence = rcu_dereference(robj->fence_excl);
>>   		if (fence)
>>   			seq_printf(s, "\tExclusive fence: %s %s %ssignalled\n",
>>   				   fence->ops->get_driver_name(fence),
>>   				   fence->ops->get_timeline_name(fence),
>>   				   dma_fence_is_signaled(fence) ? "" : "un");
>> +
>> +		fobj = rcu_dereference(robj->fence);
>> +		shared_count = fobj ? fobj->shared_count : 0;
>>   		for (i = 0; i < shared_count; i++) {
>>   			fence = rcu_dereference(fobj->shared[i]);
>>   			if (!dma_fence_get_rcu(fence))
>> @@ -1410,6 +1405,8 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
>>   			dma_fence_put(fence);
>>   		}
>>   		rcu_read_unlock();
>> +		if (read_seqcount_retry(&robj->seq, seq))
>> +			seq_printf(s, "\tFences concurrently modified\n");
>>   
>>   		seq_puts(s, "\tAttached Devices:\n");
>>   		attach_count = 0;
>> -- 
>> 2.25.1
>>

