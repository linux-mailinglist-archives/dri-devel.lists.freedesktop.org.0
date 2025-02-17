Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4C3A37B32
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 07:13:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55FB810E14A;
	Mon, 17 Feb 2025 06:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sxzEc89X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0BE10E14A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 06:13:07 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id
 a1e0cc1a2514c-8670fd79990so1181643241.3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 22:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739772786; x=1740377586; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MnZw/Q+2O7o0YRtcX5JOGAgQhTQPBSaQtuZqXRvPz8U=;
 b=sxzEc89XkXtaL+/SCeZxYiP5ZDMqvKBW4KdkMVRIN8Dg0f0d/688pH9zWV+4/gsA83
 +eH7wlDtZK01N4Ad2abo7yYET7KNaqW6F68NfiYS/iD8FgZZHBxMyxGoiAhoYztx1ge+
 WpBsvUEOQkWiQFhqK5El+DDBpNTVfp/Ql0JNLrpu4oxa5djAa5K913FiNjKvg0BvLqdy
 ZIljrHkdpWF6hZFGKlFts5dmr+8CotnMGyOb2B4uVEpi0KtnKWG/IuVPEvtlgb29OfOU
 Aq35i2OqB2B1uVh7hDmxQPo6/K1OsBHyNPSnV8+VcXkqc6brC7EpRuB3b1EZoPM8uaLn
 YWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739772786; x=1740377586;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MnZw/Q+2O7o0YRtcX5JOGAgQhTQPBSaQtuZqXRvPz8U=;
 b=CBkVLLVfoBUUM3t0F4/cJhL3FnVsVipnzUDDzkq4yfGqvljPStXh66lDyIWs6LoL6C
 UmEto/nFsNl5tWmDA8iEhUzEkkFhSdf0CCaXeFi5cQK1eZfTStidy2+DC1IaP9gqbcXn
 TA18n4okAR4Vpo9/mJNVrfOeVzC4b/6CsI8N+q4x7oaTcPY0CTANJ0C5z84Fikn0mym6
 yfEx3Mt+BDJ+n7spWAX1ThHrSYyv1BJdQLpDvhjHevd6YzA9sZiW7unfh4zoIvgmaEKj
 pxrNaEWeRaNg0RQQWYM/qOlatcsKrM0/2gCprNNeRcYjukRHwQPEuscugXss7R+GO8Uf
 Rtdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAoHBqS9+RvrkenoIfy7nOSDO8Rh/iUwJLEgM6XhiN+x9rhnJNEKBAYtltvTGSwlBiY+Q/7CjGWZg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPRSwnDL19BY5gbGIHFGckQG4YB/1g+9mp3tZkLlAQ6UFkFrUN
 AugTUtWIPxVpad9MNe+rkb9G92Q3wGSoS5TWumPf/7/9C6FbvoPGJtXvJMCHEga7C/wZ9IbwB9B
 0Zc7aEExpTsQZmfeel6UsD5NC5Hmn4ul72YwDEA==
X-Gm-Gg: ASbGncufM6YPNgfSKeYV2MpNzDLKHFqUCwJVShj5XQBVkOaJ4E16A/rqyet5n2rgUMq
 aqoafuh5ZrpMm/vjd3TP0Vf99YZFweVxC+5q7eVzAYq6iwZNidq+4KfxTKDLSheo0P9dj7QKbSQ
 ==
