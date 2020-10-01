Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43186280250
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 17:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2FF6E89E;
	Thu,  1 Oct 2020 15:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56DA6E89E
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 15:15:33 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s12so6235952wrw.11
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Oct 2020 08:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gFqMSXRyF1iFqQYaqJo0t2YUPbcbonItseg5lySXlwM=;
 b=V8eg7RMvckEBsaqConW1z9bjgeOispARRh/82t+ZYVVyOReT2nuye+OdicBp6ywmeI
 IuRMhFhuV7ZgjTEURdaz5umfvWUNAY1nMfr6zx5OZMjpVlJhHxvGmdokO2HuyRbXxuQJ
 qIozBYVLPqQMa+DgaCYplr+J6fcStKbCKcBo6oGyJkIrKw4r/JMUKszH1/XXyix/dWAf
 vBFL2nemYdd66SQ8tQ3lSj5prsKehmE7NdFHf4L3pqc9aqOL80jMmSkVuLg0olEU4yFU
 jJ5PUf4cNXsFbCOJyMPZJsH7hUvF7gagYgB7FWmUG2i87wHFgI0Zeu1z47fmCfi897jL
 xzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gFqMSXRyF1iFqQYaqJo0t2YUPbcbonItseg5lySXlwM=;
 b=EIeAZW1r8Cu9kHbGruHPKvCVlYXT3df3HhBKt7YqBV962wCjJN8JSFDuue/LdOxO8S
 SnkUAkezEMICTXMeIzhOeFykff5wMIhbqxJgS5IWBpXdUyY3gEkhdLfYqn/d8qxgCcXK
 fniW7w9LxffeDWhDiqacGWHMoEkkshnHFAf/KNedRDfUzodr1nFtE9pHia8g/zXWAxIY
 SpZVm7mEVSfcinYnfPJFa8whGaPNxlirZ0PR2DGN1xGZ7I2ucse+hIXMpWkQm5hhNRyr
 FK6AUcHeiSKHQlCSou2eLbaNHJBmdwJ3kP1qgrAtcMpAKaCn91NmWKPu0/eAQuw/yDyQ
 +wSA==
X-Gm-Message-State: AOAM530KFRHD+nO0eswgmbbDYF8jvXjiM2/xW9mJ1sLj8HAA3xjmLuZR
 nqM6ZjRUBJcaT+8p1q8sHVYAoXCdosFOeuQ9lDU=
X-Google-Smtp-Source: ABdhPJzX2p/R3dcfAHBykAEhigq1NpWdcGaRN/d5VJDPB60SrUL2IzFTMGqpFXcvL7KnXnjjR0JYBOaFbberj8nS+ng=
X-Received: by 2002:a5d:640d:: with SMTP id z13mr9262620wru.28.1601565332442; 
 Thu, 01 Oct 2020 08:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200930211723.3028059-1-robdclark@gmail.com>
 <CAKMK7uHHPWE3h7ssG-dpb3czwbP5VtZYztMA=CpvQ4HV4LQTXA@mail.gmail.com>
In-Reply-To: <CAKMK7uHHPWE3h7ssG-dpb3czwbP5VtZYztMA=CpvQ4HV4LQTXA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 1 Oct 2020 08:15:20 -0700
Message-ID: <CAF6AEGszF60dWn37m63wujjtuObqkz2ZqEN3LHaPhCkKa1cdmA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm: commit_work scheduling
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
Cc: Rob Clark <robdclark@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Tim Murray <timmurray@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>,
 Qais Yousef <qais.yousef@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 1, 2020 at 12:25 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Sep 30, 2020 at 11:16 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The android userspace treats the display pipeline as a realtime problem.
