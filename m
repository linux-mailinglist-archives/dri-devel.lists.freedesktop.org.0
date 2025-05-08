Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D594AB0357
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 21:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2D610E95E;
	Thu,  8 May 2025 19:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kT2K4eTu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899ED10E012;
 Thu,  8 May 2025 19:05:35 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-30a892f82b3so167550a91.0; 
 Thu, 08 May 2025 12:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746731135; x=1747335935; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mVloRZR4q+d4Nf07z3vdE4Ds2g+KkLZGb5NDJRX0JWM=;
 b=kT2K4eTufQqFMSkD1DtZGxIheLnptck6xZ2UiWbYBSEyY9oOD1sH0u1x7iiJwnqKFP
 6pkDHONyk5hv8lg3FvLcu8NCENaDpL1UK0iPREpmIkzFxdHO2IAptKTAPIdJ+xfJNLhH
 wRHAkX6qzMH+RpSvTzwETz6UIndjbVSB3MUCnl8hNX9lCWpUOkWgPdIrdZHqSKkhNQbE
 AqouPKCNy3L6QyaVZmZrFXQDgrJo5fhW3OIYgPJtkwwzs0f9aTWiv6O6So6h4cEUU64r
 5MrtvENmwjSip8a4grTHfoMsS7KevYjSjHnoLRpPDYOOWmXM9CGSpn9LLFoCoUPwejq1
 Hviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746731135; x=1747335935;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mVloRZR4q+d4Nf07z3vdE4Ds2g+KkLZGb5NDJRX0JWM=;
 b=hBOPssfl4KUpVJun0TgfKj1DzhUnZ99ckra2bX2O2EkMspucCGTKaRxpvIaWObrE3H
 T9YR9GO0PsCNCKQJ4tbilEVUIumxIE0HDzl+IWWgqvrHrl36EtVlg4h6w+1pXZb8y9a+
 Zd5fOMl9cZrnFAoFVnxwn05fcW+Pbv4SOdqbNqXB3iBcOcArT8LJ2o3ncUwL2YCDvMAE
 6IX3QaKyNe4EyuDx4KqS4fQhofHgp7k/ZTVPn/N9rdhZU8sJnhjfogRhY002LbYseGPd
 6NBT/yBKw0Rrz67DPy2z/JhIcpfImA18JRW9EOr5u2xtN3vMSDYK28DL++/ddqo5E/AV
 330A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6bX7FtS8kSApKkW0WuM5RJHWkUx60pnFsh2JZHgKtbJPbK3aXNnD+XMC+Ljy5caOyxn2e5CaHJUM=@lists.freedesktop.org,
 AJvYcCVD10fESE/VaFMumsNq9wlm0I1j69ElYf59p1nai/QptObFeDcC4FWug7Ja6vBFYMkETXy7yxgVIyQR@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyc57o+2fhg/X7iG6feByQuUgh9229+2T+sssQds4dq4wIrF9v/
 7OHJ3cAMXQRWoOSzZIvZ3w6jnng7WDFyPNHYRvvLLeA059fNBdH8UwhxHEjq5pVp9meKTr5SxYD
 /YR8NpgMqiyF1Uz5ByLA37JQGnyU=
X-Gm-Gg: ASbGncvtTqu4v1KY9NqSEBaEwdZ3HFxqmms6qD0UredaQ9Z8y548K+ypNhmaINNw5BF
 WSkkf9wB/bHiSHBIUzoi0ap3y3LeLBeLjm7Ap6aSlnC22jptUrE2xtidTuevyoxkpXwUjk/rvNd
 io1s1OgUoV++xXeyuac1axLw==
X-Google-Smtp-Source: AGHT+IHpN+OC2iYdrhKTStqjYyKZ1rIYx9pH7FOJpBnD2MuxinYne5QVDK3a9rLQwnVLE6gUQjHWawxKMi2T8atvwtM=
X-Received: by 2002:a17:90b:3a87:b0:306:b593:4551 with SMTP id
 98e67ed59e1d1-30c3d6558ffmr367378a91.6.1746731134924; Thu, 08 May 2025
 12:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-6-035c4c5cbe50@oss.qualcomm.com>
