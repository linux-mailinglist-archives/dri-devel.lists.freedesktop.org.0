Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 472EA38C100
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 09:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF12D6E499;
	Fri, 21 May 2021 07:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4149A6E499
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 07:51:44 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id z12so27660146ejw.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 00:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=yIt4umjFOZQR1/R+p/+vk+7vp6BIZCn9mS8L8/MX/gM=;
 b=ihHW48Oh2sczuOHk7ashrcRkjXwj9Ft8rKWfcqT1DpxXxZKn5eltxQD7UXYgLbS060
 ommLut03zBvgJwa8TDFY3RKZjxWDPkhoY73xC/qcD0K6cfXbvkwUN4LhLR7EYZBIPQ70
 Ef4LKBEl9j3Vj1KmoBLhQH0iO9tTsNfwb5fuY5hmk/BPPhYfC+KlGr9BFHl6IC3OM5qh
 8TRNwyt1An34WIcXxRUfesVsaZGEkmZ2g6B8O2a5nu+M3MVvFQH9/sBiAwTgJfQx7+NL
 qRzmgcRcL3CBe2shL7UWzlEfE8XtbGplRU16tLfPLsb4rAXCje9Sf9Vw6+VDtvfasHOX
 UoNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=yIt4umjFOZQR1/R+p/+vk+7vp6BIZCn9mS8L8/MX/gM=;
 b=OU+Q8miLZZGXi6zaWXgy4wPnnwLvEbsmDmtVmYihH1MBobmLWR6iloD1eRdHf/eCcu
 3A6RkpOcHCXjmxGH9M85gQMjyUkCuXDm4KSugxuBmCdjesGWSHnHB0UnbgyF2hYJXIZk
 1PTeoGJy6fK6W2h1zeMO8lp8QcEoPD/2yrPT/H951vZ8p8ZflqUV4XnWJWJ0hle88CKh
 St1dicJd91GDOhcMaCWZQT+f4Rsy6L2hVxzdEF7efdH4j87dfrPzRt7tRRYnTgQ4RM3W
 uLdo7bFdlJyysWiVdCWUQ7LjT/i07fi99pgBzYQo/2kYHzM85ClZR1CHHZyTG/be2RuL
 epGQ==
X-Gm-Message-State: AOAM533SQmm0xbh7HHBKAIK6bbmY7FbhMbp+oltt9uEOKoqTpKZhKXEh
 OP+KCn8enldVKoHqDiYlJvKgAhRkv3s=
X-Google-Smtp-Source: ABdhPJymcSCwY7TZYjcNJwCs8r09i3qyL5f+bDOLDfzUoKiRp+Sh/AHXZzZpCptz3eEHSiZ8RlYVaw==
X-Received: by 2002:a17:907:9895:: with SMTP id
 ja21mr9324939ejc.426.1621583502926; 
 Fri, 21 May 2021 00:51:42 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d?
 ([2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d])
 by smtp.gmail.com with ESMTPSA id di7sm3341610edb.34.2021.05.21.00.51.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 00:51:42 -0700 (PDT)
Subject: Re: [PATCH 1/4] dma-buf: add dma_fence_array_for_each (v2)
To: Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org
References: <20210520190007.534046-1-jason@jlekstrand.net>
 <20210520190007.534046-2-jason@jlekstrand.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <5698cfc1-471b-5e13-bf3f-1c7025dc9a2c@gmail.com>
Date: Fri, 21 May 2021 09:51:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520190007.534046-2-jason@jlekstrand.net>
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

Am 20.05.21 um 21:00 schrieb Jason Ekstrand:
> From: Christian König <ckoenig.leichtzumerken@gmail.com>
>
> Add a helper to iterate over all fences in a dma_fence_array object.
>
> v2 (Jason Ekstrand)
>   - Return NULL from dma_fence_array_first if head == NULL.  This matches
>     the iterator behavior of dma_fence_chain_for_each in that it iterates
>     zero times if head == NULL.
>   - Return NULL from dma_fence_array_next if index > array->num_fences.
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

Reviewed-by: Christian König <christian.koenig@amd.com>

BTW: I'm only seeing this patch from the series. Looks like somehow the 
rest didn't made it into my inbox.

> ---
>   drivers/dma-buf/dma-fence-array.c | 27 +++++++++++++++++++++++++++
>   include/linux/dma-fence-array.h   | 17 +++++++++++++++++
>   2 files changed, 44 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index d3fbd950be944..2ac1afc697d0f 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -201,3 +201,30 @@ bool dma_fence_match_context(struct dma_fence *fence, u64 context)
>   	return true;
>   }
>   EXPORT_SYMBOL(dma_fence_match_context);
> +
> +struct dma_fence *dma_fence_array_first(struct dma_fence *head)
> +{
> +	struct dma_fence_array *array;
> +
> +	if (!head)
> +		return NULL;
> +
> +	array = to_dma_fence_array(head);
> +	if (!array)
> +		return head;
> +
> +	return array->fences[0];
> +}
> +EXPORT_SYMBOL(dma_fence_array_first);
> +
> +struct dma_fence *dma_fence_array_next(struct dma_fence *head,
> +				       unsigned int index)
> +{
> +	struct dma_fence_array *array = to_dma_fence_array(head);
> +
> +	if (!array || index >= array->num_fences)
> +		return NULL;
> +
> +	return array->fences[index];
> +}
> +EXPORT_SYMBOL(dma_fence_array_next);
> diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
> index 303dd712220fd..588ac8089dd61 100644
> --- a/include/linux/dma-fence-array.h
> +++ b/include/linux/dma-fence-array.h
> @@ -74,6 +74,19 @@ to_dma_fence_array(struct dma_fence *fence)
>   	return container_of(fence, struct dma_fence_array, base);
>   }
>   
> +/**
> + * dma_fence_array_for_each - iterate over all fences in array
> + * @fence: current fence
> + * @index: index into the array
> + * @head: potential dma_fence_array object
> + *
> + * Test if @array is a dma_fence_array object and if yes iterate over all fences
> + * in the array. If not just iterate over the fence in @array itself.
> + */
> +#define dma_fence_array_for_each(fence, index, head)			\
> +	for (index = 0, fence = dma_fence_array_first(head); fence;	\
> +	     ++(index), fence = dma_fence_array_next(head, index))
> +
>   struct dma_fence_array *dma_fence_array_create(int num_fences,
>   					       struct dma_fence **fences,
>   					       u64 context, unsigned seqno,
> @@ -81,4 +94,8 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
>   
>   bool dma_fence_match_context(struct dma_fence *fence, u64 context);
>   
> +struct dma_fence *dma_fence_array_first(struct dma_fence *head);
> +struct dma_fence *dma_fence_array_next(struct dma_fence *head,
> +				       unsigned int index);
> +
>   #endif /* __LINUX_DMA_FENCE_ARRAY_H */

