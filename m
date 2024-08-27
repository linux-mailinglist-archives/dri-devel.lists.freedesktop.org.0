Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 148BB961862
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 22:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B7210E419;
	Tue, 27 Aug 2024 20:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lt1jz+M0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355C210E3D8;
 Tue, 27 Aug 2024 20:13:02 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-58ef19aa69dso6163175a12.3; 
 Tue, 27 Aug 2024 13:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724789580; x=1725394380; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E1kAFeRUUkUPzf8j/TTAdVevnQF3KbzgNDiHDcBMBag=;
 b=lt1jz+M0jGSjZ3LmwzglE/7A3bPpQ1+hTtbGDL5xMM03hgwczQooan99TcZlb+GMhs
 keIlxsdM6HYm4jBBjZPBGSrw/u0D3Lg/sNFi8Xk1zGFO06O8FLZiegNFVQsm2ls+lw8+
 2ZqgApgQ5M0INQq+0dzXdpKvrxKuwNDfdEGmSdhpNTqRjy8OokM2Wwwb84KqfoqsRCvp
 cfGq0O3RXxHzTEUNdoI8ZW7Y0xkXAB36VlCBAImiB6pg0tDX9YfRr4aFpaTZ7RaxzFTI
 RjOsgcLBNFChT7BOqguhYlAcLZY42Pl8nduztxrYfWhkKdybpcO4IzmnDv6o/nWHZxzh
 WTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724789580; x=1725394380;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E1kAFeRUUkUPzf8j/TTAdVevnQF3KbzgNDiHDcBMBag=;
 b=rPcpiBFbhTg52K0+QOcR+Y39KssjBdA6nI9LWYNF9p9z10AbrFj5HjzyEjo5Z15nB2
 mFS5wad5AR3IDTEm0DzgeqnzUY/VUv5+Yih3cml+Mj7qOiisTivrTf2cqtKCwuZyc19y
 +5pa811MiNZuksrhD8ONInarDjpzmsGnhMoxQcK6Cb/jMtCwY7gFTQFYtB/xNc62bGLp
 RN9NeIDNKvueKHVwahMRrLh2vhKfjpjBBIqoxPQB+MJt2EAGJtC/6B+zsbFnd7zHgQxN
 l+8jxgIbMCTlOqnUX6as1VXvK/KL9BDn0i/WgRtil+ueUpUXnBhPfyDWvTBBgfuPPE0r
 csbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOTJUJt7AXCxwQMETmdSmWNbRzFb90bu/OFhqpve0WtRIpNh9QVp9GhAQ/ATNFwz60dtiNZUofn2s=@lists.freedesktop.org,
 AJvYcCXuqKJFN25EJfTnrTMq+YaL+4yLAA//s1s2B/K4Su9fMX6QYmyIzana4HKbQzO2UhCn1uZJmLUR08qu@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKRkZYRarLWqDWWj5WaLHuwhORO/EK+dHGCQ9sEuSvGd5lVzVM
 oVR1X6YBSI681ziAhZXnG7aEvuMK8IjZQQ6g7hnv58EHyXew+zJml91hTYez99P70IrzjaB0E/S
 e5RsKcMUuQanJhmEpSLyYoZOiyVU=
X-Google-Smtp-Source: AGHT+IGMI7VsfWj2s/nh8dIO8bCfxyCvIeFS2NNKFnpFkfgacirB/qC+VqtaTXNOHdp3SxPr2sC7wtA48oijoRclV6Y=
X-Received: by 2002:a05:6402:3550:b0:5c0:9fca:9352 with SMTP id
 4fb4d7f45d1cf-5c09fca944emr5418717a12.36.1724789579939; Tue, 27 Aug 2024
 13:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240719-topic-a621-v1-0-850ae5307cf4@linaro.org>
 <20240719-topic-a621-v1-3-850ae5307cf4@linaro.org>
 <CAF6AEGs23d5OqKst+ik-kMMXPCS_0=-a8ndskv3j4NduOVR1Vw@mail.gmail.com>
 <CAF6AEGuB5oB6RZLk+PfYMTV8ybboJymcvzJVu9ByHdu=KyvV+w@mail.gmail.com>
In-Reply-To: <CAF6AEGuB5oB6RZLk+PfYMTV8ybboJymcvzJVu9ByHdu=KyvV+w@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 27 Aug 2024 13:12:47 -0700
Message-ID: <CAF6AEGtkikykNKHz0905HZ4FOJYieO5R3jr6-OO8QLYqok25BA@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/msm/a6xx: Store gmu_cgc_mode in struct a6xx_info
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
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

resending with updated Konrad email addr

