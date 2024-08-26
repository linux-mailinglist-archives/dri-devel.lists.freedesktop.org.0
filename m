Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A62A695FB36
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 23:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0FC210E17C;
	Mon, 26 Aug 2024 21:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JU97ZDfJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A4910E15F;
 Mon, 26 Aug 2024 21:07:59 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5becc379f3fso5220723a12.3; 
 Mon, 26 Aug 2024 14:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724706478; x=1725311278; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J36/CymdnCHvVQ/2BT4x5qO1L0RUXRVdfDynGuZq2aY=;
 b=JU97ZDfJWQF3cYoQjhkyC9ZQrJDBhgCyjz5hs9EWpYtGF+yXLrX1YGT3wsn73IlqJN
 3cfgLeYL/6jBYlP/5075FucrwBa0aAk9PHeDL9hvtUnsHPEXGtqktGPMAW8cqn0wYVGb
 JbRdG4nok4+5T5OQ6SBfDahy2msFwYI2AQKIqkrSDN7bR4cqYIoDceuXYITpIagtL8hz
 Wc+6fbbKmo9Z3kt/Rbz9QSWxV/m84hDVavMCkmU+S5Yvg58Pnd7QTK61kXcGZM2yywqb
 zWqc+mpSMCna61XBaTST7wAdWgFGxgde8puXKqYQER445CEh1i4OgxZ1ORQglqi/EQDr
 NvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724706478; x=1725311278;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J36/CymdnCHvVQ/2BT4x5qO1L0RUXRVdfDynGuZq2aY=;
 b=h+5FhxnA0BRPITyxOE1zMC+kLv0cCtnbcpkKdylaJW0pOFzhkKqyLMhAFgTVnbthT2
 NZWTHACMOSLVqLbNMcCw+cfoA38RyVRM/z+GITdALcViUVZAw3p+egx2VprCI28IuxgW
 3v9IxYbLDOO4wG92X/liyIIYjxUh62uo3Wntna8+MsystcS68HGomNQeTTHnHePt82UY
 d9kkxLGjWEcFFVZs2jMXJmBuC1n2s+pOl3Xl4K0XHbnXIpZseEecAgOd3lXepRd+g46n
 nPwAFgQ6dhOm6uTKthtnoLPVcq0OLgDzToKZ6M+di2Qy9mhy1Y2Lk/v1bIhERaSNIOBw
 qtrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAJEckBavfoD48Hia3Gs/AEcGqSY0vX7OqFRTOzv+ZORi+r3k7bI9xt8ipjmdw1dV8Y5XN0/BeE9U=@lists.freedesktop.org,
 AJvYcCWgpiVTAy6WvQiQlfY2tPwVseajhCDcMsE7ldV5CjZOU0U8WOlZZJdlvPfnuE2/x/0+skEpqzU26dQ5@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjAPOmYN+kioMAirez2Hr6IZgbnhzGWa2O6VQt8YmVagmpP7Oc
 KikyI0zkv4PeqREn9brPnap/1DwfGM73c+6+z+LJootURlUUL/lwuuwclvD11bhNgwFupxvtrxo
 eOYRA1KHMDEbif8+o3Lpg0tV+kFg=
X-Google-Smtp-Source: AGHT+IHvzWvB0zVgjvHOKFOfr1EK93YvT8CI+D2/F1twYSa20wJDGiGGI9Ey5WbmGIclEHIdFQtSkdOB9KO4UVkNs8A=
X-Received: by 2002:a05:6402:3481:b0:57c:9d54:67db with SMTP id
 4fb4d7f45d1cf-5c0ba2ad84dmr504590a12.9.1724706476994; Mon, 26 Aug 2024
 14:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240719-topic-a621-v1-0-850ae5307cf4@linaro.org>
 <20240719-topic-a621-v1-3-850ae5307cf4@linaro.org>
In-Reply-To: <20240719-topic-a621-v1-3-850ae5307cf4@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 26 Aug 2024 14:07:44 -0700
Message-ID: <CAF6AEGs23d5OqKst+ik-kMMXPCS_0=-a8ndskv3j4NduOVR1Vw@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/msm/a6xx: Store gmu_cgc_mode in struct a6xx_info
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Marijn Suijten <marijn.suijten@somainline.org>,
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

