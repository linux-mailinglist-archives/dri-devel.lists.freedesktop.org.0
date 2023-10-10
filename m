Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B417BFD51
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F47C10E369;
	Tue, 10 Oct 2023 13:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB0A10E369
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 13:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696944297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o8GarNiwoYNZzxQy/wUVyvzlXjzNxjPI+uD0qnbmX34=;
 b=S/tLIb0ZKVqJOKCXFwPX8ER9zj384pxpD5rGxnaAJxNtTx7zeOPKJsAjXgZGpaWG8+aVRW
 XH/ezqUusIznJPZh69hH9JKQd/VHW4zNJ5Vdk84rpRtoRSXrMlnj2Gfv70beYZ+d0pWKCm
 FMnZvuDXy751IYq0eWnC4y31W2g2uw8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-42tdYip8PqGOcFTso0knLg-1; Tue, 10 Oct 2023 09:24:54 -0400
X-MC-Unique: 42tdYip8PqGOcFTso0knLg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-406710d9a4aso44177545e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 06:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696944293; x=1697549093;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o8GarNiwoYNZzxQy/wUVyvzlXjzNxjPI+uD0qnbmX34=;
 b=M4rl2205TrHdsK3UKZbcCIiJeg5PqnvrfqVu07fxvmlMvxvxpYZfAzMnBMmzHom3hk
 U34dEXrVWVH7VEuaxGjFQZyNNP1J1aVMKh74PSj6oTtxttP93DpFSn6w3f2rgaK6A7Og
 VcEV+Os4Kx59sGOHSpYBfXTG4QBO3UWRA9sS3qvABAdgHD+sGmlpHK/xyOuAwcLU6HI9
 v+M1+aHnU66iH322QIevFr2kD+mHDaVxCzj3R8RMW89LQWhp84U7LvRCuv9DcEMKUNk9
 bjs9Qa1ZTBmMTRuqZBaDv0KRt4kRT2wQdIdE3oZHmqau+q5tYSOiq3ylq3AcK1k4rlfg
 l8jQ==
X-Gm-Message-State: AOJu0YzQoSE3RuoBOucabCuOfIyKUh8/CglSMRbv9ms+R+bse/r4YLqF
 Ni/GcDWtjMRdak+6fzrkk7EYQMygD5hqnQbgxugoU3eDTery2U/Umvy3VItJTFjAAp3WFZlFqkY
 X2uAavDWJWOZEy5d8pplfYqAFVsSE
X-Received: by 2002:a5d:42c5:0:b0:31f:ddee:d216 with SMTP id
 t5-20020a5d42c5000000b0031fddeed216mr16298306wrr.69.1696944292705; 
 Tue, 10 Oct 2023 06:24:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzchazYhapGkiLonqrCjVmrG/U3Dne++dhFr82UCQkoMQSrj+vfcrv2qIN8cKx7qrn9D+PCg==
X-Received: by 2002:a5d:42c5:0:b0:31f:ddee:d216 with SMTP id
 t5-20020a5d42c5000000b0031fddeed216mr16298296wrr.69.1696944292307; 
 Tue, 10 Oct 2023 06:24:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a5d5188000000b003247f732c11sm12774626wrv.76.2023.10.10.06.24.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 06:24:51 -0700 (PDT)
