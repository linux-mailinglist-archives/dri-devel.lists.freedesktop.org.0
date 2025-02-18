Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C27A3A543
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 19:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D37E10E06C;
	Tue, 18 Feb 2025 18:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CcovgIvJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E6110E021;
 Tue, 18 Feb 2025 18:23:11 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-3cfce97a3d9so19124095ab.2; 
 Tue, 18 Feb 2025 10:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739902991; x=1740507791; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z21PGtMoKOkP6/rqvgbqZXruaILXexhwG8Q6wG3Y9zo=;
 b=CcovgIvJ+DuWx+XYYuJpxEFpS9VVhwaAMgg1fx4dfEc9ERJ6e4FtCDV8dOzw7Rbc8Q
 O7HUe2BXrTH2Qa7eck4x+0IUikQZRX8wavAecOwlQ+Ci6Z1NZrTNgEGowqhOFiGePyN4
 bwX1hODQ864p/J4giRa4DdVmcDgszQZRY48tDCpeYTB0CnJDVUcXy8A9dp/nPeaBZlFX
 VGBggoflzLRzaqa7rO5YQbL9oazqvs8uIdq8K+nAXCCMbkTVheWwDY8dZG7cUOhQnjRO
 WkQvbAqAbNfocstzaa0pamX0MLQ3ANYYAdPvZ0TvBSCm17WAH7PtEWLOHMEXAzcCscSR
 bFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739902991; x=1740507791;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z21PGtMoKOkP6/rqvgbqZXruaILXexhwG8Q6wG3Y9zo=;
 b=U0ID2pMbwJW4gB/jS530qn4Wxn3AV2ap9Zc2buraDwqhPHb6tDM/3vtMaeAhB+nf10
 AUULx/2d/rjFxm/LdIJ3PS0kp1Dhg/Eu473OrhG2V94kwP5PKjqI7dcgAtNoIBQXLKRu
 SGg7ttkW3ttVhjfUSl9MHuLlVUahfgUtTIrdL8du9LcWdukBK0j5Vbqwh/ikMgaxCxU9
 kQsHvuAfrTgGMjFvNVj1rnGyfPHhowGXKY6wu76VDW/6PVNVeYecoEkitXCT9vtWM6dM
 rWTR3c5rtqJS9KKw8/VabVqyS/QaZGo94hFzD+Sj/EBZUGi1I0aJqdG3EvWGk7omw/t8
 kmtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX272Wv/wx8howD0xvoMgpaP6Yv8W7mzUf4VJD0emRPZzxBXCPyl0opJxSLaAtOc4rJD6TL+uEU2Plz@lists.freedesktop.org,
 AJvYcCXfPT278cJOvvxyckpcfX+1LkH/0+GQZaCSTVZ4ooLHOlXKCIfV5bv37ZvAEXM0bfSxCQFTGnqCxqY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySuxrXm0w3l5MfzJVy4PtE7bdonAjvB1S5XeB4E94+YzsLQf2O
 fxGIx/+gY1Vm5evsO4F7pflKM9vDKfexXWhzY74kq9PE9lq2nTj7QQyHgLHRemO/9Qhka8n13Vs
 59kR5Eaz5HYiz43Be6HiTHu9C1N8=
X-Gm-Gg: ASbGncvPBQ+z52WBoAk3HABSHRvHgdnOluc5DyWViOnkfh3bX6iBjRFWAPIWQe4PKbC
 itZORsOgS4Q2y0dvpDGjaLJRnAeg+P6cbSRadF6ueq98WW20XQYKjh8BZQx75QCBb1hvNrWzNts
 UVkn7kwXdjo9d/XfpyKDfmMAdyZ64=
X-Google-Smtp-Source: AGHT+IH6m+3JpSoefsz/wCPh++hcK26qXs4lJwUORXK0FJ65ByGufreIwlwfoIgDMMvRpdHdGUsMMLBHV/pse5FopSc=
X-Received: by 2002:a05:6e02:20c7:b0:3d1:883c:6e84 with SMTP id
 e9e14a558f8ab-3d2807b9b5fmr128847205ab.8.1739902991169; Tue, 18 Feb 2025
 10:23:11 -0800 (PST)
MIME-Version: 1.0
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
 <20250213-a623-gpu-support-v1-1-993c65c39fd2@quicinc.com>
In-Reply-To: <20250213-a623-gpu-support-v1-1-993c65c39fd2@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 18 Feb 2025 10:22:59 -0800
X-Gm-Features: AWEUYZnNPg2AfVlGCXj9pinFkd16J3E28yQ3KeG-PhyvgCV6j8swgW1l6ohQvEk
Message-ID: <CAF6AEGvDR1md6D2dnqJWOW5v3t2wnaC29VD1fyX5q48bzqEkHQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/msm/a6xx: Fix gpucc register block for A621
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jie Zhang <quic_jiezh@quicinc.com>, Rob Clark <robdclark@chromium.org>
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

