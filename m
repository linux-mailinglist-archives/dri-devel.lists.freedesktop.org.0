Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C9D533854
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 10:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6883E10E304;
	Wed, 25 May 2022 08:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F7010E3D1;
 Wed, 25 May 2022 08:24:09 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id j4so21629563edq.6;
 Wed, 25 May 2022 01:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IntFeKgY/PesGa7C+lUa+HVGZukayj05H1ww26mhU84=;
 b=eGXg2WRDwejdIrgEbWeacsDHT0VnbEiWCrodM8pXv6nV85ZY+kIFZDOllQG5zQnuhR
 0VeGZJc4yT0U+lWprEamJxaiu11QWbTB0QYIj6onKARmlSpZCQ2Zz4+rEF5Lr9v4ggcD
 32vEkzSVqdJw6NXLNpU7FMqKzWSazIEacr38rMa/A0jEMQopIGUqkKNhr+WvbtulLl/Z
 TXIpW/u3ru0lxYkDBGCPOCneiIeW2GDQ8kmbDCqrlwWn+b7TkYdPy5HArN7qWq6Zyv2/
 9HjBVOEIwDaREqESFfHwr4lWaIKw8Dl4wvv9I4Tw2XBZ9DnN06+k27M5rDMOGjq/1lbq
 uX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IntFeKgY/PesGa7C+lUa+HVGZukayj05H1ww26mhU84=;
 b=YB47EyE8+sZdw5TGYMCIVK3bv+YQgLtfZW3cithhO18D3g5RTAYL1Y0RnY3htTfmC/
 Tw+Km8gT0O4MQgz6aA/OVBdJNuH5YXjRaOIlk1k2DciQ4DMZC5mrVVjLNxO2C8hGIpF6
 UyVlspn4nMtgRmxcO85mlF7EEWJzk6OqGL572u+rR8Iu5V3xUrjdtVYbz1GLaJAPra29
 pr/gB3qy9ePqgJLybbH6bw+i4FB4295EJ0jedYGV+Y/B6WVRB24pNMr/hhqPBeGOJfte
 uM+jWGZKMvqchPbsBRcWB+gvzZyMxM7ozaPAUC2Tfmk1L6tZarexFexy1YRaoA5nxJ8N
 sQaw==
X-Gm-Message-State: AOAM5331Fb1nDjA+IvgPxEcAyxmhJ6Nd00OwokxaLqXG6s2Vtae7wVYx
 Z7Vyth4SFWPRDzQEeeD5iEw=
X-Google-Smtp-Source: ABdhPJyC4E3xI0+xaHcezRVfRi662ygTMR+lr+z1rfRHp0XWBcLKqdeglG15K24H+LwdpSDL8MJ9Lg==
X-Received: by 2002:a05:6402:e85:b0:41d:121b:f436 with SMTP id
 h5-20020a0564020e8500b0041d121bf436mr33214031eda.121.1653467047501; 
 Wed, 25 May 2022 01:24:07 -0700 (PDT)
Received: from [192.168.178.21] (p57b0bdaa.dip0.t-ipconnect.de.
 [87.176.189.170]) by smtp.gmail.com with ESMTPSA id
 st11-20020a170907c08b00b006ff0fe78cb7sm445074ejc.133.2022.05.25.01.24.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 01:24:06 -0700 (PDT)
Message-ID: <dbdb02cb-26fa-4f08-b125-c4a850e73780@gmail.com>
Date: Wed, 25 May 2022 10:24:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [Intel-gfx] [PATCH] drm/syncobj: flatten dma_fence_chains on
 transfer
