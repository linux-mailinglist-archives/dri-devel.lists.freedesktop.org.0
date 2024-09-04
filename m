Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0AD96C07F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 16:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B77C10E7D5;
	Wed,  4 Sep 2024 14:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X3zZmobd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A3B10E7D4;
 Wed,  4 Sep 2024 14:30:30 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-39f49600297so16971145ab.1; 
 Wed, 04 Sep 2024 07:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725460230; x=1726065030; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uUh1Bn8LTCD+clJ/J0HFf8JHKVuXPH+EGrtYwcbTYIQ=;
 b=X3zZmobdlE+INUL82j7ozbNK4MvJ9oCrKxyCP8CG46GyHYzUUAP9YRwbIinCMT8aFh
 /ez/Cm8hdlFOLR/MKFcWrLKHaJMBYLpHWEmidL5vjTgRKxWYIO0e/4tMwa0hZqYBmI+y
 HfEi00a5fmEi+r4TDa79XUXEAQFY9OILp7z2egqgDgbrMCABLfjtZWGvtmgDdxmd0QwH
 2pCf0dNFEgMMrHfufy5XWPfjXVox4F62yiAuBu4hrML1xU0UZcIQ09sxOpBr+3J9EXve
 e1+DCNixRCLbS6MgnIcHXkwBmcVm58fOtpOheBITtye5rwIjOMjZRAOe6o68VmgaB5uL
 Gw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725460230; x=1726065030;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uUh1Bn8LTCD+clJ/J0HFf8JHKVuXPH+EGrtYwcbTYIQ=;
 b=b16Wb8Oh17nQ9/wnhGHz+iQ4bxP0h8/4xaOQyC5Z2CkgOGbfKgqEVp5/vphMuB7WOI
 jUujju9TAzPZV9ZXhz+JL4a457EOCVk+fxS2KWcQwchu+XTOEI+3JXD8wjZAPsJl5I/4
 gNPPo+BoNCDff5h0XXyB7EfAV+VCzuSFbRw2KVBMNW6a/OKrAuoAdLIJpO2EFy3RPKMu
 7TKbE8BMr7swqwxMK/EymvW6fn1OVeRP1f8HUIiGyFKhPTnB8/689lA4big4VjwzM8FX
 xUUN3+YJxwetjL73xLmu49Y+bEwYN1J3NvIO7/MsPmXklemNux8EV9fTdesKYqwVUjrm
 G9MA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDxvSTw8vzgDoZpJeqD3lowPUsmrgb+5VdsSVeUpFf88DxzDt8f+HJO3W5DQKSCuBqWv9UXpoLKmw=@lists.freedesktop.org,
 AJvYcCUzCbVopAdBQWgxPWH80wdNiDQ1G6ECyDtm8juPOzC1oF9Mz2Iin8I47yC03crQc/6+NjA15SuYhPKb@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybVXX7qSCkG2bSBNXTscKd11KLFTSwkVMCdLWWKY/p7tqVLbW1
 z23yacGwoPYtW/WDjGN82sbax+YEIo00PSpcE5N2KYen4ijppQwmzZEhjiNUVIWb+FKwv3ctQCi
 MQSiV9Biz1GDXpN69u3uQjZA7xuk=
X-Google-Smtp-Source: AGHT+IEOs79kz4wpYRVi6vayStorUTQuG3MLQed42xUFFfh4rUgAOixAlfb7UxVs1MDoDJIZwMT7ryuRLZClp+PiPMc=
X-Received: by 2002:a92:cda5:0:b0:39f:7a06:2a62 with SMTP id
 e9e14a558f8ab-39f7a062ad8mr22423485ab.5.1725460229529; Wed, 04 Sep 2024
 07:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
 <20240830-preemption-a750-t-v2-6-86aeead2cd80@gmail.com>
 <CAF6AEGv82=N4=motCpGhp5N7Yv8oqtBcG4bGahgF53CpFYpTgg@mail.gmail.com>
 <b899d35a-fedf-4748-ac23-6389a8742160@gmail.com>
