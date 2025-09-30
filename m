Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A93E5BAC17B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 10:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9695C10E2A1;
	Tue, 30 Sep 2025 08:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UtTtNXSQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2959B10E036
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 08:41:26 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-3327130c135so902390a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 01:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759221686; x=1759826486; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LD18/ABsae/KSnhXL/eHSriuLA+lvY1QWo8o6q93AWc=;
 b=UtTtNXSQOKWhel7G7OIzSXQnKZu7LjUJPdWYdWWbko3/ikj1RUeoXdCLUT1XCenxBP
 T45xkV7ipd8bBY4OL2ex5RuttFB6jTz0Ezybd5g3RZ/CdZPlLt5ZWktgg5EnRFqv+ESc
 +k5kb+3Yiu6vusNWzgyFs7Xd9sNdDaeBzArZfb9+UOA3O08YEELZVFiJy4a3Gjnij34z
 nxtS9qEgYB20N0LWjXvVTQZnyV+FHFzox80Ex28aW6KXiOQs79s86SSaL2MraSyjr97U
 QrRzXDkMZlL5bXbYMFiD3AbJe5tbMFo6FqjnW3tIgOmd5ZYCN41Qomz0E1yuIe4r4rif
 c3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759221686; x=1759826486;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LD18/ABsae/KSnhXL/eHSriuLA+lvY1QWo8o6q93AWc=;
 b=F1wzrhOTkoHONhJxsNEftMwsiffXUgVY6PmynlSawtm7S7aziIOluFd9GD5iSvRxd6
 Un6GA6NlPA1/+LpTGEOuzVh6V8xEtVyEgs14AnwFUAuFSdAG+kT/uBH4TdxEZ/utXzLl
 b0NgZErC8wpfLPIhm/ZjdSE9PF6R/q1WQ1H9fYL3YnxngSl40rnSLik6PAoh6ubLkSbX
 WpVMkl7meeR2vA0JC72F4xO3tYI0/yHF+ReRKvMkqPME5MnEmof98ecrm6tkwBgskyO5
 bybVyg3NnPDUTcNxCmKF0pQcIm+lulQUBV8c5bO8snt1Ahc4lS57is2ddDmMis73lpRT
 1E6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmkq0zBvbW6mHjTIp+RrxbafQPR+hEm9+8ENhqoiHZEB2QSFlOpKlZPw+0afdLZ342v3QmLpCfnrE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyOVP/PSui/5tpXtE7izC7STCXij8+cbFPNcokmoKI957tHvI3
 0zklADCfQfl2FACLuC+03RShqRSo32DR4JaCAUpzPU4RREpJV7397muH1Hs+7RtLlJaC+GpLy9H
 PiP13bVpTTQMFHhXI0WTUO+7SclN4Zno=
X-Gm-Gg: ASbGncvjURhZyJItFbilpEBMQttBRktX+pyxKY1qP/mJSXt9cnrRW8P2n4hUMKiZSxQ
 Jzo7gpfxm/RJRwrt9FHb8GOHQy2AvZn0vXzogDYMDVDgeJr6WT4TZ/hdMQh2hmOuaPOlftFIKzh
 nG5U0eiqnMGGx86hw/+IrR2U67Xpk/UQfowg8F/XzlZ1XfnzTIrnapd5NVIR/3oK0Ssuvk3FgT4
 25aYwgeumkH/5qmTxLD5yTAjTb6d3KJ68ZFO3VPG387fpkRLKuNQju9L5AB
X-Google-Smtp-Source: AGHT+IG8jS1oLrn1olK1K1w0EZGHqly9vQX63ht+yCXO/XvKfJd4n+viViUghipUmXbk+vV+THGXMgTQG2PcwGuQ8Lg=
X-Received: by 2002:a17:90b:1b49:b0:330:7fd8:9b05 with SMTP id
 98e67ed59e1d1-3342a2bee5dmr10495028a91.3.1759221685419; Tue, 30 Sep 2025
 01:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-12-73530b0700ed@oss.qualcomm.com>
 <ks3ppjsy35wka2at5nxrr74l5mvzr4l6ovm5ncohanu2gn3ytl@gt2mzwjehq73>
 <CACSVV00AFEJVti7BryA-_sosmBKCuDtX7+NEi4aL4X98AqR1Qg@mail.gmail.com>
