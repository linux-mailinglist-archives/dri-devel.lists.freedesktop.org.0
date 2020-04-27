Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBFA1BAA52
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 18:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D797B6E33E;
	Mon, 27 Apr 2020 16:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9356E33E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 16:48:12 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id f12so13956389edn.12
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 09:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9lKZKzvhkJ6C/OLWRsSrl7Dq/abBXyDMmXLU6ao2xM8=;
 b=hGxul0hlbJVd60Q0+rHh426OHVi9i+fKviMOR8xs8dwjinEDtYiB9XeCc6nxDn9KhT
 7Y2hxVAIXfd/D1miJNCVhx7Qn23An3qNgyyGtebJ3o+ttAytkBg6MSNK7Grw3/nbLdni
 cdaHy5VoSDueQvMr5Ak00Dlr+wZEjuXKminXqjn6gcmyoF3fTNbGkYrWl5TfVloK3Xd0
 Jl71giNB9KntY0QVhDIeNlRJ4iOH74ift5EqlgUI3js7NaEx9qDu8xdPIpMp7iymXVk+
 HVdkHFHEljJMVXiQCXiC2GUuvHPetD2GHRgwE9/mEoV5LEQR8D20DVn6u+1bC500qfjC
 zjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9lKZKzvhkJ6C/OLWRsSrl7Dq/abBXyDMmXLU6ao2xM8=;
 b=Cxz929wBIP+rnhZcTrbnqKnHxV6KqSTrygHx7Q4FiHOgI86s03ZL0bxsS3GJ2uE/Na
 BLOI1o+ljAtVmjrBrrL/jP25uo+1asdUlzpzWA/Z8fpa8YS5XgVt5YWdkxpa1ofnLX+C
 LqfQLURCn50SlrfRKUMD99IO2vJPrgHTAJiOXCJHdcFzSKVBlnWIUq8MS7edc11AZzYU
 XrtIeH+z0fM0Z3mcKQzHKmGsFuE/uxx0cDwCN0T4KfqGf3FALFtW6JJ73bsSHftHpN53
 H6AVnuucnkWw8HAhmbAwdYvTVJ7GCdWDhVMMpljEQfzzkjAOVrviMTeI3pWoHKvCBkf3
 TcNw==
X-Gm-Message-State: AGi0Puatp6llEfGA01qyGoBBPXC4oNobY3f7EMpYCzOWD3BUkeEcFjmT
 y7ABj3/Uzhj/cJxiMQ3hyU3YT4NRboCLkXvkEFmDSofjr3Y=
X-Google-Smtp-Source: APiQypJLAXpR4UYVu85aKQoLSFStXTzLBmlYK6SJrHuaZylJZlTnbjGD7ZOeBfnAC6ilExfBFuZpC0qd4SwTLSsCbb8=
X-Received: by 2002:a05:6402:1d15:: with SMTP id
 dg21mr19945360edb.13.1588006089234; 
 Mon, 27 Apr 2020 09:48:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200423223459.200858-1-pcc@google.com>
 <CACvgo50xnz9g8PE6+4FxHr=NJ4sWd1no4erFBJ2RY2msE12PYA@mail.gmail.com>
 <CAMn1gO5i-nBU_S-U896qrYYOUU6W4yD=KG8KTwijUOF62ts36g@mail.gmail.com>
 <CACvgo53CGO-gM8xEyP92La+3KEPWGGy3V1+YsQ2hrCt+atMnLA@mail.gmail.com>
In-Reply-To: <CACvgo53CGO-gM8xEyP92La+3KEPWGGy3V1+YsQ2hrCt+atMnLA@mail.gmail.com>
From: Eric Anholt <eric@anholt.net>
Date: Mon, 27 Apr 2020 09:47:57 -0700
Message-ID: <CADaigPXW-2+YPfW8mayJPo8OoRB2j+VN=q6zu-cs0gmpXtjang@mail.gmail.com>
Subject: Re: [PATCH] drm: pl111: enable render node
To: Emil Velikov <emil.l.velikov@gmail.com>
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

On Mon, Apr 27, 2020 at 7:45 AM Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> On Fri, 24 Apr 2020 at 19:54, Peter Collingbourne <pcc@google.com> wrote:
> >
> > On Fri, Apr 24, 2020 at 4:11 AM Emil Velikov <emil.l.velikov@gmail.com> wrote:
> > >
> > > On Thu, 23 Apr 2020 at 23:51, Peter Collingbourne <pcc@google.com> wrote:
> > > >
> > > > The render node is required by Android which does not support the legacy
> > > > drmAuth authentication process.
> > > >
> > > > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > > > ---
> > > >  drivers/gpu/drm/pl111/pl111_drv.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > The summary talks about drmAuth, yet exposes a render node. Even
> > > through there's no rendering engine in the HW, as mentioned by Eric.
> > >
> > > AFAICT the only way drmAuth is relevant with pl111 is when you want to
> > > export/import dma bufs.
> > > Although that is handled in core and the artificial DRM_AUTH
> > > restriction has been lifted with commit [1].
> > >
> > > -Emil
> > >
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.7-rc2&id=30a958526d2cc6df38347336a602479d048d92e7
> >
> > Okay, most likely drmAuth is irrelevant here (I don't know much about
> > it to be honest; I know that Android uses render nodes, so I figured
> > that drmAuth must therefore be the thing that it doesn't use). Sorry
> > for the confusion. Here is a better explanation of why I needed this
> > change.
> >
> > Android has a composer process that opens the primary node and uses
> > DRM_IOCTL_MODE_ATOMIC to switch between frame buffers, and a renderer
> > process (surfaceflinger) that opens the render node, prepares frame
> > buffers and sends them to the composer. One idea for adapting this
> > architecture to devices without render nodes is to have the renderer
> > process open the primary node instead. But this runs into a problem:
> > suppose that the renderer process starts before the composer process.
> > In this case, the kernel makes the renderer the DRM master, so the
> > composer can't change the frame buffer. Render nodes don't have this
> > problem because opening them doesn't affect the master.
> >
> > I considered fixing this by having the composer issue
> > DRM_IOCTL_SET_MASTER, but this requires root privileges. If we require
> > drivers to provide render nodes and control access to the primary node
> > while opening up the render node, we can ensure that only authorized
> > processes can become the master without requiring them to be root.
> >
> I think that the crux, is trying to open a _primary_ node for
> _rendering_ purposes.
> While that may work - as you outline above - it's usually a bad idea.
>
> To step back a bit, in practise we have three SoC combinations:
>  - complete lack of render device - then you default to software rendering [1]
>  - display and render device are one and the same - no change needed,
> things should just work
>  - display and render devices are separate - surfaceflinger should
> open the correct _rendering_ device node.
>
> [1] Mesa's libEGL (don't recall exact name on Android) can open VGEM
> render node, to work with the kms-swrast_dri.so software rasteriser
> module.
>
> While I did not try [1] with Android, it was working fine with CrOS. I
> suggest giving it a try and reporting bugs.

VGEM is not a solution, because it doesn't coordinate caching behavior
with your display node and so you get corruption if you try to to
share dma-bufs between them.  In cros it's used only for some tests as
far as I've heard, and it's been a source of pain.

If we want to go the route of "kms-only nodes also provide a render
node interface for doing swrast on", I think that would be a good
idea, but we should do this at a core DRM level (probably "does this
driver expose dma-buf? then also expose render nodes") rather than per
kms driver.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
