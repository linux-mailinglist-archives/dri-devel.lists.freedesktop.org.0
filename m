Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1325A55CF
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 22:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825BE10EE9A;
	Mon, 29 Aug 2022 20:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2632010EE9A
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 20:54:44 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 m10-20020a17090a730a00b001fa986fd8eeso15888071pjk.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:message-id:date:in-reply-to:subject:cc:to:from:from:to
 :cc; bh=GEtwMjD/OIVlmkpbYEiHU4MKz+tfzFSV5uKsJpcHyfY=;
 b=SX5tThtFcX1rw5/i3Uy9JWlKDJA54aA6jyBep9G2KRko2X0Z5FI+0+xn59Qj3jcObj
 Z9ZlGq4TriU0njPRbu3reIfTnKBHArZXhvWXOYcevMPigBWBWxEWk+OCVjReJL8QMaIY
 MFr8xFNZlZP6YAJKGXmAT/l+3dz4SSJqkbGnGRTD0k8Z4vdneOoIW7JVBfkSvoxZA23o
 cAN39LPzKsrsPQESdCvmC5TBr+5bab+EOLAoPuP4P+M8hPat2oCvrRYD64Jy17vjtWlY
 FgRy+ZZoALrfZWs02UQi/qlb8cEp4rBjwJ60xyn5tFLjQnPwGZ/JhW3nU1u2VG/t8Az6
 VHJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc;
 bh=GEtwMjD/OIVlmkpbYEiHU4MKz+tfzFSV5uKsJpcHyfY=;
 b=XKS+ADrLYEHz5wVI4ILDLvpB0www0kdb3rsJFd7mfxZF7nwKjjPzc/tI0/371X1WH6
 gEeziax//LIOemHFNdcUGlQLjjVYBiJZkakAlpeZxLx66wfbsm54ltLSNDvqBEOliFYu
 j/Iex8CVBLOiwfdsEYMRr+CawHemJw4QLQ+nYC69FoG2a+Fk7vR0kPOiwnCE2PrAYOyX
 Ehplw/bFR0VPzjcm8t4Amz/gjsuEcDiCKK7FhN3Nno1JO5B++u4uyoUxZmEgg1j8ftJn
 myUmcIOOmFRNQS6kOWqmpHFpRnbNe+JRLvXCv5E2nvj3hnDZhf2JrI1QcXoNSGlQLuDL
 i5bQ==
X-Gm-Message-State: ACgBeo0izlsgw5mfLrY1l44v0iP9hWpAaiWuyGfqFc2q0ElaufdSfoyY
 l2q4Cn3QI2T1n3xWT5x0Ea2Hu7VrMWXh6g==
X-Google-Smtp-Source: AA6agR4C7JudXsZj1PSNIQ/LL8c8PrA2AoQh1ZQzSSGEnGXXx0fmXEwDItVOPqXOtycsS5cVqt8qNw==
X-Received: by 2002:a17:902:ced2:b0:16e:e19b:c5c9 with SMTP id
 d18-20020a170902ced200b0016ee19bc5c9mr18815203plg.136.1661806483563; 
 Mon, 29 Aug 2022 13:54:43 -0700 (PDT)
Received: from localhost ([76.146.1.42]) by smtp.gmail.com with ESMTPSA id
 p5-20020a17090a2c4500b001efa9e83927sm7016156pjm.51.2022.08.29.13.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 13:54:42 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Oded Gabbay <oded.gabbay@gmail.com>
Subject: Re: New subsystem for acceleration devices
In-Reply-To: <CAFCwf12P6DckVUJL7V_Z7ASj+8A3yyx9eX5MpZPF47Rzg6CjEA@mail.gmail.com>
Date: Mon, 29 Aug 2022 13:54:42 -0700
Message-ID: <7hh71uixd9.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexandre Bailon <abailon@baylibre.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Jiho Chu <jiho.chu@samsung.com>, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Oded (and sorry I misspelled your name last time),

Oded Gabbay <oded.gabbay@gmail.com> writes:

