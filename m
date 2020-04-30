Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 391EB1BF5E1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 12:52:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B83C6E245;
	Thu, 30 Apr 2020 10:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369076E245
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 10:52:56 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id w68so1566571vke.5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 03:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jNiZlpXLQpEgkXLMjwFbZYd4n3tho7Yoq51PVomjfeg=;
 b=MxW2c4iljXRZ6kwzU/zC+isdU9ODT30BlkXD0EEbwnxa8X7FYSQ0NW3El9wz20fBbz
 WoAIaK3a+lsup55yzLyAc2Y8+wAQkeEkt8OZ6FiiOE4C/J75cjlHoscP6MSqPCcs2mSH
 vCUJ9+XRH5oWK2C3/5rEGKzu0oNgLvPcNZJKXvqK9XLgdksnrWMM5+SVcXTAH3q+Zl1e
 VeqmmNNR15UFeAmU0NpxUa/HMxR4TfAOmAajXeLvj1PXVjztKlKHm8P+dUwIHJBkFIi6
 yesE1UJOmZgmjZSawaHV9PmKekHgTd6cRlPqhMXuwEA7A5xoxmzokO9e1GCptDAQtpoo
 2gJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jNiZlpXLQpEgkXLMjwFbZYd4n3tho7Yoq51PVomjfeg=;
 b=uQmxbGbgC2N2fbZ8TTJ2s6s74wkdgpNOSsosCeU3o9qUaSxZJ5/wfvv9ClEeMhUNGd
 Qes+p6lOQ9ksBNJqwvQXAX+pyZDQmPOAX6K8J6DVPgiROaANpx6p22dcTAyR3erWyPzn
 9PjQYCIMtk8n8Hxum8h4L6M0fr/9MxW0v2xgsywo5rOzP6uZtNMirUNdrkwIM0nG303m
 WP+jBQrll79FEioSciAcYXJN1SsG4cNp9Y4Yu1HrP80jAwReq6Fai9H0ArjukGHf8oWT
 /5yskmNYymg8w8ikBnCdRPEWYphDG3SKl180ilkAj9nei1JKhPQxuDaXaBUDh2fWt38Z
 wxQg==
X-Gm-Message-State: AGi0Pua7/WYxti2atUUcxYvEPhVPnsTUAFSqf5TCmHHe17yO6VtKJRew
 0GT537+ZUhXDktcXVV8WaNePtNrgWjXUkiqEI2Y=
X-Google-Smtp-Source: APiQypIjWK7b59i32I8wT8kDxro6WSMTZib7qXu4xjC3alBAqeGa80MXBlJByRM7LuWcPMfjTF5PsTw8Gob9bj9tQpo=
X-Received: by 2002:a1f:9182:: with SMTP id t124mr1899412vkd.38.1588243975247; 
 Thu, 30 Apr 2020 03:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200423223459.200858-1-pcc@google.com>
 <CACvgo50xnz9g8PE6+4FxHr=NJ4sWd1no4erFBJ2RY2msE12PYA@mail.gmail.com>
 <CAMn1gO5i-nBU_S-U896qrYYOUU6W4yD=KG8KTwijUOF62ts36g@mail.gmail.com>
 <CACvgo53CGO-gM8xEyP92La+3KEPWGGy3V1+YsQ2hrCt+atMnLA@mail.gmail.com>
 <CADaigPXW-2+YPfW8mayJPo8OoRB2j+VN=q6zu-cs0gmpXtjang@mail.gmail.com>
