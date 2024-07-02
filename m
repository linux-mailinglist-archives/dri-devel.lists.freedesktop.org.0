Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2A49240F4
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 16:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A231410E29E;
	Tue,  2 Jul 2024 14:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OOZK8Mct";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67ABE10E29E;
 Tue,  2 Jul 2024 14:31:54 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5854ac817afso2051213a12.2; 
 Tue, 02 Jul 2024 07:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719930713; x=1720535513; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m6zM5tU5QFFmVWuSFqhyuiK14HA9L2zMcB50VIIzdJo=;
 b=OOZK8McterZo29FWKOqUx3zG0lCCm0WtD0bI8KJCjQ2IUpESuAjxtAXp9h6g1dYQv7
 j64GYQvRws+qAUiu0ksoX+nCzoSYpckspVFJd2VrqMmcy5gQ+wSTN6TbOnrynG6+RbJO
 PvqSj3uglYdV3SG+BNlkwoogmpaocgf+zQHA0GhK265gLt91TTQGND6cmmkB35n09/kC
 lwv5HWjDRh8y5Bl868L8lijGXnVHtzvt1yJ57+sMSaK8pFqyCiYUvAkJ5DHBrmNpBfPx
 deH/oWjuQ/mIH+evWN3YkYdrAKhc9cneo0Gs487PE29TCi8dR4pxPoLx2xfRuDUMCCCN
 MDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719930713; x=1720535513;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m6zM5tU5QFFmVWuSFqhyuiK14HA9L2zMcB50VIIzdJo=;
 b=qHknIXEsY6XpW7sV/rPBVkT38BDx564nNpdVEL5rApyjWRFmxjUzrj69uOTWHzuUwc
 YbOWjo1Usf7uVp7VKDHl0KpE469F4ZozyzPtnLqR8+uE1Km4cW4mKFKJ56QaTzEFz4/G
 frIzubJeluVinin3o+wDYqqt0LJqmSXRYm8VSoO4XWpL6tDJaY5CFhgwLPxRhoruPAAK
 TiMVFWbmlX9D7r/KB+YM7lRz7CmZ96oa9YmbrxcZeyKvuT9uVTy0gkAj2Fnb/iVYOly7
 x7eltfwJKJ4jpHSigf5wMFi9luDJ+XPN+/VJYGqTbswzqxk5xWNfX4C/XT66tZNAKq/r
 3sHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKE5iqoBmC6sWTg2I71pPZ4bDaFk7o6526FQCahEzs9HyE1W+mSXeeIbXzMPjGglmBal1ot7Gry4U/rS4NJo1lHxUkgOWPlxijAPIAR/6+hahom8u2eVMBdKkVNbFLeSrb3iLgPPFJzAhjGBecMPbI
X-Gm-Message-State: AOJu0YwPF7cLjSkLxVYJer07soi3A1SsfVGGxRpzWmhuiDPyy9PjSqee
 FoHnv8hiieS7paRgamzGsqgJkg1F9e0HNodYHMTktaxBFohZh+cUTn+kuz9M+MPk2RshGrq8L2R
 A01z8QsKIW/JjDDcF9VS/i0KkMDs=
X-Google-Smtp-Source: AGHT+IGso0BljKVwbkyC6SeXo26MO6l7CwcXrbDcUzUoj5LbNZjp5wGm2nw0rpZFSIkrodAqJM0onhBdhTyifEAKeQc=
X-Received: by 2002:a05:6402:50d3:b0:57d:4b56:da11 with SMTP id
 4fb4d7f45d1cf-5879f4a5716mr7212784a12.11.1719930712510; Tue, 02 Jul 2024
 07:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240702-msm-tiling-config-v1-0-adaa6a6e4523@gmail.com>
 <20240702-msm-tiling-config-v1-2-adaa6a6e4523@gmail.com>
In-Reply-To: <20240702-msm-tiling-config-v1-2-adaa6a6e4523@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 2 Jul 2024 07:31:40 -0700
Message-ID: <CAF6AEGsFtgvKAjvjD5K5Uhw-PSEWrvW2O7reiM2Z7p6=R5wQiQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm: Expand UBWC config setting
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Tue, Jul 2, 2024 at 5:56=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com> =
wrote:
>
> According to downstream we should be setting RBBM_NC_MODE_CNTL to a
> non-default value on a663 and a680, we don't support a663 and on a680
> we're leaving it at the wrong (suboptimal) value. Just set it on all
> GPUs. Similarly, plumb through level2_swizzling_dis which will be
> necessary on a663.
>
> ubwc_mode is expanded and renamed to ubwc_swizzle to match the name on
> the display side. Similarly macrotile_mode should match the display
> side.
>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  4 ++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 36 ++++++++++++++++++++++++---=
------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 ++-
>  3 files changed, 33 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a5xx_gpu.c
> index c003f970189b..33b0f607f913 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1788,5 +1788,9 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *de=
v)
>         else
>                 adreno_gpu->ubwc_config.highest_bank_bit =3D 14;
>
> +       /* a5xx only supports UBWC 1.0, these are not configurable */
> +       adreno_gpu->ubwc_config.macrotile_mode =3D 0;
> +       adreno_gpu->ubwc_config.ubwc_swizzle =3D 0x7;
> +
>         return gpu;
>  }
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index c98cdb1e9326..7a3564dd7941 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -499,8 +499,17 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu =
*gpu)
>         gpu->ubwc_config.uavflagprd_inv =3D 0;
>         /* Whether the minimum access length is 64 bits */
>         gpu->ubwc_config.min_acc_len =3D 0;
> -       /* Entirely magic, per-GPU-gen value */
> -       gpu->ubwc_config.ubwc_mode =3D 0;
> +       /* Whether to enable level 1, 2 & 3 bank swizzling.
> +        * UBWC 1.0 always enables all three levels.
> +        * UBWC 2.0 removes level 1 bank swizzling, leaving levels 2 & 3.
> +        * UBWC 4.0 adds the optional ability to disable levels 2 & 3.

I guess this is a bitmask for BIT(level_n)?

> +        */
> +       gpu->ubwc_config.ubwc_swizzle =3D 0x6;
> +       /* Whether to use 4-channel macrotiling mode or the newer 8-chann=
el
> +        * macrotiling mode introduced in UBWC 3.1. 0 is 4-channel and 1 =
is
> +        * 8-channel.
> +        */

