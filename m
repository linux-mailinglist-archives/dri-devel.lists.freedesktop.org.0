Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BA9984949
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 18:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC4110E71D;
	Tue, 24 Sep 2024 16:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eMU5zkr0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD77A10E71C;
 Tue, 24 Sep 2024 16:11:57 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-82a626d73efso217348339f.1; 
 Tue, 24 Sep 2024 09:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727194317; x=1727799117; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sWeglnw6BZKB/VuyrSzHmYia1dbxFZbiLz4gI3HzQMY=;
 b=eMU5zkr05wmzQS66oxYiDdYW9a+ckM3jq8dPrNLaORfNQLEJH9XAyBFOno9UP6YGWc
 7p3tATx81ZDTaypEdKdyBNNRrR/xKfxdk7fgkuU+lNzxQpBSpj8TGwuBMGS5O2lsPMk9
 zf3Rour5ycUqONGbycENdgAYAjFWcPY3r2JUrEDTvXYq4prXA1rVJxAyqzlKbUxLd3EI
 imeS2IjvMBtn09FIt4bgVJy84T/XqLrQP7lSJsw3BRevzJPZD6Ai3wmbfZVI778rNw8F
 v4mUUiwss2+2Rbnk65RJ6RbLPN3tqjUtSiwo4+BgRhKAf+DFBlYxAAi5vHCE81yG5O6F
 JKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727194317; x=1727799117;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sWeglnw6BZKB/VuyrSzHmYia1dbxFZbiLz4gI3HzQMY=;
 b=Hxa6xLN5BGx1K2Kgo/jRZFyscyGe9vJ1oJAIxK7A7vHM5GzWnfBImLf8GQafPyM7te
 RwY7Y84HzHakf+Fbqy0FffGl21gLofihebxHf/zkuA021DS/Ct1BZSV1SvJmov1STGVO
 FsWv1SlPUDnu1XgkBf9a6jHek4TDcGzhXjmYfiL814PG7D7s/PXe9wjgG7LfmoJGY9dT
 htEsIVv3pVEmn4LmaLymYcZNXpSm2VqFFiiEpN2EIkqvswQb47D41bsiTJq9hYahk+z0
 8k/W3uLHXy6fQDUDnmP551TR9ei8oj4JQnTPuxnnBI/XIL558A1u2r7oHku7EZ3fHDPw
 uFtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe3lgj4a0x90Z+ZNJ+CseaPXwEvsRVOvueMSPoFU7z79vQTyTsZpCzcIH1SRTNv4TgrtCkRCQd6I8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2VOrbXRMRJ60zPTMi2V/4vBkZL0C8VZJGmr9GWAi4wVF0zmq3
 wwu1McfArnw/dLsDgqmoVhCSGvzlU755icjaldVXcPDBxXEHHu17Uy+z2BziJ/iyLIZ6cKosddv
 usY4ls/irqerNSVZQXhsymb/jLkU=
X-Google-Smtp-Source: AGHT+IG4Ne74kYPMdaaO0rPyy8apUK0dOKNk+6D4i79VukxVDUPWLBfaAP9Hxec3LUQE3xdsiYRvJgLiIFoB95h3b34=
X-Received: by 2002:a05:6e02:2162:b0:3a0:a0bd:f92b with SMTP id
 e9e14a558f8ab-3a26d785d84mr81805ab.10.1727194316674; Tue, 24 Sep 2024
 09:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240913195132.8282-1-robdclark@gmail.com>
 <CACu1E7ECxJLH8+GqUuWH=+oM=N=fgkpBBqJ8ShrSwbdZmw+nZQ@mail.gmail.com>
In-Reply-To: <CACu1E7ECxJLH8+GqUuWH=+oM=N=fgkpBBqJ8ShrSwbdZmw+nZQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 24 Sep 2024 09:11:44 -0700
Message-ID: <CAF6AEGsJpLwyXK7_TH0jZx64A1rOX9F23dL5TZUJUBV=tsKLCA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx+: Insert a fence wait before SMMU table
 update
