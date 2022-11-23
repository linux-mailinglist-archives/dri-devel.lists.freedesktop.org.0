Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C787635F03
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 14:12:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8708310E3D3;
	Wed, 23 Nov 2022 13:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A02310E3D3;
 Wed, 23 Nov 2022 13:12:28 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id f27so42781743eje.1;
 Wed, 23 Nov 2022 05:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bvs98D7kn/blwT63+h55cu2gonMJ65ywZrI5Z5R+q8s=;
 b=CbKrP7EDuQM1+snQr1Bb3MbhbQ1msQARnAhP8lLIaw8jsoWgtUxr2YZuSk/BGmdbmJ
 CHML6hqeeAqT5QapkEJBOq5hHCB/AFN2yNlNe0UTVNNzfzV9/OUQvXEwNyHqnNUkvY1T
 XUteu4rleCYD+KdeDTBkycgH+nx6bdv7x5woMj/jfEdULmuRFG1kYORmlhBvWNHyjq/x
 H7opk6T9ej6goLupldeCS1Ai/LJlUZUOxPUAiwU0bK3GQ4OL9oZmnaLbFfWEJQr0UdrJ
 8M3M4FzvBqbSzpKZSgEd1wobGpuhu0JxJgOdz4rmFVlq1zq8VKc+WvA4aSOCyLsvSPc7
 tlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bvs98D7kn/blwT63+h55cu2gonMJ65ywZrI5Z5R+q8s=;
 b=WygBH6MwSmuEyUTJNZgYN9ttXj3DyjQqRJ4do7sTRZVMr/ggWiy9DLMs+fxwzdL8+Y
 eUq31xsiiiz0CxMZKbsSUDG6r7cjZZx0icp5dDpAsZc4i5Vynz7eep9sm42KJDd2ROht
 HlH99J159DWiQn3qYNBBvHGWkLluNyCVvHupwT3XY4pqjLB3pMZKoa5mW00SQYaUrC8m
 ZuOOmXPQoQ6i6tIw8Zezlk/2s51GhUDHKrX5+bD2EC1ozc41yZlzyqwSN2MbPR7RrNYd
 Piqp2otkzOIE4T6oOZXZVmA0c1/uBIQQVDyvpBBxbu3cA5nRKNQjJnU+q6Fx6UaI3ltM
 IHHQ==
X-Gm-Message-State: ANoB5pmGtlmbgQqNFx13tJfAAH19rukIHTtYMsDHK41byFN/ZDgkRCjt
 0hYpOnybAZOU6fdJHGaofiUYZrZQBSE=
X-Google-Smtp-Source: AA0mqf5Nj1HAYv/xJhMhjUhsdKhcctZzH8JOkFU/AOEqdt3oRJ5z0AWvGNokuhO7wHbBhMGKlisOWQ==
X-Received: by 2002:a17:906:1ecf:b0:7ad:902c:d1d6 with SMTP id
 m15-20020a1709061ecf00b007ad902cd1d6mr12072437ejj.143.1669209147048; 
 Wed, 23 Nov 2022 05:12:27 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:d2d7:ceea:efc2:af43?
 ([2a02:908:1256:79a0:d2d7:ceea:efc2:af43])
 by smtp.gmail.com with ESMTPSA id
 mh23-20020a170906eb9700b007af105a87cbsm7152028ejb.152.2022.11.23.05.12.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 05:12:26 -0800 (PST)
Message-ID: <dc2a9d7f-192b-e9d8-b1d1-3b868cb1fd44@gmail.com>
Date: Wed, 23 Nov 2022 14:12:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: Require VM_PFNMAP vma for
 mmap
