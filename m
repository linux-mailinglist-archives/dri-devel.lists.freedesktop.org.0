Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E94FD962AFE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0618210E560;
	Wed, 28 Aug 2024 15:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Py/sfnT1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBB910E562;
 Wed, 28 Aug 2024 15:02:10 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2d3ec4bacc5so553430a91.1; 
 Wed, 28 Aug 2024 08:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724857330; x=1725462130; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2T684eJY5uaT2GoNJQao8Ux/8bEW4DFpDBArVLTN0ng=;
 b=Py/sfnT1+amGj6tf70It4RmrmHG8EpbDfxfXsMXuTaE7XsWHQvpI/BIFswMPqYJXG7
 H4Strtm3msTsh7t5c16+BTGDPbhHACWA+xf/iGfBo2Nr8E6VZiO0JjKSIrMWpTnA13gD
 bRHFVaxZDLiIWZSsMJkHKfPtr4rCiSk3hU65X1loY8xhC8W+zg3NTUHibEYox279Ctuo
 Lp89iSuMaEi1Npr4kQ95G5Yvy3QXmV39OX3u8TDVeQhn7POzLkTpz+Y7aglkOk0BHlIV
 0+RccZiXvVmmxshEfDdQQ7xHyWagyPUCmyMKnK2DStsfbwEJ1sGOkR2x/viyD6mVSEVg
 Md7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724857330; x=1725462130;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2T684eJY5uaT2GoNJQao8Ux/8bEW4DFpDBArVLTN0ng=;
 b=lfgK3bpdAiSVM9Jcl/2evtyvHXDjijG53/hpzNpKVHSOCDOPjStyTDF4hwjE4Xsxgc
 mE9l1W791sdCzlkbSUzbetQK/pO3ftEdmL/f+i7Ck/GSjIO8GqbgLH9t35YmyLwfQexX
 5bDNyqREFc7Cw0I/oYdqgkpbFQElZ74hUpB+XJoIDkUahRshbrL33PKkfmmL3kZoe3ti
 QRBp2cs6alcbWTUyyft62cfu/mP6XuHx6YhuQi/fhvZY13r46ucv5jL0Ds0B/2+1w1ER
 O4tZArQb4qrp+0Zy8O7gxLlPPrt3iPSzk69UJj7Nvooulo/NDbNq98cLaR5HKzi1CAz/
 cyGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlTgI+CH3e/qCuVp/fheJf+pCBILp7AbVWHjhmQKeka8eZcEVY3Oc3mgKlXOYEst86TUmMYtLrwmM=@lists.freedesktop.org,
 AJvYcCVOGDknRwOY0KDRdGM5RFAoc+4HMDLuSCD5Q0yxtD6ALMRlkrtwqfsyNw9+x8RbAYnRLSXxheaB+pdH@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnT2WYt6hksWXXd6OkIKkaGO3hvrivbSApKOqfr5A4SN5xFmCl
 QGTgI0vACh++9K5kc7DyCJF6LBKewcKep8tkfiIRBydNYEk0dpuASUk+xqy5ZtcOIJcSCjTK6kG
 TQ1pRyVk498gmKfa1ANlEkKHHGks=
X-Google-Smtp-Source: AGHT+IF7bNTPR1qyKoYtr4W+dmqFvYBuHOT06w+IqX5vqDvi6m7zgZ+Ib4Beyv/qmB8HmkrdfHIOYz2dLy3spp+c14A=
X-Received: by 2002:a17:90a:644c:b0:2c9:90fa:b9f8 with SMTP id
 98e67ed59e1d1-2d843d6f66dmr3633644a91.10.1724857329540; Wed, 28 Aug 2024
 08:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240722-a306a-v3-1-cff90857c615@gmail.com>
In-Reply-To: <20240722-a306a-v3-1-cff90857c615@gmail.com>
From: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Date: Wed, 28 Aug 2024 17:01:58 +0200
Message-ID: <CAGsSOWUO=+LE6Xat61yoE9u9TTAdpAEXo9ECvkAw9Cbyw_AZ8A@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/adreno: Add A306A support
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
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

I hope it was not forgotten or am I missing something?

