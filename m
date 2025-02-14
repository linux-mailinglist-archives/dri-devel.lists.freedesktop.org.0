Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8C2A35B2D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 11:07:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCB010E29E;
	Fri, 14 Feb 2025 10:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WqgTpWzc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E434410EC2B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 10:07:47 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-3f3b93e4e32so1772793b6e.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 02:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739527667; x=1740132467; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sn3pvbBqfTOyOoOU/Jw94BfwIPh6Cc8Y6dRoDktCRzw=;
 b=WqgTpWzcOSha8w+geNQqbK4TGpXF9gX1D/HZdN01NIhFWWJJMEnQOdo9895UTpyZyB
 iho5dKzuI4l2IKHCbLJdMjLCB8mCC2z8Wv68vvG8/Z/10rwGn0I76bjFiKaQMbWErmPo
 0KgTRgDGwAbbAQyz/GT2jnjIwZz7gFgY6d54fwOVSXAFw6H5Xx0i0vZvEHFsr3oTKJIj
 Hjzw82uOYXU3Mg3JY1q+rsOHLDTVCuK5Aw+SEtHVCV6KKOcVz1UcyR/4tK9sGP5+UdyF
 uBkzaKl53C+S8gzhUCxdP5f918uWFok6GjclSvE5y+k+M3alsVMT6RH0tGzqvi1kCEwv
 OksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739527667; x=1740132467;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sn3pvbBqfTOyOoOU/Jw94BfwIPh6Cc8Y6dRoDktCRzw=;
 b=PSbjeS9zU/NT7Jjh4wXhDTcn1uoIdFxlIPO/YWSJO1VEUUj7/I5aFVF+2D08p0PDRt
 tx7muTl7R3s1D91xpdM/oqxTDGaWVRjLYu9ezLS5VO4gp7m0jjRB5xAofHJufYZV0mPc
 nzqgokQZ9ARpdVv0Gt2FpYYQAhdK4xs8F5MQzpzgBTtvYuXKmQl5dY4+hdSJA+lTK76Z
 cBWRPW6Y6I3LXb+daYNN9QmcxI3Bea7OUFGza8HEy6mTg2WgODVgHlLiEDEtAfAuEk43
 o5zayJPqJ79a8UAiuiThpbu8G49MzEQHs/duhJNZEKJnCBF+LAaHGlK1EYEdvqCxIpUW
 5XMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3vZoIIEUJfcWLo1u3Qv0UuzbjfyIIbWm52o51OVPf7VdFvsBXFPmJN0L7qBF5PQphRvndUmtwYTc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCvZ7XcVNOpxblWhxLoc3qWxmN6jiyZbsxbZD+ZSkevODmKi1R
 qn6qul2GlnQPfAdfJnKgVAIjzoTIQDGbeFT0ak/+wGuxR0J05c1VSEEhHKWogtRlQHYBUXbE22Z
 jHxI6XDN+adDqWBHRAfPW7dUgQEpl1Zyt8elVpw==
X-Gm-Gg: ASbGncv3m0dX0LMmPEA2PrLYAlc0wSB/Nrjafm+2bp5s+5hSgRpYciF3B3wrXa1yvXN
 0/UBFoEd8Urj9rTjj+HscCpB4Pgwfzxwr43TTCFvBO16dOMF7PO92lsMYaTyXZ6Q6Hn5eamoMOg
 ==
X-Google-Smtp-Source: AGHT+IEmoLNj+r+ZI1bJGO2H/c+/OPghMcihwjxAvNbcnoyp3QyJqGjGScO1azD/YZ9Oqyybj/A6hKXzadalRsb9RgA=
X-Received: by 2002:a05:6870:ac94:b0:29e:1962:7a23 with SMTP id
 586e51a60fabf-2b8fb13c9d8mr3994694fac.4.1739527666842; Fri, 14 Feb 2025
 02:07:46 -0800 (PST)
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
In-Reply-To: <CAPj87rPHnME5Osgnf5-FSAu22mDpLj=dzvhi_NqEcOwr1ThgGw@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 14 Feb 2025 11:07:34 +0100
X-Gm-Features: AWEUYZloh0UdTJdZ2i2yB5o6l3a8WiHqKi_BGzWtYbrdKFQsIhzEcrv-aDyLaSw
Message-ID: <CAHUa44Gs0D1fBD0=+EDgcQUMeDv4knci9trUkYEc1J98qFV7HQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Daniel Stone <daniel@fooishbar.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Sumit Garg <sumit.garg@linaro.org>, 
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

