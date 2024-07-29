Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C955893FC6A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 19:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5224810E436;
	Mon, 29 Jul 2024 17:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kc/mQ7HZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E3010E401;
 Mon, 29 Jul 2024 17:26:57 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-7a0b2924e52so1686310a12.2; 
 Mon, 29 Jul 2024 10:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722274017; x=1722878817; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AR5yeX17UGq4U9wLE9WErCeh9H/LofY6XOuRJLfNZ/A=;
 b=kc/mQ7HZr1gRraKHPiqHtOmefSfNIjbOSqiqY81w0mdcRZYpPhB+qJ2bGfqgkk5zo+
 +BV52eL672WnXICGMyBHr0yeHjQwQkO86iXpGJYOeO9WuBc+3mUR3m245EnphBsc0Nk0
 Q2teK8mQXgJWTyoPmngpOojO1Le9X2ZrHsjBa064OCQX8UjTww+yAeRK8GZuawQF2B2O
 SwnfKAoFG0LHDMpGNCtPaVa6Qyg7QEmKwAWhoP5rSgqh8xJlHQOTr2BzgfMMtIbCofTn
 RfFBmVhjDyDtWYHN25dWlrcZfmqRe9uQ/vTaYTRGf5QMAj/BUj1V2KVp6yoXAIfp6U6O
 OHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722274017; x=1722878817;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AR5yeX17UGq4U9wLE9WErCeh9H/LofY6XOuRJLfNZ/A=;
 b=enNVUGk8LwAMmQkKmCinAlkctvFL8zPJWB2eN2+z1+SL6l8IqZMQZK0ZM5Tp5U2tyW
 3ZqBfRdhp4Ph3NqI2GyurjICqsOt8bQqshUxHX0S/Do30S3eaVeSmMqyqbjpTobZLrMl
 EnNKW5BuTCr5zBr4VSqX3URVSn+4eem63IFGFsH4IAYN4fmadf5Ws7+ZCWiSVHndjocI
 FLuqdkw1WBrlqhm3GW6VczbqYEP8SWqhmyGkO4916FezP/ovJwlBPSMgyzgPdPdqvK+w
 3S6J7hcDCZjsPFyU9DJqHthcw2C1iFFcPzifgaZW9hOlcQ+wAmk1sMdHHSXciJBez9YS
 F1yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9scjNmCN27Z/XzUeuPtoTfbcmTxIdJ1GrrjF0QsIyWoGSDsgsomdqE11YabqLDZpL9C0hhp0tTZ2TTQuTCFJTXfgmCzUPZBakPvT1VbUlYgTyNU4Eu1VNZTxGMuEGEVWZpt4jabOX/YOm2br3HId8
X-Gm-Message-State: AOJu0Yx/BohsBUs49fs+sbirUEEGsXu9rp4o1VV2LKP/LxWR2CUlabZp
 tx8KPjXdvEgzKD18N1l73/G31cfDeoiazQQeF+jjMuHrnkXmU2lpCwjXy2jA5GisNPzUkxW++E9
 zoblpB2G2NNLv140cuutgPUzo9yw=
X-Google-Smtp-Source: AGHT+IEFHIgZALYvf1AZp3C5etY6j9w34vDz7OKb2duLwIw2Re4C18oa1CUxQqvHgV4P2MSLaZPShByYs9GFbqIlbio=
X-Received: by 2002:a17:90a:4b81:b0:2c8:a8f:c97 with SMTP id
 98e67ed59e1d1-2cf7e71b723mr5975518a91.37.1722274017294; Mon, 29 Jul 2024
 10:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240711100038.268803-1-vladimir.lypak@gmail.com>
 <20240711100038.268803-4-vladimir.lypak@gmail.com>