In-Reply-To: <CACSVV00AFEJVti7BryA-_sosmBKCuDtX7+NEi4aL4X98AqR1Qg@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 30 Sep 2025 10:41:13 +0200
X-Gm-Features: AS18NWBO5tNAKAQ348z4ldUTuvm0KCN25KN4j612LeJ0DJ-orMAiAdk5W7QF5qw
Message-ID: <CACu1E7H0Y9wLwN=ztx+YSQLMQuqOF0hYPqvF-VdXyFW65og6og@mail.gmail.com>
Subject: Re: [PATCH 12/17] drm/msm/adreno: Introduce A8x GPU Support
To: rob.clark@oss.qualcomm.com
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, devicetree@vger.kernel.org
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

On Tue, Sep 30, 2025 at 10:08=E2=80=AFAM Rob Clark <rob.clark@oss.qualcomm.=
com> wrote:
>
> On Tue, Sep 30, 2025 at 12:43=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Tue, Sep 30, 2025 at 11:18:17AM +0530, Akhil P Oommen wrote:
> > > A8x is the next generation of Adreno GPUs, featuring a significant
> > > hardware design change. A major update to the design is the introduct=
ion
> > > of Slice architecture. Slices are sort of mini-GPUs within the GPU wh=
ich
> > > are more independent in processing Graphics and compute workloads. Al=
so,
> > > in addition to the BV and BR pipe we saw in A7x, CP has more concurre=
ncy
> > > with additional pipes.
> > >
> > > From a software interface perspective, these changes have a significa=
nt
> > > impact on the KMD side. First, the GPU register space has been extens=
ively
> > > reorganized. Second, to avoid  a register space explosion caused by t=
he
> > > new slice architecture and additional pipes, many registers are now
> > > virtualized, instead of duplicated as in A7x. KMD must configure an
> > > aperture register with the appropriate slice and pipe ID before acces=
sing
> > > these virtualized registers.
> > >
> > > This patch adds only a skeleton support for the A8x family. An A8x GP=
U
> > > support will be added in an upcoming patch.
> >
> > Consider this lands in a commit message. What would it mean in the Git
> > history?
> >
> > >
> > > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/Makefile                      |    1 +
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c             |  103 +-
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.h             |   21 +
> > >  drivers/gpu/drm/msm/adreno/a8xx_gpu.c             | 1238 +++++++++++=
++++++++++
> > >  drivers/gpu/drm/msm/adreno/adreno_gpu.h           |    7 +
> > >  drivers/gpu/drm/msm/registers/adreno/a6xx.xml     |    1 -
> > >  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |    1 +
> > >  7 files changed, 1344 insertions(+), 28 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makef=
ile
> > > index 7acf2cc13cd047eb7f5b3f14e1a42a1cc145e087..8aa7d07303fb0cd668697=
67cb6298b38a621b366 100644
> > > --- a/drivers/gpu/drm/msm/Makefile
> > > +++ b/drivers/gpu/drm/msm/Makefile
> > > @@ -24,6 +24,7 @@ adreno-y :=3D \
> > >       adreno/a6xx_gmu.o \
> > >       adreno/a6xx_hfi.o \
> > >       adreno/a6xx_preempt.o \
> > > +     adreno/a8xx_gpu.o \
> > >
> > >  adreno-$(CONFIG_DEBUG_FS) +=3D adreno/a5xx_debugfs.o \
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/=
msm/adreno/a6xx_gpu.c
> > > index bd4f98b5457356c5454d0316e59d7e8253401712..4aeeaceb1fb30a9d68ac6=
36c14249e3853ef73ac 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > @@ -239,14 +239,21 @@ static void a6xx_set_pagetable(struct a6xx_gpu =
*a6xx_gpu,
> > >       }
> > >
> > >       if (!sysprof) {
> > > -             if (!adreno_is_a7xx(adreno_gpu)) {
> > > +             if (!(adreno_is_a7xx(adreno_gpu) || adreno_is_a8xx(adre=
no_gpu))) {
> >
> > Here and in several other similar places:
> >
> >                 if (!adreno_is_a7xx(adreno_gpu) &&
> >                     !adreno_is_a8xx(adreno_gpu))) {
> >
> > >                       /* Turn off protected mode to write to special =
registers */
> > >                       OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
> > >                       OUT_RING(ring, 0);
> > >               }
> > >
> > > -             OUT_PKT4(ring, REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CMD, 1);
> > > -             OUT_RING(ring, 1);
> > > +             if (adreno_is_a8xx(adreno_gpu)) {
> > > +                     OUT_PKT4(ring, REG_A8XX_RBBM_PERFCTR_SRAM_INIT_=
CMD, 1);
> > > +                     OUT_RING(ring, 1);
> > > +                     OUT_PKT4(ring, REG_A8XX_RBBM_SLICE_PERFCTR_SRAM=
_INIT_CMD, 1);
> > > +                     OUT_RING(ring, 1);
> > > +             } else {
> > > +                     OUT_PKT4(ring, REG_A6XX_RBBM_PERFCTR_SRAM_INIT_=
CMD, 1);
> > > +                     OUT_RING(ring, 1);
> > > +             }
> > >       }
> > >
> > >       /* Execute the table update */
> > > @@ -275,7 +282,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a=
6xx_gpu,
> > >        * to make sure BV doesn't race ahead while BR is still switchi=
ng
> > >        * pagetables.
> > >        */
> > > -     if (adreno_is_a7xx(&a6xx_gpu->base)) {
> > > +     if (adreno_is_a7xx(&a6xx_gpu->base) && adreno_is_a8xx(&a6xx_gpu=
->base)) {
> > >               OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
> > >               OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SE=
T_THREAD_BR);
> > >       }
> > > @@ -289,20 +296,22 @@ static void a6xx_set_pagetable(struct a6xx_gpu =
*a6xx_gpu,
> > >       OUT_RING(ring, CACHE_INVALIDATE);
> > >
> > >       if (!sysprof) {
> > > +             u32 reg_status =3D adreno_is_a8xx(adreno_gpu) ?
> > > +                     REG_A8XX_RBBM_PERFCTR_SRAM_INIT_STATUS :
> > > +                     REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS;
> > >               /*
> > >                * Wait for SRAM clear after the pgtable update, so the
> > >                * two can happen in parallel:
> > >                */
> > >               OUT_PKT7(ring, CP_WAIT_REG_MEM, 6);
> > >               OUT_RING(ring, CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ));
> > > -             OUT_RING(ring, CP_WAIT_REG_MEM_POLL_ADDR_LO(
> > > -                             REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS)=
);
> > > +             OUT_RING(ring, CP_WAIT_REG_MEM_POLL_ADDR_LO(reg_status)=
);
> > >               OUT_RING(ring, CP_WAIT_REG_MEM_POLL_ADDR_HI(0));
> > >               OUT_RING(ring, CP_WAIT_REG_MEM_3_REF(0x1));
> > >               OUT_RING(ring, CP_WAIT_REG_MEM_4_MASK(0x1));
> > >               OUT_RING(ring, CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0));
> > >
> > > -             if (!adreno_is_a7xx(adreno_gpu)) {
> > > +             if (!(adreno_is_a7xx(adreno_gpu) || adreno_is_a8xx(adre=
no_gpu))) {
> > >                       /* Re-enable protected mode: */
> > >                       OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
> > >                       OUT_RING(ring, 1);
> > > @@ -441,6 +450,7 @@ static void a7xx_submit(struct msm_gpu *gpu, stru=
ct msm_gem_submit *submit)
> > >       struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > >       struct msm_ringbuffer *ring =3D submit->ring;
> > >       unsigned int i, ibs =3D 0;
> > > +     u32 rbbm_perfctr_cp0, cp_always_on_counter;
> > >
> > >       adreno_check_and_reenable_stall(adreno_gpu);
> > >
> > > @@ -460,10 +470,16 @@ static void a7xx_submit(struct msm_gpu *gpu, st=
ruct msm_gem_submit *submit)
> > >       if (gpu->nr_rings > 1)
> > >               a6xx_emit_set_pseudo_reg(ring, a6xx_gpu, submit->queue)=
;
> > >
> > > -     get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
> > > -             rbmemptr_stats(ring, index, cpcycles_start));
> > > -     get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_COUNTER,
> > > -             rbmemptr_stats(ring, index, alwayson_start));
> > > +     if (adreno_is_a8xx(adreno_gpu)) {
> > > +             rbbm_perfctr_cp0 =3D REG_A8XX_RBBM_PERFCTR_CP(0);
> > > +             cp_always_on_counter =3D REG_A8XX_CP_ALWAYS_ON_COUNTER;
> > > +     } else {
> > > +             rbbm_perfctr_cp0 =3D REG_A7XX_RBBM_PERFCTR_CP(0);
> > > +             cp_always_on_counter =3D REG_A6XX_CP_ALWAYS_ON_COUNTER;
> > > +     }
> > > +
> > > +     get_stats_counter(ring, rbbm_perfctr_cp0, rbmemptr_stats(ring, =
index, cpcycles_start));
> > > +     get_stats_counter(ring, cp_always_on_counter, rbmemptr_stats(ri=
ng, index, alwayson_start));
> > >
> > >       OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
> > >       OUT_RING(ring, CP_SET_THREAD_BOTH);
> > > @@ -510,10 +526,8 @@ static void a7xx_submit(struct msm_gpu *gpu, str=
uct msm_gem_submit *submit)
> > >               OUT_RING(ring, 0x00e); /* IB1LIST end */
> > >       }
> > >
> > > -     get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
> > > -             rbmemptr_stats(ring, index, cpcycles_end));
> > > -     get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_COUNTER,
> > > -             rbmemptr_stats(ring, index, alwayson_end));
> > > +     get_stats_counter(ring, rbbm_perfctr_cp0, rbmemptr_stats(ring, =
index, cpcycles_end));
> > > +     get_stats_counter(ring, cp_always_on_counter, rbmemptr_stats(ri=
ng, index, alwayson_end));
> > >
> > >       /* Write the fence to the scratch register */
> > >       OUT_PKT4(ring, REG_A6XX_CP_SCRATCH(2), 1);
> > > @@ -706,8 +720,11 @@ static int a6xx_calc_ubwc_config(struct adreno_g=
pu *gpu)
> > >       /* Copy the data into the internal struct to drop the const qua=
lifier (temporarily) */
> > >       *cfg =3D *common_cfg;
> > >
> > > -     cfg->ubwc_swizzle =3D 0x6;
> > > -     cfg->highest_bank_bit =3D 15;
> > > +     /* Use common config as is for A8x */
> > > +     if (!adreno_is_a8xx(gpu)) {
> > > +             cfg->ubwc_swizzle =3D 0x6;
> > > +             cfg->highest_bank_bit =3D 15;
> > > +     }
> > >
> > >       if (adreno_is_a610(gpu)) {
> > >               cfg->highest_bank_bit =3D 13;
> > > @@ -818,7 +835,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *=
gpu)
> > >                 cfg->macrotile_mode);
> > >  }
> > >
> > > -static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
> > > +void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
> > >  {
> > >       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > >       struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > > @@ -868,7 +885,7 @@ static void a7xx_patch_pwrup_reglist(struct msm_g=
pu *gpu)
> > >       lock->dynamic_list_len =3D 0;
> > >  }
> > >
> > > -static int a7xx_preempt_start(struct msm_gpu *gpu)
> > > +int a7xx_preempt_start(struct msm_gpu *gpu)
> > >  {
> > >       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > >       struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > > @@ -925,7 +942,7 @@ static int a6xx_cp_init(struct msm_gpu *gpu)
> > >       return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
> > >  }
> > >
> > > -static int a7xx_cp_init(struct msm_gpu *gpu)
> > > +int a7xx_cp_init(struct msm_gpu *gpu)
> > >  {
> > >       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > >       struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > > @@ -993,7 +1010,7 @@ static bool a6xx_ucode_check_version(struct a6xx=
_gpu *a6xx_gpu,
> > >               return false;
> > >
> > >       /* A7xx is safe! */
> > > -     if (adreno_is_a7xx(adreno_gpu) || adreno_is_a702(adreno_gpu))
> > > +     if (adreno_is_a7xx(adreno_gpu) || adreno_is_a702(adreno_gpu) ||=
 adreno_is_a8xx(adreno_gpu))
> > >               return true;
> > >
> > >       /*
> > > @@ -2161,7 +2178,7 @@ void a6xx_bus_clear_pending_transactions(struct=
 adreno_gpu *adreno_gpu, bool gx_
> > >  void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert)
> > >  {
> > >       /* 11nm chips (e.g. ones with A610) have hw issues with the res=
et line! */
> > > -     if (adreno_is_a610(to_adreno_gpu(gpu)))
> > > +     if (adreno_is_a610(to_adreno_gpu(gpu)) || adreno_is_a8xx(to_adr=
eno_gpu(gpu)))
> > >               return;
> > >
> > >       gpu_write(gpu, REG_A6XX_RBBM_SW_RESET_CMD, assert);
> > > @@ -2192,7 +2209,12 @@ static int a6xx_gmu_pm_resume(struct msm_gpu *=
gpu)
> > >
> > >       msm_devfreq_resume(gpu);
> > >
> > > -     adreno_is_a7xx(adreno_gpu) ? a7xx_llc_activate(a6xx_gpu) : a6xx=
_llc_activate(a6xx_gpu);
> > > +     if (adreno_is_a8xx(adreno_gpu))
> > > +             a8xx_llc_activate(a6xx_gpu);
> > > +     else if (adreno_is_a7xx(adreno_gpu))
> > > +             a7xx_llc_activate(a6xx_gpu);
> > > +     else
> > > +             a6xx_llc_activate(a6xx_gpu);
> > >
> > >       return ret;
> > >  }
> > > @@ -2561,10 +2583,8 @@ static struct msm_gpu *a6xx_gpu_init(struct dr=
m_device *dev)
> > >       adreno_gpu->base.hw_apriv =3D
> > >               !!(config->info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
> > >
> > > -     /* gpu->info only gets assigned in adreno_gpu_init() */
> > > -     is_a7xx =3D config->info->family =3D=3D ADRENO_7XX_GEN1 ||
> > > -               config->info->family =3D=3D ADRENO_7XX_GEN2 ||
> > > -               config->info->family =3D=3D ADRENO_7XX_GEN3;
> > > +     /* gpu->info only gets assigned in adreno_gpu_init(). A8x is in=
cluded intentionally */
> > > +     is_a7xx =3D config->info->family >=3D ADRENO_7XX_GEN1;
> >
> > Is A8xx also a part of is_a7xx? What about the A9XX which will come at
> > some point in future?
> >
> > >
> > >       a6xx_llc_slices_init(pdev, a6xx_gpu, is_a7xx);
> > >
> > > +
> > > +int a8xx_gpu_feature_probe(struct msm_gpu *gpu)
> > > +{
> > > +     struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > > +     struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > > +     u32 fuse_val;
> > > +     int ret;
> > > +
> > > +     /*
> > > +      * Assume that if qcom scm isn't available, that whatever
> > > +      * replacement allows writing the fuse register ourselves.
> > > +      * Users of alternative firmware need to make sure this
> > > +      * register is writeable or indicate that it's not somehow.
> > > +      * Print a warning because if you mess this up you're about to
> > > +      * crash horribly.
> > > +      */
> > > +     if (!qcom_scm_is_available()) {
> >
> > How can it be not available here?
> >
> > > +             dev_warn_once(gpu->dev->dev,
> > > +                     "SCM is not available, poking fuse register\n")=
;
> > > +             a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE_VALUE=
,
> > > +                     A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> > > +                     A7XX_CX_MISC_SW_FUSE_VALUE_FASTBLEND |
> > > +                     A7XX_CX_MISC_SW_FUSE_VALUE_LPAC);
> > > +             adreno_gpu->has_ray_tracing =3D true;
> > > +             return 0;
> > > +     }
> > > +
> > > +     ret =3D qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ |
> > > +                                  QCOM_SCM_GPU_TSENSE_EN_REQ);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     /*
> > > +      * On a750 raytracing may be disabled by the firmware, find out
> >
> > It's a8xx-related code, why do you have a750 in the comment?
>
> This is actually related to >=3D a750..  from a brief look it seems like
> the whole fuse thing can be split into a helper and shared btwn
> a7xx/a8xx?

It seems like we can just reuse a7xx_cx_mem_init() with maybe some
slight changes to the generation check instead of copying and pasting
it here.

Connor

>
> BR,
> -R
>
> > > +      * whether that's the case. The scm call above sets the fuse
> > > +      * register.
> > > +      */
> > > +     fuse_val =3D a6xx_llc_read(a6xx_gpu,
> > > +                              REG_A7XX_CX_MISC_SW_FUSE_VALUE);
> > > +     adreno_gpu->has_ray_tracing =3D
> > > +             !!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +
> > > +#define GBIF_CLIENT_HALT_MASK                BIT(0)
> > > +#define GBIF_ARB_HALT_MASK           BIT(1)
> > > +#define VBIF_XIN_HALT_CTRL0_MASK     GENMASK(3, 0)
> > > +#define VBIF_RESET_ACK_MASK          0xF0
> > > +#define GPR0_GBIF_HALT_REQUEST               0x1E0
> > > +
> > > +void a8xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_g=
pu, bool gx_off)
> > > +{
> > > +     struct msm_gpu *gpu =3D &adreno_gpu->base;
> > > +
> > > +     if (gx_off) {
> > > +             /* Halt the gx side of GBIF */
> > > +             gpu_write(gpu, REG_A8XX_RBBM_GBIF_HALT, 1);
> > > +             spin_until(gpu_read(gpu, REG_A8XX_RBBM_GBIF_HALT_ACK) &=
 1);
> > > +     }
> > > +
> > > +     /* Halt new client requests on GBIF */
> > > +     gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_CLIENT_HALT_MASK);
> > > +     spin_until((gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK) &
> > > +                     (GBIF_CLIENT_HALT_MASK)) =3D=3D GBIF_CLIENT_HAL=
T_MASK);
> > > +
> > > +     /* Halt all AXI requests on GBIF */
> > > +     gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_ARB_HALT_MASK);
> > > +     spin_until((gpu_read(gpu,  REG_A6XX_GBIF_HALT_ACK) &
> > > +                     (GBIF_ARB_HALT_MASK)) =3D=3D GBIF_ARB_HALT_MASK=
);
> > > +
> > > +     /* The GBIF halt needs to be explicitly cleared */
> > > +     gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
> > > +}
> > > +
> > > +int a8xx_gmu_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
> > > +{
> > > +     struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > > +     struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > > +
> > > +     mutex_lock(&a6xx_gpu->gmu.lock);
> > > +
> > > +     /* Force the GPU power on so we can read this register */
> > > +     a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
> > > +
> > > +     *value =3D gpu_read64(gpu, REG_A8XX_CP_ALWAYS_ON_COUNTER);
> > > +
> > > +     a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
> > > +
> > > +     mutex_unlock(&a6xx_gpu->gmu.lock);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +u64 a8xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rat=
e)
> > > +{
> > > +     struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > > +     struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > > +     u64 busy_cycles;
> > > +
> > > +     /* 19.2MHz */
> > > +     *out_sample_rate =3D 19200000;
> > > +
> > > +     busy_cycles =3D gmu_read64(&a6xx_gpu->gmu,
> > > +                     REG_A8XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_L,
> > > +                     REG_A8XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_H);
> > > +
> > > +     return busy_cycles;
> > > +}
> > > +
> > > +bool a8xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
> > > +{
> > > +     return true;
> > > +}
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/dr=
m/msm/adreno/adreno_gpu.h
> > > index 9831401c3bc865b803c2f9759d5e2ffcd79d19f8..6a2157f31122ba0c2f2a7=
005c98e3e4f1ada6acc 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > @@ -90,6 +90,13 @@ struct adreno_reglist {
> > >       u32 value;
> > >  };
> > >
> > > +/* Reglist with pipe information */
> > > +struct adreno_reglist_pipe {
> > > +     u32 offset;
> > > +     u32 value;
> > > +     u32 pipe;
> > > +};
> > > +
> > >  struct adreno_speedbin {
> > >       uint16_t fuse;
> > >       uint16_t speedbin;
> > > diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/=
gpu/drm/msm/registers/adreno/a6xx.xml
> > > index ddde2e03b748f447b5e57571e2b04c68f8f2efc2..c3a202c8dce65d414c89b=
f76f1cb458b206b4eca 100644
> > > --- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
> > > +++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
> > > @@ -4876,7 +4876,6 @@ by a particular renderpass/blit.
> > >  <domain name=3D"A6XX_CX_MISC" width=3D"32" prefix=3D"variant" varset=
=3D"chip">
> > >       <reg32 offset=3D"0x0001" name=3D"SYSTEM_CACHE_CNTL_0"/>
> > >       <reg32 offset=3D"0x0002" name=3D"SYSTEM_CACHE_CNTL_1"/>
> > > -     <reg32 offset=3D"0x0087" name=3D"SLICE_ENABLE_FINAL" variants=
=3D"A8XX-"/>
> >
> > Why?
> >
> > >       <reg32 offset=3D"0x0039" name=3D"CX_MISC_TCM_RET_CNTL" variants=
=3D"A7XX-"/>
> > >       <reg32 offset=3D"0x0087" name=3D"CX_MISC_SLICE_ENABLE_FINAL" va=
riants=3D"A8XX"/>
> > >       <reg32 offset=3D"0x0400" name=3D"CX_MISC_SW_FUSE_VALUE" variant=
s=3D"A7XX-">
> > > diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml b/driv=
ers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
> > > index 5dce7934056dd6472c368309b4894f0ed4a4d960..c4e00b1263cda65dce89c=
2f16860e5bf6f1c6244 100644
> > > --- a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
> > > +++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
> > > @@ -60,6 +60,7 @@ xsi:schemaLocation=3D"https://gitlab.freedesktop.or=
g/freedreno/ rules-fd.xsd">
> > >       <reg32 offset=3D"0x1f400" name=3D"GMU_ICACHE_CONFIG"/>
> > >       <reg32 offset=3D"0x1f401" name=3D"GMU_DCACHE_CONFIG"/>
> > >       <reg32 offset=3D"0x1f40f" name=3D"GMU_SYS_BUS_CONFIG"/>
> > > +     <reg32 offset=3D"0x1f50b" name=3D"GMU_MRC_GBIF_QOS_CTRL"/>
> > >       <reg32 offset=3D"0x1f800" name=3D"GMU_CM3_SYSRESET"/>
> > >       <reg32 offset=3D"0x1f801" name=3D"GMU_CM3_BOOT_CONFIG"/>
> > >       <reg32 offset=3D"0x1f81a" name=3D"GMU_CM3_FW_BUSY"/>
> > >
> > > --
> > > 2.51.0
> > >
> >
> > --
> > With best wishes
> > Dmitry
