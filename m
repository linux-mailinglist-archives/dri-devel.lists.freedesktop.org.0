Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C25BA3D9AB3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 02:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180A56E416;
	Thu, 29 Jul 2021 00:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC1A6E416;
 Thu, 29 Jul 2021 00:58:20 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r2so4665417wrl.1;
 Wed, 28 Jul 2021 17:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2s1hdSTzFHg/7UL0elBXK+uq6mOJCD2JwEhclE1GvL4=;
 b=YJ5hjIrVapOHiT8yy2uwshZ+6GE+wXf6yT/xJWAOeECU3D5dan+RFAt4Bv1vaYep11
 4tnL0U0Yo//3P8Cr9TBXJ3W1Pbtl6FNrDvlMAO02BH87DQlYb2bsxT47xZlSPL0vnlo2
 GYzawuUmXpM/sVr/WUap+EzIJ7bWA1WCB9LSlM/X1S/yY1swxCZS7Nn1qSJSpiy+L90j
 5ZYxC1U7DCjIs7djVARLreJR2At9i5VMhsalVKf8GkLXz84OH+dlrzZEZuAjLqksgOF3
 kzctLud8URXhBmwvIPmluu6uL6EX28GmRohNBpVIazX6prMXmagj/2tTJ81Jl+HbuXul
 TGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2s1hdSTzFHg/7UL0elBXK+uq6mOJCD2JwEhclE1GvL4=;
 b=PR5IcGdpyF8slyUozV2m24HjJsXozssx7gBUpS4r/eNoFlJoY/YvLSSE6QwbYYMKg4
 Skb2j5c9aPxuytFtQqTZ2rkz9CXy13iOwOWgO5M4PYR2hGF8cBGqQeEMsHsDV/bw1b+c
 xbhF84x43avY6M2lxyOmD8auqGGvn/RkO0wlRoa+n+PctRa+mGs1qg8rPuUzXJXLR5QZ
 W0OcE55/+pvStQQ41Lh/M+5phBpHJ+/vy0akjiqNnKxwr8loU83BG4Lyja77h2KSk3le
 0qVc9y+jo+3QBUZj6fQQHRmy2bM7U+YtCcs5Ii1WiF5/YeCq5nSsM8xHletphIYOWvtt
 Fl2w==
X-Gm-Message-State: AOAM5326VUqvXSaC6dBE9tw8vtcarp8MxTTbW8Y2g7frfua5CfYjq7TS
 b1XrzSj8vz7i35qAwISTw6OikgTn6Qp+wNhHLdQ=
X-Google-Smtp-Source: ABdhPJzW5Q8OEorGHgwin1FvunAy5rXQhFx3+SneO8wjiAA6nKskhDHaLoxXsuhZDBEW+1wPXHXxObDqN5csPhDjvG8=
X-Received: by 2002:adf:ea41:: with SMTP id j1mr1842369wrn.147.1627520299190; 
 Wed, 28 Jul 2021 17:58:19 -0700 (PDT)
MIME-Version: 1.0
References: <SKuAxGshCZFzlguCiEJOU0kAFCJ9WDGK_qCmPESnrghqei0-VIp4DD5vL58OEJCq2B-AkvF1az0EedzkGjSNLQ==@protonmail.internalid>
 <CAF6AEGumRk7H88bqV=H9Fb1SM0zPBo5B7NsCU3jFFKBYxf5k+Q@mail.gmail.com>
 <7553f3cd-61c8-3ece-14ec-6c0cf4ae0296@linaro.org>
In-Reply-To: <7553f3cd-61c8-3ece-14ec-6c0cf4ae0296@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 28 Jul 2021 18:02:28 -0700
Message-ID: <CAF6AEGuJjH94s0ymARtEMUo2tBuaacx7e0nqOj7_j2SQQcUa9Q@mail.gmail.com>
Subject: Re: [early pull] drm/msm: drm-msm-next-2021-07-28 for v5.15
To: Caleb Connolly <caleb.connolly@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>
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
Cc: Abhinav Kumar <abhinavk@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jordan, any idea if more frequent frequency changes would for some
reason make a630 grumpy?  I was expecting it should be somewhat
similar to a618 (same GMU fw, etc).  The main result of that patch
should be clamping to min freq when gpu goes idle, and the toggling
back to devfreq provided freq on idle->active transition.  So there
might be more frequent freq transitions.

Caleb, I don't suppose you could somehow delay starting UI and get
some traces?  Something along the lines of:

  localhost ~ # cd /sys/kernel/debug/tracing/
  localhost /sys/kernel/debug/tracing # echo 1 > events/drm_msm_gpu/enable
  localhost /sys/kernel/debug/tracing # echo 1 > tracing_on
  localhost /sys/kernel/debug/tracing # cat trace_pipe

Does adding an 'if (1) return' at the top of msm_devfreq_idle() help?
That should bypass the clamping to min freq when the GPU isn't doing
anything and reduce the # of freq transitions.  I suppose we could
opt-in to this behavior on a per-gpu basis..

