Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 285F4616197
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 12:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6137110E477;
	Wed,  2 Nov 2022 11:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D9610E47E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 11:18:05 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id 13so44415635ejn.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 04:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PT7usyHorNc+eagc7++kft1owL4KOrZq2wYnn7g6w4k=;
 b=R0aAmd9O8wIg+f+au36TUKLxmP6HbcnlZut9V+4GtjQYMXHhaOfwVJkZCjE0wn6d/k
 fv7zFy22lxPsD2BdHavNoPP3aoitLlFqjhGnrGyOD6xHihe15ovaY52knTCtk2ZbkEKV
 BBU7fiAxF6MratcizxKWSa0/Zxu//K0adbNpE+L+fYRw0bPsIUdgv+f0kkDiWQUIRj3Z
 nHxdKRxqaeQvNxumuGtaMZgD1HQZwkqJHMTE9UlB7BtvUkwAApdTjpNmJe7+5JsrvT2o
 wj2HXqS/4mdt7QB3WlLrmOCc4TU/8gedOYl5OND4mehSqhUbHNaFrDXYTjUtXPhaDmjG
 EP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PT7usyHorNc+eagc7++kft1owL4KOrZq2wYnn7g6w4k=;
 b=v9R+fdOs9Km46IG0x9NF7MacFEsjYMrNb/3WfOASk0LE5yeCzasKadYU1ERjzYAn95
 C42rn+6GbWiQS/xrajr11HPRw8gFU7/AO35HMVJ2MNz4lS1nmQ0XVI25rw07K4bbrjTN
 fRXuQNVOMElEJM+2EBWUh7V/j287oCPuJxMfZiOzp071Uw4qDUcScVuEUg4BZM8pqQU3
 yUQhzNDmorW5EDrdqMcJTimqOgH2voPYYXq3sL6wLkC6wGTqk6FrZs3FnsjTEYah1ouI
 +w5pKtJuf5nHjeK/ZLgkq+m+MqgWP/lzjNkF0VlY8ezmB9fA092VgxEC/FZw539/l1ut
 PHbA==
X-Gm-Message-State: ACrzQf0wgIIXpbAxZLb2NpJfiz3XW3F47W9UbtSxXGlPAxYBmfRXbnM0
 YOEaJyyJ8dkFnCrpRO6UQ+4=
X-Google-Smtp-Source: AMsMyM7tnylHAI4DN/vGOWi9kX355glWeRJ+uaNDLjf84/JABguIpzkgAyMHiB+ZMWG0adD9cglyKw==
X-Received: by 2002:a17:907:8b18:b0:7ad:d1f5:2f80 with SMTP id
 sz24-20020a1709078b1800b007add1f52f80mr15750600ejc.661.1667387883542; 
 Wed, 02 Nov 2022 04:18:03 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:576c:b102:647e:9ffd?
 ([2a02:908:1256:79a0:576c:b102:647e:9ffd])
 by smtp.gmail.com with ESMTPSA id
 ja25-20020a170907989900b0079b9f7509a0sm5328041ejc.52.2022.11.02.04.18.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 04:18:02 -0700 (PDT)
Message-ID: <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
Date: Wed, 2 Nov 2022 12:18:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Try to address the DMA-buf coherency problem
Content-Language: en-US
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Daniel Stone <daniel@fooishbar.org>
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <3d7353f3fa5905ce18e5b2d92f758f098189bc5a.camel@pengutronix.de>
 <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com>
 <f5de84cfe81fee828bbe0d47d379028d28ef6ca6.camel@pengutronix.de>
 <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com>
 <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
 <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
 <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
 <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com>
 <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: ppaalanen@gmail.com, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.11.22 um 22:09 schrieb Nicolas Dufresne:
> [SNIP]
>>> But the client is just a video player. It doesn't understand how to
>>> allocate BOs for Panfrost or AMD or etnaviv. So without a universal
>>> allocator (again ...), 'just allocate on the GPU' isn't a useful
>>> response to the client.
>> Well exactly that's the point I'm raising: The client *must* understand
>> that!
>>
>> See we need to be able to handle all restrictions here, coherency of the
>> data is just one of them.
>>
>> For example the much more important question is the location of the data
>> and for this allocating from the V4L2 device is in most cases just not
>> going to fly.
> It feels like this is a generic statement and there is no reason it could not be
> the other way around.

And exactly that's my point. You always need to look at both ways to 
share the buffer and can't assume that one will always work.

As far as I can see it you guys just allocate a buffer from a V4L2 
device, fill it with data and send it to Wayland for displaying.

To be honest I'm really surprised that the Wayland guys hasn't pushed 
back on this practice already.

This only works because the Wayland as well as X display pipeline is 
smart enough to insert an extra copy when it find that an imported 
buffer can't be used as a framebuffer directly.

>   I have colleague who integrated PCIe CODEC (Blaize Xplorer
> X1600P PCIe Accelerator) hosting their own RAM. There was large amount of ways
> to use it. Of course, in current state of DMABuf, you have to be an exporter to
> do anything fancy, but it did not have to be like this, its a design choice. I'm
> not sure in the end what was the final method used, the driver isn't yet
> upstream, so maybe that is not even final. What I know is that there is various
> condition you may use the CODEC for which the optimal location will vary. As an
> example, using the post processor or not, see my next comment for more details.

Yeah, and stuff like this was already discussed multiple times. Local 
memory of devices can only be made available by the exporter, not the 
importer.

So in the case of separated camera and encoder you run into exactly the 
same limitation that some device needs the allocation to happen on the 
camera while others need it on the encoder.

>> The more common case is that you need to allocate from the GPU and then
>> import that into the V4L2 device. The background is that all dGPUs I
>> know of need the data inside local memory (VRAM) to be able to scan out
>> from it.
> The reality is that what is common to you, might not be to others. In my work,
> most ARM SoC have display that just handle direct scannout from cameras and
> codecs.

> The only case the commonly fails is whenever we try to display UVC
> created dmabuf,

Well, exactly that's not correct! The whole x86 use cases of direct 
display for dGPUs are broken because media players think they can do the 
simple thing and offload all the problematic cases to the display server.

This is absolutely *not* the common use case you describe here, but 
rather something completely special to ARM.

>   which have dirty CPU write cache and this is the type of thing
> we'd like to see solved. I think this series was addressing it in principle, but
> failing the import and the raised point is that this wasn't the optimal way.
>
> There is a community project called LibreELEC, if you aren't aware, they run
> Khodi with direct scanout of video stream on a wide variety of SoC and they use
> the CODEC as exporter all the time. They simply don't have cases were the
> opposite is needed (or any kind of remote RAM to deal with). In fact, FFMPEG
> does not really offer you any API to reverse the allocation.

Ok, let me try to explain it once more. It sounds like I wasn't able to 
get my point through.

That we haven't heard anybody screaming that x86 doesn't work is just 
because we handle the case that a buffer isn't directly displayable in 
X/Wayland anyway, but this is absolutely not the optimal solution.

The argument that you want to keep the allocation on the codec side is 
completely false as far as I can see.

We already had numerous projects where we reported this practice as bugs 
to the GStreamer and FFMPEG project because it won't work on x86 with dGPUs.

This is just a software solution which works because of coincident and 
not because of engineering.

Regards,
Christian.