Content-Language: en-US
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <Y30Z4VxT7Wdoc1Lc@ziepe.ca>
 <CAKMK7uE=8eqyh9BKg_+7B1jjMi6K4wrmPyi9xeLVvVYFxBgF9g@mail.gmail.com>
 <Y30kK6dsssSLJVgp@ziepe.ca>
 <CAKMK7uFQQkG82PzuSTGQTnN3ZNps5N_4TjR5NRWo0LaJkEaNew@mail.gmail.com>
 <3d8607b4-973d-945d-c184-260157ade7c3@amd.com>
 <CAKMK7uHVGgGHTiXYOfseXXda2Ug992nYvhPsL+4z18ssqeHXHQ@mail.gmail.com>
 <b05e6091-4e07-1e32-773d-f603ac9ac98b@gmail.com>
 <CAKMK7uFjmzewqv3r4hL9hvLADwV536n2n6xbAWaUvmAcStr5KQ@mail.gmail.com>
 <Y34WI9SZdiH/p1tA@ziepe.ca> <f8f844a5-0910-d19a-5aea-df7a1d83b1d3@gmail.com>
 <Y34XvmtHfb4ZwopN@ziepe.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <Y34XvmtHfb4ZwopN@ziepe.ca>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 John Stultz <john.stultz@linaro.org>, Matthew Wilcox <willy@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.11.22 um 13:53 schrieb Jason Gunthorpe:
> On Wed, Nov 23, 2022 at 01:49:41PM +0100, Christian König wrote:
>> Am 23.11.22 um 13:46 schrieb Jason Gunthorpe:
>>> On Wed, Nov 23, 2022 at 11:06:55AM +0100, Daniel Vetter wrote:
>>>
>>>>> Maybe a GFP flag to set the page reference count to zero or something
>>>>> like this?
>>>> Hm yeah that might work. I'm not sure what it will all break though?
>>>> And we'd need to make sure that underflowing the page refcount dies in
>>>> a backtrace.
>>> Mucking with the refcount like this to protect against crazy out of
>>> tree drives seems horrible..
>> Well not only out of tree drivers. The intree KVM got that horrible
>> wrong as well, those where the latest guys complaining about it.
> kvm was taking refs on special PTEs? That seems really unlikely?

Well then look at this code here:

commit add6a0cd1c5ba51b201e1361b05a5df817083618
Author: Paolo Bonzini <pbonzini@redhat.com>
Date:   Tue Jun 7 17:51:18 2016 +0200

     KVM: MMU: try to fix up page faults before giving up

     The vGPU folks would like to trap the first access to a BAR by setting
     vm_ops on the VMAs produced by mmap-ing a VFIO device.  The fault 
handler
     then can use remap_pfn_range to place some non-reserved pages in 
the VMA.

     This kind of VM_PFNMAP mapping is not handled by KVM, but follow_pfn
     and fixup_user_fault together help supporting it.  The patch also 
supports
     VM_MIXEDMAP vmas where the pfns are not reserved and thus subject to
     reference counting.

     Cc: Xiao Guangrong <guangrong.xiao@linux.intel.com>
     Cc: Andrea Arcangeli <aarcange@redhat.com>
     Cc: Radim Krčmář <rkrcmar@redhat.com>
     Tested-by: Neo Jia <cjia@nvidia.com>
     Reported-by: Kirti Wankhede <kwankhede@nvidia.com>
     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

And see also the discussion here: 
https://patchwork.freedesktop.org/patch/414123/

as well as here: https://patchwork.freedesktop.org/patch/499190/

I can't count how often I have pointed out that this is absolutely 
illegal and KVM can't touch pages in VMAs with VM_PFNMAP.

>>> The WARN_ON(pag_count(p) != 1) seems like a reasonable thing to do
>>> though, though you must combine this with the special PTE flag..
>> That's not sufficient. The pages are released much later than things
>> actually go wrong. In most cases this WARN_ON here won't hit.
> How so? As long as the page is mapped into the PTE there is no issue
> with corruption. If dmabuf checks the refcount after it does the unmap
> mapping range it should catch any bogus pin that might be confused
> about address coherency.

Yeah, that would work. The problem is this WARN_ON() comes much later.

The device drivers usually keep the page around for a while even after 
it is unmapped. IIRC the cleanup worker only runs every 10ms or so.

Christian.

>
> Jason