On Thu, Feb 13, 2025 at 8:10=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> From: Jie Zhang <quic_jiezh@quicinc.com>
>
> Adreno 621 has a different memory map for GPUCC block. So update
> a6xx_gpu_state code to dump the correct set of gpucc registers.
>
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 13 ++++++++++---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 17 +++++++++++++++++
>  2 files changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/dr=
m/msm/adreno/a6xx_gpu_state.c
> index 0fcae53c0b14..2c10474ccc95 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -1214,12 +1214,12 @@ static void a6xx_get_gmu_registers(struct msm_gpu=
 *gpu,
>         struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
>
>         a6xx_state->gmu_registers =3D state_kcalloc(a6xx_state,
> -               3, sizeof(*a6xx_state->gmu_registers));
> +               4, sizeof(*a6xx_state->gmu_registers));
>
>         if (!a6xx_state->gmu_registers)
>                 return;
>
> -       a6xx_state->nr_gmu_registers =3D 3;
> +       a6xx_state->nr_gmu_registers =3D 4;

nit, this and splitting out a6xx_gpucc_reg from a6xx_gmu_cx_registers
could probably be it's own commit

BR,
-R

>
>         /* Get the CX GMU registers from AHB */
>         _a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[0],
> @@ -1227,6 +1227,13 @@ static void a6xx_get_gmu_registers(struct msm_gpu =
*gpu,
>         _a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[1],
>                 &a6xx_state->gmu_registers[1], true);
>
> +       if (adreno_is_a621(adreno_gpu))
> +               _a6xx_get_gmu_registers(gpu, a6xx_state, &a621_gpucc_reg,
> +                       &a6xx_state->gmu_registers[2], false);
> +       else
> +               _a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gpucc_reg,
> +                       &a6xx_state->gmu_registers[2], false);
> +
>         if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
>                 return;
>
> @@ -1234,7 +1241,7 @@ static void a6xx_get_gmu_registers(struct msm_gpu *=
gpu,
>         gpu_write(gpu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
>
>         _a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[2],
> -               &a6xx_state->gmu_registers[2], false);
> +               &a6xx_state->gmu_registers[3], false);
>  }
>
>  static struct msm_gpu_state_bo *a6xx_snapshot_gmu_bo(
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/dr=
m/msm/adreno/a6xx_gpu_state.h
> index dd4c28a8d923..e545106c70be 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
> @@ -363,6 +363,9 @@ static const u32 a6xx_gmu_cx_registers[] =3D {
>         0x51e0, 0x51e2, 0x51f0, 0x51f0, 0x5200, 0x5201,
>         /* GMU AO */
>         0x9300, 0x9316, 0x9400, 0x9400,
> +};
> +
> +static const u32 a6xx_gmu_gpucc_registers[] =3D {
>         /* GPU CC */
>         0x9800, 0x9812, 0x9840, 0x9852, 0x9c00, 0x9c04, 0x9c07, 0x9c0b,
>         0x9c15, 0x9c1c, 0x9c1e, 0x9c2d, 0x9c3c, 0x9c3d, 0x9c3f, 0x9c40,
> @@ -373,6 +376,17 @@ static const u32 a6xx_gmu_cx_registers[] =3D {
>         0xbc00, 0xbc16, 0xbc20, 0xbc27,
>  };
>
> +static const u32 a621_gmu_gpucc_registers[] =3D {
> +       /* GPU CC */
> +       0x9800, 0x980e, 0x9c00, 0x9c0e, 0xb000, 0xb004, 0xb400, 0xb404,
> +       0xb800, 0xb804, 0xbc00, 0xbc05, 0xbc14, 0xbc1d, 0xbc2a, 0xbc30,
> +       0xbc32, 0xbc32, 0xbc41, 0xbc55, 0xbc66, 0xbc68, 0xbc78, 0xbc7a,
> +       0xbc89, 0xbc8a, 0xbc9c, 0xbc9e, 0xbca0, 0xbca3, 0xbcb3, 0xbcb5,
> +       0xbcc5, 0xbcc7, 0xbcd6, 0xbcd8, 0xbce8, 0xbce9, 0xbcf9, 0xbcfc,
> +       0xbd0b, 0xbd0c, 0xbd1c, 0xbd1e, 0xbd40, 0xbd70, 0xbe00, 0xbe16,
> +       0xbe20, 0xbe2d,
> +};
> +
>  static const u32 a6xx_gmu_cx_rscc_registers[] =3D {
>         /* GPU RSCC */
>         0x008c, 0x008c, 0x0101, 0x0102, 0x0340, 0x0342, 0x0344, 0x0347,
> @@ -386,6 +400,9 @@ static const struct a6xx_registers a6xx_gmu_reglist[]=
 =3D {
>         REGS(a6xx_gmu_gx_registers, 0, 0),
>  };
>
> +static const struct a6xx_registers a6xx_gpucc_reg =3D REGS(a6xx_gmu_gpuc=
c_registers, 0, 0);
> +static const struct a6xx_registers a621_gpucc_reg =3D REGS(a621_gmu_gpuc=
c_registers, 0, 0);
> +
>  static u32 a6xx_get_cp_roq_size(struct msm_gpu *gpu);
>  static u32 a7xx_get_cp_roq_size(struct msm_gpu *gpu);
>
>
> --
> 2.45.2
>
