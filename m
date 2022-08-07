Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA2958BC16
	for <lists+dri-devel@lfdr.de>; Sun,  7 Aug 2022 19:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB52B10FF16;
	Sun,  7 Aug 2022 17:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA7410FF7B;
 Sun,  7 Aug 2022 17:38:16 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id w19so12794735ejc.7;
 Sun, 07 Aug 2022 10:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=AgdBOmzjWEHkV7rEo+KUxlFzWKgAveUFyWtzbLgYCE4=;
 b=H6x1G3E8YlQ7qZcLon5c36k6rvHgNPnHCfXDb79aFWTxoHFetm1MxwrOqlofZGnEbu
 6O298fcYKrrAI4Zj8RcrbZMC7xIa1DWtVUgjF45eeXolcrBaGxsyUpOTPxvKK5SAVCYe
 hMqM0l4rigjWrBBvl7iaqpHLYLNeAJQQm8S88f+AIHkH4OR9B5KomncKOc74q3sPGVSi
 v8mMc+NIhKfLTUPBnK3xu23YFggdnYcel4NnbMFjIfgIysII7OXKD3gfDv8Pk8CVG5lr
 wZJB8X3wehYz953PkjbB6bO6l4rUdt4MXjXZhZ+h45KtqNfgofYkxyUYH2BXvv/68/xz
 4d3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=AgdBOmzjWEHkV7rEo+KUxlFzWKgAveUFyWtzbLgYCE4=;
 b=iqzt+vMBludGkmM8h5AzzCFAUzdOAGxQrAxYvX7F06X8yGrq4kB3k/bj8PtXKGGBD8
 QfL5SUIZQO5u1DoHTuIiScInQLkp9e8NqGF9+3i/DgBl4uFUqOea1IN5ogSLBnVRtEtP
 PI6xJ7aqUI8M7Lu+BB/wxVjAa0R89LontdRy9yBiVAh+IPf6LhxvTDpj9LB4hY3Zdf4M
 A4NBCJdju2A8gqOeL2V4TEqaLOqBkRnruDSgkSDyX7W4WZJZYe3jcx429/Aj0/BRUI8K
 qwnzAjmeW0C4rJHGkcwDTzeTiNOMPGtTJUka/Irc/6S99915SMFA61w2vU+OrZ9GRk11
 AiNA==
X-Gm-Message-State: ACgBeo0dhjhmXgf/NUlUomB2YrP7Ye2VR6/TUzAAbTsUeNXg08NYrIuL
 1yqFvByZ8ZLZXFc/WShQX/VwdZR9evI=
X-Google-Smtp-Source: AA6agR4NqIfQVCLi7yaL0plDEd9R+3QXOrkjTbmC4IFeD/Z6uIkIYJmphiUY+nclKk/Pwmey+JCedQ==
X-Received: by 2002:a17:906:93f0:b0:730:6d4e:970c with SMTP id
 yl16-20020a17090693f000b007306d4e970cmr11648327ejb.188.1659893894955; 
 Sun, 07 Aug 2022 10:38:14 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:f019:ef7b:173c:a9d2?
 ([2a02:908:1256:79a0:f019:ef7b:173c:a9d2])
 by smtp.gmail.com with ESMTPSA id
 dc3-20020a170906c7c300b0073093eaf53esm3964625ejb.131.2022.08.07.10.38.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Aug 2022 10:38:14 -0700 (PDT)
Message-ID: <2fc74efe-220f-b57a-e804-7d2b3880d14f@gmail.com>
Date: Sun, 7 Aug 2022 19:38:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Linaro-mm-sig] [PATCH 1/3] dma-buf: Add ioctl to query mmap info
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220729170744.1301044-1-robdclark@gmail.com>
 <20220729170744.1301044-2-robdclark@gmail.com>
 <3d2083aa-fc6c-6875-3daf-e5abe45fb762@gmail.com>
 <CAF6AEGvKdM3vyCvBZK=ZcdGmak7tsrP1b8ANyyaMjVfNDViqyw@mail.gmail.com>
 <973de2f8-75e4-d4c7-a13a-c541a6cf7c77@amd.com>
 <CAF6AEGuhQT6A_jh8kLWh5xMoUGc1osdewyBk-8NoprtWOHseaQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAF6AEGuhQT6A_jh8kLWh5xMoUGc1osdewyBk-8NoprtWOHseaQ@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.08.22 um 19:35 schrieb Rob Clark:
