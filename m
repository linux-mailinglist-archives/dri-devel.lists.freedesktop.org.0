Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C9F59EDB0
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 22:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DC210E03B;
	Tue, 23 Aug 2022 20:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE6A10E90F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 20:45:52 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id p187so10112890oia.9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 13:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Iyj8X1hythu4VbtWXUOop5SKgK9Wa/aA+SaAUy1k2M8=;
 b=IvNq8RucyAgYkTsP1xLFQoJCOZcNtwnyDvU5boC9SB/eiDJ0VWFNIqCfoxbHEH7NnF
 m4eWeIonFz5iAH6fvwoN8aCbUGfkSFwHeU+mIZrdPGPl3ccX2qhIgNeJL3cDgZCxtbRG
 oKYwesNPj+wni2WuMga5shIIe8fbOErsDV5HgFNT55gE1v4RWAY1lq7IqU4kANZ+th8N
 tc1AnwwAun6DvaI6tE5+rRSUZnyCG0kXQQpcUy5NQwaDL/UhlwgT8KOgVZy0EfzcaiSf
 I6uAQm3lbUSsp79JTGu4FiUpdb+N1LXZt5dP9WrKLdy9WrwVMKFHuO+w1f6DTeTGRINu
 cIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Iyj8X1hythu4VbtWXUOop5SKgK9Wa/aA+SaAUy1k2M8=;
 b=kWlyBAQYO6KInID0/dAJ7yEJEjMmgDZJDpFPN1CqHyQKqyT4KVBkhgjmFqrj/+m1x5
 qyogt4sp9RVNvWiEaBv7bjTrBNR3quIvWbjsM9XgyzWLLJStA+gufhyb1Vz6nwkGUFQ+
 8gIgjb7nyIEMfJMeg1TCbH0IVNWLm0vha5tn2PPgdpqCtaTzFiutdavf0EUsrqPBcwxI
 Kv+FqcWogGvqFa3HlaM8ZRyfwYvGg+R9evAJB2oQdQFMFIc+J1wE00f+29p9vxPCyrLR
 yiOiVqlwZHwprVU57RW50Zhh1MLCEdAZYT3VlgaiaT39R7EDiKHgweTREpPwLDjlzV6y
 kw7w==
X-Gm-Message-State: ACgBeo3DxT8HnpVdPbLuUIYg75UzMNyu1LF2tKGgLpHWfagOTATKI8iq
 Jpej92eOCGuUN/vsYruzIXQu+HnO2JMzPNKRFmDMoZcNhkNobA==
X-Google-Smtp-Source: AA6agR6If/XanomkJ1zRDq18Pdw7+NepNvR2d35YWsSjCekSFif7+1U0KKedbdtofAkXS3CzmLbVocI7SWirR3tDWCE=
X-Received: by 2002:a05:6808:152b:b0:343:ef9d:4729 with SMTP id
 u43-20020a056808152b00b00343ef9d4729mr2028855oiw.286.1661287551352; Tue, 23
 Aug 2022 13:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAFCwf11=9qpNAepL7NL+YAV_QO=Wv6pnWPhKHKAepK3fNn+2Dg@mail.gmail.com>
 <CAPM=9tzWuoWAOjHJdJYVDRjoRq-4wpg2KGiCHjLLd+OfWEh5AQ@mail.gmail.com>
 <CAFCwf12N6DeJAQVjY7PFG50q2m405e=XCCFvHBn1RG65BGbT8w@mail.gmail.com>
 <CAPM=9txSKv_xwZJ6SndtqsdQm6aK1KJVF91dB5Odhc_Xv6Qdrw@mail.gmail.com>
 <CAFCwf10CsLgt+_qT7dT=8DVXsL0a=w=uXN6HC=CpP5EfitvLfQ@mail.gmail.com>
 <CAPM=9txme2dQD9kyM6gnYyXL34hYP8wcGMbduOUcFsKe+4zTcQ@mail.gmail.com>
 <CAFCwf11TPKTF_Ndi60FneWp5g3SoawJvfJoKVWJ-QjxjpawMmg@mail.gmail.com>
 <CAFCwf13WU3ZEjurEaEnVC56zorwKr-uuQn-ec10r301Fh+XEtA@mail.gmail.com>
 <7hk06ykedc.fsf@baylibre.com>
