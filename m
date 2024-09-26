Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB409874B2
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 15:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56E010EB5D;
	Thu, 26 Sep 2024 13:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CYM2T3F7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B7210EB57
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 13:47:19 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-20aff65aa37so8995055ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 06:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727358439; x=1727963239; darn=lists.freedesktop.org;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WKuvzZ1iHkE+4JD+m+TAwEuUR4+8h0slt2R/Vn8nR+o=;
 b=CYM2T3F7UqCIXd4lBei408eDA9X10164n5JnMd8H/1BV9Nz6MKiE+wF4KwUBhIlDIU
 XSTxl4rNoki0V0RtxQPKCSUiVsfrGEWUbppobYIqc5qxjJqrmxZu7H6o9tuyggLioDpx
 rijEhKHmHwUdJqTws/Wq/EyDrL7rjPWH+PARNGuzjhzCwrxarNcFm6TJ/+BuoeCrpwIq
 p6CBVBuPN37NFgQuVY8LLe1Ie4PK1Zalsba6c9bF0yQsvHY/pOWpg6eFnWWjDp72+3Il
 bWMn8bQX7GRGgljm2zBrOtszU5YSQSKG6ro323WYTHrsGtU81hEfjygBgumSeC+SV5ii
 gxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727358439; x=1727963239;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WKuvzZ1iHkE+4JD+m+TAwEuUR4+8h0slt2R/Vn8nR+o=;
 b=biRjU9bXinorjeRecUVLJU5sgCtOnTKifQXzIJWkrb5Xr6fuwQOHN68UOZVdzn/KOH
 o4yNgbPXBHP7y2TDNhYRs4LESVsomz85yCBy0Y53etapo3H/MB+7VqazQrAdxxKAqdkx
 oPXsPlf/ISZoK/eBKfdkbWMLU1E0z+y/GfY1Hu+ks086R+dvnRxBrtqhMhEciJMCRhHV
 6i5wcCGO/NRoglPwOKQASeubeNSu0Gv51tpEg66zvvMDhz/f0VRDIblQtDM4gQ5+t9/p
 1n0P48KJGAj8Fwmwh3fYT41TF6cPBcFQCZy4ieEI7w11TxsCldAhe4/u1V8fb3ax63sy
 4jcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK8QFL+OmvQ03uYofoCFfOpbtqJhMmGlkIlUuW+SHm5PDbQ2le6wG//xebCDpwI8w5e45RTlYXKME=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPSoBWhKwYzRt3FOksBdne0Cxn/IXa4Adr5ixmrXNKBxlg67px
 7dt31b2iQ17OxUJayU6kqdvydTocSR52TphhUv/mGSRttFHpQyZ3noGy0EQPKu3L79dLAtjVONZ
 /
X-Google-Smtp-Source: AGHT+IG0CsqHQgL3rtm32aloek7Evh4y754mbQBvDVIsKtxJMZiHCnjxRQreL1LcO1E/1QzfRr0cLA==
X-Received: by 2002:a17:902:dac1:b0:206:b250:1e1 with SMTP id
 d9443c01a7336-20afc4cd9bamr91910405ad.45.1727358439002; 
 Thu, 26 Sep 2024 06:47:19 -0700 (PDT)
Received: from [192.168.1.36] ([223.178.210.45])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20af1869000sm38970055ad.307.2024.09.26.06.47.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Sep 2024 06:47:18 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------2JiO4mqoAz3Ss811mB0lEctH"
Message-ID: <2f9a4abe-b2fc-4bc7-9926-1da2d38f5080@linaro.org>
Date: Thu, 26 Sep 2024 19:17:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] Re: [RFC PATCH 0/4] Linaro restricted heap
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Andrew Davis <afd@ti.com>, Jens Wiklander <jens.wiklander@linaro.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
 <d8e0cb78-7cfb-42bf-b3a5-f765592e8dd4@ti.com>
 <mzur3odofwwrdqnystozjgf3qtvb73wqjm6g2vf5dfsqiehaxk@u67fcarhm6ge>
 <e967e382-6cca-4dee-8333-39892d532f71@gmail.com>
 <lk7a2xuqrctyywuanjwseh5lkcz3soatc2zf3kn3uwc43pdyic@edm3hcd2koas>
 <04caa788-19a6-4336-985c-4eb191c24438@amd.com>
