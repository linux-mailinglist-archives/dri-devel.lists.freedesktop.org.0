Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 980DAB49456
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 17:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239A610E15E;
	Mon,  8 Sep 2025 15:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bbmc5oG0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB08E10E15D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 15:55:01 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-3296a9d17d3so309870a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 08:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757346901; x=1757951701; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ncy8rMYMPoo6qD4OwV7z755Sx/k/Cp6xU0Sc/P4F2ss=;
 b=bbmc5oG0w45v+gbUCrnjiNv301fTjQcCuCnQriN+JE0wxjsMpHXf2co7dWpHMBkVeW
 EeGtv4NatnJvScYri/loeLEKTtdNvl58Cmnc09smK8IE+oh6nl7sKy6o4ZpYMUeZn3Or
 lCw4GC0a6Af0/RNQXmXxFpy5VQJfFtVo0qOREIOiHJvb5SxsR5VHXmA1mlBgeoOhwhSF
 5aHWzHf0QQHIeLzuXuRPpFxcbfcAMOBb6z27zGxC3HWjo7U72+4nbaQzPSMAXrZ0rDwS
 aeWE53PuC0Qbo8grCV/M6dIgsVqgLiqtvn8QsKWO9hVKQxkprVNjXEUde4DMC/FOjfye
 Te9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757346901; x=1757951701;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ncy8rMYMPoo6qD4OwV7z755Sx/k/Cp6xU0Sc/P4F2ss=;
 b=iB+9ppnV/AHl7P1a3qK6QAZuYMy8K9UIB538/RTr2LxIgz2Tbh/dZ5s9GMhJy5KbpQ
 RUTio+EXlU5NWtplh1CHkFC5QsMI2s+lX5I/CI/TBLBlR9GrsGCa4Ky0g/knm+IglVbP
 KVpox5ywiFYGPggO8JKikb94+sPf8F/oFj4HHMcTAKRBntk6m8AR6tj9nklgP5SfY4Nj
 cvk4ZTT9AE5Ei3Bmb26tayOrAVad5CLSRIDqkJWw4XmGm/3oMxECU6gJb8Tto5aQw5NU
 o2FDE+AVJfw7SrqOP2qw4yVHFs6g8KRt6Pp78lAS6EdtVXHeqtaCuM6ayajacKdVEZhc
 8UnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlNXEU6c8FT+4iJ9J/pXlaKurxEve7Vm4uhzERE/jJ+dsXxflYznOZKu55wxiNulopmJ45YIYh7g0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzY3iLgLuIhmVlJCCwLxA/SzE+gKtgbRjlVtqJsTEsfP8PhsCdc
 ebXwT1DVsPxpyNCmyHD3Ow668Vt0Ouz8uj5RAi7CwWltndGmhovKS4lbr5Xg3pqdzeM0EgiIt4I
 DcEpqlZ9EQ49KWkN86Ga4V30lkGbbXIY=
X-Gm-Gg: ASbGncs5JdAlnN9VE/JFaZ++08k9GQcwQZj6bJnJkIVONy09nxGKv7vSwsj6nGCKzM4
 0KPq4ltYWWNOqZ9Bju1Ra9NPaOMSk97JOkZhwNk+LLFE1Y7b5owQDJYbHdL6AvOZd3xfq/1B1VI
 xFKghJdQlDXy47iux+Y+RF+a13XMIvlWayC2vy/iVvgRj+jNHCMNaLu5MM5DxB75cF5FahTJeeQ
 Ujj7SG2+HXEU4vbAQ==
X-Google-Smtp-Source: AGHT+IGZSQ5JJVv+TntNrNjXPczNaBQa/rBlW+/B4duhLKucX8M6mTF04KFFT56z8aAM798hVCMz9iyyyiTT/FE7BWQ=
X-Received: by 2002:a17:90b:38cb:b0:32b:dcef:f65f with SMTP id
 98e67ed59e1d1-32d43f772e8mr6052003a91.3.1757346901055; Mon, 08 Sep 2025
 08:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
 <20250908-ifpc-support-v2-7-631b1080bf91@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-7-631b1080bf91@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Mon, 8 Sep 2025 11:54:49 -0400
X-Gm-Features: Ac12FXwZh4Knfa5C5jRkwC4PMADG3bi9JxMMu92KfaQYtzGrloYElebo2U4Ct24
Message-ID: <CACu1E7H_K0WbWsHDqD44YfyMvc9bfZon-Tx75LkBFqWdG2YZ=Q@mail.gmail.com>
Subject: Re: [PATCH v2 07/16] drm/msm/adreno: Add fenced regwrite support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Antonino Maniscalco <antomani103@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
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