Can we add these comments as kerneldoc comments in the ubwc_config
struct?  That would be a more natural place for eventually moving ubwc
config to a central systemwide table (and perhaps finally properly
dealing with the setting differences for DDR vs LPDDR)

BR,
-R

> +       gpu->ubwc_config.macrotile_mode =3D 0;
>         /*
>          * The Highest Bank Bit value represents the bit of the highest D=
DR bank.
>          * This should ideally use DRAM type detection.
> @@ -510,7 +519,7 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *=
gpu)
>         if (adreno_is_a610(gpu)) {
>                 gpu->ubwc_config.highest_bank_bit =3D 13;
>                 gpu->ubwc_config.min_acc_len =3D 1;
> -               gpu->ubwc_config.ubwc_mode =3D 1;
> +               gpu->ubwc_config.ubwc_swizzle =3D 0x7;
>         }
>
>         if (adreno_is_a618(gpu))
> @@ -536,6 +545,7 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *=
gpu)
>                 gpu->ubwc_config.amsbc =3D 1;
>                 gpu->ubwc_config.rgb565_predicator =3D 1;
>                 gpu->ubwc_config.uavflagprd_inv =3D 2;
> +               gpu->ubwc_config.macrotile_mode =3D 1;
>         }
>
>         if (adreno_is_7c3(gpu)) {
> @@ -543,12 +553,12 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu=
 *gpu)
>                 gpu->ubwc_config.amsbc =3D 1;
>                 gpu->ubwc_config.rgb565_predicator =3D 1;
>                 gpu->ubwc_config.uavflagprd_inv =3D 2;
> +               gpu->ubwc_config.macrotile_mode =3D 1;
>         }
>
>         if (adreno_is_a702(gpu)) {
>                 gpu->ubwc_config.highest_bank_bit =3D 14;
>                 gpu->ubwc_config.min_acc_len =3D 1;
> -               gpu->ubwc_config.ubwc_mode =3D 0;
>         }
>  }
>
> @@ -564,21 +574,26 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gp=
u)
>         u32 hbb =3D adreno_gpu->ubwc_config.highest_bank_bit - 13;
>         u32 hbb_hi =3D hbb >> 2;
>         u32 hbb_lo =3D hbb & 3;
> +       u32 ubwc_mode =3D adreno_gpu->ubwc_config.ubwc_swizzle & 1;
> +       u32 level2_swizzling_dis =3D !(adreno_gpu->ubwc_config.ubwc_swizz=
le & 2);
>
>         gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
> +                 level2_swizzling_dis << 12 |
>                   adreno_gpu->ubwc_config.rgb565_predicator << 11 |
>                   hbb_hi << 10 | adreno_gpu->ubwc_config.amsbc << 4 |
>                   adreno_gpu->ubwc_config.min_acc_len << 3 |
> -                 hbb_lo << 1 | adreno_gpu->ubwc_config.ubwc_mode);
> +                 hbb_lo << 1 | ubwc_mode);
>
> -       gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, hbb_hi << 4 |
> +       gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL,
> +                 level2_swizzling_dis << 6 | hbb_hi << 4 |
>                   adreno_gpu->ubwc_config.min_acc_len << 3 |
> -                 hbb_lo << 1 | adreno_gpu->ubwc_config.ubwc_mode);
> +                 hbb_lo << 1 | ubwc_mode);
>
> -       gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, hbb_hi << 10 |
> +       gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
> +                 level2_swizzling_dis << 12 | hbb_hi << 10 |
>                   adreno_gpu->ubwc_config.uavflagprd_inv << 4 |
>                   adreno_gpu->ubwc_config.min_acc_len << 3 |
> -                 hbb_lo << 1 | adreno_gpu->ubwc_config.ubwc_mode);
> +                 hbb_lo << 1 | ubwc_mode);
>
>         if (adreno_is_a7xx(adreno_gpu))
>                 gpu_write(gpu, REG_A7XX_GRAS_NC_MODE_CNTL,
> @@ -586,6 +601,9 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>
>         gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL,
>                   adreno_gpu->ubwc_config.min_acc_len << 23 | hbb_lo << 2=
1);
> +
> +       gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL,
> +                 adreno_gpu->ubwc_config.macrotile_mode);
>  }
>
>  static int a6xx_cp_init(struct msm_gpu *gpu)
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index cff8ce541d2c..b2da660c10c7 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -194,9 +194,10 @@ struct adreno_gpu {
>                 u32 rgb565_predicator;
>                 u32 uavflagprd_inv;
>                 u32 min_acc_len;
> -               u32 ubwc_mode;
> +               u32 ubwc_swizzle;
>                 u32 highest_bank_bit;
>                 u32 amsbc;
> +               u32 macrotile_mode;
>         } ubwc_config;
>
>         /*
>
> --
> 2.31.1
>