Hi,

On Thu, Feb 13, 2025 at 6:39=E2=80=AFPM Daniel Stone <daniel@fooishbar.org>=
 wrote:
>
> Hi,
>
> On Thu, 13 Feb 2025 at 15:57, Jens Wiklander <jens.wiklander@linaro.org> =
wrote:
> > On Thu, Feb 13, 2025 at 3:05=E2=80=AFPM Daniel Stone <daniel@fooishbar.=
org> wrote:
> > > But just because TEE is one good backend implementation, doesn't mean
> > > it should be the userspace ABI. Why should userspace care that TEE ha=
s
> > > mediated the allocation instead of it being a predefined range within
> > > DT?
> >
> > The TEE may very well use a predefined range that part is abstracted
> > with the interface.
>
> Of course. But you can also (and this has been shipped on real
> devices) handle this without any per-allocation TEE needs by simply
> allocating from a memory range which is predefined within DT.
>
> From the userspace point of view, why should there be one ABI to
> allocate memory from a predefined range which is delivered by DT to
> the kernel, and one ABI to allocate memory from a predefined range
> which is mediated by TEE?

We need some way to specify the protection profile (or use case as
I've called it in the ABI) required for the buffer. Whether it's
defined in DT seems irrelevant.

>
> > >  What advantage
> > > does userspace get from having to have a different codepath to get a
> > > different handle to memory? What about x86?
> > >
> > > I think this proposal is looking at it from the wrong direction.
> > > Instead of working upwards from the implementation to userspace, star=
t
> > > with userspace and work downwards. The interesting property to focus
> > > on is allocating memory, not that EL1 is involved behind the scenes.
> >
> > From what I've gathered from earlier discussions, it wasn't much of a
> > problem for userspace to handle this. If the kernel were to provide it
> > via a different ABI, how would it be easier to implement in the
> > kernel? I think we need an example to understand your suggestion.
>
> It is a problem for userspace, because we need to expose acceptable
> parameters for allocation through the entire stack. If you look at the
> dmabuf documentation in the kernel for how buffers should be allocated
> and exchanged, you can see the negotiation flow for modifiers. This
> permeates through KMS, EGL, Vulkan, Wayland, GStreamer, and more.

What dma-buf properties are you referring to?
dma_heap_ioctl_allocate() accepts a few flags for the resulting file
descriptor and no flags for the heap itself.

>
> Standardising on heaps allows us to add those in a similar way.

How would you solve this with heaps? Would you use one heap for each
protection profile (use case), add heap_flags, or do a bit of both?

> If we
> have to add different allocation mechanisms, then the complexity
> increases, permeating not only into all the different userspace APIs,
> but also into the drivers which need to support every different
> allocation mechanism even if they have no opinion on it - e.g. Mali
> doesn't care in any way whether the allocation comes from a heap or
> TEE or ACPI or whatever, it cares only that the memory is protected.
>
> Does that help?

I think you're missing the stage where an unprotected buffer is
received and decrypted into a protected buffer. If you use the TEE for
decryption or to configure the involved devices for the use case, it
makes sense to let the TEE allocate the buffers, too. A TEE doesn't
have to be an OS in the secure world, it can be an abstraction to
support the use case depending on the design. So the restricted buffer
is already allocated before we reach Mali in your example.

Allocating restricted buffers from the TEE subsystem saves us from
maintaining proxy dma-buf heaps.

Cheers,
Jens

>
> Cheers,
> Daniel