To: Connor Abbott <cwabbott0@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 18, 2024 at 9:51=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com>=
 wrote:
>
> On Fri, Sep 13, 2024 at 8:51=E2=80=AFPM Rob Clark <robdclark@gmail.com> w=
rote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The CP_SMMU_TABLE_UPDATE _should_ be waiting for idle, but on some
> > devices (x1-85, possibly others), it seems to pass that barrier while
> > there are still things in the event completion FIFO waiting to be
> > written back to memory.
> >
> > Work around that by adding a fence wait before context switch.  The
> > CP_EVENT_WRITE that writes the fence is the last write from a submit,
> > so seeing this value hit memory is a reliable indication that it is
> > safe to proceed with the context switch.
> >
> > Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/63
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index bcaec86ac67a..ba5b35502e6d 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -101,9 +101,10 @@ static void get_stats_counter(struct msm_ringbuffe=
r *ring, u32 counter,
> >  }
> >
> >  static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
> > -               struct msm_ringbuffer *ring, struct msm_file_private *c=
tx)
> > +               struct msm_ringbuffer *ring, struct msm_gem_submit *sub=
mit)
> >  {
> >         bool sysprof =3D refcount_read(&a6xx_gpu->base.base.sysprof_act=
ive) > 1;
> > +       struct msm_file_private *ctx =3D submit->queue->ctx;
> >         struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base;
> >         phys_addr_t ttbr;
> >         u32 asid;
> > @@ -115,6 +116,13 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6=
xx_gpu,
> >         if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
> >                 return;
> >
> > +       /* Wait for previous submit to complete before continuing: */
> > +       OUT_PKT7(ring, CP_WAIT_TIMESTAMP, 4);
>
> CP_WAIT_TIMESTAMP doesn't exist on a6xx, so this won't work there. I
> don't know if the bug exists on a6xx, but I'd be inclined to say it
> has always existed and we just never hit it because it requires some
> very specific timing conditions. We can make it work on a6xx by using
> CP_WAIT_REG_MEM and waiting for it to equal the exact value.

I've been unable to reproduce this on a690, despite running at a
similar fps (so similar rate of CP_SMMU_TABLE_UPDATEs).  I guess I
can't rule out that this is just _harder_ to hit on a6xx due to the
shallower pipeline.  It would be nice to get some data points on other
a7xx, but I only have the one.

I did attempt to come up with an igt stand-alone reproducer by just
ping-ponging between contexts (with fences to force context switches)
with 1000's of CP_EVENT_WRITE's, to no avail.  I guess I'd need to
actually setup a blit or draw to make the event-write asynchronous,
but that would be a lot harder to do in igt.

I guess for now I'll re-work this patch to only do the workaround on
a7xx.  And wire up the gallium preemption support so we can confirm
whether this is also an issue for preemption.

BR,
-R

> Connor
>
> > +       OUT_RING(ring, 0);
> > +       OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));
> > +       OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
> > +       OUT_RING(ring, submit->seqno - 1);
> > +
> >         if (!sysprof) {
> >                 if (!adreno_is_a7xx(adreno_gpu)) {
> >                         /* Turn off protected mode to write to special =
registers */
> > @@ -193,7 +201,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct=
 msm_gem_submit *submit)
> >         struct msm_ringbuffer *ring =3D submit->ring;
> >         unsigned int i, ibs =3D 0;
> >
> > -       a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
> > +       a6xx_set_pagetable(a6xx_gpu, ring, submit);
> >
> >         get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP(0),
> >                 rbmemptr_stats(ring, index, cpcycles_start));
> > @@ -283,7 +291,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct=
 msm_gem_submit *submit)
> >         OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
> >         OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD=
_BR);
> >
> > -       a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
> > +       a6xx_set_pagetable(a6xx_gpu, ring, submit);
> >
> >         get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
> >                 rbmemptr_stats(ring, index, cpcycles_start));
> > --
> > 2.46.0
> >
