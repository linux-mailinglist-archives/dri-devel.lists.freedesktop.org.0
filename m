Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2093A1BBDFD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517416E3BC;
	Tue, 28 Apr 2020 12:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E222A89D79
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 15:58:15 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u16so174174wmc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ucyhLHGk3/IBIP9DFH/8nWihui5Fg9a2ClyF0ieNkv0=;
 b=ZLfg8VfqCtcH5sM8mGCJAMImRQB2JEP7GQHQoYq918VxqT1mGYmEdUFFpVNh0SuO38
 E7l7VgIXqI4nKBV2ECQkl+02rnltgsAkxzY8A4uG8JUS+jUohuMBg3isOHGHDkFo4jfL
 LNOWpP/mwbnO5rZ9BZGAoD6hp4CWFPwjIFHiu/aBlbmZzJtr1BuZvb+LG2b4KchOKuFr
 76yXbiqlJRzT00bM47OnDJPtTioVMI1OfjFDJsEQOTG5iDux2f5frWD/UNA8gXU+1AEV
 QWwOC3y1z2k2PAGT/sGw3M0ZGxa0NkPqI9qbqrLNyOlpaNdei1M1UwOMroMVg2/t7eW+
 +nvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ucyhLHGk3/IBIP9DFH/8nWihui5Fg9a2ClyF0ieNkv0=;
 b=ghM+r4izQ3zBH55cG0jG/J62dwVrnob/Nyj23TsX7Y1hV6wnmEvgs/MNZ8bCO+8wKU
 +YY7uylZx/wyTfg8TdJHSftd/g/uRSO4aNKIm8+i+94PrYRSoHySGru2w3uwanwYEce0
 iBpngDfWfFfw7pJFvs+X6LvkNAGyI0g5ahN/SGfZcdpb6h3yd+O7i+mdfDcKRMVk4c5B
 e+Z+7AVLHz1wD7EFLKwrsbBS9j23JCWsJUPBKwnulQq3QfXdOj/Ys5om1SBWjK3DNLr1
 nUd5ll5eJ38k9e9HBgIJ6Z1Rfv5OvG07OwY/djjVCSED9SqUQnLptukhtnnp7bDKSgr0
 MF/Q==
X-Gm-Message-State: AGi0PuYjStTmr5mVjkb9/ZldNLJuWgA1QCHr5Xi1W1dbv/zMrLUIiuUV
 wPNuFieB8L6yGWa4x5o7nX6DmE0lYKQOTNklLxD4cQ==
X-Google-Smtp-Source: APiQypJ8vVdXhaAqNlpCOvaZeyN16waXIFw4+irR6mxT6w4/fq6+fK5cPoZBvQI8skXgqGv3YkUxZ2ONfIBpS3EVweQ=
X-Received: by 2002:a1c:384:: with SMTP id 126mr183852wmd.58.1588003094230;
 Mon, 27 Apr 2020 08:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200423223459.200858-1-pcc@google.com>
 <CACvgo50xnz9g8PE6+4FxHr=NJ4sWd1no4erFBJ2RY2msE12PYA@mail.gmail.com>
 <CAMn1gO5i-nBU_S-U896qrYYOUU6W4yD=KG8KTwijUOF62ts36g@mail.gmail.com>
 <CACvgo53CGO-gM8xEyP92La+3KEPWGGy3V1+YsQ2hrCt+atMnLA@mail.gmail.com>
In-Reply-To: <CACvgo53CGO-gM8xEyP92La+3KEPWGGy3V1+YsQ2hrCt+atMnLA@mail.gmail.com>
From: Peter Collingbourne <pcc@google.com>
Date: Mon, 27 Apr 2020 08:58:03 -0700
Message-ID: <CAMn1gO7Q1C-aGwHQCyfzzVQORWsAcYb=Q8xkMm_5+504Cdbpig@mail.gmail.com>
Subject: Re: [PATCH] drm: pl111: enable render node
To: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
Cc: Liviu Dudau <Liviu.Dudau@arm.com>,
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

(Android uses SwiftShader for software rendering, not Mesa, FWIW.)

> render node, to work with the kms-swrast_dri.so software rasteriser
> module.
>
> While I did not try [1] with Android, it was working fine with CrOS. I
> suggest giving it a try and reporting bugs.

I'm not sure I understand your suggestion, or at least how it would
work on Android. The composer process wouldn't be able to use
DRM_IOCTL_MODE_ATOMIC to display a frame buffer produced by the
surfaceflinger process using a vgem render node, would it? It's a
different driver so the memory region used for the frame buffer
wouldn't necessarily be compatible with the pl111 device. As far as I
know, the frame buffer would need to be produced using a pl111 render
node.

Peter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
