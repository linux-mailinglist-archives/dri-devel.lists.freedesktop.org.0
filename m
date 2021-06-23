Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D928F3B1653
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 10:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DD36E88A;
	Wed, 23 Jun 2021 08:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E906E402;
 Wed, 23 Jun 2021 08:57:38 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id m18so1738602wrv.2;
 Wed, 23 Jun 2021 01:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ZDxBkMAz03P8f+aMbelwxHltUcPmaJQiAy762htmSOw=;
 b=gKPDCYXud3/Ny6GugpuD8PxV3Af5S6G9njiquRSYdnYuIyUPc5d4pP41bLP8IncC+b
 q0G+HGYLvTHmPkI8X4/wi97s/dtCDFf49XbHlQi3Y8XHCnuItPph3HC8KyweTZ73ISLS
 6U70DcSwpJUikE7mrhXsZVWSIjwXeGdbOwnc7Gqoc2QWpTyRWMdjNrQM48WmgKKpatH8
 rBMNFlxNEU7ReMuigAM0E6MsLA5W/Uz06GOd1A8ft0Tyi8xffgc2Iz9N5ULy5mLXvBvT
 cN+ZLDZs6oxy0wovyiU+HR9yKzaIKdGhpmY80/A/dYDf/wFVdMrbAX+Lqv+PElUMYYoR
 h9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ZDxBkMAz03P8f+aMbelwxHltUcPmaJQiAy762htmSOw=;
 b=BgL0CD1kYEdCYmMh0BqzrkWqegoAKObQlOEwHtTG+0pa8YtSn2wokf6XJrGyi4+w06
 zh/qSZqnhQK7J2rN+Dv5VeEqzKP11TBhLO0ho542sw90pBnmVKgZi3Tl+O6D0PNYBY+Z
 hnzALBxEi9OFhD9PfNowbVB+2VzZYfs77tUUfBTW4fwbTblYjEehEoyolXFX/lW5Rciw
 RjdhXz0mHXn3dua0WvBG3ev7HFb1/6K1wXzztSlbcstN15X/sNUke5qU9bYd/WLytn/F
 PMZcWKWDTrgaJGSflkmZM2D8/sM3/WS54cxdRmCQvtfkWV3VHq1J2xPP8MfVDk5coi6A
 42xQ==
X-Gm-Message-State: AOAM533j0YQDo8EutUMtPsdODXIVX+02d493dkFbZd3z1SG7r4+U375B
 jru+QEyhf65J9xm+bnmFu8w=
X-Google-Smtp-Source: ABdhPJyO8408BeqPk1gg6ZvXlAibkwfvIR/i0k8QSdflfw+3uxptNWJCkjKtYAdDMMiuTI3v4KYHDw==
X-Received: by 2002:adf:8b4d:: with SMTP id v13mr9929193wra.223.1624438657460; 
 Wed, 23 Jun 2021 01:57:37 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:69e4:a619:aa86:4e9c?
 ([2a02:908:1252:fb60:69e4:a619:aa86:4e9c])
 by smtp.gmail.com with ESMTPSA id u12sm2195254wrr.40.2021.06.23.01.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 01:57:36 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
To: Jason Gunthorpe <jgg@ziepe.ca>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
References: <CAFCwf11jOnewkbLuxUESswCJpyo7C0ovZj80UrnwUOZkPv2JYQ@mail.gmail.com>
 <20210621232912.GK1096940@ziepe.ca>
 <d358c740-fd3a-9ecd-7001-676e2cb44ec9@gmail.com>
 <CAFCwf11h_Nj_GEdCdeTzO5jgr-Y9em+W-v_pYUfz64i5Ac25yg@mail.gmail.com>
 <20210622120142.GL1096940@ziepe.ca>
 <d497b0a2-897e-adff-295c-cf0f4ff93cb4@amd.com>
 <20210622152343.GO1096940@ziepe.ca>
 <3fabe8b7-7174-bf49-5ffe-26db30968a27@amd.com>
 <20210622154027.GS1096940@ziepe.ca>
 <09df4a03-d99c-3949-05b2-8b49c71a109e@amd.com>
 <20210622160538.GT1096940@ziepe.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d600a638-9e55-6249-b574-0986cd5cea1e@gmail.com>