On Mon, Aug 26, 2024 at 2:09=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Mon, Aug 26, 2024 at 2:07=E2=80=AFPM Rob Clark <robdclark@gmail.com> w=
rote:
> >
> > On Fri, Jul 19, 2024 at 3:03=E2=80=AFAM Konrad Dybcio <konrad.dybcio@li=
naro.org> wrote:
> > >
> > > This was apparently almost never set on a6xx.. move the existing valu=
es
> > > and fill out the remaining ones within the catalog.
> > >
> > > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 19 ++++++++++++++++++-
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  6 ++----
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
> > >  3 files changed, 21 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/=
drm/msm/adreno/a6xx_catalog.c
> > > index 1ea535960f32..deee0b686962 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > > @@ -448,7 +448,6 @@ static const struct adreno_reglist a690_hwcg[] =
=3D {
> > >         {REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
> > >         {REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
> > >         {REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
> > > -       {REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL, 0x20200},
> > >         {REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL, 0x10111},
> > >         {REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL, 0x5555},
> > >         {}
> > > @@ -636,6 +635,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a612_hwcg,
> > >                         .protect =3D &a630_protect,
> > > +                       .gmu_cgc_mode =3D 0x00020202,
> > >                         .prim_fifo_threshold =3D 0x00080000,
> > >                 },
> > >                 /*
> > > @@ -668,6 +668,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a615_hwcg,
> > >                         .protect =3D &a630_protect,
> > > +                       .gmu_cgc_mode =3D 0x00000222,
> > >                         .prim_fifo_threshold =3D 0x00180000,
> > >                 },
> > >                 .speedbins =3D ADRENO_SPEEDBINS(
> > > @@ -691,6 +692,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> > >                 .init =3D a6xx_gpu_init,
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .protect =3D &a630_protect,
> > > +                       .gmu_cgc_mode =3D 0x00000222,
> > >                         .prim_fifo_threshold =3D 0x00180000,
> > >                 },
> > >                 .speedbins =3D ADRENO_SPEEDBINS(
> > > @@ -714,6 +716,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a615_hwcg,
> > >                         .protect =3D &a630_protect,
> > > +                       .gmu_cgc_mode =3D 0x00000222,
> > >                         .prim_fifo_threshold =3D 0x00018000,
> > >                 },
> > >                 .speedbins =3D ADRENO_SPEEDBINS(
> > > @@ -737,6 +740,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a615_hwcg,
> > >                         .protect =3D &a630_protect,
> > > +                       .gmu_cgc_mode =3D 0x00000222,
> > >                         .prim_fifo_threshold =3D 0x00018000,
> > >                 },
> > >                 .speedbins =3D ADRENO_SPEEDBINS(
> > > @@ -760,6 +764,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a615_hwcg,
> > >                         .protect =3D &a630_protect,
> > > +                       .gmu_cgc_mode =3D 0x00000222,
> > >                         .prim_fifo_threshold =3D 0x00018000,
> > >                 },
> > >                 .speedbins =3D ADRENO_SPEEDBINS(
> > > @@ -788,6 +793,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a630_hwcg,
> > >                         .protect =3D &a630_protect,
> > > +                       .gmu_cgc_mode =3D 0x00020202,
> > >                         .prim_fifo_threshold =3D 0x00180000,
> > >                 },
> > >         }, {
> > > @@ -806,6 +812,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a640_hwcg,
> > >                         .protect =3D &a630_protect,
> > > +                       .gmu_cgc_mode =3D 0x00020202,
> > >                         .prim_fifo_threshold =3D 0x00180000,
> > >                 },
> > >                 .speedbins =3D ADRENO_SPEEDBINS(
> > > @@ -829,6 +836,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a650_hwcg,
> > >                         .protect =3D &a650_protect,
> > > +                       .gmu_cgc_mode =3D 0x00020202,
> > >                         .prim_fifo_threshold =3D 0x00300200,
> > >                 },
> > >                 .address_space_size =3D SZ_16G,
> > > @@ -855,6 +863,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a660_hwcg,
> > >                         .protect =3D &a660_protect,
> > > +                       .gmu_cgc_mode =3D 0x00020000,
> > >                         .prim_fifo_threshold =3D 0x00300200,
> > >                 },
> > >                 .address_space_size =3D SZ_16G,
> > > @@ -874,6 +883,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a660_hwcg,
> > >                         .protect =3D &a660_protect,
> > > +                       .gmu_cgc_mode =3D 0x00020202,
> > >                         .prim_fifo_threshold =3D 0x00200200,
> > >                 },
> > >                 .address_space_size =3D SZ_16G,
> > > @@ -899,6 +909,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a640_hwcg,
> > >                         .protect =3D &a630_protect,
> > > +                       .gmu_cgc_mode =3D 0x00020202,
> > >                         .prim_fifo_threshold =3D 0x00200200,
> > >                 },
> > >         }, {
> > > @@ -917,6 +928,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a690_hwcg,
> > >                         .protect =3D &a690_protect,
> > > +                       .gmu_cgc_mode =3D 0x00020200,
> > >                         .prim_fifo_threshold =3D 0x00800200,
> > >                 },
> > >                 .address_space_size =3D SZ_16G,
> > > @@ -1178,6 +1190,7 @@ static const struct adreno_info a7xx_gpus[] =3D=
 {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a702_hwcg,
> > >                         .protect =3D &a650_protect,
> > > +                       .gmu_cgc_mode =3D 0x00020202,
> > >                         .prim_fifo_threshold =3D 0x0000c000,
> > >                 },
> > >                 .speedbins =3D ADRENO_SPEEDBINS(
> > > @@ -1202,6 +1215,7 @@ static const struct adreno_info a7xx_gpus[] =3D=
 {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .hwcg =3D a730_hwcg,
> > >                         .protect =3D &a730_protect,
> > > +                       .gmu_cgc_mode =3D 0x00020000,
> > >                 },
> > >                 .address_space_size =3D SZ_16G,
> > >         }, {
> > > @@ -1221,6 +1235,7 @@ static const struct adreno_info a7xx_gpus[] =3D=
 {
> > >                         .hwcg =3D a740_hwcg,
> > >                         .protect =3D &a730_protect,
> > >                         .gmu_chipid =3D 0x7020100,
> > > +                       .gmu_cgc_mode =3D 0x00020202,
> > >                 },
> > >                 .address_space_size =3D SZ_16G,
> > >         }, {
> > > @@ -1239,6 +1254,7 @@ static const struct adreno_info a7xx_gpus[] =3D=
 {
> > >                         .hwcg =3D a740_hwcg,
> > >                         .protect =3D &a730_protect,
> > >                         .gmu_chipid =3D 0x7050001,
> > > +                       .gmu_cgc_mode =3D 0x00020202,
> > >                 },
> > >                 .address_space_size =3D SZ_256G,
> > >         }, {
> > > @@ -1257,6 +1273,7 @@ static const struct adreno_info a7xx_gpus[] =3D=
 {
> > >                 .a6xx =3D &(const struct a6xx_info) {
> > >                         .protect =3D &a730_protect,
> > >                         .gmu_chipid =3D 0x7090100,
> > > +                       .gmu_cgc_mode =3D 0x00020202,
> > >                 },
> > >                 .address_space_size =3D SZ_16G,
> > >         }
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/=
msm/adreno/a6xx_gpu.c
> > > index aaeb1161f90d..871452daa189 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > @@ -402,7 +402,7 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bo=
ol state)
> > >         struct a6xx_gmu *gmu =3D &a6xx_gpu->gmu;
> > >         const struct adreno_reglist *reg;
> > >         unsigned int i;
> > > -       u32 val, clock_cntl_on, cgc_mode;
> > > +       u32 val, clock_cntl_on;
> > >
> > >         if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_g=
pu)))
> > >                 return;
> > > @@ -417,10 +417,8 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, b=
ool state)
> > >                 clock_cntl_on =3D 0x8aa8aa82;
> > >
> > >         if (adreno_is_a7xx(adreno_gpu)) {
> > > -               cgc_mode =3D adreno_is_a740_family(adreno_gpu) ? 0x20=
222 : 0x20000;
> > > -
> >
> > This does appear to change the gmu_cgc_mode in nearly all cases.. was
> > this intended?
>
> Hmm, and this will only get written for a7xx, so we're dropping the
> reg write for a690..
>
> > BR,
> > -R
> >
> > >                 gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC=
_MODE_CNTL,
> > > -                         state ? cgc_mode : 0);
> > > +                         state ? adreno_gpu->info->a6xx->gmu_cgc_mod=
e : 0);
> > >                 gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC=
_DELAY_CNTL,
> > >                           state ? 0x10111 : 0);
> > >                 gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC=
_HYST_CNTL,
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/=
msm/adreno/a6xx_gpu.h
> > > index bc37bd8c7f65..0fb7febf70e7 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > > @@ -22,6 +22,7 @@ struct a6xx_info {
> > >         const struct adreno_reglist *hwcg;
> > >         const struct adreno_protect *protect;
> > >         u32 gmu_chipid;
> > > +       u32 gmu_cgc_mode;
> > >         u32 prim_fifo_threshold;
> > >  };
> > >
> > >
> > > --
> > > 2.45.2
> > >
