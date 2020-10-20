Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47896293F4B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 17:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233266ECFC;
	Tue, 20 Oct 2020 15:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5236ECF4;
 Tue, 20 Oct 2020 15:08:55 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j7so2563228wrt.9;
 Tue, 20 Oct 2020 08:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SFeBwkUn/dDhXTnD86F6OZeuGilRBUIWND1rdi/Y/kg=;
 b=RZobnZ05ih+Rqqkx+8PI3HMewGx7h+RU0lk2W+R6cz2W6sMFIA32Dm0b9ueilSUpa0
 Opvp06mGNbBl1t7pMC2qbK3EaElYG2ULo9HTekKorx45iKG9+CVeAcswCH+lsEIPCDGu
 TXxd76Y2I3f5/mPeRU6IJCSQyUCzHOQZxjCp4Zbhv7SkH9Xu1fqbV2EAIP4MOz/M4Hv0
 igerqviguRaETTRaW3u+W6oNFipcHFEqMCER8GWUEGpjeMF8P8g4hUtPkgBskQNeS/L4
 3m8RwZ6xNEbqGMGzVBkUD28kmhNugQ6Jf45q4WTYX8bqMopURRpNCFuWZN/+Eas+6vgC
 T4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SFeBwkUn/dDhXTnD86F6OZeuGilRBUIWND1rdi/Y/kg=;
 b=mMDg8QE1aEg4zDHWdPavtBcGBOx0iJNyQFZcwU5TT5q5UraXU/E9Q0SPqVPyBgRY25
 +1mz7w3B4e4Y6gI4cZdXdG4fCbuIOQD6ni3nY+J+mvuXcYq8RfGv5euXC5VwVVgxV/37
 /sG1afSei//jIR5lc/Puh4VtgXj2voQh3332fQ/EWEBgyV2KYzctO4hKkU665NbBYAmG
 gE5c6aFig7IOTPtuB5CrYCvKo3/ZMMUfvbSS2jS3oRaYchT84dObpCTbZNPMGtoAfAGS
 Lp49Rqv3Bya53JUaplL32TNUu9+cmxGhd3HTU3W7rWT/dvYAQTvBb5dpK/DiRanzVgmg
 Dt6w==
X-Gm-Message-State: AOAM533qYuUJ/9bbmPOHWdHwBNSLYQUdPoiztDKjYCF9dL7VlfHBRR5W
 T+en+IW2B0bptLTWxRobIXg5kVfnUmge2nRxE8PseYdcFEubGQtv
X-Google-Smtp-Source: ABdhPJygbYnX+nV8d8fzFa/3T3PsbIQumRCaay7yM34oEEVqsx9Ni9Jns9BNcN6ydTiFrQtz/nu+Y8xZMsivIx3GdtE=
X-Received: by 2002:a5d:4987:: with SMTP id r7mr3798344wrq.327.1603206533995; 
 Tue, 20 Oct 2020 08:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201019211101.143327-1-robdclark@gmail.com>
 <20201020082404.GJ401619@phenom.ffwll.local>
 <CAF6AEGuT6ZSpitNS0eBcjKhAVW1QBg+uPJQQkBLckOk=_GBx=A@mail.gmail.com>
 <CAKMK7uEg-iz2zK6E0RFA-JQ+GfjuUcnrdu+e_3FWq9E9_9WUZA@mail.gmail.com>
In-Reply-To: <CAKMK7uEg-iz2zK6E0RFA-JQ+GfjuUcnrdu+e_3FWq9E9_9WUZA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 20 Oct 2020 08:08:42 -0700
Message-ID: <CAF6AEGuF_76hMHa-n7VYHY+sSKGTt=gTBh8r+2992Bhx-RE61A@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/msm: kthread_worker conversion
To: Daniel Vetter <daniel@ffwll.ch>
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

