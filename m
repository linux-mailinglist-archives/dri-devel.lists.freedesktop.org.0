Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375FD2941FE
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 20:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9CB6ECFD;
	Tue, 20 Oct 2020 18:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707BC6ECFD
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 18:14:51 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id n11so2587127ota.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 11:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gnFGhHEYKbz7msRINrOaooP6sJ2XfWnC8w8oCNXUrN0=;
 b=dZiWbKP9bmZlojvyurvdhjh66YJ4nM1X7hOMPGS9IrtyQIQLQdSt7fXWyx7KOx1C2B
 29/ByrzBoTqxMT7rdokPPNPX7Xo8Aep6pmA5KpYofXTdzWRlJxH1aqGZvgIST7m0VF3b
 Xu63E3g+egXTsFD79fcinI/TESk3PdGv/jRR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gnFGhHEYKbz7msRINrOaooP6sJ2XfWnC8w8oCNXUrN0=;
 b=MwF8p0ye7hpiXANFaVqIkAiNvTFs7AG05N/qathjojMH8m8sGzn/znx7/c5egM6wu4
 LpugsNUu6nICv/CKRbG/+vSEOmPw8P1gKSYP7LSJm3J96s0UMxXlbKPYxdpqV9OzM/st
 mfs/SQlPu1/PhzQCxBl/G2Io6s5NTI5OHWoM6ifsUR6agdj3GXfieZDs++rWaoqjVHv4
 hQw2nWG01h9R4T1D7YZs9tT2M4KjhrIrVIxLAEUgOnLwzf2Hh1Xv+45fnL+BQ5dOSzrg
 xQHwxMuw7Z4ogEWlQwHuMJRAxNc5SEF0O9BbdGDVBYDW6B3Wptnrp+SqLAHEFJAlIbVw
 JzeQ==
X-Gm-Message-State: AOAM53006+h1+z4x0tzB+6++wG4f/b9VgVfyy7C1r7MAFaz4zno0/7zW
 AKdeNPnpBnVNf3nJ4OYNXbwCweBy67njY2/3LllkfA==
X-Google-Smtp-Source: ABdhPJyP9DmE/neC5YDJbo89ArI7oekN7PmzmCUuzf0eS6IJ79MthW0S9XfzJI6qy1VY7tSD2bgiIk/3Bb4eDaVkEeE=
X-Received: by 2002:a05:6830:1647:: with SMTP id
 h7mr2722357otr.281.1603217690270; 
 Tue, 20 Oct 2020 11:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <20201019211101.143327-1-robdclark@gmail.com>
 <20201020082404.GJ401619@phenom.ffwll.local>
 <CAF6AEGuT6ZSpitNS0eBcjKhAVW1QBg+uPJQQkBLckOk=_GBx=A@mail.gmail.com>
 <CAKMK7uEg-iz2zK6E0RFA-JQ+GfjuUcnrdu+e_3FWq9E9_9WUZA@mail.gmail.com>
 <CAF6AEGuF_76hMHa-n7VYHY+sSKGTt=gTBh8r+2992Bhx-RE61A@mail.gmail.com>
 <CAKMK7uEHSsgVDsFnpedx2_w0B8ST3RKA1O62NXOtDr2bCrie+A@mail.gmail.com>
 <CAF6AEGtfLpueGUF_2oWzAt2KCHh0mmF4fDnNRHB3P5H_-Xn=6A@mail.gmail.com>
In-Reply-To: <CAF6AEGtfLpueGUF_2oWzAt2KCHh0mmF4fDnNRHB3P5H_-Xn=6A@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 20 Oct 2020 20:14:38 +0200
Message-ID: <CAKMK7uEsv36Y3ZiKdtHFCSxv_Wywm6M2nZ1BxpjOCfF46UKZpw@mail.gmail.com>
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

