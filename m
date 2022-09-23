Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 004245E7F9B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 18:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72FE10E5D7;
	Fri, 23 Sep 2022 16:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC90110E59A
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 16:22:23 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id g8so377855iob.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 09:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=JCEsHMJy/ullYPtJF9xFE7cEbWJdSEZSG4mebaxAikg=;
 b=IPgz1Um4bHtnZ2dNoSBJBU6fTHVnplRX9o7pqgKX7IFaUnpFUCpIWhk31BWuTU3gNu
 pZF33VJy8pyJW29qSRJV737/MZxKPVkPdF2w80LAbfh569ftv1MS5rHSnpDqKFQ6Tb4a
 c5sdmUC/n/8rj15ShatBCv33tDuPfRVDQJrW38HxWB6sKC0Q/u0tbv26A8AU0Bt8/ZLM
 iQ/0hiYxh5U5FfdBXEqvsKwZj63QvJRGr5bSebSEJ7pajM+mlLeKqsMZuU57c4kY8BVt
 vYuQS05vGmK/F/l30fmwkSenX8SwwyEs2armnGwM4ZFV+46a0vg6y9W1VkY8/WbCUN3X
 QXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=JCEsHMJy/ullYPtJF9xFE7cEbWJdSEZSG4mebaxAikg=;
 b=5xt+8qlMZfydj5ZBnuG2IdMjItJtLDcP7iooe6AQPTaAOODJRZSw8RSmC5944MERPS
 t3JGRuiPDJU3yESj5PeDYAQ4gMWjtTvvlzzeA+PPXpehZErYIkH3BfVWgliW69u7uN91
 QMta7lQV3+wJHQ3z07cKlsQMGUGxZu6JNgy6gr0Tm8WDVkRKE256RYpkP5A3ZO8sMi7W
 W8CWdHPTkIjuJm/EeI4TKP5NBdHyhlSla08u6IeApE8qOhUcVXBsAkixmCOq3/oW5as4
 ZlhY5L3GBhNcS25WfF2kRAeh27bujyE+6MGxM2/oQN8uV055k7ymqUREfaM6GWpAcAQk
 aZzA==
X-Gm-Message-State: ACrzQf1XKVIEf5T1Xo2mA2X4H/N74ouVFDiEiU3yRJCykKqjfDQxQPR6
 8SU1trZlXUWUxX5ZlKTwrYbijxvZzlbjxMuUwVc=
X-Google-Smtp-Source: AMsMyM4yb1sDTwxg385CK1YA3wTc7Ykm2hNJpzzeTvyNMwOM2t3R0WDgxOVrq5SSvxtWLpDaWBXu8ZX1eH7pOW00KhE=
X-Received: by 2002:a6b:8fd8:0:b0:6a0:f9ea:2a05 with SMTP id
 r207-20020a6b8fd8000000b006a0f9ea2a05mr4006231iod.123.1663950142809; Fri, 23
 Sep 2022 09:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAFCwf12P6DckVUJL7V_Z7ASj+8A3yyx9eX5MpZPF47Rzg6CjEA@mail.gmail.com>
 <7hh71uixd9.fsf@baylibre.com>
In-Reply-To: <7hh71uixd9.fsf@baylibre.com>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Fri, 23 Sep 2022 19:21:55 +0300
Message-ID: <CAFCwf12mjshsf+GC-Y9irvPFT=W4Uis10OnZ4PNN1txjXyzLSA@mail.gmail.com>
Subject: Re: New subsystem for acceleration devices
To: "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>, Jiho Chu <jiho.chu@samsung.com>, 
 Alexandre Bailon <abailon@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
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
 dri-devel <dri-devel@lists.freedesktop.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 29, 2022 at 11:54 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Hi Oded (and sorry I misspelled your name last time),