On Tue, Oct 20, 2020 at 7:29 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Oct 20, 2020 at 4:01 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Tue, Oct 20, 2020 at 1:24 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Mon, Oct 19, 2020 at 02:10:50PM -0700, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > In particular, converting the async atomic commit (for cursor updates,
> > > > etc) to SCHED_FIFO kthread_worker helps with some cases where we
> > > > wouldn't manage to flush the updates within the 1ms-before-vblank
> > > > deadline resulting in fps drops when there is cursor movement.
> > > >
> > > > Rob Clark (3):
> > > >   drm/msm/gpu: Convert retire/recover work to kthread_worker
> > > >   drm/msm/kms: Update msm_kms_init/destroy
> > > >   drm/msm/atomic: Convert to per-CRTC kthread_work
> > >
> > > So i915 has it's own commit worker already for $reasons, but I don't think
> > > that's a good path to go down with more drivers. And the problem seems
> > > entirely generic in nature ...
> >
> > I'm not *entirely* sure what your point is here?  This is just
> > migrating away from a shared ordered wq to per-crtc kthread so that we
> > don't miss vblank deadlines for silly reasons (and then stall on the
> > next frame's pageflip because we are still waiting for the cursor
> > update to latch).  Kind of like vblank-work but scheduled prior to,
> > rather than after, vblank.
> >
> > And you're right that the problem is partially generic.. hw that (a)
> > doesn't have true async (cursor and/or otherwise) updates, and (b) has
> > various flush bits that latch register updates on vblank, is not that
> > uncommon.  But the current atomic helper API would have to be a bit
> > redesigned to look more like the interface between msm_atomic and the
> > display backend.  That is a fair bit of churn for re-using a small bit
> > of code.
>
> I was making some assumptions about what you're doing, and I was
> wrong. So I went and tried to understand what's actually going on
> here.
>
> I'm trying to understand what exactly you've added with that async msm
> support 2d99ced787e3d. I think this breaks the state structure update
> model, you can't access any ->state pointers from the commit functions
> after you've called drm_atomic_helper_commit_hw_done, or you might
> have a use after free. And that seems to be happening from this commit
> work thing you added to your existing commit work that the atomic
> helpers provide already.
>
> The various commit functions seem to grab various state objects by
> just chasing pointers from the objects (instead of the
> drm_atomic_state stuff), so this all feels like it's yolo
> free-wheeling.
>
> You also seem to be using the async_commit stuff from the atomic
> helpers (which is actually synchronous (i.e. blocking) from the pov of
> how the code runs, but seems to be for mdp5 only and not others. Also
> your can_do_async still checks for legacy_cursor_update (maybe a
> leftover, or needed on !mdp5 platforms) and ->async_update.
>
> I'm thoroughly confused how this all works.

The legacy_cursor_update is really the thing that motivated the async
commit support in the first place.  Sadly we still have userspace that
expects to be able to use legacy cursor API, and that it will be
nonblocking (and not cause fps drop).  (I'm not a fan of the legacy
cursor UAPI.. don't hate the player..)

The premise is to do everything in terms of crtc_mask, although yeah,
it looks like there are a few points that need to look at things like
crtc->state->active.  The only point in msm-atomic itself that does
this is vblank_get/put(), possibly we can fix drm_vblank instead and
drop that workaround (see 43906812eaab06423f56af5cca9a9fcdbb4ac454)

The rest of the async part is really just supposed to be writing the
appropriate flush reg(s) and waiting until flush completes, although
dpu's excess layering makes this harder than it needs to be.

In practice, the kms->wait_flush() at the top of
msm_atomic_commit_tail() will block until a pending async commit
completes (this is where we hit the fps drop if we miss vblank
deadline), so I don't *think* you can trigger a use-after-free.  But
the dpu code could be better cleaned up to have less obj->state
dereference in the kms->flush_commit(crtc_mask)/etc path.

BR,
-R

> I do agree though that you probably want this to be a real time fifo
> kthread worker, like for the vblank worker. Except now that I looked,
> I'm not sure it's actually working intended and correct.
> -Daniel
>
> > BR,
> > -R
> >
> > > -Daniel
> > >
> > > >
> > > >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  3 +--
> > > >  drivers/gpu/drm/msm/adreno/a5xx_preempt.c |  6 ++---
> > > >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |  4 +--
> > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  4 +--
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  8 +++++-
> > > >  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  |  8 +++++-
> > > >  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  | 11 ++++++---
> > > >  drivers/gpu/drm/msm/disp/mdp_kms.h        |  9 +++++--
> > > >  drivers/gpu/drm/msm/msm_atomic.c          | 25 +++++++++++++++----
> > > >  drivers/gpu/drm/msm/msm_drv.h             |  3 ++-
> > > >  drivers/gpu/drm/msm/msm_gpu.c             | 30 +++++++++++++++--------
> > > >  drivers/gpu/drm/msm/msm_gpu.h             | 13 +++++++---
> > > >  drivers/gpu/drm/msm/msm_kms.h             | 23 ++++++++++++++---
> > > >  13 files changed, 104 insertions(+), 43 deletions(-)
> > > >
> > > > --
> > > > 2.26.2
> > > >
> > > > _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
