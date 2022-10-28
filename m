Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86198610C5D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 10:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEFA10E7A6;
	Fri, 28 Oct 2022 08:40:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCBD10E11D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 08:40:30 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id t25so11337448ejb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 01:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kFzvTU+1nAE3iwfdvDEuobErZlYN2b9+VxFUpewI2uQ=;
 b=ZF5xafTGQXY3dLRXGpUPQI58MFME9iFSrvhSSQANv2XlgJpSgRF8gGJvmGdzF0iDQa
 dD0ZnJ9IPxYHzCa7ui41/jBPzXrbqG4rIqXk4Hyna3QGAmz+hiVEfHBYVyDnJ6Bid20z
 pAALcjxGflPtP693L872fGTki0bOJgtN3+q0JR9ks0Xqqh5+FIx0aEkCGpPCJcxQv0vt
 4GLctE81YpPgUflNXFzwudsR+cJNZMSrIlsyhbsCX2wGfkvebhVP1zLNnjkNogwNIJ6R
 xGAdwTcI8wV1rqhMqZeov+EXTZdJuojD7Odhz+7nsLUKKiugXctm6y4jHe5925LJwH87
 WRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kFzvTU+1nAE3iwfdvDEuobErZlYN2b9+VxFUpewI2uQ=;
 b=cB+3QzoEpbNOC1FsQwgqxkg6z4wgKaO8qRPaeqY0zI9ba61rOZXlR8sSwDTxStQPwY
 bRbPgRLUWAAP9wxk7WVfLlrNlDPdqjAIRU5ZTGaIoRQP4R9sVMuACeKrJ//kiwB2PZ25
 8GTcSeopZLJKCyn7JKXw6Z99NmEawrJJS8tLUz7R9cam29kOOa6/45QgGJkRWf+wyA45
 wf/RUgHoZLOsms9AfNCWwou8Udw5RS8rX7GNfITUrjC9P4/oJMxquu0ltqWxcBVGyyrq
 tlMqnPUJ1VwNDVurOWDQJ3mZXaGYe94KaCuSNvhunQsZ7lC+a0hbwdoDZuYuEQ9YaH2d
 vK1g==
X-Gm-Message-State: ACrzQf03N+xON5cZkInuY/MltBgoZyoadNv5TjwTCu3g2kwPtfJyPvR6
 QKRrpw97Cde6XN4+IIxUXdQ=
X-Google-Smtp-Source: AMsMyM58O/hVUnWovCLxC8TlPiHUIxF/NjE4ZXFsqqVwdPxIzfrQ2gFfAzK8PIcaOqAhVAtD4u9N0g==
X-Received: by 2002:a17:907:703:b0:78e:25be:5455 with SMTP id
 xb3-20020a170907070300b0078e25be5455mr45087232ejb.630.1666946428267; 
 Fri, 28 Oct 2022 01:40:28 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:9377:d2f2:2ed:af4b?
 ([2a02:908:1256:79a0:9377:d2f2:2ed:af4b])
 by smtp.gmail.com with ESMTPSA id
 lb14-20020a170907784e00b0078d22b0bcf2sm1791388ejc.168.2022.10.28.01.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 01:40:27 -0700 (PDT)
Message-ID: <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com>
Date: Fri, 28 Oct 2022 10:40:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Try to address the DMA-buf coherency problem
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, nicolas@ndufresne.ca,
 ppaalanen@gmail.com, sumit.semwal@linaro.org, daniel@ffwll.ch,
 robdclark@gmail.com, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <3d7353f3fa5905ce18e5b2d92f758f098189bc5a.camel@pengutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <3d7353f3fa5905ce18e5b2d92f758f098189bc5a.camel@pengutronix.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

Am 28.10.22 um 10:09 schrieb Lucas Stach:
> Hi Christian,
>
> Am Donnerstag, dem 20.10.2022 um 14:13 +0200 schrieb Christian König:
>> Hi guys,
>>
>> after finding that we essentially have two separate worlds for coherent sharing
>> of buffer through DMA-buf I thought I will tackle that problem a bit and at
>> least allow the framework to reject attachments which won't work.
>>
>> So those patches here add a new dma_coherent flag to each DMA-buf object
>> telling the framework that dev_is_dma_coherent() needs to return true for an
>> importing device to be able to attach. Since we should always have a fallback
>> path this should give userspace the chance to still keep the use case working,
>> either by doing a CPU copy instead or reversing the roles of exporter and
>> importer.
>>
> The fallback would likely be a CPU copy with the appropriate cache
> flushes done by the device driver, which would be a massiv performance
> issue.

But essentially the right thing to do. The only alternative I can see is 
to reverse the role of exporter and importer.

>> For DRM and most V4L2 devices I then fill in the dma_coherent flag based on the
>> return value of dev_is_dma_coherent(). Exporting drivers are allowed to clear
>> the flag for their buffers if special handling like the USWC flag in amdgpu or
>> the uncached allocations for radeon/nouveau are in use.
>>
> I don't think the V4L2 part works for most ARM systems. The default
> there is for devices to be noncoherent unless explicitly marked
> otherwise. I don't think any of the "devices" writing the video buffers
> in cached memory with the CPU do this. While we could probably mark
> them as coherent, I don't think this is moving in the right direction.

Well why not? Those devices are coherent in the sense of the DMA API 
that they don't need an extra CPU copy on sync_to_cpu/sync_to_device.

We could come up with a better name for coherency, e.g. snooping for 
example. But that is just an documentation detail.

>> Additional to that importers can also check the flag if they have some
>> non-snooping operations like the special scanout case for amdgpu for example.
>>
>> The patches are only smoke tested and the solution isn't ideal, but as far as
>> I can see should at least keep things working.
>>
> I would like to see this solved properly. Where I think properly means
> we make things work on systems with mixed coherent/noncoherent masters
> in the same way the DMA API does on such systems: by inserting the
> proper cache maintenance operations.

And this the exact wrong approach as far as I can see. As Daniel noted 
as well we absolutely need some kind of coherency between exporter and 
importer.

This can either be provided by the PCI specification which makes it 
mandatory for device to snoop the caches or by platform devices agreeing 
that they only work on uncached memory.

Explicit cache flush operations are simple not part of the design of 
DMA-buf because they are not part of the design of the higher level APIs 
like Vulkan and OpenGL.

Adding this to DMA-buf for the rather special use case would completely 
break that and make live much more complicated for everybody.

> I also think that we should keep in mind that the world is moving into
> a direction where DMA masters may not only snoop the CPU caches (what
> is the definition of cache coherent on x86), but actually take part in
> the system coherence and are able to have writeback caches for shared
> data on their own. I can only speculate, as I haven't seen the amdgpu
> side yet, but I think this proposal is moving in the other direction by
> assuming a central system cache, where the importer has some magic way
> to clean this central cache.

What you mean is CXL: https://en.wikipedia.org/wiki/Compute_Express_Link

And yes we support that in a bunch of configurations and also have 
worked with that and amdgpu with DMA-buf based shared.

This should not be a problem with this approach.

> Since I have a vested interest in seeing V4L2 UVC and non-coherent GPU
> dma-buf sharing work on ARM systems and seem to hold some strong
> opinions on how this should work, I guess I need to make some time
> available to type it up, so we can discuss over coder rather than
> abstract ideas. If I come up with something that works for my use-cases
> would you be up for taking a shot at a amdgpu implementation?

Well, not really. As I said I see what you have in mind here as 
completely wrong approach we will certainly not support in any GPU driver.

What we can do is to request the use case which won't work and this is 
exactly what the patch here does.

Regards,
Christian.

>
> Regards,
> Lucas
>

