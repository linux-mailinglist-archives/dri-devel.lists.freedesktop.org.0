Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15589AB0379
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 21:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5953610E012;
	Thu,  8 May 2025 19:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L9YoCfWz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAF710E012;
 Thu,  8 May 2025 19:16:33 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-308218fed40so124773a91.0; 
 Thu, 08 May 2025 12:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746731789; x=1747336589; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=84mPmcLjjmYTudDd8CpbhvwzXUd0/qgapgzE5Qn/8Po=;
 b=L9YoCfWzUvgZaQEiELmu5jyd4xJuTl4g9WZR7SN7Ft/RfRHdgOJRBpPDwJ8GHsWg8B
 +gIkn+MUpYetZ1swxp3CpFZz8b+oGb3fjmvRlj+n2WOWBWaAW25Joqv4khsIIgKMXqKl
 CUFldvZRMxd8tAD0xSWIDF40FDUik2pBDQeRlGiNQciWSkh1EowFPjN2eFbqTyNXgt0R
 cCQbvkrs2SJ1yGaDQWSKeTxtfmoR0+v/YYpHmzKBdurNQ3ds3Fm625LIZHNxoiX9Twx2
 DqSQxu6+dfiVf//xwqazpxHeyTJBjpvadIWCu7Nbmd1jKnuMNSC4qB4wiv0QOD0vo6Us
 tq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746731789; x=1747336589;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=84mPmcLjjmYTudDd8CpbhvwzXUd0/qgapgzE5Qn/8Po=;
 b=AvoFozxp4jOp024fRrILVxZ1zfubxcxbTjs9yjd6p+SofJTweXCo/0aKRVzytJQgDe
 KVmpnCvJ1+Xt+kHpbkeYsIIN1aZHKjy5+B+L/+m5RymuijUwHcdB//vaCIFDoAfGrO25
 ZtN2oxDzMb7W9R9e3WDKEjizaCQs/UodjDdmo4bdoNzTGMcKdiDOhsLg+3LW9JPUGqFN
 XeK+1OYsq9Xa8rfVIRmC/4TNarX7yH5Lqv6H0gaboNCoYLzYGhK9srVIUNjvTMfrPrT1
 epMD1HrM8Hmxn4fMsyTTn0qcEQjZutbuKGuzU8/MzURIF7YqhbhVxO7eRLjTJpCih86B
 sKbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcuK+B97DSak6YT6441GNVb0jCEazD3OlNms8PobmOrG/66g74i/4ld1hV+MLTF2pATmaLD4uSVgUr@lists.freedesktop.org,
 AJvYcCXx/oeFQFPUMcE/dolv68cg2ZuHi3JiJlCvuSx8p3qHfI22tsPua1sAwuyo0sMhrdVo1mMYfwo/Ogc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYvuCQGNIBmYaK1Cnb+abwCgX+Z6t1Ni03u57zgRyN57mFXwDJ
 k9RVQrcqe8iEOUKxEqBIOFShNEayvkaa8EzWk90sI2jyN04LdrBP/K9ybAQBjczw8epBch7J6Kd
 WKw5E4E5iIfajDRWgz572ufpORO4=
X-Gm-Gg: ASbGnctuVb+sGRZMPZXzttpR411qMF2UETAMSdpeEeTAh0vmLj5fzf0FqOu7m8WD4UK
 94XLaG0AxKmslTxlRFGZKxPZmlLFDYsXSH9ng9btphLvdWMt8z9rfrlCuf9TfB/0Zt03dqiiJtw
 jFO5GTRyiZO15P4Zs2R8Jh2A==
X-Google-Smtp-Source: AGHT+IFnJI/dGTw42zeAnFybyVqbxMj3ucJwVN3oeKoPAG/l010GL4Y+78qpZJpzYGlUpVf8RbqJGDcVWc6cKAm0TLY=
X-Received: by 2002:a17:90b:1b4a:b0:305:5f31:6c63 with SMTP id
 98e67ed59e1d1-30c3d65e755mr383705a91.6.1746731789590; Thu, 08 May 2025
 12:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-5-035c4c5cbe50@oss.qualcomm.com>
