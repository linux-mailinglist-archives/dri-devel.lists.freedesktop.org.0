Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CC11BF626
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 13:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FFC6E248;
	Thu, 30 Apr 2020 11:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C406E248
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 11:10:14 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id d6so1580828vko.4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 04:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3acwxx+A3V9MwMK7/Hao1mq/0rDCGkfDbbRLyo1a2n4=;
 b=QhHuioN5tcQxmu7f/hFs00sZ8XAK5FgsQo7P7Op6vZGpPH5XM2VYyXZmEZOAwFvhyt
 1FuaB88ur3Yl8wZBO9oeF+MslS2Vvq0bgGEVjX4OaDO3NWnOro6SE9mEkCqE5/f4Oc7+
 7rCH//hOhKtRCpTUa7P1PHmgeoHe1b0b3wfnh7kT8wxv69WKcFJj7GNctdP8QS3AEpmF
 +Z9Ha56rMiYv2JE9LdtjEWLSM7+jUH45NIyPX8CRTjI6RP0kI9ucsmbrg47nTZ1KuRyM
 We+EZ+uVsw6EGY0LM0+jFSu4/X62EHgZScFiBfgKUEIRoSAt9Z8Pp0pV2ur9FAXzgm1a
 lslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3acwxx+A3V9MwMK7/Hao1mq/0rDCGkfDbbRLyo1a2n4=;
 b=NPtNj7c2sp3htme4YZaNWsnEuBFMl/b251gbX5V3bJKcc75F2VQly+1xWdDq4IrSPF
 F0VJEvGfsYM0t3H6zA2LRL+2Y0C4q3V12yGoZFbGkWG0XqI1OPnEHMx5stCKvXLHWuqs
 5BYz+4LYLK5aTGyBkkuphRLaqGSWAup6lnCnCcKHe52vpmSYzaNEZnuCkUzvjCvpXPd/
 3zJopewiF7za8oFQpRnOLZDn9XXHR29bMxE6CLv4rfbTkwhDGNMikYl+0xDph0WRKU9n
 6UdIi4uH+soF8YV6pj+RpyejsFeIDNwS+V8ucK7m4RLl27DfC8yJS1bZQEg2wRAar5ma
 acVg==
X-Gm-Message-State: AGi0PubpWQAQWxxI5tKYNRkw7L44C7lZGNV2wLuv4R2uGoFPR0tARJ4y
 VWBfpWXSw4hVBxXpmBZfPhNyvNoeB99SGsPLJD0=
X-Google-Smtp-Source: APiQypJb3r7gdv2qaWVdJj4cmLq0oQu7yyBzU3GmRCuxuyodQ0J0kjltCA2+Z2KbE2t9CgmjEp1C9amrVJEFvy+7Ans=
X-Received: by 2002:a1f:a454:: with SMTP id n81mr2032359vke.6.1588245013974;
 Thu, 30 Apr 2020 04:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200423223459.200858-1-pcc@google.com>
 <CACvgo50xnz9g8PE6+4FxHr=NJ4sWd1no4erFBJ2RY2msE12PYA@mail.gmail.com>
 <CAMn1gO5i-nBU_S-U896qrYYOUU6W4yD=KG8KTwijUOF62ts36g@mail.gmail.com>
 <CACvgo53CGO-gM8xEyP92La+3KEPWGGy3V1+YsQ2hrCt+atMnLA@mail.gmail.com>
 <CAMn1gO7Q1C-aGwHQCyfzzVQORWsAcYb=Q8xkMm_5+504Cdbpig@mail.gmail.com>
In-Reply-To: <CAMn1gO7Q1C-aGwHQCyfzzVQORWsAcYb=Q8xkMm_5+504Cdbpig@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 30 Apr 2020 12:07:56 +0100
Message-ID: <CACvgo50s4eg+3KjFXOFLyFL3pjKRE41kPH5qD_0iaDBVUk_s8A@mail.gmail.com>
Subject: Re: [PATCH] drm: pl111: enable render node
To: Peter Collingbourne <pcc@google.com>
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

On Mon, 27 Apr 2020 at 16:58, Peter Collingbourne <pcc@google.com> wrote:
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
>
> (Android uses SwiftShader for software rendering, not Mesa, FWIW.)
>
I don't know much about SwiftShader.

> > render node, to work with the kms-swrast_dri.so software rasteriser
> > module.
> >
> > While I did not try [1] with Android, it was working fine with CrOS. I
> > suggest giving it a try and reporting bugs.
>
> I'm not sure I understand your suggestion, or at least how it would
> work on Android. The composer process wouldn't be able to use
> DRM_IOCTL_MODE_ATOMIC to display a frame buffer produced by the
> surfaceflinger process using a vgem render node, would it? It's a
> different driver so the memory region used for the frame buffer
> wouldn't necessarily be compatible with the pl111 device. As far as I
> know, the frame buffer would need to be produced using a pl111 render
> node.
>
The pl111 will create a buffer, exports it. Renderer will import and
draw onto it.
Upon completion, the composer will DRM_IOCTL_MODE_ATOMIC the pl111 buffer.

I believe this approach has been used for a few years now.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
