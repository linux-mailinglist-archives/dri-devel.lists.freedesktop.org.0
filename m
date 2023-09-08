Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7DB79892F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 16:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A7810E8E2;
	Fri,  8 Sep 2023 14:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8E610E8DC
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 14:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694184543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oufUEK36o5NhysqillM/L1b2/HuhC7a1E/5I+OwcWzg=;
 b=BoWGHB/bFWm5mhRrZkcUvw2Eg8sPhmDJGzplvYCDaRGsPKxKXbk7IPkOy4B5wSg5riwtYC
 8/piJdc523Xv10ASVBHaH2QYZgK7YpWqxjWQidSCSMJKrv50XwaHCTi4OzmY7n8ut9C8jg
 +S/XyE9DxoFo/GkADlIpqWJOqfpBK1o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-rCH2-76UO2OItHRkZhA37g-1; Fri, 08 Sep 2023 10:49:02 -0400
X-MC-Unique: rCH2-76UO2OItHRkZhA37g-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-401bdff6bc5so14711935e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Sep 2023 07:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694184541; x=1694789341;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oufUEK36o5NhysqillM/L1b2/HuhC7a1E/5I+OwcWzg=;
 b=GUDC7HlW+hgUlFnzcBzd6JMFxSt4ctwNMHl7a8/kjRT3vqms/L5fuAk4qtswMsLsMG
 g4FEdJHSkUTeCqneJ48uJGxLrCaiUvZ+QRfRNbR+eT0V6e+3oH1eFHNEWiX3/0JVJcR9
 i7uIk7BjnP+D8yP1wsIk1maaHLFZ4wsKev1K6Y1xicylhuR3MAEHaGwQgDEQWrDvUIhx
 S+iE6utYszYetiBpn9V/51nkgVOxIqt3Eic1bwwmraX9YstQp49NvTVZqRhgrcMwvAEU
 lx23Ou6lo+EROS6JNnTAcYfmmI2b4n7BuYGuFXtGu0u4p7ILRC/UICEvO78VeDtlV6A0
 n8sw==
X-Gm-Message-State: AOJu0YzAYN+iAMPmM9g7f8uJ6kG4lMWxiyYGT8Y0ReEpdvI+tYr7LAIt
 G/TxhWp9v1H3V1tnhLedfGCW7J8cUd6lSAfmQS/xwLE5bs/NghpsQY3vWKNw/1tBN9QDT52mg3A
 CblQDxF3X1h6hJcqpsqOKxq1ApgCH
X-Received: by 2002:a05:600c:202:b0:3f7:cb42:fa28 with SMTP id
 2-20020a05600c020200b003f7cb42fa28mr2263284wmi.28.1694184541039; 
 Fri, 08 Sep 2023 07:49:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoLNxBcXaYG0LBPpgZZS1DKJFH01OLmxMfIFZ5aXuM3EyGU1vQeSE1Q3jvM18K4T+qcqyWWw==
X-Received: by 2002:a05:600c:202:b0:3f7:cb42:fa28 with SMTP id
 2-20020a05600c020200b003f7cb42fa28mr2263266wmi.28.1694184540658; 
 Fri, 08 Sep 2023 07:49:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 e11-20020adffc4b000000b0031f65cdd271sm2274898wrs.100.2023.09.08.07.48.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Sep 2023 07:49:00 -0700 (PDT)
Message-ID: <d19e0242-da31-1e48-8ff8-7381530bd193@redhat.com>
Date: Fri, 8 Sep 2023 16:48:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20230825140434.182664-1-jfalempe@redhat.com>
 <3f1bd1ad-cd1f-515d-38bd-63e412dec286@suse.de>
 <20230908141638.79b31d1e@eldfell>
 <4e3bd95a-fcda-2e39-46f7-ebbb78ae515d@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <4e3bd95a-fcda-2e39-46f7-ebbb78ae515d@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: javierm@redhat.com, mripard@kernel.org, dri-devel@lists.freedesktop.org,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/09/2023 15:56, Thomas Zimmermann wrote:
> Hi
> 
> Am 08.09.23 um 13:16 schrieb Pekka Paalanen:
>> On Fri, 8 Sep 2023 11:21:51 +0200
>> Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>
>>> Hi
>>>
>>> Am 25.08.23 um 16:04 schrieb Jocelyn Falempe:
>>> [...]
>>>> + *
>>>> + *     But there are two exceptions only for dumb buffers:
>>>> + *     * To support XRGB8888 if it's not supported by the hardware.
>>>
>>>
>>>> + *     * Any driver is free to modify its internal representation 
>>>> of the format,
>>>> + *       as long as it doesn't alter the visible content in any 
>>>> way, and doesn't
>>>> + *       modify the user-provided buffer. An example would be to 
>>>> drop the
>>>> + *       padding component from a format to save some memory 
>>>> bandwidth.
>>>
>>> I have strong objections to this point, _especially_ as you're
>>> apparently trying to sneak this in after our discussion. NAK on this
>>> part from my side.
>>>
>>> If you want userspace to be able to use a certain format, then export
>>> the corresponding 4cc code. Then let userspace decide what to do about
>>> it. If userspace pick a certain format, go with it.
>>
>> What is the reason for your objection, exactly?
>>
>>> Hence, no implicit conversion from XRGB888 to RGB888, just because it's
>>> possible.
>>
>> For the particular driver in question though, the conversion allows
>> using a display resolution that is otherwise not possible. I also hear
>> it improves performance since 25% less data needs to travel across a
>> slow bus. There is also so little VRAM, than all dumb buffers need to
>> be allocated from sysram instead anyway, so a copy is always necessary.
>>
>> Since XRGB8888 is the one format that is recommended to be supported by
>> all drivers, I don't see a problem here. Did you test on your
>> incredibly slow g200 test rig if the conversion ends up hurting instead
>> of helping performance there?
>>
>> If it hurts, then I see that you have a good reason to NAK this.
>>
>> It's hard to imagine how it would hurt, since you always need a copy
>> from sysram dumb buffers to VRAM - or do you?
> 
> I have a number of concerns. My point it not that we shouldn't optimize. 
> I just don't want it in the kernel. Mgag200 can export DRM_FORMAT_RGB888 
> for userspace to use.

It already does, it's just userspace doesn't want to support it.
> 
> AFAICT the main argument against userspace is that Mesa doesn't like 
> 3-byte pixels. But I don't see how this conversion cannot be a 
> post-processing step within Mesa: do the rendering in RGB32 and then 
> convert to a framebuffer in RGB24. Userspace can do that more 
> efficiently than the kernel. This has all of the upsides of reduced 
> bandwidth, but none of the downsides of kernel code. Applications and/or 
> Mesa would be in control of the buffer format and apply the optimization 
> where it makes sense. And it would be available for all drivers that are 
> similar to mgag200.

For this particular case, user-space would use more memory and CPU, 
because the copy to VRAM is done on kernel side, and it is where the 
conversion must be done for maximum performances. So there is no way for 
userspace to be as efficient as the kernel in this use-case.

For the conversion, the kernel allocate only 1 line, and convert/copy 
one line at a time. And because the CPU is out-of-order, it can start 
converting the next line using CPU registers while waiting for the bus.

Userspace would need to allocate a whole framebuffer, and can't use the 
"wasted" CPU cycle to do the conversion.

> 
> My main point is simplicity of the driver: I prefer the driver to be 
> simple without unnecessary indirection or overhead. Optimizations like 
> these my or may not work on a given system with a certain workload. I'd 
> better leave this heuristic to userspace.

I agree that the driver is simpler without optimizing thing. But I think 
it's the role of the driver to get the maximum from the hardware, even 
if it's old and broken like g200. And userspace don't want to optimize 
for such hardware.

> 
> Another point of concern is CPU consumption: Slow I/O buses may stall 
> the display thread, but the CPU could do something else in the meantime. 
> Doing format conversion on the CPU prevents that, hence affecting other 
> parts of the system negatively. Of course, that's more of a gut feeling 
> than hard data.

I think it's the reverse. Without dropping the X data, the CPU is 
actually stalling much longer sending useless bytes to the mgag200's 
VRAM. And the CPU can't do anything else while doing memcpy_toio().
Using DMA is the only way to free the CPU during the copy, but it 
appears to be either broken or significantly slower on most mgag200 
hardware.

I actually have made the work to support DMA, and I'm a bit sad it 
didn't work on all g200, so this optimization is really a last resort, 
on a really broken hardware.

> 
> Please note that the kernel's conversion code uses memory allocation of 
> intermediate buffers. We even recently had a discussion about allocation 
> overhead during display updates. Userspace can surely do a better job at 
> keeping such buffers around.
> 
> And finally a note the hardware itself: on low-end hardware like those 
> Matrox chips, just switch to RGB16. That will be pretty and fast enough 
> for these chips' server systems. Anyone who cares about fast and 
> beautiful should buy a real graphics card.

There are still sysadmin users that occasionally have to browse the web 
to find answer, or read their mail in a GUI client. It turns out that 
rgb16 is pretty ugly for today standard, and buying an external card 
would be a bit too much, and won't work for remote control.


Best regards,

-- 

Jocelyn


> 
> Best regards
> Thomas
> 
>>
>>
>> Thanks,
>> pq
>>
>>>> + *     On most hardware, VRAM read access are slow, so when doing 
>>>> the software
>>>> + *     conversion, the dumb buffer should be allocated in system 
>>>> RAM in order to
>>>> + *     have decent performance.
>>>> + *     Extra care should be taken when doing software conversion with
>>>> + *     DRM_CAP_DUMB_PREFER_SHADOW, there are more detailed 
>>>> explanations here:
>>>> + *     
>>>> https://lore.kernel.org/dri-devel/20230818162415.2185f8e3@eldfell/
>>>>     */
>>>>    static unsigned int drm_num_planes(struct drm_device *dev)
>>>>
>>>> base-commit: 82d750e9d2f5d0594c8f7057ce59127e701af781
>>>
>>
> 

