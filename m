Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3094C635727
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 10:39:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E8110E205;
	Wed, 23 Nov 2022 09:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4C310E204;
 Wed, 23 Nov 2022 09:39:23 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id i12so24643149wrb.0;
 Wed, 23 Nov 2022 01:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xtVY1fbYdCt5+6Wym639LRdXvZTAy2Wrn/gBgTtUC1o=;
 b=Ls8T6MScaXn4Cn7Q/vatDeXNlHgSqc26eVKPUNNcDvvhMePHusIYmHdGO/7fZ2ObRo
 yLSUJGQNXAjohoIgwesn/52CuIZ7H/EDmr+GpA95hMunFb8U1BLXPWTB1gIyMKkmuavq
 dcJXlu8GLSQpiaEhU3DKY6huWuTscC9vfona8k0P+rm3aChiuNYiSnpr30UcU6y+o20j
 ODHfmRQyHKdvPXcaV7/8ny1gZFf7Dol1BVaIPut56Z6Lumdw1ljxikYsabjJ7n3aw8ds
 JilFsues5QlIVaMJrWKEOVQEOvYmgxILRqsDyridWAntTDBVcg0hiOeDmfNZk6PydBEh
 +QdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xtVY1fbYdCt5+6Wym639LRdXvZTAy2Wrn/gBgTtUC1o=;
 b=aUSTv4H6cB9Ikach6Hk2a3rtWvVy9I0snxdDyZ7fpR+AjAPPS7Tywi0HZI1zXndgsE
 7h/BK1h3QnRjHkt0ZpvXkUPcII3tZtmP5ujDIqoTEfS3a+quTSLZpTzXRZu+18D/uOqv
 G3b0YOfdV9S0FZY6wqeYgZqj4ldyOZ2IaVbY1kt9pDYIQ3XrxskG5rM6IQR8Ift/FAdd
 MT4MkCg8y3mgvfs3sJeqo81Tl7hzolU5n4D77gHmCY2ssZ9izk5sea9yVIjnsGxwejQ8
 tpi9Uv5gTFp+12KxzZfJK8HaAjXctkUkGm2EhxTV6oWZ5zyyxYm3kt5VLx2mrj18aHHg
 bi3w==
X-Gm-Message-State: ANoB5pkVBWIKpB6RdYY39QbDKJ5M1O6mx0lIa8iNBHLPsk6T7FrFyvY1
 TWL5gJbZdqPX4f54hIqJE7kC6rTM4Ls=
X-Google-Smtp-Source: AA0mqf6TI52S2u9Y1mEfqPCpDFRdjST76rMGbBL3i3Bfd7bd3UxqqWaqDoi3bHSMEkKgSKu6V5k0lg==
X-Received: by 2002:a05:6000:1e1d:b0:241:c75c:6831 with SMTP id
 bj29-20020a0560001e1d00b00241c75c6831mr12526680wrb.16.1669196361566; 
 Wed, 23 Nov 2022 01:39:21 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:d2d7:ceea:efc2:af43?
 ([2a02:908:1256:79a0:d2d7:ceea:efc2:af43])
 by smtp.gmail.com with ESMTPSA id
 o42-20020a05600c512a00b003a3442f1229sm1735280wms.29.2022.11.23.01.39.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 01:39:20 -0800 (PST)
Message-ID: <b05e6091-4e07-1e32-773d-f603ac9ac98b@gmail.com>
Date: Wed, 23 Nov 2022 10:39:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: Require VM_PFNMAP vma for
 mmap
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20221122170801.842766-1-daniel.vetter@ffwll.ch>
 <Y30PDdsvHIJo5YHR@ziepe.ca>
 <CAKMK7uEccwYTNwDYQazmZvTfBFQOikZt5A6BmegweyO-inKYbQ@mail.gmail.com>
 <Y30Z4VxT7Wdoc1Lc@ziepe.ca>
 <CAKMK7uE=8eqyh9BKg_+7B1jjMi6K4wrmPyi9xeLVvVYFxBgF9g@mail.gmail.com>
 <Y30kK6dsssSLJVgp@ziepe.ca>
 <CAKMK7uFQQkG82PzuSTGQTnN3ZNps5N_4TjR5NRWo0LaJkEaNew@mail.gmail.com>
 <3d8607b4-973d-945d-c184-260157ade7c3@amd.com>
 <CAKMK7uHVGgGHTiXYOfseXXda2Ug992nYvhPsL+4z18ssqeHXHQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAKMK7uHVGgGHTiXYOfseXXda2Ug992nYvhPsL+4z18ssqeHXHQ@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>, linaro-mm-sig@lists.linaro.org,
 Jason Gunthorpe <jgg@ziepe.ca>, John Stultz <john.stultz@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.11.22 um 10:30 schrieb Daniel Vetter:
> On Wed, 23 Nov 2022 at 10:06, Christian König <christian.koenig@amd.com> wrote:
>> Am 22.11.22 um 20:50 schrieb Daniel Vetter:
>>> On Tue, 22 Nov 2022 at 20:34, Jason Gunthorpe <jgg@ziepe.ca> wrote:
>>>> On Tue, Nov 22, 2022 at 08:29:05PM +0100, Daniel Vetter wrote:
>>>>> You nuke all the ptes. Drivers that move have slightly more than a
>>>>> bare struct file, they also have a struct address_space so that
>>>>> invalidate_mapping_range() works.
>>>> Okay, this is one of the ways that this can be made to work correctly,
>>>> as long as you never allow GUP/GUP_fast to succeed on the PTEs. (this
>>>> was the DAX mistake)
>>> Hence this patch, to enforce that no dma-buf exporter gets this wrong.
>>> Which some did, and then blamed bug reporters for the resulting splats
>>> :-) One of the things we've reverted was the ttm huge pte support,
>>> since that doesn't have the pmd_special flag (yet) and so would let
>>> gup_fast through.
>> The problem is not only gup, a lot of people seem to assume that when
>> you are able to grab a reference to a page that the ptes pointing to
>> that page can't change any more. And that's obviously incorrect.
>>
>> I witnessed tons of discussions about that already. Some customers even
>> modified our code assuming that and then wondered why the heck they ran
>> into data corruption.
>>
>> It's gotten so bad that I've even proposed intentionally mangling the
>> page reference count on TTM allocated pages:
>> https://patchwork.kernel.org/project/dri-devel/patch/20220927143529.135689-1-christian.koenig@amd.com/
> Yeah maybe something like this could be applied after we land this
> patch here.

I think both should land ASAP. We don't have any other way than to 
clearly point out incorrect approaches if we want to prevent the 
resulting data corruption.

> Well maybe should have the same check in gem mmap code to
> make sure no driver

Reads like the sentence is somehow cut of?

>
>> I think it would be better that instead of having special flags in the
>> ptes and vmas that you can't follow them to a page structure we would
>> add something to the page indicating that you can't grab a reference to
>> it. But this might break some use cases as well.
> Afaik the problem with that is that there's no free page bits left for
> these debug checks. Plus the pte+vma flags are the flags to make this
> clear already.

Maybe a GFP flag to set the page reference count to zero or something 
like this?

Christian.

> -Daniel

