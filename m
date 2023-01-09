Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D9866232A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 11:26:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4DB10E093;
	Mon,  9 Jan 2023 10:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D411010E093
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 10:26:35 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 m7-20020a17090a730700b00225ebb9cd01so12281531pjk.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 02:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Aa0LOobEUkWWUY8RhKywphIXv2oIbVVC/OzD6QfEsQE=;
 b=Z7pTduGlCGBHVVcxuh1G+qFZ8V8F8RDij6up/fHEYFYwjw4jsAAU8hPA3DcGW7EMTs
 PwZr27y+BmAO3nffL3xhtMzHL16VVDZ0hutyCRrHwCNnTCwdBEps5pvb539TpQGwW2sC
 8pCMuHZffO7HH1BT27aKv3spiDWKqiXyneSiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Aa0LOobEUkWWUY8RhKywphIXv2oIbVVC/OzD6QfEsQE=;
 b=t7DQhASEJZsnZbd/W4g8VzEibQkODgccsQboWFe+SngTEqIygdtjJJ/fcagU+Wzhun
 8CAsFQkGE3FGsjvNxCGsvVQ65AY/koyWkb3yxzgZyO9Cwy+WZtcGyuQ6q3WaHafWUF7Y
 Dylw20na5BTZUTqPgQeqJM/SjDNFtziqyuiI7HtMQyyC6XMKuRSH1/KjNSyuXWGdSFa2
 XL3p34Mf22YKPhLCBXPOn6+c5A1h8U4cMRUl2RzNVOhKfeVSE3uesb/JqeMorTAkFL3D
 pztlFAAGDA3S5OfDuAafta5zCvhI2VNuHmkUzyVA8t/SZTlSpswhIq9dtF/1IPPsjqr4
 8PjA==
X-Gm-Message-State: AFqh2kr5CdjeW4f2/xwMe0Pa0FiVlDZxaY4rxZXOE0HooQ+D3Wu+Myj0
 W2Aya+TEV/8Noq03YvaoMJK+jHJVLEcFh3R9g+tp4Q==
X-Google-Smtp-Source: AMrXdXvqVha9HvD+ZV3UPEcDTnV12qpjFigiVnDNRTduYEkbP3gT+f48li1UxGcNeTw/+cJfUhEiW2+eicsfZv55/Lk=
X-Received: by 2002:a17:902:7884:b0:192:bf3c:b85e with SMTP id
 q4-20020a170902788400b00192bf3cb85emr2011150pll.68.1673259995334; Mon, 09 Jan
 2023 02:26:35 -0800 (PST)
MIME-Version: 1.0
References: <Y7aGw/irynC61O85@ls3530>
 <CAKMK7uEnFBo_YfU8OTvMS8+YkoGS=vmpGQPMa9PKxGOB3pd7nA@mail.gmail.com>
In-Reply-To: <CAKMK7uEnFBo_YfU8OTvMS8+YkoGS=vmpGQPMa9PKxGOB3pd7nA@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 9 Jan 2023 11:26:23 +0100
Message-ID: <CAKMK7uFijjF+px9=xDXnyfhMbkxRqinEmV_N5VX6eAuJkc1J+g@mail.gmail.com>
Subject: Re: [GIT PULL] fbdev fixes for v6.2-rc3
To: Helge Deller <deller@gmx.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-fbdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 5 Jan 2023 at 11:22, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, 5 Jan 2023 at 09:14, Helge Deller <deller@gmx.de> wrote:
> >
> > Hi Linus,
> >
> > please pull the fbdev driver updates for 6.2-rc3, to receive
> > fixes for matroxfb, offb, omapfb and fbmem.
> >
> > Thanks,
> > Helge
> >
> > ----
> >
> > The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> >
> >   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> >
> > are available in the Git repository at:
> >
> >   http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.2-rc3
> >
> > for you to fetch changes up to 764043cccd7232a783753a612d628fc0cb7854be:
> >
> >   fbdev: omapfb: avoid stack overflow warning (2023-01-04 19:09:40 +0100)
> >
> > ----------------------------------------------------------------
> > fbdev updates for kernel 6.2-rc3:
> >
> > - Fix Matrox G200eW initialization failure
> > - Fix build failure of offb driver when built as module
> > - Optimize stack usage in omapfb
> > - Prevent use-after-free in fbmem
> >
> > ----------------------------------------------------------------
> > Arnd Bergmann (1):
> >       fbdev: omapfb: avoid stack overflow warning
> >
> > Hang Zhang (1):
> >       fbdev: fbmem: prevent potential use-after-free issues with console_lock()
>
> I looked at this, and even by fbdev locking standards this makes
> absolutely no sense to me. I think this should be dropped before we've
> reached some sort of conclusion on what is going on, or whether this
> is just pure static checker conjecture without fully understanding how
> this is supposed to work really.

Just to close this: Turned out to be some kind of static checker dud
(and unfortunately the commit message didn't even explain that it was
found through some undisclosed static checker, I asked the submitter
to rectify this going forward since they'll likely submit more stuff
like this).
-Daniel

> > Paul Menzel (1):
> >       fbdev: matroxfb: G200eW: Increase max memory from 1 MB to 16 MB
> >
> > Randy Dunlap (1):
> >       fbdev: make offb driver tristate
> >
> > Xu Panda (2):
> >       fbdev: omapfb: use strscpy() to instead of strncpy()
> >       fbdev: atyfb: use strscpy() to instead of strncpy()
> >
> >  drivers/video/fbdev/Kconfig                |  4 ++--
> >  drivers/video/fbdev/aty/atyfb_base.c       |  3 +--
> >  drivers/video/fbdev/core/fbmem.c           |  2 ++
> >  drivers/video/fbdev/matrox/matroxfb_base.c |  4 ++--
> >  drivers/video/fbdev/omap/omapfb_main.c     |  5 ++---
> >  drivers/video/fbdev/omap2/omapfb/dss/dsi.c | 28 ++++++++++++++++++----------
> >  6 files changed, 27 insertions(+), 19 deletions(-)
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