Message-ID: <08015ff5-247c-3e9c-7878-7219d3b33444@redhat.com>
Date: Tue, 10 Oct 2023 15:24:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
To: Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>
References: <6iaqx7ef4hdd6bucsxtfy37nsizloraxbudez4ms7jlusbghr3@i5hliqpimdp2>
 <bd880231-f161-0773-63f7-ded6cb3fddc1@tronnes.org>
 <b4aadfb4-9393-d6b6-e876-a420afcf2b36@redhat.com>
 <wupxw7bs6yu4gtsbmuvdxhwpd4vkxvvl4aa6w7fumqekzvl7v7@akv2tifgsihl>
 <b764a8a7-db48-fd3b-6241-f3a07009e7dd@redhat.com>
 <xutxpbk476iogtgfbcxbebnud7t3oq6dlbhpniimna2uz2p2nb@hbrrwn4y3x6s>
 <cd54b5ab-5ac8-4569-991c-bf6e062e6400@suse.de>
 <63wdz6ns6wsu3avztqebmeo4aa4ltwmmmywlam3xe6fmftcf3p@5icc2cvy6xvh>
 <0a6c2a07-bf44-409a-8a09-827410f011a6@tronnes.org>
 <5l4wotvmflkl42ms2wbw6mcz7bevk246abouj33fjn5wzfh72i@3vhxratfu3xi>
 <ZSVKtbkm6Sq_kkk7@phenom.ffwll.local>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <ZSVKtbkm6Sq_kkk7@phenom.ffwll.local>
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
Cc: bluescreen_avenger@verizon.net, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, gpiccoli@igalia.com,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/10/2023 14:59, Daniel Vetter wrote:
> On Tue, Oct 10, 2023 at 02:15:47PM +0200, Maxime Ripard wrote:
>> On Tue, Oct 10, 2023 at 01:29:52PM +0200, Noralf Trønnes wrote:
>>>
>>>
>>> On 10/10/23 11:25, Maxime Ripard wrote:
>>>>
>>>>
>>>> On Tue, Oct 10, 2023 at 10:55:09AM +0200, Thomas Zimmermann wrote:
>>>>>>> So if I understand correctly, drm_panic would pre-allocate a plane/commit,
>>>>>>> and use that when a panic occurs ?
>>>>>>
>>>>>> And have it checked already, yes. We would only wait for a panic to
>>>>>> happen to pull the trigger on the commit.
>>>>>>
>>>>>>> I have two concern about this approach:
>>>>>>> - How much memory would be allocated for this ? a whole framebuffer can be
>>>>>>> big for just this use case.
>>>>>
>>>>> As I outlined in my email at [1], there are a number of different scenarios.
>>>>> The question of atomic state and commits is entirely separate from the DRM
>>>>> panic handler. We should not throw them together. Whatever is necessary is
>>>>> get a scanout buffer, should happen on the driver side of
>>>>> get_scanout_buffer, not on the drm_panic side.
>>>>>
>>>>> [1] https://lore.kernel.org/dri-devel/39bd4c35-8a61-42ee-8675-ccea4f5d4ac6@suse.de/T/#m22f116e9438e00a5f0a9dc43987d4153424f8be1
>>>>>
>>>>>>
>>>>>> I'dd expect a whole framebuffer for the current
>>>>>> configuration/resolution. It would be typically 4MB for a full-HD system
>>>>>> which isn't a lot really and I guess we can always add an option to
>>>>>> disable the mechanism if needed.
>>>>>>
>>>>>>> - I find it risky to completely reconfigure the hardware in a panic handler.
>>>>>>
>>>>>> I would expect to only change the format and base address of the
>>>>>> framebuffer. I guess it can fail, but it doesn't seem that different to
>>>>>> the async plane update we already have and works well.
>>>>>
>>>>> The one thing I don't understand is: Why should we use atomic commits in the
>>>>> first place? It doesn't make sense for firmware-based drivers.
>>>>
>>>> Because this is generic infrastructure that is valuable for any drivers
>>>> and not only firmware-based drivers?
>>>>
>>>>> In some drivers, even the simple ast, we hold locks during the regular
>>>>> commit. Trying to run the panic commit concurrently will likely give a
>>>>> deadlock.
>>>>
>>>> You're in the middle of a panic. Don't take any locks and you won't deadlock.
>>>>
>>>>> In the end it's a per-driver decision, but in most cases, the driver can
>>>>> easily switch to a default mode with some ad-hoc code.
>>>>
>>>> When was the last time a per-driver decision has been a good thing? I'm
>>>> sorry, but the get_scanout_buffer approach buffer won't work for any
>>>> driver out there.
>>>>
>>>> I'm fine with discussing alternatives if you don't like the ones I
>>>> suggested, but they must allow the panic handler infrastructure to work
>>>> with any driver we have, not just 4.
>>>>
>>>
>>> Why can't we use the model[1] suggested by Daniel using a draw_pixel
>>> callback giving drivers full control on how they can put a pixel on the
>>> display?
>>
>> I share kind of the same general ideas/conclusions: "qthe idea is that
>> all the fb selection and lookup is handled in shared code (and with
>> proper locking, but only for atomic drivers)."
>>
>> 2016 is a bit old though and multiple developments happened since
>> (secure playback is a thing now, framebuffer compression too), so I
>> still think that their expectation that the framebuffer is accessible to
>> / writable by the CPU no longer holds true.
> 
> I think largely it should still be ok, because the idea behind the draw_xy
> callback was that the driver could take care of anything special, like
> - tiling
> - clearing compression bits so that just writing the raw pixels works (if
>    your compression format allows for that)
> - handling any differences in how the pixels need to be written, like
>    cache flushing, mmio_write vs normal memory, amd also has peek/poke
>    registers to be able to write even into unmappable memory
> 
> What would probably be a good idea is to do an s/void */uinptr_t/ over my
> interface proposal, or maybe an even more opaque cookie since really the
> only thing you can do is get the void * that ->panic_vmap returns and pass
> it into ->panic_draw_xy.
> 
> I thought (but I didn't dig through details) that the panic fb struct is
> essentially meant to serve this purpose in the current series?
> 

Yes, in this series there is a struct drm_scanout_buffer, that the 
driver has to provide when a panic occurs:

struct drm_scanout_buffer {
	const struct drm_format_info *format;
	struct iosys_map map;
	unsigned int pitch;
	unsigned int width;
	unsigned int height;
};

That works well for CPU accessible, linear format.
It should be possible to support YUV, or simple tiling with that, but 
for the more complex case, I proposed to add a draw_pixel() callback.

>>> This will even work for the AMD debug interface.
>>> In the linear CPU accessible buffer case, we can provide a helper for
>>> that, maybe we can do helpers for other common cases as well.
>>
>> Yeah, their idea of a panic_draw would work great for that.
>>
>>> Adding to that we would need a panic_setup/enter and panic_teardown/exit
>>> callback.
>>
>> What for?
> 
> So panic teardown would be for testing in CI, to make it non-destructive
> and clean up anything panic_vmap (or _enter or whatever you call it) has
> done. I thought John Oggness was also looking into how the new panic
> handlers/consoles could be made testable in the panic paths, including
> lock stealing and getting called from nmi.

Thanks, I was also wondering why a panic teardown would be necessary, 
since after the panic handler has run, the system will probably halt. 
(or maybe run kdump and reboot).

> -Sima

