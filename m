Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 569BE1BC232
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 17:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976BE6E804;
	Tue, 28 Apr 2020 15:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2986E804
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 15:05:32 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id x18so25033221wrq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 08:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XtpT5Kdk94PLySr/uiTps+mRb+oBK4IgLObMTjcM+zQ=;
 b=Yy5DcZrXeXRVHeCYhYEYpTlMsiLlS8VcMiInPzLIhgWbZVgU7UOf6+ezPvrS2UQy08
 hCsEyx6I1zskKGruxxHEPw600+JH+A4TImTlHfgZ4Qg+Iatn0PFUte7IT1CDfSQtC4L4
 6ZeFjuekEYJkfdeFIbnXQ713DRqY9gXyuk1Ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XtpT5Kdk94PLySr/uiTps+mRb+oBK4IgLObMTjcM+zQ=;
 b=WU114Z7qDjSIimNTrdC/2+7lcOgNwf5tqD911JaW92cD0IlPVZ0UndIBT8aU8862+H
 1Od12KCGUAhHgTC0/E6f79hChfsjKQ7NbRWVb/V8HoZsHuELE+hyt0MYalgkwsU8St20
 RS9hR0xtd9UwPiKzG4aIR1ISO6x/5+++JKlkfkzow3b1xxOgDlhLgJtJ8tFpGVeaGK4l
 Wl6CHc5s909HT5wr3Wqug1YBtJcQycySCFrYVAlKA/Ok4x2zkJl9LCKv16Y00MY+6Kvg
 I0tNeSCrFNeAwKzDZcIfR8VWSXuIXexMDgRa7kIh16wQYal+bqNlGQb0YNissvEhmAkv
 Vo0A==
X-Gm-Message-State: AGi0PuZWixovazTi4Jhx0hV/lxLaqC+8KqdoipjZH9ToObvjSRZjlXz3
 vi4k8Qt6Rr2AAtCaf4Uum8EjlQ==
X-Google-Smtp-Source: APiQypKqPlID4MUpmcCXFRC8bm6CSNAxRnbmiFFq478b8cgKwPFTVSQCqAttKzj+nVsBpbsq3kfUJA==
X-Received: by 2002:a5d:6589:: with SMTP id q9mr31921936wru.136.1588086330729; 
 Tue, 28 Apr 2020 08:05:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x18sm25370308wrv.12.2020.04.28.08.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 08:05:30 -0700 (PDT)
Date: Tue, 28 Apr 2020 17:05:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH] drm: pl111: enable render node
Message-ID: <20200428150528.GS3456981@phenom.ffwll.local>
References: <20200423223459.200858-1-pcc@google.com>
 <CACvgo50xnz9g8PE6+4FxHr=NJ4sWd1no4erFBJ2RY2msE12PYA@mail.gmail.com>
 <CAMn1gO5i-nBU_S-U896qrYYOUU6W4yD=KG8KTwijUOF62ts36g@mail.gmail.com>
 <CACvgo53CGO-gM8xEyP92La+3KEPWGGy3V1+YsQ2hrCt+atMnLA@mail.gmail.com>
 <CADaigPXW-2+YPfW8mayJPo8OoRB2j+VN=q6zu-cs0gmpXtjang@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADaigPXW-2+YPfW8mayJPo8OoRB2j+VN=q6zu-cs0gmpXtjang@mail.gmail.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
 Emil Velikov <emil.l.velikov@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 27, 2020 at 09:47:57AM -0700, Eric Anholt wrote:
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
> If we want to go the route of "kms-only nodes also provide a render
> node interface for doing swrast on", I think that would be a good
> idea, but we should do this at a core DRM level (probably "does this
> driver expose dma-buf? then also expose render nodes") rather than per
> kms driver.

Hm I thought to fix that vgem was switched over to wc mmap?

Probably still broken in some hilarious ways somewhere.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