In-Reply-To: <CADaigPXW-2+YPfW8mayJPo8OoRB2j+VN=q6zu-cs0gmpXtjang@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 30 Apr 2020 11:50:38 +0100
Message-ID: <CACvgo52fwBOXqh0bjCn0Q5OHfCc4owxRW=zc7sr+zAwvPDuuyQ@mail.gmail.com>
Subject: Re: [PATCH] drm: pl111: enable render node
To: Eric Anholt <eric@anholt.net>
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
Cc: Peter Collingbourne <pcc@google.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 Apr 2020 at 17:48, Eric Anholt <eric@anholt.net> wrote:
>
> On Mon, Apr 27, 2020 at 7:45 AM Emil Velikov <emil.l.velikov@gmail.com> wrote:
> >
> > On Fri, 24 Apr 2020 at 19:54, Peter Collingbourne <pcc@google.com> wrote:
> > >
> > > On Fri, Apr 24, 2020 at 4:11 AM Emil Velikov <emil.l.velikov@gmail.com> wrote:
> > > >
> > > > On Thu, 23 Apr 2020 at 23:51, Peter Collingbourne <pcc@google.com> wrote:
> > > > >
> > > > > The render node is required by Android which does not support the legacy
> > > > > drmAuth authentication process.
> > > > >
> > > > > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > > > > ---
> > > > >  drivers/gpu/drm/pl111/pl111_drv.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > The summary talks about drmAuth, yet exposes a render node. Even
> > > > through there's no rendering engine in the HW, as mentioned by Eric.
> > > >
> > > > AFAICT the only way drmAuth is relevant with pl111 is when you want to
> > > > export/import dma bufs.
> > > > Although that is handled in core and the artificial DRM_AUTH
> > > > restriction has been lifted with commit [1].
> > > >
> > > > -Emil
> > > >
> > > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.7-rc2&id=30a958526d2cc6df38347336a602479d048d92e7
> > >
> > > Okay, most likely drmAuth is irrelevant here (I don't know much about
> > > it to be honest; I know that Android uses render nodes, so I figured
> > > that drmAuth must therefore be the thing that it doesn't use). Sorry
> > > for the confusion. Here is a better explanation of why I needed this
> > > change.
> > >
> > > Android has a composer process that opens the primary node and uses
> > > DRM_IOCTL_MODE_ATOMIC to switch between frame buffers, and a renderer
> > > process (surfaceflinger) that opens the render node, prepares frame
> > > buffers and sends them to the composer. One idea for adapting this
> > > architecture to devices without render nodes is to have the renderer
> > > process open the primary node instead. But this runs into a problem:
> > > suppose that the renderer process starts before the composer process.
> > > In this case, the kernel makes the renderer the DRM master, so the
> > > composer can't change the frame buffer. Render nodes don't have this
> > > problem because opening them doesn't affect the master.
> > >
> > > I considered fixing this by having the composer issue
> > > DRM_IOCTL_SET_MASTER, but this requires root privileges. If we require
> > > drivers to provide render nodes and control access to the primary node
> > > while opening up the render node, we can ensure that only authorized
> > > processes can become the master without requiring them to be root.
> > >
> > I think that the crux, is trying to open a _primary_ node for
> > _rendering_ purposes.
> > While that may work - as you outline above - it's usually a bad idea.
> >
> > To step back a bit, in practise we have three SoC combinations:
> >  - complete lack of render device - then you default to software rendering [1]
> >  - display and render device are one and the same - no change needed,
> > things should just work
> >  - display and render devices are separate - surfaceflinger should
> > open the correct _rendering_ device node.
> >
> > [1] Mesa's libEGL (don't recall exact name on Android) can open VGEM
> > render node, to work with the kms-swrast_dri.so software rasteriser
> > module.
> >
> > While I did not try [1] with Android, it was working fine with CrOS. I
> > suggest giving it a try and reporting bugs.
>
> VGEM is not a solution, because it doesn't coordinate caching behavior
> with your display node and so you get corruption if you try to to
> share dma-bufs between them.  In cros it's used only for some tests as
> far as I've heard, and it's been a source of pain.
>
My understanding is that dma_buf_{begin,end}_cpu_access should be used
to handle the caching concerns.
Perhaps we're missing some calls, apart from the wc mmap Daniel mentioned?

Fwiw I've played around with CrOS for 30 minutes w/o any corruption.
Mind you it was a boot + casual web browsing.

> If we want to go the route of "kms-only nodes also provide a render
> node interface for doing swrast on", I think that would be a good
> idea, but we should do this at a core DRM level (probably "does this
> driver expose dma-buf? then also expose render nodes") rather than per
> kms driver.

This sounds doable, although I'm concerned about existing
applications, which do not expect this behaviour.
Be that mesa, compositors or otherwise.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