In-Reply-To: <b899d35a-fedf-4748-ac23-6389a8742160@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 4 Sep 2024 07:30:16 -0700
Message-ID: <CAF6AEGufJhPMbyJJ7kV6-2cknmOwKD15Z5foYfje0bVjH7G0MQ@mail.gmail.com>
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

On Wed, Sep 4, 2024 at 6:39=E2=80=AFAM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> On 8/30/24 8:32 PM, Rob Clark wrote:
> > On Fri, Aug 30, 2024 at 8:33=E2=80=AFAM Antonino Maniscalco
> > <antomani103@gmail.com> wrote:
> >>
> >> Use the postamble to reset perf counters when switching between rings,
> >> except when sysprof is enabled, analogously to how they are reset
> >> between submissions when switching pagetables.
> >>
> >> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> >> ---
> >>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 14 +++++++++++++-
> >>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  6 ++++++
> >>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 26 +++++++++++++++++++++=
++++-
> >>   drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  7 +++++--
> >>   4 files changed, 49 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/m=
sm/adreno/a6xx_gpu.c
> >> index 1a90db5759b8..3528ecbbc1ab 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -366,7 +366,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struc=
t msm_gem_submit *submit)
> >>   static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
> >>                  struct a6xx_gpu *a6xx_gpu, struct msm_gpu_submitqueue=
 *queue)