BR,
-R

On Wed, Jul 28, 2021 at 5:35 PM Caleb Connolly
<caleb.connolly@linaro.org> wrote:
>
> Hi Rob,
>
> This series causes a fatal crash on my Oneplus 6, the device goes to
> Qualcomm crashdump mode shortly after reaching UI with the following errors:
>
> https://paste.ubuntu.com/p/HvjmzZYtgw/
>
> I did a git bisect and the patch ("drm/msm: Devfreq tuning") seems to be
> the cause of the crash, reverting it resolves the issue.
>
>
> On 28/07/2021 21:52, Rob Clark wrote:
> > Hi Dave & Daniel,
> >
> > An early pull for v5.15 (there'll be more coming in a week or two),
> > consisting of the drm/scheduler conversion and a couple other small
> > series that one was based one.  Mostly sending this now because IIUC
> > danvet wanted it in drm-next so he could rebase on it.  (Daniel, if
> > you disagree then speak up, and I'll instead include this in the main
> > pull request once that is ready.)
> >
> > This also has a core patch to drop drm_gem_object_put_locked() now
> > that the last use of it is removed.
> >
> > The following changes since commit ff1176468d368232b684f75e82563369208bc371:
> >
> >    Linux 5.14-rc3 (2021-07-25 15:35:14 -0700)
> >
> > are available in the Git repository at:
> >
> >    https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2021-07-28
> >
> > for you to fetch changes up to 4541e4f2225c30b0e9442be9eb2fb8b7086cdd1f:
> >
> >    drm/msm/gem: Mark active before pinning (2021-07-28 09:19:00 -0700)
> >
> > ----------------------------------------------------------------
> > Rob Clark (18):
> >        drm/msm: Let fences read directly from memptrs
> >        drm/msm: Signal fences sooner
> >        drm/msm: Split out devfreq handling
> >        drm/msm: Split out get_freq() helper
> >        drm/msm: Devfreq tuning
> >        drm/msm: Docs and misc cleanup
> >        drm/msm: Small submitqueue creation cleanup
> >        drm/msm: drop drm_gem_object_put_locked()
> >        drm: Drop drm_gem_object_put_locked()
> >        drm/msm/submit: Simplify out-fence-fd handling
> >        drm/msm: Consolidate submit bo state
> >        drm/msm: Track "seqno" fences by idr
> >        drm/msm: Return ERR_PTR() from submit_create()
> >        drm/msm: Conversion to drm scheduler
> >        drm/msm: Drop submit bo_list
> >        drm/msm: Drop struct_mutex in submit path
> >        drm/msm: Utilize gpu scheduler priorities
> >        drm/msm/gem: Mark active before pinning
> >
> >   drivers/gpu/drm/drm_gem.c                   |  22 --
> >   drivers/gpu/drm/msm/Kconfig                 |   1 +
> >   drivers/gpu/drm/msm/Makefile                |   1 +
> >   drivers/gpu/drm/msm/adreno/a5xx_debugfs.c   |   4 +-
> >   drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |   6 +-
> >   drivers/gpu/drm/msm/adreno/a5xx_power.c     |   2 +-
> >   drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |   7 +-
> >   drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  12 +-
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |   6 +-
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |   4 +-
> >   drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   6 +-
> >   drivers/gpu/drm/msm/msm_drv.c               |  30 ++-
> >   drivers/gpu/drm/msm/msm_fence.c             |  53 +----
> >   drivers/gpu/drm/msm/msm_fence.h             |  44 +++-
> >   drivers/gpu/drm/msm/msm_gem.c               |  94 +-------
> >   drivers/gpu/drm/msm/msm_gem.h               |  47 ++--
> >   drivers/gpu/drm/msm/msm_gem_submit.c        | 344 +++++++++++++++++-----------
> >   drivers/gpu/drm/msm/msm_gpu.c               | 220 ++++--------------
> >   drivers/gpu/drm/msm/msm_gpu.h               | 139 ++++++++++-
> >   drivers/gpu/drm/msm/msm_gpu_devfreq.c       | 203 ++++++++++++++++
> >   drivers/gpu/drm/msm/msm_rd.c                |   6 +-
> >   drivers/gpu/drm/msm/msm_ringbuffer.c        |  69 +++++-
> >   drivers/gpu/drm/msm/msm_ringbuffer.h        |  12 +
> >   drivers/gpu/drm/msm/msm_submitqueue.c       |  53 +++--
> >   include/drm/drm_gem.h                       |   2 -
> >   include/uapi/drm/msm_drm.h                  |  14 +-
> >   26 files changed, 865 insertions(+), 536 deletions(-)
> >   create mode 100644 drivers/gpu/drm/msm/msm_gpu_devfreq.c
> >
>
> --
> Kind Regards,
> Caleb (they/them)