In-Reply-To: <20250508-topic-ubwc_central-v1-6-035c4c5cbe50@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 8 May 2025 15:05:23 -0400
X-Gm-Features: ATxdqUERPcEjxJMCCMNwgqDCibVUtJOP8nd1dhiaGM8MG_KVqvI5Lb88TfZWGbo
Message-ID: <CACu1E7G8QEoadxOGOi22QCePR5C7X81wRZ2yzLGCaA8Um63ibA@mail.gmail.com>
Subject: Re: [PATCH RFT 06/14] drm/msm/a6xx: Simplify uavflagprd_inv detection
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

On Thu, May 8, 2025 at 2:13=E2=80=AFPM Konrad Dybcio <konradybcio@kernel.or=
g> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Instead of setting it on a gpu-per-gpu basis, converge it to the
> intended "is A650 family or A7xx".

Can we also set this based on the UBWC version?

Connor

>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 5fe0e8e72930320282a856e1ff77994865360854..e1eab0906b6c460528da82a94=
a285ef181e0b479 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -593,7 +593,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *g=
pu)
>                 return -EINVAL;
>
>         gpu->ubwc_config.rgb565_predicator =3D 0;
> -       gpu->ubwc_config.uavflagprd_inv =3D 0;
>         gpu->ubwc_config.min_acc_len =3D 0;
>         gpu->ubwc_config.ubwc_swizzle =3D 0x6;
>         gpu->ubwc_config.macrotile_mode =3D 0;
> @@ -615,15 +614,12 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu =
*gpu)
>         if (adreno_is_a619_holi(gpu))
>                 gpu->ubwc_config.highest_bank_bit =3D 0;
>
> -       if (adreno_is_a621(gpu)) {
> +       if (adreno_is_a621(gpu))
>                 gpu->ubwc_config.highest_bank_bit =3D 0;
> -               gpu->ubwc_config.uavflagprd_inv =3D 2;
> -       }
>
>         if (adreno_is_a623(gpu)) {
>                 gpu->ubwc_config.highest_bank_bit =3D 3;
>                 gpu->ubwc_config.rgb565_predicator =3D 1;
> -               gpu->ubwc_config.uavflagprd_inv =3D 2;
>                 gpu->ubwc_config.macrotile_mode =3D 1;
>         }
>
> @@ -638,21 +634,18 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu =
*gpu)
>                 /* TODO: get ddr type from bootloader and use 2 for LPDDR=
4 */
>                 gpu->ubwc_config.highest_bank_bit =3D 3;
>                 gpu->ubwc_config.rgb565_predicator =3D 1;
> -               gpu->ubwc_config.uavflagprd_inv =3D 2;
>                 gpu->ubwc_config.macrotile_mode =3D 1;
>         }
>
>         if (adreno_is_a663(gpu)) {
>                 gpu->ubwc_config.highest_bank_bit =3D 0;
>                 gpu->ubwc_config.rgb565_predicator =3D 1;
> -               gpu->ubwc_config.uavflagprd_inv =3D 2;
>                 gpu->ubwc_config.macrotile_mode =3D 1;
>                 gpu->ubwc_config.ubwc_swizzle =3D 0x4;
>         }
>
>         if (adreno_is_7c3(gpu)) {
>                 gpu->ubwc_config.highest_bank_bit =3D 1;
> -               gpu->ubwc_config.uavflagprd_inv =3D 2;
>                 gpu->ubwc_config.macrotile_mode =3D 1;
>         }
>
> @@ -667,6 +660,7 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *g=
pu)
>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> +       u8 uavflagprd_inv =3D adreno_is_a650_family(adreno_gpu) || adreno=
_is_a7xx(adreno_gpu) ? 2 : 0;
>         const struct qcom_ubwc_cfg_data *cfg =3D adreno_gpu->common_ubwc_=
cfg;
>         u32 hbb =3D adreno_gpu->ubwc_config.highest_bank_bit;
>         bool amsbc =3D cfg->ubwc_enc_version >=3D UBWC_3_0;
> @@ -689,7 +683,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>
>         gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
>                   level2_swizzling_dis << 12 | hbb_hi << 10 |
> -                 adreno_gpu->ubwc_config.uavflagprd_inv << 4 |
> +                 uavflagprd_inv << 4 |
>                   adreno_gpu->ubwc_config.min_acc_len << 3 |
>                   hbb_lo << 1 | ubwc_mode);
>
>
> --
> 2.49.0
>
