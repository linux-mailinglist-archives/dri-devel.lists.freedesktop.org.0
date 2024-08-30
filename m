Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3B19668F6
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 20:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD8B10EAC2;
	Fri, 30 Aug 2024 18:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jZdWZKv9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F2F10EAC2;
 Fri, 30 Aug 2024 18:32:25 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-456825b4314so19480251cf.0; 
 Fri, 30 Aug 2024 11:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725042745; x=1725647545; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cLPzJyyoWbwhl068AUGb6D6mbwAIjmJVIIMFbsf6Npw=;
 b=jZdWZKv9Z1A0HVjkBjGZ3o0HEhNvzghMAjEzKumNmc2uSVwjYtrXrEj/GLTxfFRya7
 aGUd2irOKoQHnfuJ+U3v0s9zkjOrRLXUbBA8zihk5LIHJalyfNb50Vz3bk1cGF9JEhbQ
 ZCt3P7LGGq4xrh/xOhCu5LeV+zRwuQcWBnXgKEU29AreV8tfhO/j/7LfRzaZRppjhJhO
 kdM01kwAaUrTR+vh/W8qYWA+i3tLcPIwN0EZKyKaVATflQNHqLsctuv6QVfyazUS8PaN
 KUSRktMcXb/eZBGLr6mkr8EuUoUK/QzRAaqsITx0+qgrJktFEXV0juIt+KxbE1/70R4i
 HbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725042745; x=1725647545;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cLPzJyyoWbwhl068AUGb6D6mbwAIjmJVIIMFbsf6Npw=;
 b=oezwLKow5avXHKDzxWcKp4bnd7HAWvw97VBpOnXi9FH1JvypDgRYbqAWtJ//1PxrpM
 Fzl2ozHPQfI6O+sJwgOwxqPphq5l0QgMapqYvIHxGeBlOSgvzZNpPPFDFDzNgUiPqb6N
 SCUvw6b2Bqp3GTvpCXvTy3Sz+NtCl82Y8BXOql1PEiLlagG/BJejNqgW0lRnuj1sjp0Y
 cBMHTVLrOt+5zntwFd5ewIh16NWujvyRbYK0kgugmbfHIEEm4PV1hgrLSlLJqoRmnRsS
 NUlyIRtxUqbKe/jYWZm9tpu7BSMyebdxxqHG+oV3pEpjrstLGmgZRjDIfhxsCNUzohTG
 ILtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtMWMfPNPv5AYFL+nfRxsAe1gWJDaVdflsTKtYkTOG++r6QyuGMV/oWfUbAjH6JBDFu3DYoGb1z5E=@lists.freedesktop.org,
 AJvYcCW1xTOlXoTYPa7bH3k4ruUBO2sYJ7qR0JDm/e/Y59NlYRhX8nBD1wmb/GnQN0iLC5pvhvvXwBUo3i+G@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXWZemo59U4QmwUworkkyXAbPd7IO7JeEUczoqR+HKxN02LeGC
 e6OlK8uJMKeiJhbqOhkar2Gc+5Ji2ZdGwgMnP5R9DL0f1lLmzLxs22e0d9lQoPpAopVTR0NJuyz
 KtOB9xrpINIScub6OhpkHLMZvwzo=
X-Google-Smtp-Source: AGHT+IF811wZgP7aarX2VA3DEXvYPnMy88uZypQ4nm+UF70H4ShZS1bDEcbqnrmzJjAKUH6IOa23ZM7/NWyIzq/y/H4=
X-Received: by 2002:a05:622a:5103:b0:456:953f:6fe6 with SMTP id
 d75a77b69052e-456953f908dmr22491241cf.8.1725042744512; Fri, 30 Aug 2024
 11:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
 <20240830-preemption-a750-t-v2-6-86aeead2cd80@gmail.com>
