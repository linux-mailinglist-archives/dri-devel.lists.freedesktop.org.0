Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C86DC79C7A6
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 09:06:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411A410E2F1;
	Tue, 12 Sep 2023 07:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87AEB10E2F1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 07:06:17 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9ad8add163cso26309566b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 00:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694502376; x=1695107176; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CMy6jSxlLVQzjvcfRtLq3NXvZdu60RtRCF9sxWo1nvI=;
 b=jo1dbxXDImlMYE5WQthMEE9Wr24iWw+RT1dyvTLXmQlGkewrf3EK1gWL/30W2vSc0v
 SwTxTS05He7YYjIemfVZ0AJvAmIH5OAPvB4juMTYrSvD6QwEa8rA+J/Yl6uthdkPwcNW
 L6ItqE+IiBbei3ah11E4ohL4FUCeP9UYTpsc4sUNem/Gx1i38xnYP3qWAPHQa5Bdu7bD
 wApgJMU4ak5XnvvzPDgaLxyPq9tiR5kg0n4yxDfs/kgOw5hvZ+fN/NXFGgtRZ8/j6UkP
 gzg8FRDadARV5WzYVYoE9gQmTjBHMRdKgY94ueaZLp1AtY+ChIuXmhIoSxSsGlJM3HsR
 IohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694502376; x=1695107176;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CMy6jSxlLVQzjvcfRtLq3NXvZdu60RtRCF9sxWo1nvI=;
 b=NUpRBSprAkALeDPRcehbXPjO5kT4N+VOK1zVZPhsHlszoc2OJu6A1otCgweruDMH+y
 SFkBJkfHM3+BSRyIpOfUAFVZMSTBgCarlYh8HhQFEuu5LjzeE0+FnLhN+jxvVwmXz1fc
 IfFHwiqawAYn27+PZRCpfEZUd6d0qP5N7G+CCJvIm3I/T8ur/irDheG12F8Kv4ALa+GF
 fbvLWSdEZPZe+i6NurKg/xOY/GjYQcHC09Rtlsetu1KGVQBuS5Al0nSz+Pn/N5uTcqkj
 t1bFRh0bmaraCkZ5XeSSUJEP02RimNO94y8/CjxyF7zIS+lj+B3WUE0VGRkMIqtNM6wr
 IyTA==
X-Gm-Message-State: AOJu0YyFoSLZiThjrY0iI1mUSeusI0DXP7z8piWtrwFxfbQW5fpUg2ew
 E6+mTM5ms6TFMzBOjvIo6cs=
X-Google-Smtp-Source: AGHT+IEOrMxMs1WFBCbVhLR01bYFYeYSawxe090qODnBi4upxpLOi7jNd1Rrxbto/3+X6VvKL39rYA==
X-Received: by 2002:a17:906:8b:b0:9a1:d7cd:6040 with SMTP id
 11-20020a170906008b00b009a1d7cd6040mr9828714ejc.37.1694502375674; 
 Tue, 12 Sep 2023 00:06:15 -0700 (PDT)
Received: from [192.168.178.25] ([185.254.126.42])
 by smtp.gmail.com with ESMTPSA id
 p21-20020a170906b21500b0099b6becb107sm6415474ejz.95.2023.09.12.00.06.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 00:06:15 -0700 (PDT)
Message-ID: <23e71d1f-08c1-3834-5b1f-2b5714c7bfaa@gmail.com>
Date: Tue, 12 Sep 2023 09:06:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 3/9] dma-heap: Provide accessors so that in-kernel drivers
 can allocate dmabufs from specific heaps
Content-Language: en-US
To: John Stultz <jstultz@google.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-4-yong.wu@mediatek.com>
 <803846bc-fd1d-d2ec-2855-456af22c82f8@amd.com>
 <CANDhNCrQyiFZ+8DnG0iyKBXC0H1698K1a9d2AxOq4whDsZBn+Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CANDhNCrQyiFZ+8DnG0iyKBXC0H1698K1a9d2AxOq4whDsZBn+Q@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 jianjiao.zeng@mediatek.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, tjmercier@google.com,
 linux-media@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Yong Wu <yong.wu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.09.23 um 20:29 schrieb John Stultz:
> On Mon, Sep 11, 2023 at 3:14 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 11.09.23 um 04:30 schrieb Yong Wu:
>>> From: John Stultz <jstultz@google.com>
>>>
>>> This allows drivers who don't want to create their own
>>> DMA-BUF exporter to be able to allocate DMA-BUFs directly
>>> from existing DMA-BUF Heaps.
>>>
>>> There is some concern that the premise of DMA-BUF heaps is
>>> that userland knows better about what type of heap memory
>>> is needed for a pipeline, so it would likely be best for
>>> drivers to import and fill DMA-BUFs allocated by userland
>>> instead of allocating one themselves, but this is still
>>> up for debate.
>> The main design goal of having DMA-heaps in the first place is to avoid
>> per driver allocation and this is not necessary because userland know
>> better what type of memory it wants.
>>
>> The background is rather that we generally want to decouple allocation
>> from having a device driver connection so that we have better chance
>> that multiple devices can work with the same memory.
> Yep, very much agreed, and this is what the comment above is trying to describe.
>
> Ideally user-allocated buffers would be used to ensure driver's don't
> create buffers with constraints that limit which devices the buffers
> might later be shared with.
>
> However, this patch was created as a hold-over from the old ION logic
> to help vendors transition to dmabuf heaps, as vendors had situations
> where they still wanted to export dmabufs that were not to be
> generally shared and folks wanted to avoid duplication of logic
> already in existing heaps.  At the time, I never pushed it upstream as
> there were no upstream users.  But I think if there is now a potential
> upstream user, it's worth having the discussion to better understand
> the need.

Yeah, that indeed makes much more sense.

When existing drivers want to avoid their own handling and move their 
memory management over to using DMA-heaps even for internal allocations 
then no objections from my side. That is certainly something we should 
aim for if possible.

But what we should try to avoid is that newly merged drivers provide 
both a driver specific UAPI and DMA-heaps. The justification that this 
makes it easier to transit userspace to the new UAPI doesn't really count.

That would be adding UAPI already with a plan to deprecate it and that 
is most likely not helpful considering that UAPI must be supported 
forever as soon as it is upstream.

> So I think this patch is a little confusing in this series, as I don't
> see much of it actually being used here (though forgive me if I'm
> missing it).
>
> Instead, It seems it get used in a separate patch series here:
>    https://lore.kernel.org/all/20230911125936.10648-1-yunfei.dong@mediatek.com/

Please try to avoid stuff like that it is really confusing and eats 
reviewers time.

Regards,
Christian.

>
> Yong, I appreciate you sending this out! But maybe if the secure heap
> submission doesn't depend on this functionality, I might suggest
> moving this patch (or at least the majority of it) to be part of the
> vcodec series instead?  That way reviewers will have more context for
> how the code being added is used?
>
> thanks
> -john