On Tue, Oct 20, 2020 at 7:23 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, Oct 20, 2020 at 10:02 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Tue, Oct 20, 2020 at 5:08 PM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Tue, Oct 20, 2020 at 7:29 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Tue, Oct 20, 2020 at 4:01 PM Rob Clark <robdclark@gmail.com> wrote:
> > > > >
> > > > > On Tue, Oct 20, 2020 at 1:24 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > >
> > > > > > On Mon, Oct 19, 2020 at 02:10:50PM -0700, Rob Clark wrote:
> > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > >
> > > > > > > In particular, converting the async atomic commit (for cursor updates,
> > > > > > > etc) to SCHED_FIFO kthread_worker helps with some cases where we
> > > > > > > wouldn't manage to flush the updates within the 1ms-before-vblank
> > > > > > > deadline resulting in fps drops when there is cursor movement.
> > > > > > >
> > > > > > > Rob Clark (3):
> > > > > > >   drm/msm/gpu: Convert retire/recover work to kthread_worker
> > > > > > >   drm/msm/kms: Update msm_kms_init/destroy
> > > > > > >   drm/msm/atomic: Convert to per-CRTC kthread_work
> > > > > >
> > > > > > So i915 has it's own commit worker already for $reasons, but I don't think
> > > > > > that's a good path to go down with more drivers. And the problem seems
> > > > > > entirely generic in nature ...
> > > > >
> > > > > I'm not *entirely* sure what your point is here?  This is just
> > > > > migrating away from a shared ordered wq to per-crtc kthread so that we
> > > > > don't miss vblank deadlines for silly reasons (and then stall on the
> > > > > next frame's pageflip because we are still waiting for the cursor
> > > > > update to latch).  Kind of like vblank-work but scheduled prior to,
> > > > > rather than after, vblank.
> > > > >
> > > > > And you're right that the problem is partially generic.. hw that (a)
> > > > > doesn't have true async (cursor and/or otherwise) updates, and (b) has
> > > > > various flush bits that latch register updates on vblank, is not that
> > > > > uncommon.  But the current atomic helper API would have to be a bit
> > > > > redesigned to look more like the interface between msm_atomic and the
> > > > > display backend.  That is a fair bit of churn for re-using a small bit
> > > > > of code.
> > > >
> > > > I was making some assumptions about what you're doing, and I was
> > > > wrong. So I went and tried to understand what's actually going on
> > > > here.
> > > >
> > > > I'm trying to understand what exactly you've added with that async msm
> > > > support 2d99ced787e3d. I think this breaks the state structure update
> > > > model, you can't access any ->state pointers from the commit functions
> > > > after you've called drm_atomic_helper_commit_hw_done, or you might
> > > > have a use after free. And that seems to be happening from this commit
> > > > work thing you added to your existing commit work that the atomic
> > > > helpers provide already.
> > > >
> > > > The various commit functions seem to grab various state objects by
> > > > just chasing pointers from the objects (instead of the
> > > > drm_atomic_state stuff), so this all feels like it's yolo
> > > > free-wheeling.
> > > >
> > > > You also seem to be using the async_commit stuff from the atomic
> > > > helpers (which is actually synchronous (i.e. blocking) from the pov of
> > > > how the code runs, but seems to be for mdp5 only and not others. Also
> > > > your can_do_async still checks for legacy_cursor_update (maybe a
> > > > leftover, or needed on !mdp5 platforms) and ->async_update.
> > > >
> > > > I'm thoroughly confused how this all works.
> > >
> > > The legacy_cursor_update is really the thing that motivated the async
> > > commit support in the first place.  Sadly we still have userspace that
> > > expects to be able to use legacy cursor API, and that it will be
> > > nonblocking (and not cause fps drop).  (I'm not a fan of the legacy
> > > cursor UAPI.. don't hate the player..)
> >
> > Yeah this is why we have these atomic_async_check/commit functions,
> > and msm is even using them for mdp5. Not hating the player here at
> > all.
> >
> > > The premise is to do everything in terms of crtc_mask, although yeah,
> > > it looks like there are a few points that need to look at things like
> > > crtc->state->active.  The only point in msm-atomic itself that does
> > > this is vblank_get/put(), possibly we can fix drm_vblank instead and
> > > drop that workaround (see 43906812eaab06423f56af5cca9a9fcdbb4ac454)
> > >
> > > The rest of the async part is really just supposed to be writing the
> > > appropriate flush reg(s) and waiting until flush completes, although
> > > dpu's excess layering makes this harder than it needs to be.
> > >
> > > In practice, the kms->wait_flush() at the top of
> > > msm_atomic_commit_tail() will block until a pending async commit
> > > completes (this is where we hit the fps drop if we miss vblank
> > > deadline), so I don't *think* you can trigger a use-after-free.  But
> > > the dpu code could be better cleaned up to have less obj->state
> > > dereference in the kms->flush_commit(crtc_mask)/etc path.
> >
> > Hm this is more or less what the atomic_async_commit/check stuff was
> > meant to help facilitate too, and now msm is using that for mdp5, but
> > not for other pieces. That seems very confusing.
> >
> > Also I'm not sure how this works if you still end up flushing anyway,
> > since then you'd be back to doing everything in-order. Or will an
> > normal atomic flip push all the cursor updates to the next frame (in
> > which case you really should be able to do this all with async helpers
> > we have instead of hand-rolling a bunch of it in strange places).
>
> So, "flush" from the core-atomic part is writing all the various
> registers (overlay scanout bo/format/position/etc).. this is all done
> at the normal time (ie. whenever we get the cursor update).  The only
> thing we defer until close-to-vblank is writing the hw flush registers
> (ie. registers with bitmasks of the various hw blocks to latch on
> vblank).
>
> So a cursor update applies the state normally, from the PoV of
> sequence of atomic updates.  But tries to defer writing the flush regs
> so we can merge in future cursor updates and/or pageflip into the same
> frame.
>
> Modulo the stuff that derefs kmsobj->state but shouldn't, I think (at
> least for hw that works this way with flush registers) this is a
> better approach to handling cursor updates.  The mdp5 async cursor
> stuff predates dpu, and I've just not had a chance to update mdp5 to
> use the new async flush path yet.

The trouble is that this is moving back to legacy_cursor_update hack
instead of retiring it for good, so I'm not super thrilled about this.

Can't we do the register update from atomic_async_commit, and then
latch the timed worker, so that it all fits into the bigger thing?
Maybe also subsume the mdp5 stuff like that.

And that commit worker then probably needs the minimal amount of state
protected by a spinlock or similar, so they're not trampling over each
other. At least I'm still not seeing how you both make stuff async and
prevent havoc when an update races with the commit worker. Or can that
only happen for cursor commits, where we don't care when the cursor is
very rarely misplaced because the hw takes an inconsistent update.
-Daniel


> BR,
> -R
>
> > You probably still need the worker to push out the update at the right
> > time, and I'm not sure what some good locking for that is. At least
> > I'm not really seeing how you sync that worker against a racing update
> > for the next cursor move.
> > -Daniel
> >
> >
> > > BR,
> > > -R
> > >
> > > > I do agree though that you probably want this to be a real time fifo
> > > > kthread worker, like for the vblank worker. Except now that I looked,
> > > > I'm not sure it's actually working intended and correct.
> > > > -Daniel
> > > >
> > > > > BR,
> > > > > -R
> > > > >
> > > > > > -Daniel
> > > > > >
> > > > > > >
> > > > > > >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  3 +--
> > > > > > >  drivers/gpu/drm/msm/adreno/a5xx_preempt.c |  6 ++---
> > > > > > >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |  4 +--
> > > > > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  4 +--
> > > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  8 +++++-
> > > > > > >  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  |  8 +++++-
> > > > > > >  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  | 11 ++++++---
> > > > > > >  drivers/gpu/drm/msm/disp/mdp_kms.h        |  9 +++++--
> > > > > > >  drivers/gpu/drm/msm/msm_atomic.c          | 25 +++++++++++++++----
> > > > > > >  drivers/gpu/drm/msm/msm_drv.h             |  3 ++-
> > > > > > >  drivers/gpu/drm/msm/msm_gpu.c             | 30 +++++++++++++++--------
> > > > > > >  drivers/gpu/drm/msm/msm_gpu.h             | 13 +++++++---
> > > > > > >  drivers/gpu/drm/msm/msm_kms.h             | 23 ++++++++++++++---
> > > > > > >  13 files changed, 104 insertions(+), 43 deletions(-)
> > > > > > >
> > > > > > > --
> > > > > > > 2.26.2
> > > > > > >
> > > > > > > _______________________________________________
> > > > > > > dri-devel mailing list
> > > > > > > dri-devel@lists.freedesktop.org
> > > > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > > > >
> > > > > > --
> > > > > > Daniel Vetter
> > > > > > Software Engineer, Intel Corporation
> > > > > > http://blog.ffwll.ch
> > > > > _______________________________________________
> > > > > dri-devel mailing list
> > > > > dri-devel@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > >
> > > >
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