> On Sun, Aug 7, 2022 at 10:14 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 07.08.22 um 19:02 schrieb Rob Clark:
>>> On Sun, Aug 7, 2022 at 9:09 AM Christian König
>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>> Am 29.07.22 um 19:07 schrieb Rob Clark:
>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>
>>>>> This is a fairly narrowly focused interface, providing a way for a VMM
>>>>> in userspace to tell the guest kernel what pgprot settings to use when
>>>>> mapping a buffer to guest userspace.
>>>>>
>>>>> For buffers that get mapped into guest userspace, virglrenderer returns
>>>>> a dma-buf fd to the VMM (crosvm or qemu).
>>>> Wow, wait a second. Who is giving whom the DMA-buf fd here?
>>> Not sure I understand the question.. the dma-buf fd could come from
>>> EGL_MESA_image_dma_buf_export, gbm, or similar.
>>>
>>>> My last status was that this design was illegal and couldn't be
>>>> implemented because it requires internal knowledge only the exporting
>>>> driver can have.
>>> This ioctl provides that information from the exporting driver so that
>>> a VMM doesn't have to make assumptions ;-)
>> And exactly that was NAKed the last time it came up. Only the exporting
>> driver is allowed to mmap() the DMA-buf into the guest.
> except the exporting driver is in the host ;-)
>
>> This way you also don't need to transport any caching information anywhere.
>>
>>> Currently crosvm assumes if (drivername == "i915") then it is a cached
>>> mapping, otherwise it is wc.  I'm trying to find a way to fix this.
>>> Suggestions welcome, but because of how mapping to a guest VM works, a
>>> VMM is a somewhat special case where this information is needed in
>>> userspace.
>> Ok that leaves me completely puzzled. How does that work in the first place?
>>
>> In other words how does the mapping into the guest page tables happen?
> There are multiple levels to this, but in short mapping to guest
> userspace happens via drm/virtio (aka "virtio_gpu" or "virtgpu"), the
> cache attributes are set via "map_info" attribute returned from the
> host VMM (host userspace, hence the need for this ioctl).
>
> In the host, the host kernel driver mmaps to host userspace (VMM).
> Here the exporting driver is performing the mmap with correct cache
> attributes.

> The VMM uses KVM to map these pages into the guest so

And exactly that was declared completely illegal the last time it came 
up on the mailing list.

Daniel implemented a whole bunch of patches into the DMA-buf layer to 
make it impossible for KVM to do this.

I have absolutely no idea why that is now a topic again and why anybody 
is still using this approach.

@Daniel can you clarify.

Thanks,
Christian.

