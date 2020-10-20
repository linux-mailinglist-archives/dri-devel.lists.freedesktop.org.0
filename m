Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08762293EB3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 16:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9EF6ECE8;
	Tue, 20 Oct 2020 14:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4A56ECE1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 14:29:47 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id m128so2329085oig.7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 07:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Iw+9FQHNyoJkvzpR4HG8l9FMoO2YHaW76z2YEMGyQNk=;
 b=b8klL9mJfc+hHeOGr0XuJsKHWTOT+MJczln6i0Y2pX/+ODV/m1GccK/uieJTeMCDFW
 PSRjyHfsysfrsF2Z1aadY4bxFoB1Adrj8Ucaa4H2UOOTrynEpoUR2z4ojR6XuUGhowCV
 RloQNtd0ndcn9whfCnU3SNC8rW2KyeBevbLOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Iw+9FQHNyoJkvzpR4HG8l9FMoO2YHaW76z2YEMGyQNk=;
 b=rsro2mqyNJycOYrdvjVVp5qn7c3zehVTNrXMaE2WXdSuVlvVrDE7SNfeqyO1kh+45X
 e0lrafSPqYuJC9JYVMlbegZZeDsDbwrC9TQ97vRYA+OXkC1pt9J0uz8h1ioLgX4F6jRq
 em1MXWTbPjgXIsnVxvVdmHIecvDBcTLg6yinVfYL8ap8JY4GNX5Qx4EaJIbijl6VvMYW
 8K7q+SHKmr/aQ32J9qkNURjd2h/JEynZNBzoDoPI8OavcH9DTg9jNIh3ImKcYRng4zlD
 oHO1LuELxyVn7qUGBWMG9MzUuLRPi8E9QDY5BUXSHjZCzM+EmXhR76NJIxeQN+5Mqry4
 4AXA==
X-Gm-Message-State: AOAM530PyAUb+QMimrt+pGccs+UpT/Fmz2ug8DZzjej+Xe0pYMtac6V1
 JSsjcZz80gmSPRjGt4wuKowyX3/nWlP+2ioAx48DBw==
X-Google-Smtp-Source: ABdhPJwrebSK+BPzGtoMppzVbUL2XYzWHnimazpLvBBa8NBDpveNIQ2JAKbdpYQNu0j4KLTKpH7+TG4HRKat8/xIXgw=
X-Received: by 2002:aca:cc01:: with SMTP id c1mr2067105oig.128.1603204186995; 
 Tue, 20 Oct 2020 07:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201019211101.143327-1-robdclark@gmail.com>
 <20201020082404.GJ401619@phenom.ffwll.local>
 <CAF6AEGuT6ZSpitNS0eBcjKhAVW1QBg+uPJQQkBLckOk=_GBx=A@mail.gmail.com>
In-Reply-To: <CAF6AEGuT6ZSpitNS0eBcjKhAVW1QBg+uPJQQkBLckOk=_GBx=A@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 20 Oct 2020 16:29:35 +0200
Message-ID: <CAKMK7uEg-iz2zK6E0RFA-JQ+GfjuUcnrdu+e_3FWq9E9_9WUZA@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/msm: kthread_worker conversion
To: Rob Clark <robdclark@gmail.com>
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
Cc: Akhil P Oommen <akhilpo@codeaurora.org>,
 Tanmay Shah <tanmay@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>,
 Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Qinglang Miao <miaoqinglang@huawei.com>, Roy Spliet <nouveau@spliet.org>,
 Wambui Karuga <wambui.karugax@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Rajendra Nayak <rnayak@codeaurora.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, tongtiangen <tongtiangen@huawei.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Drew Davenport <ddavenport@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 20, 2020 at 4:01 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, Oct 20, 2020 at 1:24 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Oct 19, 2020 at 02:10:50PM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > In particular, converting the async atomic commit (for cursor updates,
> > > etc) to SCHED_FIFO kthread_worker helps with some cases where we
> > > wouldn't manage to flush the updates within the 1ms-before-vblank
> > > deadline resulting in fps drops when there is cursor movement.
> > >
> > > Rob Clark (3):
> > >   drm/msm/gpu: Convert retire/recover work to kthread_worker
> > >   drm/msm/kms: Update msm_kms_init/destroy
> > >   drm/msm/atomic: Convert to per-CRTC kthread_work
> >
> > So i915 has it's own commit worker already for $reasons, but I don't think
> > that's a good path to go down with more drivers. And the problem seems
> > entirely generic in nature ...
>
> I'm not *entirely* sure what your point is here?  This is just
> migrating away from a shared ordered wq to per-crtc kthread so that we
> don't miss vblank deadlines for silly reasons (and then stall on the
> next frame's pageflip because we are still waiting for the cursor
> update to latch).  Kind of like vblank-work but scheduled prior to,
> rather than after, vblank.
>
> And you're right that the problem is partially generic.. hw that (a)
> doesn't have true async (cursor and/or otherwise) updates, and (b) has
> various flush bits that latch register updates on vblank, is not that
> uncommon.  But the current atomic helper API would have to be a bit
> redesigned to look more like the interface between msm_atomic and the
> display backend.  That is a fair bit of churn for re-using a small bit
> of code.

I was making some assumptions about what you're doing, and I was
wrong. So I went and tried to understand what's actually going on
here.

I'm trying to understand what exactly you've added with that async msm
support 2d99ced787e3d. I think this breaks the state structure update
model, you can't access any ->state pointers from the commit functions
after you've called drm_atomic_helper_commit_hw_done, or you might
have a use after free. And that seems to be happening from this commit
work thing you added to your existing commit work that the atomic
helpers provide already.

The various commit functions seem to grab various state objects by
just chasing pointers from the objects (instead of the
drm_atomic_state stuff), so this all feels like it's yolo
free-wheeling.

You also seem to be using the async_commit stuff from the atomic
helpers (which is actually synchronous (i.e. blocking) from the pov of
how the code runs, but seems to be for mdp5 only and not others. Also
your can_do_async still checks for legacy_cursor_update (maybe a
leftover, or needed on !mdp5 platforms) and ->async_update.

I'm thoroughly confused how this all works.

I do agree though that you probably want this to be a real time fifo
kthread worker, like for the vblank worker. Except now that I looked,
I'm not sure it's actually working intended and correct.
-Daniel

> BR,
> -R
>
> > -Daniel
> >
> > >
> > >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  3 +--
> > >  drivers/gpu/drm/msm/adreno/a5xx_preempt.c |  6 ++---
> > >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |  4 +--
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  4 +--
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  8 +++++-
> > >  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  |  8 +++++-
> > >  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  | 11 ++++++---
> > >  drivers/gpu/drm/msm/disp/mdp_kms.h        |  9 +++++--
> > >  drivers/gpu/drm/msm/msm_atomic.c          | 25 +++++++++++++++----
> > >  drivers/gpu/drm/msm/msm_drv.h             |  3 ++-
> > >  drivers/gpu/drm/msm/msm_gpu.c             | 30 +++++++++++++++--------
> > >  drivers/gpu/drm/msm/msm_gpu.h             | 13 +++++++---
> > >  drivers/gpu/drm/msm/msm_kms.h             | 23 ++++++++++++++---
> > >  13 files changed, 104 insertions(+), 43 deletions(-)
> > >
> > > --
> > > 2.26.2
> > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