In-Reply-To: <7hk06ykedc.fsf@baylibre.com>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Tue, 23 Aug 2022 23:45:24 +0300
Message-ID: <CAFCwf12P6DckVUJL7V_Z7ASj+8A3yyx9eX5MpZPF47Rzg6CjEA@mail.gmail.com>
Subject: Re: New subsystem for acceleration devices
To: Kevin Hilman <khilman@baylibre.com>
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
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexandre Bailon <abailon@baylibre.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Jiho Chu <jiho.chu@samsung.com>, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 23, 2022 at 9:24 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Hi Obed,
>
> Oded Gabbay <oded.gabbay@gmail.com> writes:
>
> [...]
>
> > I want to update that I'm currently in discussions with Dave to figure
> > out what's the best way to move forward. We are writing it down to do
> > a proper comparison between the two paths (new accel subsystem or
> > using drm). I guess it will take a week or so.
>
> Any update on the discussions with Dave? and/or are there any plans to
> discuss this further at LPC/ksummit yet?
Hi Kevin.

We are still discussing the details, as at least the habanalabs driver
is very complex and there are multiple parts that I need to see if and
how they can be mapped to drm.
Some of us will attend LPC so we will probably take advantage of that
to talk more about this.

>
> We (BayLibre) are upstreaming support for APUs on Mediatek SoCs, and are
> using the DRM-based approach.  I'll also be at LPC and happy to discuss
> in person.
>
> For some context on my/our interest: back in Sept 2020 we initially
> submitted an rpmesg based driver for kernel communication[1].  After
> review comments, we rewrote that based on DRM[2] and are now using it
> for some MTK SoCs[3] and supporting our MTK customers with it.
>
> Hopefully we will get the kernel interfaces sorted out soon, but next,
> there's the userspace side of things.  To that end, we're also working
> on libAPU, a common, open userspace stack.  Alex Bailon recently
> presented a proposal earlier this year at Embedded Recipes in Paris
> (video[4], slides[5].)
>
> libAPU would include abstractions of the kernel interfaces for DRM
> (using libdrm), remoteproc/rpmsg, virtio etc. but also goes farther and
> proposes an open firmware for the accelerator side using
> libMetal/OpenAMP + rpmsg for communication with (most likely closed
> source) vendor firmware.  Think of this like sound open firmware (SOF[6]),
> but for accelerators.
I think your device and the habana device are very different in
nature, and it is part of what Dave and I discussed, whether these two
classes of devices can live together. I guess they can live together
in the kernel, but in the userspace, not so much imo.

The first class is the edge inference devices (usually as part of some
SoC). I think your description of the APU on MTK SoC is a classic
example of such a device.
You usually have some firmware you load, you give it a graph and
pointers for input and output and then you just execute the graph
again and again to perform inference and just replace the inputs.

The second class is the data-center, training accelerators, which
habana's gaudi device is classified as such. These devices usually
have a number of different compute engines, a fabric for scaling out,
on-device memory, internal MMUs and RAS monitoring requirements. Those
devices are usually operated via command queues, either through their
kernel driver or directly from user-space. They have multiple APIs for
memory management, RAS, scaling-out and command-submissions.

>
> We've been using this succesfully for Mediatek SoCs (which have a
> Cadence VP6 APU) and have submitted/published the code, including the
> OpenAMP[7] and libmetal[8] parts in addition to the kernel parts already
> mentioned.
What's the difference between libmetal and other open-source low-level
runtime drivers, such as oneAPI level-zero ?

Currently we have our own runtime driver which is tightly coupled with
our h/w. For example, the method the userspace "talks" to the
data-plane firmware is very proprietary as it is hard-wired into the
architecture of the entire ASIC and how it performs deep-learning
training. Therefore, I don't see how this can be shared with other
vendors. Not because of secrecy but because it is simply not relevant
to any other ASIC.

>
> We're to the point where we're pretty happy with how this works for MTK
> SoCs, and wanting to collaborate with folks working on other platforms
> and to see what's needed to support other kinds of accelerators with a
> common userspace and open firmware infrastructure.
>
> Kevin
>
> [1] https://lore.kernel.org/r/20200930115350.5272-1-abailon@baylibre.com
> [2] https://lore.kernel.org/r/20210917125945.620097-1-abailon@baylibre.com
> [3] https://lore.kernel.org/r/20210819151340.741565-1-abailon@baylibre.com
> [4] https://www.youtube.com/watch?v=Uj1FZoF8MMw&t=18211s
> [5] https://embedded-recipes.org/2022/wp-content/uploads/2022/06/bailon.pdf
> [6] https://www.sofproject.org/
> [7] https://github.com/BayLibre/open-amp/tree/v2021.10-mtk
> [8] https://github.com/BayLibre/libmetal/tree/v2021.10-mtk