On Mon, Sep 8, 2025 at 4:27=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcomm=
.com> wrote:
>
> There are some special registers which are accessible even when GX power
> domain is collapsed during an IFPC sleep. Accessing these registers
> wakes up GPU from power collapse and allow programming these registers
> without additional handshake with GMU. This patch adds support for this
> special register write sequence.
>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 80 +++++++++++++++++++++++++=
+++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 ++++----
>  3 files changed, 90 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 45dd5fd1c2bfcb0a01b71a326c7d95b0f9496d99..a63dad80ef461da45d5c41a04=
2ed4f19d8282ef5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -16,6 +16,84 @@
>
>  #define GPU_PAS_ID 13
>
> +static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 valu=
e, u32 status, u32 mask)
> +{
> +       /* Success if !writedropped0/1 */
> +       if (!(status & mask))
> +               return true;
> +
> +       udelay(10);
> +
> +       /* Try to update fenced register again */
> +       gpu_write(gpu, offset, value);
> +
> +       /* We can't do a posted write here because the power domain could=
 be
> +        * in collapse state. So use the heaviest barrier instead
> +        */
> +       mb();
> +       return false;
> +}
> +
> +static int fenced_write(struct a6xx_gpu *a6xx_gpu, u32 offset, u32 value=
, u32 mask)
> +{
> +       struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base;
> +       struct msm_gpu *gpu =3D &adreno_gpu->base;
> +       struct a6xx_gmu *gmu =3D &a6xx_gpu->gmu;
> +       u32 status;
> +
> +       gpu_write(gpu, offset, value);
> +
> +       /* Nothing else to be done in the case of no-GMU */
> +       if (adreno_has_gmu_wrapper(adreno_gpu))
> +               return 0;
> +
> +       /* We can't do a posted write here because the power domain could=
 be
> +        * in collapse state. So use the heaviest barrier instead
> +        */
> +       mb();
> +
> +       if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
> +                       fence_status_check(gpu, offset, value, status, ma=
sk), 0, 1000))
> +               return 0;
> +
> +       /* Try again for another 1ms before failing */
> +       gpu_write(gpu, offset, value);
> +       mb();
> +
> +       if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
> +                       fence_status_check(gpu, offset, value, status, ma=
sk), 0, 1000)) {
> +               /*
> +                * The 'delay' warning is here because the pause to print=
 this
> +                * warning will allow gpu to move to power collapse which
> +                * defeats the purpose of continuous polling for 2 ms
> +                */
> +               dev_err_ratelimited(gmu->dev, "delay in fenced register w=
rite (0x%x)\n",
> +                               offset);
> +               return 0;
> +       }
> +
> +       dev_err_ratelimited(gmu->dev, "fenced register write (0x%x) fail\=
n",
> +                       offset);
> +
> +       return -ETIMEDOUT;
> +}
> +
> +int a6xx_fenced_write(struct a6xx_gpu *a6xx_gpu, u32 offset, u64 value, =
u32 mask, bool is_64b)
> +{
> +       int ret;
> +
> +       ret =3D fenced_write(a6xx_gpu, offset, lower_32_bits(value), mask=
);
> +       if (ret)
> +               return ret;
> +
> +       if (!is_64b)
> +               return 0;
> +
> +       ret =3D fenced_write(a6xx_gpu, offset + 1, upper_32_bits(value), =
mask);
> +
> +       return ret;
> +}
> +
>  static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> @@ -86,7 +164,7 @@ static void a6xx_flush(struct msm_gpu *gpu, struct msm=
_ringbuffer *ring)
>         /* Update HW if this is the current ring and we are not in preemp=
t*/
>         if (!a6xx_in_preempt(a6xx_gpu)) {
>                 if (a6xx_gpu->cur_ring =3D=3D ring)
> -                       gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
> +                       a6xx_fenced_write(a6xx_gpu, REG_A6XX_CP_RB_WPTR, =
wptr, BIT(0), false);
>                 else
>                         ring->restore_wptr =3D true;
>         } else {
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.h
> index 6e71f617fc3d0d564e51650dfed63a18f31042ac..e736c59d566b3fcf8c62a2124=
94e3b110c09caa9 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -295,5 +295,6 @@ int a6xx_gpu_state_put(struct msm_gpu_state *state);
>
>  void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, =
bool gx_off);
>  void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert);
> +int a6xx_fenced_write(struct a6xx_gpu *gpu, u32 offset, u64 value, u32 m=
ask, bool is_64b);