In-Reply-To: <20240711100038.268803-4-vladimir.lypak@gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Mon, 29 Jul 2024 18:26:45 +0100
Message-ID: <CACu1E7HkRN7pkBOUeC3G59K5rbsMRj81HvfAocpHuG6XuNbCyQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/msm/a5xx: fix races in preemption evaluation stage
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jordan Crouse <jordan@cosmicpenguin.net>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, Jul 11, 2024 at 11:10=E2=80=AFAM Vladimir Lypak
<vladimir.lypak@gmail.com> wrote:
>
> On A5XX GPUs when preemption is used it's invietable to enter a soft
> lock-up state in which GPU is stuck at empty ring-buffer doing nothing.
> This appears as full UI lockup and not detected as GPU hang (because
> it's not). This happens due to not triggering preemption when it was
> needed. Sometimes this state can be recovered by some new submit but
> generally it won't happen because applications are waiting for old
> submits to retire.
>
> One of the reasons why this happens is a race between a5xx_submit and
> a5xx_preempt_trigger called from IRQ during submit retire. Former thread
> updates ring->cur of previously empty and not current ring right after
> latter checks it for emptiness. Then both threads can just exit because
> for first one preempt_state wasn't NONE yet and for second one all rings
> appeared to be empty.
>
> To prevent such situations from happening we need to establish guarantee
> for preempt_trigger to be called after each submit. To implement it this
> patch adds trigger call at the end of a5xx_preempt_irq to re-check if we
> should switch to non-empty or higher priority ring. Also we find next
> ring in new preemption state "EVALUATE". If the thread that updated some
> ring with new submit sees this state it should wait until it passes.
>
> Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  6 +++---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.h     | 11 +++++++----
>  drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 24 +++++++++++++++++++----
>  3 files changed, 30 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a5xx_gpu.c
> index 6c80d3003966..266744ee1d5f 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -110,7 +110,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, st=
ruct msm_gem_submit *submit
>         }
>
>         a5xx_flush(gpu, ring, true);
> -       a5xx_preempt_trigger(gpu);
> +       a5xx_preempt_trigger(gpu, true);
>
>         /* we might not necessarily have a cmd from userspace to
>          * trigger an event to know that submit has completed, so
> @@ -240,7 +240,7 @@ static void a5xx_submit(struct msm_gpu *gpu, struct m=
sm_gem_submit *submit)
>         a5xx_flush(gpu, ring, false);
>
>         /* Check to see if we need to start preemption */
> -       a5xx_preempt_trigger(gpu);
> +       a5xx_preempt_trigger(gpu, true);
>  }
>
>  static const struct adreno_five_hwcg_regs {
> @@ -1296,7 +1296,7 @@ static irqreturn_t a5xx_irq(struct msm_gpu *gpu)
>                 a5xx_gpmu_err_irq(gpu);
>
>         if (status & A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS) {
> -               a5xx_preempt_trigger(gpu);
> +               a5xx_preempt_trigger(gpu, false);
>                 msm_gpu_retire(gpu);
>         }
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h b/drivers/gpu/drm/msm/=
adreno/a5xx_gpu.h
> index c7187bcc5e90..1120824853d4 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
> @@ -57,10 +57,12 @@ void a5xx_debugfs_init(struct msm_gpu *gpu, struct dr=
m_minor *minor);
>   * through the process.
>   *
>   * PREEMPT_NONE - no preemption in progress.  Next state START.
> - * PREEMPT_START - The trigger is evaulating if preemption is possible. =
Next
> - * states: TRIGGERED, NONE
> + * PREEMPT_EVALUATE - The trigger is evaulating if preemption is possibl=
e. Next
> + * states: START, ABORT
>   * PREEMPT_ABORT - An intermediate state before moving back to NONE. Nex=
t
>   * state: NONE.
> + * PREEMPT_START - The trigger is preparing for preemption. Next state:
> + * TRIGGERED
>   * PREEMPT_TRIGGERED: A preemption has been executed on the hardware. Ne=
xt
>   * states: FAULTED, PENDING
>   * PREEMPT_FAULTED: A preemption timed out (never completed). This will =
trigger
> @@ -71,8 +73,9 @@ void a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_=
minor *minor);
>
>  enum preempt_state {
>         PREEMPT_NONE =3D 0,
> -       PREEMPT_START,
> +       PREEMPT_EVALUATE,
>         PREEMPT_ABORT,
> +       PREEMPT_START,
>         PREEMPT_TRIGGERED,
>         PREEMPT_FAULTED,
>         PREEMPT_PENDING,
> @@ -156,7 +159,7 @@ void a5xx_set_hwcg(struct msm_gpu *gpu, bool state);
>
>  void a5xx_preempt_init(struct msm_gpu *gpu);
>  void a5xx_preempt_hw_init(struct msm_gpu *gpu);
> -void a5xx_preempt_trigger(struct msm_gpu *gpu);
> +void a5xx_preempt_trigger(struct msm_gpu *gpu, bool new_submit);
>  void a5xx_preempt_irq(struct msm_gpu *gpu);
>  void a5xx_preempt_fini(struct msm_gpu *gpu);
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/=
msm/adreno/a5xx_preempt.c
> index 67a8ef4adf6b..f8d09a83c5ae 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> @@ -87,21 +87,33 @@ static void a5xx_preempt_timer(struct timer_list *t)
>  }
>
>  /* Try to trigger a preemption switch */
> -void a5xx_preempt_trigger(struct msm_gpu *gpu)
> +void a5xx_preempt_trigger(struct msm_gpu *gpu, bool new_submit)
>  {
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
>         struct a5xx_gpu *a5xx_gpu =3D to_a5xx_gpu(adreno_gpu);
>         unsigned long flags;
>         struct msm_ringbuffer *ring;
> +       enum preempt_state state;
>
>         if (gpu->nr_rings =3D=3D 1)
>                 return;
>
>         /*
> -        * Try to start preemption by moving from NONE to START. If
> -        * unsuccessful, a preemption is already in flight
> +        * Try to start preemption by moving from NONE to EVALUATE. If cu=
rrent
> +        * state is EVALUATE/ABORT we can't just quit because then we can=
't
> +        * guarantee that preempt_trigger will be called after ring is up=
dated
> +        * by new submit.
>          */
> -       if (!try_preempt_state(a5xx_gpu, PREEMPT_NONE, PREEMPT_START))
> +       state =3D atomic_cmpxchg(&a5xx_gpu->preempt_state, PREEMPT_NONE,
> +                              PREEMPT_EVALUATE);
> +       while (new_submit && (state =3D=3D PREEMPT_EVALUATE ||
> +                             state =3D=3D PREEMPT_ABORT)) {

This isn't enough because even if new_submit is false then we may
still need to guarantee that evaluation happens. We've seen a hang in
a scenario like:

1. A job is submitted and executed on ring 0.
2. A job is submitted on ring 2 while ring 0 is still active but
almost finished.
3. The submission thread starts evaluating and sees that ring 0 is still bu=
sy.
4. The job on ring 0 finishes and a CACHE_FLUSH IRQ is raised.
5. The IRQ tries to trigger a preemption but the state is still
PREEMPT_EVALUATE or PREEMPT_ABORT and exits.
6. The submission thread finishes update_wptr() and finally sets the
state to PREEMPT_NONE too late.

Then we never preempt to ring 2 and there's a soft lockup.

Connor

> +               cpu_relax();
> +               state =3D atomic_cmpxchg(&a5xx_gpu->preempt_state, PREEMP=
T_NONE,
> +                                      PREEMPT_EVALUATE);
> +       }
> +
> +       if (state !=3D PREEMPT_NONE)
>                 return;
>
>         /* Get the next ring to preempt to */
> @@ -130,6 +142,8 @@ void a5xx_preempt_trigger(struct msm_gpu *gpu)
>                 return;
>         }
>
> +       set_preempt_state(a5xx_gpu, PREEMPT_START);
> +
>         /* Make sure the wptr doesn't update while we're in motion */
>         spin_lock_irqsave(&ring->preempt_lock, flags);
>         a5xx_gpu->preempt[ring->id]->wptr =3D get_wptr(ring);
> @@ -188,6 +202,8 @@ void a5xx_preempt_irq(struct msm_gpu *gpu)
>         update_wptr(gpu, a5xx_gpu->cur_ring);
>
>         set_preempt_state(a5xx_gpu, PREEMPT_NONE);
> +
> +       a5xx_preempt_trigger(gpu, false);
>  }
>
>  void a5xx_preempt_hw_init(struct msm_gpu *gpu)
> --
> 2.45.2
>