On Mon, Jul 22, 2024 at 4:58=E2=80=AFPM Barnab=C3=A1s Cz=C3=A9m=C3=A1n <tra=
barni@gmail.com> wrote:
>
> From: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
>
> Add support for Adreno 306A GPU what is found in MSM8917 SoC.
> This GPU marketing name is Adreno 308.
>
> Signed-off-by: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
> [use internal name of the GPU, reword the commit message]
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail.com>
> ---
> Changes in v3:
> - Fix issues addressed by reviews.
> - Rebase on latest next.
> - Link to v2: https://lore.kernel.org/r/20240620-a306a-v2-1-0d388e1deebf@=
gmail.com
>
> Changes in v2:
> - Rebase on https://patchwork.freedesktop.org/series/127393/
> - Link to v1: https://lore.kernel.org/r/20240528-a306a-v1-1-03a66dacd8c7@=
gmail.com
> ---
>  drivers/gpu/drm/msm/adreno/a3xx_catalog.c | 11 +++++++++++
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c     | 14 +++++++++++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  6 ++++++
>  3 files changed, 28 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c b/drivers/gpu/drm/=
msm/adreno/a3xx_catalog.c
> index 0de8465b6cf0..2eb6c3e93748 100644
> --- a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
> @@ -41,6 +41,17 @@ static const struct adreno_info a3xx_gpus[] =3D {
>                 .gmem  =3D SZ_128K,
>                 .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
>                 .init  =3D a3xx_gpu_init,
> +       }, {
> +               .chip_ids =3D ADRENO_CHIP_IDS(0x03000620),
> +               .family =3D ADRENO_3XX,
> +               .revn =3D 308,
> +               .fw =3D {
> +                       [ADRENO_FW_PM4] =3D "a300_pm4.fw",
> +                       [ADRENO_FW_PFP] =3D "a300_pfp.fw",
> +               },
> +               .gmem =3D SZ_128K,
> +               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> +               .init =3D a3xx_gpu_init,
>         }, {
>                 .chip_ids =3D ADRENO_CHIP_IDS(
>                         0x03020000,
> diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a3xx_gpu.c
> index 5273dc849838..b46ff49f47cf 100644
> --- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> @@ -145,6 +145,10 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
>                 gpu_write(gpu, REG_A3XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x0003)=
;
>                 gpu_write(gpu, REG_A3XX_VBIF_OUT_RD_LIM_CONF0, 0x0000000a=
);
>                 gpu_write(gpu, REG_A3XX_VBIF_OUT_WR_LIM_CONF0, 0x0000000a=
);
> +       } else if (adreno_is_a306a(adreno_gpu)) {
> +               gpu_write(gpu, REG_A3XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x0003)=
;
> +               gpu_write(gpu, REG_A3XX_VBIF_OUT_RD_LIM_CONF0, 0x00000010=
);
> +               gpu_write(gpu, REG_A3XX_VBIF_OUT_WR_LIM_CONF0, 0x00000010=
);
>         } else if (adreno_is_a320(adreno_gpu)) {
>                 /* Set up 16 deep read/write request queues: */
>                 gpu_write(gpu, REG_A3XX_VBIF_IN_RD_LIM_CONF0, 0x10101010)=
;
> @@ -237,7 +241,9 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
>         gpu_write(gpu, REG_A3XX_UCHE_CACHE_MODE_CONTROL_REG, 0x00000001);
>
>         /* Enable Clock gating: */
> -       if (adreno_is_a305b(adreno_gpu) || adreno_is_a306(adreno_gpu))
> +       if (adreno_is_a305b(adreno_gpu) ||
> +           adreno_is_a306(adreno_gpu) ||
> +           adreno_is_a306a(adreno_gpu))
>                 gpu_write(gpu, REG_A3XX_RBBM_CLOCK_CTL, 0xaaaaaaaa);
>         else if (adreno_is_a320(adreno_gpu))
>                 gpu_write(gpu, REG_A3XX_RBBM_CLOCK_CTL, 0xbfffffff);
> @@ -334,8 +340,10 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
>                 gpu_write(gpu, REG_A3XX_CP_PFP_UCODE_DATA, ptr[i]);
>
>         /* CP ROQ queue sizes (bytes) - RB:16, ST:16, IB1:32, IB2:64 */
> -       if (adreno_is_a305(adreno_gpu) || adreno_is_a306(adreno_gpu) ||
> -                       adreno_is_a320(adreno_gpu)) {
> +       if (adreno_is_a305(adreno_gpu) ||
> +           adreno_is_a306(adreno_gpu) ||
> +           adreno_is_a306a(adreno_gpu) ||
> +           adreno_is_a320(adreno_gpu)) {
>                 gpu_write(gpu, REG_AXXX_CP_QUEUE_THRESHOLDS,
>                                 AXXX_CP_QUEUE_THRESHOLDS_CSQ_IB1_START(2)=
 |
>                                 AXXX_CP_QUEUE_THRESHOLDS_CSQ_IB2_START(6)=
 |
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index 1ab523a163a0..c3b7970c2bfa 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -294,6 +294,12 @@ static inline bool adreno_is_a306(const struct adren=
o_gpu *gpu)
>         return adreno_is_revn(gpu, 307);
>  }
>
> +static inline bool adreno_is_a306a(const struct adreno_gpu *gpu)
> +{
> +       /* a306a (marketing name is a308) */
> +       return adreno_is_revn(gpu, 308);
> +}
> +
>  static inline bool adreno_is_a320(const struct adreno_gpu *gpu)
>  {
>         return adreno_is_revn(gpu, 320);
>
> ---
> base-commit: dee7f101b64219f512bb2f842227bd04c14efe30
> change-id: 20240528-a306a-48e173724d6c
>
> Best regards,
> --
> Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail.com>
>
