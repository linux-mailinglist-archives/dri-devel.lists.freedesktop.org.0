Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 969111DA4BE
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 00:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE36889C2C;
	Tue, 19 May 2020 22:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4758F89C27
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 22:42:56 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id se13so890033ejb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 15:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XkNEkulDdH4K6Pc2AjIHGc1nu83ozdPkLgankdo3z+8=;
 b=AweT9CPIrUxa0N4vmOK6oeo/RxnZYLc+CExt9z8FbB6GnMgeBCd0HEvdw8smURG8fg
 ejGoOvcyyG4x6E1LsYeAohAFISL1LexnmcLI17QeGLW30w7WSPiLSp9PTWtY2jxCxCfG
 T2LZQReOgUzOuD6RqkMr9W/oePZEfvsya+tZEwsqcIDTH93LLKWo/eYhSxAZmit3lexc
 VRq86Yrb2RMPQZx87PCOtd1hZ+2IxPd0JKJso1L/tLwVYWaCH1MxtKCEbFdwHQwReNAT
 GhAlb+w4vwOYm7cBfs+zGlldrJNucHi+c/0Omu1JZOKu0R/HdMfHM6Dqf1fWcIGwwETU
 yVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XkNEkulDdH4K6Pc2AjIHGc1nu83ozdPkLgankdo3z+8=;
 b=c2JbD2iqAEIWRkwq4Ve3W6rTWjI6KSvqm+9k4mF1Q71hOTweerO0rZOUXksnw7W+gc
 /T9zjjl/JuJ5aFLQrNXb03SUMsuCtfOAKf2wtFczcfweYoL4sBR5+i0+PAMHnYuWYZcv
 wfjLX+bMVKcS7l5+Pui36+E4whZDdrR4KkS/xquHfv/z9sibfljtmslqZ3Ctx0E9lvey
 sACoAq6HMRbqZ0hrw3KbiXNSpXZNEHjnpW3nuTniF5OadT7pOXu7RU6+1Ys1YeITEqbV
 57kruCJ8wfMIbrXBRm/HC6Sw12c0C+3R7FaNpbT2+I0K+PNyKnJCjtPOlp5R0tQyWqaS
 w75A==
X-Gm-Message-State: AOAM530KUVAUoQfsqxzjsLSX4AeElEs1hjXoyo1IcztFtLHVj/FvAxF1
 KPlbkxNMyIA95+8K4YUO+s/UlODC2Qx1Yx5uuCA=
X-Google-Smtp-Source: ABdhPJz1cbZ0mWSKAwLvdrgyvCIeCQXQpdCsWBcPW7aOrjkzx37rBjrlZHsWHTx3L65i6XkCMQlISf0P+HM/SVSd/tQ=
X-Received: by 2002:a17:906:404c:: with SMTP id
 y12mr1381799ejj.9.1589928174706; 
 Tue, 19 May 2020 15:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200519163234.226513-1-sashal@kernel.org>
In-Reply-To: <20200519163234.226513-1-sashal@kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 20 May 2020 08:42:43 +1000
Message-ID: <CAPM=9txZpiCGkv3jiBC1F8pTe4A2pqWpQDyjRBXk2roFqw+0+Q@mail.gmail.com>
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

On Wed, 20 May 2020 at 02:33, Sasha Levin <sashal@kernel.org> wrote:
>
> There is a blog post that goes into more detail about the bigger
> picture, and walks through all the required pieces to make this work. It
> is available here:
> https://devblogs.microsoft.com/directx/directx-heart-linux . The rest of
> this cover letter will focus on the Linux Kernel bits.
>
> Overview
> ========
>
> This is the first draft of the Microsoft Virtual GPU (vGPU) driver. The
> driver exposes a paravirtualized GPU to user mode applications running
> in a virtual machine on a Windows host. This enables hardware
> acceleration in environment such as WSL (Windows Subsystem for Linux)
> where the Linux virtual machine is able to share the GPU with the
> Windows host.
>
> The projection is accomplished by exposing the WDDM (Windows Display
> Driver Model) interface as a set of IOCTL. This allows APIs and user
> mode driver written against the WDDM GPU abstraction on Windows to be
> ported to run within a Linux environment. This enables the port of the
> D3D12 and DirectML APIs as well as their associated user mode driver to
> Linux. This also enables third party APIs, such as the popular NVIDIA
> Cuda compute API, to be hardware accelerated within a WSL environment.
>
> Only the rendering/compute aspect of the GPU are projected to the
> virtual machine, no display functionality is exposed. Further, at this
> time there are no presentation integration. So although the D3D12 API
> can be use to render graphics offscreen, there is no path (yet) for
> pixel to flow from the Linux environment back onto the Windows host
> desktop. This GPU stack is effectively side-by-side with the native
> Linux graphics stack.

Okay I've had some caffiene and absorbed some more of this.

This is a driver that connects a binary blob interface in the Windows
kernel drivers to a binary blob that you run inside a Linux guest.
It's a binary transport between two binary pieces. Personally this
holds little of interest to me, I can see why it might be nice to have
this upstream, but I don't forsee any other Linux distributor ever
enabling it or having to ship it, it's purely a WSL2 pipe. I'm not
saying I'd be happy to see this in the tree, since I don't see the
value of maintaining it upstream, but it probably should just exists
in a drivers/hyperv type area.

Having said that, I hit one stumbling block:
"Further, at this time there are no presentation integration. "

If we upstream this driver as-is into some hyperv specific place, and
you decide to add presentation integration this is more than likely
going to mean you will want to interact with dma-bufs and dma-fences.
If the driver is hidden away in a hyperv place it's likely we won't
even notice that feature landing until it's too late.

I would like to see a coherent plan for presentation support (not
code, just an architectural diagram), because I think when you
contemplate how that works it will change the picture of how this
driver looks and intergrates into the rest of the Linux graphics
ecosystem.

As-is I'd rather this didn't land under my purview, since I don't see
the value this adds to the Linux ecosystem at all, and I think it's
important when putting a burden on upstream that you provide some
value.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