> they appear as physical pages to the guest kernel.  The guest kernel
> (virtgpu) in turn maps them to guest userspace.
>
> BR,
> -R
>
>> Regards,
>> Christian.
>>
>>> BR,
>>> -R
>>>
>>>> @Daniel has anything changed on that is or my status still valid?
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>      In addition to mapping the
>>>>> pages into the guest VM, it needs to report to drm/virtio in the guest
>>>>> the cache settings to use for guest userspace.  In particular, on some
>>>>> architectures, creating aliased mappings with different cache attributes
>>>>> is frowned upon, so it is important that the guest mappings have the
>>>>> same cache attributes as any potential host mappings.
>>>>>
>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>>> ---
>>>>>     drivers/dma-buf/dma-buf.c    | 26 ++++++++++++++++++++++++++
>>>>>     include/linux/dma-buf.h      |  7 +++++++
>>>>>     include/uapi/linux/dma-buf.h | 28 ++++++++++++++++++++++++++++
>>>>>     3 files changed, 61 insertions(+)
>>>>>
>>>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>>>> index 32f55640890c..d02d6c2a3b49 100644
>>>>> --- a/drivers/dma-buf/dma-buf.c
>>>>> +++ b/drivers/dma-buf/dma-buf.c
>>>>> @@ -326,6 +326,29 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
>>>>>         return 0;
>>>>>     }
>>>>>
>>>>> +static long dma_buf_info(struct dma_buf *dmabuf, const void __user *uarg)
>>>>> +{
>>>>> +     struct dma_buf_info arg;
>>>>> +
>>>>> +     if (copy_from_user(&arg, uarg, sizeof(arg)))
>>>>> +             return -EFAULT;
>>>>> +
>>>>> +     switch (arg.param) {
>>>>> +     case DMA_BUF_INFO_VM_PROT:
>>>>> +             if (!dmabuf->ops->mmap_info)
>>>>> +                     return -ENOSYS;
>>>>> +             arg.value = dmabuf->ops->mmap_info(dmabuf);
>>>>> +             break;
>>>>> +     default:
>>>>> +             return -EINVAL;
>>>>> +     }
>>>>> +
>>>>> +     if (copy_to_user(uarg, &arg, sizeof(arg)))
>>>>> +             return -EFAULT;
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>>     static long dma_buf_ioctl(struct file *file,
>>>>>                           unsigned int cmd, unsigned long arg)
>>>>>     {
>>>>> @@ -369,6 +392,9 @@ static long dma_buf_ioctl(struct file *file,
>>>>>         case DMA_BUF_SET_NAME_B:
>>>>>                 return dma_buf_set_name(dmabuf, (const char __user *)arg);
>>>>>
>>>>> +     case DMA_BUF_IOCTL_INFO:
>>>>> +             return dma_buf_info(dmabuf, (const void __user *)arg);
>>>>> +
>>>>>         default:
>>>>>                 return -ENOTTY;
>>>>>         }
>>>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>>>> index 71731796c8c3..6f4de64a5937 100644
>>>>> --- a/include/linux/dma-buf.h
>>>>> +++ b/include/linux/dma-buf.h
>>>>> @@ -283,6 +283,13 @@ struct dma_buf_ops {
>>>>>          */
>>>>>         int (*mmap)(struct dma_buf *, struct vm_area_struct *vma);
>>>>>
>>>>> +     /**
>>>>> +      * @mmap_info:
>>>>> +      *
>>>>> +      * Return mmapping info for the buffer.  See DMA_BUF_INFO_VM_PROT.
>>>>> +      */
>>>>> +     int (*mmap_info)(struct dma_buf *);
>>>>> +
>>>>>         int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
>>>>>         void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
>>>>>     };
>>>>> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
>>>>> index b1523cb8ab30..a41adac0f46a 100644
>>>>> --- a/include/uapi/linux/dma-buf.h
>>>>> +++ b/include/uapi/linux/dma-buf.h
>>>>> @@ -85,6 +85,32 @@ struct dma_buf_sync {
>>>>>
>>>>>     #define DMA_BUF_NAME_LEN    32
>>>>>
>>>>> +
>>>>> +/**
>>>>> + * struct dma_buf_info - Query info about the buffer.
>>>>> + */
>>>>> +struct dma_buf_info {
>>>>> +
>>>>> +#define DMA_BUF_INFO_VM_PROT      1
>>>>> +#  define DMA_BUF_VM_PROT_WC      0
>>>>> +#  define DMA_BUF_VM_PROT_CACHED  1
>>>>> +
>>>>> +     /**
>>>>> +      * @param: Which param to query
>>>>> +      *
>>>>> +      * DMA_BUF_INFO_BM_PROT:
>>>>> +      *     Query the access permissions of userspace mmap's of this buffer.
>>>>> +      *     Returns one of DMA_BUF_VM_PROT_x
>>>>> +      */
>>>>> +     __u32 param;
>>>>> +     __u32 pad;
>>>>> +
>>>>> +     /**
>>>>> +      * @value: Return value of the query.
>>>>> +      */
>>>>> +     __u64 value;
>>>>> +};
>>>>> +
>>>>>     #define DMA_BUF_BASE                'b'
>>>>>     #define DMA_BUF_IOCTL_SYNC  _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
>>>>>
>>>>> @@ -95,4 +121,6 @@ struct dma_buf_sync {
>>>>>     #define DMA_BUF_SET_NAME_A  _IOW(DMA_BUF_BASE, 1, __u32)
>>>>>     #define DMA_BUF_SET_NAME_B  _IOW(DMA_BUF_BASE, 1, __u64)
>>>>>
>>>>> +#define DMA_BUF_IOCTL_INFO   _IOWR(DMA_BUF_BASE, 2, struct dma_buf_info)
>>>>> +
>>>>>     #endif