In-Reply-To: <20250508-topic-ubwc_central-v1-5-035c4c5cbe50@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 8 May 2025 15:16:18 -0400
X-Gm-Features: ATxdqUGiqWT_DWApTY9ymoO6UH-6KDlDJuxswDFXWcGSKrN_vB9pf1QCaLL_Oto
Message-ID: <CACu1E7GrdS3m0fLcnOW+v-nkzRveXrzVw9PzSb01duYx1aifSQ@mail.gmail.com>
Subject: Re: [PATCH RFT 05/14] drm/msm/a6xx: Resolve the meaning of AMSBC
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
> The bit must be set to 1 if the UBWC encoder version is >=3D 3.0, drop it
> as a separate field.

For these sorts of things, it's probably best to add a helper to the
common ubwc config header. Other blocks also have bits for enabling
AMSBC and similar things that also need to be set based on the UBWC
version.

Connor

>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 89eb725f0950f3679d6214366cfbd22d5bcf4bc7..5fe0e8e72930320282a856e1f=
f77994865360854 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -617,21 +617,16 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu =
*gpu)
>
>         if (adreno_is_a621(gpu)) {
>                 gpu->ubwc_config.highest_bank_bit =3D 0;
> -               gpu->ubwc_config.amsbc =3D 1;
>                 gpu->ubwc_config.uavflagprd_inv =3D 2;
>         }
>
>         if (adreno_is_a623(gpu)) {
>                 gpu->ubwc_config.highest_bank_bit =3D 3;
> -               gpu->ubwc_config.amsbc =3D 1;
>                 gpu->ubwc_config.rgb565_predicator =3D 1;
>                 gpu->ubwc_config.uavflagprd_inv =3D 2;
>                 gpu->ubwc_config.macrotile_mode =3D 1;
>         }
>
> -       if (adreno_is_a640_family(gpu))
> -               gpu->ubwc_config.amsbc =3D 1;
> -
>         if (adreno_is_a680(gpu))
>                 gpu->ubwc_config.macrotile_mode =3D 1;
>
> @@ -642,7 +637,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *g=
pu)
>             adreno_is_a740_family(gpu)) {
>                 /* TODO: get ddr type from bootloader and use 2 for LPDDR=
4 */
>                 gpu->ubwc_config.highest_bank_bit =3D 3;
> -               gpu->ubwc_config.amsbc =3D 1;
>                 gpu->ubwc_config.rgb565_predicator =3D 1;
>                 gpu->ubwc_config.uavflagprd_inv =3D 2;
>                 gpu->ubwc_config.macrotile_mode =3D 1;
> @@ -650,7 +644,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *g=
pu)
>
>         if (adreno_is_a663(gpu)) {
>                 gpu->ubwc_config.highest_bank_bit =3D 0;
> -               gpu->ubwc_config.amsbc =3D 1;
>                 gpu->ubwc_config.rgb565_predicator =3D 1;
>                 gpu->ubwc_config.uavflagprd_inv =3D 2;
>                 gpu->ubwc_config.macrotile_mode =3D 1;
> @@ -659,7 +652,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *g=
pu)
>
>         if (adreno_is_7c3(gpu)) {
>                 gpu->ubwc_config.highest_bank_bit =3D 1;
> -               gpu->ubwc_config.amsbc =3D 1;
>                 gpu->ubwc_config.uavflagprd_inv =3D 2;
>                 gpu->ubwc_config.macrotile_mode =3D 1;
>         }
> @@ -675,7 +667,9 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *g=
pu)
>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> +       const struct qcom_ubwc_cfg_data *cfg =3D adreno_gpu->common_ubwc_=
cfg;
>         u32 hbb =3D adreno_gpu->ubwc_config.highest_bank_bit;
> +       bool amsbc =3D cfg->ubwc_enc_version >=3D UBWC_3_0;
>         u32 hbb_hi =3D hbb >> 2;
>         u32 hbb_lo =3D hbb & 3;
>         u32 ubwc_mode =3D adreno_gpu->ubwc_config.ubwc_swizzle & 1;
> @@ -684,7 +678,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>         gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
>                   level2_swizzling_dis << 12 |
>                   adreno_gpu->ubwc_config.rgb565_predicator << 11 |
> -                 hbb_hi << 10 | adreno_gpu->ubwc_config.amsbc << 4 |
> +                 hbb_hi << 10 | amsbc << 4 |
>                   adreno_gpu->ubwc_config.min_acc_len << 3 |
>                   hbb_lo << 1 | ubwc_mode);
>
>
> --
> 2.49.0
>