Date: Wed, 23 Jun 2021 10:57:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622160538.GT1096940@ziepe.ca>
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, sleybo@amazon.com,
 Gal Pressman <galpress@amazon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Christoph Hellwig <hch@lst.de>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Doug Ledford <dledford@redhat.com>, Tomer Tayar <ttayar@habana.ai>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <alexander.deucher@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>, Oded Gabbay <ogabbay@kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.06.21 um 18:05 schrieb Jason Gunthorpe:
> On Tue, Jun 22, 2021 at 05:48:10PM +0200, Christian König wrote:
>> Am 22.06.21 um 17:40 schrieb Jason Gunthorpe:
>>> On Tue, Jun 22, 2021 at 05:29:01PM +0200, Christian König wrote:
>>>> [SNIP]
>>>> No absolutely not. NVidia GPUs work exactly the same way.
>>>>
>>>> And you have tons of similar cases in embedded and SoC systems where
>>>> intermediate memory between devices isn't directly addressable with the CPU.
>>> None of that is PCI P2P.
>>>
>>> It is all some specialty direct transfer.
>>>
>>> You can't reasonably call dma_map_resource() on non CPU mapped memory
>>> for instance, what address would you pass?
>>>
>>> Do not confuse "I am doing transfers between two HW blocks" with PCI
>>> Peer to Peer DMA transfers - the latter is a very narrow subcase.
>>>
>>>> No, just using the dma_map_resource() interface.
>>> Ik, but yes that does "work". Logan's series is better.
>> No it isn't. It makes devices depend on allocating struct pages for their
>> BARs which is not necessary nor desired.
> Which dramatically reduces the cost of establishing DMA mappings, a
> loop of dma_map_resource() is very expensive.

Yeah, but that is perfectly ok. Our BAR allocations are either in chunks 
of at least 2MiB or only a single 4KiB page.

Oded might run into more performance problems, but those DMA-buf 
mappings are usually set up only once.

>> How do you prevent direct I/O on those pages for example?
> GUP fails.

At least that is calming.

>> Allocating a struct pages has their use case, for example for exposing VRAM
>> as memory for HMM. But that is something very specific and should not limit
>> PCIe P2P DMA in general.
> Sure, but that is an ideal we are far from obtaining, and nobody wants
> to work on it prefering to do hacky hacky like this.
>
> If you believe in this then remove the scatter list from dmabuf, add a
> new set of dma_map* APIs to work on physical addresses and all the
> other stuff needed.

Yeah, that's what I totally agree on. And I actually hoped that the new 
P2P work for PCIe would go into that direction, but that didn't 
materialized.

But allocating struct pages for PCIe BARs which are essentially 
registers and not memory is much more hacky than the dma_resource_map() 
approach.

To re-iterate why I think that having struct pages for those BARs is a 
bad idea: Our doorbells on AMD GPUs are write and read pointers for ring 
buffers.

When you write to the BAR you essentially tell the firmware that you 
have either filled the ring buffer or read a bunch of it. This in turn 
then triggers an interrupt in the hardware/firmware which was eventually 
asleep.

By using PCIe P2P we want to avoid the round trip to the CPU when one 
device has filled the ring buffer and another device must be woken up to 
process it.

Think of it as MSI-X in reverse and allocating struct pages for those 
BARs just to work around the shortcomings of the DMA API makes no sense 
at all to me.


We also do have the VRAM BAR, and for HMM we do allocate struct pages 
for the address range exposed there. But this is a different use case.

Regards,
Christian.

>
> Otherwise, we have what we have and drivers don't get to opt out. This
> is why the stuff in AMDGPU was NAK'd.
>
> Jason

