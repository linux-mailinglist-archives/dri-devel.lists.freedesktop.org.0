Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBA71DA537
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 01:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3926E3A2;
	Tue, 19 May 2020 23:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365B56E3A2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 23:12:39 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id w64so979173wmg.4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 16:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9nXZIh+0a9uZrepq31HrqjjhS+2AZ4SL6HL9QDxcUlU=;
 b=a+HujN4J2T5GBiw+FOginmhSWhcLYquVQeHuLk5YIilloN5ZtHaFfSdVwmsWf3xHno
 cZBu3sb2iEurmfDZvbqBbClGg9LFg8SVWo8KzIdVzn+mbfbEFQwI3OBZ6z3yL2/YTSI8
 w1D7quHDgXaZVFy4bFv4mYt3R69G9ehUOVk6y86bLABjpRSLrbIFBvgFVFDL6vu+VKxT
 D8H2yHEy7JIGpcxootlOblYZsUwXM5Sdy6XSOao11sK+qCMzBu2x+OmdEY2IZUyOUz+Z
 g/zcdpZOSTmtzH3sQG7HV4tox1bOYPsBtsk4xde/Kp+1aXD/uqOTlf7Qk+12mfFvShgB
 pMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9nXZIh+0a9uZrepq31HrqjjhS+2AZ4SL6HL9QDxcUlU=;
 b=j8Mq4mjl8ILWQtROD+uMb6hA6kDbOFt0F2y8BsYzETiBuTNiqdAErJVy0LQnNWcA6R
 HHKtftnBCkSd8J5fFz6wFldo6dREpo55ELprsLAO1NyBpZewUmnCQOlxgaKMFxzj9ptG
 4p+eZaTr4VAjDtP3ijL7Oxp6/hlRzZQW2dB+RycJMdVQbD4vYlWHqshCgmFaNc0IL/lB
 56rRU2kLIelhF4dzhA1YNdodHo1G/o5VJBK+BISwzOUnytNF9W+c+8LcVHZAAHoaGrr1
 efabA3mq7PfErtFRflgdfcZ0ba6JEqpUG/ITlInCP7UvlmVkO5cedAT15Y6+w8QNx3DP
 Ue/A==
X-Gm-Message-State: AOAM530BaOjYjsI49aodvvqXkHYjVoNYVlRe8ogU5uLSYfk8islA6WNe
 24dYGZGEjMuvbDrTrB+VbEzo4XxYBi8dE9RgaeI=
X-Google-Smtp-Source: ABdhPJxAHqucqBj12xjabdjLamMUC2A4wmKz1xYaVdTR7QJ4jEJL9z/KA49Rzy2njbcAVgo4okup/a+0i39+OHRlUGk=
X-Received: by 2002:a1c:38c3:: with SMTP id f186mr1790842wma.137.1589929957694; 
 Tue, 19 May 2020 16:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200519163234.226513-1-sashal@kernel.org>
 <CAPM=9txZpiCGkv3jiBC1F8pTe4A2pqWpQDyjRBXk2roFqw+0+Q@mail.gmail.com>
In-Reply-To: <CAPM=9txZpiCGkv3jiBC1F8pTe4A2pqWpQDyjRBXk2roFqw+0+Q@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 20 May 2020 09:12:25 +1000
Message-ID: <CAPM=9tx4wh-Lk6Dffsdh-7mYvXx+GX2AxhrGqFgyN8-AWJvP6A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] DirectX on Linux
To: Sasha Levin <sashal@kernel.org>
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
Cc: linux-hyperv@vger.kernel.org, sthemmin@microsoft.com, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, haiyangz@microsoft.com,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, spronovo@microsoft.com,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 iourit@microsoft.com, "Deucher, Alexander" <alexander.deucher@amd.com>,
 kys@microsoft.com, wei.liu@kernel.org, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 20 May 2020 at 08:42, Dave Airlie <airlied@gmail.com> wrote:
>
> On Wed, 20 May 2020 at 02:33, Sasha Levin <sashal@kernel.org> wrote:
> >
> > There is a blog post that goes into more detail about the bigger
> > picture, and walks through all the required pieces to make this work. It
> > is available here:
> > https://devblogs.microsoft.com/directx/directx-heart-linux . The rest of
> > this cover letter will focus on the Linux Kernel bits.
> >
> > Overview
> > ========
> >
> > This is the first draft of the Microsoft Virtual GPU (vGPU) driver. The
> > driver exposes a paravirtualized GPU to user mode applications running
> > in a virtual machine on a Windows host. This enables hardware
> > acceleration in environment such as WSL (Windows Subsystem for Linux)
> > where the Linux virtual machine is able to share the GPU with the
> > Windows host.
> >
> > The projection is accomplished by exposing the WDDM (Windows Display
> > Driver Model) interface as a set of IOCTL. This allows APIs and user
> > mode driver written against the WDDM GPU abstraction on Windows to be
> > ported to run within a Linux environment. This enables the port of the
> > D3D12 and DirectML APIs as well as their associated user mode driver to
> > Linux. This also enables third party APIs, such as the popular NVIDIA
> > Cuda compute API, to be hardware accelerated within a WSL environment.
> >
> > Only the rendering/compute aspect of the GPU are projected to the
> > virtual machine, no display functionality is exposed. Further, at this
> > time there are no presentation integration. So although the D3D12 API
> > can be use to render graphics offscreen, there is no path (yet) for
> > pixel to flow from the Linux environment back onto the Windows host
> > desktop. This GPU stack is effectively side-by-side with the native
> > Linux graphics stack.
>
> Okay I've had some caffiene and absorbed some more of this.
>
> This is a driver that connects a binary blob interface in the Windows
> kernel drivers to a binary blob that you run inside a Linux guest.
> It's a binary transport between two binary pieces. Personally this
> holds little of interest to me, I can see why it might be nice to have
> this upstream, but I don't forsee any other Linux distributor ever
> enabling it or having to ship it, it's purely a WSL2 pipe. I'm not
> saying I'd be happy to see this in the tree, since I don't see the
> value of maintaining it upstream, but it probably should just exists
> in a drivers/hyperv type area.
>
> Having said that, I hit one stumbling block:
> "Further, at this time there are no presentation integration. "
>
> If we upstream this driver as-is into some hyperv specific place, and
> you decide to add presentation integration this is more than likely
> going to mean you will want to interact with dma-bufs and dma-fences.
> If the driver is hidden away in a hyperv place it's likely we won't
> even notice that feature landing until it's too late.
>
> I would like to see a coherent plan for presentation support (not
> code, just an architectural diagram), because I think when you
> contemplate how that works it will change the picture of how this
> driver looks and intergrates into the rest of the Linux graphics
> ecosystem.
>
> As-is I'd rather this didn't land under my purview, since I don't see
> the value this adds to the Linux ecosystem at all, and I think it's
> important when putting a burden on upstream that you provide some
> value.

I also have another concern from a legal standpoint I'd rather not
review the ioctl part of this. I'd probably request under DRI
developers abstain as well.

This is a Windows kernel API being smashed into a Linux driver. I
don't want to be tainted by knowledge of an API that I've no idea of
the legal status of derived works. (it this all covered patent wise
under OIN?)

I don't want to ever be accused of designing a Linux kernel API with
illgotten D3DKMT knowledge, I feel tainting myself with knowledge of a
properietary API might cause derived work issues.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