> > And arguably, if your goal is to not miss frame deadlines (ie. vblank),
> > it is.  (See https://lwn.net/Articles/809545/ for the best explaination
> > that I found.)
> >
> > But this presents a problem with using workqueues for non-blocking
> > atomic commit_work(), because the SCHED_FIFO userspace thread(s) can
> > preempt the worker.  Which is not really the outcome you want.. once
> > the required fences are scheduled, you want to push the atomic commit
> > down to hw ASAP.
> >
> > But the decision of whether commit_work should be RT or not really
> > depends on what userspace is doing.  For a pure CFS userspace display
> > pipeline, commit_work() should remain SCHED_NORMAL.
> >
> > To handle this, convert non-blocking commit_work() to use per-CRTC
> > kthread workers, instead of system_unbound_wq.  Per-CRTC workers are
> > used to avoid serializing commits when userspace is using a per-CRTC
> > update loop.  And the last patch exposes the task id to userspace as
> > a CRTC property, so that userspace can adjust the priority and sched
> > policy to fit it's needs.
> >
> >
> > v2: Drop client cap and in-kernel setting of priority/policy in
> >     favor of exposing the kworker tid to userspace so that user-
> >     space can set priority/policy.
>
> Yeah I think this looks more reasonable. Still a bit irky interface,
> so I'd like to get some kworker/rt ack on this. Other opens:
> - needs userspace, the usual drill

fwiw, right now the userspace is "modetest + chrt".. *probably* the
userspace will become a standalone helper or daemon, mostly because
the chrome gpu-process sandbox does not allow setting SCHED_FIFO.  I'm
still entertaining the possibility of switching between rt and cfs
depending on what is in the foreground (ie. only do rt for android
apps).

> - we need this also for vblank workers, otherwise this wont work for
> drivers needing those because of another priority inversion.

I have a thought on that, see below..

> - we probably want some indication of whether this actually does
> something useful, not all drivers use atomic commit helpers. Not sure
> how to do that.

I'm leaning towards converting the other drivers over to use the
per-crtc kwork, and then dropping the 'commit_work` from atomic state.
I can add a patch to that, but figured I could postpone that churn
until there is some by-in on this whole idea.

> - not sure whether the vfunc is an awesome idea, I'd frankly just
> open-code this inline. We have similar special cases already for e.g.
> dpms (and in multiple places), this isn't the worst.

I could introduce a "PID" property type.  This would be useful if we
wanted to also expose the vblank workers.

> - still feeling we could at least change the default to highpriority niceness.

AFAIU this would still be preempted by something that is SCHED_FIFO.
Also, with cfs/SCHED_NORMAL, you can still be preempted by lower
priority things that haven't had a chance to run for a while.

> - there's still the problem that commit works can overlap, and a
> single worker can't do that anymore. So rolling that out for everyone
> as-is feels a bit risky.

That is why it is per-CRTC..  I'm not sure there is a need to overlap
work for a single CRTC?

We could OFC make this a driver knob, and keep the old 'commit_work'
option, but that doesn't really feel like the right direction

BR,
-R

> Cheers, Daniel
>
> >
> > Rob Clark (3):
> >   drm/crtc: Introduce per-crtc kworker
> >   drm/atomic: Use kthread worker for nonblocking commits
> >   drm: Expose CRTC's kworker task id
> >
> >  drivers/gpu/drm/drm_atomic_helper.c | 13 ++++++++----
> >  drivers/gpu/drm/drm_crtc.c          | 14 +++++++++++++
> >  drivers/gpu/drm/drm_mode_config.c   | 14 +++++++++++++
> >  drivers/gpu/drm/drm_mode_object.c   |  4 ++++
> >  include/drm/drm_atomic.h            | 31 +++++++++++++++++++++++++++++
> >  include/drm/drm_crtc.h              |  8 ++++++++
> >  include/drm/drm_mode_config.h       |  9 +++++++++
> >  include/drm/drm_property.h          |  9 +++++++++
> >  8 files changed, 98 insertions(+), 4 deletions(-)
> >
> > --
> > 2.26.2
> >
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