X-Google-Smtp-Source: AGHT+IHc7dJI6eafhkqnIan6daijofUVFUvH3V4pTfdEga1AHuyGIsGH9uwlauqjjjaAaHI1sy0aprZ+BW4OP8MJfMs=
X-Received: by 2002:a05:6102:c89:b0:4bb:eb4a:f9f2 with SMTP id
 ada2fe7eead31-4bd3fcc5af7mr3186375137.9.1739772786167; Sun, 16 Feb 2025
 22:13:06 -0800 (PST)
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <20250212205613.4400a888@collabora.com>
 <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
 <20250213093557.278f5d19@collabora.com>
 <CAFA6WYOJkSRsH-15QdqXNMd08Q=Dg4NkRd1Cr9LXA+5nozTF6g@mail.gmail.com>
 <20250213134008.4cbef142@collabora.com>
 <CAPj87rM5Y=-Jgf4mwukicF6Yb-vccn2fpG2X1jNq0upH2+cAEQ@mail.gmail.com>
 <CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com>
 <CAPj87rPHnME5Osgnf5-FSAu22mDpLj=dzvhi_NqEcOwr1ThgGw@mail.gmail.com>
 <CAHUa44Gs0D1fBD0=+EDgcQUMeDv4knci9trUkYEc1J98qFV7HQ@mail.gmail.com>
 <CAFA6WYOuTwRPEh3L7+hMyARB_E73xmp+OwhKyS-r4+ryS7=9sw@mail.gmail.com>
 <20250214164856.0d2ead8a@collabora.com>
In-Reply-To: <20250214164856.0d2ead8a@collabora.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 17 Feb 2025 11:42:55 +0530
X-Gm-Features: AWEUYZnqsQNR6HgNOQ-KCjeibuktCio21DDJEy1SbMXh6xWHOITZYYTdEw2pDRY
Message-ID: <CAFA6WYPc6EHQwcPuMZRm4C1P6SoDrCzEPUmju_meupB6NXQ1sg@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
 Daniel Stone <daniel@fooishbar.org>, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Florent Tomasin <florent.tomasin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, 14 Feb 2025 at 21:19, Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Fri, 14 Feb 2025 18:37:14 +0530