>
> Oded Gabbay <oded.gabbay@gmail.com> writes:
>
> > On Tue, Aug 23, 2022 at 9:24 PM Kevin Hilman <khilman@baylibre.com> wrote:
> >>
> >> Hi Obed,
> >>
> >> Oded Gabbay <oded.gabbay@gmail.com> writes:
> >>
> >> [...]
> >>
> >> > I want to update that I'm currently in discussions with Dave to figure
> >> > out what's the best way to move forward. We are writing it down to do
> >> > a proper comparison between the two paths (new accel subsystem or
> >> > using drm). I guess it will take a week or so.
> >>
> >> Any update on the discussions with Dave? and/or are there any plans to
> >> discuss this further at LPC/ksummit yet?
> > Hi Kevin.
> >
> > We are still discussing the details, as at least the habanalabs driver
> > is very complex and there are multiple parts that I need to see if and
> > how they can be mapped to drm.
> > Some of us will attend LPC so we will probably take advantage of that
> > to talk more about this.
>
> OK, looking forward to some more conversations at LPC.
>
> >>
> >> We (BayLibre) are upstreaming support for APUs on Mediatek SoCs, and are
> >> using the DRM-based approach.  I'll also be at LPC and happy to discuss
> >> in person.
> >>
> >> For some context on my/our interest: back in Sept 2020 we initially
> >> submitted an rpmesg based driver for kernel communication[1].  After
> >> review comments, we rewrote that based on DRM[2] and are now using it
> >> for some MTK SoCs[3] and supporting our MTK customers with it.
> >>
> >> Hopefully we will get the kernel interfaces sorted out soon, but next,
> >> there's the userspace side of things.  To that end, we're also working
> >> on libAPU, a common, open userspace stack.  Alex Bailon recently
> >> presented a proposal earlier this year at Embedded Recipes in Paris
> >> (video[4], slides[5].)
> >>
> >> libAPU would include abstractions of the kernel interfaces for DRM
> >> (using libdrm), remoteproc/rpmsg, virtio etc. but also goes farther and
> >> proposes an open firmware for the accelerator side using
> >> libMetal/OpenAMP + rpmsg for communication with (most likely closed
> >> source) vendor firmware.  Think of this like sound open firmware (SOF[6]),
> >> but for accelerators.
> >
> > I think your device and the habana device are very different in
> > nature, and it is part of what Dave and I discussed, whether these two
> > classes of devices can live together. I guess they can live together
> > in the kernel, but in the userspace, not so much imo.
>
> Yeah, for now I think focusing on how to handle both classes of devices
> in the kernel is the most important.
>
> > The first class is the edge inference devices (usually as part of some
> > SoC). I think your description of the APU on MTK SoC is a classic
> > example of such a device.
>
> Correct.
>
> > You usually have some firmware you load, you give it a graph and
> > pointers for input and output and then you just execute the graph
> > again and again to perform inference and just replace the inputs.
> >
> > The second class is the data-center, training accelerators, which
> > habana's gaudi device is classified as such. These devices usually
> > have a number of different compute engines, a fabric for scaling out,
> > on-device memory, internal MMUs and RAS monitoring requirements. Those
> > devices are usually operated via command queues, either through their
> > kernel driver or directly from user-space. They have multiple APIs for
> > memory management, RAS, scaling-out and command-submissions.
>
> OK, I see.
>
> >>
> >> We've been using this succesfully for Mediatek SoCs (which have a
> >> Cadence VP6 APU) and have submitted/published the code, including the
> >> OpenAMP[7] and libmetal[8] parts in addition to the kernel parts already
> >> mentioned.
> > What's the difference between libmetal and other open-source low-level
> > runtime drivers, such as oneAPI level-zero ?
>
> TBH, I'd never heard of oneAPI before, so I'm assuming it's mainly
> focused in the data center.  libmetal/openAMP are widely used
> in the consumer, industrial embedded space, and heavily used by FPGAs in
> many market segments.
>
> > Currently we have our own runtime driver which is tightly coupled with
> > our h/w. For example, the method the userspace "talks" to the
> > data-plane firmware is very proprietary as it is hard-wired into the
> > architecture of the entire ASIC and how it performs deep-learning
> > training. Therefore, I don't see how this can be shared with other
> > vendors. Not because of secrecy but because it is simply not relevant
> > to any other ASIC.
>
> OK, makes sense.
>
> Thanks for clarifying your use case in more detail.
>
> Kevin

Hi all,
I wanted to update on this issue for those of you who weren't in LPC.
We had a BOF session about this topic with most, if not all, of the
relevant people - DRM maintainers, Greg and other subsystem and device
drivers maintainers.
Dave Airlie summarized the session in his blog -
https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html

TL;DR
Accelerators drivers will use the DRM subsystem code, but they will be
located in a different directory (drivers/accel) and will be exposed
to the userspace using a new major and a new device char name
(/dev/accelX).

I'm currently working on preparing some prerequisite patches for the
DRM subsystem to support the new subsystem (e.g. new major number).
After that will be merged, I plan to move the habanalabs driver to the
new location and convert it to use the modified DRM framework code.

Thanks,
Oded