> >>   {
> >> -       u64 preempt_offset_priv_secure;
> >> +       bool sysprof =3D refcount_read(&a6xx_gpu->base.base.sysprof_ac=
tive) > 1;
> >> +       u64 preempt_offset_priv_secure, preempt_postamble;
> >>
> >>          OUT_PKT7(ring, CP_SET_PSEUDO_REG, 15);
> >>
> >> @@ -403,6 +404,17 @@ static void a6xx_emit_set_pseudo_reg(struct msm_r=
ingbuffer *ring,
> >>          /* seems OK to set to 0 to disable it */
> >>          OUT_RING(ring, 0);
> >>          OUT_RING(ring, 0);
> >> +
> >> +       if (!sysprof && a6xx_gpu->preempt_postamble_len) {
> >> +               preempt_postamble =3D SCRATCH_PREEMPT_POSTAMBLE_IOVA(a=
6xx_gpu);
> >> +
> >> +               OUT_PKT7(ring, CP_SET_AMBLE, 3);
> >> +               OUT_RING(ring, lower_32_bits(preempt_postamble));
> >> +               OUT_RING(ring, upper_32_bits(preempt_postamble));
> >> +               OUT_RING(ring, CP_SET_AMBLE_2_DWORDS(
> >> +                                       a6xx_gpu->preempt_postamble_le=
n) |
> >> +                               CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
> >> +       }
> >
> > Hmm, ok, we set this in the submit path.. but do we need to clear it
> > somehow when transitioning from !sysprof to sysprof?
> >
>
> We can always emit the packet and 0 fields out when sysprof is enabled.
> Would that be ok for you? Only emitting it when needed might be
> nontrivial given that there are multiple rings and we would be paying
> the overhead for emitting it in the more common case (not profiling) anyw=
ay.

That sounds like it would work

> > Also, how does this interact with UMD perfctr queries, I would expect
> > they would prefer save/restore?
>
> Right so my understanding given previous discussions is that we want to
> disable preemption from userspace in that case? The vulkan extension
> requires to acquire and release a lock so we could use that to emit the
> packets that enable and disable preemption perhaps.

ack

BR,
-R

> >
> > BR,
> > -R
> >
> >>   }
> >>
> >>   static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *=
submit)
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/m=
sm/adreno/a6xx_gpu.h
> >> index 652e49f01428..2338e36c8f47 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> >> @@ -66,6 +66,7 @@ struct a6xx_gpu {
> >>          atomic_t preempt_state;
> >>          spinlock_t eval_lock;
> >>          struct timer_list preempt_timer;
> >> +       uint64_t preempt_postamble_len;
> >>
> >>          unsigned int preempt_level;
> >>          bool uses_gmem;
> >> @@ -99,6 +100,11 @@ struct a6xx_gpu {
> >>   #define SCRATCH_USER_CTX_IOVA(ring_id, a6xx_gpu) \
> >>          (a6xx_gpu->scratch_iova + (ring_id * sizeof(uint64_t)))
> >>
> >> +#define SCRATCH_PREEMPT_POSTAMBLE_OFFSET (100 * sizeof(u64))
> >> +
> >> +#define SCRATCH_PREEMPT_POSTAMBLE_IOVA(a6xx_gpu) \
> >> +       (a6xx_gpu->scratch_iova + SCRATCH_PREEMPT_POSTAMBLE_OFFSET)
> >> +
> >>   /*
> >>    * In order to do lockless preemption we use a simple state machine =
to progress
> >>    * through the process.
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/d=
rm/msm/adreno/a6xx_preempt.c
> >> index 4b61b993f75f..f586615db97e 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> >> @@ -351,6 +351,28 @@ static int preempt_init_ring(struct a6xx_gpu *a6x=
x_gpu,
> >>          return 0;
> >>   }
> >>
> >> +static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
> >> +{
> >> +       u32 *postamble =3D a6xx_gpu->scratch_ptr + SCRATCH_PREEMPT_POS=
TAMBLE_OFFSET;
> >> +       u32 count =3D 0;
> >> +
> >> +       postamble[count++] =3D PKT7(CP_REG_RMW, 3);
> >> +       postamble[count++] =3D REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CMD;
> >> +       postamble[count++] =3D 0;
> >> +       postamble[count++] =3D 1;
> >> +
> >> +       postamble[count++] =3D PKT7(CP_WAIT_REG_MEM, 6);
> >> +       postamble[count++] =3D CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ);
> >> +       postamble[count++] =3D CP_WAIT_REG_MEM_1_POLL_ADDR_LO(
> >> +                               REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS=
);
> >> +       postamble[count++] =3D CP_WAIT_REG_MEM_2_POLL_ADDR_HI(0);
> >> +       postamble[count++] =3D CP_WAIT_REG_MEM_3_REF(0x1);
> >> +       postamble[count++] =3D CP_WAIT_REG_MEM_4_MASK(0x1);
> >> +       postamble[count++] =3D CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0);
> >> +
> >> +       a6xx_gpu->preempt_postamble_len =3D count;
> >> +}
> >> +
> >>   void a6xx_preempt_fini(struct msm_gpu *gpu)
> >>   {
> >>          struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> >> @@ -382,10 +404,12 @@ void a6xx_preempt_init(struct msm_gpu *gpu)
> >>          a6xx_gpu->skip_save_restore =3D 1;
> >>
> >>          a6xx_gpu->scratch_ptr  =3D msm_gem_kernel_new(gpu->dev,
> >> -                       gpu->nr_rings * sizeof(uint64_t), MSM_BO_WC,
> >> +                       PAGE_SIZE, MSM_BO_WC,
> >>                          gpu->aspace, &a6xx_gpu->scratch_bo,
> >>                          &a6xx_gpu->scratch_iova);
> >>
> >> +       preempt_prepare_postamble(a6xx_gpu);
> >> +
> >>          if (IS_ERR(a6xx_gpu->scratch_ptr))
> >>                  goto fail;
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm=
/msm/adreno/adreno_gpu.h
> >> index 6b1888280a83..87098567483b 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> >> @@ -610,12 +610,15 @@ OUT_PKT4(struct msm_ringbuffer *ring, uint16_t r=
egindx, uint16_t cnt)
> >>          OUT_RING(ring, PKT4(regindx, cnt));
> >>   }
> >>
> >> +#define PKT7(opcode, cnt) \
> >> +       (CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) | \
> >> +               ((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23))
> >> +
> >>   static inline void
> >>   OUT_PKT7(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
> >>   {
> >>          adreno_wait_ring(ring, cnt + 1);
> >> -       OUT_RING(ring, CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) <<=
 15) |
> >> -               ((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23));
> >> +       OUT_RING(ring, PKT7(opcode, cnt));
> >>   }
> >>
> >>   struct msm_gpu *a2xx_gpu_init(struct drm_device *dev);
> >>
> >> --
> >> 2.46.0
> >>
>
> Best regards,
> --
> Antonino Maniscalco <antomani103@gmail.com>
>