Content-Language: en-US
From: Sumit Garg <sumit.garg@linaro.org>
In-Reply-To: <04caa788-19a6-4336-985c-4eb191c24438@amd.com>
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

This is a multi-part message in MIME format.
--------------2JiO4mqoAz3Ss811mB0lEctH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/25/24 19:31, Christian König wrote:
> Am 25.09.24 um 14:51 schrieb Dmitry Baryshkov:
>> On Wed, Sep 25, 2024 at 10:51:15AM GMT, Christian König wrote:
>>> Am 25.09.24 um 01:05 schrieb Dmitry Baryshkov:
>>>> On Tue, Sep 24, 2024 at 01:13:18PM GMT, Andrew Davis wrote:
>>>>> On 9/23/24 1:33 AM, Dmitry Baryshkov wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On Fri, Aug 30, 2024 at 09:03:47AM GMT, Jens Wiklander wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> This patch set is based on top of Yong Wu's restricted heap patch set [1].
>>>>>>> It's also a continuation on Olivier's Add dma-buf secure-heap patch set [2].
>>>>>>>
>>>>>>> The Linaro restricted heap uses genalloc in the kernel to manage the heap
>>>>>>> carvout. This is a difference from the Mediatek restricted heap which
>>>>>>> relies on the secure world to manage the carveout.
>>>>>>>
>>>>>>> I've tried to adress the comments on [2], but [1] introduces changes so I'm
>>>>>>> afraid I've had to skip some comments.
>>>>>> I know I have raised the same question during LPC (in connection to
>>>>>> Qualcomm's dma-heap implementation). Is there any reason why we are
>>>>>> using generic heaps instead of allocating the dma-bufs on the device
>>>>>> side?
>>>>>>
>>>>>> In your case you already have TEE device, you can use it to allocate and
>>>>>> export dma-bufs, which then get imported by the V4L and DRM drivers.
>>>>>>
>>>>> This goes to the heart of why we have dma-heaps in the first place.
>>>>> We don't want to burden userspace with having to figure out the right
>>>>> place to get a dma-buf for a given use-case on a given hardware.
>>>>> That would be very non-portable, and fail at the core purpose of
>>>>> a kernel: to abstract hardware specifics away.
>>>> Unfortunately all proposals to use dma-buf heaps were moving in the
>>>> described direction: let app select (somehow) from a platform- and
>>>> vendor- specific list of dma-buf heaps. In the kernel we at least know
>>>> the platform on which the system is running. Userspace generally doesn't
>>>> (and shouldn't). As such, it seems better to me to keep the knowledge in
>>>> the kernel and allow userspace do its job by calling into existing
>>>> device drivers.
>>> The idea of letting the kernel fully abstract away the complexity of inter
>>> device data exchange is a completely failed design. There has been plenty of
>>> evidence for that over the years.
>>>
>>> Because of this in DMA-buf it's an intentional design decision that
>>> userspace and *not* the kernel decides where and what to allocate from.
>> Hmm, ok.
>>
>>> What the kernel should provide are the necessary information what type of
>>> memory a device can work with and if certain memory is accessible or not.
>>> This is the part which is unfortunately still not well defined nor
>>> implemented at the moment.
>>>
>>> Apart from that there are a whole bunch of intentional design decision which
>>> should prevent developers to move allocation decision inside the kernel. For
>>> example DMA-buf doesn't know what the content of the buffer is (except for
>>> it's total size) and which use cases a buffer will be used with.
>>>
>>> So the question if memory should be exposed through DMA-heaps or a driver
>>> specific allocator is not a question of abstraction, but rather one of the
>>> physical location and accessibility of the memory.
>>>
>>> If the memory is attached to any physical device, e.g. local memory on a
>>> dGPU, FPGA PCIe BAR, RDMA, camera internal memory etc, then expose the
>>> memory as device specific allocator.
>> So, for embedded systems with unified memory all buffers (maybe except
>> PCIe BARs) should come from DMA-BUF heaps, correct?
>
> From what I know that is correct, yes. Question is really if that will 
> stay this way.
>
> Neural accelerators look a lot stripped down FPGAs these days and the 
> benefit of local memory for GPUs is known for decades.
>
> Could be that designs with local specialized memory see a revival any 
> time, who knows.
>
>>> If the memory is not physically attached to any device, but rather just
>>> memory attached to the CPU or a system wide memory controller then expose
>>> the memory as DMA-heap with specific requirements (e.g. certain sized pages,
>>> contiguous, restricted, encrypted, ...).
>> Is encrypted / protected a part of the allocation contract or should it
>> be enforced separately via a call to TEE / SCM / anything else?
>
> Well that is a really good question I can't fully answer either. From 
> what I know now I would say it depends on the design.
>
IMHO, I think Dmitry's proposal to rather allow TEE device being 
allocator and exporter of DMA-bufs related to restricted memory makes 
sense to me. Since it's really the TEE implementation (OP-TEE, AMD-TEE, 
TS-TEE or future QTEE) which sets up the restrictions on a particular 
piece of allocated memory. AFAIK, that happens after the DMA-buf gets 
allocated and then user-space calls into TEE to setup which media 
pipeline is going to access that particular DMA-buf. It can also be a 
static contract depending on a particular platform design.

As Jens noted in the other thread, we already manage shared memory 
allocations (from a static carve-out or dynamically mapped) for 
communications among Linux and TEE that were based on DMA-bufs earlier 
but since we didn't required them to be shared with other devices, so we 
rather switched to anonymous memory.

 From user-space perspective, it's cleaner to use TEE device IOCTLs for 
DMA-buf allocations since it already know to which underlying TEE 
implementation it's communicating with rather than first figuring out 
which DMA heap to use for allocation and then communicating with TEE 
implementation.

-Sumit

--------------2JiO4mqoAz3Ss811mB0lEctH
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 9/25/24 19:31, Christian König
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:04caa788-19a6-4336-985c-4eb191c24438@amd.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      Am 25.09.24 um 14:51 schrieb Dmitry Baryshkov:<br>
      <blockquote type="cite"
cite="mid:lk7a2xuqrctyywuanjwseh5lkcz3soatc2zf3kn3uwc43pdyic@edm3hcd2koas">
        <pre class="moz-quote-pre" wrap="">On Wed, Sep 25, 2024 at 10:51:15AM GMT, Christian König wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Am 25.09.24 um 01:05 schrieb Dmitry Baryshkov:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On Tue, Sep 24, 2024 at 01:13:18PM GMT, Andrew Davis wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">On 9/23/24 1:33 AM, Dmitry Baryshkov wrote:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Hi,

On Fri, Aug 30, 2024 at 09:03:47AM GMT, Jens Wiklander wrote:
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">Hi,

This patch set is based on top of Yong Wu's restricted heap patch set [1].
It's also a continuation on Olivier's Add dma-buf secure-heap patch set [2].

The Linaro restricted heap uses genalloc in the kernel to manage the heap
carvout. This is a difference from the Mediatek restricted heap which
relies on the secure world to manage the carveout.

I've tried to adress the comments on [2], but [1] introduces changes so I'm
afraid I've had to skip some comments.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">I know I have raised the same question during LPC (in connection to
Qualcomm's dma-heap implementation). Is there any reason why we are
using generic heaps instead of allocating the dma-bufs on the device
side?

In your case you already have TEE device, you can use it to allocate and
export dma-bufs, which then get imported by the V4L and DRM drivers.

</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">This goes to the heart of why we have dma-heaps in the first place.
We don't want to burden userspace with having to figure out the right
place to get a dma-buf for a given use-case on a given hardware.
That would be very non-portable, and fail at the core purpose of
a kernel: to abstract hardware specifics away.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Unfortunately all proposals to use dma-buf heaps were moving in the
described direction: let app select (somehow) from a platform- and
vendor- specific list of dma-buf heaps. In the kernel we at least know
the platform on which the system is running. Userspace generally doesn't
(and shouldn't). As such, it seems better to me to keep the knowledge in
the kernel and allow userspace do its job by calling into existing
device drivers.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">The idea of letting the kernel fully abstract away the complexity of inter
device data exchange is a completely failed design. There has been plenty of
evidence for that over the years.

Because of this in DMA-buf it's an intentional design decision that
userspace and *not* the kernel decides where and what to allocate from.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Hmm, ok.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">What the kernel should provide are the necessary information what type of
memory a device can work with and if certain memory is accessible or not.
This is the part which is unfortunately still not well defined nor
implemented at the moment.

Apart from that there are a whole bunch of intentional design decision which
should prevent developers to move allocation decision inside the kernel. For
example DMA-buf doesn't know what the content of the buffer is (except for
it's total size) and which use cases a buffer will be used with.

So the question if memory should be exposed through DMA-heaps or a driver
specific allocator is not a question of abstraction, but rather one of the
physical location and accessibility of the memory.

If the memory is attached to any physical device, e.g. local memory on a
dGPU, FPGA PCIe BAR, RDMA, camera internal memory etc, then expose the
memory as device specific allocator.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">So, for embedded systems with unified memory all buffers (maybe except
PCIe BARs) should come from DMA-BUF heaps, correct?</pre>
      </blockquote>
      <br>
      From what I know that is correct, yes. Question is really if that
      will stay this way.<br>
      <br>
      Neural accelerators look a lot stripped down FPGAs these days and
      the benefit of local memory for GPUs is known for decades.<br>
      <br>
      Could be that designs with local specialized memory see a revival
      any time, who knows.<br>
      <br>
      <span style="white-space: pre-wrap">
</span>
      <blockquote type="cite"
cite="mid:lk7a2xuqrctyywuanjwseh5lkcz3soatc2zf3kn3uwc43pdyic@edm3hcd2koas">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">If the memory is not physically attached to any device, but rather just
memory attached to the CPU or a system wide memory controller then expose
the memory as DMA-heap with specific requirements (e.g. certain sized pages,
contiguous, restricted, encrypted, ...).
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Is encrypted / protected a part of the allocation contract or should it
be enforced separately via a call to TEE / SCM / anything else?
</pre>
      </blockquote>
      <br>
      Well that is a really good question I can't fully answer either.
      From what I know now I would say it depends on the design.<br>
      <br>
    </blockquote>
    <p>IMHO, I think Dmitry's proposal to rather allow TEE device being
      allocator and exporter of DMA-bufs related to restricted memory
      makes sense to me. Since it's really the TEE implementation
      (OP-TEE, AMD-TEE, TS-TEE or future QTEE) which sets up the
      restrictions on a particular piece of allocated memory. AFAIK,
      that happens after the DMA-buf gets allocated and then user-space
      calls into TEE to setup which media pipeline is going to access
      that particular DMA-buf. It can also be a static contract
      depending on a particular platform design.<br>
    </p>
    <p>As Jens noted in the other thread, we already manage shared
      memory allocations (from a static carve-out or dynamically mapped)
      for communications among Linux and TEE that were based on DMA-bufs
      earlier but since we didn't required them to be shared with other
      devices, so we rather switched to anonymous memory.<br>
    </p>
    <p>From user-space perspective, it's cleaner to use TEE device
      IOCTLs for DMA-buf allocations since it already know to which
      underlying TEE implementation it's communicating with rather than
      first figuring out which DMA heap to use for allocation and then
      communicating with TEE implementation.<br>
    </p>
    <p>-Sumit<br>
    </p>
  </body>
</html>

--------------2JiO4mqoAz3Ss811mB0lEctH--