> On Tue, Aug 23, 2022 at 9:24 PM Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Hi Obed,
>>
>> Oded Gabbay <oded.gabbay@gmail.com> writes:
>>
>> [...]
>>
>> > I want to update that I'm currently in discussions with Dave to figure
>> > out what's the best way to move forward. We are writing it down to do
>> > a proper comparison between the two paths (new accel subsystem or
>> > using drm). I guess it will take a week or so.
>>
>> Any update on the discussions with Dave? and/or are there any plans to
>> discuss this further at LPC/ksummit yet?
> Hi Kevin.
>
> We are still discussing the details, as at least the habanalabs driver
> is very complex and there are multiple parts that I need to see if and
> how they can be mapped to drm.
> Some of us will attend LPC so we will probably take advantage of that
> to talk more about this.

OK, looking forward to some more conversations at LPC.

>>
>> We (BayLibre) are upstreaming support for APUs on Mediatek SoCs, and are
>> using the DRM-based approach.  I'll also be at LPC and happy to discuss
>> in person.
>>
>> For some context on my/our interest: back in Sept 2020 we initially
>> submitted an rpmesg based driver for kernel communication[1].  After
>> review comments, we rewrote that based on DRM[2] and are now using it
>> for some MTK SoCs[3] and supporting our MTK customers with it.
>>
>> Hopefully we will get the kernel interfaces sorted out soon, but next,
>> there's the userspace side of things.  To that end, we're also working
>> on libAPU, a common, open userspace stack.  Alex Bailon recently
>> presented a proposal earlier this year at Embedded Recipes in Paris
>> (video[4], slides[5].)
>>
>> libAPU would include abstractions of the kernel interfaces for DRM
>> (using libdrm), remoteproc/rpmsg, virtio etc. but also goes farther and
>> proposes an open firmware for the accelerator side using
>> libMetal/OpenAMP + rpmsg for communication with (most likely closed
>> source) vendor firmware.  Think of this like sound open firmware (SOF[6]),
>> but for accelerators.
>
> I think your device and the habana device are very different in
> nature, and it is part of what Dave and I discussed, whether these two
> classes of devices can live together. I guess they can live together
> in the kernel, but in the userspace, not so much imo.

Yeah, for now I think focusing on how to handle both classes of devices
in the kernel is the most important.

> The first class is the edge inference devices (usually as part of some
> SoC). I think your description of the APU on MTK SoC is a classic
> example of such a device.

Correct.

> You usually have some firmware you load, you give it a graph and
> pointers for input and output and then you just execute the graph
> again and again to perform inference and just replace the inputs.
>
> The second class is the data-center, training accelerators, which
> habana's gaudi device is classified as such. These devices usually
> have a number of different compute engines, a fabric for scaling out,
> on-device memory, internal MMUs and RAS monitoring requirements. Those
> devices are usually operated via command queues, either through their
> kernel driver or directly from user-space. They have multiple APIs for
> memory management, RAS, scaling-out and command-submissions.

OK, I see.

>>
>> We've been using this succesfully for Mediatek SoCs (which have a
>> Cadence VP6 APU) and have submitted/published the code, including the
>> OpenAMP[7] and libmetal[8] parts in addition to the kernel parts already
>> mentioned.
> What's the difference between libmetal and other open-source low-level
> runtime drivers, such as oneAPI level-zero ?

TBH, I'd never heard of oneAPI before, so I'm assuming it's mainly
focused in the data center.  libmetal/openAMP are widely used
in the consumer, industrial embedded space, and heavily used by FPGAs in
many market segments.

> Currently we have our own runtime driver which is tightly coupled with
> our h/w. For example, the method the userspace "talks" to the
> data-plane firmware is very proprietary as it is hard-wired into the
> architecture of the entire ASIC and how it performs deep-learning
> training. Therefore, I don't see how this can be shared with other
> vendors. Not because of secrecy but because it is simply not relevant
> to any other ASIC.

OK, makes sense.

Thanks for clarifying your use case in more detail.

Kevin