> Sumit Garg <sumit.garg@linaro.org> wrote:
>
> > On Fri, 14 Feb 2025 at 15:37, Jens Wiklander <jens.wiklander@linaro.org=
> wrote:
> > >
> > > Hi,
> > >
> > > On Thu, Feb 13, 2025 at 6:39=E2=80=AFPM Daniel Stone <daniel@fooishba=
r.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Thu, 13 Feb 2025 at 15:57, Jens Wiklander <jens.wiklander@linaro=
.org> wrote:
> > > > > On Thu, Feb 13, 2025 at 3:05=E2=80=AFPM Daniel Stone <daniel@fooi=
shbar.org> wrote:
> > > > > > But just because TEE is one good backend implementation, doesn'=
t mean
> > > > > > it should be the userspace ABI. Why should userspace care that =
TEE has
> > > > > > mediated the allocation instead of it being a predefined range =
within
> > > > > > DT?
> > > > >
> > > > > The TEE may very well use a predefined range that part is abstrac=
ted
> > > > > with the interface.
> > > >
> > > > Of course. But you can also (and this has been shipped on real
> > > > devices) handle this without any per-allocation TEE needs by simply
> > > > allocating from a memory range which is predefined within DT.
> > > >
> > > > From the userspace point of view, why should there be one ABI to
> > > > allocate memory from a predefined range which is delivered by DT to
> > > > the kernel, and one ABI to allocate memory from a predefined range
> > > > which is mediated by TEE?
> > >
> > > We need some way to specify the protection profile (or use case as
> > > I've called it in the ABI) required for the buffer. Whether it's
> > > defined in DT seems irrelevant.
> > >
> > > >
> > > > > >  What advantage
> > > > > > does userspace get from having to have a different codepath to =
get a
> > > > > > different handle to memory? What about x86?
> > > > > >
> > > > > > I think this proposal is looking at it from the wrong direction=
.
> > > > > > Instead of working upwards from the implementation to userspace=
, start
> > > > > > with userspace and work downwards. The interesting property to =
focus
> > > > > > on is allocating memory, not that EL1 is involved behind the sc=
enes.
> > > > >
> > > > > From what I've gathered from earlier discussions, it wasn't much =
of a
> > > > > problem for userspace to handle this. If the kernel were to provi=
de it
> > > > > via a different ABI, how would it be easier to implement in the
> > > > > kernel? I think we need an example to understand your suggestion.
> > > >
> > > > It is a problem for userspace, because we need to expose acceptable
> > > > parameters for allocation through the entire stack. If you look at =
the
> > > > dmabuf documentation in the kernel for how buffers should be alloca=
ted
> > > > and exchanged, you can see the negotiation flow for modifiers. This
> > > > permeates through KMS, EGL, Vulkan, Wayland, GStreamer, and more.
> > >
> > > What dma-buf properties are you referring to?
> > > dma_heap_ioctl_allocate() accepts a few flags for the resulting file
> > > descriptor and no flags for the heap itself.
> > >
> > > >
> > > > Standardising on heaps allows us to add those in a similar way.
> > >
> > > How would you solve this with heaps? Would you use one heap for each
> > > protection profile (use case), add heap_flags, or do a bit of both?
>
> I would say one heap per-profile.
>

And then it would have a per vendor multiplication factor as each
vendor enforces memory restriction in a platform specific manner which
won't scale.

> >
> > Christian gave an historical background here [1] as to why that hasn't
> > worked in the past with DMA heaps given the scalability issues.
> >
> > [1] https://lore.kernel.org/dri-devel/e967e382-6cca-4dee-8333-39892d532=
f71@gmail.com/
>
> Hm, I fail to see where Christian dismiss the dma-heaps solution in
> this email. He even says:
>
> > If the memory is not physically attached to any device, but rather just
> memory attached to the CPU or a system wide memory controller then
> expose the memory as DMA-heap with specific requirements (e.g. certain
> sized pages, contiguous, restricted, encrypted, ...).

I am not saying Christian dismissed DMA heaps but rather how
scalability is an issue. What we are proposing here is a generic
interface via TEE to the firmware/Trusted OS which can perform all the
platform specific memory restrictions. This solution will scale across
vendors.

>
> >
> > >
> > > > If we
> > > > have to add different allocation mechanisms, then the complexity
> > > > increases, permeating not only into all the different userspace API=
s,
> > > > but also into the drivers which need to support every different
> > > > allocation mechanism even if they have no opinion on it - e.g. Mali
> > > > doesn't care in any way whether the allocation comes from a heap or
> > > > TEE or ACPI or whatever, it cares only that the memory is protected=
.
> > > >
> > > > Does that help?
> > >
> > > I think you're missing the stage where an unprotected buffer is
> > > received and decrypted into a protected buffer. If you use the TEE fo=
r
> > > decryption or to configure the involved devices for the use case, it
> > > makes sense to let the TEE allocate the buffers, too. A TEE doesn't
> > > have to be an OS in the secure world, it can be an abstraction to
> > > support the use case depending on the design. So the restricted buffe=
r
> > > is already allocated before we reach Mali in your example.
> > >
> > > Allocating restricted buffers from the TEE subsystem saves us from
> > > maintaining proxy dma-buf heaps.
>
> Honestly, when I look at dma-heap implementations, they seem
> to be trivial shells around existing (more complex) allocators, and the
> boiler plate [1] to expose a dma-heap is relatively small. The dma-buf
> implementation, you already have, so we're talking about a hundred
> lines of code to maintain, which shouldn't be significantly more than
> what you have for the new ioctl() to be honest.

It will rather be redundant vendor specific code under DMA heaps
calling into firmware/Trusted OS to enforce memory restrictions as you
can look into Mediatek example [1]. With TEE subsystem managing that
it won't be the case as we will provide a common abstraction for the
communication with underlying firmware/Trusted OS.

[1] https://lore.kernel.org/linux-arm-kernel/20240515112308.10171-1-yong.wu=
@mediatek.com/

> And I'll insist on what
> Daniel said, it's a small price to pay to have a standard interface to
> expose to userspace. If dma-heaps are not used for this kind things, I
> honestly wonder what they will be used for...

Let's try not to forcefully find a use-case for DMA heaps when there
is a better alternative available. I am still failing to see why you
don't consider following as a standardised user-space interface:

"When user-space has to work with restricted memory, ask TEE device to
allocate it"

-Sumit