On Fri, Jul 19, 2024 at 3:03=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> This was apparently almost never set on a6xx.. move the existing values
> and fill out the remaining ones within the catalog.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 19 ++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  6 ++----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>  3 files changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/=
msm/adreno/a6xx_catalog.c
> index 1ea535960f32..deee0b686962 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -448,7 +448,6 @@ static const struct adreno_reglist a690_hwcg[] =3D {
>         {REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
>         {REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
>         {REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
> -       {REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL, 0x20200},
>         {REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL, 0x10111},
>         {REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL, 0x5555},
>         {}
> @@ -636,6 +635,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
>                 .a6xx =3D &(const struct a6xx_info) {
>                         .hwcg =3D a612_hwcg,
>                         .protect =3D &a630_protect,
> +                       .gmu_cgc_mode =3D 0x00020202,
>                         .prim_fifo_threshold =3D 0x00080000,
>                 },
>                 /*
> @@ -668,6 +668,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
>                 .a6xx =3D &(const struct a6xx_info) {
>                         .hwcg =3D a615_hwcg,
>                         .protect =3D &a630_protect,
> +                       .gmu_cgc_mode =3D 0x00000222,
>                         .prim_fifo_threshold =3D 0x00180000,
>                 },
>                 .speedbins =3D ADRENO_SPEEDBINS(
> @@ -691,6 +692,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
>                 .init =3D a6xx_gpu_init,
>                 .a6xx =3D &(const struct a6xx_info) {
>                         .protect =3D &a630_protect,
> +                       .gmu_cgc_mode =3D 0x00000222,
>                         .prim_fifo_threshold =3D 0x00180000,
>                 },
>                 .speedbins =3D ADRENO_SPEEDBINS(
> @@ -714,6 +716,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
>                 .a6xx =3D &(const struct a6xx_info) {
>                         .hwcg =3D a615_hwcg,
>                         .protect =3D &a630_protect,
> +                       .gmu_cgc_mode =3D 0x00000222,
>                         .prim_fifo_threshold =3D 0x00018000,
>                 },
>                 .speedbins =3D ADRENO_SPEEDBINS(
> @@ -737,6 +740,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
>                 .a6xx =3D &(const struct a6xx_info) {
>                         .hwcg =3D a615_hwcg,
>                         .protect =3D &a630_protect,
> +                       .gmu_cgc_mode =3D 0x00000222,
>                         .prim_fifo_threshold =3D 0x00018000,
>                 },
>                 .speedbins =3D ADRENO_SPEEDBINS(
> @@ -760,6 +764,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
>                 .a6xx =3D &(const struct a6xx_info) {
>                         .hwcg =3D a615_hwcg,
>                         .protect =3D &a630_protect,
> +                       .gmu_cgc_mode =3D 0x00000222,
>                         .prim_fifo_threshold =3D 0x00018000,
>                 },
>                 .speedbins =3D ADRENO_SPEEDBINS(
> @@ -788,6 +793,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
>                 .a6xx =3D &(const struct a6xx_info) {
>                         .hwcg =3D a630_hwcg,
>                         .protect =3D &a630_protect,
> +                       .gmu_cgc_mode =3D 0x00020202,
>                         .prim_fifo_threshold =3D 0x00180000,
>                 },
>         }, {
> @@ -806,6 +812,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
>                 .a6xx =3D &(const struct a6xx_info) {
>                         .hwcg =3D a640_hwcg,
>                         .protect =3D &a630_protect,
> +                       .gmu_cgc_mode =3D 0x00020202,
>                         .prim_fifo_threshold =3D 0x00180000,
>                 },
>                 .speedbins =3D ADRENO_SPEEDBINS(
> @@ -829,6 +836,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
>                 .a6xx =3D &(const struct a6xx_info) {
>                         .hwcg =3D a650_hwcg,
>                         .protect =3D &a650_protect,
> +                       .gmu_cgc_mode =3D 0x00020202,
>                         .prim_fifo_threshold =3D 0x00300200,
>                 },
>                 .address_space_size =3D SZ_16G,
> @@ -855,6 +863,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
>                 .a6xx =3D &(const struct a6xx_info) {
>                         .hwcg =3D a660_hwcg,
>                         .protect =3D &a660_protect,
> +                       .gmu_cgc_mode =3D 0x00020000,
>                         .prim_fifo_threshold =3D 0x00300200,
>                 },
>                 .address_space_size =3D SZ_16G,
> @@ -874,6 +883,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
>                 .a6xx =3D &(const struct a6xx_info) {
>                         .hwcg =3D a660_hwcg,
>                         .protect =3D &a660_protect,
> +                       .gmu_cgc_mode =3D 0x00020202,
>                         .prim_fifo_threshold =3D 0x00200200,
>                 },
>                 .address_space_size =3D SZ_16G,
> @@ -899,6 +909,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
>                 .a6xx =3D &(const struct a6xx_info) {
>                         .hwcg =3D a640_hwcg,
>                         .protect =3D &a630_protect,
> +                       .gmu_cgc_mode =3D 0x00020202,
>                         .prim_fifo_threshold =3D 0x00200200,
>                 },
>         }, {
> @@ -917,6 +928,7 @@ static const struct adreno_info a6xx_gpus[] =3D {
>                 .a6xx =3D &(const struct a6xx_info) {
>                         .hwcg =3D a690_hwcg,
>                         .protect =3D &a690_protect,
> +                       .gmu_cgc_mode =3D 0x00020200,
>                         .prim_fifo_threshold =3D 0x00800200,
>                 },
>                 .address_space_size =3D SZ_16G,
> @@ -1178,6 +1190,7 @@ static const struct adreno_info a7xx_gpus[] =3D {
>                 .a6xx =3D &(const struct a6xx_info) {
>                         .hwcg =3D a702_hwcg,
>                         .protect =3D &a650_protect,
> +                       .gmu_cgc_mode =3D 0x00020202,
>                         .prim_fifo_threshold =3D 0x0000c000,
>                 },
>                 .speedbins =3D ADRENO_SPEEDBINS(
> @@ -1202,6 +1215,7 @@ static const struct adreno_info a7xx_gpus[] =3D {
>                 .a6xx =3D &(const struct a6xx_info) {
>                         .hwcg =3D a730_hwcg,
>                         .protect =3D &a730_protect,
> +                       .gmu_cgc_mode =3D 0x00020000,
>                 },
>                 .address_space_size =3D SZ_16G,
>         }, {
> @@ -1221,6 +1235,7 @@ static const struct adreno_info a7xx_gpus[] =3D {
>                         .hwcg =3D a740_hwcg,
>                         .protect =3D &a730_protect,
>                         .gmu_chipid =3D 0x7020100,
> +                       .gmu_cgc_mode =3D 0x00020202,
>                 },
>                 .address_space_size =3D SZ_16G,
>         }, {
> @@ -1239,6 +1254,7 @@ static const struct adreno_info a7xx_gpus[] =3D {
>                         .hwcg =3D a740_hwcg,
>                         .protect =3D &a730_protect,
>                         .gmu_chipid =3D 0x7050001,
> +                       .gmu_cgc_mode =3D 0x00020202,
>                 },
>                 .address_space_size =3D SZ_256G,
>         }, {
> @@ -1257,6 +1273,7 @@ static const struct adreno_info a7xx_gpus[] =3D {
>                 .a6xx =3D &(const struct a6xx_info) {
>                         .protect =3D &a730_protect,
>                         .gmu_chipid =3D 0x7090100,
> +                       .gmu_cgc_mode =3D 0x00020202,
>                 },
>                 .address_space_size =3D SZ_16G,
>         }
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index aaeb1161f90d..871452daa189 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -402,7 +402,7 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool s=
tate)
>         struct a6xx_gmu *gmu =3D &a6xx_gpu->gmu;
>         const struct adreno_reglist *reg;
>         unsigned int i;
> -       u32 val, clock_cntl_on, cgc_mode;
> +       u32 val, clock_cntl_on;
>
>         if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu))=
)
>                 return;
> @@ -417,10 +417,8 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool =
state)
>                 clock_cntl_on =3D 0x8aa8aa82;
>
>         if (adreno_is_a7xx(adreno_gpu)) {
> -               cgc_mode =3D adreno_is_a740_family(adreno_gpu) ? 0x20222 =
: 0x20000;
> -

This does appear to change the gmu_cgc_mode in nearly all cases.. was
this intended?

BR,
-R

>                 gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MOD=
E_CNTL,
> -                         state ? cgc_mode : 0);
> +                         state ? adreno_gpu->info->a6xx->gmu_cgc_mode : =
0);
>                 gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_DEL=
AY_CNTL,
>                           state ? 0x10111 : 0);
>                 gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_HYS=
T_CNTL,
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.h
> index bc37bd8c7f65..0fb7febf70e7 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -22,6 +22,7 @@ struct a6xx_info {
>         const struct adreno_reglist *hwcg;
>         const struct adreno_protect *protect;
>         u32 gmu_chipid;
> +       u32 gmu_cgc_mode;
>         u32 prim_fifo_threshold;
>  };
>
>
> --
> 2.45.2
>