"mask" makes it sound like it's the mask for a masked write, which it
isn't. At least in the public API I'd name it something more explicit
like "fence_status_mask". Also it would be nice to add defines like
GMU_FENCE_STATUS_WPTR/CONTEXT_SWITCH to make the parameter values in
callsites less magical. Finally, this might be personal preference,
but it's not immediately obvious what the "true"/"false" in callsites
mean, so it would make users clearer to add a separate
"a6xx_fenced_write64" and make 64-bit reg writes use that instead of
is_64b.

Connor

>
>  #endif /* __A6XX_GPU_H__ */
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/=
msm/adreno/a6xx_preempt.c
> index 6a12a35dabff1e64aae8440c2a8c88f5feb4803e..10625ffbc4cfc26edc36efcf1=
1dbb4efd55ab3e0 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> @@ -41,7 +41,7 @@ static inline void set_preempt_state(struct a6xx_gpu *g=
pu,
>  }
>
>  /* Write the most recent wptr for the given ring into the hardware */
> -static inline void update_wptr(struct msm_gpu *gpu, struct msm_ringbuffe=
r *ring)
> +static inline void update_wptr(struct a6xx_gpu *a6xx_gpu, struct msm_rin=
gbuffer *ring)
>  {
>         unsigned long flags;
>         uint32_t wptr;
> @@ -51,7 +51,7 @@ static inline void update_wptr(struct msm_gpu *gpu, str=
uct msm_ringbuffer *ring)
>         if (ring->restore_wptr) {
>                 wptr =3D get_wptr(ring);
>
> -               gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
> +               a6xx_fenced_write(a6xx_gpu, REG_A6XX_CP_RB_WPTR, wptr, BI=
T(0), false);
>
>                 ring->restore_wptr =3D false;
>         }
> @@ -172,7 +172,7 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
>
>         set_preempt_state(a6xx_gpu, PREEMPT_FINISH);
>
> -       update_wptr(gpu, a6xx_gpu->cur_ring);
> +       update_wptr(a6xx_gpu, a6xx_gpu->cur_ring);
>
>         set_preempt_state(a6xx_gpu, PREEMPT_NONE);
>
> @@ -268,7 +268,7 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>          */
>         if (!ring || (a6xx_gpu->cur_ring =3D=3D ring)) {
>                 set_preempt_state(a6xx_gpu, PREEMPT_FINISH);
> -               update_wptr(gpu, a6xx_gpu->cur_ring);
> +               update_wptr(a6xx_gpu, a6xx_gpu->cur_ring);
>                 set_preempt_state(a6xx_gpu, PREEMPT_NONE);
>                 spin_unlock_irqrestore(&a6xx_gpu->eval_lock, flags);
>                 return;
> @@ -302,13 +302,13 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>
>         spin_unlock_irqrestore(&ring->preempt_lock, flags);
>
> -       gpu_write64(gpu,
> -               REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO,
> -               a6xx_gpu->preempt_smmu_iova[ring->id]);
> +       a6xx_fenced_write(a6xx_gpu,
> +               REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO, a6xx_gpu->preempt_s=
mmu_iova[ring->id],
> +               BIT(1), true);
>
> -       gpu_write64(gpu,
> +       a6xx_fenced_write(a6xx_gpu,
>                 REG_A6XX_CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR,
> -               a6xx_gpu->preempt_iova[ring->id]);
> +               a6xx_gpu->preempt_iova[ring->id], BIT(1), true);
>
>         a6xx_gpu->next_ring =3D ring;
>
> @@ -328,7 +328,7 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>         set_preempt_state(a6xx_gpu, PREEMPT_TRIGGERED);
>
>         /* Trigger the preemption */
> -       gpu_write(gpu, REG_A6XX_CP_CONTEXT_SWITCH_CNTL, cntl);
> +       a6xx_fenced_write(a6xx_gpu, REG_A6XX_CP_CONTEXT_SWITCH_CNTL, cntl=
, BIT(1), false);
>  }
>
>  static int preempt_init_ring(struct a6xx_gpu *a6xx_gpu,
>
> --
> 2.50.1
>