Content-Language: en-US
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 thomas.hellstrom@linux.intel.com, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20220209182600.434803-1-christian.koenig@amd.com>
 <2bf6b110-cd85-e17f-e9c5-69e5e7eedd0d@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <2bf6b110-cd85-e17f-e9c5-69e5e7eedd0d@intel.com>
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.05.22 um 08:47 schrieb Lionel Landwerlin:
> On 09/02/2022 20:26, Christian König wrote:
>> It is illegal to add a dma_fence_chain as timeline point. Flatten out
>> the fences into a dma_fence_array instead.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/drm_syncobj.c | 61 ++++++++++++++++++++++++++++++++---
>>   1 file changed, 56 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_syncobj.c 
>> b/drivers/gpu/drm/drm_syncobj.c
>> index c313a5b4549c..7e48dcd1bee4 100644
>> --- a/drivers/gpu/drm/drm_syncobj.c
>> +++ b/drivers/gpu/drm/drm_syncobj.c
>> @@ -853,12 +853,57 @@ drm_syncobj_fd_to_handle_ioctl(struct 
>> drm_device *dev, void *data,
>>                       &args->handle);
>>   }
>>   +
>> +/*
>> + * Try to flatten a dma_fence_chain into a dma_fence_array so that 
>> it can be
>> + * added as timeline fence to a chain again.
>> + */
>> +static int drm_syncobj_flatten_chain(struct dma_fence **f)
>> +{
>> +    struct dma_fence_chain *chain = to_dma_fence_chain(*f);
>> +    struct dma_fence *tmp, **fences;
>> +    struct dma_fence_array *array;
>> +    unsigned int count;
>> +
>> +    if (!chain)
>> +        return 0;
>> +
>> +    count = 0;
>> +    dma_fence_chain_for_each(tmp, &chain->base)
>> +        ++count;
>> +
>> +    fences = kmalloc_array(count, sizeof(*fences), GFP_KERNEL);
>> +    if (!fences)
>> +        return -ENOMEM;
>> +
>> +    count = 0;
>> +    dma_fence_chain_for_each(tmp, &chain->base)
>> +        fences[count++] = dma_fence_get(tmp);
>> +
>> +    array = dma_fence_array_create(count, fences,
>> +                       dma_fence_context_alloc(1),
>
>
> Hi Christian,
>
>
> Sorry for the late answer to this.
>
>
> It appears this commit is trying to remove the warnings added by 
> "dma-buf: Warn about dma_fence_chain container rules"

Yes, correct. We are now enforcing some rules with warnings and this 
here bubbled up.

>
> But the context allocation you added just above is breaking some 
> tests. In particular igt@syncobj_timeline@transfer-timeline-point
>
> That test transfer points into the timeline at point 3 and expects 
> that we'll still on the previous points to complete.

Hui what? I don't understand the problem you are seeing here. What 
exactly is the test doing?

>
> In my opinion we should be reusing the previous context number if 
> there is one and only allocate if we don't have a point.

Scratching my head what you mean with that. The functionality transfers 
a synchronization fence from one timeline to another.

So as far as I can see the new point should be part of the timeline of 
the syncobj we are transferring to.

> If the application wants to not depend on previous points for wait 
> operations, it can reset the syncobj prior to adding a new point.

Well we should never lose synchronization. So what happens is that when 
we do the transfer all the fences of the source are flattened out into 
an array. And that array is then added as new point into the destination 
timeline.

Where exactly is the problem?

Regards,
Christian.

>
>
>
> Cheers,
>
>
> -Lionel
>
>
>
>> +                       1, false);
>> +    if (!array)
>> +        goto free_fences;
>> +
>> +    dma_fence_put(*f);
>> +    *f = &array->base;
>> +    return 0;
>> +
>> +free_fences:
>> +    while (count--)
>> +        dma_fence_put(fences[count]);
>> +
>> +    kfree(fences);
>> +    return -ENOMEM;
>> +}
>> +
>>   static int drm_syncobj_transfer_to_timeline(struct drm_file 
>> *file_private,
>>                           struct drm_syncobj_transfer *args)
>>   {
>>       struct drm_syncobj *timeline_syncobj = NULL;
>> -    struct dma_fence *fence;
>>       struct dma_fence_chain *chain;
>> +    struct dma_fence *fence;
>>       int ret;
>>         timeline_syncobj = drm_syncobj_find(file_private, 
>> args->dst_handle);
>> @@ -869,16 +914,22 @@ static int 
>> drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
>>                        args->src_point, args->flags,
>>                        &fence);
>>       if (ret)
>> -        goto err;
>> +        goto err_put_timeline;
>> +
>> +    ret = drm_syncobj_flatten_chain(&fence);
>> +    if (ret)
>> +        goto err_free_fence;
>> +
>>       chain = dma_fence_chain_alloc();
>>       if (!chain) {
>>           ret = -ENOMEM;
>> -        goto err1;
>> +        goto err_free_fence;
>>       }
>> +
>>       drm_syncobj_add_point(timeline_syncobj, chain, fence, 
>> args->dst_point);
>> -err1:
>> +err_free_fence:
>>       dma_fence_put(fence);
>> -err:
>> +err_put_timeline:
>>       drm_syncobj_put(timeline_syncobj);
>>         return ret;
>
>