In-Reply-To: <20240830-preemption-a750-t-v2-6-86aeead2cd80@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 30 Aug 2024 11:32:09 -0700
Message-ID: <CAF6AEGv82=N4=motCpGhp5N7Yv8oqtBcG4bGahgF53CpFYpTgg@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] drm/msm/A6xx: Use posamble to reset counters on
 preemption
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Fri, Aug 30, 2024 at 8:33=E2=80=AFAM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> Use the postamble to reset perf counters when switching between rings,
> except when sysprof is enabled, analogously to how they are reset
> between submissions when switching pagetables.
>
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 14 +++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  6 ++++++
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 26 +++++++++++++++++++++++++=
-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  7 +++++--
>  4 files changed, 49 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 1a90db5759b8..3528ecbbc1ab 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -366,7 +366,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct m=
sm_gem_submit *submit)
>  static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
>                 struct a6xx_gpu *a6xx_gpu, struct msm_gpu_submitqueue *qu=
eue)
>  {
> -       u64 preempt_offset_priv_secure;
> +       bool sysprof =3D refcount_read(&a6xx_gpu->base.base.sysprof_activ=
e) > 1;
> +       u64 preempt_offset_priv_secure, preempt_postamble;
>
>         OUT_PKT7(ring, CP_SET_PSEUDO_REG, 15);
>
> @@ -403,6 +404,17 @@ static void a6xx_emit_set_pseudo_reg(struct msm_ring=
buffer *ring,
>         /* seems OK to set to 0 to disable it */
>         OUT_RING(ring, 0);
>         OUT_RING(ring, 0);
> +
> +       if (!sysprof && a6xx_gpu->preempt_postamble_len) {
> +               preempt_postamble =3D SCRATCH_PREEMPT_POSTAMBLE_IOVA(a6xx=
_gpu);
> +
> +               OUT_PKT7(ring, CP_SET_AMBLE, 3);
> +               OUT_RING(ring, lower_32_bits(preempt_postamble));
> +               OUT_RING(ring, upper_32_bits(preempt_postamble));
> +               OUT_RING(ring, CP_SET_AMBLE_2_DWORDS(
> +                                       a6xx_gpu->preempt_postamble_len) =
|
> +                               CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
> +       }

Hmm, ok, we set this in the submit path.. but do we need to clear it
somehow when transitioning from !sysprof to sysprof?

Also, how does this interact with UMD perfctr queries, I would expect
they would prefer save/restore?

BR,
-R

>  }
>
>  static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *subm=
it)
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.h
> index 652e49f01428..2338e36c8f47 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -66,6 +66,7 @@ struct a6xx_gpu {
>         atomic_t preempt_state;
>         spinlock_t eval_lock;
>         struct timer_list preempt_timer;
> +       uint64_t preempt_postamble_len;
>
>         unsigned int preempt_level;
>         bool uses_gmem;
> @@ -99,6 +100,11 @@ struct a6xx_gpu {
>  #define SCRATCH_USER_CTX_IOVA(ring_id, a6xx_gpu) \
>         (a6xx_gpu->scratch_iova + (ring_id * sizeof(uint64_t)))
>
> +#define SCRATCH_PREEMPT_POSTAMBLE_OFFSET (100 * sizeof(u64))
> +
> +#define SCRATCH_PREEMPT_POSTAMBLE_IOVA(a6xx_gpu) \
> +       (a6xx_gpu->scratch_iova + SCRATCH_PREEMPT_POSTAMBLE_OFFSET)
> +
>  /*
>   * In order to do lockless preemption we use a simple state machine to p=
rogress
>   * through the process.
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/=
msm/adreno/a6xx_preempt.c
> index 4b61b993f75f..f586615db97e 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> @@ -351,6 +351,28 @@ static int preempt_init_ring(struct a6xx_gpu *a6xx_g=
pu,
>         return 0;
>  }
>
> +static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
> +{
> +       u32 *postamble =3D a6xx_gpu->scratch_ptr + SCRATCH_PREEMPT_POSTAM=
BLE_OFFSET;
> +       u32 count =3D 0;
> +
> +       postamble[count++] =3D PKT7(CP_REG_RMW, 3);
> +       postamble[count++] =3D REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CMD;
> +       postamble[count++] =3D 0;
> +       postamble[count++] =3D 1;
> +
> +       postamble[count++] =3D PKT7(CP_WAIT_REG_MEM, 6);
> +       postamble[count++] =3D CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ);
> +       postamble[count++] =3D CP_WAIT_REG_MEM_1_POLL_ADDR_LO(
> +                               REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS);
> +       postamble[count++] =3D CP_WAIT_REG_MEM_2_POLL_ADDR_HI(0);
> +       postamble[count++] =3D CP_WAIT_REG_MEM_3_REF(0x1);
> +       postamble[count++] =3D CP_WAIT_REG_MEM_4_MASK(0x1);
> +       postamble[count++] =3D CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0);
> +
> +       a6xx_gpu->preempt_postamble_len =3D count;
> +}
> +
>  void a6xx_preempt_fini(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> @@ -382,10 +404,12 @@ void a6xx_preempt_init(struct msm_gpu *gpu)
>         a6xx_gpu->skip_save_restore =3D 1;
>
>         a6xx_gpu->scratch_ptr  =3D msm_gem_kernel_new(gpu->dev,
> -                       gpu->nr_rings * sizeof(uint64_t), MSM_BO_WC,
> +                       PAGE_SIZE, MSM_BO_WC,
>                         gpu->aspace, &a6xx_gpu->scratch_bo,
>                         &a6xx_gpu->scratch_iova);
>
> +       preempt_prepare_postamble(a6xx_gpu);
> +
>         if (IS_ERR(a6xx_gpu->scratch_ptr))
>                 goto fail;
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index 6b1888280a83..87098567483b 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -610,12 +610,15 @@ OUT_PKT4(struct msm_ringbuffer *ring, uint16_t regi=
ndx, uint16_t cnt)
>         OUT_RING(ring, PKT4(regindx, cnt));
>  }
>
> +#define PKT7(opcode, cnt) \
> +       (CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) | \
> +               ((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23))
> +
>  static inline void
>  OUT_PKT7(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
>  {
>         adreno_wait_ring(ring, cnt + 1);
> -       OUT_RING(ring, CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15=
) |
> -               ((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23));
> +       OUT_RING(ring, PKT7(opcode, cnt));
>  }
>
>  struct msm_gpu *a2xx_gpu_init(struct drm_device *dev);
>
> --
> 2.46.0
>
