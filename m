Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E70261BA6C9
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 16:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453586E301;
	Mon, 27 Apr 2020 14:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B17E6E2F9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 14:45:25 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id m9so3887342uaq.12
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 07:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pMQFvlnME4iTNqxw1Wx9sldO7YA5mGVbHK5a51cU53Q=;
 b=pvL+dOPPkLN/e64w0s1Q5eJ8PXKgTJeWU4Tb/NCPO8TfxgiNV427AXhvMhNfWLHm86
 hvaFNrq+gPdx/2K6Za6GM15aVk9SyjtMCAcpmSgDuePPuY660h1NEzwOZBa0gDN76s4w
 bdq7M2Tynm5cIdBpYjlci2M3C9l8PSirTVctk+SNMm8vmwM5qVgRX/FkAQOT3/3EwMQI
 R1jmOQci/cawQ04OsqqqQvw8BXG8btr3DVJK5p5oI5x72MDfdirOVMky7m4ybWCVWkfh
 Hz27TIcXqFlQLuHNrtmN0oY2zdFuIr2dR7wIWmng/aH5T25Ne/JOdB/OX4AD1AXaseh0
 VT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pMQFvlnME4iTNqxw1Wx9sldO7YA5mGVbHK5a51cU53Q=;
 b=R4S+8CV32metfc1Gn8twhn6g/5fJGObn/0eVcLdPMuQiZMPTmBleyT0vuTc6suV7rB
 gl+hFPAs/v0yaATRCZfZ4EseBL3JufQ8RHkp9BTbDH1qtqF/+yAHwHTC9y6D6GdnEaQ4
 yRIC3aiC8/eSKRCPUzEUASGU80yrCwHrTPwza9FX/NKXDo0jMe/6zComOG/hc7rMz9o0
 1RXfXSMeMYMKrpYuYD+5Q0OktjuKz5cB6eNofOLCr7/JtTDIy+M5+E6OpKJqB2HbpDpt
 ul4q0p6nYZnnyiWxMAWCPjpFgcCs7osJ4H8xiqenT9UB2Ws872XDrtwjJcnd17gEVIYr
 lTYg==
X-Gm-Message-State: AGi0Pua9CQa4+yKEzMgrCaBnzCHxWTp/ly4Feb98z7VCa/PgFKSP8e8j
 Yo78nPeieZ5Pb8nzj5u8e/eZbosvzwNMWHK801c=
X-Google-Smtp-Source: APiQypItQMkSRHCZMyljZzvhY51Tx7q1nHCmYUe+Hjf6tdnj4gcu6Ed4mxB6xlAopYcud46thBaF7W7ZArlvTGJRZ7s=
X-Received: by 2002:a67:c482:: with SMTP id d2mr14448311vsk.37.1587998724283; 
 Mon, 27 Apr 2020 07:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200423223459.200858-1-pcc@google.com>
 <CACvgo50xnz9g8PE6+4FxHr=NJ4sWd1no4erFBJ2RY2msE12PYA@mail.gmail.com>
 <CAMn1gO5i-nBU_S-U896qrYYOUU6W4yD=KG8KTwijUOF62ts36g@mail.gmail.com>
In-Reply-To: <CAMn1gO5i-nBU_S-U896qrYYOUU6W4yD=KG8KTwijUOF62ts36g@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 27 Apr 2020 15:43:10 +0100
Message-ID: <CACvgo53CGO-gM8xEyP92La+3KEPWGGy3V1+YsQ2hrCt+atMnLA@mail.gmail.com>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 24 Apr 2020 at 19:54, Peter Collingbourne <pcc@google.com> wrote:
>
> On Fri, Apr 24, 2020 at 4:11 AM Emil Velikov <emil.l.velikov@gmail.com> wrote:
> >
> > On Thu, 23 Apr 2020 at 23:51, Peter Collingbourne <pcc@google.com> wrote:
> > >
> > > The render node is required by Android which does not support the legacy
> > > drmAuth authentication process.
> > >
> > > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > > ---
> > >  drivers/gpu/drm/pl111/pl111_drv.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > The summary talks about drmAuth, yet exposes a render node. Even
> > through there's no rendering engine in the HW, as mentioned by Eric.
> >
> > AFAICT the only way drmAuth is relevant with pl111 is when you want to
> > export/import dma bufs.
> > Although that is handled in core and the artificial DRM_AUTH
> > restriction has been lifted with commit [1].
> >
> > -Emil
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.7-rc2&id=30a958526d2cc6df38347336a602479d048d92e7
>
> Okay, most likely drmAuth is irrelevant here (I don't know much about
> it to be honest; I know that Android uses render nodes, so I figured
> that drmAuth must therefore be the thing that it doesn't use). Sorry
> for the confusion. Here is a better explanation of why I needed this
> change.
>
> Android has a composer process that opens the primary node and uses
> DRM_IOCTL_MODE_ATOMIC to switch between frame buffers, and a renderer
> process (surfaceflinger) that opens the render node, prepares frame
> buffers and sends them to the composer. One idea for adapting this
> architecture to devices without render nodes is to have the renderer
> process open the primary node instead. But this runs into a problem:
> suppose that the renderer process starts before the composer process.
> In this case, the kernel makes the renderer the DRM master, so the
> composer can't change the frame buffer. Render nodes don't have this
> problem because opening them doesn't affect the master.
>
> I considered fixing this by having the composer issue
> DRM_IOCTL_SET_MASTER, but this requires root privileges. If we require
> drivers to provide render nodes and control access to the primary node
> while opening up the render node, we can ensure that only authorized
> processes can become the master without requiring them to be root.
>
I think that the crux, is trying to open a _primary_ node for
_rendering_ purposes.
While that may work - as you outline above - it's usually a bad idea.

To step back a bit, in practise we have three SoC combinations:
 - complete lack of render device - then you default to software rendering [1]
 - display and render device are one and the same - no change needed,
things should just work
 - display and render devices are separate - surfaceflinger should
open the correct _rendering_ device node.

[1] Mesa's libEGL (don't recall exact name on Android) can open VGEM
render node, to work with the kms-swrast_dri.so software rasteriser
module.

While I did not try [1] with Android, it was working fine with CrOS. I
suggest giving it a try and reporting bugs.

Thanks
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
